Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3E485456
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 15:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTWwC5fqTz2yws
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 01:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=fuLqOuen;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=fuLqOuen; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTWvm5nfRz2xBJ
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 01:24:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641392662;
 bh=UXjxgvou7HWB69opbe9Y/U+7lXIFyBTckVZagiCLLe0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=fuLqOuenB6QY9eAmUwnfHwsT3dz4qHH4YVYeZH4Q/yPXcHXyFbvMQ+pQTBUmF/p6o
 23eW6kJfb/0L1j8NNgb/k7rohJqa0k/TkHNtQ8Le7EUVNa1SktFuVaURjXyJo0UC2Y
 foexP47c4kBBlPO+TANUZjROB0yod7UsNfJdKVF0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1mVmSc1WjY-00ZOvk; Wed, 05
 Jan 2022 15:24:22 +0100
Date: Wed, 5 Jan 2022 15:24:20 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 5/9] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <YdWqFC4fub1ztFd0@latitude>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
 <20211224200935.93817-6-j.neuschaefer@gmx.net>
 <CAHp75VdNd5q600qgfxZ+hy0NjpWXrLVycSYt=v6UP7wNd3-TJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gEwymEB2acrfHMRY"
Content-Disposition: inline
In-Reply-To: <CAHp75VdNd5q600qgfxZ+hy0NjpWXrLVycSYt=v6UP7wNd3-TJg@mail.gmail.com>
X-Provags-ID: V03:K1:LxQGLzANC43tKLmP4DSVAJIUzL9WzX3G3GVmMFCUFJTVzyOVjIp
 WraxxAmkVKBnZrw/ZkSuqsPGU22/RE4u59vGve6PtGBcWWc4EMfFATIEs4h7vGuQPqWaInp
 0EhacpEPNt/Bw3Bt4JFceOtx+JUEiHioCdoFQYHQvzxMfxzubvER/wdwuiQUOP8n0PnURDM
 +hPoIQ3jCyi8Oav6WZjvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LdFF+p9P/F4=:vlgKfAvriAcBuo/H+zxCfQ
 zIGZd1Y9umV6fAuloPyCIZXbQcAi+PNMpGzWZZgML+/Ah7l20rlk6mz0KGpYspxt+xNlgqvu9
 YOyI+PzO9Afn7Mfq64xOeArNaprHUsQ21QNyPaIz6mLiUQTt5ZEASEdh4FJ3lnkjFZpa9Jkco
 iSAQAdXNf0fdYl6/VY0Xk2wXPKDzKgZhXAxhy3bDL/AsLkZ4cJxD3SFUcekKSOlCBS1FZdcQO
 MKZ+XSz0E9fl0uUtnrXncWcy36CCoNHN7a+5yLDDH5ozTWv0LVnL5NgaEq4oqqbZsdXgaX/2B
 LId7R+I0kCFq1YB0Po2SdzDE0Z4IHMjBFyZGexFm/27BDYkKw+eNeTzH0PIJSLeNDDtYDFXNe
 JmMpscSKHEX66Fqa2uEUWKCrTqWoMOj3izOs3iFTR0xwb1BlmHNiReIy2FR46KPOU1L53OTRb
 gaGG8DiFSKFcNtNszdsGFcU/45wp8BsTx7v6WI7XBHcvpzayHx8hUuBXcITgcd7p0uyVynAkh
 GXuomL5JHae/BCKEQ3ZjO7alegH8LHZ10FcxU7pbFsc4HOIORo2AAAExX39dfEFh/75FGk18W
 ILx8WCx/svQSAIqbSBlrW/Wmq+vNNSqOVWHSAF206R2e5NzClrJWpg/CQOXO5Yta34jo5rKQs
 ZovxiLgjB/c45T4fMVQN3tGj3FROwwYm5/i47i0Zs5ga4Zt9tfPr3WJpqVj0Iq5LVCCA7/TmY
 YdBi67jjIv3m1QhuVPjH2LU2CWSXGe8xgobZU3H4CWtOaeeB3ESHFl+ZXTd8gzKpAlezONUBL
 Q/0Wywz67JN9ksdFBByF+upyQCPBvJSjarwrO5EhGumz7/5by3APLErtxjB01I6517D0sepWg
 SAz1z1I6X2w3vSezC/HWljidkmd1oW7WQXz6DreoBzMbNuRgGo+RiLvKl67Qve1tn+0iD1pcn
 wNEluO7rtXW4NAzCYHtB2Z3wIf3/zjA3oMNaG1sgLD97TFmN3kAeTuQGYujx3aPTHmH7wcTat
 GI1aDo10q5+sjsL06wl4mwyFL7akEfO6b84oXO+r4DTbCWVyrgB9kIcFJkyxvwwvb8lTFsw2V
 tkm9w/mdt2voVY=
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
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gEwymEB2acrfHMRY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello and happy (belated) new year,

On Fri, Dec 24, 2021 at 11:15:04PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 24, 2021 at 10:10 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
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
>=20
> Overall looks good. Some cosmetic stuff is required, but there are no
> show stoppers.

Good to hear!

> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
> >
> > This patch now depends on gpio/for-next, specifically these patches:
> > - gpiolib: improve coding style for local variables
> > - gpiolib: allow to specify the firmware node in struct gpio_chip
> > - gpiolib: of: make fwnode take precedence in struct gpio_chip
[...]
> > +/* GCR registers */
> > +#define WPCM450_GCR_MFSEL1     0x0C
>=20
> Be consistent with capitalization

Oops, will fix.

> > +struct wpcm450_bank {
> > +       /* Range of GPIOs in this port */
> > +       u8 base;
> > +       u8 length;
> > +
> > +       /* Register offsets (0 =3D register doesn't exist in this port)=
 */
> > +       u8 cfg0, cfg1, cfg2;
> > +       u8 blink;
> > +       u8 dataout, datain;
> > +
> > +       /* Interrupt bit mapping */
> > +       u8 first_irq_bit;
> > +       u8 num_irqs;
> > +       u8 first_irq_gpio;
>=20
> These three are a bit undocumented.

I'll add descriptions.

> > +static const struct wpcm450_bank wpcm450_banks[WPCM450_NUM_BANKS] =3D {
> > +       /*  range   cfg0  cfg1  cfg2 blink  out   in     IRQ map */
> > +       {   0, 16,  0x14, 0x18,    0,    0, 0x1c, 0x20,  0, 16, 0 },
> > +       {  16, 16,  0x24, 0x28, 0x2c, 0x30, 0x34, 0x38, 16,  2, 8 },
>=20
> So, the first_irq_gpio is used only here and as far as I understood it
> has only two IRQ capable GPIOs starting from offset 8 in this bank.
> What I didn't get is the relation on all these three. And could you
> confirm that hardware indeed doesn't support full range of IRQs (to me
> these settings look weird a bit)?

The GPIO controller indeed only has 18 interrupt-capable GPIOs,
16 in the first bank, and 2 in the second.

The full mapping is as follows:

  IRQ*    | int. bits**  | GPIO bank  | offsets
----------|--------------|------------|-----------
  2       |  0-3         |  0         |  0-3
  3       |  4-11        |  0         |  4-11
  4       |  12-15       |  0         |  12-15
  5       |  16-17       |  1         |  8-9

*) At the central interrupt controller
**) In the GPIO controller's interrupt registers such as GPEVST

The hardware is indeed a bit weird.

> > +       {  32, 16,  0x3c, 0x40, 0x44,    0, 0x48, 0x4c,  0,  0, 0 },
> > +       {  48, 16,  0x50, 0x54, 0x58,    0, 0x5c, 0x60,  0,  0, 0 },
> > +       {  64, 16,  0x64, 0x68, 0x6c,    0, 0x70, 0x74,  0,  0, 0 },
> > +       {  80, 16,  0x78, 0x7c, 0x80,    0, 0x84, 0x88,  0,  0, 0 },
> > +       {  96, 18,     0,    0,    0,    0,    0, 0x8c,  0,  0, 0 },
> > +       { 114, 14,  0x90, 0x94, 0x98,    0, 0x9c, 0xa0,  0,  0, 0 },
> > +};


> > +static void wpcm450_gpio_irq_ack(struct irq_data *d)
> > +{
> > +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_ir=
q_chip_data(d));
> > +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
>=20
>=20
> > +       unsigned long flags;
>=20
> Is it in IRQ context or not?

I think ->irq_ack should run in IRQ context, I'm less sure about the
other irq_chip methods. Unfortunately, linux/irq.h doesn't document
these details.

To avoid confusing myself and introducing bugs, I think I'll stay with
spin_lock_irqsave/spin_unlock_irqrestore.

>=20
> > +       int bit;
> > +
> > +       bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
> > +       if (bit < 0)
> > +               return;
> > +
> > +       spin_lock_irqsave(&pctrl->lock, flags);
> > +       iowrite32(BIT(bit), pctrl->gpio_base + WPCM450_GPEVST);
> > +       spin_unlock_irqrestore(&pctrl->lock, flags);
> > +}


> > +/*
> > + * Since the GPIO controller does not support dual-edge triggered inte=
rrupts
> > + * (IRQ_TYPE_EDGE_BOTH), they are emulated using rising/falling edge t=
riggered
> > + * interrupts. wpcm450_gpio_fix_evpol sets the interrupt polarity for =
the
> > + * specified emulated dual-edge triggered interrupts, so that the next=
 edge can
> > + * be detected.
> > + */
> > +static void wpcm450_gpio_fix_evpol(struct wpcm450_gpio *gpio, unsigned=
 long all)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> > +       unsigned long flags;
> > +       unsigned int bit;
> > +
> > +       for_each_set_bit(bit, &all, 32) {
> > +               int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
> > +               unsigned long evpol;
> > +               int level;
> > +
> > +               spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
> > +               do {
> > +                       evpol =3D ioread32(pctrl->gpio_base + WPCM450_G=
PEVPOL);
>=20
> > +                       level =3D gpio->gc.get(&gpio->gc, offset);
>=20
> I'm not sure why here and below you are using a method via GPIO chip.
> Why can't you simply call a method directly?

The ->get method is defined through bgpio_init, it's probably bgpio_get. The
bgpio_* methods are private to gpio-mmio.c, so I can't call them directly.

I could theoretically reimplement the functionality here, but I found it
easier to call the existing ->get function.

>=20
> > +                       /* Switch event polarity to the opposite of the=
 current level */
> > +                       __assign_bit(bit, &evpol, !level);
> > +
> > +                       iowrite32(evpol, pctrl->gpio_base + WPCM450_GPE=
VPOL);
> > +               } while (gpio->gc.get(&gpio->gc, offset) !=3D level);
> > +               spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
> > +       }
> > +}


> > +static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
> > +{
> > +       struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_desc_get_ha=
ndler_data(desc));
> > +       struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
> > +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> > +       unsigned long pending;
> > +       unsigned long flags;
> > +       unsigned long ours;
> > +       unsigned int bit;
>=20
> > +       ours =3D GENMASK(gpio->bank->first_irq_bit + gpio->bank->num_ir=
qs - 1,
> > +                      gpio->bank->first_irq_bit);
>=20
>        ours =3D GENMASK(gpio->bank->num_irqs - 1, 0) << gpio->bank->first=
_irq_bit;
>=20
> is better to read and understand. I think I commented on this.

Fair; I'll change it.


> > +static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned in=
t pin,
> > +                             unsigned long *config)
> > +{
> > +       struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctld=
ev);
> > +       enum pin_config_param param =3D pinconf_to_config_param(*config=
);
> > +       unsigned long flags;
> > +       int bit;
> > +       u32 reg;
> > +
> > +       switch (param) {
> > +       case PIN_CONFIG_INPUT_DEBOUNCE:
> > +               bit =3D debounce_bitnum(pin);
> > +               if (bit < 0)
> > +                       return bit;
> > +
> > +               spin_lock_irqsave(&pctrl->lock, flags);
> > +               reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
> > +               spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +               *config =3D pinconf_to_config_packed(param, !!(reg & BI=
T(bit)));
> > +               break;
> > +       default:
> > +               return -ENOTSUPP;
> > +       }
>=20
> > +
> > +       return 0;
>=20
> Why not to return from the case?
> Ditto for the rest.

I'll change it.

> > +static int wpcm450_gpio_register(struct platform_device *pdev,
> > +                                struct wpcm450_pinctrl *pctrl)
> > +{
> > +       int ret =3D 0;
>=20
> Redundant assignment.

Indeed, I'll fix it.

>=20
> > +       struct fwnode_handle *child;
> > +
> > +       pctrl->gpio_base =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (!pctrl->gpio_base)
> > +               return dev_err_probe(pctrl->dev, -ENOMEM, "Resource fai=
l for GPIO controller\n");
> > +
> > +       device_for_each_child_node(pctrl->dev, child)  {
>=20
> Please, be consistent with the device pointer you are using here and
> there, see below as well.

Will do as below.


> > +               gpio->gc.fwnode =3D child;
>=20
> Thanks, but this will make it a material for v5.18 (starting from). I
> think since you send the v3 just at the holidays season followed by
> release, it's an intention and we have a few weeks to handle this
> series.

I don't particularly care about one release or another, so 5.18 is soon
enough for me.


> > +static int wpcm450_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +       struct wpcm450_pinctrl *pctrl;
> > +       int ret;
> > +
> > +       pctrl =3D devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> > +       if (!pctrl)
> > +               return -ENOMEM;
> > +
> > +       pctrl->dev =3D &pdev->dev;
> > +       spin_lock_init(&pctrl->lock);
> > +       dev_set_drvdata(&pdev->dev, pctrl);
> > +
> > +       pctrl->gcr_regmap =3D
> > +               syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr=
");
> > +       if (IS_ERR(pctrl->gcr_regmap))
> > +               return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->gcr_reg=
map),
>=20
> Please, use the original device pointer in the ->probe().
> Sometimes it's good to have
>=20
> struct device *dev =3D &pdev->dev;

Will do.


Thanks,
Jonathan Neusch=C3=A4fer

--gEwymEB2acrfHMRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmHVqfIACgkQCDBEmo7z
X9txiA//Ww4AH9Ejw+2lT2uful1cPKbUU9Cg7L7+4C7eX+v5fgqQiUBOcHHDE0bs
aIZWHsesTvll355cVER8oGvkV4ctMHEFgOAC7dbRxhRcza6Mj9HtDbMgXJ2fihjX
a2XbOyFueOXBb8F7ccda0gLs2n92G+atpUdvX1tqdIRqlVvgYoRmJMa+zh+baS+w
VHTqj1lFqXsR6VvHonOUEETYdi60wdtprMjRWWg0Yil+9rMGXqpMnd2By65Ntj+g
19lH/zNu9ERdcNm9RsdbGTDSL1EAaOlOM0ksdEP6gYKPat6D8vLSEfZYWyuGNYGs
HHWRNIisKlHdjPuwoDeiL92bc3MxzFBM4+i+ZLJfKkZFtGfvRi8RPQR7xQqEJsru
sje+V6/nCtq0M/6IKLhSbCmCM+9jo4j70xiL+A49AemUzPgESHdSqqMT3oJcD+kD
FwYoyQ50NeC8rdsxr31yqfmW8zM0kMVrlTEnP/ZApf4O4fa4PGCkpYDg1o5DMXxa
x8GRvrRI7GN0bdkMY2IvBP2/mHYmQ3BIXaK+CBJSgoFpLkGKJ/o3vgzwi/uAkVvO
9pOR0yABi/WLm6RZASEcYP5i5ZMTyYrH3FRU4lRUV6vbiaiU8/ThHLsTFRV6NRNm
IakhizMlnKsKPFQZnnzK2ZibF/wJlMjic6E7t9kFwB8Xupzgja4=
=cx6O
-----END PGP SIGNATURE-----

--gEwymEB2acrfHMRY--
