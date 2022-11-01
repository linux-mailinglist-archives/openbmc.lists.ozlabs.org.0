Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CC615273
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 20:40:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N20jH61xcz3cCR
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 06:40:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=nkZKZzj3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pixQeqtB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=nkZKZzj3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pixQeqtB;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N20hh6LCTz2xfS
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 06:39:32 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 6CC3B3200951;
	Tue,  1 Nov 2022 15:39:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 01 Nov 2022 15:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1667331570; x=
	1667417970; bh=pKX3Li0UXoLCS9ftlIiCb1hKWVq0TZS90IFtI8Z2il4=; b=n
	kZKZzj3oa6nF6IclKh4bGKcXteY9fTJ4WZepW3lcL8wl3Eo9I7fCeHloh71SHL62
	yD7h/CcuThRO3MPOOM5y9Bj/XuaEwfLGyypLZw1eAx2az9mHE+y0Ghj7UAGuwabr
	b5yMk84nwcRg/Bkbsm1VEt6qr/R7Xz3vj2oS+Ri5WB1qX8Cb5qCg6RcFr6qCw4HX
	fCgneZGqosdBMtMdT+EHl8b5LG6ULYvktbCcjVRrAoVAYBqYSMUxEv7MgnSOirnP
	OhvksY/5YQnbH5OobqjcVSyJqXYes9yir+ZlI4n21ZmGJL4Sb4Lhkxp7VUMzyxEN
	XsC2c0TA0idCLPzEBtmIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667331570; x=1667417970; bh=pKX3Li0UXoLCS9ftlIiCb1hKWVq0
	TZS90IFtI8Z2il4=; b=pixQeqtBHCEwFR3Tbcrhsnu76oVOKSwt39t+/EXIqQhC
	Yrv1/NV6In5YTGoGieBB/7bE9xVirAiSsejuy67hMBI62w3fUk8lqABWLTqNhf0i
	2aB8JQmLQBKDKKF/eQqiEQL8VUfh6B6H/IueUdoPg2NrwUIp9bm/x8dxeGaWQO3W
	hf4ja0uDsFD1x2YGg11UIHnyt8HjpFr1DQkFNpA/eAWcjsFbkjuXZLFWM/h9uPj4
	4qId22DEepQ0gjBZG+Pr4XRa8R4F79nMfijDllB1CuKDZPGBm87Vr5SqfAM4EA7X
	LEYFiD6IXH5lwADcdSZFrlbdL5g0NiLnoOWMAiV68g==
X-ME-Sender: <xms:8XVhYzLKZ8jXTJ5omFNTQNdN15Ka5T0_aF2tCzJm-qd6JdsA9XajCg>
    <xme:8XVhY3If6J2lp717WmaZYfltgJ3UUPzIP_ASGAWc7gYt1XI85bHSNMDCq_i025vpS
    UukFxDk9x0FCdqJ9EA>
X-ME-Received: <xmr:8XVhY7snjpiYU2jyp96nIwYY-jvYyoHCJvxlm_TP1KhneuxTfIPW05Wh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgdduvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeffhedtgefhjefggeelffdtkeekueefveevteejleej
    ieduheevjedufeetvdehheenucffohhmrghinhepghhoohhglhgvshhouhhrtggvrdgtoh
    hmpdgtohhnfhhighdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:8XVhY8ZYgLsRUs7ZKKaotjIh3vp9EQU5rvEdmjfObM-fGuN7FOmHNw>
    <xmx:8XVhY6Z0M-zasxAcBxNB6OThztC37gZEdiIJLqgt-UBAI32LYEVI4g>
    <xmx:8XVhYwBrpMoghnmIzGGsxLi0ASTLaougYBJ1MeivHjho4pQYxnc6ZA>
    <xmx:8nVhYzBhVABS5X-1eSwFDQ1nvBK5aVyujd6NF2rkgqY6bQwIvFIshg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 15:39:29 -0400 (EDT)
Date: Tue, 1 Nov 2022 15:39:27 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <20221101193927.gh4cq6qqy4qbqtwd@cheese>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
 <Y2FrJf0aT92bxM6E@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2FrJf0aT92bxM6E@heinlein.taila677.ts.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 01, 2022 at 01:53:25PM -0500, Patrick Williams wrote:
>On Mon, Oct 31, 2022 at 07:05:52PM -0400, Brad Bishop wrote:
>> OpenBMC maintainers
>>
>> This coming Sunday, November 6th, absent any feedback here I am planning
>> on:
>>
>> 1 - Removing admin repository access by <xyz>-maintainers groups from
>> all projects on Github that use the OpenBMC Gerrit instance for peer
>> review (no change for projects that do not use the Gerrit instance like
>> the kernel, u-boot, or qemu).
>> 2 - Copying the submit prolog rules from the openbmc/openbmc Gerrit
>> project to the openbmc-all-repos Gerrit project.
>>
>> Impacts to maintainers are:
>>
>> 1 - Members of <xyz-maintainers> groups will no longer have any special
>> access to the GitHub repository (such as push, force-push).  If anyone
>> requires such access, please respond to this email.
>>
>> 2 - You may now delegate the Gerrit OWNER role via the OWNERS file in
>> your project, as supported by the OWNERS plugin documented here:
>> https://gerrit.googlesource.com/plugins/owners/+/refs/heads/master/config.md
>
>In order to accomplish #2, I thought previously investigations yielded
>that everyone needed to be added to have +2 (even thought it was
>meaningless unless also confirmed by the OWNER plugin).  Has this been
>resolved?  Are we going to move everyone to have this?  Or are we going
>to have a global "maintainers group" with +2 abilities?

Thanks Patrick, yes we've overlooked some things.

(Most of) the existing per-project maintainer groups in GitHub already 
have the project owner permission on the corresponding Gerrit project.  
I think the way I thought this would work was that new maintainers being 
added in the OWNERS files would get added to the <xyz>-maintainers group 
and thus get +2, but I've come to realize that isn't what we want.

If I ignore GitHub and Gerrit project owners for a minute, I think the 
ideal setup would be that everyone can leave a +1.  In order for a 
change to be approved, all OWNERS of files touched must give a +1.  We 
completely do away with +2.  No special groups or per-project access 
rules are required for this.

In the proposal I said we'd remove special access to the GitHub 
projects.  So if there are still no objections to that, I think the only 
remaining thing we need to consider is how to do the Gerrit project 
owner permission.  Today, those are done with the <xyz>-maintainer 
groups in GitHub, and per-Gerrit-project access rules assigning the 
owner permission to the GitHub group.  We can continue to do that, but 
it is very appealing to me to just scrap all the groups and Gerrit 
project specific access rules if that is a possibility.  Doing that 
means maintainers today lose their "project owner" access to their 
Gerrit project.  I don't know if anyone is actually using that access.
