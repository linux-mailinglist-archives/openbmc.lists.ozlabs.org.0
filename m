Return-Path: <openbmc+bounces-1174-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38487D159B0
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:46:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnXx6QG6z2yFs;
	Tue, 13 Jan 2026 09:46:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=91.207.212.93 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768205191;
	cv=pass; b=acrDWBIM3VT0wmuC5AVH1GkO7u9c2GyLBct+XWL9ueJaG1oVV2I5+uURvYRzYZX39LE0ReQsPJbKdiGhVdDk5p++X9VfGWGl9QsucrEHsK1bFmzxpWKrqUWzFcQaaF0QmSXa8b12SN/By4CnN6dDIsDZomGEYCvCLqi3VRoOIu8keJttFnUjF1xD1CMzB0Wn/vBpDjoZ+ZCDHj8LYJMEWi10G9GwkHUfb3ffJOuvd77tHb3WxbIaQhvahXYj3fl2f41LdCY570VEERUjsECjk9Bm91H4CWGuqDeXYkEru3Bz5Hor0VUigyZQRL+1V1fITFJ48Zz4NNg7GkEo9qV1MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768205191; c=relaxed/relaxed;
	bh=jjMwkYQ16vfqedNTreqjsfPnukp+Z8KjoPS2xsulImw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k7+l+jtDE1vheqzdh5c3CbCuIcXCoRp4TOv9ItWf0Q6VNB/kcjipj7HuF5WCo4t0P6POOEHCA5+Jh56KXKbSZbyc1xcoJmYWfFMQ7x8P8bhZ4Nl/FQ+RF6F+MxntSaIKhKuXHdpzfR/lkWbT5SQIb7DHSXv/d9j2Yd7FT8iK5PdVVB0XyXB5/wy527lESZch6VeQCxPkEWlTAxh8/wU33plTXyxeNhVnt/Ni55sHsQv3S9PHceDWfsvjvMIqQb1jf2eQpnjQpkYt7lY0pPILPy/qcL47naaD03fIb5Cbfa9n+m4msasxsKLMdj5HOfqSwq0cndinMzUAaNmrDL1ykg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dKuKr6e6; dkim-atps=neutral; spf=pass (client-ip=91.207.212.93; helo=mx07-00178001.pphosted.com; envelope-from=prvs=5472516283=amelie.delaunay@foss.st.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.st.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=dKuKr6e6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foss.st.com (client-ip=91.207.212.93; helo=mx07-00178001.pphosted.com; envelope-from=prvs=5472516283=amelie.delaunay@foss.st.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 863 seconds by postgrey-1.37 at boromir; Mon, 12 Jan 2026 19:06:30 AEDT
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqQ1y1mJvz2yv9;
	Mon, 12 Jan 2026 19:06:29 +1100 (AEDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7cNla3097038;
	Mon, 12 Jan 2026 08:50:52 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bkcs84kxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 08:50:51 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngUqrA1w17P4duKmGIQQ7gqWijxd9Mc6ADUaYoVzDQ1D/8OXWUQtYaG1yiobMlgXgitr/NkqEDxYjPFob8ZNR+AXkKlRql0YeRmY+14QKK3u9P0Qv45nF2UbNBGuhGfmt5BzhNyo8k01DuM5umaLWjxYVLZJnwwSjlwSYu3HxpUq6aNEGWl2A161eASzyPz+4qLofnhT6h8UQmtnGwG2dzpVGf2AbmLaGpnsBPjnqBL3pE+e+hTcmgrDXHQWqBlFIv6AbH455ZkNJw3dOJmIZVqsXoqfpKSjvrvppcL9ypN//MHXQnMto6tSwwKBRk/a/pxeukZqJk8ftXSKwoaC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjMwkYQ16vfqedNTreqjsfPnukp+Z8KjoPS2xsulImw=;
 b=HgIN11kpP9DRQraFRYQU2IlHsnq76E/q+eLSUmWE8quwrU2BkdTfYTB/0BT78g8jyO/iMek4jlVHQB7UxuZF/uJYMkufu3UhNhdaM5zEQ9+xXphAWgFMMh9sfrnuvb5T92XZoharP4CpJtfbDRQLtlHtXcSTDh30pbcNPGqMvXz/aAK662BkmCkRa/zMzRvp6g52OE5vCA+Gc7JSZpj40IIR2UD51UmIqiUgKtKeEsQR9pmaszfNPcWlSCCUgjKsFvRj9nFj+5+N/riYcp2eefb1SJAOydvHoACDMxojhCYYDlbet6Cmbo0+bfZhlhE/v/KYxS2SiePRXPrmW6Wlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjMwkYQ16vfqedNTreqjsfPnukp+Z8KjoPS2xsulImw=;
 b=dKuKr6e6ris6qhtmKiTog8Q2g+D4G6+N1sDIBhIlT00qgxu5boFM1QKBdCtpbXhOGBqTx12MTxbGjSNZ6w3DA3ijB9ZsRbm8d24Knah9xQCqPJ2aN5x0SykShJ29UceJKZessjZi43a1i3jje5e2tY+daTlE3bqKHF/qPaizU97IX6p5uql/hZ7xjNt6c/GgO12uwD7ZDbkxdb0ZiqHKZJalAwlvCfVK3VjKy1qLfLquH9EC4v8QMpxHvk9KD78O2TjEYc6Smkv71aSejR/oUiwHm/yqsZZwNdTaaWIP1OL6SfYRKPbcF1k7HSN1S5dxF+X34wRdGJLSLNr+jw/WrQ==
Received: from AS4P189CA0047.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::19)
 by PA6PR10MB9597.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:515::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 07:50:45 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::b6) by AS4P189CA0047.outlook.office365.com
 (2603:10a6:20b:659::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 07:50:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 07:50:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 08:52:07 +0100
Received: from [10.48.87.33] (10.48.87.33) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 12 Jan
 2026 08:50:38 +0100
Message-ID: <718e1a8f-240a-45db-80ad-0e9c97db316b@foss.st.com>
Date: Mon, 12 Jan 2026 08:50:38 +0100
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
Subject: Re: [Linux-stm32] [PATCH v1 2/4] spi: Drop duplicate of_node
 assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown
	<broonie@kernel.org>,
        Varshini Rajendran <varshini.rajendran@microchip.com>,
        Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
        "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
        Sunny Luo
	<sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
        Chin-Ting Kuo
	<chin-ting_kuo@aspeedtech.com>,
        CL Wang <cl634@andestech.com>,
        "Manikandan
 Muralidharan" <manikandan.m@microchip.com>,
        David Lechner
	<dlechner@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
        Jun Guo
	<jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
        Shiji Yang
	<yangshiji66@outlook.com>,
        James Clark <james.clark@linaro.org>,
        "Jonathan
 Marek" <jonathan@marek.ca>,
        Carlos Song <carlos.song@nxp.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>,
        Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>,
        Sergio Perez Gonzalez
	<sperezglz@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "Qianfeng
 Rong" <rongqianfeng@vivo.com>,
        Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos
	<j4g8y7@gmail.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Rosen Penev
	<rosenp@gmail.com>,
        Luis de Arquer <luis.dearquer@inertim.com>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Cosmin Tanislav
	<cosmin-gabriel.tanislav.xa@renesas.com>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Longbin Li
	<looong.bin@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        "Alessandro Grassi" <alessandro.grassi@mailbox.org>,
        Chen-Yu Tsai
	<wens@kernel.org>,
        Darshan R <rathod.darshan.0896@gmail.com>,
        Aaron Kling
	<webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>,
        Haixu Cui
	<quic_haixcui@quicinc.com>,
        Darshan Rathod <darshanrathod475@gmail.com>,
        <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <asahi@lists.linux.dev>, <linux-aspeed@lists.ozlabs.org>,
        <openbmc@lists.ozlabs.org>, <linux-rpi-kernel@lists.infradead.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <imx@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux.dev>
CC: Kursad Oney <kursad.oney@broadcom.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Lixu Zhang <lixu.zhang@intel.com>,
        "Kunihiko
 Hayashi" <hayashi.kunihiko@socionext.com>,
        Jean-Marie Verdun
	<verdun@hpe.com>, Frank Li <Frank.Li@nxp.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        "Max Filippov" <jcmvbkbc@gmail.com>,
        Conor Dooley
	<conor.dooley@microchip.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
	<rafal@milecki.pl>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        "Fabio
 Estevam" <festevam@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Li-hao
 Kuo" <lhjeff911@gmail.com>,
        Benjamin Fair <benjaminfair@google.com>,
        "Yogesh
 Gaur" <yogeshgaur.83@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Tomer
 Maimon" <tmaimon77@gmail.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        "Jonathan
 Hunter" <jonathanh@nvidia.com>,
        Nancy Yuen <yuenn@google.com>,
        "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
        "Joel
 Stanley" <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        "Kamal
 Dasu" <kamal.dasu@broadcom.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        "Anand
 Gore" <anand.gore@broadcom.com>,
        William Zhang <william.zhang@broadcom.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>,
        Ray Jui <rjui@broadcom.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?=
	<j.neuschaefer@gmx.net>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        "Jassi
 Brar" <jaswinder.singh@linaro.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Chris Packham
	<chris.packham@alliedtelesis.co.nz>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
	<clg@kaod.org>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
        Sven Peter
	<sven@kernel.org>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        "Michal
 Simek" <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Yang Shen <shenyang39@huawei.com>, Vladimir Oltean <olteanv@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Scott Branden <sbranden@broadcom.com>,
        "Daire McNamara" <daire.mcnamara@microchip.com>,
        Patrick Venture
	<venture@google.com>,
        Linus Walleij <linusw@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Robert
 Jarzmik" <robert.jarzmik@free.fr>,
        Samuel Holland
	<samuel.holland@sifive.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Avi Fishman
	<avifishman70@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sowjanya
 Komatineni <skomatineni@nvidia.com>,
        Ray Liu <ray.liu@airoha.com>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Chunyan Zhang
	<zhang.lyra@gmail.com>,
        "Paul Walmsley" <pjw@kernel.org>, Neal Gompa
	<neal@gompa.dev>,
        Shawn Guo <shawnguo@kernel.org>, Daniel Mack
	<daniel@zonque.org>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|PA6PR10MB9597:EE_
X-MS-Office365-Filtering-Correlation-Id: bba13204-3bfc-4661-bfa1-08de51af4a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|32650700017|1800799024|82310400026|36860700013|7416014|376014|7053199007|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTNFanE4YmNwK3NpVXdVR3NoTERFWVVPQStPanhBM1RSNGlWbWkreUIxTFYw?=
 =?utf-8?B?R1NvYjF4eTc1dnhyWFI4Zm84WTM0eURic3VRbkxDYTl3VVN0cnNFcmdyOGw1?=
 =?utf-8?B?dU4reHpUZkNmaWdBYlhnSURHUjNWdEZpN3ArMkl0TFl1VmZJRGRPTnMvL0dD?=
 =?utf-8?B?TTdySzZ3RXI5eDU1RVp4YUdjMGFVS0I0bDQxbUZQdStFRmN6NnhOVE1yY1lp?=
 =?utf-8?B?Rm14RHN6RnpwMWdJNmhkc3BjTjZua0o4eUROQjJzUkVHYVVJR004dnpGd3J5?=
 =?utf-8?B?d2o2ZEtjK0U5V1VDNytTempvVlBGM0R6Y1NXQkNtOE5KMC93M09RcXhsMWE3?=
 =?utf-8?B?TFA5UURTc051YUg2MzVrUU5Wc0NDTmhIUkRHMmtwNms4b3pra245OERXV1Q2?=
 =?utf-8?B?VGc1ZDUydCt5YnBnOWdnWDVnL0hONGl6cjhaaEtoaUl5dHFxdWtFZm52Rklm?=
 =?utf-8?B?V0VML0xYUVpESXQxSVlVc0dXNmdrdlg3WkpkMEkyNitrZEc0VjVWdXhDWmpm?=
 =?utf-8?B?M3ByTWxCU0thMXZ0bENZc0lFWWJCQ1ZYa0s5TGNqK3p5NER4Z04vY204WndL?=
 =?utf-8?B?eTFuN1NjSnlPS1JSdTdHSllGdjBZTElYWGY0ZmpEN3AyS2VGb1FSc3dUSXEw?=
 =?utf-8?B?OEtTZEwwY05tTytjb09HUWcwSjVvUFlCaGtPVWRkT1JGSDBpcGhBMjh3T0Y2?=
 =?utf-8?B?ZERtK2IwTWdsY1dJaVB1U3VuTnNOYTNJN1JadEoxR09VR1VySUJaeUxEa2dp?=
 =?utf-8?B?VGFVcmxqeHlBNU9rV2ZpNjJVRCtXa3Y1SDlOMkt6TEFVci9JcmhEcFFDTlZw?=
 =?utf-8?B?YjlYOWV2cVByQkZ3Mm4raExaSDBwODkxK3htS2UzVlNzWVV1ZVZFd0pHcXl0?=
 =?utf-8?B?SDk2M3drbnBQbUd4YjI4WTlZOVNhSWYvK2d3NXpTQnplT2xMK2p0dkJIUDFK?=
 =?utf-8?B?b25sMStVMk8vYlJXUWhFS0JiYlpvK29VNzN6RCsrMlZ5Sm9NR3BlRnd2aGox?=
 =?utf-8?B?dTByZUx6b1VmTWdxYlhvRllBZFF5aFNBeGcxTGkzNlNOUTY4dCsvc0R2TmpX?=
 =?utf-8?B?Q3p5UFpnN0tMTjIrSGFnRjVJdkZZaUplMkxRY3RHSGo0N2lJTXJXMkU3Miti?=
 =?utf-8?B?eWxYZm15c2RML2dnbFJQd2lqRHdFdlNJYURzNERweXNCdUhvNVBLdFhMNXlP?=
 =?utf-8?B?c2FNZkZxZ3FpeGN1UmtCbk15YkprSUJnc0hldW9Zb0tIanBwczQ5QWx6eDA4?=
 =?utf-8?B?QXUvSXNFZU84RnVjY2wxTHhVaXg3MmM1RkgxRGF5NmF4cXQ3b0Y2UjRVUW0y?=
 =?utf-8?B?YnoxWEQ4d3ZTU3BiZ3hjVDdySXVWc2p3YVoxUnZvNU10VXlpdjFtTyt1M1M3?=
 =?utf-8?B?eW1oZnhrYWlmcFlEbzM5LzFrekFBczZaMWhCaTFOVzRUV05MVnZVdjBvV002?=
 =?utf-8?B?UHYvNVFhVVdET0g0RVBRblhWK0ZMdlhuSTlKeG0ySkxic0s1QU9NRGwvR2VV?=
 =?utf-8?B?RHhNMEhSTnJnVDAwZnZkUU9wYUVFSkozMUhMcWUxczlpZG8vWXZxRTgwelps?=
 =?utf-8?B?TERBayt4K0tjUkdzMUptU3RMRjVEUy9YUldOdmJxZnF3UlU1eDJ1c1BGamJG?=
 =?utf-8?B?dnM5RUIzNmE5REdMY0h4M1lzVUhMQWphdis1K3dlekc0SEtQZ3dNbldIbzJL?=
 =?utf-8?B?TVNjeUcrQ1dWYlo5NHZLb3Z0cXdTNTNWek5yOGFaaFd0S082ODVUWjFWbkNz?=
 =?utf-8?B?aEZVc3VjQUdMV2tYOVFqTXJOUGU1RUJEWHozOGJtRFY2M09mR2gxNkJVeGRC?=
 =?utf-8?B?NTJqcVB5RjNYMjNhazY4OVJmTFlZU3JQZVJERCtQQ3VsV0FIejFxTnRSVEVw?=
 =?utf-8?B?bGtxODVOaFJZUHltZlZFcGRTdFFMSlpOTzlXaVBhL0thRlBiTTBOaXdVU3h2?=
 =?utf-8?B?UitnWkVFVFFraVpaeDEya1hWNVhIZHM2b28rUzlzcHlTVjNSdEc4ZmVpR2hV?=
 =?utf-8?B?NFFwVU8zRC9CUjhDNkxGQklORDRlZlBFNExHQ2thd2w0dmZ3bUx2MENuWHFu?=
 =?utf-8?B?Z0c3UUI3Tm1ySW9qcllOaElKMzZYQTZ5ekJoQXAzMXZjVlRKRW96YWtYQWNm?=
 =?utf-8?B?cG9HQUN0d01XcXBqUmxmTmR4RUNUb25GdDk3Q0prZllIeWE2bG45eThGY2xT?=
 =?utf-8?B?Qmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(32650700017)(1800799024)(82310400026)(36860700013)(7416014)(376014)(7053199007)(921020)(41080700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 07:50:44.2614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba13204-3bfc-4661-bfa1-08de51af4a75
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR10MB9597
X-Authority-Analysis: v=2.4 cv=XfSEDY55 c=1 sm=1 tr=0 ts=6964a7db cx=c_pps
 a=jsgMSbbXZK7K/abHNvEvGw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=WCiPZUQnSyoA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=8b9GpE9nAAAA:8
 a=B_W6FIvUK9tx6VBtUlAA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: PSqK1zGLpA3ol3FQjHkb5lmJuEWTEKww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MCBTYWx0ZWRfX6DLM3+mFn+8Q
 TclPR8fbqV+02tNtQ4RUTVZ7GxRKrOXCLsiv3vv7k+9NxUcT8Aj3crjhUQP4G3sdWwluuuFJX2A
 ABZMKlZTUWAYiS0pGKyeNZKVhRgPZGLAqYnwHVMzh8EgulmDvDsNEkZ0RTiyCldpu9Moz1ZeoKE
 5DsgDkLuCdtXcrJyrm5VvF0JoSgeeKow/OGvtF2ANOYTHTRTTAD8MiR2KfkWMDuQJYACmtCh64Z
 HLFc/OUIiCZJJPITzJfoNyd1FkUkxGLPmkn6XDGIc0qJR4cXhv5fqY4bTBHeolSThccLXo31WhT
 TOhIORZthEGDAu4QOJZ9jpdysdH1/LZ0UoroH6o8zItrZxOQTrE5Swi1KLmMGN4nlk28nj8uv2o
 Fo8MY4z9jcdTjShYxPWX9YUDD6w2E1hvtPj0lngiqAqIrpJVPZiCOlkm8EkAfYBdID83r35Idb+
 8WTpUvN2lMHv9VO0t2g==
X-Proofpoint-ORIG-GUID: PSqK1zGLpA3ol3FQjHkb5lmJuEWTEKww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120060
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/8/26 21:23, Andy Shevchenko wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
> 
> Signed-off-by: Andy Shevchenko<andriy.shevchenko@linux.intel.com>
> --- drivers/spi/spi-stm32.c              | 1 -

Thanks for your patch,

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

