Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D09F9A34E82
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 20:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv51x3BZwz3cVc
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 06:33:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739475187;
	cv=none; b=bQNTo4UfHC0t84JZitMP92YOr1MOE+EN+Ny1Yzf/YJiPkcoEObDzsYM1xLWjaE5qWy/LL+hqFa0skAtzqd5wu8Ex2sAS9mJMLQGTn7m6cYgFvSigrJwGxiJphKDW6hKAGZj6eg4pgP4F4YsMgdFjkHl4i3e6+WrQrEUnHLJmSPiq3f+DBEQhKVGN3QXH7XyWnmFuP+wIA12YIHUGPLGejBIwQN9wAsT0AmDZDMDqrxeOM7MEFyIbfpMv7gCRLKl7b+DdNO0Co6jouYQ2oL/vmuW4M495f+LSSWR0GfbhlVQQfF8qH077h1Cep2M+01PpH40EKmL/wvGKkTbNaa4Fyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739475187; c=relaxed/relaxed;
	bh=A/sI7wZhr2bQ8gXmYipV8Oec4YgZ/Mzd1qYwyRCPHT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BON9ZSTzA33K0ziveQt+0MAkJ3bcOt6zl0P2f+o/2ZBaccEbzz6wQmBMdBR2VpswfKO7AsKVcTWrSSKSFumPs/XIGCPnB5HRgT4b73eItci/4lRvPso6m2StewCM/+4+IJoe2Nd9pTx+2T7tmZmApYuxK0G1P5DfB4Yd8LtsLXN0YTwbb/quATHTqXxG5HGnORydALGZ4hdJJWRMGpYaI+xpHXzd8ufavltbWDJPtoQyRfo2wwomCyHlJuX9Vc6NMu0OvqQYAFlUE3FOK6BK2dP7tlwPsv5RIy1+w+5U2fXzVSWENMWb1Mwm7mLxzghWCDblQLAqJCVIdgCILOanZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gps/7zpH; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gps/7zpH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 14 Feb 2025 06:33:04 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv51r2ffZz2yGs
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 06:33:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739475185; x=1771011185;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3isR7VFoqzfVxZrvhDXXIeUYz1Uzy8aLfsgglxXjle0=;
  b=Gps/7zpHNZ4xVe+CcnRFR9XE1abImWMRGIWCMoyHrIeHQafeFTnARDMu
   u4jIWcahQDaNoeRVqxb4cGLrHSzSAMNDC0pZbCE2ahi3xhEV75Kur+asx
   HdbcmDTn5GmwbxbbJSpPppRCfpFpDcIGQhH1ioWneyUvn1YSzjBQhctm3
   0AfELYpCiSe66CCwT1MSng9knzT/EhNKPDE2YFZh/cPzuc6VXbr6Nc/Cz
   p3rK4WyTx6TfVyTO7OHArYZuPz6hbHxSLqFrRucdueH7TKcTPlBuNagLc
   /s92u3zakxp1Udc2L/Df4Vp/8VHTQS2fjLEgyqU4fmAlDNqW9xfTGMV/P
   Q==;
X-CSE-ConnectionGUID: xEKI09dZSECWkxoADk9y8g==
X-CSE-MsgGUID: wUG9jm6RR4uSG7Hrh/SbUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39386876"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39386876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:31:56 -0800
X-CSE-ConnectionGUID: ilCaPk/2Qx+K/0Rtci5tTQ==
X-CSE-MsgGUID: ltjIHdYaRPem+FF+Ox2RJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136472326"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2025 11:31:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6A1B91FD; Thu, 13 Feb 2025 21:31:53 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node() helper
Date: Thu, 13 Feb 2025 21:31:52 +0200
Message-ID: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Switch the code to use for_each_gpiochip_node() helper.

While at it, correct header inclusion as device property APIs
are provided in property.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index cdad4ef11a2f..2f97accef837 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -10,7 +10,6 @@
 //   block, shared between all GPIO banks
 
 #include <linux/device.h>
-#include <linux/fwnode.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -18,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include <linux/pinctrl/pinconf.h>
@@ -1033,7 +1033,7 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		return dev_err_probe(dev, PTR_ERR(pctrl->gpio_base),
 				     "Resource fail for GPIO controller\n");
 
-	device_for_each_child_node(dev, child)  {
+	for_each_gpiochip_node(dev, child) {
 		void __iomem *dat = NULL;
 		void __iomem *set = NULL;
 		void __iomem *dirout = NULL;
@@ -1044,9 +1044,6 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		u32 reg;
 		int i;
 
-		if (!fwnode_property_read_bool(child, "gpio-controller"))
-			continue;
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret < 0)
 			return ret;
-- 
2.45.1.3035.g276e886db78b

