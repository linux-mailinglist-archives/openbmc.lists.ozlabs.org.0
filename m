Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20E4DA586
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 23:42:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ7hs3bpvz30G0
	for <lists+openbmc@lfdr.de>; Wed, 16 Mar 2022 09:42:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=YoTL1gWk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=X6qhhyVT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=YoTL1gWk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=X6qhhyVT; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ7hM24Pdz2yMx
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 09:42:26 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 30EDA3200FA9;
 Tue, 15 Mar 2022 18:42:23 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 15 Mar 2022 18:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=9UavmVcQWvP/XpjrqsntFZf5/X+3H6ooIzjyxQ
 4u/DM=; b=YoTL1gWkhYpBisJ584IcPQg5jqS8dRmqHiNep6J4uQvHz4nb0tukC7
 1NLL1o8cNvJLK0SSvYooU1jwtjFVYcb0oDT+taRzcWW998v3GO/kOLUVeZiIFsfh
 UXP41Fo9MV9/DwKZ3VUxRzRmOxDgtiPzPaZEgfVgkY/pc+Zreh890SxdNs81xmdS
 3ejzYvnoAeY4PsjLt1SfDAcmYeX7UaVA0jxOT6JKe2E9ZDaTeEM6cKj0yumKarCn
 aPCJGD+Gu70LQWhSpTArTP0inLPl5WAG8nZyccbPeoWdrYMnjYsGrU+vJK6cOmbI
 kV1hGDtUbn9H1yliJjI933wWu/kVtpYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9UavmVcQWvP/Xpjrq
 sntFZf5/X+3H6ooIzjyxQ4u/DM=; b=X6qhhyVT4V3/sgb0yYSQEewGUVNcUKr85
 BvTQViKv60cPyo/3Mz2cNGMq0U6rpwqmPsVhQvXXnDw3nfnqFx1jYRKVxrZCPdrn
 ApjipBlEaI7ZXE9mKQOFlGsn+48OyzmX9QwyUi0zBPhkPoVGkhhUSF/hkF0YE+RW
 wpfQnGIh871v89+8/04CvuouO1BX2S+SrV5eGFY5ui/qLBBzO0u5YvXis4KFZwX4
 Y635tG3WYHYVU5MGr8JxhOvJMcuziVPbRVGtiiIUr7H2YFHyjuzLH9XzLWUJ96he
 6EUI7SzOBxl+vH4Fv1xmju8C743VPJzxv7uQlghBMLyzR5bhsQbRw==
X-ME-Sender: <xms:ThYxYrUyhYVGz2R_tT9y6jrGlPurhbcgUNTK4y9I21TuQMmrtKxzIA>
 <xme:ThYxYjlRF4KmGI1t8zOAfu68ELcQ8Yw83T0oTG5AivZaJ47TrC4MmecTmk61t1t7_
 jS_VdqvbSxGCGaXGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefuddgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ThYxYnYj05zZ5tKKZVo13BHtjim7u3a_i2iLWtQGYrloLqG56Ofa1A>
 <xmx:ThYxYmWJbcHQA_Ugdj0s7NWVN2veafDfMhCYeF9frD4A99Id10XcXA>
 <xmx:ThYxYlkCdEBJBk4mQNRlISuXxp3AUPcL4lHiaFyLc_gW-_HlChb5aA>
 <xmx:ThYxYkv5mOxhS8oNSHsqQjHIwIscUY-_BofDx8VvH8k8Ea4dw4DJdQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 47BFCF6007E; Tue, 15 Mar 2022 18:42:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <1d58d0cc-3ca6-4d86-a3e1-30cf18d5c708@www.fastmail.com>
In-Reply-To: <AM9PR02MB6499C2AB30799F6A97D92095C10C9@AM9PR02MB6499.eurprd02.prod.outlook.com>
References: <AM9PR02MB6499C2AB30799F6A97D92095C10C9@AM9PR02MB6499.eurprd02.prod.outlook.com>
Date: Wed, 16 Mar 2022 09:12:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Govert Overgaauw" <govert.overgaauw@prodrive-technologies.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP LPC FW binding
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
Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 12 Mar 2022, at 00:32, Govert Overgaauw wrote:
> Hello,
>
> I was wondering if anyone is/was successful in using the MCTP over LPC 
> binding with an intel platform? I read through the documents, it seems 
> to me the binding was designed to use LPC firmware cycles. To me it is 
> unclear if the ast2500 supports memory cycles on the LPC2AHB bridge 
> (datasheet seems to list it in the features, not much explanation).  
> The problem is that the C620 chipset doesn't support firmware cycles 
> (only memory and I/O cycles). And having a properly mapped window in 
> the C620 chipset and reserved memory in Linux. Writing and Reading to 
> it only returns ('1s').
>
> Writing a simple test on x86 that keeps writing a value to the mapped 
> registers, seems to trigger LAD[3:1] = 0xF readout on the BMC LPC host 
> controller register 0 (that has some debug registers to see the state 
> of the LPC bus). 0xF is the stop frame of a standard LPC memory cycle.

As one of the authors of the binding, I just wanted to note that it was 
developed for IBM's Power systems (which support FW cycles). I haven't 
tried memory cycles, however there are other conditions under which you 
might get 0xF, such as if the LPC2AHB isn't enabled. The BMC 
aspeed-lpc-ctrl kernel driver should take care of this for you, however 
it only does so once you open the character device. From there you'll 
need to use the ioctl()s to switch the bridge to use the reserved 
memory rather than the default mapping of the host SPI-NOR.

Andrew
