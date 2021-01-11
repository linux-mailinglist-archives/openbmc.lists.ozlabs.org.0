Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D62F0AAB
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 01:57:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDb073gpkzDqVT
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 11:57:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KEWzGGtw; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDZyv491CzDqVq
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:56:23 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id a6so10302992qtw.6
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 16:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sa7F3eQpbilYNUo+rmrT9HoIn+8W74dg6yIW6QZpaEw=;
 b=KEWzGGtwHNL/Zw5krH/Uzx18hP/braI7swCPsRsEZTz3It48yhQA51uBpUWDoAC5x/
 C2dGEUvkmxzcLJxU4us+bqAo/RuYdSP39LH5/lKUiupn6HhlRMZaqRaN5xcA3UxZwADR
 fz3MUFQ7aT+j4In13e58rTZk4BvyKeynu2jTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sa7F3eQpbilYNUo+rmrT9HoIn+8W74dg6yIW6QZpaEw=;
 b=Rxay2ALDr/guOMsQieCfJPoQ3g529Gulzd18K1n/EqgekTMretbFBKjBeOCPZdnTtv
 TEftzSuxwrjYBVf5Uk6BrVMJ5daOr7EV5qww6fr6dtyudaDkJyaQVYAznrVzvWGWmrwh
 mNZPcLBw+eDzdxCH4t7jSA7M3MkZK8zbYMSF9QiPTkCdovfHxh4zGljlS+Gz/knf+jQ1
 7htI3MyrEqdDZma1QTz1F1JBffF55D+VO9RZZFCS7BRt4ml+DcLxw/9+vuf5PkNNnUix
 ytPGBFiDub97tvu496gAooE6sWbV2ij7frw1zRIXq3ywQcH8HEbkHko0S04xjDGCNPEa
 qQGg==
X-Gm-Message-State: AOAM532Q3wlyt93Hw5lnIvC7aCZjaxJKDZ4iI9LxZRQ2nFyteL9n0vkg
 xoHfcZdDxLjKm5lEmHW77CUbZL8s2lY3E+RxBgw=
X-Google-Smtp-Source: ABdhPJznrYRSWGGydMbARwHQY/z8wepH65sEHWxwxbXoZ9Nlr3Ph64ZaTAWvfof+fxC82VQWWwt6cicNdNhjRJkkbic=
X-Received: by 2002:ac8:4d4d:: with SMTP id x13mr13087386qtv.385.1610326581376; 
 Sun, 10 Jan 2021 16:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-7-tmaimon77@gmail.com>
In-Reply-To: <20210105134508.225702-7-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 00:56:09 +0000
Message-ID: <CACPK8XfShfp2w2q7GEKBaQWrUT-HduDBU-EcSYzBbuj20n8HUg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 06/11] pinctrl: npcm7xx: Add HGPIO pin
 support to NPCM7xx pinctrl driver
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

This one should go upstream asap.

> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++------
>  1 file changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
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
>         NPCM7XX_PINCFG(17,      pspi2, MFSEL3, 13,     smb4den, I2CSEGSEL, 23,  none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(18,      pspi2, MFSEL3, 13,       smb4b, I2CSEGSEL, 14,  none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(19,      pspi2, MFSEL3, 13,       smb4b, I2CSEGSEL, 14,  none, NONE, 0,       DS(8, 12)),
> -       NPCM7XX_PINCFG(20,      smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(21,      smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(22,      smb4d, I2CSEGSEL, 16,    smb14, MFSEL3, 7,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(23,      smb4d, I2CSEGSEL, 16,    smb14, MFSEL3, 7,      none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(24,       ioxh, MFSEL3, 18,        none, NONE, 0,        none, NONE, 0,       DS(8, 12)),
> -       NPCM7XX_PINCFG(25,       ioxh, MFSEL3, 18,        none, NONE, 0,        none, NONE, 0,       DS(8, 12)),
> +       NPCM7XX_PINCFG(20,      hgpio0, MFSEL2, 24,      smb15, MFSEL3, 8,      smb4c, I2CSEGSEL, 15,        0),
> +       NPCM7XX_PINCFG(21,      hgpio1, MFSEL2, 25,      smb15, MFSEL3, 8,      smb4c, I2CSEGSEL, 15,        0),
> +       NPCM7XX_PINCFG(22,      hgpio2, MFSEL2, 26,      smb14, MFSEL3, 7,      smb4d, I2CSEGSEL, 16,        0),
> +       NPCM7XX_PINCFG(23,      hgpio3, MFSEL2, 27,      smb14, MFSEL3, 7,      smb4d, I2CSEGSEL, 16,        0),
> +       NPCM7XX_PINCFG(24,       hgpio4, MFSEL2, 28,    ioxh, MFSEL3, 18,       none, NONE, 0,       DS(8, 12)),
> +       NPCM7XX_PINCFG(25,       hgpio5, MFSEL2, 29,    ioxh, MFSEL3, 18,       none, NONE, 0,       DS(8, 12)),
>         NPCM7XX_PINCFG(26,       smb5, MFSEL1, 2,         none, NONE, 0,        none, NONE, 0,       0),
>         NPCM7XX_PINCFG(27,       smb5, MFSEL1, 2,         none, NONE, 0,        none, NONE, 0,       0),
>         NPCM7XX_PINCFG(28,       smb4, MFSEL1, 1,         none, NONE, 0,        none, NONE, 0,       0),
> @@ -982,8 +1015,8 @@ static const struct npcm7xx_pincfg pincfg[] = {
>         NPCM7XX_PINCFG(56,      r1err, MFSEL1, 12,        none, NONE, 0,        none, NONE, 0,       0),
>         NPCM7XX_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0,        none, NONE, 0,       DS(2, 4)),
>         NPCM7XX_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0,        none, NONE, 0,       DS(2, 4)),
> -       NPCM7XX_PINCFG(59,      smb3d, I2CSEGSEL, 13,     none, NONE, 0,        none, NONE, 0,       0),
> -       NPCM7XX_PINCFG(60,      smb3d, I2CSEGSEL, 13,     none, NONE, 0,        none, NONE, 0,       0),
> +       NPCM7XX_PINCFG(59,      hgpio6, MFSEL2, 30,       smb3d, I2CSEGSEL, 13, none, NONE, 0,       0),
> +       NPCM7XX_PINCFG(60,      hgpio7, MFSEL2, 31,       smb3d, I2CSEGSEL, 13, none, NONE, 0,       0),
>         NPCM7XX_PINCFG(61,      uart1, MFSEL1, 10,        none, NONE, 0,        none, NONE, 0,     GPO),
>         NPCM7XX_PINCFG(62,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3, 24,     none, NONE, 0,     GPO),
>         NPCM7XX_PINCFG(63,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3, 24,     none, NONE, 0,     GPO),
> @@ -1188,12 +1221,12 @@ static const struct pinctrl_pin_desc npcm7xx_pins[] = {
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
> @@ -1226,8 +1259,8 @@ static const struct pinctrl_pin_desc npcm7xx_pins[] = {
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
