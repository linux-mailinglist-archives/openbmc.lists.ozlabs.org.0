Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4B726C3
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:37:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjJN1VqFzDqKs
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:37:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VoE/gpTM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1APxdPuM"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tbrh0RPPzDqCh;
 Wed, 24 Jul 2019 10:32:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0584255C;
 Tue, 23 Jul 2019 20:31:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 23 Jul 2019 20:31:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=uLRLTCbzkIIHhhADCs6N7TqPfh+fkdO
 sYatioPY/LkY=; b=VoE/gpTMmDWQepgjtm8nLIJjGlU2a8Cw6aaKqdfdRyUADc8
 mec8W1A9bIrp4yx0CN3q408PhdvsTItZ1hAn9T9cAmPiUTVGdLrAqw2p4eZ/IX41
 EuokkHdCv2/UU9tXa9bCWclO8oAh+lHAoeL5UiIcsAvPSuvMLF+zgb2tLYL3cc0B
 oVG+GMn8BlLHDQpT7Pii7CXtQGnujPndosqZHZve20KaWEshSrtfdfNfvAVxmwiJ
 WCDEpK2gNPG1ou1WhS/3wfY9m/fp+xVPitaeI1aB5qv9P+xrRU7J+jiUrUuXyoVY
 mzMYX696ZP3cVbqEJ0yLwV/YS96sqOhMKCUv2IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uLRLTC
 bzkIIHhhADCs6N7TqPfh+fkdOsYatioPY/LkY=; b=1APxdPuMvpYCXaJZkTEjm4
 z20JfvbaBf/Q0OPGbO5e3CW7z6tCCJb/Tc4d7WTg+2q6+4Qjbg+/vou9eTk9oV3+
 UFiyAgLjIhEc8bbA6t9sKOwqZkmaJV6jSR2jo9Uu0VgKO1V2cHdr0Y/77PgTvc7w
 g4ZQCaxhYwgAJwXWq5BtxcnD7TnpD4rU15ggSUSrOan1dIf5jZzMjnHLkf5v7ube
 IHXb4QFK/kD6bgG9xE5Bon3cdgOKFWxz0VEfI0lEgnxLVPTdse0ZzYRnylRLlpN4
 JO5tcH6Y0reH2cQdIXNFc+IfCkAEoY6tpR32qDm6LlhlQgbX2/y6Dg9r62WWSnoQ
 ==
X-ME-Sender: <xms:_qY3XSdmOVyqJ58pRa-HqZ9wuH-gy78UOiQ88P2EpdPg8pCYS_KR9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrjeelgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:_qY3XadAE95y9WHPYzfANd8lvKYE3f5OxJfkg9-DUp7jSxxzMj82-w>
 <xmx:_qY3XQoSzClL5pFe9_Mzzvbf669WXcLQc9Vq2fEkJLJu-syhC6essA>
 <xmx:_qY3XSz1LnwrUuXBLuMyLVrmBxL9FM51204x2RjUxB1mgKGsLMqJTg>
 <xmx:_qY3XRReKggT3bSb1I2P9eppFC600GU34TYJxa74w7Ew6W3ArqWsoA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 29575E0129; Tue, 23 Jul 2019 20:31:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <7f2c08f5-a04d-499c-b59b-3d62d7f025af@www.fastmail.com>
In-Reply-To: <20190719203037.11795-1-mspinler@linux.ibm.com>
References: <20190719203037.11795-1-mspinler@linux.ibm.com>
Date: Wed, 24 Jul 2019 10:02:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Matt Spinler" <mspinler@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: swift: Fix FSI GPIOs
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
Cc: Matt Spinler <spinler@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 20 Jul 2019, at 06:01, Matt Spinler wrote:
> From: Matt Spinler <spinler@us.ibm.com>
> 
> Change the FSI clock and data GPIOs to match what the hardware turned
> out to use.
> 
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

And yeah, please make sure to include relevant lists in the future as Olof
mentioned.

Andrew

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts 
> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index caac895c60b4..f14f745b34ca 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -207,8 +207,8 @@
>  		#size-cells = <0>;
>  		no-gpio-delays;
>  
> -		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> -		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> +		clock-gpios = <&gpio ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
> +		data-gpios = <&gpio ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
>  		mux-gpios = <&gpio ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
>  		enable-gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
>  		trans-gpios = <&gpio ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
> -- 
> 2.22.0
> 
>
