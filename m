Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7D779069
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 18:12:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y4TB2b6czDqLw
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:12:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y4SR39QTzDqJq
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 02:11:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 09:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; d="scan'208";a="255302862"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 29 Jul 2019 09:11:29 -0700
Subject: Re: [External] Re: Questions regarding of phosphor-pid-control
To: Patrick Venture <venture@google.com>, Derek Lin23 <dlin23@lenovo.com>
References: <5a7988638ddf428cb8267d7e339cdbcf@lenovo.com>
 <CAO=notyiSd+kcHD_ed7CtLY8G-+fvWt9fgXbQARS9nq7PGXXnQ@mail.gmail.com>
 <a190291d8f454efbbb17b95e28085466@lenovo.com>
 <2b4006da-752e-fa9b-8500-431c5b42d00f@linux.intel.com>
 <baa7b1f21ad34c35841004c5224309ff@lenovo.com>
 <CAO=notyH-R0HV-8ff28phvtdq-hhGpT9W81aApUg7xUF7VUopw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <acd660df-7e8e-96e0-8c7c-c3ab7998b693@linux.intel.com>
Date: Mon, 29 Jul 2019 09:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notyH-R0HV-8ff28phvtdq-hhGpT9W81aApUg7xUF7VUopw@mail.gmail.com>
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
Cc: Duke KH Du <dukh@lenovo.com>, Andrew MS1 Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Xiaohan XH6 Xu <xuxh6@lenovo.com>, Haitao HT11 Wang <wanght11@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/29/19 8:30 AM, Patrick Venture wrote:
> On Fri, Jul 26, 2019 at 2:18 AM Derek Lin23 <dlin23@lenovo.com> wrote:
>>
>> Hi Patrick & James:
>>
>>          Would you please identify when'll this feature being completed?
>>          Or do you have a plan for this feature?
>>
>>          https://github.com/openbmc/phosphor-pid-control/issues/2
> 
> I currently don't have it on my calendar.  James, do you?

No I don't. The dbus-configured system reloads itself when new sensors 
are discovered, and all sensors are passive.. so I'm not sure it is 
relatable.

> 
> for a non-dbus-configured system, we end up using waits in the service
> file for the various sensors upon which we depend to show up on dbus.
> IIRC< the goal of the feature would be to no longer need that, but
> rather create the dbus sensors even if nobody owns them, and just try
> on read or every few reads to actually register the listening for
> updates...  And just return a bad sensor reading until that happens --
> but, what is a bad sensor reading, universally?
> 
>>
>> Thanks,
>>
>> Derek
>>
>> -----Original Message-----
>> From: James Feist <james.feist@linux.intel.com>
>> Sent: Friday, July 19, 2019 1:57 AM
>> To: Derek Lin23 <dlin23@lenovo.com>; Patrick Venture <venture@google.com>
>> Cc: Yonghui YH21 Liu <liuyh21@lenovo.com>; Harry Sung1 <hsung1@lenovo.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>; Andrew MS1 Peng <pengms1@lenovo.com>; Lisa YJ19 Liu <liuyj19@lenovo.com>; Haitao HT11 Wang <wanght11@lenovo.com>; Xiaohan XH6 Xu <xuxh6@lenovo.com>
>> Subject: Re: [External] Re: Questions regarding of phosphor-pid-control
>>
>> On 7/17/19 7:40 PM, Derek Lin23 wrote:
>>> Hi Patrick:
>>>
>>>             The open-loop in this context is more likely to set duty of
>>> PWM manually.
>>>
>>>             For example, when reading a sensor above or below a certain
>>> pre-defined temperature, then the duty of a PWM is revved up or lower
>>> to the desired fan-speed.
>>
>> You could use stepwise configurations to get this response. Here's an example of a lower clipping curve that when the reading of the sensor is 20, outputs 50%, and when it reads 30 outputs 60%.
>>
>> https://github.com/openbmc/entity-manager/blob/9813279b57359bd1602da236ff7d38bcc9a2fba4/configurations/R2000%20Chassis.json#L428
>>
>> This is also configurable from the json I believe.
>>
>>
>>>
>>>             More likely, PWM is set simply by the reading of a
>>> temperature sensor. A map of temperature readings and PWM values can
>>> be represented as an example.
>>>
>>> Thank you,
>>>
>>> Derek
>>>
>>> *From:*Patrick Venture <venture@google.com>
>>> *Sent:* Tuesday, July 16, 2019 1:02 AM
>>> *To:* Derek Lin23 <dlin23@lenovo.com>; James Feist
>>> <james.feist@linux.intel.com>
>>> *Cc:* Yonghui YH21 Liu <liuyh21@lenovo.com>; Harry Sung1
>>> <hsung1@lenovo.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>> *Subject:* [External] Re: Questions regarding of phosphor-pid-control
>>>
>>> On Tue, Jul 9, 2019 at 2:03 AM Derek Lin23 <dlin23@lenovo.com
>>> <mailto:dlin23@lenovo.com>> wrote:
>>>
>>>      Hi Patrick:
>>>
>>> Adding the openbmc mailing list.  Please always include this mailing
>>> list in your emails for archiving and later reference as well as
>>> opening up the question to others.
>>>
>>> Also adding James Feist as he co-maintains this codebase.
>>>
>>>                 This is Derek from Lenovo BMC team.
>>>
>>>                 We have some questions regarding ofphosphos-pid-control
>>>      <https://github.com/openbmc/phosphor-pid-control>, and we hope you
>>>      can provide some advice of the component.
>>>
>>>                 Currently, we would like to import phosphor-pid-control
>>>      as our thermal fan control module. After a brief study, we would
>>>      like to know if phosphor-pid-control can support open-loop and
>>>      event-triggered events?
>>>
>>> I don't really know what open-loop means in this context.  Registering
>>> for events, like?
>>>
>>>      Thank you for your feedbacks,
>>>
>>>      Derek
>>>
>>>
>>> ----------------------------------------------------------------------
>>> --
>>>
>>>      *Derek Lin*
>>>      Sr. BMC Engineer
>>>      8F,66, San Chong Rd., Nankang Software Park, Taipei.
>>>      Lenovo Taiwan
>>>
>>>
>>>
>>>      Phone+886281707411
>>>      Emaildlin23@lenovo.com <mailto:dlin23@lenovo.com>
>>>
>>>
>>>
>>>      Lenovo.com <http://www.lenovo.com/>
>>>      Twitter <http://twitter.com/lenovo> | Instagram
>>>      <https://instagram.com/lenovo> | Facebook
>>>      <http://www.facebook.com/lenovo> | Linkedin
>>>      <http://www.linkedin.com/company/lenovo> | YouTube
>>>      <http://www.youtube.com/lenovovision> | Privacy
>>>      <https://www.lenovo.com/gb/en/privacy-selector/>
>>>
>>>
>>>
>>>      ImageLogo-DCG-Honeycomb
>>>
>>>
>>>
