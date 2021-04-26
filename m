Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4346236BB54
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 23:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTdfQ1bh4z302V
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 07:42:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=irG4Mh7s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=irG4Mh7s; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTdf70t4nz2yRT
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 07:42:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QLYPhE195766
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 17:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=6A8n+GRsp61LgNKUsnOoMZ7+1rGyVDQcSfaFEHlOE5M=;
 b=irG4Mh7salmz9dUAS0RYGiR9i4UzSLRrfU8tDbHqn1oGK7dpnF9UqjV/SsTLeVgUJ/Lh
 vQb630rm4ndFHMe+ZZhFOUpX+2v/vM5h/nyuLpQg8SPPjrLsoafe4hnePQ9+E8NL6NDY
 wR1MgJH4MpfN65yC77lvi1b3lyZjhxWERFGzn8c0OXeZORaSKg8sPDXn15kCAzWQBsZa
 QMKSc5bBlTksSYencbghUKTh/E91RWVu+o9oo2Ym10uuySXofUedIQgkF+E6qRM05+JG
 gQx4yAWkpDL5KKf35AS7udF67dQs6gfjcfpfx4rNPQNhmyZTexLKfopy+O+1N/hCfCEM MQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.110])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3862rfckmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 17:42:19 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 26 Apr 2021 21:42:18 -0000
Received: from us1b3-smtp08.a3dr.sjc01.isc4sb.com (10.122.203.190)
 by smtp.notes.na.collabserv.com (10.122.47.50) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 26 Apr 2021 21:42:17 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp08.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021042621421656-698404 ;
 Mon, 26 Apr 2021 21:42:16 +0000 
In-Reply-To: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Date: Mon, 26 Apr 2021 21:42:16 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 52771
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21042621-1059-0000-0000-000003C66DC3
X-IBM-SpamModules-Scores: BY=0.019604; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0; ST=0; TS=0; UL=0; ISC=; MB=0.360742
X-IBM-SpamModules-Versions: BY=3.00014940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01526391; UDB=6.00825164; IPR=6.01308321; 
 MB=3.00036522; MTD=3.00000008; XFM=3.00000015; UTC=2021-04-26 21:42:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-23 12:31:21 - 6.00012377
x-cbparentid: 21042621-1060-0000-0000-00008A718A1D
Message-Id: <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
X-Proofpoint-GUID: dHlrEd-8LdPR3X1BxA42_57Jaf1d5MBZ
X-Proofpoint-ORIG-GUID: dHlrEd-8LdPR3X1BxA42_57Jaf1d5MBZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: OpenBMC on RCS platforms
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_09:2021-04-26,
 2021-04-26 signatures=0
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

Timothy Pearson <tpearson@raptorengineering.com> wrote:
>----- Original Message -----
>> From: "Patrick Williams" <patrick@stwcx.xyz>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "openbmc" <openbmc@lists.ozlabs.org>
>> Sent: Friday, April 23, 2021 12:11:26 PM
>> Subject: Re: OpenBMC on RCS platforms
>
>> On Fri, Apr 23, 2021 at 09:30:00AM -0500, Timothy Pearson wrote:
>>> All,
>>>=20
>>> I'm reaching out after some internal discussion on how we can
>>> better integrate
>>> our platforms with the OpenBMC project.  As many of you may know,
>>> we have been
>>> using OpenBMC in our lineup of OpenPOWER-based server and desktop
>>> products,
>>> with a number of custom patches on top to better serve our target
>>> markets.
>>=20
>> Hi Timothy,
>>=20
>> Good to hear from your team again and hope there is some ways we
>> can
>> work together on solving some of these issues.
>>=20
>>> Roughly speaking, we see issues in OpenBMC in 5 main areas:
>>=20
>> We might want to fork this into 5 different discussion threads
>> and/or
>> design documents, but let's see how this goes...
>>=20

[ some issues trimmed, including fan ]

>>> =3D=3D Local firmware updates =3D=3D
>>>=20
>>> This is right behind fan control in terms of cost and PR damage
>>> for us vs.
>>> competing platforms.  While OpenBMC's firmware update support is
>>> very well
>>> tuned for datacenter operations (we use a simple SSH + pflash
>>> method on our
>>> large clusters, for example) it's absolutely terrible for desktop
>>> and
>>> workstation applications where a second PC is not guaranteed to be
>>> available,
>>> and where wired Ethernet even exists DHCP is either non-existent
>>> or provided by
>>> a consumer cable box.  Some method of flashing -- and recovering
>>> -- the BMC and
>>> host firmware right from the local machine is badly needed,
>>> especially for the
>>> WiFi-only environments we're starting to see more of in the wild.
>>> Ideally this
>>> would be a command line tool / library such that we can integrate
>>> it with our
>>> bootloader or a GUI as desired.
>>=20
>> This sounds to me pretty easily obtainable and what I have in mind
>> is
>> actually a valid data center use case for many of us.  When all
>> else
>> fails, you should be able to use a USB key to update the system
>> (assuming the image you're updating with is trusted for whatever
>> your
>> system determines is trust-worthy).  I'm pretty sure our OCP
>> systems can
>> be updated with a magic combination of a USB-key and an OCP debug
>> card(*).  I don't think that is currently implemented on
>> openbmc/openbmc,
>> but it is on our list of pending features.
>>=20
>> For your specific users, the OCP debug card is probably not a good
>> requirement, but you could likely automate the update whenever a
>> USB-key
>> plus text file is added?  (I'm just brainstorming how you'd know to
>> kick
>> it off).  The current software update code probably isn't too far
>> off
>> from being able to facilitate this for you.
>>=20
>> https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd-s=
pec_v1p0
>
>At first glance, that's another overly complex solution for a simple
>problem that would cause a degraded user experience vs. other
>platforms.
>

I have to agree, both overly complex and probably not useful in that
its just a port interface for control.

>We have an 800Mhz Linux-based computer with 512MB of RAM, serial and
>video out support already integrated into every one of our products.
>It can receive data via PCIe and via USB from an active host.  Why
>isn't there a mechanism to send a signed container to it over one of
>these existing channels for self-update?
>
>A potential user story looks like this:
>
>=3D=3D=3D=3D=3D
>
>I want to update the firmware on my Blackbird desktop to fix a
>problem I'm having with a new control widget I've plugged in.  To
>make things more interesting, I'm on an oil rig in the Gulf, and the
>desktop only connects via intermittent WiFi.  Spare parts are weeks
>away, and I have next to no electronic diagnostic equipment available
>to me.  There's one or two USB ports I can normally use because I
>have administrative privileges, but I was able to grab the upgrade
>file over WiFi instead, saving myself some time cleaning accumulated
>gunk out of the ports.
>
>I can update my <large vendor> standard PC firmware just by running a
>tool on Windows, but the Blackbird was selected because it controls a
>critical process that needed to be malware-resistant.
>
>Fortunately, OpenBMC implemented a quality firmware update process.
>I just need to launch a GUI tool with host administrative privileges,
>select the upgrade file, and queue an upgrade to happen when I reboot
>the machine.  I queue the update, start the reboot, and stick around
>to see the upgrade progress on the screen while it's booting back up.
> Because I can see the status on the screen, I know what is happening
>and don't pull the power plug due to only seeing a black screen and
>power LED for 10 minutes.  Finally, the machine loads the OS and I
>verify the new control widget is working properly.
>
>=3D=3D=3D=3D=3D
>
>Is there a technical / architectural reason this can't be done, or
>some other reason it's a bad idea?
>

I ended up writing this twice or thrice.  Also what I call
phosphor-initfs is actually the package obmc-phosphor-initfs.bb
found in meta-phosphor/recipies-phosphor/initrdscripts/.


There are two issues.  One is that there is no graphics
library or console code for the aspeed bmc.  I understand a=20
text rendering library was added for boot monitoring). But=20
if you are starting from the host up, then use the host to=20
drive the GUI and just establish a command session (network,=20
USB to host, or serial).=20=20

The biggest limitation is we use squashfs for file system=20
for space efficency.  This is a read-only filesystem that=20
contains references between different pieces that is loaded
and decompressed by the kernel on demand.  That means you can
not be running on the copy in flash while trying to update
that copy in the flash.

If you have space for two copies then you can update the
second copy while the primary is online.  This is supported
in the UBI and eMMC layouts upstream.

If you only have flash space for one copy then you have to
arrange for something more limited.  Either way you are=20
subject to bricking on interrupted flash unless you do
something exotic like repurpose the host chip as a backup
BMC during the process.   But if its just the feedback
then the upstream code has help that isn't in the Redfish
flow.


=3D=3D=3D=3D
Once

The "static" mtd layout with phosphor-initfs has support=20
for both loading the static flash content into RAM, allowing=20
the update to occur with full services running, and as  a=20
backup on shutdown it will apply the update on bmc reboot=20
by switching back to the initramfs and performing the flash=20
from there.  The status of the later update is only visible=20
on the console, which might be hidden on an internal serial=20
cable by default.

Unfortunately the "prepare for update" method that was in=20
the original update instructions and tells the BMC init=20
"hey, load all this content into ram, so that you can write=20
over the flash" got lost in the "we must be limited to what=20
RedFish can support".  The code is still in the low level=20
scripts but the fancy rest api is missing.  Also with the=20
addition of code verification the actual flash progress=20
was hidden.

The phosphor-initfs scripts also allow a new filesystem=20
image to be downloaded over the network if you wish to test.
This doesn't have signature checking code, and it can be
disabled by build options.

All of the options to phosphor-initfs can be set by u-boot=20
environment variables (one of which is cleared by a systemd
unit each boot, on that is not) and by the kernel command=20
line.

Note: I highly suggest not to use image-bmc (for the whole
flash) as this erases the entire flash (although we try to
write back the u-boot environment), but instead use image-kernel,=20
image-rofs, etc to allow the prior rwfs and u-boot to persist.
Some bad assertions may have migrated into the code-update=20
rest endpoints and we should accept patches.

Bottom Line:

Put the BMC in maintence mode and you can update the image
while the stack is running.  You can then use ssh to=20
display the flash progress.  If you need a fancy gui and=20
not the internal serial then use the host, or write the=20
rest of the graphics stack.

If you need the reliable backout then you need space for=20
a second image, even if its smaller due to being emergency
servies only.


PS:  There were some flashes we tried early that had=20
horrible erase times -- over 20 minutes for a full
erase.  Check the specs for the parts you provide vs=20
others in the market, the better ones erase in a few
minutes.

PPS:  The reason we added UBI was its feature to use
the whole flash for wear leveling (minus the bootloader
that is outside the UBI partition).

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Twice: Going back to the scenerio again

>I just need to launch a GUI tool with host administrative privileges,
>select the upgrade file, and queue an upgrade to happen when I reboot
>the machine.  I queue the update, start the reboot, and stick around
>to see the upgrade progress on the screen while it's booting back up.
> Because I can see the status on the screen, I know what is happening
>and don't pull the power plug due to only seeing a black screen and
>power LED for 10 minutes.  Finally, the machine loads the OS and I
>verify the new control widget is working properly.

If the gui is on the host, with todays stock phosphor-initfs, you need
1) a connection from the host to the bmc
   ethernet, serial, usb ethernet etc=20=20
   (to copy files from host to BMC RAM and to monitor command output)

2) hardware ability to reboot bmc with host surviving
 - all userspace has to be replaced with those on the filesystem in RAM
 - can be shortened slightly by preloading image in BMC before shuting
   down services if the current kernel is compatible.  This can be the
   old or new image.

 - or -
=20
 Boot the host for GUI support with the BMC in an optimized
 update mode.

  This can be before or after the file is downloaded to the
  host.


3) Once the bmc is running from a squashfs in RAM (and if you want
to clean the rwfs overlay, persist on clean reboot/shutdown mode),

- copy the image to the bmc=20
- validate as required (preferably somewhere under /run)
- move imgage-rofs , kernel, etc as needed to /run/initramfs
- /run/initramfs/update=20
    (which checks the fs is not obviously mounted,
     runs flashcp, which has status on stdout
     moves files successfully written
     and then writes selected overlay content back to rwfs
- check the images were all written
- reboot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Option Three:
This might be a better experience but needs some software work
to enable kexec on the 2500.=20=20=20


Transfer the FS and kernel to the BMC RAM, and kexec the kernel
(note patches on the list for 2600 need to test and maybe a bit of
coding for the 2500).  Optionally this can contain the virt pnor
image too.  After the BMC boots from the system in RAM boot the
host from vpnor image in RAM then use the host to drive the GUI
to acknoledge and initiate the flash as desired.

The hooks are in phosphor-initfs to flash the image after the=20
host is up, and to boot with the image in RAM.=20=20

As an alternative to kexec, if the new file system supports the=20
old BMC kernel then the shutdown script can easily be edited to
restart the exec script with the images in /run.  Alternatively=20
if the new kernel supports the old user space then it can be=20
flashed first, then on the next boot the prior case applies as
it is the updated kernel.  Note: I did this flow several times
in developement but decided not to put code in the shutdown=20
script because its a script that is executed from /run/initramfs
and can easily be edited there when alternative flow is required.
(there are comments that show where to edit).


>>> =3D=3D BMC boot time =3D=3D
>>>=20
>>> This is self explanatory.  Other vendors' solutions allow the host
>>> to be powered
>>> on within seconds of power application from the wall, and even our
>>> own Kestrel
>>> soft BMC allows the host to begin booting less than 10 seconds
>>> after power is
>>> applied.  Several *minutes* for OpenBMC to reach a point where it
>>> can even
>>> start to boot the host is a major issue outside of datacenter
>>> applications.
>>=20
>> Some of this is, to me, an artifact of the Power architecture and
>> not an
>> artifact of OpenBMC explicitly.  On x86 systems we have a little
>> code in
>> u-boot that wiggles a GPIO and gets the Host power sequence going
>> while
>> the BMC is booting up.  This overlaps quite a bit of the memory
>> testing
>> of the Host with the BMC boot time.  The "well-known proprietary
>> BMC"
>> also does this same trick.
>
>I think we're talking about two different well know proprietary BMCs,
>but that's not important for this discussion other than no, the one I
>have in mind doesn't resort to such tricks.  What it does do is start
>up its core services rapidly enough where this isn't a problem, and
>lets the rest of the BMC stack start up at its own pace later on.
>=20
>> Power requires the BMC to be up in order to serve out the virtual
>> PNOR,
>> from my recollection.  It seems like this could be solved in other
>> ways,
>> such as a SPI-mux on a physical SPI-NOR so that the BMC can take
>> the NOR
>> at specific times during update but otherwise it is given to the
>> host
>> CPUs.  This is exactly what we do on x86 systems.
>
>Ouch.  So on x86 boxen you might actually have two "BMCs" -- the
>proprietary one inside the CPU that starts in seconds and provides
>base services like SPI Flash mapping to CPU address space, and the
>external OpenBMC one that can run in parallel without interfering
>with host start.  Adding a mux is then a hack needed on top, since
>you can't really communicate with the proprietary stack in the
>required manner.
>

I'd say their cpu doesn't require the bmc to boot, it also means
they trust their system to not melt without bmc monitoring.

>For systems like POWER that lack the proprietary internal "BMC", I
>guess there are a few ways we could address the problem:
>
>1.) Speed up OpenBMC load -- this sounds like it would end up being
>completely supported by one or two vendors alone, and subject to
>breakage from the other vendors that simply don't have any concerns
>around OpenBMC start time since their platforms aren't visibly
>affected by it.  It's also unlikely to come into the desired sub-10s
>range.
>
>2.) Split the BMC into "essential" and "nice to have" services, much
>like the other platforms.  Painful, as it now requires even more
>parts on the mainboard.
>
>3.) Keep the single BMC device, but split it into two software
>stacks, one that can load nearly instantly and start providing
>essential services, and another than can load more slowly.  This
>would effectively require two separate CPUs inside the BMC, which we
>actually do have in the AST2500.  I haven't done any digging though
>to see if the second CPU is powerful enough to implement the HIOMAP
>protocol at speed.
>
>> Having said all of that, there is certainly some performance
>> improvements that can be done, but nobody has taken up the torch on
>> it.
>> A big low-hanging fruit in my mind is the file system compression
>> being
>> xz or gzip is very computationally intensive.  I did some work,
>> with
>> Nick Terrell, to switch to zstd on our systems for both the kernel
>> initramfs and UBI and saw significant boot time improvements.  The
>> upstream enablement for this appears to have landed as of v5.9 so
>> we
>> could certainly start enabling it here now.
>>=20
>>
>INVALID URI REMOVED
>linux-2Dkbuild_20200730190841.2071656-2D7-2Dnickrterrell-40gmail.com_
>&d=3DDwIFaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As
>2xrXeO9ZSo4&m=3D2O37p_XR8IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DDF7yGqfSE
>-V5_j_DgmASLOgLpkfjcJpCK5xsJW3avqY&e=3D=20
>>=20

In addition to compression options there are tradeoffs on how much is=20
copied to ram vs how much is read from the flash possibly repeatedly.
If you add secure boot the time goes up.

>>> =3D=3D Host boot status indications =3D=3D
>>>=20
>>> Any ODM that makes server products has had to deal with the
>>> psychological "dead
>>> server effect", where lack of visible progress during boot causes
>>> spurious
>>> callouts / RMAs.  It's even worse on desktop, especially if
>>> server-type
>>> hardware is used inside the machine.  We've worked around this a
>>> few times with
>>> our "IPL observer" services, and really do need this functionality
>>> in OpenBMC.
>>> The current version we have is both front panel lights and a
>>> progress bar on
>>> the BMC boot monitor (VGA/HDMI), and this is something we're
>>> willing to
>>> contribute upstream.
>>=20
>> Great!  Let's get that merged!
>
>Sounds good!  The files aren't too complex:
>
>INVALID URI REMOVED
>_git_blackbird-2Dskeleton_tree_pyiplobserver&d=3DDwIFaQ&c=3Djf_iaSHvJObTb
>x-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3D2O37p_XR8IO
>9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DzLtrjaE2hHjV3z9ar0gcJVvZ9Uzwxinfed
>AOMEWs04s&e=3D=20
>INVALID URI REMOVED
>_git_blackbird-2Dskeleton_tree_pyiplledmonitor&d=3DDwIFaQ&c=3Djf_iaSHvJOb
>Tbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=3D2O37p_XR8
>IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=3DAOWB1Ja82thvSZFO81WfIj7MJtg5TeZN
>8wpT_EpG_Zo&e=3D=20
>
>Is the skeleton repository the best place for a merge request?

hmm, as prototype code in python, maybe.   I don't think many current
systems ship python.  Also upstream Yocto removed all support for=20
python 2.=20=20

In addition I see a mix of "copy the data" and "transform the data"
in the same script, such as=20

updateIPLLeds(self, initial_start, status_changed)

with=20
            # Show major ISTEP on LED bank
            # On Talos we only have three LEDs plus a fourth indicator modi=
fication=20
            # bit, but the major ISTEPs range from 2 to 21
            # Try to condense that down to something more readily displayab=
le


[ After some thought, its ok to be in the output code, as it's=20
formatting the data for the display. ]


The upstream post interface logs the post codes, and display is
a separate function.  The ipl_status_monitor seems to mix monitoring=20
the port 80 snoops with other logic to determine the system state=20
eg is the host up?.

Also both scripts extensivly use popen to handle device communication
and some communication to other services (kill to post code).


>
>> I do think some others have support for a 7-seg display with the
>> postcodes going to it already.  I think this is along those same
>> lines.
>> It might just be another back-end for our existing post code daemon
>> to
>> replicate them to the VGA and/or blink morse code on an LED.
>
>OK, so this is what we ran into before.  Where is this support
>in-tree, and do we need to reimplement our system to match what
>already exists (by extension, extending the other vendor code since
>our observer is more detailed in terms of status etc.), or would we
>be allowed to provide a competing solution to this other support,
>letting ODMs pick which one they wanted?
>

Our upstream code is at https://github.com/openbmc/phosphor-host-postd
for the snoop readers and the LED segment drivers, and the history=20
and Dbus owner is https://github.com/openbmc/phosphor-post-code-manager.

To catalog the source of the host and bmc there is
https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil

In addition to phosphor-misc for "one file projects" there is=20
openbmc-tools for handy tools which may be more developer focused.

>>> =3D=3D IPMI / BMC permissions =3D=3D
>>>=20
>>> An item that's come up recently is that, at least on our older
>>> OpenBMC versions,
>>> there's a complete disconnect between the BMC's shell user
>>> database and the
>>> IPMI user database.=20=20

Mostly true, in part because the IPMI password for RCMP+ must be
stored on the BMC (reversiably encrypted for our implementation).
Note improper storage of this was an area of one or more CVEs.

In addition it has a limit of 20 characters in a password and 8
users.

>>> Resetting the BMC root password isn't possible from IPMI
>>> on the host, and setting up IPMI doesn't seem possible from the
>>>>BMC shell.  If

In our current code we have pam hooks that save the password=20
during a change, if the user is in the ipmi group and the=20
password is short enough (or returns an error).

>>> IPMI support is something OpenBMC provides alongside Redfish, it
>>> needs to be
>>> better integrated -- we're dealing with multiple locked-out BMC
>>> issues at the
>>> moment at various customer sites, and the recovery method is
>>> painful at best
>>> when it should be as simple as an ipmitool command from the host
>>> terminal.
>>=20
>> I suspect most of this is a matter of IPMI command support and/or
>> enabling
>> those commands to the host IPMI path.  Most of us are fairly
>> untrusting
>> of IPMI (and the Host itself), so there hasn't been work to do
>> anything
>> here.  As long as whatever you're proposing can be disabled for
>> models
>> where we distrust the Host, it seems like these would be accepted
>> as
>> well.


Our current Redfish has multiple users and can enable and=20
disable users to have ipmi access and set their password.


Of course this just moves the goal posts to the Redfish=20
admin login, but in addition to mTLS certificate based=20
trust (which should be customized to the customer),=20

Redfish has the concept of a host firmware and os logins
including a binding for EFI to specify adapter path and
network in addition to read-once magic efi variables.  I=20
know OpenPOWER boxes don't have EFI but the information
could be exposed in a similar fashion.  As far as I know=20
we have not yet implemented these users in our Redfish
server.=20=20



Or designate a physical jumper to tell the BMC to install
a known password.  Where's that turbo button again? :-)

milton

