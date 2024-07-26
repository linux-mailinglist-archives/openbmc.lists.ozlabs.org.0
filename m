Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8CB93CD85
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 07:20:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eSIb5XLA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVbfv5lLPz3dBM
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 15:20:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eSIb5XLA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVbfN3W5Dz3bYR
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2024 15:19:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721971179;
	bh=o36mWXvFMZ6Vn3SBAJNwhpVpDAq6AubJqJePk2t1k0o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eSIb5XLAEVN3zSELMcIs67z4bcWPLR9yOtBzBsJyojT29WTNs4bw/JTjSqETObQlh
	 S7k4Rx1zMqok4NsiGgPCScjeKLdwHSdq0wOTalAYTK5SNONihZh3RbcVGo/0v8ToLW
	 Dm7s6NND0tK5fRBXvLzS3m32bzKbNmT9cZONDFOgyBFuIZ7X5QP9Qmbai6SgQ6zS8M
	 woa3T+TW8cUrq63BEEtwYzuyPQKkcP4dApEB+JklZfkbP/tpit4VfGPtAJT+hFV8l+
	 QLPrmII0EelIwUeL8OARLMcRyBXfOXCRASgoDmivfyKouwfarj8G7ITL3o5m4xSfCV
	 LEzOs/hQ4y1hg==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A005C66AB4;
	Fri, 26 Jul 2024 13:19:39 +0800 (AWST)
Message-ID: <cb86d53ced978c499fe4f55c5e709b5156bae1bd.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v2 0/7] pinctrl: npcm8xx: pin configuration
 changes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 26 Jul 2024 14:49:39 +0930
In-Reply-To: <CAP6Zq1hmq-Qp4Wng1n+Tg3jupk3-dBnCZc4fthYQDYD250EvLQ@mail.gmail.com>
References: <20240718182720.2721427-1-tmaimon77@gmail.com>
	 <e13a782dbf797c16d5fd068dc8c7959d037a6002.camel@codeconstruct.com.au>
	 <CAP6Zq1hmq-Qp4Wng1n+Tg3jupk3-dBnCZc4fthYQDYD250EvLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-07-25 at 20:56 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> Thanks for your comments
>=20
> On Thu, 25 Jul 2024 at 10:29, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hi Tomer,
> >=20
> > On Thu, 2024-07-18 at 21:27 +0300, Tomer Maimon wrote:
> > > This patch set addresses various pin configuration changes for the
> > > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > > remove unused pins, and improve overall pin management.
> > >=20
> > > This patchset is on the upstream process to the Linux vanilla.
> > > https://lore.kernel.org/lkml/20240716194008.3502068-1-tmaimon77@gmail=
.com/
> > >=20
> > > Changes since version 1:
> > >         - Squash the non-existent pins, groups and functions.
> > >         - Remove non-existent groups and functions from dt-bindings.
> > >         - Modify the commit message.
> > >=20
> > > Tomer Maimon (7):
> > >   dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
> > >     functions
> > >   pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functi=
ons
> > >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> > >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> > >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> > >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configurati=
on
> > >   pinctrl: nuvoton: npcm8xx: modify pins flags
> > >=20
> > >  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 74 +++++++++--------=
--
> > >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++--------
> > >  2 files changed, 67 insertions(+), 71 deletions(-)
> > >=20
> >=20
> > I looked at applying this series. A few notes:
> >=20
> > 1. I did get some whitespace warnings during patch application:
> >=20
> > ```
> > ...
> > Applying: pinctrl: nuvoton: npcm8xx: modify pins flags
> > /home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/pa=
tch:47: trailing whitespace.
> >                   nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,=
 wdog1
> > /home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/pa=
tch:89: trailing whitespace.
> >                 nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, w=
dog1
> > warning: 2 lines add whitespace errors.
> > ```
> >=20
> will fixed in V3
> > 2. There's a reasonable difference to the patches upstream. The
> > devicetree binding in particular seems to have some odd differences in
> > the enums that make me wonder whether we're missing other patches
> > there. There are also some minor differences in the driver which I
> > assume are explained by intervening changes between v6.6 and upstream.
> > Here's the diff, can you give a quick comment on each hunk?
> >=20
> > ```
> > $ git diff <backported patches on dev-6.6> <patches proposed upstream o=
n c33ffdb70cc6 ("Merge tag 'phy-for-6.11' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/phy/linux-phy")> -- drivers/pinctrl/nuvoton/pinctrl-npcm8xx=
.c Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pi=
nctrl.yaml
> > index 4496658006ab..8cd1f442240e 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl=
.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl=
.yaml
> > @@ -35,6 +35,7 @@ properties:
> >  patternProperties:
> >    '^gpio@':
> >      type: object
> > +    additionalProperties: false
> >=20
> >      description:
> >        Eight GPIO banks that each contain 32 GPIOs.
> > @@ -80,37 +81,39 @@ patternProperties:
> >                    fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, f=
anin13,
> >                    fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err,=
 r2md,
> >                    r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i=
3c1,
> > -                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb=
2b,
> > -                  smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr,=
 pwm4,
> > -                  pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mm=
c, mmcwp,
> > -                  mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, sm=
b7, spi1,
> > -                  faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs=
3,
> > -                  nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio=
, wdog1
> > -                  wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, =
hgpio1,
> > -                  hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
> > +                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb=
2b, smb1c,
> > +                  smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4, =
pwm5,
> > +                  pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmc=
wp, mmccd,
> > +                  mmcrst, clkout, serirq, scipme, smi, smb6, smb6b, sm=
b6c,
> > +                  smb6d, smb7, smb7b, smb7c, smb7d, spi1, faninx, r1, =
spi3,
> > +                  spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b=
, smb0c,
> > +                  smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, s=
mb13,
> > +                  spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio=
3, hgpio4,
> > +                  hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b, bu6, g=
po187 ]
> >=20
> >        function:
> >          description:
> >            The function that a group of pins is muxed to
> > -        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> > -                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, sm=
b15,
> > -                smb16, smb17, smb18, smb19, smb20, smb21, smb22, smb23=
,
> > -                smb23b, smb4d, smb14, smb5, smb4, smb3, spi0cs1, spi0c=
s2,
> > -                spi0cs3, spi1cs0, spi1cs1, spi1cs2, spi1cs3, spi1cs23,=
 smb3c,
> > -                smb3b, bmcuart0a, uart1, jtag2, bmcuart1, uart2, sg1md=
io,
> > -                bmcuart0b, r1err, r1md, r1oen, r2oen, rmii3, r3oen, sm=
b3d,
> > -                fanin0, fanin1, fanin2, fanin3, fanin4, fanin5, fanin6=
,
> > -                fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fan=
in13,
> > -                fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r=
2md,
> > -                r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c=
1,
> > -                i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b=
,
> > -                smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, p=
wm4,
> > -                pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc,=
 mmcwp,
> > -                mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, smb7=
, spi1,
> > -                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,
> > -                nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, =
wdog1
> > -                wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, hg=
pio1,
> > -                hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
> > +        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi, =
smb5b,
> > +                smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15, sm=
b16,
> > +                smb17, smb18, smb19, smb20, smb21, smb22, smb23, smb23=
b, smb4d,
> > +                smb14, smb5, smb4, smb3, spi0cs1, spi0cs2, spi0cs3, sp=
i1cs0,
> > +                spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c, smb3b, bmc=
uart0a,
> > +                uart1, jtag2, bmcuart1, uart2, sg1mdio, bmcuart0b, r1e=
rr, r1md,
> > +                r1oen, r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fan=
in2,
> > +                fanin3, fanin4, fanin5, fanin6, fanin7, fanin8, fanin9=
, fanin10,
> > +                fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm=
1, pwm2,
> > +                pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, es=
pi, rg2,
> > +                ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, s=
mb2,
> > +                smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, =
sd1,
> > +                sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm=
11,
> > +                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, scipm=
e, smi,
> > +                smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c, smb7d, =
spi1,
> > +                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,=
 nprd_smi,
> > +                smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdo=
g2,
> > +                smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, h=
gpio2,
> > +                hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5=
, bu5b,
> > +                bu6, gpo187 ]
> Thanks for raising I have an error here, I will fixed it in the
> vanilla and the OpenBMC, I should remove and add enums.
> >=20
> >      dependencies:
> >        groups: [ function ]
> > @@ -149,7 +152,6 @@ patternProperties:
> >          description:
> >            Debouncing periods in microseconds, one period per interrupt
> >            bank found in the controller
> > -        $ref: /schemas/types.yaml#/definitions/uint32-array
> it removed in the newer version, we can keep it

The outcome I'm after is we have the least difference in the patches
for dev-6.6 to those upstream. If it's correct to remove it, and that
is what you've done in the upstream patches, then we should remove it
in the dev-6.6 patches as well.

> >          minItems: 1
> >          maxItems: 4
> >=20
> > @@ -157,7 +159,6 @@ patternProperties:
> >          description: |
> >            0: Low rate
> >            1: High rate
> > -        $ref: /schemas/types.yaml#/definitions/uint32
> it removed in the newer version, we can keep it
> >          enum: [0, 1]
> >=20
> >        drive-strength:
> > diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctr=
l/nuvoton/pinctrl-npcm8xx.c
> > index 607960fdbc40..471f644c5eef 100644
> > --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> > @@ -173,7 +173,7 @@ static int npcmgpio_direction_input(struct gpio_chi=
p *chip, unsigned int offset)
> >         struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
> >         int ret;
> >=20
> > -       ret =3D pinctrl_gpio_direction_input(offset + chip->base);
> > +       ret =3D pinctrl_gpio_direction_input(chip, offset);
> Modify in newer version, will revert the change in V3. since kernel
> 6.6 doesn't support it

Just to clarify, the dev-6.6 patches have the "-" content, and the
upstream patches have the "+" content. Perhaps how I generated the diff
is the confusing bit here. If you need me to unpack that a bit more
please ask, it's important that we both have the same understanding of
what's going on :D

Andrew
