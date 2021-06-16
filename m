Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD363A98A8
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 13:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4j4P0mhfz30Ff
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 21:04:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.56;
 helo=out30-56.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4j484rDXz2ymV
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 21:04:07 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0UcblN9K_1623841429; 
Received: from B-G4TALVDL-1650.local(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0UcblN9K_1623841429) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 16 Jun 2021 19:03:50 +0800
Subject: Re: [Phishing Risk] [External] Re: Does it make sense to create a
 centralized fan control module?
To: John Wang <wangzhiqiang.bj@bytedance.com>
References: <f8e08249-d0e4-d632-c76b-495b8ce968d2@linux.alibaba.com>
 <3c72ee05-ec56-96ca-55da-6517307cd6a7@linux.alibaba.com>
 <71dfdfc0-1eff-efb6-094c-de71f6f8cc87@linux.alibaba.com>
 <CAH0XSJupSg54T_6qpPPHHBjHcR5OFZ3+VcaGEaP+PR+6F5ny1g@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
Message-ID: <57aab765-1475-a7db-6918-08c31724d915@linux.alibaba.com>
Date: Wed, 16 Jun 2021 19:03:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH0XSJupSg54T_6qpPPHHBjHcR5OFZ3+VcaGEaP+PR+6F5ny1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, Ed Tanous <edtanous@google.com>,
 Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi John,

Thanks for your reply. Please see my comments inline.

On 2021/6/16 上午10:49, John Wang wrote:
> On Wed, Jun 16, 2021 at 10:02 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>> Hi All,
>>
>> Any comments for my questions at the top of this thread?
>>
>> Thanks,
>>
>> Heyi
>>
>>
>> On 2021/6/11 上午9:23, Heyi Guo wrote:
>>> Please ignore my early emails; only this one is the final version. I
>>> must have misused some shortcut key to send the unfinished versions
>>> while I wanted to save it locally...
>>>
>>> Sorry for the noise.
>>>
>>> Heyi
>>>
>>> On 2021/6/11 上午9:14, Heyi Guo wrote:
>>>> Hi All,
>>>>
>>>> Right now fan related data like tacho and PWM is fetched in
>>>> dbus-sensors, and published to d-bus as sensor data, while fan
>>>> control is made in another module like pid-control, which can fetch
>>>> data and set value via d-bus.
>>>>
>>>> In some common sense, we may think about putting all fan related work
>>>> into one single module (which may be based on pid-control), i.e. it
>>>> can read tacho and PWM from hardware directly, calculate the required
> As I understand it, if you just want to bypass dbus and read pwm/tach
> directly you can refer to this.
> https://github.com/openbmc/openbmc/blob/master/meta-quanta/meta-gsj/recipes-phosphor/fans/phosphor-pid-control/config-2ssd.json#L6-L7

Do you suggest to use sysfs interface to access pwm/tach? However, we 
are using a I2C centralized fan controller and we don't have 
corresponding kernel driver for it. We propose to access this device by 
using /dev/i2c-<bus> interface directly in user mode.


>
>>>> PWM by some algorithm like PID, and then write to PWM hardware
>>>> directly; the data will also be published to d-bus for other modules
>>>> to consume, like fansensor from dbus-sensors.
>>>>
>>>> Does it make sense to do that? Or is there any reason for the current
>>>> design?
> I don't know why it's designed this way, but are you experiencing any problems?
Not really.
> According to our past experience, pid-control reads/writes pwm/tach
> quite smoothly,
> but pid-control has some trouble reading the temperature of some
> sensors via dbus.(eg psusensors).
> That's another topic...

As I mentioned above, there is no sysfs interface for fan pwm/tach on 
our platform. We can only rely on dbus interfaces if using the upstream 
phosphor-pid-control. Then we think about centralizing all fan related 
hardware access into one module (like pid-control), but not sure if 
there's any problem for this idea.

Thanks,

Heyi

>
>>>> I'm new to OpenBMC and some of my understanding may be totally wrong.
>>>>
>>>> Looking forward to your expert advice.
>>>>
>>>> Thanks,
>>>>
>>>> Heyi
