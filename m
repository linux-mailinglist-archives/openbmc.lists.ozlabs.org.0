Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C2B3D877C
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 07:53:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZNBB3Lftz30HV
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 15:53:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=RTOu55Mh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EL69qTTf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=RTOu55Mh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EL69qTTf; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZN9t3V6Wz30BF
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 15:53:06 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 14C745C009E;
 Wed, 28 Jul 2021 01:53:04 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 28 Jul 2021 01:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=+KCyxvekm2BDJilantEwk5djAW+HMOD
 xUKP0ZiT7b5Q=; b=RTOu55MhIdFhoIHUsV2bY+Mcu1r+FS9dVknHQ8n7YtjV+aa
 AE1q7gbHRVmNjIVO8d0s/x07nBgDQIdyfRn9egxPREggkEBRFWFitfMYeKC3tChU
 3+bRNERnuyx4T8my36vo+MxSZ85JxIGnUjnBmDuypgkU1um0tguO3/rBTbTxpfUy
 gGjYoH05lTXBisNHhKQf9A2twRrqhoSYKgqqg9XUdpcW66l+jHrZvy2Ztrki6DBt
 Ovu+u9CG0vNY5Tpd6QsHmxAl9/vozBQ4Pxj6yyFyRLvS1Qoxd1O/C/7JRxjM+8lQ
 uibkCkbKUplsvakYw0t3tz8RGMJL/mFkOatnUWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+KCyxv
 ekm2BDJilantEwk5djAW+HMODxUKP0ZiT7b5Q=; b=EL69qTTfYiWwJkYGupL5po
 cUrpz5orDBKzsQUXTBgxUDpkrL8yQtKVEkpkgHsa8BiX3xCglv9mYcyhG0Kq3enX
 NaTeAkIpqnMvc4CJjXRcOIzvWV1z+MBhM1Ut7Q/5XEkXkDf7EwcsZgICQ1/70lLN
 aky8RutGsOpMj5MG9F9FfDKdzpglF9UM3Y/uglGZ7YdRowIx/bkMLejK9SlxWge9
 4esEZuqweleKJN6ab4rMS5FDMWjJ16j+EfNRyrBFfJhngSbVBXNqfubLkug/pEd7
 KHNe3BnaWguNPx2k91iD2Q//3ExsbmuusgAO9mP6q9NPpkZzwqXmd5DfktDtftrA
 ==
X-ME-Sender: <xms:v_AAYf1QUySAcSzn1aTu710vRzOVO3v9jgHf0KllrTNYlogH9SP5CQ>
 <xme:v_AAYeHlbqm6HGYjSGc5jbH4D35Zs-FdHbTk-6iAmWwhM5z2_Mj6zrClxLLUwgZP1
 puxA1xYDvxhQDWJPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeekgdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepkedtgefhveffieeivdeihfeugeegteel
 heffueevffevkeejfeehfeevtddthfegnecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:v_AAYf5ejMf2E38UTcrozlJ7-ZAwGjbORqYo6F7PYjqbYxeV19Pz0A>
 <xmx:v_AAYU0SKC_yl9S4XQFDd4chAyg7pHyW9AS_vue-xv6I9htRNxnJbA>
 <xmx:v_AAYSG9wPWT3HkkLQUADRn04bnLl1ClKWB3y5sKoxxBcUSWPPoRqA>
 <xmx:wPAAYdyTWyCOMLiCinSscq6O-z6UVhXe4UTq6p0TbOrCLzXtWY7BIw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3CABDAC0DD0; Wed, 28 Jul 2021 01:53:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-545-g7a4eea542e-fm-20210727.001-g7a4eea54
Mime-Version: 1.0
Message-Id: <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
In-Reply-To: <YQBrbuQFz4JihBAE@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
Date: Wed, 28 Jul 2021 15:22:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: `phosphor-logging` APIs (RFC)
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



On Wed, 28 Jul 2021, at 05:54, Patrick Williams wrote:
> Greetings,
> 
> There have been discussions before on this mailing list about the APIs present
> in phosphor-logging and some of the shortcomings they have.  I've implemented a
> new API, inside phosphor-logging, that I think resolves the issues discussed
> here and in some offline forums.
> 
> If you have an interest in the logging APIs, I would appreciate any feedback you
> may have.  If there are additional issues with the APIs that I might have
> missed, please feel free to let me know and I'll see what can be done about
> resolving them.
> 
> lg2: introduce motivation and API
>     https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45310
> lg2: initial implementation of C++20 structured logging
>     https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45311
> 
> The main highlights of what I attempted to fix are:
>     - Verbose and clumsy API for previous `logging::log`.
>     - Poor compile-time identification of certain (common) issues.
>     - Source location data is invalid (issue openbmc/openbmc#2207).

I think you wanted openbmc/openbmc#2297 there, but yes!

>     - Useful data is missing from `journalctl` resulting in people working
>       around it by generating strings with `fmt` et.al.

Sounds promising! Reading the proposal it seems like you're appending 
certain bits of structured data to the message. I think it would be 
nice if the data could be interpolated into arbitrary positions and not 
just appended (note, I'm not asking for interpolation of arbitrary 
variables here unlike what can be achieved with raw use of fmt, only 
those captured via the structured logging).

>     - No logging present when running on a TTY.

Great, this has caused quite a bit of confusion in the past.

Andrew
