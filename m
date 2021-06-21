Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C783AECE1
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 17:56:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7vJj6rSLz307Z
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 01:56:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e+HyHhOE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e+HyHhOE; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7vJT186Xz2yYV
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 01:55:52 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id r5so31063193lfr.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2A84GOZUITyddks4vZ01Irv3ZT/SAF/GiukMxxMGPLg=;
 b=e+HyHhOEnXEBImB7cjqOIXekmP4G7iv4Dpq2br18de/gc59ycjNf5k/zF+Ff7Hfl9h
 gx2A6ri2lUs9t3gTqfxNEIrJZMdkqEgWQ/O0rNbgT8cc+hmkSIgJECv6ytI+C7LxtHVf
 sePbFFTLiLSE9Bcnm/UKYTNxLPzVz2abRXlHIJN/vzG/UOIOSiojqGGZ2fcgMqX1BR+d
 TCURsJROqzA0PdPDtHJcQFK8s/Vvvt+/S7LOT9DOBs72mJqYFYfBqGqPRFYbOPvhkcdt
 UgwMgOKusB/GiL+muKpR6l58Y46bcevFm3FE/Vd58CNLU4w5abcab3ECBv6ArIwW7B4+
 tQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2A84GOZUITyddks4vZ01Irv3ZT/SAF/GiukMxxMGPLg=;
 b=FbDTFoWpKvwOwAeJqSBp/wbbNrgTWgpPM7wUUs14MnecKQ+keezMetvJB0pedS72wm
 o2gHK2kiBhO5ao4lCswppTyqWcQ3rEynn6jQcv5kUfXsVuiwO3lODYAsdfxxZPGdbFnF
 +dVKgkbMHZSUagYs3S8xOQcrNydkLv+Q2U1OmryCWGVCWqK1KmgcqblY6Q4mKSUsq3ZD
 aUnUyU6bVBiD5HP7Np8gdiq58G/TThdpaiT4XO39zPWBFUXRBnP5T1xKWE8XGrBIKSDk
 VwRKinZEuqvZcwYgon7g7NIPaVKt4S9Uys33OWDu7zl1D8PF6+mDCWAocAXG+IFg+Zwu
 +bGg==
X-Gm-Message-State: AOAM533vWJ1J+p2RLG5z0jJRHUjLt140ypEJb3EgIYiEacB3R0aQ3oZy
 cVkOPORH9/kDlqmBAX6vJEvn7Wcj42fiuDiPYx8=
X-Google-Smtp-Source: ABdhPJwLa3nfjLJsJJmfPp81qganp81kVIKnLKSubUQ9UJzEkgLNJaPWFR0wMmHls6rnLHryKGkvcktx5G2oTsKDUCE=
X-Received: by 2002:a05:6512:2306:: with SMTP id
 o6mr15389123lfu.9.1624290944894; 
 Mon, 21 Jun 2021 08:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <CACSj6VWqBGCFSSkO4-g=hBx1KBv0CP7iOHQw=Onz256fHpc0RQ@mail.gmail.com>
 <CAM=TmwXU5mjG9n8ubqHgZjGb6MN9_cdz0-ef2cezaB9m-5+wjg@mail.gmail.com>
In-Reply-To: <CAM=TmwXU5mjG9n8ubqHgZjGb6MN9_cdz0-ef2cezaB9m-5+wjg@mail.gmail.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Mon, 21 Jun 2021 18:59:02 +0300
Message-ID: <CACSj6VVsVDxrG3Mm_vdoGUkf3Mjp6P5WghexU_hEtJ-zX9SL=Q@mail.gmail.com>
Subject: Re: Boot Source Override feature problems
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I've redesigned the boot source override feature.

Now it is stored as:
```
/xyz/openbmc_project/control/host0/boot:
     - Interface: xyz.openbmc_project.Control.Boot.Source
     - Interface: xyz.openbmc_project.Control.Boot.Mode
     - Interface: xyz.openbmc_project.Control.Boot.Type
     - Interface: xyz.openbmc_project.Object.Enable
/xyz/openbmc_project/control/host0/boot/one_time:
     - Interface: xyz.openbmc_project.Object.Enable
```
This would solve all of the problems with the current realization.

I've created several commits under one topic in gerrit to the proposed change.
First the `phosphor-settings-manager` commit itself:
44226: phosphor-settings-manager: redesign boot setting override
feature | https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/44226
improvements:
- now there is no doubling interfaces for BootSource/BootMode/BootType
- boot override is clearly disabled by default
- one_time is disabled by default

Then I've posed a changes for phosphor-host-ipmid:
44231: Support new boot override setting design |
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/44231
improvements:
- code simplification
- now it is possible to set boot flag as invalid, which wasn't possible before
- now it is possible to report boot flag as invalid

And bmcweb:
44272: Support new boot override setting design |
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44272
improvements:
- significant code simplification!
- no there is no weird interdependency between BootSource/BootMode/BootType
- all the boot parameters now can be set independently

And finally I've created a commit for a
44225: Support all parameter combinations in Redfish boot tests |
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-test-automation/+/44225
improvements:
- you can see that now `Disabled` state is not decoded as weird
`Options apply to all future boots`, but as `Boot Flag Invalid`
- now it is possible to add all of the combination of tests

Best regards,
Konstantin Aladyshev

On Fri, Jun 11, 2021 at 3:17 PM Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:
>
> Hi!
>
> On Thu, May 27, 2021 at 2:21 AM Konstantin Aladyshev
> <aladyshev22@gmail.com> wrote:
> >
> > Hello!
> > I've merged almost all of my patchsets for the EFI/Legacy support in
> > the Boot Override feature (only bmcweb patchset is left
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970) and I
> > want to return to the discussion about the current implementation of
> > the Boot Override feature in OpenBMC.
> >
> > First, here are implementation details from IPMI and Redfish specs for
> > this feature:
> >
> > IPMI specification (Document Revision 1.1 October 1, 2013)
> > ```
> > IPMI:
> > 1b - enabled/disabled
> > 1b - one-time/permanent
> > 1b - EFI/Legacy
> > 4b - BDS (boot device selector)
> >   0000b = No override
> >   0001b = Force PXE
> >   0010b = Force boot from default Hard-drive
> >   0011b = Force boot from default Hard-drive, request Safe Mode
> >   0100b = Force boot from default Diagnostic Partition
> >   0101b = Force boot from default CD/DVD
> >   0110b = Force boot into BIOS Setup
> >   0111b = Force boot from remotely connected (redirected)
> > Floppy/primary removable media
> >   1001b = Force boot from primary remote media
> >   1000b = Force boot from remotely connected (redirected) CD/DVD
> >   1010b = reserved
> >   1011b = Force boot from remotely connected (redirected) Hard Drive
> >   1100-1110b = Reserved
> >   1111b = Force boot from Floppy/primary removable media
> > ```
> > Redfish specification (DSP2046 2021.1 Redfish Resource and Schema
> > Guide 18 May 2021)
> > ```
> > BootSourceOverrideEnabled - Continuous/Disabled/Once
> > BootSourceOverrideMode - Legacy/UEFI
> > BootSourceOverrideTarget -
> >   BiosSetup = Boot to the BIOS setup utility.
> >   Cd = Boot from the CD or DVD.
> >   Diags = Boot to the manufacturer's diagnostics program.
> >   Floppy = Boot from the floppy disk drive.
> >   Hdd = Boot from a hard drive.
> >   None = Boot from the normal boot device.
> >   Pxe = Boot from the Pre-Boot EXecution (PXE) environment.
> >   RemoteDrive (v1.2+) = Boot from a remote drive, such as an iSCSI target.
> >   SDCard (v1.1+) = Boot from an SD card.
> >   UefiBootNext (v1.5+) = Boot to the UEFI device that the BootNext
> > property specifies.
> >   UefiHttp (v1.1+) = Boot from a UEFI HTTP network location.
> >   UefiShell = Boot to the UEFI Shell.
> >   UefiTarget = Boot to the UEFI device specified in the
> > UefiTargetBootSourceOverride property.
> >   Usb = Boot from a system BIOS-specified USB device.
> >   Utilities = Boot to the manufacturer's utilities program or programs
> > ```
> >
> > In the OpenBMC the current Dbus interfaces for the Boot Override feature are:
> > ```
> > /xyz/openbmc_project/control/host0/boot:
> >     - Interface: xyz.openbmc_project.Control.Boot.Source
> >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> >     - Interface: xyz.openbmc_project.Control.Boot.Type
> > /xyz/openbmc_project/control/host0/boot/one_time:
> >     - Interface: xyz.openbmc_project.Control.Boot.Source
> >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> >     - Interface: xyz.openbmc_project.Control.Boot.Type
> >     - Interface: xyz.openbmc_project.Object.Enable
> > ```
> > It works this way:
> > - when `xyz.openbmc_project.Object.Enable` property under
> > `/xyz/openbmc_project/control/host0/boot/one_time` is set to `true` we
> > use Boot.Source/Mode/Type under
> > `/xyz/openbmc_project/control/host0/boot/one_time` for the override
> > feature.
> > - when `xyz.openbmc_project.Object.Enable` property under
> > `/xyz/openbmc_project/control/host0/boot/one_time` is set to `false`
> > we use Boot.Source/Mode/Type under
> > `/xyz/openbmc_project/control/host0/boot` for the override feature.
> >
> > I don't really get why we split Override Source to `Boot.Source` and
> > `Boot.Mode`, but this is the question for another time.
> >
> > Right now I want to discuss the main problem with this approach... it
> > is that OVERRIDE IS ALWAYS ENABLED. This
> > `xyz.openbmc_project.Object.Enable` property only indicates if we
> > should use permanent or one-time override.
> >
> > I guess no one have noticed it since but by default override target
> > (`Boot.Source`) is set to something like "None". So no one have
> > experienced any difficulties. Override is enabled, but it says boot
> > default.
> >
> > Proof that IPMI valid flag is always enabled:
> > ```uint1_t validFlag = 1;```
> > https://github.com/openbmc/phosphor-host-ipmid/blob/e76a61a2f7c19ed07e2bfe98533d82bc23692fc1/chassishandler.cpp#L1861
> >
> > `bmcweb` deals with this issue a little bit different (hello
> > inconsistency!), it performs weird logic to decide if it should set
> > `BootSourceOverrideEnabled` to `Disabled`.
> > https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/systems.hpp#L951
> > Which would get even weirder when support for EFI/Legacy selector
> > would be merged:
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970/10/redfish-core/lib/systems.hpp#929
> >
> > So as you can see, the current approach is kinda buggy, ipmid always
> > reports override as valid, bmcweb reports override as disabled when
> > you write `BootSourceOverrideTarget = None`.
> >
> > This all is already a problem, but when we add Legacy/EFI selector
> > support, things are getting really messy.
> > ipmid can no longer always say that override is valid, since it would
> > be overriding boot either to EFI or Legacy.
> > bmcweb now can report that override is disabled only when
> > `BootSourceOverrideTarget = None` and `BootSourceOverrideMode = EFI`.
> > Weird, yeah? We write that we want override to `None/EFI`, but read
> > that override is `Disabled`. Weird and obviously wrong.
> >
> > How to overcome all of this?
> > To be honest I don't see any use in splitting Boot Override feature in
> > two Dbus objects under `/xyz/openbmc_project/control/host0/boot` and
> > `/xyz/openbmc_project/control/host0/boot/one_time`, since we don't
> > need to fallback to permanent override after one-time override.
> >
> > So I think the problem can be solved if we would have something like
> > this on Dbus to represent Boot Override feature:
> > ```
> > /xyz/openbmc_project/control/host0/boot:
> >     - Interface: xyz.openbmc_project.Control.Boot.Source
> >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> >     - Interface: xyz.openbmc_project.Control.Boot.Type
> >     - Interface: xyz.openbmc_project.Control.Boot.Permanent # true/false
> >     - Interface: xyz.openbmc_project.Object.Enable
> > ```
> > I don't know if we can reuse any of the current interfaces for the
> > `xyz.openbmc_project.Control.Boot.Permanent` feature, but I think
> > something like these interfaces are what we need. With
> > `Boot.Permanent` we can drop `one-time` object, and with
> > `Object.Enable` we can solve all the aforementioned problems.
>
> Sorry for the late response! I think this works. The two different
> D-Bus objects were trying to achieve the same thing (as Boot.Permanent
> true/false), but as you noted they probably both needed an
> Object.Enable interface. Boot.Permanent does seem simpler.
>
> Thanks,
> Deepak
