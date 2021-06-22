Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B223B0AA4
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 18:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8XSk2mb9z3093
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 02:50:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=VngV1eQj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=VngV1eQj; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8XSK1K7qz2y08
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 02:49:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 298614289A
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1624380587; x=1626194988; bh=TsLEEVImhuoP2WjSAct2AElqZ
 W3pcumTJXocjtj1Z7I=; b=VngV1eQjClM9Ievn/Plp6ja1/YRw3sXHZzD/O37hQ
 bsEUGrD28RK4VUDWAnDj5WzKpGYSDLdOCsi42FnQlS1O4crAv0McZlecehp2741I
 diINkd2l7yKhIDbRCqWWsrHe8uHTgioxba5EPjL+S8Y4dShZHvtMdtP9IqgX2cKx
 E8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6wFCL5AnMwG for <openbmc@lists.ozlabs.org>;
 Tue, 22 Jun 2021 19:49:47 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 29BAE4280B
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 19:49:47 +0300 (MSK)
Received: from [10.199.0.46] (10.199.0.46) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 22
 Jun 2021 19:49:47 +0300
Message-ID: <6765c368a06573526a45e9044a43fdad362f0da8.camel@yadro.com>
Subject: Re: Boot Source Override feature problems
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Tue, 22 Jun 2021 19:49:45 +0300
In-Reply-To: <CACSj6VVsVDxrG3Mm_vdoGUkf3Mjp6P5WghexU_hEtJ-zX9SL=Q@mail.gmail.com>
References: <CACSj6VWqBGCFSSkO4-g=hBx1KBv0CP7iOHQw=Onz256fHpc0RQ@mail.gmail.com>
 <CAM=TmwXU5mjG9n8ubqHgZjGb6MN9_cdz0-ef2cezaB9m-5+wjg@mail.gmail.com>
 <CACSj6VVsVDxrG3Mm_vdoGUkf3Mjp6P5WghexU_hEtJ-zX9SL=Q@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.46]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

I'm curious, why you decide to keep
/xyz/openbmc_project/control/host0/boot/one_time: Enable
?

As I understood your inputs, the 'one_time->Enable' was your initial
problem.
Now you cut off ability to have separate sets of parameters for one-
time and permanent overrides but still have this weird 'one_time' node.
Can you elaborate more what use-case do you solve?
From the initial letter I got that the problem was with always enabled
switch - I believe it is possibly to fix this by managing state of
Enabled property, isn't it?

On Mon, 2021-06-21 at 18:59 +0300, Konstantin Aladyshev wrote:
> I've redesigned the boot source override feature.
> 
> Now it is stored as:
> ```
> /xyz/openbmc_project/control/host0/boot:
>      - Interface: xyz.openbmc_project.Control.Boot.Source
>      - Interface: xyz.openbmc_project.Control.Boot.Mode
>      - Interface: xyz.openbmc_project.Control.Boot.Type
>      - Interface: xyz.openbmc_project.Object.Enable
> /xyz/openbmc_project/control/host0/boot/one_time:
>      - Interface: xyz.openbmc_project.Object.Enable
> ```
> This would solve all of the problems with the current realization.
> 
> I've created several commits under one topic in gerrit to the
> proposed change.
> First the `phosphor-settings-manager` commit itself:
> 44226: phosphor-settings-manager: redesign boot setting override
> feature |
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/44226
> improvements:
> - now there is no doubling interfaces for
> BootSource/BootMode/BootType
> - boot override is clearly disabled by default
> - one_time is disabled by default
> 
> Then I've posed a changes for phosphor-host-ipmid:
> 44231: Support new boot override setting design |
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/44231
> improvements:
> - code simplification
> - now it is possible to set boot flag as invalid, which wasn't
> possible before
> - now it is possible to report boot flag as invalid
> 
> And bmcweb:
> 44272: Support new boot override setting design |
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/44272
> improvements:
> - significant code simplification!
> - no there is no weird interdependency between
> BootSource/BootMode/BootType
> - all the boot parameters now can be set independently
> 
> And finally I've created a commit for a
> 44225: Support all parameter combinations in Redfish boot tests |
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-test-automation/+/44225
> improvements:
> - you can see that now `Disabled` state is not decoded as weird
> `Options apply to all future boots`, but as `Boot Flag Invalid`
> - now it is possible to add all of the combination of tests
> 
> Best regards,
> Konstantin Aladyshev
> 
> On Fri, Jun 11, 2021 at 3:17 PM Deepak Kodihalli
> <deepak.kodihalli.83@gmail.com> wrote:
> > 
> > Hi!
> > 
> > On Thu, May 27, 2021 at 2:21 AM Konstantin Aladyshev
> > <aladyshev22@gmail.com> wrote:
> > > 
> > > Hello!
> > > I've merged almost all of my patchsets for the EFI/Legacy support
> > > in
> > > the Boot Override feature (only bmcweb patchset is left
> > > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970) and
> > > I
> > > want to return to the discussion about the current implementation
> > > of
> > > the Boot Override feature in OpenBMC.
> > > 
> > > First, here are implementation details from IPMI and Redfish
> > > specs for
> > > this feature:
> > > 
> > > IPMI specification (Document Revision 1.1 October 1, 2013)
> > > ```
> > > IPMI:
> > > 1b - enabled/disabled
> > > 1b - one-time/permanent
> > > 1b - EFI/Legacy
> > > 4b - BDS (boot device selector)
> > >   0000b = No override
> > >   0001b = Force PXE
> > >   0010b = Force boot from default Hard-drive
> > >   0011b = Force boot from default Hard-drive, request Safe Mode
> > >   0100b = Force boot from default Diagnostic Partition
> > >   0101b = Force boot from default CD/DVD
> > >   0110b = Force boot into BIOS Setup
> > >   0111b = Force boot from remotely connected (redirected)
> > > Floppy/primary removable media
> > >   1001b = Force boot from primary remote media
> > >   1000b = Force boot from remotely connected (redirected) CD/DVD
> > >   1010b = reserved
> > >   1011b = Force boot from remotely connected (redirected) Hard
> > > Drive
> > >   1100-1110b = Reserved
> > >   1111b = Force boot from Floppy/primary removable media
> > > ```
> > > Redfish specification (DSP2046 2021.1 Redfish Resource and Schema
> > > Guide 18 May 2021)
> > > ```
> > > BootSourceOverrideEnabled - Continuous/Disabled/Once
> > > BootSourceOverrideMode - Legacy/UEFI
> > > BootSourceOverrideTarget -
> > >   BiosSetup = Boot to the BIOS setup utility.
> > >   Cd = Boot from the CD or DVD.
> > >   Diags = Boot to the manufacturer's diagnostics program.
> > >   Floppy = Boot from the floppy disk drive.
> > >   Hdd = Boot from a hard drive.
> > >   None = Boot from the normal boot device.
> > >   Pxe = Boot from the Pre-Boot EXecution (PXE) environment.
> > >   RemoteDrive (v1.2+) = Boot from a remote drive, such as an
> > > iSCSI target.
> > >   SDCard (v1.1+) = Boot from an SD card.
> > >   UefiBootNext (v1.5+) = Boot to the UEFI device that the
> > > BootNext
> > > property specifies.
> > >   UefiHttp (v1.1+) = Boot from a UEFI HTTP network location.
> > >   UefiShell = Boot to the UEFI Shell.
> > >   UefiTarget = Boot to the UEFI device specified in the
> > > UefiTargetBootSourceOverride property.
> > >   Usb = Boot from a system BIOS-specified USB device.
> > >   Utilities = Boot to the manufacturer's utilities program or
> > > programs
> > > ```
> > > 
> > > In the OpenBMC the current Dbus interfaces for the Boot Override
> > > feature are:
> > > ```
> > > /xyz/openbmc_project/control/host0/boot:
> > >     - Interface: xyz.openbmc_project.Control.Boot.Source
> > >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> > >     - Interface: xyz.openbmc_project.Control.Boot.Type
> > > /xyz/openbmc_project/control/host0/boot/one_time:
> > >     - Interface: xyz.openbmc_project.Control.Boot.Source
> > >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> > >     - Interface: xyz.openbmc_project.Control.Boot.Type
> > >     - Interface: xyz.openbmc_project.Object.Enable
> > > ```
> > > It works this way:
> > > - when `xyz.openbmc_project.Object.Enable` property under
> > > `/xyz/openbmc_project/control/host0/boot/one_time` is set to
> > > `true` we
> > > use Boot.Source/Mode/Type under
> > > `/xyz/openbmc_project/control/host0/boot/one_time` for the
> > > override
> > > feature.
> > > - when `xyz.openbmc_project.Object.Enable` property under
> > > `/xyz/openbmc_project/control/host0/boot/one_time` is set to
> > > `false`
> > > we use Boot.Source/Mode/Type under
> > > `/xyz/openbmc_project/control/host0/boot` for the override
> > > feature.
> > > 
> > > I don't really get why we split Override Source to `Boot.Source`
> > > and
> > > `Boot.Mode`, but this is the question for another time.
> > > 
> > > Right now I want to discuss the main problem with this
> > > approach... it
> > > is that OVERRIDE IS ALWAYS ENABLED. This
> > > `xyz.openbmc_project.Object.Enable` property only indicates if we
> > > should use permanent or one-time override.
> > > 
> > > I guess no one have noticed it since but by default override
> > > target
> > > (`Boot.Source`) is set to something like "None". So no one have
> > > experienced any difficulties. Override is enabled, but it says
> > > boot
> > > default.
> > > 
> > > Proof that IPMI valid flag is always enabled:
> > > ```uint1_t validFlag = 1;```
> > > https://github.com/openbmc/phosphor-host-ipmid/blob/e76a61a2f7c19ed07e2bfe98533d82bc23692fc1/chassishandler.cpp#L1861
> > > 
> > > `bmcweb` deals with this issue a little bit different (hello
> > > inconsistency!), it performs weird logic to decide if it should
> > > set
> > > `BootSourceOverrideEnabled` to `Disabled`.
> > > https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/systems.hpp#L951
> > > Which would get even weirder when support for EFI/Legacy selector
> > > would be merged:
> > > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/40970/10/redfish-core/lib/systems.hpp#929
> > > 
> > > So as you can see, the current approach is kinda buggy, ipmid
> > > always
> > > reports override as valid, bmcweb reports override as disabled
> > > when
> > > you write `BootSourceOverrideTarget = None`.
> > > 
> > > This all is already a problem, but when we add Legacy/EFI
> > > selector
> > > support, things are getting really messy.
> > > ipmid can no longer always say that override is valid, since it
> > > would
> > > be overriding boot either to EFI or Legacy.
> > > bmcweb now can report that override is disabled only when
> > > `BootSourceOverrideTarget = None` and `BootSourceOverrideMode =
> > > EFI`.
> > > Weird, yeah? We write that we want override to `None/EFI`, but
> > > read
> > > that override is `Disabled`. Weird and obviously wrong.
> > > 
> > > How to overcome all of this?
> > > To be honest I don't see any use in splitting Boot Override
> > > feature in
> > > two Dbus objects under `/xyz/openbmc_project/control/host0/boot`
> > > and
> > > `/xyz/openbmc_project/control/host0/boot/one_time`, since we
> > > don't
> > > need to fallback to permanent override after one-time override.
> > > 
> > > So I think the problem can be solved if we would have something
> > > like
> > > this on Dbus to represent Boot Override feature:
> > > ```
> > > /xyz/openbmc_project/control/host0/boot:
> > >     - Interface: xyz.openbmc_project.Control.Boot.Source
> > >     - Interface: xyz.openbmc_project.Control.Boot.Mode
> > >     - Interface: xyz.openbmc_project.Control.Boot.Type
> > >     - Interface: xyz.openbmc_project.Control.Boot.Permanent #
> > > true/false
> > >     - Interface: xyz.openbmc_project.Object.Enable
> > > ```
> > > I don't know if we can reuse any of the current interfaces for
> > > the
> > > `xyz.openbmc_project.Control.Boot.Permanent` feature, but I think
> > > something like these interfaces are what we need. With
> > > `Boot.Permanent` we can drop `one-time` object, and with
> > > `Object.Enable` we can solve all the aforementioned problems.
> > 
> > Sorry for the late response! I think this works. The two different
> > D-Bus objects were trying to achieve the same thing (as
> > Boot.Permanent
> > true/false), but as you noted they probably both needed an
> > Object.Enable interface. Boot.Permanent does seem simpler.
> > 
> > Thanks,
> > Deepak

-- 
Best regards,
Andrei Kartashev


