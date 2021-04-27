Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DDE36BCEC
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 03:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTkf35bvbz2yxb
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 11:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=jz77ynYH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qSdxOECG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=jz77ynYH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qSdxOECG; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTkdq25JNz2xZG
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 11:27:27 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9FCE45C01AC
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 21:27:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 26 Apr 2021 21:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=Db8hqc1FhUALb38hFu/mABEXRnZg1zb
 rj6R9MvdbFFY=; b=jz77ynYH/Ei0j9xcGUSSwGpwpROZC8bHTj5ULVwRxTmI7As
 loxz03Vq9nCBWzEYD73csqol6wlk1oeXcb7Q77lb509SrpWidyuSKytS346Vr3/f
 gRf8tAqbmzk8FfzuvBDkVd2Su98yQjX9iOxAkvUR1sHOu0DYQc5yIVsPMSxueNnC
 yrdgahhMr7TNNZnfHEKviGU1IL1UFJCzL0jKoK8iFdOdYLvtTu+IJkhIX9VH2P+/
 ijyLVOOz9p5azayupIyDKJXQdAu7O/+i9bx0NOeXEljClw3axmdtz7T4bpgmPaL6
 8RxT34SjHvJhfz6rLY9ts6IsA310x1aEVut2xfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Db8hqc
 1FhUALb38hFu/mABEXRnZg1zbrj6R9MvdbFFY=; b=qSdxOECGxw1UfW80ddEMFG
 y1tv0NOw7PsN2JI25DwD5TEUOIIPdO3BDndj9XVTf7qB9KmdW8Mjbmj8n2PlL5LD
 Gmr6Ox0cprfDJOt6b2C3AWjgLfy92wZjrIkeCa3hI4EdMg6wc32sNqoRf+UHVZXD
 GOIVVWX+zxBmPBQqsUu1gt8cVDIyfxwkaJ2KhXPrcS5GYj7DDGWnznv4Mr3QGQQE
 9pQdVL6MVzJt65dqCIDpgILoUY/9nrw3wKo7D6hGG86R1QM10X2UwFhrgTrbsJPY
 vqArBeM+MBhFd24gaWnBhNqsIvBrkB80OAIr4UY0F5vPofahikX2iJkBdjJNZa4Q
 ==
X-ME-Sender: <xms:e2iHYJgDCMC8CeDVvQQ2QI8HhYSYaOGrtmylt6S2GQGZe9nBlGtKzg>
 <xme:e2iHYOAzul4tltfmGaJv_Gc9s_amIVKZY7QlyhIzD659_7Ok-6aywskxQ3JfKDnvb
 T69RfwPrXfWZfOi5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeelkefgffekteejhfdtfffgve
 ejvedvvdevgeduudffuddukefhhfekvefgiedtffenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:e2iHYJGuw6mQ01x4FWNTUu-mu_4w2EXBpODQuI9HaIS9ruHnsXkjUw>
 <xmx:e2iHYOQFtwfKxfYatOgR9pYQxmiFYiQm7NsWjnc_zWBw9uAZyghAVQ>
 <xmx:e2iHYGwerBrTSt3rY1ow_aea86k49KLuWjgqTlEdhitI-txPo40IXw>
 <xmx:fGiHYF9JjDSqQEJUT0ycwhb4coVjkqmj1GhzHFjrUHGoTCl0u0fQqA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D2CD9A00079; Mon, 26 Apr 2021 21:27:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <cc621c9d-816a-4686-8ceb-42864486bf99@www.fastmail.com>
In-Reply-To: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
Date: Tue, 27 Apr 2021 10:57:03 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
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



On Sat, 24 Apr 2021, at 07:52, Jason Ling wrote:
> Hi all,
> 
> What started as an attempt to create a simple command line tool to 
> perform pmbus device upgrades over i2c has turned into the start of a 
> user-space i2c library (with some pmbus support).
> 
> I've already reused this library in some other obmc applications and 
> it's been fairly well unit-tested. It also comes with all the public 
> interfaces mocked (so you can unit test your own code).
> 
> The idea is that more and more classes get added that will support 
> different pmbus devices. 
> General idea is that each device that gets support can expose methods 
> to allow device upgrade, black box retrieval, etc..
> 
> Anyways, wanted to gauge community interest in this so I can determine 
> how motivated I should be to upstream it.

How does this interact with the efforts in the phosphor-power repo?

https://github.com/openbmc/phosphor-power

Can we exploit your library there? Can your library utilise work from 
phosphor-power?

Andrew
