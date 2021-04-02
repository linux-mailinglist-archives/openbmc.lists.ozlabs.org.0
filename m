Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89391352777
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 10:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBYK12RqRz3byn
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 19:35:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.43.201; helo=4.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4751 seconds by postgrey-1.36 at boromir;
 Fri, 02 Apr 2021 19:35:07 AEDT
Received: from 4.mo52.mail-out.ovh.net (4.mo52.mail-out.ovh.net
 [178.33.43.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBYJq3K2lz3bs8
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 19:35:04 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id EE4AC255CC7;
 Fri,  2 Apr 2021 09:15:48 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 09:15:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00688ac810b-28ca-43d8-a263-7d636fa21bc3,
 CED0CE0CC895D647B8CFE0BE9502FE01F599FB05) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [ast2500] aspeed-smc fail with MX25L25635F
To: Shakeeb B K <shakeebbk@gmail.com>
References: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
 <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
 <b17f2faf-4c50-4b68-bbad-6d91a7661c61@kaod.org>
 <CABYu0Wi=Y2B0WsKqYd9Fin=Weow28ex6YzBPnKuoQq4cB26n6Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <da335562-6472-d165-8b91-0fcf6c6873f4@kaod.org>
Date: Fri, 2 Apr 2021 09:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABYu0Wi=Y2B0WsKqYd9Fin=Weow28ex6YzBPnKuoQq4cB26n6Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f48871e-8823-402f-854b-62c7c9244f65
X-Ovh-Tracer-Id: 14169450331311016925
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeihedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevfeelfffffeefudevudekjeeikeffvdeltdffjeeiieetveetjeffvdejteekvdenucffohhmrghinhepmhgrtghrohhnihigrdgtohhmpdhouhhtlhhoohhkrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehshhgrkhgvvggssghksehgmhgrihhlrdgtohhm
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 4/1/21 5:22 PM, Shakeeb B K wrote:
> Hi Cédric,
> 
> The part we are using is *MX25L25635F* https://www.macronix.com/Lists/Datasheet/Attachments/7414/MX25L25635F,%203V,%20256Mb,%20v1.5.pdf <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.macronix.com%2FLists%2FDatasheet%2FAttachments%2F7414%2FMX25L25635F%2C%25203V%2C%2520256Mb%2C%2520v1.5.pdf&data=04%7C01%7Cspasha%40nvidia.com%7C4cf89d8779c84d638c6f08d8ef7d0919%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637522667609971209%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=hYy5Cpi06y4T0DpFb4%2FDeo2nEy5Cn3rf3l%2BEO%2FaPP%2FU%3D&reserved=0>
> 
> Attaching the failed boot log - full_boot.log

This was failing in 5.8 already.

> The patch that fixes the problem - workaround.patch

OK. You are disabling Dual I/O.

> A patch to override read opcode - 001-Debug.patch
> Failing log with post fixup read opcode update - fail_post_fixup.log

Could you check the SPI wiring on the schematics of your AST2500 dgx board ?  

If it is single wired, then I suggest a work around like the one attached.

Thanks,

C. 



From: Cédric Le Goater <clg@kaod.org>
Subject: [PATCH] mtd: spi-nor: aspeed: force single IO on tacoma
Date: Wed, 16 Oct 2019 08:14:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts  |    1 +
 drivers/mtd/spi-nor/controllers/aspeed-smc.c |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

Index: linux-openbmc.git/drivers/mtd/spi-nor/controllers/aspeed-smc.c
===================================================================
--- linux-openbmc.git.orig/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ linux-openbmc.git/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -1265,6 +1265,7 @@ static int aspeed_smc_setup_flash(struct
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
 		struct mtd_info *mtd;
+		struct spi_nor_hwcaps child_hwcaps = hwcaps;
 
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
@@ -1303,6 +1304,9 @@ static int aspeed_smc_setup_flash(struct
 		dev_info(dev, "Using %d MHz SPI frequency\n",
 			 chip->clk_rate / 1000000);
 
+		if (of_property_read_bool(child, "single-io"))
+			child_hwcaps.mask &= ~SNOR_HWCAPS_READ_1_1_2;
+
 		chip->controller = controller;
 		chip->ctl = controller->regs + info->ctl0 + cs * 4;
 		chip->cs = cs;
@@ -1324,7 +1328,7 @@ static int aspeed_smc_setup_flash(struct
 		 * attach when board support is present as determined
 		 * by of property.
 		 */
-		ret = spi_nor_scan(nor, NULL, &hwcaps);
+		ret = spi_nor_scan(nor, NULL, &child_hwcaps);
 		if (ret)
 			break;
 
Index: linux-openbmc.git/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
===================================================================
--- linux-openbmc.git.orig/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ linux-openbmc.git/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -158,6 +158,7 @@
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
+		single-io;
 		label = "pnor";
 		spi-max-frequency = <100000000>;
 	};


