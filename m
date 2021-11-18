Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5502B4560ED
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 17:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw5Pr1Mdvz307g
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 03:50:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XmCrqSSB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XmCrqSSB; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw5PT2f2Sz2yPD
 for <openbmc@lists.ozlabs.org>; Fri, 19 Nov 2021 03:49:47 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id l22so28864201lfg.7
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMgQmub/TDLwbSku/j9VL36cKQU98UBtUeqaC6KrJcY=;
 b=XmCrqSSBqxrGHZ6MkyJ3hYfEj2s77uZVz7GiHIx3sENgI0jDrjDUsrOufinqgSffYM
 N418OovX/9le18YSnHQbB/M8TzGoNYIGaMEPm1DdwWMLRtyzgVWSSttT03Sy2CHhvH/J
 trr5YO4Y+Ria06ALDUBDj3tBzPjR3lTn6wV2iSks04gzZ/DJUnDfIVB0uBHMOp8T9SK4
 NfJejYROyRX41rnTA8sXbcpMgxooW6ffRbmBtQRkmpiYFSaba8AtELD4yGwUo983yp2Y
 Ag2PPiRCcMIc6ftvxsfU7qsnRsdEBGJQKpUeFP8Il17sn/Da6M3uly1jnwHdRHy77xmc
 GoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMgQmub/TDLwbSku/j9VL36cKQU98UBtUeqaC6KrJcY=;
 b=fNavfH23ibFTOeCSYk6wbRb+GI68tPXnexlcT8SBa/HHngqwfEm5wX9skkMtIy4oB6
 H2douEa8WS94Pa48i1FSlrw5LAZ1GV30bgUQ777x+DxQ15IeBubWPBdiZnhpjaCW9W4N
 44X60rgINXPkz9pIAPe0fu/9H82zZZ27PEWRyY5rFs8TVITw7+BRZ8S7K/rnj9H1SxZZ
 h7wvqSWh1nfSuCEwZ4UnizbrxjVg0Um55rk3WVVwFKTQEPOhzu6+rMhZgiVrc5O2vqPx
 uh5PA881GAIHNE7leRRWG7oAsezAj1eu5UkISwo/tEM684ou+VTCZ/i1+qqeMPhQWn8l
 bbAA==
X-Gm-Message-State: AOAM530ietejgM1vu4RNaWIzp7zeGFZbIWqH7TuwXLM6krzF3LBsNBQq
 SO/MwF0dHVfbvx606tHVGu5gjm+kUvzgpVFP+pI=
X-Google-Smtp-Source: ABdhPJwsyRtytT1cKemBmXltLdmMniBSLgqlWwifYSQgC7BLQle7wQiRhpjKU2xePIY4feuuqhqGMobbisMWTSiondg=
X-Received: by 2002:ac2:58e2:: with SMTP id v2mr25261685lfo.328.1637254178133; 
 Thu, 18 Nov 2021 08:49:38 -0800 (PST)
MIME-Version: 1.0
References: <CAD2FfiGpG_J5W8Ftdp5wE2wLB=7Tfmvfmivy0_4vW=D0fYdw3g@mail.gmail.com>
 <d6654531-a50b-665f-36a8-0ad1b27bcf88@linux.ibm.com>
 <CAD2FfiHWuYbKhDhCwUn6mgZ6c+GDuZ-DstYuOaPkKTOBg_wWTw@mail.gmail.com>
 <CACWQX83H11CtNZOy1iLE62DHDWx-Uuu==LGtT2KdTH2xL+uKbA@mail.gmail.com>
In-Reply-To: <CACWQX83H11CtNZOy1iLE62DHDWx-Uuu==LGtT2KdTH2xL+uKbA@mail.gmail.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Thu, 18 Nov 2021 16:49:26 +0000
Message-ID: <CAD2FfiGgnVG+Tojqr_erg-h=aG1iWSbMWL0QGjwnySMdMmTj8A@mail.gmail.com>
Subject: Re: Redfish implementation does not supply SoftwareId
To: Ed Tanous <ed@tanous.net>
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

On Wed, 17 Nov 2021 at 21:50, Ed Tanous <ed@tanous.net> wrote:
> > I guess my question is if I could get a SoftwareId set for 7d021ade --
> > e.g. "evb-ast2500" -- that at least allows the device to enumerate in
>
> This seems like a reasonable thing to do.  We probably want to
> namespace SoftwareId with OpenBMC-<machine name>

Yes, a good idea. Perhaps as a first step we could just hardcode
"OpenBMC-{machine-name}" in the SoftwareId? It gets a bit icky as
there appears to only be one component exposed on Redfish, when in
reality you probably want multiple components for things like ro,
kernel etc.

> If the above is something you're interested in tackling, you might
> consider hopping on discord in the bmcweb-and-redfish channel

I'm not sure how many cycles I have for this personally, but I'd be
amazed if that big vendor didn't want to get things moving. :)

> The line between insane and genius is more of a venn diagram rather
> than a hard line.

It would seem that way indeed.

> In my dream world (where software is easy):

Dude, software is easy. It's the "making people work together" bit
that's hard :)

> 1. fwupd would compile small enough to be put on every BMC, with
> compile options to compile out the modes (and therefore binary size)
> that doesn't make sense in a BMC context.

Yes, there are a huge number of configure options and we've just added
a few more for the next release to shave the binary distribution size
down. e.g. https://github.com/fwupd/fwupd/pull/3981 and a few more.
I'm not completely sure how to measure the effect of adding fwupd (and
the couple of additional deps) other than looking at the size of the
compressed image. I did two builds, and included a ton of protocols
into fwupd (and we could disable a lot more) and the rootfs went up
4MB so there's probably a lot more needed to trim down. If there's any
clever way to debug size increases (.e. a specific library increased
the size x MB) please let me know.

> 2. We'd write a dbus service (or extend fwupd), and make its data
> available to dbus, such that we can hook it up directly to Redfish
> FirmwareInventory schemas

Ohh, we've already got a dbus interface. e.g.

gdbus call --system --dest org.freedesktop.fwupd --object-path /
--method org.freedesktop.fwupd.GetDevices

gives you the aasv array-of-dictionaries where all the data lives.

> 3. When we start tackling in-system update use cases (power supplies,
> CPLDs, BIOS, ect) fwupd would be the "default" go to, such that we
> could share the bmc-specific and in-band update mechanisms in the same
> application.  For example, updating a VR or NVMe drive should be
> similar whether you're updating from a host-based OS, or from the BMC.

Yes, I think that makes total sense.

> Any chance you posted the recipe file somewhere for others to hack on
> this along with you?

Sure, Ross has been awesome in getting all this upstream:
https://github.com/openembedded/meta-openembedded/tree/master/meta-oe/recipes-bsp/fwupd

...in the next few days I'll do a new upstream release which includes
the patches listed there, and will also include the ~300kb reduction
in installed size. Perhaps give it a few days to pick up the new
release and the new options before trying it yourself. If you really
can't wait there's
https://people.freedesktop.org/~hughsient/temp/fwupd_1.7.1.bb

In the meantime, I (perhaps incorrectly) added it in the OpenBMC image using:

BBFILES += "../meta-openembedded/meta-oe/recipes-bsp/fwupd/*.bb"
CORE_IMAGE_EXTRA_INSTALL += "fwupd"
PACKAGECONFIG:remove = " vala gpg bluez polkit tests consolekit
firmware-packager manpages lzma plugin_altos plugin_dell
plugin_logitech_bulkcontroller plugin_modem_manager
plugin_parade_lspcon plugin_platform_integrity plugin_realtek_mst
plugin_synaptics_mst plugin_synaptics_rmi plugin_tpm"

We did ponder putting the .bb file into fwupd upstream and building it
as part of the CI, but building OpenBMC for each PR would really chew
through our CI minutes.

> > Intererstingly that would also mean that you could ship OpenBMC
> > kernel or ro updates via the LVFS, for instance.
>
> YES! ! ! ! !  In a perfect world, we could also have OpenBMC CI
> automatically post to LVFS when we cut major/minor firmware revisions,

So let's do that. Could someone from the OpenBSD team who could sign
some "legal paperwork" apply for an LVFS account, and then we can set
up a robot user with a token that can automatically upload to the
LVFS. If nothing else it's some really good publicity, and lets me
keep the evb I have here up to date without a SPI programmer. See
https://lvfs.readthedocs.io/en/latest/apply.html and we can create a
test account and do some tests.

> and give OpenBMC users a "check for updates" button/api that could
> automatically invoke fwupd locally to check for updates.

Well, "fwupdmgr update" would basically do the right thing and ask the
user what needs to be updated. Of course, wiring it into OpenBMD would
be even more awesome, and there are tons of DBus APIs to make it all
magic.

Richard.
