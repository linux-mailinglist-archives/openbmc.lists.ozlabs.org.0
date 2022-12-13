Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1175A64BC54
	for <lists+openbmc@lfdr.de>; Tue, 13 Dec 2022 19:48:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWnZR6TmBz3bXc
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 05:48:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R500FVCP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R500FVCP;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWnYq6kK3z30RG
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 05:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670957280; x=1702493280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zRz1XXQZ1sbebQok1iiTfSzE6QfXa+6/nbKzuGKBldM=;
  b=R500FVCPjp7+p0o+z4Ffy3NoXTCPE8hx7Ir/j6P1Pu+gUseRaee+LsID
   XpT39Kq3owpzB9cA29CcoFS6GqaXuj6yXbKnh1NmSBGXMIGFWs5GlYUFE
   S+hp86hIv70A+OiRLKCQf0LW3YF3kAbeFHJbw2vC30sjfGK4v/zuPfcP2
   lvaI2lKGBBh08eVeV+RiTYgklkLRRVemlBAQfzxwUm3PgiSTZxxewpwcq
   a5S/GTQVtIkHjDSdC1WvNWnkva4fJsFMvOxrH+Ck1Q75gu6HD1qAJysjj
   s7Aivcxm9ayab68eiToBMXcXuctsQiUyxKFPCPctH1Ot/BF1YJ6MY3C4R
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="297895912"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="297895912"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 10:47:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="717316615"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="717316615"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com) ([10.243.48.71])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 10:47:54 -0800
Date: Tue, 13 Dec 2022 10:47:19 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Rohit Pai <ropai@nvidia.com>
Subject: Re: [jffs2] handling flash corruption
Message-ID: <Y5jIt4cuJ9+0bAco@mauery.jf.intel.com>
References: <LV2PR12MB6014DB772E0529929A1C3091CD1B9@LV2PR12MB6014.namprd12.prod.outlook.com>
 <DM6PR15MB41210ADFE04E00AA9635F34D8B1B9@DM6PR15MB4121.namprd15.prod.outlook.com>
 <LV2PR12MB601457EBBB307CC6357F984FCD1A9@LV2PR12MB6014.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <LV2PR12MB601457EBBB307CC6357F984FCD1A9@LV2PR12MB6014.namprd12.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 07-Dec-2022 10:04 AM, Rohit Pai wrote:
>Hello Milton,
>
>Thanks for the reply. Yes, we use Aspeed spi-nor controller driver.
>So how did you manage to solve the issue ?  are there any patches to the driver code ?

We have seen jffs2 corruption on Aspeed spi-nor parts too. We mount all 
our NV filesystems as stand-alone mount points and then rsync the 
overlayfs COW contents into those mount points periodically. This is not 
ideal and at some point it would be nice to trade a inotify-based system 
for rsync, but the advantage is that the BMC is not constantly writing 
to flash.

--Vernon

>
>-----Original Message-----
>From: Milton Miller II <miltonm@us.ibm.com>
>Sent: Wednesday, December 7, 2022 4:52 AM
>To: Rohit Pai <ropai@nvidia.com>; openbmc@lists.ozlabs.org
>Subject: Re: [jffs2] handling flash corruption
>
>External email: Use caution opening links or attachments
>
>
>Hi Rohit
>
>You didn't say which spi controller you are using, but we did see similar errors when developing the Aspeed spi-nor controller driver.
>
>The arm io_memcopy is aliased to the optimized for memory memcopy and is not suitable for use with fifo io windows that send data to  the flash, as it will stutter and perform overlapping reads or writes depending on the source and destination alignment.  The jffs2 file system definitely triggers such unaligned writes.
>
>The comment in the older driver explains this (here's a link into v5.0 kernel
>
>https://github.com/torvalds/linux/blob/1c163f4c7b3f621efff9b28a47abb36f7378d783/drivers/mtd/spi-nor/aspeed-smc.c#L204
>
>milton
>
>PS I'm not aware of a fsck for jffs2.   Another symptom was fsck would show names
>with 4 garbage characters for the old files.
>
>-----------  Apologies for top posting and not quoting the reply to: ------------ Dear Team,
>
>We have 256MB of spi nor flash on our platform.
>Its split into multiple partitions as mentioned in the table below.
>
>Block / size
>File system
>Usage
>/dev/mtdblcok5 (0.5MB)
>None
>Stores copy of uboot env
>/dev/mtdblcok6
>(16MB)
>Jffs2
>Read write file system
>This is overlayed with read-only file system from the image and mounter at '/'
>/dev/mtdblock7
>(200MB)
>Jffs2
>Log partition
>Used for storing logs and bmc dumps
>
>We are seeing flash corruption in few of our shipped products which undergo repeated power cycle test.
>The continuous power cycle test seems to somehow corrupt the data flash and on the next boot either we end up in kernel panic during init or there is recovery tried by the file system which never seem to end successfully, and the application don't start well.
>
>When the flash is corrupt, we repeatedly see jffs2 errors as shown below.
>
>[  279.805305] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06f90020: 0x8504 instead [  279.805319] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06f90024: 0x75a3 instead [  279.805327] jffs2: Further such events for this erase block will not be printed [  279.817370] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06fa0000: 0x0b14 instead [ 279.848078] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06fa0004: 0x1baa instead [  279.860240] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06fa0008: 0xb9c1 instead [  279.872368] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x06fa000c: 0x4d18 instead
>
>These errors start to come when any file system related commands are executed from the obmc-init.sh file.
>
>mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
>
>So basically, it appears like jffs2 is trying to recover the file system but because of the type of corruption it could not, and we are starting the overlay in a bad state which can subsequently trigger a kernel panic. The flash corruption is mainly happening because of repeated power cycle test and some of the application (logging, debug collector, etc) trying to write something into flash and causing a corruption. The reproduction seems to be very difficult we saw one failure after 5K loops of test. We also tried to manually corrupt the flash by writing junk data to it, but it did not recreate the same issue.
>
>Has someone seen similar type of issue ?
>Do you any recommendations to solve issue ?
>Is there a way to recreate such corruption manually for testing purpose ?
>
>One solution we have in mind is to check the return status of all commands in obmc-init script around rwfs and when these commands fail try to boot with read-only file system.
>But we are not sure if it can work in all cases, if the commands work and still jffs2 causes kernel panic in the background sync then we will have the same problem.
>Any thoughts of how to detect the corrupted flash in obmc-init and avoid using it ?
>
>I see some reference to fsck. This is not working in our platform because we don't have fsck.jffs2. It could be packaging issue which can be solved.
>Can we trust fsck to capture all possible flash corruption ? Could it be possible that fsck does not detect anything but when jffs2 mounted then it can start to fail ?
>
>Thanks
>Rohit PAI
>
>
>
