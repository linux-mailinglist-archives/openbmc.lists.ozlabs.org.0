Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8A389EDF
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 09:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm1V80hVJz3068
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 17:25:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=dwfiAaGl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=u8WSnZPF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=dwfiAaGl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=u8WSnZPF; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm1Ts1zp2z2yXT
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 17:25:04 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2D74C1C81;
 Thu, 20 May 2021 03:25:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 20 May 2021 03:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=YGzMf60Q5zwVXsxdpGeNbxkVIZVOJSx
 edpBbmYYWTL8=; b=dwfiAaGl+wHsZJTkcORZR/XCLH4P19DMvOzG30nHjwdY+Ri
 7a41hUSDmIy9fjIVWWq/ycHP6T4epn6snZKNv0phhEUpGeHinncTLiKVW7S7RPW6
 r+GZAVpplRK3rmopQL/la1LrPx0Al1wb4xcYwkb9Z2ADHbM/3HYxFmeO67Bn3iKT
 YclkyWzhDua5/p6UiKVWoQuC04rUwOT4SHOH19qGENLmTwmkZpyYmoDWHTORjnHL
 RQtnTFhfGZfeePXsnlaoAF+K3BhxnYQfeVYnUvJt+u6RrNjuUt/ibRZ0ZCnds1he
 10ie0hxlfelIuRH/xktv9aDEThJRxR8MYJbGmiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YGzMf6
 0Q5zwVXsxdpGeNbxkVIZVOJSxedpBbmYYWTL8=; b=u8WSnZPFROdo/iv7EPEgkb
 HkFHTKk+Wf8sJX90efqGY1F6OW4UFYuaJ35NrZwzSGzWk0C4KgvHlmL8VuGskU5z
 kXOk+DPpNhwBXNclzJHnusinvzVchcy3cP0dNNesupCF6fCQ5CvsrXRauszrpdvM
 RhAoG6kOTVMsYSPUoYkSfFmINbMDgGxRoHAevv/STnxt65Ys/UWxZkuq88nMbmiG
 ELMfCbvwhz/lkPnz7YJbTLy589iWQgsnZ9CIucykYwTqq69t9u42I4Rd3QsBlYd8
 a+iO2QbMoonm9P2FkGGj0WKxZNNE2krKxN5gFVFzCTDg17ZPvxlXBBOOnGmzcrOA
 ==
X-ME-Sender: <xms:yg6mYCw171VaWmfjy3nJgrZmKL7YGNMsrJEs37YdhfpiftiULttigQ>
 <xme:yg6mYORHJfUD_tE1Lnw2w27CadOj-IqRslF8AQrEKyc9BLGZUHD-dSiK96pDR4OCm
 sKyWRJEjVjrHDjynw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedv
 hefhveeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:yg6mYEXMBtWiVEW-LCcoui41pUcp1neui0KIbSYqLEB6SkvsRLmBNQ>
 <xmx:yg6mYIhj6jnbTAyDY3czKZZZYB6S9yfPYIm1TcznQxb1J-O_tDPU8Q>
 <xmx:yg6mYEBV3CuJ9cYACverf7xHa5l2MrROb2FDFFGB8cxInlpBRKwZ7w>
 <xmx:yw6mYD7-EgYKW3gpOUSgZnpguVX8xr5CB6kGVbWHg76MSh2Ws6HfTw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D2325A004B5; Thu, 20 May 2021 03:24:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <a0d1f44a-c8ff-4108-af34-6455b5683262@www.fastmail.com>
In-Reply-To: <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
References: <20210520015704.489737-1-andrew@aj.id.au>
 <CAKXUXMxTnz6edBLpBgqOo6uUiSGm8rULH9P8G24xx2OhP_Yb6A@mail.gmail.com>
Date: Thu, 20 May 2021 16:54:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
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
Cc: Jonathan Corbet <corbet@lwn.net>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 openbmc@lists.ozlabs.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joe Perches <joe@perches.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 20 May 2021, at 16:28, Lukas Bulwahn wrote:
> On Thu, May 20, 2021 at 3:57 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > include/linux/bits.h in [1]. Since [1] BIT() has moved again into
> > include/vdso/bits.h via [2].
> >
> > I think the move to the vDSO header can be considered a implementation
> > detail, so for now update the checkpatch documentation to recommend use
> > of include/linux/bits.h.
> >
> > [1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
> > [2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")
> >
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Looks sound to me.
> 
> I would prefer a bit of word-smithing the commit message by just
> removing the references:
> 
> So:
> 
> > While include/linux/bitops.h brings in the BIT() macro, it was moved to
> > include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file"). Since that commit, BIT() has moved again into
> > include/vdso/bits.h via commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").
> >
> > I think the move to the vDSO header can be considered a implementation
> > detail, so for now update the checkpatch documentation to recommend use
> > of include/linux/bits.h.
> >
> 
> And then drop references [1] and [2].
> 
> Andrew, what do you think?

I mostly did this because initially I wrapped the commit message and 
checkpatch spat out errors when it failed to properly identify the 
commit description for [1]. But, leaving the description unwrapped 
inline in the text feels untidy as it's just a work-around to dodge a 
shortcoming of checkpatch.

With the reference style the long line moves out of the way and 
checkpatch can identify the commit descriptions, at the expense of 
complaints about line length instead. But the line length issue was 
only a warning and so didn't seem quite so critical.

While the referencing style is terse I felt it was a reasonable 
compromise that didn't involve fixing checkpatch to fix the checkpatch 
documentation :/

Andrew
