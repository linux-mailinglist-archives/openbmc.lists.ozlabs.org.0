Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282C2B3BF8
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 05:03:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZFn70NnhzDqPk
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 15:03:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=GhroauiT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CzmEbkaI; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZFmD0D4KzDqNF
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 15:03:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 151005C0054;
 Sun, 15 Nov 2020 23:03:04 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 15 Nov 2020 23:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=5NvUQcgwd+bNlx6UT6NqphKOKpbf6r3
 xzqjQH0N00w4=; b=GhroauiTGgkZuXB6U0ppyTSZ2xXqwfWclgFvYw0CqQcgOzR
 a4yYzUGAE4VwgAfHvSGGhOiWQv852CffXhKzEKZgQ9qy9njE2e0M3UnADEoxWrXB
 TEgz49Xk1q9q6pjTJ6DKWykt1YbxFf91IYJy7ov40d7AmDO1a6eJJKZcCAbeHS2k
 WbX5KOEMzoJMkMLS5nVkPS2UytruOY2Qa8NHIVO+wsFSAygD/mfwjO4uNBPlSLsV
 z8OQKcW9uqkqBWqxzPpx3BX/1VhJjaym8RgIEJbWK+tug8OoI+TRMWUdns6uc2sn
 Qvd1IlUHXPwBE8YBsfA5NtvUdLxN3tsRvlZcpVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5NvUQc
 gwd+bNlx6UT6NqphKOKpbf6r3xzqjQH0N00w4=; b=CzmEbkaIoJz/JuEXVJpxvc
 nAfCK2b+Gg8xZ/w1Y1xtGOysIk5ptNny+0ybxf0LAA/tojPMGVjzKMVlWprpJuSQ
 gtS09OSbgEOWOFjLxu0XF+fjQpMArzS8WzPl0R8fIRXOnmZBsdgfjZiDJSss8UE0
 sffO5CsZKpK8TBoCOGKCE1Ofve/RYJZXbRJnbPlN1C2faVz2Lt7ugiJKBGSEDEr4
 gAUJKO34fqqvYrjSwP80B6ogf5sABYcqFtCkRrrUw6iM/lRn/rLQki96ZtvJOqSV
 5jjitf8Yks1EjKPk8y7Y9gmrVNtDVP1c6OZjsbsU6R4g/fRT7EJkUHlW0M8E86dQ
 ==
X-ME-Sender: <xms:9vmxX3yMt1KaNYXUgouB4t9vlZWET1MZnavF6EQVPY_rrQZKNCgIUQ>
 <xme:9vmxX_RUpHLBStSXgcrQUYBvlPqs4HGAtlrsihP0z0nCs8O_u9-jqtvydKK8yDFws
 PGd51LEQkv3yUbX3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeftddgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9vmxXxW8m1QwgEOQD0hWKqWw5mtn0JUzB4M3EzpwVpFB8GUk72Hmpg>
 <xmx:9vmxXxhfic8zwMCe1vHGp414s2Wk-tqMPAn7tmfhRf3iaYvi0gxS9A>
 <xmx:9vmxX5DRUH_2aiPek_xAkDmo9o0vlHMXxi1mcrYP91LskZJjQqcrSg>
 <xmx:-PmxX241lNRMKgRVJ1HN7JMsVoHCyFYs0HaZgZOaokMwFqmuMSAVbg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89CA8E00A6; Sun, 15 Nov 2020 23:03:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <7f0c4e81-4b1e-4c64-9e25-07736b7838e6@www.fastmail.com>
In-Reply-To: <32cf6ea5-6f1a-42ce-bbae-fb76adf61a89@www.fastmail.com>
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
 <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
 <d10e39fa-b8e4-4517-9269-d67045912f54@www.fastmail.com>
 <CACWQX81TQfrM+c9f_K_Zx4ScJBKfKH3=Wzx7T-_AWpN=wYegxw@mail.gmail.com>
 <32cf6ea5-6f1a-42ce-bbae-fb76adf61a89@www.fastmail.com>
Date: Mon, 16 Nov 2020 14:32:42 +1030
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



On Fri, 13 Nov 2020, at 11:59, Andrew Jeffery wrote:
> > > > It should also be noted if we end up doing this, I'd probably advocate
> > > > for it to be its own separate sensor, distinct from the MCTP one,
> > > > because from a BMC perspective, it has very little in common with the
> > > > existing NVMe sensor (different protocols, different IO loops, ect),
> > >
> > > The difference in IO loop does have an impact here - I hadn't completely
> > > appreciated how we'd make the synchronous call fit into the current code. The
> > > hack approach was to just not worry about it for the moment. However,
> > > implementing the basic command backend isn't actually that much of a change;
> > > it's a bit of a reorganisation of the NVMeContext class and a small encoder /
> > > decoder for the SMBus commands.
> > 
> > If we can fit it cleanly into the application that's there, great;  If
> > it makes more sense as another app, fine too.  I haven't looked at it
> > in depth.
> > 
> > >
> > > > and would probably be a good candidate for adding the hwmon.  Also, it
> > > > would need to be distinctly selectable from the entity-manager json,
> > > > as some drives don't possess support for NVMe-MI basic, and we need to
> > > > keep track of which protocol to use in which case.
> > >
> > > If both backends were built in, there's never a reason to use the basic
> > > management command. If only one of the backends is built in then you don't need
> > > to keep track unless the interface presented on DBus was different depending on
> > > the backend, but I was hoping we could avoid that.
> > 
> > See above.  I'd really prefer if this were a per-device setting, not a
> > per-build setting.
> 
> Right, my sense in reading what you wrote was that you were pushing back on the 
> idea on the basis that we'd have to differentiate in the entity-manager config. 
> But it sounds like you're actually not fussed about that and even consider the 
> idea in a positive light given what you've written below:
> 
> >  nvme-mi support is spotty at best, and buggy
> > nvme-mi mctp implementations are also common.  I'd rather we
> > explicitly select one that works well per-device type, rather making
> > it a build time option.

So I'm considering how we can wrap up this discussion. I think the following 
points have been made:

1. We have entity-manager indicate in its NVMe-MI configuration which interface 
we'd like to use to fetch the MI data (MCTP vs basic). This is potentially 
useful to avoid bugs in the drive's MCTP support.

2. Perhaps we should have distinct applications to handle fetching MI data via 
MCTP vs basic if the differences in communication model are too difficult to 
reconcile.

3. That (maybe) we rip out the existing NVMeSensor implementation from 
dbus-sensors on the basis that the SMBus MCTP code stack is not in great shape.

We need to hash out what 1 would look like, but I don't think that discussion 
should immediately get in the way of addressing 2 and 3. If 3 is on the cards 
and we handwave over the appropriateness of the NVMeSensor app IO loop for the 
moment, then it's indistinguishable from having a build-time switch to disable 
the MCTP backend in the current implementation.

So I think we can progress along the lines of the patches that Jet's proposing 
(adding a flag to {en,dis}able MCTP support) until we consider the MCTP backend 
mature enough to enable by default?

Cheers,

Andrew
