Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF55104288
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 18:51:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J9H16JbszDqmJ
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 04:51:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J9Fz0CFVzDqkX
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 04:50:29 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 09:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="237826127"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2019 09:50:26 -0800
Subject: Re: [External] Power-on monitor for phosphor-hwmon question
To: Ivan Li11 <rli11@lenovo.com>, Matt Spinler <mspinler@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
 <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
 <25d62ba90109494e97119222fd015d84@lenovo.com>
 <78e0d80f-7e7b-51f2-e2cc-f2cf6a819062@linux.intel.com>
 <ad84afd6c4d042b79e8f4ab7050489c5@lenovo.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <ae265af1-100b-10e4-b185-725b255a295b@linux.intel.com>
Date: Wed, 20 Nov 2019 09:50:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ad84afd6c4d042b79e8f4ab7050489c5@lenovo.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/20/19 8:28 AM, Ivan Li11 wrote:
>> -----Original Message-----
>> From: Ivan Li11
>> Sent: Thursday, November 7, 2019 4:35 PM
>> To: 'James Feist' <james.feist@linux.intel.com>; Matt Spinler
>> <mspinler@linux.ibm.com>; openbmc@lists.ozlabs.org
>> Subject: RE: [External] Power-on monitor for phosphor-hwmon question
>>
>>> -----Original Message-----
>>> From: James Feist <james.feist@linux.intel.com>
>>> Sent: Thursday, November 7, 2019 7:39 AM
>>> To: Ivan Li11 <rli11@lenovo.com>; Matt Spinler
>>> <mspinler@linux.ibm.com>; openbmc@lists.ozlabs.org
>>> Subject: Re: [External] Power-on monitor for phosphor-hwmon question
>>>
>>> On 11/5/19 11:25 PM, Ivan Li11 wrote:
>>>>> -----Original Message-----
>>>>> From: James Feist <james.feist@linux.intel.com>
>>>>> Sent: Tuesday, October 22, 2019 11:51 PM
>>>>> To: Matt Spinler <mspinler@linux.ibm.com>; Ivan Li11
>>>>> <rli11@lenovo.com>; openbmc@lists.ozlabs.org
>>>>> Subject: Re: [External] Power-on monitor for phosphor-hwmon
>>>>> question
>>>>>
>>>>> On 10/22/19 6:23 AM, Matt Spinler wrote:
>>>>>>
>>>>>>
>>>>>> On 10/21/2019 6:02 AM, Ivan Li11 wrote:
>>>>>>>
>>>>>>> Hi Team,
>>>>>>>
>>>>>>> Does anyone have suggestion for this ?
>>>>>>>
>>>>>> Hi, you're right, it doesn't support that yet.  We've had a few
>>>>>> internal discussions about how to handle that gracefully, though
>>>>>> our platforms don't use sel-logger, but nothing solid came out of
>>>>>> them and we don't have anything scheduled yet.
>>>>>>
>>>>>> It would be easy enough to have a watch on the PGOOD property, and
>>>>>> then do you what you want, like maybe turning off the thresholds.
>>>>>>
>>>>>> I heard that the d-bus sensors repository has some sort of support
>>>>>> for this, but since we don't use it I'm not sure what all that
>>>>>> entails. I think it may also force you to replace
>>>>>> phosphor-inventor-manager with entity-manager.
>>>>>
>>>>> It should force you to switch 100%, but you would at least have to run
>> both.
>>>>>
>>>>> Here's what dbus-sensors does:
>>>>>
>>>>>
>>> https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f6955827330
>>>>> 7
>>>>> a59e4b1cf86b8a6/src/Utils.cpp#L141
>>>>>
>>>>> Basically just a dbus-match that sets a "powerStatusOn" bool that
>>>>> can be queried. Depending on the sensor type thresholds don't get
>>>>> crossed if that bool is set. We also have a similar bool for bios
>>>>> post, as some sensors come up later after power on.
>>>>>
>>>>
>>>> I try to use dbus-sensors and set "powerStatusOn" bool, but still
>>>> have
>>> incorrect threshold logs during power on(S0) to power off(S5) state.
>>>> Could you help to comment on it ?
>>>>
>>>
>>> This has only been tested with x86-power-control, are you using that
>>> project for power control or something else?
>>>
>>
>> Got it. I currently use phosphor-state-manager for power control.
> 
> Hi James,
> It seems that x86-power-control need POWER_BUTTON and POWER_OUT to be connected to GPIOE0/E1 or GPIOE2/E3 for passthrough.
> If our HW design doesn't follow it, x86-power-control will not work, right ?

+ Jason, x86-power-control maintainer

I believe it just requires those names in the DTS, I don't think it 
cares what pins they are hooked to. Do you not have power buttons?


> 
>>
>>>>>>
>>>>>>> Thanks your great support in advance.
>>>>>>>
>>>>>>> *From:*openbmc
>>> <openbmc-bounces+rli11=lenovo.com@lists.ozlabs.org>
>>>>> *On
>>>>>>> Behalf Of *Ivan Li11
>>>>>>> *Sent:* Friday, October 18, 2019 5:59 PM
>>>>>>> *To:* openbmc@lists.ozlabs.org
>>>>>>> *Subject:* [External] Power-on monitor for phosphor-hwmon
>>>>>>> question
>>>>>>>
>>>>>>> Hi Team,
>>>>>>>
>>>>>>> We found that there's no power-on monitor mechanism in
>>>>> phosphor-hwmon.
>>>>>>>
>>>>>>> https://github.com/openbmc/phosphor-hwmon
>>>>>>>
>>>>>>> And it will cause incorrect threshold logs to be added to journal
>>>>>>> log by 'sel-logger' when system is in power off(S5) state.
>>>>>>>
>>>>>>> Is there any plan to implement it? Or other repository we can refer to ?
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>> Ivan
>>>>>>>
>>>>>>
