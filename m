Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E879438DE76
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 02:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpJJy6Pcwz3080
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 10:40:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ojua7Mlz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WKANcriZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ojua7Mlz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WKANcriZ; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpJJc2YG4z2yXl;
 Mon, 24 May 2021 10:40:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 30FAF5803CE;
 Sun, 23 May 2021 20:39:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 23 May 2021 20:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=5sJHMuDvNvV7pHRcupj6QN39aMOCxdc
 KSDsfy4XDr6I=; b=ojua7Mlz3qgeIZbbZumpj7T7jyN+s55eFPhuStyBHdgk/CV
 wo5DiB1u8wBL6CVKfMRYijetTBDzvIPZ3TgakzOM8T5dpHNbhQ5sWLY4hhxvRjrD
 mwOTpof5nzRyKtetT6YiGDzT04LCO7GWLrWBRTHluKPVv/Nu+JwbRiS2Cfv/EDQ7
 947/GGP6Lk4Z6/KL30TLuG0lPZ7pUwsrjWPjfm0N8dHfIJbiiwL0GmNiFvwlu1Y2
 P7+KgcSLLf5RHrokkLWhWWS2Y475TX4oVCqo9fG7WzQxMnqMVhz1OxjeTu66IH7T
 qeY8y25pR3e28l4+jkH3aTE4Qimn9V6CgIqFbYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5sJHMu
 DvNvV7pHRcupj6QN39aMOCxdcKSDsfy4XDr6I=; b=WKANcriZt27VBFBijYR5F1
 1550UhiqtynvZmOvUbdRSZsJyXl8TAC9JYHKdMblZZpfLYMupncWt2UBq13Ia787
 GjcSR4YTbrp+O8Tu/A1uPJcvq6hmhUloepfkcQ1EsZDnpy+rx2NWcH/iv5kHsII8
 Se2MMfEE0QDHDb28tDqhBU8hZGUPbYurDaLbRQ2HVnubfO6xtC/sdUpQWPIXo0mH
 H6NKiAFDOcFGwXIwzxrPPq9xIJCBS8ZhTvYqjuWjLZx4kR1YI/nakEjIXxFNfssn
 Ex7y3VM3gDSiYCTjnuwR5Ix9pkBo6PUr00vAGJJ1CGY6dAl/uadeYFIm4yqxGfAw
 ==
X-ME-Sender: <xms:3PWqYDCHzW5PZXM5LZOa4iaud7q5dx6IwQK4wgCtzP6bCSWDoNvkGQ>
 <xme:3PWqYJjLLV1WFr_YwjjAK8q2JBj2Wu-bdo_zed5CoJkeDagaReIgnG6Imo1B_9xzB
 z_zfoe_IXbvDo4Rag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3PWqYOmX6ki5Uzl-1pgVq6ZMe2ZfurXiFd3LXi5j9dbMd_S3klWYpQ>
 <xmx:3PWqYFxwDS6TgB5PwOVkLhawuFtEFu-FWKKqk7dtnHZq93B-kKnbew>
 <xmx:3PWqYIRDv0cIQnSauCF0KbSlS64BBxjKylPIS4gwsem09K4MxZ-Jyw>
 <xmx:3vWqYKCY2gWceaf5NXGgAx6uVUeaAdZMOiGRsNj-WThtFN2ZCBgDKQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 06E6DA004B1; Sun, 23 May 2021 20:39:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <0ea513bc-f8c8-43c5-969f-b9db9fdb15d7@www.fastmail.com>
In-Reply-To: <20210521173007.GJ2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-11-andrew@aj.id.au>
 <20210521173007.GJ2921206@minyard.net>
Date: Mon, 24 May 2021 10:09:22 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_10/16]_ipmi:_kcs=5Fbmc:_Don't_enforce_single-ope?=
 =?UTF-8?Q?n_policy_in_the_kernel?=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 openipmi-developer@lists.sourceforge.net, Zev Weiss <zweiss@equinix.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 22 May 2021, at 03:00, Corey Minyard wrote:
> On Mon, May 10, 2021 at 03:12:07PM +0930, Andrew Jeffery wrote:
> > Soon it will be possible for one KCS device to have multiple associated
> > chardevs exposed to userspace (for IPMI and raw-style access). However,
> > don't prevent userspace from:
> > 
> > 1. Opening more than one chardev at a time, or
> > 2. Opening the same chardev more than once.
> > 
> > System behaviour is undefined for both classes of multiple access, so
> > userspace must manage itself accordingly.
> 
> I don't understand why you want to allow this.  If the second open won't
> work right, then why allow it?  Why remove code that causes the second
> open to error?

Really I was just shifting the problem to userspace so it wasn't 
something I needed to address in the kernel. It seems I'm alone in 
thinking this is a good idea, as yourself, Zev, William and Joel 
(privately) have pushed back against it. Initially the idea was tied up 
in how I was doing some interrupt handling, but in revising the code 
that problem has gone away.

I'll just drop this patch and save everyone the heartburn of arguing 
about it :)

Andrew
