Return-Path: <openbmc+bounces-1197-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0BAD218F4
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:25:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0zx3wqcz2xrL;
	Thu, 15 Jan 2026 09:25:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768403559;
	cv=none; b=Akm21IbcN0CawmnSG/06UH9S43tyuUZHcD5fCp/n9XY16ySfEkzfFOvTT6p0CujyXznobcbvu7zCv9LX5TimuzZZ6Hp8bTFjK6ySD19yIKypYs/lLrFKgixrYKghPPaEEDg8vczs+yM3uHFpfCnFkyH99nzledjLCNBMoSmyczzdZSDRTHhZyf6azDcEPXe0Jahf80v1RrhzOtkL41A3ZpwhsVXPab/HK8xrtc31emU4hCguTT0woKmuDrKISrXk4Qf1elbt7zUeSBFSqyddy+k3ycDX/qdiQWGCc5+ycH1Em0zJ3NKzeKpzRCfIMzbmMzmloZItgHylAvWhSCMIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768403559; c=relaxed/relaxed;
	bh=pSWY8WZ8lUBpvsJXY3eaMRmNmB9WYPFs+lY8cDcpe3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HsCv1q3yQFjAp7g/5kRHuyn3mz4PbUBvWWRv5iNZU/pGp5CpvfbxBzfR7zaYsfNGoSiL6ddSGqUnnTL/3vj+4rnPLBsc5leKxMcKj9+3nhmnbM2031nTKZ2bZxKH7E3/LXDQ/N05eJre1h/UuETqDO39VMvPS3ZswNGzHRtv3NzZOEsU/+wCU+sNnXQ/MeaB0BCQwjqXMlI4XB93X7v+1ErNwEYFxl/SOAihCITXN/lWpmOdlHmnwKqlkFdNUfPpcHfM2iXMLeWR1bwlk/m2fjwyFkTwvfn9fn9fzqFUcfTPYQyJMDfW8UEWTxB+HWkrqDmuBjorWn4DfmUokAs/ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Z+9YUCRL; dkim-atps=neutral; spf=pass (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=prvs=4671a01f4=prajna.rajendrakumar@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Z+9YUCRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=prvs=4671a01f4=prajna.rajendrakumar@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 124 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 02:12:36 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqNh2LKYz2xMt;
	Thu, 15 Jan 2026 02:12:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768403556; x=1799939556;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6uP5fxx4ypJXHLeX4+YT6lJNXjWAFbqgby149lcQd3s=;
  b=Z+9YUCRL6JbNdUaNmAy2NdTmOCIbtThWOxDVNPUSLw0/Im6BKSLCwdf4
   //6FLBC757VU88r3FbinACcTxYeQGrng/H5LA17ym081Aq/PcHHRr75kL
   FoKbks6z/1gVnsQtLkrJfAyO24Qe50rVhf2U6IQqfsAG2Ffz4lwjXDKXr
   gekJk5YNvfTJxg7vYkpiISNaO9dW2RGpPGLDn9QzAlh9aBU/ytelc0BoP
   INgz8RAhZf/E4ihEcFRoNjo+dsQlI+BTegVOSQZszIm+l6scRTFcSY+a1
   dq3/+SW/anS6oxLWjt8uYLL1wxb4oFU/uHSTEiZN3JXNB28JazkB5uozJ
   Q==;
X-CSE-ConnectionGUID: iw2dizFESQ6os9qs5GQIPQ==
X-CSE-MsgGUID: OHb3OhQDSZStPwggv3wutA==
X-IronPort-AV: E=Sophos;i="6.21,225,1763449200"; 
   d="scan'208";a="51140825"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jan 2026 08:09:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 14 Jan 2026 08:09:02 -0700
Received: from [10.205.167.104] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 14 Jan 2026 08:08:38 -0700
Message-ID: <7f9060c2-907e-4f03-9f3f-a3fe083e7a7a@microchip.com>
Date: Wed, 14 Jan 2026 15:21:11 +0000
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
	<broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, Haotian Zhang
	<vulab@iscas.ac.cn>, Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau
	<j@jannau.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Chin-Ting Kuo
	<chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, "Patrice
 Chotard" <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>,
	William Zhang <william.zhang@broadcom.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
	<clg@kaod.org>, Manikandan Muralidharan <manikandan.m@microchip.com>, "David
 Lechner" <dlechner@baylibre.com>, Florian Fainelli
	<florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, "Hang
 Zhou" <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, Philipp Stanner
	<phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Bartosz
 Golaszewski" <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?=
	<benoit.monin@bootlin.com>, Shiji Yang <yangshiji66@outlook.com>, James Clark
	<james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Carlos Song
	<carlos.song@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
	"Sergio Perez Gonzalez" <sperezglz@gmail.com>, Qianfeng Rong
	<rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos
	<j4g8y7@gmail.com>, "Md Sadre Alam" <quic_mdalam@quicinc.com>, Rosen Penev
	<rosenp@gmail.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, Luis de
 Arquer <luis.dearquer@inertim.com>, Cosmin Tanislav
	<cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li
	<looong.bin@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
	"Alessandro Grassi" <alessandro.grassi@mailbox.org>, Darshan R
	<rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>,
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, "Darshan
 Rathod" <darshanrathod475@gmail.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <asahi@lists.linux.dev>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <imx@lists.linux.dev>,
	<linux-arm-msm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <virtualization@lists.linux.dev>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, "Sven
 Peter" <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Wanner
	<ryan.wanner@microchip.com>, Michael Hennerich
	<michael.hennerich@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
	<nuno.sa@analog.com>, Kamal Dasu <kamal.dasu@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Kursad Oney
	<kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, "Jean-Marie
 Verdun" <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen
	<shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, "Yinbo
 Zhu" <zhuyinbo@loongson.cn>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Kevin Hilman" <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	"Conor Dooley" <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, "Han
 Xu" <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij
	<linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "Chris
 Packham" <chris.packham@alliedtelesis.co.nz>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>, "Samuel
 Holland" <samuel.holland@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
	"Baolin Wang" <baolin.wang@linux.alibaba.com>, Chunyan Zhang
	<zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao
 Kuo <lhjeff911@gmail.com>, Masahisa Kojima <masahisa.kojima@linaro.org>,
	Jassi Brar <jaswinder.singh@linaro.org>, Laxman Dewangan
	<ldewangan@nvidia.com>, "Thierry Reding" <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?=
	<j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov
	<jcmvbkbc@gmail.com>, Prajna Rajendra Kumar - M74368
	<prajna.rajendrakumar@microchip.com>
References: <20260112203534.4186261-1-andriy.shevchenko@linux.intel.com>
 <20260112203534.4186261-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
In-Reply-To: <20260112203534.4186261-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/01/2026 20:21, Andy Shevchenko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Acked-by: Chen-Yu Tsai <wens@kernel.org> # sun4i, sun6i
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/spi/atmel-quadspi.c          | 1 -
>   drivers/spi/spi-altera-platform.c    | 2 --
>   drivers/spi/spi-amlogic-spifc-a1.c   | 1 -
>   drivers/spi/spi-amlogic-spisg.c      | 1 -
>   drivers/spi/spi-apple.c              | 1 -
>   drivers/spi/spi-ar934x.c             | 1 -
>   drivers/spi/spi-armada-3700.c        | 4 +---
>   drivers/spi/spi-aspeed-smc.c         | 1 -
>   drivers/spi/spi-atcspi200.c          | 1 -
>   drivers/spi/spi-ath79.c              | 1 -
>   drivers/spi/spi-atmel.c              | 1 -
>   drivers/spi/spi-axi-spi-engine.c     | 1 -
>   drivers/spi/spi-bcm-qspi.c           | 1 -
>   drivers/spi/spi-bcm2835.c            | 1 -
>   drivers/spi/spi-bcm2835aux.c         | 1 -
>   drivers/spi/spi-bcm63xx-hsspi.c      | 1 -
>   drivers/spi/spi-bcm63xx.c            | 1 -
>   drivers/spi/spi-bcmbca-hsspi.c       | 1 -
>   drivers/spi/spi-cadence-quadspi.c    | 1 -
>   drivers/spi/spi-cadence-xspi.c       | 1 -
>   drivers/spi/spi-cadence.c            | 1 -
>   drivers/spi/spi-cavium-octeon.c      | 1 -
>   drivers/spi/spi-cavium-thunderx.c    | 1 -
>   drivers/spi/spi-clps711x.c           | 1 -
>   drivers/spi/spi-davinci.c            | 1 -
>   drivers/spi/spi-falcon.c             | 1 -
>   drivers/spi/spi-fsl-dspi.c           | 1 -
>   drivers/spi/spi-fsl-espi.c           | 1 -
>   drivers/spi/spi-fsl-lib.c            | 1 -
>   drivers/spi/spi-fsl-lpspi.c          | 1 -
>   drivers/spi/spi-geni-qcom.c          | 1 -
>   drivers/spi/spi-gxp.c                | 1 -
>   drivers/spi/spi-img-spfi.c           | 1 -
>   drivers/spi/spi-imx.c                | 1 -
>   drivers/spi/spi-ingenic.c            | 1 -
>   drivers/spi/spi-lantiq-ssc.c         | 1 -
>   drivers/spi/spi-lp8841-rtc.c         | 1 -
>   drivers/spi/spi-meson-spicc.c        | 1 -
>   drivers/spi/spi-meson-spifc.c        | 1 -
>   drivers/spi/spi-microchip-core-spi.c | 1 -
>   drivers/spi/spi-mpc52xx.c            | 1 -
>   drivers/spi/spi-mpfs.c               | 1 -
For the Microchip CoreSPI and MPFS drivers,

Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

Thanks

>   drivers/spi/spi-mt65xx.c             | 1 -
>   drivers/spi/spi-mt7621.c             | 1 -
>   drivers/spi/spi-mtk-nor.c            | 1 -
>   drivers/spi/spi-mtk-snfi.c           | 1 -
>   drivers/spi/spi-mux.c                | 1 -
>   drivers/spi/spi-mxic.c               | 1 -
>   drivers/spi/spi-npcm-fiu.c           | 1 -
>   drivers/spi/spi-npcm-pspi.c          | 1 -
>   drivers/spi/spi-nxp-xspi.c           | 1 -
>   drivers/spi/spi-oc-tiny.c            | 1 -
>   drivers/spi/spi-orion.c              | 1 -
>   drivers/spi/spi-pl022.c              | 1 -
>   drivers/spi/spi-qcom-qspi.c          | 1 -
>   drivers/spi/spi-qpic-snand.c         | 1 -
>   drivers/spi/spi-qup.c                | 1 -
>   drivers/spi/spi-rb4xx.c              | 1 -
>   drivers/spi/spi-realtek-rtl.c        | 1 -
>   drivers/spi/spi-rockchip-sfc.c       | 1 -
>   drivers/spi/spi-rockchip.c           | 1 -
>   drivers/spi/spi-rspi.c               | 1 -
>   drivers/spi/spi-s3c64xx.c            | 1 -
>   drivers/spi/spi-sg2044-nor.c         | 1 -
>   drivers/spi/spi-sh-hspi.c            | 1 -
>   drivers/spi/spi-sh-msiof.c           | 1 -
>   drivers/spi/spi-sifive.c             | 1 -
>   drivers/spi/spi-slave-mt27xx.c       | 1 -
>   drivers/spi/spi-sn-f-ospi.c          | 1 -
>   drivers/spi/spi-sprd-adi.c           | 1 -
>   drivers/spi/spi-sprd.c               | 1 -
>   drivers/spi/spi-stm32-ospi.c         | 1 -
>   drivers/spi/spi-stm32-qspi.c         | 1 -
>   drivers/spi/spi-stm32.c              | 1 -
>   drivers/spi/spi-sun4i.c              | 1 -
>   drivers/spi/spi-sun6i.c              | 1 -
>   drivers/spi/spi-tegra114.c           | 1 -
>   drivers/spi/spi-tegra20-sflash.c     | 1 -
>   drivers/spi/spi-tegra20-slink.c      | 1 -
>   drivers/spi/spi-tegra210-quad.c      | 1 -
>   drivers/spi/spi-ti-qspi.c            | 1 -
>   drivers/spi/spi-uniphier.c           | 1 -
>   drivers/spi/spi-wpcm-fiu.c           | 1 -
>   drivers/spi/spi-xcomm.c              | 1 -
>   drivers/spi/spi-xilinx.c             | 1 -
>   drivers/spi/spi-xlp.c                | 1 -
>   drivers/spi/spi-xtensa-xtfpga.c      | 1 -
>   87 files changed, 1 insertion(+), 90 deletions(-)
>
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index d7a3d85d00c2..aaf7f4c46b22 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -1382,7 +1382,6 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>          ctrl->bus_num = -1;
>          ctrl->mem_ops = &atmel_qspi_mem_ops;
>          ctrl->num_chipselect = 1;
> -       ctrl->dev.of_node = pdev->dev.of_node;
>          platform_set_drvdata(pdev, ctrl);
>
>          /* Map the registers */
> diff --git a/drivers/spi/spi-altera-platform.c b/drivers/spi/spi-altera-platform.c
> index e163774fd65b..fc81de2610ef 100644
> --- a/drivers/spi/spi-altera-platform.c
> +++ b/drivers/spi/spi-altera-platform.c
> @@ -67,8 +67,6 @@ static int altera_spi_probe(struct platform_device *pdev)
>                  host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 16);
>          }
>
> -       host->dev.of_node = pdev->dev.of_node;
> -
>          hw = spi_controller_get_devdata(host);
>          hw->dev = &pdev->dev;
>
> diff --git a/drivers/spi/spi-amlogic-spifc-a1.c b/drivers/spi/spi-amlogic-spifc-a1.c
> index eb503790017b..7ee4c92e6e09 100644
> --- a/drivers/spi/spi-amlogic-spifc-a1.c
> +++ b/drivers/spi/spi-amlogic-spifc-a1.c
> @@ -358,7 +358,6 @@ static int amlogic_spifc_a1_probe(struct platform_device *pdev)
>                  return ret;
>
>          ctrl->num_chipselect = 1;
> -       ctrl->dev.of_node = pdev->dev.of_node;
>          ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
>          ctrl->auto_runtime_pm = true;
>          ctrl->mem_ops = &amlogic_spifc_a1_mem_ops;
> diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
> index bcd7ec291ad0..1509df2b17ae 100644
> --- a/drivers/spi/spi-amlogic-spisg.c
> +++ b/drivers/spi/spi-amlogic-spisg.c
> @@ -781,7 +781,6 @@ static int aml_spisg_probe(struct platform_device *pdev)
>          pm_runtime_resume_and_get(&spisg->pdev->dev);
>
>          ctlr->num_chipselect = 4;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST |
>                            SPI_3WIRE | SPI_TX_QUAD | SPI_RX_QUAD;
>          ctlr->max_speed_hz = 1000 * 1000 * 100;
> diff --git a/drivers/spi/spi-apple.c b/drivers/spi/spi-apple.c
> index 2fee7057ecc9..61eefb08d2a7 100644
> --- a/drivers/spi/spi-apple.c
> +++ b/drivers/spi/spi-apple.c
> @@ -485,7 +485,6 @@ static int apple_spi_probe(struct platform_device *pdev)
>          if (ret)
>                  return dev_err_probe(&pdev->dev, ret, "Unable to bind to interrupt\n");
>
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->bus_num = pdev->id;
>          ctlr->num_chipselect = 1;
>          ctlr->mode_bits = SPI_CPHA | SPI_CPOL | SPI_LSB_FIRST;
> diff --git a/drivers/spi/spi-ar934x.c b/drivers/spi/spi-ar934x.c
> index 86c54fff9d6e..2210186feab8 100644
> --- a/drivers/spi/spi-ar934x.c
> +++ b/drivers/spi/spi-ar934x.c
> @@ -195,7 +195,6 @@ static int ar934x_spi_probe(struct platform_device *pdev)
>          ctlr->transfer_one_message = ar934x_spi_transfer_one_message;
>          ctlr->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(24) |
>                                     SPI_BPW_MASK(16) | SPI_BPW_MASK(8);
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->num_chipselect = 3;
>
>          dev_set_drvdata(&pdev->dev, ctlr);
> diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
> index 02c1e625742d..78248729d3e9 100644
> --- a/drivers/spi/spi-armada-3700.c
> +++ b/drivers/spi/spi-armada-3700.c
> @@ -813,7 +813,6 @@ MODULE_DEVICE_TABLE(of, a3700_spi_dt_ids);
>   static int a3700_spi_probe(struct platform_device *pdev)
>   {
>          struct device *dev = &pdev->dev;
> -       struct device_node *of_node = dev->of_node;
>          struct spi_controller *host;
>          struct a3700_spi *spi;
>          u32 num_cs = 0;
> @@ -826,14 +825,13 @@ static int a3700_spi_probe(struct platform_device *pdev)
>                  goto out;
>          }
>
> -       if (of_property_read_u32(of_node, "num-cs", &num_cs)) {
> +       if (of_property_read_u32(dev->of_node, "num-cs", &num_cs)) {
>                  dev_err(dev, "could not find num-cs\n");
>                  ret = -ENXIO;
>                  goto error;
>          }
>
>          host->bus_num = pdev->id;
> -       host->dev.of_node = of_node;
>          host->mode_bits = SPI_MODE_3;
>          host->num_chipselect = num_cs;
>          host->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(32);
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index db3e096f2eb0..fc565065c8fd 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -898,7 +898,6 @@ static int aspeed_spi_probe(struct platform_device *pdev)
>          ctlr->setup = aspeed_spi_setup;
>          ctlr->cleanup = aspeed_spi_cleanup;
>          ctlr->num_chipselect = of_get_available_child_count(dev->of_node);
> -       ctlr->dev.of_node = dev->of_node;
>
>          aspi->num_cs = ctlr->num_chipselect;
>
> diff --git a/drivers/spi/spi-atcspi200.c b/drivers/spi/spi-atcspi200.c
> index 0af7446642e5..60a37ff5c6f5 100644
> --- a/drivers/spi/spi-atcspi200.c
> +++ b/drivers/spi/spi-atcspi200.c
> @@ -552,7 +552,6 @@ static void atcspi_init_controller(struct platform_device *pdev,
>          /* Initialize controller properties */
>          host->bus_num = pdev->id;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_QUAD | SPI_TX_QUAD;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->num_chipselect = ATCSPI_MAX_CS_NUM;
>          host->mem_ops = &atcspi_mem_ops;
>          host->max_speed_hz = spi->sclk_rate;
> diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
> index 9a705a9fddd2..2f61e5b9943c 100644
> --- a/drivers/spi/spi-ath79.c
> +++ b/drivers/spi/spi-ath79.c
> @@ -180,7 +180,6 @@ static int ath79_spi_probe(struct platform_device *pdev)
>          }
>
>          sp = spi_controller_get_devdata(host);
> -       host->dev.of_node = pdev->dev.of_node;
>          platform_set_drvdata(pdev, sp);
>
>          host->use_gpio_descriptors = true;
> diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
> index 89977bff76d2..d71c0dbf1f38 100644
> --- a/drivers/spi/spi-atmel.c
> +++ b/drivers/spi/spi-atmel.c
> @@ -1536,7 +1536,6 @@ static int atmel_spi_probe(struct platform_device *pdev)
>          host->use_gpio_descriptors = true;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 16);
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = pdev->id;
>          host->num_chipselect = 4;
>          host->setup = atmel_spi_setup;
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
> index e06f412190fd..91805eae9263 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -1080,7 +1080,6 @@ static int spi_engine_probe(struct platform_device *pdev)
>          if (ret)
>                  return ret;
>
> -       host->dev.of_node = pdev->dev.of_node;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_3WIRE;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
>          host->max_speed_hz = clk_get_rate(spi_engine->ref_clk) / 2;
> diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
> index cfdaa5eaec76..9c06ac562f3e 100644
> --- a/drivers/spi/spi-bcm-qspi.c
> +++ b/drivers/spi/spi-bcm-qspi.c
> @@ -1529,7 +1529,6 @@ int bcm_qspi_probe(struct platform_device *pdev,
>          host->transfer_one = bcm_qspi_transfer_one;
>          host->mem_ops = &bcm_qspi_mem_ops;
>          host->cleanup = bcm_qspi_cleanup;
> -       host->dev.of_node = dev->of_node;
>          host->num_chipselect = NUM_CHIPSELECT;
>          host->use_gpio_descriptors = true;
>
> diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
> index 192cc5ef65fb..35ae50ca37ac 100644
> --- a/drivers/spi/spi-bcm2835.c
> +++ b/drivers/spi/spi-bcm2835.c
> @@ -1368,7 +1368,6 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
>          ctlr->transfer_one = bcm2835_spi_transfer_one;
>          ctlr->handle_err = bcm2835_spi_handle_err;
>          ctlr->prepare_message = bcm2835_spi_prepare_message;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>
>          bs = spi_controller_get_devdata(ctlr);
>          bs->ctlr = ctlr;
> diff --git a/drivers/spi/spi-bcm2835aux.c b/drivers/spi/spi-bcm2835aux.c
> index 90698d7d809d..f6847d3a76de 100644
> --- a/drivers/spi/spi-bcm2835aux.c
> +++ b/drivers/spi/spi-bcm2835aux.c
> @@ -502,7 +502,6 @@ static int bcm2835aux_spi_probe(struct platform_device *pdev)
>          host->handle_err = bcm2835aux_spi_handle_err;
>          host->prepare_message = bcm2835aux_spi_prepare_message;
>          host->unprepare_message = bcm2835aux_spi_unprepare_message;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->use_gpio_descriptors = true;
>
>          bs = spi_controller_get_devdata(host);
> diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
> index d9e972ef2abd..612f8802e690 100644
> --- a/drivers/spi/spi-bcm63xx-hsspi.c
> +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> @@ -822,7 +822,6 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
>          init_completion(&bs->done);
>
>          host->mem_ops = &bcm63xx_hsspi_mem_ops;
> -       host->dev.of_node = dev->of_node;
>          if (!dev->of_node)
>                  host->bus_num = HSSPI_BUS_NUM;
>
> diff --git a/drivers/spi/spi-bcm63xx.c b/drivers/spi/spi-bcm63xx.c
> index 4c549f166b0f..47266bb23a33 100644
> --- a/drivers/spi/spi-bcm63xx.c
> +++ b/drivers/spi/spi-bcm63xx.c
> @@ -571,7 +571,6 @@ static int bcm63xx_spi_probe(struct platform_device *pdev)
>                  goto out_err;
>          }
>
> -       host->dev.of_node = dev->of_node;
>          host->bus_num = bus_num;
>          host->num_chipselect = num_cs;
>          host->transfer_one_message = bcm63xx_spi_transfer_one;
> diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hsspi.c
> index f16298b75236..ece22260f570 100644
> --- a/drivers/spi/spi-bcmbca-hsspi.c
> +++ b/drivers/spi/spi-bcmbca-hsspi.c
> @@ -500,7 +500,6 @@ static int bcmbca_hsspi_probe(struct platform_device *pdev)
>          mutex_init(&bs->msg_mutex);
>          init_completion(&bs->done);
>
> -       host->dev.of_node = dev->of_node;
>          if (!dev->of_node)
>                  host->bus_num = HSSPI_BUS_NUM;
>
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index b1cf182d6566..791015abafee 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1827,7 +1827,6 @@ static int cqspi_probe(struct platform_device *pdev)
>          host->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL;
>          host->mem_ops = &cqspi_mem_ops;
>          host->mem_caps = &cqspi_mem_caps;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          cqspi = spi_controller_get_devdata(host);
>
> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
> index c4ab6b2fb43f..72384d90d113 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c
> @@ -1157,7 +1157,6 @@ static int cdns_xspi_probe(struct platform_device *pdev)
>                  cdns_xspi->sdma_handler = &cdns_xspi_sdma_handle;
>                  cdns_xspi->set_interrupts_handler = &cdns_xspi_set_interrupts;
>          }
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = -1;
>
>          platform_set_drvdata(pdev, host);
> diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
> index 47054da630d0..6cac015cfb5b 100644
> --- a/drivers/spi/spi-cadence.c
> +++ b/drivers/spi/spi-cadence.c
> @@ -651,7 +651,6 @@ static int cdns_spi_probe(struct platform_device *pdev)
>                  return -ENOMEM;
>
>          xspi = spi_controller_get_devdata(ctlr);
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          platform_set_drvdata(pdev, ctlr);
>
>          xspi->regs = devm_platform_ioremap_resource(pdev, 0);
> diff --git a/drivers/spi/spi-cavium-octeon.c b/drivers/spi/spi-cavium-octeon.c
> index a5ad90d66ec0..155085a053a1 100644
> --- a/drivers/spi/spi-cavium-octeon.c
> +++ b/drivers/spi/spi-cavium-octeon.c
> @@ -54,7 +54,6 @@ static int octeon_spi_probe(struct platform_device *pdev)
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
>          host->max_speed_hz = OCTEON_SPI_MAX_CLOCK_HZ;
>
> -       host->dev.of_node = pdev->dev.of_node;
>          err = devm_spi_register_controller(&pdev->dev, host);
>          if (err) {
>                  dev_err(&pdev->dev, "register host failed: %d\n", err);
> diff --git a/drivers/spi/spi-cavium-thunderx.c b/drivers/spi/spi-cavium-thunderx.c
> index 367ae7120bb3..99aac40a1bba 100644
> --- a/drivers/spi/spi-cavium-thunderx.c
> +++ b/drivers/spi/spi-cavium-thunderx.c
> @@ -67,7 +67,6 @@ static int thunderx_spi_probe(struct pci_dev *pdev,
>          host->transfer_one_message = octeon_spi_transfer_one_message;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
>          host->max_speed_hz = OCTEON_SPI_MAX_CLOCK_HZ;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          pci_set_drvdata(pdev, host);
>
> diff --git a/drivers/spi/spi-clps711x.c b/drivers/spi/spi-clps711x.c
> index 5552ccd716fc..d6458e59d41b 100644
> --- a/drivers/spi/spi-clps711x.c
> +++ b/drivers/spi/spi-clps711x.c
> @@ -107,7 +107,6 @@ static int spi_clps711x_probe(struct platform_device *pdev)
>          host->bus_num = -1;
>          host->mode_bits = SPI_CPHA | SPI_CS_HIGH;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 8);
> -       host->dev.of_node = pdev->dev.of_node;
>          host->prepare_message = spi_clps711x_prepare_message;
>          host->transfer_one = spi_clps711x_transfer_one;
>
> diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
> index 21a14e800eed..d680142a059f 100644
> --- a/drivers/spi/spi-davinci.c
> +++ b/drivers/spi/spi-davinci.c
> @@ -988,7 +988,6 @@ static int davinci_spi_probe(struct platform_device *pdev)
>          }
>
>          host->use_gpio_descriptors = true;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = pdev->id;
>          host->num_chipselect = pdata->num_chipselect;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
> diff --git a/drivers/spi/spi-falcon.c b/drivers/spi/spi-falcon.c
> index faa893f83dc5..cb15faabd88f 100644
> --- a/drivers/spi/spi-falcon.c
> +++ b/drivers/spi/spi-falcon.c
> @@ -405,7 +405,6 @@ static int falcon_sflash_probe(struct platform_device *pdev)
>          host->flags = SPI_CONTROLLER_HALF_DUPLEX;
>          host->setup = falcon_sflash_setup;
>          host->transfer_one_message = falcon_sflash_xfer_one;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          ret = devm_spi_register_controller(&pdev->dev, host);
>          if (ret)
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 83ea296597e9..76f142a54254 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -1555,7 +1555,6 @@ static int dspi_probe(struct platform_device *pdev)
>
>          ctlr->setup = dspi_setup;
>          ctlr->transfer_one_message = dspi_transfer_one_message;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>
>          ctlr->cleanup = dspi_cleanup;
>          ctlr->target_abort = dspi_target_abort;
> diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
> index f2f1d3298e6c..b06555a457f8 100644
> --- a/drivers/spi/spi-fsl-espi.c
> +++ b/drivers/spi/spi-fsl-espi.c
> @@ -675,7 +675,6 @@ static int fsl_espi_probe(struct device *dev, struct resource *mem,
>
>          host->mode_bits = SPI_RX_DUAL | SPI_CPOL | SPI_CPHA | SPI_CS_HIGH |
>                            SPI_LSB_FIRST | SPI_LOOP;
> -       host->dev.of_node = dev->of_node;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 16);
>          host->setup = fsl_espi_setup;
>          host->cleanup = fsl_espi_cleanup;
> diff --git a/drivers/spi/spi-fsl-lib.c b/drivers/spi/spi-fsl-lib.c
> index bb7a625db5b0..1f8960f15483 100644
> --- a/drivers/spi/spi-fsl-lib.c
> +++ b/drivers/spi/spi-fsl-lib.c
> @@ -91,7 +91,6 @@ void mpc8xxx_spi_probe(struct device *dev, struct resource *mem,
>          ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH
>                          | SPI_LSB_FIRST | SPI_LOOP;
>
> -       ctlr->dev.of_node = dev->of_node;
>
>          mpc8xxx_spi = spi_controller_get_devdata(ctlr);
>          mpc8xxx_spi->dev = dev;
> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index 8f45ead23836..6c692568bdf5 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
> @@ -949,7 +949,6 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
>          controller->unprepare_transfer_hardware = lpspi_unprepare_xfer_hardware;
>          controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
>          controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> -       controller->dev.of_node = pdev->dev.of_node;
>          controller->bus_num = pdev->id;
>          controller->num_chipselect = num_cs;
>          controller->target_abort = fsl_lpspi_target_abort;
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 5cca356cb673..0e5fd9df1a8f 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1057,7 +1057,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>          }
>
>          spi->bus_num = -1;
> -       spi->dev.of_node = dev->of_node;
>          spi->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP | SPI_CS_HIGH;
>          spi->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
>          spi->num_chipselect = 4;
> diff --git a/drivers/spi/spi-gxp.c b/drivers/spi/spi-gxp.c
> index 3aff5a166c94..97d2420108c0 100644
> --- a/drivers/spi/spi-gxp.c
> +++ b/drivers/spi/spi-gxp.c
> @@ -284,7 +284,6 @@ static int gxp_spifi_probe(struct platform_device *pdev)
>          ctlr->mem_ops = &gxp_spi_mem_ops;
>          ctlr->setup = gxp_spi_setup;
>          ctlr->num_chipselect = data->max_cs;
> -       ctlr->dev.of_node = dev->of_node;
>
>          ret = devm_spi_register_controller(dev, ctlr);
>          if (ret) {
> diff --git a/drivers/spi/spi-img-spfi.c b/drivers/spi/spi-img-spfi.c
> index 168ccf51f6d4..902fb64815c9 100644
> --- a/drivers/spi/spi-img-spfi.c
> +++ b/drivers/spi/spi-img-spfi.c
> @@ -587,7 +587,6 @@ static int img_spfi_probe(struct platform_device *pdev)
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_TX_DUAL | SPI_RX_DUAL;
>          if (of_property_read_bool(spfi->dev->of_node, "img,supports-quad-mode"))
>                  host->mode_bits |= SPI_TX_QUAD | SPI_RX_QUAD;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(8);
>          host->max_speed_hz = clk_get_rate(spfi->spfi_clk) / 4;
>          host->min_speed_hz = clk_get_rate(spfi->spfi_clk) / 512;
> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 69c288c8c737..f65c0bf11a73 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -2368,7 +2368,6 @@ static int spi_imx_probe(struct platform_device *pdev)
>
>          spi_imx->devtype_data->intctrl(spi_imx, 0);
>
> -       controller->dev.of_node = pdev->dev.of_node;
>          ret = spi_register_controller(controller);
>          if (ret) {
>                  dev_err_probe(&pdev->dev, ret, "register controller failed\n");
> diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
> index 318b0768701e..adcf85bccbcc 100644
> --- a/drivers/spi/spi-ingenic.c
> +++ b/drivers/spi/spi-ingenic.c
> @@ -442,7 +442,6 @@ static int spi_ingenic_probe(struct platform_device *pdev)
>          ctlr->use_gpio_descriptors = true;
>          ctlr->max_native_cs = pdata->max_native_cs;
>          ctlr->num_chipselect = num_cs;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>
>          if (spi_ingenic_request_dma(ctlr, dev))
>                  dev_warn(dev, "DMA not available.\n");
> diff --git a/drivers/spi/spi-lantiq-ssc.c b/drivers/spi/spi-lantiq-ssc.c
> index 60849e07f674..f83cb63c9d0c 100644
> --- a/drivers/spi/spi-lantiq-ssc.c
> +++ b/drivers/spi/spi-lantiq-ssc.c
> @@ -962,7 +962,6 @@ static int lantiq_ssc_probe(struct platform_device *pdev)
>          spi->bits_per_word = 8;
>          spi->speed_hz = 0;
>
> -       host->dev.of_node = pdev->dev.of_node;
>          host->num_chipselect = num_cs;
>          host->use_gpio_descriptors = true;
>          host->setup = lantiq_ssc_setup;
> diff --git a/drivers/spi/spi-lp8841-rtc.c b/drivers/spi/spi-lp8841-rtc.c
> index 382e2a69f7a7..e466866d5e80 100644
> --- a/drivers/spi/spi-lp8841-rtc.c
> +++ b/drivers/spi/spi-lp8841-rtc.c
> @@ -200,7 +200,6 @@ spi_lp8841_rtc_probe(struct platform_device *pdev)
>          host->transfer_one = spi_lp8841_rtc_transfer_one;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
>   #ifdef CONFIG_OF
> -       host->dev.of_node = pdev->dev.of_node;
>   #endif
>
>          data = spi_controller_get_devdata(host);
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index 6b9137307533..a7001b9e36e6 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -1054,7 +1054,6 @@ static int meson_spicc_probe(struct platform_device *pdev)
>          device_reset_optional(&pdev->dev);
>
>          host->num_chipselect = 4;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LOOP;
>          host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX);
>          host->min_speed_hz = spicc->data->min_speed_hz;
> diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
> index ef7efeaeee97..b818950a8cb7 100644
> --- a/drivers/spi/spi-meson-spifc.c
> +++ b/drivers/spi/spi-meson-spifc.c
> @@ -322,7 +322,6 @@ static int meson_spifc_probe(struct platform_device *pdev)
>          rate = clk_get_rate(spifc->clk);
>
>          host->num_chipselect = 1;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
>          host->auto_runtime_pm = true;
>          host->transfer_one = meson_spifc_transfer_one;
> diff --git a/drivers/spi/spi-microchip-core-spi.c b/drivers/spi/spi-microchip-core-spi.c
> index c8ebb58e0369..a4c128ae391b 100644
> --- a/drivers/spi/spi-microchip-core-spi.c
> +++ b/drivers/spi/spi-microchip-core-spi.c
> @@ -360,7 +360,6 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
>          host->transfer_one = mchp_corespi_transfer_one;
>          host->set_cs = mchp_corespi_set_cs;
> -       host->dev.of_node = dev->of_node;
>
>          ret = of_property_read_u32(dev->of_node, "fifo-depth", &spi->fifo_depth);
>          if (ret)
> diff --git a/drivers/spi/spi-mpc52xx.c b/drivers/spi/spi-mpc52xx.c
> index 6d4dde15ac54..14188a6ba5a1 100644
> --- a/drivers/spi/spi-mpc52xx.c
> +++ b/drivers/spi/spi-mpc52xx.c
> @@ -430,7 +430,6 @@ static int mpc52xx_spi_probe(struct platform_device *op)
>          host->transfer = mpc52xx_spi_transfer;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
> -       host->dev.of_node = op->dev.of_node;
>
>          platform_set_drvdata(op, host);
>
> diff --git a/drivers/spi/spi-mpfs.c b/drivers/spi/spi-mpfs.c
> index 7e9e64d8e6c8..64d15a6188ac 100644
> --- a/drivers/spi/spi-mpfs.c
> +++ b/drivers/spi/spi-mpfs.c
> @@ -550,7 +550,6 @@ static int mpfs_spi_probe(struct platform_device *pdev)
>          host->transfer_one = mpfs_spi_transfer_one;
>          host->prepare_message = mpfs_spi_prepare_message;
>          host->set_cs = mpfs_spi_set_cs;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          spi = spi_controller_get_devdata(host);
>
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 90e5813cfdc3..0368a26bca9a 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -1184,7 +1184,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
>                  return -ENOMEM;
>
>          host->auto_runtime_pm = true;
> -       host->dev.of_node = dev->of_node;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
>
>          host->set_cs = mtk_spi_set_cs;
> diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
> index 3770b8e096a4..bbedfad2ccae 100644
> --- a/drivers/spi/spi-mt7621.c
> +++ b/drivers/spi/spi-mt7621.c
> @@ -348,7 +348,6 @@ static int mt7621_spi_probe(struct platform_device *pdev)
>          host->set_cs = mt7621_spi_set_native_cs;
>          host->transfer_one = mt7621_spi_transfer_one;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
> -       host->dev.of_node = pdev->dev.of_node;
>          host->max_native_cs = MT7621_NATIVE_CS_COUNT;
>          host->num_chipselect = MT7621_NATIVE_CS_COUNT;
>          host->use_gpio_descriptors = true;
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 5cc4632e13d7..1e5ec0840174 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -851,7 +851,6 @@ static int mtk_nor_probe(struct platform_device *pdev)
>          }
>
>          ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->max_message_size = mtk_max_msg_size;
>          ctlr->mem_ops = &mtk_nor_mem_ops;
>          ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index ae38c244e258..7f7d0dfec743 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -1448,7 +1448,6 @@ static int mtk_snand_probe(struct platform_device *pdev)
>          ctlr->mem_caps = &mtk_snand_mem_caps;
>          ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
>          ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD | SPI_TX_DUAL | SPI_TX_QUAD;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ret = spi_register_controller(ctlr);
>          if (ret) {
>                  dev_err(&pdev->dev, "spi_register_controller failed.\n");
> diff --git a/drivers/spi/spi-mux.c b/drivers/spi/spi-mux.c
> index 0eb35c4e3987..bd122de152c0 100644
> --- a/drivers/spi/spi-mux.c
> +++ b/drivers/spi/spi-mux.c
> @@ -161,7 +161,6 @@ static int spi_mux_probe(struct spi_device *spi)
>          ctlr->setup = spi_mux_setup;
>          ctlr->num_chipselect = mux_control_states(priv->mux);
>          ctlr->bus_num = -1;
> -       ctlr->dev.of_node = spi->dev.of_node;
>          ctlr->must_async = true;
>          ctlr->defer_optimize_message = true;
>
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index eeaea6a5e310..f9369c69911c 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -768,7 +768,6 @@ static int mxic_spi_probe(struct platform_device *pdev)
>          mxic = spi_controller_get_devdata(host);
>          mxic->dev = &pdev->dev;
>
> -       host->dev.of_node = pdev->dev.of_node;
>
>          mxic->ps_clk = devm_clk_get(&pdev->dev, "ps_clk");
>          if (IS_ERR(mxic->ps_clk))
> diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> index cccd17f24775..3961b0ccdb4b 100644
> --- a/drivers/spi/spi-npcm-fiu.c
> +++ b/drivers/spi/spi-npcm-fiu.c
> @@ -746,7 +746,6 @@ static int npcm_fiu_probe(struct platform_device *pdev)
>          ctrl->bus_num = -1;
>          ctrl->mem_ops = &npcm_fiu_mem_ops;
>          ctrl->num_chipselect = fiu->info->max_cs;
> -       ctrl->dev.of_node = dev->of_node;
>
>          return devm_spi_register_controller(dev, ctrl);
>   }
> diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
> index 98b6479b961c..e60b3cc398ec 100644
> --- a/drivers/spi/spi-npcm-pspi.c
> +++ b/drivers/spi/spi-npcm-pspi.c
> @@ -401,7 +401,6 @@ static int npcm_pspi_probe(struct platform_device *pdev)
>          host->max_speed_hz = DIV_ROUND_UP(clk_hz, NPCM_PSPI_MIN_CLK_DIVIDER);
>          host->min_speed_hz = DIV_ROUND_UP(clk_hz, NPCM_PSPI_MAX_CLK_DIVIDER);
>          host->mode_bits = SPI_CPHA | SPI_CPOL;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = -1;
>          host->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
>          host->transfer_one = npcm_pspi_transfer_one;
> diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
> index 25339492bf3a..06fcdf22990b 100644
> --- a/drivers/spi/spi-nxp-xspi.c
> +++ b/drivers/spi/spi-nxp-xspi.c
> @@ -1290,7 +1290,6 @@ static int nxp_xspi_probe(struct platform_device *pdev)
>          ctlr->num_chipselect = NXP_XSPI_MAX_CHIPSELECT;
>          ctlr->mem_ops = &nxp_xspi_mem_ops;
>          ctlr->mem_caps = &nxp_xspi_mem_caps;
> -       ctlr->dev.of_node = dev->of_node;
>
>          return devm_spi_register_controller(dev, ctlr);
>   }
> diff --git a/drivers/spi/spi-oc-tiny.c b/drivers/spi/spi-oc-tiny.c
> index cba229920357..29333b1f82d7 100644
> --- a/drivers/spi/spi-oc-tiny.c
> +++ b/drivers/spi/spi-oc-tiny.c
> @@ -192,7 +192,6 @@ static int tiny_spi_of_probe(struct platform_device *pdev)
>
>          if (!np)
>                  return 0;
> -       hw->bitbang.ctlr->dev.of_node = pdev->dev.of_node;
>          if (!of_property_read_u32(np, "clock-frequency", &val))
>                  hw->freq = val;
>          if (!of_property_read_u32(np, "baud-width", &val))
> diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
> index 43bd9f21137f..7a2186b51b4c 100644
> --- a/drivers/spi/spi-orion.c
> +++ b/drivers/spi/spi-orion.c
> @@ -780,7 +780,6 @@ static int orion_spi_probe(struct platform_device *pdev)
>          if (status < 0)
>                  goto out_rel_pm;
>
> -       host->dev.of_node = pdev->dev.of_node;
>          status = spi_register_controller(host);
>          if (status < 0)
>                  goto out_rel_pm;
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index 9e56e8774614..c32a1fba31ef 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -1893,7 +1893,6 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>          host->handle_err = pl022_handle_err;
>          host->unprepare_transfer_hardware = pl022_unprepare_transfer_hardware;
>          host->rt = platform_info->rt;
> -       host->dev.of_node = dev->of_node;
>          host->use_gpio_descriptors = true;
>
>          /*
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3aeddada58e1..7e39038160e0 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -763,7 +763,6 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>          host->dma_alignment = QSPI_ALIGN_REQ;
>          host->num_chipselect = QSPI_NUM_CS;
>          host->bus_num = -1;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->mode_bits = SPI_MODE_0 |
>                            SPI_TX_DUAL | SPI_RX_DUAL |
>                            SPI_TX_QUAD | SPI_RX_QUAD;
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 0334ba738bef..d7fef48f20ef 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -1583,7 +1583,6 @@ static int qcom_spi_probe(struct platform_device *pdev)
>          ctlr->num_chipselect = QPIC_QSPI_NUM_CS;
>          ctlr->mem_ops = &qcom_spi_mem_ops;
>          ctlr->mem_caps = &qcom_spi_mem_caps;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->mode_bits = SPI_TX_DUAL | SPI_RX_DUAL |
>                              SPI_TX_QUAD | SPI_RX_QUAD;
>
> diff --git a/drivers/spi/spi-qup.c b/drivers/spi/spi-qup.c
> index 7d647edf6bc3..6cbdcd060e8c 100644
> --- a/drivers/spi/spi-qup.c
> +++ b/drivers/spi/spi-qup.c
> @@ -1091,7 +1091,6 @@ static int spi_qup_probe(struct platform_device *pdev)
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(4, 32);
>          host->max_speed_hz = max_freq;
>          host->transfer_one = spi_qup_transfer_one;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->auto_runtime_pm = true;
>          host->dma_alignment = dma_get_cache_alignment();
>          host->max_dma_len = SPI_MAX_XFER;
> diff --git a/drivers/spi/spi-rb4xx.c b/drivers/spi/spi-rb4xx.c
> index 22b86fc89132..7b944f2819ec 100644
> --- a/drivers/spi/spi-rb4xx.c
> +++ b/drivers/spi/spi-rb4xx.c
> @@ -160,7 +160,6 @@ static int rb4xx_spi_probe(struct platform_device *pdev)
>          if (IS_ERR(ahb_clk))
>                  return PTR_ERR(ahb_clk);
>
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = 0;
>          host->num_chipselect = 3;
>          host->mode_bits = SPI_TX_DUAL;
> diff --git a/drivers/spi/spi-realtek-rtl.c b/drivers/spi/spi-realtek-rtl.c
> index 0b0123e20b54..d7acc02105ca 100644
> --- a/drivers/spi/spi-realtek-rtl.c
> +++ b/drivers/spi/spi-realtek-rtl.c
> @@ -169,7 +169,6 @@ static int realtek_rtl_spi_probe(struct platform_device *pdev)
>
>          init_hw(rtspi);
>
> -       ctrl->dev.of_node = pdev->dev.of_node;
>          ctrl->flags = SPI_CONTROLLER_HALF_DUPLEX;
>          ctrl->set_cs = rt_set_cs;
>          ctrl->transfer_one = transfer_one;
> diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
> index b3c2b03b1153..2990bf85ee47 100644
> --- a/drivers/spi/spi-rockchip-sfc.c
> +++ b/drivers/spi/spi-rockchip-sfc.c
> @@ -622,7 +622,6 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
>          host->flags = SPI_CONTROLLER_HALF_DUPLEX;
>          host->mem_ops = &rockchip_sfc_mem_ops;
>          host->mem_caps = &rockchip_sfc_mem_caps;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->mode_bits = SPI_TX_QUAD | SPI_TX_DUAL | SPI_RX_QUAD | SPI_RX_DUAL;
>          host->max_speed_hz = SFC_MAX_SPEED;
>          host->num_chipselect = SFC_MAX_CHIPSELECT_NUM;
> diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> index 1a6381de6f33..3ab3f43a80d5 100644
> --- a/drivers/spi/spi-rockchip.c
> +++ b/drivers/spi/spi-rockchip.c
> @@ -858,7 +858,6 @@ static int rockchip_spi_probe(struct platform_device *pdev)
>                  ctlr->num_chipselect = num_cs;
>                  ctlr->use_gpio_descriptors = true;
>          }
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->bits_per_word_mask = SPI_BPW_MASK(16) | SPI_BPW_MASK(8) | SPI_BPW_MASK(4);
>          ctlr->min_speed_hz = rs->freq / BAUDR_SCKDV_MAX;
>          ctlr->max_speed_hz = min(rs->freq / BAUDR_SCKDV_MIN, MAX_SCLK_OUT);
> diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
> index 8e1d911b88b5..c739c1998b4c 100644
> --- a/drivers/spi/spi-rspi.c
> +++ b/drivers/spi/spi-rspi.c
> @@ -1338,7 +1338,6 @@ static int rspi_probe(struct platform_device *pdev)
>          ctlr->min_speed_hz = DIV_ROUND_UP(clksrc, ops->max_div);
>          ctlr->max_speed_hz = DIV_ROUND_UP(clksrc, ops->min_div);
>          ctlr->flags = ops->flags;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->use_gpio_descriptors = true;
>          ctlr->max_native_cs = rspi->ops->num_hw_ss;
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index aab36c779c06..4fbefd85d2e2 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1295,7 +1295,6 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
>          sdd->tx_dma.direction = DMA_MEM_TO_DEV;
>          sdd->rx_dma.direction = DMA_DEV_TO_MEM;
>
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = -1;
>          host->setup = s3c64xx_spi_setup;
>          host->cleanup = s3c64xx_spi_cleanup;
> diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
> index 37f1cfe10be4..f3bcb8a1b92b 100644
> --- a/drivers/spi/spi-sg2044-nor.c
> +++ b/drivers/spi/spi-sg2044-nor.c
> @@ -455,7 +455,6 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
>                  return PTR_ERR(spifmc->io_base);
>
>          ctrl->num_chipselect = 1;
> -       ctrl->dev.of_node = pdev->dev.of_node;
>          ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
>          ctrl->auto_runtime_pm = false;
>          ctrl->mem_ops = &sg2044_spifmc_mem_ops;
> diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
> index 93017faeb7b5..e03eaca1b1a7 100644
> --- a/drivers/spi/spi-sh-hspi.c
> +++ b/drivers/spi/spi-sh-hspi.c
> @@ -253,7 +253,6 @@ static int hspi_probe(struct platform_device *pdev)
>
>          ctlr->bus_num = pdev->id;
>          ctlr->mode_bits = SPI_CPOL | SPI_CPHA;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->auto_runtime_pm = true;
>          ctlr->transfer_one_message = hspi_transfer_one_message;
>          ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index b695870fae8c..7f3e08810560 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -1276,7 +1276,6 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
>          ctlr->flags = chipdata->ctlr_flags;
>          ctlr->bus_num = pdev->id;
>          ctlr->num_chipselect = p->info->num_chipselect;
> -       ctlr->dev.of_node = dev->of_node;
>          ctlr->setup = sh_msiof_spi_setup;
>          ctlr->prepare_message = sh_msiof_prepare_message;
>          ctlr->target_abort = sh_msiof_target_abort;
> diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
> index 87bde2a207a3..6c7aba8befa0 100644
> --- a/drivers/spi/spi-sifive.c
> +++ b/drivers/spi/spi-sifive.c
> @@ -368,7 +368,6 @@ static int sifive_spi_probe(struct platform_device *pdev)
>          }
>
>          /* Define our host */
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = pdev->id;
>          host->num_chipselect = num_cs;
>          host->mode_bits = SPI_CPHA | SPI_CPOL
> diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
> index e331df967385..ce889cb33228 100644
> --- a/drivers/spi/spi-slave-mt27xx.c
> +++ b/drivers/spi/spi-slave-mt27xx.c
> @@ -395,7 +395,6 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
>          }
>
>          ctlr->auto_runtime_pm = true;
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->mode_bits = SPI_CPOL | SPI_CPHA;
>          ctlr->mode_bits |= SPI_LSB_FIRST;
>
> diff --git a/drivers/spi/spi-sn-f-ospi.c b/drivers/spi/spi-sn-f-ospi.c
> index c4969f66a0ba..bfcc140df810 100644
> --- a/drivers/spi/spi-sn-f-ospi.c
> +++ b/drivers/spi/spi-sn-f-ospi.c
> @@ -628,7 +628,6 @@ static int f_ospi_probe(struct platform_device *pdev)
>                  return -ENOMEM;
>          }
>          ctlr->num_chipselect = num_cs;
> -       ctlr->dev.of_node = dev->of_node;
>
>          ospi = spi_controller_get_devdata(ctlr);
>          ospi->dev = dev;
> diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
> index 262c11d977ea..a05cc9a0a4ae 100644
> --- a/drivers/spi/spi-sprd-adi.c
> +++ b/drivers/spi/spi-sprd-adi.c
> @@ -571,7 +571,6 @@ static int sprd_adi_probe(struct platform_device *pdev)
>          if (sadi->data->wdg_rst)
>                  sadi->data->wdg_rst(sadi);
>
> -       ctlr->dev.of_node = pdev->dev.of_node;
>          ctlr->bus_num = pdev->id;
>          ctlr->num_chipselect = num_chipselect;
>          ctlr->flags = SPI_CONTROLLER_HALF_DUPLEX;
> diff --git a/drivers/spi/spi-sprd.c b/drivers/spi/spi-sprd.c
> index ad75f5f0f2bf..0f9fc320363c 100644
> --- a/drivers/spi/spi-sprd.c
> +++ b/drivers/spi/spi-sprd.c
> @@ -936,7 +936,6 @@ static int sprd_spi_probe(struct platform_device *pdev)
>
>          ss->phy_base = res->start;
>          ss->dev = &pdev->dev;
> -       sctlr->dev.of_node = pdev->dev.of_node;
>          sctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_3WIRE | SPI_TX_DUAL;
>          sctlr->bus_num = pdev->id;
>          sctlr->set_cs = sprd_spi_chipselect;
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 58d8cec74c7b..c98afe02a1b6 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -942,7 +942,6 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>          ctrl->use_gpio_descriptors = true;
>          ctrl->transfer_one_message = stm32_ospi_transfer_one_message;
>          ctrl->num_chipselect = STM32_OSPI_MAX_NORCHIP;
> -       ctrl->dev.of_node = dev->of_node;
>
>          pm_runtime_enable(ospi->dev);
>          pm_runtime_set_autosuspend_delay(ospi->dev, STM32_AUTOSUSPEND_DELAY);
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 5354faef936a..df1bbacec90a 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -860,7 +860,6 @@ static int stm32_qspi_probe(struct platform_device *pdev)
>          ctrl->use_gpio_descriptors = true;
>          ctrl->transfer_one_message = stm32_qspi_transfer_one_message;
>          ctrl->num_chipselect = STM32_QSPI_MAX_NORCHIP;
> -       ctrl->dev.of_node = dev->of_node;
>
>          pm_runtime_set_autosuspend_delay(dev, STM32_AUTOSUSPEND_DELAY);
>          pm_runtime_use_autosuspend(dev);
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 5c1e685a65d9..b99de8c4cc99 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2464,7 +2464,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
>                  goto err_clk_disable;
>          }
>
> -       ctrl->dev.of_node = pdev->dev.of_node;
>          ctrl->auto_runtime_pm = true;
>          ctrl->bus_num = pdev->id;
>          ctrl->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LSB_FIRST |
> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index aa92fd5a35a9..bfdf419a583c 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -471,7 +471,6 @@ static int sun4i_spi_probe(struct platform_device *pdev)
>          host->num_chipselect = 4;
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
> -       host->dev.of_node = pdev->dev.of_node;
>          host->auto_runtime_pm = true;
>          host->max_transfer_size = sun4i_spi_max_transfer_size;
>
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index d1de6c99e762..240e46f84f7b 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -673,7 +673,6 @@ static int sun6i_spi_probe(struct platform_device *pdev)
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST |
>                            sspi->cfg->mode_bits;
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
> -       host->dev.of_node = pdev->dev.of_node;
>          host->auto_runtime_pm = true;
>          host->max_transfer_size = sun6i_spi_max_transfer_size;
>
> diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
> index 795a8482c2c7..391823c3483f 100644
> --- a/drivers/spi/spi-tegra114.c
> +++ b/drivers/spi/spi-tegra114.c
> @@ -1412,7 +1412,6 @@ static int tegra_spi_probe(struct platform_device *pdev)
>                  goto exit_pm_disable;
>          }
>
> -       host->dev.of_node = pdev->dev.of_node;
>          ret = devm_spi_register_controller(&pdev->dev, host);
>          if (ret < 0) {
>                  dev_err(&pdev->dev, "can not register to host err %d\n", ret);
> diff --git a/drivers/spi/spi-tegra20-sflash.c b/drivers/spi/spi-tegra20-sflash.c
> index d5c8ee20b8e5..d9d536d7f7b6 100644
> --- a/drivers/spi/spi-tegra20-sflash.c
> +++ b/drivers/spi/spi-tegra20-sflash.c
> @@ -505,7 +505,6 @@ static int tegra_sflash_probe(struct platform_device *pdev)
>          tegra_sflash_writel(tsd, tsd->def_command_reg, SPI_COMMAND);
>          pm_runtime_put(&pdev->dev);
>
> -       host->dev.of_node = pdev->dev.of_node;
>          ret = devm_spi_register_controller(&pdev->dev, host);
>          if (ret < 0) {
>                  dev_err(&pdev->dev, "can not register to host err %d\n", ret);
> diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
> index fe452d03c1ee..7d6f3fe8b7e3 100644
> --- a/drivers/spi/spi-tegra20-slink.c
> +++ b/drivers/spi/spi-tegra20-slink.c
> @@ -1103,7 +1103,6 @@ static int tegra_slink_probe(struct platform_device *pdev)
>          tegra_slink_writel(tspi, tspi->def_command_reg, SLINK_COMMAND);
>          tegra_slink_writel(tspi, tspi->def_command2_reg, SLINK_COMMAND2);
>
> -       host->dev.of_node = pdev->dev.of_node;
>          ret = spi_register_controller(host);
>          if (ret < 0) {
>                  dev_err(&pdev->dev, "can not register to host err %d\n", ret);
> diff --git a/drivers/spi/spi-tegra210-quad.c b/drivers/spi/spi-tegra210-quad.c
> index cdc3cb7c01f9..8b5f5ded7943 100644
> --- a/drivers/spi/spi-tegra210-quad.c
> +++ b/drivers/spi/spi-tegra210-quad.c
> @@ -1743,7 +1743,6 @@ static int tegra_qspi_probe(struct platform_device *pdev)
>                  goto exit_pm_disable;
>          }
>
> -       host->dev.of_node = pdev->dev.of_node;
>          ret = spi_register_controller(host);
>          if (ret < 0) {
>                  dev_err(&pdev->dev, "failed to register host: %d\n", ret);
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index 0b7eaccbc797..d1d880a8ed7d 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -775,7 +775,6 @@ static int ti_qspi_probe(struct platform_device *pdev)
>          host->setup = ti_qspi_setup;
>          host->auto_runtime_pm = true;
>          host->transfer_one_message = ti_qspi_start_transfer_one;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(16) |
>                                     SPI_BPW_MASK(8);
>          host->mem_ops = &ti_qspi_mem_ops;
> diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
> index ff2142f87277..9e1d364a6198 100644
> --- a/drivers/spi/spi-uniphier.c
> +++ b/drivers/spi/spi-uniphier.c
> @@ -697,7 +697,6 @@ static int uniphier_spi_probe(struct platform_device *pdev)
>          host->max_speed_hz = DIV_ROUND_UP(clk_rate, SSI_MIN_CLK_DIVIDER);
>          host->min_speed_hz = DIV_ROUND_UP(clk_rate, SSI_MAX_CLK_DIVIDER);
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH | SPI_LSB_FIRST;
> -       host->dev.of_node = pdev->dev.of_node;
>          host->bus_num = pdev->id;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
>
> diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
> index a9aee2a6c7dc..0e3ee5516587 100644
> --- a/drivers/spi/spi-wpcm-fiu.c
> +++ b/drivers/spi/spi-wpcm-fiu.c
> @@ -471,7 +471,6 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
>          ctrl->bus_num = -1;
>          ctrl->mem_ops = &wpcm_fiu_mem_ops;
>          ctrl->num_chipselect = 4;
> -       ctrl->dev.of_node = dev->of_node;
>
>          /*
>           * The FIU doesn't include a clock divider, the clock is entirely
> diff --git a/drivers/spi/spi-xcomm.c b/drivers/spi/spi-xcomm.c
> index 33b78c537520..130a3d716dd4 100644
> --- a/drivers/spi/spi-xcomm.c
> +++ b/drivers/spi/spi-xcomm.c
> @@ -260,7 +260,6 @@ static int spi_xcomm_probe(struct i2c_client *i2c)
>          host->bits_per_word_mask = SPI_BPW_MASK(8);
>          host->flags = SPI_CONTROLLER_HALF_DUPLEX;
>          host->transfer_one_message = spi_xcomm_transfer_one;
> -       host->dev.of_node = i2c->dev.of_node;
>
>          ret = devm_spi_register_controller(&i2c->dev, host);
>          if (ret < 0)
> diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
> index c86dc56f38b4..7d8f5460bebf 100644
> --- a/drivers/spi/spi-xilinx.c
> +++ b/drivers/spi/spi-xilinx.c
> @@ -447,7 +447,6 @@ static int xilinx_spi_probe(struct platform_device *pdev)
>
>          host->bus_num = pdev->id;
>          host->num_chipselect = num_cs;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          /*
>           * Detect endianess on the IP via loop bit in CR. Detection
> diff --git a/drivers/spi/spi-xlp.c b/drivers/spi/spi-xlp.c
> index 2fec18b68449..be8bbe1cbba3 100644
> --- a/drivers/spi/spi-xlp.c
> +++ b/drivers/spi/spi-xlp.c
> @@ -409,7 +409,6 @@ static int xlp_spi_probe(struct platform_device *pdev)
>          host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
>          host->setup = xlp_spi_setup;
>          host->transfer_one = xlp_spi_transfer_one;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          init_completion(&xspi->done);
>          spi_controller_set_devdata(host, xspi);
> diff --git a/drivers/spi/spi-xtensa-xtfpga.c b/drivers/spi/spi-xtensa-xtfpga.c
> index 1b54d8f9f5ec..71f0f176cfd9 100644
> --- a/drivers/spi/spi-xtensa-xtfpga.c
> +++ b/drivers/spi/spi-xtensa-xtfpga.c
> @@ -90,7 +90,6 @@ static int xtfpga_spi_probe(struct platform_device *pdev)
>          host->flags = SPI_CONTROLLER_NO_RX;
>          host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 16);
>          host->bus_num = pdev->dev.id;
> -       host->dev.of_node = pdev->dev.of_node;
>
>          xspi = spi_controller_get_devdata(host);
>          xspi->bitbang.ctlr = host;
> --
> 2.50.1
>


