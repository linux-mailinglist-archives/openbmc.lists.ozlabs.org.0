Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5731618FA9
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 19:52:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450LXD6PHkzDqRj
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 03:52:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450LW64Vn7zDqRW
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 03:51:26 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 10:51:24 -0700
X-ExtLoop1: 1
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 09 May 2019 10:51:23 -0700
Subject: Re: about phosphor pid control package
To: Patrick Venture <venture@google.com>,
 =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
 <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
 <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0a0149bc-5120-78ee-1fc3-877f510b66a4@linux.intel.com>
Date: Thu, 9 May 2019 10:51:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/9/19 7:43 AM, Patrick Venture wrote:
> On Wed, May 8, 2019 at 11:33 PM Will Liang (梁永鉉)
> <Will.Liang@quantatw.com> wrote:
>>
>> Hi,
>>
>>> -----Original Message-----
>>> From: Patrick Venture [mailto:venture@google.com]
>>> Sent: Thursday, May 9, 2019 12:36 AM
>>> To: Will Liang (梁永鉉) <Will.Liang@quantatw.com>
>>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>> Subject: Re: about phosphor pid control package
>>>
>>> On Wed, May 8, 2019 at 6:46 AM Will Liang (梁永鉉)
>>> <Will.Liang@quantatw.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> I have a question about getFailSafeMode().
>>>>
>>>> Currently, only sensors that are defined as "temp" types can be checked for
>>> failure.
>>>> I did not find any "fan" type sensors to check if the fan has failed.
>>>> Our project need to check the fan fail so  I want to add another "fan" sensor
>>> type to check.
>>>
>>>
>>>
>>>>
>>>> Can I add one more "for loop" to check the fan sensor in updateSensors()
>>> function in zone.cpp??
>>>>
>>>> for (const auto& t : _thermalInputs)
>>>> {
>>>>      ........
>>>> }
>>>> for (const auto& t : _fanInputs)
>>>> {
>>>>      ........
>>>> }
>>>
>>> updateSensors is deliberately not talking to the fans because they're not
>>> considered inputs into the thermal config, they're controlled outputs -- the
>>> question I have is, what would you like to do if a fan isn't responding?
>>> failsafemode drives the fans to a specific pre-defined speed to keep it from
>>> thermal issues.  If a fan is failing to respond, one can't drive it -- perhaps one
>>> can drive the others to some failsafe?
>>
>> If a fan fails, we need to enter the fail safe mode to increase the other fan duty.
>>
>>> If so, one needs to update the failsafe for a zone outside of the thermal sensors,
>>> but rather where the fans are checked (void
>>> PIDZone::updateFanTelemetry(void))
>>
>> I add following code into the PIDZone::updateFanTelemetry(void) function to check the fan fail.
>> If the fan fails, it will enter fail safe mode.
>>    if (sensor->getFailed())
>>    {
>>          failSafeSensors.insert(f);
>>    }
>>    else
>>    {
>>          // Check if it's in there: remove it.
>>      auto kt = _failSafeSensors.find(f);
>>      if (kt != _failSafeSensors.end())
>>    {
>>          failSafeSensors.erase(kt);
>>    }
>>
>> But one more question I have is that the above code can only check if a single fan has failed.
> 
>> Our project needs to check for dual-fan failures. Do you have any suggestions for checking the failure of the dual-fan?
> 
> I'm not entirely certain what you mean.  You're saying a dual-fan is a
> fan that has two outputs but one input?

If this is what you mean, on our systems we simply have a tach sensor 
per tach in the fan, i.e. fan1a and fan1b. I think the above logic would 
work for this issue.

> 
>>
>> Will
>>>>
>>>> BRs,
>>>> Will
