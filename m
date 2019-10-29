Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96112E8C8E
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 17:18:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472cGM6Z5CzF391
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 03:18:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472cFd3fQ2zF37j
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 03:18:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 09:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="399842570"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 29 Oct 2019 09:18:08 -0700
Subject: Re: Showing signed sensor value when the command "ipmitool sel elist"
 is executed
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
References: <b3c1129773c64c97b9655701cb506578@quantatw.com>
 <efe40787-6aae-c64d-128e-42dd0ed912f2@linux.intel.com>
 <f21b9266035247e7b52c722c698871c1@quantatw.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <13f22bc9-c8db-afe1-64ab-ece4206c2f44@linux.intel.com>
Date: Tue, 29 Oct 2019 09:18:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f21b9266035247e7b52c722c698871c1@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/28/19 11:40 PM, Tony Lee (李文富) wrote:
>> On 10/27/19 11:41 PM, Tony Lee (李文富) wrote:
>>> Hi Jason,
>>>
>>> We know that when we execute the command "ipmitool sel elist", it will
>> return something like the following,
>>> "18 | 10/16/19 | 18:28:41 UTC | Temperature nvme0 | Upper Non-critical
>> going high | Asserted | Reading 72 > Threshold 70 degrees C".
>>>
>>> I met a problem that when the sensor value in the d-bus is negative, the
>> current reading in "ipmitool sel elist" will be 0.
>>> It seems that because the type of scaledValue is defined "uint32_t", there is
>> always a none negative value even current value is a negative value obtained
>> from the d-bus. In
>>>
>> https://github.com/openbmc/phosphor-sel-logger/blob/master/include/sens
>> orutils.hpp#L159
>>>
>>> Is this is an issue or I need to set it up somewhere?
>>
>> If min is < 0, then this should work:
>>
>> https://github.com/openbmc/phosphor-sel-logger/blob/6afe9560852c6431c4
>> 3c8e79a28e2b7cb498e355/include/sensorutils.hpp#L61
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/12162be363f11
>> b9dafa92b5379db671712b3523c/xyz/openbmc_project/Sensor/Value.interfac
>> e.yaml#L28
>>
>> It uses MinValue < 0 to determine if the sensor is signed or not.
> 
> Hi James,
> 
> Yes, My MinValue and min are < 0.
> I understand that If min is < 0 then bSigned = true finally it will return static_cast<int8_t>(scaledValue)
> then this should work. But, after
> https://github.com/openbmc/phosphor-sel-logger/blob/6afe9560852c6431c43c8e79a28e2b7cb498e355/include/sensorutils.hpp#L159
> I got scaledValue = 0 and return 0 in the end.
> 
> There are another question that why is "scaledValue" defined as uint32_t?
> Shouldn't it return a byte(uint8_t) after calculation?

The return value is an uint8_t (about 5 lines below where you linked). 
The point of it being a uint32_t is so you can check for overflow. That 
being said looking at the unit tests I don't believe we check for 
negative, and that might need to be a int32_t.

The tests are here: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/tests/test_sensorcommands.cpp

I'll try to take a look in the next day or two and write a new test to 
see if that fixes it, but feel free to add a test yourself if you beat 
me to it.

-James

> 
> Here is my settings and debug logs:
> max = 127.000000
> min = -128.000000
> value = -1.000000
> mValue = 1
> rExp = 0
> bValue = 0
> bExp = 0
> bSigned = true
> scaledValue = 0
> 
> Thanks,
> -Tony
> 
>> Thanks,
>>
>> -James
>>
>>>
>>> Thanks
>>> Best Regards,
>>> Tony
>>>
