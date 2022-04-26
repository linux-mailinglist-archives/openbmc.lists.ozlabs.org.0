Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608050EDD8
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 02:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnNff1NKhz3bd9
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=IAdYAEy0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=IAdYAEy0; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KnNfG4LBxz2xWg
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 10:53:10 +1000 (AEST)
Received: from [192.168.87.104] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id 675D120E8CB3;
 Mon, 25 Apr 2022 17:52:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 675D120E8CB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650934357;
 bh=XsI1C0Nc1I9nylOLjME7sfVpQ7vDp6SqZIODcENGB5U=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=IAdYAEy0dv9fpmkL238EzUb3yTTtDpK7tDUtTeo0Zi5CjLh/KKMxWWBDjl+EZTvw4
 o1/HCV7dR6nTvSriQi9Ck3SzZiBm4eT+hn4DhXDZmgAJX6a6xlzrRChTScxAreR+BU
 /eal2FRb4gMBOLYYNgtqQ3EPi8OSjFqSEOw+jwoM=
Message-ID: <0d010b3e-d2d1-bd50-478e-6ef1682ab02a@linux.microsoft.com>
Date: Mon, 25 Apr 2022 17:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Linux Kernel JTAG Support
Content-Language: en-US
To: Derek Mantey <derekma@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ernesto.corona@intel.com
References: <MW4PR21MB1922FDDD3AC06B9A32F82894B0F89@MW4PR21MB1922.namprd21.prod.outlook.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <MW4PR21MB1922FDDD3AC06B9A32F82894B0F89@MW4PR21MB1922.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 4/25/2022 3:45 PM, Derek Mantey wrote:
> It looks like there was a discussion a while back (~2017) about adding a Kernel driver for JTAG devices.  We are looking at using this for a variety of scenarios like OpenOCD and FW update for CPLD/FPGA components.  I was hoping to get some insight into the current status of the JTAG drivers and if there was anyone working on it.
> 
> The patches I saw from 2017 were: https://patchwork.ozlabs.org/project/openbmc/list/?series=18558&state=%2A&archive=both
> 
> Additionally, it looks like there are multiple implementations that exist:
>    1. Facebook: https://github.com/facebook/openbmc-linux/commits/dev-5.6/drivers/jtag
>    2. Aspeed: https://github.com/AspeedTech-BMC/linux/commits/aspeed-master-v5.15/drivers/jtag >    3. Ampere: 
https://github.com/ampere-openbmc/linux/commits/ampere/drivers/jtag
> 
> It looks like these have different version of the driver with slight differences in the interface.
> 
>    1. What is current status of the JTAG driver?  Is anyone still actively working on getting this pushed into the upstream kernel?
> 	a. Was there pushback from the Linux Kernel on taking these changes?
> 	b. If the upstream Kernel doesn't want to take these changes, would we consider having them in the https://github.com/openbmc/linux fork?
>    2. Does the community have a "preferred" JTAG driver that they are working on?  I am not sure how much people are sharing the changes to JTAG.  Is there a "best" driver to start from?
>    3. Are there any other people working on or looking at the JTAG driver?  I would like to know what others are doing so that we can align ideas and requirements, and not re-implement if possible.
> 
> Thanks,
> 	Derek

v29 looks to be the last upstream post by Intel -
https://lore.kernel.org/all/20200413222920.4722-1-ernesto.corona@intel.com/T/#u

v31 coming soon?
https://lore.kernel.org/all/DM6PR11MB399360880403A83FFECD597D8B769@DM6PR11MB3993.namprd11.prod.outlook.com/



