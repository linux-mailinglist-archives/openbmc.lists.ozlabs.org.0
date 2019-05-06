Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306E143AF
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 05:06:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44y7110Nn5zDqJR
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 13:06:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="iWCdutUh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KKprvGcz"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44y6zh0kXpzDqHw
 for <openbmc@lists.ozlabs.org>; Mon,  6 May 2019 13:05:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7279E20B0D;
 Sun,  5 May 2019 23:05:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 05 May 2019 23:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=w8r9EpHrTKjpoOVlbD39vq9uZjWcvex
 G0D4OKZcEk5o=; b=iWCdutUhTYTxLMncvjZ182pdtr8wpNsxPYzkxFTNBuItIKO
 1K2e16mBsWwb8H1f67BjpMeDnsu7axrt0nNy1jncrKLFYibvc2i68/fF8xeUpLTR
 kdxNPTz+43R+JFP0/qZTraJABaMgCbat1g5I080Xo58wLr36PWeBMWB9ail7PFz9
 e2rzkDE0vzmLFRRHpFdTuB63lH45bKqykoRK3Kjxp8TsXOON+tcsSvdzYIdkGJs5
 HQ9z+PT7jLZlhso3C31v5tt/9Tg46S2xj5mw+qKrToyWGhNJVsx1sr+Tbm2PFmo7
 kFzj+SxUkxQBOSPT17sf8PYuVNTkJYHbVLU8dNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=w8r9Ep
 HrTKjpoOVlbD39vq9uZjWcvexG0D4OKZcEk5o=; b=KKprvGczshwkdqUyfC29mN
 W/KkxhHzynCQzx1/FbmEJ2xzu2iGe3m1ph/E4OOsTDBlE2VNrZq9ncjLjUPl1HNE
 W5cFk8upbmLsalDCsG9u5fPLX5Y1N+Hi4G6EVcAnuDijN+xS+vaKubZuJfr//wLT
 nmKXsJj0n2yGX3FadUbl2gqPWmhw40fkLwrt5FzMA78HoZSN9185pE5EXtctd3Dp
 IGj50PUJUefBNMugv85PdaAnyZ3IC7MDPGMaBMNaGldE5iEic9Gx3jIi6xWBoFg4
 6KWGybr6Y967UR93a7p1lUc7YlwmSn4+0x8Rq9EVWVnLn/cRui1Qpp8ETGZX6yzA
 ==
X-ME-Sender: <xms:XKTPXEI0O6kjw4_k0R-O_sp_pKRW-XU_TEdBiLiyH_hwKo7JdJGK1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeeigdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:XKTPXHaEYnWzNshIRVFalwyQtKQo5ZU1MKxszX0mTtraVrmBkyh6rA>
 <xmx:XKTPXMNG33IWsYNbRj50onJEFEwLsrqjjtWhkPkUzhRVwrqhhwA5ZQ>
 <xmx:XKTPXPBlfdr1W_lm7nBkQlQ4uVi2nLFjWBcMslDAvoZex1FXbnTstA>
 <xmx:XKTPXE9dyY1DM1u-VucAjyGLoLFcskPrQdCLM66pODo8mwXJP3rJdA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E9BA77C6D9; Sun,  5 May 2019 23:04:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <88246755-225c-43d9-b27f-6f081bba2d14@www.fastmail.com>
In-Reply-To: <20190503124444.5056-1-joel@jms.id.au>
References: <20190503124444.5056-1-joel@jms.id.au>
Date: Sun, 05 May 2019 23:04:59 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.0] ARM: dts: npcm: Remove use of skeleton.dtsi
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 3 May 2019, at 22:16, Joel Stanley wrote:
> This file is not present in 5.1. Clean it up in preparation for moving
> to a future kernel base.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi 
> b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 04e842f460a9..da02aa70df06 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -2,7 +2,6 @@
>  // Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
>  // Copyright 2018 Google, Inc.
>  
> -#include "skeleton.dtsi"
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -12,6 +11,11 @@
>  	#size-cells = <1>;
>  	interrupt-parent = <&gic>;
>  
> +	memory {
> +		device_type = "memory";
> +		reg = <0 0>;
> +	};
> +
>  	/* external reference clock */
>  	clk_refclk: clk-refclk {
>  		compatible = "fixed-clock";
> -- 
> 2.20.1
> 
>
