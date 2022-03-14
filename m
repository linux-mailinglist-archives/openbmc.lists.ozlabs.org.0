Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490A4D9060
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXr90330z2yn9
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NaX6z/Mi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NaX6z/Mi; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH8460Thbz2xF0;
 Mon, 14 Mar 2022 18:56:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1494611D3;
 Mon, 14 Mar 2022 07:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8B7C36AE2;
 Mon, 14 Mar 2022 07:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647244561;
 bh=6D5XdwweEMzcZ9LzIxNFok8hrjwkxH5bQJrQfS+UAMM=;
 h=From:To:Cc:Subject:Date:From;
 b=NaX6z/MiLjww0RV/0SZKyQn8elK8Y4Zrjp/g42Cg9xanNNp5ddl6wdn3UM0BvK0n7
 RbWhbd8WrWqh5gn6o7rOteCA808N5eiMX1tv73RslNmQqHJ0z1NidqzluaLuUunfFV
 EnFtLr+fZNhZt6KfxYLsOJHm5TjU1Ee46jdI4JQmge1tgN55v7VFY667NQmVFXYVIS
 FnGfIJA2mYSYKL7D352T5PLZ+Vwlq0R5KLtSVVxjgOr+qhGzgneBhQC+4Sc0MTzJgN
 mWYcNHttU0ASyq/YjgoiRtMZfN7FvobMRdGqbhoU1+Y/wpmXZZs6gg7fin0YUYn6gI
 REDXKahlcGAbw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTfYc-001kUC-5U; Mon, 14 Mar 2022 08:55:58 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 00/64] media: Kconfig/Makefile reorg
Date: Mon, 14 Mar 2022 08:54:52 +0100
Message-Id: <cover.1647242578.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, Eddie James <eajames@linux.ibm.com>,
 Jaroslav Kysela <perex@perex.cz>, Pavel Machek <pavel@ucw.cz>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Antti Palosaari <crope@iki.fi>,
 NXP Linux Team <linux-imx@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-sunxi@lists.linux.dev,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Antoine Jacquet <royale@zerezo.com>,
 Andy Walls <awalls@md.metrocast.net>, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>, Heungjun Kim <riverful.kim@samsung.com>,
 linux-usb@vger.kernel.org, Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ming Qian <ming.qian@nxp.com>,
 alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, Mike Isely <isely@pobox.com>,
 linux-arm-kernel@lists.infradead.org, Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, Dafna Hirschfeld <dafna@fastmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-tegra@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Erik Andren <erik.andren@gmail.com>,
 linux-staging@lists.linux.dev, Shijie Qin <shijie.qin@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, Jacob Chen <jacob-chen@iotwrt.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-input@vger.kernel.org,
 Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>,
 mjpeg-users@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Felipe Balbi <balbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Dan Scally <djrscally@gmail.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Olivier Lorin <o.lorin@laposte.net>, linux-renesas-soc@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 Andy Gross <agross@kernel.org>, Michael Krufky <mkrufky@linuxtv.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Yong Zhi <yong.zhi@intel.com>, Benoit Parrot <bparrot@ti.com>,
 linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I opted to join two series and one separate patch on a single series, as they're
related and one depends on the others:

- Sort Makefiles and platform/Kconfig
  https://lore.kernel.org/linux-media/cover.1647155572.git.mchehab@kernel.org/T/#t
- Organize media platform drivers per manufacturer
  https://lore.kernel.org/linux-media/20220313120002.0d782ce7@coco.lan/T/#t
- https://lore.kernel.org/linux-media/Yi3ciCTbHrxYUatX@pendragon.ideasonboard.com/#r

It basically sorts the main media Makefiles and reorganizes drivers/media/platform
building system. Now, the entries there are organized per-vendor, and each per-vendor
directory under drivers/media/platform contains its own Kconfig/Makefile.

It should be noticed that I opted to not sort the manufacturer's Kconfig files on this series
by purpose. After this series, the per-vendor Kconfig menus have only a few drivers (up to
~10 config symbols). That makes it a lot more manageable than what we had before when
almost every platform driver config entry were on a single file.

My current understaning is that the driver maintainers knows best how to better organize
their Kconfig files,  considering that:

- the per-vendor driver order may not be in alphabetical order, as it may make sense to group
  drivers per type, platform and/or by its dependency chain;

- It is now easy to sort the per-vendor entries alphabetically,  either per config title or per Kconfig
  symbol;

- Now that the main sort criteria is per-vendor, IMO it makes sense to define a per-vendor 
  config space, like:

	config VIDEO_VNDR_bar
		...
	config VIDEO_VNDR_foo
		...
	config VIDEO_VNDR_foobar
		...

Regards,
Mauro

Mauro Carvalho Chehab (64):
  media: xc2028: rename the driver from tuner-xc2028
  media: Makefiles: remove extra spaces
  media: Makefiles: sort entries where it fits
  media: platform: Makefile: reorganize its contents
  media: platform: move platform menu dependencies to drivers
  media: platform: place Aspeed driver on a separate dir
  media: platform: place NXP drivers on a separate dir
  media: platform: place Intel drivers on a separate dir
  media: platform: place Via drivers on a separate dir
  media: platform: place Renesas drivers on a separate dir
  media: platform: allegro-dvt: move config to its own file
  media: platform: amphion: move config to its own file
  media: platform: coda: move config to its own file
  media: platform: exynos-gsc: move config to its own file
  media: platform: ge2d: move config to its own file
  media: platform: mtk-jpeg: move config to its own file
  media: platform: mtk-mdp: move config to its own file
  media: platform: mtk-vcodec: move config to its own file
  media: platform: mtk-vpu: move config to its own file
  media: platform: omap3isp: move config to its own file
  media: platform: camss: move config to its own file
  media: platform: venus: move config to its own file
  media: platform: rga: move config to its own file
  media: platform: s3c-camif: move config to its own file
  media: platform: s5p-g2d: move config to its own file
  media: platform: hva: move config to its own file
  media: platform: stm32: move config to its own file
  media: platform: sun8i-di: move config to its own file
  media: platform: sun8i-rotate: move config to its own file
  media: platform: vde: move config to its own file
  media: platform: ti-vpe: move config to its own file
  media: platform: rkisp1: move config to its own file
  media: platform: delta: move config to its own file
  media: platform: bdisp: move config to its own file
  media: platform: s5p-mfc: move config to its own file
  media: platform: s5p-jpeg: move config to its own file
  media: platform: Kconfig: sort entries
  media: platform: move some manufacturer entries
  media: platform: Kconfig: place platform drivers on a submenu
  media: platform: rename coda/ to chips-media/
  media: platform: rename marvell-ccic/ to marvell/
  media: platform: rename meson/ge2d/ to amlogic/meson-ge2d/
  media: platform: rename mtk-jpeg/ to mediatek/mtk-jpeg/
  media: platform: rename mtk-mdp/ to mediatek/mtk-mdp/
  media: platform: rename mtk-vcodec/ to mediatek/mtk-vcodec/
  media: platform: rename mtk-vpu/ to mediatek/mtk-vpu/
  media: platform: rename sunxi/ to allwinner/
  media: platform: rename tegra/vde/ to nvidia/tegra-vde/
  media: platform: rename amphion/ to nxp/amphion/
  media: platform: rename exynos4-is/ to samsung/exynos4-is/
  media: platform: rename exynos-gsc/ to samsung/exynos-gsc/
  media: platform: rename s3c-camif/ to samsung/s3c-camif/
  media: platform: rename s5p-g2d/ to samsung/s5p-g2d/
  media: platform: rename s5p-jpeg/ to samsung/s5p-jpeg/
  media: platform: rename s5p-mfc/ to samsung/s5p-mfc/
  media: platform: rename stm32/ to sti/stm32/
  media: platform: rename am437x/ to ti/am437x/
  media: platform: rename davinci/ to ti/davinci/
  media: platform: rename omap3isp/ to ti/omap3isp/
  media: platform: rename omap/ to ti/omap/
  media: platform: rename ti-vpe/ to ti/vpe/
  media: platform: Create vendor/{Makefile,Kconfig} files
  media: platform/*/Kconfig: make manufacturer menus more uniform
  media: Kconfig: cleanup VIDEO_DEV dependencies

 Documentation/admin-guide/media/fimc.rst      |   2 +-
 .../admin-guide/media/i2c-cardlist.rst        |   2 +-
 Documentation/admin-guide/media/omap3isp.rst  |   2 +-
 .../admin-guide/media/omap4_camera.rst        |   2 +-
 .../media/drivers/davinci-vpbe-devel.rst      |  20 +-
 .../driver-api/media/drivers/fimc-devel.rst   |  14 +-
 Documentation/driver-api/media/v4l2-event.rst |   2 +-
 MAINTAINERS                                   |  72 +-
 drivers/input/rmi4/Kconfig                    |   2 +-
 drivers/input/touchscreen/Kconfig             |   4 +-
 drivers/media/Kconfig                         |  11 +-
 drivers/media/Makefile                        |   4 +-
 drivers/media/cec/platform/Makefile           |  16 +-
 drivers/media/common/Makefile                 |   7 +-
 drivers/media/common/saa7146/Kconfig          |   2 +-
 drivers/media/common/videobuf2/Makefile       |   8 +-
 drivers/media/dvb-core/Kconfig                |   2 +-
 drivers/media/dvb-frontends/Kconfig           |   4 +-
 drivers/media/dvb-frontends/Makefile          | 193 ++---
 drivers/media/firewire/Makefile               |   2 +-
 drivers/media/i2c/Kconfig                     | 250 +++---
 drivers/media/i2c/Makefile                    |  92 +--
 drivers/media/i2c/ccs/Kconfig                 |   2 +-
 drivers/media/i2c/cx25840/Kconfig             |   2 +-
 drivers/media/i2c/et8ek8/Kconfig              |   2 +-
 drivers/media/i2c/m5mols/Kconfig              |   2 +-
 drivers/media/pci/Kconfig                     |   2 +-
 drivers/media/pci/Makefile                    |  22 +-
 drivers/media/pci/bt8xx/Kconfig               |   2 +-
 drivers/media/pci/cobalt/Kconfig              |   2 +-
 drivers/media/pci/cx18/Kconfig                |   2 +-
 drivers/media/pci/cx18/cx18-driver.c          |   2 +-
 drivers/media/pci/cx18/cx18-dvb.c             |   2 +-
 drivers/media/pci/cx18/cx18-gpio.c            |   2 +-
 drivers/media/pci/cx23885/cx23885-cards.c     |   2 +-
 drivers/media/pci/cx23885/cx23885-dvb.c       |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |   2 +-
 drivers/media/pci/cx88/cx88.h                 |   2 +-
 drivers/media/pci/dt3155/Kconfig              |   2 +-
 drivers/media/pci/intel/ipu3/Kconfig          |   2 +-
 drivers/media/pci/ivtv/Kconfig                |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |   2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c            |   2 +-
 drivers/media/pci/meye/Kconfig                |   2 +-
 drivers/media/pci/saa7134/saa7134-cards.c     |   2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c       |   2 +-
 drivers/media/pci/saa7146/Kconfig             |   6 +-
 drivers/media/pci/sta2x11/Kconfig             |   2 +-
 drivers/media/pci/tw5864/Kconfig              |   2 +-
 drivers/media/pci/tw68/Kconfig                |   2 +-
 drivers/media/pci/tw686x/Kconfig              |   2 +-
 drivers/media/platform/Kconfig                | 740 ++----------------
 drivers/media/platform/Makefile               | 113 +--
 drivers/media/platform/allegro-dvt/Kconfig    |  19 +
 drivers/media/platform/allwinner/Kconfig      |   6 +
 .../platform/{sunxi => allwinner}/Makefile    |   0
 .../{sunxi => allwinner}/sun4i-csi/Kconfig    |   3 +-
 .../{sunxi => allwinner}/sun4i-csi/Makefile   |   0
 .../sun4i-csi/sun4i_csi.c                     |   0
 .../sun4i-csi/sun4i_csi.h                     |   0
 .../sun4i-csi/sun4i_dma.c                     |   0
 .../sun4i-csi/sun4i_v4l2.c                    |   0
 .../{sunxi => allwinner}/sun6i-csi/Kconfig    |   3 +-
 .../{sunxi => allwinner}/sun6i-csi/Makefile   |   0
 .../sun6i-csi/sun6i_csi.c                     |   0
 .../sun6i-csi/sun6i_csi.h                     |   0
 .../sun6i-csi/sun6i_csi_reg.h                 |   0
 .../sun6i-csi/sun6i_video.c                   |   0
 .../sun6i-csi/sun6i_video.h                   |   0
 .../media/platform/allwinner/sun8i-di/Kconfig |  14 +
 .../{sunxi => allwinner}/sun8i-di/Makefile    |   0
 .../{sunxi => allwinner}/sun8i-di/sun8i-di.c  |   0
 .../{sunxi => allwinner}/sun8i-di/sun8i-di.h  |   0
 .../platform/allwinner/sun8i-rotate/Kconfig   |  14 +
 .../sun8i-rotate/Makefile                     |   0
 .../sun8i-rotate/sun8i-formats.h              |   0
 .../sun8i-rotate/sun8i-rotate.h               |   0
 .../sun8i-rotate/sun8i_formats.c              |   0
 .../sun8i-rotate/sun8i_rotate.c               |   0
 drivers/media/platform/amlogic/Kconfig        |   5 +
 drivers/media/platform/amlogic/Makefile       |   2 +
 .../media/platform/amlogic/meson-ge2d/Kconfig |  14 +
 .../ge2d => amlogic/meson-ge2d}/Makefile      |   0
 .../ge2d => amlogic/meson-ge2d}/ge2d-regs.h   |   0
 .../{meson/ge2d => amlogic/meson-ge2d}/ge2d.c |   0
 drivers/media/platform/aspeed/Kconfig         |  13 +
 drivers/media/platform/aspeed/Makefile        |   2 +
 .../platform/{ => aspeed}/aspeed-video.c      |   0
 drivers/media/platform/atmel/Kconfig          |  15 +-
 drivers/media/platform/cadence/Kconfig        |  16 +-
 drivers/media/platform/chips-media/Kconfig    |  20 +
 .../platform/{coda => chips-media}/Makefile   |   0
 .../platform/{coda => chips-media}/coda-bit.c |   0
 .../{coda => chips-media}/coda-common.c       |   0
 .../platform/{coda => chips-media}/coda-gdi.c |   0
 .../{coda => chips-media}/coda-h264.c         |   0
 .../{coda => chips-media}/coda-jpeg.c         |   0
 .../{coda => chips-media}/coda-mpeg2.c        |   0
 .../{coda => chips-media}/coda-mpeg4.c        |   0
 .../platform/{coda => chips-media}/coda.h     |   0
 .../{coda => chips-media}/coda_regs.h         |   2 +-
 .../platform/{coda => chips-media}/imx-vdoa.c |   0
 .../platform/{coda => chips-media}/imx-vdoa.h |   0
 .../platform/{coda => chips-media}/trace.h    |   2 +-
 drivers/media/platform/imx/Kconfig            |  24 -
 drivers/media/platform/imx/Makefile           |   1 -
 drivers/media/platform/intel/Kconfig          |  14 +
 drivers/media/platform/intel/Makefile         |   2 +
 .../media/platform/{ => intel}/pxa_camera.c   |   0
 .../{marvell-ccic => marvell}/Kconfig         |   9 +-
 .../{marvell-ccic => marvell}/Makefile        |   0
 .../{marvell-ccic => marvell}/cafe-driver.c   |   0
 .../{marvell-ccic => marvell}/mcam-core.c     |   0
 .../{marvell-ccic => marvell}/mcam-core.h     |   0
 .../{marvell-ccic => marvell}/mmp-driver.c    |   0
 drivers/media/platform/mediatek/Kconfig       |   8 +
 drivers/media/platform/mediatek/Makefile      |   5 +
 .../media/platform/mediatek/mtk-jpeg/Kconfig  |  16 +
 .../platform/{ => mediatek}/mtk-jpeg/Makefile |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_core.c   |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_core.h   |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.c |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.h |   0
 .../mtk-jpeg/mtk_jpeg_dec_parse.c             |   0
 .../mtk-jpeg/mtk_jpeg_dec_parse.h             |   0
 .../mtk-jpeg/mtk_jpeg_dec_reg.h               |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.c |   0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.h |   0
 .../media/platform/mediatek/mtk-mdp/Kconfig   |  17 +
 .../platform/{ => mediatek}/mtk-mdp/Makefile  |   2 +-
 .../{ => mediatek}/mtk-mdp/mtk_mdp_comp.c     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_comp.h     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_core.c     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_core.h     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_ipi.h      |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_m2m.c      |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_m2m.h      |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_regs.c     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_regs.h     |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_vpu.c      |   0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_vpu.h      |   0
 .../platform/mediatek/mtk-vcodec/Kconfig      |  36 +
 .../{ => mediatek}/mtk-vcodec/Makefile        |   0
 .../mtk-vcodec/mtk_vcodec_dec.c               |   0
 .../mtk-vcodec/mtk_vcodec_dec.h               |   0
 .../mtk-vcodec/mtk_vcodec_dec_drv.c           |   0
 .../mtk-vcodec/mtk_vcodec_dec_hw.c            |   0
 .../mtk-vcodec/mtk_vcodec_dec_hw.h            |   0
 .../mtk-vcodec/mtk_vcodec_dec_pm.c            |   0
 .../mtk-vcodec/mtk_vcodec_dec_pm.h            |   0
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   0
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   0
 .../mtk-vcodec/mtk_vcodec_drv.h               |   0
 .../mtk-vcodec/mtk_vcodec_enc.c               |   0
 .../mtk-vcodec/mtk_vcodec_enc.h               |   0
 .../mtk-vcodec/mtk_vcodec_enc_drv.c           |   0
 .../mtk-vcodec/mtk_vcodec_enc_pm.c            |   0
 .../mtk-vcodec/mtk_vcodec_enc_pm.h            |   0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.c |   0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.h |   0
 .../mtk-vcodec/mtk_vcodec_fw_priv.h           |   0
 .../mtk-vcodec/mtk_vcodec_fw_scp.c            |   0
 .../mtk-vcodec/mtk_vcodec_fw_vpu.c            |   0
 .../mtk-vcodec/mtk_vcodec_intr.c              |   0
 .../mtk-vcodec/mtk_vcodec_intr.h              |   0
 .../mtk-vcodec/mtk_vcodec_util.c              |   0
 .../mtk-vcodec/mtk_vcodec_util.h              |   0
 .../mtk-vcodec/vdec/vdec_h264_if.c            |   0
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   0
 .../mtk-vcodec/vdec/vdec_vp8_if.c             |   0
 .../mtk-vcodec/vdec/vdec_vp9_if.c             |   0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_base.h |   0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_if.c   |   0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_if.h   |   0
 .../{ => mediatek}/mtk-vcodec/vdec_ipi_msg.h  |   0
 .../mtk-vcodec/vdec_msg_queue.c               |   0
 .../mtk-vcodec/vdec_msg_queue.h               |   0
 .../{ => mediatek}/mtk-vcodec/vdec_vpu_if.c   |   0
 .../{ => mediatek}/mtk-vcodec/vdec_vpu_if.h   |   0
 .../mtk-vcodec/venc/venc_h264_if.c            |   0
 .../mtk-vcodec/venc/venc_vp8_if.c             |   0
 .../{ => mediatek}/mtk-vcodec/venc_drv_base.h |   0
 .../{ => mediatek}/mtk-vcodec/venc_drv_if.c   |   0
 .../{ => mediatek}/mtk-vcodec/venc_drv_if.h   |   0
 .../{ => mediatek}/mtk-vcodec/venc_ipi_msg.h  |   0
 .../{ => mediatek}/mtk-vcodec/venc_vpu_if.c   |   0
 .../{ => mediatek}/mtk-vcodec/venc_vpu_if.h   |   0
 .../media/platform/mediatek/mtk-vpu/Kconfig   |  15 +
 .../platform/{ => mediatek}/mtk-vpu/Makefile  |   0
 .../platform/{ => mediatek}/mtk-vpu/mtk_vpu.c |   0
 .../platform/{ => mediatek}/mtk-vpu/mtk_vpu.h |   0
 drivers/media/platform/nvidia/Kconfig         |   5 +
 .../media/platform/nvidia/tegra-vde/Kconfig   |  17 +
 .../{tegra/vde => nvidia/tegra-vde}/Makefile  |   0
 .../vde => nvidia/tegra-vde}/dmabuf-cache.c   |   0
 .../{tegra/vde => nvidia/tegra-vde}/h264.c    |   0
 .../{tegra/vde => nvidia/tegra-vde}/iommu.c   |   0
 .../{tegra/vde => nvidia/tegra-vde}/trace.h   |   2 +-
 .../{tegra/vde => nvidia/tegra-vde}/v4l2.c    |   0
 .../{tegra/vde => nvidia/tegra-vde}/vde.c     |   0
 .../{tegra/vde => nvidia/tegra-vde}/vde.h     |   0
 drivers/media/platform/nxp/Kconfig            |  55 ++
 drivers/media/platform/nxp/Makefile           |   9 +
 drivers/media/platform/nxp/amphion/Kconfig    |  21 +
 .../media/platform/{ => nxp}/amphion/Makefile |   0
 .../media/platform/{ => nxp}/amphion/vdec.c   |   0
 .../media/platform/{ => nxp}/amphion/venc.c   |   0
 .../media/platform/{ => nxp}/amphion/vpu.h    |   0
 .../platform/{ => nxp}/amphion/vpu_cmds.c     |   0
 .../platform/{ => nxp}/amphion/vpu_cmds.h     |   0
 .../platform/{ => nxp}/amphion/vpu_codec.h    |   0
 .../platform/{ => nxp}/amphion/vpu_color.c    |   0
 .../platform/{ => nxp}/amphion/vpu_core.c     |   0
 .../platform/{ => nxp}/amphion/vpu_core.h     |   0
 .../platform/{ => nxp}/amphion/vpu_dbg.c      |   0
 .../platform/{ => nxp}/amphion/vpu_defs.h     |   0
 .../platform/{ => nxp}/amphion/vpu_drv.c      |   0
 .../platform/{ => nxp}/amphion/vpu_helpers.c  |   0
 .../platform/{ => nxp}/amphion/vpu_helpers.h  |   0
 .../platform/{ => nxp}/amphion/vpu_imx8q.c    |   0
 .../platform/{ => nxp}/amphion/vpu_imx8q.h    |   0
 .../platform/{ => nxp}/amphion/vpu_malone.c   |   0
 .../platform/{ => nxp}/amphion/vpu_malone.h   |   0
 .../platform/{ => nxp}/amphion/vpu_mbox.c     |   0
 .../platform/{ => nxp}/amphion/vpu_mbox.h     |   0
 .../platform/{ => nxp}/amphion/vpu_msgs.c     |   0
 .../platform/{ => nxp}/amphion/vpu_msgs.h     |   0
 .../platform/{ => nxp}/amphion/vpu_rpc.c      |   0
 .../platform/{ => nxp}/amphion/vpu_rpc.h      |   0
 .../platform/{ => nxp}/amphion/vpu_v4l2.c     |   0
 .../platform/{ => nxp}/amphion/vpu_v4l2.h     |   0
 .../platform/{ => nxp}/amphion/vpu_windsor.c  |   0
 .../platform/{ => nxp}/amphion/vpu_windsor.h  |   0
 drivers/media/platform/{ => nxp}/fsl-viu.c    |   0
 .../media/platform/{ => nxp}/imx-jpeg/Kconfig |   3 +-
 .../platform/{ => nxp}/imx-jpeg/Makefile      |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.c |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.h |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg.c    |   2 +-
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg.h    |   0
 .../platform/{imx => nxp}/imx-mipi-csis.c     |   0
 drivers/media/platform/{ => nxp}/imx-pxp.c    |   0
 drivers/media/platform/{ => nxp}/imx-pxp.h    |   0
 .../media/platform/{ => nxp}/mx2_emmaprp.c    |   0
 drivers/media/platform/qcom/Kconfig           |   6 +
 drivers/media/platform/qcom/Makefile          |   3 +
 drivers/media/platform/qcom/camss/Kconfig     |   9 +
 drivers/media/platform/qcom/venus/Kconfig     |  14 +
 drivers/media/platform/renesas/Kconfig        | 121 +++
 drivers/media/platform/renesas/Makefile       |  15 +
 .../media/platform/{ => renesas}/rcar-fcp.c   |   0
 .../media/platform/{ => renesas}/rcar-isp.c   |   0
 .../platform/{ => renesas}/rcar-vin/Kconfig   |   6 +-
 .../platform/{ => renesas}/rcar-vin/Makefile  |   0
 .../{ => renesas}/rcar-vin/rcar-core.c        |   0
 .../{ => renesas}/rcar-vin/rcar-csi2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-dma.c         |   0
 .../{ => renesas}/rcar-vin/rcar-v4l2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-vin.h         |   0
 .../media/platform/{ => renesas}/rcar_drif.c  |   0
 .../media/platform/{ => renesas}/rcar_fdp1.c  |   0
 .../media/platform/{ => renesas}/rcar_jpu.c   |   2 +-
 .../platform/{ => renesas}/renesas-ceu.c      |   0
 drivers/media/platform/{ => renesas}/sh_vou.c |   0
 .../platform/{ => renesas}/vsp1/Makefile      |   0
 .../media/platform/{ => renesas}/vsp1/vsp1.h  |   0
 .../platform/{ => renesas}/vsp1/vsp1_brx.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_brx.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_clu.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_clu.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_dl.c     |   0
 .../platform/{ => renesas}/vsp1/vsp1_dl.h     |   0
 .../platform/{ => renesas}/vsp1/vsp1_drm.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_drm.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_drv.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_entity.c |   0
 .../platform/{ => renesas}/vsp1/vsp1_entity.h |   0
 .../platform/{ => renesas}/vsp1/vsp1_hgo.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_hgo.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_hgt.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_hgt.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_histo.c  |   0
 .../platform/{ => renesas}/vsp1/vsp1_histo.h  |   0
 .../platform/{ => renesas}/vsp1/vsp1_hsit.c   |   0
 .../platform/{ => renesas}/vsp1/vsp1_hsit.h   |   0
 .../platform/{ => renesas}/vsp1/vsp1_lif.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_lif.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_lut.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_lut.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_pipe.c   |   0
 .../platform/{ => renesas}/vsp1/vsp1_pipe.h   |   0
 .../platform/{ => renesas}/vsp1/vsp1_regs.h   |   0
 .../platform/{ => renesas}/vsp1/vsp1_rpf.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_rwpf.c   |   0
 .../platform/{ => renesas}/vsp1/vsp1_rwpf.h   |   0
 .../platform/{ => renesas}/vsp1/vsp1_sru.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_sru.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_uds.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_uds.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_uif.c    |   0
 .../platform/{ => renesas}/vsp1/vsp1_uif.h    |   0
 .../platform/{ => renesas}/vsp1/vsp1_video.c  |   0
 .../platform/{ => renesas}/vsp1/vsp1_video.h  |   0
 .../platform/{ => renesas}/vsp1/vsp1_wpf.c    |   0
 drivers/media/platform/rockchip/Kconfig       |   6 +
 drivers/media/platform/rockchip/Makefile      |   3 +
 drivers/media/platform/rockchip/rga/Kconfig   |  14 +
 .../media/platform/rockchip/rkisp1/Kconfig    |  19 +
 drivers/media/platform/samsung/Kconfig        |  10 +
 drivers/media/platform/samsung/Makefile       |   7 +
 .../media/platform/samsung/exynos-gsc/Kconfig |  10 +
 .../{ => samsung}/exynos-gsc/Makefile         |   0
 .../{ => samsung}/exynos-gsc/gsc-core.c       |   0
 .../{ => samsung}/exynos-gsc/gsc-core.h       |   0
 .../{ => samsung}/exynos-gsc/gsc-m2m.c        |   0
 .../{ => samsung}/exynos-gsc/gsc-regs.c       |   0
 .../{ => samsung}/exynos-gsc/gsc-regs.h       |   0
 .../platform/{ => samsung}/exynos4-is/Kconfig |   3 +-
 .../{ => samsung}/exynos4-is/Makefile         |   0
 .../{ => samsung}/exynos4-is/common.c         |   0
 .../{ => samsung}/exynos4-is/common.h         |   0
 .../{ => samsung}/exynos4-is/fimc-capture.c   |   0
 .../{ => samsung}/exynos4-is/fimc-core.c      |   0
 .../{ => samsung}/exynos4-is/fimc-core.h      |   0
 .../exynos4-is/fimc-is-command.h              |   0
 .../{ => samsung}/exynos4-is/fimc-is-errno.c  |   0
 .../{ => samsung}/exynos4-is/fimc-is-errno.h  |   0
 .../{ => samsung}/exynos4-is/fimc-is-i2c.c    |   0
 .../{ => samsung}/exynos4-is/fimc-is-i2c.h    |   0
 .../{ => samsung}/exynos4-is/fimc-is-param.c  |   0
 .../{ => samsung}/exynos4-is/fimc-is-param.h  |   0
 .../{ => samsung}/exynos4-is/fimc-is-regs.c   |   0
 .../{ => samsung}/exynos4-is/fimc-is-regs.h   |   0
 .../{ => samsung}/exynos4-is/fimc-is-sensor.c |   0
 .../{ => samsung}/exynos4-is/fimc-is-sensor.h |   0
 .../{ => samsung}/exynos4-is/fimc-is.c        |   0
 .../{ => samsung}/exynos4-is/fimc-is.h        |   0
 .../{ => samsung}/exynos4-is/fimc-isp-video.c |   0
 .../{ => samsung}/exynos4-is/fimc-isp-video.h |   0
 .../{ => samsung}/exynos4-is/fimc-isp.c       |   0
 .../{ => samsung}/exynos4-is/fimc-isp.h       |   0
 .../{ => samsung}/exynos4-is/fimc-lite-reg.c  |   0
 .../{ => samsung}/exynos4-is/fimc-lite-reg.h  |   0
 .../{ => samsung}/exynos4-is/fimc-lite.c      |   0
 .../{ => samsung}/exynos4-is/fimc-lite.h      |   0
 .../{ => samsung}/exynos4-is/fimc-m2m.c       |   0
 .../{ => samsung}/exynos4-is/fimc-reg.c       |   0
 .../{ => samsung}/exynos4-is/fimc-reg.h       |   0
 .../{ => samsung}/exynos4-is/media-dev.c      |   0
 .../{ => samsung}/exynos4-is/media-dev.h      |   0
 .../{ => samsung}/exynos4-is/mipi-csis.c      |   0
 .../{ => samsung}/exynos4-is/mipi-csis.h      |   0
 .../media/platform/samsung/s3c-camif/Kconfig  |  15 +
 .../platform/{ => samsung}/s3c-camif/Makefile |   0
 .../{ => samsung}/s3c-camif/camif-capture.c   |   0
 .../{ => samsung}/s3c-camif/camif-core.c      |   0
 .../{ => samsung}/s3c-camif/camif-core.h      |   0
 .../{ => samsung}/s3c-camif/camif-regs.c      |   0
 .../{ => samsung}/s3c-camif/camif-regs.h      |   0
 .../media/platform/samsung/s5p-g2d/Kconfig    |  11 +
 .../platform/{ => samsung}/s5p-g2d/Makefile   |   0
 .../platform/{ => samsung}/s5p-g2d/g2d-hw.c   |   0
 .../platform/{ => samsung}/s5p-g2d/g2d-regs.h |   0
 .../platform/{ => samsung}/s5p-g2d/g2d.c      |   0
 .../platform/{ => samsung}/s5p-g2d/g2d.h      |   0
 .../media/platform/samsung/s5p-jpeg/Kconfig   |  12 +
 .../platform/{ => samsung}/s5p-jpeg/Makefile  |   0
 .../{ => samsung}/s5p-jpeg/jpeg-core.c        |   2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-core.h        |   2 +-
 .../s5p-jpeg/jpeg-hw-exynos3250.c             |   0
 .../s5p-jpeg/jpeg-hw-exynos3250.h             |   2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.c  |   0
 .../{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.h  |   0
 .../{ => samsung}/s5p-jpeg/jpeg-hw-s5p.c      |   2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-hw-s5p.h      |   2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-regs.h        |   2 +-
 .../media/platform/samsung/s5p-mfc/Kconfig    |   9 +
 .../platform/{ => samsung}/s5p-mfc/Makefile   |   0
 .../{ => samsung}/s5p-mfc/regs-mfc-v10.h      |   0
 .../{ => samsung}/s5p-mfc/regs-mfc-v6.h       |   0
 .../{ => samsung}/s5p-mfc/regs-mfc-v7.h       |   0
 .../{ => samsung}/s5p-mfc/regs-mfc-v8.h       |   0
 .../platform/{ => samsung}/s5p-mfc/regs-mfc.h |   0
 .../platform/{ => samsung}/s5p-mfc/s5p_mfc.c  |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd.c       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd.h       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.c    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.h    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.c    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.h    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_common.h    |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_ctrl.c      |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_ctrl.h      |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_debug.h     |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_dec.c       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_dec.h       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_enc.c       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_enc.h       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_intr.c      |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_intr.h      |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_iommu.h     |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr.c       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr.h       |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.c    |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.h    |   0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.c    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.h    |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_pm.c        |   2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_pm.h        |   2 +-
 drivers/media/platform/sti/Kconfig            |   9 +
 drivers/media/platform/sti/Makefile           |   6 +
 drivers/media/platform/sti/bdisp/Kconfig      |  10 +
 drivers/media/platform/sti/c8sectpfe/Kconfig  |   1 +
 drivers/media/platform/sti/delta/Kconfig      |  36 +
 drivers/media/platform/sti/hva/Kconfig        |  26 +
 drivers/media/platform/sti/stm32/Kconfig      |  31 +
 .../media/platform/{ => sti}/stm32/Makefile   |   0
 .../platform/{ => sti}/stm32/dma2d/dma2d-hw.c |   0
 .../{ => sti}/stm32/dma2d/dma2d-regs.h        |   0
 .../platform/{ => sti}/stm32/dma2d/dma2d.c    |   0
 .../platform/{ => sti}/stm32/dma2d/dma2d.h    |   0
 .../platform/{ => sti}/stm32/stm32-dcmi.c     |   0
 drivers/media/platform/sunxi/Kconfig          |   4 -
 drivers/media/platform/ti/Kconfig             |   9 +
 drivers/media/platform/ti/Makefile            |   6 +
 .../media/platform/{ => ti}/am437x/Kconfig    |   3 +-
 .../media/platform/{ => ti}/am437x/Makefile   |   0
 .../platform/{ => ti}/am437x/am437x-vpfe.c    |   0
 .../platform/{ => ti}/am437x/am437x-vpfe.h    |   0
 .../{ => ti}/am437x/am437x-vpfe_regs.h        |   0
 .../media/platform/{ => ti}/davinci/Kconfig   |  18 +-
 .../media/platform/{ => ti}/davinci/Makefile  |   0
 .../{ => ti}/davinci/ccdc_hw_device.h         |   0
 .../platform/{ => ti}/davinci/dm355_ccdc.c    |   0
 .../{ => ti}/davinci/dm355_ccdc_regs.h        |   0
 .../platform/{ => ti}/davinci/dm644x_ccdc.c   |   0
 .../{ => ti}/davinci/dm644x_ccdc_regs.h       |   0
 .../media/platform/{ => ti}/davinci/isif.c    |   0
 .../platform/{ => ti}/davinci/isif_regs.h     |   0
 .../media/platform/{ => ti}/davinci/vpbe.c    |   0
 .../platform/{ => ti}/davinci/vpbe_display.c  |   0
 .../platform/{ => ti}/davinci/vpbe_osd.c      |   0
 .../platform/{ => ti}/davinci/vpbe_osd_regs.h |   0
 .../platform/{ => ti}/davinci/vpbe_venc.c     |   0
 .../{ => ti}/davinci/vpbe_venc_regs.h         |   0
 .../platform/{ => ti}/davinci/vpfe_capture.c  |   0
 .../media/platform/{ => ti}/davinci/vpif.c    |   0
 .../media/platform/{ => ti}/davinci/vpif.h    |   0
 .../platform/{ => ti}/davinci/vpif_capture.c  |   0
 .../platform/{ => ti}/davinci/vpif_capture.h  |   0
 .../platform/{ => ti}/davinci/vpif_display.c  |   0
 .../platform/{ => ti}/davinci/vpif_display.h  |   0
 .../media/platform/{ => ti}/davinci/vpss.c    |   0
 drivers/media/platform/{ => ti}/omap/Kconfig  |   3 +-
 drivers/media/platform/{ => ti}/omap/Makefile |   0
 .../media/platform/{ => ti}/omap/omap_vout.c  |   0
 .../platform/{ => ti}/omap/omap_vout_vrfb.c   |   0
 .../platform/{ => ti}/omap/omap_vout_vrfb.h   |   0
 .../platform/{ => ti}/omap/omap_voutdef.h     |   0
 .../platform/{ => ti}/omap/omap_voutlib.c     |   0
 .../platform/{ => ti}/omap/omap_voutlib.h     |   0
 drivers/media/platform/ti/omap3isp/Kconfig    |  21 +
 .../media/platform/{ => ti}/omap3isp/Makefile |   0
 .../{ => ti}/omap3isp/cfa_coef_table.h        |   0
 .../platform/{ => ti}/omap3isp/gamma_table.h  |   0
 .../media/platform/{ => ti}/omap3isp/isp.c    |   0
 .../media/platform/{ => ti}/omap3isp/isp.h    |   0
 .../platform/{ => ti}/omap3isp/ispccdc.c      |   0
 .../platform/{ => ti}/omap3isp/ispccdc.h      |   0
 .../platform/{ => ti}/omap3isp/ispccp2.c      |   0
 .../platform/{ => ti}/omap3isp/ispccp2.h      |   0
 .../platform/{ => ti}/omap3isp/ispcsi2.c      |   0
 .../platform/{ => ti}/omap3isp/ispcsi2.h      |   0
 .../platform/{ => ti}/omap3isp/ispcsiphy.c    |   0
 .../platform/{ => ti}/omap3isp/ispcsiphy.h    |   0
 .../media/platform/{ => ti}/omap3isp/isph3a.h |   0
 .../platform/{ => ti}/omap3isp/isph3a_aewb.c  |   0
 .../platform/{ => ti}/omap3isp/isph3a_af.c    |   0
 .../platform/{ => ti}/omap3isp/isphist.c      |   0
 .../platform/{ => ti}/omap3isp/isphist.h      |   0
 .../platform/{ => ti}/omap3isp/isppreview.c   |   0
 .../platform/{ => ti}/omap3isp/isppreview.h   |   0
 .../media/platform/{ => ti}/omap3isp/ispreg.h |   0
 .../platform/{ => ti}/omap3isp/ispresizer.c   |   0
 .../platform/{ => ti}/omap3isp/ispresizer.h   |   0
 .../platform/{ => ti}/omap3isp/ispstat.c      |   0
 .../platform/{ => ti}/omap3isp/ispstat.h      |   0
 .../platform/{ => ti}/omap3isp/ispvideo.c     |   0
 .../platform/{ => ti}/omap3isp/ispvideo.h     |   0
 .../{ => ti}/omap3isp/luma_enhance_table.h    |   0
 .../{ => ti}/omap3isp/noise_filter_table.h    |   0
 .../platform/{ => ti}/omap3isp/omap3isp.h     |   0
 drivers/media/platform/ti/vpe/Kconfig         |  62 ++
 .../platform/{ti-vpe => ti/vpe}/Makefile      |   0
 .../{ti-vpe => ti/vpe}/cal-camerarx.c         |   0
 .../platform/{ti-vpe => ti/vpe}/cal-video.c   |   0
 .../media/platform/{ti-vpe => ti/vpe}/cal.c   |   0
 .../media/platform/{ti-vpe => ti/vpe}/cal.h   |   0
 .../platform/{ti-vpe => ti/vpe}/cal_regs.h    |   0
 .../media/platform/{ti-vpe => ti/vpe}/csc.c   |   0
 .../media/platform/{ti-vpe => ti/vpe}/csc.h   |   0
 .../media/platform/{ti-vpe => ti/vpe}/sc.c    |   0
 .../media/platform/{ti-vpe => ti/vpe}/sc.h    |   0
 .../platform/{ti-vpe => ti/vpe}/sc_coeff.h    |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.c |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.h |   0
 .../platform/{ti-vpe => ti/vpe}/vpdma_priv.h  |   0
 .../media/platform/{ti-vpe => ti/vpe}/vpe.c   |   0
 .../platform/{ti-vpe => ti/vpe}/vpe_regs.h    |   0
 drivers/media/platform/via/Kconfig            |  14 +
 drivers/media/platform/via/Makefile           |   2 +
 drivers/media/platform/{ => via}/via-camera.c |   0
 drivers/media/platform/{ => via}/via-camera.h |   0
 drivers/media/platform/xilinx/Kconfig         |  10 +-
 drivers/media/radio/Kconfig                   |  54 +-
 drivers/media/radio/Makefile                  |  43 +-
 drivers/media/radio/si470x/Kconfig            |   2 +-
 drivers/media/radio/wl128x/Kconfig            |   2 +-
 drivers/media/rc/Makefile                     |  47 +-
 drivers/media/rc/keymaps/Makefile             |  34 +-
 drivers/media/spi/Kconfig                     |   4 +-
 drivers/media/spi/Makefile                    |   7 +-
 drivers/media/test-drivers/Kconfig            |   2 +-
 drivers/media/test-drivers/Makefile           |  14 +-
 drivers/media/test-drivers/vicodec/Kconfig    |   2 +-
 drivers/media/test-drivers/vimc/Kconfig       |   2 +-
 drivers/media/test-drivers/vivid/Kconfig      |   2 +-
 drivers/media/tuners/Kconfig                  |   6 +-
 drivers/media/tuners/Makefile                 |  66 +-
 drivers/media/tuners/e4000.c                  |   6 +-
 drivers/media/tuners/fc2580.c                 |   6 +-
 drivers/media/tuners/tuner-types.c            |   2 +-
 .../{tuner-xc2028-types.h => xc2028-types.h}  |   6 +-
 .../media/tuners/{tuner-xc2028.c => xc2028.c} |   6 +-
 .../media/tuners/{tuner-xc2028.h => xc2028.h} |   2 +-
 drivers/media/tuners/xc4000.c                 |   2 +-
 drivers/media/usb/Makefile                    |  40 +-
 drivers/media/usb/airspy/Kconfig              |   2 +-
 drivers/media/usb/au0828/Kconfig              |   6 +-
 drivers/media/usb/cpia2/Kconfig               |   2 +-
 drivers/media/usb/dvb-usb-v2/Kconfig          |   8 +-
 drivers/media/usb/dvb-usb/Kconfig             |   4 +-
 drivers/media/usb/dvb-usb/cxusb.c             |   2 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   2 +-
 drivers/media/usb/em28xx/em28xx-i2c.c         |   2 +-
 drivers/media/usb/em28xx/em28xx.h             |   2 +-
 drivers/media/usb/gspca/Kconfig               |  96 +--
 drivers/media/usb/gspca/Makefile              |  88 +--
 drivers/media/usb/gspca/gl860/Kconfig         |   2 +-
 drivers/media/usb/gspca/m5602/Kconfig         |   2 +-
 drivers/media/usb/hackrf/Kconfig              |   2 +-
 drivers/media/usb/hdpvr/Kconfig               |   2 +-
 drivers/media/usb/msi2500/Kconfig             |   2 +-
 drivers/media/usb/pvrusb2/Kconfig             |   2 +-
 drivers/media/usb/pwc/Kconfig                 |   2 +-
 drivers/media/usb/s2255/Kconfig               |   2 +-
 drivers/media/usb/stkwebcam/Kconfig           |   2 +-
 drivers/media/usb/tm6000/tm6000-cards.c       |   2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c         |   2 +-
 drivers/media/usb/tm6000/tm6000-i2c.c         |   2 +-
 drivers/media/usb/usbtv/Kconfig               |   2 +-
 drivers/media/usb/uvc/Kconfig                 |   2 +-
 drivers/media/usb/zr364xx/Kconfig             |   2 +-
 drivers/media/v4l2-core/Kconfig               |  12 +-
 drivers/media/v4l2-core/Makefile              |  34 +-
 drivers/media/v4l2-core/tuner-core.c          |   2 +-
 drivers/staging/media/atomisp/Kconfig         |   2 +-
 drivers/staging/media/atomisp/i2c/Kconfig     |  14 +-
 drivers/staging/media/hantro/Kconfig          |   2 +-
 drivers/staging/media/imx/Kconfig             |   2 +-
 drivers/staging/media/ipu3/Kconfig            |   2 +-
 drivers/staging/media/max96712/Kconfig        |   2 +-
 drivers/staging/media/meson/vdec/Kconfig      |   2 +-
 drivers/staging/media/omap4iss/Kconfig        |   2 +-
 drivers/staging/media/rkvdec/Kconfig          |   2 +-
 drivers/staging/media/sunxi/cedrus/Kconfig    |   2 +-
 drivers/staging/media/tegra-video/Kconfig     |   2 +-
 drivers/staging/media/zoran/Kconfig           |   2 +-
 drivers/staging/most/video/Kconfig            |   2 +-
 .../vc04_services/bcm2835-camera/Kconfig      |   2 +-
 drivers/usb/gadget/Kconfig                    |   2 +-
 drivers/usb/gadget/legacy/Kconfig             |   2 +-
 sound/pci/Kconfig                             |   4 +-
 583 files changed, 1778 insertions(+), 1596 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/Kconfig
 create mode 100644 drivers/media/platform/allwinner/Kconfig
 rename drivers/media/platform/{sunxi => allwinner}/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Kconfig (83%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_dma.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_v4l2.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Kconfig (81%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi_reg.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.h (100%)
 create mode 100644 drivers/media/platform/allwinner/sun8i-di/Kconfig
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.h (100%)
 create mode 100644 drivers/media/platform/allwinner/sun8i-rotate/Kconfig
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-formats.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-rotate.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_formats.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_rotate.c (100%)
 create mode 100644 drivers/media/platform/amlogic/Kconfig
 create mode 100644 drivers/media/platform/amlogic/Makefile
 create mode 100644 drivers/media/platform/amlogic/meson-ge2d/Kconfig
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c (100%)
 create mode 100644 drivers/media/platform/aspeed/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Makefile
 rename drivers/media/platform/{ => aspeed}/aspeed-video.c (100%)
 create mode 100644 drivers/media/platform/chips-media/Kconfig
 rename drivers/media/platform/{coda => chips-media}/Makefile (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-bit.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-common.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-gdi.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-h264.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-jpeg.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-mpeg2.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda-mpeg4.c (100%)
 rename drivers/media/platform/{coda => chips-media}/coda.h (100%)
 rename drivers/media/platform/{coda => chips-media}/coda_regs.h (99%)
 rename drivers/media/platform/{coda => chips-media}/imx-vdoa.c (100%)
 rename drivers/media/platform/{coda => chips-media}/imx-vdoa.h (100%)
 rename drivers/media/platform/{coda => chips-media}/trace.h (98%)
 delete mode 100644 drivers/media/platform/imx/Kconfig
 delete mode 100644 drivers/media/platform/imx/Makefile
 create mode 100644 drivers/media/platform/intel/Kconfig
 create mode 100644 drivers/media/platform/intel/Makefile
 rename drivers/media/platform/{ => intel}/pxa_camera.c (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/Kconfig (85%)
 rename drivers/media/platform/{marvell-ccic => marvell}/Makefile (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/cafe-driver.c (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mcam-core.c (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mcam-core.h (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mmp-driver.c (100%)
 create mode 100644 drivers/media/platform/mediatek/Kconfig
 create mode 100644 drivers/media/platform/mediatek/Makefile
 create mode 100644 drivers/media/platform/mediatek/mtk-jpeg/Kconfig
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_core.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_parse.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_reg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.h (100%)
 create mode 100644 drivers/media/platform/mediatek/mtk-mdp/Kconfig
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/Makefile (77%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_comp.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_core.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_ipi.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_m2m.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_regs.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/mtk_mdp_vpu.h (100%)
 create mode 100644 drivers/media/platform/mediatek/mtk-vcodec/Kconfig
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_drv.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_hw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_pm.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateful.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_dec_stateless.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_drv.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_drv.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_enc_pm.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_priv.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_scp.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_fw_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_intr.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/mtk_vcodec_util.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_h264_req_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp8_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec/vdec_vp9_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_base.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_drv_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_ipi_msg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_msg_queue.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/vdec_vpu_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc/venc_h264_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc/venc_vp8_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_base.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_drv_if.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_ipi_msg.h (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/venc_vpu_if.h (100%)
 create mode 100644 drivers/media/platform/mediatek/mtk-vpu/Kconfig
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.h (100%)
 create mode 100644 drivers/media/platform/nvidia/Kconfig
 create mode 100644 drivers/media/platform/nvidia/tegra-vde/Kconfig
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/Makefile (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/dmabuf-cache.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/h264.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/iommu.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/trace.h (97%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/v4l2.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/vde.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/vde.h (100%)
 create mode 100644 drivers/media/platform/nxp/Kconfig
 create mode 100644 drivers/media/platform/nxp/Makefile
 create mode 100644 drivers/media/platform/nxp/amphion/Kconfig
 rename drivers/media/platform/{ => nxp}/amphion/Makefile (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vdec.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/venc.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_cmds.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_cmds.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_codec.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_color.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_core.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_core.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_dbg.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_defs.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_drv.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_helpers.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_helpers.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_imx8q.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_imx8q.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_malone.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_malone.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_mbox.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_mbox.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_msgs.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_msgs.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_rpc.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_rpc.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_v4l2.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_v4l2.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_windsor.c (100%)
 rename drivers/media/platform/{ => nxp}/amphion/vpu_windsor.h (100%)
 rename drivers/media/platform/{ => nxp}/fsl-viu.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/Kconfig (85%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/Makefile (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.h (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg.c (99%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg.h (100%)
 rename drivers/media/platform/{imx => nxp}/imx-mipi-csis.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.h (100%)
 rename drivers/media/platform/{ => nxp}/mx2_emmaprp.c (100%)
 create mode 100644 drivers/media/platform/qcom/Kconfig
 create mode 100644 drivers/media/platform/qcom/Makefile
 create mode 100644 drivers/media/platform/qcom/camss/Kconfig
 create mode 100644 drivers/media/platform/qcom/venus/Kconfig
 create mode 100644 drivers/media/platform/renesas/Kconfig
 create mode 100644 drivers/media/platform/renesas/Makefile
 rename drivers/media/platform/{ => renesas}/rcar-fcp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-isp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Kconfig (87%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Makefile (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-core.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-csi2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-dma.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-v4l2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-vin.h (100%)
 rename drivers/media/platform/{ => renesas}/rcar_drif.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_fdp1.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_jpu.c (99%)
 rename drivers/media/platform/{ => renesas}/renesas-ceu.c (100%)
 rename drivers/media/platform/{ => renesas}/sh_vou.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/Makefile (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_brx.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_brx.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_clu.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_clu.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_dl.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_dl.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_drm.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_drm.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_drv.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_entity.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_entity.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hgo.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hgo.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hgt.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hgt.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_histo.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_histo.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hsit.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_hsit.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_lif.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_lif.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_lut.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_lut.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_pipe.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_pipe.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_regs.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_rpf.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_rwpf.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_rwpf.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_sru.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_sru.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_uds.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_uds.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_uif.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_uif.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_video.c (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_video.h (100%)
 rename drivers/media/platform/{ => renesas}/vsp1/vsp1_wpf.c (100%)
 create mode 100644 drivers/media/platform/rockchip/Kconfig
 create mode 100644 drivers/media/platform/rockchip/Makefile
 create mode 100644 drivers/media/platform/rockchip/rga/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkisp1/Kconfig
 create mode 100644 drivers/media/platform/samsung/Kconfig
 create mode 100644 drivers/media/platform/samsung/Makefile
 create mode 100644 drivers/media/platform/samsung/exynos-gsc/Kconfig
 rename drivers/media/platform/{ => samsung}/exynos-gsc/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-core.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-core.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-m2m.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-regs.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/Kconfig (96%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/common.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/common.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-capture.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-core.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-core.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-command.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-errno.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-errno.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-i2c.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-i2c.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-param.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-param.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-regs.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-sensor.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is-sensor.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-is.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-isp-video.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-isp-video.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-isp.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-isp.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-lite-reg.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-lite-reg.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-lite.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-lite.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-m2m.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-reg.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/fimc-reg.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/media-dev.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/media-dev.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/mipi-csis.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/mipi-csis.h (100%)
 create mode 100644 drivers/media/platform/samsung/s3c-camif/Kconfig
 rename drivers/media/platform/{ => samsung}/s3c-camif/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-capture.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-core.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-core.h (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-regs.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-regs.h (100%)
 create mode 100644 drivers/media/platform/samsung/s5p-g2d/Kconfig
 rename drivers/media/platform/{ => samsung}/s5p-g2d/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d-hw.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d.h (100%)
 create mode 100644 drivers/media/platform/samsung/s5p-jpeg/Kconfig
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-core.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-core.h (99%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-exynos3250.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-exynos3250.h (97%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-s5p.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-hw-s5p.h (97%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/jpeg-regs.h (99%)
 create mode 100644 drivers/media/platform/samsung/s5p-mfc/Kconfig
 rename drivers/media/platform/{ => samsung}/s5p-mfc/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/regs-mfc-v10.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/regs-mfc-v6.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/regs-mfc-v7.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/regs-mfc-v8.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/regs-mfc.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd.c (89%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd.h (92%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.c (98%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.h (82%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.c (98%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.h (82%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_common.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_ctrl.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_ctrl.h (92%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_debug.h (95%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_dec.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_dec.h (90%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_enc.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_enc.h (90%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_intr.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_intr.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_iommu.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr.c (98%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr.h (99%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.c (99%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.h (96%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_pm.c (97%)
 rename drivers/media/platform/{ => samsung}/s5p-mfc/s5p_mfc_pm.h (87%)
 create mode 100644 drivers/media/platform/sti/Kconfig
 create mode 100644 drivers/media/platform/sti/Makefile
 create mode 100644 drivers/media/platform/sti/bdisp/Kconfig
 create mode 100644 drivers/media/platform/sti/delta/Kconfig
 create mode 100644 drivers/media/platform/sti/hva/Kconfig
 create mode 100644 drivers/media/platform/sti/stm32/Kconfig
 rename drivers/media/platform/{ => sti}/stm32/Makefile (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c (100%)
 delete mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/ti/Kconfig
 create mode 100644 drivers/media/platform/ti/Makefile
 rename drivers/media/platform/{ => ti}/am437x/Kconfig (88%)
 rename drivers/media/platform/{ => ti}/am437x/Makefile (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe.c (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe.h (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/Kconfig (90%)
 rename drivers/media/platform/{ => ti}/davinci/Makefile (100%)
 rename drivers/media/platform/{ => ti}/davinci/ccdc_hw_device.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/dm355_ccdc.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/dm355_ccdc_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/dm644x_ccdc.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/dm644x_ccdc_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/isif.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/isif_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe_display.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe_osd.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe_osd_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe_venc.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpbe_venc_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpfe_capture.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif_capture.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif_capture.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif_display.c (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpif_display.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/vpss.c (100%)
 rename drivers/media/platform/{ => ti}/omap/Kconfig (89%)
 rename drivers/media/platform/{ => ti}/omap/Makefile (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout_vrfb.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout_vrfb.h (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutdef.h (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutlib.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutlib.h (100%)
 create mode 100644 drivers/media/platform/ti/omap3isp/Kconfig
 rename drivers/media/platform/{ => ti}/omap3isp/Makefile (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/cfa_coef_table.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/gamma_table.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isp.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isp.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispccdc.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispccdc.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispccp2.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispccp2.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispcsi2.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispcsi2.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispcsiphy.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispcsiphy.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isph3a.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isph3a_aewb.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isph3a_af.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isphist.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isphist.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isppreview.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/isppreview.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispreg.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispresizer.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispresizer.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispstat.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispstat.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispvideo.c (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/ispvideo.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/luma_enhance_table.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/noise_filter_table.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/omap3isp.h (100%)
 create mode 100644 drivers/media/platform/ti/vpe/Kconfig
 rename drivers/media/platform/{ti-vpe => ti/vpe}/Makefile (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/cal-camerarx.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/cal-video.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/cal.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/cal.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/cal_regs.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/csc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/sc_coeff.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpdma_priv.h (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe.c (100%)
 rename drivers/media/platform/{ti-vpe => ti/vpe}/vpe_regs.h (100%)
 create mode 100644 drivers/media/platform/via/Kconfig
 create mode 100644 drivers/media/platform/via/Makefile
 rename drivers/media/platform/{ => via}/via-camera.c (100%)
 rename drivers/media/platform/{ => via}/via-camera.h (100%)
 rename drivers/media/tuners/{tuner-xc2028-types.h => xc2028-types.h} (96%)
 rename drivers/media/tuners/{tuner-xc2028.c => xc2028.c} (99%)
 rename drivers/media/tuners/{tuner-xc2028.h => xc2028.h} (99%)

-- 
2.35.1


