Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918A4529ED
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 06:40:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtZdW30hsz2xDV
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 16:39:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZXW5rRwR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZXW5rRwR; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtZd80T9Fz2x9L
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 16:39:37 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id f20so17613100qtb.4
 for <openbmc@lists.ozlabs.org>; Mon, 15 Nov 2021 21:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBDrnGMJNs3E2vXLY31v2mM7LmxvYUSZ4hZiF7w9GxU=;
 b=ZXW5rRwRbSoj1DLRlyqjVoywVVmch3dgZekG4bSa90/+z62fiI5R4aiFA1SPf9BPwy
 vjIAnvVDtgHdrgDxjc72wcfN2vSEAnJlczBq2LrHLm7pg5wFKPOT5np5KGuS5XS/n+8x
 rPOUjJurtmXVbPVHOa6pFxI/nOEzgs10VasYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBDrnGMJNs3E2vXLY31v2mM7LmxvYUSZ4hZiF7w9GxU=;
 b=wdjh5nAlLPOOp39sVRue+TxaxweOWu3b2vZc6hb6YSzIK6eGYB5BdDPCl0Pe5UfJrr
 nhQY808dhAB4qIz3JBjaJdtBVQUr1M3xaz7WZbCP9JJ/61DTcrcjeFq7FzjzEovnator
 M3eCjEebu32bEXVxnu4PMScUn2UhmIJf9T5I0hDD7YNkRg2QqGRYS1HjBZtKUMV5xSm+
 wYsVbrld9wtTxK/fykdffbxYcWkBie+xBzSGt1JfyNpW0cLlSaqLTDkMk62vvDfzbJV8
 fTq7JLr13TuhRZ+qnKUV51WeDC4KD/hSeKdHSlYB9BfB85W6g3uO4dbdhxKWhFqpJ86C
 d1bg==
X-Gm-Message-State: AOAM531JjlfwqckILsCCbDPuRzNVffRIP0gPP+duDoJ/EvnhSAH52HrR
 UJvvgShQrhhuuc85JZibeoW544ZfYTNWyN8MuepYVIDKuBg75g==
X-Google-Smtp-Source: ABdhPJwuS2Klh5Ud/mnyWFGIa4PLguACQOv7t2fzTdZexsv7za7dE542I8KMV8/7Z9T2bAaacgm4ONP/DWmCd8i13mI=
X-Received: by 2002:a05:622a:20b:: with SMTP id
 b11mr4814808qtx.25.1637041174359; 
 Mon, 15 Nov 2021 21:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20211019080608.283324-1-joel@jms.id.au>
 <8d1631a9-710e-c2c3-228c-d9a942e64aa5@molgen.mpg.de>
In-Reply-To: <8d1631a9-710e-c2c3-228c-d9a942e64aa5@molgen.mpg.de>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Nov 2021 05:39:22 +0000
Message-ID: <CACPK8XeDAHVgNObar=ZAOW=gzRhO_33Y-1hvJtF_fbyA2P4O6w@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: aspeed: Add secure boot controller support
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 23 Oct 2021 at 05:15, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Joel,
>
>
> Am 19.10.21 um 10:06 schrieb Joel Stanley:
> > This reads out the status of the secure boot controller and exposes it
> > in sysfs.
>
> Please elaborate, what that secure boot controller is, what ASpeed

ASPEED

> devices support it (code seems to check for AST2600), and where it is
> documented.
>
> > An example on a AST2600A3 QEmu model:
>
> Nit: QEMU
>
> >
> >   # grep . /sys/bus/soc/devices/soc0/*
> >   /sys/bus/soc/devices/soc0/abr_image:0
> >   /sys/bus/soc/devices/soc0/family:AST2600
> >   /sys/bus/soc/devices/soc0/low_security_key:0
> >   /sys/bus/soc/devices/soc0/machine:Rainier 2U
> >   /sys/bus/soc/devices/soc0/otp_protected:0
> >   /sys/bus/soc/devices/soc0/revision:A3
> >   /sys/bus/soc/devices/soc0/secure_boot:1
> >   /sys/bus/soc/devices/soc0/serial_number:888844441234abcd
> >   /sys/bus/soc/devices/soc0/soc_id:05030303
> >   /sys/bus/soc/devices/soc0/uart_boot:1
>
> Can you please paste the full command to start the QEMU virtual machine?

The first hit on my search engine is for the QEMU documentation:

https://qemu.readthedocs.io/en/latest/system/arm/aspeed.html

I think this is sufficant.

>
> Maybe also mention the new log message:
>
>      AST2600 secure boot enabled

Sure.

>
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   arch/arm/boot/dts/aspeed-g6.dtsi    |  5 ++
> >   drivers/soc/aspeed/aspeed-socinfo.c | 71 +++++++++++++++++++++++++++++
> >   2 files changed, 76 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> > index ee171b3364fa..8f947ed47fc5 100644
> > --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> > @@ -384,6 +384,11 @@ adc1: adc@1e6e9100 {
> >                               status = "disabled";
> >                       };
> >
> > +                     sbc: secure-boot-controller@1e6f2000 {
> > +                             compatible = "aspeed,ast2600-sbc";
> > +                             reg = <0x1e6f2000 0x1000>;
> > +                     };
> > +
> >                       gpio0: gpio@1e780000 {
> >                               #gpio-cells = <2>;
> >                               gpio-controller;
> > diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
> > index 1ca140356a08..6fa0c891f3cb 100644
> > --- a/drivers/soc/aspeed/aspeed-socinfo.c
> > +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> > @@ -9,6 +9,8 @@
> >   #include <linux/slab.h>
> >   #include <linux/sys_soc.h>
> >
> > +static u32 security_status;
> > +
> >   static struct {
> >       const char *name;
> >       const u32 id;
> > @@ -74,6 +76,54 @@ static const char *siliconid_to_rev(u32 siliconid)
> >       return "??";
> >   }
> >
> > +#define SEC_STATUS           0x14
> > +#define ABR_IMAGE_SOURCE     BIT(13)
> > +#define OTP_PROTECTED                BIT(8)
> > +#define LOW_SEC_KEY          BIT(7)
> > +#define SECURE_BOOT          BIT(6)
> > +#define UART_BOOT            BIT(5)
> > +
> > +static ssize_t abr_image_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", !!(security_status & ABR_IMAGE_SOURCE));
> > +}
> > +static DEVICE_ATTR_RO(abr_image);
> > +
> > +static ssize_t low_security_key_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", !!(security_status & LOW_SEC_KEY));
> > +}
> > +static DEVICE_ATTR_RO(low_security_key);
> > +
> > +static ssize_t otp_protected_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", !!(security_status & OTP_PROTECTED));
> > +}
> > +static DEVICE_ATTR_RO(otp_protected);
> > +
> > +static ssize_t secure_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", !!(security_status & SECURE_BOOT));
> > +}
> > +static DEVICE_ATTR_RO(secure_boot);
> > +
> > +static ssize_t uart_boot_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +     /* Invert the bit, as 1 is boot from SPI/eMMC */
> > +     return sprintf(buf, "%d\n", !(security_status & UART_BOOT));
> > +}
> > +static DEVICE_ATTR_RO(uart_boot);
> > +
> > +static struct attribute *aspeed_attrs[] = {
> > +     &dev_attr_abr_image.attr,
> > +     &dev_attr_low_security_key.attr,
> > +     &dev_attr_otp_protected.attr,
> > +     &dev_attr_secure_boot.attr,
> > +     &dev_attr_uart_boot.attr,
> > +     NULL,
> > +};
> > +ATTRIBUTE_GROUPS(aspeed);
> > +
> >   static int __init aspeed_socinfo_init(void)
> >   {
> >       struct soc_device_attribute *attrs;
> > @@ -81,6 +131,7 @@ static int __init aspeed_socinfo_init(void)
> >       struct device_node *np;
> >       void __iomem *reg;
> >       bool has_chipid = false;
> > +     bool has_sbe = false;
> >       u32 siliconid;
> >       u32 chipid[2];
> >       const char *machine = NULL;
> > @@ -109,6 +160,20 @@ static int __init aspeed_socinfo_init(void)
> >       }
> >       of_node_put(np);
> >
> > +     /* AST2600 only */
> > +     np = of_find_compatible_node(NULL, NULL, "aspeed,ast2600-sbc");
> > +     if (of_device_is_available(np)) {
> > +             void *base = of_iomap(np, 0);
> > +             if (!base) {
> > +                     of_node_put(np);
> > +                     return -ENODEV;
> > +             }
> > +             security_status = readl(base + SEC_STATUS);
> > +             has_sbe = true;
> > +             iounmap(base);
> > +             of_node_put(np);
> > +     }
> > +
> >       attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> >       if (!attrs)
> >               return -ENODEV;
> > @@ -135,6 +200,9 @@ static int __init aspeed_socinfo_init(void)
> >               attrs->serial_number = kasprintf(GFP_KERNEL, "%08x%08x",
> >                                                chipid[1], chipid[0]);
> >
> > +     if (has_sbe)
> > +             attrs->custom_attr_group = aspeed_groups[0];
> > +
> >       soc_dev = soc_device_register(attrs);
> >       if (IS_ERR(soc_dev)) {
> >               kfree(attrs->soc_id);
> > @@ -148,6 +216,9 @@ static int __init aspeed_socinfo_init(void)
> >                       attrs->revision,
> >                       attrs->soc_id);
> >
> > +     if (has_sbe && (security_status & SECURE_BOOT))
> > +             pr_info("AST2600 secure boot enabled\n");
> > +
>
> Maybe it is more interesting to log, when it is not enabled?

By default the soc will boot without secure boot, and this is not a
problem. It is informative to know that the system has been configured
with secure boot as this indicates the system has it enabled, and has
correctly booted (otherwise you would not see any message).

>
> >       return 0;
> >   }
> >   early_initcall(aspeed_socinfo_init);
> >
>
>
> Kind regards,
>
> Paul
