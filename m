Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11083A515C
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 01:21:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2Ycc6QtYz306H
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 09:21:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=gQGjR01I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gQGjR01I; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2YcF5Ly3z2yxy
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jun 2021 09:20:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623540048;
 bh=A6EiHFQChUwoCwCNHJRqSr/tlgRdMk7soU/bPhk5qqg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gQGjR01IYHiAo9SMgyjxnfwtnE75Yl2ZuYIMGkYPpHvkNCWVMicZa80nfilUAYg43
 6xxDSoGKux3WCJCRMdRzMMsL+VqGlhthvlBab7Hf3SXP/RVT/pWn24VYOvzSyOFGL3
 njAYzXX+x0MdchIYRV5q0fiDhk/OageSm6z31xkc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7i8Y-1lFHbG0Spe-014jIs; Sun, 13
 Jun 2021 01:20:48 +0200
Date: Sun, 13 Jun 2021 01:20:46 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YMVBTp4VaSilFi0H@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net>
 <CAHp75Vci1DSFu-tpgwQZfuVycqHYmhGhLDDCOH_dX8HKvqpY_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uPkaMfeALKz4V0GP"
Content-Disposition: inline
In-Reply-To: <CAHp75Vci1DSFu-tpgwQZfuVycqHYmhGhLDDCOH_dX8HKvqpY_A@mail.gmail.com>
X-Provags-ID: V03:K1:sYl8FRKhC/zy5Dl8T+FCeQbpSjMHdxx6VcayacQV8VSiN5EiaOD
 PZ3dcFytxvegfAMO64dKgC3971T83j6LZsX61n3M16Dz0Bpjj+giPrbUeU8GoPEbryIvikW
 1M0Gi4/VwbkmNbSYMI3HbmQwhVqf0VDyNCgBZB1u6OnAdq6OfLaPQd1el5MDtajzoSjDhV4
 kzPlxMwiPbiz6ZCTrI0CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YLSLnnmTFy4=:e6l+EdPMV1M3ZqpsQIt4hg
 sYZTCbdtDYa7yV0JcmpHDPEqcLwOiU3vTiuZ6T9TMf6EYGXnvMIZdRJfQ5xahnQ+7JYwvRNKZ
 rSU7g8V6z8ocHFOO2Rrq61QZGBvfUee2ld9AQ5ETvB54aVpFOm6QvIhNlO+2dw2kuxSuQSJyL
 XE91j+d0aDmZfIhAeCbTpme9d3kRNUrjn6fv5aKq2F4GKfyGXEoje47cUi7THsmwOpkW3W1OL
 3kpXafonjJZVm5AMXvf1DfKvBKq111udynngWQUjls2iS7uAfghZmnfH8tREiOkI4QRNV7MrV
 I3iIAsA5Yc1b165XamEq7/jz7XjOtiRRDPvU0RXpeH0zJz8TvQw9/qKBNKSZR21nOSb/sfrYl
 2k8+AmJCJ13AtKD3xmxLUHHbNNcEa2vN1UjgggqWBBAvYMCuS6hpuoF7fZYMxNI10LpiKPXr2
 PpqdIk14Ng5yFTFWJAZXOZg73sT7DuDVQDAXeTRyM/YZ68JGC0psaqc7Bv35Pl0R/edLix8x1
 H05xJp7kOVmTZ4+7/7pDd/z5Th932nmxYROU2JHpez94i2Iwu2pUD4Y9xnUoKxmPqIsBmDr+5
 ceE54mflUzmt9IY5iRBOkp3gKxMeRNRoYlGLm3riZdabp9yOz4vpPLlcOS6x7IwWEm20hHh3l
 niq2SmWy+pofZh/0EU8qqSUZK8IAUVp3gmXyJLIUYIKakj8rG9wIQITqqjG7on9+C+uH8pDol
 U3nU8uex+KyDIwRzepXvfkfR7WN5cowYoAQPHJqNvPGxiRaLd93DpnC2MHOYzLrj06KqPDgXR
 5yx8UpsgqWJlTwE3mUI0twE41aynRSIZwxzGd34ZCIXAQ6IyghgkJsklrNw6OW0iA7dweIuXT
 BdBx93hLGqlQOXAprsty+XqE4ClHg2CPN/wVwi+7tdBO86zXguF1zuYePBE0gpXb6s2xoUivW
 JjlCUfk/8u5qOzeytuCnXATRNeUAC+qJ/FvDLwFxmaOEYYghkvBcmPUo6zW29EeLi+cj5KZ6f
 6Fw3VJnEFKoKxP0oryYImDuN299/oxXSrO/h3xn6jNkhmCicWL0JQXWykw+uUHTYdbWoYM2Ni
 OK7Dp8l4q5EQGIsvy3UqeuIKMSPnqfy5kL6MNpZenCVRBR0ckq6A3oJ2w==
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--uPkaMfeALKz4V0GP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 02, 2021 at 03:50:39PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 2, 2021 at 3:05 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > This driver is heavily based on the one for NPCM7xx, because the WPCM450
> > is a predecessor of those SoCs.
> >
> > The biggest difference is in how the GPIO controller works. In the
> > WPCM450, the GPIO registers are not organized in multiple banks, but
> > rather placed continually into the same register block, and the driver
> > reflects this.
> >
> > Some functionality implemented in the hardware was (for now) left unused
> > in the driver, specifically blinking and pull-up/down.
>=20
> ...
>=20
> > +config PINCTRL_WPCM450
> > +       bool "Pinctrl and GPIO driver for Nuvoton WPCM450"
>=20
> Why it can't be a module?

My mistake, it does indeed work as a module. I'll change it to tristate.

> > +       depends on (ARCH_WPCM450 || COMPILE_TEST) && OF
>=20
> Is it really OF dependent (see below)?

After switching to the fwnode API, no. I'll drop the dependency.

> > +       select PINMUX
> > +       select PINCONF
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIO_GENERIC
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         Say Y here to enable pin controller and GPIO support
> > +         for the Nuvoton WPCM450 SoC.
>=20
> >From this help it's not clear why user should or shouldn't enable it.
> Please, elaborate (and hence fix checkpatch warning).

I'll try something like this, but I'm open for better ideas:

	help
	  Say Y or M here to enable pin controller and GPIO support for
	  the Nuvoton WPCM450 SoC. This is strongly recommended when
	  building a kernel that will run on this chip.

	  If this driver is compiled as a module, it will be named
	  pinctrl-wpcm450.


I could mention some examples of functionality enabled by this driver:
LEDs, host power control, Ethernet.

(LEDs and host power control use GPIOs, at least on the Supermicro X9
 board I've been using. Ethernet MDIO must be enabled through the
 pinctrl driver, unless the bootloader has done so already; on my board
 the bootloader doesn't do this.)


> > +#include <linux/module.h>
>=20
> mod_devicetable.h

I'll add it.

>=20
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_irq.h>
>=20
> > +#include <linux/pinctrl/machine.h>
> > +#include <linux/pinctrl/pinconf.h>
> > +#include <linux/pinctrl/pinconf-generic.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
>=20
> Can you move this group...
>=20
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>=20
> ...here?
>=20
> It will show the relation with pin control subsystem and separate from
> global / generic headers.

Will do.


> > +        * This spinlock protects registers and struct wpcm450_pinctrl =
fields
>=20
> spin lock

Ok


> > +/* GPIO handling in the pinctrl driver */
> > +
>=20
> Useless.

Ok

>=20
> ...
>=20
> > +static int wpcm450_gpio_get_direction(struct gpio_chip *chip,
> > +                                     unsigned int offset)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > +       const struct wpcm450_port *port =3D to_port(offset);
> > +       unsigned long flags;
> > +       u32 cfg0;
> > +       int dir;
> > +
> > +       spin_lock_irqsave(&pctrl->lock, flags);
> > +       if (port->cfg0) {
> > +               cfg0 =3D ioread32(pctrl->gpio_base + port->cfg0);
>=20
> > +               dir =3D !(cfg0 & port_mask(port, offset));
> > +       } else {
> > +               /* If cfg0 is unavailable, the GPIO is always an input =
*/
> > +               dir =3D 1;
> > +       }
>=20
> Why above is under spin lock?
> Same question for all other similar places in different functions, if any.

My intention was to protect the ioread32. But given that it's just a
single MMIO read, this might be unnecessary.

wpcm450_gpio_direction_input and a few other functions implement a
read/modify/write cycle, where the lock makes more sense:

	spin_lock_irqsave(&pctrl->lock, flags);
	if (port->cfg0) {
		cfg0 =3D ioread32(pctrl->gpio_base + port->cfg0);
		cfg0 &=3D ~port_mask(port, offset);
		iowrite32(cfg0, pctrl->gpio_base + port->cfg0);
	}
	spin_unlock_irqrestore(&pctrl->lock, flags);

(Here, as above, the locking calls moved into the if block, but I'm not
 sure how much of an improvement that would be.)

>=20
> > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +       return dir;
> > +}
>=20
> ...
>=20
> > +static int wpcm450_gpio_direction_output(struct gpio_chip *chip,
> > +                                        unsigned int offset, int value)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > +       const struct wpcm450_port *port =3D to_port(offset);
> > +       unsigned long flags;
> > +       u32 dataout, cfg0;
>=20
> > +       int ret =3D 0;
>=20
> Redundant. Can do it without it.
>=20
> > +       spin_lock_irqsave(&pctrl->lock, flags);
> > +       if (port->cfg0) {
>=20
> > +       } else {
> > +               ret =3D -EINVAL;
> > +       }
> > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +       return ret;
> > +}

I'll refactor it to return -EINVAL early.


> > +/* Interrupt support */
> > +
>=20
> Useless besides being in a bad style.

Ok, will remove.
>=20
> ...
>=20
> > +static int event_bitmask(int gpio)
> > +{
> > +       if (gpio >=3D 0 && gpio < 16)
> > +               return BIT(gpio);
> > +       if (gpio =3D=3D 24 || gpio =3D=3D 25)
> > +               return BIT(gpio - 8);
> > +       return -EINVAL;
> > +}
>=20
> Can you consider to use bitmap_bitremap()

> > +static int event_bitnum_to_gpio(int num)
> > +{
> > +       if (num >=3D 0 && num < 16)
> > +               return num;
> > +       if (num =3D=3D 16 || num =3D=3D 17)
> > +               return num + 8;
> > +       return -EINVAL;
> > +}
>=20
> Ditto.
>=20
> See gpio-xilinx.c for example.

I looked at it now. I'm not convinced it'll improve readability here.

>=20
> ...
>=20
> > +static void wpcm450_gpio_irq_ack(struct irq_data *d)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D gpiochip_get_data(irq_data_ge=
t_irq_chip_data(d));
>=20
> > +       int mask =3D event_bitmask(d->hwirq);
>=20
> Move the assignment closer to the check.
> Ditto for other same and similar cases in the code.

Will do.

>=20
> > +       unsigned long flags;
> > +
> > +       if (mask < 0)
> > +               return;
>=20
> > +}
>=20
> ...
>=20
> > +       int mask =3D event_bitmask(d->hwirq);
>=20
> Use irqd_to_hwirq() (please check that I spelled it correctly).
> Same for all hwirq getters.

Will do.

>=20
> ...
>=20
> > +static void wpcm450_gpio_fix_evpol(struct wpcm450_pinctrl *pctrl, unsi=
gned long all)
> > +{
> > +       int bitnum;
>=20
> Can it be negative?

No. I'll change it to unsigned int.
>=20
> > +       for_each_set_bit(bitnum, &all, 32) {
>=20
> > +               int gpio =3D event_bitnum_to_gpio(bitnum);
> > +               u32 mask =3D BIT(bitnum), evpol;
>=20
> unsigned long evpol;
>=20
> > +               int level;
> > +
> > +               do {
> > +                       evpol =3D ioread32(pctrl->gpio_base + WPCM450_G=
PEVPOL);
> > +                       level =3D wpcm450_gpio_get(&pctrl->gc, gpio);
>=20
> > +                       /* Switch event polarity to the opposite of the=
 current level */
> > +                       if (level)
> > +                               evpol &=3D ~mask;
> > +                       else
> > +                               evpol |=3D mask;
>=20
> __assign_bit(bitnum, &evpol, level);

Ah, very useful. I'll use __assign_bit in a few places.


> > +static int wpcm450_gpio_set_irq_type(struct irq_data *d, unsigned int =
flow_type)
> > +{
>=20
> Consider to assign handler type here.

Will do.


> > +/* pinmux handing */
> > +
>=20
> Useless.

Ok.


> > +/*
> > + * pin:             name, number
> > + * group:    name, npins,   pins
> > + * function: name, ngroups, groups
> > + */
> > +struct wpcm450_group {
> > +       const char *name;
> > +       const unsigned int *pins;
> > +       int npins;
> > +};
>=20
> Use struct group_desc from core.h.

Ok.

> > +/* pinctrl_ops */
>=20
> Useless.

Ok

>=20
> > +static int wpcm450_get_groups_count(struct pinctrl_dev *pctldev)
> > +{
> > +       struct wpcm450_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctlde=
v);
>=20
> > +       dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(wpcm450_group=
s));
>=20
> Ditto.

Removing this and similar messages.


> > +/* pinmux_ops  */
>=20
> Useless.

Ok

>=20
> ...
>=20
> > +static int wpcm450_gpio_request_enable(struct pinctrl_dev *pctldev,
> > +                                      struct pinctrl_gpio_range *range,
> > +                                      unsigned int offset)
> > +{
> > +       struct wpcm450_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctlde=
v);

Oops, I forgot to change the name to pctrl here.

>=20
> > +       if (!range) {
> > +               dev_err(npcm->dev, "invalid range\n");
> > +               return -EINVAL;
> > +       }
>=20
> Dead code?

Indeed, the range pointer is checked in pin_request().

>=20
> > +       if (!range->gc) {
> > +               dev_err(npcm->dev, "invalid gpiochip\n");
> > +               return -EINVAL;
> > +       }
>=20
> Dead code?

=2E.. and range->gc isn't used here... I'll remove the check.
>=20
> > +       wpcm450_setfunc(npcm->gcr_regmap, &offset, 1, fn_gpio);
> > +
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +/* Release GPIO back to pinctrl mode */
> > +static void wpcm450_gpio_request_free(struct pinctrl_dev *pctldev,
> > +                                     struct pinctrl_gpio_range *range,
> > +                                     unsigned int offset)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctld=
ev);
> > +       int virq;
> > +
> > +       virq =3D irq_find_mapping(pctrl->domain, offset);
> > +       if (virq)
> > +               irq_dispose_mapping(virq);
>=20
> Why it needs to be done here?

I copied this function from the pinctrl-npcm7xx driver; I don't really
see a reason to call irq_dispose_mapping here.

> What about the GPIO library API that does some additional stuff?

I don't know which gpiolib function would be appropriate here, sorry.


> > +/* pinconf_ops */
>=20
> Useless.

Ok


> > +static int debounce_bitmask(int gpio)
> > +{
> > +       if (gpio >=3D 0 && gpio < 16)
> > +               return BIT(gpio);
> > +       return -EINVAL;
> > +}
>=20
> I don't see users of it except one below, care to inline?

It should have been used in wpcm450_config_set_one, but I missed that.

> > +static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned in=
t pin,
> > +                             unsigned long *config)
> > +{
>=20
> > +       switch (param) {
> > +       case PIN_CONFIG_INPUT_DEBOUNCE:
> > +               mask =3D debounce_bitmask(pin);
> > +               if (mask < 0)
> > +                       return mask;
>=20
> > +               break;
> > +       default:
> > +               return -ENOTSUPP;
> > +       }
> > +
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +/* Set multiple configuration settings for a pin */
>=20
> Useless.

Ok.

>=20
> ...
>=20
> > +static int wpcm450_config_set(struct pinctrl_dev *pctldev, unsigned in=
t pin,
> > +                             unsigned long *configs, unsigned int num_=
configs)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctld=
ev);
>=20
> > +       int rc;
>=20
> Why out of a sudden different (inconsistent) name?

No particular reason. I'll change it to ret.

>=20
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +       if (!of_find_property(np, "gpio-controller", NULL))
> > +               return -ENODEV;
>=20
> Dead code?

The point here was to check if the node is marked as a GPIO controller,
with the boolean property "gpio-controller" (so device_property_read_bool
would probably be more appropriate).

However, since the gpio-controller property is already defined as
required in the DT binding, I'm not sure it's worth checking here.

>=20
> ...
>=20
> > +       pctrl->gpio_base =3D of_iomap(np, 0);
>=20
> devm_platform_ioremap_resource();

Will change.
>=20
> > +       if (!pctrl->gpio_base) {
> > +               dev_err(pctrl->dev, "Resource fail for GPIO controller\=
n");
> > +               return -ENOMEM;
> > +       }
>=20
> Here leak of resources. See above.
>=20
> ...
>=20
> > +       pctrl->gc.get_direction =3D wpcm450_gpio_get_direction;
> > +       pctrl->gc.direction_input =3D wpcm450_gpio_direction_input;
> > +       pctrl->gc.direction_output =3D wpcm450_gpio_direction_output;
> > +       pctrl->gc.get =3D wpcm450_gpio_get;
> > +       pctrl->gc.set =3D wpcm450_gpio_set;
>=20
> No ->set_config()?

Good point, I'll hook it up to wpcm450_config_set_one().

>=20
> ...
>=20
> > +       girq->default_type =3D IRQ_TYPE_NONE;
>=20
> > +       girq->handler =3D handle_level_irq;
>=20
> Use ->irq_set_type() for this. Here should be handle_bad_irq().

Ok.

>=20
> > +       for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
>=20
> > +               int irq =3D irq_of_parse_and_map(np, i);
>=20
> fwnode_get_irq()

Indeed, will switch to fwnode_irq_get.

>=20
> > +               if (irq < 0) {
> > +                       dev_err(pctrl->dev, "No IRQ for GPIO controller=
\n");
> > +                       return irq;
> > +               }
> > +               girq->parents[i] =3D irq;
> > +       }
>=20
> ...
>=20
> > +       pctrl->pctldev =3D devm_pinctrl_register(&pdev->dev,
> > +                                              &wpcm450_pinctrl_desc, p=
ctrl);
> > +       if (IS_ERR(pctrl->pctldev)) {
>=20
> > +               dev_err(&pdev->dev, "Failed to register pinctrl device\=
n");
> > +               return PTR_ERR(pctrl->pctldev);
>=20
> Shouldn't it be return dev_err_probe(...); here?

It's so far a rare pattern after devm_pinctrl_register, but it makes
sense. Will change (in both cases above).

(Perhaps I should also use dev_err_probe in wpcm450_gpio_register, since
it's called from the probe function.)

>=20
> > +       }
>=20
> ...
>=20
> > +       pr_info("WPCM450 pinctrl and GPIO driver probed\n");
>=20
> Besides you have to use dev_*() this is completely useless and noisy mess=
age.

I'll remove this message and review the other messages.

>=20
> ...
>=20
> > +static const struct of_device_id wpcm450_pinctrl_match[] =3D {
> > +       { .compatible =3D "nuvoton,wpcm450-pinctrl" },
>=20
> > +       { },
>=20
> Comma is not needed for terminator line.

True, will remove.
>=20
> > +};
>=20
> ...
>=20
> > +               .suppress_bind_attrs =3D true,
>=20
> Why?

Copied from pinctrl-npcm7xx, but I see no reason to keep it.

>=20
> --=20
> With Best Regards,
> Andy Shevchenko


Thank you for your detailed review,
Jonthan Neusch=C3=A4fer

--uPkaMfeALKz4V0GP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDFQREACgkQCDBEmo7z
X9v0TQ/+OwG67/Uved7Ab1j8T6WsfT0CJFpMPsZDPYQJkkyJxzsOquwPMzeI/9nP
q6myzVigBZTsZFclrMpfSn6b8sa2oH9H5aYxc38oQ2muTuBF2J+McrpejTWWOXxE
SdMDhEys2VdtST1rT7Yejxy3pbl9l7CmbdCSc30/u1dlK09kvyKoa0OY52GS89Vl
XGPyTr+y3da3nmU7ZQwi3vl+dgmQ8BLYNBc03YVMFlDGqgiNJAv6ZNiMXfU74hcs
S+fJpfIf+vlw668KA3WcrLhr9HjHQBcvCPmSYJkNdluwIolRDRIpRO2NIIUwtPnM
CjLkzmZGLTpI91q12Ax3TJTxRpIfwv9yW9KQT/nRlT7OziKVUqtJHDVrK2a1rKEP
/AosvmC9T3TI7blrnG7M288732J84J336gEpi08fgLJKoDZGhGY3STRJzBzNcOb6
5I23Y+A4Y+q/RWOndsXKNpL2sB8M5HqqyO40qQRXlEy+F60amrXn4WK0rS6mboul
/rjuQ+bSG/isFF/xzeD276WPBG0JcHqxm0mbgGGZ7EGhy0IO1uqpV8ytlKYsONnc
NaH7L/sMcLbTMBKO1uaA9VcvI0pJQnN2kqrmxjc48VgXqM13JbTc21F5cbSKgbSo
t4JaEaQA/WHjtcD/vMum1VMWBUNbXXx+3aRIXJvYPk52gZopowA=
=ejJg
-----END PGP SIGNATURE-----

--uPkaMfeALKz4V0GP--
