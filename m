Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F502B1306
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 01:07:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXJgp31k5zDqyg
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 11:07:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Sn5iWaR3; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXJfj50DWzDqXB
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 11:06:34 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id c18so7057443ybj.10
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 16:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/DZxUq4dYI4uNXjX23i64MRHu13ENYuvQvbAE/1o/g=;
 b=Sn5iWaR3EdnE+K5G6ePneUtqI51AfXDQIQ2vMI3E4pZGVq4p/pjBXJaq/9lMcOEBEI
 U18+xktsBSzM2sH2nI8+fN860xdmTjbnat+iu4ej1BT6tbYbEREezWRTWGErPBfxEsny
 ZNKsciwL8WQ2LqJC2X2/qC1btRKgnus+M30XEZwJDVcaE1PlcqAw/4030Hyez/Dlo6oK
 fWPvrxwXtjxN/ymal48YNQsYxEWM6yn3ISwU3fCfx4blSB1Ofazy2Zo5krGU9H3mi3Is
 3HTCawawe2yLd/mcOF80RljMQZHuWnK0iKptKHhNet4w9sOkaELKCAtdM+E9MP8XeRWx
 jc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/DZxUq4dYI4uNXjX23i64MRHu13ENYuvQvbAE/1o/g=;
 b=sK6JWw59akhkAtxoeRQVwGfFtyy184jX/SjhB7MrepqybGacN7wX8CZ1Dv+/IgbJZ9
 iJfAAA58VGV6yQ82ULH0MoGv/or7btg/7phLE2ecD3zJhOcrMz+y6pSsTgTceqcVWfpm
 nt5Eu9mFPR/ooRYsLfuzwip/7tgZJZgRH1jCwdRx6xiHVbGvx1TidmsFz2Ra1xN53M4r
 DMqznx3zvZ3u4n2/N6iqNEpkWLkazeqA5aRFf87MpE+1iaI5lB1RD7wUFwOdHFkH6L5k
 Ip87XhyuDHZCJzXIO2gSAD7p8Y8Au5GWPSmLfR43lKWwzZqXxVaUi7ll6GDRMIYHG6bI
 kY1A==
X-Gm-Message-State: AOAM531e6NTNTsToXff8vuTn8dqVORnEJAx7MZzu+HgMMWN9246NdVZO
 szGtG3FYlsdJDeGDZjLsEQG0gGOGN1XGTzp4Mxv+kg==
X-Google-Smtp-Source: ABdhPJzDVun23iVfQHhFw9VovFKSB78BVbZ6eaVelnqS+TbNwI/X+T306mWYB/GdVODt0kbRBHyzLNjiJi188Kc5fCo=
X-Received: by 2002:a25:b11:: with SMTP id 17mr2329525ybl.203.1605225990835;
 Thu, 12 Nov 2020 16:06:30 -0800 (PST)
MIME-Version: 1.0
References: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
 <CACWQX82Ab4bXSrn2f+LQqbA3nVJ32UPVEOzQ97RXU+iLp9u0uw@mail.gmail.com>
 <d10e39fa-b8e4-4517-9269-d67045912f54@www.fastmail.com>
In-Reply-To: <d10e39fa-b8e4-4517-9269-d67045912f54@www.fastmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 12 Nov 2020 16:06:19 -0800
Message-ID: <CACWQX81TQfrM+c9f_K_Zx4ScJBKfKH3=Wzx7T-_AWpN=wYegxw@mail.gmail.com>
Subject: Re: support NVMe drive health monitoring
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Nov 12, 2020 at 2:59 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hey Ed,
>
> On Fri, 13 Nov 2020, at 02:55, Ed Tanous wrote:
> > On Wed, Nov 11, 2020 at 9:56 PM Jet Li <Jet.Li@ibm.com> wrote:
> > >
> > > Hi Ed, Rashmi,
> > >
> > > IBM are working on supporting NVMe drive health monitoring for some n=
ew system designs and have been posting some patches to dbus-sensors (e.g. =
[1]).
> > >
> > > [1] https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/38058=
/
> > >
> > > As some background our high level requirements are that we need to:
> > >
> > > 1. Monitor NVMe drive health to supply data for fan management and er=
ror logging
> > > 2. Support arbitrary drive configurations in the platform(s), which a=
re plugged into removable IO cards
> > >
> > > As you're no doubt aware, NVMe drive state is exposed via two interfa=
ces:
> > >
> > > 3. A Basic Management Command over SMBus
> > > 4. NVMe-MI over MCTP, via the SMBus MCTP binding
> > >
> > > And in OpenBMC there are two corresponding NVMe monitoring implementa=
tions:
> > >
> > > 5. phosphor-nvme: Basic Management Command, static configuration
> > > 6. dbus-sensors: NVMe-MI over MCTP, dynamic configuration
> > >
> > > IBM are migrating our BMC designs towards entity-manager and dbus-sen=
sors, and our newer system designs would benefit from dbus-sensor's dynamic=
 configuration via entity-manager (we have reservations about the drive pre=
sence GPIO configuration in the phosphor-nvme with respect to our system de=
signs).
> > > Zooming out briefly we're looking to, where possible, use upstream co=
de and avoid the use of forks. However, as dbus-sensors uses NVMe-MI over M=
CTP via libmctp, we have some concerns:
> > >
> > > 7. Upstream libmctp (openbmc/libmctp) currently implements just two b=
indings
> > >     a. Serial (DSP0253)
> > >     b. ASTLPC (Vendor-specific binding)
> > > 8. Intel have forked libmctp (intel-bmc/libmctp) and implemented a fu=
rther two bindings
> > >     a. SMBus (DSP0237)
> > >     b. PCIe VDM (DSP0238)
> > > 9. Both the SMBus and PCIe VDM binding implementations in intel-bmc/l=
ibmctp require kernel patches that only exist in Intel's OpenBMC tree
> >
> > Nit;  the SMBus side requires one patch which was written by aspeed,
> > and was part of the Aspeed original BSP.  That doesn't exist "only" in
> > the Intel tree.
>
> The broader point was that it doesn't exist in trees that we care about:
> openbmc/linux or Torvalds' tree. It probably could have been worded a bit
> better.
>
> >
> > It should also be noted, this patch was in fact submitted to the
> > kernel, and hopefully looks like it just needs some minor cleanups
> > that never got done.
> > https://lkml.org/lkml/2018/4/23/835
>
> There's also the issue of the Intel fork of libmctp, so there's a bit of =
a
> dependency chain of out-of-tree patches going on here. No-one has tried t=
o
> upstream the SMBus binding implementation, probably because no-one has
> completed the job of upstreaming the required kernel interface.

Part of me wonders if the best path forward here would be to remove
the NVMeSensor for the time being, then add it back once the patches
have been mainlined.  That might be a little aggressive, but would
give us a clear slate where we can talk about adding nvme-mi basic.
I'll have to ask James why they were merged in the first place and
what the intent was.

>
> There was a short route to getting the information we want while avoiding
> forks, which was to go via the basic management command (which I acknowle=
dge
> also has its issues).
>
> >
> > PCIe VDM, I agree with you, is only in the intel tree.
> >
> > >
> > > Finally, for the moment, the data provided by the NVMe Basic Manageme=
nt Command meets IBM's current requirements, and we're using drives that su=
pport the Basic Management Command.
> > >
> > > So the direction we chose is to use entity-manager and dbus-sensors f=
or NVMe drive monitoring, and
> > > implement support for the Basic Management Command over SMBus in the =
NVMeSensor application. To get there, as far as I have determined, we shoul=
d do the following:
> > >
> > > 10. Make optional the dependency of NVMeSensor on the forked libmctp
> > > 11. Add a compile-time flag to {en,dis}able the MCTP NVMe-MI backend
> > > 12. Add a compile-time flag to {en,dis}able the Basic Management Comm=
and backend
> > > 13. Patch intel-bmc/openbmc to configure NVMeSensor with MCTP NVMe-MI=
 enabled
> > > 14. Change the default build configuration of NVMeSensor use the Basi=
c Management Command
> > > 15. Enable out-of-tree builds of NVMeSensor by default
> > > 16. Add NVMeSensor unit tests
> > > 17. Enable CI for dbus-sensors where we can / is necessary
> > >
> > >
> >
> > You've listed quite a few things here, but I'm not following "why" we
> > need two NVMe implementations.  MCTP NVMe-MI is more feature rich, and
> > is much better supported than its MI basic brethren, and generally
> > provides more information.  Considering we have patches to do it, why
> > don't we just work on getting the required patch upstreamed?
>
> As above, it's not just the one required patch to the kernel, we also hav=
e to
> get the libmctp SMBus binding implementation upstream. Putting on my libm=
ctp
> maintainer hat, I'd like to see some effort from Intel on both of those f=
ronts.

Fair point.  Considering I wrote the original libmctp smbus patch, I'm
far from blameless in this situation, despite my change in email
address.

>
> >  On top
> > of that, the committee that writes the NVMe-MI spec keeps threatening
> > to deprecate it, so we might end up with code that's used for one
> > generation, then never again.  I really don't like the idea of having
> > a second NVMe subsystem just because one is _slightly_ easier to
> > write.
>
> I disagree with "_slightly_" if you account for the MCTP stack that goes =
with
> it, and the fact that the kernel and libmctp code is not yet upstream.

Let me rephrase, if we were to write this as a hwmon driver in
torvalds/linux, would this be more or less effort than trying to get
the mctp driver stack upstreamed along with the mslave device driver?
I had assumed more, but maybe not?

In re-reading my last email, it made me sound like I'm anti- MI-Basic.
To be clear, I really have no problem with adding MI-Basic support in
dbus-sensors.  I'd like to see it made an explicit and separate option
in the per-device configuration, as some devices don't support it, and
to clear the way for if we ever get the existing (or maybe a new)
nvme-sensor buildable by more than just my former teams fork.

>
> > If there's other good technical reasons why a user would
> > prefer MI-basic, and we can get those reasons written down, I'm happy
> > to hear them, but if the overall reason is "we don't want to upstream
> > code to the kernel" that doesn't seem like a good enough justification
> > to build out support for both;
>
> Implementing the SMBus MCTP binding around the i2c-slave-mqueue kernel
> interface is just a stop-gap solution in place of the (continually deferr=
ed)
> in-kernel socket-based MCTP implementation (no-one besides Jeremy has rea=
lly
> put significant effort into collaborating with me on that concept). So if=
 we're
> aiming for stop-gaps, why not implement support for the basic management
> command given the rest of the code is out-of-tree?

It should be noted, it's our intention to start working on an
upstreamable mctp socket kernel driver in the near (1-2 quarters)
future.  That doesn't really change this discussion, but figured it
was worth pointing out.  If we land MI-basic, and have a little bit of
luck, maybe it doesn't have to live for long.

>
> The trade-offs here seem to be the crux of the discussion.
>
> >  Especially considering the MI basic
> > functionality probably would best be done as a kernel driver.
>
> Right, that's an interesting idea.

This was just an idea;  A userspace-only nvme-mi setup would probably
be fine IMO as well, depending on what aligns with your schedule.

>
> >
> > It should also be noted if we end up doing this, I'd probably advocate
> > for it to be its own separate sensor, distinct from the MCTP one,
> > because from a BMC perspective, it has very little in common with the
> > existing NVMe sensor (different protocols, different IO loops, ect),
>
> The difference in IO loop does have an impact here - I hadn't completely
> appreciated how we'd make the synchronous call fit into the current code.=
 The
> hack approach was to just not worry about it for the moment. However,
> implementing the basic command backend isn't actually that much of a chan=
ge;
> it's a bit of a reorganisation of the NVMeContext class and a small encod=
er /
> decoder for the SMBus commands.

If we can fit it cleanly into the application that's there, great;  If
it makes more sense as another app, fine too.  I haven't looked at it
in depth.

>
> > and would probably be a good candidate for adding the hwmon.  Also, it
> > would need to be distinctly selectable from the entity-manager json,
> > as some drives don't possess support for NVMe-MI basic, and we need to
> > keep track of which protocol to use in which case.
>
> If both backends were built in, there's never a reason to use the basic
> management command. If only one of the backends is built in then you don'=
t need
> to keep track unless the interface presented on DBus was different depend=
ing on
> the backend, but I was hoping we could avoid that.

See above.  I'd really prefer if this were a per-device setting, not a
per-build setting.  nvme-mi support is spotty at best, and buggy
nvme-mi mctp implementations are also common.  I'd rather we
explicitly select one that works well per-device type, rather making
it a build time option.

>
> Thanks for the response!
>
> Andrew
