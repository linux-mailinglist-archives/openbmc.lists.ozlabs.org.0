Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F5478A8
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 05:30:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RxYt52bmzDqZ3
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 13:30:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AAJ+Gkk0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tAghdI1H"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RxYB6j9mzDqYp
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 13:30:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A96222347;
 Sun, 16 Jun 2019 23:30:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 16 Jun 2019 23:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=10/wBMeygQ0SAsbaWukUMcxZn/6if91
 jLZ3HccO0Adg=; b=AAJ+Gkk0DfAMt932UTQ9r9AARH97vcfmcsqRO98XhMA9G/s
 9a+j92yFVxU8DmlNHlssv0sg2wQj125zH2iOlEesHn/ivqTcdM1j850OunMknANF
 ROdFbB5j417GfWdKZP7ho+Vv/EuIKyTmEXmScd6poE7tR9KvbI1oGR1BrL9ZoJES
 TSoRC6lAyrI9t/epdRQGTr++E8dxx755ic2uhvkkKIzJxjsHmXnJdjV2VW/2kWdF
 eD7RbtKBJdt93KT9ZDox5J8E8PgKdqd/Brmix2uxiWFqQ1luiPoUyhhcGp4/NXKj
 FfEhpG1k8qZV8wLM6c0dw6SV7++fLyricLWNYKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=10/wBM
 eygQ0SAsbaWukUMcxZn/6if91jLZ3HccO0Adg=; b=tAghdI1HD4XzoWdYbz5zw0
 c7FjEA9N37Wb6OnEoZlCYaYTZMGrPk9Tadf4s6KdYLKBeCvK99noUgX5Kf4RiBmo
 ydTNbxWIQ+klc/XCoKywnG1JrmIuRKgfRmFLbEmuWlK2z9tzrJC3S+6hbjiEYaSz
 1ZNdI2Y8pkQXoXbyJgrgPQP+3+eEP+VerZ5Bi8eXyAC7NNVHukIio9Z+GTF44rtI
 YgdwWDD2USnwf6xtzPwPk/iPnRUcfVTC0AiVLBU8+bBpSTNnmlHLqFvFp86rvrZX
 biCqOfIcJM2IENoU36AD+GW8sEgiQIYOzfFbQZ/GXM4euGIdSXlcgPZ7iWyvvf3Q
 ==
X-ME-Sender: <xms:OgkHXVy7HGy5L1w-6ZOxzffpQhbZHoEbO1Fq_b9wIliEwkbOpAgXbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OgkHXctlMgu8wN3Eg9PADX65K8xPtDDqk8WZZ8QUG1GzcAkkEaULWg>
 <xmx:OgkHXcvBiyEUc9BI4Ea9BbFkyXs3AcvFolrs7HfGrG7_4bR-SI5mrA>
 <xmx:OgkHXRNpjHIxCIbrF3twTknInO_YXN0vj8ovI_hED4Q5BUeYCFX9mg>
 <xmx:PAkHXY7hEEdU1llITyvQ7Ohk1psQ4DaHXoZastf2UBG2b4Z8bfesdQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4C52E00A2; Sun, 16 Jun 2019 23:30:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-663-gf46ad30-fmstable-20190607v1
Mime-Version: 1.0
Message-Id: <1fc9bc66-6bbc-4b13-9ebc-e8fc2b0d5129@www.fastmail.com>
In-Reply-To: <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
References: <CALLMt=qZOxWDH8eDqv6JYbkvgk10mR1K_REgnE-DkssLWD=iVg@mail.gmail.com>
 <CACPK8XdV6X6j=A2Qf7RcBnWWoESi6SWMZfcoA2mJPO_JFCdcrQ@mail.gmail.com>
 <CAO=notxmm4JWPSS3o6bBXpFxO=n-e43F8kLPcjSvudvGoCCZPA@mail.gmail.com>
 <CALLMt=om6w-0um4vBKoosxVHjL2egHd-Fs=0aT3zE6LJHXedyw@mail.gmail.com>
 <CACPK8XdZWGJ8d32N1D8Np2Ja8DOPZ4BqB9wJ4GyFOJ5PCmO5gg@mail.gmail.com>
 <CADKL2t7a41=uwFQaB8UyLOJUNm65rq4hgxCK1zdURCZ6reXZ0A@mail.gmail.com>
Date: Mon, 17 Jun 2019 12:59:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Benjamin Fair" <benjaminfair@google.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: CI to stop testing meta-* layers not in tested machine
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> >
> >
> >
> > Once we get the u-boot issue sorted out, I propose the following changes:
> >
> >  - drop qemu from CI. 'qemu' is actually testing on a generic arm
> > machine. A few of us at IBM have a side project that has resulted in a
> > high quality Qemu support for the aspeed boards, so if you would like
> > to test in qemu I recommend grabbing palmetto or romulus and doing
> > that. So consider this dropping the generic qemu image and instead
> > focusing on the aspeed one.
> 
> +1
> 
> Many things are already broken on QEMU, including phosphor-ipmi-host.
> It's not a useful platform to test with.
> 

Is that a general statement about QEMU, or are you talking about the generic
qemu image as Joel was?

It would be great if we had more contributions on the QEMU side. There's a
list of things that can be attacked in the wiki:

https://github.com/openbmc/qemu/wiki

Modelling I2C peripherals is usually a good first step.

Andrew
