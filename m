Return-Path: <openbmc+bounces-470-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 543CCB289CE
	for <lists+openbmc@lfdr.de>; Sat, 16 Aug 2025 04:11:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3jBn0tq2z3clw;
	Sat, 16 Aug 2025 12:11:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755268935;
	cv=none; b=d2qHk6VAU3MxLGcqdFnb2rSGYRy0UyIOBEv67++7Zx7d7G0x6v27qH3GqGyfeyJjJQLZgFMEwW4TK/0zwECoSekbWX81SaC2o5SmdmwPVEkm5Y9yjn+kP/F7KM4Lsj+/P+bYdMTTpDq+JO1njampGE9GuPNImCedOIZo8/nfyL/IMgtw/z2EX8NAjLVPBS76vIr77FrRFQjSpF4SrUbSO2TMcKxVlycmZHIQZWU7x66LNM2mc3TZqk3EJTNub0W0Ah/z4YnJe7uuWTpmdXoyn+bxd3hxUuEPgkURx0a1Iqh6sgNAiJoO7kISsnt5lL250jpgkiNf0zBMb+mUGyLdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755268935; c=relaxed/relaxed;
	bh=MUHHvX5veTJjJhRHjeR4HMXv6t4yNx+G1Z6qiMl+8Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S19DMUdb7L8DZvjbbR7eE6Qeai4I4x/ykev6+/G9jB+F2v+SbxxrlEQp7REFcNRQRc3iXMysJsyN77EXgi6ve6XanatygZ7ySAKYWzY5cVAv3Lq5VxokBZ5RF1G3Ak0U7SjuZw6K+nQRDx38UQjLoO/XjRl3sjh0PZFAplerZA2e9dwapQZMj6KMbSd8SKnJJse050y0xYfOcLLe09AcFfJM5b8NqE7jgZ94HdQvRt3fQMpWuWw1VZiPYZKcQGD66fKudpIUcv7tH0IdiJAMRNYRMkRBcRQGm3fpmKINOQtm304dlYOFYb0sLaTWflQ9objDl+dlEZmWZkabJ37khQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QGhHpuiS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QGhHpuiS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=andersson@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Pvp2VvRz3cgM;
	Sat, 16 Aug 2025 00:42:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEA18439C8;
	Fri, 15 Aug 2025 14:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B35C4CEEB;
	Fri, 15 Aug 2025 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755268931;
	bh=3eUf4UXirGpUX0gw3VvalDgnQQxUYuzOa7d+Bn86Fb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGhHpuiSTtGAbt/6dlTCnnoTA4ZplxFC8Tro0GJAdbAh12tMNEUSLu07z11OvQBvk
	 oHTf5TJS/YKStrrrPHeWRzwJ0jGE6j5AZ1tbRvaZy3dDmEE9KCuVb15MPpzSH6J/gw
	 2nlRciQR5ILTUmZcjfPb8Wftcr9/dguuRdUZKw9cWJDeaG76YAPPH1GvTVv9P/kSEx
	 wLYcS3eJZ7unChNgWOYh7wQNPjdRjal2zeZDCWKyPnLkisSlJQ+WGVCBgVhn2LIrAt
	 +qG7XHhqCY/zS15DuM72YtrsT2tpKSGGxqzGtUU2p/oH3AF5g3+H8o04kc5YGhgMBJ
	 knwp+/59e078g==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benjamin Fair <benjaminfair@google.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	David Airlie <airlied@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	imx@lists.linux.dev,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-actions@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nancy Yuen <yuenn@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	openbmc@lists.ozlabs.org,
	Patrick Venture <venture@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>
Subject: Re: (subset) [PATCH 00/21] treewide: remove unneeded 'fast_io' parameter in regmap_config
Date: Fri, 15 Aug 2025 09:42:02 -0500
Message-ID: <175526892008.370600.8859545110801188375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
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
Content-Transfer-Encoding: 8bit
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

Applied, thanks!

[18/21] soc: remove unneeded 'fast_io' parameter in regmap_config
        commit: 5d8a9c8401648d338d072a488d455ed4611c5d4b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

