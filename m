Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD54CDBCC
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 19:08:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K9G756Gp5z30KV
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 05:08:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K9G6g0Kjlz30BP;
 Sat,  5 Mar 2022 05:07:52 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BF24EE63D09A;
 Fri,  4 Mar 2022 19:00:27 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 19:00:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006139e8d0e-d66f-4ecb-8c8a-e17875113513,
 454269BBD7D092EADEDBDC9145CF0558877B405D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <6ed257f7-ae87-e2fe-26ed-9db300f5ebcc@kaod.org>
Date: Fri, 4 Mar 2022 19:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Potin Lai <potin.lai@quantatw.com>, Joel Stanley <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
References: <20220304170757.16924-1-potin.lai@quantatw.com>
 <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
In-Reply-To: <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bf6ce367-fa20-4368-8790-6e7d991b6005
X-Ovh-Tracer-Id: 6033416128464915363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgvefhudektedtueefieeujeekveegheetgfdvvdeguddvjeegtefghedvuedvudenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgrthhrihgtkhesshhtfigtgidrgiihii
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

On 3/4/22 18:29, Cédric Le Goater wrote:
> Hello Potin,
> 
> On 3/4/22 18:07, Potin Lai wrote:
>> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
>> address offset is set to the acctual offset - 1MB. If the flash only has
>> 1MB, the end address will has same value as start address, which will
>> causing unexpected errors.
> 
> Yes. That's probably true.
> 
>> This patch set the decoding size to at least 2MB to avoid decoding errors.
>>
>> Tested:
>> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
> 
> Could you send all the "aspeed-smc" logs please ? I would like to
> reproduce on QEMU. You can use these machine options :
> 
>    fmc-model=<string>     - Change the FMC Flash model
>    spi-model=<string>     - Change the SPI Flash model
> 
> to change the default flash device models and see how the driver reacts.
> Add -trace aspeed_smc_flash_set_segment to see how the QEMU model is
> configured.
> 
>> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
>> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
>> root@bletchley:~# devmem 0x1e631030
>> 0x00100000
> 
> I thought devmem was banned :)
> 
> We could expose the main FMC/SPI registers under sysfs or debugfs.
> The segment registers and the timing registers would be nice to
> have. I can revive some experimental patch I did a few years ago.
> 
> If you have some time, could you please try the new driver based
> on spi-mem ?
> 
> v3 is pushed here :
> 
>    https://github.com/legoater/linux/commits/openbmc-5.15
> 
> The patch looks correct but we also want to fix the new driver and
> I have reworked the window setting part. It should be less fragile.
> aspeed_spi_chip_adjust_window() still needs to handle HW quirks
> though.

Using a mx25l1606e on SPI1, here is what we get :

$ qemu-system-arm -M ast2600-evb,spi-model=mx25l1606e ....

[    1.069297] spi-aspeed-smc 1e630000.spi: registered master spi1
[    1.069863] spi-aspeed-smc 1e630000.spi: CE0 default window [ 0x30000000 - 0x37ffffff ] 128MB
[    1.070161] spi-aspeed-smc 1e630000.spi: CE0 setup done
[    1.070359] spi spi1.0: setup mode 0, 8 bits/w, 100000000 Hz max --> 0
[    1.071245] spi-aspeed-smc 1e630000.spi: CE0 read OP 0x9f mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x6
[    1.071747] spi-nor spi1.0: mx25l1606e (2048 Kbytes)
aspeed_smc_flash_set_segment CS0 segreg=0x100000 [ 0x30000000 - 0x30200000 ]
[    1.072253] spi-aspeed-smc 1e630000.spi: CE0 new window [ 0x30000000 - 0x301fffff ] 2MB
aspeed_smc_flash_set_segment CS1 segreg=0x7f00020 [ 0x30200000 - 0x38000000 ]
[    1.072833] spi-aspeed-smc 1e630000.spi: CE1 new window [ 0x30200000 - 0x37ffffff ] 126MB
[    1.073162] spi-aspeed-smc 1e630000.spi: calculate timing compensation - AHB freq: 200 MHz
[    1.079692] spi-aspeed-smc 1e630000.spi: Trying HCLK/5 [000b0d41] ...
[    1.143327] spi-aspeed-smc 1e630000.spi:   * [00000000] 0 HCLK delay, DI delay none : PASS
[    1.143642] spi-aspeed-smc 1e630000.spi: Trying HCLK/4 [000b0641] ...
[    1.207062] spi-aspeed-smc 1e630000.spi:   * [00000000] 0 HCLK delay, DI delay none : PASS
[    1.207404] spi-aspeed-smc 1e630000.spi: Trying HCLK/3 [000b0e41] ...
[    1.273171] spi-aspeed-smc 1e630000.spi:   * [00000000] 0 HCLK delay, DI delay none : PASS
[    1.273512] spi-aspeed-smc 1e630000.spi: Trying HCLK/2 [000b0741] ...
[    1.341648] spi-aspeed-smc 1e630000.spi:   * [00000000] 0 HCLK delay, DI delay none : PASS
[    1.341942] spi-aspeed-smc 1e630000.spi: Found good read timings at HCLK/2
[    1.342190] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:1 [0x000b0741]
[    1.363662] spi-aspeed-smc 1e630000.spi: registered child spi1.0

The new spi-mem driver behaves better (on QEMU).

Thanks,

C.
