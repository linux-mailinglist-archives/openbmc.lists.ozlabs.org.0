Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A02BD1C377F
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 13:03:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0MT2XWczDqcQ
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 21:03:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Ykmw6NB3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=apMegdun; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0Lm1MJSzDqWZ
 for <openbmc@lists.ozlabs.org>; Mon,  4 May 2020 21:02:40 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D4CD26D8;
 Mon,  4 May 2020 07:02:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 04 May 2020 07:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=q2usf2d3GYx5XkklqwftOVzx+VuvIlD
 PQoA6avihDKw=; b=Ykmw6NB3rTMeGaXvSYfzmeswha2vYOEPdYWxbZQdmrOkCrP
 fIqvNZIjn8fY6qYDVY+3NAQ14ygTdlGZRwvwReQlxoRMhxbaxzvNmdaUDmzgw7an
 0XlZi6X8itxY87/btneSqylVX3yfQnLeUJbrYRAlzaMItHzlzhyx2ovwYOo1lF6N
 yZmOzzhe279CLnzklEVY69jlmWk3R29zmRvUGSvonZs8MCWp45vBa7b2oIkNdk72
 BbHDFZlUyV7d8DBaxArHXoL9WSDPrhL+PIEEu9tSzsgI5HSDIAIanBbHH6pGNIJ3
 wjpFQDRfXzOQCXBBuekTABjgIiomvSmpUdyhwSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q2usf2
 d3GYx5XkklqwftOVzx+VuvIlDPQoA6avihDKw=; b=apMegdunjlPZrt6YWjJru7
 Aj8mkAewpGgiv9DZyip9KGXm6NrHU+DrTbM0WptGvFnFMdLt3K9az/IHEb0wwX/h
 ufYMsbi+Tbf4lc0XAfhBR74yCEbO2rIGijvuBhgFz0Jue9iLpeH/ugoZ1DnbDzin
 SMf3y+Y8kXrfuX5Aqcm0dNLfYhWLsx7QS1HNzZNkpTbPp+0C9E31TCR/PSYiC33A
 PRaYHDTw2OTcdHVoKezC81pCwanc3gcyUYLwo0adKs8q6tDlpotoL3yGUWRCp6fn
 4jOIQe0/YNaehLFw0+waPdcSAv0HyGsTGGfzVfFRwu/ObeaswILf2RIVnoAtDwXA
 ==
X-ME-Sender: <xms:TPavXujeaODC4HQ7p7e59wdBEJuomWH-EOgkbmbjm5vTKjMLzM3cTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhephefhfeekgfekudevheffheeihedujeef
 jeevjeefudfgfeeutdeuvdehhfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:TPavXlnd4Mrz9cgDlNX9ONbJFIsE3ACa1oeTKWRNKOaH8AFZbiVsXQ>
 <xmx:TPavXji-xEsxm5xAU0CRLMqNhC3wraXZfomgiftI912DvsSyrR20Mg>
 <xmx:TPavXncxbyS1weoF1rM81JPMU7DOicO9wy9ovlXBaJghJSBmE6Wgxw>
 <xmx:TfavXn2ZiMhLrVPzQ6NJtfudtyUeCFjEer7mjhE40GyDamXc-H719Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 838DBE00A9; Mon,  4 May 2020 07:02:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <ff726d32-3928-4eb2-8c2a-9d9263c49bb7@www.fastmail.com>
In-Reply-To: <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
 <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
 <32f161d2-784e-8fe5-a00b-e9bec181a265@linux.vnet.ibm.com>
Date: Mon, 04 May 2020 20:32:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ratan Gupta" <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 27 Apr 2020, at 20:41, Ratan Gupta wrote:
> Thanks Patrick, William for sharing the feedbacks
> 
> I will start working on the changes.
> 
> 
> 
> On 4/24/20 11:15 PM, William Kennington wrote:
> > Sounds good to me, we have needed this for a long time because the current gateway configuration breaks our v6 stack with multiple NICs.
> > 
> > On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> >> On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
> >>  > ~~~~~~~~~~~~~
> >>  > Kernel IP routing table
> >>  > Destination Gateway Genmask Flags MSS Window irtt 
> >>  > Iface
> >>  > 0.0.0.0 19.168.2.1 0.0.0.0 UG 0 0 0 
> >>  > eth0
> >>  > 0.0.0.0 10.10.10.1 0.0.0.0 UG 0 0 0 
> >>  > eth1
> >>  > ~~~~~~~~~~~~~~
> >>  > 
> >>  > Kernel will first try using the default gateway having higher metric 
> >>  > value and then fall back to the lower.
> >> 
> >>  I'm not seeing us with an interface to adjust the metric for an
> >>  interface. I think we need to add that at the same time? 
> Not now, As per my testing if metric value is not defined and both the routes
> 
> having same metric then kernel tries one after other. We can bring the metric
> 
> later.

This sounds like implementation-defined behaviour. Is that the case? If so it's 
not something we should be relying on.

Andrew
