Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E2A2F53EB
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:14:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJZK3FydzDrhl
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:14:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGR0wf4zDrTP
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:46 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0OsQ007586;
 Wed, 13 Jan 2021 22:00:24 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id F366E63A17; Wed, 13 Jan 2021 22:00:24 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 09/12] pinctrl: npcm7xx: Add pin persist
 configuration support
Date: Wed, 13 Jan 2021 22:00:07 +0200
Message-Id: <20210113200010.71845-10-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index e5f58ea89917..ec12efd23bbe 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -36,6 +36,19 @@
 
 #define SRCNT_ESPI		BIT(3)
 
+/* reset registers */
+#define NPCM7XX_RST_WD0RCR	0x38
+#define NPCM7XX_RST_WD1RCR	0x3C
+#define NPCM7XX_RST_WD2RCR	0x40
+#define NPCM7XX_RST_SWRSTC1	0x44
+#define NPCM7XX_RST_SWRSTC2	0x48
+#define NPCM7XX_RST_SWRSTC3	0x4C
+#define NPCM7XX_RST_SWRSTC4	0x50
+#define NPCM7XX_RST_CORSTC	0x5C
+
+#define GPIOX_MODULE_RESET	BIT(16)
+#define CA9C_MODULE_RESET	BIT(0)
+
 /* GPIO registers */
 #define NPCM7XX_GP_N_TLOCK1	0x00
 #define NPCM7XX_GP_N_DIN	0x04 /* Data IN */
@@ -94,6 +107,7 @@ struct npcm7xx_pinctrl {
 	struct npcm7xx_gpio	gpio_bank[NPCM7XX_GPIO_BANK_NUM];
 	struct irq_domain	*domain;
 	struct regmap		*gcr_regmap;
+	struct regmap		*rst_regmap;
 	void __iomem		*regs;
 	u32			bank_num;
 };
@@ -1583,6 +1597,48 @@ static int npcm7xx_set_drive_strength(struct npcm7xx_pinctrl *npcm,
 	return -ENOTSUPP;
 }
 
+static int npcm7xx_gpio_reset_persist(struct npcm7xx_pinctrl *npcm,
+					unsigned int pin, int enable)
+{
+	struct npcm7xx_gpio *bank =
+		&npcm->gpio_bank[pin / NPCM7XX_GPIO_PER_BANK];
+	int banknum = pin / bank->gc.ngpio;
+
+	if (enable) {
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD0RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD1RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD2RCR,
+				   GPIOX_MODULE_RESET << banknum, 0);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_CORSTC,
+				   GPIOX_MODULE_RESET << banknum, 0);
+	} else {
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD0RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD1RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_WD2RCR,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+		regmap_update_bits(npcm->rst_regmap, NPCM7XX_RST_CORSTC,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET,
+				   (GPIOX_MODULE_RESET << banknum) |
+				   CA9C_MODULE_RESET);
+	}
+
+	return 0;
+}
+
 /* pinctrl_ops */
 static void npcm7xx_pin_dbg_show(struct pinctrl_dev *pctldev,
 				 struct seq_file *s, unsigned int offset)
@@ -1852,6 +1908,8 @@ static int npcm7xx_config_set_one(struct npcm7xx_pinctrl *npcm,
 		return npcm7xx_set_slew_rate(bank, npcm->gcr_regmap, pin, arg);
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		return npcm7xx_set_drive_strength(npcm, pin, arg);
+	case PIN_CONFIG_PERSIST_STATE:
+		return npcm7xx_gpio_reset_persist(npcm, pin, arg);
 	default:
 		return -ENOTSUPP;
 	}
@@ -2051,6 +2109,13 @@ static int npcm7xx_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctrl->gcr_regmap);
 	}
 
+	pctrl->rst_regmap =
+		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
+	if (IS_ERR(pctrl->rst_regmap)) {
+		dev_err(pctrl->dev, "didn't find nuvoton,npcm750-rst\n");
+		return PTR_ERR(pctrl->rst_regmap);
+	}
+
 	ret = npcm7xx_gpio_of(pctrl);
 	if (ret < 0) {
 		dev_err(pctrl->dev, "Failed to gpio dt-binding %u\n", ret);
-- 
2.22.0

