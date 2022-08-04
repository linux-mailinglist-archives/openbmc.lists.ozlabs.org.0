Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FA3589659
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 05:02:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lytn23Jfgz305X
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 13:02:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=OoeHVoe9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zppPlkgL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=OoeHVoe9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zppPlkgL;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lytmb48Ncz2xJ4
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 13:01:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1B6F832009A8;
	Wed,  3 Aug 2022 23:01:45 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 03 Aug 2022 23:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659582104; x=
	1659668504; bh=zNPYYYEQlPQjRZR91yNvCCEa75BR0e4f6HzKUqyDa98=; b=O
	oeHVoe9Rsj8Q+1pFOu8c912p7HrJauTdVr19DduKbWYVmwNhllgGnoyXjaVpPAOa
	SnD6J1fp2YboO5NqkEtEFor9YBTBgTemgDx0fkD9KrjmUKThF0JQtw861aev/oCJ
	AFYThkEPkMAFAAqBty/EdYbpNsIW/rs+/OaEIYgKgL4QFC6RBpiQY3sO3Vy2pZKA
	yQyHaXYn5MNUIRUTCnj8ieQ+088rQByEoluK2tz1LjxVRhpSccALtmq7Dyec9P06
	GQXWhXOWG9NOyUcTqb/mcOnpTXae2Ni3Hgk2K6KWa8YLPhPz47SS9Ee3s0dt/vo2
	KpV/ZxZRx/9XTSJhw9gQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1659582104; x=1659668504; bh=z
	NPYYYEQlPQjRZR91yNvCCEa75BR0e4f6HzKUqyDa98=; b=zppPlkgLzyeJg0PJG
	/WDJnbs0DkDDw/rdhzHzviuktdY/tTFGom6D3kNQ7hZ7/QKnSp6qC3NJEu3V3NWU
	qi2NMSPClgkBCeoW/jjaYhvsI4uu856dm78ELFyBvyc0IVUwC99TRRKZXi24ALEu
	LSXRUV12LpZ8WPx9jWBduLFtVi0uo03wVgJaLabvtR6d+5wZRKdMvQfrnOH90V+A
	wQurWivD7bj/tmAPq1g7FCX+ABsb37XfnMGoSOUz2zds77CryE3HNHJT3vpseX4y
	CudcKs2ldRfiBhXiLktLvgYWm9FQD1e7ZQJriPKx7MSoH7sIdLoJm9P+LcVV5INJ
	Cyp0g==
X-ME-Sender: <xms:lzbrYiJqu_iGapD_SJrk2bNz15U_kSxATTKyqzLogTXtLoYcjFHy3Q>
    <xme:lzbrYqLYdOTxWYgMw4F-1TzEXIzQZtZWPoYCiJeTW9EE2M4mDhreZ3jhMy7de_Sp-
    BcwSwkZQFUlqQLwBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeevieefueejgfdufefgleejtdejheevvddthfdtveegieehheetlefg
    ffejtdeuteenucffohhmrghinhepughishgtohhrugdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
    rghu
X-ME-Proxy: <xmx:lzbrYishGmnKTgm7gPiSpaVzNOANBdrQLIJaF_TP1B_fT50h7hFvUA>
    <xmx:lzbrYnYtdFwgem45JXcIG-k9AGb7dx8RUQxXBQV0WQZwtzj--FWYEw>
    <xmx:lzbrYpYjWze0n5D4JPtqSzj4P2ZaqDwKfM3-XMLBxg8GKJG8G0HbtA>
    <xmx:mDbrYr29ymJk6XZ9KYqt-OPA1coMHPjWX0u1F9NuRAhoNe183Wf_xw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CBDF6170007E; Wed,  3 Aug 2022 23:01:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <9922163c-3d64-48ff-a808-b4b8dcfcb32d@www.fastmail.com>
In-Reply-To: <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
References: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
 <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
Date: Thu, 04 Aug 2022 12:31:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday August 3 - results
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Thu, 4 Aug 2022, at 04:35, Joseph Reynolds wrote:
>
> 4 Consider migrating this meeting to Discord > Voice channels >=C2=A0 =
Security.
>
> DISCUSSION:
>
> Three responses were: Why?=C2=A0 Seems okay.=C2=A0 Don=E2=80=99t like =
Discord.
>
> Access question: Can a web client access the discord voice session?

Yes, the web client can access voice sessions. I use the web client=20
exclusively on my work machine.

>
> Also, let=E2=80=99s use the discord #security channel.
>
> The direct link is=20
> https://discord.com/channels/775381525260664832/1002376534377635860=20
> <https://discord.com/channels/775381525260664832/1002376534377635860>

So from this the outcome of the discussion is a bit unclear.

For better or worse, discord is where a lot of OpenBMC activity takes=20
place. I think something fundamental that the security working group=20
needs to develop is better traction with the OpenBMC (maintainer)=20
community. Problems that are discussed by the Security WG often have=20
direct impacts on maintenance of the software that makes up OpenBMC,=20
most of which the WG attendees are not responsible for.

Migrating the security WG calls to discord will increase regularity of=20
use among WG attendees and hopefully increase interaction with other=20
parts of the OpenBMC community where they need influence.

We already hold weekly Technical Oversight Forum meetings and=20
fortnightly PMCI get-togethers on the respective discord voice channels=20
and it works very well.

IMO Joseph, you should just start hosting the calls on discord. People=20
will move to it if they wish to continue to attend.

Cheers,

Andrew
