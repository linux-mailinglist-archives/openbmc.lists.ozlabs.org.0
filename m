Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F493BD1C
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 09:30:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=k0Z/l0Mj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WV2bJ3wbbz3d96
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 17:30:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=k0Z/l0Mj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WV2Zn1z2Sz3c6c
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 17:29:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721892576;
	bh=nraxR7fPczWW8/B8V0l3D3nPSWT/uYldOO+S/KUouCY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k0Z/l0Mj6gFv11qb52anb2gZ1nN7Mu3tgrMhGpl0rDez2qJTy29FwLaKQqC7QnkAi
	 7BlTA1H42S1DLjbsWCP4oxNh6ZOLRxGwjJ3aZz/oAYy8jqUA1yV+y5DNR7iWtIJ7yH
	 1kuFao32nx9JysZ+DhflvAlJvDf+8twAKQe2VAl82Tq07OIcvdM7yjdFcSE00T5KW6
	 W30feSbVljblANLKHi3MH4PIv7XfzpaJ3x2oZaEsameNbGi8DfwoXtTWAZ0lC6VLrv
	 QhJh4zq6pdmgS2/tl94+mRoSxZZo/IYc4Kda0xSxK+ENo7DnOC++LkSVX8AYbdHT3H
	 8PLO1R4fMa8CA==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7295A66AB4;
	Thu, 25 Jul 2024 15:29:36 +0800 (AWST)
Message-ID: <e13a782dbf797c16d5fd068dc8c7959d037a6002.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v2 0/7] pinctrl: npcm8xx: pin configuration
 changes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 25 Jul 2024 16:59:34 +0930
In-Reply-To: <20240718182720.2721427-1-tmaimon77@gmail.com>
References: <20240718182720.2721427-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Thu, 2024-07-18 at 21:27 +0300, Tomer Maimon wrote:
> This patch set addresses various pin configuration changes for the=20
> Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,=20
> remove unused pins, and improve overall pin management.
>=20
> This patchset is on the upstream process to the Linux vanilla.
> https://lore.kernel.org/lkml/20240716194008.3502068-1-tmaimon77@gmail.com=
/
>=20
> Changes since version 1:
>         - Squash the non-existent pins, groups and functions.
>         - Remove non-existent groups and functions from dt-bindings.
>         - Modify the commit message.
>=20
> Tomer Maimon (7):
>   dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
>     functions
>   pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
>   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
>   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
>   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
>   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
>   pinctrl: nuvoton: npcm8xx: modify pins flags
>=20
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 74 +++++++++----------
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++--------
>  2 files changed, 67 insertions(+), 71 deletions(-)
>=20

I looked at applying this series. A few notes:

1. I did get some whitespace warnings during patch application:

```
...
Applying: pinctrl: nuvoton: npcm8xx: modify pins flags                     =
                                                                           =
        =20
/home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/patch:=
47: trailing whitespace.                                                   =
        =20
                  nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdo=
g1 =20
/home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/patch:=
89: trailing whitespace.                                                   =
        =20
                nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1=
                                                                           =
        =20
warning: 2 lines add whitespace errors.
```

2. There's a reasonable difference to the patches upstream. The
devicetree binding in particular seems to have some odd differences in
the enums that make me wonder whether we're missing other patches
there. There are also some minor differences in the driver which I
assume are explained by intervening changes between v6.6 and upstream.
Here's the diff, can you give a quick comment on each hunk?

```
$ git diff <backported patches on dev-6.6> <patches proposed upstream on c3=
3ffdb70cc6 ("Merge tag 'phy-for-6.11' of git://git.kernel.org/pub/scm/linux=
/kernel/git/phy/linux-phy")> -- drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c D=
ocumentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctr=
l.yaml
index 4496658006ab..8cd1f442240e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yam=
l
@@ -35,6 +35,7 @@ properties:
 patternProperties:
   '^gpio@':
     type: object
+    additionalProperties: false

     description:
       Eight GPIO banks that each contain 32 GPIOs.
@@ -80,37 +81,39 @@ patternProperties:
                   fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fanin=
13,
                   fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r2m=
d,
                   r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c1,
-                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b,
-                  smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm=
4,
-                  pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, m=
mcwp,
-                  mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, smb7, =
spi1,
-                  faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,
-                  nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wd=
og1
-                  wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpi=
o1,
-                  hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
+                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b, =
smb1c,
+                  smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4, pwm5=
,
+                  pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmcwp, =
mmccd,
+                  mmcrst, clkout, serirq, scipme, smi, smb6, smb6b, smb6c,
+                  smb6d, smb7, smb7b, smb7c, smb7d, spi1, faninx, r1, spi3=
,
+                  spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, sm=
b0c,
+                  smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13=
,
+                  spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, h=
gpio4,
+                  hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b, bu6, gpo18=
7 ]

       function:
         description:
           The function that a group of pins is muxed to
-        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
-                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15,
-                smb16, smb17, smb18, smb19, smb20, smb21, smb22, smb23,
-                smb23b, smb4d, smb14, smb5, smb4, smb3, spi0cs1, spi0cs2,
-                spi0cs3, spi1cs0, spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb=
3c,
-                smb3b, bmcuart0a, uart1, jtag2, bmcuart1, uart2, sg1mdio,
-                bmcuart0b, r1err, r1md, r1oen, r2oen, rmii3, r3oen, smb3d,
-                fanin0, fanin1, fanin2, fanin3, fanin4, fanin5, fanin6,
-                fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fanin13=
,
-                fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r2md,
-                r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c1,
-                i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b,
-                smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4,
-                pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmc=
wp,
-                mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, smb7, sp=
i1,
-                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,
-                nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog=
1
-                wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1=
,
-                hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
+        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi, smb5=
b,
+                smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15, smb16,
+                smb17, smb18, smb19, smb20, smb21, smb22, smb23, smb23b, s=
mb4d,
+                smb14, smb5, smb4, smb3, spi0cs1, spi0cs2, spi0cs3, spi1cs=
0,
+                spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c, smb3b, bmcuart=
0a,
+                uart1, jtag2, bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, =
r1md,
+                r1oen, r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2,
+                fanin3, fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fa=
nin10,
+                fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, p=
wm2,
+                pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, =
rg2,
+                ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
+                smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
+                sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
+                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, scipme, s=
mi,
+                smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c, smb7d, spi1=
,
+                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, npr=
d_smi,
+                smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2,
+                smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio=
2,
+                hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu=
5b,
+                bu6, gpo187 ]

     dependencies:
       groups: [ function ]
@@ -149,7 +152,6 @@ patternProperties:
         description:
           Debouncing periods in microseconds, one period per interrupt
           bank found in the controller
-        $ref: /schemas/types.yaml#/definitions/uint32-array
         minItems: 1
         maxItems: 4

@@ -157,7 +159,6 @@ patternProperties:
         description: |
           0: Low rate
           1: High rate
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1]

       drive-strength:
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nu=
voton/pinctrl-npcm8xx.c
index 607960fdbc40..471f644c5eef 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -173,7 +173,7 @@ static int npcmgpio_direction_input(struct gpio_chip *c=
hip, unsigned int offset)
        struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
        int ret;

-       ret =3D pinctrl_gpio_direction_input(offset + chip->base);
+       ret =3D pinctrl_gpio_direction_input(chip, offset);
        if (ret)
                return ret;

@@ -186,7 +186,7 @@ static int npcmgpio_direction_output(struct gpio_chip *=
chip,
        struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
        int ret;

-       ret =3D pinctrl_gpio_direction_output(offset + chip->base);
+       ret =3D pinctrl_gpio_direction_output(chip, offset);
        if (ret)
                return ret;

@@ -198,18 +198,13 @@ static int npcmgpio_gpio_request(struct gpio_chip *ch=
ip, unsigned int offset)
        struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
        int ret;

-       ret =3D pinctrl_gpio_request(offset + chip->base);
+       ret =3D pinctrl_gpio_request(chip, offset);
        if (ret)
                return ret;

        return bank->request(chip, offset);
 }

-static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset=
)
-{
-       pinctrl_gpio_free(offset + chip->base);
-}
-
 static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
        unsigned long sts, en, bit;
@@ -2386,7 +2381,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pc=
trl)
                pctrl->gpio_bank[id].gc.direction_output =3D npcmgpio_direc=
tion_output;
                pctrl->gpio_bank[id].request =3D pctrl->gpio_bank[id].gc.re=
quest;
                pctrl->gpio_bank[id].gc.request =3D npcmgpio_gpio_request;
-               pctrl->gpio_bank[id].gc.free =3D npcmgpio_gpio_free;
+               pctrl->gpio_bank[id].gc.free =3D pinctrl_gpio_free;
                for (i =3D 0 ; i < NPCM8XX_DEBOUNCE_MAX ; i++)
                        pctrl->gpio_bank[id].debounce.set_val[i] =3D false;
                pctrl->gpio_bank[id].gc.add_pin_ranges =3D npcmgpio_add_pin=
_ranges;
```

Andrew
