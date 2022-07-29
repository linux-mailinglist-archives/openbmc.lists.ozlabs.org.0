Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2F584904
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 02:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv7V127WYz2xkl
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 10:21:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=OyBqqJOm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tnKpBL+I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=OyBqqJOm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tnKpBL+I;
	dkim-atps=neutral
X-Greylist: delayed 581 seconds by postgrey-1.36 at boromir; Fri, 29 Jul 2022 10:20:47 AEST
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lv7TX02HQz2xJ4
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 10:20:47 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 3C5A45C00D3;
	Thu, 28 Jul 2022 20:11:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 28 Jul 2022 20:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1659053462; x=1659139862; bh=vBWX9/TWSM
	Cv6RKUx+ZjtamB4Bnbv0vnDJzPbXEkK6s=; b=OyBqqJOm3MMqh2o3592AEoW312
	OF/2MLenfvtIb/8n4oLZSy7kmIcXhC4uODpAfkTxdm3eX6TYPINgIhxgQ6dtZ0Ay
	quf2FxaEC27nOchHq+NrBtnkzVKbq0PYKtIMfRAJNXwj2POKa0IuZdZXn+Dkv1jM
	AnizLfUC3iwTIjKgV4JNurPjC0WylblCsV5ZgdCl4bUXCyGm3lM3NydGXL3GXVSf
	Mk8ST5t1oMK0XhVhh5nH1dQpxvp6e1TAib7PTvX1huQDu9rdT6c033bygXgVpkwq
	lWFE1dFmEVDVvJipXb4T9kBuRXKHV02UMx2os/DV05e1r/MAyk6fLK5XSvNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659053462; x=
	1659139862; bh=vBWX9/TWSMCv6RKUx+ZjtamB4Bnbv0vnDJzPbXEkK6s=; b=t
	nKpBL+IHvyL7QFoJ0se/iKkVJ/uJj+37904IWkb6uBxZT2X0dd1bf/y59JkbGsUu
	cyfJlPA3u7NBD+0tnxz2k/PvFKLmYvUsxvyvWFluWiEOqUkCupzJ4/UdA+mYczP6
	uZGWasf40L+ZjMWmLRpfdEb62TGaCM4eb5Ky2qK6NPdmHzYNNDaS9mVWzI5qar5u
	yUtcry1niE9Dp07gQafYRVuZIW+QA7q1EHLVq/xooHhRcwwDmkpuFyjdvB+2xCFj
	/yXK0fbmUoXVYrUrgftNajOfgmup28/W2X6I4Or7+yuzYrpqBXluAb6HNtTdRx62
	yDhZg26Ww7INKYoamalow==
X-ME-Sender: <xms:lSXjYtTAgEWKxiuMQe-F1ZLpoPE6YoPktnvNMAMCj7o2cDt-VsNrew>
    <xme:lSXjYmyudigxYm-jskh5Tl045CUD_PHipl9b3kgP246FeQebD1KZDMCIARVgPidni
    lfzgbHD4KjIGb2Towk>
X-ME-Received: <xmr:lSXjYi2kLUavSRNBy-wD0Kxg6IX3wOJZu5M8LlivsQG7rdBASFIBMkJ->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduhedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehr
    rgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeethfdtgffftddtfeeuvdffvdfhkefhvefffeeu
    leegtddtheelleeukeeuhfelhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:lSXjYlDBTodl6rgdyM_g0RwqepAvlwR4hRiK-svVZlvOJ3On6MAsAg>
    <xmx:lSXjYmjzOTCHJLViOcZWD6zUOrVznM1EK90cAlwH-R2Y5Patg5T-ng>
    <xmx:lSXjYpqvIq72TQpTuHvWYqvamaCz4n3AL0lsHOVhcVrIQ-q6aYo9hA>
    <xmx:liXjYoZxO6ae3CNAPI7SEiqKItZq_bgX4hmX5yKz2ooAgKGUp-Zvfw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 20:11:00 -0400 (EDT)
Date: Thu, 28 Jul 2022 20:10:58 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Can we improve the experience of working on OpenBMC?
Message-ID: <20220729001058.ec2fpmjrrkn75bf7@cheese>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Ed Tanous <edtanous@google.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew, thanks for poking at this.

On Wed, Jul 27, 2022 at 10:52:04AM +0930, Andrew Jeffery wrote:
>Hello everyone,
>
>A few months back Ed kicked off a thread about changing how we work on OpenBMC
>with the aim to improve the development rate and make it easier to on-board
>people to the project:
>
>https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/
>
>I felt that discussion splintered a bit, with a lot of back-and-forth about
>details well down in the weeds. I found this hard to follow, and so put in some
>work to try synthesise the discussion into desires for improving how we work,
>and practical problems with what we do currently.
>
>Below are the lists of these desires and problems. I think it would be good to
>treat this as a survey to understand who feels strongly about what.
>
>If you want to express support for a point then add a +1 below it. Feel free to
>suggest new items for either list, or to further discuss a particular item
>below its entry.
>
>I feel that with information on what people feel strongly about we can
>prioritise what we need address and work forwards from there.
>
>For the record, the mind map that I used to generate these lists is here, which
>contains further quotes and references to the original discussion thread:
>
>https://github.com/amboar/openbmc-monorepo-discussion
>
>Some of these might be closely related or considered duplicates of other list
>items, but based on the discussions referenced above I felt they were distinct
>enough to warrant separate entries.
>
># Desires
>
>1. Easy sharing of a broad set of application and distro changes

+1

>2. Minimise reviews required to get a given feature or fix integrated into the distro build

+1

>3. Make fork maintenance easy

+1

>4. Provide one place to report bugs across the entire project
>5. Minimise effort collecting project statistics
>6. Make it easy to add new applications
>7. Make it easy to refactor across the entire project

+1

>8. Support inclusive naming

+1

>
># Problems
>
>1. Yocto is hard
>    1. Managing patch stacks is hard
>    2. Yocto-specific tooling is hard
>    3. Finding the right recipe file to inspect/modify is hard
>    4. Yocto has too much documentation
>2. OpenBMC has too much documentation

🙂 Really? 

>3. Querying design/implementation/bug properties across the project is hard

+1

>4. Coordinating breaking changes is hard

+1

>5. Coordinating tree-wide changes is hard

+1

>6. Identifying the right repo to file a bug against is hard
>7. Transferring bugs between repos is hard
>8. Bug reports are duplicated across repos
>9. Bug reports are ignored
>10. Working out where to submit a patch is hard
>11. Getting patches reviewed is hard
>12. New repo requests are bottle-necked
>
>Cheers,
>
>Andrew
