Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4128AD14
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 06:37:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8mBF4pC9zDqjx
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:37:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=B19LJQL9; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8m8y5ZCgzDqjx;
 Mon, 12 Oct 2020 15:36:34 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id 13so7835613qvc.9;
 Sun, 11 Oct 2020 21:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXUPAN9Z/Rz81n54Jgt5lcjYMAq/GQtzgsE1D7f7Lqs=;
 b=B19LJQL9gNGI+USiJENNYytqaiV5DjBYIqvpRcM4f0uuaRtEAJZVsqUgpPjQybYOqb
 XS7fFa0UAHxfp+NmnpYipKQzuEdUOEvkthL2e+BCgzbqmRKfJkHkQkOxueWaAaaDbKR5
 nGMTunzsNI2KBSjbEGykVgY1SJUZAgvCU+G7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXUPAN9Z/Rz81n54Jgt5lcjYMAq/GQtzgsE1D7f7Lqs=;
 b=X43UXwaJumd5jPwKvlk6NwhvRJftOd47aZvY3D5ATjIW6O7p3fwtMNjQZ9AQhrZc1v
 knMBi1A6hezFAhM15TcLBdBoobMpMMfsS3lDp5P2Zv1bCVgLL1blBL9yswQzzMyIm5Gx
 f3pCXKvzK0qpOMdRC+OQ2nuX0wv5ZO8jD+PGPVjMIllg3er2wNL810RAoelekyApj12c
 WCrU5Wb6dxb7AghaRrXefVI+2k3boe4jp1/7AE556VWTwQ0YRwBYhEzCNmsayRy8hVMz
 HTzMqxVIntDwhk2kn90HTuwKG1RavTCz0Q8fiuzhpvkR/j4DBRDOaTGg/44yGeS2rKUq
 1fHA==
X-Gm-Message-State: AOAM531ZDFpNJquDYDkTSCj71GstS5qIH6M1qdLkmsnUKpO7a9XskBAe
 3wJN15zAJo7OGm7qcdkEGLgCY/J7qStIYhu4eeQ=
X-Google-Smtp-Source: ABdhPJxBhJAIvzG71POJdVwegvk4Xn31ZRbhnVpA7O9tP5UNzHH66QXopvBFonDa5shlTkdaW2qLchh321d18YE5Jok=
X-Received: by 2002:ad4:54e9:: with SMTP id k9mr7674902qvx.18.1602477390583;
 Sun, 11 Oct 2020 21:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-4-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-4-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Oct 2020 04:36:18 +0000
Message-ID: <CACPK8Xc2vo6cvDHBiLN+a+k+wLG2VCynVHZgq6EtZjnNVjNNxA@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
To: Billy Tsai <billy_tsai@aspeedtech.com>,
 Linus Walleij <linus.walleij@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> At ast2600a1 we change feature of master sgpio to 2 sets.
> So this patch is used to add the pinctrl setting of the new sgpio.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Linus, can you take this through the pinctrl tree? The patch to the
will be fine to come through your tree as we rarely update that file.

> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  5 ++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30 +++++++++++++++++++---
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..a16ecf08e307 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -862,6 +862,11 @@
>                 groups = "SGPM1";
>         };
>
> +       pinctrl_sgpm2_default: sgpm2_default {
> +               function = "SGPM2";
> +               groups = "SGPM2";
> +       };
> +
>         pinctrl_sgps1_default: sgps1_default {
>                 function = "SGPS1";
>                 groups = "SGPS1";
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..b673a44ffa3b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -46,8 +46,10 @@
>  #define SCU620         0x620 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634         0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638         0x638 /* Disable GPIO Internal Pull-Down #6 */
> +#define SCU690         0x690 /* Multi-function Pin Control #24 */
>  #define SCU694         0x694 /* Multi-function Pin Control #25 */
>  #define SCU69C         0x69C /* Multi-function Pin Control #27 */
> +#define SCU6D0         0x6D0 /* Multi-function Pin Control #28 */
>  #define SCUC20         0xC20 /* PCIE configuration Setting Control */
>
>  #define ASPEED_G6_NR_PINS 256
> @@ -81,13 +83,21 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>  #define K26 4
>  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
>  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4),
> +                         SIG_DESC_CLEAR(SCU410, 4), SIG_DESC_CLEAR(SCU4B0, 4),
> +                         SIG_DESC_CLEAR(SCU690, 4));
> +PIN_DECL_3(K26, GPIOA4, SGPM2CLK, MACLINK1, SCL13);
>  FUNC_GROUP_DECL(MACLINK1, K26);
>
>  #define L24 5
>  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
>  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5),
> +                         SIG_DESC_CLEAR(SCU410, 5), SIG_DESC_CLEAR(SCU4B0, 5),
> +                         SIG_DESC_CLEAR(SCU690, 5));
> +PIN_DECL_3(L24, GPIOA5, SGPM2LD, MACLINK2, SDA13);
>  FUNC_GROUP_DECL(MACLINK2, L24);
>
>  FUNC_GROUP_DECL(I2C13, K26, L24);
> @@ -95,16 +105,26 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
>  #define L23 6
>  SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
>  SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
> -PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6),
> +                         SIG_DESC_CLEAR(SCU410, 6), SIG_DESC_CLEAR(SCU4B0, 6),
> +                         SIG_DESC_CLEAR(SCU690, 6));
> +PIN_DECL_3(L23, GPIOA6, SGPM2O, MACLINK3, SCL14);
>  FUNC_GROUP_DECL(MACLINK3, L23);
>
>  #define K25 7
>  SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
>  SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
> -PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7),
> +                         SIG_DESC_CLEAR(SCU410, 7), SIG_DESC_CLEAR(SCU4B0, 7),
> +                         SIG_DESC_CLEAR(SCU690, 7));
> +PIN_DECL_3(K25, GPIOA7, SGPM2I, MACLINK4, SDA14);
>  FUNC_GROUP_DECL(MACLINK4, K25);
>
>  FUNC_GROUP_DECL(I2C14, L23, K25);
> +/*SGPM2 is A1 Only */
> +FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
>
>  #define J26 8
>  SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
> @@ -2060,6 +2080,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
>         ASPEED_PINCTRL_GROUP(EMMCG4),
>         ASPEED_PINCTRL_GROUP(EMMCG8),
>         ASPEED_PINCTRL_GROUP(SGPM1),
> +       ASPEED_PINCTRL_GROUP(SGPM2),
>         ASPEED_PINCTRL_GROUP(SGPS1),
>         ASPEED_PINCTRL_GROUP(SIOONCTRL),
>         ASPEED_PINCTRL_GROUP(SIOPBI),
> @@ -2276,6 +2297,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
>         ASPEED_PINCTRL_FUNC(SD1),
>         ASPEED_PINCTRL_FUNC(SD2),
>         ASPEED_PINCTRL_FUNC(SGPM1),
> +       ASPEED_PINCTRL_FUNC(SGPM2),
>         ASPEED_PINCTRL_FUNC(SGPS1),
>         ASPEED_PINCTRL_FUNC(SIOONCTRL),
>         ASPEED_PINCTRL_FUNC(SIOPBI),
> --
> 2.17.1
>
