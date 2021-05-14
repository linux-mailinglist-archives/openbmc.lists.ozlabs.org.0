Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05008380213
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 04:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhCPf0dqTz2yx2
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 12:38:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=efG39MO2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MWYgaoz9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=efG39MO2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MWYgaoz9; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhCPJ1gYwz2xvJ;
 Fri, 14 May 2021 12:37:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1421658108F;
 Thu, 13 May 2021 22:37:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 13 May 2021 22:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=hUBTUry5UEBFmGq7Z6kzWoE0pXl/muq
 bY0vR2ZhgD9o=; b=efG39MO2bmxkfXuWo7ZFIvGXVh3j8KQEvLLpQl3gtAOht79
 tZbE9vxR8cg9FKMDYxOv1QSp1Hbar57fpIUwymjBKdgBBf3kZvRpal9W0B8f9YUy
 fZAcG4W9TH/3oZ5lpdYtouOVtlF/Z/pCFUNUGy+gxZGJqm9E8bIa04bKqBpPYRsV
 tufAH549ExVjIsa2b6NzKEgaqQkWpNnggC5lqQFtNWDCYFXcWDcsL4pHbhZdq3nd
 kEAKUAcZBSNvtNfIb0Fpp9l0vQoHMtIoRD4iF5Y0t4FawjEQQAhkz9JFwy7LB1tP
 PNALngqWUxvqGi/wIr+gjd8kpa6eU2miueIESRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hUBTUr
 y5UEBFmGq7Z6kzWoE0pXl/muqbY0vR2ZhgD9o=; b=MWYgaoz9vPTpBWzlanPrMs
 G97GpTLJ6nV8RDBbB7VnTHnwlN8x0GsEvswLqtZBw+b0Ge8DA5iOmG+wF+uNQQ9k
 vhLHhZB4cyJQOZM66nYfI+6CTX5oVmHYaUQy6u0CXz3hCSZcLr3mTGKDersW/cqe
 zT0C4jNDIWOP9cvBzbhfNF08yop52nalHuZZ8+XAuoamC689fujBVzd2eNr8vPes
 xV+GN6rlZMVjAUEPYYoKiGnKGdtnq0LAGHgmOM/lXrLDSYSfiqvTI/Oq+dgEL7Om
 rFw+sNJlSbHaa5H7GucK3JQ7xGi2wc6OkoNzbmIcXk+cZe6vBPLQ14Ssq6yQ1QLQ
 ==
X-ME-Sender: <xms:gOKdYEn1_e0NDWHN-Z5EtnrUVObbxn-5vFdxRrCBvUCOyBiKFoZ7ZQ>
 <xme:gOKdYD0iwzSVmYrYI-c52yAXGxMhTL33wvn-Elkhy4JsfXrmA5C3Itri9XDOYHcnu
 Mf9FHURN60WcLAZuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:gOKdYCq6dDXJM-6x-KEOIGDeQG1r9sFO5ca3W69qxIx9TCJZU2Kd7w>
 <xmx:gOKdYAlskPFSi-GwXAhU4xqEhU9sbU2Ewjwqfx1Vup8Qt56oLlHnYQ>
 <xmx:gOKdYC3aHT5FrDiCYKOFR_gETsyC0y7UFlFFZkfkMUz2TWiAloSazg>
 <xmx:guKdYF3bH5McHJbhDHHFHynGzJiPhEkV9cJ7S1ejEVOJ9JZphx6vtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 09F7EA00079; Thu, 13 May 2021 22:37:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <57113deb-d4c1-4572-af95-fce02c04d7a9@www.fastmail.com>
In-Reply-To: <20210514020900.GB540@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
 <19a81e25-dfa1-4ad3-9628-19f43f4230d2@www.fastmail.com>
 <20210507062416.GD23749@aspeedtech.com>
 <2a339218-19d7-4eea-a734-8053dd553dbb@www.fastmail.com>
 <20210510060338.GB6883@aspeedtech.com>
 <f063cb34-9a42-4373-a333-cad1d8a9c37b@www.fastmail.com>
 <20210514020900.GB540@aspeedtech.com>
Date: Fri, 14 May 2021 12:07:30 +0930
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



On Fri, 14 May 2021, at 11:39, Steven Lee wrote:
> The 05/13/2021 08:42, Andrew Jeffery wrote:
> > 
> > 
> > On Mon, 10 May 2021, at 15:33, Steven Lee wrote:
> > > The 05/07/2021 15:36, Andrew Jeffery wrote:
> > > > 
> > > > 
> > > > On Fri, 7 May 2021, at 15:54, Steven Lee wrote:
> > > > > The 05/07/2021 09:32, Andrew Jeffery wrote:
> > > > > > 
> > > > > > 
> > > > > > On Thu, 6 May 2021, at 19:54, Philipp Zabel wrote:
> > > > > > > Hi Steven,
> > > > > > > 
> > > > > > > On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > > > > > > > +	if (info) {
> > > > > > > > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > > > > > > > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> > > > > > > 
> > > > > > > Please use devm_reset_control_get_exclusive() or
> > > > > > > devm_reset_control_get_optional_exclusive().
> > > > > > > 
> > > > > > > > +			if (!IS_ERR(sdc->rst)) {
> > > > > > > 
> > > > > > > Please just return errors here instead of ignoring them.
> > > > > > > The reset_control_get_optional variants return NULL in case the
> > > > > > > device node doesn't contain a resets phandle, in case you really
> > > > > > > consider this reset to be optional even though the flag is set?
> > > > > > 
> > > > > > It feels like we should get rid of the flag and leave it to the 
> > > > > > devicetree.
> > > > > > 
> > > > > 
> > > > > Do you mean adding a flag, for instance, "mmc-reset" in the
> > > > > device tree and call of_property_read_bool() in aspeed_sdc_probe()?
> > > > > 
> > > > > > I'm still kind of surprised it's not something we want to do for the 
> > > > > > 2400 and 2500 as well.
> > > > > > 
> > > > > 
> > > > > Per discussion with the chip designer, AST2400 and AST2500 doesn't need
> > > > > this implementation since the chip design is different to AST2600.
> > > > 
> > > > So digging a bit more deeply on this, it looks like the reset is 
> > > > already taken care of by drivers/clk/clk-ast2600.c in the 
> > > > clk_prepare_enable() path.
> > > > 
> > > > clk-ast2600 handles resets when enabling the clock for most peripherals:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n276
> > > > 
> > > > and this is true for both the SD controller and the eMMC controller:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n94
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n88
> > > > 
> > > > If this weren't the case you'd specify a reset property in the SD/eMMC 
> > > > devicetree nodes for the 2600 and then use 
> > > > devm_reset_control_get_optional_exclusive() as Philipp suggested. See 
> > > > the reset binding here:
> > > > 
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reset/reset.txt?h=v5.12
> > > > 
> > > > So on the surface it seems the reset handling in this patch is 
> > > > unnecessary. Have you observed an issue with the SoC that means it's 
> > > > required?
> > > > 
> > > 
> > > Yes, you are right, aspeed_sdc_probe() calls clk_prepare_enable(),
> > > aspeed_g6_clk_enable() does reset eMMC.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-of-aspeed.c#n496
> > > 
> > > However, the clock of eMMC is enabled in my u-boot(2019.04).
> > > So it is retruned in the condition of aspeed_g6_clk_is_enabled() below
> > > and doesn't reset eMMC.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n285
> > 
> > Okay, so what's the issue that the patch addresses? Is there a bug? 
> > Presumably if u-boot isn't making use of the eMMC the clock won't be 
> > on, so we'll do the reset if the kernel wants to make use of the 
> > device. If u-boot _is_ using the eMMC, u-boot will have done the 
> > correct clock enable/reset sequence and so the controller should be 
> > ready to go?
> > 
> > The only potential issue remaining is u-boot leaving the controller in 
> > a configuration the kernel isn't expecting when handing over. If that's 
> > the issue then we've forgotten to do some specific initialisation (i.e. 
> > not just reset the entire thing) of the controller in the driver probe 
> > path, right?
> > 
> 
> If DMA engine is used before probing eMMC in kernel stage,
> eMMC controller may have unexpected behavior when re-exectuing
> identifying process.
> Thus, we need to reset at the beginning of kernel since
> kernel is a new stage. We should not assume some one do something
> before.
> 
> > FWIW I haven't recently seen any poor behaviour from the controller or 
> > driver. For us (IBM) it seems to be working well since we sorted out 
> > the phase configuration.
> > 
> 
> Yes, you are right, everything work well currently. But, kernel is a new
> stage, we cannot assume eMMC controller is at initial state when
> entering kernel stage.

Okay. That sounds true no matter what the hardware design though (going 
back to the difference between the 2400/2500 and 2600).

Given the reset is tied up in the clock gating, it would be nice if we 
could do the following in aspeed_sdc_probe():

```
/* Clean up the controller in case it wasn't left in a good state by the bootloader */
clock_disable_unprepare(...);

clock_prepare_enable(...);
```

But the enable_count tracked by clock_core_{en,dis}able() kills that 
idea.

This makes it seem like we need to break out the appropriate indexes 
to add `resets` properties in the devicetree. This will need some input 
from Joel, given the eMMC/SD resets can't currently be handled that way.

Andrew
