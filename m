Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B34D1B1F
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 15:58:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCdk22zstz3bZp
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 01:58:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.222;
 helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 29594 seconds by postgrey-1.36 at boromir;
 Wed, 09 Mar 2022 01:58:03 AEDT
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net
 [188.165.49.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCdjl5sLhz30hl
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 01:58:00 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 424E023F27;
 Tue,  8 Mar 2022 14:57:57 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 15:57:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059477808d-1176-44b6-b2a2-6fd77499a681,
 03E3C14593CA27F822F61C3AD678835CDD198C87) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6be0165e-2a1a-4399-4c7a-b2c15b02681f@kaod.org>
Date: Tue, 8 Mar 2022 15:57:56 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAGm54UHZGhaBYqpaquaqGMFH16d1JqSt=PGnXhsd8TCD8-B92w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 318c4567-d5ec-4253-8fd1-53258bd420e9
X-Ovh-Tracer-Id: 7995296715190340576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihrghnpggthhgvnhesrghsphgvvgguthgvtghhrdgtohhm
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/8/22 10:47, Lei Yu wrote:
> On Tue, Mar 8, 2022 at 5:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Hello Lei,
>>
>> On 3/8/22 02:53, Lei Yu wrote:
>>> On Mon, Mar 7, 2022 at 9:06 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> Hello,
>>>>
>>>>     On 3/7/22 10:41, Lei Yu wrote:
>>>>> We hit some issues with the new driver, and here is some detailed info.
>>>>>
>>>>> * Our system (not yet upstreamed) uses `mx66l51235f` as the FMC SPI
>>>>> flash, and we created a QEMU model.
>>>>>
>>>>> * When the dts is like "default":
>>>>>     &fmc {
>>>>>            pinctrl-names = "default";
>>>>>            status = "okay";
>>>>>            flash@0 {
>>>>>                    status = "okay";
>>>>>                    m25p,fast-read;
>>>>>                    label = "bmc";
>>>>>                    spi-max-frequency = <50000000>;
>>>>>     #include "openbmc-flash-layout-64.dtsi"
>>>>>            };
>>>>>     };
>>>>> 1. Run the image in ast2600-evb QEMU, it boots fine;
>>>>> 2. We have a model (g220b) in QEMU that uses mx66l51235f as the fmc
>>>>> SPI (`amc->fmc_model = "mx66l51235f";`), it boots with below error:
>>>>>     [    1.848286] vmap allocation for size 268439552 failed: use
>>>>> vmalloc=<size> to increase size
>>>>>     [    1.848774] spi-aspeed-smc 1e620000.spi: ioremap failed for
>>>>> resource [mem 0x20000000-0x2fffffff]
>>>>>     [    1.849898] spi-aspeed-smc: probe of 1e620000.spi failed with error -12
>>>>> 3. If I manually add vmalloc to the kernel command line (setenv
>>>>> bootargs 'console=ttyS4,115200n8 root=/dev/ram rw vmalloc=400M'), the
>>>>> above QEMU model boots fine.
>>>>> 4. On the real system, it behaves the same as QEMU, that I need to add
>>>>> `vmalloc=400M` to make it boot OK.
>>>>
>>>> I don't see why. Is that the same kernel version and config ?
>>>>
>>>> May be check the allocations in
>>>>
>>>>      /proc/vmallocinfo
>>>
>>> It shows a large area as below:
>>>
>>>    0xc1d30472-0x406b4a0c 268439552 __devm_ioremap_resource+0x178/0x1f0
>>> phys=0x20000000 ioremap
>>
>> Is CONFIG_VMSPLIT_2G set ?
> 
> Yes, it's enabled in aspeed-g6/defconfig

The OpenBMC tree only has a aspeed_g5_defconfig.

How much RAM do you have ? Could check the totals in meminfo ?

Thanks,

C.

