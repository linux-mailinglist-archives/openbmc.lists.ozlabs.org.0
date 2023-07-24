Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E194D75E9F9
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 05:05:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lQuPvIit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8Q5D4zLYz307K
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 13:05:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lQuPvIit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8Q4b2L6Qz2yFK
	for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2023 13:04:45 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so6168538e87.1
        for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2023 20:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690167878; x=1690772678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ2MvVQVBDrz821hBcvIzcyMAjKw4805uBRZSPiZvGg=;
        b=lQuPvIitM2dCfnVlGx3mUUb3Xmjs8mEZd59L0klxlPqWJd8SQLw3XpFAtb3q5pZfkG
         xP+m6kSQmZaz4BrZbqtyMAZB14WFGJ3tM0aX0tR9XgUnqLd37UL7HmyUn9hnumE8inDw
         XGWzCR32oRjS/bdmMBtaIspTIg2W/rJDc8SAcVpVcyXgFjWt/kP3GN0fiJQD9eLaLn04
         cfAmoLi/3VN8r1BEcRXY4JJLO0bOI3EoR434tNMB5wCZzxlAqRlIi8WuUMvlZmTrkaXF
         uQncBU85XIdqo4HF9rgY4RJgsztEPI3wME5AW8CbUKlR2lu9+croxedcSefMxb/X9R6P
         hfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690167878; x=1690772678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ2MvVQVBDrz821hBcvIzcyMAjKw4805uBRZSPiZvGg=;
        b=XMr7gEXlWWhvUmYh3w7pCJfDXTAvSEo9yHcYKUrBQ8sp0EXJF49X9/r8os1epgwNkt
         R1AJPEqlMsdwa94t9rPfqqoLgKoTNcKldlnBdX90ww/y3dcAdBtOPvBeBzqL1BMhaO+P
         odTB5NvaI1icl3dfrtqP0AAymo9Z+FTk8xp+Wj0UL5WPgTd4PnC3JZe8UJjize77CVVm
         c/UmSjMlKoa33k4ToLdYIAl5clEH4I8f1+TEnrODanhQr/izBcDWBwNpNEgslFmsexCn
         gMBhdUYXbK8JjsEhWGF+eHp9Gi60CkMGE8XU9nhmMoMFaNmt8R3zvqjvIXsClWz3zlTZ
         2V1w==
X-Gm-Message-State: ABy/qLaWg5RIJSt75L9HVzeoBQe8bnubCoBco3SHnOw1DkYFm/PGLXRw
	ch329836LWj3VvoYVrjpxYQVEzcWSMmITmxr22A=
X-Google-Smtp-Source: APBJJlEsdK9hCj5iUCJ0mJLZtXOpVf6Mnmw4QVR+Q30lALkY0wLeGos4SkJeo6+kmPvffN6/+Y5OsJdLoHZkHwFk4KM=
X-Received: by 2002:a05:6512:33d0:b0:4fb:7758:4ec0 with SMTP id
 d16-20020a05651233d000b004fb77584ec0mr4999230lfg.24.1690167877713; Sun, 23
 Jul 2023 20:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230314092311.8924-1-jim.t90615@gmail.com> <20230314092311.8924-2-jim.t90615@gmail.com>
 <519312b6-f28c-7482-21c1-d9628f0295cb@molgen.mpg.de>
In-Reply-To: <519312b6-f28c-7482-21c1-d9628f0295cb@molgen.mpg.de>
From: Jim Liu <jim.t90615@gmail.com>
Date: Mon, 24 Jul 2023 11:04:26 +0800
Message-ID: <CAKUZ0+FGSEgzbK6H_sHaGpP9JnvrLeBRQViqmViR1OVXoVs7vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi  Paul

sorry for reply late.

First, thanks for your review.

the description is as below:

The SGPIO module can be programmed to support from zero (none) to
eight external output ports ,
each with eight output pins (for a total of 64 output pins). The
output ports must be serial-to-parallel devices (such as the HC595 or
a faster equivalent).

The SGPIO can be programmed to accept from zero to eight external
input ports (IXPp), each with eight input pins, supporting a total of
64 input pins. The input ports must be parallel-to-serial devices
(such as the HC165 or a faster equivalent).

you can add hc595 and hc165 ic to get the serial data from BMC and
send serial data to BMC.
This driver can expand  extra gpio pins up to 64 input and 64 output.

i will use jim.t90615@gmail.com this mail to upstream this driver not
company mail.

The driver needs to fix the length of the variables, because the reg
size is one byte.

I will follow your suggestion to modify and upstream again. If you
have any questions please let me know.

Best regards,
Jim

On Tue, Mar 14, 2023 at 7:46=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Jim,
>
>
> Am 14.03.23 um 10:23 schrieb Jim Liu:
> > Add Nuvoton BMC NPCM7xx/NPCM8xx sgpio driver support.
>
> This commit message is too terse for adding over 650 new lines. Please
> elaborate, and mention the datasheet name and revision, and how you
> tested this.
>
> Also, Why is a new driver needed?
>
> > Signed-off-by: Jim Liu <jim.t90615@gmail.com>
>
> Should your company address be used instead?
>
> > ---
> > Changes for v5:
> >     - remove printk
> >     - add descriptive for to_bank
> >     - using "GPL" instead of "GPL v2"
> > Changes for v4:
> >     - followed reviewer suggestion to modify npcm_sgpio_dir_in
> >     - blank line in npcm_sgpio_dir_out
> >     - use int type for dir in npcm_sgpio_get
> >
> > Changes for v3:
> >     - remove return in bank_reg function
> > Changes for v2:
> >     - add prefix
> >     - write the enum values in all capitals
> >     - remove _init in npcm_sgpio_probe
> > ---
> >   drivers/gpio/Kconfig           |   8 +
> >   drivers/gpio/Makefile          |   1 +
> >   drivers/gpio/gpio-npcm-sgpio.c | 648 ++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 657 insertions(+)
> >   create mode 100644 drivers/gpio/gpio-npcm-sgpio.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 13be729710f2..3296eb23245a 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -460,6 +460,14 @@ config GPIO_MXS
> >       select GPIO_GENERIC
> >       select GENERIC_IRQ_CHIP
> >
> > +config GPIO_NPCM_SGPIO
> > +     bool "Nuvoton SGPIO support"
> > +     depends on (ARCH_NPCM || COMPILE_TEST) && OF_GPIO
> > +     select GPIO_GENERIC
> > +     select GPIOLIB_IRQCHIP
> > +     help
> > +       Say Y here to support Nuvoton NPCM7XX/NPCM8XX SGPIO functionali=
ty.
> > +
> >   config GPIO_OCTEON
> >       tristate "Cavium OCTEON GPIO"
> >       depends on CAVIUM_OCTEON_SOC
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index c048ba003367..1cbf21934299 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_MT7621)         +=3D gpio-mt7621.=
o
> >   obj-$(CONFIG_GPIO_MVEBU)            +=3D gpio-mvebu.o
> >   obj-$(CONFIG_GPIO_MXC)                      +=3D gpio-mxc.o
> >   obj-$(CONFIG_GPIO_MXS)                      +=3D gpio-mxs.o
> > +obj-$(CONFIG_GPIO_NPCM_SGPIO)                +=3D gpio-npcm-sgpio.o
> >   obj-$(CONFIG_GPIO_OCTEON)           +=3D gpio-octeon.o
> >   obj-$(CONFIG_GPIO_OMAP)                     +=3D gpio-omap.o
> >   obj-$(CONFIG_GPIO_PALMAS)           +=3D gpio-palmas.o
> > diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sg=
pio.c
> > new file mode 100644
> > index 000000000000..10bab1495a6c
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-npcm-sgpio.c
> > @@ -0,0 +1,648 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NPCM Serial GPIO Driver
> > + *
> > + * Copyright (C) 2021 Nuvoton Technologies
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/hashtable.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/string.h>
> > +
> > +#define MAX_NR_HW_SGPIO                      64
> > +
> > +#define  NPCM_IOXCFG1                                0x2A
> > +#define  NPCM_IOXCFG1_SFT_CLK                GENMASK(3, 0)
> > +#define  NPCM_IOXCFG1_SCLK_POL               BIT(4)
> > +#define  NPCM_IOXCFG1_LDSH_POL               BIT(5)
> > +
> > +#define  NPCM_IOXCTS 0x28
> > +#define  NPCM_IOXCTS_IOXIF_EN BIT(7)
> > +#define  NPCM_IOXCTS_RD_MODE GENMASK(2, 1)
> > +#define  NPCM_IOXCTS_RD_MODE_PERIODIC BIT(2)
> > +#define  NPCM_IOXCTS_RD_MODE_CONTINUOUS GENMASK(2, 1)
> > +
> > +#define  NPCM_IOXCFG2 0x2B
> > +#define  NPCM_IXOEVCFG_MASK 0x3
> > +#define  NPCM_IXOEVCFG_BOTH 0x3
> > +#define  NPCM_IXOEVCFG_FALLING 0x2
> > +#define  NPCM_IXOEVCFG_RISING 0x1
> > +
> > +#define GPIO_BANK(x)    ((x) / 8)
> > +#define GPIO_BIT(x)     ((x) % 8)
> > +
> > +/*
> > + * Select the freqency of shift clock.
>
> frequency
>
> > + * The shift clock is a division of the APB clock.
> > + */
> > +struct npcm_clk_cfg {
> > +     const int *SFT_CLK;
> > +     const u8 *CLK_SEL;
> > +     const u8 cfg_opt;
>
> Why fix the length of the variables? Can=E2=80=99t standard `unsigned int=
` be used?
>
> > +};
> > +
> > +struct npcm_sgpio {
> > +     struct gpio_chip chip;
> > +     struct clk *pclk;
> > +     struct irq_chip intc;
> > +     spinlock_t lock; /*protect event config*/
> > +     void __iomem *base;
> > +     int irq;
> > +     u8 nin_sgpio;
> > +     u8 nout_sgpio;
> > +     u8 in_port;
> > +     u8 out_port;
> > +     u8 int_type[MAX_NR_HW_SGPIO];
> > +};
> > +
> > +struct npcm_sgpio_bank {
> > +     u8 rdata_reg;
> > +     u8 wdata_reg;
> > +     u8 event_config;
> > +     u8 event_status;
> > +};
> > +
> > +enum npcm_sgpio_reg {
> > +     READ_DATA,
> > +     WRITE_DATA,
> > +     EVENT_CFG,
> > +     EVENT_STS,
> > +};
> > +
> > +static const struct npcm_sgpio_bank npcm_sgpio_banks[] =3D {
> > +     {
> > +             .wdata_reg =3D 0x00,
> > +             .rdata_reg =3D 0x08,
> > +             .event_config =3D 0x10,
> > +             .event_status =3D 0x20,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x01,
> > +             .rdata_reg =3D 0x09,
> > +             .event_config =3D 0x12,
> > +             .event_status =3D 0x21,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x02,
> > +             .rdata_reg =3D 0x0a,
> > +             .event_config =3D 0x14,
> > +             .event_status =3D 0x22,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x03,
> > +             .rdata_reg =3D 0x0b,
> > +             .event_config =3D 0x16,
> > +             .event_status =3D 0x23,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x04,
> > +             .rdata_reg =3D 0x0c,
> > +             .event_config =3D 0x18,
> > +             .event_status =3D 0x24,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x05,
> > +             .rdata_reg =3D 0x0d,
> > +             .event_config =3D 0x1a,
> > +             .event_status =3D 0x25,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x06,
> > +             .rdata_reg =3D 0x0e,
> > +             .event_config =3D 0x1c,
> > +             .event_status =3D 0x26,
> > +     },
> > +     {
> > +             .wdata_reg =3D 0x07,
> > +             .rdata_reg =3D 0x0f,
> > +             .event_config =3D 0x1e,
> > +             .event_status =3D 0x27,
> > +     },
> > +
> > +};
> > +
> > +static void __iomem *bank_reg(struct npcm_sgpio *gpio,
> > +                           const struct npcm_sgpio_bank *bank,
> > +                             const enum npcm_sgpio_reg reg)
>
> The alignment looks inconsistent.
>
> > +{
> > +     switch (reg) {
> > +     case READ_DATA:
> > +             return gpio->base + bank->rdata_reg;
> > +     case WRITE_DATA:
> > +             return gpio->base + bank->wdata_reg;
> > +     case EVENT_CFG:
> > +             return gpio->base + bank->event_config;
> > +     case EVENT_STS:
> > +             return gpio->base + bank->event_status;
> > +     default:
> > +             /* acturally if code runs to here, it's an error case */
>
> actually
>
> > +             WARN(1, "Getting here is an error condition\n");
> > +     }
> > +}
> > +
> > +static const struct npcm_sgpio_bank *offset_to_bank(unsigned int offse=
t)
> > +{
> > +     unsigned int bank =3D GPIO_BANK(offset);
> > +
> > +     return &npcm_sgpio_banks[bank];
> > +}
> > +
> > +static void irqd_to_npcm_sgpio_data(struct irq_data *d,
> > +                                 struct npcm_sgpio **gpio,
> > +                                 const struct npcm_sgpio_bank **bank,
> > +                                 u8 *bit, int *offset)
> > +{
> > +     struct npcm_sgpio *internal;
> > +
> > +     *offset =3D irqd_to_hwirq(d);
> > +     internal =3D irq_data_get_irq_chip_data(d);
> > +     WARN_ON(!internal);
> > +
> > +     *gpio =3D internal;
> > +     *offset -=3D internal->nout_sgpio;
> > +     *bank =3D offset_to_bank(*offset);
> > +     *bit =3D GPIO_BIT(*offset);
> > +}
> > +
> > +static int npcm_sgpio_init_port(struct npcm_sgpio *gpio)
> > +{
> > +     u8 in_port, out_port, set_port, reg;
> > +
> > +     in_port =3D gpio->nin_sgpio / 8;
> > +     if (gpio->nin_sgpio % 8 > 0)
> > +             in_port +=3D 1;
> > +
> > +     out_port =3D gpio->nout_sgpio / 8;
> > +     if (gpio->nout_sgpio % 8 > 0)
> > +             out_port +=3D 1;
> > +
> > +     gpio->in_port =3D in_port;
> > +     gpio->out_port =3D out_port;
> > +     set_port =3D ((out_port & 0xf) << 4) | (in_port & 0xf);
> > +     iowrite8(set_port, gpio->base + NPCM_IOXCFG2);
> > +
> > +     reg =3D ioread8(gpio->base + NPCM_IOXCFG2);
> > +
> > +     if (reg =3D=3D set_port)
> > +             return 0;
> > +     else
> > +             return -EINVAL;
>
> As you used a ternary operator below:
>
>      return reg =3D=3D set_port ? 0 : -EINVAL;
>
> > +}
> > +
> > +static int npcm_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset=
)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +
> > +     return offset < gpio->nout_sgpio ? -EINVAL : 0;
> > +}
> > +
> > +static int npcm_sgpio_dir_out(struct gpio_chip *gc, unsigned int offse=
t, int val)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +
> > +     if (offset < gpio->nout_sgpio) {
> > +             gc->set(gc, offset, val);
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int=
 offset)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +
> > +     if (offset < gpio->nout_sgpio)
> > +             return 0;
> > +     return 1;
>
> Could error codes be used here too?
>
> > +}
> > +
> > +static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, =
int val)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +     const struct  npcm_sgpio_bank *bank =3D offset_to_bank(offset);
> > +     void __iomem *addr;
> > +     u8 reg =3D 0;
> > +
> > +     addr =3D bank_reg(gpio, bank, WRITE_DATA);
> > +     reg =3D ioread8(addr);
> > +
> > +     if (val) {
> > +             reg |=3D (val << GPIO_BIT(offset));
> > +             iowrite8(reg, addr);
> > +     } else {
> > +             reg &=3D ~(1 << GPIO_BIT(offset));
> > +             iowrite8(reg, addr);
> > +     }
>
> Looks like Ziowrite8()` could be moved out of the branches.
>
>
> Kind regards,
>
> Paul
>
>
> > +}
> > +
> > +static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +     const struct  npcm_sgpio_bank *bank;
> > +     void __iomem *addr;
> > +     u8 reg;
> > +     int dir;
> > +
> > +     dir =3D npcm_sgpio_get_direction(gc, offset);
> > +     if (dir =3D=3D 0) {
> > +             bank =3D offset_to_bank(offset);
> > +
> > +             addr =3D bank_reg(gpio, bank, WRITE_DATA);
> > +             reg =3D ioread8(addr);
> > +             reg =3D (reg >> GPIO_BIT(offset)) & 0x01;
> > +     } else {
> > +             offset -=3D gpio->nout_sgpio;
> > +             bank =3D offset_to_bank(offset);
> > +
> > +             addr =3D bank_reg(gpio, bank, READ_DATA);
> > +             reg =3D ioread8(addr);
> > +             reg =3D (reg >> GPIO_BIT(offset)) & 0x01;
> > +     }
> > +
> > +     return reg;
> > +}
> > +
> > +static void npcm_sgpio_setup_enable(struct npcm_sgpio *gpio, bool enab=
le)
> > +{
> > +     u8 reg =3D 0;
> > +
> > +     reg =3D ioread8(gpio->base + NPCM_IOXCTS);
> > +     reg =3D reg & ~NPCM_IOXCTS_RD_MODE;
> > +     reg =3D reg | NPCM_IOXCTS_RD_MODE_PERIODIC;
> > +
> > +     if (enable) {
> > +             reg |=3D NPCM_IOXCTS_IOXIF_EN;
> > +             iowrite8(reg, gpio->base + NPCM_IOXCTS);
> > +     } else {
> > +             reg &=3D ~NPCM_IOXCTS_IOXIF_EN;
> > +             iowrite8(reg, gpio->base + NPCM_IOXCTS);
> > +     }
> > +}
> > +
> > +static int npcm_sgpio_setup_clk(struct npcm_sgpio *gpio,
> > +                             const struct npcm_clk_cfg *clk_cfg, u32 s=
gpio_freq)
> > +{
> > +     unsigned long apb_freq;
> > +     u32 sgpio_clk_div;
> > +     u8 tmp;
> > +     int i;
> > +
> > +     apb_freq =3D clk_get_rate(gpio->pclk);
> > +     sgpio_clk_div =3D (apb_freq / sgpio_freq);
> > +     if ((apb_freq % sgpio_freq) !=3D 0)
> > +             sgpio_clk_div +=3D 1;
> > +
> > +     tmp =3D ioread8(gpio->base + NPCM_IOXCFG1) & ~NPCM_IOXCFG1_SFT_CL=
K;
> > +
> > +     for (i =3D 0; i < clk_cfg->cfg_opt; i++) {
> > +             if (sgpio_clk_div >=3D clk_cfg->SFT_CLK[i]) {
> > +                     iowrite8(clk_cfg->CLK_SEL[i] | tmp, gpio->base + =
NPCM_IOXCFG1);
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static void npcm_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
> > +                                        unsigned long *valid_mask, uns=
igned int ngpios)
> > +{
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +     int n =3D gpio->nin_sgpio;
> > +
> > +     /* input GPIOs in the high range */
> > +     bitmap_set(valid_mask, gpio->nout_sgpio, n);
> > +     bitmap_clear(valid_mask, 0, gpio->nout_sgpio);
> > +}
> > +
> > +static void npcm_sgpio_irq_set_mask(struct irq_data *d, bool set)
> > +{
> > +     const struct npcm_sgpio_bank *bank;
> > +     struct npcm_sgpio *gpio;
> > +     unsigned long flags;
> > +     void __iomem *addr;
> > +     int offset;
> > +     u16 reg, type;
> > +     u8 bit;
> > +
> > +     irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +     addr =3D bank_reg(gpio, bank, EVENT_CFG);
> > +
> > +     spin_lock_irqsave(&gpio->lock, flags);
> > +
> > +     npcm_sgpio_setup_enable(gpio, false);
> > +
> > +     reg =3D ioread16(addr);
> > +     if (set) {
> > +             reg &=3D ~(NPCM_IXOEVCFG_MASK << (bit * 2));
> > +     } else {
> > +             type =3D gpio->int_type[offset];
> > +             reg |=3D (type << (bit * 2));
> > +     }
> > +
> > +     iowrite16(reg, addr);
> > +
> > +     npcm_sgpio_setup_enable(gpio, true);
> > +
> > +     addr =3D bank_reg(gpio, bank, EVENT_STS);
> > +     reg =3D ioread8(addr);
> > +     reg |=3D BIT(bit);
> > +     iowrite8(reg, addr);
> > +
> > +     spin_unlock_irqrestore(&gpio->lock, flags);
> > +}
> > +
> > +static void npcm_sgpio_irq_ack(struct irq_data *d)
> > +{
> > +     const struct npcm_sgpio_bank *bank;
> > +     struct npcm_sgpio *gpio;
> > +     unsigned long flags;
> > +     void __iomem *status_addr;
> > +     int offset;
> > +     u8 bit;
> > +
> > +     irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +     status_addr =3D bank_reg(gpio, bank, EVENT_STS);
> > +     spin_lock_irqsave(&gpio->lock, flags);
> > +     iowrite8(BIT(bit), status_addr);
> > +     spin_unlock_irqrestore(&gpio->lock, flags);
> > +}
> > +
> > +static void npcm_sgpio_irq_mask(struct irq_data *d)
> > +{
> > +     npcm_sgpio_irq_set_mask(d, true);
> > +}
> > +
> > +static void npcm_sgpio_irq_unmask(struct irq_data *d)
> > +{
> > +     npcm_sgpio_irq_set_mask(d, false);
> > +}
> > +
> > +static int npcm_sgpio_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +     const struct npcm_sgpio_bank *bank;
> > +     irq_flow_handler_t handler;
> > +     struct npcm_sgpio *gpio;
> > +     unsigned long flags;
> > +     void __iomem *addr;
> > +     int offset;
> > +     u16 reg, val;
> > +     u8 bit;
> > +
> > +     irqd_to_npcm_sgpio_data(d, &gpio, &bank, &bit, &offset);
> > +
> > +     switch (type & IRQ_TYPE_SENSE_MASK) {
> > +     case IRQ_TYPE_EDGE_BOTH:
> > +             val =3D NPCM_IXOEVCFG_BOTH;
> > +             handler =3D handle_edge_irq;
> > +             break;
> > +     case IRQ_TYPE_EDGE_RISING:
> > +             val =3D NPCM_IXOEVCFG_RISING;
> > +             handler =3D handle_edge_irq;
> > +             break;
> > +     case IRQ_TYPE_EDGE_FALLING:
> > +             val =3D NPCM_IXOEVCFG_FALLING;
> > +             handler =3D handle_edge_irq;
> > +             break;
> > +     case IRQ_TYPE_LEVEL_HIGH:
> > +             val =3D NPCM_IXOEVCFG_RISING;
> > +             handler =3D handle_level_irq;
> > +             break;
> > +     case IRQ_TYPE_LEVEL_LOW:
> > +             val =3D NPCM_IXOEVCFG_FALLING;
> > +             handler =3D handle_level_irq;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     gpio->int_type[offset] =3D val;
> > +
> > +     spin_lock_irqsave(&gpio->lock, flags);
> > +     npcm_sgpio_setup_enable(gpio, false);
> > +     addr =3D bank_reg(gpio, bank, EVENT_CFG);
> > +     reg =3D ioread16(addr);
> > +
> > +     reg |=3D (val << (bit * 2));
> > +
> > +     iowrite16(reg, addr);
> > +     npcm_sgpio_setup_enable(gpio, true);
> > +     spin_unlock_irqrestore(&gpio->lock, flags);
> > +
> > +     irq_set_handler_locked(d, handler);
> > +
> > +     return 0;
> > +}
> > +
> > +static void npcm_sgpio_irq_handler(struct irq_desc *desc)
> > +{
> > +     struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
> > +     struct irq_chip *ic =3D irq_desc_get_chip(desc);
> > +     struct npcm_sgpio *gpio =3D gpiochip_get_data(gc);
> > +     unsigned int i, j, girq;
> > +     unsigned long reg;
> > +
> > +     chained_irq_enter(ic, desc);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
> > +             const struct npcm_sgpio_bank *bank =3D &npcm_sgpio_banks[=
i];
> > +
> > +             reg =3D ioread8(bank_reg(gpio, bank, EVENT_STS));
> > +             for_each_set_bit(j, &reg, 8) {
> > +                     girq =3D irq_find_mapping(gc->irq.domain, i * 8 +=
 gpio->nout_sgpio + j);
> > +                     generic_handle_irq(girq);
> > +             }
> > +     }
> > +
> > +     chained_irq_exit(ic, desc);
> > +}
> > +
> > +static int npcm_sgpio_setup_irqs(struct npcm_sgpio *gpio,
> > +                              struct platform_device *pdev)
> > +{
> > +     int rc, i;
> > +     struct gpio_irq_chip *irq;
> > +
> > +     rc =3D platform_get_irq(pdev, 0);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     gpio->irq =3D rc;
> > +
> > +     npcm_sgpio_setup_enable(gpio, false);
> > +
> > +     /* Disable IRQ and clear Interrupt status registers for all SGPIO=
 Pins. */
> > +     for (i =3D 0; i < ARRAY_SIZE(npcm_sgpio_banks); i++) {
> > +             const struct npcm_sgpio_bank *bank =3D &npcm_sgpio_banks[=
i];
> > +
> > +             iowrite16(0x0000, bank_reg(gpio, bank, EVENT_CFG));
> > +             iowrite8(0xff, bank_reg(gpio, bank, EVENT_STS));
> > +     }
> > +
> > +     gpio->intc.name =3D dev_name(&pdev->dev);
> > +     gpio->intc.irq_ack =3D npcm_sgpio_irq_ack;
> > +     gpio->intc.irq_mask =3D npcm_sgpio_irq_mask;
> > +     gpio->intc.irq_unmask =3D npcm_sgpio_irq_unmask;
> > +     gpio->intc.irq_set_type =3D npcm_sgpio_set_type;
> > +
> > +     irq =3D &gpio->chip.irq;
> > +     irq->chip =3D &gpio->intc;
> > +     irq->init_valid_mask =3D npcm_sgpio_irq_init_valid_mask;
> > +     irq->handler =3D handle_bad_irq;
> > +     irq->default_type =3D IRQ_TYPE_NONE;
> > +     irq->parent_handler =3D npcm_sgpio_irq_handler;
> > +     irq->parent_handler_data =3D gpio;
> > +     irq->parents =3D &gpio->irq;
> > +     irq->num_parents =3D 1;
> > +
> > +     return 0;
> > +}
> > +
> > +static const int npcm750_SFT_CLK[] =3D {
> > +             1024, 32, 8, 4, 3, 2,
> > +};
> > +
> > +static const u8 npcm750_CLK_SEL[] =3D {
> > +             0x00, 0x05, 0x07, 0x0C, 0x0D, 0x0E,
> > +};
> > +
> > +static const int npcm845_SFT_CLK[] =3D {
> > +             1024, 32, 16, 8, 4,
> > +};
> > +
> > +static const u8 npcm845_CLK_SEL[] =3D {
> > +             0x00, 0x05, 0x06, 0x07, 0x0C,
> > +};
> > +
> > +static const struct npcm_clk_cfg npcm750_sgpio_pdata =3D {
> > +     .SFT_CLK =3D npcm750_SFT_CLK,
> > +     .CLK_SEL =3D npcm750_CLK_SEL,
> > +     .cfg_opt =3D 6,
> > +};
> > +
> > +static const struct npcm_clk_cfg npcm845_sgpio_pdata =3D {
> > +     .SFT_CLK =3D npcm845_SFT_CLK,
> > +     .CLK_SEL =3D npcm845_CLK_SEL,
> > +     .cfg_opt =3D 5,
> > +};
> > +
> > +static const struct of_device_id npcm_sgpio_of_table[] =3D {
> > +     { .compatible =3D "nuvoton,npcm750-sgpio", .data =3D &npcm750_sgp=
io_pdata, },
> > +     { .compatible =3D "nuvoton,npcm845-sgpio", .data =3D &npcm845_sgp=
io_pdata, },
> > +     {}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, npcm_sgpio_of_table);
> > +
> > +static int npcm_sgpio_probe(struct platform_device *pdev)
> > +{
> > +     struct npcm_sgpio *gpio;
> > +     const struct npcm_clk_cfg *clk_cfg;
> > +     int rc;
> > +     u32 nin_gpios, nout_gpios, sgpio_freq;
> > +
> > +     gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
> > +     if (!gpio)
> > +             return -ENOMEM;
> > +
> > +     gpio->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(gpio->base))
> > +             return PTR_ERR(gpio->base);
> > +
> > +     clk_cfg =3D device_get_match_data(&pdev->dev);
> > +     if (!clk_cfg)
> > +             return -EINVAL;
> > +
> > +     rc =3D device_property_read_u32(&pdev->dev, "nuvoton,input-ngpios=
", &nin_gpios);
> > +     if (rc < 0) {
> > +             dev_err(&pdev->dev, "Could not read ngpios property\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     rc =3D device_property_read_u32(&pdev->dev, "nuvoton,output-ngpio=
s", &nout_gpios);
> > +     if (rc < 0) {
> > +             dev_err(&pdev->dev, "Could not read ngpios property\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     gpio->nin_sgpio =3D nin_gpios;
> > +     gpio->nout_sgpio =3D nout_gpios;
> > +     if (gpio->nin_sgpio > MAX_NR_HW_SGPIO || gpio->nout_sgpio > MAX_N=
R_HW_SGPIO) {
> > +             dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum =
of %d: input: %d output: %d\n",
> > +                     MAX_NR_HW_SGPIO, nin_gpios, nout_gpios);
> > +             return -EINVAL;
> > +     }
> > +
> > +     rc =3D device_property_read_u32(&pdev->dev, "bus-frequency", &sgp=
io_freq);
> > +     if (rc < 0) {
> > +             dev_err(&pdev->dev, "Could not read bus-frequency propert=
y\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     gpio->pclk =3D devm_clk_get(&pdev->dev, NULL);
> > +     if (IS_ERR(gpio->pclk)) {
> > +             dev_err(&pdev->dev, "Could not get pclk\n");
> > +             return PTR_ERR(gpio->pclk);
> > +     }
> > +
> > +     rc =3D npcm_sgpio_setup_clk(gpio, clk_cfg, sgpio_freq);
> > +     if (rc < 0) {
> > +             dev_err(&pdev->dev, "Failed to setup clock\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     spin_lock_init(&gpio->lock);
> > +     gpio->chip.parent =3D &pdev->dev;
> > +     gpio->chip.ngpio =3D gpio->nin_sgpio + gpio->nout_sgpio;
> > +     gpio->chip.direction_input =3D npcm_sgpio_dir_in;
> > +     gpio->chip.direction_output =3D npcm_sgpio_dir_out;
> > +     gpio->chip.get_direction =3D npcm_sgpio_get_direction;
> > +     gpio->chip.request =3D NULL;
> > +     gpio->chip.free =3D NULL;
> > +     gpio->chip.get =3D npcm_sgpio_get;
> > +     gpio->chip.set =3D npcm_sgpio_set;
> > +     gpio->chip.set_config =3D NULL;
> > +     gpio->chip.label =3D dev_name(&pdev->dev);
> > +     gpio->chip.base =3D -1;
> > +
> > +     rc =3D npcm_sgpio_init_port(gpio);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     rc =3D npcm_sgpio_setup_irqs(gpio, pdev);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     rc =3D devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     npcm_sgpio_setup_enable(gpio, true);
> > +     dev_info(&pdev->dev, "NPCM: SGPIO module is ready\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static struct platform_driver npcm_sgpio_driver =3D {
> > +     .driver =3D {
> > +             .name =3D KBUILD_MODNAME,
> > +             .of_match_table =3D npcm_sgpio_of_table,
> > +     },
> > +     .probe  =3D npcm_sgpio_probe,
> > +};
> > +
> > +module_platform_driver(npcm_sgpio_driver);
> > +
> > +MODULE_AUTHOR("Jim Liu <jjliu0@nuvoton.com>");
> > +MODULE_AUTHOR("Joseph Liu <kwliu@nuvoton.com>");
> > +MODULE_DESCRIPTION("Nuvoton NPCM Serial GPIO Driver");
> > +MODULE_LICENSE("GPL");
