Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86EF4C62EB
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 07:31:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6VrM6Wgpz30DB
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 17:30:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mXWvNEnJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mXWvNEnJ; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Vqx0nBtz2xB1
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 17:30:36 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p17so9839151plo.9
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 22:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xbEHDL79mQPuNsuuQY/c6Foee+ToRBx//TmQLVsYPEE=;
 b=mXWvNEnJHmcUaw6+Wsg+SnPsWZoZxQrp0JnSVZZt+NFLoh6ajl7GuMoPhwnbL5MXlr
 +VKemxcOWW8EAhsREBbR3nf+Fg5ZOdKwkUp7YV+AvxEeNZyGirnRuTan/+DF3xXQCe7S
 xSszhYldQT9E8wUMonyXhk+fIOPvpkBxPVvggw7J8JRuoBqry0ezv4UJqG60nBaCfJtM
 YWzhxNLDwn67+Fh3fepvmz2/TO+NQZtqePeRkz3SUCoDDYb1xKugGncLMNVJZ/pYfn1t
 V+oaZNO2lBfbr89J1Q1PXuSHgFcKx8cQsry/TnyXB7I+jSymVqNfSHXuN1pdbLY3P1+G
 Ecqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xbEHDL79mQPuNsuuQY/c6Foee+ToRBx//TmQLVsYPEE=;
 b=trFHF1sOUyEJUX5mM9bUGbMc3QFPULNzp1S94bQ5FI4+FQ7BByeX60YO2l0jJyPVFK
 ZdBTmqKsbwwvukyp3h5y+vVZ5eb8VA3js6mx6myU5CEj5Dh7seR5D30CeVejUAS48XUo
 TPdjyNA2Or6PFAT9XPUyY9+EnBFu4HcqFSZAZEubwKoxAvKrr3q5aiSY5PzcAkQM3hKf
 chZWUCaST3zcNJf9w68oKBbMtrB211JPecw2u8XF+JvejGc1qBdJlB3c6fw/OBLI8zCV
 dVFzdruvNOvmHIgTuLzmFAXY9M8TVOrHByOl4rm4TlYe6lnmYr/Td6mzjiWB1MDOX8Sj
 cXAQ==
X-Gm-Message-State: AOAM532xrtkrtqrxJOuk+a4vyG5YtRZB8/IALSzpo6I1YkDhKYqiKNFn
 xtllaZZ5tLdRaGnvzu3P8R0=
X-Google-Smtp-Source: ABdhPJwG8wIQfUowIL3No1RD3T1Aa+BCNfg/lXS0LUM8dPtrV3PxwYQqeJFh3exGGe6Z85Vqg7WFkA==
X-Received: by 2002:a17:90a:4383:b0:1bc:f9da:f339 with SMTP id
 r3-20020a17090a438300b001bcf9daf339mr13876171pjg.160.1646029833921; 
 Sun, 27 Feb 2022 22:30:33 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a17090a178c00b001bd036e11fdsm7399853pja.42.2022.02.27.22.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 22:30:33 -0800 (PST)
Date: Sun, 27 Feb 2022 22:30:26 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Message-ID: <YhxsAojz0O4K3NtS@taoren-fedora-PC23YAB4>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
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

Thank you Cedric and Joel! I have AST2400, AST2500 and AST2600 OpenBMC
platforms and I can test these patches. It may take a few days as I'm
just back from holiday (need to catch up at work), but I should be able
to share my findings by middle this week.


Cheers,

Tao

On Sun, Feb 27, 2022 at 07:53:37PM +0100, C�dric Le Goater wrote:
> On 2/25/22 06:29, Joel Stanley wrote:
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
> > 
> > Cherry pick this commit into your tree, and see how it goes, and report back.
> > 
> > I plan to switch the openbmc tree to this driver when we next rebase
> > the kernel. We could also backport it to dev-5.15 as an option.
> > 
> > You can direct testing results to this thread, or reply directly to
> > the upstream thread:
> > 
> > https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
> 
> or grab the v2 from :
> 
>   https://github.com/legoater/linux/tree/openbmc-5.15
> 
> I have addressed the comments on driver bind/unbind.
> 
> Thanks,
> 
> C.
> 
> > 
> > Cheers,
> > 
> > Joel
> > 
> > ---------- Forwarded message ---------
> > From: C�dric Le Goater <clg@kaod.org>
> > Date: Mon, 14 Feb 2022 at 09:42
> > Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
> > To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> > Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> > <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> > Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> > <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> > <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> > Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> > <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> > Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> > <linux-kernel@vger.kernel.org>, C�dric Le Goater <clg@kaod.org>
> > 
> > 
> > Hi,
> > 
> > This series adds a new SPI driver using the spi-mem interface for the
> > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > SoCs.
> > 
> >   * AST2600 Firmware SPI Memory Controller (FMC)
> >   * AST2600 SPI Flash Controller (SPI1 and SPI2)
> >   * AST2500 Firmware SPI Memory Controller (FMC)
> >   * AST2500 SPI Flash Controller (SPI1 and SPI2)
> >   * AST2400 New Static Memory Controller (also referred as FMC)
> >   * AST2400 SPI Flash Controller (SPI)
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
> >   * OpenPOWER Palmetto (AST2400)
> >   * Evaluation board (AST2500)
> >   * OpenPOWER Witherspoon (AST2500)
> >   * Evaluation board (AST2600 A0)
> >   * Rainier board (AST2600)
> > 
> > [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> > [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
> > 
> > Thanks,
> > 
> > C.
> > 
> > C�dric Le Goater (10):
> >    mtd: spi-nor: aspeed: Rename Kconfig option
> >    dt-bindings: spi: Add Aspeed SMC controllers device tree binding
> >    spi: spi-mem: Add driver for Aspeed SMC controllers
> >    spi: aspeed: Add support for direct mapping
> >    spi: aspeed: Adjust direct mapping to device size
> >    spi: aspeed: Workaround AST2500 limitations
> >    spi: aspeed: Add support for the AST2400 SPI controller
> >    spi: aspeed: Calibrate read timings
> >    ARM: dts: aspeed: Enable Dual SPI RX transfers
> >    spi: aspeed: Activate new spi-mem driver
> > 
> >   drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
> >   .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
> >   arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
> >   arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
> >   arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
> >   drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
> >   drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
> >   drivers/spi/Kconfig                           |   11 +
> >   drivers/spi/Makefile                          |    1 +
> >   9 files changed, 1369 insertions(+), 3 deletions(-)
> >   create mode 100644 drivers/spi/spi-aspeed-smc.c
> >   create mode 100644
> > Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > 
> > --
> > 2.34.1
> 
