Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C64C5E5E
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 20:13:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Cpj4qwHz30Mf
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 06:13:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110;
 helo=1.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 600 seconds by postgrey-1.36 at boromir;
 Mon, 28 Feb 2022 06:13:17 AEDT
Received: from 1.mo548.mail-out.ovh.net (1.mo548.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6CpP4lxGz30LR
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 06:13:15 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D949E2111B;
 Sun, 27 Feb 2022 18:53:38 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 27 Feb
 2022 19:53:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00103d5f138-88c7-41a7-89b4-9bffbb7b8c63,
 3C1F276A0880C75D3AA0293DFE804433F7F83470) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
Date: Sun, 27 Feb 2022 19:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0ea4f13b-e906-48b3-8f17-9394af1ef888
X-Ovh-Tracer-Id: 14461621356491017184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -89
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleekgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdluddumdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefieetkeehgeffieffffejkefhudegveevheejvdduffefheegiefgveffkeduieenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidpkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrhigrnhgptghhvghnsegrshhpvggvughtvggthhdrtghomh
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/25/22 06:29, Joel Stanley wrote:
> Cedric has authored a new drive for the SPI NOR devices on the ASPEED
> SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
> subsystem, which should mean it can go upstream.
> 
> This is great news, as our current driver is half upstream, half in
> the openbmc tree, due to some issues getting it merged as part of the
> spi-nor subsystem.
> 
> It would be great to have testing. I've created a commit that patches
> in support to whatever kernel tree you're using. Hopefully this makes
> it easier to test atop your internal branches:
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
> 
> Cherry pick this commit into your tree, and see how it goes, and report back.
> 
> I plan to switch the openbmc tree to this driver when we next rebase
> the kernel. We could also backport it to dev-5.15 as an option.
> 
> You can direct testing results to this thread, or reply directly to
> the upstream thread:
> 
> https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/

or grab the v2 from :

   https://github.com/legoater/linux/tree/openbmc-5.15

I have addressed the comments on driver bind/unbind.

Thanks,

C.

> 
> Cheers,
> 
> Joel
> 
> ---------- Forwarded message ---------
> From: Cédric Le Goater <clg@kaod.org>
> Date: Mon, 14 Feb 2022 at 09:42
> Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
> To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> <linux-kernel@vger.kernel.org>, Cédric Le Goater <clg@kaod.org>
> 
> 
> Hi,
> 
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
> 
>   * AST2600 Firmware SPI Memory Controller (FMC)
>   * AST2600 SPI Flash Controller (SPI1 and SPI2)
>   * AST2500 Firmware SPI Memory Controller (FMC)
>   * AST2500 SPI Flash Controller (SPI1 and SPI2)
>   * AST2400 New Static Memory Controller (also referred as FMC)
>   * AST2400 SPI Flash Controller (SPI)
> 
> It is based on the current OpenBMC kernel driver [1], using directly
> the MTD SPI-NOR interface and on a patchset [2] previously proposed
> adding support for the AST2600 only. This driver takes a slightly
> different approach to cover all 6 controllers.
> 
> It does not make use of the controller register disabling Address and
> Data byte lanes because is not available on the AST2400 SoC. We could
> introduce a specific handler for new features available on recent SoCs
> if needed. As there is not much difference on performance, the driver
> chooses the common denominator: "User mode" which has been heavily
> tested in [1]. "User mode" is also used as a fall back method when
> flash device mapping window is too small.
> 
> Problems to address with spi-mem were the configuration of the mapping
> windows and the calibration of the read timings. The driver handles
> them in the direct mapping handler when some knowledge on the size of
> the flash device is know. It is not perfect but not incorrect either.
> The algorithm is one from [1] because it doesn't require the DMA
> registers which are not available on all controllers.
> 
> Direct mapping for writes is not supported (yet). I have seen some
> corruption with writes and I preferred to use the safer and proven
> method of the initial driver [1]. We can improve that later.
> 
> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> didn't have the expected results. Therefore it is not activated yet.
> This needs more tests.
> 
> The series does not remove the current Aspeed SMC driver but prepares
> ground for its removal by changing its CONFIG option. This last step
> can be addressed as a followup when the new driver using the spi-mem
> interface has been sufficiently exposed.
> 
> Tested on:
> 
>   * OpenPOWER Palmetto (AST2400)
>   * Evaluation board (AST2500)
>   * OpenPOWER Witherspoon (AST2500)
>   * Evaluation board (AST2600 A0)
>   * Rainier board (AST2600)
> 
> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
> 
> Thanks,
> 
> C.
> 
> Cédric Le Goater (10):
>    mtd: spi-nor: aspeed: Rename Kconfig option
>    dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>    spi: spi-mem: Add driver for Aspeed SMC controllers
>    spi: aspeed: Add support for direct mapping
>    spi: aspeed: Adjust direct mapping to device size
>    spi: aspeed: Workaround AST2500 limitations
>    spi: aspeed: Add support for the AST2400 SPI controller
>    spi: aspeed: Calibrate read timings
>    ARM: dts: aspeed: Enable Dual SPI RX transfers
>    spi: aspeed: Activate new spi-mem driver
> 
>   drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
>   .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
>   arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
>   arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
>   arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
>   drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>   drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>   drivers/spi/Kconfig                           |   11 +
>   drivers/spi/Makefile                          |    1 +
>   9 files changed, 1369 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/spi/spi-aspeed-smc.c
>   create mode 100644
> Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> 
> --
> 2.34.1

