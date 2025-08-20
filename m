Return-Path: <openbmc+bounces-491-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1ECB2E907
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 01:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6jrw1zmnz30P3;
	Thu, 21 Aug 2025 09:51:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755709383;
	cv=none; b=PA0MS9X7PIuAojs3q6H7UP+TAsuhmZ++Rp1dNJUrX9v0yqryue1MD2XYZXm9HfJ5B8Fp5qNDwU+F/ksiHKccGwqd/HiG4Ze1DM5UBnl+4a+JppIgHrCO40chqZ9j9tBCt/juMvA3rfih08449nuAAezm9UWS5JDQD5boZykB1HsypK3BxGLwX718LL5cpj8wijWds/4i/VxeZT68vB374/+a4FoPySiJaTHpLz8iOXfuMsWfg9OAcvx55hZ1i+Q6ZD/S9P9O3WOaLTxwElJH52t8MXldhmiDWTMrva25lbA1QiVIxDycuT/bS4+wvPVGnoWgY5KQslyTr+IrdADfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755709383; c=relaxed/relaxed;
	bh=/8eki5jczloEz/l1ippefMDT9r2x+OZDEdApBDxkNq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ItGxH0mUMHmNqWSRhQKl4y6V0rbQk7/FJMZI6zG3WOxNMLQ/Mb79hYdaSBax1tpIV2d4kt4nQlZ/88OqsxLU1TbT5kuLsnVdBAwjh7avRQ6YHytf+87sHH+C85w4rdouvcwEMN0cG2DfROlukN8RbTuxIK3jkCkizYJTNBPVY8cDbYhL4o8+S9tquFJcrxyrkkfqhveGWZ11FkDxVx7YqdFjcYzUyYzZdTKN5PV7f5/u0uONh822VsRod1TjQ/Tj8d4XEcbKLnlMdCe8kzykBXN5Ha8Lys06XzyCuf+bunFoDsz3bGqy6o4p/TC0xHwk4ljcfEremPYuC2jXS0MI/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dr1d03/z; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dr1d03/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6Xny4T97z30Vl;
	Thu, 21 Aug 2025 03:03:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CC0495C633A;
	Wed, 20 Aug 2025 17:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A73AC113CF;
	Wed, 20 Aug 2025 17:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755709379;
	bh=Zv4ujPO3KQCQ/S/zZ+87yMEeTHGtDtwjmsw35eFBLPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dr1d03/ztQZzehnuA3pVpw7eG2apfzSIzXWZn4V8PSF/oxOnzaMyj6VZxDgQ3XY0C
	 nca+A2IJDoLbxKo30R/YmbItPPf92i6LVVRW7LTdmYn+yLP3bLCTrV977h9BaHEtKx
	 NXa2PCl2PJ+9sKMlIBp1C0l2xmBSHRNp1Ot+Slf6644+zsAzHmD5BYUvfwKZ1SqBPg
	 b3bNilTK6GPtQRkA2c0x0ltTwqwessPnwFUwQuinpUV1sWYrBj8/SGJJQ8Wlda48Mw
	 vcZIdxxAkqbQkwlZ9DlQZ/Zs8lvh3SMTfcqlJlRdXT5KDCZbCRFgNoX/rafdY4my5h
	 Ujim+Xbb9lOhA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Shevchenko <andy@kernel.org>, 
 Andy Yan <andy.yan@rock-chips.com>, Avi Fishman <avifishman70@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 David Airlie <airlied@gmail.com>, David Lechner <dlechner@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Drew Fustini <fustini@kernel.org>, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Fu Wei <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, 
 Iwona Winiarska <iwona.winiarska@intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-actions@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Nancy Yuen <yuenn@google.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, openbmc@lists.ozlabs.org, 
 Patrick Venture <venture@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Tali Perry <tali.perry1@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomer Maimon <tmaimon77@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io'
 parameter in regmap_config
Message-Id: <175570934550.66459.15951444863822303407.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 22:32:25 +0530
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 13 Aug 2025 18:14:46 +0200, Wolfram Sang wrote:
> While working on a driver using regmap with MMIO, I wondered if I need
> to set 'fast_io' in the config. Turned out I don't need to, so I added
> documentation for it with commit ffc72771ff6e ("regmap: Annotate that
> MMIO implies fast IO").
> 
> This series fixes the existing users in the tree which needlessly set
> the flag. They have been found using this coccinelle script:
> 
> [...]

Applied, thanks!

[12/21] phy: remove unneeded 'fast_io' parameter in regmap_config
        commit: e1e1e77f7df7cbee959ba024e5475907fe561c98

Best regards,
-- 
~Vinod



