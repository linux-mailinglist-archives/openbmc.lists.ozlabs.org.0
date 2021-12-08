Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684947281F
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 11:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCHMg2Y5Pz2ywH
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 21:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FD+kOeM7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FD+kOeM7; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8FDt3SKHz2xF9
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 22:24:28 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id g14so7183357edb.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=BeJTWb00sUvAKequbg1N5rvzKzAuqjFDXEK8kSE1/fg=;
 b=FD+kOeM7UgaocKq993Z9oDGIO+C3lOI8d/eHw3AwSl0inuP5p36qtQFbnIZ4hQ+c9x
 ePY9tmJJLEXCM4pv94fAqt8dcT7ECbHlmqW9MGxh5DNdQ4EtUGPqSnssrBIOd67vc8Ma
 8VT3EfeqXoeecfD7BYC3QhZsFmX1gcurH5wXABZil1HsBGgJyFQmauiMJ8Huhx/jS1F6
 3uuy5D2jXmAviRwDSjPwfZp9CeyyPXJaWDIAagiTjt75r+T1Td0Cs+/9KbTCGuD4Ih24
 coHjZ6F4O3QEUQR+klH4ppy2wv6+ZbIIHXC4hsRUZX32asVBv+5HQanzVi6hAkKFf1Ea
 7qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=BeJTWb00sUvAKequbg1N5rvzKzAuqjFDXEK8kSE1/fg=;
 b=o2o5fDa6lMjwmODd3RunW6tN7EEVrjD9VwugJHILMS4mAbYc0iy99h0/8bgFlYBHf7
 CzyaKYVtNV0x7V+9UjNP1plfR7THnNnW6tIFi5yR9FU1xOgBvR8oX3xdM5eB5F7MkiGt
 9vzbn3/K9XCMILZE9Ts7eZsQPJihZbKKo73QuIufE1aylPaIgL1r0k4Bt7cX1K9LWHa1
 yput5h2dx15CIVsrOrt2v2uk2x6Th/MuSQDLFwz8g426Q3AHfExwkBzO/kAHMipOUaSt
 t1soJbfWG++zqPESAxGKkzLcWLC3fIuEiJQn7qEd6dBnk+OyO0JrqbrByZ19XEFPwUXx
 C5KQ==
X-Gm-Message-State: AOAM5307tsatZZStpt13JbjgDlASbiexOLREifj8PKGTm6qP2o9pzYN3
 zYak2AwOirYlC4MvEyQ/7DcQDIeyXoPPzeQbXGU=
X-Google-Smtp-Source: ABdhPJx8Ofo4HuYpIPDLPQdDRvfNRzt/w7yExXJcV6cVmuAY45IokqPLuff90p/TIUcj+kbUhDkCgLte5EjglKVW7qU=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr7066336ejc.141.1638962659000; 
 Wed, 08 Dec 2021 03:24:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:5d10:0:0:0:0 with HTTP; Wed, 8 Dec 2021 03:24:18
 -0800 (PST)
In-Reply-To: <20211207210823.1975632-6-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Dec 2021 13:24:18 +0200
Message-ID: <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: multipart/alternative; boundary="00000000000017044b05d2a0bbf3"
X-Mailman-Approved-At: Mon, 13 Dec 2021 21:07:47 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000017044b05d2a0bbf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 7, 2021, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et>
wrote:

> This driver is based on the one for NPCM7xx, because the WPCM450 is a
> predecessor of those SoCs. Notable differences:
>
> - WPCM450, the GPIO registers are not organized in multiple banks, but
>   rather placed continually into the same register block. This affects
>   how register offsets are computed.
> - Pinmux nodes can explicitly select GPIO mode, whereas, in the npcm7xx
>   driver, this happens automatically when a GPIO is requested.
>
> Some functionality implemented in the hardware was (for now) left unused
> in the driver, specifically blinking and pull-up/down.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> This patch has a few checkpatch warnings, which are inherited from the
> pinctrl-npcm7xx driver. I decided to ignore those. Specifically:
> (1) WPCM450_GRPS is an unwrapped list; (2) use of -ENOTSUPP is discourage=
d.
>
>
> v2:
> - Adjust to binding change which put each GPIO bank into its own node
> - Use generic GPIO support
> - Make it possible to set pinmux to GPIO explicitly
> - Allow building the driver as a module
> - Fix spelling of "spin lock" in text
> - Include <linux/mod_devicetable.h>
> - Move linux/pinctrl/* headers to the end of the #include block
> - Remove/rework comments and printk messages
> - Switch to fwnode API
> - Remove comma after sentinel {}
> - Use dev_err_probe
> - Improve Kconfig help message
> - Declare for_each_set_bit iterator as unsigned int
> - Use __assign_bit
> - Set parent irq handler in set_irq_type callback
> - Use struct group_desc
> - Don't hide sysfs bind attributes
> - Remove unnecessary check for gpio-controller property
> - Use module_platform_driver()
>
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-6-j.
> neuschaefer@gmx.net/
> ---
>  MAINTAINERS                               |    1 +
>  drivers/pinctrl/Makefile                  |    2 +-
>  drivers/pinctrl/nuvoton/Kconfig           |   18 +
>  drivers/pinctrl/nuvoton/Makefile          |    1 +
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 1134 +++++++++++++++++++++
>  5 files changed, 1155 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eff3edafd8814..56c5c394877e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2352,6 +2352,7 @@ S:        Maintained
>  F:     Documentation/devicetree/bindings/*/*wpcm*
>  F:     arch/arm/boot/dts/nuvoton-wpcm450*
>  F:     arch/arm/mach-npcm/wpcm450.c
> +F:     drivers/*/*/*wpcm*
>  F:     drivers/*/*wpcm*
>
>  ARM/NXP S32G ARCHITECTURE
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 5e63de2ffcf41..823ff12847ed3 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -58,7 +58,7 @@ obj-y                         +=3D freescale/
>  obj-$(CONFIG_X86)              +=3D intel/
>  obj-y                          +=3D mvebu/
>  obj-y                          +=3D nomadik/
> -obj-$(CONFIG_ARCH_NPCM7XX)     +=3D nuvoton/
> +obj-y                          +=3D nuvoton/
>  obj-$(CONFIG_PINCTRL_PXA)      +=3D pxa/
>  obj-$(CONFIG_ARCH_QCOM)                +=3D qcom/
>  obj-$(CONFIG_PINCTRL_RALINK)   +=3D ralink/
> diff --git a/drivers/pinctrl/nuvoton/Kconfig b/drivers/pinctrl/nuvoton/
> Kconfig
> index 48ba0469edda6..6a3c6f2a73f2d 100644
> --- a/drivers/pinctrl/nuvoton/Kconfig
> +++ b/drivers/pinctrl/nuvoton/Kconfig
> @@ -1,4 +1,22 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +
> +config PINCTRL_WPCM450
> +       tristate "Pinctrl and GPIO driver for Nuvoton WPCM450"
> +       depends on ARCH_WPCM450 || COMPILE_TEST
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y or M here to enable pin controller and GPIO support for
> +         the Nuvoton WPCM450 SoC. This is strongly recommended when
> +         building a kernel that will run on this chip.
> +
> +         If this driver is compiled as a module, it will be named
> +         pinctrl-wpcm450.
> +
>  config PINCTRL_NPCM7XX
>         bool "Pinctrl and GPIO driver for Nuvoton NPCM7XX"
>         depends on (ARCH_NPCM7XX || COMPILE_TEST) && OF
> diff --git a/drivers/pinctrl/nuvoton/Makefile b/drivers/pinctrl/nuvoton/
> Makefile
> index 886d00784cef5..9e66f5dc74bfc 100644
> --- a/drivers/pinctrl/nuvoton/Makefile
> +++ b/drivers/pinctrl/nuvoton/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Nuvoton pinctrl support
>
> +obj-$(CONFIG_PINCTRL_WPCM450)  +=3D pinctrl-wpcm450.o
>  obj-$(CONFIG_PINCTRL_NPCM7XX)  +=3D pinctrl-npcm7xx.o
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> new file mode 100644
> index 0000000000000..b1e190e45af93
> --- /dev/null
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -0,0 +1,1134 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2016-2018 Nuvoton Technology corporation.
> +// Copyright (c) 2016, Dell Inc
> +// Copyright (c) 2021 Jonathan Neusch=C3=A4fer
> +//
> +// This driver uses the following registers:
> +// - Pin mux registers, in the GCR (general control registers) block
> +// - GPIO registers, specific to each GPIO bank
> +// - GPIO event (interrupt) registers, located centrally in the GPIO
> register
> +//   block, shared between all GPIO banks
> +
> +#include <linux/device.h>
> +#include <linux/fwnode.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>


+ blank line?


> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "../core.h"
> +
> +/* GCR registers */
> +#define WPCM450_GCR_MFSEL1     0x0C
> +#define WPCM450_GCR_MFSEL2     0x10
> +#define WPCM450_GCR_NONE       0
> +
> +/* GPIO event (interrupt) registers */
> +#define WPCM450_GPEVTYPE       0x00
> +#define WPCM450_GPEVPOL                0x04
> +#define WPCM450_GPEVDBNC       0x08
> +#define WPCM450_GPEVEN         0x0c
> +#define WPCM450_GPEVST         0x10
> +
> +#define WPCM450_NUM_BANKS      8
> +#define WPCM450_NUM_GPIOS      128
> +#define WPCM450_NUM_GPIO_IRQS  4
> +
> +struct wpcm450_pinctrl;
> +
> +struct wpcm450_gpio {
> +       struct wpcm450_pinctrl  *pctrl;
> +       struct gpio_chip        gc;


Making this first speeds up pointer arithmetics by making it no-op at
compile time.


> +       struct irq_chip         irqc;
> +       unsigned int            first_irq_bit;
> +       unsigned int            num_irqs;
> +       unsigned int            first_irq_gpio;
> +};
> +
> +struct wpcm450_pinctrl {
> +       struct pinctrl_dev      *pctldev;
> +       struct device           *dev;
> +       struct irq_domain       *domain;
> +       struct regmap           *gcr_regmap;
> +       void __iomem            *gpio_base;
> +       struct wpcm450_gpio     gpio_bank[WPCM450_NUM_BANKS];
> +       unsigned long           both_edges;
> +
> +       /*
> +        * This spin lock protects registers and struct wpcm450_pinctrl
> fields
> +        * against concurrent access.
> +        */
> +       spinlock_t              lock;
> +};
> +
> +struct wpcm450_bank {
> +       /* Range of GPIOs in this port */
> +       u8 base;
> +       u8 length;
> +
> +       /* Register offsets (0 =3D register doesn't exist in this port) *=
/
> +       u8 cfg0, cfg1, cfg2;
> +       u8 blink;
> +       u8 dataout, datain;
> +};
> +
> +static const struct wpcm450_bank wpcm450_banks[WPCM450_NUM_BANKS] =3D {
> +       /*  range   cfg0  cfg1  cfg2 blink  out   in  */
> +       {   0, 16,  0x14, 0x18,    0,    0, 0x1c, 0x20 },
> +       {  16, 16,  0x24, 0x28, 0x2c, 0x30, 0x34, 0x38 },
> +       {  32, 16,  0x3c, 0x40, 0x44,    0, 0x48, 0x4c },
> +       {  48, 16,  0x50, 0x54, 0x58,    0, 0x5c, 0x60 },
> +       {  64, 16,  0x64, 0x68, 0x6c,    0, 0x70, 0x74 },
> +       {  80, 16,  0x78, 0x7c, 0x80,    0, 0x84, 0x88 },
> +       {  96, 18,     0,    0,    0,    0,    0, 0x8c },
> +       { 114, 14,  0x90, 0x94, 0x98,    0, 0x9c, 0xa0 },
> +};
> +
> +static int wpcm450_gpio_irq_bitnum(struct wpcm450_gpio *gpio, struct
> irq_data *d)
> +{
> +       int hwirq =3D irqd_to_hwirq(d);
> +
> +       if (hwirq < gpio->first_irq_gpio)
> +               return -EINVAL;
> +
> +       if (hwirq - gpio->first_irq_gpio >=3D gpio->num_irqs)
> +               return -EINVAL;
> +
> +       return hwirq - gpio->first_irq_gpio + gpio->first_irq_bit;
> +}
> +
> +static int wpcm450_irq_bitnum_to_gpio(struct wpcm450_gpio *gpio, int
> bitnum)
> +{
> +       if (bitnum < gpio->first_irq_bit)
> +               return -EINVAL;
> +
> +       if (bitnum - gpio->first_irq_bit > gpio->num_irqs)
> +               return -EINVAL;
> +
> +       return bitnum - gpio->first_irq_bit + gpio->first_irq_gpio;
> +}
>


Have you chance to look at bitmap_remap() and bitmap_bitremap() APIs? I=E2=
=80=99m
pretty sure you can make this all cleaner by switching to those calls and
represent the GPIOs as continuous bitmap on the Linux side while on the
hardware it will be sparse. Check gpio-Xilinx for the details of use.


> +static void wpcm450_gpio_irq_ack(struct irq_data *d)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_
> get_irq_chip_data(d));
> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       unsigned long flags;
> +       int bit;
> +
> +       bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
> +       if (bit < 0)
> +               return;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       iowrite32(BIT(bit), pctrl->gpio_base + WPCM450_GPEVST);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +static void wpcm450_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_
> get_irq_chip_data(d));
> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       unsigned long flags;
> +       unsigned long even;
> +       int bit;
> +
> +       bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
> +       if (bit < 0)
> +               return;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       even =3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
> +       __assign_bit(bit, &even, 0);
> +       iowrite32(even, pctrl->gpio_base + WPCM450_GPEVEN);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +static void wpcm450_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_
> get_irq_chip_data(d));
> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       unsigned long flags;
> +       unsigned long even;
> +       int bit;
> +
> +       bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
> +       if (bit < 0)
> +               return;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       even =3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
> +       __assign_bit(bit, &even, 1);
> +       iowrite32(even, pctrl->gpio_base + WPCM450_GPEVEN);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +static void wpcm450_gpio_fix_evpol(struct wpcm450_gpio *gpio, unsigned
> long all)
> +{



What is this quirk (?) for? Please add a comment.


> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       unsigned long flags;
> +       unsigned int bit;
> +
> +       for_each_set_bit(bit, &all, 32) {
> +               int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
> +               unsigned long evpol;
> +               int level;
> +
> +               spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
> +               do {
> +                       evpol =3D ioread32(pctrl->gpio_base +
> WPCM450_GPEVPOL);
> +                       level =3D gpio->gc.get(&gpio->gc, offset);
> +
> +                       /* Switch event polarity to the opposite of the
> current level */
> +                       __assign_bit(bit, &evpol, !level);
> +
> +                       iowrite32(evpol, pctrl->gpio_base +
> WPCM450_GPEVPOL);
> +               } while (gpio->gc.get(&gpio->gc, offset) !=3D level);
> +               spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
> +       }
> +}
> +
> +static int wpcm450_gpio_set_irq_type(struct irq_data *d, unsigned int
> flow_type)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_
> get_irq_chip_data(d));
> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       unsigned long evtype, evpol;
> +       unsigned long flags;
> +       int ret =3D 0;
> +       int bit;
> +
> +       bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
> +       if (bit < 0)
> +               return bit;
> +
> +       irq_set_handler_locked(d, handle_level_irq);
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       evtype =3D ioread32(pctrl->gpio_base + WPCM450_GPEVTYPE);
> +       evpol =3D ioread32(pctrl->gpio_base + WPCM450_GPEVPOL);
> +       __assign_bit(bit, &pctrl->both_edges, 0);
> +       switch (flow_type) {
> +       case IRQ_TYPE_LEVEL_LOW:
> +               __assign_bit(bit, &evtype, 1);
> +               __assign_bit(bit, &evpol, 0);
> +               break;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               __assign_bit(bit, &evtype, 1);
> +               __assign_bit(bit, &evpol, 1);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               __assign_bit(bit, &evtype, 0);
> +               __assign_bit(bit, &evpol, 0);
> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               __assign_bit(bit, &evtype, 0);
> +               __assign_bit(bit, &evpol, 1);
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               __assign_bit(bit, &evtype, 0);
> +               __assign_bit(bit, &pctrl->both_edges, 1);
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +       }
> +       iowrite32(evtype, pctrl->gpio_base + WPCM450_GPEVTYPE);
> +       iowrite32(evpol, pctrl->gpio_base + WPCM450_GPEVPOL);
> +
> +       /* clear the event status for good measure */
> +       iowrite32(BIT(bit), pctrl->gpio_base + WPCM450_GPEVST);
> +
> +       /* fix event polarity after clearing event status */
> +       wpcm450_gpio_fix_evpol(gpio, BIT(bit));
> +
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +       return ret;
> +}
> +
> +static const struct irq_chip wpcm450_gpio_irqchip =3D {
> +       .name =3D "WPCM450-GPIO-IRQ",
> +       .irq_ack =3D wpcm450_gpio_irq_ack,
> +       .irq_unmask =3D wpcm450_gpio_irq_unmask,
> +       .irq_mask =3D wpcm450_gpio_irq_mask,
> +       .irq_set_type =3D wpcm450_gpio_set_irq_type,
> +};
> +
> +static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_desc_
> get_handler_data(desc));
> +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       unsigned long pending;
> +       unsigned long flags;
> +       unsigned long ours;
> +       unsigned int bit;
> +
> +       ours =3D ((1UL << gpio->num_irqs) - 1) << gpio->first_irq_bit;


BIT()


> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +
> +       pending =3D ioread32(pctrl->gpio_base + WPCM450_GPEVST);
> +       pending &=3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
> +       pending &=3D ours;
> +
> +       if (pending & pctrl->both_edges)
> +               wpcm450_gpio_fix_evpol(gpio, pending & pctrl->both_edges)=
;
> +
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +       chained_irq_enter(chip, desc);
> +       for_each_set_bit(bit, &pending, 32) {
> +               int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
> +               int irq =3D irq_find_mapping(gpio->gc.irq.domain, offset)=
;
> +
> +               generic_handle_irq(irq);


Above two are now represented by another generic IRQ handle call, check
relatively recently updated drivers around.


> +       }
> +       chained_irq_exit(chip, desc);
> +}
> +
> +static int smb0_pins[]  =3D { 115, 114 };
> +static int smb1_pins[]  =3D { 117, 116 };
> +static int smb2_pins[]  =3D { 119, 118 };
> +static int smb3_pins[]  =3D { 30, 31 };
> +static int smb4_pins[]  =3D { 28, 29 };
> +static int smb5_pins[]  =3D { 26, 27 };
> +
> +static int scs1_pins[] =3D { 32 };
> +static int scs2_pins[] =3D { 33 };
> +static int scs3_pins[] =3D { 34 };
> +
> +static int bsp_pins[] =3D { 41, 42 };
> +static int hsp1_pins[] =3D { 43, 44, 45, 46, 47, 61, 62, 63 };
> +static int hsp2_pins[] =3D { 48, 49, 50, 51, 52, 53, 54, 55 };
> +
> +static int r1err_pins[] =3D { 56 };
> +static int r1md_pins[] =3D { 57, 58 };
> +static int rmii2_pins[] =3D { 84, 85, 86, 87, 88, 89 };
> +static int r2err_pins[] =3D { 90 };
> +static int r2md_pins[] =3D { 91, 92 };
> +
> +static int kbcc_pins[] =3D { 94, 93 };
> +static int clko_pins[] =3D { 96 };
> +static int smi_pins[] =3D { 97 };
> +static int uinc_pins[] =3D { 19 };
> +static int mben_pins[] =3D {};
> +
> +static int gspi_pins[] =3D { 12, 13, 14, 15 };
> +static int sspi_pins[] =3D { 12, 13, 14, 15 };
> +
> +static int xcs1_pins[] =3D { 35 };
> +static int xcs2_pins[] =3D { 36 };
> +
> +static int sdio_pins[] =3D { 7, 22, 43, 44, 45, 46, 47, 60 };
> +
> +static int fi0_pins[] =3D { 64 };
> +static int fi1_pins[] =3D { 65 };
> +static int fi2_pins[] =3D { 66 };
> +static int fi3_pins[] =3D { 67 };
> +static int fi4_pins[] =3D { 68 };
> +static int fi5_pins[] =3D { 69 };
> +static int fi6_pins[] =3D { 70 };
> +static int fi7_pins[] =3D { 71 };
> +static int fi8_pins[] =3D { 72 };
> +static int fi9_pins[] =3D { 73 };
> +static int fi10_pins[] =3D { 74 };
> +static int fi11_pins[] =3D { 75 };
> +static int fi12_pins[] =3D { 76 };
> +static int fi13_pins[] =3D { 77 };
> +static int fi14_pins[] =3D { 78 };
> +static int fi15_pins[] =3D { 79 };
> +
> +static int pwm0_pins[] =3D { 80 };
> +static int pwm1_pins[] =3D { 81 };
> +static int pwm2_pins[] =3D { 82 };
> +static int pwm3_pins[] =3D { 83 };
> +static int pwm4_pins[] =3D { 20 };
> +static int pwm5_pins[] =3D { 21 };
> +static int pwm6_pins[] =3D { 16 };
> +static int pwm7_pins[] =3D { 17 };
> +
> +static int hg0_pins[] =3D { 20 };
> +static int hg1_pins[] =3D { 21 };
> +static int hg2_pins[] =3D { 22 };
> +static int hg3_pins[] =3D { 23 };
> +static int hg4_pins[] =3D { 24 };
> +static int hg5_pins[] =3D { 25 };
> +static int hg6_pins[] =3D { 59 };
> +static int hg7_pins[] =3D { 60 };
> +
> +#define WPCM450_GRPS \
> +       WPCM450_GRP(smb3), \
> +       WPCM450_GRP(smb4), \
> +       WPCM450_GRP(smb5), \
> +       WPCM450_GRP(scs1), \
> +       WPCM450_GRP(scs2), \
> +       WPCM450_GRP(scs3), \
> +       WPCM450_GRP(smb0), \
> +       WPCM450_GRP(smb1), \
> +       WPCM450_GRP(smb2), \
> +       WPCM450_GRP(bsp), \
> +       WPCM450_GRP(hsp1), \
> +       WPCM450_GRP(hsp2), \
> +       WPCM450_GRP(r1err), \
> +       WPCM450_GRP(r1md), \
> +       WPCM450_GRP(rmii2), \
> +       WPCM450_GRP(r2err), \
> +       WPCM450_GRP(r2md), \
> +       WPCM450_GRP(kbcc), \
> +       WPCM450_GRP(clko), \
> +       WPCM450_GRP(smi), \
> +       WPCM450_GRP(uinc), \
> +       WPCM450_GRP(gspi), \
> +       WPCM450_GRP(mben), \
> +       WPCM450_GRP(xcs2), \
> +       WPCM450_GRP(xcs1), \
> +       WPCM450_GRP(sdio), \
> +       WPCM450_GRP(sspi), \
> +       WPCM450_GRP(fi0), \
> +       WPCM450_GRP(fi1), \
> +       WPCM450_GRP(fi2), \
> +       WPCM450_GRP(fi3), \
> +       WPCM450_GRP(fi4), \
> +       WPCM450_GRP(fi5), \
> +       WPCM450_GRP(fi6), \
> +       WPCM450_GRP(fi7), \
> +       WPCM450_GRP(fi8), \
> +       WPCM450_GRP(fi9), \
> +       WPCM450_GRP(fi10), \
> +       WPCM450_GRP(fi11), \
> +       WPCM450_GRP(fi12), \
> +       WPCM450_GRP(fi13), \
> +       WPCM450_GRP(fi14), \
> +       WPCM450_GRP(fi15), \
> +       WPCM450_GRP(pwm0), \
> +       WPCM450_GRP(pwm1), \
> +       WPCM450_GRP(pwm2), \
> +       WPCM450_GRP(pwm3), \
> +       WPCM450_GRP(pwm4), \
> +       WPCM450_GRP(pwm5), \
> +       WPCM450_GRP(pwm6), \
> +       WPCM450_GRP(pwm7), \
> +       WPCM450_GRP(hg0), \
> +       WPCM450_GRP(hg1), \
> +       WPCM450_GRP(hg2), \
> +       WPCM450_GRP(hg3), \
> +       WPCM450_GRP(hg4), \
> +       WPCM450_GRP(hg5), \
> +       WPCM450_GRP(hg6), \
> +       WPCM450_GRP(hg7), \
> +
> +enum {
> +#define WPCM450_GRP(x) fn_ ## x
> +       WPCM450_GRPS
> +       /* add placeholder for none/gpio */
> +       WPCM450_GRP(gpio),
> +       WPCM450_GRP(none),
> +#undef WPCM450_GRP
> +};
> +
> +static struct group_desc wpcm450_groups[] =3D {
> +#define WPCM450_GRP(x) { .name =3D #x, .pins =3D x ## _pins, \
> +                       .num_pins =3D ARRAY_SIZE(x ## _pins) }
> +       WPCM450_GRPS
> +#undef WPCM450_GRP
> +};
> +
> +#define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
> +#define WPCM450_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> +#define WPCM450_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm #=
#
> _grp), \
> +                       .groups =3D nm ## _grp }
> +struct wpcm450_func {
> +       const char *name;
> +       const unsigned int ngroups;
> +       const char *const *groups;
> +};
> +
> +WPCM450_SFUNC(smb3);
> +WPCM450_SFUNC(smb4);
> +WPCM450_SFUNC(smb5);
> +WPCM450_SFUNC(scs1);
> +WPCM450_SFUNC(scs2);
> +WPCM450_SFUNC(scs3);
> +WPCM450_SFUNC(smb0);
> +WPCM450_SFUNC(smb1);
> +WPCM450_SFUNC(smb2);
> +WPCM450_SFUNC(bsp);
> +WPCM450_SFUNC(hsp1);
> +WPCM450_SFUNC(hsp2);
> +WPCM450_SFUNC(r1err);
> +WPCM450_SFUNC(r1md);
> +WPCM450_SFUNC(rmii2);
> +WPCM450_SFUNC(r2err);
> +WPCM450_SFUNC(r2md);
> +WPCM450_SFUNC(kbcc);
> +WPCM450_SFUNC(clko);
> +WPCM450_SFUNC(smi);
> +WPCM450_SFUNC(uinc);
> +WPCM450_SFUNC(gspi);
> +WPCM450_SFUNC(mben);
> +WPCM450_SFUNC(xcs2);
> +WPCM450_SFUNC(xcs1);
> +WPCM450_SFUNC(sdio);
> +WPCM450_SFUNC(sspi);
> +WPCM450_SFUNC(fi0);
> +WPCM450_SFUNC(fi1);
> +WPCM450_SFUNC(fi2);
> +WPCM450_SFUNC(fi3);
> +WPCM450_SFUNC(fi4);
> +WPCM450_SFUNC(fi5);
> +WPCM450_SFUNC(fi6);
> +WPCM450_SFUNC(fi7);
> +WPCM450_SFUNC(fi8);
> +WPCM450_SFUNC(fi9);
> +WPCM450_SFUNC(fi10);
> +WPCM450_SFUNC(fi11);
> +WPCM450_SFUNC(fi12);
> +WPCM450_SFUNC(fi13);
> +WPCM450_SFUNC(fi14);
> +WPCM450_SFUNC(fi15);
> +WPCM450_SFUNC(pwm0);
> +WPCM450_SFUNC(pwm1);
> +WPCM450_SFUNC(pwm2);
> +WPCM450_SFUNC(pwm3);
> +WPCM450_SFUNC(pwm4);
> +WPCM450_SFUNC(pwm5);
> +WPCM450_SFUNC(pwm6);
> +WPCM450_SFUNC(pwm7);
> +WPCM450_SFUNC(hg0);
> +WPCM450_SFUNC(hg1);
> +WPCM450_SFUNC(hg2);
> +WPCM450_SFUNC(hg3);
> +WPCM450_SFUNC(hg4);
> +WPCM450_SFUNC(hg5);
> +WPCM450_SFUNC(hg6);
> +WPCM450_SFUNC(hg7);
> +
> +#define WPCM450_GRP(x) #x
> +WPCM450_FUNC(gpio, WPCM450_GRPS);
> +#undef WPCM450_GRP
> +
> +/* Function names */
> +static struct wpcm450_func wpcm450_funcs[] =3D {
> +       WPCM450_MKFUNC(smb3),
> +       WPCM450_MKFUNC(smb4),
> +       WPCM450_MKFUNC(smb5),
> +       WPCM450_MKFUNC(scs1),
> +       WPCM450_MKFUNC(scs2),
> +       WPCM450_MKFUNC(scs3),
> +       WPCM450_MKFUNC(smb0),
> +       WPCM450_MKFUNC(smb1),
> +       WPCM450_MKFUNC(smb2),
> +       WPCM450_MKFUNC(bsp),
> +       WPCM450_MKFUNC(hsp1),
> +       WPCM450_MKFUNC(hsp2),
> +       WPCM450_MKFUNC(r1err),
> +       WPCM450_MKFUNC(r1md),
> +       WPCM450_MKFUNC(rmii2),
> +       WPCM450_MKFUNC(r2err),
> +       WPCM450_MKFUNC(r2md),
> +       WPCM450_MKFUNC(kbcc),
> +       WPCM450_MKFUNC(clko),
> +       WPCM450_MKFUNC(smi),
> +       WPCM450_MKFUNC(uinc),
> +       WPCM450_MKFUNC(gspi),
> +       WPCM450_MKFUNC(mben),
> +       WPCM450_MKFUNC(xcs2),
> +       WPCM450_MKFUNC(xcs1),
> +       WPCM450_MKFUNC(sdio),
> +       WPCM450_MKFUNC(sspi),
> +       WPCM450_MKFUNC(fi0),
> +       WPCM450_MKFUNC(fi1),
> +       WPCM450_MKFUNC(fi2),
> +       WPCM450_MKFUNC(fi3),
> +       WPCM450_MKFUNC(fi4),
> +       WPCM450_MKFUNC(fi5),
> +       WPCM450_MKFUNC(fi6),
> +       WPCM450_MKFUNC(fi7),
> +       WPCM450_MKFUNC(fi8),
> +       WPCM450_MKFUNC(fi9),
> +       WPCM450_MKFUNC(fi10),
> +       WPCM450_MKFUNC(fi11),
> +       WPCM450_MKFUNC(fi12),
> +       WPCM450_MKFUNC(fi13),
> +       WPCM450_MKFUNC(fi14),
> +       WPCM450_MKFUNC(fi15),
> +       WPCM450_MKFUNC(pwm0),
> +       WPCM450_MKFUNC(pwm1),
> +       WPCM450_MKFUNC(pwm2),
> +       WPCM450_MKFUNC(pwm3),
> +       WPCM450_MKFUNC(pwm4),
> +       WPCM450_MKFUNC(pwm5),
> +       WPCM450_MKFUNC(pwm6),
> +       WPCM450_MKFUNC(pwm7),
> +       WPCM450_MKFUNC(hg0),
> +       WPCM450_MKFUNC(hg1),
> +       WPCM450_MKFUNC(hg2),
> +       WPCM450_MKFUNC(hg3),
> +       WPCM450_MKFUNC(hg4),
> +       WPCM450_MKFUNC(hg5),
> +       WPCM450_MKFUNC(hg6),
> +       WPCM450_MKFUNC(hg7),
> +       WPCM450_MKFUNC(gpio),
> +};
> +
> +#define WPCM450_PINCFG(a, b, c, d, e, f, g) \
> +       [a] { .fn0 =3D fn_ ## b, .reg0 =3D WPCM450_GCR_ ## c, .bit0 =3D d=
, \
> +             .fn1 =3D fn_ ## e, .reg1 =3D WPCM450_GCR_ ## f, .bit1 =3D g=
 }
> +
> +struct wpcm450_pincfg {
> +       int fn0, reg0, bit0;
> +       int fn1, reg1, bit1;
> +};
> +
> +static const struct wpcm450_pincfg pincfg[] =3D {
> +       /*              PIN       FUNCTION 1               FUNCTION 2 */
> +       WPCM450_PINCFG(0,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(1,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(2,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(3,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(4,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(5,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(6,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(7,        none, NONE, 0,           sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(8,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(9,        none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(10,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(11,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(12,       gspi, MFSEL1, 24,        sspi, MFSEL1,
> 31),
> +       WPCM450_PINCFG(13,       gspi, MFSEL1, 24,        sspi, MFSEL1,
> 31),
> +       WPCM450_PINCFG(14,       gspi, MFSEL1, 24,        sspi, MFSEL1,
> 31),
> +       WPCM450_PINCFG(15,       gspi, MFSEL1, 24,        sspi, MFSEL1,
> 31),
> +       WPCM450_PINCFG(16,       none, NONE, 0,           pwm6, MFSEL2,
> 22),
> +       WPCM450_PINCFG(17,       none, NONE, 0,           pwm7, MFSEL2,
> 23),
> +       WPCM450_PINCFG(18,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(19,       uinc, MFSEL1, 23,        none, NONE, 0),
> +       WPCM450_PINCFG(20,        hg0, MFSEL2, 24,        pwm4, MFSEL2,
> 20),
> +       WPCM450_PINCFG(21,        hg1, MFSEL2, 25,        pwm5, MFSEL2,
> 21),
> +       WPCM450_PINCFG(22,        hg2, MFSEL2, 26,        none, NONE, 0),
> +       WPCM450_PINCFG(23,        hg3, MFSEL2, 27,        none, NONE, 0),
> +       WPCM450_PINCFG(24,        hg4, MFSEL2, 28,        none, NONE, 0),
> +       WPCM450_PINCFG(25,        hg5, MFSEL2, 29,        none, NONE, 0),
> +       WPCM450_PINCFG(26,       smb5, MFSEL1, 2,         none, NONE, 0),
> +       WPCM450_PINCFG(27,       smb5, MFSEL1, 2,         none, NONE, 0),
> +       WPCM450_PINCFG(28,       smb4, MFSEL1, 1,         none, NONE, 0),
> +       WPCM450_PINCFG(29,       smb4, MFSEL1, 1,         none, NONE, 0),
> +       WPCM450_PINCFG(30,       smb3, MFSEL1, 0,         none, NONE, 0),
> +       WPCM450_PINCFG(31,       smb3, MFSEL1, 0,         none, NONE, 0),
> +
> +       WPCM450_PINCFG(32,       scs1, MFSEL1, 3,         none, NONE, 0),
> +       WPCM450_PINCFG(33,       scs2, MFSEL1, 4,         none, NONE, 0),
> +       WPCM450_PINCFG(34,       scs3, MFSEL1, 5,         none, NONE, 0),
> +       WPCM450_PINCFG(35,       xcs1, MFSEL1, 29,        none, NONE, 0),
> +       WPCM450_PINCFG(36,       xcs2, MFSEL1, 28,        none, NONE, 0),
> +       WPCM450_PINCFG(37,       none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(38,       none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(39,       none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(40,       none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(41,        bsp, MFSEL1, 9,         none, NONE, 0),
> +       WPCM450_PINCFG(42,        bsp, MFSEL1, 9,         none, NONE, 0),
> +       WPCM450_PINCFG(43,       hsp1, MFSEL1, 10,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(44,       hsp1, MFSEL1, 10,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(45,       hsp1, MFSEL1, 10,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(46,       hsp1, MFSEL1, 10,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(47,       hsp1, MFSEL1, 10,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(48,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(49,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(50,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(51,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(52,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(53,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(54,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(55,       hsp2, MFSEL1, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(56,      r1err, MFSEL1, 12,        none, NONE, 0),
> +       WPCM450_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0),
> +       WPCM450_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0),
> +       WPCM450_PINCFG(59,        hg6, MFSEL2, 30,        none, NONE, 0),
> +       WPCM450_PINCFG(60,        hg7, MFSEL2, 31,        sdio, MFSEL1,
> 30),
> +       WPCM450_PINCFG(61,       hsp1, MFSEL1, 10,        none, NONE, 0),
> +       WPCM450_PINCFG(62,       hsp1, MFSEL1, 10,        none, NONE, 0),
> +       WPCM450_PINCFG(63,       hsp1, MFSEL1, 10,        none, NONE, 0),
> +
> +       WPCM450_PINCFG(64,        fi0, MFSEL2, 0,         none, NONE, 0),
> +       WPCM450_PINCFG(65,        fi1, MFSEL2, 1,         none, NONE, 0),
> +       WPCM450_PINCFG(66,        fi2, MFSEL2, 2,         none, NONE, 0),
> +       WPCM450_PINCFG(67,        fi3, MFSEL2, 3,         none, NONE, 0),
> +       WPCM450_PINCFG(68,        fi4, MFSEL2, 4,         none, NONE, 0),
> +       WPCM450_PINCFG(69,        fi5, MFSEL2, 5,         none, NONE, 0),
> +       WPCM450_PINCFG(70,        fi6, MFSEL2, 6,         none, NONE, 0),
> +       WPCM450_PINCFG(71,        fi7, MFSEL2, 7,         none, NONE, 0),
> +       WPCM450_PINCFG(72,        fi8, MFSEL2, 8,         none, NONE, 0),
> +       WPCM450_PINCFG(73,        fi9, MFSEL2, 9,         none, NONE, 0),
> +       WPCM450_PINCFG(74,       fi10, MFSEL2, 10,        none, NONE, 0),
> +       WPCM450_PINCFG(75,       fi11, MFSEL2, 11,        none, NONE, 0),
> +       WPCM450_PINCFG(76,       fi12, MFSEL2, 12,        none, NONE, 0),
> +       WPCM450_PINCFG(77,       fi13, MFSEL2, 13,        none, NONE, 0),
> +       WPCM450_PINCFG(78,       fi14, MFSEL2, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(79,       fi15, MFSEL2, 15,        none, NONE, 0),
> +       WPCM450_PINCFG(80,       pwm0, MFSEL2, 16,        none, NONE, 0),
> +       WPCM450_PINCFG(81,       pwm1, MFSEL2, 17,        none, NONE, 0),
> +       WPCM450_PINCFG(82,       pwm2, MFSEL2, 18,        none, NONE, 0),
> +       WPCM450_PINCFG(83,       pwm3, MFSEL2, 19,        none, NONE, 0),
> +       WPCM450_PINCFG(84,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(85,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(86,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(87,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(88,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(89,      rmii2, MFSEL1, 14,        none, NONE, 0),
> +       WPCM450_PINCFG(90,      r2err, MFSEL1, 15,        none, NONE, 0),
> +       WPCM450_PINCFG(91,       r2md, MFSEL1, 16,        none, NONE, 0),
> +       WPCM450_PINCFG(92,       r2md, MFSEL1, 16,        none, NONE, 0),
> +       WPCM450_PINCFG(93,       kbcc, MFSEL1, 17,        none, NONE, 0),
> +       WPCM450_PINCFG(94,       kbcc, MFSEL1, 17,        none, NONE, 0),
> +       WPCM450_PINCFG(95,       none, NONE, 0,           none, NONE, 0),
> +
> +       WPCM450_PINCFG(96,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(97,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(98,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(99,       none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(100,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(101,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(102,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(103,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(104,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(105,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(106,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(107,      none, NONE, 0,           none, NONE, 0),
> +       WPCM450_PINCFG(108,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(109,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(110,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(111,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(112,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(113,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(114,      smb0, MFSEL1, 6,         none, NONE, 0),
> +       WPCM450_PINCFG(115,      smb0, MFSEL1, 6,         none, NONE, 0),
> +       WPCM450_PINCFG(116,      smb1, MFSEL1, 7,         none, NONE, 0),
> +       WPCM450_PINCFG(117,      smb1, MFSEL1, 7,         none, NONE, 0),
> +       WPCM450_PINCFG(118,      smb2, MFSEL1, 8,         none, NONE, 0),
> +       WPCM450_PINCFG(119,      smb2, MFSEL1, 8,         none, NONE, 0),
> +       WPCM450_PINCFG(120,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(121,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(122,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(123,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(124,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(125,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(126,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +       WPCM450_PINCFG(127,      none, NONE, 0,           none, NONE, 0),
> /* DVO */
> +};
> +
> +#define WPCM450_PIN(n)         PINCTRL_PIN(n, "gpio" #n)
> +
> +static const struct pinctrl_pin_desc wpcm450_pins[] =3D {
> +       WPCM450_PIN(0),   WPCM450_PIN(1),   WPCM450_PIN(2),
>  WPCM450_PIN(3),
> +       WPCM450_PIN(4),   WPCM450_PIN(5),   WPCM450_PIN(6),
>  WPCM450_PIN(7),
> +       WPCM450_PIN(8),   WPCM450_PIN(9),   WPCM450_PIN(10),
> WPCM450_PIN(11),
> +       WPCM450_PIN(12),  WPCM450_PIN(13),  WPCM450_PIN(14),
> WPCM450_PIN(15),
> +       WPCM450_PIN(16),  WPCM450_PIN(17),  WPCM450_PIN(18),
> WPCM450_PIN(19),
> +       WPCM450_PIN(20),  WPCM450_PIN(21),  WPCM450_PIN(22),
> WPCM450_PIN(23),
> +       WPCM450_PIN(24),  WPCM450_PIN(25),  WPCM450_PIN(26),
> WPCM450_PIN(27),
> +       WPCM450_PIN(28),  WPCM450_PIN(29),  WPCM450_PIN(30),
> WPCM450_PIN(31),
> +       WPCM450_PIN(32),  WPCM450_PIN(33),  WPCM450_PIN(34),
> WPCM450_PIN(35),
> +       WPCM450_PIN(36),  WPCM450_PIN(37),  WPCM450_PIN(38),
> WPCM450_PIN(39),
> +       WPCM450_PIN(40),  WPCM450_PIN(41),  WPCM450_PIN(42),
> WPCM450_PIN(43),
> +       WPCM450_PIN(44),  WPCM450_PIN(45),  WPCM450_PIN(46),
> WPCM450_PIN(47),
> +       WPCM450_PIN(48),  WPCM450_PIN(49),  WPCM450_PIN(50),
> WPCM450_PIN(51),
> +       WPCM450_PIN(52),  WPCM450_PIN(53),  WPCM450_PIN(54),
> WPCM450_PIN(55),
> +       WPCM450_PIN(56),  WPCM450_PIN(57),  WPCM450_PIN(58),
> WPCM450_PIN(59),
> +       WPCM450_PIN(60),  WPCM450_PIN(61),  WPCM450_PIN(62),
> WPCM450_PIN(63),
> +       WPCM450_PIN(64),  WPCM450_PIN(65),  WPCM450_PIN(66),
> WPCM450_PIN(67),
> +       WPCM450_PIN(68),  WPCM450_PIN(69),  WPCM450_PIN(70),
> WPCM450_PIN(71),
> +       WPCM450_PIN(72),  WPCM450_PIN(73),  WPCM450_PIN(74),
> WPCM450_PIN(75),
> +       WPCM450_PIN(76),  WPCM450_PIN(77),  WPCM450_PIN(78),
> WPCM450_PIN(79),
> +       WPCM450_PIN(80),  WPCM450_PIN(81),  WPCM450_PIN(82),
> WPCM450_PIN(83),
> +       WPCM450_PIN(84),  WPCM450_PIN(85),  WPCM450_PIN(86),
> WPCM450_PIN(87),
> +       WPCM450_PIN(88),  WPCM450_PIN(89),  WPCM450_PIN(90),
> WPCM450_PIN(91),
> +       WPCM450_PIN(92),  WPCM450_PIN(93),  WPCM450_PIN(94),
> WPCM450_PIN(95),
> +       WPCM450_PIN(96),  WPCM450_PIN(97),  WPCM450_PIN(98),
> WPCM450_PIN(99),
> +       WPCM450_PIN(100), WPCM450_PIN(101), WPCM450_PIN(102),
> WPCM450_PIN(103),
> +       WPCM450_PIN(104), WPCM450_PIN(105), WPCM450_PIN(106),
> WPCM450_PIN(107),
> +       WPCM450_PIN(108), WPCM450_PIN(109), WPCM450_PIN(110),
> WPCM450_PIN(111),
> +       WPCM450_PIN(112), WPCM450_PIN(113), WPCM450_PIN(114),
> WPCM450_PIN(115),
> +       WPCM450_PIN(116), WPCM450_PIN(117), WPCM450_PIN(118),
> WPCM450_PIN(119),
> +       WPCM450_PIN(120), WPCM450_PIN(121), WPCM450_PIN(122),
> WPCM450_PIN(123),
> +       WPCM450_PIN(124), WPCM450_PIN(125), WPCM450_PIN(126),
> WPCM450_PIN(127),
> +};
> +
> +/* Enable mode in pin group */
> +static void wpcm450_setfunc(struct regmap *gcr_regmap, const unsigned in=
t
> *pin,
> +                           int npins, int func)
> +{
> +       const struct wpcm450_pincfg *cfg;
> +       int i;
> +
> +       for (i =3D 0; i < npins; i++) {
> +               cfg =3D &pincfg[pin[i]];
> +               if (func =3D=3D fn_gpio || cfg->fn0 =3D=3D func || cfg->f=
n1 =3D=3D
> func) {
> +                       if (cfg->reg0)
> +                               regmap_update_bits(gcr_regmap, cfg->reg0,
> +                                                  BIT(cfg->bit0),
> +                                                  (cfg->fn0 =3D=3D func)=
 ?
> BIT(cfg->bit0) : 0);
> +                       if (cfg->reg1)
> +                               regmap_update_bits(gcr_regmap, cfg->reg1,
> +                                                  BIT(cfg->bit1),
> +                                                  (cfg->fn1 =3D=3D func)=
 ?
> BIT(cfg->bit1) : 0);
> +               }
> +       }
> +}
> +
> +static int wpcm450_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       return ARRAY_SIZE(wpcm450_groups);
> +}
> +
> +static const char *wpcm450_get_group_name(struct pinctrl_dev *pctldev,
> +                                         unsigned int selector)
> +{
> +       return wpcm450_groups[selector].name;
> +}
> +
> +static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
> +                                 unsigned int selector,
> +                                 const unsigned int **pins,
> +                                 unsigned int *npins)
> +{
> +       *npins =3D wpcm450_groups[selector].num_pins;
> +       *pins  =3D wpcm450_groups[selector].pins;
> +
> +       return 0;
> +}
> +
> +static int wpcm450_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                                 struct device_node *np_config,
> +                                 struct pinctrl_map **map,
> +                                 u32 *num_maps)
> +{
> +       return pinconf_generic_dt_node_to_map(pctldev, np_config,
> +                                             map, num_maps,
> +                                             PIN_MAP_TYPE_INVALID);
> +}
> +
> +static void wpcm450_dt_free_map(struct pinctrl_dev *pctldev,
> +                               struct pinctrl_map *map, u32 num_maps)
> +{
> +       kfree(map);
> +}
> +
> +static const struct pinctrl_ops wpcm450_pinctrl_ops =3D {
> +       .get_groups_count =3D wpcm450_get_groups_count,
> +       .get_group_name =3D wpcm450_get_group_name,
> +       .get_group_pins =3D wpcm450_get_group_pins,
> +       .dt_node_to_map =3D wpcm450_dt_node_to_map,
> +       .dt_free_map =3D wpcm450_dt_free_map,
> +};
> +
> +static int wpcm450_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +       return ARRAY_SIZE(wpcm450_funcs);
> +}
> +
> +static const char *wpcm450_get_function_name(struct pinctrl_dev *pctldev=
,
> +                                            unsigned int function)
> +{
> +       return wpcm450_funcs[function].name;
> +}
> +
> +static int wpcm450_get_function_groups(struct pinctrl_dev *pctldev,
> +                                      unsigned int function,
> +                                      const char * const **groups,
> +                                      unsigned int * const ngroups)
> +{
> +       *ngroups =3D wpcm450_funcs[function].ngroups;
> +       *groups  =3D wpcm450_funcs[function].groups;
> +
> +       return 0;
> +}
> +
> +static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +                                 unsigned int function,
> +                                 unsigned int group)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +
> +       wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
> +                       wpcm450_groups[group].num_pins, function);
> +
> +       return 0;
> +}
> +
> +static const struct pinmux_ops wpcm450_pinmux_ops =3D {
> +       .get_functions_count =3D wpcm450_get_functions_count,
> +       .get_function_name =3D wpcm450_get_function_name,
> +       .get_function_groups =3D wpcm450_get_function_groups,
> +       .set_mux =3D wpcm450_pinmux_set_mux,
> +};
> +
> +static int debounce_bitnum(int gpio)
> +{
> +       if (gpio >=3D 0 && gpio < 16)
> +               return gpio;
> +       return -EINVAL;
> +}
> +
> +static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned int
> pin,
> +                             unsigned long *config)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +       enum pin_config_param param =3D pinconf_to_config_param(*config);
> +       unsigned long flags;
> +       int bit;
> +       u32 reg;
> +
> +       switch (param) {
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               bit =3D debounce_bitnum(pin);
> +               if (bit < 0)
> +                       return bit;
> +
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +               reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
> +               spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +               *config =3D pinconf_to_config_packed(param, !!(reg &
> BIT(bit)));
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int wpcm450_config_set_one(struct wpcm450_pinctrl *pctrl,
> +                                 unsigned int pin, unsigned long config)
> +{
> +       enum pin_config_param param =3D pinconf_to_config_param(config);
> +       unsigned long flags;
> +       unsigned long reg;
> +       int bit;
> +       int arg;
> +
> +       switch (param) {
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               bit =3D debounce_bitnum(pin);
> +               if (bit < 0)
> +                       return bit;
> +
> +               arg =3D pinconf_to_config_argument(config);
> +
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +               reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
> +               __assign_bit(bit, &reg, arg);


 In all these cases are you really need to use __assign_bit() APIs? I don=
=E2=80=99t
see that this goes any higher than 32-bit.

It=E2=80=99s not a big deal though.

+               iowrite32(reg, pctrl->gpio_base + WPCM450_GPEVDBNC);
> +               spin_unlock_irqrestore(&pctrl->lock, flags);
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int wpcm450_config_set(struct pinctrl_dev *pctldev, unsigned int
> pin,
> +                             unsigned long *configs, unsigned int
> num_configs)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +       int ret;
> +
> +       while (num_configs--) {
> +               ret =3D wpcm450_config_set_one(pctrl, pin, *configs++);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct pinconf_ops wpcm450_pinconf_ops =3D {
> +       .is_generic =3D true,
> +       .pin_config_get =3D wpcm450_config_get,
> +       .pin_config_set =3D wpcm450_config_set,
> +};
> +
> +static struct pinctrl_desc wpcm450_pinctrl_desc =3D {
> +       .name =3D "wpcm450-pinctrl",
> +       .pins =3D wpcm450_pins,
> +       .npins =3D ARRAY_SIZE(wpcm450_pins),
> +       .pctlops =3D &wpcm450_pinctrl_ops,
> +       .pmxops =3D &wpcm450_pinmux_ops,
> +       .confops =3D &wpcm450_pinconf_ops,
> +       .owner =3D THIS_MODULE,
> +};
> +
> +static int wpcm450_gpio_set_config(struct gpio_chip *chip,
> +                                  unsigned int offset, unsigned long
> config)
> +{
> +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(chip);
> +
> +       return wpcm450_config_set_one(gpio->pctrl, offset, config);
> +}
> +
> +static int wpcm450_gpio_register(struct platform_device *pdev,
> +                                struct wpcm450_pinctrl *pctrl)
> +{
> +       int ret =3D 0;
> +       struct fwnode_handle *np;


 Either be fully OF, or don=E2=80=99t name =E2=80=98np' here. We usually us=
e fwnode or
=E2=80=98child=E2=80=99 in this case.


> +
> +       pctrl->gpio_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (!pctrl->gpio_base) {
> +               dev_err(pctrl->dev, "Resource fail for GPIO controller\n"=
);
> +               return -ENOMEM;


dev_err_probe(), ditto for the rest in ->probe().


> +       }
> +
> +       fwnode_for_each_available_child_node(pctrl->dev->fwnode, np) {


Please, do not dereference fwnode, instead use analogue from device_*()
APIs. Hence, replace fwnode.h with property.h.


> +               void __iomem *dat =3D NULL;
> +               void __iomem *set =3D NULL;
> +               void __iomem *dirout =3D NULL;
> +               unsigned long flags =3D 0;
> +               const struct wpcm450_bank *bank;
> +               struct wpcm450_gpio *gpio;
> +               struct gpio_irq_chip *girq;
> +               u32 interrupt_map[3];
> +               int reg, i;
> +
> +               if (!fwnode_property_read_bool(np, "gpio-controller"))
> +                       continue;
> +
> +               ret =3D fwnode_property_read_u32(np, "reg", &reg);
> +               if (ret < 0)
> +                       return ret;
> +
> +               gpio =3D &pctrl->gpio_bank[reg];
> +               gpio->pctrl =3D pctrl;
> +
> +               if (reg < 0 || reg > WPCM450_NUM_BANKS) {
> +                       dev_err(pctrl->dev, "GPIO index %d out of
> range!\n", reg);
> +                       return -EINVAL;
> +               }
> +
> +               bank =3D &wpcm450_banks[reg];
> +
> +               dat =3D pctrl->gpio_base + bank->datain;
> +               if (bank->dataout) {
> +                       set =3D pctrl->gpio_base + bank->dataout;
> +                       dirout =3D pctrl->gpio_base + bank->cfg0;
> +               } else {
> +                       flags =3D BGPIOF_NO_OUTPUT;
> +               }
> +               ret =3D bgpio_init(&gpio->gc, pctrl->dev, 4,
> +                                dat, set, NULL, dirout, NULL, flags);
> +               if (ret < 0) {
> +                       dev_err(pctrl->dev, "GPIO initialization failed:
> %d\n", ret);
> +                       return ret;
> +               }
> +
> +               gpio->gc.ngpio =3D bank->length;
> +               gpio->gc.set_config =3D wpcm450_gpio_set_config;



> +               gpio->gc.of_node =3D to_of_node(np);


I hope we will soon have fwnode in gpio_chip.



> +               gpio->gc.parent =3D pctrl->dev;
>
>
Set by bgpio_init(), also check for other potential duplications.



> +               gpio->irqc =3D wpcm450_gpio_irqchip;
> +               girq =3D &gpio->gc.irq;
> +               girq->chip =3D &gpio->irqc;
> +               girq->parent_handler =3D wpcm450_gpio_irqhandler;
> +               girq->parents =3D devm_kcalloc(pctrl->dev,
> WPCM450_NUM_GPIO_IRQS,
> +                                            sizeof(*girq->parents),
> GFP_KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +               girq->default_type =3D IRQ_TYPE_NONE;
> +               girq->handler =3D handle_bad_irq;
> +
> +               girq->num_parents =3D 0;
> +               for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
> +                       int irq =3D fwnode_irq_get(np, i);
> +
> +                       if (irq < 0)
> +                               break;
> +
> +                       girq->parents[i] =3D irq;
> +                       girq->num_parents++;
> +               }
> +
> +               ret =3D fwnode_property_read_u32_array(np,
> "nuvoton,interrupt-map",
> +                                                    interrupt_map,
> ARRAY_SIZE(interrupt_map));
> +               if (ret =3D=3D 0) {
> +                       gpio->first_irq_bit =3D interrupt_map[0];
> +                       gpio->num_irqs =3D interrupt_map[1];
> +                       gpio->first_irq_gpio =3D interrupt_map[2];
> +               }
> +
> +               ret =3D devm_gpiochip_add_data(pctrl->dev, &gpio->gc, gpi=
o);
> +               if (ret) {
> +                       dev_err(pctrl->dev, "Failed to add GPIO chip:
> %d\n", ret);
> +                       return ret;
> +               }
> +
> +               ret =3D gpiochip_add_pin_range(&gpio->gc,
> dev_name(pctrl->dev),
> +                                            0, bank->base, bank->length)=
;
> +               if (ret) {
> +                       dev_err(pctrl->dev, "Failed to add pin range for
> GPIO bank %u\n", reg);
> +                       return ret;
> +               }



Please move it to the corresponding callback.


> +       }
> +
> +       return 0;
> +}
> +
> +static int wpcm450_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct wpcm450_pinctrl *pctrl;
> +       int ret;
> +
> +       pctrl =3D devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +       if (!pctrl)
> +               return -ENOMEM;
> +
> +       pctrl->dev =3D &pdev->dev;
> +       spin_lock_init(&pctrl->lock);
> +       dev_set_drvdata(&pdev->dev, pctrl);
> +
> +       pctrl->gcr_regmap =3D
> +               syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr")=
;
> +       if (IS_ERR(pctrl->gcr_regmap)) {
> +               dev_err_probe(pctrl->dev, PTR_ERR(pctrl->gcr_regmap),
> +                             "Failed to find nuvoton,wpcm450-gcr\n");
> +               return PTR_ERR(pctrl->gcr_regmap);
> +       }
> +
> +       pctrl->pctldev =3D devm_pinctrl_register(&pdev->dev,
> +                                              &wpcm450_pinctrl_desc,
> pctrl);
> +       if (IS_ERR(pctrl->pctldev)) {





> +               dev_err_probe(&pdev->dev, PTR_ERR(pctrl->pctldev),
> +                             "Failed to register pinctrl device\n");
> +               return PTR_ERR(pctrl->pctldev);


You may combine those two in one return statement.


> +       }
> +
> +       ret =3D wpcm450_gpio_register(pdev, pctrl);
> +       if (ret < 0)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id wpcm450_pinctrl_match[] =3D {
> +       { .compatible =3D "nuvoton,wpcm450-pinctrl" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, wpcm450_pinctrl_match);
> +
> +static struct platform_driver wpcm450_pinctrl_driver =3D {
> +       .probe =3D wpcm450_pinctrl_probe,
> +       .driver =3D {
> +               .name =3D "wpcm450-pinctrl",
> +               .of_match_table =3D wpcm450_pinctrl_match,
> +       },
> +};
> +module_platform_driver(wpcm450_pinctrl_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>");
> +MODULE_DESCRIPTION("Nuvoton WPCM450 Pinctrl and GPIO driver");
> --
> 2.30.2
>
>

--=20
With Best Regards,
Andy Shevchenko

--00000000000017044b05d2a0bbf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, December 7, 2021, Jonathan Neusch=C3=A4fer &lt;<a href=
=3D"mailto:j.neuschaefer@gmx.net">j.neuschaefer@gmx.net</a>&gt; wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">This driver is based on the one for NPCM7xx, =
because the WPCM450 is a<br>
predecessor of those SoCs. Notable differences:<br>
<br>
- WPCM450, the GPIO registers are not organized in multiple banks, but<br>
=C2=A0 rather placed continually into the same register block. This affects=
<br>
=C2=A0 how register offsets are computed.<br>
- Pinmux nodes can explicitly select GPIO mode, whereas, in the npcm7xx<br>
=C2=A0 driver, this happens automatically when a GPIO is requested.<br>
<br>
Some functionality implemented in the hardware was (for now) left unused<br=
>
in the driver, specifically blinking and pull-up/down.<br>
<br>
Signed-off-by: Jonathan Neusch=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer=
@gmx.net">j.neuschaefer@gmx.net</a>&gt;<br>
---<br>
<br>
This patch has a few checkpatch warnings, which are inherited from the<br>
pinctrl-npcm7xx driver. I decided to ignore those. Specifically:<br>
(1) WPCM450_GRPS is an unwrapped list; (2) use of -ENOTSUPP is discouraged.=
<br>
<br>
<br>
v2:<br>
- Adjust to binding change which put each GPIO bank into its own node<br>
- Use generic GPIO support<br>
- Make it possible to set pinmux to GPIO explicitly<br>
- Allow building the driver as a module<br>
- Fix spelling of &quot;spin lock&quot; in text<br>
- Include &lt;linux/mod_devicetable.h&gt;<br>
- Move linux/pinctrl/* headers to the end of the #include block<br>
- Remove/rework comments and printk messages<br>
- Switch to fwnode API<br>
- Remove comma after sentinel {}<br>
- Use dev_err_probe<br>
- Improve Kconfig help message<br>
- Declare for_each_set_bit iterator as unsigned int<br>
- Use __assign_bit<br>
- Set parent irq handler in set_irq_type callback<br>
- Use struct group_desc<br>
- Don&#39;t hide sysfs bind attributes<br>
- Remove unnecessary check for gpio-controller property<br>
- Use module_platform_driver()<br>
<br>
v1:<br>
- <a href=3D"https://lore.kernel.org/lkml/20210602120329.2444672-6-j.neusch=
aefer@gmx.net/" target=3D"_blank">https://lore.kernel.org/lkml/<wbr>2021060=
2120329.2444672-6-j.<wbr>neuschaefer@gmx.net/</a><br>
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<b=
r>
=C2=A0drivers/pinctrl/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0drivers/pinctrl/nuvoton/<wbr>Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A018 +<br>
=C2=A0drivers/pinctrl/nuvoton/<wbr>Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0drivers/pinctrl/nuvoton/<wbr>pinctrl-wpcm450.c | 1134 +++++++++++++++=
++++++<br>
=C2=A05 files changed, 1155 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 drivers/pinctrl/nuvoton/<wbr>pinctrl-wpcm450.c<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index eff3edafd8814..56c5c394877e1 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2352,6 +2352,7 @@ S:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/devicetree/<wbr>bindings/*/*wpcm*=
<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0arch/arm/boot/dts/nuvoton-<wbr>wpcm450*<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0arch/arm/mach-npcm/wpcm450.c<br>
+F:=C2=A0 =C2=A0 =C2=A0drivers/*/*/*wpcm*<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0drivers/*/*wpcm*<br>
<br>
=C2=A0ARM/NXP S32G ARCHITECTURE<br>
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile<br>
index 5e63de2ffcf41..823ff12847ed3 100644<br>
--- a/drivers/pinctrl/Makefile<br>
+++ b/drivers/pinctrl/Makefile<br>
@@ -58,7 +58,7 @@ obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D freescale/<br>
=C2=A0obj-$(CONFIG_X86)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=3D intel/<br>
=C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D mvebu/<br>
=C2=A0obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D nomadik/<br>
-obj-$(CONFIG_ARCH_NPCM7XX)=C2=A0 =C2=A0 =C2=A0+=3D nuvoton/<br>
+obj-y=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 +=3D nuvoton/<br>
=C2=A0obj-$(CONFIG_PINCTRL_PXA)=C2=A0 =C2=A0 =C2=A0 +=3D pxa/<br>
=C2=A0obj-$(CONFIG_ARCH_QCOM)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +=3D qcom/<br>
=C2=A0obj-$(CONFIG_PINCTRL_RALINK)=C2=A0 =C2=A0+=3D ralink/<br>
diff --git a/drivers/pinctrl/nuvoton/<wbr>Kconfig b/drivers/pinctrl/nuvoton=
/<wbr>Kconfig<br>
index 48ba0469edda6..6a3c6f2a73f2d 100644<br>
--- a/drivers/pinctrl/nuvoton/<wbr>Kconfig<br>
+++ b/drivers/pinctrl/nuvoton/<wbr>Kconfig<br>
@@ -1,4 +1,22 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0-only<br>
+<br>
+config PINCTRL_WPCM450<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Pinctrl and GPIO driver for Nuvo=
ton WPCM450&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_WPCM450 || COMPILE_TEST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PINMUX<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select PINCONF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GENERIC_PINCONF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GPIOLIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GPIO_GENERIC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select GPIOLIB_IRQCHIP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y or M here to enable pin controller=
 and GPIO support for<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the Nuvoton WPCM450 SoC. This is strongl=
y recommended when<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0building a kernel that will run on this =
chip.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If this driver is compiled as a module, =
it will be named<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-wpcm450.<br>
+<br>
=C2=A0config PINCTRL_NPCM7XX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Pinctrl and GPIO driver for Nuvoton =
NPCM7XX&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on (ARCH_NPCM7XX || COMPILE_TEST) &amp;=
&amp; OF<br>
diff --git a/drivers/pinctrl/nuvoton/<wbr>Makefile b/drivers/pinctrl/nuvoto=
n/<wbr>Makefile<br>
index 886d00784cef5..9e66f5dc74bfc 100644<br>
--- a/drivers/pinctrl/nuvoton/<wbr>Makefile<br>
+++ b/drivers/pinctrl/nuvoton/<wbr>Makefile<br>
@@ -1,4 +1,5 @@<br>
=C2=A0# SPDX-License-Identifier: GPL-2.0<br>
=C2=A0# Nuvoton pinctrl support<br>
<br>
+obj-$(CONFIG_PINCTRL_WPCM450)=C2=A0 +=3D pinctrl-wpcm450.o<br>
=C2=A0obj-$(CONFIG_PINCTRL_NPCM7XX)=C2=A0 +=3D pinctrl-npcm7xx.o<br>
diff --git a/drivers/pinctrl/nuvoton/<wbr>pinctrl-wpcm450.c b/drivers/pinct=
rl/nuvoton/<wbr>pinctrl-wpcm450.c<br>
new file mode 100644<br>
index 0000000000000..b1e190e45af93<br>
--- /dev/null<br>
+++ b/drivers/pinctrl/nuvoton/<wbr>pinctrl-wpcm450.c<br>
@@ -0,0 +1,1134 @@<br>
+// SPDX-License-Identifier: GPL-2.0<br>
+// Copyright (c) 2016-2018 Nuvoton Technology corporation.<br>
+// Copyright (c) 2016, Dell Inc<br>
+// Copyright (c) 2021 Jonathan Neusch=C3=A4fer<br>
+//<br>
+// This driver uses the following registers:<br>
+// - Pin mux registers, in the GCR (general control registers) block<br>
+// - GPIO registers, specific to each GPIO bank<br>
+// - GPIO event (interrupt) registers, located centrally in the GPIO regis=
ter<br>
+//=C2=A0 =C2=A0block, shared between all GPIO banks<br>
+<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/fwnode.h&gt;<br>
+#include &lt;linux/gpio/driver.h&gt;<br>
+#include &lt;linux/interrupt.h&gt;<br>
+#include &lt;linux/irq.h&gt;<br>
+#include &lt;linux/mfd/syscon.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/mod_devicetable.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/regmap.h&gt;</blockquote><div><br></div><div>+ blank li=
ne?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+#include &lt;linux/pinctrl/pinconf.h&gt;<br>
+#include &lt;linux/pinctrl/pinconf-<wbr>generic.h&gt;<br>
+#include &lt;linux/pinctrl/pinctrl.h&gt;<br>
+#include &lt;linux/pinctrl/pinmux.h&gt;<br>
+<br>
+#include &quot;../core.h&quot;<br>
+<br>
+/* GCR registers */<br>
+#define WPCM450_GCR_MFSEL1=C2=A0 =C2=A0 =C2=A00x0C<br>
+#define WPCM450_GCR_MFSEL2=C2=A0 =C2=A0 =C2=A00x10<br>
+#define WPCM450_GCR_NONE=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+<br>
+/* GPIO event (interrupt) registers */<br>
+#define WPCM450_GPEVTYPE=C2=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
+#define WPCM450_GPEVPOL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x04<br>
+#define WPCM450_GPEVDBNC=C2=A0 =C2=A0 =C2=A0 =C2=A00x08<br>
+#define WPCM450_GPEVEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0c<br>
+#define WPCM450_GPEVST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x10<br>
+<br>
+#define WPCM450_NUM_BANKS=C2=A0 =C2=A0 =C2=A0 8<br>
+#define WPCM450_NUM_GPIOS=C2=A0 =C2=A0 =C2=A0 128<br>
+#define WPCM450_NUM_GPIO_IRQS=C2=A0 4<br>
+<br>
+struct wpcm450_pinctrl;<br>
+<br>
+struct wpcm450_gpio {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl=C2=A0 *pctrl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_chip=C2=A0 =C2=A0 =C2=A0 =C2=A0 gc;=
</blockquote><div><br></div><div>Making this first speeds up pointer arithm=
etics by making it no-op at compile time.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_chip=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0irqc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 first_irq_bit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 num_irqs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 first_irq_gpio;<br>
+};<br>
+<br>
+struct wpcm450_pinctrl {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_dev=C2=A0 =C2=A0 =C2=A0 *pctldev=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_domain=C2=A0 =C2=A0 =C2=A0 =C2=A0*do=
main;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*gcr_regmap;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 *gpio_base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio=C2=A0 =C2=A0 =C2=A0gpio_ban=
k[WPCM450_NUM_BANKS];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0both_edges;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This spin lock protects registers and struct=
 wpcm450_pinctrl fields<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * against concurrent access.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 lock;<br>
+};<br>
+<br>
+struct wpcm450_bank {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Range of GPIOs in this port */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 length;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Register offsets (0 =3D register doesn&#39;t=
 exist in this port) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 cfg0, cfg1, cfg2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 blink;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 dataout, datain;<br>
+};<br>
+<br>
+static const struct wpcm450_bank wpcm450_banks[WPCM450_NUM_<wbr>BANKS] =3D=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 range=C2=A0 =C2=A0cfg0=C2=A0 cfg1=C2=
=A0 cfg2 blink=C2=A0 out=C2=A0 =C2=A0in=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A00, 16,=C2=A0 0x14, 0x18,=C2=A0 =
=C2=A0 0,=C2=A0 =C2=A0 0, 0x1c, 0x20 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 16, 16,=C2=A0 0x24, 0x28, 0x2c, 0x30, 0=
x34, 0x38 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 32, 16,=C2=A0 0x3c, 0x40, 0x44,=C2=A0 =
=C2=A0 0, 0x48, 0x4c },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 48, 16,=C2=A0 0x50, 0x54, 0x58,=C2=A0 =
=C2=A0 0, 0x5c, 0x60 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 64, 16,=C2=A0 0x64, 0x68, 0x6c,=C2=A0 =
=C2=A0 0, 0x70, 0x74 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 80, 16,=C2=A0 0x78, 0x7c, 0x80,=C2=A0 =
=C2=A0 0, 0x84, 0x88 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 96, 18,=C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=
=A0 0,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 0,=C2=A0 =C2=A0 0, 0x8c },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 114, 14,=C2=A0 0x90, 0x94, 0x98,=C2=A0 =C2=A0=
 0, 0x9c, 0xa0 },<br>
+};<br>
+<br>
+static int wpcm450_gpio_irq_bitnum(struct wpcm450_gpio *gpio, struct irq_d=
ata *d)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int hwirq =3D irqd_to_hwirq(d);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwirq &lt; gpio-&gt;first_irq_gpio)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwirq - gpio-&gt;first_irq_gpio &gt;=3D gpi=
o-&gt;num_irqs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return hwirq - gpio-&gt;first_irq_gpio + gpio-&=
gt;first_irq_bit;<br>
+}<br>
+<br>
+static int wpcm450_irq_bitnum_to_gpio(<wbr>struct wpcm450_gpio *gpio, int =
bitnum)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bitnum &lt; gpio-&gt;first_irq_bit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bitnum - gpio-&gt;first_irq_bit &gt; gpio-&=
gt;num_irqs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return bitnum - gpio-&gt;first_irq_bit + gpio-&=
gt;first_irq_gpio;<br>
+}<br></blockquote><div><br></div><div><br></div><div>Have you chance to lo=
ok at bitmap_remap() and bitmap_bitremap() APIs? I=E2=80=99m pretty sure yo=
u can make this all cleaner by switching to those calls and represent the G=
PIOs as continuous bitmap on the Linux side while on the hardware it will b=
e sparse. Check gpio-Xilinx for the details of use.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
+static void wpcm450_gpio_irq_ack(struct irq_data *d)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(irq_data_<wbr>get_irq_chip_data(d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D wpcm450_gpio_irq_bitnum(gpio, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;pctrl-&gt;<wbr>lock, fla=
gs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(BIT(bit), pctrl-&gt;gpio_base + WPCM4=
50_GPEVST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;pctrl-<wbr>&gt;lock=
, flags);<br>
+}<br>
+<br>
+static void wpcm450_gpio_irq_mask(struct irq_data *d)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(irq_data_<wbr>get_irq_chip_data(d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long even;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D wpcm450_gpio_irq_bitnum(gpio, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;pctrl-&gt;<wbr>lock, fla=
gs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0even =3D ioread32(pctrl-&gt;gpio_base + WPCM450=
_GPEVEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &amp;even, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(even, pctrl-&gt;gpio_base + WPCM450_G=
PEVEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;pctrl-<wbr>&gt;lock=
, flags);<br>
+}<br>
+<br>
+static void wpcm450_gpio_irq_unmask(struct irq_data *d)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(irq_data_<wbr>get_irq_chip_data(d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long even;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D wpcm450_gpio_irq_bitnum(gpio, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;pctrl-&gt;<wbr>lock, fla=
gs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0even =3D ioread32(pctrl-&gt;gpio_base + WPCM450=
_GPEVEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &amp;even, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(even, pctrl-&gt;gpio_base + WPCM450_G=
PEVEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;pctrl-<wbr>&gt;lock=
, flags);<br>
+}<br>
+<br>
+static void wpcm450_gpio_fix_evpol(struct wpcm450_gpio *gpio, unsigned lon=
g all)<br>
+{</blockquote><div><br></div><div><br></div><div>What is this quirk (?) fo=
r? Please add a comment.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_set_bit(bit, &amp;all, 32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int offset =3D wpcm=
450_irq_bitnum_to_gpio(<wbr>gpio, bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long evpol=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int level;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&=
amp;gpio-&gt;gc.<wbr>bgpio_lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0evpol =3D ioread32(pctrl-&gt;gpio_base + WPCM450_GPEVPOL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0level =3D gpio-&gt;gc.get(&amp;gpio-&gt;gc, offset);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Switch event polarity to the opposite of the current level */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0__assign_bit(bit, &amp;evpol, !level);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iowrite32(evpol, pctrl-&gt;gpio_base + WPCM450_GPEVPOL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (gpio-&gt;g=
c.get(&amp;gpio-&gt;gc, offset) !=3D level);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrest=
ore(&amp;gpio-&gt;<wbr>gc.bgpio_lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int wpcm450_gpio_set_irq_type(<wbr>struct irq_data *d, unsigned int=
 flow_type)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(irq_data_<wbr>get_irq_chip_data(d));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long evtype, evpol;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D wpcm450_gpio_irq_bitnum(gpio, d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_locked(d, handle_level_irq);<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;pctrl-&gt;<wbr>lock, fla=
gs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0evtype =3D ioread32(pctrl-&gt;gpio_base + WPCM4=
50_GPEVTYPE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0evpol =3D ioread32(pctrl-&gt;gpio_base + WPCM45=
0_GPEVPOL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &amp;pctrl-&gt;both_edges, 0)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (flow_type) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_LEVEL_LOW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evtype, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evpol, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_LEVEL_HIGH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evtype, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evpol, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_EDGE_FALLING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evtype, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evpol, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_EDGE_RISING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evtype, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evpol, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case IRQ_TYPE_EDGE_BOTH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;evtype, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;pctrl-&gt;both_edges, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(evtype, pctrl-&gt;gpio_base + WPCM450=
_GPEVTYPE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(evpol, pctrl-&gt;gpio_base + WPCM450_=
GPEVPOL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* clear the event status for good measure */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(BIT(bit), pctrl-&gt;gpio_base + WPCM4=
50_GPEVST);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* fix event polarity after clearing event stat=
us */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wpcm450_gpio_fix_evpol(gpio, BIT(bit));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;pctrl-<wbr>&gt;lock=
, flags);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static const struct irq_chip wpcm450_gpio_irqchip =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;WPCM450-GPIO-IRQ&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_ack =3D wpcm450_gpio_irq_ack,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_unmask =3D wpcm450_gpio_irq_unmask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_mask =3D wpcm450_gpio_irq_mask,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.irq_set_type =3D wpcm450_gpio_set_irq_type,<br=
>
+};<br>
+<br>
+static void wpcm450_gpio_irqhandler(struct irq_desc *desc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(irq_desc_<wbr>get_handler_data(desc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D gpio-&gt;pctr=
l;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct irq_chip *chip =3D irq_desc_get_chip(des=
c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long pending;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long ours;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ours =3D ((1UL &lt;&lt; gpio-&gt;num_irqs) - 1)=
 &lt;&lt; gpio-&gt;first_irq_bit;</blockquote><div><br></div><div>BIT()</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;pctrl-&gt;<wbr>lock, fla=
gs);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pending =3D ioread32(pctrl-&gt;gpio_base + WPCM=
450_GPEVST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pending &amp;=3D ioread32(pctrl-&gt;gpio_base +=
 WPCM450_GPEVEN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pending &amp;=3D ours;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pending &amp; pctrl-&gt;both_edges)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wpcm450_gpio_fix_ev=
pol(gpio, pending &amp; pctrl-&gt;both_edges);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;pctrl-<wbr>&gt;lock=
, flags);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chained_irq_enter(chip, desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_set_bit(bit, &amp;pending, 32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int offset =3D wpcm=
450_irq_bitnum_to_gpio(<wbr>gpio, bit);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq =3D irq_fin=
d_mapping(gpio-&gt;gc.irq.<wbr>domain, offset);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0generic_handle_irq(=
irq);</blockquote><div><br></div><div>Above two are now represented by anot=
her generic IRQ handle call, check relatively recently updated drivers arou=
nd.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chained_irq_exit(chip, desc);<br>
+}<br>
+<br>
+static int smb0_pins[]=C2=A0 =3D { 115, 114 };<br>
+static int smb1_pins[]=C2=A0 =3D { 117, 116 };<br>
+static int smb2_pins[]=C2=A0 =3D { 119, 118 };<br>
+static int smb3_pins[]=C2=A0 =3D { 30, 31 };<br>
+static int smb4_pins[]=C2=A0 =3D { 28, 29 };<br>
+static int smb5_pins[]=C2=A0 =3D { 26, 27 };<br>
+<br>
+static int scs1_pins[] =3D { 32 };<br>
+static int scs2_pins[] =3D { 33 };<br>
+static int scs3_pins[] =3D { 34 };<br>
+<br>
+static int bsp_pins[] =3D { 41, 42 };<br>
+static int hsp1_pins[] =3D { 43, 44, 45, 46, 47, 61, 62, 63 };<br>
+static int hsp2_pins[] =3D { 48, 49, 50, 51, 52, 53, 54, 55 };<br>
+<br>
+static int r1err_pins[] =3D { 56 };<br>
+static int r1md_pins[] =3D { 57, 58 };<br>
+static int rmii2_pins[] =3D { 84, 85, 86, 87, 88, 89 };<br>
+static int r2err_pins[] =3D { 90 };<br>
+static int r2md_pins[] =3D { 91, 92 };<br>
+<br>
+static int kbcc_pins[] =3D { 94, 93 };<br>
+static int clko_pins[] =3D { 96 };<br>
+static int smi_pins[] =3D { 97 };<br>
+static int uinc_pins[] =3D { 19 };<br>
+static int mben_pins[] =3D {};<br>
+<br>
+static int gspi_pins[] =3D { 12, 13, 14, 15 };<br>
+static int sspi_pins[] =3D { 12, 13, 14, 15 };<br>
+<br>
+static int xcs1_pins[] =3D { 35 };<br>
+static int xcs2_pins[] =3D { 36 };<br>
+<br>
+static int sdio_pins[] =3D { 7, 22, 43, 44, 45, 46, 47, 60 };<br>
+<br>
+static int fi0_pins[] =3D { 64 };<br>
+static int fi1_pins[] =3D { 65 };<br>
+static int fi2_pins[] =3D { 66 };<br>
+static int fi3_pins[] =3D { 67 };<br>
+static int fi4_pins[] =3D { 68 };<br>
+static int fi5_pins[] =3D { 69 };<br>
+static int fi6_pins[] =3D { 70 };<br>
+static int fi7_pins[] =3D { 71 };<br>
+static int fi8_pins[] =3D { 72 };<br>
+static int fi9_pins[] =3D { 73 };<br>
+static int fi10_pins[] =3D { 74 };<br>
+static int fi11_pins[] =3D { 75 };<br>
+static int fi12_pins[] =3D { 76 };<br>
+static int fi13_pins[] =3D { 77 };<br>
+static int fi14_pins[] =3D { 78 };<br>
+static int fi15_pins[] =3D { 79 };<br>
+<br>
+static int pwm0_pins[] =3D { 80 };<br>
+static int pwm1_pins[] =3D { 81 };<br>
+static int pwm2_pins[] =3D { 82 };<br>
+static int pwm3_pins[] =3D { 83 };<br>
+static int pwm4_pins[] =3D { 20 };<br>
+static int pwm5_pins[] =3D { 21 };<br>
+static int pwm6_pins[] =3D { 16 };<br>
+static int pwm7_pins[] =3D { 17 };<br>
+<br>
+static int hg0_pins[] =3D { 20 };<br>
+static int hg1_pins[] =3D { 21 };<br>
+static int hg2_pins[] =3D { 22 };<br>
+static int hg3_pins[] =3D { 23 };<br>
+static int hg4_pins[] =3D { 24 };<br>
+static int hg5_pins[] =3D { 25 };<br>
+static int hg6_pins[] =3D { 59 };<br>
+static int hg7_pins[] =3D { 60 };<br>
+<br>
+#define WPCM450_GRPS \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb4), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb5), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(scs1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(scs2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(scs3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb0), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smb2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(bsp), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hsp1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hsp2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(r1err), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(r1md), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(rmii2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(r2err), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(r2md), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(kbcc), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(clko), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(smi), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(uinc), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(gspi), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(mben), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(xcs2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(xcs1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(sdio), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(sspi), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi0), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi4), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi5), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi6), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi7), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi8), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi9), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi10), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi11), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi12), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi13), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi14), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(fi15), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm0), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm4), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm5), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm6), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(pwm7), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg0), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg4), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg5), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg6), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(hg7), \<br>
+<br>
+enum {<br>
+#define WPCM450_GRP(x) fn_ ## x<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRPS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* add placeholder for none/gpio */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(gpio),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRP(none),<br>
+#undef WPCM450_GRP<br>
+};<br>
+<br>
+static struct group_desc wpcm450_groups[] =3D {<br>
+#define WPCM450_GRP(x) { .name =3D #x, .pins =3D x ## _pins, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.num_pins =3D ARRAY_SIZE(x ## _pins) }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_GRPS<br>
+#undef WPCM450_GRP<br>
+};<br>
+<br>
+#define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)<br>
+#define WPCM450_FUNC(a, b...) static const char *a ## _grp[] =3D { b }<br>
+#define WPCM450_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm ## =
_grp), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0.groups =3D nm ## _grp }<br>
+struct wpcm450_func {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned int ngroups;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *const *groups;<br>
+};<br>
+<br>
+WPCM450_SFUNC(smb3);<br>
+WPCM450_SFUNC(smb4);<br>
+WPCM450_SFUNC(smb5);<br>
+WPCM450_SFUNC(scs1);<br>
+WPCM450_SFUNC(scs2);<br>
+WPCM450_SFUNC(scs3);<br>
+WPCM450_SFUNC(smb0);<br>
+WPCM450_SFUNC(smb1);<br>
+WPCM450_SFUNC(smb2);<br>
+WPCM450_SFUNC(bsp);<br>
+WPCM450_SFUNC(hsp1);<br>
+WPCM450_SFUNC(hsp2);<br>
+WPCM450_SFUNC(r1err);<br>
+WPCM450_SFUNC(r1md);<br>
+WPCM450_SFUNC(rmii2);<br>
+WPCM450_SFUNC(r2err);<br>
+WPCM450_SFUNC(r2md);<br>
+WPCM450_SFUNC(kbcc);<br>
+WPCM450_SFUNC(clko);<br>
+WPCM450_SFUNC(smi);<br>
+WPCM450_SFUNC(uinc);<br>
+WPCM450_SFUNC(gspi);<br>
+WPCM450_SFUNC(mben);<br>
+WPCM450_SFUNC(xcs2);<br>
+WPCM450_SFUNC(xcs1);<br>
+WPCM450_SFUNC(sdio);<br>
+WPCM450_SFUNC(sspi);<br>
+WPCM450_SFUNC(fi0);<br>
+WPCM450_SFUNC(fi1);<br>
+WPCM450_SFUNC(fi2);<br>
+WPCM450_SFUNC(fi3);<br>
+WPCM450_SFUNC(fi4);<br>
+WPCM450_SFUNC(fi5);<br>
+WPCM450_SFUNC(fi6);<br>
+WPCM450_SFUNC(fi7);<br>
+WPCM450_SFUNC(fi8);<br>
+WPCM450_SFUNC(fi9);<br>
+WPCM450_SFUNC(fi10);<br>
+WPCM450_SFUNC(fi11);<br>
+WPCM450_SFUNC(fi12);<br>
+WPCM450_SFUNC(fi13);<br>
+WPCM450_SFUNC(fi14);<br>
+WPCM450_SFUNC(fi15);<br>
+WPCM450_SFUNC(pwm0);<br>
+WPCM450_SFUNC(pwm1);<br>
+WPCM450_SFUNC(pwm2);<br>
+WPCM450_SFUNC(pwm3);<br>
+WPCM450_SFUNC(pwm4);<br>
+WPCM450_SFUNC(pwm5);<br>
+WPCM450_SFUNC(pwm6);<br>
+WPCM450_SFUNC(pwm7);<br>
+WPCM450_SFUNC(hg0);<br>
+WPCM450_SFUNC(hg1);<br>
+WPCM450_SFUNC(hg2);<br>
+WPCM450_SFUNC(hg3);<br>
+WPCM450_SFUNC(hg4);<br>
+WPCM450_SFUNC(hg5);<br>
+WPCM450_SFUNC(hg6);<br>
+WPCM450_SFUNC(hg7);<br>
+<br>
+#define WPCM450_GRP(x) #x<br>
+WPCM450_FUNC(gpio, WPCM450_GRPS);<br>
+#undef WPCM450_GRP<br>
+<br>
+/* Function names */<br>
+static struct wpcm450_func wpcm450_funcs[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(scs1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(scs2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(scs3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smb2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(bsp),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hsp1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hsp2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(r1err),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(r1md),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(rmii2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(r2err),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(r2md),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(kbcc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(clko),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(smi),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(uinc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(gspi),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(mben),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(xcs2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(xcs1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(sdio),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(sspi),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi8),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi9),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi10),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi12),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi13),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi14),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(fi15),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(pwm7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(hg7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_MKFUNC(gpio),<br>
+};<br>
+<br>
+#define WPCM450_PINCFG(a, b, c, d, e, f, g) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[a] { .fn0 =3D fn_ ## b, .reg0 =3D WPCM450_GCR_=
 ## c, .bit0 =3D d, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fn1 =3D fn_ ## e, .reg1 =
=3D WPCM450_GCR_ ## f, .bit1 =3D g }<br>
+<br>
+struct wpcm450_pincfg {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fn0, reg0, bit0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fn1, reg1, bit1;<br>
+};<br>
+<br>
+static const struct wpcm450_pincfg pincfg[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PIN=C2=A0 =C2=A0 =C2=A0 =C2=A0FUNCTION 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0FUNCTION 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(4,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(5,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(6,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(7,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(8,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(10,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(11,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(12,=C2=A0 =C2=A0 =C2=A0 =C2=A0gs=
pi, MFSEL1, 24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sspi, MFSEL1, 31),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(13,=C2=A0 =C2=A0 =C2=A0 =C2=A0gs=
pi, MFSEL1, 24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sspi, MFSEL1, 31),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(14,=C2=A0 =C2=A0 =C2=A0 =C2=A0gs=
pi, MFSEL1, 24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sspi, MFSEL1, 31),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(15,=C2=A0 =C2=A0 =C2=A0 =C2=A0gs=
pi, MFSEL1, 24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sspi, MFSEL1, 31),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(16,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm6, MFSEL2, 22),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(17,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm7, MFSEL2, 23),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(18,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(19,=C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nc, MFSEL1, 23,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(20,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g0, MFSEL2, 24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm4, MFSEL2, 20),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(21,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g1, MFSEL2, 25,=C2=A0 =C2=A0 =C2=A0 =C2=A0 pwm5, MFSEL2, 21),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(22,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g2, MFSEL2, 26,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(23,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g3, MFSEL2, 27,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(24,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g4, MFSEL2, 28,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(25,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g5, MFSEL2, 29,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(26,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b5, MFSEL1, 2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(27,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b5, MFSEL1, 2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(28,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b4, MFSEL1, 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(29,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b4, MFSEL1, 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(30,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b3, MFSEL1, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(31,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b3, MFSEL1, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(32,=C2=A0 =C2=A0 =C2=A0 =C2=A0sc=
s1, MFSEL1, 3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(33,=C2=A0 =C2=A0 =C2=A0 =C2=A0sc=
s2, MFSEL1, 4,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(34,=C2=A0 =C2=A0 =C2=A0 =C2=A0sc=
s3, MFSEL1, 5,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(35,=C2=A0 =C2=A0 =C2=A0 =C2=A0xc=
s1, MFSEL1, 29,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(36,=C2=A0 =C2=A0 =C2=A0 =C2=A0xc=
s2, MFSEL1, 28,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(37,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(38,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(39,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(40,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(41,=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
sp, MFSEL1, 9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(42,=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
sp, MFSEL1, 9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(43,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(44,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(45,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(46,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(47,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(48,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(49,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(50,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(51,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(52,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(53,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(54,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(55,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p2, MFSEL1, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(56,=C2=A0 =C2=A0 =C2=A0 r1err, M=
FSEL1, 12,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(57,=C2=A0 =C2=A0 =C2=A0 =C2=A0r1=
md, MFSEL1, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(58,=C2=A0 =C2=A0 =C2=A0 =C2=A0r1=
md, MFSEL1, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(59,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g6, MFSEL2, 30,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(60,=C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
g7, MFSEL2, 31,=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdio, MFSEL1, 30),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(61,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(62,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(63,=C2=A0 =C2=A0 =C2=A0 =C2=A0hs=
p1, MFSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(64,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i0, MFSEL2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(65,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i1, MFSEL2, 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(66,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i2, MFSEL2, 2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(67,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i3, MFSEL2, 3,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(68,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i4, MFSEL2, 4,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(69,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i5, MFSEL2, 5,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(70,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i6, MFSEL2, 6,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(71,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i7, MFSEL2, 7,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(72,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i8, MFSEL2, 8,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(73,=C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
i9, MFSEL2, 9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(74,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
10, MFSEL2, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(75,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
11, MFSEL2, 11,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(76,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
12, MFSEL2, 12,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(77,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
13, MFSEL2, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(78,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
14, MFSEL2, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(79,=C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
15, MFSEL2, 15,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(80,=C2=A0 =C2=A0 =C2=A0 =C2=A0pw=
m0, MFSEL2, 16,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(81,=C2=A0 =C2=A0 =C2=A0 =C2=A0pw=
m1, MFSEL2, 17,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(82,=C2=A0 =C2=A0 =C2=A0 =C2=A0pw=
m2, MFSEL2, 18,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(83,=C2=A0 =C2=A0 =C2=A0 =C2=A0pw=
m3, MFSEL2, 19,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(84,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(85,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(86,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(87,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(88,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(89,=C2=A0 =C2=A0 =C2=A0 rmii2, M=
FSEL1, 14,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(90,=C2=A0 =C2=A0 =C2=A0 r2err, M=
FSEL1, 15,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(91,=C2=A0 =C2=A0 =C2=A0 =C2=A0r2=
md, MFSEL1, 16,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(92,=C2=A0 =C2=A0 =C2=A0 =C2=A0r2=
md, MFSEL1, 16,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(93,=C2=A0 =C2=A0 =C2=A0 =C2=A0kb=
cc, MFSEL1, 17,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(94,=C2=A0 =C2=A0 =C2=A0 =C2=A0kb=
cc, MFSEL1, 17,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(95,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(96,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(97,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(98,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(99,=C2=A0 =C2=A0 =C2=A0 =C2=A0no=
ne, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(100,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(101,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(102,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(103,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(104,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(105,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(106,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(107,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(108,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(109,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(110,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(111,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(112,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(113,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(114,=C2=A0 =C2=A0 =C2=A0 smb0, M=
FSEL1, 6,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(115,=C2=A0 =C2=A0 =C2=A0 smb0, M=
FSEL1, 6,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(116,=C2=A0 =C2=A0 =C2=A0 smb1, M=
FSEL1, 7,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(117,=C2=A0 =C2=A0 =C2=A0 smb1, M=
FSEL1, 7,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(118,=C2=A0 =C2=A0 =C2=A0 smb2, M=
FSEL1, 8,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(119,=C2=A0 =C2=A0 =C2=A0 smb2, M=
FSEL1, 8,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(120,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(121,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(122,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(123,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(124,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(125,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(126,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PINCFG(127,=C2=A0 =C2=A0 =C2=A0 none, N=
ONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0), /* DVO */<b=
r>
+};<br>
+<br>
+#define WPCM450_PIN(n)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(n, &qu=
ot;gpio&quot; #n)<br>
+<br>
+static const struct pinctrl_pin_desc wpcm450_pins[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(0),=C2=A0 =C2=A0WPCM450_PIN(1),=C2=
=A0 =C2=A0WPCM450_PIN(2),=C2=A0 =C2=A0WPCM450_PIN(3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(4),=C2=A0 =C2=A0WPCM450_PIN(5),=C2=
=A0 =C2=A0WPCM450_PIN(6),=C2=A0 =C2=A0WPCM450_PIN(7),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(8),=C2=A0 =C2=A0WPCM450_PIN(9),=C2=
=A0 =C2=A0WPCM450_PIN(10),=C2=A0 WPCM450_PIN(11),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(12),=C2=A0 WPCM450_PIN(13),=C2=A0 W=
PCM450_PIN(14),=C2=A0 WPCM450_PIN(15),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(16),=C2=A0 WPCM450_PIN(17),=C2=A0 W=
PCM450_PIN(18),=C2=A0 WPCM450_PIN(19),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(20),=C2=A0 WPCM450_PIN(21),=C2=A0 W=
PCM450_PIN(22),=C2=A0 WPCM450_PIN(23),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(24),=C2=A0 WPCM450_PIN(25),=C2=A0 W=
PCM450_PIN(26),=C2=A0 WPCM450_PIN(27),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(28),=C2=A0 WPCM450_PIN(29),=C2=A0 W=
PCM450_PIN(30),=C2=A0 WPCM450_PIN(31),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(32),=C2=A0 WPCM450_PIN(33),=C2=A0 W=
PCM450_PIN(34),=C2=A0 WPCM450_PIN(35),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(36),=C2=A0 WPCM450_PIN(37),=C2=A0 W=
PCM450_PIN(38),=C2=A0 WPCM450_PIN(39),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(40),=C2=A0 WPCM450_PIN(41),=C2=A0 W=
PCM450_PIN(42),=C2=A0 WPCM450_PIN(43),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(44),=C2=A0 WPCM450_PIN(45),=C2=A0 W=
PCM450_PIN(46),=C2=A0 WPCM450_PIN(47),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(48),=C2=A0 WPCM450_PIN(49),=C2=A0 W=
PCM450_PIN(50),=C2=A0 WPCM450_PIN(51),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(52),=C2=A0 WPCM450_PIN(53),=C2=A0 W=
PCM450_PIN(54),=C2=A0 WPCM450_PIN(55),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(56),=C2=A0 WPCM450_PIN(57),=C2=A0 W=
PCM450_PIN(58),=C2=A0 WPCM450_PIN(59),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(60),=C2=A0 WPCM450_PIN(61),=C2=A0 W=
PCM450_PIN(62),=C2=A0 WPCM450_PIN(63),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(64),=C2=A0 WPCM450_PIN(65),=C2=A0 W=
PCM450_PIN(66),=C2=A0 WPCM450_PIN(67),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(68),=C2=A0 WPCM450_PIN(69),=C2=A0 W=
PCM450_PIN(70),=C2=A0 WPCM450_PIN(71),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(72),=C2=A0 WPCM450_PIN(73),=C2=A0 W=
PCM450_PIN(74),=C2=A0 WPCM450_PIN(75),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(76),=C2=A0 WPCM450_PIN(77),=C2=A0 W=
PCM450_PIN(78),=C2=A0 WPCM450_PIN(79),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(80),=C2=A0 WPCM450_PIN(81),=C2=A0 W=
PCM450_PIN(82),=C2=A0 WPCM450_PIN(83),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(84),=C2=A0 WPCM450_PIN(85),=C2=A0 W=
PCM450_PIN(86),=C2=A0 WPCM450_PIN(87),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(88),=C2=A0 WPCM450_PIN(89),=C2=A0 W=
PCM450_PIN(90),=C2=A0 WPCM450_PIN(91),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(92),=C2=A0 WPCM450_PIN(93),=C2=A0 W=
PCM450_PIN(94),=C2=A0 WPCM450_PIN(95),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(96),=C2=A0 WPCM450_PIN(97),=C2=A0 W=
PCM450_PIN(98),=C2=A0 WPCM450_PIN(99),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(100), WPCM450_PIN(101), WPCM450_PIN=
(102), WPCM450_PIN(103),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(104), WPCM450_PIN(105), WPCM450_PIN=
(106), WPCM450_PIN(107),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(108), WPCM450_PIN(109), WPCM450_PIN=
(110), WPCM450_PIN(111),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(112), WPCM450_PIN(113), WPCM450_PIN=
(114), WPCM450_PIN(115),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(116), WPCM450_PIN(117), WPCM450_PIN=
(118), WPCM450_PIN(119),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(120), WPCM450_PIN(121), WPCM450_PIN=
(122), WPCM450_PIN(123),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WPCM450_PIN(124), WPCM450_PIN(125), WPCM450_PIN=
(126), WPCM450_PIN(127),<br>
+};<br>
+<br>
+/* Enable mode in pin group */<br>
+static void wpcm450_setfunc(struct regmap *gcr_regmap, const unsigned int =
*pin,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int npins, int func)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct wpcm450_pincfg *cfg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; npins; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg =3D &amp;pincfg=
[pin[i]];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (func =3D=3D fn_=
gpio || cfg-&gt;fn0 =3D=3D func || cfg-&gt;fn1 =3D=3D func) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (cfg-&gt;reg0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, cfg-&g=
t;reg0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(cfg-&gt;bit0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cfg-&gt;fn0 =3D=3D func) ?=C2=A0 BIT(cfg-&gt;b=
it0) : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (cfg-&gt;reg1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(gcr_regmap, cfg-&g=
t;reg1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(cfg-&gt;bit1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cfg-&gt;fn1 =3D=3D func) ?=C2=A0 BIT(cfg-&gt;b=
it1) : 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static int wpcm450_get_groups_count(<wbr>struct pinctrl_dev *pctldev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ARRAY_SIZE(wpcm450_groups);<br>
+}<br>
+<br>
+static const char *wpcm450_get_group_name(struct pinctrl_dev *pctldev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0un=
signed int selector)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return wpcm450_groups[selector].name;<br>
+}<br>
+<br>
+static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned int **pins,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *npins)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*npins =3D wpcm450_groups[selector].num_<wbr>pi=
ns;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*pins=C2=A0 =3D wpcm450_groups[selector].pins;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int wpcm450_dt_node_to_map(struct pinctrl_dev *pctldev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np_config,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_map **map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 *num_maps)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return pinconf_generic_dt_node_to_<wbr>map(pctl=
dev, np_config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0map, num_maps,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PIN_MAP_TYPE_INVALID);<br>
+}<br>
+<br>
+static void wpcm450_dt_free_map(struct pinctrl_dev *pctldev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pinctrl_map *map, u32 num_maps=
)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(map);<br>
+}<br>
+<br>
+static const struct pinctrl_ops wpcm450_pinctrl_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_groups_count =3D wpcm450_get_groups_count,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_group_name =3D wpcm450_get_group_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_group_pins =3D wpcm450_get_group_pins,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_node_to_map =3D wpcm450_dt_node_to_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dt_free_map =3D wpcm450_dt_free_map,<br>
+};<br>
+<br>
+static int wpcm450_get_functions_count(<wbr>struct pinctrl_dev *pctldev)<b=
r>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ARRAY_SIZE(wpcm450_funcs);<br>
+}<br>
+<br>
+static const char *wpcm450_get_function_name(<wbr>struct pinctrl_dev *pctl=
dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unsigned int function)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return wpcm450_funcs[function].name;<br>
+}<br>
+<br>
+static int wpcm450_get_function_groups(<wbr>struct pinctrl_dev *pctldev,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int fu=
nction,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char * co=
nst **groups,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int * =
const ngroups)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*ngroups =3D wpcm450_funcs[function].<wbr>ngrou=
ps;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*groups=C2=A0 =3D wpcm450_funcs[function].<wbr>=
groups;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int function,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int group)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_g=
et_drvdata(<wbr>pctldev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wpcm450_setfunc(pctrl-&gt;gcr_<wbr>regmap, wpcm=
450_groups[group].pins,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0wpcm450_groups[group].num_<wbr>pins, function);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct pinmux_ops wpcm450_pinmux_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_functions_count =3D wpcm450_get_functions_=
count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_function_name =3D wpcm450_get_function_nam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_function_groups =3D wpcm450_get_function_g=
roups,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.set_mux =3D wpcm450_pinmux_set_mux,<br>
+};<br>
+<br>
+static int debounce_bitnum(int gpio)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gpio &gt;=3D 0 &amp;&amp; gpio &lt; 16)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+}<br>
+<br>
+static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned int pi=
n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long *config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_g=
et_drvdata(<wbr>pctldev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum pin_config_param param =3D pinconf_to_conf=
ig_param(*<wbr>config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (param) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PIN_CONFIG_INPUT_DEBOUNCE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D debounce_bi=
tnum(pin);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&=
amp;pctrl-&gt;<wbr>lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D ioread32(pc=
trl-&gt;gpio_base + WPCM450_GPEVDBNC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrest=
ore(&amp;pctrl-<wbr>&gt;lock, flags);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*config =3D pinconf=
_to_config_packed(<wbr>param, !!(reg &amp; BIT(bit)));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUPP;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int wpcm450_config_set_one(struct wpcm450_pinctrl *pctrl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int pin, unsigned lon=
g config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0enum pin_config_param param =3D pinconf_to_conf=
ig_param(<wbr>config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long reg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bit;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int arg;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (param) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case PIN_CONFIG_INPUT_DEBOUNCE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit =3D debounce_bi=
tnum(pin);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bit &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return bit;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arg =3D pinconf_to_=
config_argument(<wbr>config);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&=
amp;pctrl-&gt;<wbr>lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D ioread32(pc=
trl-&gt;gpio_base + WPCM450_GPEVDBNC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assign_bit(bit, &=
amp;reg, arg);</blockquote><div><br></div><div>=C2=A0In all these cases are=
 you really need to use __assign_bit() APIs? I don=E2=80=99t see that this =
goes any higher than 32-bit.</div><div><br></div><div>It=E2=80=99s not a bi=
g deal though.</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite32(reg, pctr=
l-&gt;gpio_base + WPCM450_GPEVDBNC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrest=
ore(&amp;pctrl-<wbr>&gt;lock, flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOTSUPP;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int wpcm450_config_set(struct pinctrl_dev *pctldev, unsigned int pi=
n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long *configs, unsigned int num_con=
figs)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_g=
et_drvdata(<wbr>pctldev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (num_configs--) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wpcm450_con=
fig_set_one(pctrl, pin, *configs++);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct pinconf_ops wpcm450_pinconf_ops =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.is_generic =3D true,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_config_get =3D wpcm450_config_get,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pin_config_set =3D wpcm450_config_set,<br>
+};<br>
+<br>
+static struct pinctrl_desc wpcm450_pinctrl_desc =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;wpcm450-pinctrl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pins =3D wpcm450_pins,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.npins =3D ARRAY_SIZE(wpcm450_pins),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pctlops =3D &amp;wpcm450_pinctrl_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pmxops =3D &amp;wpcm450_pinmux_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.confops =3D &amp;wpcm450_pinconf_ops,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>
+};<br>
+<br>
+static int wpcm450_gpio_set_config(struct gpio_chip *chip,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int offset, unsigned=
 long config)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio *gpio =3D gpiochip_get_data=
(chip);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return wpcm450_config_set_one(gpio-&gt;<wbr>pct=
rl, offset, config);<br>
+}<br>
+<br>
+static int wpcm450_gpio_register(struct platform_device *pdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct wpcm450_pinctrl *pctrl)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fwnode_handle *np;</blockquote><div>=C2=
=A0</div><div>=C2=A0Either be fully OF, or don=E2=80=99t name =E2=80=98np&#=
39; here. We usually use fwnode or =E2=80=98child=E2=80=99 in this case.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;gpio_base =3D devm_platform_ioremap_<=
wbr>resource(pdev, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pctrl-&gt;gpio_base) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pctrl-&gt;d=
ev, &quot;Resource fail for GPIO controller\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;</bl=
ockquote><div><br></div><div>dev_err_probe(), ditto for the rest in -&gt;pr=
obe().</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fwnode_for_each_available_<wbr>child_node(pctrl=
-&gt;dev-&gt;fwnode, np) {</blockquote><div><br></div><div>Please, do not d=
ereference fwnode, instead use analogue from device_*() APIs. Hence, replac=
e fwnode.h with property.h.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *dat =
=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *set =
=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *dirou=
t =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags=
 =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct wpcm45=
0_bank *bank;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_gpio=
 *gpio;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct gpio_irq_chi=
p *girq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 interrupt_map[3=
];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int reg, i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fwnode_propert=
y_read_bool(<wbr>np, &quot;gpio-controller&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fwnode_prop=
erty_read_u32(np, &quot;reg&quot;, &amp;reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D &amp;pctrl=
-&gt;gpio_bank[reg];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;pctrl =3D =
pctrl;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg &lt; 0 || r=
eg &gt; WPCM450_NUM_BANKS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(pctrl-&gt;dev, &quot;GPIO index %d out of range!\n&quot;,=
 reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bank =3D &amp;wpcm4=
50_banks[reg];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dat =3D pctrl-&gt;g=
pio_base + bank-&gt;datain;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bank-&gt;dataou=
t) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0set =3D pctrl-&gt;gpio_base + bank-&gt;dataout;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dirout =3D pctrl-&gt;gpio_base + bank-&gt;cfg0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags =3D BGPIOF_NO_OUTPUT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bgpio_init(=
&amp;gpio-&gt;gc, pctrl-&gt;dev, 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dat, set, NULL, dirout, NULL, flags)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(pctrl-&gt;dev, &quot;GPIO initialization failed: %d\n&quo=
t;, ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;gc.ngpio =
=3D bank-&gt;length;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;gc.set_con=
fig =3D wpcm450_gpio_set_config;</blockquote><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;gc.of_node=
 =3D to_of_node(np);</blockquote><div><br></div><div>I hope we will soon ha=
ve fwnode in gpio_chip.</div><div>=C2=A0</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;gc.parent =
=3D pctrl-&gt;dev;<br><br></blockquote><div><br></div><div>Set by bgpio_ini=
t(), also check for other potential duplications.</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-&gt;irqc =3D w=
pcm450_gpio_irqchip;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq =3D &amp;gpio-=
&gt;gc.irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;chip =3D &=
amp;gpio-&gt;irqc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;parent_han=
dler =3D wpcm450_gpio_irqhandler;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;parents =
=3D devm_kcalloc(pctrl-&gt;dev, WPCM450_NUM_GPIO_IRQS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sizeof(*girq-&gt;parents), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!girq-&gt;paren=
ts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;default_ty=
pe =3D IRQ_TYPE_NONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;handler =
=3D handle_bad_irq;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0girq-&gt;num_parent=
s =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; WPCM450_NUM_GPIO_IRQS; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int irq =3D fwnode_irq_get(np, i);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (irq &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0girq-&gt;parents[i] =3D irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0girq-&gt;num_parents++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fwnode_prop=
erty_read_u32_<wbr>array(np, &quot;nuvoton,interrupt-map&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt_map, ARRAY_SIZE(interrupt_map)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpio-&gt;first_irq_bit =3D interrupt_map[0];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpio-&gt;num_irqs =3D interrupt_map[1];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpio-&gt;first_irq_gpio =3D interrupt_map[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_gpioch=
ip_add_data(pctrl-&gt;<wbr>dev, &amp;gpio-&gt;gc, gpio);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(pctrl-&gt;dev, &quot;Failed to add GPIO chip: %d\n&quot;,=
 ret);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D gpiochip_ad=
d_pin_range(&amp;gpio-&gt;<wbr>gc, dev_name(pctrl-&gt;dev),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0, bank-&gt;base, bank-&gt;length);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(pctrl-&gt;dev, &quot;Failed to add pin range for GPIO ban=
k %u\n&quot;, reg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}</blockquote><div>=
<br></div><div><br></div><div>Please move it to the corresponding callback.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int wpcm450_pinctrl_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct wpcm450_pinctrl *pctrl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pctrl =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeo=
f(*pctrl), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pctrl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;dev =3D &amp;pdev-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;pctrl-&gt;lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(&amp;pdev-&gt;dev, pctrl);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;gcr_regmap =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syscon_regmap_looku=
p_by_<wbr>compatible(&quot;nuvoton,wpcm450-<wbr>gcr&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pctrl-&gt;gcr_regmap)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(pctrl=
-&gt;dev, PTR_ERR(pctrl-&gt;gcr_regmap),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to find nuvoton,wpcm450-gcr\n&q=
uot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pctr=
l-&gt;gcr_regmap);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pctrl-&gt;pctldev =3D devm_pinctrl_register(&am=
p;pdev-&gt;<wbr>dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;wpcm450_pinctrl_desc, pctrl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pctrl-&gt;pctldev)) {</blockquote><d=
iv><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err_probe(&amp;=
pdev-&gt;dev, PTR_ERR(pctrl-&gt;pctldev),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to register pinctrl device\n&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pctr=
l-&gt;pctldev);</blockquote><div><br></div><div>You may combine those two i=
n one return statement.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wpcm450_gpio_register(pdev, pctrl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static const struct of_device_id wpcm450_pinctrl_match[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;nuvoton,wpcm450-pinctrl=
&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
+};<br>
+MODULE_DEVICE_TABLE(of, wpcm450_pinctrl_match);<br>
+<br>
+static struct platform_driver wpcm450_pinctrl_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D wpcm450_pinctrl_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;wpc=
m450-pinctrl&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 wpcm450_pinctrl_match,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+module_platform_driver(<wbr>wpcm450_pinctrl_driver);<br>
+<br>
+MODULE_LICENSE(&quot;GPL v2&quot;);<br>
+MODULE_AUTHOR(&quot;Jonathan Neusch=C3=A4fer &lt;<a href=3D"mailto:j.neusc=
haefer@gmx.net">j.neuschaefer@gmx.net</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Nuvoton WPCM450 Pinctrl and GPIO driver&quot;);<b=
r>
--<br>
2.30.2<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--00000000000017044b05d2a0bbf3--
