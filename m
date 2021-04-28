Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0FA36E036
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 22:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVqmr0Ghzz2yyC
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 06:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=KXkqokp+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD
 header.b=KXkqokp+; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVqmZ3yrWz2xYx
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 06:22:05 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1D6F837ABA3D8C;
 Wed, 28 Apr 2021 15:22:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JesYBWm3romq; Wed, 28 Apr 2021 15:21:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8A47037ABA3D83;
 Wed, 28 Apr 2021 15:21:59 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8A47037ABA3D83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1619641319; bh=xdNAu7969hxy056NgaKIxcQtMI4bxfGX5rZY2MUO9yQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=KXkqokp+AnwvgxmcKtG8rAWbO34FQNdzPVFP4xfZJfh0MA77e9FrZ+XHBva51ImOX
 2mLeyf47LO5D4QgBkrj+QhI3MTOLhEIx/PXa4BBc/s+FiiXwlojKZqY1gT4gAn8YMs
 n9HuN6Y1e7k6aIovlikcvXzimsF4/teTshZkM99U=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iZ7eCdPLx5zi; Wed, 28 Apr 2021 15:21:59 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 6010F37ABA3D80;
 Wed, 28 Apr 2021 15:21:59 -0500 (CDT)
Date: Wed, 28 Apr 2021 15:21:58 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Milton Miller II <miltonm@us.ibm.com>
Message-ID: <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
References: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
 <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
Subject: Re: OpenBMC on RCS platforms
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC83 (Linux)/8.5.0_GA_3042)
Thread-Topic: OpenBMC on RCS platforms
Thread-Index: DWvZQ6v5dGxsd0Qtr7bkLcQgI2qqJA==
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



----- Original Message -----
> From: "Milton Miller II" <miltonm@us.ibm.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "Patrick Williams" <patrick@stwcx.xyz>, "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Monday, April 26, 2021 4:42:16 PM
> Subject: RE: OpenBMC on RCS platforms

[snip]

>>At first glance, that's another overly complex solution for a simple
>>problem that would cause a degraded user experience vs. other
>>platforms.
>>
> 
> I have to agree, both overly complex and probably not useful in that
> its just a port interface for control.
> 
>>We have an 800Mhz Linux-based computer with 512MB of RAM, serial and
>>video out support already integrated into every one of our products.
>>It can receive data via PCIe and via USB from an active host.  Why
>>isn't there a mechanism to send a signed container to it over one of
>>these existing channels for self-update?
>>
>>A potential user story looks like this:
>>
>>=====
>>
>>I want to update the firmware on my Blackbird desktop to fix a
>>problem I'm having with a new control widget I've plugged in.  To
>>make things more interesting, I'm on an oil rig in the Gulf, and the
>>desktop only connects via intermittent WiFi.  Spare parts are weeks
>>away, and I have next to no electronic diagnostic equipment available
>>to me.  There's one or two USB ports I can normally use because I
>>have administrative privileges, but I was able to grab the upgrade
>>file over WiFi instead, saving myself some time cleaning accumulated
>>gunk out of the ports.
>>
>>I can update my <large vendor> standard PC firmware just by running a
>>tool on Windows, but the Blackbird was selected because it controls a
>>critical process that needed to be malware-resistant.
>>
>>Fortunately, OpenBMC implemented a quality firmware update process.
>>I just need to launch a GUI tool with host administrative privileges,
>>select the upgrade file, and queue an upgrade to happen when I reboot
>>the machine.  I queue the update, start the reboot, and stick around
>>to see the upgrade progress on the screen while it's booting back up.
>> Because I can see the status on the screen, I know what is happening
>>and don't pull the power plug due to only seeing a black screen and
>>power LED for 10 minutes.  Finally, the machine loads the OS and I
>>verify the new control widget is working properly.
>>
>>=====
>>
>>Is there a technical / architectural reason this can't be done, or
>>some other reason it's a bad idea?
>>
> 
> I ended up writing this twice or thrice.  Also what I call
> phosphor-initfs is actually the package obmc-phosphor-initfs.bb
> found in meta-phosphor/recipies-phosphor/initrdscripts/.
> 
> 
> There are two issues.  One is that there is no graphics
> library or console code for the aspeed bmc.  I understand a
> text rendering library was added for boot monitoring). But
> if you are starting from the host up, then use the host to
> drive the GUI and just establish a command session (network,
> USB to host, or serial).
> 
> The biggest limitation is we use squashfs for file system
> for space efficency.  This is a read-only filesystem that
> contains references between different pieces that is loaded
> and decompressed by the kernel on demand.  That means you can
> not be running on the copy in flash while trying to update
> that copy in the flash.
> 
> If you have space for two copies then you can update the
> second copy while the primary is online.  This is supported
> in the UBI and eMMC layouts upstream.
> 
> If you only have flash space for one copy then you have to
> arrange for something more limited.  Either way you are
> subject to bricking on interrupted flash unless you do
> something exotic like repurpose the host chip as a backup
> BMC during the process.   But if its just the feedback
> then the upstream code has help that isn't in the Redfish
> flow.

Most of these systems also have a significant amount of RAM available, enough to hold both the update file and the existing BMC Flash contents while the system remains online.  Is there any way we could copy the existing Flash into RAM, then "pivot" the running system to use the copy in RAM as the backing store?

Bricking on power cut is, well, expected during a BMC update without a backup Flash chip.  Not cutting power during a low level firmware update is I think still ingrained sufficiently in the average PC users psyche not to be a significant issue, especially if several warnings are given before and during the update process regarding ensuring power is not cut.  Even if it is cut, the BMC Flash is socketed for a reason.

All that said, ideally, longer term, a recovery partition could be added to the Flash -- basically, a normal BMC update would only update the rofs partition, leaving u-boot, kernel, and the recovery partition alone.  The recovery partition would contain a very small userspace, just enough to accept some kind of network connection for e.g. TFTP upload of a new firmware (similar to how various embedded devices and even small PCs can be recovered).

> 
> ====
> Once
> 
> The "static" mtd layout with phosphor-initfs has support
> for both loading the static flash content into RAM, allowing
> the update to occur with full services running, and as  a
> backup on shutdown it will apply the update on bmc reboot
> by switching back to the initramfs and performing the flash
> from there.  The status of the later update is only visible
> on the console, which might be hidden on an internal serial
> cable by default.
> 
> Unfortunately the "prepare for update" method that was in
> the original update instructions and tells the BMC init
> "hey, load all this content into ram, so that you can write
> over the flash" got lost in the "we must be limited to what
> RedFish can support".  The code is still in the low level
> scripts but the fancy rest api is missing.  Also with the
> addition of code verification the actual flash progress
> was hidden.
> 
> The phosphor-initfs scripts also allow a new filesystem
> image to be downloaded over the network if you wish to test.
> This doesn't have signature checking code, and it can be
> disabled by build options.
> 
> All of the options to phosphor-initfs can be set by u-boot
> environment variables (one of which is cleared by a systemd
> unit each boot, on that is not) and by the kernel command
> line.
> 
> Note: I highly suggest not to use image-bmc (for the whole
> flash) as this erases the entire flash (although we try to
> write back the u-boot environment), but instead use image-kernel,
> image-rofs, etc to allow the prior rwfs and u-boot to persist.
> Some bad assertions may have migrated into the code-update
> rest endpoints and we should accept patches.
> 
> Bottom Line:
> 
> Put the BMC in maintence mode and you can update the image
> while the stack is running.  You can then use ssh to
> display the flash progress.  If you need a fancy gui and
> not the internal serial then use the host, or write the
> rest of the graphics stack.

That's all over external network again, though.  Point is we want to do this from the host -- the host in general is unable to connect to the BMC when the BMC is piggybacking on a host network port (all of our products do this, and a lot of other vendors use the same design).

If we were assured of external BMC network access, updates become very simple.  In this kind of deployment though, there is no external network access to the BMC.

> If you need the reliable backout then you need space for
> a second image, even if its smaller due to being emergency
> servies only.
> 
> 
> PS:  There were some flashes we tried early that had
> horrible erase times -- over 20 minutes for a full
> erase.  Check the specs for the parts you provide vs
> others in the market, the better ones erase in a few
> minutes.

We use the better-specced ones for both BMC and PNOR.

> PPS:  The reason we added UBI was its feature to use
> the whole flash for wear leveling (minus the bootloader
> that is outside the UBI partition).
> 
> =======================================
> Twice: Going back to the scenerio again
> 
>>I just need to launch a GUI tool with host administrative privileges,
>>select the upgrade file, and queue an upgrade to happen when I reboot
>>the machine.  I queue the update, start the reboot, and stick around
>>to see the upgrade progress on the screen while it's booting back up.
>> Because I can see the status on the screen, I know what is happening
>>and don't pull the power plug due to only seeing a black screen and
>>power LED for 10 minutes.  Finally, the machine loads the OS and I
>>verify the new control widget is working properly.
> 
> If the gui is on the host, with todays stock phosphor-initfs, you need
> 1) a connection from the host to the bmc
>   ethernet, serial, usb ethernet etc
>   (to copy files from host to BMC RAM and to monitor command output)

Precisely.  USB would be an interesting control channel, but I don't think OpenBMC currently supports this kind of access?

> 2) hardware ability to reboot bmc with host surviving
> - all userspace has to be replaced with those on the filesystem in RAM
> - can be shortened slightly by preloading image in BMC before shuting
>   down services if the current kernel is compatible.  This can be the
>   old or new image.
> 
> - or -
> 
> Boot the host for GUI support with the BMC in an optimized
> update mode.
> 
>  This can be before or after the file is downloaded to the
>  host.
> 
> 
> 3) Once the bmc is running from a squashfs in RAM (and if you want
> to clean the rwfs overlay, persist on clean reboot/shutdown mode),
> 
> - copy the image to the bmc
> - validate as required (preferably somewhere under /run)
> - move imgage-rofs , kernel, etc as needed to /run/initramfs
> - /run/initramfs/update
>    (which checks the fs is not obviously mounted,
>     runs flashcp, which has status on stdout
>     moves files successfully written
>     and then writes selected overlay content back to rwfs
> - check the images were all written
> - reboot
> 
> =================
> Option Three:
> This might be a better experience but needs some software work
> to enable kexec on the 2500.
> 
> 
> Transfer the FS and kernel to the BMC RAM, and kexec the kernel
> (note patches on the list for 2600 need to test and maybe a bit of
> coding for the 2500).  Optionally this can contain the virt pnor
> image too.  After the BMC boots from the system in RAM boot the
> host from vpnor image in RAM then use the host to drive the GUI
> to acknoledge and initiate the flash as desired.
> 
> The hooks are in phosphor-initfs to flash the image after the
> host is up, and to boot with the image in RAM.
> 
> As an alternative to kexec, if the new file system supports the
> old BMC kernel then the shutdown script can easily be edited to
> restart the exec script with the images in /run.  Alternatively
> if the new kernel supports the old user space then it can be
> flashed first, then on the next boot the prior case applies as
> it is the updated kernel.  Note: I did this flow several times
> in developement but decided not to put code in the shutdown
> script because its a script that is executed from /run/initramfs
> and can easily be edited there when alternative flow is required.
> (there are comments that show where to edit).
> 
> 
>>>> == BMC boot time ==
>>>> 
>>>> This is self explanatory.  Other vendors' solutions allow the host
>>>> to be powered
>>>> on within seconds of power application from the wall, and even our
>>>> own Kestrel
>>>> soft BMC allows the host to begin booting less than 10 seconds
>>>> after power is
>>>> applied.  Several *minutes* for OpenBMC to reach a point where it
>>>> can even
>>>> start to boot the host is a major issue outside of datacenter
>>>> applications.
>>> 
>>> Some of this is, to me, an artifact of the Power architecture and
>>> not an
>>> artifact of OpenBMC explicitly.  On x86 systems we have a little
>>> code in
>>> u-boot that wiggles a GPIO and gets the Host power sequence going
>>> while
>>> the BMC is booting up.  This overlaps quite a bit of the memory
>>> testing
>>> of the Host with the BMC boot time.  The "well-known proprietary
>>> BMC"
>>> also does this same trick.
>>
>>I think we're talking about two different well know proprietary BMCs,
>>but that's not important for this discussion other than no, the one I
>>have in mind doesn't resort to such tricks.  What it does do is start
>>up its core services rapidly enough where this isn't a problem, and
>>lets the rest of the BMC stack start up at its own pace later on.
>> 
>>> Power requires the BMC to be up in order to serve out the virtual
>>> PNOR,
>>> from my recollection.  It seems like this could be solved in other
>>> ways,
>>> such as a SPI-mux on a physical SPI-NOR so that the BMC can take
>>> the NOR
>>> at specific times during update but otherwise it is given to the
>>> host
>>> CPUs.  This is exactly what we do on x86 systems.
>>
>>Ouch.  So on x86 boxen you might actually have two "BMCs" -- the
>>proprietary one inside the CPU that starts in seconds and provides
>>base services like SPI Flash mapping to CPU address space, and the
>>external OpenBMC one that can run in parallel without interfering
>>with host start.  Adding a mux is then a hack needed on top, since
>>you can't really communicate with the proprietary stack in the
>>required manner.
>>
> 
> I'd say their cpu doesn't require the bmc to boot, it also means
> they trust their system to not melt without bmc monitoring.

I'd argue it's really a bit of semantics. :)  x86 systems have a sort of proto-BMC built right in to every single CPU, in the form of the ME/PSP and its associated firmware, that can provide various functions including (IIRC) thermal control.  On the ARM side, you're probably right, they're a bit more primitive in terms of just mapping Flash directly to the CPU address space on low end parts, though I think (?) the modern higher end parts are back to a sort of "security manager" BMC-analogue providing these basic services to the host CPU.

Regardless, POWER does stick out like a sore thumb for shoving these low level functions into the high level "full-stack" BMC.  Architecturally, it may not have been the best decision, but I do understand it sped time to market etc.   Fortunately, it's also something we can work to fix.

>>For systems like POWER that lack the proprietary internal "BMC", I
>>guess there are a few ways we could address the problem:
>>
>>1.) Speed up OpenBMC load -- this sounds like it would end up being
>>completely supported by one or two vendors alone, and subject to
>>breakage from the other vendors that simply don't have any concerns
>>around OpenBMC start time since their platforms aren't visibly
>>affected by it.  It's also unlikely to come into the desired sub-10s
>>range.
>>
>>2.) Split the BMC into "essential" and "nice to have" services, much
>>like the other platforms.  Painful, as it now requires even more
>>parts on the mainboard.
>>
>>3.) Keep the single BMC device, but split it into two software
>>stacks, one that can load nearly instantly and start providing
>>essential services, and another than can load more slowly.  This
>>would effectively require two separate CPUs inside the BMC, which we
>>actually do have in the AST2500.  I haven't done any digging though
>>to see if the second CPU is powerful enough to implement the HIOMAP
>>protocol at speed.
>>
>>> Having said all of that, there is certainly some performance
>>> improvements that can be done, but nobody has taken up the torch on
>>> it.
>>> A big low-hanging fruit in my mind is the file system compression
>>> being
>>> xz or gzip is very computationally intensive.  I did some work,
>>> with
>>> Nick Terrell, to switch to zstd on our systems for both the kernel
>>> initramfs and UBI and saw significant boot time improvements.  The
>>> upstream enablement for this appears to have landed as of v5.9 so
>>> we
>>> could certainly start enabling it here now.
>>> 
>>>
>>INVALID URI REMOVED
>>linux-2Dkbuild_20200730190841.2071656-2D7-2Dnickrterrell-40gmail.com_
>>&d=DwIFaQ&c=jf_iaSHvJObTbx-siA1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As
>>2xrXeO9ZSo4&m=2O37p_XR8IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=DF7yGqfSE
>>-V5_j_DgmASLOgLpkfjcJpCK5xsJW3avqY&e=
>>> 
> 
> In addition to compression options there are tradeoffs on how much is
> copied to ram vs how much is read from the flash possibly repeatedly.
> If you add secure boot the time goes up.

Yeah, I'm really coming around to the idea that we need to embrace the split architecture every other system uses.  The LPC bridge and base power / fan controls really should be running independently on the ColdFire core, not on the main "full stack" BMC ARM core, and even for Kestrel we're exploring something similar (though in that case, it's mainly so that the host doesn't die if we accidentally crash the main CPU).

>>>> == Host boot status indications ==
>>>> 
>>>> Any ODM that makes server products has had to deal with the
>>>> psychological "dead
>>>> server effect", where lack of visible progress during boot causes
>>>> spurious
>>>> callouts / RMAs.  It's even worse on desktop, especially if
>>>> server-type
>>>> hardware is used inside the machine.  We've worked around this a
>>>> few times with
>>>> our "IPL observer" services, and really do need this functionality
>>>> in OpenBMC.
>>>> The current version we have is both front panel lights and a
>>>> progress bar on
>>>> the BMC boot monitor (VGA/HDMI), and this is something we're
>>>> willing to
>>>> contribute upstream.
>>> 
>>> Great!  Let's get that merged!
>>
>>Sounds good!  The files aren't too complex:
>>
>>INVALID URI REMOVED
>>_git_blackbird-2Dskeleton_tree_pyiplobserver&d=DwIFaQ&c=jf_iaSHvJObTb
>>x-siA1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=2O37p_XR8IO
>>9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=zLtrjaE2hHjV3z9ar0gcJVvZ9Uzwxinfed
>>AOMEWs04s&e=
>>INVALID URI REMOVED
>>_git_blackbird-2Dskeleton_tree_pyiplledmonitor&d=DwIFaQ&c=jf_iaSHvJOb
>>Tbx-siA1ZOg&r=bvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZSo4&m=2O37p_XR8
>>IO9jl4psZwnU-fmhndTW41NpqMXsT9Or6w&s=AOWB1Ja82thvSZFO81WfIj7MJtg5TeZN
>>8wpT_EpG_Zo&e=
>>
>>Is the skeleton repository the best place for a merge request?
> 
> hmm, as prototype code in python, maybe.   I don't think many current
> systems ship python.  Also upstream Yocto removed all support for
> python 2.
> 
> In addition I see a mix of "copy the data" and "transform the data"
> in the same script, such as
> 
> updateIPLLeds(self, initial_start, status_changed)
> 
> with
>            # Show major ISTEP on LED bank
>            # On Talos we only have three LEDs plus a fourth indicator modification
>            # bit, but the major ISTEPs range from 2 to 21
>            # Try to condense that down to something more readily displayable
> 
> 
> [ After some thought, its ok to be in the output code, as it's
> formatting the data for the display. ]
> 
> 
> The upstream post interface logs the post codes, and display is
> a separate function.  The ipl_status_monitor seems to mix monitoring
> the port 80 snoops with other logic to determine the system state
> eg is the host up?.
> 
> Also both scripts extensivly use popen to handle device communication
> and some communication to other services (kill to post code).
> 
> 
>>
>>> I do think some others have support for a 7-seg display with the
>>> postcodes going to it already.  I think this is along those same
>>> lines.
>>> It might just be another back-end for our existing post code daemon
>>> to
>>> replicate them to the VGA and/or blink morse code on an LED.
>>
>>OK, so this is what we ran into before.  Where is this support
>>in-tree, and do we need to reimplement our system to match what
>>already exists (by extension, extending the other vendor code since
>>our observer is more detailed in terms of status etc.), or would we
>>be allowed to provide a competing solution to this other support,
>>letting ODMs pick which one they wanted?
>>
> 
> Our upstream code is at https://github.com/openbmc/phosphor-host-postd
> for the snoop readers and the LED segment drivers, and the history
> and Dbus owner is https://github.com/openbmc/phosphor-post-code-manager.
> 
> To catalog the source of the host and bmc there is
> https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil
> 
> In addition to phosphor-misc for "one file projects" there is
> openbmc-tools for handy tools which may be more developer focused.

So it sounds like we'd need to rewrite this as a set of patches for phosphor-post-code-manager?  Would they actually be merged or would we run into resistance to extending the functionality of that system for our use case?

>>>> == IPMI / BMC permissions ==
>>>> 
>>>> An item that's come up recently is that, at least on our older
>>>> OpenBMC versions,
>>>> there's a complete disconnect between the BMC's shell user
>>>> database and the
>>>> IPMI user database.
> 
> Mostly true, in part because the IPMI password for RCMP+ must be
> stored on the BMC (reversiably encrypted for our implementation).
> Note improper storage of this was an area of one or more CVEs.
> 
> In addition it has a limit of 20 characters in a password and 8
> users.
> 
>>>> Resetting the BMC root password isn't possible from IPMI
>>>> on the host, and setting up IPMI doesn't seem possible from the
>>>>>BMC shell.  If
> 
> In our current code we have pam hooks that save the password
> during a change, if the user is in the ipmi group and the
> password is short enough (or returns an error).
> 
>>>> IPMI support is something OpenBMC provides alongside Redfish, it
>>>> needs to be
>>>> better integrated -- we're dealing with multiple locked-out BMC
>>>> issues at the
>>>> moment at various customer sites, and the recovery method is
>>>> painful at best
>>>> when it should be as simple as an ipmitool command from the host
>>>> terminal.
>>> 
>>> I suspect most of this is a matter of IPMI command support and/or
>>> enabling
>>> those commands to the host IPMI path.  Most of us are fairly
>>> untrusting
>>> of IPMI (and the Host itself), so there hasn't been work to do
>>> anything
>>> here.  As long as whatever you're proposing can be disabled for
>>> models
>>> where we distrust the Host, it seems like these would be accepted
>>> as
>>> well.
> 
> 
> Our current Redfish has multiple users and can enable and
> disable users to have ipmi access and set their password.
> 
> 
> Of course this just moves the goal posts to the Redfish
> admin login, but in addition to mTLS certificate based
> trust (which should be customized to the customer),
> 
> Redfish has the concept of a host firmware and os logins
> including a binding for EFI to specify adapter path and
> network in addition to read-once magic efi variables.  I
> know OpenPOWER boxes don't have EFI but the information
> could be exposed in a similar fashion.  As far as I know
> we have not yet implemented these users in our Redfish
> server.

Honestly Redfish is something that we might just want to move to, and officially / formally drop network IPMI support.  Probably the biggest issue with that comes right back down to needing communication between the host and BMC, however -- ipmitool shortcuts the whole BMC/host network isolation problem (described above) by using the USB interface.  Is there a way to use Redfish over USB in a similar manner?

Thanks!
