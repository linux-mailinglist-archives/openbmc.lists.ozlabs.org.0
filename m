Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E4D57A63
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 06:03:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z5pm1JSczDqS9
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 14:03:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="QApLQdYF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FO6dIVoQ"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z5p63hWnzDqJ1;
 Thu, 27 Jun 2019 14:02:38 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 31EC820D8;
 Thu, 27 Jun 2019 00:02:35 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 27 Jun 2019 00:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Fmp+BOEupySBVtpjzqC63zvPuK56eVv
 u2js37xVpihI=; b=QApLQdYFEOTDAyKcDh23hCvGX/5Na3gs77ir4y1XL43mS/1
 v121RibpU2D+/HDmQ8xskmCg8pOhpCempJAM7pJ74gHx6pjzXJ8qk49xo1IWpXu1
 vH6T6US7ifm0ybajLI9YBalSqPqBHBQ/bRDptkSRqoagxKnl5+i2D558ewtcKzV6
 S0MVi7u7op7bF7romF9qoMv4btmGYuiLyAUAfA8jmvnyQk1Za1KIxhMXfzc9yIUB
 INGTiGkcqJV9GcZPwa+OAC40/KPAgcfscGWheGD3HS/daVoThjhhfiH6t04iFTmU
 wd7bO0abU+2StVJCLmHm2E3r97vI7QLf2u2NhQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Fmp+BO
 EupySBVtpjzqC63zvPuK56eVvu2js37xVpihI=; b=FO6dIVoQ5rtaF5n1GaLBNh
 iZV9oG0MDngG9xZuQrWvDDps2XG40OVY5DYSVwHtuAWYBwhTsvc8LXOIPRjr2fZw
 9437BDHvv024GLyNwyAvEmLHP/Jlyb/xrHdOI3Zrc+wdvqezf/hkbw8XFKOP6gOV
 7Bsnsf5qjh13kGSKw50FXmER8Q/Pt9MGhiEoDhXzDLjYa42OxXB9Nh7GDfVd3eaG
 0cEwX7Eujxq2urTHUhx6HShHFjY575W6IWoudvq7S3IZZwz4HOWfge5Ao+JPI9Oq
 CErKCDGZ1PC2XsMnCdBTal1SG8WYeZkFF8eSWOD2izQ8uLMCIqe/QEeIPNGudYRA
 ==
X-ME-Sender: <xms:1z8UXWyS844TDQTyEk41JatYBMxO4mlrM6N6rx_l6AD1sQGY3kIjow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:1z8UXbrxEntN8J8lOKet4zVeDQ7SveS9sUBku1OJcIlxv91V-0ZAvg>
 <xmx:1z8UXReH2J5pvvNvppgjPUnwFpvC4fTECLbKMzmsPBmFHmlxhq-swQ>
 <xmx:1z8UXfhcoeGRGvU77nfbqd_JOD3sXVYp8x8UTfWwHEtnCbGz6xwO1w>
 <xmx:2z8UXe-zAs_jUi-e4l2KZJEBBBLTaXnmpuZbUpk8Iq-T3kaIzwEtAg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3F2F4E00A2; Thu, 27 Jun 2019 00:02:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <226afe63-cc86-4920-abc1-025bdda32063@www.fastmail.com>
In-Reply-To: <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-2-andrew@aj.id.au>
 <CACPK8Xfdd1ReAHr9f6zRbZ-WJRquDJsTdUQeT_JuEBhOzS8tig@mail.gmail.com>
Date: Thu, 27 Jun 2019 13:32:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_1/8]_dt-bindings:_pinctrl:_aspeed:_Split_bindings_d?=
 =?UTF-8?Q?ocument_in_two?=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 27 Jun 2019, at 13:02, Joel Stanley wrote:
> On Wed, 26 Jun 2019 at 07:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Have one for each of the AST2400 and AST2500. The only thing that was
> > common was the fact that both support ASPEED BMC SoCs.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../pinctrl/aspeed,ast2400-pinctrl.txt        | 80 +++++++++++++++++++
> >  ...-aspeed.txt => aspeed,ast2500-pinctrl.txt} | 63 ++-------------
> >  2 files changed, 85 insertions(+), 58 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> >  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-aspeed.txt => aspeed,ast2500-pinctrl.txt} (66%)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > new file mode 100644
> > index 000000000000..67e0325ccf2e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.txt
> > @@ -0,0 +1,80 @@
> > +=============================
> > +Aspeed AST2400 Pin Controller
> > +=============================
> > +
> > +Required properties for the AST2400:
> > +- compatible :                         Should be one of the following:
> > +                               "aspeed,ast2400-pinctrl"
> > +                               "aspeed,g4-pinctrl"
> > +
> > +The pin controller node should be the child of a syscon node with the required
> > +property:
> > +
> > +- compatible :                 Should be one of the following:
> > +                       "aspeed,ast2400-scu", "syscon", "simple-mfd"
> > +                       "aspeed,g4-scu", "syscon", "simple-mfd"
> 
> I think we can use this as an opportunity to drop the unused g4-scu
> compatible from the bindings. Similarly for the g5.

I Wonder if we should eradicate that pattern for all the aspeed compatibles?

> 
> Acked-by: Joel Stanley <joel@jms.id.au>

Cheers,

Andrew
