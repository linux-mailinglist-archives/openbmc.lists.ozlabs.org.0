Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9E687B4AD
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 23:53:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c1n9XKbH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tw5R80Fzqz2yts
	for <lists+openbmc@lfdr.de>; Thu, 14 Mar 2024 09:53:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c1n9XKbH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tw5QY4T4bz2yts;
	Thu, 14 Mar 2024 09:53:25 +1100 (AEDT)
Received: from [192.168.68.112] (203-57-215-238.dyn.iinet.net.au [203.57.215.238])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E87FF20016;
	Thu, 14 Mar 2024 06:53:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1710370403;
	bh=cydJ+54ejYfm2ccD8VUDb0oN12f6pOX+IdLF5Scs4ZU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=c1n9XKbH/6lW50DxBCP1ItTvWdZUdzXu80aKJMcl/eQXsVGJao7gTCPR0ZAtsspFM
	 yaL9NCQUNariN9hQUNmQsdAPu6ZWyof8NAbYLW8AzZNg0JhWK2AxbKztzfmMlYGemg
	 kPa4//0YoQ3W+sVBorHsl5oUjIpR/YoVax5y1WOhPuMujNkaYEp0ihl4FNwh8Xq8hY
	 TPQfujU6ga2JshXEJFZjFXHLd1cIJa1Busv8hzy6NBIQDKicvQgXZwcRLeDHA8g4Fn
	 ZPZSczdrSm/EScL244f8p5EuKO0gYUhBcUXOeAM5V/RBCyDpmusstUk1+SQGLvympv
	 tM+NxB+/6AXjw==
Message-ID: <d4e265ea19b14c3f76bc5ce8fdddae0783cb6cd1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] pinctrl: pinctrl-aspeed-g6: Fix register offset for
 pinconf of GPIOR-T
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 joel@jms.id.au, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
  openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 BMC-SW@aspeedtech.com, Ricky_CX_Wu@wiwynn.com
Date: Thu, 14 Mar 2024 09:23:19 +1030
In-Reply-To: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
References: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-03-13 at 17:28 +0800, Billy Tsai wrote:
> The register offset to disable the internal pull-down of GPIOR~T is 0x630
> instead of 0x620, as specified in the Ast2600 datasheet v15
> The datasheet can download from the official Aspeed website.

... if you're a customer with an account enabled to access it :)

>=20
> Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Not sure what the history is exactly. Could have been a typo or a
change in the SCU register layout given it was likely written against
A0 (A3 is mass-production).

Andrew

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 34 +++++++++++-----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index d376fa7114d1..029efe16f8cc 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -43,7 +43,7 @@
>  #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
>  #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
>  #define SCU61C		0x61c /* Disable GPIO Internal Pull-Down #3 */
> -#define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
> +#define SCU630		0x630 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
>  #define SCU690		0x690 /* Multi-function Pin Control #24 */
> @@ -2495,38 +2495,38 @@ static struct aspeed_pin_config aspeed_g6_configs=
[] =3D {
>  	ASPEED_PULL_DOWN_PINCONF(D14, SCU61C, 0),
> =20
>  	/* GPIOS7 */
> -	ASPEED_PULL_DOWN_PINCONF(T24, SCU620, 23),
> +	ASPEED_PULL_DOWN_PINCONF(T24, SCU630, 23),
>  	/* GPIOS6 */
> -	ASPEED_PULL_DOWN_PINCONF(P23, SCU620, 22),
> +	ASPEED_PULL_DOWN_PINCONF(P23, SCU630, 22),
>  	/* GPIOS5 */
> -	ASPEED_PULL_DOWN_PINCONF(P24, SCU620, 21),
> +	ASPEED_PULL_DOWN_PINCONF(P24, SCU630, 21),
>  	/* GPIOS4 */
> -	ASPEED_PULL_DOWN_PINCONF(R26, SCU620, 20),
> +	ASPEED_PULL_DOWN_PINCONF(R26, SCU630, 20),
>  	/* GPIOS3*/
> -	ASPEED_PULL_DOWN_PINCONF(R24, SCU620, 19),
> +	ASPEED_PULL_DOWN_PINCONF(R24, SCU630, 19),
>  	/* GPIOS2 */
> -	ASPEED_PULL_DOWN_PINCONF(T26, SCU620, 18),
> +	ASPEED_PULL_DOWN_PINCONF(T26, SCU630, 18),
>  	/* GPIOS1 */
> -	ASPEED_PULL_DOWN_PINCONF(T25, SCU620, 17),
> +	ASPEED_PULL_DOWN_PINCONF(T25, SCU630, 17),
>  	/* GPIOS0 */
> -	ASPEED_PULL_DOWN_PINCONF(R23, SCU620, 16),
> +	ASPEED_PULL_DOWN_PINCONF(R23, SCU630, 16),
> =20
>  	/* GPIOR7 */
> -	ASPEED_PULL_DOWN_PINCONF(U26, SCU620, 15),
> +	ASPEED_PULL_DOWN_PINCONF(U26, SCU630, 15),
>  	/* GPIOR6 */
> -	ASPEED_PULL_DOWN_PINCONF(W26, SCU620, 14),
> +	ASPEED_PULL_DOWN_PINCONF(W26, SCU630, 14),
>  	/* GPIOR5 */
> -	ASPEED_PULL_DOWN_PINCONF(T23, SCU620, 13),
> +	ASPEED_PULL_DOWN_PINCONF(T23, SCU630, 13),
>  	/* GPIOR4 */
> -	ASPEED_PULL_DOWN_PINCONF(U25, SCU620, 12),
> +	ASPEED_PULL_DOWN_PINCONF(U25, SCU630, 12),
>  	/* GPIOR3*/
> -	ASPEED_PULL_DOWN_PINCONF(V26, SCU620, 11),
> +	ASPEED_PULL_DOWN_PINCONF(V26, SCU630, 11),
>  	/* GPIOR2 */
> -	ASPEED_PULL_DOWN_PINCONF(V24, SCU620, 10),
> +	ASPEED_PULL_DOWN_PINCONF(V24, SCU630, 10),
>  	/* GPIOR1 */
> -	ASPEED_PULL_DOWN_PINCONF(U24, SCU620, 9),
> +	ASPEED_PULL_DOWN_PINCONF(U24, SCU630, 9),
>  	/* GPIOR0 */
> -	ASPEED_PULL_DOWN_PINCONF(V25, SCU620, 8),
> +	ASPEED_PULL_DOWN_PINCONF(V25, SCU630, 8),
> =20
>  	/* GPIOX7 */
>  	ASPEED_PULL_DOWN_PINCONF(AB10, SCU634, 31),

