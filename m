Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41C38DE70
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 02:36:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpJDz2plWz2yY8
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 10:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=I1UgvuBW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n9NkXkhX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=I1UgvuBW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=n9NkXkhX; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpJDZ2xy9z2yXW;
 Mon, 24 May 2021 10:36:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A26B35802E4;
 Sun, 23 May 2021 20:36:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 23 May 2021 20:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=zkdYOgBr6Su2ai8/JFeN24jFqNEfx2N
 9VN/bHqPBWM8=; b=I1UgvuBWfB/H3UC2DCeyOvtYsiu44FCeM+ceMlNQh86h/rQ
 VH3oGHRSQZE0ESXyx5gleiDHAc+RQ2+DnK0aZu3tq5fh6KAseOuXmloxARAqUV66
 VHbUuprYslYzYg4o9o/6iuxZgENs+w/NX+6dfJ/zKphutE1aaZjGqhz9RTdIgAwi
 q/UoPr66PSotyBmtus5RHQOteW1qU3/YUcNvKtwkXOefEXTfoMou/DKRij0oefqS
 H3jArk5UBD0sMRcCoQWxd6TX1S8B2npJ9TUknbkOYXbsYZ5abIN3m/9wIiV+mInD
 EBvEZqWKPIE4iKchSiOI2ZDjgMuFaXzGvnH9r4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zkdYOg
 Br6Su2ai8/JFeN24jFqNEfx2N9VN/bHqPBWM8=; b=n9NkXkhXcEEkTg2EhGUS7A
 axzagLdcosddoN2VOIizkliicbXB2tK1hic9l4puTgRUWdS/5Q8nqsUE8zeJx3hd
 Q+h6slEB/0q6AfR1uMV5NCth1yE2qHyy/aUa1ESklQxyXCKftAqXw7JtZgBVHR3M
 9EaaoYs1OiTjmyDdCIqs2EjtJbyY0XiWDiAm06D/uAjLgLzdVorBXKUw03wWSBiX
 tg6/8PmsesX5bisK1b1GAQfhOjZno1/C5ilMBWFIV750nBMfYspETlENVKIroN3M
 Wiun7ETMFWKsXiyGDuZfFJUf/n0HTbKonLDUzQKTo0QxRKwCzVO/XNhQ86dp+D4Q
 ==
X-ME-Sender: <xms:BPWqYA1T02O_wgqkUUutE61gLIrFB5ABfOtV2F9pdY9mVoKbS9csHg>
 <xme:BPWqYLEmintilSSGkp4bvbEkkObYCPDS6s3mfqOwUOK-SYzz8JfVmqR99ePVPtPKX
 EuqaGw5Vwgrzv_swg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:BPWqYI7XIdnyYpc88GTK0x4feDcqV4tnMSUyq8Qa-j1rTkYdYUPNyg>
 <xmx:BPWqYJ3H3frTV1PdvXsy9fo1aPhhCnKBZhYdIrYZJ-wu6HkMElJCiA>
 <xmx:BPWqYDHQxHjwgSFZ0HZuD6L0ydZzNpJqCTNCQvNNektIjgHhihqIEQ>
 <xmx:B_WqYDG5gJFy-RimBvuKtngX-3bz9X1LqNiHKDisST7-L-CX6BqcLg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B59E0A004B1; Sun, 23 May 2021 20:36:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <e0803983-a385-4972-9dcb-404b2006f674@www.fastmail.com>
In-Reply-To: <20210521173616.GK2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210521173616.GK2921206@minyard.net>
Date: Mon, 24 May 2021 10:06:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH v3 00/16] ipmi: Allow raw access to KCS devices
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 openipmi-developer@lists.sourceforge.net, Zev Weiss <zweiss@equinix.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

On Sat, 22 May 2021, at 03:06, Corey Minyard wrote:
> On Mon, May 10, 2021 at 03:11:57PM +0930, Andrew Jeffery wrote:
> > Hello,
> > 
> > This is the 3rd spin of the series refactoring the keyboard-controller-style
> > device drivers in the IPMI subsystem.
> 
> This is a nice set of cleanups outside of just allowing raw access.
> I'll let you handle Zev's comments and a few of mine.

Thanks for taking the time to review the series. I'll address the 
comments from you both in v4.

> 
> I almost hate to ask this, but would there be value in allowing the BT
> driver to use this abstract interface? 

Hmm. Possibly, but it's not something I've looked at yet. If we did 
want to go down that path I don't think it would be too difficult, but 
I don't have a need to touch the BT side of it right now.

> Or maybe it would be just too
> hard to get a common abstraction, more work than it's worth.  It's
> surprising that more people don't want BT as it's vastly superior to
> KCS.  

For bulk data, certainly. However for the use-cases I have I'm using 
the KCS interface as a control channel that isn't data intensive. 
Interrupts, a small command set (256 values are more than enough) and a 
status byte are all I'm really after, so BT is more than I need.

Plus for the systems I'm working on we're still using BT for in-band 
IPMI while we transition to MCTP/PLDM. The current BT implementation is 
working fine for that :)

Cheers,

Andrew
