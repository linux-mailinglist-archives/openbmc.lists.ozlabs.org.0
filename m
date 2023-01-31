Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E1682B21
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 12:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5j175wzMz3cMR
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 22:06:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IYiSewkC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=klHOgKMM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=IYiSewkC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=klHOgKMM;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5j0S495rz2xnK
	for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 22:06:14 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CED053200344;
	Tue, 31 Jan 2023 06:06:10 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 31 Jan 2023 06:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1675163170; x=
	1675249570; bh=tjQQBB/ux+eD7Ur8acH4g+kA22cIV4yzMroRJ/1BH/U=; b=I
	YiSewkClJXvL7079CotcJJ/6gB7ORFhXLiMe11QBua6vLaoVvo70pR9xe2scyLSZ
	NGLO8hcUbSeCdiBVOXATDbJwv4kv8TE0t8dZuIZUPpNKehCFJ7MWUWprTp7DxpAk
	82O5LXfre/uLsVyPyu16IcinG00LMqy0eUWZbM2v6zgJf2D0/LPzWRMCP6PFtBt2
	WsMzhBe19E1j9IDAhMX5ZTrwuxMQkP7fV7OXNLNf2k+4uxGb4pwKwXOH6894Vs6O
	njPBHzAHVi/CgmDkEuzgoP+fjnLOZFz6RvkawY1t3hd2aedXzveytiIcx+eebXCV
	LIVvrObkhFkMGE64JCBJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1675163170; x=1675249570; bh=t
	jQQBB/ux+eD7Ur8acH4g+kA22cIV4yzMroRJ/1BH/U=; b=klHOgKMMeanjpxG9I
	A7/O7Mm79c1GQj1/1GgSxKzxyDdsUBX7IWe6CbNRL+x1XQT0YyGXICL6O1ini6Yv
	yhYlPse02BnIzy5DXcC6XvNLTcygIqhnkS8TYDXsufUk2EDx0rBZpP7wK1XNwrj3
	xxI36fG9e1XPk/Wg4gQNNyLiW9vuRC+BPIu3tBUnZEpV1j72Hp+/nCJjukSPq2TE
	Tn7xC9G8AdJuuaKDyuK+UN4Y3k+Swp067EkzeznC5m0X12zDfC2L+Xr0QJfK4/rZ
	gs3c+VINrQFx/i/DZ+RVdmge5f3jGj2jEiFo78fBN4qAioZ7AYM6ux2EEo2evx9B
	iZT+w==
X-ME-Sender: <xms:IfbYY_SQlz-xS1LFRb9XpYIkYGyoHVUd8qUGTQx_6O6wC1Rx4FPABg>
    <xme:IfbYYwwMqsDW9A4fSrnBnUfEeYl_z4cp30E8FeG4BURPuzX1U9oqHi-VYhFKZtpov
    dUde1StnP5JUjAuDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefgedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeevueffudduudetteefiefgkeeileeuveeukeffiedvhfeftdelueef
    udeghfetueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhmvghmsggvrhhshhhiph
    dqrghnugdqvhhothhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IfbYY01BqknfKyYd1_qT8QFF1G61azBI9JVFgta7sxGGrOCI-XRevQ>
    <xmx:IfbYY_BnCJItBm87Q1yiwh9zBlFN92W_3kC2_lIEpQvCLkA9S8u7xA>
    <xmx:IfbYY4ileeh6Tw9dsnEa7_G1Zjn46hu0OzOVc0Qf86oV_i1AOGI1zw>
    <xmx:IvbYY2c05xSztGnnwaNxG4S4M8Qf1mEq0_K6ruKFYplHay0l_znFqw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B48871700093; Tue, 31 Jan 2023 06:06:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-106-gfe3ab13a96-fm-20230124.001-gfe3ab13a
Mime-Version: 1.0
Message-Id: <05b8ba19-c7b9-490c-861e-b81ec8600a3f@app.fastmail.com>
In-Reply-To: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
References: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
Date: Tue, 31 Jan 2023 21:35:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2023H1
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



On Tue, 31 Jan 2023, at 10:17, Patrick Williams wrote:
> Hello everyone,
>
> I'm behind at getting this email out.
>
> Per https://github.com/openbmc/docs/blob/master/tof/membership-and-vot=
ing.md,
> the schedule for TOF elections is suppose to be as follows:
>
>   * Jan 1st	- Developer contributions close for OpenBMC Development Co=
mmunity
>               membership eligibility (See =E2=80=9CMetrics=E2=80=9D).
>   * Jan 15th - Current TOF must publish a list of eligible voting memb=
ers.
>   * Jan 30th - Nominations (self or peer) for TOF seats must be sent t=
o the
>                mailing list.
>   * Jan 30th - Developers disputing membership eligibility must submit=
 a
>                petition request to the current TOF.
>   * Feb 15th - Current TOF must publish a final list of eligible votin=
g members
>                and upcoming candidates for TOF seats.
>   * March 1st - Election begins.
>   * March 7th - Election concludes.
>
> Since today is January 30th (in my part of the world) we are ~15 days
> behind.  The following will be the schedule for this half:
>
>   * Jan 30th - Current TOF must publish a list of eligible voting memb=
ers.
>   * Feb 15th - Nominations (self or peer) for TOF seats must be sent t=
o the
>                mailing list.
>   * Feb 15th - Developers disputing membership eligibility must submit=
 a
>                petition request to the current TOF.
>   * Feb 22st - Current TOF must publish a final list of eligible votin=
g members
>                and upcoming candidates for TOF seats.
>   * March 1st - Election begins.
>   * March 7th - Election concludes.
>
> The only real change here is that we will extend TOF membership petiti=
ons and
> TOF nominiations until Feb 15th.
>
> With that said...
>
> A. The current election roll-call is available at:
>         https://github.com/openbmc/tof-election/blob/main/2023H1/rollc=
all.json
>
> B. We have 4 members who's 1 year term has ended, which means there ar=
e 4
>    positions up for election.  These members have an ending term and m=
ay
>    be renominated:
>         * Andrew Jeffery
>         * Jason Bills
>         * Patrick Williams
>         * William Kennington
>
> C. Nominations for (B) may be sent to the mailing list by replying to
>    this email.  Only those eligible to vote may be nominated.

I'll also self-nominate to continue serving the community on the TOF.

Andrew
