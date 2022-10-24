Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382360B68D
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 21:04:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx4HR2nCHz3blw
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 06:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=rZC+Blqi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l2y8uJNc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=rZC+Blqi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l2y8uJNc;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx4Gn2hH8z2xJ8
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 06:03:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id D88EF580542;
	Mon, 24 Oct 2022 15:03:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 24 Oct 2022 15:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666638204; x=
	1666645404; bh=AFijP1r/R9SL1sOHlHDRFvPRP4zhbUWCXp0SD0g+VwQ=; b=r
	ZC+BlqiPPM4S25SXkOY9Pd8eHYXLNxlHwPJYunJFW11o2MmDWp+2dluzrraxkelB
	F+UvFKEP8WQnkv/Qz2QjYdkT2jDp8CX1HbYVDSsVCxi2s37MEEm8THmi6DGaepEU
	sVkyCdB1tRgFOcOeP6scaWbtbLdW+a41XyhhrNrvgwgl9ja5P79ivPIAtHnDAzRN
	K1jM6djUCngT1B1FkHrMcYSbjHwP8aFWXdPxtSn2i7UlVXsMtoi67csCdhDGzHta
	VS65yoSmxW1/yEVPlHz3a4T6k3e1hNPa/XtceMGB5GjbeAU5sLarkd2HbGuGmH5E
	1WJWogWqm0r3CGB57UrXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666638204; x=1666645404; bh=AFijP1r/R9SL1sOHlHDRFvPRP4zh
	bUWCXp0SD0g+VwQ=; b=l2y8uJNctLjUb6Mm1nI/rC1ld9LqP8BqmC6+87bg1h3t
	SYWJhYyhlLJGeZDa2VkGPAytNlCflifD7OyPYME8txImexoYL9lP4vS7PLOrTv96
	vT6FqhSEg1oxT0w7s9h6OrOu+rQFTR0WDc7lp8jhovxjmLAaQsIaHGrFS9WV/yqy
	Rz35o4eYIn7PleZDiZ6pTPEdKDM8ZSSuSslkyGM7cxcqkqmY/61M1Q3l5UQfctcr
	FE8RIOObrhZycnEFvy8Qdtn1Nh86pvb4Mk8jnxuBfrRnV1G4g9GKKYNWWAwrYePW
	Hs5dgF5RHWqSjQSje9nJ9K5O3OBu5rlAYB3sonXB4w==
X-ME-Sender: <xms:fOFWY-NOEUmudZMfffDMvmsSpgEY70mB-a21W4s2i3N7JFO_WwR7ow>
    <xme:fOFWY8-keITn_AxrpvSethb5-eQFzDdZHi8JA6X2wXShJzQkk9_lMTomXbdVCJHF2
    -c-7OtmOMPa5GfWg-M>
X-ME-Received: <xmr:fOFWY1R-pDPjWYP9nMdcp7dHnopGr_j0yBCfLdm_V6qe-LWCg-IiOt4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogfuphgrmhetlhhirghsqdhouhhtucdlhedttddmnecujfgurhepfffhvfevuffkfhgg
    tggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrug
    hlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhn
    peegteeuffegtefguefgtedtudfguddvudekhffftefffedvgeelvdeileetffduleenuc
    fuphgrmhetlhhirghspeeurhgrugcuuehishhhohhpnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqh
    huihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:fOFWY-ut3FiV--4NCxJicxvvkIEGiNASvcXR5Nl-2lBBEbOfyQDCvg>
    <xmx:fOFWY2fzHnX4DJVqeC8P4S1wPc0xglRQ11AdifK74Llo8_ZB7KSrvg>
    <xmx:fOFWYy3JtuLlFvo5dhH6J8OnU1ffzBfjkhkTjK0GH6xC3MHM6wHQrg>
    <xmx:fOFWY6FrxbcEBzBc3FwW28iYn4edTuX9LXbElJ5XzNjg9PxsO5eE5Q>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 15:03:24 -0400 (EDT)
Date: Mon, 24 Oct 2022 15:03:22 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Adding support for custom SEL records
Message-ID: <20221024190322.et5kn54vong3tn2v@cheese>
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com>
 <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com>
 <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is helpful, thanks Ed.

On Mon, Oct 24, 2022 at 10:59:51AM -0700, Ed Tanous wrote:
>From what I recall, the requirements were:
>- Ability to store 4000 logs in a rotating buffer (original desire was
>10,000, but 4000 was picked as a middle-ground that could be
>implemented).

A DBus object based implementation could meet this requirement, right?

>- Ability to log 100+ entries per second, including when buffers get
>overwritten.

I guess I would not be shocked if DBus objects + serialization might not 
be able to sustain this rate of incoming logs.  Maybe it depends on the 
filesystem or how the data is serialized in the filesystem.  The DBus 
approach creates many files.  Obviously the syslog approach is only 
using a couple of files.

Do you think this kind of requirement is typical?  Quoting Patrick from 
another thread here:

>don't think anyone is intending to create 10k events in the span of
>a minute

100/s is only 6k in a minute but that is getting pretty close...

>- (abstract) Log storage should be aware of hardware limitations (SPI
>flash cell write endurance) and allow writing N logs per minute for
>the lifetime of the machine without hardware failure.  (I forget the
>value of N).

Do you think the rsyslog implementation does better at this?  Why?

>- "ipmitool sensor list" should return the results from a full sel log
>in less than 1 second (renegotiated from 200ms, the faster the
>better).

Ok, again I would not be shocked if DBus objects weren't able to deliver 
on this.

>- The logging implementation should be able to support a well-formed,
>version controlled, Redfish MessageRegistry to the DMTF
>specifications.

Do you think a DBus object based implementation could meet this 
requirement?

>- The logging implementation should be able to implement a
>well-formed, stable, and ACID compliant IPMI SEL command
>implementation.

Do you think a DBus object based implementation could meet this 
requirement?

>
>I don't believe the current DBus implementation can meet the previous
>requirements, 

The motivation of my questions above is to understand which requirements 
cannot be met by something based on DBus objects.

Thanks,
brad
