Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C467A33E1C7
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 23:58:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0TH45jqvz30QZ
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 09:58:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=EWmR7xSZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hlRVOa2x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=EWmR7xSZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hlRVOa2x; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0TGm6PMbz301l
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 09:58:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 65A595C00A8;
 Tue, 16 Mar 2021 18:58:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 16 Mar 2021 18:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=opOPH9Nrc0cbEpchECGp0CoINMWJmYu
 /3173y3YZr/I=; b=EWmR7xSZarTr5b4ZJ06jgsxk0+3ZfN7sgdLcznuS52g7wHJ
 qAbHVw5ICmD+sNoX5xHjuMnrPBGnkFVfVyWBfGbD4qJt0K4mTEBOGsr51QpzTSGG
 YYCOhvallMRJc2TGJWciO44wBTpiYkFgB2yYk7t+n3zVPP6wQ5UZbHQ93NExjsvF
 PHLgfcVdZRW2txvTQ+QK8gI+Tkeurt6AQ8QE/x71wy0RUA2GgKBZ5p88rVF0UWbh
 dPcavlqj0GapifkWSzTmGHCTGP4929G5PwAWn6W6a7aZgpNN65N+SEIN4DdJbufA
 VwX/sdwxvhFVX8BjWj5g1YLpfPoVJrwoOhgnL6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=opOPH9
 Nrc0cbEpchECGp0CoINMWJmYu/3173y3YZr/I=; b=hlRVOa2xBk3y+NUHBmFhZT
 lcj2RS34ADLKCTucwYFb2etOwnimJL+0RlcqIIeIATOSy6A676kmbjMzsJo+gume
 9QRD1LCaB1YxnD8EejxdT5N7LV7jR6rn0YHQqDjyw5zeyTlT4kQd71RDFqWbQ53/
 Feoj9W+glAL5G/Zs47qMQVAiLTKx5Liz9iQE43Yck9qpwrO3629Ck75bjf0byhjb
 xMx2m2UB2EWLhp6ubfVaBapVlhryXCbiS/Uml3PbNhgWQkj8Re+D608EiD4Io3Xx
 WbPfuEC8AeTlhJ1zh+Y8RBMSqGsrtnhzdy6QL9Zvd7gA9EINnfanyWGEpE1u7b8Q
 ==
X-ME-Sender: <xms:CjhRYDrYTlPG1_TRczvorlPEYSqQkXHmTKtmI07uP4ussi5hNk9YZw>
 <xme:CjhRYNpIRDh0ZkWyVzVCxj_GwseKM82AfoHu6p4qkM5dX9Ha1xwd3scNNFODYK3Rj
 RQu5x5rtgo7_07kuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeffecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughrvgif
 ucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtth
 gvrhhnpeffgfdvueeigfeftefgteejfeegvdeltdehudektefhfeduveeludelvdejieef
 ueenucffohhmrghinheprggsohhuthgrmhgriihonhdrtghomhdpkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghn
 ughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:CjhRYAM533pITrKA7iQAuYIQ96Q8EmNO-RML4Lxupk5giI5DdNsf6w>
 <xmx:CjhRYG5k60tyRwF027ox_tKcyAJbzO4h7TQtdMRnvOqe-W2jbBGQfA>
 <xmx:CjhRYC5bIAWbGeUqjK-5P7_nRXPkzYcCG97oOMsVQntT9vPFf-UDmg>
 <xmx:DDhRYCFgPj7KJchHi78uciALHvapTe4oVTUqxuqduM35VPIkrfD4iQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C285EA00073; Tue, 16 Mar 2021 18:58:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <de103327-1b43-44f3-abbf-34aa9fd3ca27@www.fastmail.com>
In-Reply-To: <OFAC3A0AF2.EC072501-ON0025869A.00702F91-0025869A.0071CC00@notes.na.collabserv.com>
References: <OF9A0016A1.FD9B7171-ON0025868F.007B5317-0025868F.007B531B@LocalDomain>
 <CACPK8XdmbXK4CVfydO5yq4Qka--wT1fR-vuqFKD_rg29fAquMA@mail.gmail.com>
 <OFC6D46F57.69575CC5-ON00258681.0002C252-88258681.0004EA2C@notes.na.collabserv.com>
 <OFAC3A0AF2.EC072501-ON0025869A.00702F91-0025869A.0071CC00@notes.na.collabserv.com>
Date: Wed, 17 Mar 2021 09:27:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: My kexec test patches for OpenBMC
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
Cc: Andrew Jeffery <andrewrj@au1.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 17 Mar 2021, at 07:12, Bruce Mitchell wrote:
> 
> 
> -----Bruce Mitchell/US/IBM wrote: -----

> >Hello Joel,
> >
> >Thanks again for your advice and sharing your wisdom.
> >I am being urged by our manager to get this up-streamed
> >sooner rather than later. How can I best work with the
> >system to make this happen?
> >
> >Thank you!
> >
> >--
> >Bruce
> >
> >
> 
> Hi Joel and Andrew,
> 
> I cannot find any response to this thread in my inbox,
> however I may still have missed it.

I don't think you missed anything :)

> 
> "Joel's kernel changes are similar to what I had done. Since you know
> the community better than I do, I propose submitting your changes.
> I can do the labor, but want you to get the credit. How would you
> like me to proceed?"

Well, you've both ended up with the same implementation as far as I'm 
aware? I don't think it matters too much which way the patches go in 
terms of credit. Let's not hold the show up on something like that. 
Joel will need to review your patches on the upstream list anyway, so 
you might as well just post them rather than wait on getting 
permission. "Bias for action" from Amazon's leadership principles is a 
helpful mindset[1] (and it's worth reading the others).

[1] https://www.aboutamazon.com/about-us/leadership-principles

Before sending your patches, please read the following and make sure 
you are confident your work satisfies all the listed requirements:

1. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v5.11
2. https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submit-checklist.rst?h=v5.11

The very minimum is that ./scripts/checkpatch.pl says your patches are 
clean and that you Cc the appropriate maintainers as listed by 
./scripts/get_maintainer.pl.

The process of emailing patches is terrible, so if you have any 
questions about that please don't hesitate to ask.

Cheers,

Andrew
