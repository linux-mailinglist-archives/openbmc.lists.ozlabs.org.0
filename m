Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F875349808
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 18:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5sZm1fSqz3bsh
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 04:30:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5sZb19bzz30Bw
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 04:30:46 +1100 (AEDT)
IronPort-SDR: UxGcpGLKTNH3xDUSWxJxZT1lhEqAUA74Gavaotza6bnx/g6jGW3Cq/xAPNDe00JLHNM4C1K6GI
 +Wct72fiVdsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="211119580"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="211119580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:30:41 -0700
IronPort-SDR: q9pGDVa7kVGnq37rftj0iaIyCQ+bOZctvuJoC0Q0sxoXSx5bTmXIr3T1iv619asP+m8kBOzDEE
 vh8IOra2CavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="375158770"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 25 Mar 2021 10:30:40 -0700
Received: from [10.209.30.119] (jmbills-MOBL.amr.corp.intel.com
 [10.209.30.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 939F5580716
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 10:30:40 -0700 (PDT)
Subject: Re: Question of phosphor-sel-logger
To: openbmc@lists.ozlabs.org
References: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
 <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
 <TY2PR04MB37121D9EE4CD05A70D5F6C5B88629@TY2PR04MB3712.apcprd04.prod.outlook.com>
 <f92a8942-ea95-6ca2-402b-d2fec89d2357@linux.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <7dbd2aa3-c34b-0a50-f125-9366a67425e5@linux.intel.com>
Date: Thu, 25 Mar 2021 10:30:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f92a8942-ea95-6ca2-402b-d2fec89d2357@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 3/25/2021 7:25 AM, Matt Spinler wrote:
> 
> 
> On 3/25/2021 3:22 AM, Duke Du (杜祥嘉) wrote:
>>> -----Original Message-----
>>> From: Matt Spinler <mspinler@linux.ibm.com>
>>> Sent: Wednesday, March 24, 2021 9:20 PM
>>> To: Duke Du (杜祥嘉) <Duke.Du@quantatw.com>; openbmc@lists.ozlabs.org
>>> Cc: vernon.mauery@linux.intel.com; jason.m.bills@linux.intel.com; 
>>> Fran Hsu
>>> (徐誌謙) <Fran.Hsu@quantatw.com>; George Hung (洪忠敬)
>>> <George.Hung@quantatw.com>
>>> Subject: Re: Question of phosphor-sel-logger
>>>
>>>
>>>
>>> On 3/24/2021 6:28 AM, Duke Du (杜祥嘉) wrote:
>>>> Hi all,
>>>>
>>>>        I used package phosphor-hwmon and phospor-sel-logger to
>>> monitor sensor and create log when sensor reading
>>>>      cross the threshold. I found after the commit
>>> 25b26e162bd109b51aa09b16f26f9aa3d9d940fa of phosphor-sel-logger
>>>>      would catch the signal "ThresholdAsserted" to create sensor 
>>>> threhold
>>> log in the journal, but the phosphor-hwmon
>>>>      would not send the signal "ThresholdAsserted" when sensor reading
>>> is abnormal so that phosphor-sel-logger
>>>>      would not create the sensor threhold log, am I right ?
>>>>
>>>>      If I'm right, can you give me some suggestion to fix this side 
>>>> effect, or
>>> what setting I have lost in the
>>>>      phosphor-hwmon or phosphor-sel-logger ?
>>> Hi,
>>> That signal isn't defined in phosphor-dbus-interfaces, so phosphor-hwmon
>>> cannot use it.  When I tried to add it, it was rejected as-is with a
>>> recommendation to break it up into separate signals for each alarm 
>>> property
>>> on each interface.  At that point I gave up and had the code I was 
>>> working
>>> on at the time just look at propertiesChanged signals instead.
>>>
>>> If you would like to take that up it would entail:
>>> * Update
>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgerrit. 
>>>
>>> openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-dbus-interfaces%2F%2B
>>> %2F39899&amp;data=04%7C01%7CDuke.Du%40quantatw.com%7Cc5bf4d3d1
>>> 6f046cc6efa08d8eec78fd7%7C179b032707fc4973ac738de7313561b2%7C1%7
>>> C0%7C637521888783853893%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
>>> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp
>>> ;sdata=XoY4nKa3Go%2F9jt2coyzOcnXNrcMaw6XUtqnmK57k0ds%3D&amp;res
>>> erved=0
>>> as requested
>>> * Update phosphor-hwmon to emit the new signals
>>> * Update phosphor-sel-logger to also listen for these new signals in 
>>> addition
>>> to the  current one, or change the dbus-sensors code to only emit the 
>>> new
>>> signals.
>>>
>>>
>> Hi Matt,
>>
>>     Thanks for your reply, I want to add a event monitor to listen 
>> "signal PropertyChanged" for
>>     "phosphor-phosphor-hwmon" only, like watchdog event monitor
>>     
>> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/37774), 
>>
>>     I think this is a simple way to fix this side effect, what do you 
>> think about my thought ?
>>     Please feel free to give me some suggestion, thanks very much !
> 
> I don't really know the best way to go here other than what I already 
> suggested.  sel-logger used to look at PropertiesChanged, but was 
> changed to use ThresholdAsserted I think so that it could capture the 
> sensor value within the signal.  But applications that need 
> phosphor-dbus-interfaces bindings for their operations, like 
> phosphor-hwmon, can't use ThresholdAsserted because it failed the PDI 
> review.
> 
> Jason or Vernon, what do you suggest?
With just PropertiesChanged we were getting events but when we read the 
current sensor value it had changed, so we were getting cases where an 
event showed a threshold was crossed but the value in that event was 
below the threshold.

As Matt noted, we attempted to fix this issue by creating the 
ThresholdAsserted signal so the value that triggered the threshold event 
could be sent with it and logged correctly.

I think the best options are
1. Find a new solution to the original problem where we can report 
accurate threshold crossed value with just PropertiesChanged.
2. Pursue Matt's proposed change to phosphor-dbus-interfaces to get the 
signal officially defined to include the sensor value in the signal.

Thanks,
-Jason

> 
> 
>>
>> Thanks
>> Duke
>>
>>>>      phosphor-sel-logger commit
>>> 25b26e162bd109b51aa09b16f26f9aa3d9d940fa link :
>>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgith
>>>>
>>> ub.com%2Fopenbmc%2Fphosphor-sel-logger%2Fcommit%2F25b26e162bd10
>>> 9b51aa0
>>> 9b16f26f9aa3d9d940fa&amp;data=04%7C01%7CDuke.Du%40quantatw.com%
>>> 7Cc5bf4
>>> d3d16f046cc6efa08d8eec78fd7%7C179b032707fc4973ac738de7313561b2%7C
>>> 1%7C0
>>> %7C637521888783853893%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
>>> wMDAiLCJQ
>>> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=rHxKqIk
>>> Vg7
>>>> yQXmqvjXal7I6eVBzw3ifl26gsZF8o4xo%3D&amp;reserved=0
>>>>
>>>>      Thanks very much !
>>>>      Duke
> 
