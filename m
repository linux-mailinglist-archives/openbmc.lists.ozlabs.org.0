Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA99037E8
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 11:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vz3Qx2xnDz3cTh
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2024 19:34:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=62.142.5.83; helo=fgw22-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vz3P75y8Hz3cG6
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2024 19:32:42 +1000 (AEST)
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 657d3fe3-27d5-11ef-ab0f-005056bdd08f;
	Tue, 11 Jun 2024 12:31:35 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 4/4] pinctrl: nuvoton: Reduce use of OF-specific APIs
Date: Tue, 11 Jun 2024 12:30:25 +0300
Message-ID: <20240611093127.90210-5-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611093127.90210-1-andy.shevchenko@gmail.com>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some drivers are using device property APIs along with OF-specific ones.
At the same time few of the latter can be converted to device property
calls. Reduce use of OF-specific APIs in order to bring a bit more consistency
into the drivers.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 35 +++++++++++------------
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c  |  1 -
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 16 ++---------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c |  2 +-
 4 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 7c2b0039d1e4..2bb0bdbc881a 100644
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
index c6b11a198c76..d9245aa55d65 100644
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
@@ -1839,15 +1837,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
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
 
@@ -1869,7 +1859,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			return ret;
 		}
 
-		ret = irq_of_parse_and_map(np, 0);
+		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
 			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
 			return -EINVAL;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 7c37d2cda9f1..4410077615df 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2421,7 +2421,7 @@ static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pctrl);
 
 	pctrl->gcr_regmap =
-		syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
+		syscon_regmap_lookup_by_phandle(dev_of_node(dev), "nuvoton,sysgcr");
 	if (IS_ERR(pctrl->gcr_regmap))
 		return dev_err_probe(dev, PTR_ERR(pctrl->gcr_regmap),
 				      "Failed to find nuvoton,sysgcr property\n");
-- 
2.45.2

