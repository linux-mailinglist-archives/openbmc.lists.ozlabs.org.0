Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB17A31D7
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 10:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KXCZ1Q3zzF0dD
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 18:07:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="n0aPpAgu"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mzkzZvd0"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KXBr2p8qzDsy8;
 Fri, 30 Aug 2019 18:07:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D576521F85;
 Fri, 30 Aug 2019 04:07:13 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 04:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=mo3FGA/ipO1SkoDh6reUgvlvk0/ODyc
 GbN5cHOI6jnw=; b=n0aPpAguaYco15CyvLywybHNtVAc7mwuO0pzWP7wvOL4Fmd
 OHnEHaQlsdNU43xwYceWhMfk0QCz/vRpljxyPR10myZhHJVk1Gr7/KPCeBw5+CB4
 rsIfQB2bGMlSGIbOzvzO7vyDNrcKKDaPmgLmiH7MG+t/IxiusWysKBHZ029vMFcN
 S0Krms1cHcWwhachZ/SpXZzfkmlkZF79rP4Qr8E27Q3n/Z1j98vaCGU6p79BPDR9
 YW4gOcuI7qdImGvS8MxiEbUtER2pPj407Y70L9vm7zalsX0X89TSMuUzW3duN31X
 Xfw1iYF40TOZLCIUFXCq+eaK5gC5HLZOeg/97eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mo3FGA
 /ipO1SkoDh6reUgvlvk0/ODycGbN5cHOI6jnw=; b=mzkzZvd0ilqrs1ghrHg095
 4/hgqzJqavdRgmvLYcfAaOMtjE21M6bmrY8A/BqbnnO7QQL9hvuA5TecsbcOfe/V
 YZKBAdep8xDUafpohYs2i9/D5XRepasXcqyTCbd0K/eAQLBxjxzkIJknsY7GW5O2
 0N0mDb965foTBJlGEkAl+iOuj2rCcHh8y6StPCCCHky2JP0vrae2plX8QDxSElVz
 253LLLn8I4cVWNb2iXN6ynFFrVDF6I6sfTLAMjVhM+qft/OTohxwxCer6uRxOygk
 UOdiBZIc+QqdHxumWzsNMRE1Fu2ZFSPpZEpAo+kxlAOkC/Jp0kLg1ofv9vb4XplQ
 ==
X-ME-Sender: <xms:MNloXTYaESaR0JSN118H7OZG185uey1gsSKEmiVHTMutfzqTQg_J9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:MNloXT-po1mRFzcl375CIW70RgDLvtoMWD7LT-XdpGLI1cV0WAUcCw>
 <xmx:MNloXcSQnVT8SQGscGN27QMrZG3RRnEyPrYhFmMEP1bc10tTn7cExg>
 <xmx:MNloXVf0fHcgZhm7rUT-VcyoCr5kRV23qDXo6iioTUw0zOrr7TyHAw>
 <xmx:MdloXXgLtRc6wEEsmbh66N09Tq0Y2R7LAtKNg-C-z3TQJ0m21n2U6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B2443E00A3; Fri, 30 Aug 2019 04:07:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <6feca359-34ce-445e-87bf-62fa063d785f@www.fastmail.com>
In-Reply-To: <CAPDyKFrKXfB1F2dh63KrkCiKGbmbBWaAM16vJqtQncnF4YctQw@mail.gmail.com>
References: <20190830074644.10936-1-andrew@aj.id.au>
 <20190830074644.10936-2-andrew@aj.id.au>
 <CAPDyKFrKXfB1F2dh63KrkCiKGbmbBWaAM16vJqtQncnF4YctQw@mail.gmail.com>
Date: Fri, 30 Aug 2019 17:37:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
Subject: =?UTF-8?Q?Re:_[PATCH_1/2]_mmc:_sdhci-of-aspeed:_Uphold_clocks-on_post-co?=
 =?UTF-8?Q?ndition_of_set=5Fclock()?=
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, openbmc@lists.ozlabs.org,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 30 Aug 2019, at 17:31, Ulf Hansson wrote:
> On Fri, 30 Aug 2019 at 09:46, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > The early-exit didn't seem to matter on the AST2500, but on the AST2600
> > the SD clock genuinely may not be running on entry to
> > aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
> > sdhci_enable_clk().
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > index d5acb5afc50f..a9175ca85696 100644
> > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > @@ -55,9 +55,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
> >         int div;
> >         u16 clk;
> >
> > -       if (clock == host->clock)
> > -               return;
> > -
> >         sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
> >
> >         if (clock == 0)
> > --
> > 2.20.1
> >
> 
> Further down in aspeed_sdhci_set_clock() you should probably also
> remove the assignment of host->clock = clock, as that is already
> managed by sdhci_set_ios().

Ah, I'll fix that in a v2 once I have your thoughts on patch 2/2.

Thanks for the lightning quick feedback!

Andrew
