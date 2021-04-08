Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFC359099
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 01:47:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGdGc6xn6z30Ml
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:47:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=lnFwOf4E;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RR2UR/Dw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=lnFwOf4E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RR2UR/Dw; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGdGJ38cYz2yQv;
 Fri,  9 Apr 2021 09:47:03 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id EFA965805A7;
 Thu,  8 Apr 2021 19:46:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 08 Apr 2021 19:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=3gGVX3JOaG38XWZoaFoORuXmUHcSVYu
 PdREEhXwr2lM=; b=lnFwOf4EL+ECFKXoXPRXOpXUUPG3taJf/ImmKVTwL97B24g
 h3RlixiPG8WqIkzLfvmPG+Mx4WzW2qh6u5HeMchAMSAWlzEPoVz3SAK/CmmBQQZV
 vsj61ImqTPyR7bOcv1bQ1yuCWHcF7bRAxrN2t5wcU/59H/zB+N/T1Q04/RnWfd0C
 5Yzlti2tdXPwwzC6PJHIm6sZ/Nv+hM465zdUlYFZqkMghOHT+pMB8dciT9pRp9Yi
 mv/AenehPCuMMsGZZ28yWFpQrL0jUgHc5T9MAM8w6WjTlgWItQzVfcjVonDPGRWR
 QazXSY4nX+z6D9VvhCNXnr5iw23frCDAtbR+4mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3gGVX3
 JOaG38XWZoaFoORuXmUHcSVYuPdREEhXwr2lM=; b=RR2UR/DwyT+tnS+oLi2+WZ
 aQEgXV5QaBt1NMMLPdUYLwmkmBqu+2bIF4jUJaut/3y/XXXJDwfZDlufZYgaKC4o
 5KQLGZL2lklUG29GHw67B6NJdHmM6njYa2b60RhYGvu7uKzMMIJ44dGK0c+j8wnC
 D5Bf1eSisDklyZJGnLt53hHdgTC24xKDfW992Wn9NHJzmFWfe/j68kN7cgwz4Fjz
 3BX6g2FgXvzL+VrshhbpPJKgobivz7PWCRiAZFKYkNH0SgIukzx8kfUpWE3DOpEa
 AhO6EO0O9uVejDI5fqEw3RDFSLHoFc4yW0mmYYMcpmLfRxA8LmMfvP6p8j1u2bjw
 ==
X-ME-Sender: <xms:8JVvYABtmjmz89n_8bZqwN9g7QVpCROxcRhe_fSokdaZT0Nnn-t51g>
 <xme:8JVvYCiFpAgwel-c5LdaV26DGsgnRFSxeJTDxXHjp0dK1rK6s7eaAPCh63xl-HDB9
 aP9Tl5FFLr1hMcnDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8JVvYDn67uV7od1rXZlxzL1plYYBwn1U3mvdS68-YbwWghNzfOqeQg>
 <xmx:8JVvYGws__rMbJbzdKLbdoLGeHiIt4qm3oQw5kAVhzg0vpYLKoAChw>
 <xmx:8JVvYFS2YvgQnpwAhLXLYIOo0xo_tk6iSGVaP5LXEuBbg__VYzlJdw>
 <xmx:8pVvYGBMihZ7Bk4d8V6f4pvUUsJr3-DP9xfNGRT8Q922NanT-sa7bg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 91F22A0007C; Thu,  8 Apr 2021 19:46:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
In-Reply-To: <20210408121441.GG7166@minyard.net>
References: <20210319061952.145040-1-andrew@aj.id.au>
 <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net>
Date: Fri, 09 Apr 2021 09:16:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
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
Cc: devicetree@vger.kernel.org, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:
> > Hi Corey,
> > 
> > On Fri, 19 Mar 2021, at 16:49, Andrew Jeffery wrote:
> > > Hello,
> > > 
> > > This series is a bit of a mix of things, but its primary purpose is to
> > > expose BMC KCS IPMI devices to userspace in a way that enables userspace
> > > to talk to host firmware using protocols that are not IPMI.
> > > 
> > > v1 can be found here:
> > > 
> > > https://lore.kernel.org/openbmc/20210219142523.3464540-1-andrew@aj.id.au/
> > > 
> > > Changes in v2 include:
> > > 
> > > * A rebase onto v5.12-rc2
> > > * Incorporation of off-list feedback on SerIRQ configuration from
> > >   Chiawei
> > > * Further validation on hardware for ASPEED KCS devices 2, 3 and 4
> > > * Lifting the existing single-open constraint of the IPMI chardev
> > > * Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
> > >   binding to dt-schema
> > > * Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
> > >   property definition for the ASPEED KCS binding
> > > 
> > > A new chardev device is added whose implementation exposes the Input
> > > Data Register (IDR), Output Data Register (ODR) and Status Register
> > > (STR) via read() and write(), and implements poll() for event
> > > monitoring.
> > > 
> > > The existing /dev/ipmi-kcs* chardev interface exposes the KCS devices in
> > > a way which encoded the IPMI protocol in its behaviour. However, as
> > > LPC[0] KCS devices give us bi-directional interrupts between the host
> > > and a BMC with both a data and status byte, they are useful for purposes
> > > beyond IPMI.
> > > 
> > > As a concrete example, libmctp[1] implements a vendor-defined MCTP[2]
> > > binding using a combination of LPC Firmware cycles for bulk data
> > > transfer and a KCS device via LPC IO cycles for out-of-band protocol
> > > control messages[3]. This gives a throughput improvement over the
> > > standard KCS binding[4] while continuing to exploit the ease of setup of
> > > the LPC bus for early boot firmware on the host processor.
> > > 
> > > The series takes a bit of a winding path to achieve its aim:
> > > 
> > > 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> > > rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> > > non-KCS LPC-related ASPEED device drivers in a way that enables the
> > > SerIRQ patches at the end of the series. With Joel's review I'm hoping
> > > these 5 can go through the aspeed tree, and that the rest can go through
> > > the IPMI tree.
> > > 
> > > 2. Next, patches 6-13 fairly heavily refactor the KCS support in the
> > > IPMI part of the tree, re-architecting things such that it's possible to
> > > support multiple chardev implementations sitting on top of the ASPEED
> > > and Nuvoton device drivers. However, the KCS code didn't really have
> > > great separation of concerns as it stood, so even if we disregard the
> > > multiple-chardev support I think the cleanups are worthwhile.
> > > 
> > > 3. Patch 14 adds some interrupt management capabilities to the KCS
> > > device drivers in preparation for patch 16, which introduces the new
> > > "raw" KCS device interface. I'm not stoked about the device name/path,
> > > so if people are looking to bikeshed something then feel free to lay
> > > into that.
> > > 
> > > 4. The remaining patches switch the ASPEED KCS devicetree binding to
> > > dt-schema, add a new interrupt property to describe the SerIRQ behaviour
> > > of the device and finally clean up Serial IRQ support in the ASPEED KCS
> > > driver.
> > > 
> > > Rob: The dt-binding patches still come before the relevant driver
> > > changes, I tried to keep the two close together in the series, hence the
> > > bindings changes not being patches 1 and 2.
> > > 
> > > I've exercised the series under qemu with the rainier-bmc machine plus
> > > additional patches for KCS support[5]. I've also substituted this series in
> > > place of a hacky out-of-tree driver that we've been using for the
> > > libmctp stack and successfully booted the host processor under our
> > > internal full-platform simulation tools for a Rainier system.
> > > 
> > > Note that this work touches the Nuvoton driver as well as ASPEED's, but
> > > I don't have the capability to test those changes or the IPMI chardev
> > > path. Tested-by tags would be much appreciated if you can exercise one
> > > or both.
> > > 
> > > Please review!
> > 
> > Unfortunately the cover letter got detached from the rest of the series.
> > 
> > Any chance you can take a look at the patches?
> 
> There were some minor concerns that were unanswered, and there really
> was no review by others for many of the patches.

Right; I was planning to clean up the minor concerns once I'd received 
some more feedback. I could have done a better job of communicating 
that :)

> 
> I would like this patch set, it makes some good cleanups.  But I would
> like some more review and testing by others, if possible. 

No worries. I'm trying to rope some others in to take a look.

Thanks for the response.

Andrew
