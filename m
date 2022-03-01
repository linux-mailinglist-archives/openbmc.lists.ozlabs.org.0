Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498154C889B
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 10:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7CP02Rmvz3bsH
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 20:58:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gCa/htxH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e44;
 helo=mail-vs1-xe44.google.com; envelope-from=wangzq.jn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gCa/htxH; dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7CNY4dHlz3bp9
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 20:57:48 +1100 (AEDT)
Received: by mail-vs1-xe44.google.com with SMTP id g21so15940652vsp.6
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l5DnHTN0So1OKBdjbok1M8vcqpeFj0ZdFdB4zfw3hPs=;
 b=gCa/htxH1hfaG1VNP5USg03ifPAMZoqgQYnD5F4ZcGaieRTMEq1XI9FlvMkOOLreAb
 o2VB6Kz2Mopr/iXSiSXwenOZTARQfOreipAVEZvbZY5Ie0aQozcXejyb01muJadvExkh
 BvnUDNEhYHLpvb2lvBhHSRkfiz570V/gKg6eF8jkrqAfP92liLWpxtZBTsFP65T1Mf6X
 R3KE5b1T+wWCczOJgQh1XWGp32huVvRbK9MV8dANIN1ONxQCqBqv/jkIJEJefUxGhe8N
 XafhNBqGGyl2tirZv1LLAEWizOjYWxikLgQb8htyogo031/s9v8W/np+T/TI/U+Jv9Tf
 92uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l5DnHTN0So1OKBdjbok1M8vcqpeFj0ZdFdB4zfw3hPs=;
 b=ojGHZ9zQ+mLzwLQudjIN1uUhGViV2xBCXddiSJvx7GVHUggE5TH8EfLXSGSWlwoNeB
 P48M9Jm4CjSu1hmw1qtfjp5afC2pRU5DKLGanTQx63LLrXepd2orOEqd+lUdWWpoeB/O
 kT2K0GUGaOSIPHZrIcdSgTMhOY7kKG6DF3Da3qNR6SYfy+LeEKLMNfpUPBGo6rm2cPyl
 7zVRiooYBPFk2raUykINTzXd3LwpaeN7PFstTuIEF70rZSETDGz2loxw5n/qPqNDbM3S
 HO8rz7GQvJN6iMOVNlZJfZZpIgsDlkw2yl5+OkWgR4fjH9DCt/Zp9OwSj+8oD/YmAmfI
 5OeQ==
X-Gm-Message-State: AOAM531IIM+FF/tOb6MnNGja9VL/UH6arOFH4sTBpbm35NqrIoK0Mj+9
 qSV1EWWkh1Lj/PHTnJo8D3WiDdR8A/OEY+LU6nQ=
X-Google-Smtp-Source: ABdhPJwB63V1sWRU2ZxHUkMZALYow7GXWxL0iUIZ7sAF6H4cM7x02VuKZt816GUGDRsoFGqCKlawV9T+Cfegc/0gL3E=
X-Received: by 2002:a05:6102:374f:b0:31c:4c67:28b7 with SMTP id
 u15-20020a056102374f00b0031c4c6728b7mr9944911vst.31.1646128664368; Tue, 01
 Mar 2022 01:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
In-Reply-To: <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Tue, 1 Mar 2022 17:57:32 +0800
Message-ID: <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: Joel Stanley <joel@jms.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> =E4=BA=8E2022=E5=B9=B42=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 13:30=E5=86=99=E9=81=93=EF=BC=9A
>
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

tested on a fp5280g2 (ast2500), it looks okay.

root@fp5280g2:~# dmesg |grep spi
[    1.594677] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
[    1.728194] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641=
]
[    1.992733] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
[    2.211741] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741=
]
[    3.175017] SPI driver bmp280 has no spi_device_id for bosch,bmp085



>
> Cherry pick this commit into your tree, and see how it goes, and report b=
ack.
>
> I plan to switch the openbmc tree to this driver when we next rebase
> the kernel. We could also backport it to dev-5.15 as an option.
>
> You can direct testing results to this thread, or reply directly to
> the upstream thread:
>
> https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
>
> Cheers,
>
> Joel
>
> ---------- Forwarded message ---------
> From: C=C3=A9dric Le Goater <clg@kaod.org>
> Date: Mon, 14 Feb 2022 at 09:42
> Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controller=
s
> To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> <linux-kernel@vger.kernel.org>, C=C3=A9dric Le Goater <clg@kaod.org>
>
>
> Hi,
>
> This series adds a new SPI driver using the spi-mem interface for the
> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> SoCs.
>
>  * AST2600 Firmware SPI Memory Controller (FMC)
>  * AST2600 SPI Flash Controller (SPI1 and SPI2)
>  * AST2500 Firmware SPI Memory Controller (FMC)
>  * AST2500 SPI Flash Controller (SPI1 and SPI2)
>  * AST2400 New Static Memory Controller (also referred as FMC)
>  * AST2400 SPI Flash Controller (SPI)
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
>  * OpenPOWER Palmetto (AST2400)
>  * Evaluation board (AST2500)
>  * OpenPOWER Witherspoon (AST2500)
>  * Evaluation board (AST2600 A0)
>  * Rainier board (AST2600)
>
> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/co=
ntrollers/aspeed-smc.c
> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D2123=
94
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (10):
>   mtd: spi-nor: aspeed: Rename Kconfig option
>   dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>   spi: spi-mem: Add driver for Aspeed SMC controllers
>   spi: aspeed: Add support for direct mapping
>   spi: aspeed: Adjust direct mapping to device size
>   spi: aspeed: Workaround AST2500 limitations
>   spi: aspeed: Add support for the AST2400 SPI controller
>   spi: aspeed: Calibrate read timings
>   ARM: dts: aspeed: Enable Dual SPI RX transfers
>   spi: aspeed: Activate new spi-mem driver
>
>  drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
>  arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
>  drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>  drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>  drivers/spi/Kconfig                           |   11 +
>  drivers/spi/Makefile                          |    1 +
>  9 files changed, 1369 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/spi/spi-aspeed-smc.c
>  create mode 100644
> Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>
> --
> 2.34.1
