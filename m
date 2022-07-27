Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B23581D0E
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 03:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LswyK3pdCz304J
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 11:23:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=gvgJlWrN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1eZNdr6/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=gvgJlWrN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1eZNdr6/;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lswxr3M8Yz2yL6
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 11:22:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C86463200971;
	Tue, 26 Jul 2022 21:22:34 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 26 Jul 2022 21:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1658884954; x=1658971354; bh=23P9kq4SSDaQiA/IkLvEcux9Qd8eNYSljBy
	TYhgCMDo=; b=gvgJlWrNJJhuWVQuCGDD/c5yXB7/bYC7NnLMjy6GAdZzUY9yrMn
	k56Co7PsGxdrbh+aGtkYtgSspYUNILW7kB8tepalMZz+kcnzADV7VcdKbk6TlFH0
	A1ZaxtMhjShQRNvP6X4eUyF2Zdfu02tU3wRpX8VAkuzpxc7r29lKmpL5Y8aQmHGc
	Q4j/6hRSiOoxKoWwUUnA8Lj59bpPvA9xuTM5ndmehTJhyL7QP6bMJQfavZY+97DA
	Xg+vQ6EmT5BMUBfT7OO89yhpXyKvOkUQweFKde4bsNpmoXSdZKt9wEs9ROF6NWYH
	qdD64fLExTKuukjcfJqwd/u+N8d9pJJS8vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658884954; x=
	1658971354; bh=23P9kq4SSDaQiA/IkLvEcux9Qd8eNYSljByTYhgCMDo=; b=1
	eZNdr6/Qc79xucXHu7rI7/n312QqNAo1iA/kW5DtHKMTmWP/nBez4xgNFIzMKy2a
	k4okalrcRSlVBBOgTr4ZHks+4+E78EbYpUXVUgetpRAxH69cFldLR9FYF6jEtvXo
	ew3GGbtElYb0J/3QLOgntO1+vFQzNPvyuYyick1nsSaS8gy0nh9kPFs+TzIxKR7u
	NhF5ISOsbmHb/lcJbTgziUSsw3V/BN3EQd/AUrhyGgr8NDuOrN/xkCdqQ4WQ39oO
	UAQ9VcjfUCuO42rF494L3JbgP2p6RzVbMSsfxe5OLAyg9wzpipSflieObu6ATTOf
	Z7EQTcvKGYjA6JfM/hwrA==
X-ME-Sender: <xms:WZPgYs1cE-Si1FvCZKAgoDlaytLcM-t51a9IuUSbB4RWJC-j4_VVwg>
    <xme:WZPgYnHNkByedlMANF8fzZhjb7lAuf9lee1cUSsNhRuJUnmTe_Ib8tZaWA0qjmgOg
    f_WSXiow8Klp05kAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduuddggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeevgefgieelheeffeffkeelgffgteffjeeiieevueeitefgfefghfduhfek
    ffehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    fiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:WZPgYk5Xx5sEoEqnLnbWDs4ev2VxP0TFmHkaImNZLVZ-pp_VPPvJRg>
    <xmx:WZPgYl2sG9HjfVRQRe4wrUDiAcG66rulJeZdFhoBNf4kp7U-EZNGww>
    <xmx:WZPgYvG1o62qh6mC-Y0VKIq9eDE15GPxHYR8lvo6gllAXYrPfCRadg>
    <xmx:WpPgYgP_RojPUA7rdV2tvhGVbj5uxJ2inzkJqq80TlqCo_gkSjqVOw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 58604170007E; Tue, 26 Jul 2022 21:22:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
Date: Wed, 27 Jul 2022 10:52:04 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Can we improve the experience of working on OpenBMC?
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
Cc: Benjamin Fair <benjaminfair@google.com>, Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello everyone,

A few months back Ed kicked off a thread about changing how we work on OpenBMC
with the aim to improve the development rate and make it easier to on-board
people to the project:

https://lore.kernel.org/openbmc/CAH2-KxAJS_U8=meCxp8ue7n0bmnzeRpyZOPZpy0h1cFEbbz-HA@mail.gmail.com/

I felt that discussion splintered a bit, with a lot of back-and-forth about
details well down in the weeds. I found this hard to follow, and so put in some
work to try synthesise the discussion into desires for improving how we work,
and practical problems with what we do currently.

Below are the lists of these desires and problems. I think it would be good to
treat this as a survey to understand who feels strongly about what.

If you want to express support for a point then add a +1 below it. Feel free to
suggest new items for either list, or to further discuss a particular item
below its entry.

I feel that with information on what people feel strongly about we can
prioritise what we need address and work forwards from there.

For the record, the mind map that I used to generate these lists is here, which
contains further quotes and references to the original discussion thread:

https://github.com/amboar/openbmc-monorepo-discussion

Some of these might be closely related or considered duplicates of other list
items, but based on the discussions referenced above I felt they were distinct
enough to warrant separate entries.

# Desires

1. Easy sharing of a broad set of application and distro changes
2. Minimise reviews required to get a given feature or fix integrated into the distro build
3. Make fork maintenance easy
4. Provide one place to report bugs across the entire project
5. Minimise effort collecting project statistics
6. Make it easy to add new applications
7. Make it easy to refactor across the entire project
8. Support inclusive naming

# Problems

1. Yocto is hard
    1. Managing patch stacks is hard
    2. Yocto-specific tooling is hard
    3. Finding the right recipe file to inspect/modify is hard
    4. Yocto has too much documentation
2. OpenBMC has too much documentation
3. Querying design/implementation/bug properties across the project is hard
4. Coordinating breaking changes is hard
5. Coordinating tree-wide changes is hard
6. Identifying the right repo to file a bug against is hard
7. Transferring bugs between repos is hard
8. Bug reports are duplicated across repos
9. Bug reports are ignored
10. Working out where to submit a patch is hard
11. Getting patches reviewed is hard
12. New repo requests are bottle-necked

Cheers,

Andrew
