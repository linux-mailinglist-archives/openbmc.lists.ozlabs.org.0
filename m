Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBD2E10B
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 17:27:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DZMd2wjyzDqJ2
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 01:27:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DZM35N5nzDqDN
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 01:26:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 08:26:49 -0700
X-ExtLoop1: 1
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.67.244])
 ([10.252.67.244])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 08:26:48 -0700
Subject: Re: U-Boot environment management from userspace
To: openbmc@lists.ozlabs.org
References: <20190528183802.GH15959@mauery.jf.intel.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <86e6c763-861a-241b-e083-ce274a6eca73@linux.intel.com>
Date: Wed, 29 May 2019 20:56:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528183802.GH15959@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Vernon,

I just started a daemon for the same as i needed it for RestrictionMode 
(provisioning) . At this point of time, the daemon uses the fw_setenv & 
printenv internally, but atleast application will access the same in D-Bus

Regards,

Richard

On 5/29/2019 12:10 AM, Vernon Mauery wrote:
> Reading U-Boot environment variables from userspace is not difficult, 
> but to do it in a standard way, (fw_printenv), it requires a fork and 
> exec. We don't have any permissions problems because reading from the 
> MTD partition is not restricted. It might be nice, however to have 
> these variables exported on D-Bus so that a fork/exec is not 
> necessary, just a property fetch.
>
> But writing is a different story. That requires root privileges. To 
> architect with a separation of privileges mechanism, this should 
> probably be running as a daemon or service that could be spawned via 
> D-Bus or something so that ipmid doesn't need root permission to set a 
> U-Boot variable.
>
> I see a couple of options:
> 1) Shoehorn U-Boot variables into the settings daemon so they just 
> show up as settings. I am not sure on the details of how this would be 
> done, but it might work.
>
> 2) Create yet another daemon that would provide a R/W interface 
> (probably just using the D-Bus properties interface) that would act as 
> a manager of U-Boot environment variables. It might even be able to 
> place an inotify watch to get notified when an external process 
> (fw_setenv) modifies the environment (like from a script or something) 
> so the D-Bus properties could send out a PropertiesChanged notification.
>
> 3) Use a one-shot service that parses the 'instance' to extract a 
> variable name and variable value. Then the variable could be activated 
> by launching ubootenv@foo=bar.service. This would require some fancy 
> parameter encoding to make it all work correctly to avoid string 
> injections.
> Am I the only one that has a need for this or is there a wider 
> audience that would benefit?
>
> Does anyone else already have a solution for this or an opinion on 
> what path might be the best?
>
> --Vernon
