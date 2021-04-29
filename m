Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E5B36E65B
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 09:54:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW77w5WV6z301q
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 17:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNxpzYGv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kNxpzYGv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW77d6f0nz2xdQ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 17:54:37 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T7j5s9018767
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=55VK4ciz0OzcVRdoO7YAjMXFCeetMPYa1Qw0Op76Q9Q=;
 b=kNxpzYGvKsYuQ04HNNbQXiEEJXiCJ0wQaO6vMNa5d114vgFeZxvgkV6xmhdLQjaDFdSg
 rsiUFKiwnafJr9POxiNG3cmHd6uSWcfO28RfScJUVlQZLQSWFYyU0m5hUY7ogD4kThAc
 Ny/OiUsvFDsQaPFEwXvpphfluf1vWMDQ8xoYe062l1iVCkGloO37RA39HeJo7F+7vUlE
 Kvy0AZUm9x0vox+m4HtCTw7cFYzhulR1s7Sa8rYXxFi98LrzKe+fyAjkm3B5Wf0x8NsW
 yPJGIG+UqZBuc6UfnV/o2I93XbcXfXL5z0a0KYjxJ/w3/urRZvnOZqak6/pWculB/7PW YA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387rp9r8jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:33 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 29 Apr 2021 07:54:32 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 29 Apr 2021 07:54:32 -0000
Received: from us1a3-mail226.a3.dal06.isc4sb.com ([10.146.103.94])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2021042907543141-150047 ;
 Thu, 29 Apr 2021 07:54:31 +0000 
In-Reply-To: <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Date: Thu, 29 Apr 2021 07:54:31 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>,
 <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
 <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 50767
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21042907-1335-0000-0000-0000065EEAAA
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.376083
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526391; UDB=6.00825163; IPR=6.01308321; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-04-29 07:54:32
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-25 10:37:47 - 6.00012377
x-cbparentid: 21042907-1336-0000-0000-00004275F1E1
Message-Id: <OFC551DE86.58B7A7A3-ON002586C6.0011D77D-002586C6.002B718B@notes.na.collabserv.com>
X-Proofpoint-GUID: -2--U5Y72JM1xGsuolBQtqTXZTvhvsxw
X-Proofpoint-ORIG-GUID: -2--U5Y72JM1xGsuolBQtqTXZTvhvsxw
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: OpenBMC on RCS platforms
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_03:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----Timothy Pearson <tpearson@raptorengineering.com> wrote: -----

>To: Milton Miller II <miltonm@us.ibm.com>
>From: Timothy Pearson <tpearson@raptorengineering.com>
>Date: 04/28/2021 03:22PM
>Cc: Patrick Williams <patrick@stwcx.xyz>, openbmc
><openbmc@lists.ozlabs.org>
>Subject: [EXTERNAL] Re: OpenBMC on RCS platforms
>
>
>----- Original Message -----
>> From: "Milton Miller II" <miltonm@us.ibm.com>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "Patrick Williams" <patrick@stwcx.xyz>, "openbmc"
><openbmc@lists.ozlabs.org>
>> Sent: Monday, April 26, 2021 4:42:16 PM
>> Subject: RE: OpenBMC on RCS platforms
>
>[snip]
>
>>>At first glance, that's another overly complex solution for a
>>>simple
>>>problem that would cause a degraded user experience vs. other
>>>platforms.
>>>
>>=20
>> I have to agree, both overly complex and probably not useful in
>> that
>> its just a port interface for control.
>>=20
>>>We have an 800Mhz Linux-based computer with 512MB of RAM, serial
>>>and
>>>video out support already integrated into every one of our
>>>products.
>>>It can receive data via PCIe and via USB from an active host.  Why
>>>isn't there a mechanism to send a signed container to it over one
>>>of
>>>these existing channels for self-update?
>>>
>>>A potential user story looks like this:
>>>
>>>=3D=3D=3D=3D=3D
>>>
>>>I want to update the firmware on my Blackbird desktop to fix a
>>>problem I'm having with a new control widget I've plugged in.  To
>>>make things more interesting, I'm on an oil rig in the Gulf, and
>>>the
>>>desktop only connects via intermittent WiFi.  Spare parts are weeks
>>>away, and I have next to no electronic diagnostic equipment
>>>available
>>>to me.  There's one or two USB ports I can normally use because I
>>>have administrative privileges, but I was able to grab the upgrade
>>>file over WiFi instead, saving myself some time cleaning
>>>accumulated
>>>gunk out of the ports.
>>>
>>>I can update my <large vendor> standard PC firmware just by running
>>>a
>>>tool on Windows, but the Blackbird was selected because it controls
>>>a
>>>critical process that needed to be malware-resistant.
>>>
>>>Fortunately, OpenBMC implemented a quality firmware update process.
>>>I just need to launch a GUI tool with host administrative
>>>privileges,
>>>select the upgrade file, and queue an upgrade to happen when I
>>>reboot
>>>the machine.  I queue the update, start the reboot, and stick
>>>around
>>>to see the upgrade progress on the screen while it's booting back
>>>up.
>>> Because I can see the status on the screen, I know what is
>>>happening
>>>and don't pull the power plug due to only seeing a black screen and
>>>power LED for 10 minutes.  Finally, the machine loads the OS and I
>>>verify the new control widget is working properly.
>>>
>>>=3D=3D=3D=3D=3D
>>>
>>>Is there a technical / architectural reason this can't be done, or
>>>some other reason it's a bad idea?
>>>
>>=20
>> I ended up writing this twice or thrice.  Also what I call
>> phosphor-initfs is actually the package obmc-phosphor-initfs.bb
>> found in meta-phosphor/recipies-phosphor/initrdscripts/.
>>=20
>>=20
>> There are two issues.  One is that there is no graphics
>> library or console code for the aspeed bmc.  I understand a
>> text rendering library was added for boot monitoring). But
>> if you are starting from the host up, then use the host to
>> drive the GUI and just establish a command session (network,
>> USB to host, or serial).
>>=20
>> The biggest limitation is we use squashfs for file system
>> for space efficency.  This is a read-only filesystem that
>> contains references between different pieces that is loaded
>> and decompressed by the kernel on demand.  That means you can
>> not be running on the copy in flash while trying to update
>> that copy in the flash.
>>=20
>> If you have space for two copies then you can update the
>> second copy while the primary is online.  This is supported
>> in the UBI and eMMC layouts upstream.
>>=20
>> If you only have flash space for one copy then you have to
>> arrange for something more limited.  Either way you are
>> subject to bricking on interrupted flash unless you do
>> something exotic like repurpose the host chip as a backup
>> BMC during the process.   But if its just the feedback
>> then the upstream code has help that isn't in the Redfish
>> flow.
>
>Most of these systems also have a significant amount of RAM
>available, enough to hold both the update file and the existing BMC
>Flash contents while the system remains online.  Is there any way we
>could copy the existing Flash into RAM, then "pivot" the running
>system to use the copy in RAM as the backing store?

[See also the Thrice description ...]

There is no version of filesystem that I am aware of that=20
says "instead of using layer x, start using layer y that=20
will have the same content".

The existing init script has a config option to copy the=20
contents from the flash to RAM then loop mount the file.=20=20
Of course this will likely increase the boot time because=20
all content had to be copied from the flash before starting=20
any userspace from the volume.   Also the copy uses all
space alloced to the rofs layer; it is not smart enough to
only copy the length of the squashfs contents even though=20
that is in the filesystem header.

Thinking a bit this evening, squashfs uses a block device=20
for storage so one could use DM to create a 1-member=20
degraded raid1 on the mtdblock device, and add a ramdisk=20
block drive (rd) as the mirror.  The ramdisk can be added=20
as a degraded volume after boot to avoid having the kernel
spending time coping the data instead of starting the real
userspace.  After the rd copy is synced, one could remove=20
the mtdblock volume from the raid1.

This requires access to dm-tools to setup the raid unless=20
the in-kernel raid metadata would work on a mtdblock=20
volume.   The md layerprobably wants to update the=20
superblock of the good volume or something.

The above got the rofs, but didn't address the rwfs.  We
use jffs2 today.  While there are other options, the mtd
writable filesystems understand the large erase blocks but
the general block device file systems do not.

The existing init does have an option to copy designated=20
files from the host to a tmpfs, and from the tmpfs back=20
to the rwfs.  It also can erase the rwfs partition.  This
can be used for freeing the rwfs space during the firmware
update but on an abnormal shutdown the updates to the
rwfs are lost, be they logs or configuration updates.


>
>Bricking on power cut is, well, expected during a BMC update without
>a backup Flash chip.  Not cutting power during a low level firmware
>update is I think still ingrained sufficiently in the average PC
>users psyche not to be a significant issue, especially if several
>warnings are given before and during the update process regarding
>ensuring power is not cut.  Even if it is cut, the BMC Flash is
>socketed for a reason.
>
>All that said, ideally, longer term, a recovery partition could be
>added to the Flash -- basically, a normal BMC update would only
>update the rofs partition, leaving u-boot, kernel, and the recovery
>partition alone.  The recovery partition would contain a very small
>userspace, just enough to accept some kind of network connection for
>e.g. TFTP upload of a new firmware (similar to how various embedded
>devices and even small PCs can be recovered).
>
>>=20
>> =3D=3D=3D=3D
>> Once
>>=20
>> The "static" mtd layout with phosphor-initfs has support
>> for both loading the static flash content into RAM, allowing
>> the update to occur with full services running, and as  a
>> backup on shutdown it will apply the update on bmc reboot
>> by switching back to the initramfs and performing the flash
>> from there.  The status of the later update is only visible
>> on the console, which might be hidden on an internal serial
>> cable by default.
>>=20
>> Unfortunately the "prepare for update" method that was in
>> the original update instructions and tells the BMC init
>> "hey, load all this content into ram, so that you can write
>> over the flash" got lost in the "we must be limited to what
>> RedFish can support".  The code is still in the low level
>> scripts but the fancy rest api is missing.  Also with the
>> addition of code verification the actual flash progress
>> was hidden.
>>=20
>> The phosphor-initfs scripts also allow a new filesystem
>> image to be downloaded over the network if you wish to test.
>> This doesn't have signature checking code, and it can be
>> disabled by build options.
>>=20
>> All of the options to phosphor-initfs can be set by u-boot
>> environment variables (one of which is cleared by a systemd
>> unit each boot, on that is not) and by the kernel command
>> line.
>>=20
>> Note: I highly suggest not to use image-bmc (for the whole
>> flash) as this erases the entire flash (although we try to
>> write back the u-boot environment), but instead use image-kernel,
>> image-rofs, etc to allow the prior rwfs and u-boot to persist.
>> Some bad assertions may have migrated into the code-update
>> rest endpoints and we should accept patches.
>>=20
>> Bottom Line:
>>=20
>> Put the BMC in maintence mode and you can update the image
>> while the stack is running.  You can then use ssh to
>> display the flash progress.  If you need a fancy gui and
>> not the internal serial then use the host, or write the
>> rest of the graphics stack.
>
>That's all over external network again, though.  Point is we want to
>do this from the host -- the host in general is unable to connect to
>the BMC when the BMC is piggybacking on a host network port (all of
>our products do this, and a lot of other vendors use the same
>design).

Well, Intel i210 has a bmc controlled mode to control if the host
can see the network, the bmc, or both.   However, it also allows=20
the bmc to redirect any traffic to itself, so that is another can
of worms.

Point is, can your customized firmware add BMC to Host networking?

>
>If we were assured of external BMC network access, updates become
>very simple.  In this kind of deployment though, there is no external
>network access to the BMC.
>
>> If you need the reliable backout then you need space for
>> a second image, even if its smaller due to being emergency
>> servies only.
>>=20
>>=20
>> PS:  There were some flashes we tried early that had
>> horrible erase times -- over 20 minutes for a full
>> erase.  Check the specs for the parts you provide vs
>> others in the market, the better ones erase in a few
>> minutes.
>
>We use the better-specced ones for both BMC and PNOR.
>
>> PPS:  The reason we added UBI was its feature to use
>> the whole flash for wear leveling (minus the bootloader
>> that is outside the UBI partition).
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Twice: Going back to the scenerio again
>>=20
>>>I just need to launch a GUI tool with host administrative
>privileges,
>>>select the upgrade file, and queue an upgrade to happen when I
>reboot
>>>the machine.  I queue the update, start the reboot, and stick
>around
>>>to see the upgrade progress on the screen while it's booting back
>up.
>>> Because I can see the status on the screen, I know what is
>happening
>>>and don't pull the power plug due to only seeing a black screen and
>>>power LED for 10 minutes.  Finally, the machine loads the OS and I
>>>verify the new control widget is working properly.
>>=20
>> If the gui is on the host, with todays stock phosphor-initfs, you
>need
>> 1) a connection from the host to the bmc
>>   ethernet, serial, usb ethernet etc
>>   (to copy files from host to BMC RAM and to monitor command
>output)
>
>Precisely.  USB would be an interesting control channel, but I don't
>think OpenBMC currently supports this kind of access?
>

Actually the current usb-ctrl script has an option to configure the
ecm gadget, and there are patches to update the script to use=20
defined mac addresses.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/usb/gadget/Kconfig?h=3Dv5.12#n281
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-misc/+/42280/

>> 2) hardware ability to reboot bmc with host surviving
>> - all userspace has to be replaced with those on the filesystem in
>> RAM
>> - can be shortened slightly by preloading image in BMC before
>> shuting
>>   down services if the current kernel is compatible.  This can be
>> the
>>   old or new image.
>>=20
>> - or -
>>=20
>> Boot the host for GUI support with the BMC in an optimized
>> update mode.
>>=20
>>  This can be before or after the file is downloaded to the
>>  host.
>>=20
>>=20
>> 3) Once the bmc is running from a squashfs in RAM (and if you want
>> to clean the rwfs overlay, persist on clean reboot/shutdown mode),
>>=20
>> - copy the image to the bmc
>> - validate as required (preferably somewhere under /run)
>> - move imgage-rofs , kernel, etc as needed to /run/initramfs
>> - /run/initramfs/update
>>    (which checks the fs is not obviously mounted,
>>     runs flashcp, which has status on stdout
>>     moves files successfully written
>>     and then writes selected overlay content back to rwfs
>> - check the images were all written
>> - reboot
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Option Three:
>> This might be a better experience but needs some software work
>> to enable kexec on the 2500.
>>=20
>>=20
>> Transfer the FS and kernel to the BMC RAM, and kexec the kernel
>> (note patches on the list for 2600 need to test and maybe a bit of
>> coding for the 2500).  Optionally this can contain the virt pnor
>> image too.  After the BMC boots from the system in RAM boot the
>> host from vpnor image in RAM then use the host to drive the GUI
>> to acknoledge and initiate the flash as desired.
>>=20
>> The hooks are in phosphor-initfs to flash the image after the
>> host is up, and to boot with the image in RAM.
>>=20
>> As an alternative to kexec, if the new file system supports the
>> old BMC kernel then the shutdown script can easily be edited to
>> restart the exec script with the images in /run.  Alternatively
>> if the new kernel supports the old user space then it can be
>> flashed first, then on the next boot the prior case applies as
>> it is the updated kernel.  Note: I did this flow several times
>> in developement but decided not to put code in the shutdown
>> script because its a script that is executed from /run/initramfs
>> and can easily be edited there when alternative flow is required.
>> (there are comments that show where to edit).
>>=20
>>=20
>>>>> =3D=3D BMC boot time =3D=3D
>>>>>=20
>>>>> This is self explanatory.  Other vendors' solutions allow the
>host
>>>>> to be powered
>>>>> on within seconds of power application from the wall, and even
>>>>> our
>>>>> own Kestrel
>>>>> soft BMC allows the host to begin booting less than 10 seconds
>>>>> after power is
>>>>> applied.  Several *minutes* for OpenBMC to reach a point where
>>>>> it
>>>>> can even
>>>>> start to boot the host is a major issue outside of datacenter
>>>>> applications.
>>>>=20
>>>> Some of this is, to me, an artifact of the Power architecture and
>>>> not an
>>>> artifact of OpenBMC explicitly.  On x86 systems we have a little
>>>> code in
>>>> u-boot that wiggles a GPIO and gets the Host power sequence going
>>>> while
>>>> the BMC is booting up.  This overlaps quite a bit of the memory
>>>> testing
>>>> of the Host with the BMC boot time.  The "well-known proprietary
>>>> BMC"
>>>> also does this same trick.
>>>
>>>I think we're talking about two different well know proprietary
>>>BMCs,
>>>but that's not important for this discussion other than no, the one
>>>I
>>>have in mind doesn't resort to such tricks.  What it does do is
>>>start
>>>up its core services rapidly enough where this isn't a problem, and
>>>lets the rest of the BMC stack start up at its own pace later on.
>>>=20
>>>> Power requires the BMC to be up in order to serve out the virtual
>>>> PNOR,
>>>> from my recollection.  It seems like this could be solved in
>>>> other
>>>> ways,
>>>> such as a SPI-mux on a physical SPI-NOR so that the BMC can take
>>>> the NOR
>>>> at specific times during update but otherwise it is given to the
>>>> host
>>>> CPUs.  This is exactly what we do on x86 systems.
>>>
>>>Ouch.  So on x86 boxen you might actually have two "BMCs" -- the
>>>proprietary one inside the CPU that starts in seconds and provides
>>>base services like SPI Flash mapping to CPU address space, and the
>>>external OpenBMC one that can run in parallel without interfering
>>>with host start.  Adding a mux is then a hack needed on top, since
>>>you can't really communicate with the proprietary stack in the
>>>required manner.
>>>
>>=20
>> I'd say their cpu doesn't require the bmc to boot, it also means
>> they trust their system to not melt without bmc monitoring.
>
>I'd argue it's really a bit of semantics. :)  x86 systems have a sort
>of proto-BMC built right in to every single CPU, in the form of the
>ME/PSP and its associated firmware, that can provide various
>functions including (IIRC) thermal control.  On the ARM side, you're
>probably right, they're a bit more primitive in terms of just mapping
>Flash directly to the CPU address space on low end parts, though I
>think (?) the modern higher end parts are back to a sort of "security
>manager" BMC-analogue providing these basic services to the host CPU.
>
>Regardless, POWER does stick out like a sore thumb for shoving these
>low level functions into the high level "full-stack" BMC.
>Architecturally, it may not have been the best decision, but I do
>understand it sped time to market etc.   Fortunately, it's also
>something we can work to fix.

Hostboot can probably boot a decent way up with just a readonly
mapping of the flash.  Either copy the image to ram or just the
ioctl to the flash chip if the pnor flash is full image.


>
>>>For systems like POWER that lack the proprietary internal "BMC", I
>>>guess there are a few ways we could address the problem:
>>>
>>>1.) Speed up OpenBMC load -- this sounds like it would end up being
>>>completely supported by one or two vendors alone, and subject to
>>>breakage from the other vendors that simply don't have any concerns
>>>around OpenBMC start time since their platforms aren't visibly
>>>affected by it.  It's also unlikely to come into the desired
>>>>sub-10s
>>>range.
>>>
>>>2.) Split the BMC into "essential" and "nice to have" services,
>>>>much
>>>like the other platforms.  Painful, as it now requires even more
>>>parts on the mainboard.
>>>
>>>3.) Keep the single BMC device, but split it into two software
>>>stacks, one that can load nearly instantly and start providing
>>>essential services, and another than can load more slowly.  This
>>>would effectively require two separate CPUs inside the BMC, which
>>>we
>>>actually do have in the AST2500.  I haven't done any digging though
>>>to see if the second CPU is powerful enough to implement the HIOMAP
>>>protocol at speed.
X>>>
>>>> Having said all of that, there is certainly some performance
>>>> improvements that can be done, but nobody has taken up the torch
>>>> on
>>>> it.
>>>> A big low-hanging fruit in my mind is the file system compression
>>>> being
>>>> xz or gzip is very computationally intensive.  I did some work,
>>>> with
>>>> Nick Terrell, to switch to zstd on our systems for both the
>>>> kernel
>>>> initramfs and UBI and saw significant boot time improvements.
>>>> The
>>>> upstream enablement for this appears to have landed as of v5.9 so
>>>> we
>>>> could certainly start enabling it here now.
>>>>=20
>>>>
>>>INVALID URI REMOVED
>>>linux-2Dkbuild_20200730190841.2071656-2D7-2Dnickrterrell-40gmail.co
>m_
>>>&d=3DDwIFaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8
>As
>>>2xrXeO9ZSo4&m=3D2O37p_XR8IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DDF7yGqf
>SE
>>>-V5_j_DgmASLOgLpkfjcJpCK5xsJW3avqY&e=3D
>>>>=20
>>=20
>> In addition to compression options there are tradeoffs on how much
>> is
>> copied to ram vs how much is read from the flash possibly
>> repeatedly.
>> If you add secure boot the time goes up.
>
>Yeah, I'm really coming around to the idea that we need to embrace
>the split architecture every other system uses.  The LPC bridge and
>base power / fan controls really should be running independently on
>the ColdFire core, not on the main "full stack" BMC ARM core, and
>even for Kestrel we're exploring something similar (though in that
>case, it's mainly so that the host doesn't die if we accidentally
>crash the main CPU).

Have you looked at starting hiomap early?  and telling hostboot
assume the whole image is there until you need to write?

Can you get by with a fixed fan through memory post where=20
hostboot is running a single core?

>
>>>>> =3D=3D Host boot status indications =3D=3D
>>>>>=20
>>>>> Any ODM that makes server products has had to deal with the
>>>>> psychological "dead
>>>>> server effect", where lack of visible progress during boot
>>>>> causes
>>>>> spurious
>>>>> callouts / RMAs.  It's even worse on desktop, especially if
>>>>> server-type
>>>>> hardware is used inside the machine.  We've worked around this a
>>>>> few times with
>>>>> our "IPL observer" services, and really do need this
>>>>> functionality
>>>>> in OpenBMC.
>>>>> The current version we have is both front panel lights and a
>>>>> progress bar on
>>>>> the BMC boot monitor (VGA/HDMI), and this is something we're
>>>>> willing to
>>>>> contribute upstream.
>>>>=20
>>>> Great!  Let's get that merged!
>>>
>>>Sounds good!  The files aren't too complex:
>>>
>>>INVALID URI REMOVED
>>>_git_blackbird-2Dskeleton_tree_pyiplobserver&d=3DDwIFaQ&c=3Djf_iaSHvJOb
>Tb
>>>x-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3D2O37p_XR8
>IO
>>>9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DzLtrjaE2hHjV3z9ar0gcJVvZ9Uzwxinf
>ed
>>>AOMEWs04s&e=3D
>>>INVALID URI REMOVED
>>>_git_blackbird-2Dskeleton_tree_pyiplledmonitor&d=3DDwIFaQ&c=3Djf_iaSHvJ
>Ob
>>>Tbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3D2O37p_X
>R8
>>>IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DAOWB1Ja82thvSZFO81WfIj7MJtg5Te
>ZN
>>>8wpT_EpG_Zo&e=3D
>>>
>>>Is the skeleton repository the best place for a merge request?
>>=20
>> hmm, as prototype code in python, maybe.   I don't think many
>> current
>> systems ship python.  Also upstream Yocto removed all support for
>> python 2.
>>=20
>> In addition I see a mix of "copy the data" and "transform the data"
>> in the same script, such as
>>=20
>> updateIPLLeds(self, initial_start, status_changed)
>>=20
>> with
>>            # Show major ISTEP on LED bank
>>            # On Talos we only have three LEDs plus a fourth
>> indicator modification
>>            # bit, but the major ISTEPs range from 2 to 21
>>            # Try to condense that down to something more readily
>> displayable
>>=20
>>=20
>> [ After some thought, its ok to be in the output code, as it's
>> formatting the data for the display. ]
>>=20
>>=20
>> The upstream post interface logs the post codes, and display is
>> a separate function.  The ipl_status_monitor seems to mix
>> monitoring
>> the port 80 snoops with other logic to determine the system state
>> eg is the host up?.
>>=20
>> Also both scripts extensivly use popen to handle device
>> communication
>> and some communication to other services (kill to post code).
>>=20
>>=20
>>>
>>>> I do think some others have support for a 7-seg display with the
>>>> postcodes going to it already.  I think this is along those same
>>>> lines.
>>>> It might just be another back-end for our existing post code
>>>> daemon
>>>> to
>>>> replicate them to the VGA and/or blink morse code on an LED.
>>>
>>>OK, so this is what we ran into before.  Where is this support
>>>in-tree, and do we need to reimplement our system to match what
>>>already exists (by extension, extending the other vendor code since
>>>our observer is more detailed in terms of status etc.), or would we
>>>be allowed to provide a competing solution to this other support,
>>>letting ODMs pick which one they wanted?
>>>
>>=20
>> Our upstream code is at
>> INVALID URI REMOVED
>> mc_phosphor-2Dhost-2Dpostd&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dbvv=
7AJ
>> EECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DxjFkq8WLDkwI0WAERUAgRudWVVcq4
>> 10qqWVjl-Ka4-M&s=3DVJweaMcJOe7tEVYUZkBMijTisbfRMkTVN9ga4s-d8Xw&e=3D=20
>> for the snoop readers and the LED segment drivers, and the history
>> and Dbus owner is
>> INVALID URI REMOVED
>> mc_phosphor-2Dpost-2Dcode-2Dmanager&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-siA1ZOg
>> &r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DxjFkq8WLDkwI0WAERUAg
>> RudWVVcq410qqWVjl-Ka4-M&s=3DesXQVng9zvQlGkdhvk0dH12NrhHkOGgAsIqi_MLaPRY
>> &e=3D .
>>=20
>> To catalog the source of the host and bmc there is
>>
>INVALID URI REMOVED
>mc_phosphor-2Dstate-2Dmanager_blob_master_obmcutil&d=3DDwICaQ&c=3Djf_iaSH
>vJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3DxjFkq
>8WLDkwI0WAERUAgRudWVVcq410qqWVjl-Ka4-M&s=3Dbrrhp8N0QwEZNOkddBmqUH6OoufV
>H5DQxo4GAPBCMbo&e=3D=20
>>=20
>> In addition to phosphor-misc for "one file projects" there is
>> openbmc-tools for handy tools which may be more developer focused.
>
>So it sounds like we'd need to rewrite this as a set of patches for
>phosphor-post-code-manager?  Would they actually be merged or would
>we run into resistance to extending the functionality of that system
>for our use case?

Actually I think the manager would stay, and you might be adding
an appliation similar to the 7 segemnt led driver in the the
phosphor-host-postd to take the data snooped from port 80 and
formatting it for your display.

>
>>>>> =3D=3D IPMI / BMC permissions =3D=3D
>>>>>=20
>>>>> An item that's come up recently is that, at least on our older
>>>>> OpenBMC versions,
>>>>> there's a complete disconnect between the BMC's shell user
>>>>> database and the
>>>>> IPMI user database.
>>=20
>> Mostly true, in part because the IPMI password for RCMP+ must be
>> stored on the BMC (reversiably encrypted for our implementation).
>> Note improper storage of this was an area of one or more CVEs.
>>=20
>> In addition it has a limit of 20 characters in a password and 8
>> users.
>>=20
>>>>> Resetting the BMC root password isn't possible from IPMI
>>>>> on the host, and setting up IPMI doesn't seem possible from the
>>>>>>BMC shell.  If
>>=20
>> In our current code we have pam hooks that save the password
>> during a change, if the user is in the ipmi group and the
>> password is short enough (or returns an error).
>>=20
>>>>> IPMI support is something OpenBMC provides alongside Redfish, it
>>>>> needs to be
>>>>> better integrated -- we're dealing with multiple locked-out BMC
>>>>> issues at the
>>>>> moment at various customer sites, and the recovery method is
>>>>> painful at best
>>>>> when it should be as simple as an ipmitool command from the host
>>>>> terminal.
>>>>=20
>>>> I suspect most of this is a matter of IPMI command support and/or
>>>> enabling
>>>> those commands to the host IPMI path.  Most of us are fairly
>>>> untrusting
>>>> of IPMI (and the Host itself), so there hasn't been work to do
>>>> anything
>>>> here.  As long as whatever you're proposing can be disabled for
>>>> models
>>>> where we distrust the Host, it seems like these would be accepted
>>>> as
>>>> well.
>>=20
>>=20
>> Our current Redfish has multiple users and can enable and
>> disable users to have ipmi access and set their password.
>>=20
>>=20
>> Of course this just moves the goal posts to the Redfish
>> admin login, but in addition to mTLS certificate based
>> trust (which should be customized to the customer),
>>=20
>> Redfish has the concept of a host firmware and os logins
>> including a binding for EFI to specify adapter path and
>> network in addition to read-once magic efi variables.  I
>> know OpenPOWER boxes don't have EFI but the information
>> could be exposed in a similar fashion.  As far as I know
>> we have not yet implemented these users in our Redfish
>> server.
>
>Honestly Redfish is something that we might just want to move to, and
>officially / formally drop network IPMI support.  Probably the
>biggest issue with that comes right back down to needing
>communication between the host and BMC, however -- ipmitool shortcuts
>the whole BMC/host network isolation problem (described above) by
>using the USB interface.  Is there a way to use Redfish over USB in a
>similar manner?

DEPRECATED =3D=3D=3D=3D=3D skip this for below

As I mentioned, the Redfish specification explictly=20
talks about having a login for the firmware and the=20
booted OS, and requirements for the admin to allow=20
or disallow the IDs.  In addition it talks about how=20
the information is presented to a EFI boot.  The model=20
generates a unique password for each boot using special=20
EFI variables, include designation of network path=20
including the concept of USB network or pci slot and=20
function, IP information, etc.  It uses special=20
read-once efi variables to protect the password from=20
casual snooping.

I don't think we (OpenBMC) have that implemented this=20=20
magic user, but would anticipate that it would be=20
accepted.

Also, for OpenPOWER we would likely want to define=20
an OF binding.   Thinking about this, due to the=20
desire to clear after fetch something like the=20
SYSPARMS api that can request a value optinally=20
from the service processor might be approprate,=20
even though that is currently a FSP only interface.=20

https://github.com/open-power/skiboot/blob/master/doc/device-tree/ibm%2Copa=
l/sysparams.rst
https://github.com/open-power/skiboot/blob/master/doc/opal-api/opal-param-8=
9-90.rst

Another alternative would be the secvar interface=20
if that could be common with userspace expecting=20
the efi variables, but that would have to be=20
multiplexed with the current secvar backend for=20
secure boot management.=20

DEPRECATED =3D=3D=3D END =3D=3D=3D

The Redfish spec was updated to have a IPMI=20
command to create a Bootstrapping credential=20
that can then be used until disabled and will=20
be invalidated by a Host Reset or Service=20
Reset.   The expectation is this temporary=20
role will be used to create a permanent=20
account.  This service is only available on a=20
designated interface and can be disabled or=20
enabled from the Redfish HostInterface=20
representation.

I believe this too would have to be=20
implimented, but exposing the information
to an openfirmware client is much easier=20
as it could be a few properties in the=20
device tree path.  USB networks are=20
identified by vendor, device, and serial
and the ecm device serial is generated
using the bmc machine-id.

=3D=3D=3D=3D=3D

For in-box communication, IPMI is being replaced with=20
PLDM and MCTP, as=20
IPMI is being replaced in future stacks by PLDM and MCTP,=20
as Redfish is expecting a reliable transport and is=20
string based so quite verbose.


https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
https://github.com/openbmc/docs/blob/master/designs/mctp/

>
>Thanks!
>
>

