Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3EB2B13D5
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 02:30:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXLWZ5JhrzDr55
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 12:30:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=jmvURHbu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KNVETwDQ; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXLVV262LzDr3l
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:29:37 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9A821A7C;
 Thu, 12 Nov 2020 20:29:31 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 12 Nov 2020 20:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=UIMAxUZvmRaERYVZDjPNrYM+Jd4I0JR
 al2Znz4H5Xq0=; b=jmvURHbuYVtgu0znIXB9vjh/OgzcHBtXqhglBMxqNClGvdT
 NZRzXrKlYzTjkKv/FeJAaryY6Rq9K4YNF/TKAezU+2Exi8tkCFLTFitYIIg8vg2P
 65b5TbsQeRs6u6VW3/sNtPrBJpJrfwFm5Xt0RZ5tSptIbW4p+0TeUiQEJqCCoPms
 R94hSAG07jDRpwnugkGVFPJAwH2ZjXf4g/vkGDkPDGbZfAbjG3YR790wHkAZcvKY
 Lq/0Gmy3ssUJrnLql+9ksPXE8aeMUWsgoyFTrXUO8Ni44c003q6hPBcktstmsquP
 w3lIT8cPwAX5sfoq0nBfb7GlILBq07AoiahFWWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UIMAxU
 ZvmRaERYVZDjPNrYM+Jd4I0JRal2Znz4H5Xq0=; b=KNVETwDQrI9VselPfZMRJK
 tuskI/yMy0Vsj5JqHcHhc+mNSPKGaAgrO6+dQ3hZZ1vr06U7HVI95mANktbuegss
 p4rWXEkKRlQsbjhMRgc7v7F2Sv1Rtm4lmnkwWRmcoTEq/N+LOeyfrXP9yZSBZFea
 pQwmoBp1ocSOOROxiAa37ACqNUe0RsYhhGCf5fzTS7uzmy7AT0FrdLCcsn6TSW3Q
 +pJOVRy5Qm5po0PyAe/XTsDpgE8qF9Pf926ntLrxqM02lNESyB9Ppv0P1Ae4sm15
 tWFMd70nBINbxPf6ECSs1qq+FphXwbBoj7GFbT4wYymbqp84TaP2AlcGyrKsvR0g
 ==
X-ME-Sender: <xms:euGtX8wPiK1rnz4CoFyVyxiKayr7kOBI-GjWRlFx7-0_XRS-3_pj8A>
 <xme:euGtXwQeJuFGn6GRePLyLSuQwnh0GDB-O_X_LpCkxr1aWXHvyO6vcU1ERg6YT7jwY
 iTP4tUintXpiq-njg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:euGtX-W3QjcNRHBDGFv8XJFAa68sFyRsDeYrQEu2YqKOfvzH7aM-eA>
 <xmx:euGtX6h2n9r4rw0kW-wk38AKn5BopV_mJAgMP1P4KU0jWN_XZsO-nQ>
 <xmx:euGtX-A5pKmM-9GoBgK7KhO-eCjIH6qqDFj5gCq1-kFWSEquKT99xg>
 <xmx:e-GtX_6u39IrrXlrjvXBM-ArlCMW9kze4bfjh7aZ82weZTb1A4ZP3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59636E00C1; Thu, 12 Nov 2020 20:29:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <32cf6ea5-6f1a-42ce-bbae-fb76adf61a89@www.fastmail.com>
In-Reply-To: <CACWQX81TQfrM+c9f_K_Zx4ScJBKfKH3=Wzx7T-_AWpN=wYegxw@mail.gmail.com>
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
 <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
 <d10e39fa-b8e4-4517-9269-d67045912f54@www.fastmail.com>
 <CACWQX81TQfrM+c9f_K_Zx4ScJBKfKH3=Wzx7T-_AWpN=wYegxw@mail.gmail.com>
Date: Fri, 13 Nov 2020 11:59:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>
Subject: Re: support NVMe drive health monitoring
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
Cc: Jet Li <Jet.Li@ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 rashmi.r.v@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > > >
> > > > So the direction we chose is to use entity-manager and dbus-sensors for NVMe drive monitoring, and
> > > > implement support for the Basic Management Command over SMBus in the NVMeSensor application. To get there, as far as I have determined, we should do the following:
> > > >
> > > > 10. Make optional the dependency of NVMeSensor on the forked libmctp
> > > > 11. Add a compile-time flag to {en,dis}able the MCTP NVMe-MI backend
> > > > 12. Add a compile-time flag to {en,dis}able the Basic Management Command backend
> > > > 13. Patch intel-bmc/openbmc to configure NVMeSensor with MCTP NVMe-MI enabled
> > > > 14. Change the default build configuration of NVMeSensor use the Basic Management Command
> > > > 15. Enable out-of-tree builds of NVMeSensor by default
> > > > 16. Add NVMeSensor unit tests
> > > > 17. Enable CI for dbus-sensors where we can / is necessary
> > > >
> > > >
> > >
> > > You've listed quite a few things here, but I'm not following "why" we
> > > need two NVMe implementations.  MCTP NVMe-MI is more feature rich, and
> > > is much better supported than its MI basic brethren, and generally
> > > provides more information.  Considering we have patches to do it, why
> > > don't we just work on getting the required patch upstreamed?
> >
> > As above, it's not just the one required patch to the kernel, we also have to
> > get the libmctp SMBus binding implementation upstream. Putting on my libmctp
> > maintainer hat, I'd like to see some effort from Intel on both of those fronts.
> 
> Fair point.  Considering I wrote the original libmctp smbus patch, I'm
> far from blameless in this situation, despite my change in email
> address.

:)

> 
> >
> > >  On top
> > > of that, the committee that writes the NVMe-MI spec keeps threatening
> > > to deprecate it, so we might end up with code that's used for one
> > > generation, then never again.  I really don't like the idea of having
> > > a second NVMe subsystem just because one is _slightly_ easier to
> > > write.
> >
> > I disagree with "_slightly_" if you account for the MCTP stack that goes with
> > it, and the fact that the kernel and libmctp code is not yet upstream.
> 
> Let me rephrase, if we were to write this as a hwmon driver in
> torvalds/linux, would this be more or less effort than trying to get
> the mctp driver stack upstreamed along with the mslave device driver?
> I had assumed more, but maybe not?

Probably the hardest bit of the i2c-slave-mqueue patch is the energy it 
generally takes to argue for new userspace interfaces (answering the question 
of whether it's the right abstraction). I imagine it's generally preferred to 
implement slave behaviour in-kernel (which is why a userspace interface doesn't 
already exist).

This is the attraction of the in-kernel MCTP implementation: we'll have a much 
easier time arguing for the abstraction because if you squint, MCTP was 
designed at a high level to look like an IP network, and with this approach we 
won't have incoherent per-device interfaces sticking out of the kernel to 
support the binding implementations in libmctp.

If the MI-basic data fits into the hwmon abstractions, I expect that might 
almost be an easier route.

> 
> In re-reading my last email, it made me sound like I'm anti- MI-Basic.
> To be clear, I really have no problem with adding MI-Basic support in
> dbus-sensors.  I'd like to see it made an explicit and separate option
> in the per-device configuration, as some devices don't support it, and
> to clear the way for if we ever get the existing (or maybe a new)
> nvme-sensor buildable by more than just my former teams fork.

Okay.

> 
> >
> > > If there's other good technical reasons why a user would
> > > prefer MI-basic, and we can get those reasons written down, I'm happy
> > > to hear them, but if the overall reason is "we don't want to upstream
> > > code to the kernel" that doesn't seem like a good enough justification
> > > to build out support for both;
> >
> > Implementing the SMBus MCTP binding around the i2c-slave-mqueue kernel
> > interface is just a stop-gap solution in place of the (continually deferred)
> > in-kernel socket-based MCTP implementation (no-one besides Jeremy has really
> > put significant effort into collaborating with me on that concept). So if we're
> > aiming for stop-gaps, why not implement support for the basic management
> > command given the rest of the code is out-of-tree?
> 
> It should be noted, it's our intention to start working on an
> upstreamable mctp socket kernel driver in the near (1-2 quarters)
> future.

Fantastic! This might even align with my (continually revised) timeline. Please 
do get in touch when you start to look at the problem.

>  That doesn't really change this discussion, but figured it
> was worth pointing out.  If we land MI-basic, and have a little bit of
> luck, maybe it doesn't have to live for long.

Yep, I'd be happy to forget about MI-basic once we have appropriate MCTP 
support.

> 
> >
> > The trade-offs here seem to be the crux of the discussion.
> >
> > >  Especially considering the MI basic
> > > functionality probably would best be done as a kernel driver.
> >
> > Right, that's an interesting idea.
> 
> This was just an idea;  A userspace-only nvme-mi setup would probably
> be fine IMO as well, depending on what aligns with your schedule.
> 
> >
> > >
> > > It should also be noted if we end up doing this, I'd probably advocate
> > > for it to be its own separate sensor, distinct from the MCTP one,
> > > because from a BMC perspective, it has very little in common with the
> > > existing NVMe sensor (different protocols, different IO loops, ect),
> >
> > The difference in IO loop does have an impact here - I hadn't completely
> > appreciated how we'd make the synchronous call fit into the current code. The
> > hack approach was to just not worry about it for the moment. However,
> > implementing the basic command backend isn't actually that much of a change;
> > it's a bit of a reorganisation of the NVMeContext class and a small encoder /
> > decoder for the SMBus commands.
> 
> If we can fit it cleanly into the application that's there, great;  If
> it makes more sense as another app, fine too.  I haven't looked at it
> in depth.
> 
> >
> > > and would probably be a good candidate for adding the hwmon.  Also, it
> > > would need to be distinctly selectable from the entity-manager json,
> > > as some drives don't possess support for NVMe-MI basic, and we need to
> > > keep track of which protocol to use in which case.
> >
> > If both backends were built in, there's never a reason to use the basic
> > management command. If only one of the backends is built in then you don't need
> > to keep track unless the interface presented on DBus was different depending on
> > the backend, but I was hoping we could avoid that.
> 
> See above.  I'd really prefer if this were a per-device setting, not a
> per-build setting.

Right, my sense in reading what you wrote was that you were pushing back on the 
idea on the basis that we'd have to differentiate in the entity-manager config. 
But it sounds like you're actually not fussed about that and even consider the 
idea in a positive light given what you've written below:

>  nvme-mi support is spotty at best, and buggy
> nvme-mi mctp implementations are also common.  I'd rather we
> explicitly select one that works well per-device type, rather making
> it a build time option.

Andrew
