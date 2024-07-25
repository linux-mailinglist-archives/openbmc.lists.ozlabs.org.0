Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDB93C7DE
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 19:56:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZ5ped0b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVJVc49Yhz3dC5
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 03:56:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WZ5ped0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVJV35RNdz30N8
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2024 03:56:26 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-65f8626780aso12170537b3.3
        for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 10:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721930182; x=1722534982; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqO8JAERjRrE8YS+AuXWIpXU6YZZiwBv9C4E+LPH9jc=;
        b=WZ5ped0bCdg5N5o3w2cmr56TxLR5nxyMFacej5hPgN5BaHVRZB45fs7W+fuLZOHKdH
         NcoZdcEHK9wRTkV3e1N54/111RQeg/D4wNS7EfZ/+zd1orrDSnFMD1KYB2HDIwJyaYCf
         NBCu1YBmWwXrF/COnOEaCDKV0zsjU+Axjt8Zs8Zzi5LYViFc4taRIdXgj+f36bA28CdZ
         n/ET2UBDcRbKsdJUcEg5Zfo4xVvjuBrpzajdO9yHjG/Qv39HFq5lNjj17cPTLWR2HBVC
         uC8ksEUuQLnMhCzLT3ekz2SCJ5KYE5ayCEn3lYzZk+eO7LcVqS2f4QmFwnZwyKezg0l+
         wwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721930182; x=1722534982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqO8JAERjRrE8YS+AuXWIpXU6YZZiwBv9C4E+LPH9jc=;
        b=ZsWMmSwotivBzjSJsslkv+qAxRdulfPtQNifVkrj+xwqppk5CJVxQeASQmAvv4lK8c
         z7ODCoznlDEskBrrTBfD+q4MajWLcPR3IfKO0Wy0gdxu1YMUX59MeiXF7y+x5yRDQmRK
         vNbRo5UBlc541lQACDJDdDqc1PMw90J5w92OiNKw/oR0+CyeEHqkyKhEsBv6rZXnyqrt
         et2xftvkKFGBXHY/btfrxRgPTbnhnqSCaT+UDR6jgbSChpuYYOLvB2LitxRGaRImLnsb
         20bDqeda1CorF938lCrsvOmOHohBk9cGHqdvLxOofVcyt6PaM/ZrrsiByXFA0tK1I4gh
         4dOQ==
X-Gm-Message-State: AOJu0YzLXyXwiJmQJuz1iAI2ND6NlfYOZmPBS5PrMMgfHmQu5lrRzbcx
	8XaFRygocy0tX5I1vJDdyjsQpO2x96cgS7bGiooHJoY5rtVR2y+NyH9RLY49ov701/2U/e7mZk2
	yuc4Nv8l0zCT6nhb9gRDC10bedHg=
X-Google-Smtp-Source: AGHT+IErcYDc+09qUBKNY08d0L/m21+HQixxrQMAcM0zVgi5t43MK926valAEgAk0e/vFNSvH/vF2WUPbA0zZxy8TyU=
X-Received: by 2002:a81:5cc6:0:b0:620:2cfb:7a0e with SMTP id
 00721157ae682-675ba51889bmr27279307b3.40.1721930182094; Thu, 25 Jul 2024
 10:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240718182720.2721427-1-tmaimon77@gmail.com> <e13a782dbf797c16d5fd068dc8c7959d037a6002.camel@codeconstruct.com.au>
In-Reply-To: <e13a782dbf797c16d5fd068dc8c7959d037a6002.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 25 Jul 2024 20:56:10 +0300
Message-ID: <CAP6Zq1hmq-Qp4Wng1n+Tg3jupk3-dBnCZc4fthYQDYD250EvLQ@mail.gmail.com>
Subject: Re: [linux dev-6.6 v2 0/7] pinctrl: npcm8xx: pin configuration changes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for your comments

On Thu, 25 Jul 2024 at 10:29, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Tomer,
>
> On Thu, 2024-07-18 at 21:27 +0300, Tomer Maimon wrote:
> > This patch set addresses various pin configuration changes for the
> > Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,
> > remove unused pins, and improve overall pin management.
> >
> > This patchset is on the upstream process to the Linux vanilla.
> > https://lore.kernel.org/lkml/20240716194008.3502068-1-tmaimon77@gmail.c=
om/
> >
> > Changes since version 1:
> >         - Squash the non-existent pins, groups and functions.
> >         - Remove non-existent groups and functions from dt-bindings.
> >         - Modify the commit message.
> >
> > Tomer Maimon (7):
> >   dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
> >     functions
> >   pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, function=
s
> >   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
> >   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
> >   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
> >   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
> >   pinctrl: nuvoton: npcm8xx: modify pins flags
> >
> >  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 74 +++++++++----------
> >  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 ++++++++--------
> >  2 files changed, 67 insertions(+), 71 deletions(-)
> >
>
> I looked at applying this series. A few notes:
>
> 1. I did get some whitespace warnings during patch application:
>
> ```
> ...
> Applying: pinctrl: nuvoton: npcm8xx: modify pins flags
> /home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/patc=
h:47: trailing whitespace.
>                   nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, w=
dog1
> /home/andrew/src/kernel.org/linux.git/worktrees/openbmc/rebase-apply/patc=
h:89: trailing whitespace.
>                 nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdo=
g1
> warning: 2 lines add whitespace errors.
> ```
>
will fixed in V3
> 2. There's a reasonable difference to the patches upstream. The
> devicetree binding in particular seems to have some odd differences in
> the enums that make me wonder whether we're missing other patches
> there. There are also some minor differences in the driver which I
> assume are explained by intervening changes between v6.6 and upstream.
> Here's the diff, can you give a quick comment on each hunk?
>
> ```
> $ git diff <backported patches on dev-6.6> <patches proposed upstream on =
c33ffdb70cc6 ("Merge tag 'phy-for-6.11' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/phy/linux-phy")> -- drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c=
 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinc=
trl.yaml
> index 4496658006ab..8cd1f442240e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.y=
aml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    '^gpio@':
>      type: object
> +    additionalProperties: false
>
>      description:
>        Eight GPIO banks that each contain 32 GPIOs.
> @@ -80,37 +81,39 @@ patternProperties:
>                    fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fan=
in13,
>                    fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r=
2md,
>                    r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c=
1,
> -                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b=
,
> -                  smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, p=
wm4,
> -                  pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc,=
 mmcwp,
> -                  mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, smb7=
, spi1,
> -                  faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,
> -                  nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, =
wdog1
> -                  wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, hg=
pio1,
> -                  hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
> +                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b=
, smb1c,
> +                  smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4, pw=
m5,
> +                  pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmcwp=
, mmccd,
> +                  mmcrst, clkout, serirq, scipme, smi, smb6, smb6b, smb6=
c,
> +                  smb6d, smb7, smb7b, smb7c, smb7d, spi1, faninx, r1, sp=
i3,
> +                  spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, =
smb0c,
> +                  smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb=
13,
> +                  spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3,=
 hgpio4,
> +                  hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b, bu6, gpo=
187 ]
>
>        function:
>          description:
>            The function that a group of pins is muxed to
> -        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> -                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb1=
5,
> -                smb16, smb17, smb18, smb19, smb20, smb21, smb22, smb23,
> -                smb23b, smb4d, smb14, smb5, smb4, smb3, spi0cs1, spi0cs2=
,
> -                spi0cs3, spi1cs0, spi1cs1, spi1cs2, spi1cs3, spi1cs23, s=
mb3c,
> -                smb3b, bmcuart0a, uart1, jtag2, bmcuart1, uart2, sg1mdio=
,
> -                bmcuart0b, r1err, r1md, r1oen, r2oen, rmii3, r3oen, smb3=
d,
> -                fanin0, fanin1, fanin2, fanin3, fanin4, fanin5, fanin6,
> -                fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fanin=
13,
> -                fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r2m=
d,
> -                r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c1,
> -                i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b,
> -                smb1c, smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm=
4,
> -                pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, m=
mcwp,
> -                mmccd, mmcrst, clkout, serirq, scipme, smi, smb6, smb7, =
spi1,
> -                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3,
> -                nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wd=
og1
> -                wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpi=
o1,
> -                hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7 ]
> +        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi, sm=
b5b,
> +                smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15, smb1=
6,
> +                smb17, smb18, smb19, smb20, smb21, smb22, smb23, smb23b,=
 smb4d,
> +                smb14, smb5, smb4, smb3, spi0cs1, spi0cs2, spi0cs3, spi1=
cs0,
> +                spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c, smb3b, bmcua=
rt0a,
> +                uart1, jtag2, bmcuart1, uart2, sg1mdio, bmcuart0b, r1err=
, r1md,
> +                r1oen, r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin=
2,
> +                fanin3, fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, =
fanin10,
> +                fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1,=
 pwm2,
> +                pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi=
, rg2,
> +                ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb=
2,
> +                smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd=
1,
> +                sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11=
,
> +                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, scipme,=
 smi,
> +                smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c, smb7d, sp=
i1,
> +                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, n=
prd_smi,
> +                smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2=
,
> +                smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgp=
io2,
> +                hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, =
bu5b,
> +                bu6, gpo187 ]
Thanks for raising I have an error here, I will fixed it in the
vanilla and the OpenBMC, I should remove and add enums.
>
>      dependencies:
>        groups: [ function ]
> @@ -149,7 +152,6 @@ patternProperties:
>          description:
>            Debouncing periods in microseconds, one period per interrupt
>            bank found in the controller
> -        $ref: /schemas/types.yaml#/definitions/uint32-array
it removed in the newer version, we can keep it
>          minItems: 1
>          maxItems: 4
>
> @@ -157,7 +159,6 @@ patternProperties:
>          description: |
>            0: Low rate
>            1: High rate
> -        $ref: /schemas/types.yaml#/definitions/uint32
it removed in the newer version, we can keep it
>          enum: [0, 1]
>
>        drive-strength:
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/=
nuvoton/pinctrl-npcm8xx.c
> index 607960fdbc40..471f644c5eef 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -173,7 +173,7 @@ static int npcmgpio_direction_input(struct gpio_chip =
*chip, unsigned int offset)
>         struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
>         int ret;
>
> -       ret =3D pinctrl_gpio_direction_input(offset + chip->base);
> +       ret =3D pinctrl_gpio_direction_input(chip, offset);
Modify in newer version, will revert the change in V3. since kernel
6.6 doesn't support it
>         if (ret)
>                 return ret;
>
> @@ -186,7 +186,7 @@ static int npcmgpio_direction_output(struct gpio_chip=
 *chip,
>         struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
>         int ret;
>
> -       ret =3D pinctrl_gpio_direction_output(offset + chip->base);
> +       ret =3D pinctrl_gpio_direction_output(chip, offset);
same as above
>         if (ret)
>                 return ret;
>
> @@ -198,18 +198,13 @@ static int npcmgpio_gpio_request(struct gpio_chip *=
chip, unsigned int offset)
>         struct npcm8xx_gpio *bank =3D gpiochip_get_data(chip);
>         int ret;
>
> -       ret =3D pinctrl_gpio_request(offset + chip->base);
> +       ret =3D pinctrl_gpio_request(chip, offset);
same as above
>         if (ret)
>                 return ret;
>
>         return bank->request(chip, offset);
>  }
>
> -static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offs=
et)
> -{
> -       pinctrl_gpio_free(offset + chip->base);
> -}
> -
same as above
>  static void npcmgpio_irq_handler(struct irq_desc *desc)
>  {
>         unsigned long sts, en, bit;
> @@ -2386,7 +2381,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *=
pctrl)
>                 pctrl->gpio_bank[id].gc.direction_output =3D npcmgpio_dir=
ection_output;
>                 pctrl->gpio_bank[id].request =3D pctrl->gpio_bank[id].gc.=
request;
>                 pctrl->gpio_bank[id].gc.request =3D npcmgpio_gpio_request=
;
> -               pctrl->gpio_bank[id].gc.free =3D npcmgpio_gpio_free;
> +               pctrl->gpio_bank[id].gc.free =3D pinctrl_gpio_free;
same as above
>                 for (i =3D 0 ; i < NPCM8XX_DEBOUNCE_MAX ; i++)
>                         pctrl->gpio_bank[id].debounce.set_val[i] =3D fals=
e;
>                 pctrl->gpio_bank[id].gc.add_pin_ranges =3D npcmgpio_add_p=
in_ranges;
> ```
>
> Andrew

Best regards,

Tomer
