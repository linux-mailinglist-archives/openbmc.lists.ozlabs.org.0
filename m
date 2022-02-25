Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8604C3DDE
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 06:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4df21J0kz3bVx
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 16:30:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=I2JdEibF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=I2JdEibF; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4ddf0jWDz3bPD
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 16:30:11 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id w1so1563506qtj.2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 21:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jMda136bjEZ6ZdERtwwQQJ49SLOld/Q3/eYRpbNxCyQ=;
 b=I2JdEibFWUgFnHR5MCy8yAGjGdAdq2oRYUieFL6dEH3VWby/kfiGGm4r7+zOBPX5wO
 y33G5Y7fyneld1NyXW2y2FRLMJXIohQMPXBPEjVqVuOSHBAP1cHZ6emGh8SMJAI2xjJF
 9fLUbZWYcj2Ax1U7yFvEVfpVQIa4at/RA9gNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jMda136bjEZ6ZdERtwwQQJ49SLOld/Q3/eYRpbNxCyQ=;
 b=nWuhfQK4Tw3534K7J6ujXDSdj0VlJVDpUOZx1ATz8DyLiM6mmGUFCWY5JOiHv27nRD
 pA1I7mXMHt6mMOpSMVnT9KstJ1ZJR2QYUrLKwklaa0q68gRsPjBmgmv6qXzIHG+XPLA0
 yPzJkeMjeXIV+QnUP3GOVhgvm/U5UBhn+WCCO+n0PZJXBa2/b76hMLVoD8i7KNhQnJyN
 U1tT+2lZ1T8YO+IvViTUYysGun1p7v5iuH3HiWJEdSBL5SYPYZyJHHzasdb3LZ82wyjv
 2tWfB9gUbEeFqtikaZGs+XC3kh3RdEnfAafELiR81/f8EXzolSzD5H14s+/tkujr4v2v
 EIwQ==
X-Gm-Message-State: AOAM533j3gc+tvL3AL9dT7DZWtXFebBAqiyTbbmdTnk1HpC3fxs+/Zc1
 NUtW7MHv0YZ4cVdePVvF8KxP1itKiQJYhvqcrfMX0OAXBH+3JA==
X-Google-Smtp-Source: ABdhPJyJal72mMV7gfpn6xFo5014Fi1MM7/HnNz3K5Atx24DdELvBNalbY+DugKTw4vm1Xn0jyv2y0504/A0CRSqBlg=
X-Received: by 2002:a05:622a:111:b0:2dd:dc84:4d42 with SMTP id
 u17-20020a05622a011100b002dddc844d42mr5461487qtw.494.1645767009395; Thu, 24
 Feb 2022 21:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 05:29:58 +0000
Message-ID: <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
Subject: Call for testing: spi-mem driver for Aspeed SMC controllers
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Cedric has authored a new drive for the SPI NOR devices on the ASPEED
SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
subsystem, which should mean it can go upstream.

This is great news, as our current driver is half upstream, half in
the openbmc tree, due to some issues getting it merged as part of the
spi-nor subsystem.

It would be great to have testing. I've created a commit that patches
in support to whatever kernel tree you're using. Hopefully this makes
it easier to test atop your internal branches:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551

Cherry pick this commit into your tree, and see how it goes, and report bac=
k.

I plan to switch the openbmc tree to this driver when we next rebase
the kernel. We could also backport it to dev-5.15 as an option.

You can direct testing results to this thread, or reply directly to
the upstream thread:

https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/

Cheers,

Joel

---------- Forwarded message ---------
From: C=C3=A9dric Le Goater <clg@kaod.org>
Date: Mon, 14 Feb 2022 at 09:42
Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
<tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
<linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
<chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
<linux-kernel@vger.kernel.org>, C=C3=A9dric Le Goater <clg@kaod.org>


Hi,

This series adds a new SPI driver using the spi-mem interface for the
Aspeed static memory controllers of the AST2600, AST2500 and AST2400
SoCs.

 * AST2600 Firmware SPI Memory Controller (FMC)
 * AST2600 SPI Flash Controller (SPI1 and SPI2)
 * AST2500 Firmware SPI Memory Controller (FMC)
 * AST2500 SPI Flash Controller (SPI1 and SPI2)
 * AST2400 New Static Memory Controller (also referred as FMC)
 * AST2400 SPI Flash Controller (SPI)

It is based on the current OpenBMC kernel driver [1], using directly
the MTD SPI-NOR interface and on a patchset [2] previously proposed
adding support for the AST2600 only. This driver takes a slightly
different approach to cover all 6 controllers.

It does not make use of the controller register disabling Address and
Data byte lanes because is not available on the AST2400 SoC. We could
introduce a specific handler for new features available on recent SoCs
if needed. As there is not much difference on performance, the driver
chooses the common denominator: "User mode" which has been heavily
tested in [1]. "User mode" is also used as a fall back method when
flash device mapping window is too small.

Problems to address with spi-mem were the configuration of the mapping
windows and the calibration of the read timings. The driver handles
them in the direct mapping handler when some knowledge on the size of
the flash device is know. It is not perfect but not incorrect either.
The algorithm is one from [1] because it doesn't require the DMA
registers which are not available on all controllers.

Direct mapping for writes is not supported (yet). I have seen some
corruption with writes and I preferred to use the safer and proven
method of the initial driver [1]. We can improve that later.

The driver supports Quad SPI RX transfers on the AST2600 SoC but it
didn't have the expected results. Therefore it is not activated yet.
This needs more tests.

The series does not remove the current Aspeed SMC driver but prepares
ground for its removal by changing its CONFIG option. This last step
can be addressed as a followup when the new driver using the spi-mem
interface has been sufficiently exposed.

Tested on:

 * OpenPOWER Palmetto (AST2400)
 * Evaluation board (AST2500)
 * OpenPOWER Witherspoon (AST2500)
 * Evaluation board (AST2600 A0)
 * Rainier board (AST2600)

[1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/cont=
rollers/aspeed-smc.c
[2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D212394

Thanks,

C.

C=C3=A9dric Le Goater (10):
  mtd: spi-nor: aspeed: Rename Kconfig option
  dt-bindings: spi: Add Aspeed SMC controllers device tree binding
  spi: spi-mem: Add driver for Aspeed SMC controllers
  spi: aspeed: Add support for direct mapping
  spi: aspeed: Adjust direct mapping to device size
  spi: aspeed: Workaround AST2500 limitations
  spi: aspeed: Add support for the AST2400 SPI controller
  spi: aspeed: Calibrate read timings
  ARM: dts: aspeed: Enable Dual SPI RX transfers
  spi: aspeed: Activate new spi-mem driver

 drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
 arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
 drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
 drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 9 files changed, 1369 insertions(+), 3 deletions(-)
 create mode 100644 drivers/spi/spi-aspeed-smc.c
 create mode 100644
Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml

--
2.34.1
