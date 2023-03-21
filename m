Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B656C2D80
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 10:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pglzz41vmz3byj
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 20:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ToMNvqc8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ToMNvqc8;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PglzM1MqFz307t
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 20:04:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679389471; x=1710925471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K/UpgIYLTihwD15Oud7TyDW4zGjAMXrk2MOqKYKZ9Vg=;
  b=ToMNvqc8XJLzmjJlpMP2H+BfyMgv7H3v+uw3mc8ydq8h/IMOTIP7iB0G
   WzUiA+XD6NwdjwTEkddYcXfDC2C168SBqtd4iFopFiytX4xkZkuOBLfSw
   qPfLmR68L6JIeXkvH7PYifzI5P87l/SbZqTXP5DfUoxCUxDSCDNi/glsD
   W2IAbhrHk4WT3CQXDQKxRCRtTzzTVlQ0VnjssQkWD3NzNNYal46vMOejw
   VGMtwldgEDg65TXogjl4iRkFMQVLQ86EprqpwYeLZywM42sl8cf8Pu5N2
   Kjr8y9KLpD/yYG9VaCqGEvcaHF6ju80g0rULFKPy9JpI0EfvAZHp7M9bC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336392749"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="336392749"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 02:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683787841"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="683787841"
Received: from mhahn1-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.37.31])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 02:04:21 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Paul Fertser <fercerpav@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Date: Tue, 21 Mar 2023 10:04:10 +0100
Message-Id: <20230321090410.866766-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For Skylake, DTS temperature of the CPU is reported in S10.6 format
instead of S8.8.

Reported-by: Paul Fertser <fercerpav@gmail.com>
Link: https://lore.kernel.org/lkml/ZBhHS7v+98NK56is@home.paul.comp/
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/hwmon/peci/cputemp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 30850a479f61..87d56f0fc888 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -537,6 +537,12 @@ static const struct cpu_info cpu_hsx = {
 	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
 };
 
+static const struct cpu_info cpu_skx = {
+	.reg		= &resolved_cores_reg_hsx,
+	.min_peci_revision = 0x33,
+	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
+};
+
 static const struct cpu_info cpu_icx = {
 	.reg		= &resolved_cores_reg_icx,
 	.min_peci_revision = 0x40,
@@ -558,7 +564,7 @@ static const struct auxiliary_device_id peci_cputemp_ids[] = {
 	},
 	{
 		.name = "peci_cpu.cputemp.skx",
-		.driver_data = (kernel_ulong_t)&cpu_hsx,
+		.driver_data = (kernel_ulong_t)&cpu_skx,
 	},
 	{
 		.name = "peci_cpu.cputemp.icx",
-- 
2.39.0

