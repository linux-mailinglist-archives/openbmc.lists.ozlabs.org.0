Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BCA3DF45
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 16:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzHmB2Mp0z3cVH
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 02:50:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740066647;
	cv=none; b=S7qUYk1TzEzyD5MxNkt9Rk3mELw97S0Ac4iVgqwo7FEUSYmtE3TLhGt4/O90UBEH4jl2hH61xThvkccVkuSp4xrseQ1ZOo8M2xytNuXMo9ZIQa54ho5UkWllG66tIibrzNPvAQDtX9U7QPlAsVgFMklcFnwSbUq2O47SLKsdOcIxnix57f8qP7s1hBQ0Qd0Fzl48Ug4aB6tdlArGjCh5pRaTW38on1P3+1Gh5wxHGSD3kuvF13weEPaD0Y+Dj2Ts73CkRlUKuzzfzk1a4b6RYOy5Os5f88yHkHxq0XYMgeUFuYVaFtphVih/fEiJnFl9RDYTX7sXhJxszM++9V8/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740066647; c=relaxed/relaxed;
	bh=P5wX0ekbRGVUURKYhqnLB5dp1SglRKRUKFFhjTqpOCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XGPot/RqrpzOBaLZyYvpyRfXjmPqjxFTbc7vuxWIRRdHASRNoZXdq0uiKaiHX7KI28pnNeUwW0NJqKi0O02fsFwF30shtN9RbN3S9h1VzsrVR4oIv2NpXsH++XZfq9gzUVbMsiZu9h6obIafoEAsPz+QHR654whYIyRFSnQThq+ZDgYEQtS/kOaYgpDsmGMIg/rspJX1sTcGISLNmvz/DbeFeg6OTo5gcyRpIkhAjHMUp3lxi0FNTIKlOs3UBcxzIuN8gCE5y5Ulcopnf16Opqt1Wy6IQCnhNOgYFkyZ2bBLn3opE7PbilwqKXMVdsSPDM7biF99ZCWBMIzV6haGAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e4Zl2jtn; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e4Zl2jtn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzHm54YkWz3028
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 02:50:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066646; x=1771602646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vzatA26r+R++ycxiPiSLdTkUwvefNCuHV3tAWddTjKA=;
  b=e4Zl2jtn2jkqXCsYCGSZGBAmgPT4ecUxZkadDlyF+MflIVOhBXzntQEF
   FTRmiLpdQVO1esXpZMhNs+SYe+sY0ZEZ+hVHdUHsb8fjafcYF3GzkvayZ
   oE952UwXRxYgFhrSYuy1BMM2SHigSfFSwT9rPhjZEaiUu0erab4cbYXmR
   eL0NZKClwicRZi889mHhSv27DZsO4Xgd+8h5E44TmfTHLXHAInSohy7o8
   qyTSGh8XRpnnoDgZ6bjetWD0XAC0+TzsQTpy7p308Q9lktnjgjLvW6j9F
   n4vYZSNsYwG6wNAEdpNt3Byk+620RGl5GJrYx+iZ/3JmEnj3m2GCtSfxl
   Q==;
X-CSE-ConnectionGUID: ksWNrB/QTICbJd3Vb6bDRQ==
X-CSE-MsgGUID: Pm2iBy4OTqyC2sRRD2ESjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40988442"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40988442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:50:41 -0800
X-CSE-ConnectionGUID: LqBONMYDR1CntdZcKgPp2g==
X-CSE-MsgGUID: IsN/WvdSRACAcjkGJV+A9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115291368"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 07:50:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C609A2D0; Thu, 20 Feb 2025 17:50:38 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use for_each_gpiochip_node() helper
Date: Thu, 20 Feb 2025 17:50:11 +0200
Message-ID: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: fixed Subject, added tag (J. Neuschäfer)

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

