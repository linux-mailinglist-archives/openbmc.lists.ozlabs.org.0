Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E63672763CE
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 00:32:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxXxG4RRkzDqbD
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 08:32:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=08HdHg6k; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxXwV1kJRzDqWG
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 08:31:52 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id j76so905283ybg.3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CeNDDyMvBCHbXNEN9owXyGWp6zh6N/tY1OnQI7RN/fQ=;
 b=08HdHg6ktfk7/9QasYivNH0ZuRltwSTt9ukNQO+zYk/wN3FtTQRTegR1wf/K3MDSe3
 5rsP1TexbRfsGD5ujlcNpVJ5WR74SQztkqqmXFxubABfjsu9f9O4kSCEoWJbwzrl5oBc
 hcF+jzBZtxd4PMOfXnnKIFnkKWJo3eT/Qo/Ai9DQth7+Dke9UxJN+1o4nmk6DCHIxwhT
 cpIX6YGS3L3V7RsXR7MI3USpycDM1/sLpwyZoVS9g1dymZPGsna3vnwAvqUTwyO3P461
 eQkSBtnxgZE4NDo2fYiVRYqtC+DGvfBI/My6SZ6lmfaXIq6rCRA/qkkGZpGE3fbmgxJH
 nfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CeNDDyMvBCHbXNEN9owXyGWp6zh6N/tY1OnQI7RN/fQ=;
 b=pzfD0o/9DestFUC9hXQG9KEvKsef76VcTfOHjNdJZ+PGgPCFAZ1+5c1e3cta8EDNVJ
 +HBAME1RAWrR6pE+1L/sULVwLMdrPZeKuTO0elcd8Z9XVgER62sjdsn555+Ha76atzfG
 ra9J5RD+z9xpIaTmbURraO85WCiSFb/3nYGZyniJW/Fiu3ZYjU3P7/UdRwO48/gxLAN/
 0qSbLC6oitaCoFJMjELjWYuWANzWiarsvJkL9cwK9myJn//GXcaFnCwRMUKSr4zgahqQ
 88fyHC3atRbIr6kVTzCL+0ghOCEPdhlV/ZFGiFxldPt5vwX8Lt1ExFW8n/z3JWvZ12ze
 tOrQ==
X-Gm-Message-State: AOAM532Gj6orxBYg9667uvgyPjiEXnd69CYey24pzDXWWT8Zp8DOKZRZ
 zMb8KTyZuM9E7K9D6hPoE6UcoQabmvFpluyNjhvc+Q==
X-Google-Smtp-Source: ABdhPJyXVvzhyRRPl9un2fhIbWwK8p85SLz8HbfH73Q9LwZaqcotmYpGbVY57sgDTO65jmwqXBaYueVnq9dJ015Cb+I=
X-Received: by 2002:a25:1581:: with SMTP id 123mr2926482ybv.480.1600900305840; 
 Wed, 23 Sep 2020 15:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com> <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
In-Reply-To: <20200923214237.GV6152@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 15:31:34 -0700
Message-ID: <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
Subject: Re: Chassis reset
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 23, 2020 at 2:42 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 23, 2020 at 02:12:10PM -0700, Ed Tanous wrote:
> > On Wed, Sep 23, 2020 at 1:21 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > >
> > > On Wed, Sep 23, 2020 at 12:26:58PM -0700, Ed Tanous wrote:
> > > > On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > > >
> > > > > On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
> > > > > >
> > > > > > Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/openbmc_project/chassis_system0.
> > > > > > Later one is used for AC reset.
> > > > >
> > > > > Can we do a query to see if 'chassis_system0' exists and use it first
> > > > > and then 'chassis0' if not?
> > > >
> > > > I don't think it's that simple.  The way the dbus APIs are defined,
> > > > one Redfish chassis needs to call the chassis0 path, the other needs
> > > > to call the chassis_system0 path.  We'd need a way to key off which
> > > > one is which.  I haven't seen any entity-manager configs get checked
> > > > in for a "multinode chassis" entity type, so whatever interface we use
> > > > to describe that will probably be what we need to key off to make that
> > > > path distinction.
> > >
> > > In Redfish this would be the system path that maps to chassis_system0
> > > and not the chassis path.  In Redfish today, chassis doesn't do a whole
> > > lot except allow you to power cycle the host.  Most of the control is in
> > > System.
> >
> > The way Vijay describes it, it's resetting the Chassis (ie, removing
> > power from the board itself). The redfish System resource is meant to
> > model the host, and shouldn't be resetting the BMC.  Maybe I
> > misunderstood, and this is actually just a host reset?
>
> How do you determine this about Redfish's ComputerSystem?  It seems
> really ambiguous.  The only words I can find are this:
>
> | The ComputerSystem schema represents a computer or system instance
> | and the software-visible resources, or items within the data plane, such as
> | memory, CPU, and other devices that it can access.  Details of those resources
> | or subsystems are also linked through this resource.

I'm not sure where I got that interpretation;  Maybe by looking at a
lot of Redfish systems?  Maybe from having access to DMTF discussions?
 I'm not really sure.  There's a lot of intent like this that doesn't
get captured in the spec, or is captured in discussions.

In this case, I think the key in the above is "software visible
resources" and "items within the dataplane", of which the power rails
generally are not within the dataplane.  In practice, it tends to
expose a place where you need separation of privileges.  A cloud user
with access to a System node might have permission to power
cycle/reset their System resource, but shouldn't have access to AC
cycle the whole platform/chassis/bmc, hence, the resources need
separated.
There's also the "PoweredBy" links that kinda hint (in a really round
about way) about how the power relationships are supposed to be
organized.


>
> You understood correctly though.  This is effectively the same as if you
> had a PDU and toggled power on the whole device.  Or pulled it from an OCP
> rack and plugged it back in.
>
> > > > > I think we need to do some enhancement to x86-power-control though also
> > > > > to only create this 'chassis_system0' object if configured.  I believe
> > > > > the current code change you did does it always, even if the
> > > > > systemd-target is empty.
> > > >
> > > > I keep getting the feeling that xyz/openbmc_project/chassis_system0 is
> > > > just overloading what /xyz/openbmc_project/chassis0 is intended to do,
> > > > x86-power-control just had that already defined, so we went another
> > > > direction.  I wonder if we just need to make the "Can I do a real AC
> > > > reset" configurable, and have it change the behavior of
> > > > /xyz/openbmc_project/chassis0 in that case.
> > >
> > > No, these are not overloading each other.  They are vastly different.
> > >
> > > host0 + chassis0 make up the 'BIOS/OS control' and '12V power on rails'
> > > portions of host power control respectively.
> >
> > Right, I think what I was saying is that we need a mode where chassis0
> > is freed from host control, and that would simplify the problem a bit,
> > as the chassis0 api would just do the "right" thing for the platform.
> > If the platform is capable of an AC reset, do that, if it's not, do a
> > host reset as x86-power-control currently does.
>
> 'chassis0', in dbus, is the DC power control that goes along with booting
> the host though.  It is not ever related to AC reset.

Gotcha.  On most of my platforms, there's no separation between 12V
rail and host power state.  One cannot exist (for more than a couple
seconds) without the other, so there's no need to independently
control them.

>
> >
> > >  chassis_system0 controls the
> > > '12v + 5V standby rails' part of the system.  In my opinion, it should
> > > only be present when a system actually allows manipulation of the
> > > standby power, but that isn't how it is currently implemented.
> >
> > Sure, that seems like a fine way to model it, but then we need to come
> > up with an API to "steer" the Redfish API to the right resource so we
> > don't break backward compatibility for the things that work today.
> > That seems harder, and more error prone, but could certainly be
> > defined.  Whether that shows up as chassis0, or we just redirect to
> > host0 if chassis0 doesn't exist seems fine to me.
> >
> > If I can clarify what you're proposing.
> >
> > host0 controls the host.
> > chassis0 also controls the host.
> > chassis_system0 controls the chassis power unit.
>
> The only clarification I'd say here is that 'chassis_system0' controls
> the Host + BMC.

If it's really host+bmc, and not a complete reset of the board then
redfish doesn't really have a combined resource that can be used here.
BMC (which maps to the Manager resource) and Host (which maps to the
System resource) are treated as separate things.  If you want to reset
both, I suspect you need to issue 2 redfish actions.

>
> I'm not understanding what you mean by "come up with an API to steer the
> Redfish..."  I think everything is specified here at a dbus level.  The
> issue is figuring out the appropriate Redfish model of
> Chassis/ComputerSystem objects (along with the included Resource.Reset
> types).  To a casual reader, who hasn't been involved much in Redfish
> implementation, the current mapping of these ResetTypes seems fairly
> arbitrary.

Some might be arbitrary, but most are explicit and chosen on purpose,
especially in the case of the System schema.  The Chassis schema is a
little more lax, as it's more of a backward compatibility thing today.
I think you (Vijay) are the first person trying to model it
"properly".

What I mean is that the current Redfish definition of Chassis points
the PowerCycle action to chassis0.  That PowerCycle action now needs
to point at multiple things, chassis0 if we don't support AC reset, or
chassis_system0 if we do.  That is the "steering" I was referring to.

>
> With CIM there use to be these Profile documents that showed "the right
> way" to fit all these pieces together.  Does that not exist with
> Redfish?

>:-|   Unfortunately, no, and this gives me no end of heartache.  DMTF has some slightly better resources and discussions like this behind member logins.

>  How does any external application consume Redfish in a
> consistent way?

Very carefully, and ideally with a Redfish profile that defines what
resources your application requires, and tests that verify that your
profile is fully supported, which is a whole other level of
indirection on top of the Redfish spec.

>
> --
> Patrick Williams
