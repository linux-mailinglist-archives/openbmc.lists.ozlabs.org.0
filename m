Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6D586A2A
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 14:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxH7z50jyz3cdG
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 22:13:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxH3F05pXz3bmG
	for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2022 22:08:56 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271C8SEI020974
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 15:08:28 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 15:08:27 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Mon, 1 Aug 2022
 20:08:25 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 20:08:25 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 27D1363A27; Mon,  1 Aug 2022 15:08:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 10/16] reset: npcm: Add NPCM8XX support
Date: Mon, 1 Aug 2022 15:08:13 +0300
Message-ID: <20220801120819.113533-11-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801120819.113533-1-tmaimon77@gmail.com>
References: <20220801120819.113533-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Updated the NPCM reset driver to add support for Nuvoton BMC NPCM8XX SoC.
As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Add NPCM8XX USB reset.
- Add data to handle architecture-specific reset parameters.
- Some of the Reset Id and number of resets are different from NPCM7XX.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/reset-npcm.c | 211 ++++++++++++++++++++++++++++++-------
 1 file changed, 173 insertions(+), 38 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index b08f8d8a1d63..24c55efa98e5 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -17,13 +17,20 @@
 
 /* NPCM7xx GCR registers */
 #define NPCM_MDLR_OFFSET	0x7C
-#define NPCM_MDLR_USBD0		BIT(9)
-#define NPCM_MDLR_USBD1		BIT(8)
-#define NPCM_MDLR_USBD2_4	BIT(21)
-#define NPCM_MDLR_USBD5_9	BIT(22)
+#define NPCM7XX_MDLR_USBD0	BIT(9)
+#define NPCM7XX_MDLR_USBD1	BIT(8)
+#define NPCM7XX_MDLR_USBD2_4	BIT(21)
+#define NPCM7XX_MDLR_USBD5_9	BIT(22)
+
+/* NPCM8xx MDLR bits */
+#define NPCM8XX_MDLR_USBD0_3	BIT(9)
+#define NPCM8XX_MDLR_USBD4_7	BIT(22)
+#define NPCM8XX_MDLR_USBD8	BIT(24)
+#define NPCM8XX_MDLR_USBD9	BIT(21)
 
 #define NPCM_USB1PHYCTL_OFFSET	0x140
 #define NPCM_USB2PHYCTL_OFFSET	0x144
+#define NPCM_USB3PHYCTL_OFFSET	0x148
 #define NPCM_USBXPHYCTL_RS	BIT(28)
 
 /* NPCM7xx Reset registers */
@@ -49,12 +56,38 @@
 #define NPCM_IPSRST3_USBPHY1	BIT(24)
 #define NPCM_IPSRST3_USBPHY2	BIT(25)
 
+#define NPCM_IPSRST4		0x74
+#define NPCM_IPSRST4_USBPHY3	BIT(25)
+#define NPCM_IPSRST4_USB_HOST2	BIT(31)
+
 #define NPCM_RC_RESETS_PER_REG	32
 #define NPCM_MASK_RESETS	GENMASK(4, 0)
 
+enum {
+	BMC_NPCM7XX = 0,
+	BMC_NPCM8XX,
+};
+
+static const u32 npxm7xx_ipsrst[] = {NPCM_IPSRST1, NPCM_IPSRST2, NPCM_IPSRST3};
+static const u32 npxm8xx_ipsrst[] = {NPCM_IPSRST1, NPCM_IPSRST2, NPCM_IPSRST3,
+	NPCM_IPSRST4};
+
+struct npcm_reset_info {
+	u32 bmc_id;
+	u32 num_ipsrst;
+	const u32 *ipsrst;
+};
+
+static const struct npcm_reset_info npxm7xx_reset_info[] = {
+	{.bmc_id = BMC_NPCM7XX, .num_ipsrst = 3, .ipsrst = npxm7xx_ipsrst}};
+static const struct npcm_reset_info npxm8xx_reset_info[] = {
+	{.bmc_id = BMC_NPCM8XX, .num_ipsrst = 4, .ipsrst = npxm8xx_ipsrst}};
+
 struct npcm_rc_data {
 	struct reset_controller_dev rcdev;
 	struct notifier_block restart_nb;
+	const struct npcm_reset_info *info;
+	struct regmap *gcr_regmap;
 	u32 sw_reset_number;
 	void __iomem *base;
 	spinlock_t lock;
@@ -120,14 +153,24 @@ static int npcm_rc_status(struct reset_controller_dev *rcdev,
 static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
 			    const struct of_phandle_args *reset_spec)
 {
+	struct npcm_rc_data *rc = to_rc_data(rcdev);
 	unsigned int offset, bit;
+	bool offset_found = false;
+	int off_num;
 
 	offset = reset_spec->args[0];
-	if (offset != NPCM_IPSRST1 && offset != NPCM_IPSRST2 &&
-	    offset != NPCM_IPSRST3) {
+	for (off_num = 0 ; off_num < rc->info->num_ipsrst ; off_num++) {
+		if (offset == rc->info->ipsrst[off_num]) {
+			offset_found = true;
+			break;
+		}
+	}
+
+	if (!offset_found) {
 		dev_err(rcdev->dev, "Error reset register (0x%x)\n", offset);
 		return -EINVAL;
 	}
+
 	bit = reset_spec->args[1];
 	if (bit >= NPCM_RC_RESETS_PER_REG) {
 		dev_err(rcdev->dev, "Error reset number (%d)\n", bit);
@@ -138,49 +181,29 @@ static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
 }
 
 static const struct of_device_id npcm_rc_match[] = {
-	{ .compatible = "nuvoton,npcm750-reset" },
+	{ .compatible = "nuvoton,npcm750-reset", .data = &npxm7xx_reset_info},
+	{ .compatible = "nuvoton,npcm845-reset", .data = &npxm8xx_reset_info},
 	{ }
 };
 
-/*
- *  The following procedure should be observed in USB PHY, USB device and
- *  USB host initialization at BMC boot
- */
-static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
+static void npcm_usb_reset_npcm7xx(struct npcm_rc_data *rc)
 {
 	u32 mdlr, iprst1, iprst2, iprst3;
-	struct device *dev = &pdev->dev;
-	struct regmap *gcr_regmap;
 	u32 ipsrst1_bits = 0;
 	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
 	u32 ipsrst3_bits = 0;
-	const char *gcr_dt;
-
-	gcr_dt = (const char *)
-	of_match_device(dev->driver->of_match_table, dev)->data;
-
-	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
-	if (IS_ERR(gcr_regmap)) {
-		dev_warn(&pdev->dev, "Failed to find nuvoton,sysgcr property, please update the device tree\n");
-		dev_info(&pdev->dev, "Using nuvoton,npcm750-gcr for Poleg backward compatibility\n");
-		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
-		if (IS_ERR(gcr_regmap)) {
-			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-gcr");
-			return PTR_ERR(gcr_regmap);
-		}
-	}
 
 	/* checking which USB device is enabled */
-	regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
-	if (!(mdlr & NPCM_MDLR_USBD0))
+	regmap_read(rc->gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
+	if (!(mdlr & NPCM7XX_MDLR_USBD0))
 		ipsrst3_bits |= NPCM_IPSRST3_USBD0;
-	if (!(mdlr & NPCM_MDLR_USBD1))
+	if (!(mdlr & NPCM7XX_MDLR_USBD1))
 		ipsrst1_bits |= NPCM_IPSRST1_USBD1;
-	if (!(mdlr & NPCM_MDLR_USBD2_4))
+	if (!(mdlr & NPCM7XX_MDLR_USBD2_4))
 		ipsrst1_bits |= (NPCM_IPSRST1_USBD2 |
 				 NPCM_IPSRST1_USBD3 |
 				 NPCM_IPSRST1_USBD4);
-	if (!(mdlr & NPCM_MDLR_USBD0)) {
+	if (!(mdlr & NPCM7XX_MDLR_USBD0)) {
 		ipsrst1_bits |= (NPCM_IPSRST1_USBD5 |
 				 NPCM_IPSRST1_USBD6);
 		ipsrst3_bits |= (NPCM_IPSRST3_USBD7 |
@@ -203,9 +226,9 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	writel(iprst3, rc->base + NPCM_IPSRST3);
 
 	/* clear USB PHY RS bit */
-	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
 			   NPCM_USBXPHYCTL_RS, 0);
-	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
 			   NPCM_USBXPHYCTL_RS, 0);
 
 	/* deassert reset USB PHY */
@@ -215,9 +238,9 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	udelay(50);
 
 	/* set USB PHY RS bit */
-	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
 			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
-	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
 			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
 
 	/* deassert reset USB devices*/
@@ -228,6 +251,118 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	writel(iprst1, rc->base + NPCM_IPSRST1);
 	writel(iprst2, rc->base + NPCM_IPSRST2);
 	writel(iprst3, rc->base + NPCM_IPSRST3);
+}
+
+static void npcm_usb_reset_npcm8xx(struct npcm_rc_data *rc)
+{
+	u32 mdlr, iprst1, iprst2, iprst3, iprst4;
+	u32 ipsrst1_bits = 0;
+	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
+	u32 ipsrst3_bits = 0;
+	u32 ipsrst4_bits = NPCM_IPSRST4_USB_HOST2 | NPCM_IPSRST4_USBPHY3;
+
+	/* checking which USB device is enabled */
+	regmap_read(rc->gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
+	if (!(mdlr & NPCM8XX_MDLR_USBD0_3)) {
+		ipsrst3_bits |= NPCM_IPSRST3_USBD0;
+		ipsrst1_bits |= (NPCM_IPSRST1_USBD1 |
+				 NPCM_IPSRST1_USBD2 |
+				 NPCM_IPSRST1_USBD3);
+	}
+	if (!(mdlr & NPCM8XX_MDLR_USBD4_7)) {
+		ipsrst1_bits |= (NPCM_IPSRST1_USBD4 |
+				 NPCM_IPSRST1_USBD5 |
+				 NPCM_IPSRST1_USBD6);
+		ipsrst3_bits |= NPCM_IPSRST3_USBD7;
+	}
+
+	if (!(mdlr & NPCM8XX_MDLR_USBD8))
+		ipsrst3_bits |= NPCM_IPSRST3_USBD8;
+	if (!(mdlr & NPCM8XX_MDLR_USBD9))
+		ipsrst3_bits |= NPCM_IPSRST3_USBD9;
+
+	/* assert reset USB PHY and USB devices */
+	iprst1 = readl(rc->base + NPCM_IPSRST1);
+	iprst2 = readl(rc->base + NPCM_IPSRST2);
+	iprst3 = readl(rc->base + NPCM_IPSRST3);
+	iprst4 = readl(rc->base + NPCM_IPSRST4);
+
+	iprst1 |= ipsrst1_bits;
+	iprst2 |= ipsrst2_bits;
+	iprst3 |= (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
+		   NPCM_IPSRST3_USBPHY2);
+	iprst2 |= ipsrst4_bits;
+
+	writel(iprst1, rc->base + NPCM_IPSRST1);
+	writel(iprst2, rc->base + NPCM_IPSRST2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+	writel(iprst4, rc->base + NPCM_IPSRST4);
+
+	/* clear USB PHY RS bit */
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, 0);
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, 0);
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB3PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, 0);
+
+	/* deassert reset USB PHY */
+	iprst3 &= ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPSRST3_USBPHY2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+	iprst4 &= ~NPCM_IPSRST4_USBPHY3;
+	writel(iprst4, rc->base + NPCM_IPSRST4);
+
+	/* set USB PHY RS bit */
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+	regmap_update_bits(rc->gcr_regmap, NPCM_USB3PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+
+	/* deassert reset USB devices*/
+	iprst1 &= ~ipsrst1_bits;
+	iprst2 &= ~ipsrst2_bits;
+	iprst3 &= ~ipsrst3_bits;
+	iprst4 &= ~ipsrst4_bits;
+
+	writel(iprst1, rc->base + NPCM_IPSRST1);
+	writel(iprst2, rc->base + NPCM_IPSRST2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+	writel(iprst4, rc->base + NPCM_IPSRST4);
+}
+
+/*
+ *  The following procedure should be observed in USB PHY, USB device and
+ *  USB host initialization at BMC boot
+ */
+static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
+{
+	struct device *dev = &pdev->dev;
+
+	rc->gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "nuvoton,sysgcr");
+	if (IS_ERR(rc->gcr_regmap)) {
+		dev_warn(&pdev->dev, "Failed to find nuvoton,sysgcr property, please update the device tree\n");
+		dev_info(&pdev->dev, "Using nuvoton,npcm750-gcr for Poleg backward compatibility\n");
+		rc->gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(rc->gcr_regmap)) {
+			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-gcr");
+			return PTR_ERR(rc->gcr_regmap);
+		}
+	}
+
+	rc->info = (const struct npcm_reset_info *)
+			of_match_device(dev->driver->of_match_table, dev)->data;
+	switch (rc->info->bmc_id) {
+	case BMC_NPCM7XX:
+		npcm_usb_reset_npcm7xx(rc);
+		break;
+	case BMC_NPCM8XX:
+		npcm_usb_reset_npcm8xx(rc);
+		break;
+	default:
+		return -ENODEV;
+	}
 
 	return 0;
 }
-- 
2.33.0

