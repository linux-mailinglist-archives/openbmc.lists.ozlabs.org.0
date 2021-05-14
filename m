Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C6380180
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 03:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhB9N4rKVz306Q
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 11:42:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhB995hGYz2yX6
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 11:42:20 +1000 (AEST)
IronPort-SDR: Muv8cSqdCoCwEsZAadUjadCIKUDJhwM3AMUp544Uw3kQa/l2Sw5yJwFkOyW+2+ZD5M59DTX9Us
 t/cnLJnkCugQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="199783067"
X-IronPort-AV: E=Sophos;i="5.82,298,1613462400"; d="scan'208";a="199783067"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 18:42:15 -0700
IronPort-SDR: UTh2q6CqolvIUN0s09k4Jx+e+SmjueaBOuR8AgjHIpF6i0b6bIerpDk3ENlZtgc7x50qar96qN
 977KVt4spqqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,298,1613462400"; d="scan'208";a="624171445"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 13 May 2021 18:42:14 -0700
Received: from [10.212.129.98] (jmbills-MOBL.amr.corp.intel.com
 [10.212.129.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6340B580A5D
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 18:42:14 -0700 (PDT)
Subject: Re: x86-power-control for ARM CPU based system.
To: openbmc@lists.ozlabs.org
References: <SN6PR08MB43999FF4F59E2DB627EF52CBC3659@SN6PR08MB4399.namprd08.prod.outlook.com>
 <91538a6c-60be-b8fa-7b9a-021c98a06326@linux.intel.com>
 <DM6PR08MB58830D49DACE954A4C7EDFCBB25F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <CAH2-KxBtxOOBubEKvdMRy+bbJrzc65Hn7N2EGft8vrMWcL+dAQ@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <71682083-58b9-ae07-dd11-8a58d8ca731e@linux.intel.com>
Date: Thu, 13 May 2021 18:42:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2-KxBtxOOBubEKvdMRy+bbJrzc65Hn7N2EGft8vrMWcL+dAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 5/13/2021 1:55 PM, Ed Tanous wrote:
> On Thu, Apr 29, 2021 at 8:47 AM Mohaimen Alsamarai
> <Mohaimen.Alsamarai@fii-na.com> wrote:
>>
>> Adding openbmc mail list
>>
>> -----Original Message-----
>> From: Bills, Jason M <jason.m.bills@linux.intel.com>
>> Sent: Tuesday, March 23, 2021 4:08 PM
>> To: Brandon Ong <Brandon.Ong@fii-na.com>
>> Cc: Lancelot Kao <lancelot.cy.kao@fii-na.com>; Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
>> Subject: Re: x86-power-control for ARM CPU based system.
>>
>> Hi Brandon,
>> On 3/22/2021 3:43 PM, Brandon Ong wrote:
>>> Hi Jason,
>>>
>>> I am currently working on the implementation of the x86-power-control
>>> for an ARM CPU based system.
>>>
>>>
>>> Is there a way to add a compile option to x86-power-control in order
>>> to change the behavior to support the ARM power control logic if it
>>> were to be integrated into x86-power-control?
>> x86-power-control was created to solve specific timing issues with our platforms.  It wasn't designed to be a flexible solution for the community to use.
> 
> And OpenBMC was initially designed for POWER platforms.  Things change :)
> 
> Clearly x86-power-control seems to solve more problems, as a lot of
> new platforms seem to be preferring it.
I'm glad it is working well. :)

> If the code being changed is
> messy, unmaintainable, or isn't well abstracted, that's a different
> discussion,
This is definitely a concern.  Since it wasn't designed as a flexible 
solution, I'm worried it will become fragile with a lot of changes.

> but outright saying nobody else can make use of
> x86-power-control seems problematic, and would lead to a power control
> daemon per-platform, which seems hard to maintain,
This was not my intention, so I apologize if it came out that way. 
Making changes to x86-power-control is definitely better than everyone 
forking their own.

However, I have tried to think of good ways to make x86-power-control 
more flexible and generic and have not come up with anything much 
different from phosphor-state-manager.  So, I worry that we could spend 
a lot of time and effort making x86-power-control flexible only to end 
up with something that is essentially the same as what we already have. 
But I don't want to squash any efforts here, so I'm open to ideas and 
proposals.

> and in looking at
> the amd patches, an amd specific daemon would largely just copy-paste
> 95% of x86-power-control today into something like amd-power-control
> if we took this to the logical conclusion.
95% the same sounds like a minor effort to include in x86-power-control. 
  This particular thread was mentioning a build switch for ARM CPU 
support which made it sound like there would be significant differences, 
so I wanted to make sure that phosphor-state-manager had been evaluated.

> 
>>
>> phosphor-state-manager
>> (https://github.com/openbmc/phosphor-state-manager) is the OpenBMC community power state manager.  It is designed for flexibility in how different systems change power state.
>>
>> Rather than add build modifications to x86-power-control for your needs, I'd recommend that you look at phosphor-state-manager which was designed to be customizable for different systems.
> 
> phosphor-state-manager has all the problems that you found when you
> went to use it, and found it lacking.  Clearly Brandon has found the
> same and is looking to make some (hopefully minor) mods to make
> x86-power-control more useful in more contexts.  If it's a matter of
> code cleanliness or separation, there's certainly a discussion to be
> had here, but effectively saying that everyone should go build their
> own version of x86-power-control seems wasteful, as a lot of platforms
> share similar properties to what x86-power-control does.
I have some vague high-level ideas of trying to figure out how to make 
the power states and event handlers more generic, so that the various 
events, timeouts, and state changes could be customized.  But I haven't 
gone any further than "maybe a class or something". :)  Maybe that level 
of flexibility isn't needed, though...

> 
> The things I see in the patch are:
> 1. The ability to invert polarities of the inputs.
> 2. The ability to disable at compile time some of the watchdogs that
> don't make sense on certain platforms.
> 3. disabling the beeper (which I'm not sure is needed so long as you
> handle errors silently).
> 4. A couple of platform-name-specific hardcodes, that I suspect aren't
> needed or can be abstracted.
> 
> Is there a way we can avoid the duplication of code in this case?
I agree.  These changes sound minor and able to be integrated into 
x86-power-control.  Is a patch already available to look at?

> 
>>
>> Thanks,
>> -Jason
>>
>>>
>>> Thanks,
>>> Brandon
>>>
