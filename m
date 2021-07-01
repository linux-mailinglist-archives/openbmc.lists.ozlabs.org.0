Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6823B8CCD
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 06:07:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFl6M1HsCz302c
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 14:07:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=G1QmCccE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I2TR+xMO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=G1QmCccE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=I2TR+xMO; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFl5z66pFz2yMc;
 Thu,  1 Jul 2021 14:07:03 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EF0A5C00DD;
 Thu,  1 Jul 2021 00:06:59 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 01 Jul 2021 00:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=b9llwkSwjZo8KM7Yex+xrFxAOW2zg3o
 RBtRbdMGHqB0=; b=G1QmCccEFko3Xu2jq2tb/saj0i5QzxnbX6jUzhTsNUzj4h/
 ZToqGqm5mmrSbPG3k+LU/mHbbyAnkHY6yIHfefBGyknH88D8Gu84tmiQdN6VgVrk
 yvYhx3WWEgFA7rBrzpHLvIXTab/CNYqXBml3nNEt7S2mbwQGvUTADbqMOPFwLyjW
 7aAaX7We+vNKtOtQHIooJzqLUJqnIKXjciiCi3wIf9vV1Qi6dzCmpItsxuINdnW3
 eoQQO2NAir0lREGVldgV94R6WK7QvqRTAaoNAULAzV0TwtcfZG+MyLtZJ4F5Mu44
 oznjqkz8esEx9bRlvbYplTQbeUdvvV5hC8nULDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b9llwk
 SwjZo8KM7Yex+xrFxAOW2zg3oRBtRbdMGHqB0=; b=I2TR+xMOnwQB1eU3SjoVpf
 oy3/8x+qgRH9S5aduLYIW8Uu1hKwpQtDyHf6pGsFG3JLvQqz0hAolly/uAowU9Ju
 C6DaWUDGZwyltHRIwQtzNkZfUgtd4rNxkcN51X51yfyoojxXRfIHPAsvLoyId3fa
 /nPdpWFZsSDGrahvaSjQxIuNceVTqkX3/pS6nxD+5Jm7iUGRSqCXvjcNoaUBzB6E
 190Z5YwoeqwBVNddCBnWOhmxp0RhWwZ6Xv7MhQt90YIS0mjSNVA+gRIbl241mmHg
 HhLLdaCUEgQR2j2easdMex2tNiFRwBbmmfERNeXRgEXs/cGsuuLhop7RH3dHEY1Q
 ==
X-ME-Sender: <xms:Yj_dYKwI1X9tYlP5GkSGHRFvT_gDCFeicnwVwGbKI8_u8aEwwoGIPQ>
 <xme:Yj_dYGRVBUIsPzWynZCuctEWy-Vg_wcqHViJQYSVVVI4p7aDNlQPCkHkb29NN42Hx
 5gb9m50pqFbI42Jvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeihedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeehhfefkefgkeduveehffehie
 ehudejfeejveejfedugfefuedtuedvhefhveeuffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Yj_dYMWLjU76N8iIO-7NevctuakLljdDF3tGDlZjHVnHLR2EYWxp8w>
 <xmx:Yj_dYAjtVpLkSeO2xbaKoo78odtTyvidVMKmiydpN2epiWOucudSFg>
 <xmx:Yj_dYMDgmxcC9-MRBjxGONi4e21P5iPeXn1zjaOMKR9NRuvrOSnxoA>
 <xmx:Yz_dYL5PkTb1vFg7bplBh1Q22ZeoIsU02XA12YYSFTvJOQkocEb2Tw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 24DB7AC0073; Thu,  1 Jul 2021 00:06:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <8c808410-6444-46a3-8779-29ba1453a5ca@www.fastmail.com>
In-Reply-To: <20210625074031.32576-1-liuxiwei@inspur.com>
References: <20210625074031.32576-1-liuxiwei@inspur.com>
Date: Thu, 01 Jul 2021 13:36:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "George Liu" <liuxiwei1013@gmail.com>, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v1] ARM: dts: fp5280g2: Add KCS node for LPC MCTP
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 George Liu <liuxiwei@inspur.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On Fri, 25 Jun 2021, at 17:10, George Liu wrote:
> Signed-off-by: George Liu <liuxiwei@inspur.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts 
> b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> index 1752f3250e44..66c0542b2694 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
> @@ -300,6 +300,11 @@ &lpc_ctrl {
>  	flash = <&spi1>;
>  };
>  
> +&kcs4 {
> +	compatible = "openbmc,mctp-lpc";
> +	status = "okay";
> +};

This was a gross hack that we carried for a bit, it never went or was 
intended to go upstream. Please just use the standard KCS bindings.

Cheers,

Andrew
