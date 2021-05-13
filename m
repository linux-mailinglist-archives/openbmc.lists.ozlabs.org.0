Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F337F095
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 02:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgXv55CrVz2yyl
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 10:42:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=XVZ5zUun;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kI6Th+LN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=XVZ5zUun; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=kI6Th+LN; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgXtm4t8Hz2yXL;
 Thu, 13 May 2021 10:42:40 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B8F90580A07;
 Wed, 12 May 2021 20:42:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 12 May 2021 20:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=U2X5Fpp7WurHFYDNULPr4jvqE4TsMUm
 xiyWg3py93w8=; b=XVZ5zUun+J8kNtm16npj5cy/yOsiK0aYW0vQkn+vQOuAlpB
 Jw3w+CkO+EYR8fcIYtbbSRS3P411bMTRY6IErCor9kjdOje8RlFdAEYd2BnvVA+v
 a3OAGdDE/J0HJbXUwolQ0D/mrhds69RpGKkqwknfEPKzrQFlWvBIjco5u1gL3lAV
 W0eygYx/EtCkioJ1xcvppYI39um3N4YtK1WzFGOkqlXpGwebUF6I7DvpfOwe9z25
 nhr1LmR3ozI3sBcBJ01DIn3M2GD60RFxRQE7o/jW3neDdv26j1EM9SLZMIK06+n2
 9LlqhouyBzu3reDVOBhCUosJzEp78isDmTj9Qfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=U2X5Fp
 p7WurHFYDNULPr4jvqE4TsMUmxiyWg3py93w8=; b=kI6Th+LNaqueEK780/gRVm
 L4Df3QC0tHEQM8ktCkfU6kQ74TUaGB2R6yE1l3z88iBwadwWkqWUfJxDwDtEgX2U
 abY28k1Yul0ZLGwJ0bOnt/ixmIIsh8h0iW44CObsiC5OshtCCpJvcFf5/QOWfMBw
 vrxC5P+L0Kwai4fuN0QoGPhmsrQFRKNuLsEbbR6CYOgFxY9KQsoMXtCyzmmjA0OJ
 yc0q51FDmeneqp2mV/IScDWBmljK7N2+AUO2/hFtU94nVnL1qPYo0KBn5oMMoILT
 Gq9ipWlu1cIfZac7FQStQ6R+RhEGqnn/YxAcgr0YWTS/XRgStg9w9boQwc8KSk1g
 ==
X-ME-Sender: <xms:-nWcYJnsNIx34myGzV_hJAvbc4t_5W7nnS8_B_i0mTQxUuF_JIb4NA>
 <xme:-nWcYE1PHFLkDEAk3JvXiXdcVI56hUPN5_SBM80ojRgNJN9fuRqyokXPiz9LC-Atv
 GP2-Yn1AZNNKAxelQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehfedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-nWcYPpJqT2JssuVBrRMYEQbDzrEsIOTv6oKlGWqA8smhzKzFOQlYQ>
 <xmx:-nWcYJmH5pwea_mGu6F6FOtoFZfEw-C-4bYH-RR6E7XlgMEoPGVO0A>
 <xmx:-nWcYH32SteuOJUYYZTSkQdJbfYTnpjtngb440WEGVG0muJ1CEhSLQ>
 <xmx:-3WcYO1jLHcooSYkIm7L3VluPPwGPznABBOBxi1wK6U9ASzk7D7cBw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3581CA00079; Wed, 12 May 2021 20:42:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <f063cb34-9a42-4373-a333-cad1d8a9c37b@www.fastmail.com>
In-Reply-To: <20210510060338.GB6883@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
 <19a81e25-dfa1-4ad3-9628-19f43f4230d2@www.fastmail.com>
 <20210507062416.GD23749@aspeedtech.com>
 <2a339218-19d7-4eea-a734-8053dd553dbb@www.fastmail.com>
 <20210510060338.GB6883@aspeedtech.com>
Date: Thu, 13 May 2021 10:12:12 +0930
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



On Mon, 10 May 2021, at 15:33, Steven Lee wrote:
> The 05/07/2021 15:36, Andrew Jeffery wrote:
> > 
> > 
> > On Fri, 7 May 2021, at 15:54, Steven Lee wrote:
> > > The 05/07/2021 09:32, Andrew Jeffery wrote:
> > > > 
> > > > 
> > > > On Thu, 6 May 2021, at 19:54, Philipp Zabel wrote:
> > > > > Hi Steven,
> > > > > 
> > > > > On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > > > > > +	if (info) {
> > > > > > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > > > > > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> > > > > 
> > > > > Please use devm_reset_control_get_exclusive() or
> > > > > devm_reset_control_get_optional_exclusive().
> > > > > 
> > > > > > +			if (!IS_ERR(sdc->rst)) {
> > > > > 
> > > > > Please just return errors here instead of ignoring them.
> > > > > The reset_control_get_optional variants return NULL in case the
> > > > > device node doesn't contain a resets phandle, in case you really
> > > > > consider this reset to be optional even though the flag is set?
> > > > 
> > > > It feels like we should get rid of the flag and leave it to the 
> > > > devicetree.
> > > > 
> > > 
> > > Do you mean adding a flag, for instance, "mmc-reset" in the
> > > device tree and call of_property_read_bool() in aspeed_sdc_probe()?
> > > 
> > > > I'm still kind of surprised it's not something we want to do for the 
> > > > 2400 and 2500 as well.
> > > > 
> > > 
> > > Per discussion with the chip designer, AST2400 and AST2500 doesn't need
> > > this implementation since the chip design is different to AST2600.
> > 
> > So digging a bit more deeply on this, it looks like the reset is 
> > already taken care of by drivers/clk/clk-ast2600.c in the 
> > clk_prepare_enable() path.
> > 
> > clk-ast2600 handles resets when enabling the clock for most peripherals:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n276
> > 
> > and this is true for both the SD controller and the eMMC controller:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n94
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n88
> > 
> > If this weren't the case you'd specify a reset property in the SD/eMMC 
> > devicetree nodes for the 2600 and then use 
> > devm_reset_control_get_optional_exclusive() as Philipp suggested. See 
> > the reset binding here:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reset/reset.txt?h=v5.12
> > 
> > So on the surface it seems the reset handling in this patch is 
> > unnecessary. Have you observed an issue with the SoC that means it's 
> > required?
> > 
> 
> Yes, you are right, aspeed_sdc_probe() calls clk_prepare_enable(),
> aspeed_g6_clk_enable() does reset eMMC.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sdhci-of-aspeed.c#n496
> 
> However, the clock of eMMC is enabled in my u-boot(2019.04).
> So it is retruned in the condition of aspeed_g6_clk_is_enabled() below
> and doesn't reset eMMC.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n285

Okay, so what's the issue that the patch addresses? Is there a bug? 
Presumably if u-boot isn't making use of the eMMC the clock won't be 
on, so we'll do the reset if the kernel wants to make use of the 
device. If u-boot _is_ using the eMMC, u-boot will have done the 
correct clock enable/reset sequence and so the controller should be 
ready to go?

The only potential issue remaining is u-boot leaving the controller in 
a configuration the kernel isn't expecting when handing over. If that's 
the issue then we've forgotten to do some specific initialisation (i.e. 
not just reset the entire thing) of the controller in the driver probe 
path, right?

FWIW I haven't recently seen any poor behaviour from the controller or 
driver. For us (IBM) it seems to be working well since we sorted out 
the phase configuration.

Andrew
