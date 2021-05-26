Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D673921AA
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 22:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr3581tNWz301j
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 06:51:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LogMafC6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LogMafC6; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr34q0kjxz2xtl
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 06:50:48 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id w33so4587323lfu.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 13:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DNfR0tlA5NcnwGW5D8N7IyKsVrfhlo2kLBJTTVpR4Po=;
 b=LogMafC6rJ14uyr81/PRoCoAmRli6UJrURXwwWZQ9Sp2SV8VYTmgpOK/fo3TKkcK+z
 a5SEAD4YYtfIfHaZRqqhOwSo3K8LK0PLdkwFI1RF/GaFqcoveI6CTuIhX3Uq1OJ/0I04
 GWxLnAosJJYF87qT06tsTcURYl/GB7Pj0U1hNUPENCPXsEA7qyTY/KL2KanHRi1MAy+Y
 107IxCL9lBAel8ytUkFhvbAAr05CVljlHTeKjxeMJIjzMq2a6JLMGp2XOMQ94/nS/Vih
 N07Ul9X9prxiSNTpyvGaSUq08DrxqjvoJYbKzlaxxLDOqNtHwmkmbseZSOuq0XkINEKZ
 m63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DNfR0tlA5NcnwGW5D8N7IyKsVrfhlo2kLBJTTVpR4Po=;
 b=GYTS8ZIXcLjcvOymJw8cYratRS13SPR3JT/xYBGk31JUYfjBjPBdT7Qy7LsheJOVU9
 ODhxbHg3EkwrOY1n0qQxLUYt/OoywSCwQYc0bHxa3RN+G5/TPnPx4f10T4SE6C4Ge3uQ
 GmophcgS8D49Bpa5G0X3oRR5Wi31hVAHkH/u+yz0SXZpCIAKthl+2vd8wqaCgWYiJI21
 VJMNe7/Ktkquxc89HnPE9LAD6k1orCnB2UHFvQ6ZTto9AQj2lHc5I9k3DEzRG6tjhtwj
 Ma07eLVhERTGHy9IW0dxlcd4UkUNCN+cQiqlyluEE4P7SY5fd8LYFrtObL6JzM/MR6E2
 L+BQ==
X-Gm-Message-State: AOAM532StBo0e0kj9J1P58erWgf8Tfh9YZz956pZz1KBtJ0l3csPIqty
 jmUkqs90dBwghp/ioF32lUdEZpTXKWkajAZ7rPJOSI4xhFRR5A==
X-Google-Smtp-Source: ABdhPJwU7HiNq6rVHZrw4swKz4WkjWOF1a2jpUgqMDiyFj+EGUpyIJEcc4GuQvyym+77hcCGhRSD4hpa5OgKbzubxFw=
X-Received: by 2002:a05:6512:b0f:: with SMTP id
 w15mr16152lfu.118.1622062240930; 
 Wed, 26 May 2021 13:50:40 -0700 (PDT)
MIME-Version: 1.0
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Wed, 26 May 2021 23:50:29 +0300
Message-ID: <CACSj6VWqBGCFSSkO4-g=hBx1KBv0CP7iOHQw=Onz256fHpc0RQ@mail.gmail.com>
Subject: Boot Source Override feature problems
To: openbmc@lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello!
I've merged almost all of my patchsets for the EFI/Legacy support in
the Boot Override feature (only bmcweb patchset is left
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970) and I
want to return to the discussion about the current implementation of
the Boot Override feature in OpenBMC.

First, here are implementation details from IPMI and Redfish specs for
this feature:

IPMI specification (Document Revision 1.1 October 1, 2013)
```
IPMI:
1b - enabled/disabled
1b - one-time/permanent
1b - EFI/Legacy
4b - BDS (boot device selector)
  0000b = No override
  0001b = Force PXE
  0010b = Force boot from default Hard-drive
  0011b = Force boot from default Hard-drive, request Safe Mode
  0100b = Force boot from default Diagnostic Partition
  0101b = Force boot from default CD/DVD
  0110b = Force boot into BIOS Setup
  0111b = Force boot from remotely connected (redirected)
Floppy/primary removable media
  1001b = Force boot from primary remote media
  1000b = Force boot from remotely connected (redirected) CD/DVD
  1010b = reserved
  1011b = Force boot from remotely connected (redirected) Hard Drive
  1100-1110b = Reserved
  1111b = Force boot from Floppy/primary removable media
```
Redfish specification (DSP2046 2021.1 Redfish Resource and Schema
Guide 18 May 2021)
```
BootSourceOverrideEnabled - Continuous/Disabled/Once
BootSourceOverrideMode - Legacy/UEFI
BootSourceOverrideTarget -
  BiosSetup = Boot to the BIOS setup utility.
  Cd = Boot from the CD or DVD.
  Diags = Boot to the manufacturer's diagnostics program.
  Floppy = Boot from the floppy disk drive.
  Hdd = Boot from a hard drive.
  None = Boot from the normal boot device.
  Pxe = Boot from the Pre-Boot EXecution (PXE) environment.
  RemoteDrive (v1.2+) = Boot from a remote drive, such as an iSCSI target.
  SDCard (v1.1+) = Boot from an SD card.
  UefiBootNext (v1.5+) = Boot to the UEFI device that the BootNext
property specifies.
  UefiHttp (v1.1+) = Boot from a UEFI HTTP network location.
  UefiShell = Boot to the UEFI Shell.
  UefiTarget = Boot to the UEFI device specified in the
UefiTargetBootSourceOverride property.
  Usb = Boot from a system BIOS-specified USB device.
  Utilities = Boot to the manufacturer's utilities program or programs
```

In the OpenBMC the current Dbus interfaces for the Boot Override feature are:
```
/xyz/openbmc_project/control/host0/boot:
    - Interface: xyz.openbmc_project.Control.Boot.Source
    - Interface: xyz.openbmc_project.Control.Boot.Mode
    - Interface: xyz.openbmc_project.Control.Boot.Type
/xyz/openbmc_project/control/host0/boot/one_time:
    - Interface: xyz.openbmc_project.Control.Boot.Source
    - Interface: xyz.openbmc_project.Control.Boot.Mode
    - Interface: xyz.openbmc_project.Control.Boot.Type
    - Interface: xyz.openbmc_project.Object.Enable
```
It works this way:
- when `xyz.openbmc_project.Object.Enable` property under
`/xyz/openbmc_project/control/host0/boot/one_time` is set to `true` we
use Boot.Source/Mode/Type under
`/xyz/openbmc_project/control/host0/boot/one_time` for the override
feature.
- when `xyz.openbmc_project.Object.Enable` property under
`/xyz/openbmc_project/control/host0/boot/one_time` is set to `false`
we use Boot.Source/Mode/Type under
`/xyz/openbmc_project/control/host0/boot` for the override feature.

I don't really get why we split Override Source to `Boot.Source` and
`Boot.Mode`, but this is the question for another time.

Right now I want to discuss the main problem with this approach... it
is that OVERRIDE IS ALWAYS ENABLED. This
`xyz.openbmc_project.Object.Enable` property only indicates if we
should use permanent or one-time override.

I guess no one have noticed it since but by default override target
(`Boot.Source`) is set to something like "None". So no one have
experienced any difficulties. Override is enabled, but it says boot
default.

Proof that IPMI valid flag is always enabled:
```uint1_t validFlag = 1;```
https://github.com/openbmc/phosphor-host-ipmid/blob/e76a61a2f7c19ed07e2bfe98533d82bc23692fc1/chassishandler.cpp#L1861

`bmcweb` deals with this issue a little bit different (hello
inconsistency!), it performs weird logic to decide if it should set
`BootSourceOverrideEnabled` to `Disabled`.
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/systems.hpp#L951
Which would get even weirder when support for EFI/Legacy selector
would be merged:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970/10/redfish-core/lib/systems.hpp#929

So as you can see, the current approach is kinda buggy, ipmid always
reports override as valid, bmcweb reports override as disabled when
you write `BootSourceOverrideTarget = None`.

This all is already a problem, but when we add Legacy/EFI selector
support, things are getting really messy.
ipmid can no longer always say that override is valid, since it would
be overriding boot either to EFI or Legacy.
bmcweb now can report that override is disabled only when
`BootSourceOverrideTarget = None` and `BootSourceOverrideMode = EFI`.
Weird, yeah? We write that we want override to `None/EFI`, but read
that override is `Disabled`. Weird and obviously wrong.

How to overcome all of this?
To be honest I don't see any use in splitting Boot Override feature in
two Dbus objects under `/xyz/openbmc_project/control/host0/boot` and
`/xyz/openbmc_project/control/host0/boot/one_time`, since we don't
need to fallback to permanent override after one-time override.

So I think the problem can be solved if we would have something like
this on Dbus to represent Boot Override feature:
```
/xyz/openbmc_project/control/host0/boot:
    - Interface: xyz.openbmc_project.Control.Boot.Source
    - Interface: xyz.openbmc_project.Control.Boot.Mode
    - Interface: xyz.openbmc_project.Control.Boot.Type
    - Interface: xyz.openbmc_project.Control.Boot.Permanent # true/false
    - Interface: xyz.openbmc_project.Object.Enable
```
I don't know if we can reuse any of the current interfaces for the
`xyz.openbmc_project.Control.Boot.Permanent` feature, but I think
something like these interfaces are what we need. With
`Boot.Permanent` we can drop `one-time` object, and with
`Object.Enable` we can solve all the aforementioned problems.

This is an architecture change, so please, I want some feedback from
the community for this change before I'll start working on the
patchsets.
