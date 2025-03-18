Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE9A671F1
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:00:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH84f25W1z3btT
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 22:00:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742295587;
	cv=none; b=kjvx+zSE3d89zr8puP1PVNf4qD6Ihy+UJBtMsVQ4JpBxB/ZzPPYwif4p4WABCCVEhBDHUFkmmO0xpva4xfLH9dHpZ9CFoKQlx9qjFRq/gXmCDKCglkCA9TThNDDcE7OSVnjwoO0SvGaPbA+kiv3sxysVepOt924ftk3mD1oefnUU78afRCqtsZmYPmCVx9MWCbCzaNo9RKtj7HSWeDo7ZS7n+a5H2TLyMkZfi9SexAKKfrYv+uqTSgp7C9WgXGM56sna48Hgi32Np4wJOdFMlfjOHZJRzUziFWdrYDBlYP25kkqq1iuQU9tqodsakyTu1oU5pbRZYPCUk6UzboBygg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742295587; c=relaxed/relaxed;
	bh=s5hNx8qq5WA/xVIcpPPa9ZGARxESCv+eSzVs6P0/78M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLphWN+unNLTUftTgpT16ngQVZucc4T6aA/yw0uZdYZVV260v2SO15TL5Q4bC2el4YevDoMyIyQNm+15GxgzkbaNfquXS50RO3JZpasqB3xvwDlhfNjB4PRahf/mwwt9xNApX0bMedPKkp2In+T+yZmcl+U9/hGeCEAT42uRtYXGldIRcfSV4797oluNTfQ3BlpZFEnSTD4GL4bHfNx+Yb6rvgO4XbcRt9VxA3RWeZK09tuCzETE3JzM37qaXYUCWgV6j20XJAZmi3zEE5uCtFV/4ZdIVnc9qJ7n2LVwnMYz/Zo3IXEwFG1s3cSCot0gZ/I4bC2DxEmgfzP9IajCdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lkwooPF3; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lkwooPF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH84K0m8vz2yrb
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 21:59:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295585; x=1773831585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=asp1AUmFkOlCpbFyxMT3/Whk2zXRSNCtJDEO+Z5wvBY=;
  b=lkwooPF390C6nY0P4H1vwlf/ie4oF8DJevQh35Rg7bwICMppf2fmIIHQ
   96l+qxr1CFOyh+11iyIh8iVwLLxdiSEQtq+SWHV3NacPX2oIEk9GdNDzX
   bWKLdnchYHddYpSRPxM7Jv+ojzMP5GPltRNQjp6NRT6MxY9kgxeK++dPs
   M3fRkPu1bI6vE1fDFfwdO/CpLxBpK70HgRgydnyKZq4wl/Nj0xbWZSJd6
   HXee1yjH1jHYjZYl5m+xTbbr+zlAfUTS8efnkKzd7BLMp8A1MJCcXaFNT
   ItRdS3lQrcAUFEVqafJUjpUlQ77HmQDg/2nQw5MA1pXOU5xJvy7vYJrlN
   g==;
X-CSE-ConnectionGUID: FMO/xDymTBi/OLVsjBNdwQ==
X-CSE-MsgGUID: s27mLiF1TSmK8NA+JvlrSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60959410"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="60959410"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:43 -0700
X-CSE-ConnectionGUID: dZKgkuFdQiKlfkKYVgnWMQ==
X-CSE-MsgGUID: XKUdbCKMQt+20wsV5rwcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127322164"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 03:59:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1D2EA677; Tue, 18 Mar 2025 12:59:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 5/5] pinctrl: nuvoton: Reduce use of OF-specific APIs
Date: Tue, 18 Mar 2025 12:57:18 +0200
Message-ID: <20250318105932.2090926-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andy Shevchenko <andy.shevchenko@gmail.com>

Some drivers are using device property APIs along with OF-specific ones.
At the same time few of the latter can be converted to device property
calls. Reduce use of OF-specific APIs in order to bring a bit more consistency
into the drivers.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 35 +++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |  1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 17 ++---------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  2 +-
 4 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index da3c8d8e3eb3..06ae1fe8b8c5 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -519,7 +519,6 @@ static int ma35_gpiolib_register(struct platform_device *pdev, struct ma35_pinct
 		bank->irqtype = 0;
 		bank->irqinten = 0;
 		bank->chip.label = bank->name;
-		bank->chip.of_gpio_n_cells = 2;
 		bank->chip.parent = &pdev->dev;
 		bank->chip.request = ma35_gpio_core_to_request;
 		bank->chip.direction_input = ma35_gpio_core_direction_in;
@@ -976,9 +975,10 @@ static const struct pinconf_ops ma35_pinconf_ops = {
 	.is_generic = true,
 };
 
-static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *grp,
+static int ma35_pinctrl_parse_groups(struct fwnode_handle *fwnode, struct group_desc *grp,
 				     struct ma35_pinctrl *npctl, u32 index)
 {
+	struct device_node *np = to_of_node(fwnode);
 	struct ma35_pin_setting *pin;
 	unsigned long *configs;
 	unsigned int nconfigs;
@@ -990,7 +990,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 	if (ret)
 		return ret;
 
-	count = of_property_count_elems_of_size(np, "nuvoton,pins", sizeof(u32));
+	count = fwnode_property_count_u32(fwnode, "nuvoton,pins");
 	if (!count || count % 3)
 		return -EINVAL;
 
@@ -1000,7 +1000,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 
 	grp->grp.name = np->name;
 
-	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
+	ret = fwnode_property_read_u32_array(fwnode, "nuvoton,pins", elems, count);
 	if (ret)
 		return -EINVAL;
 	grp->grp.npins = count / 3;
@@ -1027,10 +1027,11 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *
 	return 0;
 }
 
-static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinctrl *npctl,
+static int ma35_pinctrl_parse_functions(struct fwnode_handle *fwnode, struct ma35_pinctrl *npctl,
 					u32 index)
 {
-	struct device_node *child;
+	struct device_node *np = to_of_node(fwnode);
+	struct fwnode_handle *child;
 	struct pinfunction *func;
 	struct group_desc *grp;
 	static u32 grp_index;
@@ -1050,12 +1051,14 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 	if (!groups)
 		return -ENOMEM;
 
-	for_each_child_of_node(np, child) {
-		groups[i] = child->name;
+	fwnode_for_each_child_node(fwnode, child) {
+		struct device_node *node = to_of_node(child);
+
+		groups[i] = node->name;
 		grp = &npctl->groups[grp_index++];
 		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 	}
@@ -1066,13 +1069,12 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 
 static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinctrl *npctl)
 {
+	struct device *dev = &pdev->dev;
 	struct fwnode_handle *child;
 	u32 idx = 0;
 	int ret;
 
-	device_for_each_child_node(&pdev->dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
-			continue;
+	for_each_gpiochip_node(dev, child) {
 		npctl->nfunctions++;
 		npctl->ngroups += of_get_child_count(to_of_node(child));
 	}
@@ -1090,11 +1092,8 @@ static int ma35_pinctrl_probe_dt(struct platform_device *pdev, struct ma35_pinct
 	if (!npctl->groups)
 		return -ENOMEM;
 
-	device_for_each_child_node(&pdev->dev, child) {
-		if (fwnode_property_present(child, "gpio-controller"))
-			continue;
-
-		ret = ma35_pinctrl_parse_functions(to_of_node(child), npctl, idx++);
+	for_each_gpiochip_node(dev, child) {
+		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
 		if (ret) {
 			fwnode_handle_put(child);
 			dev_err(&pdev->dev, "failed to parse function\n");
@@ -1139,7 +1138,7 @@ int ma35_pinctrl_probe(struct platform_device *pdev, const struct ma35_pinctrl_s
 	npctl->info = info;
 	npctl->dev = &pdev->dev;
 
-	npctl->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
+	npctl->regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev), "nuvoton,sys");
 	if (IS_ERR(npctl->regmap))
 		return dev_err_probe(&pdev->dev, PTR_ERR(npctl->regmap),
 				     "No syscfg phandle specified\n");
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
index 8bb9a5a35954..eafa06ca0879 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35d1.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index c6b11a198c76..dfd32feb3428 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -7,10 +7,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -1832,22 +1830,13 @@ static struct pinctrl_desc npcm7xx_pinctrl_desc = {
 static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
 	int ret = -ENXIO;
-	struct resource res;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
 	struct fwnode_handle *child;
 	int id = 0;
 
 	for_each_gpiochip_node(dev, child) {
-		struct device_node *np = to_of_node(child);
-
-		ret = of_address_to_resource(np, 0, &res);
-		if (ret < 0) {
-			dev_err(dev, "Resource fail for GPIO bank %u\n", id);
-			return ret;
-		}
-
-		pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
+		pctrl->gpio_bank[id].base = fwnode_iomap(child, 0);
 		if (!pctrl->gpio_bank[id].base)
 			return -EINVAL;
 
@@ -1869,7 +1858,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return ret;
 		}
 
-		ret = irq_of_parse_and_map(np, 0);
+		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
 			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
 			return -EINVAL;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 62347a82282d..be3db8ab406c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2424,7 +2424,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pctrl);
 
 	pctrl->gcr_regmap =
-		syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
+		syscon_regmap_lookup_by_phandle(dev_of_node(dev), "nuvoton,sysgcr");
 	if (IS_ERR(pctrl->gcr_regmap))
 		return dev_err_probe(dev, PTR_ERR(pctrl->gcr_regmap),
 				      "Failed to find nuvoton,sysgcr property\n");
-- 
2.47.2

