Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B926A20DF
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 18:28:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K7MJ450wzDrft
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 02:28:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K7LB59ZjzDrVb
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 02:27:13 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 09:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,444,1559545200"; d="scan'208";a="380823822"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2019 09:27:11 -0700
Subject: Re: [phosphor-pid-control] scaling issue
To: Patrick Venture <venture@google.com>
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
 <CAO=notyhKih1XaCZEVOOjPUtpQ_y4nnicH+L5ZLEoKWCTvv07Q@mail.gmail.com>
 <580839e8-3185-35e7-7e49-b34cd4981b08@linux.intel.com>
 <CAO=notwk4LgPee=_NjMgyxJseQW5GYHt2juNtzQJ7Gv9m4vHNA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <377bc71b-06f1-00be-babf-803a88a2af25@linux.intel.com>
Date: Thu, 29 Aug 2019 09:27:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwk4LgPee=_NjMgyxJseQW5GYHt2juNtzQJ7Gv9m4vHNA@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/29/19 9:21 AM, Patrick Venture wrote:
> On Thu, Aug 29, 2019 at 9:14 AM James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 8/29/19 7:24 AM, Patrick Venture wrote:
>>> On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (劉晉翰) <Hank.Liou@quantatw.com> wrote:
>>>>
>>>> Hi Patrick,
>>>>
>>>> I think it's OK to parse the config min&max for temp sensors.
>>>
>>> So, iirc, the min/max in the  json is only for sensors that write, and
>>> not read.  Sorry, I'm ramping up on a new team and slower to catch up
>>> to emails.
>>>
>>> Yeah, the min/max in the json are for basically converting a
>>> percentage value to a PWM values -- that's its initial goal.
>>> Temperature sensors typically don't have minimum and maximum values in
>>> the code's use-cases.  I added James to this because they use the
>>> daemon for other cases -- where perhaps that'll make sense.
>>
>> I believe the history of min/max being removed for passive sensors was
>> here:
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-pid-control/+/23470
>>
>> The only other use case we have for min / max is for fan RPM so that we
>> can create a PID based on Tach %, so that the same PID can be reused on
>> multiple platforms with different sized fans.
>>
>> -James
>>
>>>
>>>>
>>>> Any suggestion?
>>>>
>>>> Thanks,
>>>> Hank
>>>>
>>>>> -----Original Message-----
>>>>> From: openbmc [mailto:openbmc-
>>>>> bounces+hank.liou=quantatw.com@lists.ozlabs.org] On Behalf Of Hank Liou
>>>>> (劉晉翰)
>>>>> Sent: Friday, August 23, 2019 4:31 PM
>>>>> To: Patrick Venture <venture@google.com>; James Feist
>>>>> <james.feist@linux.intel.com>
>>>>> Cc: openbmc@lists.ozlabs.org
>>>>> Subject: RE: [phosphor-pid-control] scaling issue
>>>>>
>>>>> Hi Patrick,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Patrick Venture [mailto:venture@google.com]
>>>>>> Sent: Wednesday, August 21, 2019 10:32 PM
>>>>>> To: Hank Liou (劉晉翰) <Hank.Liou@quantatw.com>; James Feist
>>>>>> <james.feist@linux.intel.com>
>>>>>> Cc: openbmc@lists.ozlabs.org
>>>>>> Subject: Re: [phosphor-pid-control] scaling issue
>>>>>>
>>>>>> On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (劉晉翰)
>>>>>> <Hank.Liou@quantatw.com> wrote:
>>>>>>>
>>>>>>> Hi All,
>>>>>>>
>>>>>>>
>>>>>>> After commit [1], I found my temp sensor reading would be re-scaled
>>>>>>> by
>>>>>> multiplying 1 over 255, making temperature into unfamiliar unit. Also
>>>>>> the fan rpm reading would lie in [0,1] interval, letting the fan input
>>>>>> to be 0 (since the input value of fan is from an integer array [2]). Are these
>>>>> normal behaviors?
>>>>>> Or do I miss something?
>>>>>>
>>>>>> Are you using dbus configuration or json?  If json, can you attach your config.
>>>>>> Since you're saying it was working and now isn't, I'm assuming there's
>>>>>> something about the config being treated differently with the code
>>>>>> changes in an unexpected way.
>>>>>
>>>>> I found pid control will first read min and max from dbus and then (before
>>>>> commit [1]) revise them if
>>>>>
>>>>> info->min != conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
>>>>>
>>>>> After value initialization, the min and max would be the ones in json file (Json
>>>>> file [3]). However, after commit [1] the min and max values of config would
>>>>> not be fed into the fan control process. The scaling issue is originated from
>>>>> commit [4] with the aim to treat fan rpm as percentage. It seems that commit
>>>>> [1] unexpectedly affects temp sensors in the sense that the temp is the
>>>>> integer reading not percentage. Before commit [1], it would not re-scale the
>>>>> temp reading since my min and max are 0 [6].
>>>>>
>>>>>
>>>>>
>>>>> There is another issue with commit [1]. Now the fan rpm would be something
>>>>> like
>>>>>
>>>>> 1500 / 20000 = 0.075
>>>>>
>>>>> where rpm max 20000 is from dbus. However the fan input function would
>>>>> transfer double into int, which is 0 for 0.075 (see [5]). Hence the fan input is 0
>>>>> not percentage. Is there something wrong?
>>>>>
>>>>> [1] https://github.com/openbmc/phosphor-pid-
>>>>> control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
>>>>> [2] https://github.com/openbmc/phosphor-pid-
>>>>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
>>>>> r.cpp#L86
>>>>> [3]
>>>>>         {
>>>>>              "name": "fan1",
>>>>>              "type": "fan",
>>>>>              "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
>>>>>              "writePath": "/sys/class/hwmon/hwmon1/pwm1",
>>>>>              "min": 0,
>>>>>              "max": 255
>>>>>          },
>>>>>          {
>>>>>              "name": "temp1",
>>>>>              "type": "temp",
>>>>>              "readPath": "/xyz/openbmc_project/sensors/temperature/temp1",
>>>>>              "writePath": "",
>>>>>              "min": 0,
>>>>>              "max": 0
>>>>>          }
>>>>> [4] https://github.com/openbmc/phosphor-pid-
>>>>> control/commit/75eb769d351434547899186f73ff70ae00d7934a
>>>>> [5] https://github.com/openbmc/phosphor-pid-
>>>>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
>>>>> r.cpp#L64
>>>>> [6] https://github.com/openbmc/phosphor-pid-
>>>>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspassi
>>>>> ve.cpp#L158
>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> [1]
>>>>>>> https://github.com/openbmc/phosphor-pid-
>>>>>> control/commit/fc2e803f5d92569
>>>>>>> 44e18c7c878a441606b1f121c
>>>>>>>
>>>>>>> [2]
>>>>>>> https://github.com/openbmc/phosphor-pid-
>>>>>> control/blob/a7ec8350d17b70153
>>>>>>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
>>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>>
>>>>>>>
>>>>>>> Hank Liou
>>>>>>>
>>>>>>> Quanta Computer Inc.
>>>>>>>
>>>>>>>
>>>>>
>>>>> Sincerely,
>>>>> Hank
> 
> Hank, do you need to use the min/max on the temperature sensors?  Try
> your build with those entries deleted from the json file (they're
> optional).
> 
> James, I think I should add a warning and ignore those fields in that
> case.  What do you think?  (I honestly thought they were already
> ignored for temperature sensors -- have to look at the code to
> verify).

I don't have much of an opinion here as I don't use the json 
configuration, but more warnings never hurt.

> 
