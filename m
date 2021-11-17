Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B245501B
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 23:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvcN56xYpz305t
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 09:01:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6sgDORuR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6sgDORuR; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvcMh51shz2xtj
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 09:01:34 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id bi37so15434350lfb.5
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 14:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgR8jbaVxI+7/X094gJhdpYVbew8h81yRO5bvyaI4ZE=;
 b=6sgDORuR9uP8rFDIb6HEr2OI4CqdSJ1oquXWNefwDOOYcA7v2RBjHbrFm/m9986LJi
 +cum+ZX2rJ2HqDTxXjs2or7Bh2joQWfBNTX5sWh7/SO7q+aFExxjjdrU+na1IZN/x3k0
 3faQkY+ZbuWC498CgbJUHExo+kYs8RY8xD9pTWzkVYToRdbNRUCAjn/5L+g+j4IbKKir
 hkP1GKyXgA0R2o/pra0UvKjZ/ns7RgSjYdRk9d2WCPahouGMlYtFGdjaBsKoo0Bz3Pib
 1zkRUK0h4fnErIy9cG86sfDonhFWvigVCg85eEUlQUiTGDsUlADxqcH+Ocl3rPMhxlPm
 VRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgR8jbaVxI+7/X094gJhdpYVbew8h81yRO5bvyaI4ZE=;
 b=xe1I//hYLGpsGCsRSGnWF6BwAgDug9BlrdksD4u3HjhMIY0Jg8xhGg/WoRHWZ2WF2H
 14DC4h4+Ae0qVEUIEYgpeP1pqQ9iIadhq4HWnF5hVolSFfKwMm2tpjPOjpM39xt1upeA
 JOOGcz0A4hdpSQ0yWpig1hehWUASfNVeGp/kaTkJHQe7NxsYDEmGiVGhOcqUuJ13a0A7
 FVGksBQhBsqv7HST1CHpXau+R6hkAYm/V4wtQ2tOiuwTVBmsxcaRAo1AzjmtSCjGpmqY
 nPEeaqV6K6MeI5YjxgSARxRvWY4GJ92ahVq8W90//rjMIc1owyb1WN5Iab/wfW2Pacsb
 5J1g==
X-Gm-Message-State: AOAM530NcgLSmpJYZ54JAAt0sVyM4EPaeekSb0O48DHDF7ThTlyGNPxg
 7MDuzUIZZXf7iTfFFCP7bFT3/VicwNh+Eh4aEEZIbg==
X-Google-Smtp-Source: ABdhPJz30/KRZCV3j2XqDPltaD5HGgUbaVpvbf1F5dx72Ia+/Sc2Uq6B8/fTAl99+C7EzU4CmbIkep0FbqwY3zgUCXY=
X-Received: by 2002:a05:6512:b8f:: with SMTP id
 b15mr18027106lfv.443.1637186489947; 
 Wed, 17 Nov 2021 14:01:29 -0800 (PST)
MIME-Version: 1.0
References: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
 <d6654531-a50b-665f-36a8-0ad1b27bcf88@linux.ibm.com>
 <CAD2FfiHWuYbKhDhCwUn6mgZ6c+GDuZ-DstYuOaPkKTOBg_wWTw@mail.gmail.com>
In-Reply-To: <CAD2FfiHWuYbKhDhCwUn6mgZ6c+GDuZ-DstYuOaPkKTOBg_wWTw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 17 Nov 2021 14:01:19 -0800
Message-ID: <CACWQX83H11CtNZOy1iLE62DHDWx-Uuu==LGtT2KdTH2xL+uKbA@mail.gmail.com>
Subject: Re: Redfish implementation does not supply SoftwareId
To: hughsient@gmail.com
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
Cc: openbmc@lists.ozlabs.org, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 17, 2021 at 1:26 PM Richard Hughes <hughsient@gmail.com> wrote:
>
> On Wed, 17 Nov 2021 at 19:36, Joseph Reynolds <jrey@linux.ibm.com> wrote:
> > Where can we learn more about the interest in getting `fwupd` to run on
> > the BMC?  Links to chat room, email archive, etc?
>
> I don't have much public information I'm afraid. It's a very big
> company using OpenBMC that suggested this just a few weeks ago. I'm
> still not sure if it's a genius or insane idea to be honest. I
> initially thought the latter, but people cleverer than me say the
> former.

The line between insane and genius is more of a venn diagram rather
than a hard line.

>
> > [firmware update]:
> > https://github.com/openbmc/docs/blob/master/architecture/code-update/code-update.md
>
> Super useful, thanks.
>
> > In this context, I understand you are interested in either (A) adding
> > support for a new fwupd method or (B) creating a new OpenBMC function to
> > update the firmware for various host components, or (C) both.  That
> > seems to me like a good fit with OpenBMC.
>
> I think the idea is that fwupd already knows how to install updates on
> an insane number of devices (~32 different update protocols supported,
> everything from DFU, to NVME, to UEFI capsule, Redfish, ATA, Logitech
> HID++, and even MTD) and those could be *used* by OpenBMC saying
> "install *this* on *that*" or even plumbing in OpenBMC to query fwupd
> to say "what updatable devices can you tell me about".

In my dream world (where software is easy):
1. fwupd would compile small enough to be put on every BMC, with
compile options to compile out the modes (and therefore binary size)
that doesn't make sense in a BMC context.
2. We'd write a dbus service (or extend fwupd), and make its data
available to dbus, such that we can hook it up directly to Redfish
FirmwareInventory schemas
3. When we start tackling in-system update use cases (power supplies,
CPLDs, BIOS, ect) fwupd would be the "default" go to, such that we
could share the bmc-specific and in-band update mechanisms in the same
application.  For example, updating a VR or NVMe drive should be
similar whether you're updating from a host-based OS, or from the BMC.

> For both
> actions there's a DBus interface or a JSON data dump available, either
> as an in-process query or just by running the daemon in the
> background. e.g. "fwupdmgr get-devices" is a thin wrapper around the
> GetUpdates DBus call that returns a 'aasv' array of dictionaries blob.
>
> > Do I infer correctly that you got `fwupd` running on the BMC, for
> > example having a working `fwupdmgr` command?
>
> Yes, actually more crazy than that, I got fwupd downloading and
> deploying updates from the LVFS... https://fwupd.org/
>
> See https://twitter.com/hughsient/status/1458922790690635780 for the
> obligatory screenshot. I think the idea is that vendors can use the
> same code in fwupd to deploy firmware onto COTS hardware without
> OpenBMC and onto custom hardware with OpenBMC. i.e. they teach one
> thing how to update the hardware and get to use it in both places.

Any chance you posted the recipe file somewhere for others to hack on
this along with you?

>
> > I understand OpenPOWER system firmware has two firmware packages which
> > are typically packaged together: (1) the BMC firmware image and (2) the
> > host firmware image.  The host image itself contains multiple parts but
> > the BMC does not handle them separately.  Given this, firmware updates
> > are monoliotic and are not done to individual components.  (But note my
> > understanding is limited.)
>
> In some cases the host UEFI firmware is behind some kind of MUX so
> that fwupd needs to know the GPIO to poke to make the MTD device
> appear to the BMC, and then the other GPIO to poke to return control
> back to the host. We have a plugin for that now. I didn't plan to
> update the BMC firmware using fwupd, but I guess if the BMC partitions
> are exposed as MTD devices there's nothing stopping you actually doing
> that. Intererstingly that would also mean that you could ship OpenBMC
> kernel or ro updates via the LVFS, for instance.

YES! ! ! ! !  In a perfect world, we could also have OpenBMC CI
automatically post to LVFS when we cut major/minor firmware revisions,
and give OpenBMC users a "check for updates" button/api that could
automatically invoke fwupd locally to check for updates.

>
> I saw some of the code deploying OpenPOWER firmware updates; I could
> totally see that being a fwupd plugin. Being somewhat biased of course
> :)
>
> > I don't understand enough background in this area.  OpenBMC's [BMCWeb][]
> > has pulled in the Redfish [SoftwareInventory schema][] and has an
> > [update service implementation][] but has not yet implemented the
> > `SoftwareId` property.  I think you want that.  But I don't know if that
> > will give you what you need.
>
> Yes, SoftwareId is what fwupd uses to say "use this firmware for that
> hardware" i.e. the firmware declares "I'll install on the SoftwareId
> that matches" and then other requirements (like tool+OS version, CHIDs
> etc) get layered on top.
>
> > One more thing I don't know... :-) Where is the right place (via
> > Yocto/bitbake recipes) to set the SoftwareId?  Somewhere around here?:
> > - Base OpenBMC support:
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
> > - Customization for IBM machines:
> > https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/images/obmc-phosphor-image.bbappend
> > - In the class for the above:
> > https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass
>
> I'm not sure, to be honest. In my naive example where fwupd was
> running on the host and talking to the BMC using Redfish I just used
> the board name, eg. evb-ast2500 -- but obviously any vendor
> customization would want to override that. So maybe the answer to your
> question is "both"?
>
> In the case where fwupd is running on the BMC, I just used the MTD
> name (as you can see on the screenshot) and then you'd layer on some
> other requirement like "DMI must match this HWID"
>
> Many thanks for your help.
>
> Richard.
