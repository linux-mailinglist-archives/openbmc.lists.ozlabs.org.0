Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFF398A0B
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw86G1qnKz2ysq
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:51:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J8AgUZxt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J8AgUZxt; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw85z30ZSz2xZB
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:51:01 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 l23-20020a17090a0717b029016ae774f973so1070039pjl.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Jun 2021 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vn58VojIUy8mCywESz1yU7iWzpyR5VYyYaPU788UxQY=;
 b=J8AgUZxtt2QyU6gTbLL/F8NoI+vL+rbIhgwrTIHDKyVFDlK8qJYrqPpUB3sqfB0L91
 gR9F5OLKvtQ9iiHE3iyVIaBersOK0NObdB2IB8NGbXYbXGNGx2ic06StlFYeH5tQ2jui
 wXAMEbQFbXxxuXRn28vReE897gVwlMOJVGscRkpjZZJRFixL9WNTyCwK6ordL8LmFX69
 LR22hwEMzmNUWHmxk1HfEpqlidF3dslOfjzdrfuDFZuCrT1PP1t3PHWfGHPbAfjwkCMV
 lD4veRk65XkZVOwvV6BA4qwQzxu8W+Hpfdw9wFv3X/Wa5Z12axRDLsC5u4iGuypi1BRd
 LswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vn58VojIUy8mCywESz1yU7iWzpyR5VYyYaPU788UxQY=;
 b=H4HyYNBSa1/uW7ypkF0QnobZ5OeeQu7ihonedgGfwjHjnYPYSoJfH5iWPPl9O0wVC7
 ug+kXA7W8PljeArlqivwPaZTxHvP1UT5C4i2BxAUuuQMzNz2s3GV/IFjd/nTYuiOLjpF
 AA42B6WI69etvsQAGwFuDT35Ig7nKc+Rf9ddV+m6swxzwxMLXE/uUSDv954o5Av38rFx
 va85ZCieQ2KZiyn15s4r8HSNWGqaZj/1mWf7kWCRdiPBAq+BKJHfNno4yK0PfYdl9FiW
 7jtwZrXU9WC9epOTZB6xDfehn15RM9Pu8lGeyxxVdGRZcAkkizM1l05C/jAA53P8/oAt
 70iA==
X-Gm-Message-State: AOAM531I03WlG0svfeX+pOSl2CbNsArcMvLnzoBjHmSilkqTwZALQMFb
 yjm/fnwxF0+raAUJfbx9MvMjEF7Yz8OZKZmHVVA=
X-Google-Smtp-Source: ABdhPJyC3O5EquhOikbreacbiTmOkvh3GFfjDMAS/bS++3MKZX0UR/loCL+OHjq30y5cvNzNn3wQst0AOQqk6l6Z5Ms=
X-Received: by 2002:a17:90a:80c5:: with SMTP id
 k5mr5534105pjw.129.1622638256172; 
 Wed, 02 Jun 2021 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-6-j.neuschaefer@gmx.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Jun 2021 15:50:39 +0300
Message-ID: <CAHp75Vci1DSFu-tpgwQZfuVycqHYmhGhLDDCOH_dX8HKvqpY_A@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 3:05 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> This driver is heavily based on the one for NPCM7xx, because the WPCM450
> is a predecessor of those SoCs.
>
> The biggest difference is in how the GPIO controller works. In the
> WPCM450, the GPIO registers are not organized in multiple banks, but
> rather placed continually into the same register block, and the driver
> reflects this.
>
> Some functionality implemented in the hardware was (for now) left unused
> in the driver, specifically blinking and pull-up/down.

...

> +config PINCTRL_WPCM450
> +       bool "Pinctrl and GPIO driver for Nuvoton WPCM450"

Why it can't be a module?

> +       depends on (ARCH_WPCM450 || COMPILE_TEST) && OF

Is it really OF dependent (see below)?

> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y here to enable pin controller and GPIO support
> +         for the Nuvoton WPCM450 SoC.

From this help it's not clear why user should or shouldn't enable it.
Please, elaborate (and hence fix checkpatch warning).

...

> +#include <linux/module.h>

mod_devicetable.h

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>

Can you move this group...

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

...here?

It will show the relation with pin control subsystem and separate from
global / generic headers.

...

> +       /*
> +        * This spinlock protects registers and struct wpcm450_pinctrl fi=
elds

spin lock

> +        * against concurrent access.
> +        */

...

> +/* GPIO handling in the pinctrl driver */
> +

Useless.

...

> +static int wpcm450_gpio_get_direction(struct gpio_chip *chip,
> +                                     unsigned int offset)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> +       const struct wpcm450_port *port =3D to_port(offset);
> +       unsigned long flags;
> +       u32 cfg0;
> +       int dir;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       if (port->cfg0) {
> +               cfg0 =3D ioread32(pctrl->gpio_base + port->cfg0);

> +               dir =3D !(cfg0 & port_mask(port, offset));
> +       } else {
> +               /* If cfg0 is unavailable, the GPIO is always an input */
> +               dir =3D 1;
> +       }

Why above is under spin lock?
Same question for all other similar places in different functions, if any.

> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +       return dir;
> +}

...

> +static int wpcm450_gpio_direction_output(struct gpio_chip *chip,
> +                                        unsigned int offset, int value)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> +       const struct wpcm450_port *port =3D to_port(offset);
> +       unsigned long flags;
> +       u32 dataout, cfg0;

> +       int ret =3D 0;

Redundant. Can do it without it.

> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       if (port->cfg0) {

> +       } else {
> +               ret =3D -EINVAL;
> +       }
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +       return ret;
> +}

...

> +/* Interrupt support */
> +

Useless besides being in a bad style.

...

> +static int event_bitmask(int gpio)
> +{
> +       if (gpio >=3D 0 && gpio < 16)
> +               return BIT(gpio);
> +       if (gpio =3D=3D 24 || gpio =3D=3D 25)
> +               return BIT(gpio - 8);
> +       return -EINVAL;
> +}

Can you consider to use bitmap_bitremap()

> +static int event_bitnum_to_gpio(int num)
> +{
> +       if (num >=3D 0 && num < 16)
> +               return num;
> +       if (num =3D=3D 16 || num =3D=3D 17)
> +               return num + 8;
> +       return -EINVAL;
> +}

Ditto.

See gpio-xilinx.c for example.

...

> +static void wpcm450_gpio_irq_ack(struct irq_data *d)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(irq_data_get_=
irq_chip_data(d));

> +       int mask =3D event_bitmask(d->hwirq);

Move the assignment closer to the check.
Ditto for other same and similar cases in the code.

> +       unsigned long flags;
> +
> +       if (mask < 0)
> +               return;

> +}

...

> +       int mask =3D event_bitmask(d->hwirq);

Use irqd_to_hwirq() (please check that I spelled it correctly).
Same for all hwirq getters.

...

> +static void wpcm450_gpio_fix_evpol(struct wpcm450_pinctrl *pctrl, unsign=
ed long all)
> +{
> +       int bitnum;

Can it be negative?

> +       for_each_set_bit(bitnum, &all, 32) {

> +               int gpio =3D event_bitnum_to_gpio(bitnum);
> +               u32 mask =3D BIT(bitnum), evpol;

unsigned long evpol;

> +               int level;
> +
> +               do {
> +                       evpol =3D ioread32(pctrl->gpio_base + WPCM450_GPE=
VPOL);
> +                       level =3D wpcm450_gpio_get(&pctrl->gc, gpio);

> +                       /* Switch event polarity to the opposite of the c=
urrent level */
> +                       if (level)
> +                               evpol &=3D ~mask;
> +                       else
> +                               evpol |=3D mask;

__assign_bit(bitnum, &evpol, level);

> +
> +                       iowrite32(evpol, pctrl->gpio_base + WPCM450_GPEVP=
OL);
> +               } while (wpcm450_gpio_get(&pctrl->gc, gpio) !=3D level);
> +       }
> +}

...

> +static int wpcm450_gpio_set_irq_type(struct irq_data *d, unsigned int fl=
ow_type)
> +{

Consider to assign handler type here.

> +}

...

> +/* pinmux handing */
> +

Useless.

...

> +/*
> + * pin:             name, number
> + * group:    name, npins,   pins
> + * function: name, ngroups, groups
> + */
> +struct wpcm450_group {
> +       const char *name;
> +       const unsigned int *pins;
> +       int npins;
> +};

Use struct group_desc from core.h.

...

> +/* pinctrl_ops */

Useless.

> +static int wpcm450_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +       struct wpcm450_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev)=
;

> +       dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(wpcm450_groups)=
);

Ditto.

> +       return ARRAY_SIZE(wpcm450_groups);
> +}

...

> +/* pinmux_ops  */

Useless.

...

> +static int wpcm450_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                      struct pinctrl_gpio_range *range,
> +                                      unsigned int offset)
> +{
> +       struct wpcm450_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev)=
;

> +       if (!range) {
> +               dev_err(npcm->dev, "invalid range\n");
> +               return -EINVAL;
> +       }

Dead code?

> +       if (!range->gc) {
> +               dev_err(npcm->dev, "invalid gpiochip\n");
> +               return -EINVAL;
> +       }

Dead code?

> +       wpcm450_setfunc(npcm->gcr_regmap, &offset, 1, fn_gpio);
> +
> +       return 0;
> +}

...

> +/* Release GPIO back to pinctrl mode */
> +static void wpcm450_gpio_request_free(struct pinctrl_dev *pctldev,
> +                                     struct pinctrl_gpio_range *range,
> +                                     unsigned int offset)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +       int virq;
> +
> +       virq =3D irq_find_mapping(pctrl->domain, offset);
> +       if (virq)
> +               irq_dispose_mapping(virq);

Why it needs to be done here? What about the GPIO library API that
does some additional stuff?

> +}

...

> +/* pinconf_ops */

Useless.

...

> +static int debounce_bitmask(int gpio)
> +{
> +       if (gpio >=3D 0 && gpio < 16)
> +               return BIT(gpio);
> +       return -EINVAL;
> +}

I don't see users of it except one below, care to inline?

> +static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned int =
pin,
> +                             unsigned long *config)
> +{

> +       switch (param) {
> +       case PIN_CONFIG_INPUT_DEBOUNCE:
> +               mask =3D debounce_bitmask(pin);
> +               if (mask < 0)
> +                       return mask;

> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}

...

> +/* Set multiple configuration settings for a pin */

Useless.

...

> +static int wpcm450_config_set(struct pinctrl_dev *pctldev, unsigned int =
pin,
> +                             unsigned long *configs, unsigned int num_co=
nfigs)
> +{
> +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev=
);

> +       int rc;

Why out of a sudden different (inconsistent) name?

> +       return 0;
> +}

...

> +       if (!of_find_property(np, "gpio-controller", NULL))
> +               return -ENODEV;

Dead code?

...

> +       pctrl->gpio_base =3D of_iomap(np, 0);

devm_platform_ioremap_resource();

> +       if (!pctrl->gpio_base) {
> +               dev_err(pctrl->dev, "Resource fail for GPIO controller\n"=
);
> +               return -ENOMEM;
> +       }

Here leak of resources. See above.

...

> +       pctrl->gc.get_direction =3D wpcm450_gpio_get_direction;
> +       pctrl->gc.direction_input =3D wpcm450_gpio_direction_input;
> +       pctrl->gc.direction_output =3D wpcm450_gpio_direction_output;
> +       pctrl->gc.get =3D wpcm450_gpio_get;
> +       pctrl->gc.set =3D wpcm450_gpio_set;

No ->set_config()?

...

> +       girq->default_type =3D IRQ_TYPE_NONE;

> +       girq->handler =3D handle_level_irq;

Use ->irq_set_type() for this. Here should be handle_bad_irq().

> +       for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {

> +               int irq =3D irq_of_parse_and_map(np, i);

fwnode_get_irq()

> +               if (irq < 0) {
> +                       dev_err(pctrl->dev, "No IRQ for GPIO controller\n=
");
> +                       return irq;
> +               }
> +               girq->parents[i] =3D irq;
> +       }

...

> +       pctrl->pctldev =3D devm_pinctrl_register(&pdev->dev,
> +                                              &wpcm450_pinctrl_desc, pct=
rl);
> +       if (IS_ERR(pctrl->pctldev)) {

> +               dev_err(&pdev->dev, "Failed to register pinctrl device\n"=
);
> +               return PTR_ERR(pctrl->pctldev);

Shouldn't it be return dev_err_probe(...); here?

> +       }

...

> +       pr_info("WPCM450 pinctrl and GPIO driver probed\n");

Besides you have to use dev_*() this is completely useless and noisy messag=
e.

...

> +static const struct of_device_id wpcm450_pinctrl_match[] =3D {
> +       { .compatible =3D "nuvoton,wpcm450-pinctrl" },

> +       { },

Comma is not needed for terminator line.

> +};

...

> +               .suppress_bind_attrs =3D true,

Why?

--=20
With Best Regards,
Andy Shevchenko
