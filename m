Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47F3899A9
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 01:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlpVz2VxVz303x
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:10:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=MMbN35+i;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=CRu+9qBy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=MMbN35+i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CRu+9qBy; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlpVY4nM9z2xZ3;
 Thu, 20 May 2021 09:09:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3B99580CA8;
 Wed, 19 May 2021 19:09:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 19 May 2021 19:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=uykUpkAPzAx+pWmdjpmWlEs1UfJFsMN
 sFBBQU3DXK/8=; b=MMbN35+iPeDzwQxj6Oulw/zZKN4TNShuMqVJUm+GKiulMB8
 vRDXWhULks2tZW5geiokn8Ionoue/jggO1UnhhfF8ok2nqFx7OA2DFm+JUqitx52
 dnrimu6Za42n0JWu6/xiMhkyLdWvbCHLRi+6z6MycG+1eI1lGKIDwrKN+G2WRo46
 KsK7ppfOYqHxG5WcttYODOJdi8f0yLf0SMJEbnrB8lTXhpvuiMwRtxX912gBdbSU
 eddy7FhfGwlUnI9WR/BCi9X/uc9r8YxfMgAZHEozqdh8Tuuv309VNikpNFblcBNU
 GpFHjlI2ywdfIBCaMyzSUH6RXmoc3yogra9ec+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uykUpk
 APzAx+pWmdjpmWlEs1UfJFsMNsFBBQU3DXK/8=; b=CRu+9qBy7PHotmd2ANhUgy
 l1tu5Zlq7b3TLfZp/YIi2xLW8G9amP6NwlO4c7W0Uh9nzxSsSpYfMmF4Km+LsVJJ
 3Tvej100CkASxSY0vNW0c7RIf7+2xy9A7px49LXDa2ll4jCt5oBnbkY1BNGzWy9V
 EWjB7SArnVlxVspd+RZIC0WCgKZdFL4BCeJVtMxS+HYe5ea6WbQDJ/iPIu8HEX9+
 quSZF9cr30+904ZJzOXH4jxNsIZwf8aG/kR1eSVaj+0rISvylneULjpTVsgu21iZ
 N7FirM5tLh3I37qc/xein5hH0S//p+2S0S03Vad1FwZ921NFVLGMhS07jKfzydJw
 ==
X-ME-Sender: <xms:wJqlYJ6g8vqp_fikeaTCkLttyrw5dtqdwFNygryXnFLweW1vycBz0w>
 <xme:wJqlYG5zOjNS2klRFLoQuS5scJJk0PInlCA-sFov0HYW2VKuy1cBTYmJgtcUFPEDq
 Dsesep91QImjiBalQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:wJqlYAdSYBgZlAOy7SQ3HctU0YIqVLzoQJehdP0g2YotHTaTdnhv1Q>
 <xmx:wJqlYCKjDODHleNxAmESCpYeltmipvcJwuGv7h8dmKf2I9sVUR8kyw>
 <xmx:wJqlYNLFjdsVsWMNxAprqcC-lQ1MO80AlycpLq80mtxpUWkanfOBcg>
 <xmx:wZqlYEYHDQ29a09oD3WpsSMUpL5qJewm9Lx12B2f2rc_WvLLggp9nQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B5ECA004A5; Wed, 19 May 2021 19:09:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <1516d2c0-0497-48b3-a366-711287132c35@www.fastmail.com>
In-Reply-To: <20210519105736.GA27246@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
 <19a81e25-dfa1-4ad3-9628-19f43f4230d2@www.fastmail.com>
 <20210507062416.GD23749@aspeedtech.com>
 <2a339218-19d7-4eea-a734-8053dd553dbb@www.fastmail.com>
 <20210510060338.GB6883@aspeedtech.com>
 <f063cb34-9a42-4373-a333-cad1d8a9c37b@www.fastmail.com>
 <20210514020900.GB540@aspeedtech.com>
 <57113deb-d4c1-4572-af95-fce02c04d7a9@www.fastmail.com>
 <20210519105736.GA27246@aspeedtech.com>
Date: Thu, 20 May 2021 08:39:29 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_5/5]_mmc:_sdhci-of-aspeed:_Assert/Deassert_reset?=
 =?UTF-8?Q?_signal_before_probing_eMMC?=
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
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 19 May 2021, at 20:27, Steven Lee wrote:
> The 05/14/2021 10:37, Andrew Jeffery wrote:
> > 
> > 
> > On Fri, 14 May 2021, at 11:39, Steven Lee wrote:
> > > The 05/13/2021 08:42, Andrew Jeffery wrote:
> > > > 
> > > > 
> > > > On Mon, 10 May 2021, at 15:33, Steven Lee wrote:
> > > > > The 05/07/2021 15:36, Andrew Jeffery wrote:
> > > > > > 
> > > > > > 
> > > > > > On Fri, 7 May 2021, at 15:54, Steven Lee wrote:
> > > > > > > The 05/07/2021 09:32, Andrew Jeffery wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On Thu, 6 May 2021, at 19:54, Philipp Zabel wrote:
> > > > > > > > > Hi Steven,
> > > > > > > > > 
> > > > > > > > > On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > > > > > > > > > +	if (info) {
> > > > > > > > > > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > > > > > > > > > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> > > > > > > > > 
> > > > > > > > > Please use devm_reset_control_get_exclusive() or
> > > > > > > > > devm_reset_control_get_optional_exclusive().
> > > > > > > > > 
> > > > > > > > > > +			if (!IS_ERR(sdc->rst)) {
> > > > > > > > > 
> > > > > > > > > Please just return errors here instead of ignoring them.
> > > > > > > > > The reset_control_get_optional variants return NULL in case the
> > > > > > > > > device node doesn't contain a resets phandle, in case you really
> > > > > > > > > consider this reset to be optional even though the flag is set?
> > > > > > > > 
> > > > > > > > It feels like we should get rid of the flag and leave it to the 
> > > > > > > > devicetree.
> > > > > > > > 
> > > > > > > 
> > > > > > > Do you mean adding a flag, for instance, "mmc-reset" in the
> > > > > > > device tree and call of_property_read_bool() in aspeed_sdc_probe()?
> > > > > > > 
> > > > > > > > I'm still kind of surprised it's not something we want to do for the 
> > > > > > > > 2400 and 2500 as well.
> > > > > > > > 
> > > > > > > 
> > > > > > > Per discussion with the chip designer, AST2400 and AST2500 doesn't need
> > > > > > > this implementation since the chip design is different to AST2600.
> > > > > > 
> > > > > > So digging a bit more deeply on this, it looks like the reset is 
> > > > > > already taken care of by drivers/clk/clk-ast2600.c in the 
> > > > > > clk_prepare_enable() path.
> > > > > > 
> > > > > > clk-ast2600 handles resets when enabling the clock for most peripherals:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n276
> > > > > > 
> > > > > > and this is true for both the SD controller and the eMMC controller:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n94
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n88
> > > > > > 
> > > > > > If this weren't the case you'd specify a reset property in the SD/eMMC 
> > > > > > devicetree nodes for the 2600 and then use 
> > > > > > devm_reset_control_get_optional_exclusive() as Philipp suggested. See 
> > > > > > the reset binding here:
> > > > > > 
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reset/reset.txt?h=v5.12
> > > > > > 
> > > > > > So on the surface it seems the reset handling in this patch is 
> > > > > > unnecessary. Have you observed an issue with the SoC that means it's 
> > > > > > required?
> > > > > > 
> > > > > 
> > > > > Yes, you are right, aspeed_sdc_probe() calls clk_prepare_enable(),
> > > > > aspeed_g6_clk_enable() does reset eMMC.
> > > > > 
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-of-aspeed.c#n496
> > > > > 
> > > > > However, the clock of eMMC is enabled in my u-boot(2019.04).
> > > > > So it is retruned in the condition of aspeed_g6_clk_is_enabled() below
> > > > > and doesn't reset eMMC.
> > > > > 
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n285
> > > > 
> > > > Okay, so what's the issue that the patch addresses? Is there a bug? 
> > > > Presumably if u-boot isn't making use of the eMMC the clock won't be 
> > > > on, so we'll do the reset if the kernel wants to make use of the 
> > > > device. If u-boot _is_ using the eMMC, u-boot will have done the 
> > > > correct clock enable/reset sequence and so the controller should be 
> > > > ready to go?
> > > > 
> > > > The only potential issue remaining is u-boot leaving the controller in 
> > > > a configuration the kernel isn't expecting when handing over. If that's 
> > > > the issue then we've forgotten to do some specific initialisation (i.e. 
> > > > not just reset the entire thing) of the controller in the driver probe 
> > > > path, right?
> > > > 
> > > 
> > > If DMA engine is used before probing eMMC in kernel stage,
> > > eMMC controller may have unexpected behavior when re-exectuing
> > > identifying process.
> > > Thus, we need to reset at the beginning of kernel since
> > > kernel is a new stage. We should not assume some one do something
> > > before.
> > > 
> > > > FWIW I haven't recently seen any poor behaviour from the controller or 
> > > > driver. For us (IBM) it seems to be working well since we sorted out 
> > > > the phase configuration.
> > > > 
> > > 
> > > Yes, you are right, everything work well currently. But, kernel is a new
> > > stage, we cannot assume eMMC controller is at initial state when
> > > entering kernel stage.
> > 
> > Okay. That sounds true no matter what the hardware design though (going 
> > back to the difference between the 2400/2500 and 2600).
> > 
> > Given the reset is tied up in the clock gating, it would be nice if we 
> > could do the following in aspeed_sdc_probe():
> > 
> > ```
> > /* Clean up the controller in case it wasn't left in a good state by the bootloader */
> > clock_disable_unprepare(...);
> > 
> > clock_prepare_enable(...);
> > ```
> > 
> > But the enable_count tracked by clock_core_{en,dis}able() kills that 
> > idea.
> > 
> > This makes it seem like we need to break out the appropriate indexes 
> > to add `resets` properties in the devicetree. This will need some input 
> > from Joel, given the eMMC/SD resets can't currently be handled that way.
> > 
> 
> Hi Adnrew,
> 
> I was wondering if I should wait for Joel's comment, or
> 
> 1. Drop this patch in this patch series, and prepare another patch
> series for this issue in the future. Since sdhci works well as long as we
> don't use DMA engine before kernel stage.

I think this is the way forward, it's kind of separate to what you're 
trying to achieve with the rest of the patches in this series.

I'll poke Joel.

Cheers,

Andrew
