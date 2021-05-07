Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D89375F3D
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 05:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbxBC10jjz2yYJ
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 13:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=vUdHaypf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jotf7hi/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=vUdHaypf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Jotf7hi/; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbx9q05Zrz2xv3;
 Fri,  7 May 2021 13:43:09 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8B99B580EFD;
 Thu,  6 May 2021 23:42:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 06 May 2021 23:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=arDYubqdnTaycuMeD6vidROrSycff0E
 9LYTfLWtgEeY=; b=vUdHaypfY4c34YnKjC3s38glKfC2kan4S8Y3Sn2ZirS1OSy
 67ziv2lw5DGr/TW8IAGecuPLAlX9tOIQtl3s3Y/upj9zNy1qjTSRftWlfDcWUr2l
 6H3MscnI12kj5PlEQsSMgENVHXbu3boVDCnKd7eKPTYJCkH76xm01m/hjq/Rl/Hz
 CA6y5K8u1QTTuQ6xA+K4gwNfWb43+8wnzGyCvCP+WGha64jgB8JTgcjQKf8J0gr6
 aoXLoXMbeKxTMfr6DSrPx4JqemG9lsNqYTM8S+5SfjqWoBH50F8vTlomf2x3vEY8
 4LLf+R6k4sfxenxOBhKmOI1UxqPhyJ4Wtx7P6tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=arDYub
 qdnTaycuMeD6vidROrSycff0E9LYTfLWtgEeY=; b=Jotf7hi/FDyVXe12rk8yAh
 5AUFEwU+zBRtM+RZLmWbwnSk9Le2M5M9BQY8QGiRM2xOkA+xXH4oH26u1xvEfxGs
 zoGUsGiy9cvSrwQ2gn6eOtfSYgJXOWGhw1WCAwKriP1Bdq3BMmD//kUAFjT87gBW
 Vil9ksLVPjWW7M1Vl6QbDc33TBGiiUTOYraBcZDXKkNHzBno9xUBb6j9CR+hWRcp
 TzEEwhjUchKw3lFMY8A3RFeYg9RSQQ+yA2c1YekYYDBPteCuZW9EnAaTI0kYU8Ik
 BkAahLwTb6OBB3j0crZr4VC50BKjm7PhN5GPNsmFU4GaZ2zs5tg3xWs6OBZeC4zg
 ==
X-ME-Sender: <xms:PreUYGgNO7y0p9W5vCAQQSpSKJXYWf-HQbShd30VlYApiAEEQ5p5-Q>
 <xme:PreUYHBBBgcUrABYSQHbK0XsS4dTLfay8CLxia1jx82oEhBdS-0R3_8jnvjzg86m1
 twi_DUwQLcIc3_OPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:PreUYOHUFAcApAtcZPRcXj_H3W80jYyLiSDGBXiBH6HNJvJnhwAubw>
 <xmx:PreUYPQ1cF1XoVMS8jSHQt2F7Y6rdUYmm3Zz0Wpg8gkQY4UZwrj_lw>
 <xmx:PreUYDz1cyqTTSguYYuwokVuf-DXWUYaatpj-RPp3XjZAb1cwf-xJQ>
 <xmx:QbeUYLgVbW01lRE-6Dmy5lqaMFTZ0sG6a8vvB6y3CNIdFmW4BOMpIA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 22FE4A0007A; Thu,  6 May 2021 23:42:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <d581f7b9-dd08-4690-ba3e-f38662dcb587@www.fastmail.com>
In-Reply-To: <20210507033021.GB23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-3-steven_lee@aspeedtech.com>
 <8611c4a7-8c65-4d7d-90d5-37c80faa3142@www.fastmail.com>
 <20210507033021.GB23749@aspeedtech.com>
Date: Fri, 07 May 2021 13:12:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_2/5]_ARM:_dts:_aspeed:_ast2600evb:_Add_comment_f?=
 =?UTF-8?Q?or_gpio_regulator_of_sdhci?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongwei Zhang <Hongweiz@ami.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 7 May 2021, at 13:00, Steven Lee wrote:
> The 05/07/2021 09:40, Andrew Jeffery wrote:
> > 
> > 
> > On Thu, 6 May 2021, at 19:33, Steven Lee wrote:
> > > Add the description for describing the AST2600-A2 EVB reference design of
> > > GPIO regulators.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> > > b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > index 2772796e215e..1ae0facc3d5f 100644
> > > --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > @@ -104,6 +104,21 @@
> > >  	status = "okay";
> > >  };
> > >  
> > > +/*
> > > + * The signal voltage of sdhci0 and sdhci1 on AST2600-A2 EVB is able to be
> > > + * toggled by GPIO pins.
> > > + * In the reference design, GPIOV0 of AST2600-A2 EVB is connected to the
> > > + * power load switch that providing 3.3v to sdhci0 vdd, GPIOV1 is connected to
> > > + * a 1.8v and a 3.3v power load switch that providing signal voltage to
> > > + * sdhci0 bus.
> > > + * If GPIOV0 is active high, sdhci0 is enabled, otherwise, sdhci0 is disabled.
> > > + * If GPIOV1 is active high, 3.3v power load switch is enabled, sdhci0 signal
> > > + * voltage is 3.3v, otherwise, 1.8v power load switch will be enabled,
> > > + * sdhci0 signal voltage becomes 1.8v.
> > > + * AST2600-A2 EVB also support toggling signal voltage for sdhci1.
> > > + * The design is the same as sdhci0, it uses GPIOV2 as power-gpio and GPIOV3
> > > + * as power-switch-gpio.
> > > + */
> > 
> > Okay, I think the comment is in the right place, but I feel this patch 
> > should also add the regulator nodes and hook them up to the SDHCIs.
> > 
> > Given Rob isn't super keen on a second example in the binding document 
> > I think you can just cut the example out and paste it in here.
> > 
> 
> Hi Andrew,
> 
> Since AST2600-A0 and AST2600-A1 don't have regulators, do you mean cut
> the example from dt-binding and paste it to aspeed-ast2600-evb.dts but
> comment out the example?

If the board design varies with the silicon revision we should probably 
have devicetrees that are appropriate for each, so an 
aspeed-ast2600-evb-a2.dts

#include "aspeed-ast2600-evb.dts" at the top and go from there.

Cheers,

Andrew
