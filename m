Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93D14C9DF2
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 07:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7l6t4jMYz3bpr
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 17:47:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VUDrXHM/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VUDrXHM/; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7l6V0SsTz30QY
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 17:47:29 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id e2so751318pls.10
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 22:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3q+OoquqkIwygDHxSlW0arDTBci28i1olosd00nuSwA=;
 b=VUDrXHM/9CTQoBT06sYoBHE75iEaRVTgmy1d78d6fvmY84Q5Wv3HeLJUqO95GlqyDg
 JeuwQsiReXX1ejhRgOV77RNuM+rQcIGg/t8HkJSnMBMW8rx+ynDHWufdGY0HClepj8Tp
 aePvqWIZ8Jfv8Mq6Kx665YYRJ2RZ8C24xEX3O9wRoWh0CggNsq7lGCuCTpmJMSQgWzmS
 iWARkH5nPicE8PidxK7nqM4U+YIxaHPXtEvtGQ7pkwGIqOS3sp5tRjgkGNu/UmavmxDR
 8IMj+kdFXo64wWB0cDJz58DA5gPVuDfdas9yahettYWQYvzDZFlpApF9IqVgxC6l5QIK
 QvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3q+OoquqkIwygDHxSlW0arDTBci28i1olosd00nuSwA=;
 b=ueDk1/Jod1uSwXGNIMuETGAbQQJR/QUP3bEI8aJXqPs84WU8ezo8Zn3AfC/FCE1QBt
 1E5rn002WPFp9W6b0sEXNRnLCRWmLrni3m99IH0obg5DOTtCa0Uk2mW1S61OGqP+oe/F
 jDth1Fb1h35hvO7FH5HeSgIhnMBM16PKQdHRgAKFoL2skMKQel8sl1c2qX3s7bAwU6NS
 9CRjaY3IAWttA5a3VppTnHIH/SuEEXfswwAx5epnVhi1qDFCloC3OJC6LM9N57mlXoG5
 Pp3JUm0HYbIA7c8wDPI/2LS+2vQJCBK/qZjT9wGnjZ5CFSEiQFVUC4GoHrcv8ZBc7+SM
 Ee1g==
X-Gm-Message-State: AOAM533lmm/tQnQ0dh4oxGgMQ2zRV+t/fXpuXdr8LZxFZjvjPmDxMBW7
 2HfjubOvCJusM7We6ByLfZFU3ifm68XwnA==
X-Google-Smtp-Source: ABdhPJxYo1veDgJqp5C2tiF5g3X8dH4fLxAGxQmrCRIZ3JW4M7nuXkyNvFUXv2CoBLuSTn0R54NC1w==
X-Received: by 2002:a17:90a:7bc5:b0:1be:eef4:b961 with SMTP id
 d5-20020a17090a7bc500b001beeef4b961mr3751109pjl.29.1646203647417; 
 Tue, 01 Mar 2022 22:47:27 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 16-20020a056a00073000b004dfe2217090sm18987240pfm.200.2022.03.01.22.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 22:47:27 -0800 (PST)
Date: Tue, 1 Mar 2022 22:47:20 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Message-ID: <Yh8S+Jlh5D22iL62@taoren-fedora-PC23YAB4>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
 <Yh8JIGpm4ZE1OXzl@taoren-fedora-PC23YAB4>
 <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
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
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Cedric,

Sure. Let me make the changes and will share you the results tomorrow.


Cheers,

Tao

On Wed, Mar 02, 2022 at 07:23:15AM +0100, Cédric Le Goater wrote:
> Hello Tao,
> 
> On 3/2/22 07:05, Tao Ren wrote:
> > Hi Cedric,
> > 
> > I tested v2 on wedge100 (ast2400) and cmm (ast2500). I don't see any
> > functional failures except below warning on ast2400.
> 
> Thanks for the tests
> 
> > Is it something we should worry about?
> > 
> > > spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> 
> 
> This means that the training failed for all HCLK settings. We never had
> an AST2400 board with a second device on the FMC controller but we noticed
> that any freq setting above 50MHz was unstable.
> 
> Also, aspeed-g4.dtsi does not have any "spi-max-frequency" for flash@1.
> This needs an update.
> 
> > The v2 patch series (10 patches) were applied to linux stable 5.15.25,
> > and below are the outputs on wedge100 (ast2400):
> > 
> > root@wedge100-bmc:~# dmesg | grep -i spi
> > [   11.479736] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
> > [   11.704313] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> > [   11.785842] 5 fixed-partitions partitions found on MTD device spi0.0
> > [   11.862033] Creating 5 MTD partitions on "spi0.0":
> > [   13.039009] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> > [   13.107056] spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> > [   13.190551] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0041]
> > [   13.271959] 1 fixed-partitions partitions found on MTD device spi0.1
> > [   13.348097] Creating 1 MTD partitions on "spi0.1":
> 
> Curious. The device seems alive and very slow.
> 
> Could you please add "dyndbg="file drivers/spi/* +p;" to the bootargs
> and reboot ?
> 
> 
> > [   28.169886] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> > root@wedge100-bmc:/tmp# cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00060000 00010000 "u-boot"
> > mtd1: 00020000 00010000 "env"
> > mtd2: 01b80000 00010000 "fit"
> > mtd3: 00400000 00010000 "data0"
> > mtd4: 02000000 00010000 "flash0"
> > mtd5: 02000000 00010000 "flash1"
> > root@wedge100-bmc:/tmp# ls -l flash-wedge100
> > -rw-r--r--    1 root     root      22867574 Mar  1 20:49 flash-wedge100
> > root@wedge100-bmc:/tmp# time flashcp flash-wedge100 /dev/mtd4
> > 
> > real    2m22.860s
> > user    0m0.478s
> > sys     2m10.647s
> > root@wedge100-bmc:/tmp# ls -l flash-wedge100.v2021.13.1
> > -rw-r--r--    1 root     root      19743390 Mar  1 10:10 flash-wedge100.v2021.13.1
> > root@wedge100-bmc:/tmp# time flashcp flash-wedge100.v2021.13.1 /dev/mtd5
> > 
> > real    2m23.144s
> > user    0m0.409s
> > sys     2m10.526s
> 
> Since spi0.1 seems to be really slow, could you run
> 
>   time mdsum /dev/mtd5
> 
> and compare with flash-wedge100.v2021.13.1 ? But please update
> "spi-max-frequency" in the DT first.
> 
> Thanks,
> 
> C.
> 
> > 
> > And here are the outpus on cmm (ast2500):
> > 
> > root@cmm001-oob:~# dmesg | grep -i spi
> > [   15.172879] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
> > [   15.361516] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> > [   15.442978] 5 fixed-partitions partitions found on MTD device spi0.0
> > [   15.519145] Creating 5 MTD partitions on "spi0.0":
> > [   15.883123] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> > [   16.071286] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
> > [   16.152711] 1 fixed-partitions partitions found on MTD device spi0.1
> > [   16.228830] Creating 1 MTD partitions on "spi0.1":
> > [   63.831721] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> > root@cmm001-oob:/tmp# cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00060000 00001000 "u-boot"
> > mtd1: 00020000 00001000 "env"
> > mtd2: 01b80000 00001000 "fit"
> > mtd3: 00400000 00001000 "data0"
> > mtd4: 02000000 00001000 "flash0"
> > mtd5: 02000000 00001000 "flash1"
> > root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm
> > -rw-r--r--    1 root     root      23772278 Mar  1 21:04 /tmp/flash-cmm
> > root@cmm001-oob:/tmp# time flashcp /tmp/flash-cmm /dev/mtd4
> > real    3m37.154s
> > user    0m0.260s
> > sys     3m31.700s
> > root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm.v2021.48.0
> > -rw-r--r--    1 root     root      23723958 Mar  1 21:07 /tmp/flash-cmm.v2021.48.0
> > root@cmm001-oob:/tmp# time flashcp flash-cmm.v2021.48.0 /dev/mtd5
> > 
> > real    3m33.843s
> > user    0m0.458s
> > sys     3m28.216s
> > 
> > 
> > Cheers,
> > 
> > Tao
> > 
> > On Sun, Feb 27, 2022 at 07:53:37PM +0100, Cédric Le Goater wrote:
> > > On 2/25/22 06:29, Joel Stanley wrote:
> > > > Cedric has authored a new drive for the SPI NOR devices on the ASPEED
> > > > SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
> > > > subsystem, which should mean it can go upstream.
> > > > 
> > > > This is great news, as our current driver is half upstream, half in
> > > > the openbmc tree, due to some issues getting it merged as part of the
> > > > spi-nor subsystem.
> > > > 
> > > > It would be great to have testing. I've created a commit that patches
> > > > in support to whatever kernel tree you're using. Hopefully this makes
> > > > it easier to test atop your internal branches:
> > > > 
> > > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
> > > > 
> > > > Cherry pick this commit into your tree, and see how it goes, and report back.
> > > > 
> > > > I plan to switch the openbmc tree to this driver when we next rebase
> > > > the kernel. We could also backport it to dev-5.15 as an option.
> > > > 
> > > > You can direct testing results to this thread, or reply directly to
> > > > the upstream thread:
> > > > 
> > > > https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
> > > 
> > > or grab the v2 from :
> > > 
> > >    https://github.com/legoater/linux/tree/openbmc-5.15
> > > 
> > > I have addressed the comments on driver bind/unbind.
> > > 
> > > Thanks,
> > > 
> > > C.
> > > 
> > > > 
> > > > Cheers,
> > > > 
> > > > Joel
> > > > 
> > > > ---------- Forwarded message ---------
> > > > From: Cédric Le Goater <clg@kaod.org>
> > > > Date: Mon, 14 Feb 2022 at 09:42
> > > > Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
> > > > To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> > > > Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> > > > <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> > > > Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> > > > <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> > > > <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> > > > Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> > > > <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> > > > Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> > > > <linux-kernel@vger.kernel.org>, Cédric Le Goater <clg@kaod.org>
> > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > This series adds a new SPI driver using the spi-mem interface for the
> > > > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > > > SoCs.
> > > > 
> > > >    * AST2600 Firmware SPI Memory Controller (FMC)
> > > >    * AST2600 SPI Flash Controller (SPI1 and SPI2)
> > > >    * AST2500 Firmware SPI Memory Controller (FMC)
> > > >    * AST2500 SPI Flash Controller (SPI1 and SPI2)
> > > >    * AST2400 New Static Memory Controller (also referred as FMC)
> > > >    * AST2400 SPI Flash Controller (SPI)
> > > > 
> > > > It is based on the current OpenBMC kernel driver [1], using directly
> > > > the MTD SPI-NOR interface and on a patchset [2] previously proposed
> > > > adding support for the AST2600 only. This driver takes a slightly
> > > > different approach to cover all 6 controllers.
> > > > 
> > > > It does not make use of the controller register disabling Address and
> > > > Data byte lanes because is not available on the AST2400 SoC. We could
> > > > introduce a specific handler for new features available on recent SoCs
> > > > if needed. As there is not much difference on performance, the driver
> > > > chooses the common denominator: "User mode" which has been heavily
> > > > tested in [1]. "User mode" is also used as a fall back method when
> > > > flash device mapping window is too small.
> > > > 
> > > > Problems to address with spi-mem were the configuration of the mapping
> > > > windows and the calibration of the read timings. The driver handles
> > > > them in the direct mapping handler when some knowledge on the size of
> > > > the flash device is know. It is not perfect but not incorrect either.
> > > > The algorithm is one from [1] because it doesn't require the DMA
> > > > registers which are not available on all controllers.
> > > > 
> > > > Direct mapping for writes is not supported (yet). I have seen some
> > > > corruption with writes and I preferred to use the safer and proven
> > > > method of the initial driver [1]. We can improve that later.
> > > > 
> > > > The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> > > > didn't have the expected results. Therefore it is not activated yet.
> > > > This needs more tests.
> > > > 
> > > > The series does not remove the current Aspeed SMC driver but prepares
> > > > ground for its removal by changing its CONFIG option. This last step
> > > > can be addressed as a followup when the new driver using the spi-mem
> > > > interface has been sufficiently exposed.
> > > > 
> > > > Tested on:
> > > > 
> > > >    * OpenPOWER Palmetto (AST2400)
> > > >    * Evaluation board (AST2500)
> > > >    * OpenPOWER Witherspoon (AST2500)
> > > >    * Evaluation board (AST2600 A0)
> > > >    * Rainier board (AST2600)
> > > > 
> > > > [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> > > > [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
> > > > 
> > > > Thanks,
> > > > 
> > > > C.
> > > > 
> > > > Cédric Le Goater (10):
> > > >     mtd: spi-nor: aspeed: Rename Kconfig option
> > > >     dt-bindings: spi: Add Aspeed SMC controllers device tree binding
> > > >     spi: spi-mem: Add driver for Aspeed SMC controllers
> > > >     spi: aspeed: Add support for direct mapping
> > > >     spi: aspeed: Adjust direct mapping to device size
> > > >     spi: aspeed: Workaround AST2500 limitations
> > > >     spi: aspeed: Add support for the AST2400 SPI controller
> > > >     spi: aspeed: Calibrate read timings
> > > >     ARM: dts: aspeed: Enable Dual SPI RX transfers
> > > >     spi: aspeed: Activate new spi-mem driver
> > > > 
> > > >    drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
> > > >    .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
> > > >    arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
> > > >    arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
> > > >    arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
> > > >    drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
> > > >    drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
> > > >    drivers/spi/Kconfig                           |   11 +
> > > >    drivers/spi/Makefile                          |    1 +
> > > >    9 files changed, 1369 insertions(+), 3 deletions(-)
> > > >    create mode 100644 drivers/spi/spi-aspeed-smc.c
> > > >    create mode 100644
> > > > Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > > 
> > > > --
> > > > 2.34.1
> > > 
> 
