Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE982F5A8A
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:09:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGYmG5zcJzDrSc
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 17:09:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JP4FKZQq; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGYl62mGbzDr1S
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 17:08:01 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id i6so4279741otr.2
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 22:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXjOKtbpb/sn3TPKETQd+ZyK7mswaCmkhjXWYWcRF3w=;
 b=JP4FKZQq2k6tZmNQ9NemMAqhqnL/x7NQlHr/bG1OJYbkqjMpfndL030AzWMVMB7rYa
 apumxJ+gaXWEHhIZbOlGeeLeoNX4ZhbF7D7Fya9WQkFQWT2Wlao+lrFdpSMipb8fjVQd
 7SraWRT0CVFEgWgcZ8OuWP9CzKTxHfToNO1N6kbFmewjLRP8JuBSBeW8CMw3fBD9GNnX
 DpqVTNeIHvOQyQCL8XyDiaByw8StM3FbpEIgX75uywMmjg1OG3Zkhd8/HQqNDu+qdFkN
 bDZdVlkIhMcKyHcaWBVaYJyqnkJcJYTg3YZH1yA8cUqtnpI7onqqAFtZG1ojnRh+9NqN
 ai1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXjOKtbpb/sn3TPKETQd+ZyK7mswaCmkhjXWYWcRF3w=;
 b=reqSD2WpJu+iLl0hOdTz4y4WIRXUDIak2eNwTBgtrxhbDvC90Gvg2Qld11hxPRhuFu
 KN0WpTohP7+Otv4HFV0JssjWyGZuMYpi+PVDe9VsbBsmeX9jKC7tCrThxvDjVa99C4DE
 wLj5yZwJwpsaEZrMpnRJvyquUYMve/ZAQpYWJf/hPo+06cmC2SrNWsH+CDUchIeQy9gz
 rEmLdf8PcPc1zwGE7a0YuS5rXlvVrxsgdlT54ZiHAy2AOkPXgeOzYp8kcnvYGsaFmBzG
 +p23sfr02nwvWsGc5WbYxI7RyAVNoprbnaHvc+zj3D3TebGD9h6ndtVFVny+4r8sSdFl
 xt+g==
X-Gm-Message-State: AOAM5334AanHh5riwe7a/e0yjNL2FAG1ZTlyqyRDqu7dRgmUBV+/sFUx
 YXM5uXOx5U6p00sSt/Ffv1TGaIzejDShhu5MCltV7p8tM90=
X-Google-Smtp-Source: ABdhPJz98biTrZ4k6wWCXVurSPTA3r8CqgJ/lmc3tCwF1PX9JoC8kWsojl/c7a2Bq7W+1iOJfb3o4owlBeC4FF7Tq0k=
X-Received: by 2002:a05:6830:4b5:: with SMTP id
 l21mr3772763otd.321.1610604478213; 
 Wed, 13 Jan 2021 22:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
 <20210113200010.71845-8-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-8-tmaimon77@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 14 Jan 2021 08:21:35 +0200
Message-ID: <CAP6Zq1hdm19pPcSvKckw-tnZcDugA7ynD5s51LkJ=qSaYex=Lg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 07/12] pinctrl: npcm7xx: Add HGPIO pin
 support to NPCM7xx pinctrl driver
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cc334f05b8d613aa"
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cc334f05b8d613aa
Content-Type: text/plain; charset="UTF-8"

Sorry, forgot to add it this patch already approved.


On Wed, 13 Jan 2021 at 22:00, Tomer Maimon <tmaimon77@gmail.com> wrote:

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++------
>  1 file changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index a935065cdac4..e5f58ea89917 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -504,6 +504,15 @@ static const int lkgpo2_pins[] = { 9 };
>
>  static const int nprd_smi_pins[] = { 190 };
>
> +static const int hgpio0_pins[] = { 20 };
> +static const int hgpio1_pins[] = { 21 };
> +static const int hgpio2_pins[] = { 22 };
> +static const int hgpio3_pins[] = { 23 };
> +static const int hgpio4_pins[] = { 24 };
> +static const int hgpio5_pins[] = { 25 };
> +static const int hgpio6_pins[] = { 59 };
> +static const int hgpio7_pins[] = { 60 };
> +
>  /*
>   * pin:             name, number
>   * group:    name, npins,   pins
> @@ -631,6 +640,14 @@ struct npcm7xx_group {
>         NPCM7XX_GRP(lkgpo1), \
>         NPCM7XX_GRP(lkgpo2), \
>         NPCM7XX_GRP(nprd_smi), \
> +       NPCM7XX_GRP(hgpio0), \
> +       NPCM7XX_GRP(hgpio1), \
> +       NPCM7XX_GRP(hgpio2), \
> +       NPCM7XX_GRP(hgpio3), \
> +       NPCM7XX_GRP(hgpio4), \
> +       NPCM7XX_GRP(hgpio5), \
> +       NPCM7XX_GRP(hgpio6), \
> +       NPCM7XX_GRP(hgpio7), \
>         \
>
>  enum {
> @@ -774,6 +791,14 @@ NPCM7XX_SFUNC(lkgpo0);
>  NPCM7XX_SFUNC(lkgpo1);
>  NPCM7XX_SFUNC(lkgpo2);
>  NPCM7XX_SFUNC(nprd_smi);
> +NPCM7XX_SFUNC(hgpio0);
> +NPCM7XX_SFUNC(hgpio1);
> +NPCM7XX_SFUNC(hgpio2);
> +NPCM7XX_SFUNC(hgpio3);
> +NPCM7XX_SFUNC(hgpio4);
> +NPCM7XX_SFUNC(hgpio5);
> +NPCM7XX_SFUNC(hgpio6);
> +NPCM7XX_SFUNC(hgpio7);
>
>  /* Function names */
>  static struct npcm7xx_func npcm7xx_funcs[] = {
> @@ -892,6 +917,14 @@ static struct npcm7xx_func npcm7xx_funcs[] = {
>         NPCM7XX_MKFUNC(lkgpo1),
>         NPCM7XX_MKFUNC(lkgpo2),
>         NPCM7XX_MKFUNC(nprd_smi),
> +       NPCM7XX_MKFUNC(hgpio0),
> +       NPCM7XX_MKFUNC(hgpio1),
> +       NPCM7XX_MKFUNC(hgpio2),
> +       NPCM7XX_MKFUNC(hgpio3),
> +       NPCM7XX_MKFUNC(hgpio4),
> +       NPCM7XX_MKFUNC(hgpio5),
> +       NPCM7XX_MKFUNC(hgpio6),
> +       NPCM7XX_MKFUNC(hgpio7),
>  };
>
>  #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
> @@ -944,12 +977,12 @@ static const struct npcm7xx_pincfg pincfg[] = {
>         NPCM7XX_PINCFG(17,      pspi2, MFSEL3, 13,     smb4den, I2CSEGSEL,
> 23,  none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(18,      pspi2, MFSEL3, 13,       smb4b, I2CSEGSEL,
> 14,  none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(19,      pspi2, MFSEL3, 13,       smb4b, I2CSEGSEL,
> 14,  none, NONE, 0,       DS(8, 12)),
> -       NPCM7XX_PINCFG(20,      smb4c, I2CSEGSEL, 15,    smb15, MFSEL3,
> 8,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(21,      smb4c, I2CSEGSEL, 15,    smb15, MFSEL3,
> 8,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(22,      smb4d, I2CSEGSEL, 16,    smb14, MFSEL3,
> 7,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(23,      smb4d, I2CSEGSEL, 16,    smb14, MFSEL3,
> 7,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(24,       ioxh, MFSEL3, 18,        none, NONE, 0,
>       none, NONE, 0,       DS(8, 12)),
> -       NPCM7XX_PINCFG(25,       ioxh, MFSEL3, 18,        none, NONE, 0,
>       none, NONE, 0,       DS(8, 12)),
> +       NPCM7XX_PINCFG(20,      hgpio0, MFSEL2, 24,      smb15, MFSEL3,
> 8,      smb4c, I2CSEGSEL, 15,        0),
> +       NPCM7XX_PINCFG(21,      hgpio1, MFSEL2, 25,      smb15, MFSEL3,
> 8,      smb4c, I2CSEGSEL, 15,        0),
> +       NPCM7XX_PINCFG(22,      hgpio2, MFSEL2, 26,      smb14, MFSEL3,
> 7,      smb4d, I2CSEGSEL, 16,        0),
> +       NPCM7XX_PINCFG(23,      hgpio3, MFSEL2, 27,      smb14, MFSEL3,
> 7,      smb4d, I2CSEGSEL, 16,        0),
> +       NPCM7XX_PINCFG(24,       hgpio4, MFSEL2, 28,    ioxh, MFSEL3, 18,
>      none, NONE, 0,       DS(8, 12)),
> +       NPCM7XX_PINCFG(25,       hgpio5, MFSEL2, 29,    ioxh, MFSEL3, 18,
>      none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(26,       smb5, MFSEL1, 2,         none, NONE, 0,
>       none, NONE, 0,       0),
>         NPCM7XX_PINCFG(27,       smb5, MFSEL1, 2,         none, NONE, 0,
>       none, NONE, 0,       0),
>         NPCM7XX_PINCFG(28,       smb4, MFSEL1, 1,         none, NONE, 0,
>       none, NONE, 0,       0),
> @@ -982,8 +1015,8 @@ static const struct npcm7xx_pincfg pincfg[] = {
>         NPCM7XX_PINCFG(56,      r1err, MFSEL1, 12,        none, NONE, 0,
>       none, NONE, 0,       0),
>         NPCM7XX_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0,
>       none, NONE, 0,       DS(2, 4)),
>         NPCM7XX_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0,
>       none, NONE, 0,       DS(2, 4)),
> -       NPCM7XX_PINCFG(59,      smb3d, I2CSEGSEL, 13,     none, NONE, 0,
>       none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(60,      smb3d, I2CSEGSEL, 13,     none, NONE, 0,
>       none, NONE, 0,       0),
> +       NPCM7XX_PINCFG(59,      hgpio6, MFSEL2, 30,       smb3d,
> I2CSEGSEL, 13, none, NONE, 0,       0),
> +       NPCM7XX_PINCFG(60,      hgpio7, MFSEL2, 31,       smb3d,
> I2CSEGSEL, 13, none, NONE, 0,       0),
>         NPCM7XX_PINCFG(61,      uart1, MFSEL1, 10,        none, NONE, 0,
>       none, NONE, 0,     GPO),
>         NPCM7XX_PINCFG(62,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3,
> 24,     none, NONE, 0,     GPO),
>         NPCM7XX_PINCFG(63,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3,
> 24,     none, NONE, 0,     GPO),
> @@ -1188,12 +1221,12 @@ static const struct pinctrl_pin_desc
> npcm7xx_pins[] = {
>         PINCTRL_PIN(17, "GPIO17/PSPI2DI/SMB4DEN"),
>         PINCTRL_PIN(18, "GPIO18/PSPI2D0/SMB4BSDA"),
>         PINCTRL_PIN(19, "GPIO19/PSPI2CK/SMB4BSCL"),
> -       PINCTRL_PIN(20, "GPIO20/SMB4CSDA/SMB15SDA"),
> -       PINCTRL_PIN(21, "GPIO21/SMB4CSCL/SMB15SCL"),
> -       PINCTRL_PIN(22, "GPIO22/SMB4DSDA/SMB14SDA"),
> -       PINCTRL_PIN(23, "GPIO23/SMB4DSCL/SMB14SCL"),
> -       PINCTRL_PIN(24, "GPIO24/IOXHDO"),
> -       PINCTRL_PIN(25, "GPIO25/IOXHDI"),
> +       PINCTRL_PIN(20, "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA"),
> +       PINCTRL_PIN(21, "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL"),
> +       PINCTRL_PIN(22, "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA"),
> +       PINCTRL_PIN(23, "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL"),
> +       PINCTRL_PIN(24, "GPIO24/HGPIO4/IOXHDO"),
> +       PINCTRL_PIN(25, "GPIO25/HGPIO5/IOXHDI"),
>         PINCTRL_PIN(26, "GPIO26/SMB5SDA"),
>         PINCTRL_PIN(27, "GPIO27/SMB5SCL"),
>         PINCTRL_PIN(28, "GPIO28/SMB4SDA"),
> @@ -1226,8 +1259,8 @@ static const struct pinctrl_pin_desc npcm7xx_pins[]
> = {
>         PINCTRL_PIN(56, "GPIO56/R1RXERR"),
>         PINCTRL_PIN(57, "GPIO57/R1MDC"),
>         PINCTRL_PIN(58, "GPIO58/R1MDIO"),
> -       PINCTRL_PIN(59, "GPIO59/SMB3DSDA"),
> -       PINCTRL_PIN(60, "GPIO60/SMB3DSCL"),
> +       PINCTRL_PIN(59, "GPIO59/HGPIO6/SMB3DSDA"),
> +       PINCTRL_PIN(60, "GPIO60/HGPIO7/SMB3DSCL"),
>         PINCTRL_PIN(61, "GPO61/nDTR1_BOUT1/STRAP6"),
>         PINCTRL_PIN(62, "GPO62/nRTST1/STRAP5"),
>         PINCTRL_PIN(63, "GPO63/TXD1/STRAP4"),
> --
> 2.22.0
>
>

--000000000000cc334f05b8d613aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, forgot to add it this patch already approved.<=
/div><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 13 Jan 2021 at 22:00, To=
mer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tma=
imon77@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77=
@gmail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt;=C2=A0</blockquote=
><div>=C2=A0</div><div>Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel=
@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++-----=
-<br>
=C2=A01 file changed, 49 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nu=
voton/pinctrl-npcm7xx.c<br>
index a935065cdac4..e5f58ea89917 100644<br>
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c<br>
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c<br>
@@ -504,6 +504,15 @@ static const int lkgpo2_pins[] =3D { 9 };<br>
<br>
=C2=A0static const int nprd_smi_pins[] =3D { 190 };<br>
<br>
+static const int hgpio0_pins[] =3D { 20 };<br>
+static const int hgpio1_pins[] =3D { 21 };<br>
+static const int hgpio2_pins[] =3D { 22 };<br>
+static const int hgpio3_pins[] =3D { 23 };<br>
+static const int hgpio4_pins[] =3D { 24 };<br>
+static const int hgpio5_pins[] =3D { 25 };<br>
+static const int hgpio6_pins[] =3D { 59 };<br>
+static const int hgpio7_pins[] =3D { 60 };<br>
+<br>
=C2=A0/*<br>
=C2=A0 * pin:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name, number<b=
r>
=C2=A0 * group:=C2=A0 =C2=A0 name, npins,=C2=A0 =C2=A0pins<br>
@@ -631,6 +640,14 @@ struct npcm7xx_group {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_GRP(lkgpo1), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_GRP(lkgpo2), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_GRP(nprd_smi), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio0), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio1), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio2), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio3), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio4), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio5), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio6), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_GRP(hgpio7), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
<br>
=C2=A0enum {<br>
@@ -774,6 +791,14 @@ NPCM7XX_SFUNC(lkgpo0);<br>
=C2=A0NPCM7XX_SFUNC(lkgpo1);<br>
=C2=A0NPCM7XX_SFUNC(lkgpo2);<br>
=C2=A0NPCM7XX_SFUNC(nprd_smi);<br>
+NPCM7XX_SFUNC(hgpio0);<br>
+NPCM7XX_SFUNC(hgpio1);<br>
+NPCM7XX_SFUNC(hgpio2);<br>
+NPCM7XX_SFUNC(hgpio3);<br>
+NPCM7XX_SFUNC(hgpio4);<br>
+NPCM7XX_SFUNC(hgpio5);<br>
+NPCM7XX_SFUNC(hgpio6);<br>
+NPCM7XX_SFUNC(hgpio7);<br>
<br>
=C2=A0/* Function names */<br>
=C2=A0static struct npcm7xx_func npcm7xx_funcs[] =3D {<br>
@@ -892,6 +917,14 @@ static struct npcm7xx_func npcm7xx_funcs[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_MKFUNC(lkgpo1),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_MKFUNC(lkgpo2),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_MKFUNC(nprd_smi),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_MKFUNC(hgpio7),<br>
=C2=A0};<br>
<br>
=C2=A0#define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \<br>
@@ -944,12 +977,12 @@ static const struct npcm7xx_pincfg pincfg[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(17,=C2=A0 =C2=A0 =C2=A0 pspi2, M=
FSEL3, 13,=C2=A0 =C2=A0 =C2=A0smb4den, I2CSEGSEL, 23,=C2=A0 none, NONE, 0,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(18,=C2=A0 =C2=A0 =C2=A0 pspi2, M=
FSEL3, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0smb4b, I2CSEGSEL, 14,=C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(19,=C2=A0 =C2=A0 =C2=A0 pspi2, M=
FSEL3, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0smb4b, I2CSEGSEL, 14,=C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(20,=C2=A0 =C2=A0 =C2=A0 smb4c, I=
2CSEGSEL, 15,=C2=A0 =C2=A0 smb15, MFSEL3, 8,=C2=A0 =C2=A0 =C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(21,=C2=A0 =C2=A0 =C2=A0 smb4c, I=
2CSEGSEL, 15,=C2=A0 =C2=A0 smb15, MFSEL3, 8,=C2=A0 =C2=A0 =C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(22,=C2=A0 =C2=A0 =C2=A0 smb4d, I=
2CSEGSEL, 16,=C2=A0 =C2=A0 smb14, MFSEL3, 7,=C2=A0 =C2=A0 =C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(23,=C2=A0 =C2=A0 =C2=A0 smb4d, I=
2CSEGSEL, 16,=C2=A0 =C2=A0 smb14, MFSEL3, 7,=C2=A0 =C2=A0 =C2=A0 none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(24,=C2=A0 =C2=A0 =C2=A0 =C2=A0io=
xh, MFSEL3, 18,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(25,=C2=A0 =C2=A0 =C2=A0 =C2=A0io=
xh, MFSEL3, 18,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(20,=C2=A0 =C2=A0 =C2=A0 hgpio0, =
MFSEL2, 24,=C2=A0 =C2=A0 =C2=A0 smb15, MFSEL3, 8,=C2=A0 =C2=A0 =C2=A0 smb4c=
, I2CSEGSEL, 15,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(21,=C2=A0 =C2=A0 =C2=A0 hgpio1, =
MFSEL2, 25,=C2=A0 =C2=A0 =C2=A0 smb15, MFSEL3, 8,=C2=A0 =C2=A0 =C2=A0 smb4c=
, I2CSEGSEL, 15,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(22,=C2=A0 =C2=A0 =C2=A0 hgpio2, =
MFSEL2, 26,=C2=A0 =C2=A0 =C2=A0 smb14, MFSEL3, 7,=C2=A0 =C2=A0 =C2=A0 smb4d=
, I2CSEGSEL, 16,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(23,=C2=A0 =C2=A0 =C2=A0 hgpio3, =
MFSEL2, 27,=C2=A0 =C2=A0 =C2=A0 smb14, MFSEL3, 7,=C2=A0 =C2=A0 =C2=A0 smb4d=
, I2CSEGSEL, 16,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(24,=C2=A0 =C2=A0 =C2=A0 =C2=A0hg=
pio4, MFSEL2, 28,=C2=A0 =C2=A0 ioxh, MFSEL3, 18,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(25,=C2=A0 =C2=A0 =C2=A0 =C2=A0hg=
pio5, MFSEL2, 29,=C2=A0 =C2=A0 ioxh, MFSEL3, 18,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(8, 12)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(26,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b5, MFSEL1, 2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(27,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b5, MFSEL1, 2,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(28,=C2=A0 =C2=A0 =C2=A0 =C2=A0sm=
b4, MFSEL1, 1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0none, NONE, 0,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
@@ -982,8 +1015,8 @@ static const struct npcm7xx_pincfg pincfg[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(56,=C2=A0 =C2=A0 =C2=A0 r1err, M=
FSEL1, 12,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(57,=C2=A0 =C2=A0 =C2=A0 =C2=A0r1=
md, MFSEL1, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(2, 4)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(58,=C2=A0 =C2=A0 =C2=A0 =C2=A0r1=
md, MFSEL1, 13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0DS(2, 4)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(59,=C2=A0 =C2=A0 =C2=A0 smb3d, I=
2CSEGSEL, 13,=C2=A0 =C2=A0 =C2=A0none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(60,=C2=A0 =C2=A0 =C2=A0 smb3d, I=
2CSEGSEL, 13,=C2=A0 =C2=A0 =C2=A0none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(59,=C2=A0 =C2=A0 =C2=A0 hgpio6, =
MFSEL2, 30,=C2=A0 =C2=A0 =C2=A0 =C2=A0smb3d, I2CSEGSEL, 13, none, NONE, 0,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM7XX_PINCFG(60,=C2=A0 =C2=A0 =C2=A0 hgpio7, =
MFSEL2, 31,=C2=A0 =C2=A0 =C2=A0 =C2=A0smb3d, I2CSEGSEL, 13, none, NONE, 0,=
=C2=A0 =C2=A0 =C2=A0 =C2=A00),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(61,=C2=A0 =C2=A0 =C2=A0 uart1, M=
FSEL1, 10,=C2=A0 =C2=A0 =C2=A0 =C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 none, NONE, 0,=C2=A0 =C2=A0 =C2=A0GPO),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(62,=C2=A0 =C2=A0 =C2=A0 uart1, M=
FSEL1, 10,=C2=A0 =C2=A0 bmcuart1, MFSEL3, 24,=C2=A0 =C2=A0 =C2=A0none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0GPO),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PINCFG(63,=C2=A0 =C2=A0 =C2=A0 uart1, M=
FSEL1, 10,=C2=A0 =C2=A0 bmcuart1, MFSEL3, 24,=C2=A0 =C2=A0 =C2=A0none, NONE=
, 0,=C2=A0 =C2=A0 =C2=A0GPO),<br>
@@ -1188,12 +1221,12 @@ static const struct pinctrl_pin_desc npcm7xx_pins[]=
 =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(17, &quot;GPIO17/PSPI2DI/SMB4DEN&qu=
ot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(18, &quot;GPIO18/PSPI2D0/SMB4BSDA&q=
uot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(19, &quot;GPIO19/PSPI2CK/SMB4BSCL&q=
uot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(20, &quot;GPIO20/SMB4CSDA/SMB15SDA&=
quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(21, &quot;GPIO21/SMB4CSCL/SMB15SCL&=
quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(22, &quot;GPIO22/SMB4DSDA/SMB14SDA&=
quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(23, &quot;GPIO23/SMB4DSCL/SMB14SCL&=
quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(24, &quot;GPIO24/IOXHDO&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(25, &quot;GPIO25/IOXHDI&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(20, &quot;GPIO20/HGPIO0/SMB4CSDA/SM=
B15SDA&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(21, &quot;GPIO21/HGPIO1/SMB4CSCL/SM=
B15SCL&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(22, &quot;GPIO22/HGPIO2/SMB4DSDA/SM=
B14SDA&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(23, &quot;GPIO23/HGPIO3/SMB4DSCL/SM=
B14SCL&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(24, &quot;GPIO24/HGPIO4/IOXHDO&quot=
;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(25, &quot;GPIO25/HGPIO5/IOXHDI&quot=
;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(26, &quot;GPIO26/SMB5SDA&quot;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(27, &quot;GPIO27/SMB5SCL&quot;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(28, &quot;GPIO28/SMB4SDA&quot;),<br=
>
@@ -1226,8 +1259,8 @@ static const struct pinctrl_pin_desc npcm7xx_pins[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(56, &quot;GPIO56/R1RXERR&quot;),<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(57, &quot;GPIO57/R1MDC&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(58, &quot;GPIO58/R1MDIO&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(59, &quot;GPIO59/SMB3DSDA&quot;),<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(60, &quot;GPIO60/SMB3DSCL&quot;),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(59, &quot;GPIO59/HGPIO6/SMB3DSDA&qu=
ot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PINCTRL_PIN(60, &quot;GPIO60/HGPIO7/SMB3DSCL&qu=
ot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(61, &quot;GPO61/nDTR1_BOUT1/STRAP6&=
quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(62, &quot;GPO62/nRTST1/STRAP5&quot;=
),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PINCTRL_PIN(63, &quot;GPO63/TXD1/STRAP4&quot;),=
<br>
-- <br>
2.22.0<br>
<br>
</blockquote></div></div>
</div>

--000000000000cc334f05b8d613aa--
