Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F031038F6E2
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 02:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpvgL6GRVz2yyL
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 10:13:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=OqoVhqH3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LTO/qW8B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=OqoVhqH3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LTO/qW8B; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpvfz6c9wz2yXL;
 Tue, 25 May 2021 10:12:58 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 241CA58094E;
 Mon, 24 May 2021 20:12:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 24 May 2021 20:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=d2zEUntdeXJWYmAyxI56N4QgHdNvMV1
 cDqrmFJTjfjI=; b=OqoVhqH34YPXVFKBrbOk5IpHlbe7l5x4hc+UB7WirS4hk1Y
 uECLjyU3QdbrJ/w9qRZpAMMyiX6qFeBkMj3Zvteq9Emp6smH/4EQgimOSOjtQOL1
 CFH5gfBnflZgn+nCi4lhhgX/8gBA8jUII+O477YbmKiYUkhhLRGz0m0wzZ1qkepo
 DvyqDPIB7Rmk4eS7VdOvnnxiioIkfX1rrVaEYxy+/531D1+BqnMqCWM/Q2LHQIRq
 Y9lhN5XwuBYTXYiWo/POsT233pRHtITR0BxZV3EaYJjxod2sM3b8p1ZrCHiHFQwy
 LuWDJ3cY3QtifTayq8YiT/nyxREB2C3UWdGk28A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=d2zEUn
 tdeXJWYmAyxI56N4QgHdNvMV1cDqrmFJTjfjI=; b=LTO/qW8Bh92w5dNv4wEW7I
 yfnmJcWmUK7o4xwKs2OjWsPssTZwlyXKJsqMrXfqaVRdz2JQKWK8CEyFZwrZMixE
 pSjQqduFdiKSEHOGGo8Mqz5J6kEyUr8/mEnup4O3/BAO5lJM3jz81LR65BWti0di
 f5u57AXxwdk2J/Vtiqxb1E5RhtJR085o4RXyxxcjcF/0tQwyYtelPJLhkj287PA5
 OF+b90rF+KdMoty+nKCrnUTaoBAVG+EvEHxZhg2e6LkT03JR0+tKsdZv8aCOoehn
 W0eT5UbJWJXNOEf8Z4pr2XULBLz18vORHBlTRsMQS4gB1ikVCGEOA8iq9D+c6LiA
 ==
X-ME-Sender: <xms:BkGsYIWqNsTm0RtQUheqhfTZRQT3WjUD4-ioUsfLFEcDy7PtILV0nQ>
 <xme:BkGsYMk0DHlWx6Dmqe4WVJ1vJm-uytKQ2uSctVOBHtGMkD_UY6VHIwABgNrwb_XuD
 GXDrH9WRy2mbJmBhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdektddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:BkGsYMZnS3AQ3qYwKmWfErRADHhKKXU6snwuTx69BCgwVr2pJSy-tA>
 <xmx:BkGsYHV_wjLFaYg6IWAYYaG6yi2BsuBX3jw3WXK39XF-DecmfpzM0g>
 <xmx:BkGsYCknc428lZrWC-SoqlbGAnSq8ZB-dOibbIK9pjxIn9ckfrFBNA>
 <xmx:CEGsYIkc_GmiuK4K_lEx0qSvm7sntUu5YfES1dDLd4Ue6BbRMU6-ZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id ACC11A00079; Mon, 24 May 2021 20:12:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <9a290af6-522f-4055-bd26-e5818cc97bcb@www.fastmail.com>
In-Reply-To: <20210524154119.GN2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-6-andrew@aj.id.au>
 <20210521171412.GI2921206@minyard.net>
 <79f3c6d1-1f74-46ec-99a0-37faf11517b6@www.fastmail.com>
 <20210524154119.GN2921206@minyard.net>
Date: Tue, 25 May 2021 09:42:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: =?UTF-8?Q?Re:_[Openipmi-developer]_[PATCH_v3_05/16]_ipmi:_kcs=5Fbmc:_Tur?=
 =?UTF-8?Q?n_the_driver_data-structures_inside-out?=
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
 Benjamin Fair <benjaminfair@google.com>,
 openipmi-developer@lists.sourceforge.net, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, linux-arm-kernel@lists.infradead.org,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 25 May 2021, at 01:11, Corey Minyard wrote:
> On Mon, May 24, 2021 at 10:23:36AM +0930, Andrew Jeffery wrote:
> > 
> > 
> > On Sat, 22 May 2021, at 02:44, Corey Minyard wrote:
> > > On Mon, May 10, 2021 at 03:12:02PM +0930, Andrew Jeffery wrote:
> > > > Make the KCS device drivers responsible for allocating their own memory.
> > > > 
> > > > Until now the private data for the device driver was allocated internal
> > > > to the private data for the chardev interface. This coupling required
> > > > the slightly awkward API of passing through the struct size for the
> > > > driver private data to the chardev constructor, and then retrieving a
> > > > pointer to the driver private data from the allocated chardev memory.
> > > > 
> > > > In addition to being awkward, the arrangement prevents the
> > > > implementation of alternative userspace interfaces as the device driver
> > > > private data is not independent.
> > > > 
> > > > Peel a layer off the onion and turn the data-structures inside out by
> > > > exploiting container_of() and embedding `struct kcs_device` in the
> > > > driver private data.
> > > 
> > > All in all a very nice cleanup.  A few nits inline.
> > > 
> > > > 
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > Reviewed-by: Zev Weiss <zweiss@equinix.com>
> > > > ---
> > > >  drivers/char/ipmi/kcs_bmc.c           | 19 +++++++--
> > > >  drivers/char/ipmi/kcs_bmc.h           | 12 ++----
> > > >  drivers/char/ipmi/kcs_bmc_aspeed.c    | 56 +++++++++++++------------
> > > >  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
> > > >  drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
> > > >  5 files changed, 111 insertions(+), 73 deletions(-)
> > > > 
> > > > diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> > > > index ef5c48ffe74a..83da681bf49e 100644
> > > > --- a/drivers/char/ipmi/kcs_bmc.c
> > > > +++ b/drivers/char/ipmi/kcs_bmc.c
> > > > @@ -44,12 +44,23 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> > > >  }
> > > >  EXPORT_SYMBOL(kcs_bmc_handle_event);
> > > >  
> > > > -struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
> > > > -struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
> > > > +int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc);
> > > 
> > > The above (and it's remove function) should be in an include file.
> > 
> > This is a short-term hack while I'm refactoring the code. It goes away 
> > in a later patch when we switch to using an ops struct.
> > 
> > I didn't move it to a header as it's an implementation detail at the 
> > end of the day. I see headers as describing a public interface, and in 
> > the bigger picture this function isn't part of the public API. But 
> > maybe it's too tricky by half. My approach here generated some 
> > discussion with Zev as well.
> > 
> > > 
> > > > +void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
> > > 
> > > This should return an error so the probe can be failed and cleaned up
> > > and so confusing message don't get printed after this in one case.
> > 
> > Hmm. I did this because the end result of the series is that we can 
> > have multiple chardev interfaces in distinct modules exposing the one 
> > KCS device in the one kernel. If more than one of the chardev modules 
> > is configured in and one of them fails to initialise themselves with 
> > respect to the device driver I didn't think it was right to fail the 
> > probe of the device driver (and thus remove any chardev interfaces that 
> > did succeed to initialise against it).
> > 
> > But this does limit the usefulness of the device driver instance in the 
> > case that only one of the chardev interfaces is configured in and it 
> > fails to initialise.
> > 
> > So I think we need to decide on the direction before I adjust the 
> > interface here. The patches are architected around the idea of multiple 
> > chardevs being configured in to the kernel build and all are exposed at 
> > runtime.
> 
> Ok, I understand.  The host IPMI driver will attempt to start all
> interfaces, if none fail to come up it will return an error, but if any
> come up it will not return an error.  So it's a similar situation.

That sounds reasonable. I'll implement this strategy.

> 
> I stole that from something else, but I can't remember what.  I don't
> know what the best policy is, really, that was kind of a compromise and
> nobody has complained about it.
> 
> I will say that the success print in aspeed_kcs_probe() needs to not
> happen if there is a failure, though.

With the strategy you outlined above that's easy enough.

Thanks,

Andrew
