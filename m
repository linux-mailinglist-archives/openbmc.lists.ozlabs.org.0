Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B890FC85
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 08:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4VSr5rshz3cQ7
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 16:09:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4VSS6nrtz30T3;
	Thu, 20 Jun 2024 16:09:28 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5af485.dynamic.kabel-deutschland.de [95.90.244.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AA01E61E5FE01;
	Thu, 20 Jun 2024 08:08:24 +0200 (CEST)
Message-ID: <10ada752-f464-4d3d-aeb2-9c63ebff121a@molgen.mpg.de>
Date: Thu, 20 Jun 2024 08:08:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] pinctrl: aspeed-g6: Add NCSI pin group config
To: Potin Lai <potin.lai.pt@gmail.com>
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
 <20240620012512.3109518-2-potin.lai.pt@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240620012512.3109518-2-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Cosmo Chou <cosmo.chou@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Potin,


Thank you for your patch.

Am 20.06.24 um 03:25 schrieb Potin Lai:
> In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
> needed on the management controller side.

Please add a reference to the source for this statement.

> To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,

groupis? Do you mean group?

> reducing the number of required pins.
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 7938741136a2c..31e4e0b342a00 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
>   
>   FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26, F25,
>   		E26);
> -FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
> +GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
> +FUNC_DECL_2(RMII3, RMII3, NCSI3);
>   
>   #define F24 28
>   SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
> @@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
>   
>   FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
>   		B24);
> -FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
> +GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
> +FUNC_DECL_2(RMII4, RMII4, NCSI4);
>   
>   #define D22 40
>   SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> @@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
>   	ASPEED_PINCTRL_GROUP(MDIO2),
>   	ASPEED_PINCTRL_GROUP(MDIO3),
>   	ASPEED_PINCTRL_GROUP(MDIO4),
> +	ASPEED_PINCTRL_GROUP(NCSI3),
> +	ASPEED_PINCTRL_GROUP(NCSI4),
>   	ASPEED_PINCTRL_GROUP(NCTS1),
>   	ASPEED_PINCTRL_GROUP(NCTS2),
>   	ASPEED_PINCTRL_GROUP(NCTS3),


Kind regards,

Paul
