Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA34C8B6E
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 13:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7GZG5nxvz3bfH
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 23:21:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MkjvDPPI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MkjvDPPI; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7GYq0Xlpz30Dt
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 23:21:02 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id z66so12731013qke.10
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 04:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NTUly6sO/kMVdryNkvIr4dc9C/wUsVCfF8el98e9UaA=;
 b=MkjvDPPI8Xp47nkq9MA4Cne+8Wrg9GKCQXAp2GYWKHejT/wAWrvqVs3asUoun6B6MM
 S/zXY4IuWrzXH/BPMcUnnWgzsEYSknKUmOSNJYCNif2+UKvybUM0Sdd/jo+bkTSj/CIl
 KggDVQfu/6DTFXdhP5/551OaQxw7+DhhcbwOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NTUly6sO/kMVdryNkvIr4dc9C/wUsVCfF8el98e9UaA=;
 b=PseUgOA3znNUviVvVvEgLH1h6ss8w1cO2Tcx0rxZToVeprQUlGdYZwQZiQ3wGRJf5U
 eeMTsRtnszwfkS6S9IvHvwkXkiY0FofZqKM4sjO+DewoKfL2O7mlW5Z4hTSqZwT2xzjF
 MtxtoaUdiG+AU/D6TW5iu4UTPGv+Xt0Mbuv9LzE0bgeyD7SpmEuMRTRO7uPQjA3jl193
 Jn0e8PRdoQiLQVRL4Llom+eQYIcvH8qqSGnOLjiMB30JTzT2IkUzzJoy3xq2suPg2qws
 QH8g253392uXWscHulEpqIlenjqhc016O8VWq36rhnWEhgEMWR1zOFrELFDfRGdfG2lz
 uKsQ==
X-Gm-Message-State: AOAM530jSF75pqGHHW5lUujn8+bXF1S8ZyaVnCSbN0UKbOnvEV2vo1Jk
 3diFyIO9QO4BcYWMutbDbLXLb5xlfdxtRb81hfM=
X-Google-Smtp-Source: ABdhPJzTlGQ7JZVuTCZLQ2S+gssMrXRWgiquud6s6YrB8sxQ+awAHuMkFNfMxN9wMjOJ18Tj5eNJlR0w5t6145MfHhk=
X-Received: by 2002:a05:620a:2fc:b0:649:a4e:c430 with SMTP id
 a28-20020a05620a02fc00b006490a4ec430mr13735179qko.347.1646137259343; Tue, 01
 Mar 2022 04:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
In-Reply-To: <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Mar 2022 12:20:46 +0000
Message-ID: <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: John Wang <wangzq.jn@gmail.com>
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

On Tue, 1 Mar 2022 at 09:57, John Wang <wangzq.jn@gmail.com> wrote:
>
> Joel Stanley <joel@jms.id.au> =E4=BA=8E2022=E5=B9=B42=E6=9C=8825=E6=97=A5=
=E5=91=A8=E4=BA=94 13:30=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Cedric has authored a new drive for the SPI NOR devices on the ASPEED
> > SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
> > subsystem, which should mean it can go upstream.
> >
> > This is great news, as our current driver is half upstream, half in
> > the openbmc tree, due to some issues getting it merged as part of the
> > spi-nor subsystem.
> >
> > It would be great to have testing. I've created a commit that patches
> > in support to whatever kernel tree you're using. Hopefully this makes
> > it easier to test atop your internal branches:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
>
> tested on a fp5280g2 (ast2500), it looks okay.
>
> root@fp5280g2:~# dmesg |grep spi
> [    1.594677] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
> [    1.728194] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c06=
41]
> [    1.992733] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
> [    2.211741] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c07=
41]
> [    3.175017] SPI driver bmp280 has no spi_device_id for bosch,bmp085


I've also done some testing, this time on an AST2600A3 EVB.

I tried to enable quad spi by adjust the device tree:

--- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
@@ -157,10 +157,13 @@ &rtc {
 };

 &fmc {
+     pinctrl-names =3D "default";
+     pinctrl-0 =3D <&pinctrl_fwqspid_default>;
        status =3D "okay";
        flash@0 {
                status =3D "okay";
                m25p,fast-read;
+               spi-rx-bus-width =3D <4>;
                label =3D "bmc";
                spi-max-frequency =3D <50000000>;


But the pinctrl setting failed with this error:

[    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid
function FWQSPID in map table

So I removed the quad spi settings and re-tested:

[    0.746796] spi-nor spi0.0: w25q512jv (65536 Kbytes)
[    0.808104] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641=
]
[    0.862687] spi-nor spi0.1: w25q512jv (65536 Kbytes)
[    0.923991] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641=
]
[    0.937639] spi-nor spi1.0: w25q256 (32768 Kbytes)
[    1.062246] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741=
]
[    1.076507] spi-nor spi2.0: gd25q256 (32768 Kbytes)
[    1.173951] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c0741=
]

./mtd-stress.sh mtd5 mtd6 mtd7 mtd8


22+0 records in
22+0 records out
23068672 bytes (23 MB, 22 MiB) copied, 2.40148 s, 9.6 MB/s
14d980eb27e1b5d6554f22a71fc93de6  /tmp/tmp.CWpblJtRYl
Erasing blocks: 352/352 (100%)
Writing data: 22528k/22528k (100%)
Verifying data: 22528k/22528k (100%)

real    2m47.896s
user    0m0.080s
sys    2m46.984s
14d980eb27e1b5d6554f22a71fc93de6  /dev/mtd5

real    0m3.344s
user    0m0.166s
sys    0m3.101s


64+0 records in
64+0 records out
67108864 bytes (67 MB, 64 MiB) copied, 5.38035 s, 12.5 MB/s
5b2a21e51a39f6c4e01c92b3c1b8825c  /tmp/tmp.BnJmqVrHHa
Erasing blocks: 1024/1024 (100%)
Writing data: 65536k/65536k (100%)
Verifying data: 65536k/65536k (100%)

real    7m40.625s
user    0m0.230s
sys    7m39.931s
5b2a21e51a39f6c4e01c92b3c1b8825c  /dev/mtd6

real    0m9.723s
user    0m0.484s
sys    0m9.110s


32+0 records in
32+0 records out
33554432 bytes (34 MB, 32 MiB) copied, 2.4457 s, 13.7 MB/s
a3a343b1d4233e364d332a9b466a0a40  /tmp/tmp.4NsXyq09Km
Erasing blocks: 512/512 (100%)
Writing data: 32768k/32768k (100%)
Verifying data: 32768k/32768k (100%)

real    2m17.560s
user    0m0.100s
sys    2m17.346s
a3a343b1d4233e364d332a9b466a0a40  /dev/mtd7

real    0m3.598s
user    0m0.247s
sys    0m3.313s


32+0 records in
32+0 records out
33554432 bytes (34 MB, 32 MiB) copied, 3.49483 s, 9.6 MB/s
fc65634b925e4655dd9db70972c1ed46  /tmp/tmp.MaXhJaz10l
Erasing blocks: 512/512 (100%)
Writing data: 32768k/32768k (100%)
Verifying data: 32768k/32768k (100%)

real    1m46.311s
user    0m0.130s
sys    1m46.064s
fc65634b925e4655dd9db70972c1ed46  /dev/mtd8

real    0m3.513s
user    0m0.246s
sys    0m3.219s



>
>
>
> >
> > Cherry pick this commit into your tree, and see how it goes, and report=
 back.
> >
> > I plan to switch the openbmc tree to this driver when we next rebase
> > the kernel. We could also backport it to dev-5.15 as an option.
> >
> > You can direct testing results to this thread, or reply directly to
> > the upstream thread:
> >
> > https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
> >
> > Cheers,
> >
> > Joel
> >
> > ---------- Forwarded message ---------
> > From: C=C3=A9dric Le Goater <clg@kaod.org>
> > Date: Mon, 14 Feb 2022 at 09:42
> > Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controll=
ers
> > To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> > Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> > <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> > Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> > <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> > <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> > Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> > <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> > Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> > <linux-kernel@vger.kernel.org>, C=C3=A9dric Le Goater <clg@kaod.org>
> >
> >
> > Hi,
> >
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> >
> >  * AST2600 Firmware SPI Memory Controller (FMC)
> >  * AST2600 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2500 Firmware SPI Memory Controller (FMC)
> >  * AST2500 SPI Flash Controller (SPI1 and SPI2)
> >  * AST2400 New Static Memory Controller (also referred as FMC)
> >  * AST2400 SPI Flash Controller (SPI)
> >
> > It is based on the current OpenBMC kernel driver [1], using directly
> > the MTD SPI-NOR interface and on a patchset [2] previously proposed
> > adding support for the AST2600 only. This driver takes a slightly
> > different approach to cover all 6 controllers.
> >
> > It does not make use of the controller register disabling Address and
> > Data byte lanes because is not available on the AST2400 SoC. We could
> > introduce a specific handler for new features available on recent SoCs
> > if needed. As there is not much difference on performance, the driver
> > chooses the common denominator: "User mode" which has been heavily
> > tested in [1]. "User mode" is also used as a fall back method when
> > flash device mapping window is too small.
> >
> > Problems to address with spi-mem were the configuration of the mapping
> > windows and the calibration of the read timings. The driver handles
> > them in the direct mapping handler when some knowledge on the size of
> > the flash device is know. It is not perfect but not incorrect either.
> > The algorithm is one from [1] because it doesn't require the DMA
> > registers which are not available on all controllers.
> >
> > Direct mapping for writes is not supported (yet). I have seen some
> > corruption with writes and I preferred to use the safer and proven
> > method of the initial driver [1]. We can improve that later.
> >
> > The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> > didn't have the expected results. Therefore it is not activated yet.
> > This needs more tests.
> >
> > The series does not remove the current Aspeed SMC driver but prepares
> > ground for its removal by changing its CONFIG option. This last step
> > can be addressed as a followup when the new driver using the spi-mem
> > interface has been sufficiently exposed.
> >
> > Tested on:
> >
> >  * OpenPOWER Palmetto (AST2400)
> >  * Evaluation board (AST2500)
> >  * OpenPOWER Witherspoon (AST2500)
> >  * Evaluation board (AST2600 A0)
> >  * Rainier board (AST2600)
> >
> > [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/=
controllers/aspeed-smc.c
> > [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=3D21=
2394
> >
> > Thanks,
> >
> > C.
> >
> > C=C3=A9dric Le Goater (10):
> >   mtd: spi-nor: aspeed: Rename Kconfig option
> >   dt-bindings: spi: Add Aspeed SMC controllers device tree binding
> >   spi: spi-mem: Add driver for Aspeed SMC controllers
> >   spi: aspeed: Add support for direct mapping
> >   spi: aspeed: Adjust direct mapping to device size
> >   spi: aspeed: Workaround AST2500 limitations
> >   spi: aspeed: Add support for the AST2400 SPI controller
> >   spi: aspeed: Calibrate read timings
> >   ARM: dts: aspeed: Enable Dual SPI RX transfers
> >   spi: aspeed: Activate new spi-mem driver
> >
> >  drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
> >  .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
> >  arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
> >  arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
> >  arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
> >  drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
> >  drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
> >  drivers/spi/Kconfig                           |   11 +
> >  drivers/spi/Makefile                          |    1 +
> >  9 files changed, 1369 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/spi/spi-aspeed-smc.c
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> >
> > --
> > 2.34.1
