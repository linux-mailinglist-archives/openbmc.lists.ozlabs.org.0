Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD900106746
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 08:48:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K7pc5zWJzDrH6
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 18:48:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gVLvWTFz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="FMNujLB0"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K65p40Q3zDrBv
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 17:31:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B0A84FCC;
 Fri, 22 Nov 2019 01:31:37 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 22 Nov 2019 01:31:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PCfR068oxaJDBnTafaOW/sKblqJ2E6L
 Im6iybfaPt74=; b=gVLvWTFza3N/u1THzY3XvQPprf4qBWlaNF11pSrlgKyiNHg
 ftSEVSN3ZFIuZL/lq7lrcTZsYTDZeswvS3OyfmMRyt0VrCa5r4iqZ5M9WB9JHeDK
 qAugODnHfTWtOgaHX/HeDIUZoQbHOMbMwSDppgPidNWpgYxAs6n2NBxW8IsbdQ4f
 q7Kw/Yt7H+48eUNhDAa3WrRd/HIJhfVVSvK6f94BhcmoaeyMDTVB1shx97NMqO70
 +55cMwGyy8wwcNLoSgulxY5Rrm4kxOy43rqxt1kSPYFfmDVdzUOc5XCmhjaVFTuh
 jZ8vj+Y4pl3/6p5bWTkFJP4tES2mS8x9NCCuFkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PCfR06
 8oxaJDBnTafaOW/sKblqJ2E6LIm6iybfaPt74=; b=FMNujLB0HIW8siiHeoGPIw
 6YuGLBmhcKYL9m7O9zEu85ZNxj/D/zTeLY0cutJccLi666EUSxTpl7LZ+5MMmuq0
 hmZyQRzOqxE73/B5epAkidXpJYBXFNIPdnQ8lGwkZer+kXtegKpu5iI5/ivSMiaV
 uZrVgBumirkMSZzlt1JonDTEnWKX2SKsvesi22JytpkqW0dTn0uUvETrmC28E4jX
 8YnheJMvvGLQuQ2EqcHXto9bp3lDY1JUdyPe21hNZ27vaNqb4U5XZSe4oqEe6oFL
 i0Oe4nHAbma8wrm+eqTFKbaVyK4p5PoWLzD5TZW7DIZO7puGt1yXDkAnhnyFBYuQ
 ==
X-ME-Sender: <xms:voDXXewqO_3Df-hXe0cj-AHFp96zxDnYYEj2IBzRsasBUTUE9RVtLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehfedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:voDXXUtc6v1MPTVlU8WIKc6D_1sm6GH341QJ33h-bHu0GqK3mGl3Vg>
 <xmx:voDXXX0sQx3_rUXgXTqSb4ZwSOT6R-DbzePxLYv2Xl2y1OExik5jMQ>
 <xmx:voDXXcBgvrWj7ynkQUikDo7_wG4eWX9_O1GGL_Gu5xuf3JrAVAj20Q>
 <xmx:yYDXXXvZcjYBzembnB4aK9quNeif4-qtSdKNvCUHc7PGJEjnhxuY7w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CD691E00A3; Fri, 22 Nov 2019 01:31:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <839a25fc-1244-4c96-b3ed-6a2c04445736@www.fastmail.com>
In-Reply-To: <348aed94.42d2.16e915b4531.Coremail.ouyangxuan10@163.com>
References: <1b4dacbd.8278.16e6e6c2234.Coremail.ouyangxuan10@163.com>
 <a06a7845-cf16-4e37-8674-acd0950d6245@www.fastmail.com>
 <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
 <e4d8ad9b-49cf-4942-a64c-0c47a94efa17@www.fastmail.com>
 <348aed94.42d2.16e915b4531.Coremail.ouyangxuan10@163.com>
Date: Fri, 22 Nov 2019 17:02:51 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>
Subject: =?UTF-8?Q?Re:_[openbmc-kernel]:_How_to_make_pinctrl_not_affect_pass-thro?=
 =?UTF-8?Q?ugh_function=3F?=
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
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Nov 2019, at 14:55, www wrote:
> At 2019-11-22 08:31:05, "Andrew Jeffery" <andrew@aj.id.au> wrote:

*snip* 

> >Getting back to your problem rather than solutions, it's possible to view
> >this as a deficiency in the GPIO subsystem and Aspeed GPIO driver: If we
> >could describe that we want the pin muxed for pass-through as part of
> >the GPIO request then your problem would be partly resolved, save for 
> >the fact that the exported GPIO would still be read-only. However, that
> >issue is fully resolved by multiple sequential GPIO requests: export the
> >GPIO in pass-through mode initially, and then when it comes to changing
> >the host state, re-export the GPIO in non-pass-through mode so that it is
> >writable, and then again re-export the GPIO back in pass-through mode
> >after the host state change has been applied. This is the sequence of
> >your original solution above, just without the need for additional drivers
> >with ad-hoc userspace interfaces or introducing bugs into the pinctrl
> >driver.
> >What are your thoughts on this?
> >
> 
> I haven't heard of this way. Would you please explain it in detail? Thank you

What details are you after? What I suggested above is not yet possible -
we'd need to develop some kernel patches to make it work, but they would
be something we could upstream. pinctrl needs to remain aware of whether
a pin is in GPIO pass-through mode or not, as it not only affects how that pin
will behave but how *other* "unrelated" pins might behave as well.

Andrew
