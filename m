Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6362B1247
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 23:59:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXH8v4PLFzDr3k
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 09:59:11 +1100 (AEDT)
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
 header.s=fm1 header.b=Jyuy5CkB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OLCayrH0; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXH863TYjzDr3M
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 09:58:29 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E832F5C0127;
 Thu, 12 Nov 2020 17:58:25 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 12 Nov 2020 17:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=IGZ5Ghoz2aAxe5maT5dbOJn+8PXcYsX
 FCKA9wVnUsaQ=; b=Jyuy5CkBmTpgXKEWE/PM2GH+SKTxqVm2/io3BlgqjYkWlUW
 4WxsRBHEaud4R6BSxof+IhanNiocbcoYDUI6OG3V+QK0fyYUN6hN0QyA5DGwrq3D
 xyIeH3Cln3cXWWo6FLKKVm/MXir0XDmn/s8P+jPCYJCNyctEdQtKD7UZxT8qlUGZ
 aIfjjmuIYvkblfRrJz9PgfyRQTYLKUYVZXHsgVXWSgzfWWlY/3bkZqhdJ24kPzbv
 yGQb5rnQ6H2akW/eZRNbbFXWcUmJAHx+8d+iP8b9f2tU0cSpDdKah7eSEWq9hjGD
 ejTpd85fFti8JRfQraTyPK7yYy4PAL+L1AVWcbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IGZ5Gh
 oz2aAxe5maT5dbOJn+8PXcYsXFCKA9wVnUsaQ=; b=OLCayrH086GxK/cmGtylNk
 YRWgapK3Vw8uP6nLpyluLZAID3E4j8rrl25h/emsgc+whcXQVE5Gk5rCAImqDWvD
 pqWGWdPv4z2ykCOteOGZFX52BtFU4n3is6mEGcByenq+D325Q48Gwfn1H1F/UF4C
 R7AgHHyMKYYwZv9NtwoHhe0UhVjwFj1OXTGg7qZf2he/k97C4hk58QjiJO9Lsuwt
 NSW2wFVysc21c4rW8TYC2erp2Pa6HD4QHFr0T3gtuNEYnzeo+CliNSbBv82Z6Uiv
 pQ2jS7KC17X1Zkl48QA74kiU4/0LR+zyT9lFKwnYvkVzWzQBrZbDPeA72gDacKHg
 ==
X-ME-Sender: <xms:Eb6tX-QI9_ry0DvwEnEF5WtAr6Jg-jQ1ZE5_NOAZtWdzcw9AKlSnmg>
 <xme:Eb6tXzy9Uf_6bh9_3-SLMZvN-iQAg2QMIzd92Bb68LThwWJSabwghs41le7ZeVk0J
 mXoUFHwgbH7GaENfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludejmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeetkeeitdevkedtffegieefgfektddu
 vddvgeejgeefjeeitefhleejvefgleffvdenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidplhhkmhhlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Eb6tX73SgZjlP2rxEe2ekegvWWJU7wAhJEMf0s6sTfOypdnRLtnh9w>
 <xmx:Eb6tX6D0uwNWobTR0cjjinE-G0r_PMBPcWlBxdh2x6Fw1AeDkQEOkQ>
 <xmx:Eb6tX3iskvTY_uUFMnaXfEqISAUwQ_SynHJGC98mxLxEP5R2Mv4BZA>
 <xmx:Eb6tX_bzoA4Cd65fVfIcqDOV6m6TzkZLTeUJLhZNrmxwq-d6L4MGxQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 09188E00A6; Thu, 12 Nov 2020 17:58:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <d10e39fa-b8e4-4517-9269-d67045912f54@www.fastmail.com>
In-Reply-To: <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
 <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
Date: Fri, 13 Nov 2020 09:26:24 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>, "Jet Li" <Jet.Li@ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, rashmi.r.v@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey Ed,

On Fri, 13 Nov 2020, at 02:55, Ed Tanous wrote:
> On Wed, Nov 11, 2020 at 9:56 PM Jet Li <Jet.Li@ibm.com> wrote:
> >
> > Hi Ed, Rashmi,
> >
> > IBM are working on supporting NVMe drive health monitoring for some new system designs and have been posting some patches to dbus-sensors (e.g. [1]).
> >
> > [1] https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/38058/
> >
> > As some background our high level requirements are that we need to:
> >
> > 1. Monitor NVMe drive health to supply data for fan management and error logging
> > 2. Support arbitrary drive configurations in the platform(s), which are plugged into removable IO cards
> >
> > As you're no doubt aware, NVMe drive state is exposed via two interfaces:
> >
> > 3. A Basic Management Command over SMBus
> > 4. NVMe-MI over MCTP, via the SMBus MCTP binding
> >
> > And in OpenBMC there are two corresponding NVMe monitoring implementations:
> >
> > 5. phosphor-nvme: Basic Management Command, static configuration
> > 6. dbus-sensors: NVMe-MI over MCTP, dynamic configuration
> >
> > IBM are migrating our BMC designs towards entity-manager and dbus-sensors, and our newer system designs would benefit from dbus-sensor's dynamic configuration via entity-manager (we have reservations about the drive presence GPIO configuration in the phosphor-nvme with respect to our system designs).
> > Zooming out briefly we're looking to, where possible, use upstream code and avoid the use of forks. However, as dbus-sensors uses NVMe-MI over MCTP via libmctp, we have some concerns:
> >
> > 7. Upstream libmctp (openbmc/libmctp) currently implements just two bindings
> >     a. Serial (DSP0253)
> >     b. ASTLPC (Vendor-specific binding)
> > 8. Intel have forked libmctp (intel-bmc/libmctp) and implemented a further two bindings
> >     a. SMBus (DSP0237)
> >     b. PCIe VDM (DSP0238)
> > 9. Both the SMBus and PCIe VDM binding implementations in intel-bmc/libmctp require kernel patches that only exist in Intel's OpenBMC tree
> 
> Nit;  the SMBus side requires one patch which was written by aspeed,
> and was part of the Aspeed original BSP.  That doesn't exist "only" in
> the Intel tree.

The broader point was that it doesn't exist in trees that we care about: 
openbmc/linux or Torvalds' tree. It probably could have been worded a bit 
better.

> 
> It should also be noted, this patch was in fact submitted to the
> kernel, and hopefully looks like it just needs some minor cleanups
> that never got done.
> https://lkml.org/lkml/2018/4/23/835

There's also the issue of the Intel fork of libmctp, so there's a bit of a 
dependency chain of out-of-tree patches going on here. No-one has tried to 
upstream the SMBus binding implementation, probably because no-one has 
completed the job of upstreaming the required kernel interface.

There was a short route to getting the information we want while avoiding 
forks, which was to go via the basic management command (which I acknowledge 
also has its issues).

> 
> PCIe VDM, I agree with you, is only in the intel tree.
> 
> >
> > Finally, for the moment, the data provided by the NVMe Basic Management Command meets IBM's current requirements, and we're using drives that support the Basic Management Command.
> >
> > So the direction we chose is to use entity-manager and dbus-sensors for NVMe drive monitoring, and
> > implement support for the Basic Management Command over SMBus in the NVMeSensor application. To get there, as far as I have determined, we should do the following:
> >
> > 10. Make optional the dependency of NVMeSensor on the forked libmctp
> > 11. Add a compile-time flag to {en,dis}able the MCTP NVMe-MI backend
> > 12. Add a compile-time flag to {en,dis}able the Basic Management Command backend
> > 13. Patch intel-bmc/openbmc to configure NVMeSensor with MCTP NVMe-MI enabled
> > 14. Change the default build configuration of NVMeSensor use the Basic Management Command
> > 15. Enable out-of-tree builds of NVMeSensor by default
> > 16. Add NVMeSensor unit tests
> > 17. Enable CI for dbus-sensors where we can / is necessary
> >
> >
> 
> You've listed quite a few things here, but I'm not following "why" we
> need two NVMe implementations.  MCTP NVMe-MI is more feature rich, and
> is much better supported than its MI basic brethren, and generally
> provides more information.  Considering we have patches to do it, why
> don't we just work on getting the required patch upstreamed?

As above, it's not just the one required patch to the kernel, we also have to 
get the libmctp SMBus binding implementation upstream. Putting on my libmctp 
maintainer hat, I'd like to see some effort from Intel on both of those fronts.

>  On top
> of that, the committee that writes the NVMe-MI spec keeps threatening
> to deprecate it, so we might end up with code that's used for one
> generation, then never again.  I really don't like the idea of having
> a second NVMe subsystem just because one is _slightly_ easier to
> write. 

I disagree with "_slightly_" if you account for the MCTP stack that goes with 
it, and the fact that the kernel and libmctp code is not yet upstream.

> If there's other good technical reasons why a user would
> prefer MI-basic, and we can get those reasons written down, I'm happy
> to hear them, but if the overall reason is "we don't want to upstream
> code to the kernel" that doesn't seem like a good enough justification
> to build out support for both;

Implementing the SMBus MCTP binding around the i2c-slave-mqueue kernel 
interface is just a stop-gap solution in place of the (continually deferred) 
in-kernel socket-based MCTP implementation (no-one besides Jeremy has really 
put significant effort into collaborating with me on that concept). So if we're 
aiming for stop-gaps, why not implement support for the basic management 
command given the rest of the code is out-of-tree?

The trade-offs here seem to be the crux of the discussion.

>  Especially considering the MI basic
> functionality probably would best be done as a kernel driver.

Right, that's an interesting idea.

> 
> It should also be noted if we end up doing this, I'd probably advocate
> for it to be its own separate sensor, distinct from the MCTP one,
> because from a BMC perspective, it has very little in common with the
> existing NVMe sensor (different protocols, different IO loops, ect),

The difference in IO loop does have an impact here - I hadn't completely 
appreciated how we'd make the synchronous call fit into the current code. The 
hack approach was to just not worry about it for the moment. However, 
implementing the basic command backend isn't actually that much of a change; 
it's a bit of a reorganisation of the NVMeContext class and a small encoder / 
decoder for the SMBus commands.

> and would probably be a good candidate for adding the hwmon.  Also, it
> would need to be distinctly selectable from the entity-manager json,
> as some drives don't possess support for NVMe-MI basic, and we need to
> keep track of which protocol to use in which case.

If both backends were built in, there's never a reason to use the basic 
management command. If only one of the backends is built in then you don't need 
to keep track unless the interface presented on DBus was different depending on 
the backend, but I was hoping we could avoid that.

Thanks for the response!

Andrew
