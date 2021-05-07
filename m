Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E90376142
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 09:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc2P94bVhz2ymS
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 17:38:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=G0CwoqHv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=eScBRXAx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=G0CwoqHv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eScBRXAx; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc2Nw0Vb7z2xZ2;
 Fri,  7 May 2021 17:38:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D34245808CD;
 Fri,  7 May 2021 03:38:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 07 May 2021 03:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=dQDOTzcqfOQiIceNESDpDeh6eU3HFDK
 OGe/G/Fvd6ss=; b=G0CwoqHvNi6AqWjcFA79Hiy0clV7wq2v+N4xhwwBCgQAOSH
 15qhvR1wEzXsEUv9gOGoP0ARWg+0Pgusa/R/f+i1hAq26LYr5XOXQ/zAAmU0Pgz7
 XOgEUg0gByOgeTiKyRYuMcLphcm1b6hrjzxgJvqYrlXZ9FJPu8YwPSYz7v2K8Y/v
 aIfmfxXqBsNozUZCyylXIOEkR5Rw9GgAMQh0szpbmoqZU/p4lBP4MuB0VZDzs/cE
 wSDJGS8VmXbn88kAzhMJ98uI2dqcXq4iO+ZyAlnUcVViqOxhF99pfpig7AGpbeX7
 5sNkk5yZHiV/5NPJ4IQE4Nl9nilH2cydovlw1Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dQDOTz
 cqfOQiIceNESDpDeh6eU3HFDKOGe/G/Fvd6ss=; b=eScBRXAxM+mJSzqH2fGjez
 5hfDRIafMYhgx9aIB94L0gsYXDbY9Nsxl1ABKcSFdkkOPi4eot4Aj4//BGv1TxZB
 HuLfRYJLPKi2UobdoOR6A6xawAYPhbwa2sjmoB6mCx75xMIbCE4MoSRj5ahM5f6B
 jWrB6Rz5OlV/RHlu3Svikp/Y8QmjhjEGsPMM3nTFb7bP1WTY/m84L19AHiXMqioT
 s6CF2YkVAFqDn7lcTn5yAlOAO6V5GXnD5jEHJbsZGfGqmLM76I/VUfRtg+wd1iot
 5X3OgFP26BO5CmUApZB/U1M3oH0/j5B52H5/CFYTElqR1TP20pJ6wCTokGRdFRtw
 ==
X-ME-Sender: <xms:XO6UYK6LHVKbEDBv-YocshXGJOuPe4ZpfKyU5D5gDmWNmtqb6CXN-g>
 <xme:XO6UYD7pcHK1WSfnSwwFIThFallfPLa1u4o_POD4b3mikhvwro8F4w78St58nTzAj
 6fOEPaGok6rRj_XOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeduhedttdelkeetvdefiedtleejkeevleekgedvhfdtjeehgfeftdef
 vdejjeeltdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:XO6UYJdbKexbk8yCVKvO8lr41gDyZXItCml2Xdr0j8tc_cWU5V8IGg>
 <xmx:XO6UYHIV_VtlEfoyS5cclBKnlCnQEMLfge2lMs1ktdUOJI9tNFfdEg>
 <xmx:XO6UYOJRYmluXW-HZXIktMZnAR9kxngwoyJy6SfKHn7rVSc1IVxYsA>
 <xmx:Xe6UYJbC0Ld-red-CUnEujuNIVraR3RiJMOPHPxfaU7l4y83cXsbuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BBCA1A00079; Fri,  7 May 2021 03:38:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <2a339218-19d7-4eea-a734-8053dd553dbb@www.fastmail.com>
In-Reply-To: <20210507062416.GD23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
 <19a81e25-dfa1-4ad3-9628-19f43f4230d2@www.fastmail.com>
 <20210507062416.GD23749@aspeedtech.com>
Date: Fri, 07 May 2021 17:06:19 +0930
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



On Fri, 7 May 2021, at 15:54, Steven Lee wrote:
> The 05/07/2021 09:32, Andrew Jeffery wrote:
> > 
> > 
> > On Thu, 6 May 2021, at 19:54, Philipp Zabel wrote:
> > > Hi Steven,
> > > 
> > > On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > > > +	if (info) {
> > > > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > > > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> > > 
> > > Please use devm_reset_control_get_exclusive() or
> > > devm_reset_control_get_optional_exclusive().
> > > 
> > > > +			if (!IS_ERR(sdc->rst)) {
> > > 
> > > Please just return errors here instead of ignoring them.
> > > The reset_control_get_optional variants return NULL in case the
> > > device node doesn't contain a resets phandle, in case you really
> > > consider this reset to be optional even though the flag is set?
> > 
> > It feels like we should get rid of the flag and leave it to the 
> > devicetree.
> > 
> 
> Do you mean adding a flag, for instance, "mmc-reset" in the
> device tree and call of_property_read_bool() in aspeed_sdc_probe()?
> 
> > I'm still kind of surprised it's not something we want to do for the 
> > 2400 and 2500 as well.
> > 
> 
> Per discussion with the chip designer, AST2400 and AST2500 doesn't need
> this implementation since the chip design is different to AST2600.

So digging a bit more deeply on this, it looks like the reset is 
already taken care of by drivers/clk/clk-ast2600.c in the 
clk_prepare_enable() path.

clk-ast2600 handles resets when enabling the clock for most peripherals:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n276

and this is true for both the SD controller and the eMMC controller:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n94
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk-ast2600.c?h=v5.12#n88

If this weren't the case you'd specify a reset property in the SD/eMMC 
devicetree nodes for the 2600 and then use 
devm_reset_control_get_optional_exclusive() as Philipp suggested. See 
the reset binding here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reset/reset.txt?h=v5.12

So on the surface it seems the reset handling in this patch is 
unnecessary. Have you observed an issue with the SoC that means it's 
required?

Andrew
