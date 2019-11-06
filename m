Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F3F148A
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 12:05:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477NxN08Q0zF5jd
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 22:05:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="miSCYA4G"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477NwR1tyQzF5Tm
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 22:04:54 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id n23so10222236otr.13
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 03:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9wQLQvuEUNKFMKMCZGFaKnRi+lRFc1BdpfpKRmsLOo=;
 b=miSCYA4GByZJK058ar0H5y+BLeekM7O9MxKq1EXTi9JyW22J1rZ5eOAxdtvO+zPIa2
 815w0Ml/hSPZv+TBdCMDDhNm/5nzjVneYx5JuCYKtZxvv1cYtiPSAdXaVJQWoXbgTBsL
 mONGB8YhrYN2ntoEHsQ61hHjF0WMbaWBC1xYmXLUEIlPYlEkiYwBgNaJ+VYx+winDap4
 USMjvjZObe1JkcaMBnmA8+KMs0n6K86l4kJQwUHUxpAVjOxWwiqq5EPHq44FV6aCipYs
 gJEHIPi8gNzGD5+09iji07XWHFDRPDZilCVvR/aRRoJuhGx8n6G871eaqrVgD90DUpbz
 LoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9wQLQvuEUNKFMKMCZGFaKnRi+lRFc1BdpfpKRmsLOo=;
 b=Kd5H3WSmxOgI6FnA9bk/+QnA4JbIiUlo00wLY/SC9YzOJZx9yRR+C/PureH8onJ0vH
 OOryrqrr8DIse4Hmcqglq9ZCXdZyHeoRPQ7xABT/6yW5VqUvae1cCnB0D96gnuSDj8mK
 KbSHI0xYtaWHucGTBeP2G9XO7r0D8xqNPfSR1dXEX05ogmPgsk6iEgzCeEAcFebKIdtf
 NLbI1tcLEe7Ys/HzoSsR7daB+unyJFccQGwE2nwuL74HTgwX2XeiCNxLAdCQAspWJrGy
 FRbrFlIHenpYzxb1+aiIUGOBqB86RUt/epET/JpRyyrwUgsdYSJT40LKE7WN2RrbBEcv
 nkwQ==
X-Gm-Message-State: APjAAAVV7fdKpZwwFsV37WZfr8C34C2R0Uo0FhuFbMauF/4eMRdrEPZL
 oPsm5+BCAizerD36VBP0hSId0k6ijjqVHZ5ZVgk=
X-Google-Smtp-Source: APXvYqzeeYav6AYIlvWhIUpULjYlWrmVUTNhGPqkmBn+aS45pgsTurlfTw4GK+f1O9Oo2Sjorj2Bg+4CqP8m9pF+QJc=
X-Received: by 2002:a9d:c22:: with SMTP id 31mr1453731otr.238.1573038291475;
 Wed, 06 Nov 2019 03:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20191106095832.236766-1-tmaimon77@gmail.com>
 <20191106095832.236766-4-tmaimon77@gmail.com>
 <89250d485d05d4d671203ae615ebcf514b4d6705.camel@pengutronix.de>
In-Reply-To: <89250d485d05d4d671203ae615ebcf514b4d6705.camel@pengutronix.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 6 Nov 2019 13:14:31 +0200
Message-ID: <CAP6Zq1iYKKkcEKt-WW3sDRJ1ktWgQug9SQc2AF473fWnooUxeQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] reset: npcm: add NPCM reset controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/alternative; boundary="00000000000094e3e40596ab8436"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000094e3e40596ab8436
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

Thanks a lot for your comments

On Wed, 6 Nov 2019 at 12:39, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Tomer,
>
> On Wed, 2019-11-06 at 11:58 +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC reset controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/reset/Kconfig      |   7 +
> >  drivers/reset/Makefile     |   1 +
> >  drivers/reset/reset-npcm.c | 281 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 289 insertions(+)
> >  create mode 100644 drivers/reset/reset-npcm.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 7b07281aa0ae..9e3eac30e7db 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB
> >         This enables the reset driver for Audio Memory Arbiter of
> >         Amlogic's A113 based SoCs
> >
> > +config RESET_NPCM
> > +     bool "NPCM BMC Reset Driver" if COMPILE_TEST
> > +     default ARCH_NPCM
> > +     help
> > +       This enables the reset controller driver for Nuvoton NPCM
> > +       BMC SoCs.
> > +
> >  config RESET_OXNAS
> >       bool
> >
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index cf60ce526064..00767c03f5f2 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
> >  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
> >  obj-$(CONFIG_RESET_MESON) += reset-meson.o
> >  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> > +obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
> >  obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
> >  obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
> >  obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
> > diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> > new file mode 100644
> > index 000000000000..ad09d466d7f9
> > --- /dev/null
> > +++ b/drivers/reset/reset-npcm.c
> > @@ -0,0 +1,281 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > +
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reboot.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
> > +#include <linux/of_address.h>
> > +
> > +/* NPCM7xx GCR registers */
> > +#define NPCM_MDLR_OFFSET     0x7C
> > +#define NPCM_MDLR_USBD0              BIT(9)
> > +#define NPCM_MDLR_USBD1              BIT(8)
> > +#define NPCM_MDLR_USBD2_4    BIT(21)
> > +#define NPCM_MDLR_USBD5_9    BIT(22)
> > +
> > +#define NPCM_USB1PHYCTL_OFFSET       0x140
> > +#define NPCM_USB2PHYCTL_OFFSET       0x144
> > +#define NPCM_USBXPHYCTL_RS   BIT(28)
> > +
> > +/* NPCM7xx Reset registers */
> > +#define NPCM_SWRSTR          0x14
> > +#define NPCM_SWRST           BIT(2)
> > +
> > +#define NPCM_IPSRST1         0x20
> > +#define NPCM_IPSRST1_USBD1   BIT(5)
> > +#define NPCM_IPSRST1_USBD2   BIT(8)
> > +#define NPCM_IPSRST1_USBD3   BIT(25)
> > +#define NPCM_IPSRST1_USBD4   BIT(22)
> > +#define NPCM_IPSRST1_USBD5   BIT(23)
> > +#define NPCM_IPSRST1_USBD6   BIT(24)
> > +
> > +#define NPCM_IPSRST2         0x24
> > +#define NPCM_IPSRST2_USB_HOST        BIT(26)
> > +
> > +#define NPCM_IPSRST3         0x34
> > +#define NPCM_IPSRST3_USBD0   BIT(4)
> > +#define NPCM_IPSRST3_USBD7   BIT(5)
> > +#define NPCM_IPSRST3_USBD8   BIT(6)
> > +#define NPCM_IPSRST3_USBD9   BIT(7)
> > +#define NPCM_IPSRST3_USBPHY1 BIT(24)
> > +#define NPCM_IPSRST3_USBPHY2 BIT(25)
> > +
> > +#define NPCM_RC_RESETS_PER_REG       32
> > +#define NPCM_MASK_RESETS     GENMASK(4, 0)
> > +
> > +struct npcm_rc_data {
> > +     struct reset_controller_dev rcdev;
> > +     struct notifier_block restart_nb;
> > +     u32 sw_reset_number;
> > +     void __iomem *base;
> > +     spinlock_t lock;
> > +};
> > +
> > +#define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
> > +
> > +static int npcm_rc_restart(struct notifier_block *nb, unsigned long
> mode,
> > +                        void *cmd)
> > +{
> > +     struct npcm_rc_data *rc = container_of(nb, struct npcm_rc_data,
> > +                                            restart_nb);
> > +
> > +     writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
> > +     mdelay(1000);
> > +
> > +     pr_emerg("%s: unable to restart system\n", __func__);
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
> > +static int npcm_rc_setclear_reset(struct reset_controller_dev *rcdev,
> > +                               unsigned long id, bool set)
> > +{
> > +     struct npcm_rc_data *rc = to_rc_data(rcdev);
> > +     unsigned int rst_bit = BIT(id & NPCM_MASK_RESETS);
> > +     unsigned int ctrl_offset = id >> 8;
> > +     unsigned long flags;
> > +     u32 stat;
> > +
> > +     spin_lock_irqsave(&rc->lock, flags);
> > +     stat = readl(rc->base + ctrl_offset);
> > +     if (set)
> > +             writel(stat | rst_bit, rc->base + ctrl_offset);
> > +     else
> > +             writel(stat & ~rst_bit, rc->base + ctrl_offset);
> > +     spin_unlock_irqrestore(&rc->lock, flags);
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_rc_assert(struct reset_controller_dev *rcdev, unsigned
> long id)
> > +{
> > +     return npcm_rc_setclear_reset(rcdev, id, true);
> > +}
> > +
> > +static int npcm_rc_deassert(struct reset_controller_dev *rcdev,
> > +                         unsigned long id)
> > +{
> > +     return npcm_rc_setclear_reset(rcdev, id, false);
> > +}
> > +
> > +static int npcm_rc_status(struct reset_controller_dev *rcdev,
> > +                       unsigned long id)
> > +{
> > +     struct npcm_rc_data *rc = to_rc_data(rcdev);
> > +     unsigned int rst_bit = BIT(id & NPCM_MASK_RESETS);
> > +     unsigned int ctrl_offset = id >> 8;
> > +
> > +     return (readl(rc->base + ctrl_offset) & rst_bit);
> > +}
> > +
> > +/*
> > + *  The following procedure should be observed in USB PHY, USB device
> and
> > + *  USB host initialization at BMC boot
> > + */
> > +static int npcm_usb_reset(struct platform_device *pdev, struct
> npcm_rc_data *rc)
>
> Is this npcm750 specific? If so, you could call it npcm750_usb_reset and
> only call it if the compatible matches.

No, we will need it also in future BMC's

>
>
> +{
> > +     struct device_node *np = pdev->dev.of_node;
> > +     u32 mdlr, iprst1, iprst2, iprst3;
> > +     struct regmap *gcr_regmap = NULL;
> > +     u32 ipsrst1_bits = 0;
> > +     u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
> > +     u32 ipsrst3_bits = 0;
> > +
> > +     if (of_device_is_compatible(np, "nuvoton,npcm750-reset")) {
>
> Better use of_match_device(). Also see above, I think this check could
> be done in probe() already?
>
I will use  of_match_device. because the nuvoton,npcm750-reset used only at
npcm_usb_reset and in the next BMC version we will need to get other
reset device I prefer to leave it the  npcm_usb_reset function, is it O.K?

>
> > +             gcr_regmap =
> syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> > +             if (IS_ERR(gcr_regmap)) {
> > +                     dev_err(&pdev->dev, "Failed to find
> nuvoton,npcm750-gcr\n");
> > +                     return PTR_ERR(gcr_regmap);
> > +             }
> > +     }
> > +     if (!gcr_regmap)
> > +             return -ENXIO;
> > +
> > +     /* checking which USB device is enabled */
> > +     regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
> > +     if (!(mdlr & NPCM_MDLR_USBD0))
> > +             ipsrst3_bits |= NPCM_IPSRST3_USBD0;
> > +     if (!(mdlr & NPCM_MDLR_USBD1))
> > +             ipsrst1_bits |= NPCM_IPSRST1_USBD1;
> > +     if (!(mdlr & NPCM_MDLR_USBD2_4))
> > +             ipsrst1_bits |= (NPCM_IPSRST1_USBD2 |
> > +                              NPCM_IPSRST1_USBD3 |
> > +                              NPCM_IPSRST1_USBD4);
> > +     if (!(mdlr & NPCM_MDLR_USBD0)) {
> > +             ipsrst1_bits |= (NPCM_IPSRST1_USBD5 |
> > +                              NPCM_IPSRST1_USBD6);
> > +             ipsrst3_bits |= (NPCM_IPSRST3_USBD7 |
> > +                              NPCM_IPSRST3_USBD8 |
> > +                              NPCM_IPSRST3_USBD9);
> > +     }
> > +
> > +     /* assert reset USB PHY and USB devices */
> > +     iprst1 = readl(rc->base + NPCM_IPSRST1);
> > +     iprst2 = readl(rc->base + NPCM_IPSRST2);
> > +     iprst3 = readl(rc->base + NPCM_IPSRST3);
> > +
> > +     iprst1 |= ipsrst1_bits;
> > +     iprst2 |= ipsrst2_bits;
> > +     iprst3 |= (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
> > +                NPCM_IPSRST3_USBPHY2);
> > +
> > +     writel(iprst1, rc->base + NPCM_IPSRST1);
> > +     writel(iprst2, rc->base + NPCM_IPSRST2);
> > +     writel(iprst3, rc->base + NPCM_IPSRST3);
> > +
> > +     /* clear USB PHY RS bit */
> > +     regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
> > +                        NPCM_USBXPHYCTL_RS, 0);
> > +     regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
> > +                        NPCM_USBXPHYCTL_RS, 0);
> > +
> > +     /* deassert reset USB PHY */
> > +     iprst3 &= ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPSRST3_USBPHY2);
> > +     writel(iprst3, rc->base + NPCM_IPSRST3);
> > +
> > +     udelay(50);
> > +
> > +     /* set USB PHY RS bit */
> > +     regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
> > +                        NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
> > +     regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
> > +                        NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
> > +
> > +     /* deassert reset USB devices*/
> > +     iprst1 &= ~ipsrst1_bits;
> > +     iprst2 &= ~ipsrst2_bits;
> > +     iprst3 &= ~ipsrst3_bits;
> > +
> > +     writel(iprst1, rc->base + NPCM_IPSRST1);
> > +     writel(iprst2, rc->base + NPCM_IPSRST2);
> > +     writel(iprst3, rc->base + NPCM_IPSRST3);
> > +
> > +     return 0;
> > +}
> > +
> > +static int npcm_reset_xlate(struct reset_controller_dev *rcdev,
> > +                         const struct of_phandle_args *reset_spec)
> > +{
> > +     unsigned int offset, bit;
> > +
> > +     offset = reset_spec->args[0];
>
> Return -EINVAL if offset is not one of 0x20, 0x24, or 0x34?

> +     bit = reset_spec->args[1];
>
> Return -EINVAL if bit >= NPCM_RC_RESETS_PER_REG?
>
> > +
> > +     return (offset << 8) | bit;
> > +}
> > +
> > +static const struct reset_control_ops npcm_rc_ops = {
> > +     .assert         = npcm_rc_assert,
> > +     .deassert       = npcm_rc_deassert,
> > +     .status         = npcm_rc_status,
> > +};
> > +
> > +static int npcm_rc_probe(struct platform_device *pdev)
> > +{
> > +     struct npcm_rc_data *rc;
> > +     int ret;
> > +
> > +     rc = devm_kzalloc(&pdev->dev, sizeof(*rc), GFP_KERNEL);
> > +     if (!rc)
> > +             return -ENOMEM;
> > +
> > +     rc->base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(rc->base))
> > +             return PTR_ERR(rc->base);
> > +
> > +     spin_lock_init(&rc->lock);
> > +
> > +     rc->rcdev.owner = THIS_MODULE;
> > +     rc->rcdev.nr_resets = NPCM_RC_RESETS_PER_REG;
>
> This is not necessary since of_xlate is replaced with a custom version.
>
> > +     rc->rcdev.ops = &npcm_rc_ops;
> > +     rc->rcdev.of_node = pdev->dev.of_node;
> > +     rc->rcdev.of_reset_n_cells = 2;
> > +     rc->rcdev.of_xlate = npcm_reset_xlate;
> > +
> > +     platform_set_drvdata(pdev, rc);
> > +
> > +     ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "unable to register device\n");
> > +             return ret;
> > +     }
> > +
> > +     if (npcm_usb_reset(pdev, rc))
> > +             dev_warn(&pdev->dev, "NPCM USB reset failed, can cause
> issues with UDC and USB host\n");
> > +
> > +     if (!of_property_read_u32(pdev->dev.of_node,
> "nuvoton,sw-reset-number",
> > +                               &rc->sw_reset_number)) {
> > +             if (rc->sw_reset_number && rc->sw_reset_number < 5) {
> > +                     rc->restart_nb.priority = 192,
> > +                     rc->restart_nb.notifier_call = npcm_rc_restart,
> > +                     ret = register_restart_handler(&rc->restart_nb);
> > +                     if (ret)
> > +                             dev_warn(&pdev->dev, "failed to register
> restart handler\n");
> > +             }
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct of_device_id npcm_rc_match[] = {
> > +     { .compatible = "nuvoton,npcm750-reset" },
> > +     { }
> > +};
> > +
> > +static struct platform_driver npcm_rc_driver = {
> > +     .probe  = npcm_rc_probe,
> > +     .driver = {
> > +             .name                   = "npcm-reset",
> > +             .of_match_table         = npcm_rc_match,
> > +             .suppress_bind_attrs    = true,
> > +     },
> > +};
> > +builtin_platform_driver(npcm_rc_driver);
>
> regards
> Philipp
>
>
Thanks a lot

Tomer

--00000000000094e3e40596ab8436
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Philipp,<div><br></div><div>Thank=
s a lot for your comments</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 6 Nov 2019 at 12:39, Philipp Zabel &=
lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengutronix.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Tomer=
,<br>
<br>
On Wed, 2019-11-06 at 11:58 +0200, Tomer Maimon wrote:<br>
&gt; Add Nuvoton NPCM BMC reset controller driver.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/reset/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/reset/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/reset/reset-npcm.c | 281 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 289 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/reset/reset-npcm.c<br>
&gt; <br>
&gt; diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig<br>
&gt; index 7b07281aa0ae..9e3eac30e7db 100644<br>
&gt; --- a/drivers/reset/Kconfig<br>
&gt; +++ b/drivers/reset/Kconfig<br>
&gt; @@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the reset driver for Aud=
io Memory Arbiter of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Amlogic&#39;s A113 based SoCs<br>
&gt;=C2=A0 <br>
&gt; +config RESET_NPCM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;NPCM BMC Reset Driver&quot; if COMPILE=
_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default ARCH_NPCM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the reset controller driver f=
or Nuvoton NPCM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BMC SoCs.<br>
&gt; +<br>
&gt;=C2=A0 config RESET_OXNAS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile<br>
&gt; index cf60ce526064..00767c03f5f2 100644<br>
&gt; --- a/drivers/reset/Makefile<br>
&gt; +++ b/drivers/reset/Makefile<br>
&gt; @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LANTIQ) +=3D reset-lantiq.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_LPC18XX) +=3D reset-lpc18xx.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_MESON) +=3D reset-meson.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) +=3D reset-meson-audio-arb.o=
<br>
&gt; +obj-$(CONFIG_RESET_NPCM) +=3D reset-npcm.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_OXNAS) +=3D reset-oxnas.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_PISTACHIO) +=3D reset-pistachio.o<br>
&gt;=C2=A0 obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o<br>
&gt; diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000000..ad09d466d7f9<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/reset/reset-npcm.c<br>
&gt; @@ -0,0 +1,281 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; +<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/err.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/init.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/reboot.h&gt;<br>
&gt; +#include &lt;linux/reset-controller.h&gt;<br>
&gt; +#include &lt;linux/spinlock.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +<br>
&gt; +/* NPCM7xx GCR registers */<br>
&gt; +#define NPCM_MDLR_OFFSET=C2=A0 =C2=A0 =C2=A00x7C<br>
&gt; +#define NPCM_MDLR_USBD0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(9)<br>
&gt; +#define NPCM_MDLR_USBD1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BIT(8)<br>
&gt; +#define NPCM_MDLR_USBD2_4=C2=A0 =C2=A0 BIT(21)<br>
&gt; +#define NPCM_MDLR_USBD5_9=C2=A0 =C2=A0 BIT(22)<br>
&gt; +<br>
&gt; +#define NPCM_USB1PHYCTL_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A00x140<br>
&gt; +#define NPCM_USB2PHYCTL_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A00x144<br>
&gt; +#define NPCM_USBXPHYCTL_RS=C2=A0 =C2=A0BIT(28)<br>
&gt; +<br>
&gt; +/* NPCM7xx Reset registers */<br>
&gt; +#define NPCM_SWRSTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x14<br>
&gt; +#define NPCM_SWRST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(2)<br>
&gt; +<br>
&gt; +#define NPCM_IPSRST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x20<br>
&gt; +#define NPCM_IPSRST1_USBD1=C2=A0 =C2=A0BIT(5)<br>
&gt; +#define NPCM_IPSRST1_USBD2=C2=A0 =C2=A0BIT(8)<br>
&gt; +#define NPCM_IPSRST1_USBD3=C2=A0 =C2=A0BIT(25)<br>
&gt; +#define NPCM_IPSRST1_USBD4=C2=A0 =C2=A0BIT(22)<br>
&gt; +#define NPCM_IPSRST1_USBD5=C2=A0 =C2=A0BIT(23)<br>
&gt; +#define NPCM_IPSRST1_USBD6=C2=A0 =C2=A0BIT(24)<br>
&gt; +<br>
&gt; +#define NPCM_IPSRST2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x24<br>
&gt; +#define NPCM_IPSRST2_USB_HOST=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(26)<br>
&gt; +<br>
&gt; +#define NPCM_IPSRST3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x34<br>
&gt; +#define NPCM_IPSRST3_USBD0=C2=A0 =C2=A0BIT(4)<br>
&gt; +#define NPCM_IPSRST3_USBD7=C2=A0 =C2=A0BIT(5)<br>
&gt; +#define NPCM_IPSRST3_USBD8=C2=A0 =C2=A0BIT(6)<br>
&gt; +#define NPCM_IPSRST3_USBD9=C2=A0 =C2=A0BIT(7)<br>
&gt; +#define NPCM_IPSRST3_USBPHY1 BIT(24)<br>
&gt; +#define NPCM_IPSRST3_USBPHY2 BIT(25)<br>
&gt; +<br>
&gt; +#define NPCM_RC_RESETS_PER_REG=C2=A0 =C2=A0 =C2=A0 =C2=A032<br>
&gt; +#define NPCM_MASK_RESETS=C2=A0 =C2=A0 =C2=A0GENMASK(4, 0)<br>
&gt; +<br>
&gt; +struct npcm_rc_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reset_controller_dev rcdev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct notifier_block restart_nb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 sw_reset_number;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spinlock_t lock;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)<br>
&gt; +<br>
&gt; +static int npcm_rc_restart(struct notifier_block *nb, unsigned long m=
ode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 void *cmd)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rc_data *rc =3D container_of(nb, stru=
ct npcm_rc_data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 restart_nb);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(NPCM_SWRST &lt;&lt; rc-&gt;sw_reset_number=
, rc-&gt;base + NPCM_SWRSTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mdelay(1000);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_emerg(&quot;%s: unable to restart system\n&quo=
t;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return NOTIFY_DONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rc_setclear_reset(struct reset_controller_dev *rcdev,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long id, bool set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rc_data *rc =3D to_rc_data(rcdev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int rst_bit =3D BIT(id &amp; NPCM_MASK_R=
ESETS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int ctrl_offset =3D id &gt;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 stat;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;rc-&gt;lock, flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stat =3D readl(rc-&gt;base + ctrl_offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (set)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(stat | rst_bit=
, rc-&gt;base + ctrl_offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(stat &amp; ~rs=
t_bit, rc-&gt;base + ctrl_offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;rc-&gt;lock, flags);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rc_assert(struct reset_controller_dev *rcdev, unsigne=
d long id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return npcm_rc_setclear_reset(rcdev, id, true);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rc_deassert(struct reset_controller_dev *rcdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0unsigned long id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return npcm_rc_setclear_reset(rcdev, id, false);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_rc_status(struct reset_controller_dev *rcdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0unsigned long id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rc_data *rc =3D to_rc_data(rcdev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int rst_bit =3D BIT(id &amp; NPCM_MASK_R=
ESETS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int ctrl_offset =3D id &gt;&gt; 8;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (readl(rc-&gt;base + ctrl_offset) &amp; rs=
t_bit);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + *=C2=A0 The following procedure should be observed in USB PHY, USB d=
evice and<br>
&gt; + *=C2=A0 USB host initialization at BMC boot<br>
&gt; + */<br>
&gt; +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_r=
c_data *rc)<br>
<br>
Is this npcm750 specific? If so, you could call it npcm750_usb_reset and<br=
>
only call it if the compatible matches.</blockquote><div>No, we will need i=
t also in future BMC&#39;s=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mdlr, iprst1, iprst2, iprst3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst1_bits =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst2_bits =3D NPCM_IPSRST2_USB_HOST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst3_bits =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(np, &quot;nuvoton,npc=
m750-reset&quot;)) {<br>
<br>
Better use of_match_device(). Also see above, I think this check could<br>
be done in probe() already?<br></blockquote><div>I will use=C2=A0 of_match_=
device. because the nuvoton,npcm750-reset used only at npcm_usb_reset and i=
n the next BMC version we will need to get other=C2=A0</div><div>reset devi=
ce I prefer to leave it the=C2=A0

npcm_usb_reset function, is it O.K?</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcr_regmap =3D syscon=
_regmap_lookup_by_compatible(&quot;nuvoton,npcm750-gcr&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gcr_regmap=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Failed to find nuvoton,npcm750-gcr\=
n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return PTR_ERR(gcr_regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!gcr_regmap)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* checking which USB device is enabled */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &amp;md=
lr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(mdlr &amp; NPCM_MDLR_USBD0))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipsrst3_bits |=3D NPC=
M_IPSRST3_USBD0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(mdlr &amp; NPCM_MDLR_USBD1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipsrst1_bits |=3D NPC=
M_IPSRST1_USBD1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(mdlr &amp; NPCM_MDLR_USBD2_4))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipsrst1_bits |=3D (NP=
CM_IPSRST1_USBD2 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST1_USBD3 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST1_USBD4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(mdlr &amp; NPCM_MDLR_USBD0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipsrst1_bits |=3D (NP=
CM_IPSRST1_USBD5 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST1_USBD6);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipsrst3_bits |=3D (NP=
CM_IPSRST3_USBD7 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST3_USBD8 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST3_USBD9);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* assert reset USB PHY and USB devices */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst1 =3D readl(rc-&gt;base + NPCM_IPSRST1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst2 =3D readl(rc-&gt;base + NPCM_IPSRST2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst3 =3D readl(rc-&gt;base + NPCM_IPSRST3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst1 |=3D ipsrst1_bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst2 |=3D ipsrst2_bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst3 |=3D (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 =
|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_IPSRST3_=
USBPHY2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst1, rc-&gt;base + NPCM_IPSRST1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst2, rc-&gt;base + NPCM_IPSRST2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst3, rc-&gt;base + NPCM_IPSRST3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* clear USB PHY RS bit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OF=
FSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NPCM_USBXPHYCTL_RS, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OF=
FSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NPCM_USBXPHYCTL_RS, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* deassert reset USB PHY */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst3 &amp;=3D ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPS=
RST3_USBPHY2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst3, rc-&gt;base + NPCM_IPSRST3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0udelay(50);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* set USB PHY RS bit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OF=
FSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OF=
FSET,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* deassert reset USB devices*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst1 &amp;=3D ~ipsrst1_bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst2 &amp;=3D ~ipsrst2_bits;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iprst3 &amp;=3D ~ipsrst3_bits;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst1, rc-&gt;base + NPCM_IPSRST1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst2, rc-&gt;base + NPCM_IPSRST2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(iprst3, rc-&gt;base + NPCM_IPSRST3);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int npcm_reset_xlate(struct reset_controller_dev *rcdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0const struct of_phandle_args *reset_spec)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int offset, bit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D reset_spec-&gt;args[0];<br>
<br>
Return -EINVAL if offset is not one of 0x20, 0x24, or 0x34?=C2=A0</blockquo=
te><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0bit =3D reset_spec-&gt;args[1];<br>
<br>
Return -EINVAL if bit &gt;=3D NPCM_RC_RESETS_PER_REG?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (offset &lt;&lt; 8) | bit;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct reset_control_ops npcm_rc_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.assert=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm=
_rc_assert,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.deassert=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm_rc_d=
eassert,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.status=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm=
_rc_status,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int npcm_rc_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm_rc_data *rc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*rc=
), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;base =3D devm_platform_ioremap_resource(pd=
ev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(rc-&gt;base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(rc-&gt=
;base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;rc-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.owner =3D THIS_MODULE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.nr_resets =3D NPCM_RC_RESETS_PER_REG=
;<br>
<br>
This is not necessary since of_xlate is replaced with a custom version.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.ops =3D &amp;npcm_rc_ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.of_node =3D pdev-&gt;dev.of_node;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.of_reset_n_cells =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.of_xlate =3D npcm_reset_xlate;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, rc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_reset_controller_register(&amp;pdev-=
&gt;dev, &amp;rc-&gt;rcdev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;unable to register device\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (npcm_usb_reset(pdev, rc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-&g=
t;dev, &quot;NPCM USB reset failed, can cause issues with UDC and USB host\=
n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!of_property_read_u32(pdev-&gt;dev.of_node, &=
quot;nuvoton,sw-reset-number&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;rc-&gt;sw_reset_number)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc-&gt;sw_reset_n=
umber &amp;&amp; rc-&gt;sw_reset_number &lt; 5) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rc-&gt;restart_nb.priority =3D 192,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rc-&gt;restart_nb.notifier_call =3D npcm_rc_restart,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret =3D register_restart_handler(&amp;rc-&gt;restart_nb);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(&amp;pdev-&gt;dev, &quot;failed=
 to register restart handler\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id npcm_rc_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,npcm750-reset&quo=
t; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct platform_driver npcm_rc_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =3D npcm_rc_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;npcm-reset=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D npcm_rc_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.suppress_bind_attrs=
=C2=A0 =C2=A0 =3D true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +builtin_platform_driver(npcm_rc_driver);<br>
<br>
regards<br>
Philipp<br>
<br></blockquote><div><br></div><div>Thanks a lot</div><div><br></div><div>=
Tomer=C2=A0</div></div></div>

--00000000000094e3e40596ab8436--
