Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A45E546AE2
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKRmq3ySpz3bxt
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 02:51:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fq1D6qIv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fq1D6qIv;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKRlm0gg6z3bnT
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 02:50:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654879812; x=1686415812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoQbox9LXcyX3/Opr6a2M/n8V2iom3/0Vp+el7IRj5A=;
  b=fq1D6qIval4mdMYrAm87fvnolkVThkHCsANWYYQg2LLejOtCOn6I5yJ4
   huqATeqLJmloRjW2lvy29VQcX5NTDqyMKIcjK83YmL9FgcEx8xIa/a+SZ
   6QN7JqvR1hE6gdfvzaUmcQ7vCaiTZx4Z2GJVqdfgafPXKuG6WvDu3B0jC
   qF5Bnm5hr5IE7hraw8/XTn3j1aFcjPAR1tkzxuRmxjUfTXoqKuedMMAaZ
   mV67MEkfOta4BYzMxALBaOwjKA4krY4et1kunWbIQhW2CnUj4ayzdrIIl
   sqcml3d6rZElClfN6kI02IO9tzWF6xFImG+6gRpoGOBmW40QNeQSVSNe4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341739917"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341739917"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:49:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="760587693"
Received: from unknown (HELO jiaqingz-server.sh.intel.com) ([10.239.48.171])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 09:49:50 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/6] net/ncsi: Fix value of NCSI_CAP_VLAN_ANY
Date: Sat, 11 Jun 2022 00:48:03 +0800
Message-Id: <20220610164808.2323340-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610164808.2323340-1-jiaqing.zhao@linux.intel.com>
References: <20220610164808.2323340-1-jiaqing.zhao@linux.intel.com>
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

According to the NCSI specification (DSP0222) [1], the value of allow
Any VLAN + non-VLAN mode in Enable VLAN command should be 0x03.

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 net/ncsi/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h
index 03757e76bb6b..bc4a00e41695 100644
--- a/net/ncsi/internal.h
+++ b/net/ncsi/internal.h
@@ -47,7 +47,7 @@ enum {
 	NCSI_CAP_AEN_MASK                = 0x07,
 	NCSI_CAP_VLAN_ONLY               = 0x01, /* Filter VLAN packet only  */
 	NCSI_CAP_VLAN_NO                 = 0x02, /* Filter VLAN and non-VLAN */
-	NCSI_CAP_VLAN_ANY                = 0x04, /* Filter Any-and-non-VLAN  */
+	NCSI_CAP_VLAN_ANY                = 0x03, /* Filter Any-and-non-VLAN  */
 	NCSI_CAP_VLAN_MASK               = 0x07
 };
 
-- 
2.34.1

