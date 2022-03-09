Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434B94D29AB
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 08:48:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD47R0DjZz3bZB
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 18:48:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD4754QTrz30Dt
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 18:47:59 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 21DAFE7BA940;
 Wed,  9 Mar 2022 08:40:37 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 08:40:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006bd0f450f-3e83-4300-b246-5f515468d37d,
 4C617328B094ABD9DFA4DE296C3C041D1A210FDA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1d81b433-a386-0004-0160-381cf15621da@kaod.org>
Date: Wed, 9 Mar 2022 08:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Lei Yu <yulei.sh@bytedance.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
 <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
 <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
 <CAGm54UHUC_7W9xGT49Ge3oO8Xf4-gDiq3Buvm-_D9K+3QX8M3w@mail.gmail.com>
 <b6fb257d-0fdd-bdf0-a18b-cb8f1db25195@kaod.org>
 <CAGm54UHZGhaBYqpaquaqGMFH16d1JqSt=PGnXhsd8TCD8-B92w@mail.gmail.com>
 <6be0165e-2a1a-4399-4c7a-b2c15b02681f@kaod.org>
 <CAGm54UHibLN2H01+d39R=cw7q-7KtgFwp6Ebud-52LfF+Uez6g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAGm54UHibLN2H01+d39R=cw7q-7KtgFwp6Ebud-52LfF+Uez6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dcacb257-f311-4c3e-ab37-b00bcf84599c
X-Ovh-Tracer-Id: 6482087241823587235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddujedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgueefkedtfeefhfevgfeitdelieeltefhiefflefffeelfeetffdtfedtvdeukeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhnohhnghhnuhdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/9/22 02:58, Lei Yu wrote:
>>>>>>
>>>>>> I don't see why. Is that the same kernel version and config ?
>>>>>>
>>>>>> May be check the allocations in
>>>>>>
>>>>>>       /proc/vmallocinfo
>>>>>
>>>>> It shows a large area as below:
>>>>>
>>>>>     0xc1d30472-0x406b4a0c 268439552 __devm_ioremap_resource+0x178/0x1f0
>>>>> phys=0x20000000 ioremap
>>>>
>>>> Is CONFIG_VMSPLIT_2G set ?
>>>
>>> Yes, it's enabled in aspeed-g6/defconfig
>>
>> The OpenBMC tree only has a aspeed_g5_defconfig.
> 
> It does have aspeed-g6/defconfig and CONFIG_VMSPLIT_2G is enabled:
> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig#L33

ok. I was referring to the default configs in the kernel tree.
That's fine.

>>
>> How much RAM do you have ? Could check the totals in meminfo ?
> 
> Our system (and QEMU model) has 2GiB.

ah. you changed the default. Here is why we didn't merge the AST2600
with 2GB :

   https://lists.nongnu.org/archive/html/qemu-devel/2019-10/msg03903.html

> 
> Boot with `vmalloc=500M`:
> # cat /proc/meminfo
> MemTotal:        1984880 kB
> MemFree:         1860700 kB
> MemAvailable:    1882116 kB

That's the reason. The vmalloc area size is in direct relation with
the available RAM. See the ARM memory layout :

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/memory.rst

May be we should consider 64-bit kernel one day.

Thanks,

C.
