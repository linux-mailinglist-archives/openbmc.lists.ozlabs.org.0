Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D4A90A73E
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 09:33:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EdcpG68a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hT037V7z3fnd
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 17:33:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EdcpG68a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hSS6d1Lz3fmh;
	Mon, 17 Jun 2024 17:33:12 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED8492014A;
	Mon, 17 Jun 2024 15:33:11 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718609593;
	bh=jkSFmq+QIQxRLTqnlNiAfSbUBGRyyeuuOZTApiqXJqc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EdcpG68asKfnCXSZa0TL+Pz/gdPTcrOZB/FtOK/Gn90lLys2gXSwb5movxxiDGJWK
	 5PsoNoMQTYyPQlIWwrJH6OKy/Qscz5huoNcSp/EQgHKio1fyUwPTibZuswPQWfQoB2
	 p2LtdxCikIBvRO6DGbZLlarl+XaRVgAXglbfQbuleQ8Z5weadT63R41slT1vomX6R6
	 0Ooknl61y7WVDnhVkETZ7FuUY++DCxrNPNj81eo4n4IcSpcV9S4/krnq49ia/P4C0v
	 KF8cPqTOZFzU6BZmr0sCrVGX2IYxknsDuK6xrbxuHxIDDXh9rTdde6vQ5KljDEqfet
	 CEPxpgWlt7Z4g==
Message-ID: <946f44526e3016f595bfe463cf0a7f5b4eaa084a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jun 2024 17:03:11 +0930
In-Reply-To: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
References: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-06-13 at 16:07 +0800, Potin Lai wrote:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.
>=20
> To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,
> reducing the number of required pins.

Hmm, I'm not convinced this is specific to NCSI (and it's an
unfortunate mistake on my part), but we do need to call the groups
something different than RMII[34]. Did you have any other suggestions?

>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 7938741136a2c..31e4e0b342a00 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
> =20
>  FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26=
, F25,
>  		E26);
> -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> +FUNC_DECL_2(RMII3, RMII3, NCSI3);
> =20
>  #define F24 28
>  SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
> =20
>  FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26=
, B25,
>  		B24);
> -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> +FUNC_DECL_2(RMII4, RMII4, NCSI4);
> =20
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_grou=
ps[] =3D {
>  	ASPEED_PINCTRL_GROUP(MDIO2),
>  	ASPEED_PINCTRL_GROUP(MDIO3),
>  	ASPEED_PINCTRL_GROUP(MDIO4),
> +	ASPEED_PINCTRL_GROUP(NCSI3),
> +	ASPEED_PINCTRL_GROUP(NCSI4),

You will need to update the binding document as well. I've poked Linus
W about a series I sent that re-formats the binding function and group
lists - it would be nice if you rework the patch on top of that:

https://lore.kernel.org/lkml/5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.camel=
@codeconstruct.com.au/

Cheers,

Andrew
