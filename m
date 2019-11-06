Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C4F1946
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 16:00:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477V8X0d9WzF3mM
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:00:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 477V0w2WxWzF3BM
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 01:54:05 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xA6ErY4K026784;
 Wed, 6 Nov 2019 16:53:34 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 790466032E; Wed,  6 Nov 2019 16:53:34 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Subject: [PATCH v5 3/3] reset: npcm: add NPCM reset controller driver
Date: Wed,  6 Nov 2019 16:53:31 +0200
Message-Id: <20191106145331.25740-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106145331.25740-1-tmaimon77@gmail.com>
References: <20191106145331.25740-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC reset controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/Kconfig      |   7 +
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-npcm.c | 291 +++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+)
 create mode 100644 drivers/reset/reset-npcm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7b07281aa0ae..9e3eac30e7db 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB
 	  This enables the reset driver for Audio Memory Arbiter of
 	  Amlogic's A113 based SoCs
 
+config RESET_NPCM
+	bool "NPCM BMC Reset Driver" if COMPILE_TEST
+	default ARCH_NPCM
+	help
+	  This enables the reset controller driver for Nuvoton NPCM
+	  BMC SoCs.
+
 config RESET_OXNAS
 	bool
 
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index cf60ce526064..00767c03f5f2 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
+obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
new file mode 100644
index 000000000000..2ea4d3136e15
--- /dev/null
+++ b/drivers/reset/reset-npcm.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology corporation.
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/of_address.h>
+
+/* NPCM7xx GCR registers */
+#define NPCM_MDLR_OFFSET	0x7C
+#define NPCM_MDLR_USBD0		BIT(9)
+#define NPCM_MDLR_USBD1		BIT(8)
+#define NPCM_MDLR_USBD2_4	BIT(21)
+#define NPCM_MDLR_USBD5_9	BIT(22)
+
+#define NPCM_USB1PHYCTL_OFFSET	0x140
+#define NPCM_USB2PHYCTL_OFFSET	0x144
+#define NPCM_USBXPHYCTL_RS	BIT(28)
+
+/* NPCM7xx Reset registers */
+#define NPCM_SWRSTR		0x14
+#define NPCM_SWRST		BIT(2)
+
+#define NPCM_IPSRST1		0x20
+#define NPCM_IPSRST1_USBD1	BIT(5)
+#define NPCM_IPSRST1_USBD2	BIT(8)
+#define NPCM_IPSRST1_USBD3	BIT(25)
+#define NPCM_IPSRST1_USBD4	BIT(22)
+#define NPCM_IPSRST1_USBD5	BIT(23)
+#define NPCM_IPSRST1_USBD6	BIT(24)
+
+#define NPCM_IPSRST2		0x24
+#define NPCM_IPSRST2_USB_HOST	BIT(26)
+
+#define NPCM_IPSRST3		0x34
+#define NPCM_IPSRST3_USBD0	BIT(4)
+#define NPCM_IPSRST3_USBD7	BIT(5)
+#define NPCM_IPSRST3_USBD8	BIT(6)
+#define NPCM_IPSRST3_USBD9	BIT(7)
+#define NPCM_IPSRST3_USBPHY1	BIT(24)
+#define NPCM_IPSRST3_USBPHY2	BIT(25)
+
+#define NPCM_RC_RESETS_PER_REG	32
+#define NPCM_MASK_RESETS	GENMASK(4, 0)
+
+struct npcm_rc_data {
+	struct reset_controller_dev rcdev;
+	struct notifier_block restart_nb;
+	u32 sw_reset_number;
+	void __iomem *base;
+	spinlock_t lock;
+};
+
+#define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
+
+static int npcm_rc_restart(struct notifier_block *nb, unsigned long mode,
+			   void *cmd)
+{
+	struct npcm_rc_data *rc = container_of(nb, struct npcm_rc_data,
+					       restart_nb);
+
+	writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
+	mdelay(1000);
+
+	pr_emerg("%s: unable to restart system\n", __func__);
+
+	return NOTIFY_DONE;
+}
+
+static int npcm_rc_setclear_reset(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool set)
+{
+	struct npcm_rc_data *rc = to_rc_data(rcdev);
+	unsigned int rst_bit = BIT(id & NPCM_MASK_RESETS);
+	unsigned int ctrl_offset = id >> 8;
+	unsigned long flags;
+	u32 stat;
+
+	spin_lock_irqsave(&rc->lock, flags);
+	stat = readl(rc->base + ctrl_offset);
+	if (set)
+		writel(stat | rst_bit, rc->base + ctrl_offset);
+	else
+		writel(stat & ~rst_bit, rc->base + ctrl_offset);
+	spin_unlock_irqrestore(&rc->lock, flags);
+
+	return 0;
+}
+
+static int npcm_rc_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return npcm_rc_setclear_reset(rcdev, id, true);
+}
+
+static int npcm_rc_deassert(struct reset_controller_dev *rcdev,
+			    unsigned long id)
+{
+	return npcm_rc_setclear_reset(rcdev, id, false);
+}
+
+static int npcm_rc_status(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	struct npcm_rc_data *rc = to_rc_data(rcdev);
+	unsigned int rst_bit = BIT(id & NPCM_MASK_RESETS);
+	unsigned int ctrl_offset = id >> 8;
+
+	return (readl(rc->base + ctrl_offset) & rst_bit);
+}
+
+static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
+			    const struct of_phandle_args *reset_spec)
+{
+	unsigned int offset, bit;
+
+	offset = reset_spec->args[0];
+	if (offset != NPCM_IPSRST1 && offset != NPCM_IPSRST2 &&
+	    offset != NPCM_IPSRST3) {
+		dev_err(rcdev->dev, "Error reset register (0x%x)\n", offset);
+		return -EINVAL;
+	}
+	bit = reset_spec->args[1];
+	if (bit >= NPCM_RC_RESETS_PER_REG) {
+		dev_err(rcdev->dev, "Error reset number (%d)\n", bit);
+		return -EINVAL;
+	}
+
+	return (offset << 8) | bit;
+}
+
+static const struct of_device_id npcm_rc_match[] = {
+	{ .compatible = "nuvoton,npcm750-reset",
+		.data = (void *)"nuvoton,npcm750-gcr" },
+	{ }
+};
+
+/*
+ *  The following procedure should be observed in USB PHY, USB device and
+ *  USB host initialization at BMC boot
+ */
+static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
+{
+	u32 mdlr, iprst1, iprst2, iprst3;
+	struct device *dev = &pdev->dev;
+	struct regmap *gcr_regmap;
+	u32 ipsrst1_bits = 0;
+	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
+	u32 ipsrst3_bits = 0;
+	const char *gcr_dt;
+
+	gcr_dt = (const char *)
+	of_match_device(dev->driver->of_match_table, dev)->data;
+
+	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
+	if (IS_ERR(gcr_regmap)) {
+		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
+		return PTR_ERR(gcr_regmap);
+	}
+
+	/* checking which USB device is enabled */
+	regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
+	if (!(mdlr & NPCM_MDLR_USBD0))
+		ipsrst3_bits |= NPCM_IPSRST3_USBD0;
+	if (!(mdlr & NPCM_MDLR_USBD1))
+		ipsrst1_bits |= NPCM_IPSRST1_USBD1;
+	if (!(mdlr & NPCM_MDLR_USBD2_4))
+		ipsrst1_bits |= (NPCM_IPSRST1_USBD2 |
+				 NPCM_IPSRST1_USBD3 |
+				 NPCM_IPSRST1_USBD4);
+	if (!(mdlr & NPCM_MDLR_USBD0)) {
+		ipsrst1_bits |= (NPCM_IPSRST1_USBD5 |
+				 NPCM_IPSRST1_USBD6);
+		ipsrst3_bits |= (NPCM_IPSRST3_USBD7 |
+				 NPCM_IPSRST3_USBD8 |
+				 NPCM_IPSRST3_USBD9);
+	}
+
+	/* assert reset USB PHY and USB devices */
+	iprst1 = readl(rc->base + NPCM_IPSRST1);
+	iprst2 = readl(rc->base + NPCM_IPSRST2);
+	iprst3 = readl(rc->base + NPCM_IPSRST3);
+
+	iprst1 |= ipsrst1_bits;
+	iprst2 |= ipsrst2_bits;
+	iprst3 |= (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
+		   NPCM_IPSRST3_USBPHY2);
+
+	writel(iprst1, rc->base + NPCM_IPSRST1);
+	writel(iprst2, rc->base + NPCM_IPSRST2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+
+	/* clear USB PHY RS bit */
+	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, 0);
+	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, 0);
+
+	/* deassert reset USB PHY */
+	iprst3 &= ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPSRST3_USBPHY2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+
+	udelay(50);
+
+	/* set USB PHY RS bit */
+	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+
+	/* deassert reset USB devices*/
+	iprst1 &= ~ipsrst1_bits;
+	iprst2 &= ~ipsrst2_bits;
+	iprst3 &= ~ipsrst3_bits;
+
+	writel(iprst1, rc->base + NPCM_IPSRST1);
+	writel(iprst2, rc->base + NPCM_IPSRST2);
+	writel(iprst3, rc->base + NPCM_IPSRST3);
+
+	return 0;
+}
+
+static const struct reset_control_ops npcm_rc_ops = {
+	.assert		= npcm_rc_assert,
+	.deassert	= npcm_rc_deassert,
+	.status		= npcm_rc_status,
+};
+
+static int npcm_rc_probe(struct platform_device *pdev)
+{
+	struct npcm_rc_data *rc;
+	int ret;
+
+	rc = devm_kzalloc(&pdev->dev, sizeof(*rc), GFP_KERNEL);
+	if (!rc)
+		return -ENOMEM;
+
+	rc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rc->base))
+		return PTR_ERR(rc->base);
+
+	spin_lock_init(&rc->lock);
+
+	rc->rcdev.owner = THIS_MODULE;
+	rc->rcdev.ops = &npcm_rc_ops;
+	rc->rcdev.of_node = pdev->dev.of_node;
+	rc->rcdev.of_reset_n_cells = 2;
+	rc->rcdev.of_xlate = npcm_reset_xlate;
+
+	platform_set_drvdata(pdev, rc);
+
+	ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to register device\n");
+		return ret;
+	}
+
+	if (npcm_usb_reset(pdev, rc))
+		dev_warn(&pdev->dev, "NPCM USB reset failed, can cause issues with UDC and USB host\n");
+
+	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-number",
+				  &rc->sw_reset_number)) {
+		if (rc->sw_reset_number && rc->sw_reset_number < 5) {
+			rc->restart_nb.priority = 192,
+			rc->restart_nb.notifier_call = npcm_rc_restart,
+			ret = register_restart_handler(&rc->restart_nb);
+			if (ret)
+				dev_warn(&pdev->dev, "failed to register restart handler\n");
+		}
+	}
+
+	return ret;
+}
+
+static struct platform_driver npcm_rc_driver = {
+	.probe	= npcm_rc_probe,
+	.driver	= {
+		.name			= "npcm-reset",
+		.of_match_table		= npcm_rc_match,
+		.suppress_bind_attrs	= true,
+	},
+};
+builtin_platform_driver(npcm_rc_driver);
-- 
2.22.0

