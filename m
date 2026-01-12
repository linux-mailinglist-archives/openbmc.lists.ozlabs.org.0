Return-Path: <openbmc+bounces-1166-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E604D153FC
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 21:36:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqkfj6FvQz2xQ1;
	Tue, 13 Jan 2026 07:35:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768250157;
	cv=none; b=UbsutSh9UxR4zb82FW0Z+ul0EIK1eeZnTP0iNIsCIjvef2UckEFf261BbOw53XsN5oG5wUambPnGWFk7EJpe/ujk9oLEtVO2SGi9gvJQzZAI+N4rNDBRem5igdtq7qXm5ma7wLcUldEsytN9aUVHkrfUj6eSa1Nkae/KWVMj87lkPJohp5WtsjBrlzyyrwH57uD8VrZqzN2BDMAMk0tPJw3aggtGtq5bEOMMblEzVJlqLtQ5B5wAvb5scBZjula3mcpVXvduxM2p5k+1V+aj+/4uOfO7xnjCXqIyc8WlG9Dv+aMq6tipn+LvNfZf7C5P7MK0vGbFRBKAWw4s07PIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768250157; c=relaxed/relaxed;
	bh=VSGgwzZuO1E+RYwmL+6xozwnB1gbSNozH7v+HOz2uEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tq915IrBINnmRQw8oiNeZ2pMrhSRpChL1zLMPwGt6iIBRl1erJlTbvcafC+/5eDLcmVePsYFhmuuskKpS6XwfZyF4LCMr/sjVWipXam1mDVssH4/m/hHlqKQmaSuhfoZHQE51cB6OyXnU9NuRQyJ6ncfDxgishFCVS2PeNWcAS/PhqEFlnk3+UsNwl7QDMKzDvrtlPA+Jj+mnDArEOQpRvR9CLxd7GP8+iG+XF9+/O5IvvsqJKYej8d4WK0RH2KDaubM/gr3lMpjMLz8gu9ups3+dgbMTaxqghjWl6b+jiAKYwTnC2lCwggDe/ojfo6hSP0f/zbmLihHFKZlyUARGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OXjUlL8u; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OXjUlL8u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqkff3n0cz2xJF;
	Tue, 13 Jan 2026 07:35:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250155; x=1799786155;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=REqCyoJrIpewtMdGURz7oYk9zmr7BJajQXuF1TakMwI=;
  b=OXjUlL8u8M/MuIJ9bbXFfdN9g6JKY7Nw+wiYKnZXZXSqlGDtvoGw/HzY
   zgv7SHNnbPE/x4bt4zNMKuV0YLEcsMo8hvtfBD2dU7Mzd+AblRk+VDyns
   SzHvdxYsWEgYUggK+1BiRnQkn3Dt1Qzn+9xKgXZNI4lN1DocgTgcE7JwT
   ujlv7NhnlnnUlJfiaqq7+wPynr1qg+7PoAw44f7FPg4W6IhWAByDvX2xp
   vDXOFmjFceqFth79ntOQ4GlJw0uWw3fArhY29csuYH9TJPZ7COkf3hZpK
   drgT9/OMOVvwDBy879J145PIXAAZ/e4/Bw3JDSdoZs6QhoZEwt7PUJw8E
   A==;
X-CSE-ConnectionGUID: p5jVrg3vTeywZPZ8CiFHWA==
X-CSE-MsgGUID: orqqYXEbSCS+as2KYiZE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80173664"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80173664"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:35:49 -0800
X-CSE-ConnectionGUID: qrF+XUj5Smmcrdyy5Dee6Q==
X-CSE-MsgGUID: pPBsBLFtQSOQR4pxhpa//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208707588"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 12:35:38 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6841594; Mon, 12 Jan 2026 21:35:37 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Janne Grunau <j@jannau.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chen-Yu Tsai <wens@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	CL Wang <cl634@andestech.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	William Zhang <william.zhang@broadcom.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Hang Zhou <929513338@qq.com>,
	Jun Guo <jun.guo@cixtech.com>,
	Philipp Stanner <phasta@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Shiji Yang <yangshiji66@outlook.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Carlos Song <carlos.song@nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Rosen Penev <rosenp@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Longbin Li <looong.bin@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alessandro Grassi <alessandro.grassi@mailbox.org>,
	Darshan R <rathod.darshan.0896@gmail.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Vishwaroop A <va@nvidia.com>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Yang Shen <shenyang39@huawei.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Han Xu <han.xu@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Li-hao Kuo <lhjeff911@gmail.com>,
	Masahisa Kojima <masahisa.kojima@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 0/4] spi: Make SPI core to take care of fwnode assignment
Date: Mon, 12 Jan 2026 21:21:22 +0100
Message-ID: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It seems all of the SPI drivers want to propagate fwnode (or of_node)
of the physical device to the SPI device. Make sure we don't duplicate
it over and over in each new driver (+2 in this cycle) by making core
to take care of that. Note, similar is done already by IIO and
I²C subsystems.

There is one noticeable and quite specific case that is taken care in
the first patch and now we have a confirmation from Cirrus that everything
is okay.  The rest is just a mechanical conversion after checking that
the parent device is assigned to the same that provides the respective
fwnode.

Changelog v2:
- collected tags
- fixed W=1 warning (unused variable) in spi-dln2.c (LKP)

v1: 20260108203004.3538449-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (4):
  spi: Propagate default fwnode to the SPI controller device
  spi: Drop duplicate of_node assignment
  spi: Drop duplicate fwnode assignment
  spi: Drop duplicate device_set_node() call

 drivers/spi/atmel-quadspi.c          | 1 -
 drivers/spi/spi-airoha-snfi.c        | 1 -
 drivers/spi/spi-altera-platform.c    | 2 --
 drivers/spi/spi-amlogic-spifc-a1.c   | 1 -
 drivers/spi/spi-amlogic-spisg.c      | 1 -
 drivers/spi/spi-apple.c              | 1 -
 drivers/spi/spi-ar934x.c             | 1 -
 drivers/spi/spi-armada-3700.c        | 4 +---
 drivers/spi/spi-aspeed-smc.c         | 1 -
 drivers/spi/spi-atcspi200.c          | 1 -
 drivers/spi/spi-ath79.c              | 1 -
 drivers/spi/spi-atmel.c              | 1 -
 drivers/spi/spi-axi-spi-engine.c     | 1 -
 drivers/spi/spi-bcm-qspi.c           | 1 -
 drivers/spi/spi-bcm2835.c            | 1 -
 drivers/spi/spi-bcm2835aux.c         | 1 -
 drivers/spi/spi-bcm63xx-hsspi.c      | 1 -
 drivers/spi/spi-bcm63xx.c            | 1 -
 drivers/spi/spi-bcmbca-hsspi.c       | 1 -
 drivers/spi/spi-cadence-quadspi.c    | 1 -
 drivers/spi/spi-cadence-xspi.c       | 1 -
 drivers/spi/spi-cadence.c            | 1 -
 drivers/spi/spi-cavium-octeon.c      | 1 -
 drivers/spi/spi-cavium-thunderx.c    | 1 -
 drivers/spi/spi-clps711x.c           | 1 -
 drivers/spi/spi-cs42l43.c            | 8 ++++++++
 drivers/spi/spi-davinci.c            | 1 -
 drivers/spi/spi-dln2.c               | 3 ---
 drivers/spi/spi-dw-core.c            | 2 --
 drivers/spi/spi-ep93xx.c             | 1 -
 drivers/spi/spi-falcon.c             | 1 -
 drivers/spi/spi-fsl-dspi.c           | 1 -
 drivers/spi/spi-fsl-espi.c           | 1 -
 drivers/spi/spi-fsl-lib.c            | 1 -
 drivers/spi/spi-fsl-lpspi.c          | 1 -
 drivers/spi/spi-geni-qcom.c          | 1 -
 drivers/spi/spi-gpio.c               | 1 -
 drivers/spi/spi-gxp.c                | 1 -
 drivers/spi/spi-hisi-kunpeng.c       | 1 -
 drivers/spi/spi-img-spfi.c           | 1 -
 drivers/spi/spi-imx.c                | 1 -
 drivers/spi/spi-ingenic.c            | 1 -
 drivers/spi/spi-lantiq-ssc.c         | 1 -
 drivers/spi/spi-ljca.c               | 1 -
 drivers/spi/spi-loongson-core.c      | 1 -
 drivers/spi/spi-lp8841-rtc.c         | 1 -
 drivers/spi/spi-meson-spicc.c        | 1 -
 drivers/spi/spi-meson-spifc.c        | 1 -
 drivers/spi/spi-microchip-core-spi.c | 1 -
 drivers/spi/spi-mpc512x-psc.c        | 2 --
 drivers/spi/spi-mpc52xx-psc.c        | 2 --
 drivers/spi/spi-mpc52xx.c            | 1 -
 drivers/spi/spi-mpfs.c               | 1 -
 drivers/spi/spi-mt65xx.c             | 1 -
 drivers/spi/spi-mt7621.c             | 1 -
 drivers/spi/spi-mtk-nor.c            | 1 -
 drivers/spi/spi-mtk-snfi.c           | 1 -
 drivers/spi/spi-mux.c                | 1 -
 drivers/spi/spi-mxic.c               | 1 -
 drivers/spi/spi-npcm-fiu.c           | 1 -
 drivers/spi/spi-npcm-pspi.c          | 1 -
 drivers/spi/spi-nxp-fspi.c           | 2 --
 drivers/spi/spi-nxp-xspi.c           | 1 -
 drivers/spi/spi-oc-tiny.c            | 1 -
 drivers/spi/spi-orion.c              | 1 -
 drivers/spi/spi-pl022.c              | 1 -
 drivers/spi/spi-pxa2xx.c             | 2 --
 drivers/spi/spi-qcom-qspi.c          | 1 -
 drivers/spi/spi-qpic-snand.c         | 1 -
 drivers/spi/spi-qup.c                | 1 -
 drivers/spi/spi-rb4xx.c              | 1 -
 drivers/spi/spi-realtek-rtl-snand.c  | 1 -
 drivers/spi/spi-realtek-rtl.c        | 1 -
 drivers/spi/spi-rockchip-sfc.c       | 1 -
 drivers/spi/spi-rockchip.c           | 1 -
 drivers/spi/spi-rspi.c               | 1 -
 drivers/spi/spi-rzv2h-rspi.c         | 2 --
 drivers/spi/spi-rzv2m-csi.c          | 2 --
 drivers/spi/spi-s3c64xx.c            | 1 -
 drivers/spi/spi-sc18is602.c          | 2 --
 drivers/spi/spi-sg2044-nor.c         | 1 -
 drivers/spi/spi-sh-hspi.c            | 1 -
 drivers/spi/spi-sh-msiof.c           | 1 -
 drivers/spi/spi-sifive.c             | 1 -
 drivers/spi/spi-slave-mt27xx.c       | 1 -
 drivers/spi/spi-sn-f-ospi.c          | 1 -
 drivers/spi/spi-sprd-adi.c           | 1 -
 drivers/spi/spi-sprd.c               | 1 -
 drivers/spi/spi-stm32-ospi.c         | 1 -
 drivers/spi/spi-stm32-qspi.c         | 1 -
 drivers/spi/spi-stm32.c              | 1 -
 drivers/spi/spi-sun4i.c              | 1 -
 drivers/spi/spi-sun6i.c              | 1 -
 drivers/spi/spi-sunplus-sp7021.c     | 1 -
 drivers/spi/spi-synquacer.c          | 3 ---
 drivers/spi/spi-tegra114.c           | 1 -
 drivers/spi/spi-tegra20-sflash.c     | 1 -
 drivers/spi/spi-tegra20-slink.c      | 1 -
 drivers/spi/spi-tegra210-quad.c      | 1 -
 drivers/spi/spi-ti-qspi.c            | 1 -
 drivers/spi/spi-uniphier.c           | 1 -
 drivers/spi/spi-virtio.c             | 2 --
 drivers/spi/spi-wpcm-fiu.c           | 1 -
 drivers/spi/spi-xcomm.c              | 1 -
 drivers/spi/spi-xilinx.c             | 1 -
 drivers/spi/spi-xlp.c                | 1 -
 drivers/spi/spi-xtensa-xtfpga.c      | 1 -
 drivers/spi/spi.c                    | 3 +++
 108 files changed, 12 insertions(+), 122 deletions(-)

-- 
2.50.1


