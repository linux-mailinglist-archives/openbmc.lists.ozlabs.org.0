Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A2375E7A
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 03:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbtT24zcXz2yWs
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 11:41:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hvFNRdFl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D9lU4DHO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=hvFNRdFl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=D9lU4DHO; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbtSj3CCKz2xff;
 Fri,  7 May 2021 11:40:53 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 57279581171;
 Thu,  6 May 2021 21:40:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 06 May 2021 21:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=4uW9jOMoITdaAvwQyvfGU+oL6PMdn7o
 JQL0rT3U+CBY=; b=hvFNRdFlIfXCWEteGHIMGamk7VtyaLR4+TmQByhOt3QFSc6
 keFzQiqUFFy2GeFAM5Rns8CLA1V1zlnMHbrrBncnW4AEfwl0YiOSQ/fnq9m8NtbW
 9rkDgiF2glUgKPFj/w5vfd5qzTCLdBnSrmYAVxUOyataboXuaqB6BXWKJOhItMLC
 bUdKiWOB3y2hMUG+9DR3BlFzLiZGd2xi5jAgpGD43Wc/z9t0BM5GTyTi9fFml/FC
 YjHGeJYMRhGAMtMGWjOfhiuFdI/IgeLRR/39MHIkHcp1UAcqiPSga+J6V2Aq3eBB
 8/VnaSv/5INQxpcBF0MIYj47awt9RBhNaeoeqOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4uW9jO
 MoITdaAvwQyvfGU+oL6PMdn7oJQL0rT3U+CBY=; b=D9lU4DHOT71DwkCU/OS8gc
 xFbih9sFE3tuzLCcwZJNQ8ZOvkGLAQlPdVXTGBGzeQjD1zoHWls01fwHAlkputEU
 fETzfWVvLDr3A9D8klywJ5FAPlQJMaKt9H5azbkjfqvfi/pRSoiulcuqpGREzt4f
 AHKGq4iyjqdhz4AMNUL/RQ7LSW6pA02pVz9I4jC5FdEMfRSwWYLLyVsJv6waOCQ3
 7aL4gBU2K56cV3i92nEwKjNBJNp5fIboP7LniCv2ZvdoHhUzG4AGeN3A2R8LiQTF
 kY5wWVIz4VEJPvTxf5c2qF84G7wOrwlcAuNCycl7Eu0iVFzu+fHJCrRjD0eJLRgQ
 ==
X-ME-Sender: <xms:oJqUYJZ1sf_VXlAk7Pyf54fYQfxtJfvMHLQZorq-XHcDrTM5oKAc0A>
 <xme:oJqUYAbxcRAsIFE7GqAB6_MaBwOItwg1AXHzEYz6l8DiLrq0CwnIMjy6ln8coOnH0
 fJEWJao52JrLOqF4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:oJqUYL9b97uLezl4Krp4-FlBWFPVQSYT91oiEyphCrIa2D56p7I9_w>
 <xmx:oJqUYHoWt7-dZLn2fnli76GX-6Qv0Ao1IEKZhxw98t5BpkGvfzwHFA>
 <xmx:oJqUYEry4d8qlgD_Kr8jcnp7pOSh8c5jMKhd2RM8z3X-4iJBMfFAAQ>
 <xmx:o5qUYB4-opMRfOD9borLcXLUj8KgGrgniu7WBNvdUPxeow44caUgAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E7C5FA00079; Thu,  6 May 2021 21:40:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <8611c4a7-8c65-4d7d-90d5-37c80faa3142@www.fastmail.com>
In-Reply-To: <20210506100312.1638-3-steven_lee@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-3-steven_lee@aspeedtech.com>
Date: Fri, 07 May 2021 11:10:28 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>, "Adrian Hunter" <adrian.hunter@intel.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Ryan Chen" <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 6 May 2021, at 19:33, Steven Lee wrote:
> Add the description for describing the AST2600-A2 EVB reference design of
> GPIO regulators.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts 
> b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 2772796e215e..1ae0facc3d5f 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -104,6 +104,21 @@
>  	status = "okay";
>  };
>  
> +/*
> + * The signal voltage of sdhci0 and sdhci1 on AST2600-A2 EVB is able to be
> + * toggled by GPIO pins.
> + * In the reference design, GPIOV0 of AST2600-A2 EVB is connected to the
> + * power load switch that providing 3.3v to sdhci0 vdd, GPIOV1 is connected to
> + * a 1.8v and a 3.3v power load switch that providing signal voltage to
> + * sdhci0 bus.
> + * If GPIOV0 is active high, sdhci0 is enabled, otherwise, sdhci0 is disabled.
> + * If GPIOV1 is active high, 3.3v power load switch is enabled, sdhci0 signal
> + * voltage is 3.3v, otherwise, 1.8v power load switch will be enabled,
> + * sdhci0 signal voltage becomes 1.8v.
> + * AST2600-A2 EVB also support toggling signal voltage for sdhci1.
> + * The design is the same as sdhci0, it uses GPIOV2 as power-gpio and GPIOV3
> + * as power-switch-gpio.
> + */

Okay, I think the comment is in the right place, but I feel this patch 
should also add the regulator nodes and hook them up to the SDHCIs.

Given Rob isn't super keen on a second example in the binding document 
I think you can just cut the example out and paste it in here.

Andrew
