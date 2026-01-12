Return-Path: <openbmc+bounces-1172-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1BCD1598C
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:41:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnRG6Vh7z2yFx;
	Tue, 13 Jan 2026 09:41:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768227608;
	cv=none; b=RUqq1ycFgbgmb4qJPG4NY0Ig1cmFTvTb5/LblvHqcRorz3RlktdF4Sv1aQEnGBmWrNcvghBJNRA637yzruc5mAB1TIhbTOMfOL7HpYmSKa6LL0N6uH121D2A9B+08Zhh3spPc3iWsbqjeJemZz/CbXkQgklq+x2Ne2nNwRb+gkc8DYNIHIeAToVtl3TyW6ZYC5ky1VDLkDQ/zMMwANw6ogMnSIZ0TvOBHOSTl9JJTM5SmIb4byGvZDrrhlUjY1S4fE8/HRXv95eeSrff32m2wCnQWC0YnDyQeC+lLJKvRf/u0UtMPjuEDWZZxm61JrNnlB/bwlE7QZUjBUoMLEqATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768227608; c=relaxed/relaxed;
	bh=S8c2ARP9HcnV+reUeOF4Vcg2quHBkPmCAqYrhfyr6c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WJ28y7IfSNgnYfU+kTQhHFJnSKt5Rg7LwxYEM+EHbMMMocyMNgH8/lLb+djYMQ6uWp631AP1vNx2c2LChhd2+lpZpxCQpCYx/RDRd73L5LY31AmNsvCs50ghX+ncGjKUdaQzk8GR2gYe0aEcfzs5nOyiu5NnFOI6xiZOfngAb06Nm1SvW28XyEk54nAkx677PMEppj8FFzaIBHjGR3cnHC/nGoPJKOaZti7KT77cB53RAa9kb5+v7OvtYiAOi9XJec0KkMqOhYykrQQP/UFp6UuumFrW+8oi3qrxbfmXar0/HEZdd5YuvDbhisuT8o6OfPQ2OBhOI5tOJ2Ppb8Xg1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CakAumhF; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=benoit.monin@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CakAumhF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=benoit.monin@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 503 seconds by postgrey-1.37 at boromir; Tue, 13 Jan 2026 01:20:06 AEDT
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqZK26mdkz2xPW
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 01:20:05 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5059C1A27F1;
	Mon, 12 Jan 2026 14:11:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D1FB6074A;
	Mon, 12 Jan 2026 14:11:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 736BF103C8C61;
	Mon, 12 Jan 2026 15:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768227090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S8c2ARP9HcnV+reUeOF4Vcg2quHBkPmCAqYrhfyr6c0=;
	b=CakAumhFpasu+3ZI3BaB812kdRiuu+v1Tg/Sp3TTEi8pdVKDZEtVO84AoLEgEc1xrnFluT
	i+SAwVNTU/VK298rD4GgfOlbL1x1IRBq+LMtmjrslvr8iNw/wqHBq7SowNZ+1bxrqAdaPR
	ziVMPo032s+fSJqG9mpYJmDIazpKyi53yb/qGj1zj4VwwbAj77lJfzPnCy7GfnRvSCaoiG
	VLNhV0T9IC//MbbHQG1tnGAF03XNmqvN+K3xG6/Renyw+hJ5Ia+fO3n6d7mTvuZI7e4oUm
	CIup66ln9btW8iWglHRpKXcMS5I6EydGAat63GN0yLYYuyDF497mBLdXxOQ06g==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 David Lechner <dlechner@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Shiji Yang <yangshiji66@outlook.com>,
 James Clark <james.clark@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 Carlos Song <carlos.song@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Huacai Chen <chenhuacai@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Sergio Perez Gonzalez <sperezglz@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>,
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Le Goffic <clement.legoffic@foss.st.com>,
 Alessandro Grassi <alessandro.grassi@mailbox.org>,
 Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>,
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>,
 Haixu Cui <quic_haixcui@quicinc.com>,
 Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 William Zhang <william.zhang@broadcom.com>,
 Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>,
 Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Heiko Stuebner <heiko@sntech.de>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v1 4/4] spi: Drop duplicate device_set_node() call
Date: Mon, 12 Jan 2026 15:10:36 +0100
Message-ID: <2776743.vuYhMxLoTh@benoit.monin>
In-Reply-To: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
References:
 <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thursday, 8 January 2026 at 21:23:41 CET, Andy Shevchenko wrote:
> The SPI core provides the default fwnode for the controller,
> assigned by device_set_node(). No need to repeat it in the driver.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-dw-core.c           | 2 --
>=20
Works fine on Mobileye EyeQ6Lplus SoC in both host and target mode.

Tested-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com> # dw mobileye

Thanks,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




