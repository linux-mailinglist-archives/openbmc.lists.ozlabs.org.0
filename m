Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008CEB23F
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 15:13:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473nP20HNHzF5ng
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 01:13:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b0MJFixe"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nNG4lv0zF5R6
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 01:13:02 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id t8so5495015otl.6
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kwGz9eM3JXenSRdLtAAHnevUEPAIMbSgiGIQEyNukyM=;
 b=b0MJFixeSI7C9rY6IEMPpsvzhae0fCZPSQtwR9LlknT0d+2EyZqIxOIHBsrLOweUOu
 O5kYbn14tj+fhB1sQpHJKW8DMRlH3xERQ5w40nLvqjoYAiB/szv5Ff/L/3ZpNuJzaxty
 MV1EcGpSJMmhh2eeJ3ZjM+ysH+5KXAXG2Hfp94M4hiGrJxDyfeWyBgnJ5+Z5Izmguhj/
 6Ul5UNq3jU2m3+deYbsJV58lUvwYThhbol8iCi7Y9chKccnyIYzWNxiNHkVL2GYRAyym
 wD33i6ehybqm3tyeh79OvU+g7/MnpMjQGR6TnRxHQFX6jAhin7OWCC/p+lP6OTfNRVBh
 EOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwGz9eM3JXenSRdLtAAHnevUEPAIMbSgiGIQEyNukyM=;
 b=nPoaaGlWLwYViHEvaZaXx03vfe9lbfe/Yx1NVAr+Ar+51u6I54wevS7I+jK0nElMbA
 ltwnRVcVIDiuz/9Tt4UMavFRtQyXx97qsaoRJoog2t5ICcLyGMF18GYRhfprtYMXCjBH
 RCcuuyx/ceh0CIyQdzjwC4SWyidTGAozlwQmH7Pt0Ri8G9gV9ZQ8oSzc+0KuCnrriL2D
 IPs4IaW2F+5qaPvPayXRWWrUHdHB6leTLUPMqtKTvrdl+mpo+JbmoqpSmBq+iYTqlZ5j
 hqhNJdM321MHu0Z9nVWWJCPx38E5cnk/r81i7LvG4bVsl2R/emtiUGkp8V/NlMsw987Y
 WEwg==
X-Gm-Message-State: APjAAAWUj75G6XF4T1cQaICKBe5vU9ESn8k2z31BzprdvmrcFKHeVELD
 K/aehVBIw8S2uhPxq29GfNlSYjTtKAc/j2FPynaxCA==
X-Google-Smtp-Source: APXvYqxTOD0LddqBpCVjb0+xvXlIwj9bpX8AlzbW9csPp6HciwLxtLUCOB2nM79B5GR2tPqCzMcKzR10krPrZ5PCEuQ=
X-Received: by 2002:a9d:6141:: with SMTP id c1mr4819150otk.117.1572530675861; 
 Thu, 31 Oct 2019 07:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191028155403.134126-1-tmaimon77@gmail.com>
 <20191028155403.134126-4-tmaimon77@gmail.com>
 <f9ccc316d0974d162bee421baaa2c872632cdc5b.camel@pengutronix.de>
In-Reply-To: <f9ccc316d0974d162bee421baaa2c872632cdc5b.camel@pengutronix.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 31 Oct 2019 16:14:17 +0200
Message-ID: <CAP6Zq1hR1zp9ZtPxcEvOG9O_DMYBY4xKuMUoz-4Ua4kXybG=dw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] reset: npcm: add NPCM reset controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: multipart/alternative; boundary="000000000000554ea905963554b8"
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

--000000000000554ea905963554b8
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

Thanks a lot for your comments.

On Tue, 29 Oct 2019 at 17:34, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:
> > Add Nuvoton NPCM BMC reset controller driver.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/reset/Kconfig      |   7 +
> >  drivers/reset/Makefile     |   1 +
> >  drivers/reset/reset-npcm.c | 275 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 283 insertions(+)
> >  create mode 100644 drivers/reset/reset-npcm.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 7b07281aa0ae..5dbfdf6d717a 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB
> >         This enables the reset driver for Audio Memory Arbiter of
> >         Amlogic's A113 based SoCs
> >
> > +config RESET_NPCM
> > +     bool "NPCM BMC Reset Driver"
> > +     depends on ARCH_NPCM || COMPILE_TEST
> > +     help
> > +       This enables the reset controller driver for Nuvoton NPCM
> > +       BMC SoCs.
> > +
>
> Is there any reason to ever disable this driver when building ARCH_NPCM?
>
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
> > index 000000000000..ebb3071767e1
> > --- /dev/null
> > +++ b/drivers/reset/reset-npcm.c
> > @@ -0,0 +1,275 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (c) 2019 Nuvoton Technology corporation.
> > +
> > +#include <linux/clk.h>
>
> Please remove unused header includes.
>
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
> > +     u32 ctrl_offset = NPCM_IPSRST1;
> > +     unsigned long flags;
> > +     u32 stat, rst_bit;
> > +
> > +     ctrl_offset += (id / NPCM_RC_RESETS_PER_REG) * sizeof(u32);
> > +     rst_bit = 1 << (id % NPCM_RC_RESETS_PER_REG);
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
> > +     u32 bit, ctrl_offset = NPCM_IPSRST1;
> > +
> > +     ctrl_offset += (id / NPCM_RC_RESETS_PER_REG) * sizeof(u32);
> > +     bit = 1 << (id % NPCM_RC_RESETS_PER_REG);
> > +
> > +     return (readl(rc->base + ctrl_offset) & bit);
> > +}
> > +
> > +/*
> > + *  The following procedure should be observed in USB PHY, USB device
> and
> > + *  USB host initialization at BMC boot
> > + */
> > +static int npcm_usb_reset(struct platform_device *pdev, struct
> npcm_rc_data *rc)
> > +{
> > +     struct device_node *np = pdev->dev.of_node;
> > +     u32 mdlr, iprst1, iprst2, iprst3;
> > +     struct regmap *gcr_regmap;
> > +     u32 ipsrst1_bits = 0;
> > +     u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
> > +     u32 ipsrst3_bits = 0;
> > +
> > +     if (of_device_is_compatible(np, "nuvoton,npcm750-reset")) {
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
>
> Is there no better place for this, such as USB glue code?

Sorry, I didn't find a proper place to add it in the USB tree.


>
>
> +static const struct reset_control_ops npcm_rc_ops = {
> > +     .assert         = npcm_rc_assert,
> > +     .deassert       = npcm_rc_deassert,
> > +     .status         = npcm_rc_status,
> > +};
> > +
> > +static int npcm_rc_probe(struct platform_device *pdev)
> > +{
> > +     struct npcm_rc_data *rc;
> > +     struct resource res;
> > +     int ret;
> > +
> > +     rc = devm_kzalloc(&pdev->dev, sizeof(*rc), GFP_KERNEL);
> > +     if (!rc)
> > +             return -ENOMEM;
> > +
> > +     of_address_to_resource(pdev->dev.of_node, 0, &res);
> > +     rc->base = devm_ioremap_resource(&pdev->dev, &res);
>
> Can't you just use
>
>         rc->base = devm_platform_ioremap_resource(pdev, 0);
>
> here?
>
> > +     if (IS_ERR(rc->base))
> > +             return PTR_ERR(rc->base);
> > +
> > +     spin_lock_init(&rc->lock);
> > +
> > +     rc->rcdev.owner = THIS_MODULE;
> > +     rc->rcdev.nr_resets = resource_size(&res) / 4 * BITS_PER_LONG;
>
> That doesn't seem right. With the ctrl_offset = NPCM_IPSRST1 in
> npcm_rc_setclear_reset that would allow access beyond the configured
> register range.
>
> > +     rc->rcdev.ops = &npcm_rc_ops;
> > +     rc->rcdev.of_node = pdev->dev.of_node;
> > +
> > +     platform_set_drvdata(pdev, rc);
> > +
> > +     ret = reset_controller_register(&rc->rcdev);
>
>         ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
>
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
> > +     pr_info("NPCM RESET driver probed\n");
>
> It think this is a bit verbose.
>
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
Regards,

Tomer

--000000000000554ea905963554b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philipp,<div><br></div><div>Thanks a l=
ot for your comments.</div><div><br></div><div>On Tue, 29 Oct 2019 at 17:34=
, Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de">p.zabel@pengu=
tronix.de</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Mon, 2019-10-28 at 17:54 +0200=
, Tomer Maimon wrote:<br>
&gt; Add Nuvoton NPCM BMC reset controller driver.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/reset/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/reset/Makefile=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/reset/reset-npcm.c | 275 +++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 3 files changed, 283 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/reset/reset-npcm.c<br>
&gt; <br>
&gt; diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig<br>
&gt; index 7b07281aa0ae..5dbfdf6d717a 100644<br>
&gt; --- a/drivers/reset/Kconfig<br>
&gt; +++ b/drivers/reset/Kconfig<br>
&gt; @@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the reset driver for Aud=
io Memory Arbiter of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Amlogic&#39;s A113 based SoCs<br>
&gt;=C2=A0 <br>
&gt; +config RESET_NPCM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;NPCM BMC Reset Driver&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_NPCM || COMPILE_TEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the reset controller driver f=
or Nuvoton NPCM <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0BMC SoCs.<br>
&gt; +<br>
<br>
Is there any reason to ever disable this driver when building ARCH_NPCM?<br=
>
<br>
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
&gt; index 000000000000..ebb3071767e1<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/reset/reset-npcm.c<br>
&gt; @@ -0,0 +1,275 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +// Copyright (c) 2019 Nuvoton Technology corporation.<br>
&gt; +<br>
&gt; +#include &lt;linux/clk.h&gt;<br>
<br>
Please remove unused header includes.<br>
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ctrl_offset =3D NPCM_IPSRST1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 stat, rst_bit;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl_offset +=3D (id / NPCM_RC_RESETS_PER_REG) * =
sizeof(u32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rst_bit =3D 1 &lt;&lt; (id % NPCM_RC_RESETS_PER_R=
EG);<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bit, ctrl_offset =3D NPCM_IPSRST1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl_offset +=3D (id / NPCM_RC_RESETS_PER_REG) * =
sizeof(u32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bit =3D 1 &lt;&lt; (id % NPCM_RC_RESETS_PER_REG);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (readl(rc-&gt;base + ctrl_offset) &amp; bi=
t);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + *=C2=A0 The following procedure should be observed in USB PHY, USB d=
evice and<br>
&gt; + *=C2=A0 USB host initialization at BMC boot<br>
&gt; + */<br>
&gt; +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_r=
c_data *rc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mdlr, iprst1, iprst2, iprst3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst1_bits =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst2_bits =3D NPCM_IPSRST2_USB_HOST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 ipsrst3_bits =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(np, &quot;nuvoton,npc=
m750-reset&quot;)) {<br>
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
<br>
Is there no better place for this, such as USB glue code?</blockquote><div>=
Sorry, I didn&#39;t find a proper place to add it in the USB tree.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br><=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*rc=
), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_address_to_resource(pdev-&gt;dev.of_node, 0, &=
amp;res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;base =3D devm_ioremap_resource(&amp;pdev-&=
gt;dev, &amp;res);<br>
<br>
Can&#39;t you just use<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc-&gt;base =3D devm_platform_ioremap_resource(=
pdev, 0);<br>
<br>
here?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(rc-&gt;base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(rc-&gt=
;base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;rc-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.owner =3D THIS_MODULE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.nr_resets =3D resource_size(&amp;res=
) / 4 * BITS_PER_LONG;<br>
<br>
That doesn&#39;t seem right. With the ctrl_offset =3D NPCM_IPSRST1 in<br>
npcm_rc_setclear_reset that would allow access beyond the configured<br>
register range.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.ops =3D &amp;npcm_rc_ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc-&gt;rcdev.of_node =3D pdev-&gt;dev.of_node;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, rc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D reset_controller_register(&amp;rc-&gt;rcd=
ev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_reset_controller_register(&amp;pde=
v-&gt;dev, &amp;rc-&gt;rcdev);<br>
<br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0pr_info(&quot;NPCM RESET driver probed\n&quot;);<=
br>
<br>
It think this is a bit verbose.<br>
<br>
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
<br></blockquote><div><br></div><div>Regards,</div><div><br></div><div>Tome=
r=C2=A0</div></div></div>

--000000000000554ea905963554b8--
