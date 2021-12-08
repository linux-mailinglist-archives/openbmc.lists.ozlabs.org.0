Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A055246D4F6
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 14:59:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8JgL3GV4z308J
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 00:59:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Ru1aG8GH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Ru1aG8GH; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8Jfs4fjCz2xtN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 00:58:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638971912;
 bh=7Eg3IScLZlQ8RgUjucqJgEag0aj3KViS9R8cSVXV8Uo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Ru1aG8GHDnL3qXUO104NN9kONScyqExtQ49MaUtedCsUC70yiHSiuiexBEbihPxak
 aHErDIyLwXewIWpLXbkGY1Q/Lvf6h6nXYZzxGhgwexMBnGo6qlD53EN0xYVn6cVNB0
 l3JN4nUbLmVSlareF9C5vXq8uhydDJpZMlkyOtzI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N49h5-1mUjY90aLx-0105JW; Wed, 08
 Dec 2021 14:58:32 +0100
Date: Wed, 8 Dec 2021 14:58:30 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YbC6Bv2teZ5CFhFQ@latitude>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
 <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CHg/GwQ69HayOKZ7"
Content-Disposition: inline
In-Reply-To: <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
X-Provags-ID: V03:K1:pPeMjTogNdzh3gjQ9pEJ5uYq32w1jmY/d9rFIL82Aswolm1OMEw
 JyANYwPzerEJ1OMzbEid889My7mRaOZS6OBKL/dDFpeojzWUasbJDq6yHZzzN01vnbFd0d9
 s30lwOdkIFXKXNOd3w/7OX+sPpbx8K/axmGs6iyVlHii1/TNbmOYVnmQinYnYOtnanrtEgJ
 xq6F9IC5tUPCsA85L/HvA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:78+bNrVicwk=:TXfVkHdCijiCyaJqbT2U35
 WfsLX8U+us9FMzG97dj0ITWB4zUnQDnzsRPhJIFLDoNGtAcHc5RPuk60ZV+4VhNPZ+uxy+cEm
 XoVHPIMZvXMnisCcrKo2+GmlnLYihAHOhcNneLxaFEigsHls16+G0V5d9DnRDElfsLk/UVISL
 hbUAWEBInHZBGF7EVI1VJJWRc1UKmkrTiz1eakh406yoPQbCSJqf5FadVVYHi2HOvZnxeWiPH
 0gSXUyml/ChsjHCEbU8XHuwwIbBVNq94cwLBrM9vgnWepUVWqDXKuEObs4dRv4DPhFr0xeXZ+
 Yfux9IB/kStODI9vswbp/FDqZGPQ9cu7qhw+pN3rkORpfQoMgEj4wMGfcEnbQc8jIMbyeBlzn
 BjaJ2f2FGOHiG4RVAOBayljcge+fdpwQK3x3yIcSnLKNP75mXcQXCSKdmtXgZn6H0KZjPDnPj
 7eL18N8AaCJ/L/c3NwP3vNmaLetfwYum248kpNIh65XJmsh3siJC/0onybXMlF+WsWX871w86
 DQ6DtboCWRUNUFTaWqHC/WCJcCo2FOnVnXGvVGpVT4yUO7rqkrWzSe9S5XKqbCaoai4ggSIiw
 CDGkXjFRdfSJTjbJ0Js2T4+hmsNGMrb9f5TfHbkuFsyKSOOUi1B/j4rR8khYIwsKjpn4D6PyR
 Vs22oTntdPE7Qs1Guay+ZhBkgpvhfJtqykDEIJ5M/5mgoq9AHECrK5/sB9D8hZ6qEuwuUmwMe
 7maMdmHbWPT2umuhynjlLC4yVoYhxiEKRTOns16vOKtQiy5AvUa+GVKPb/90sKoU16LbuUfXq
 Ujvgsso4llVQxKvTpdAbsNFo0kaGuIz29NrnOwUg1dvbscRJhoQfk4/FdDG4XaBAH5El7DeqG
 SQRl1Wj/5rP3726J0UcSc9oCSTNSo9OBI+lTrveo/iKasS34TqxlUFBx32jCQCaIEingJj4P2
 DNS7DDQQaqEEf+PLhYwfnhU1PkNHD/is3qhP8BSckMEHCiGGfeHWUcg/a04WXIjlt6+nxwyLJ
 ov3yO2ftTFU/u8br4C1n0rp5KxK545gMhYbVG95RrEqXWGMhqVdmK4iZ6OsTyM1B7JKoCgtJd
 rdDSg0usGiKAVg=
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
 Tomer Maimon <tmaimon77@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--CHg/GwQ69HayOKZ7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 08, 2021 at 01:24:18PM +0200, Andy Shevchenko wrote:
> On Tuesday, December 7, 2021, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
=2Enet>
> wrote:
>=20
> > This driver is based on the one for NPCM7xx, because the WPCM450 is a
> > predecessor of those SoCs. Notable differences:
> >
> > - WPCM450, the GPIO registers are not organized in multiple banks, but
> >   rather placed continually into the same register block. This affects
> >   how register offsets are computed.
> > - Pinmux nodes can explicitly select GPIO mode, whereas, in the npcm7xx
> >   driver, this happens automatically when a GPIO is requested.
> >
> > Some functionality implemented in the hardware was (for now) left unused
> > in the driver, specifically blinking and pull-up/down.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
[...]
> > +
> > +#include <linux/device.h>
> > +#include <linux/fwnode.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>=20
>=20
> + blank line?

Sounds reasonable, I'll add it.


> > +struct wpcm450_gpio {
> > +       struct wpcm450_pinctrl  *pctrl;
> > +       struct gpio_chip        gc;
>=20
>=20
> Making this first speeds up pointer arithmetics by making it no-op at
> compile time.

Will do.


> > +static int wpcm450_gpio_irq_bitnum(struct wpcm450_gpio *gpio, struct
> > irq_data *d)
> > +{
> > +       int hwirq =3D irqd_to_hwirq(d);
> > +
> > +       if (hwirq < gpio->first_irq_gpio)
> > +               return -EINVAL;
> > +
> > +       if (hwirq - gpio->first_irq_gpio >=3D gpio->num_irqs)
> > +               return -EINVAL;
> > +
> > +       return hwirq - gpio->first_irq_gpio + gpio->first_irq_bit;
> > +}
> > +
> > +static int wpcm450_irq_bitnum_to_gpio(struct wpcm450_gpio *gpio, int
> > bitnum)
> > +{
> > +       if (bitnum < gpio->first_irq_bit)
> > +               return -EINVAL;
> > +
> > +       if (bitnum - gpio->first_irq_bit > gpio->num_irqs)
> > +               return -EINVAL;
> > +
> > +       return bitnum - gpio->first_irq_bit + gpio->first_irq_gpio;
> > +}
> >
>=20
>=20
> Have you chance to look at bitmap_remap() and bitmap_bitremap() APIs? I=
=E2=80=99m
> pretty sure you can make this all cleaner by switching to those calls and
> represent the GPIOs as continuous bitmap on the Linux side while on the
> hardware it will be sparse. Check gpio-Xilinx for the details of use.

I haven't looked at it yet in detail, but I'll consider it for the next
iteration.

> > +static void wpcm450_gpio_fix_evpol(struct wpcm450_gpio *gpio, unsigned
> > long all)
> > +{
>=20
>=20
>=20
> What is this quirk (?) for? Please add a comment.

The hardware does not support triggering on both edges, so the trigger
edge polarity has to be adjusted before the next interrupt can work
properly.

I'll add a comment.


> > +static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
> > +{
> > +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_desc_
> > get_handler_data(desc));
> > +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> > +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> > +       unsigned long pending;
> > +       unsigned long flags;
> > +       unsigned long ours;
> > +       unsigned int bit;
> > +
> > +       ours =3D ((1UL << gpio->num_irqs) - 1) << gpio->first_irq_bit;
>=20
>=20
> BIT()

I'll use it, but in this case, I think it doesn't simplify much the
whole expression all that much. Is there perhaps a macro that
constructs a continuous bitmask of N bits, perhaps additionally
left-shifted by M bits?

Maybe somewhere in the bitmap_* API...


> > +       chained_irq_enter(chip, desc);
> > +       for_each_set_bit(bit, &pending, 32) {
> > +               int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
> > +               int irq =3D irq_find_mapping(gpio->gc.irq.domain, offse=
t);
> > +
> > +               generic_handle_irq(irq);
>=20
>=20
> Above two are now represented by another generic IRQ handle call, check
> relatively recently updated drivers around.

Will do.

> > +       }
> > +       chained_irq_exit(chip, desc);



> > +               spin_lock_irqsave(&pctrl->lock, flags);
> > +               reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
> > +               __assign_bit(bit, &reg, arg);
>=20
>=20
>  In all these cases are you really need to use __assign_bit() APIs? I don=
=E2=80=99t
> see that this goes any higher than 32-bit.
>=20
> It=E2=80=99s not a big deal though.

Not really necessary, it just seemed short and good, because it saved
having to spent multiple lines setting/resetting the bit in the variable.


> > +static int wpcm450_gpio_register(struct platform_device *pdev,
> > +                                struct wpcm450_pinctrl *pctrl)
> > +{
> > +       int ret =3D 0;
> > +       struct fwnode_handle *np;
>=20
>=20
>  Either be fully OF, or don=E2=80=99t name =E2=80=98np' here. We usually =
use fwnode or
> =E2=80=98child=E2=80=99 in this case.

Ah, I thought "np" (=3D node pointer) was still appropriate because I'm
dealing with firmware _nodes_. My intention was indeed to switch fully
to the fwnode API.


> > +
> > +       pctrl->gpio_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (!pctrl->gpio_base) {
> > +               dev_err(pctrl->dev, "Resource fail for GPIO controller\=
n");
> > +               return -ENOMEM;
>=20
>=20
> dev_err_probe(), ditto for the rest in ->probe().

Oh, I missed these error paths when I changed wpcm450_pinctrl_probe to
dev_err_probe(). I'll go through the rest of the dev_err calls.


> > +       fwnode_for_each_available_child_node(pctrl->dev->fwnode, np) {
>=20
>=20
> Please, do not dereference fwnode, instead use analogue from device_*()
> APIs. Hence, replace fwnode.h with property.h.

Ok, I'll use device_for_each_child_node() for iteration.


> > +               gpio->gc.of_node =3D to_of_node(np);
>=20
>=20
> I hope we will soon have fwnode in gpio_chip.

Yes, that would be good.



> > +               gpio->gc.parent =3D pctrl->dev;
> >
> >
> Set by bgpio_init(), also check for other potential duplications.

Good catch, I'll check the assignments again.


> > +               ret =3D gpiochip_add_pin_range(&gpio->gc,
> > dev_name(pctrl->dev),
> > +                                            0, bank->base, bank->lengt=
h);
> > +               if (ret) {
> > +                       dev_err(pctrl->dev, "Failed to add pin range for
> > GPIO bank %u\n", reg);
> > +                       return ret;
> > +               }
>=20
>=20
>=20
> Please move it to the corresponding callback.

What's the corresponding callback?


> > +               dev_err_probe(&pdev->dev, PTR_ERR(pctrl->pctldev),
> > +                             "Failed to register pinctrl device\n");
> > +               return PTR_ERR(pctrl->pctldev);
>=20
>=20
> You may combine those two in one return statement.

Good catch, will do.


Thanks for your review,
Jonathan

--CHg/GwQ69HayOKZ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmGwueMACgkQCDBEmo7z
X9vYlw//R/h5KO1mUD0lP6JM5Tru5FlreoJ9xw83ATzxyUOLsbxQgJEsEegTZSpK
a9T8/WbPdSqjupH68Re9qp/pdEDk7RPPT5kaemCU8O2t8UjXBOOlWt+GfojghCpW
L42fVGtDreaEoj58jFXWnigjMFfaFIP6J3ZNt8EyiRoJxe9TXEZbfbswX9eQapbs
WWIQS24xI7GvVXtoq3d9VQ14VLdMtxGIppogv5DIPJyDxjXE0AoeXsybKtvzrRZM
N1SKIZCH4UXQSckVUGaiGNoNH/325cjOgKYcgo+fnubSR7XpbZPdS3udUlFqqZa2
LXmCF7Yuz+7f5KlGdd1/tmGaxvk7Sca9ZWQpnHIcwb0X8EXdhVdRboGXTptjXXjz
h5Okn4zTQ6NkX2/zbubhDbsbb0K6QOr4yMWtYSjjcIAYNyfvh5iC2m13CSfkybUZ
m6guqwR4b+TdUJGEXqY4giLbhPeOiNWhddCJOwfEdqbALf627YPgy8JHXZqBc6S9
fgTC8Vrk04h7q+Cm7kOdPVv7hpr9aI0aIYHb67omtnBfOJUrLRrUyOekn4tsSX0p
9LnhstTk7NJfeqLqBM4AP5phqZacRduTqP46FoyV123OogCP7Pc2Af07DR/y4OIk
rFPE9tqNJK7cxasuGa39flnjKdeGUpqqcWbPKYPoyEDMWpbq9G8=
=Q2BZ
-----END PGP SIGNATURE-----

--CHg/GwQ69HayOKZ7--
