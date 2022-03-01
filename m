Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798B4C8937
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 11:26:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7D130Vjjz3bsv
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 21:25:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7D0m575Dz3bZR
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 21:25:41 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 77D702033E;
 Tue,  1 Mar 2022 10:25:36 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 11:25:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0025104bb99-df5a-4fb3-9020-a2a9e2a8b7bc,
 24806437EA66095D5A0A0E3C988328111B43E697) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b99ecbd2-caa4-c7b3-518c-45477e062d53@kaod.org>
Date: Tue, 1 Mar 2022 11:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: John Wang <wangzq.jn@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 508af423-4f92-4e85-8e9a-209fdd2070b1
X-Ovh-Tracer-Id: 17627088943047936931
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludejmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgledtteeutdfhgfellefhgedtheduhffgledtteefjeegudehieffvdeukedufeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrhigrnhgptghhvghnsegrshhpvggvughtvggthhdrtghomh
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/22 10:57, John Wang wrote:
> Joel Stanley <joel@jms.id.au> 于2022年2月25日周五 13:30写道：
>>
>> Cedric has authored a new drive for the SPI NOR devices on the ASPEED
>> SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
>> subsystem, which should mean it can go upstream.
>>
>> This is great news, as our current driver is half upstream, half in
>> the openbmc tree, due to some issues getting it merged as part of the
>> spi-nor subsystem.
>>
>> It would be great to have testing. I've created a commit that patches
>> in support to whatever kernel tree you're using. Hopefully this makes
>> it easier to test atop your internal branches:
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
> 
> tested on a fp5280g2 (ast2500), it looks okay.

Thanks !
  
> root@fp5280g2:~# dmesg |grep spi
> [    1.594677] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
> [    1.728194] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> [    1.992733] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
> [    2.211741] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741]

Training was done on both controllers. It's a little faster on SPI1 because
the clock is set at KCLK/2 whereas FMC uses HCLK/4. Dual IO 4B read command
is the default setting for both.

I test writing with :

     dd if=/dev/random of=$tmp bs=1M count=$count
     md5sum $tmp
     
     time flashcp -v $tmp $mtd  # ~3min for 32MB
     time md5sum $mtd # ~3s for 32MB

but not on /dev/mtd0 !

C.

> [    3.175017] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> 
> 
> 
>>
>> Cherry pick this commit into your tree, and see how it goes, and report back.
>>
>> I plan to switch the openbmc tree to this driver when we next rebase
>> the kernel. We could also backport it to dev-5.15 as an option.
>>
>> You can direct testing results to this thread, or reply directly to
>> the upstream thread:
>>
>> https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
>>
>> Cheers,
>>
>> Joel
>>
>> ---------- Forwarded message ---------
>> From: Cédric Le Goater <clg@kaod.org>
>> Date: Mon, 14 Feb 2022 at 09:42
>> Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
>> To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
>> Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
>> <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
>> Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
>> <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
>> <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
>> Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
>> <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
>> Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
>> <linux-kernel@vger.kernel.org>, Cédric Le Goater <clg@kaod.org>
>>
>>
>> Hi,
>>
>> This series adds a new SPI driver using the spi-mem interface for the
>> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
>> SoCs.
>>
>>   * AST2600 Firmware SPI Memory Controller (FMC)
>>   * AST2600 SPI Flash Controller (SPI1 and SPI2)
>>   * AST2500 Firmware SPI Memory Controller (FMC)
>>   * AST2500 SPI Flash Controller (SPI1 and SPI2)
>>   * AST2400 New Static Memory Controller (also referred as FMC)
>>   * AST2400 SPI Flash Controller (SPI)
>>
>> It is based on the current OpenBMC kernel driver [1], using directly
>> the MTD SPI-NOR interface and on a patchset [2] previously proposed
>> adding support for the AST2600 only. This driver takes a slightly
>> different approach to cover all 6 controllers.
>>
>> It does not make use of the controller register disabling Address and
>> Data byte lanes because is not available on the AST2400 SoC. We could
>> introduce a specific handler for new features available on recent SoCs
>> if needed. As there is not much difference on performance, the driver
>> chooses the common denominator: "User mode" which has been heavily
>> tested in [1]. "User mode" is also used as a fall back method when
>> flash device mapping window is too small.
>>
>> Problems to address with spi-mem were the configuration of the mapping
>> windows and the calibration of the read timings. The driver handles
>> them in the direct mapping handler when some knowledge on the size of
>> the flash device is know. It is not perfect but not incorrect either.
>> The algorithm is one from [1] because it doesn't require the DMA
>> registers which are not available on all controllers.
>>
>> Direct mapping for writes is not supported (yet). I have seen some
>> corruption with writes and I preferred to use the safer and proven
>> method of the initial driver [1]. We can improve that later.
>>
>> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
>> didn't have the expected results. Therefore it is not activated yet.
>> This needs more tests.
>>
>> The series does not remove the current Aspeed SMC driver but prepares
>> ground for its removal by changing its CONFIG option. This last step
>> can be addressed as a followup when the new driver using the spi-mem
>> interface has been sufficiently exposed.
>>
>> Tested on:
>>
>>   * OpenPOWER Palmetto (AST2400)
>>   * Evaluation board (AST2500)
>>   * OpenPOWER Witherspoon (AST2500)
>>   * Evaluation board (AST2600 A0)
>>   * Rainier board (AST2600)
>>
>> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
>>
>> Thanks,
>>
>> C.
>>
>> Cédric Le Goater (10):
>>    mtd: spi-nor: aspeed: Rename Kconfig option
>>    dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>>    spi: spi-mem: Add driver for Aspeed SMC controllers
>>    spi: aspeed: Add support for direct mapping
>>    spi: aspeed: Adjust direct mapping to device size
>>    spi: aspeed: Workaround AST2500 limitations
>>    spi: aspeed: Add support for the AST2400 SPI controller
>>    spi: aspeed: Calibrate read timings
>>    ARM: dts: aspeed: Enable Dual SPI RX transfers
>>    spi: aspeed: Activate new spi-mem driver
>>
>>   drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
>>   .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
>>   arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
>>   arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
>>   arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
>>   drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>>   drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>>   drivers/spi/Kconfig                           |   11 +
>>   drivers/spi/Makefile                          |    1 +
>>   9 files changed, 1369 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/spi/spi-aspeed-smc.c
>>   create mode 100644
>> Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>>
>> --
>> 2.34.1

