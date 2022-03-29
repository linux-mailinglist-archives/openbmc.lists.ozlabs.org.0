Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F864EABAB
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 12:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSRHh6GKDz2xrS
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 21:53:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=GRLzo0/x;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NHDZVl8m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GRLzo0/x; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NHDZVl8m; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSRHB3dPXz2xf9
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 21:52:53 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 11F5C5C0124;
 Tue, 29 Mar 2022 06:52:51 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 06:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=UC74Qk73YScwg41rxDj4zpJhVYqQluSdCK2dgK
 U9rAs=; b=GRLzo0/xWTNwmj3DltjK71S0F7LRZnVbNJK81MsfAIfkHw4ZE1MTMf
 7FZuNRVyEd7ITMKmz16D3+aksfVGAYceqBS5183EfUJF9YFhRnsrGZVROj8AW8QO
 inCxLIK3Xe0x2+ilfIarRwaLX3t48y+/twP5vcY6QJMjhu87TFf79i50nvL4BF/T
 hF0mmx3fl8iEcwy5fWWUWNsUWVEd1nVIB4DFnxxSZwzMshLlVGmI0aJHYCGi1SbC
 oWAU5QuSIvOerz9AHEsaom5mWFVmo9FAxRwP3aYheZfMJpq6f/AO8S/ND0brukNO
 f+GPiUQ1vYNAvjO8DJHEq3xn/LD5bFcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UC74Qk73YScwg41rx
 Dj4zpJhVYqQluSdCK2dgKU9rAs=; b=NHDZVl8mJ6lZhvr2+YFykWvcOQRieK6n6
 Uj6nM11hSqgoKwjLnKLtNWK5/JzE9T9TfgrbKwXfe2DwbkLuSZZeltDOQ9AqFaUr
 rqMT8aQDQUbr/u+GQMgwYl40E7G/e9WSN8jTh+LXXXked27K4Fwz6+wOx/yfPRlz
 6coNFosZV93mGaALabxaA9Ky1eCg3UngTOGtuzlu1Eu5ENUI6ZWpozevhHoKUlhI
 sHhpSsYxkr3K1mh1tbAr6ZdJj6RBj8I7bpS5qlVZX4kJeGAPbXsHp/MjpNkdPdM4
 8iNTkn79XYWt0ejlCeoY0gKJMvJE6C0s9S8Hqxc/iE4M/pb8/+bNg==
X-ME-Sender: <xms:AuVCYrROFsx3UG7xf42E_hYyWwgOt-si62ypFYNNNEzvobkhbFkEyQ>
 <xme:AuVCYsxWG95anJ_HlWO9kZ3UOfMw1AO9Jxhif4Oz-Vvm5zoDYzhQOFvm5P1kxM1KN
 qQSnaKPyOM6hxjWeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:AuVCYg2VDwWwLoW4Ia2wuReHfQUfemeahHxBsjX7p_PwyEkPqk6-NA>
 <xmx:AuVCYrCQaxo1NrTsR-0Gtd3gw-siN8d-4P1p80-D1aJZVOajnlWlvg>
 <xmx:AuVCYkh_TiKuELr41MXrDuKMjkE3wCd8Nmczj4o9tXaKMfXAIFDwCg>
 <xmx:A-VCYseG8OunM2W7naPTiLsceYsKxaf6if_9JzNPSTDRKVmw3Ti7UA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8FAB3F6043F; Tue, 29 Mar 2022 06:52:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <5ff7a5e4-1c8d-4707-906f-efb3b40b8d48@www.fastmail.com>
In-Reply-To: <YkKYdecCGm4vGMUa@heinlein>
References: <4bc2b30d-b335-4457-9601-9c7226d6c656@www.fastmail.com>
 <YkKYdecCGm4vGMUa@heinlein>
Date: Tue, 29 Mar 2022 21:22:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Defining the behaviour of code formatting in openbmc-build-scripts
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
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 jiaqing.zhao@intel.com, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 29 Mar 2022, at 15:56, Patrick Williams wrote:
> On Tue, Mar 29, 2022 at 12:36:33PM +1030, Andrew Jeffery wrote:
>> ## The problem
>> 
>> "Like all Vogon ships, it looked as if it had been not so much designed, as
>> congealed." - Douglas Adams, The Salmon of Doubt
>> 
>> Code formatting support in openbmc-build-scripts has evolved over time and
>> no-one has ever written down what we actually want. The lack of concrete
>> requirements has lead to an counter-intuitive and convoluted implementation
>> that has ended in some repositories (e.g. entity-manager) not having their code
>> formatted as expected.
>
> I entirely agree that this is ultimately the problem.  The code has
> evolved as people add new checks and it has a lot of looking for magic
> files to make determinations on what to do.  Unless you know all the
> knobs it's hard to discover what is even possible.

Right.

>
>> Code formatting support in openbmc-build-scripts began with an implementation
>> of 1. However, along the way we introduced the phosphor-mboxd repository which
>> due to some unfortunate history has a mixed C and C++ codebase. The C code is
>> written in kernel style, while it was desired that the C++ be written in
>> OpenBMC style.
>
> Do we still have this situation?  (I think this repo is now hiomap which
> does seem to have two different clang style files).  Can we just do away
> with the "C code should be written in a kernel style" and use the same
> format between all the userspace code?

This was just some context for what we have, I wasn't looking to solve 
this particular problem, so I'm going to leave this discussion for 
another time.

>
>> At the time the problem arose, clang-format had two issues:
>> 
>> a. It treats C and C++ as the same language, and so maintaining a code
>>    formatting split across those language boundaries requires two separate
>>    clang-format configuration files
>> 
>> b. clang-format's -style=file historically required that the style file in
>>    question be called ".clang-format"
>
> I believe (a.) is still the case but not (b.). 

Yep.

> We could add yet another
> special case to detect the two .clang-format files.

Let's try to avoid this.

>
>> Hence, we support 1, 2 and 4, but not (yet) 3.
>> ## Proposal
>> 
>> I don't really have one. Does anyone have thoughts on how we differentiate
>> between cases 3 and 4? Use different file names? Invoke the script and ask it
>> what it expects?
>
> I'm somewhat surprised still that the difference between 3/4 is hard to
> detect.  Is hiomap the only repository expecting behavior 4?

I don't know, but I'm not sure it matters.

>
> In my opinion if you have a .clang-format, we should run clang-format; if we
> don't find .clang-format, we should not run clang-format.  And that
> should go for any formatting tool.

I think this is the crux of it.

>  I believe we should always treat the
> `format-code[.sh]` as yet-another-formatting-option and run it in
> addition to everything else that we discover.

Thanks for the clarity here. I kinda got through figuring out what had 
happened and ran out of energy to think about neat ways to resolve it.

>
> There has been talk previously about making something like
> `.openbmc/config.json` as a further configuration file where we could
> enable / disable all these check.  I think it would be worthwhile as a
> way to eliminate many of the "search for special file X" checks we have
> where we simply touch an empty file, but I suspect we really shouldn't
> be using the "touch a magic empty file" mechanism anyhow.

This is related but is starting to feel a little tangential. I think we 
can get away without trying to switch things to a json config for now?

Thanks for the feedback. Should I push a patch to capture this as a 
design doc?

Andrew
