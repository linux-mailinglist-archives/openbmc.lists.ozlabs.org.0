Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009DC8A7655
	for <lists+openbmc@lfdr.de>; Tue, 16 Apr 2024 23:24:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cPlGXVsH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJxqj5WPHz3vX7
	for <lists+openbmc@lfdr.de>; Wed, 17 Apr 2024 07:24:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cPlGXVsH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=tony.luck@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 17 Apr 2024 07:23:32 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJxq82bmLz3cG3
	for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2024 07:23:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713302613; x=1744838613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2gPGaDcRT5gcL/MB7CRiRDvqupdeUr0UkHk3k5ZMu6g=;
  b=cPlGXVsHb8AypX286QGZO9ftzkjlBT4a+8y81e9RlWyxjArhek2X7Osb
   dzW4FsaSOW3oREvKznkW3ffwdUwVoZf8vClQrMzNoI7FowpD2ahsMg9tb
   Mmsf6u6sU+SkGNxVUfpNc97byvFtvMkYcYPk9pqR3AJ3OnCQ37MwTMkyA
   6/wyCffS/OFEyC29XaQc4fU42uRKAKK1UjigJz84n7J9+WsF0qkuOFBw1
   NvB1q8a/PjhzmkdMPzdpfsmgeSLv6ws7yvo72mCD3ajDNM0jb/KBz9afA
   hI2XOL7vLPb8EuiEdIyoON3GAQO9xWSWXNF6YZd7RVBNAkPGd95Lq7smu
   w==;
X-CSE-ConnectionGUID: +9gebRWCRd+YX+gfRtHPCA==
X-CSE-MsgGUID: UjGsY+7oQxuJ7mQK7PLyew==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26234926"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="26234926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 14:22:23 -0700
X-CSE-ConnectionGUID: Pi2uSVG5SZCFXfiEfYLbUQ==
X-CSE-MsgGUID: HaRXpSXaQd+o5xzaVUPZtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22267095"
Received: from agluck-desk3.sc.intel.com ([172.25.222.105])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 14:22:22 -0700
From: Tony Luck <tony.luck@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 53/74] x86/cpu/vfm: Update drivers/peci/cpu.c
Date: Tue, 16 Apr 2024 14:22:21 -0700
Message-ID: <20240416212221.9662-1-tony.luck@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416211941.9369-1-tony.luck@intel.com>
References: <20240416211941.9369-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, Tony Luck <tony.luck@intel.com>, patches@lists.linux.dev, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

New CPU #defines encode vendor and family as well as model.

Signed-off-by: Tony Luck <tony.luck@intel.com>
---
 include/linux/peci-cpu.h |  1 +
 drivers/peci/cpu.c       | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/linux/peci-cpu.h b/include/linux/peci-cpu.h
index ff8ae9c26c80..2c972b728524 100644
--- a/include/linux/peci-cpu.h
+++ b/include/linux/peci-cpu.h
@@ -6,6 +6,7 @@
 
 #include <linux/types.h>
 
+#include "../../arch/x86/include/asm/cpu_device_id.h"
 #include "../../arch/x86/include/asm/intel-family.h"
 
 #define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index bd990acd92b8..8e8292c05551 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -294,38 +294,38 @@ peci_cpu_probe(struct peci_device *device, const struct peci_device_id *id)
 
 static const struct peci_device_id peci_cpu_device_ids[] = {
 	{ /* Haswell Xeon */
-		.family	= 6,
-		.model	= INTEL_FAM6_HASWELL_X,
+		.family	= VFM_FAMILY(INTEL_HASWELL_X),
+		.model	= VFM_MODEL(INTEL_HASWELL_X),
 		.data	= "hsx",
 	},
 	{ /* Broadwell Xeon */
-		.family	= 6,
-		.model	= INTEL_FAM6_BROADWELL_X,
+		.family	= VFM_FAMILY(INTEL_BROADWELL_X),
+		.model	= VFM_MODEL(INTEL_BROADWELL_X),
 		.data	= "bdx",
 	},
 	{ /* Broadwell Xeon D */
-		.family	= 6,
-		.model	= INTEL_FAM6_BROADWELL_D,
+		.family	= VFM_FAMILY(INTEL_BROADWELL_D),
+		.model	= VFM_MODEL(INTEL_BROADWELL_D),
 		.data	= "bdxd",
 	},
 	{ /* Skylake Xeon */
-		.family	= 6,
-		.model	= INTEL_FAM6_SKYLAKE_X,
+		.family	= VFM_FAMILY(INTEL_SKYLAKE_X),
+		.model	= VFM_MODEL(INTEL_SKYLAKE_X),
 		.data	= "skx",
 	},
 	{ /* Icelake Xeon */
-		.family	= 6,
-		.model	= INTEL_FAM6_ICELAKE_X,
+		.family	= VFM_FAMILY(INTEL_ICELAKE_X),
+		.model	= VFM_MODEL(INTEL_ICELAKE_X),
 		.data	= "icx",
 	},
 	{ /* Icelake Xeon D */
-		.family	= 6,
-		.model	= INTEL_FAM6_ICELAKE_D,
+		.family	= VFM_FAMILY(INTEL_ICELAKE_D),
+		.model	= VFM_MODEL(INTEL_ICELAKE_D),
 		.data	= "icxd",
 	},
 	{ /* Sapphire Rapids Xeon */
-		.family	= 6,
-		.model	= INTEL_FAM6_SAPPHIRERAPIDS_X,
+		.family	= VFM_FAMILY(INTEL_SAPPHIRERAPIDS_X),
+		.model	= VFM_MODEL(INTEL_SAPPHIRERAPIDS_X),
 		.data	= "spr",
 	},
 	{ }
-- 
2.44.0

