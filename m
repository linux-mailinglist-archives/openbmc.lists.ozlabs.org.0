Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27126459858
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 00:21:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyjvT6h93z2ybH
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 10:21:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Wdf7llY0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OVEu+mjv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Wdf7llY0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OVEu+mjv; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyjtz6MGqz2yLv
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 10:20:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 20E4A5C0093;
 Mon, 22 Nov 2021 18:20:55 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Mon, 22 Nov 2021 18:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PFAKb9u2kIZi8QiGsGeMMk/Cjlrvhif
 MsvcUce+sDU8=; b=Wdf7llY0ITSlrh167i4LTnek5z5LcAOgUzXck0Name2b2Z9
 mDxtclGkW7oryDkZwZA1Ik6h+aEOA7FcDO5/d8VR9ZAEIPddYtuY6ghAL5vw8gWq
 44b0pdV2heJYPVR5XHsErGGxRLq1Rc8Vj7U+9tUWt6sP0lf2eCBEDHtFbmZWh8ew
 48SYSQhhs8Mrzjgrm9GMR74eSuYPea1r/Aq+xL660KciC6tK+wk1vLZ4KgpCArMa
 8YQwBY4lUuYg7w669G38LzXPPny1hIDlQp6kZ9Kv3wmqS83TaEHQe7sCpczxV6hQ
 1kZP46XBPmCfVJxlDzhqa1UtKwwbpc0KP3ZbsJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PFAKb9
 u2kIZi8QiGsGeMMk/CjlrvhifMsvcUce+sDU8=; b=OVEu+mjvy2B5IexTh/jaVM
 FaQY5qwZCkfwy2gWiYsxa9qE90+kNGH7rQ7uQtqi00rT+ndSOKZ2h17RQgVheT8W
 b3b7fFjaG94aavLOCbLOt6tIb5Ak62IZbXgNtq8S+S9heDxy01/3RosWeHUo0Q9z
 fvuWPak+Bt19xtkxK2l4JxN5FuHAsLPhkOvYpOkcD7is/8fVAMswAse5/hmRpbTE
 guVXOwyWe1v/XeJj1QnKB3uRfCXg9o/n/dY0LFOdamsj9ZHy7L9bXlzzOroA2LVc
 +Gwx96PAwaiEofebpCRUnRUmPRNJWK3RhPtIn5/CgrYEUvHCpyVe7FtgTn3KhKrw
 ==
X-ME-Sender: <xms:1iWcYfTPZJwh2MnJKBPSpH44ndl9q_cA5UgELCqz34BT13KiuuJPKA>
 <xme:1iWcYQzfp75li0jr_85FbsfaaCcu238YCoHSMVBjlU9l2KCht_dcIrpA9fJ-cjoLm
 HmTA7d2SSjUOVWSVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeehgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepteefudehueeihffhgefhjeekveffjeej
 keehteevkeeghefhieeuvdfffefgjedtnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiipdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:1iWcYU0YT_5T-QAPXsaqIhoi8EemUtyDo4BzXbeNMoO0mcMKCv29tg>
 <xmx:1iWcYfDyYclmv7y09EAdgx7dzzqm_TnM3_2kacU2GRroZDaQAdBnsw>
 <xmx:1iWcYYjUexDccbqMUfNq3aaviWYoFYsPEbVboUe3SAIwjn5E0ZtR6g>
 <xmx:1yWcYbvqafXj5hOtcO1BeyEdZKt7YeaKBX8FoBnrN54r5-eMhd-HOg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D2286AC03DB; Mon, 22 Nov 2021 18:20:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <48d0cc9e-6ab6-4d94-a8aa-1be8b8c1f155@www.fastmail.com>
In-Reply-To: <YZvLdFJnQM+GB9yy@heinlein>
References: <CABoTLcRtPYy_Yim20FCcX6qS--t7KD81GOZyT9pKV8OwuhLPrg@mail.gmail.com>
 <YZvLdFJnQM+GB9yy@heinlein>
Date: Tue, 23 Nov 2021 09:50:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>, "Oskar Senft" <osk@google.com>
Subject: Re: Making obmc-console_git.bb more generic (again)?
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 23 Nov 2021, at 03:25, Patrick Williams wrote:
> On Wed, Nov 17, 2021 at 05:01:25PM -0500, Oskar Senft wrote:
>> Hi everyone
>> 
>> I noticed that as of
>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/30369 (aka
>> https://github.com/openbmc/openbmc/commit/abf95efe7c3a34cc2e5d7424abb59710fb4a1d4d),
>> obmc-console_git.bb assumes that we always want to use ttyVUART0.
>
> There was a push to move service files outside of the openbmc/openbmc repository
> and into the underlying repos.  Brad could comment on why as he was
> asking for it.
>
>> We used to have support for OBMC_CONSOLE_HOST_TTY and then create the
>> symlink /etc/obmc-console/server.${OBMC_CONSOLE_HOST_TTY}.conf as
>> needed.
>> 
>> From what I can tell, OBMC_CONSOLE_HOST_TTY is still used in quite a
>> few machine layers. Some of them (e.g. meta-amd and meta-facebook)
>> even went so far to replicate the previous behavior by deleting
>> /etc/obmc-console/server.VUART0.conf and then re-creating the correct
>> one.
>
> Speaking for the Facebook machines, we have some machines which use a different
> vTTY and we have other machines which manage multiple hosts and thus have
> multiple vTTYs.  We probably should have contributed code to pass the desired
> vTTY(s) as a meson-option.
>
>> Is this actually the expected behavior? Or was that just an oversight
>> in the commit?
>
> I think it was the "put the default/typical config into the repo and let
> everyone customize it otherwise if they need" approach.
>
>> I'd be happy to send a review request to make this generic again if
>> people agree. A bunch of follow-up commits could then remove the
>> duplicate code in individual machine layer overrides.
>
> I'd be thankful for this.  Please feel free to add me as a reviewer.

Yeah I'm not sure what happened here, whether that was something I did 
or if someone's made changes to the recipe since. When I added support 
for exposing multiple devices from the one BMC there were some 
complications around not breaking everyone vs having to modify every 
in-tree consumer. I didn't have the bandwidth or ability to test fixing 
all the platforms at the time so I put some work-arounds in the install 
phase of the obmc-console recipe. Maybe that broke things?

Anyway, please also CC me on cleanups.

Cheers,

Andrew
