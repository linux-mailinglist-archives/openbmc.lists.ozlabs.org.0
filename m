Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B0A298556
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 02:33:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKHQw2sNgzDqLj
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 12:33:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=KhWmSJ0k; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bEwo3usE; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKHJF4r4rzDqN5;
 Mon, 26 Oct 2020 12:27:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C49565801B5;
 Sun, 25 Oct 2020 21:27:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 21:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=gaue3BiVVr+JMcjmKil+EpRgMuCh70g
 7cL5x/wqNOWU=; b=KhWmSJ0kDjL5WNg8yAfql+Q9gaX/+QXyEaOhWNP36LusNLC
 byPwAOuzy78uWpm8v3Z2lyZE4W7zqbdg6l4j28bG8Ha3f7QglJ+ZSWGPkzjWSfLM
 xZQ+DWam4iFTa70hJVhODLY/A6j95Wqttjkz2Ip+Px83L7oROwPrelP1CBmbhyzt
 2xAT72G9PowhkD41+8rceVM1fFOQS12ZTlR8GWqUfwIS01qzzdj1FeTU3yt9Yc5/
 6qJCeIxgz22WrEAvPpy2TzBF6DzX+AqO6xzUBIlNQddIlvUzyfbR5jmp/UZe0RXF
 f/RTBbD5jI1yjY2PkISswFKbyjvthDYiswb7xKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gaue3B
 iVVr+JMcjmKil+EpRgMuCh70g7cL5x/wqNOWU=; b=bEwo3usEhKgfDDVC0rO+Fc
 2kr+3/Q9b8v9PtDzSfjQasw56j37pc9LySCoF/Z+u+lVgcJHU7zXqdOn+tv2nd3B
 33wNHINWu1MwLeU7Xh47+7vm3jIhutFxlOmRE0cRrsGBMjhjNYCiLb20To7UKk1a
 IQysBxH/gjUlAaQx/2yJeZOqQA8t79yiKzpeyNVgVH9qL2CO0k0Ob4EPoJtrCNWZ
 CoQ04je+IjMwJVWgHaQ817ZEO/HajRSAQ8JjZJ3O/fOjwvA0otFLw8jmkbZLb9Yc
 ueh7Xm3gSbPTijiIghxJXxraOHSiIpW9X/3H6a78M7DYAJ07ozkMiNII7j+s3t0w
 ==
X-ME-Sender: <xms:-CWWXxbzXuaJy7dKsy-Fwj8Oqwl01nHAQE3Mgl84bXmQehJBIDFkdw>
 <xme:-CWWX4ZgEdmlDXI_C08B8SIZKA8ma9d5uxaRHxV4rhCwM4DAXuye2OvrVcIGOD7Qs
 R82K_qpFd4xnG2d0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-CWWXz_VBjBCNMaGiRLBXwclTW08oFwnOseZ7D7z3RGuSUiGfR7FZA>
 <xmx:-CWWX_rRdhN0KsHpDN_Qe-0WwT1BaqdtZh8AA7S3UOAInl_1HNT4EA>
 <xmx:-CWWX8rH-aSR3ZBId5Pt5OKaxpsYtG5g-c2Fzq0uZ7RdgfWrpaAxkw>
 <xmx:-SWWXz1lLOF9QJlH8j-UxmDo-UaXLK-oBkNNEjshSUGbyIiOoZo2mg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E9D39E04F6; Sun, 25 Oct 2020 21:27:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <ce3dce98-1daa-47bb-a688-0d5a743e45b2@www.fastmail.com>
In-Reply-To: <20201012033150.21056-4-billy_tsai@aspeedtech.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-4-billy_tsai@aspeedtech.com>
Date: Mon, 26 Oct 2020 11:56:59 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Content-Type: text/plain
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 12 Oct 2020, at 14:01, Billy Tsai wrote:
> At ast2600a1 we change feature of master sgpio to 2 sets.
> So this patch is used to add the pinctrl setting of the new sgpio.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi   |  5 ++++
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30 +++++++++++++++++++---
>  2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi 
> b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> index 7028e21bdd98..a16ecf08e307 100644
> --- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
> @@ -862,6 +862,11 @@
>  		groups = "SGPM1";
>  	};
>  
> +	pinctrl_sgpm2_default: sgpm2_default {
> +		function = "SGPM2";
> +		groups = "SGPM2";
> +	};
> +
>  	pinctrl_sgps1_default: sgps1_default {
>  		function = "SGPS1";
>  		groups = "SGPS1";
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..b673a44ffa3b 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -46,8 +46,10 @@
>  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
> +#define SCU690		0x690 /* Multi-function Pin Control #24 */
>  #define SCU694		0x694 /* Multi-function Pin Control #25 */
>  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
> +#define SCU6D0		0x6D0 /* Multi-function Pin Control #28 */
>  #define SCUC20		0xC20 /* PCIE configuration Setting Control */
>  
>  #define ASPEED_G6_NR_PINS 256
> @@ -81,13 +83,21 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>  #define K26 4
>  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
>  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4),
> +			  SIG_DESC_CLEAR(SCU410, 4), SIG_DESC_CLEAR(SCU4B0, 4),
> +			  SIG_DESC_CLEAR(SCU690, 4));
> +PIN_DECL_3(K26, GPIOA4, SGPM2CLK, MACLINK1, SCL13);
>  FUNC_GROUP_DECL(MACLINK1, K26);
>  
>  #define L24 5
>  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
>  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> +/*SGPM2 is A1 Only */
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5),
> +			  SIG_DESC_CLEAR(SCU410, 5), SIG_DESC_CLEAR(SCU4B0, 5),
> +			  SIG_DESC_CLEAR(SCU690, 5));

A few things:

1. It looks like the Multi-function Pins Mapping and Control table in section 5.1 of the datasheet only tells part of the story. It lists SGPS2 on the pins you've modified in this patch but not SGPM2. However, the table in section 2.1 (Pin Description) does outline SGPM2 and SGPS2 are routed via the same pins, though this does not listed the associated registers and bit fields. Can we fix the table in 5.1 so it's easier to review this patch?

2. We don't need to specify the _CLEAR() behaviour here as this is implied by the process to disable the higher priority mux configurations. It should be enough to do:

SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5));

However, this requires that we also define the priorities correctly, so:

3. Can we add both the SGPS2 and SGPM2 configurations so we have a complete definition for the pins?

Cheers,

Andrew
