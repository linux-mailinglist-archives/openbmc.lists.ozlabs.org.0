Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0361533B
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 21:26:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N21kk3qspz3cKb
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 07:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=aCg/1wQy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B775qILK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=aCg/1wQy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B775qILK;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N21k86fQ7z2yy7
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 07:25:52 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 33345320095D
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 16:25:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 01 Nov 2022 16:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to; s=fm1; t=1667334348; x=
	1667420748; bh=gCrK0HpvxyI8fnyZvFMIPKftzG4zx7+s4VILqIvH374=; b=a
	Cg/1wQyzbC9zn4CIBLpkNIywp+/9At3PcKK/MSK7NSLAreisXbvb8uHvb+aQ9Jx0
	bBsNwjCPFsoktbH/kJ327/kVQY8yJl6Hb8BEmlSq1g/VJp/r956e0/3O8PiT6TPn
	A35gFC41JDKNq92maeWDg3gHKCGotJagW3ouFSs1BI6Wze8Mid/We1dZZk508a6S
	84WIUeP0aITak1CiQiWSID7JLF19N3X3OF+vj/OanfM8H9Rn0x0V/nBHJaJQSnUm
	/68hPWB8LoGK+OFr1bJbfcNtxVlVnhZiKaJYBsqUErNYVkvP3HCK3RDDBxMnhfae
	dP1qziOybJlofXh6K7zDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667334348; x=1667420748; bh=gCrK0HpvxyI8fnyZvFMIPKftzG4z
	x7+s4VILqIvH374=; b=B775qILKtAaCu6j5G+BQrgEzimtL7Iq+pL5IWyo36yVe
	bhn5cGmRvEInzbfYB8iY4jRlbXIb+6jDo6uSbyHqUy4p9xBExtPvo8omR5s9CBkU
	RIpq7OB9pDX5QusDFZXgZ4L20Uapwov1YZ4ON2X5iOkQ4l8JF9F/KH1n2ks1+cgD
	ZHXak+A1ezCWoFXn7KTSyh6zev5CKQwdp8IVupqzGPe74Kv+347ymYyH9dyNaVPb
	hzih/x9SxDfDjMn9d4EhCFB2m94E58017zm4Ir9EkjPcqQJLvXtIZDtJM1edT9tA
	4YMJQCvwW/XKwwZD3BVVGAqeRFzaKt5+dVchHRwLGA==
X-ME-Sender: <xms:zIBhYxV5Mmu-SIoJN8t-brcG4CImt2Z--qGNADjX0RGFtdw9JLuZVA>
    <xme:zIBhYxmImBoqKoL9ouS4W3vQCfaxie7wxrEooYItSDgrtDHpiae0dev2eqRW8oNxC
    4D3lZkphOTh2hUGJoM>
X-ME-Received: <xmr:zIBhY9bApHmQYzEQlRUJ_NzJ9OLFq8eJRQogIC3AUnCWdwuuQi6cbtwm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgddufeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnecujfgurhepfffhvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepjeegheelvdektdffjedvuddvgeelkeejhedvffel
    teeiuefhudevvefflefgleevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:zIBhY0XLkW7Jgvh8AwbRnWA86LGcol45yDT98vM82TnlyeBWPUHtIA>
    <xmx:zIBhY7lOk4ZwXnuagp0WRgJpld4Prr5Y1MBtOj43BsvFt71op9E3fA>
    <xmx:zIBhYxdX5SbI0bJPBgEHFhoN_hhhuMw2pbU8-KK2G8dv7RxHb1Q2Qw>
    <xmx:zIBhYxRFkszr98r8dBPqwaDD6lJkE3WSr3yqqYYMs_trYFXX4VDRjw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 1 Nov 2022 16:25:48 -0400 (EDT)
Date: Tue, 1 Nov 2022 16:25:46 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <20221101202546.j6lsqzrecrelucxz@cheese>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
 <Y2FrJf0aT92bxM6E@heinlein.taila677.ts.net>
 <20221101193927.gh4cq6qqy4qbqtwd@cheese>
 <Y2F8Hue7ngTNiDkY@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2F8Hue7ngTNiDkY@heinlein.taila677.ts.net>
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

On Tue, Nov 01, 2022 at 03:05:50PM -0500, Patrick Williams wrote:
>On Tue, Nov 01, 2022 at 03:39:27PM -0400, Brad Bishop wrote:
>
>> If I ignore GitHub and Gerrit project owners for a minute, I think the
>> ideal setup would be that everyone can leave a +1.  In order for a
>> change to be approved, all OWNERS of files touched must give a +1.  We
>> completely do away with +2.  No special groups or per-project access
>> rules are required for this.
>
>I'm not sure.
>
>a. Generally we don't want to wait for all OWNERS to give feedback.
>
>b. We typically want every touched file to have an owner to have given
>   "thumbs up".  ie, there has been a coverage by at least one reviewer.
>
>Maybe by "all OWNERS of files touched must give a +1" you meant (b)?

Yes I meant b.  Thanks for clarifying.

>I do see some value in differentiating between +1 and +2.  When I am a
>maintainer of a project, I'll sometimes review a commit and give it a +1
>in order to give indication that "this seems fine to me but I'd like to

I'm fairly sure I recall seeing comments like: what does it mean when a 
maintainer gives a +1 so I'd guess this is a source of confusion for 
people.  Maybe you could copy/paste a canned response in this
situation?

>see some more feedback on it".  Often I will suggest the people I'm
>looking to get deeper feedback from.  I have a Gerrit query that I check
>a few times a week ("status open label:Code-Review=+1,me") that I can
>use to check back if those deeper-reviewers never get to it so that the
>commit doesn't stall out.

Ok.. well, yeah if you are using +1/+2 in automation/queries then yeah 
my canned response idea doesn't hold up.
