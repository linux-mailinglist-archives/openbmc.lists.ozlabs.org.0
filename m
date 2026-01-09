Return-Path: <openbmc+bounces-1122-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF27D0C68F
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 23:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnwpV0V2bz2yDk;
	Sat, 10 Jan 2026 09:06:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.182.185.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767996385;
	cv=none; b=PDRoCbJN7fEiXhzmtAFgZUJrPbVLvff/tSxYbcNn6Sn0or9gP5MwXQtNiisBi5Ib1z6ve37/271wAsyfl4aOOOlq2f9Fm/2iH4oCRnQ+P1l5Tcz1fET7AOb3sVOZTi/D1mc/G5L0UEG1RKT3JjQXa4N9RB8r/YoK2PceMey54yW+SY0F0zjCslyEE1GGachdYtSz0RykrA6yPZ8y3dJ56vXRViW0E0ChHHhqn6Xua3knWWW/P6OMhIGPm7eqpQG5FTk6EP+kidOegeYPB2jlJTkn+67dQFZ1ha4ORFbvDxHX1rwGBRb/XIBlpKf0435fJYhRQiEjMqTbhlk7Is54+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767996385; c=relaxed/relaxed;
	bh=B7zBPfBlYkBCkU0l7rWlyy9djFuW+bsZpdLfwqy8ego=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XLYUfk+ZwIFULUsdrILk6kpsXXl/s8CjYTD8PczVNoGspNOyzoMOZ7HVYvS4ooFO8aKmmGlvvgBNilObydPx/LJ7/u6dBunMvnxth3iNRCBchQXw19GakMZ1iT2/OeR7q6uMD1PhvA75N7/TGkbF/TyGRdFxDFA00ErR/ZNDrJT4VwjHU/ShPrU8wbHsx4HEKdIenS7Ym0umu8lLE5kfPa8SCJ4uz+RNaBDdxzc9rRSkovAl16f4F7kuu5+Ias/tdlM6/pSUQlZA0QV33hx1VLL8eRptT7eXHyMOjaVhGZSdBhGnscTviwFl0jwRGKwoNZ/yayO15sIbFgr5CPUvqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kaod.org; dkim=pass (2048-bit key; unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256 header.s=ovhmo393970-selector1 header.b=tVoRIBvc; dkim-atps=neutral; spf=pass (client-ip=217.182.185.173; helo=smtpout4.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=lists.ozlabs.org) smtp.mailfrom=kaod.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kaod.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kaod.org header.i=@kaod.org header.a=rsa-sha256 header.s=ovhmo393970-selector1 header.b=tVoRIBvc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=217.182.185.173; helo=smtpout4.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=lists.ozlabs.org)
Received: from smtpout4.mo529.mail-out.ovh.net (smtpout4.mo529.mail-out.ovh.net [217.182.185.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnwpN74j5z2x99;
	Sat, 10 Jan 2026 09:06:18 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.231.114])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4dnwp12W8bz5yYQ;
	Fri,  9 Jan 2026 22:06:01 +0000 (UTC)
Received: from kaod.org (37.59.142.111) by DAG3EX1.mxp5.local (172.16.2.21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Fri, 9 Jan
 2026 23:05:53 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-111S005528b6bf3-6b65-442a-a404-7c375edb9db0,
                    E09514031C8F96F06A4508024BC0A168B8B405DC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c554baf7-cb61-4003-8f72-bd0c9b39f133@kaod.org>
Date: Fri, 9 Jan 2026 23:05:52 +0100
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
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown
	<broonie@kernel.org>, Varshini Rajendran <varshini.rajendran@microchip.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, Sunny Luo
	<sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, Chin-Ting Kuo
	<chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>, David Lechner
	<dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo
	<jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>,
	=?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, Shiji Yang
	<yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, "Jonathan
 Marek" <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>, Sergio Perez Gonzalez
	<sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Qianfeng
 Rong" <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos
	<j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, Rosen Penev
	<rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Cosmin Tanislav
	<cosmin-gabriel.tanislav.xa@renesas.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li
	<looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
	"Alessandro Grassi" <alessandro.grassi@mailbox.org>, Chen-Yu Tsai
	<wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling
	<webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, Haixu Cui
	<quic_haixcui@quicinc.com>, Darshan Rathod <darshanrathod475@gmail.com>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<asahi@lists.linux.dev>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-rpi-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<imx@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>,
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
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, William Zhang
	<william.zhang@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, "Anand
 Gore" <anand.gore@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
	<rafal@milecki.pl>, David Rhodes <david.rhodes@cirrus.com>, "Richard
 Fitzgerald" <rf@opensource.cirrus.com>, Vladimir Oltean <olteanv@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins
	<nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Lixu Zhang" <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu
	<han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij
	<linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
	<haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, "Chris
 Packham" <chris.packham@alliedtelesis.co.nz>, Heiko Stuebner
	<heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Paul
 Walmsley" <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
	"Orson Zhai" <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>,
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar
	<jaswinder.singh@linaro.org>, "Laxman Dewangan" <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?=
	<j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>, Max Filippov
	<jcmvbkbc@gmail.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
 <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.111]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG3EX1.mxp5.local
 (172.16.2.21)
X-Ovh-Tracer-GUID: ac34650a-c3e7-4870-b2af-217699de11a2
X-Ovh-Tracer-Id: 8919379063107259280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFIzCn8bubMyUx+Fp4B1fyroBgO+OKelU3Mc9FUZok/wUq+5q5e5xOlBE7SQQn4ezSF4JcN3rRKTiRVL++JpNKqyddwvHSDnSv6pGThUA6a2OXaAlWqqdTjwwc8aykxpbVBHUfAW+j+YwgA5VShFD6pA55USsEbAOCh4LKhltiWsNYryEWkVdhJFvMaglbD35exfsOXU4+CQUWbQXLAGFm8Mw+avgKsiFy6JEKuDrFugY8ccCgJASbRDGhi2TEUomjck+JAQXjqsfyIFgPPNHhCRPaCO4fhvyffVLLUB3tUJ1AAFpSfLrKG1i2UhQK86O1PGP6Q5beDUbLb3mFFwVuvowmiPLu07Qa2529adnVPVvNt6SaNdWNbfMhEfPIkVRNuvJ0TQdYyB7K5xnOeWZuvxpW2F2ZHMbgOIadmOuRLm5bZ363tZHUsTB0D72Ea7CFTR9LfLRNdbRlrOrajTb/X4vXTPedUg4C/9KxLVEvzJ6vgGgthveUBW5TYQMkcECWAXgZbYjJ7oOiH9jblqAH4K0cyTl2TcngSUFO8hcSM8xDGEMrjw3+2CnCHxCEn0a0VEfI/3KP/pCo7xCho6ekg7GsDWgZ4dSGfx/xs0vuw28zfxj0t6B2SdSEpkU8hFqaWoyXoByy/COSvgANSnrQmFI1rduce3ZRVlaeAmVi6Xg
DKIM-Signature: a=rsa-sha256; bh=B7zBPfBlYkBCkU0l7rWlyy9djFuW+bsZpdLfwqy8ego=;
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1767996370; v=1;
 b=tVoRIBvcS16uv6AGZO4IgZsz4eMv22iWK6JaCjU8W6kVGGgVfj3/Wkrq9NNxccGRPnUigiWr
 TeTYjjL7EoFnKCVdmHe4HFfVr1aOL8kuSOG2D9Q9X10oLhoQDYP7Z7f4t/K6A5zhsNoZ+zw2jYM
 bHeP8wSh6pSKAhVCZcH2mJWL/2beTYANLR38Qyz8CXYxZI2mvHde4X3rkDrCtQLz44J8OIIaZ1m
 jcAvEbrEZ+UCS3wTgb4shxLvW5pi44udF/MiUClF4q3+w9grStyJ/cQ6LzYFDnVkQfPt8Wd5UGJ
 YM1woORZEKO+SZU0T0sijrYf/t+a5CH4yKfvTiUvo4hdw==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/8/26 21:23, Andy Shevchenko wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
> 
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
For aspeed,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


