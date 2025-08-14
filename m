Return-Path: <openbmc+bounces-454-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5244BB263E7
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 13:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2jLK070Xz3cb0;
	Thu, 14 Aug 2025 21:14:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755170056;
	cv=none; b=Gt7JTFWzdQv68GSu8YPIx7eTK9R2Cr9IJUKBNlK+LDZ/lCT4l8s0Yyc1VosF5Idi0JhLrp4PHwdFNedlyGQn8ikQzs6EmxAeQlTHgzndp4l6ytss7Wg642otf10exVK04agkXclaUACGrUAonMQsFiF7w6I3vLw69b/P8S+xoQTs78ZDMrs+2ZEKlwKG8jawu4p/pW+R7NzFH9oGeTfKE0145TwWXGs0tTNGAGDjcGtrxp/un/uUhyW3KG2CQvx66JTRfYYkdJI8eB+B53zbGv+tdX3k2ZvGQEChWKURs8uKOQRvwjnamD0jiYXclxvUwzbx98KHRhio0pHdJYdlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755170056; c=relaxed/relaxed;
	bh=kFeStXaq4pFc1y8zqxBRqu0P3/4wAb5zokeet7M3iR8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PFRMEP+nelnHUA9MtwWcW7GIKuQp0bmU9bv9P8BECMw9kZ8u/h0Fu+kw42MSyXoHZ2ershj6vMmgFGlwuQdZSZ7elX2ke+pZsxvgkQvbNMft2PEUF4KpQrihoeuGsUAgMD8i8MUcaN9WEVqPYG6ODn7duJmeu8qKyoEy2Dqv1EbVxf4w5Yd55AGcMFXS7Bi8pcqLZbc1AnorH/a5912fJKGVPsxl7ZmpMSG0oJR9fLJZYJqnmbJTUajzy834Ys+e6wlCB+JPI3EPoz4X40cR7Yu4CyNLK8GM8cy8GjEyCSMzoNmQ+v95RuAkHRIKsUumRG144A/r0OHuqnjyuyY62w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nNpjrfeQ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nNpjrfeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2jLJ0GSQz30T9;
	Thu, 14 Aug 2025 21:14:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ADBE6A56A87;
	Thu, 14 Aug 2025 11:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF02C4CEED;
	Thu, 14 Aug 2025 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755170053;
	bh=tEQmYgzbbnDyqDEJWRtGvNd+F5EzBR/vQBdSyaJQhYo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nNpjrfeQtIacQG0WEX7mhSYTd7hQlnB7xgoGgJ3v0sCDCZTw/gWywOLfqOYZY4LEw
	 5E1vCRzlD1L7yPW24oE8hMcbLDvBgKF7UglcpNWQtk+d21igAN/jkLiw4vfw95mmaO
	 Wy7Aqpr6pD43wwMPVYuuHLtW+Bl/6xetkfjwBZUQFNWFgaJ0eeIdJk6JAFWM+nmE53
	 +kHohC9FP8zxW9RrnA7dkwqqcgSuN4MKh4R6jlzu+aBiOCgoS1PQtvycwFenFDAKSf
	 8NGwtU+raJOCaLGmFHJD4RvJXWWS3gsAOxCpMzRtcOJrdMPkcN8DQ2NiQbSAuAjRLj
	 ccmAEOd0wNzVg==
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
Message-Id: <175517003454.17441.365944262533574232.b4-ty@kernel.org>
Date: Thu, 14 Aug 2025 12:13:54 +0100
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[19/21] spi: remove unneeded 'fast_io' parameter in regmap_config
        commit: 48124569bbc6bfda1df3e9ee17b19d559f4b1aa3

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


