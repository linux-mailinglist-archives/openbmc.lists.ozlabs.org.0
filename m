Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31F33C7A8F
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 02:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPdWr4nNXz3000
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 10:23:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Rak05a1a;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pZQE7dr0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Rak05a1a; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pZQE7dr0; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPdWW2nY3z2yMy
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 10:23:02 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E36A85C017D;
 Tue, 13 Jul 2021 20:22:58 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 13 Jul 2021 20:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=BHNK3EjVt+LSq0feZv2TlcwEpgmZvp8
 XAzd0uLajTWM=; b=Rak05a1aF6mDTsiYFvoY6NxAckco0VN18xJjtu72dns8crT
 tPBxtZND0hLcMrHAUKT8hSqLj6C9RRjGNW42rfejXA3u43BhZOvWhDQxBhu6IwSM
 y9U6qkLAxbTWZgPswvmt32LCNSo0ZOpejJ5gPMiSYg/Lr2zhjPNHdPq3p2QJut60
 r6YsJgz9WYR9Ra9bTbTYSKl7P6lurjmyS6FUq17EMRn3RAKlVu6ghVbU4Qj8T4wx
 WQdrppKr0iBPpDu05uCqIIHBo1wlNXWYplsc68wsvAF0bo1+7uJAR48P29tbrzKL
 ABMKG1AJFhgV88oN6Ef0AjUrQEaKgtH5GB1tcoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BHNK3E
 jVt+LSq0feZv2TlcwEpgmZvp8XAzd0uLajTWM=; b=pZQE7dr0DIfeF6z9GjOyat
 j+G4/p6zR0WCOrGw4G87cLeCPCASSqOL5pelC9xD8iGik3/0kBi+QFrEqjVvBxum
 WPe1VrWwa5IsPaKasVpQRqWp1xLm6o5mAtHKmUDB660VYJqKptJuskSpY6w//Thb
 OZZgNNYcsH6P97ff1r0H42jni9KTWptv8u0vtSYpC61h//Afo6ClE66liNV5mISs
 1wXV0pfnsq2s8RbeGLTCoLiFbiHzoFJSlkZJVrDDImfIW1XegFG5/rrBVM4NjkTr
 o94tnhcGtLSmkLEBelJXeQBd4PrNtfmA9eMpGPpbpa5oy+ptkQfJcheMCmnj+69g
 ==
X-ME-Sender: <xms:Yi7uYEd_JQo9rJfiQFNNoee34johfaCTYuntbWz-3JJTRnIYTmytig>
 <xme:Yi7uYGMXuzEVCsZ5YFgYe9Ucag7am7ezzEeTCoDpOaPwOURxWgez4QxM-3mFwZmTY
 HpljVH8c8JyVODYbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeetveegudfggeefhfdutdfgffeggedvteelfeejffevleegffegteevveev
 tdfhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdguvghvihgtvgdqthhrvggvqd
 hgphhiohdqnhgrmhhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Yi7uYFg_UKSBihhciDVvpRPWYxZGFcuqjItCmL67TpDyR706er3S6A>
 <xmx:Yi7uYJ90FwlzFqmJADConmdu3pvY0zRKrvYScU1XVZwGElQ8KUbaYg>
 <xmx:Yi7uYAtGm5Jl7-LWnwOWeNP6xFik8p546fEvS9WjBNjlC5bYfqbNHA>
 <xmx:Yi7uYG3vtP31dzBuZkANw4G1kjk1iNW22iLJLUW51lYj6OgTJ47uOg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 11143AC081B; Tue, 13 Jul 2021 20:22:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-533-gf73e617b8a-fm-20210712.002-gf73e617b
Mime-Version: 1.0
Message-Id: <18bebfb2-b5f3-4c5f-b359-eee92a3aaefa@www.fastmail.com>
In-Reply-To: <20210713190014.8142-2-bentyner@linux.ibm.com>
References: <20210713190014.8142-1-bentyner@linux.ibm.com>
 <20210713190014.8142-2-bentyner@linux.ibm.com>
Date: Wed, 14 Jul 2021 09:52:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: bentyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_2/3]_ARM:_dts:_everest:_Define_name_?=
 =?UTF-8?Q?for_gpio_line_Q2?=
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 14 Jul 2021, at 04:30, Ben Tyner wrote:
> From: Ben Tyner <ben.tyner@ibm.com>
> 
> gpio-line-names Q2 set to vrm-fault-standby

We're trying to get a grip on GPIO names that might be generally useful 
in this document:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

I don't see vrm-fault-standby listed there.

Can you send a patch for the document? I'd like to see that merged 
before we pick up this (and the other) dts changes.

Cheers,

Andrew
