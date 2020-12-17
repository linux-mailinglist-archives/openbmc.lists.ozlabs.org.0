Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170C2DCA06
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 01:39:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxCmR5f3mzDqP2
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 11:39:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=l+32yJwW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Eh/g4ZLT; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxClV4KKWzDqNN;
 Thu, 17 Dec 2020 11:38:13 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 25C3E5C00A4;
 Wed, 16 Dec 2020 19:38:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 16 Dec 2020 19:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm1; bh=uyKQlz7tKmkJEHi1rnMNhx+gyyryTNSncCx9L8amB8o=; b=l+32yJwW
 iEH56IQdskVDL4I0Ou2dHpbnzpSMvu7L16vkkwmIo63PKZoRzxK7Ld60VHqkWX6s
 Of220YFw1vhGrqSTVBeVRDvn5MlYYcDmjrf6ldXKChTRhV+V6j2oP+ZJNUhAL34q
 TwbyHD+VVih1OnC8aIRZ/+4z2v/+7+9WEH7UjzdD6LnaQ7qQmJKj9fya5uBQFxpt
 XCJWoaJNWxF3YojofHU5EahZlofnd+9FFXPwgTqV1YiPfV45fZAQXvzcLLaCc8y5
 67xR9VgosuxFWKfeigqTgzllO5HJjDFyvp+HrYq/dG115lDLfNVQJQGVJHq3PYH8
 mzF6ozw18IGH3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=uyKQlz7tKmkJEHi1rnMNhx+gyyryT
 NSncCx9L8amB8o=; b=Eh/g4ZLT2zkbyz5V8BwZrSOhxK7/H/gfSD+ndUYmFVOQs
 XNjdp6MSuY7eTAy78PJpnudacb8y+P5RDA0838BPPXpRx6gZGC48xol6VYAMcPiQ
 u0V6PwecX/ALssH3CmyqSVOfBp2XLNMEKoQz+r84eso5ik4bEH04o9HX+plb9dOH
 Dxuti4rjtXK/BrkSYBYtpLRlK2NXo0lfVuajla9EFGW9g+ruX/RvQ+w+uPJaasYG
 QTdxercDVR9G2hKhza//5OKUQympVtIDiTIT7onDXWpb/L653O8gptuglQOOeYr8
 OuAxMAe7ZKPv3TvWx79TWH0u8fdYaPTFfWPbAoHsA==
X-ME-Sender: <xms:b6jaX8dokaaW4zHrTFrVu8bkCve2p5TVEyM56r5EDXTeluxKRbHpQw>
 <xme:b6jaX-OCdgEX-VhP2ZRHGVnZbHGX-UKwLjFclBk_oFnQJT6cOeeh7S1tz3huE-J8r
 MXDPWzUAVTU3n6_pQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeeluddvveelleehiedtudejieelke
 ettedtueduveeiffejvdekueekleeugeegteenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:b6jaX9gEspP2UzQILFM7Ut_6AeO4Sg1dZqv2t4AAC1eflG9em9aUpQ>
 <xmx:b6jaXx-MKd_5GGxFNLMLm7jZpH4diBlhXYCgiH9H575OtcZ6yHG6bw>
 <xmx:b6jaX4tHbKMCzSr6RHfm6iG6zLRLvBKc_4FnxPh3NKcBXasZYgTtYw>
 <xmx:cajaX9-LYq3OyK_lZxTbbNF6lZT_v8-JOER3tTyds9HMrDaM5yrh6g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 02856E0503; Wed, 16 Dec 2020 19:38:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <1e823780-b1ef-42dd-bb60-321b4d482d31@www.fastmail.com>
Date: Thu, 17 Dec 2020 11:07:45 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: billy_tsai@aspeedtech.com
Subject: Re: [PATCH v2] driver: aspeed: g6: Fix PWMG0 pinctrl setting
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
> Besides that, When PWM8~15 of PWMG0 set it needs to clear SCU414 bits
> at the same time.

FYI, we don't need to explicitly clear SCU414[...] as part of the PWM mux 
configuration as the these bits are cleared as part of disabling the SD1* 
signal state on each pin[1]. You should be able to confirm this by compiling 
with CONFIG_DEBUG_PINCTRL=y and "debug" on the kernel commandline.

That said, it would be neat if we had some kunit tests to exercise all this, 
but it's not something I've thought deeply about.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/aspeed/pinctrl-aspeed.c?h=v5.10#n248

>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index b673a44ffa3b..1dfb12a5b2ce 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -367,49 +367,57 @@ FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
>
>  #define D22 40
>  SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8),

Good catch, looks like a copy/paste fail on my part :)

> +SIG_DESC_CLEAR(SCU414, 8));

As above, this should be unnecessary.

Can you confirm and remove the CLEAR()s for v3?

Cheers,

Andrew

>  PIN_DECL_2(D22, GPIOF0, SD1CLK, PWM8);
>  GROUP_DECL(PWM8G0, D22);
>
>  #define E22 41
>  SIG_EXPR_LIST_DECL_SESG(E22, SD1CMD, SD1, SIG_DESC_SET(SCU414, 9));
> -SIG_EXPR_LIST_DECL_SEMG(E22, PWM9, PWM9G0, PWM9, SIG_DESC_SET(SCU4B4, 9));
> +SIG_EXPR_LIST_DECL_SEMG(E22, PWM9, PWM9G0, PWM9, SIG_DESC_SET(SCU4B4, 9),
> +SIG_DESC_CLEAR(SCU414, 9));
>  PIN_DECL_2(E22, GPIOF1, SD1CMD, PWM9);
>  GROUP_DECL(PWM9G0, E22);
>
>  #define D23 42
>  SIG_EXPR_LIST_DECL_SESG(D23, SD1DAT0, SD1, SIG_DESC_SET(SCU414, 10));
> -SIG_EXPR_LIST_DECL_SEMG(D23, PWM10, PWM10G0, PWM10, SIG_DESC_SET(SCU4B4, 10));
> +SIG_EXPR_LIST_DECL_SEMG(D23, PWM10, PWM10G0, PWM10, SIG_DESC_SET(SCU4B4, 10),
> +SIG_DESC_CLEAR(SCU414, 10));
>  PIN_DECL_2(D23, GPIOF2, SD1DAT0, PWM10);
>  GROUP_DECL(PWM10G0, D23);
>
>  #define C23 43
>  SIG_EXPR_LIST_DECL_SESG(C23, SD1DAT1, SD1, SIG_DESC_SET(SCU414, 11));
> -SIG_EXPR_LIST_DECL_SEMG(C23, PWM11, PWM11G0, PWM11, SIG_DESC_SET(SCU4B4, 11));
> +SIG_EXPR_LIST_DECL_SEMG(C23, PWM11, PWM11G0, PWM11, SIG_DESC_SET(SCU4B4, 11),
> +SIG_DESC_CLEAR(SCU414, 11));
>  PIN_DECL_2(C23, GPIOF3, SD1DAT1, PWM11);
>  GROUP_DECL(PWM11G0, C23);
>
>  #define C22 44
>  SIG_EXPR_LIST_DECL_SESG(C22, SD1DAT2, SD1, SIG_DESC_SET(SCU414, 12));
> -SIG_EXPR_LIST_DECL_SEMG(C22, PWM12, PWM12G0, PWM12, SIG_DESC_SET(SCU4B4, 12));
> +SIG_EXPR_LIST_DECL_SEMG(C22, PWM12, PWM12G0, PWM12, SIG_DESC_SET(SCU4B4, 12),
> +SIG_DESC_CLEAR(SCU414, 12));
>  PIN_DECL_2(C22, GPIOF4, SD1DAT2, PWM12);
>  GROUP_DECL(PWM12G0, C22);
>
>  #define A25 45
>  SIG_EXPR_LIST_DECL_SESG(A25, SD1DAT3, SD1, SIG_DESC_SET(SCU414, 13));
> -SIG_EXPR_LIST_DECL_SEMG(A25, PWM13, PWM13G0, PWM13, SIG_DESC_SET(SCU4B4, 13));
> +SIG_EXPR_LIST_DECL_SEMG(A25, PWM13, PWM13G0, PWM13, SIG_DESC_SET(SCU4B4, 13),
> +SIG_DESC_CLEAR(SCU414, 13));
>  PIN_DECL_2(A25, GPIOF5, SD1DAT3, PWM13);
>  GROUP_DECL(PWM13G0, A25);
>
>  #define A24 46
>  SIG_EXPR_LIST_DECL_SESG(A24, SD1CD, SD1, SIG_DESC_SET(SCU414, 14));
> -SIG_EXPR_LIST_DECL_SEMG(A24, PWM14, PWM14G0, PWM14, SIG_DESC_SET(SCU4B4, 14));
> +SIG_EXPR_LIST_DECL_SEMG(A24, PWM14, PWM14G0, PWM14, SIG_DESC_SET(SCU4B4, 14),
> +SIG_DESC_CLEAR(SCU414, 14));
>  PIN_DECL_2(A24, GPIOF6, SD1CD, PWM14);
>  GROUP_DECL(PWM14G0, A24);
>
>  #define A23 47
>  SIG_EXPR_LIST_DECL_SESG(A23, SD1WP, SD1, SIG_DESC_SET(SCU414, 15));
> -SIG_EXPR_LIST_DECL_SEMG(A23, PWM15, PWM15G0, PWM15, SIG_DESC_SET(SCU4B4, 15));
> +SIG_EXPR_LIST_DECL_SEMG(A23, PWM15, PWM15G0, PWM15, SIG_DESC_SET(SCU4B4, 15),
> +SIG_DESC_CLEAR(SCU414, 15));
>  PIN_DECL_2(A23, GPIOF7, SD1WP, PWM15);
>  GROUP_DECL(PWM15G0, A23);
>
> --
> 2.17.1
