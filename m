Return-Path: <openbmc+bounces-1163-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8DFD127F9
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 13:16:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqWZv3mPlz30Ff;
	Mon, 12 Jan 2026 23:16:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.152.168 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768220215;
	cv=pass; b=Q3hVlTUQZdBv4c2L2mbg5WQQqjsxFaB8rd3MUeI4ysKDZ7OBtgI2ov0Zet3RotMs2Np8Axzpzymv4O1PjztHov0OqceaWb9G/+ycGkwoP7DAVelFc0V2ELYscBuMKJqeG8K+2OHIs0ieXGdXzHEeccDalYBil++G3+ySa4lj3JANp2shIfc5wkGJk9a6EHsrye7dFfYGXLC/Todp1A7903oJC7RhTF5aUSZ1d92C4qZlOwzb6KeGjwu4lUUNge2K4bM7bJyIb9MQ1K5QbClOudhqW12r900E7oAbIr8JG+PNhuVTEsgdIdJsbyXlDrFc2TytUq3MdMU/UT84Yg4SBg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768220215; c=relaxed/relaxed;
	bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea1wuKa+pCfYShjEWG38jKjd6cYcL/TsdEdTk6naE00GtLik71Vx6Zt4FWM+m+e4CSha8hsiOZ17Pu7AM3eIakwkIgQAs2FhIDXQHw7AHSNr1k5eAiCoSWywzQQx9s7huDSL9cnFKRaDZp1nqi9gcLj9aYufJ5tWrYGrEnEnSwud2cOEZijIQlfXBhiw2GKionvwV81aEzSFSWQlmVtPvu4ml+LN740595h4bXTVbDYy1GrtabVpvSRo1I6Kr60aNxUFsHPziw6njJ0ptzJHpQCv6PrdeElnIKOGqmjX5fO9uCeI3/JXwrxzTK3tPcKoHuRAKxEkCQDIotWg6fzovQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=O6dwoWKs; dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jPdee84Z; dkim-atps=neutral; spf=pass (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=2472a47a8f=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org) smtp.mailfrom=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=O6dwoWKs;
	dkim=pass (1024-bit key; unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jPdee84Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=2472a47a8f=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1369 seconds by postgrey-1.37 at boromir; Mon, 12 Jan 2026 23:16:53 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqWZs4dCvz308P;
	Mon, 12 Jan 2026 23:16:52 +1100 (AEDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C600Xf2361235;
	Mon, 12 Jan 2026 05:53:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=mKcVMavfDPR/GjnaR/
	5gl5HBiFyT0Avl2Y9Z3h3P8K8=; b=O6dwoWKsDC46oiBx+YC30Ra2kOw7veHlDE
	XXOlNN7g9YwPbUP8yF4FwOtFlDN2ga9aovvtnnkwmNP9J/76lWoLokoDUsVUsK/6
	Q942zt+q1+YO/C4E0rqC9mGg1dcD3WAbf2U+zM853W/ZJLXZVqF+2ttMCfK5hV2x
	wjjBdxM37Ma1UXjQ1QP+XpJ+7G3NsqGiMtfpVVMLbvu6UpB2Tnl1Ypd0qvDoxFXi
	lnx2r2Oe3n9c0v6mj0AC/TK1MknSfjTpBj+M3gk8aJogMTE+WdzS6GyMS+Fvu+ok
	l+1uJD/3QM46n92jEmTGWVULb1KuCrQMNWKZqIsu6Y7+i8msrhYw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1m5n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 05:53:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGnPOeInmLjJ6lGfNMeKFRQBkpsZitv69wdPkaUkbb2HY285lLesKHCsYMBIYUXQMIMEtoL1EZbttVgi4ljv/TGi72w3cghqxs0iEXXXRhPXGD0v6r12YWeUlk8pBoznFrm0PawkvE3GRMKeCnbUV0aae2dRi51JovNvHJrzfLfkij/U+XatHFkLZK0xwAVhWuphBzFh34Xn+cM05vzPeBNDU9j7S0+cM5thYMIVZ8O4edDT/qXf/Pocat8aZAaFbBVAJ6m+fluDxJT0p1/kxGSwkMnQCtnpItYiCbViN29os0uWLX7fTzx3pvsOnxKR4gG8nQgLEl7U0YtEXjjuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=;
 b=QUxRUB9KYguU2IF35i8JIsofoLY99hy1G7e5EY890rlTtAtDk2z4qHQvWBNRJPLtVYsOKKa3aZsZXAIc7YxSrL8ZMIrjhRSY20YCw4LNxtb01y0xCZm4Lks/vU+MRWF0EKJ3hntGq/swdvt0lBvYJv/ScTsCTG8Hiocsm3snG0/lL5KOMS+q/u734GndIVa9hl22ioYPYLw9ARgTZeaQ+YBEf4o/ooUjNLZuF2kJKAX0TCApIht8cDvoLaROMvho2xZ+Ih+FUkGNKiwA4JPNyCXvXHpw65iVzY5wVggzy73wyfgXiqJgXC77TJNWzgebAP7O3LbKCxijoj+Dic+MJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKcVMavfDPR/GjnaR/5gl5HBiFyT0Avl2Y9Z3h3P8K8=;
 b=jPdee84Z/RqW5+XURusIY+qRuEJIT3co20kzHmiMBtLjRpvfvt1qx79Zk8Py8nBc5Q/D+kcSlS1CINfqqPhqdMnyAYrVWpDeoOjTVKJHpgD4kk2XNc24GASoWcGLvIsLfpOQWvsn/fzowODr1yCS7fDENaebZrwVw37rDKQo0Ck=
Received: from BN0PR04CA0155.namprd04.prod.outlook.com (2603:10b6:408:eb::10)
 by CH8PR19MB9021.namprd19.prod.outlook.com (2603:10b6:610:264::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:53:53 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::b9) by BN0PR04CA0155.outlook.office365.com
 (2603:10b6:408:eb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 11:53:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.0
 via Frontend Transport; Mon, 12 Jan 2026 11:53:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CAA0740654F;
	Mon, 12 Jan 2026 11:53:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8ED3A820247;
	Mon, 12 Jan 2026 11:53:51 +0000 (UTC)
Date: Mon, 12 Jan 2026 11:53:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
        Varshini Rajendran <varshini.rajendran@microchip.com>,
        Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>,
        Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
        CL Wang <cl634@andestech.com>,
        Manikandan Muralidharan <manikandan.m@microchip.com>,
        David Lechner <dlechner@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>,
        Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
        Shiji Yang <yangshiji66@outlook.com>,
        James Clark <james.clark@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xianwei Zhao <xianwei.zhao@amlogic.com>,
        Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
        Sergio Perez Gonzalez <sperezglz@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>,
        Gabor Juhos <j4g8y7@gmail.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Rosen Penev <rosenp@gmail.com>,
        Luis de Arquer <luis.dearquer@inertim.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Longbin Li <looong.bin@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
        Alessandro Grassi <alessandro.grassi@mailbox.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Darshan R <rathod.darshan.0896@gmail.com>,
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
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
        Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
        =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Wanner <ryan.wanner@microchip.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        William Zhang <william.zhang@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
        Yinbo Zhu <zhuyinbo@loongson.cn>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>,
        Yogesh Gaur <yogeshgaur.83@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Heiko Stuebner <heiko@sntech.de>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Paul Walmsley <pjw@kernel.org>,
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
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v1 1/4] spi: Propagate default fwnode to the SPI
 controller device
Message-ID: <aWTgzqXrGMcdpFOr@opensource.cirrus.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-2-andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108203004.3538449-2-andriy.shevchenko@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|CH8PR19MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 80804609-8715-4876-2c45-08de51d141eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|32650700017|61400799027|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nN5wYskYJ2qtKc38UpDnECbY5wFdn3+NFxn9YOzd9z6EyhyEwXL7rIu1nMAa?=
 =?us-ascii?Q?MR6OPnuPSlixp33Ziwy6bjPccplGo4gKgzJ/8suEqN9F6dqymY9aD+fbVXgS?=
 =?us-ascii?Q?hq+am/WYREXXPh23NKYEkiyGgTH9ASaZd2IM9do5peKVYDl1gBiqP5A0KBed?=
 =?us-ascii?Q?ehZ8/n5yN3G0MRKWwy9S5tuO4qS8iMPuw32eWHRinX8092arFXV2EB8tyRIM?=
 =?us-ascii?Q?8Bzpb2sZsuHjZ9ZejtSwWGh5OJmj+RQrbVOinZqzkECwbklFmyV9s93oEZUo?=
 =?us-ascii?Q?ipCNlsTrOdB5Mx9bX8ajKotBIwEKBcRbE5mNfFWuyZMAcmckbS5rTi7g1mai?=
 =?us-ascii?Q?1LPehhgQ2Q5lYQOuOr+cZETyYq+OG3V7pcwxNVi/vBQ0nXZ4PNjF6mRjZPNV?=
 =?us-ascii?Q?LyL2zf5So5GUtluHh6CLx3wX4OU1Gx6O8lcquHvcvDXYTItbtnDtBjotpLGm?=
 =?us-ascii?Q?5Vr23fYYiSXAJi8Z7txOYyZqPJbX63MZQtmC+h+v98xyYf/kOPJ/nCWHHJq6?=
 =?us-ascii?Q?LxuStuEVLhcM1F8yMZ6McMs8WNb7ZPXnwsNPZJuv93Q8uR6euSDBuSWVLliH?=
 =?us-ascii?Q?1qT6os1wZb9Qa2hYEEmKnSHfenSppgdB1Qj33GV42GYjbY8MWBTL0sPHfi4F?=
 =?us-ascii?Q?hSJJmzYkmRd6qducrWhdxkw1x3UqI4Ivh1bJSO1mSp//K0Uvt2DZt+1my4xr?=
 =?us-ascii?Q?mVAJVfVmllUoFngglrcLbKEu7TxHRq3GLyMSTNo7u5xsfHq9VkPspy2gQVz+?=
 =?us-ascii?Q?0reQevmUEZLGc8PqzTEOvdlU/j/1gMOeCxt1xFk1I3rEQRO7nukA4jh43Isf?=
 =?us-ascii?Q?EuT2ngPdWwzq/iSqNSSoLTyNf1acA/9QhG2mC129p+JpOMdwnbz3+YNGvCD8?=
 =?us-ascii?Q?SzLmVjwhkNJEbeS7suC/SCLXFy6899jxEpYowps0FnL5HK7AiNf+RaLxZtzy?=
 =?us-ascii?Q?uwJuFlovWpXUjosQ1YX505Kaa5oaHRmSSJ+A4y1mQADagQam4KEoOco9AzEg?=
 =?us-ascii?Q?ElBU/BMPjd53Zgobm9ebrXlVvXc5aow2b06Ig2w4BOBgdUsUFRVlHNC0HS1b?=
 =?us-ascii?Q?gf8ny2XFQGcJDstlFZCyJfahwCML9EPmDpS/x9ZAKIu8/WdrO+Bst37kbyi6?=
 =?us-ascii?Q?949U0ET67z2zxgaV18iWJTXkiIgdsOG4+MBLSnrci0AiJaHv8Yv2g9+uldaX?=
 =?us-ascii?Q?2r4aDu8M13tvo+y5ogy8Ah2qx0MLFRiZtoP6DXT5NkDkbQC5lzQYEOdWD3wX?=
 =?us-ascii?Q?JYGH+SXjQzivBQdJDrPfT2m55PHi86kZTKO3gKPY/gm+cq17PAGJkGv6FEQb?=
 =?us-ascii?Q?/ZNINK/TAYTGemcnJiy8MGvN1xolYztsAwUNXAslqkbOexQyASqF+buCHNzW?=
 =?us-ascii?Q?h8UHpRN1ptRMnUOa+mz4zYmRGVap5QnxQlmP3f+SmWSIjRRFuJtSHJHFgNeV?=
 =?us-ascii?Q?S9MMbQkpx6GmxYdZ9fPbrU2MBO7JNqHvpuK3qaCEh9Mzz/7dpM/zwU2Dj3PQ?=
 =?us-ascii?Q?V+hvHd4g5rxH1VJGzM80KHo4rb0QTkGTmYoJyX63VwNzQMLGoCEWE1rfuMtm?=
 =?us-ascii?Q?1hTmz/GZ35Mongz6m/0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(32650700017)(61400799027)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:53:52.7167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80804609-8715-4876-2c45-08de51d141eb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9021
X-Proofpoint-GUID: GaJ4WiX3IhynOerP6TTAtAqESBnzVvZ8
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6964e0d4 cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=J5ERI9i5UL_4qVT6lJYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA5NSBTYWx0ZWRfX8Y0KAW7ufseY
 3Pj/TxVLdL54jbl1KaUqpxTCfnSWvCbxDdvyIwrfz+Naxyxrkypjav/f4ekZRkFjOKVpAvi2Zds
 mXfBDvJdRQOL2nq0d9AZi34PIl5JId+fIy4kaGsMpafPoS7rpFMBEhC1+mFYIKO8q8oyCRflAg9
 Iq9nIIFAkLby1BwsT7Ghx9oXyC17Pub8e/6qBM1pqv7H0glqp2r3SdPYZ+jZxSYv/fjAJphVVqW
 xo9r11UeBdMWw5ZSuXhu8bieamz8g+b7zzEhhIwe/dFMvaqVDR90z/P2intI9mf80TbSSb6Ab4R
 ZRHgAxGwi06kMLZXUPkgKGDm1Q0j/SkTXZ+Qd0XuL50XtU+7YFqVefLS+LvHb6P9utPJaPpaOBb
 an1EqD9I8KITOdSVYfWMF/i+MylpMmOpqXvJiv/k/Nq6aJ8fRkJ0b6ZoTPhBXAwOFW84aNUjCH9
 UdPpQF6fwlm3Jx7yusw==
X-Proofpoint-ORIG-GUID: GaJ4WiX3IhynOerP6TTAtAqESBnzVvZ8
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 09:23:38PM +0100, Andy Shevchenko wrote:
> Most of the SPI controller drivers share the parent's fwnode
> by explicit assignment. Propagate the default by SPI core,
> so they may drop that in the code. Only corner cases may require
> a special treatment and we simply (re)assign the controller's
> fwnode explicitly (as it's done right now, no changes required
> for that).
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

