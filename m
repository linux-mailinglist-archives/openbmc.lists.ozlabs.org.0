Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D361651C
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 15:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2TlW39xfz3cLX
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 01:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=Ajrl0zFg;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NAeUdtrg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=Ajrl0zFg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NAeUdtrg;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Tkp5dLBz2xks
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 01:28:01 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B59A25C01F3;
	Wed,  2 Nov 2022 10:27:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 02 Nov 2022 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1667399276; x=
	1667485676; bh=a1ndOBtqB9GQUBALY+7X2J15MhVNEg9cugm8ZALeGKQ=; b=A
	jrl0zFgahho8mDztG+qN4lYU7pJ60yonN0MovJNSLo6F2kt8KAKYJRkZ4yn+I4zH
	/v+e8hownZRs3CG6nuL8k5ckoYo7GaJpF+1euwKXMFZZOpcGhEz1asQnGYawAWBy
	2XBKGPOeoi6NcnoO/DE7SdFFKEx3FABppI4CbT8iIVc0ApP+C3cFv6XqQb0UJssU
	Ns6G9tkDBA7RRoPF8VvQty7jZAPHPjPMhEhIoxxfrMDHVI9VOhhaa9TwcfyEqZnr
	ClENhdKVyZkve3R4x0ymbeKOWxPmPAftEPynNzsSGGRpxRHdSGJPRQW+L2uM46u+
	eA19jFWJJbKU/N3qj3qrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667399276; x=1667485676; bh=a1ndOBtqB9GQUBALY+7X2J15MhVN
	Eg9cugm8ZALeGKQ=; b=NAeUdtrgRKKGa70aetoYBQ7FaYs2s/0G0BY3SxcvCsjJ
	CQbTmU5vaPMNvyQjBD2ytPeGrH/90Yu/GGpX6KH40wizbDZ4eQNsV6zb9uggYTgV
	tj7Q6VoGY5Bd2qaL7CLxRj5Skeo7+lWdwQgfN9QwmTh0JlOYEpkz53jcP7tfM9J5
	2YcTjfNploYIGQ+RiOo0qI1jxn/dHMnt3FqQ3E8ij6wFn5jNGxA7jhYaiyJTiFtd
	whkLRUhy3tmG8unV5+bFd/irgYM5wy1CFQGv341xf6+zad6B2kGtlVw+oUnHZtaR
	2aFCHT92NCh3HL7ZvS33JqZ0J5PHPpPBR4aMcxnSVg==
X-ME-Sender: <xms:bH5iY9lZL2CZjoyr8_bEyw5Yxk46hPBgK5pUhOdgG0y2LoCSdhU4YQ>
    <xme:bH5iY41T5Mi2xsYptAkGJMao04x9EhdyTekCSU5FP2uhotAf0pwnAY46vLy8YJVqP
    XqRoeWqDjb32MnPHFU>
X-ME-Received: <xmr:bH5iYzqZpO_La_Id4Siy0T4hJ2U0QZwDfoiRUiAeRvgzBfknshMZ_Pbb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepffehtdeghfejgfeglefftdekkeeufeevveetjeeljeei
    udehveejudeftedvheehnecuffhomhgrihhnpehgohhoghhlvghsohhurhgtvgdrtghomh
    dptghonhhfihhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:bH5iY9nFGr1sG3jPOiZgqVab92yU5QaF4CRg5WewTu7ECKOf6oEs2A>
    <xmx:bH5iY733dmBcDQ0aeFExRgK6Cty-tbFQCrz_sNlYYG0OJaBQGO3xtA>
    <xmx:bH5iY8vlXb6uNEnT-fRAddypVJlu9drirAl5Zl6T0_E9zK4xcR5pEQ>
    <xmx:bH5iY4_jEXPVxxVt8Sjosn9yTROcQH_49HQA8yFyeF8Pk3rW1dgQ2w>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 10:27:56 -0400 (EDT)
Date: Wed, 2 Nov 2022 10:27:54 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: project wide changes to maintainer ACLs
Message-ID: <20221102142754.ffnfusaxvlfldxjq@cheese>
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
>resolved?  Are we going to move everyone to have this?  

I think if everyone can give a +2, it will cause mild confusion.  People 
doing reviews will wonder why they can give a +1 or a +2 and wonder 
which one to pick.  Granted that in the end it doesn't matter what they 
pick, but avoiding the confusion provides a better experience with our 
project and that seems worthwhile.

Personally I would prefer the same simplicity for maintainers, but I 
don't maintain much code anymore so my opinion doesn't have to matter 
too much.

>Or are we going to have a global "maintainers group" with +2 abilities?

Let's do this.  I'll re-purpose the existing all-maintainers group.
That means any maintainer can give a +2 on any project.  I am hopeful 
noone gives a +2 on a project they aren't an owner on and cause more 
confusion for the patch submitter (does this mean my patch is approved?  
Why can't I submit it?) ...

There won't be any need for the per-repository maintainer groups 
anymore, so I will probably remove those at some point.  Any issues 
there?

I want to re-iterate that existing maintainers will lose some abilities 
with this transition; namely, any elevated access to the GitHub project 
and any elevated access to the Gerrit project other than the ability to 
approve a change (so no pushing, tagging, etc).  Anything beyond 
approving changes will require a Gerrit admin or GitHub organization 
owner).  If anyone thinks they need these permissions, please reply.

thanks,
brad
