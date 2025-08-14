Return-Path: <openbmc+bounces-455-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9E2B268F4
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 16:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2nR43q1xz30Vq;
	Fri, 15 Aug 2025 00:18:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755181120;
	cv=none; b=FZF+aY02KYYe1j1yGPtONTSjeVhyYk9PIl2C4yC6on1s4100Fsrh4nc7c5lcnozkBxCWi4QpFMzLWhQ7NodsVuSgChZgH3JHvStzHgNXTsMReqQjc5+AT2xcgcECoWUm21rhVgSV5JLc2+NXIuKqqc+vQ1/NXJb07z9Dd0NkMCtOlRVXyRmeE2MhvHzPRfXiEQSfZVjugJQqFkcDszC0ChDFFyI7su8K/8UH6JsuKH2vaqPqodtSv+iwLKq71RYQauCd6c1BaO1xYVw/FqjgbBOTru55rfpb3vkOX5WqCUjOZHJG5BkddwXUdP2070IZkySaR3vnviu1RfJVZh5zWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755181120; c=relaxed/relaxed;
	bh=V+vnB+61+tXOtwzGfCSSnwdvyVeojqtPAkoFjSfvsr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VrSEMDPDQK3+ZoKFkDtTvV4tCAbpQggclZmu74lNUhzLAqgpBm3T45lArMILKwsHmGPqDv5aTs3hMYIvvuYiu30/iIv/UZkSzDuyVXnhBx+kPtiRqf2n6elT23hT8PIra5fdr3z8IYZK1lX1UyFNqlnXMCLiuQaNObCfLMeaEL6sVd6FxJxUuBRi4sn6ikdO2AvVgHJKJAPm1v1a/kbUGVUmeLvS3ZyNL+R7kN1OATb5DGQdQsz5z05TwFsHSfnA+7mdQ0n8kw6JiEAXPy00Myb6kVVyoCCenBB4uqK8LBdFPJYcqJlqGunz76aoQoPcTf5eqP4aXLrsaI0gqy0xMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EqgU/EDu; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EqgU/EDu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2nR26TFKz2yhX;
	Fri, 15 Aug 2025 00:18:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E44A6601D8;
	Thu, 14 Aug 2025 14:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140DFC4CEEF;
	Thu, 14 Aug 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755181116;
	bh=aIOvB7Z2yTByNAFttZWfPG8POEc6396jSKH09BJ+/Lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqgU/EDu3oDCYRt1Si13BRghMkcwK5LqN9GkAcGcfcrhFTazE34zUUq8Od+e5oGUJ
	 GNx5ulPcFgtO5ZyiSpwIBr8FUNyAthpqEJ1HFf9GnjWHY+qIpiLzwl5jpRBrlolPn2
	 z6xjKGXo4jawDOcpqGnCDN73BGfqRqAyieck88qD94UdpBJX7zr50+UVyAUEIFPEy1
	 8iZ5/OdecI+vpH1tXXE5PIrAiCENDSW7wdju78QYNBO7tccEMhyLT5/PeO3ORXivtj
	 sVMKdqgvEftfF5s9YxpUhwR00ND4s4PmT0wxP/dvrTnBxT6CdvlYHRM7ommRoJA5zP
	 uiUsOyuYlg5Jw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
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
 Vasily Khoruzhick <anarsoul@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io'
 parameter in regmap_config
Message-Id: <175518109481.47921.1666131365484481268.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 15:18:14 +0100
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
X-Mailer: b4 0.15-dev-cff91
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[21/21] ASoC: remove unneeded 'fast_io' parameter in regmap_config
        commit: d578faf7096affc036fd16333f1bfbe4991a22f7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


