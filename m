Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDAB3A41D8
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 14:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1fxM1Lsxz3bt9
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 22:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PVAqfmDY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::936;
 helo=mail-ua1-x936.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PVAqfmDY; dkim-atps=neutral
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1fx41H5zz3bsN
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 22:17:25 +1000 (AEST)
Received: by mail-ua1-x936.google.com with SMTP id p9so2499219uar.3
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDXipZQaP2pyGU9ExHIVi2LiqCxb94fmPjubk4jhZsI=;
 b=PVAqfmDY73MFCUQJXfg0LhcA54Ra3hiSKfzfj0Ao9x9tcxiLGUoglZZLZvjvRsMvyt
 2b1ZF85ng9E+6cDJGkKfcPLbOPqpWGwoXlzB+2S2EUY5OJp2j4rGoIOrPTO2cmV8e4ss
 /1YxAqjkKfGtJhX7QcbsiZtqUu6/3A9Upah9+iMF7cymlveycuzwnYGwy08ax+cgPIsd
 tvULrOVQkCXtYWkZLVCNrQ1eTLo4dYlTFu57H8MqlsJeGJ/XDp8Hut6g/zXVzjkKWIci
 DOCKVo/1V+KwPckOfEFKuXzRsvsC1HSh03m3hzT5EKa7GuguM4dwojg7TUG5qXmVIe6h
 4V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDXipZQaP2pyGU9ExHIVi2LiqCxb94fmPjubk4jhZsI=;
 b=ZKT+gp/yvnqcGOhGHuserds6/KYHY6I45tnqFmpNFQ/4Fag7cvvf+kV595VUDnn577
 sBC23oCLZeTIjpsiHqVF3GIeHCD8nj1NXvRlTugL1qEDeJ+f0eieanUpzHCD63F1OmDP
 Eg50uxKXkk+nbDdLnm06wnBO5q59gzirgwpiNBOb+FKeThZdjJ4LfZJt1E7wZSPCay03
 1jIfxfBwOcDdGfwwqSqp1XtiDZ8dlrld3QR2icZRBGzqxA4lnRaAVjYqM6hqT2JSfNIM
 rvilyNS7FoZHv0mhhZFrBLpKMhF/I+G9G8U8QjCM9mAoQSLH6IaM15GHXXiVxjBd9iGP
 GKMA==
X-Gm-Message-State: AOAM530nCT35MQwglUKn5l9Y90F7ktNrzEv8vAPJtwcwfovx7w+hJxBh
 +K+jtUsohs4NgpwrvlyZdR86dc7rTdYk2UCkR3Q=
X-Google-Smtp-Source: ABdhPJxd8XnFZY+FG/wBUa58VJcvEanMHlegP8JPxN19UvLtJwUo1BcjE+0cBWMOMxehBL3gQvmJsCURk8A0i+1xiZ8=
X-Received: by 2002:ab0:59a3:: with SMTP id g32mr2551142uad.34.1623413841743; 
 Fri, 11 Jun 2021 05:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACSj6VWqBGCFSSkO4-g=hBx1KBv0CP7iOHQw=Onz256fHpc0RQ@mail.gmail.com>
In-Reply-To: <CACSj6VWqBGCFSSkO4-g=hBx1KBv0CP7iOHQw=Onz256fHpc0RQ@mail.gmail.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Fri, 11 Jun 2021 17:47:10 +0530
Message-ID: <CAM=TmwXU5mjG9n8ubqHgZjGb6MN9_cdz0-ef2cezaB9m-5+wjg@mail.gmail.com>
Subject: Re: Boot Source Override feature problems
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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

Hi!

On Thu, May 27, 2021 at 2:21 AM Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Hello!
> I've merged almost all of my patchsets for the EFI/Legacy support in
> the Boot Override feature (only bmcweb patchset is left
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970) and I
> want to return to the discussion about the current implementation of
> the Boot Override feature in OpenBMC.
>
> First, here are implementation details from IPMI and Redfish specs for
> this feature:
>
> IPMI specification (Document Revision 1.1 October 1, 2013)
> ```
> IPMI:
> 1b - enabled/disabled
> 1b - one-time/permanent
> 1b - EFI/Legacy
> 4b - BDS (boot device selector)
>   0000b = No override
>   0001b = Force PXE
>   0010b = Force boot from default Hard-drive
>   0011b = Force boot from default Hard-drive, request Safe Mode
>   0100b = Force boot from default Diagnostic Partition
>   0101b = Force boot from default CD/DVD
>   0110b = Force boot into BIOS Setup
>   0111b = Force boot from remotely connected (redirected)
> Floppy/primary removable media
>   1001b = Force boot from primary remote media
>   1000b = Force boot from remotely connected (redirected) CD/DVD
>   1010b = reserved
>   1011b = Force boot from remotely connected (redirected) Hard Drive
>   1100-1110b = Reserved
>   1111b = Force boot from Floppy/primary removable media
> ```
> Redfish specification (DSP2046 2021.1 Redfish Resource and Schema
> Guide 18 May 2021)
> ```
> BootSourceOverrideEnabled - Continuous/Disabled/Once
> BootSourceOverrideMode - Legacy/UEFI
> BootSourceOverrideTarget -
>   BiosSetup = Boot to the BIOS setup utility.
>   Cd = Boot from the CD or DVD.
>   Diags = Boot to the manufacturer's diagnostics program.
>   Floppy = Boot from the floppy disk drive.
>   Hdd = Boot from a hard drive.
>   None = Boot from the normal boot device.
>   Pxe = Boot from the Pre-Boot EXecution (PXE) environment.
>   RemoteDrive (v1.2+) = Boot from a remote drive, such as an iSCSI target.
>   SDCard (v1.1+) = Boot from an SD card.
>   UefiBootNext (v1.5+) = Boot to the UEFI device that the BootNext
> property specifies.
>   UefiHttp (v1.1+) = Boot from a UEFI HTTP network location.
>   UefiShell = Boot to the UEFI Shell.
>   UefiTarget = Boot to the UEFI device specified in the
> UefiTargetBootSourceOverride property.
>   Usb = Boot from a system BIOS-specified USB device.
>   Utilities = Boot to the manufacturer's utilities program or programs
> ```
>
> In the OpenBMC the current Dbus interfaces for the Boot Override feature are:
> ```
> /xyz/openbmc_project/control/host0/boot:
>     - Interface: xyz.openbmc_project.Control.Boot.Source
>     - Interface: xyz.openbmc_project.Control.Boot.Mode
>     - Interface: xyz.openbmc_project.Control.Boot.Type
> /xyz/openbmc_project/control/host0/boot/one_time:
>     - Interface: xyz.openbmc_project.Control.Boot.Source
>     - Interface: xyz.openbmc_project.Control.Boot.Mode
>     - Interface: xyz.openbmc_project.Control.Boot.Type
>     - Interface: xyz.openbmc_project.Object.Enable
> ```
> It works this way:
> - when `xyz.openbmc_project.Object.Enable` property under
> `/xyz/openbmc_project/control/host0/boot/one_time` is set to `true` we
> use Boot.Source/Mode/Type under
> `/xyz/openbmc_project/control/host0/boot/one_time` for the override
> feature.
> - when `xyz.openbmc_project.Object.Enable` property under
> `/xyz/openbmc_project/control/host0/boot/one_time` is set to `false`
> we use Boot.Source/Mode/Type under
> `/xyz/openbmc_project/control/host0/boot` for the override feature.
>
> I don't really get why we split Override Source to `Boot.Source` and
> `Boot.Mode`, but this is the question for another time.
>
> Right now I want to discuss the main problem with this approach... it
> is that OVERRIDE IS ALWAYS ENABLED. This
> `xyz.openbmc_project.Object.Enable` property only indicates if we
> should use permanent or one-time override.
>
> I guess no one have noticed it since but by default override target
> (`Boot.Source`) is set to something like "None". So no one have
> experienced any difficulties. Override is enabled, but it says boot
> default.
>
> Proof that IPMI valid flag is always enabled:
> ```uint1_t validFlag = 1;```
> https://github.com/openbmc/phosphor-host-ipmid/blob/e76a61a2f7c19ed07e2bfe98533d82bc23692fc1/chassishandler.cpp#L1861
>
> `bmcweb` deals with this issue a little bit different (hello
> inconsistency!), it performs weird logic to decide if it should set
> `BootSourceOverrideEnabled` to `Disabled`.
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/systems.hpp#L951
> Which would get even weirder when support for EFI/Legacy selector
> would be merged:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970/10/redfish-core/lib/systems.hpp#929
>
> So as you can see, the current approach is kinda buggy, ipmid always
> reports override as valid, bmcweb reports override as disabled when
> you write `BootSourceOverrideTarget = None`.
>
> This all is already a problem, but when we add Legacy/EFI selector
> support, things are getting really messy.
> ipmid can no longer always say that override is valid, since it would
> be overriding boot either to EFI or Legacy.
> bmcweb now can report that override is disabled only when
> `BootSourceOverrideTarget = None` and `BootSourceOverrideMode = EFI`.
> Weird, yeah? We write that we want override to `None/EFI`, but read
> that override is `Disabled`. Weird and obviously wrong.
>
> How to overcome all of this?
> To be honest I don't see any use in splitting Boot Override feature in
> two Dbus objects under `/xyz/openbmc_project/control/host0/boot` and
> `/xyz/openbmc_project/control/host0/boot/one_time`, since we don't
> need to fallback to permanent override after one-time override.
>
> So I think the problem can be solved if we would have something like
> this on Dbus to represent Boot Override feature:
> ```
> /xyz/openbmc_project/control/host0/boot:
>     - Interface: xyz.openbmc_project.Control.Boot.Source
>     - Interface: xyz.openbmc_project.Control.Boot.Mode
>     - Interface: xyz.openbmc_project.Control.Boot.Type
>     - Interface: xyz.openbmc_project.Control.Boot.Permanent # true/false
>     - Interface: xyz.openbmc_project.Object.Enable
> ```
> I don't know if we can reuse any of the current interfaces for the
> `xyz.openbmc_project.Control.Boot.Permanent` feature, but I think
> something like these interfaces are what we need. With
> `Boot.Permanent` we can drop `one-time` object, and with
> `Object.Enable` we can solve all the aforementioned problems.

Sorry for the late response! I think this works. The two different
D-Bus objects were trying to achieve the same thing (as Boot.Permanent
true/false), but as you noted they probably both needed an
Object.Enable interface. Boot.Permanent does seem simpler.

Thanks,
Deepak
