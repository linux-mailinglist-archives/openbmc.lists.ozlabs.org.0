Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C2454F53
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 22:26:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvbZr72lRz3056
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 08:26:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DqiTVp7z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DqiTVp7z; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvbZS0C63z2yHX
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 08:25:49 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id c32so15132391lfv.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 13:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uAxNDb6Rt1cGTBEq1vEeTBOqT6/70BvwDXNcEVWTcxg=;
 b=DqiTVp7zQfBHeKW+9n2a6tlaBupP2X/0hQ5KlhUaBFo9kXowbnqc0wl97AFKRJxmyy
 TrP2ItSPTc/c3S+43qGxzVkEPyFwFgkGN9ZFnR4P8lcCdAKVWvfsTSxj6cP6mDvTTW8X
 Q/AFvExAHNV9+k+IlCw8E2If0SRvGTUFHNpGJElFyVy6VwPcHIdjjI7tnn+FHEYUaEFz
 lUBp0Gn2xBF6Vvx/fG0UJNPFNw573Apc3fbiUEmhELy4O9aFq3Cjc5uoYKAIPgc6oN/a
 LwVeglvMRW2OoBIBlfy+dobu1siJYu8pnWZ7CXTmFAfYhQRq6uoHMMYldfZZTWz0xBE4
 YOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uAxNDb6Rt1cGTBEq1vEeTBOqT6/70BvwDXNcEVWTcxg=;
 b=XxFZKQXmOTXFmScw/m7PAac9q+yBv5N3aG2YADTEJdjA6/MRjdgZHJGR2NQXQiUGQM
 2V2hnwaOgxhTfcA3T+BlxxWOTBS539UC5r3il3rlMH4peBHlhqtl25ymvsLqxli4cff9
 u6IqpqGEKqX7q92z/6Z1QgElUYreLKeXP1LaeH/Eu9TCYJVXnyg+h/fA16mRgaK7W5+Q
 6YgdRDmDNAXmIIUkzBzt4bDnbvbYE+KsELqe9lgzD+9jKO5Ourn3Frh/LIhmAXSvk/e8
 pjDZ0XETAOS9FhEjXVyjUKIjjpd/ASaRQmRb8WpxZgMBRxzTCBP2yzFYfrY1U1NrqWI4
 2+ig==
X-Gm-Message-State: AOAM5328RzN6RhxshbYb3Rsn1yTcJEuOYdP1LxebyT00wHWdI6Z4oNvO
 VZ25OeE5x8u3bG4PqolzFXWXmlyhFiZ/RzYcQs4=
X-Google-Smtp-Source: ABdhPJwfFi0yN9bXHeUDK6DlujMGyghne9WwwLSpdKUjntEHA4MYVvoOJUW3Q2H5fFdr6EyQfzsMPCImTpDMJCCMlOo=
X-Received: by 2002:ac2:5496:: with SMTP id t22mr18867950lfk.478.1637184346062; 
 Wed, 17 Nov 2021 13:25:46 -0800 (PST)
MIME-Version: 1.0
References: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
 <d6654531-a50b-665f-36a8-0ad1b27bcf88@linux.ibm.com>
In-Reply-To: <d6654531-a50b-665f-36a8-0ad1b27bcf88@linux.ibm.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Wed, 17 Nov 2021 21:25:34 +0000
Message-ID: <CAD2FfiHWuYbKhDhCwUn6mgZ6c+GDuZ-DstYuOaPkKTOBg_wWTw@mail.gmail.com>
Subject: Re: Redfish implementation does not supply SoftwareId
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Nov 2021 at 19:36, Joseph Reynolds <jrey@linux.ibm.com> wrote:
> Where can we learn more about the interest in getting `fwupd` to run on
> the BMC?  Links to chat room, email archive, etc?

I don't have much public information I'm afraid. It's a very big
company using OpenBMC that suggested this just a few weeks ago. I'm
still not sure if it's a genius or insane idea to be honest. I
initially thought the latter, but people cleverer than me say the
former.

> [firmware update]:
> https://github.com/openbmc/docs/blob/master/architecture/code-update/code-update.md

Super useful, thanks.

> In this context, I understand you are interested in either (A) adding
> support for a new fwupd method or (B) creating a new OpenBMC function to
> update the firmware for various host components, or (C) both.  That
> seems to me like a good fit with OpenBMC.

I think the idea is that fwupd already knows how to install updates on
an insane number of devices (~32 different update protocols supported,
everything from DFU, to NVME, to UEFI capsule, Redfish, ATA, Logitech
HID++, and even MTD) and those could be *used* by OpenBMC saying
"install *this* on *that*" or even plumbing in OpenBMC to query fwupd
to say "what updatable devices can you tell me about". For both
actions there's a DBus interface or a JSON data dump available, either
as an in-process query or just by running the daemon in the
background. e.g. "fwupdmgr get-devices" is a thin wrapper around the
GetUpdates DBus call that returns a 'aasv' array of dictionaries blob.

> Do I infer correctly that you got `fwupd` running on the BMC, for
> example having a working `fwupdmgr` command?

Yes, actually more crazy than that, I got fwupd downloading and
deploying updates from the LVFS... https://fwupd.org/

See https://twitter.com/hughsient/status/1458922790690635780 for the
obligatory screenshot. I think the idea is that vendors can use the
same code in fwupd to deploy firmware onto COTS hardware without
OpenBMC and onto custom hardware with OpenBMC. i.e. they teach one
thing how to update the hardware and get to use it in both places.

> I understand OpenPOWER system firmware has two firmware packages which
> are typically packaged together: (1) the BMC firmware image and (2) the
> host firmware image.  The host image itself contains multiple parts but
> the BMC does not handle them separately.  Given this, firmware updates
> are monoliotic and are not done to individual components.  (But note my
> understanding is limited.)

In some cases the host UEFI firmware is behind some kind of MUX so
that fwupd needs to know the GPIO to poke to make the MTD device
appear to the BMC, and then the other GPIO to poke to return control
back to the host. We have a plugin for that now. I didn't plan to
update the BMC firmware using fwupd, but I guess if the BMC partitions
are exposed as MTD devices there's nothing stopping you actually doing
that. Intererstingly that would also mean that you could ship OpenBMC
kernel or ro updates via the LVFS, for instance.

I saw some of the code deploying OpenPOWER firmware updates; I could
totally see that being a fwupd plugin. Being somewhat biased of course
:)

> I don't understand enough background in this area.  OpenBMC's [BMCWeb][]
> has pulled in the Redfish [SoftwareInventory schema][] and has an
> [update service implementation][] but has not yet implemented the
> `SoftwareId` property.  I think you want that.  But I don't know if that
> will give you what you need.

Yes, SoftwareId is what fwupd uses to say "use this firmware for that
hardware" i.e. the firmware declares "I'll install on the SoftwareId
that matches" and then other requirements (like tool+OS version, CHIDs
etc) get layered on top.

> One more thing I don't know... :-) Where is the right place (via
> Yocto/bitbake recipes) to set the SoftwareId?  Somewhere around here?:
> - Base OpenBMC support:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/images/obmc-phosphor-image.bb
> - Customization for IBM machines:
> https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/images/obmc-phosphor-image.bbappend
> - In the class for the above:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phosphor.bbclass

I'm not sure, to be honest. In my naive example where fwupd was
running on the host and talking to the BMC using Redfish I just used
the board name, eg. evb-ast2500 -- but obviously any vendor
customization would want to override that. So maybe the answer to your
question is "both"?

In the case where fwupd is running on the BMC, I just used the MTD
name (as you can see on the screenshot) and then you'd layer on some
other requirement like "DMI must match this HWID"

Many thanks for your help.

Richard.
