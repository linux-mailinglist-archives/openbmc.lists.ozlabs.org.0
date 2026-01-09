Return-Path: <openbmc+bounces-1123-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E666FD0C9CD
	for <lists+openbmc@lfdr.de>; Sat, 10 Jan 2026 01:27:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnzwb17Ddz2yD4;
	Sat, 10 Jan 2026 11:26:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767992819;
	cv=none; b=B8hODXw6sD2nMGwr6j70Q/azzqOVz7uWMQ8lFn3Ol/nt5Ymqh2HYJv8cyNqleAc4GtPHV+HkqNd30l8yV7/ey4lW6rNl61J5jllMrIqk23dh/gs9NskEWFFXKo9lZke3BhsLHwfYaMruQDhsEmBbIDHAz49GVJCl2cUDpecl8wPHxdtX+H6HZkMlmBoYOFoTAwuc8m5eQ6MCvHXIARparCOtdYszYDY4cTYZ14T5DDOPfx24ZRHyA1s3AEMz+hUX791VwEMSMu6Aq0v6X63bSB2j8imwFNJgEy+esf6V9ttBnME1pJtkjY8ybYDonkjmkzYQSssCSkZ1mzYpZavwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767992819; c=relaxed/relaxed;
	bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amiy6J2+bP2Okugeg2vlOxUL75dtMgHTFqBUEpHyarptt/Vpoj0JeR9t0PKK9BOnI4VULDINQUMd9sLuUj83TfhtpWhH2CDODzHHdvPmZ5dOjLA/DsiSGDe2sQecIM6nFVqvw4Es8gda82t8reWGFbkXRCAropOgi+S35TRrf+vlrkikbMoFm13uNBQWnidzguLwvBRn9K4GXBBiVYWKnfIsb6R4jW+A2ZpJgR/2h+x4u1ADuqfAt98u0GyWefCU6IznDvTed+jriBU7hVeseLoT19AcLkGKr/JdKaGf5La7qeghrpiwZEQyDyjlBvBylq0HZAkaz1s2jZQ10nxOqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=MrEEhE4Q; dkim-atps=neutral; spf=pass (client-ip=209.85.214.170; helo=mail-pl1-f170.google.com; envelope-from=martin.blumenstingl@googlemail.com; receiver=lists.ozlabs.org) smtp.mailfrom=googlemail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20230601 header.b=MrEEhE4Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=googlemail.com (client-ip=209.85.214.170; helo=mail-pl1-f170.google.com; envelope-from=martin.blumenstingl@googlemail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnvTv1kB8z2x9W
	for <openbmc@lists.ozlabs.org>; Sat, 10 Jan 2026 08:06:58 +1100 (AEDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f1bc40b35so53566555ad.2
        for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767992757; x=1768597557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
        b=MrEEhE4QQbAxbW4DB7/MXwMOrhWj9Wn5uPEdOnaO2xSgG0847w1uKWWFA7hzRI61gc
         EByXxC7lBxvn1vxZgb5wVlLnOGsauCNDd2iOgfUxcZRlocpdPnVe89oRaTwPpPcSf+4f
         saslUX8nqnQkWIB+O207eEuCRW1h1R/kzdefdmqrvTQ1DibvzeEs/iibHy+namT+XLJu
         yEsBY/bMu3L03eikQg+QwqN/pz/3icMDdUxKO6gU00bbQeshXtrZ6gay3Zmk1mYsrxQ4
         TDJgijmSWF7ZjE/RsgmgzdNxHpr2Li04OuBc9fzkb7bLNRAR1Tkey/k4RP/xET616Di1
         vezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767992757; x=1768597557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+kn0nlzGkQ0BViOYfFFGO8lkUm/rT4hSAopw8yn9RE=;
        b=fw1v8tDEVTE3IX+4N1RtoTRn3PzXQRi1I5XHJCc0DrmOYTTRlnj61aQT8JkT4H7C/K
         89ytxcaXeGkdhXY9fdWmam5o1fiI3oVbbT3Mdzz/A1LndKxTt+L1uTbictkp+5uYJdQy
         N97ZZVcXO4T346AkQwKLu5866Ev/zLfZV+KWazNLHY6N0EPjMYmq68BM1p+je8EUqCEb
         BwC8A37r5paG0ZCsq4H+Mu0zBiITqd/A84/Ou1Pe41bDZqqacigJbipndEiR6ytr0UWU
         e79ARcftpsgnZCEGD6NcRYm9fzunL6BzPSZ95C2fBAeBDlhWQk7SSNh88XpJKhSWfCIo
         kSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdniBB6n1MJyyEZjlgQQvu3+zFczd/c9lY+dFxlhKCSwtHAUGgkazOvO/P7dpjkIH924uXCQjB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzcbyzFwVEnEXIkVVkRoqms3qvs2t17MMOmh9udFkRmaMRPB/6Y
	8E+pAGSWukpKqIr2LEYLzf31cowZgSlBIqvT31g3QZ1VoUcay3n6MqD4ROz3DH0bEAmzCg3/l5m
	+MZBbyoBxmEw7VzTaDTJcrnA/4wWQaOc=
X-Gm-Gg: AY/fxX7LXr9KV29dVigYB+f0bTyf+zLGn8NGB5ji4DJtsu5qLLxULynBD+jme4xHJRc
	L+02nlpBqDL+wUh/Dz/uCw4U0WDAX73W7OG7FdW5Z1BCLIOzjcqtYC047C6s63cBgXkfr7JUFLr
	qOUn2NRuJP+DYgJC+0xaTOJ3HTlby9YOH6Uq5zNB4Imn0wo5g9/2ASlnD/6SePN6Xw7ibq6P/7T
	Ya3lk4M908uClxEEfW3NXX5+R/DklQxK8ATu1AHVQvCgCjBxyEKkd0XGpr0gp/q6SUK5ENb/Yuq
	mNBPEaHNBAor2Dm8QbeOe5X6ryOPn9067TqMVjk=
X-Google-Smtp-Source: AGHT+IGzEqZSKhDh+mfZnkqq/TwV9IRDJvdndDZXOgFLWIDXGIN31XCilSikaluLQUb1REl5xfFtQyCdyy3ZvPXVWkE=
X-Received: by 2002:a17:903:1acc:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a3ee49b5camr115632895ad.48.1767992757127; Fri, 09 Jan 2026
 13:05:57 -0800 (PST)
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
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 Jan 2026 22:05:46 +0100
X-Gm-Features: AZwV_QgnJP_ucVFfV4UzfxU71gNnGoxRPDRc5QYDA0rdtBqGfiMffeomtdZlKmw
Message-ID: <CAFBinCDzAOC9Sc_LZEbLhtajvPC4zjRiaoq6k9at2iJQnJxwjw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, 
	Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, 
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
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 8, 2026 at 9:30=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[...]
>  drivers/spi/spi-amlogic-spifc-a1.c   | 1 -
>  drivers/spi/spi-amlogic-spisg.c      | 1 -
[...]
>  drivers/spi/spi-meson-spicc.c        | 1 -
>  drivers/spi/spi-meson-spifc.c        | 1 -
For the Amlogic and Amlogic Meson drivers:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

