Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC21B4B46
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 19:05:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496mz13FKbzDqtZ
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 03:05:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496mx95gVVzDqXK
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 03:03:54 +1000 (AEST)
IronPort-SDR: rtC8sj8PAWzxXHKplMl//mMupJbjLNxwR3DrDJsEyCMAdEgscNiLL3ckhCcW9MKRTXpUjhe0En
 1tM2uHd24u3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 10:03:51 -0700
IronPort-SDR: JLu2USZ6zYqnNGDZHiLJ2NTtEt0hP+JlSkCPMeEIV8ygjab0ghVkQ7VHOuWR6IXS/hS0k9EEyw
 ZooAbpFYkCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="334688337"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 22 Apr 2020 10:03:51 -0700
Received: from [10.215.176.208] (jmbills-mobl.amr.corp.intel.com
 [10.215.176.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E598A5805B4
 for <openbmc@lists.ozlabs.org>; Wed, 22 Apr 2020 10:03:48 -0700 (PDT)
Subject: Re: dbus-sensors
To: openbmc@lists.ozlabs.org
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <38628854-4dbd-5087-c7f8-386d94e1e421@linux.intel.com>
Date: Wed, 22 Apr 2020 10:03:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a5cad39-b366-0a0c-54b0-23da9f2a3d81@linux.ibm.com>
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



On 4/22/2020 9:19 AM, Matt Spinler wrote:
> Great!  Sounds like we should be able to make thing work.
> A few comments below.
> 
> On 4/21/2020 4:54 PM, James Feist wrote:
>> On 4/21/2020 12:35 PM, Matt Spinler wrote:
>>> Hi James,
>>>
>>> We're looking into using dbus-sensors(HwmonTemp and PSU) in the future,
>>> but would need to make a few changes to fit our requirements. Was 
>>> wondering
>>> what you'd think of the following:
>>>
>>> 1. Check if a sensor has a _fault sysfs file, and if it does and it
>>>    is nonzero, set the Functional property on the OperationalStatus
>>>    interface to false (and/or maybe 6 below)
>> Sounds ok.
>>
>>>
>>> 2. After the 10 failed reads, instead of just setting the sensor to 0
>>>    also make a D-Bus call to create a phosphor-logging event log and set
>>>    the OperationalStatus sensor to false.
>>
>> Sounds ok.
>>
>>>
>>> 3. After creating this event log, make sure not to do it again until
>>>    main power is cycled.
>>
>> I'd rather this be until the status goes OK again.
> 
> As suggested by Patrick, I agree the throttling can be done elsewhere, 
> so we
> would just create the logs as you state here.
> 
I'm not familiar with the sensors, but for this specific case, would it 
work to base the log on OperationalStatus?  It seems logical to not log 
events for sensors that are not operational, and since it will be set to 
false after the 10 failures, it would stop the log from nagging.

>>
>>>
>>> 4. If not already supported (was unsure), be able to find an
>>>    _input file based on a value it has in the corresponding _label file.
>>
>> PSU sensor does this, hwmontemp does it by index.
> 
> Would you be OK with us also adding this to PSUSensor?
> 
>>>
>>> 5. We have a case where a driver isn't loaded with power off, so somehow
>>>    we still need the sensors to stay on D-Bus when off (and show them
>>>    as not available).
>>
>> All sensors are on d-bus all the time, its based on the EM config.
> 
> Perfect!
> 
>>
>>>
>>> 6. Maybe add a new property to Sensor.Value on the validity
>>>    of the value property, for when driver is unloaded or there is an
>>>    error or the sensor reading is otherwise not valid.  We could add
>>>   this to phosphor-hwmon at the same time.
>>>   (I think this was mentioned on the list before).
>>
>> Yes, this is where we've used std::nan, I'm not sure if that made it 
>> to all sensors as it's not tested very much. I know the fans do this.
>>
>>>
>>> We would definitely of course work with you on the best way to
>>> accomplish these, and I know #6 needs more discussion on if
>>> this is something we want to do in OpenBMC, though I thought
>>> I remembered an earlier discussion where it was popular.
>>>
>>> Thanks,
>>> Matt
> 
