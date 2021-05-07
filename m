Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71802375E6A
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 03:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbtJD3Jnnz2yYR
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 11:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mM4BlZeQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=r63mby3e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=mM4BlZeQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=r63mby3e; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbtHp1dzfz2yQy;
 Fri,  7 May 2021 11:33:09 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id F0D01580961;
 Thu,  6 May 2021 21:33:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 06 May 2021 21:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=+6WcnuLbg5MQPQ1CNTZXV3RZb2wmRjj
 rGjFSoRIlm5c=; b=mM4BlZeQY4pW7UnBanVkm1/3Xe2AMYufr/nsRKlSNNB5fxB
 Mxl1jABk8kV4jz6Ch8PZbQbF8qnTiv+4l01e10azRU6JchcfFpEwUu6LNXwfTZ9b
 PM1H+Q8IshrfYR1LZpAhD9LlCHUPSHx+SNzk1iklCZMUS/Hc8ujdS6uiXRryf7bP
 CIz3o4X0HbmTUTNSkPTdDeZtwJYy2DQVvVbaWg2ZKE86td8uHa0iWIUz8brta8jE
 FUd+YYXJSa1Q52SKI45Q+7ZyWhntc4aT4F/yS4rT+jimtQO6cTLl2NJNmBJEu4Ph
 bd42sSFZCdwyIl/D2exko6hdv/NXVv16FUTZvMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+6Wcnu
 Lbg5MQPQ1CNTZXV3RZb2wmRjjrGjFSoRIlm5c=; b=r63mby3ej96oPK2tiYm30r
 H1fbdvfDfbGWMYsUZY0+gxQkqtHizU//VMkAR8UGgnDDBf72aLJHDULp+4FRqZr9
 jqKmMRyHqA3t3KJNEVExb5Azir2YT4ZrtbjuLD2rZabOeg8ro9akHWxKaQgb2gYM
 aNWwaaU7xeAJXF8S4MV/DIM4sgrU/fQAl2injk09sl6FpIU+pcGJii06zqjDj92D
 kpVmKvvRzUpXLWMGJezr7EvnPZ5DYTEp6Ustq/ulP5IqPZHNjsORf0vtSpgC133X
 QtMNnDdAhn3gWbdUHWMoPHGDSTZlZKlfIlEKT7t99Ki1YncrBMWJSsSECayPH/dQ
 ==
X-ME-Sender: <xms:0JiUYIFeurJrldOK9-gkyfafALFwxPXmaVEFigOZudHNr10BNd4ZOw>
 <xme:0JiUYBU_JM8RKbRcQWZeq5tHMaDmLtRf8vOc6ZagCpG2XtssbcJJRvn609wEvEF0e
 WSnOTUR9YFYb_gIqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:0JiUYCIS2BczSyOWvzBOUJfyk-StWxzjfNOAzeJeP-wL0BZ3y1Bsag>
 <xmx:0JiUYKGwhb_Wqtz3AMTqm9tpgnNGgM_hTYy8bQS-pAVStsBJar_9kQ>
 <xmx:0JiUYOWeTFf5r1-41QbQsCWdEwnzjq-XcZGVaYbc4fPxNU4J_a7BFQ>
 <xmx:0ZiUYHWHR-2kxUbILwlv0cye8yPC8PgZhj-sR64-i60BEqFrN6RpEA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F415FA00079; Thu,  6 May 2021 21:33:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <19a81e25-dfa1-4ad3-9628-19f43f4230d2@www.fastmail.com>
In-Reply-To: <20210506102458.GA20777@pengutronix.de>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-6-steven_lee@aspeedtech.com>
 <20210506102458.GA20777@pengutronix.de>
Date: Fri, 07 May 2021 11:02:29 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Steven Lee" <steven_lee@aspeedtech.com>
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
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 6 May 2021, at 19:54, Philipp Zabel wrote:
> Hi Steven,
> 
> On Thu, May 06, 2021 at 06:03:12PM +0800, Steven Lee wrote:
> > +	if (info) {
> > +		if (info->flag & PROBE_AFTER_ASSET_DEASSERT) {
> > +			sdc->rst = devm_reset_control_get(&pdev->dev, NULL);
> 
> Please use devm_reset_control_get_exclusive() or
> devm_reset_control_get_optional_exclusive().
> 
> > +			if (!IS_ERR(sdc->rst)) {
> 
> Please just return errors here instead of ignoring them.
> The reset_control_get_optional variants return NULL in case the
> device node doesn't contain a resets phandle, in case you really
> consider this reset to be optional even though the flag is set?

It feels like we should get rid of the flag and leave it to the 
devicetree.

I'm still kind of surprised it's not something we want to do for the 
2400 and 2500 as well.

Andrew
