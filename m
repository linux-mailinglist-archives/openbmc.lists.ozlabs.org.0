Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8341FEB208
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 15:02:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473n8473CRzF44B
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 01:02:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473n1K1cdpzF39C
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 00:56:32 +1100 (AEDT)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x9VDuJPY017945
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 15:56:20 +0200
Received: from NTILML02.nuvoton.com (10.190.1.46) by NTILML02.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Thu, 31 Oct
 2019 15:56:19 +0200
Received: from taln70.nuvoton.co.il (10.191.1.70) by NTILML02.nuvoton.com
 (10.190.1.47) with Microsoft SMTP Server id 15.0.1130.7 via Frontend
 Transport; Thu, 31 Oct 2019 15:56:19 +0200
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
 by taln70.nuvoton.co.il (Postfix) with ESMTP id B0E551A4;
 Thu, 31 Oct 2019 15:56:19 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id B163660275; Thu, 31 Oct 2019 15:56:19 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <yuenn@google.com>, <venture@google.com>, <benjaminfair@google.com>,
 <avifishman70@gmail.com>, <joel@jms.id.au>
Subject: [PATCH v3 3/3] reset: npcm: add NPCM reset controller driver
Date: Thu, 31 Oct 2019 15:56:17 +0200
Message-ID: <20191031135617.249303-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191031135617.249303-1-tmaimon77@gmail.com>
References: <20191031135617.249303-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC reset controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/Kconfig      |   7 +
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-npcm.c | 281 +++++++++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/reset/reset-npcm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7b07281aa0ae..9e3eac30e7db 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB
          This enables the reset driver for Audio Memory Arbiter of
          Amlogic's A113 based SoCs

+config RESET_NPCM
+       bool "NPCM BMC Reset Driver" if COMPILE_TEST
+       default ARCH_NPCM
+       help
+         This enables the reset controller driver for Nuvoton NPCM
+         BMC SoCs.
+
 config RESET_OXNAS
        bool

diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index cf60ce526064..00767c03f5f2 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) +=3D reset-lpc18xx.o
 obj-$(CONFIG_RESET_MESON) +=3D reset-meson.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) +=3D reset-meson-audio-arb.o
+obj-$(CONFIG_RESET_NPCM) +=3D reset-npcm.o
 obj-$(CONFIG_RESET_OXNAS) +=3D reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) +=3D reset-pistachio.o
 obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
new file mode 100644
index 000000000000..ad09d466d7f9
--- /dev/null
+++ b/drivers/reset/reset-npcm.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology corporation.
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/of_address.h>
+
+/* NPCM7xx GCR registers */
+#define NPCM_MDLR_OFFSET       0x7C
+#define NPCM_MDLR_USBD0                BIT(9)
+#define NPCM_MDLR_USBD1                BIT(8)
+#define NPCM_MDLR_USBD2_4      BIT(21)
+#define NPCM_MDLR_USBD5_9      BIT(22)
+
+#define NPCM_USB1PHYCTL_OFFSET 0x140
+#define NPCM_USB2PHYCTL_OFFSET 0x144
+#define NPCM_USBXPHYCTL_RS     BIT(28)
+
+/* NPCM7xx Reset registers */
+#define NPCM_SWRSTR            0x14
+#define NPCM_SWRST             BIT(2)
+
+#define NPCM_IPSRST1           0x20
+#define NPCM_IPSRST1_USBD1     BIT(5)
+#define NPCM_IPSRST1_USBD2     BIT(8)
+#define NPCM_IPSRST1_USBD3     BIT(25)
+#define NPCM_IPSRST1_USBD4     BIT(22)
+#define NPCM_IPSRST1_USBD5     BIT(23)
+#define NPCM_IPSRST1_USBD6     BIT(24)
+
+#define NPCM_IPSRST2           0x24
+#define NPCM_IPSRST2_USB_HOST  BIT(26)
+
+#define NPCM_IPSRST3           0x34
+#define NPCM_IPSRST3_USBD0     BIT(4)
+#define NPCM_IPSRST3_USBD7     BIT(5)
+#define NPCM_IPSRST3_USBD8     BIT(6)
+#define NPCM_IPSRST3_USBD9     BIT(7)
+#define NPCM_IPSRST3_USBPHY1   BIT(24)
+#define NPCM_IPSRST3_USBPHY2   BIT(25)
+
+#define NPCM_RC_RESETS_PER_REG 32
+#define NPCM_MASK_RESETS       GENMASK(4, 0)
+
+struct npcm_rc_data {
+       struct reset_controller_dev rcdev;
+       struct notifier_block restart_nb;
+       u32 sw_reset_number;
+       void __iomem *base;
+       spinlock_t lock;
+};
+
+#define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
+
+static int npcm_rc_restart(struct notifier_block *nb, unsigned long mode,
+                          void *cmd)
+{
+       struct npcm_rc_data *rc =3D container_of(nb, struct npcm_rc_data,
+                                              restart_nb);
+
+       writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
+       mdelay(1000);
+
+       pr_emerg("%s: unable to restart system\n", __func__);
+
+       return NOTIFY_DONE;
+}
+
+static int npcm_rc_setclear_reset(struct reset_controller_dev *rcdev,
+                                 unsigned long id, bool set)
+{
+       struct npcm_rc_data *rc =3D to_rc_data(rcdev);
+       unsigned int rst_bit =3D BIT(id & NPCM_MASK_RESETS);
+       unsigned int ctrl_offset =3D id >> 8;
+       unsigned long flags;
+       u32 stat;
+
+       spin_lock_irqsave(&rc->lock, flags);
+       stat =3D readl(rc->base + ctrl_offset);
+       if (set)
+               writel(stat | rst_bit, rc->base + ctrl_offset);
+       else
+               writel(stat & ~rst_bit, rc->base + ctrl_offset);
+       spin_unlock_irqrestore(&rc->lock, flags);
+
+       return 0;
+}
+
+static int npcm_rc_assert(struct reset_controller_dev *rcdev, unsigned lon=
g id)
+{
+       return npcm_rc_setclear_reset(rcdev, id, true);
+}
+
+static int npcm_rc_deassert(struct reset_controller_dev *rcdev,
+                           unsigned long id)
+{
+       return npcm_rc_setclear_reset(rcdev, id, false);
+}
+
+static int npcm_rc_status(struct reset_controller_dev *rcdev,
+                         unsigned long id)
+{
+       struct npcm_rc_data *rc =3D to_rc_data(rcdev);
+       unsigned int rst_bit =3D BIT(id & NPCM_MASK_RESETS);
+       unsigned int ctrl_offset =3D id >> 8;
+
+       return (readl(rc->base + ctrl_offset) & rst_bit);
+}
+
+/*
+ *  The following procedure should be observed in USB PHY, USB device and
+ *  USB host initialization at BMC boot
+ */
+static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_dat=
a *rc)
+{
+       struct device_node *np =3D pdev->dev.of_node;
+       u32 mdlr, iprst1, iprst2, iprst3;
+       struct regmap *gcr_regmap =3D NULL;
+       u32 ipsrst1_bits =3D 0;
+       u32 ipsrst2_bits =3D NPCM_IPSRST2_USB_HOST;
+       u32 ipsrst3_bits =3D 0;
+
+       if (of_device_is_compatible(np, "nuvoton,npcm750-reset")) {
+               gcr_regmap =3D syscon_regmap_lookup_by_compatible("nuvoton,=
npcm750-gcr");
+               if (IS_ERR(gcr_regmap)) {
+                       dev_err(&pdev->dev, "Failed to find nuvoton,npcm750=
-gcr\n");
+                       return PTR_ERR(gcr_regmap);
+               }
+       }
+       if (!gcr_regmap)
+               return -ENXIO;
+
+       /* checking which USB device is enabled */
+       regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
+       if (!(mdlr & NPCM_MDLR_USBD0))
+               ipsrst3_bits |=3D NPCM_IPSRST3_USBD0;
+       if (!(mdlr & NPCM_MDLR_USBD1))
+               ipsrst1_bits |=3D NPCM_IPSRST1_USBD1;
+       if (!(mdlr & NPCM_MDLR_USBD2_4))
+               ipsrst1_bits |=3D (NPCM_IPSRST1_USBD2 |
+                                NPCM_IPSRST1_USBD3 |
+                                NPCM_IPSRST1_USBD4);
+       if (!(mdlr & NPCM_MDLR_USBD0)) {
+               ipsrst1_bits |=3D (NPCM_IPSRST1_USBD5 |
+                                NPCM_IPSRST1_USBD6);
+               ipsrst3_bits |=3D (NPCM_IPSRST3_USBD7 |
+                                NPCM_IPSRST3_USBD8 |
+                                NPCM_IPSRST3_USBD9);
+       }
+
+       /* assert reset USB PHY and USB devices */
+       iprst1 =3D readl(rc->base + NPCM_IPSRST1);
+       iprst2 =3D readl(rc->base + NPCM_IPSRST2);
+       iprst3 =3D readl(rc->base + NPCM_IPSRST3);
+
+       iprst1 |=3D ipsrst1_bits;
+       iprst2 |=3D ipsrst2_bits;
+       iprst3 |=3D (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
+                  NPCM_IPSRST3_USBPHY2);
+
+       writel(iprst1, rc->base + NPCM_IPSRST1);
+       writel(iprst2, rc->base + NPCM_IPSRST2);
+       writel(iprst3, rc->base + NPCM_IPSRST3);
+
+       /* clear USB PHY RS bit */
+       regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+                          NPCM_USBXPHYCTL_RS, 0);
+       regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+                          NPCM_USBXPHYCTL_RS, 0);
+
+       /* deassert reset USB PHY */
+       iprst3 &=3D ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPSRST3_USBPHY2);
+       writel(iprst3, rc->base + NPCM_IPSRST3);
+
+       udelay(50);
+
+       /* set USB PHY RS bit */
+       regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
+                          NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+       regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
+                          NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
+
+       /* deassert reset USB devices*/
+       iprst1 &=3D ~ipsrst1_bits;
+       iprst2 &=3D ~ipsrst2_bits;
+       iprst3 &=3D ~ipsrst3_bits;
+
+       writel(iprst1, rc->base + NPCM_IPSRST1);
+       writel(iprst2, rc->base + NPCM_IPSRST2);
+       writel(iprst3, rc->base + NPCM_IPSRST3);
+
+       return 0;
+}
+
+static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
+                           const struct of_phandle_args *reset_spec)
+{
+       unsigned int offset, bit;
+
+       offset =3D reset_spec->args[0];
+       bit =3D reset_spec->args[1];
+
+       return (offset << 8) | bit;
+}
+
+static const struct reset_control_ops npcm_rc_ops =3D {
+       .assert         =3D npcm_rc_assert,
+       .deassert       =3D npcm_rc_deassert,
+       .status         =3D npcm_rc_status,
+};
+
+static int npcm_rc_probe(struct platform_device *pdev)
+{
+       struct npcm_rc_data *rc;
+       int ret;
+
+       rc =3D devm_kzalloc(&pdev->dev, sizeof(*rc), GFP_KERNEL);
+       if (!rc)
+               return -ENOMEM;
+
+       rc->base =3D devm_platform_ioremap_resource(pdev, 0);
+       if (IS_ERR(rc->base))
+               return PTR_ERR(rc->base);
+
+       spin_lock_init(&rc->lock);
+
+       rc->rcdev.owner =3D THIS_MODULE;
+       rc->rcdev.nr_resets =3D NPCM_RC_RESETS_PER_REG;
+       rc->rcdev.ops =3D &npcm_rc_ops;
+       rc->rcdev.of_node =3D pdev->dev.of_node;
+       rc->rcdev.of_reset_n_cells =3D 2;
+       rc->rcdev.of_xlate =3D npcm_reset_xlate;
+
+       platform_set_drvdata(pdev, rc);
+
+       ret =3D devm_reset_controller_register(&pdev->dev, &rc->rcdev);
+       if (ret) {
+               dev_err(&pdev->dev, "unable to register device\n");
+               return ret;
+       }
+
+       if (npcm_usb_reset(pdev, rc))
+               dev_warn(&pdev->dev, "NPCM USB reset failed, can cause issu=
es with UDC and USB host\n");
+
+       if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-numb=
er",
+                                 &rc->sw_reset_number)) {
+               if (rc->sw_reset_number && rc->sw_reset_number < 5) {
+                       rc->restart_nb.priority =3D 192,
+                       rc->restart_nb.notifier_call =3D npcm_rc_restart,
+                       ret =3D register_restart_handler(&rc->restart_nb);
+                       if (ret)
+                               dev_warn(&pdev->dev, "failed to register re=
start handler\n");
+               }
+       }
+
+       return ret;
+}
+
+static const struct of_device_id npcm_rc_match[] =3D {
+       { .compatible =3D "nuvoton,npcm750-reset" },
+       { }
+};
+
+static struct platform_driver npcm_rc_driver =3D {
+       .probe  =3D npcm_rc_probe,
+       .driver =3D {
+               .name                   =3D "npcm-reset",
+               .of_match_table         =3D npcm_rc_match,
+               .suppress_bind_attrs    =3D true,
+       },
+};
+builtin_platform_driver(npcm_rc_driver);
--
2.22.0



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.
