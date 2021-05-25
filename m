Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EA38F724
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 02:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpwc25pJVz306W
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 10:55:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=LZ9NPazf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BvMOg00i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=LZ9NPazf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BvMOg00i; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpwbd2sG6z2yWv;
 Tue, 25 May 2021 10:55:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40172580A15;
 Mon, 24 May 2021 20:55:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 20:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=s6CkGfz9jB7Vy+wB/3YGu6VTE55ic6V
 mVp9dUQluYfY=; b=LZ9NPazflkc/boomxEqyv5Du9c+3d0JMvf7K0vYm2/7rC98
 J9he6gG8+yejQxbFJpGxyUZ7SKJUUsme0+4zhheveeg/1tKEsmJt6mI18ekf8c1A
 8yeo1WXkVdH899/gGcB7gs9mLp3uk/mZZuoprvKUNizArmugFPNSI007ENxDtOtI
 YT0sW2poRFIYvYwtXVQgKhcPSFAoXt+3CCxDdc5pz6e5Y6e2gR9BiNLnzIgk3IVR
 NwKRAERqzuM4NovQtMt0rdJ/utNjDhNcqkOO3yPLfWzUt4q1Mos96vJCYvF2fp2s
 b3yY1ZdrqCL5dntiocDlqtcuiJyvlRs0uPDK+1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=s6CkGf
 z9jB7Vy+wB/3YGu6VTE55ic6VmVp9dUQluYfY=; b=BvMOg00idES+ejnH9q88+p
 X6NrQtN65WQKWbPOc8IDX7Y598WoL1myEa4P1mgE8KjLiDJauJxaFHTIcdjWFZMZ
 IG1M57SOBlkGFOizFHIEPJ+XLTdq0eTw79a1lsKRhRK5+3e4UuvCgudAV6Hhi5Qk
 v1tBfysxHXCmw67bZnYd/RoRFzlrNmKhFao6SlrS0vfWoT6omdNt/Cg77pDVpwa3
 K5d8Hfe7hmA+EBkG349ofI5W4FHLmDqOeWCB+OZ3yKW6pwz1y3daVPauUFOUrPru
 ta+Ra+/KZrCAIniJKhcVJC2ReFfBXkLL83UtERinoJMZsunOUG0PG2mkYAlUbepg
 ==
X-ME-Sender: <xms:6EqsYE2CyQy7ibvgGLJc6OyERcsixivWmHcGOBvuiQUE2UvWQ_IFhg>
 <xme:6EqsYPHEz6lec1Tc0jV_J5l6Lg6XJZq8UEJELa-tVA-vAtvG7eVJcueBYrQ78ulDP
 CAYQcFQ3vFw7gqxbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:6EqsYM6483sZWCNNTgJf9nEymV4M7h_dDo_jpvkeQKd8qeLBNfaHlg>
 <xmx:6EqsYN0vmgVI_8YdvaKbBWAoNDtkchF45P-qtaBHzHM1c1D4X5mj0Q>
 <xmx:6EqsYHGzpusCsC8FMDyNCQXvYXkV82LTcNzX3zUTgwyj4GT0KryiRQ>
 <xmx:6UqsYP8DVWL3rO_DoyNaanfofP2JY6TsruSDpEzaQl9vJ4hyQMdF2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 36E16A00079; Mon, 24 May 2021 20:55:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <43b00f2e-4381-4899-b561-da9a24347f8b@www.fastmail.com>
In-Reply-To: <20210524111338.16049-4-steven_lee@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
 <20210524111338.16049-4-steven_lee@aspeedtech.com>
Date: Tue, 25 May 2021 10:24:42 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_3/3]_pinctrl:_pinctrl-aspeed-g6:_Add_sgpio_pinct?=
 =?UTF-8?Q?rl_settings?=
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Mon, 24 May 2021, at 20:43, Steven Lee wrote:
> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Current pinctrl driver only define the first sgpio master and slave
> interfaces.
> The sencond SGPIO master and slave interfaces should be added in
> pinctrl driver as well.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++++++----
>  drivers/pinctrl/aspeed/pinmux-aspeed.h     |  9 ++++++++
>  2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 5c1a109842a7..d0e9ab9d1a9c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -46,8 +46,10 @@
>  #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
>  #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
>  #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
> +#define SCU690		0x690 /* Multi-function Pin Control #24 */
>  #define SCU694		0x694 /* Multi-function Pin Control #25 */
>  #define SCU69C		0x69C /* Multi-function Pin Control #27 */
> +#define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
>  #define SCUC20		0xC20 /* PCIE configuration Setting Control */
>  
>  #define ASPEED_G6_NR_PINS 256
> @@ -81,13 +83,17 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
>  #define K26 4
>  SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
>  SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
> -PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
> +SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
> +PIN_DECL_4(K26, GPIOA4, SGPM2CLK, SGPS2CK, MACLINK1, SCL13);

Is this the right priority order? Looking at the Multi-Function Pin 
Mapping and Control table, function 1 is MACLINK1,
function 2 is SCL13, function 3 is SGPS2CK, and I assume function 4 
would be SGPM2CLK, except it's not documented in the table in v9 of the 
datasheet (I hope it will be documented?).

If function 1 is the highest priority (which is what all the Aspeed 
pinctrl drivers assume), then this should be:

PIN_DECL_4(K26, GPIOA4, MACLINK1, SCL13, SGPS2CK, SGPM2CLK);

Anyway, one of several things could be at fault here:

1. I've made a wrong assumption about the priority order in how I've 
implemented pinctrl support for Aspeed SoCs

2. The Multi-Function Pin Mapping and Control table is out of date and 
needs to be fixed (which it already does as it doesn't list SGPM2CLK).

3. The patch needs to align with the assumptions of the Aspeed pinctrl 
support.

I don't think it's 1 as I haven't heard of any issues where we are 
getting incorrect behaviour because of pinmux. I don't think it's 2 as 
this patch makes a non-linear change to the ordering. So my hunch is
the issue is 3, that the patch is putting the signals in the wrong order.
In this case, you want the PIN_DECL_4(...) I outlined above.

>  FUNC_GROUP_DECL(MACLINK1, K26);
>  
>  #define L24 5
>  SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
>  SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
> -PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPS2LD, SGPS2, SIG_DESC_SET(SCU690, 5));
> +SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5));
> +PIN_DECL_4(L24, GPIOA5, SGPM2LD, SGPS2LD, MACLINK2, SDA13);

See above.

>  FUNC_GROUP_DECL(MACLINK2, L24);
>  
>  FUNC_GROUP_DECL(I2C13, K26, L24);
> @@ -95,16 +101,22 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
>  #define L23 6
>  SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
>  SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
> -PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
> +SIG_EXPR_LIST_DECL_SESG(L23, SGPS2O, SGPS2, SIG_DESC_SET(SCU690, 6));
> +SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6));
> +PIN_DECL_4(L23, GPIOA6, SGPM2O, SGPS2O, MACLINK3, SCL14);

See above.

>  FUNC_GROUP_DECL(MACLINK3, L23);
>  
>  #define K25 7
>  SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
>  SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
> -PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
> +SIG_EXPR_LIST_DECL_SESG(K25, SGPS2I, SGPS2, SIG_DESC_SET(SCU690, 7));
> +SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7));
> +PIN_DECL_4(K25, GPIOA7, SGPM2I, SGPS2I, MACLINK4, SDA14);

See above.

>  FUNC_GROUP_DECL(MACLINK4, K25);
>  
>  FUNC_GROUP_DECL(I2C14, L23, K25);
> +FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
> +FUNC_GROUP_DECL(SGPS2, K26, L24, L23, K25);
>  
>  #define J26 8
>  SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
> @@ -2060,7 +2072,9 @@ static const struct aspeed_pin_group 
> aspeed_g6_groups[] = {
>  	ASPEED_PINCTRL_GROUP(EMMCG4),
>  	ASPEED_PINCTRL_GROUP(EMMCG8),
>  	ASPEED_PINCTRL_GROUP(SGPM1),
> +	ASPEED_PINCTRL_GROUP(SGPM2),
>  	ASPEED_PINCTRL_GROUP(SGPS1),
> +	ASPEED_PINCTRL_GROUP(SGPS2),
>  	ASPEED_PINCTRL_GROUP(SIOONCTRL),
>  	ASPEED_PINCTRL_GROUP(SIOPBI),
>  	ASPEED_PINCTRL_GROUP(SIOPBO),
> @@ -2276,7 +2290,9 @@ static const struct aspeed_pin_function 
> aspeed_g6_functions[] = {
>  	ASPEED_PINCTRL_FUNC(SD1),
>  	ASPEED_PINCTRL_FUNC(SD2),
>  	ASPEED_PINCTRL_FUNC(SGPM1),
> +	ASPEED_PINCTRL_FUNC(SGPM2),
>  	ASPEED_PINCTRL_FUNC(SGPS1),
> +	ASPEED_PINCTRL_FUNC(SGPS2),
>  	ASPEED_PINCTRL_FUNC(SIOONCTRL),
>  	ASPEED_PINCTRL_FUNC(SIOPBI),
>  	ASPEED_PINCTRL_FUNC(SIOPBO),
> diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h 
> b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> index dba5875ff276..125df796af36 100644
> --- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> @@ -730,6 +730,15 @@ struct aspeed_pin_desc {
>  			SIG_EXPR_LIST_PTR(pin, low), \
>  			SIG_EXPR_LIST_PTR(pin, other))
>  
> +#define PIN_DECL_4(pin, other, high, medium, low1, low2) \

Bit of a nit pick, but we might as well drop identifying the priorities 
as high, medium and low given we now have low1 and low2. Maybe 
something like this:

#define PIN_DECL_4(pin, other, prio1, prio2, prio3, prio4)

Cheers,

Andrew
