Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C54D9058
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:29:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXmZ5Z1jz30Dh
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:29:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rDFlPbjN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rDFlPbjN; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGW814NxCz2x9M;
 Sun, 13 Mar 2022 18:12:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D0FEB80B30;
 Sun, 13 Mar 2022 07:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8F9C340EE;
 Sun, 13 Mar 2022 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647155531;
 bh=RrZmUHEFu1O/6sY2ZJDXTUSiwVjY3XoUbxVRMBmOJpE=;
 h=From:To:Cc:Subject:Date:From;
 b=rDFlPbjNS27ApigoEk0MbyGNaqqjXgE/tkLD7995XgiP0GzvSVzOySpC1xrRxGpPR
 Wn5MaBhQJkQuW70rpuX/5ti4VqR99FTSnm6katzq3kaoIJzJs00bpuCrSxDSQqUnzm
 EUebvXnHu6xWCKhQvCinw5JuH8QQogy/hrW0yvuaQSkieBMfH12EK5LyAqGAg7y5wg
 4Tyjo4nxjKLU4UcAUhUFXY8iWUq0/MYNNoqOCeaHELcitGn1WdOBX70j/oLTJmjRLP
 KMTfqLQSdBntuidgMRsn593qY29jtQuOx6IaB/+HwmXpEA3kYHiF2oYJ9EbDcHoOEu
 OLBL4Vcriqvjg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTIOd-0012gw-Sf; Sun, 13 Mar 2022 08:12:07 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH] media: Kconfig: cleanup VIDEO_DEV dependencies
Date: Sun, 13 Mar 2022 08:12:05 +0100
Message-Id: <42ae3d28d4d822f3e14db76b99f2f4c41688ae3e.1647155467.git.mchehab@kernel.org>
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eddie James <eajames@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, Pavel Machek <pavel@ucw.cz>,
 Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Sean Young <sean@mess.org>,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Antti Palosaari <crope@iki.fi>, NXP Linux Team <linux-imx@nxp.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Martina Krasteva <martinax.krasteva@intel.com>, linux-sunxi@lists.linux.dev,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Antoine Jacquet <royale@zerezo.com>,
 Andy Walls <awalls@md.metrocast.net>, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Heungjun Kim <riverful.kim@samsung.com>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ming Qian <ming.qian@nxp.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-amlogic@lists.infradead.org, Mike Isely <isely@pobox.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Zhou Peng <eagle.zhou@nxp.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joe Hung <joe_hung@ilitek.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Arec Kao <arec.kao@intel.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-tegra@vger.kernel.org,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Erik Andren <erik.andren@gmail.com>,
 linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shijie Qin <shijie.qin@nxp.com>,
 Chen-Yu Tsai <wens@csie.org>, Jacob Chen <jacob-chen@iotwrt.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 linux-input@vger.kernel.org, Bin Liu <bin.liu@mediatek.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Ray Jui <rjui@broadcom.com>, mjpeg-users@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Felipe Balbi <balbi@kernel.org>,
 Jeff LaBundy <jeff@labundy.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dan Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Olivier Lorin <o.lorin@laposte.net>,
 Marek Vasut <marex@denx.de>, linux-renesas-soc@vger.kernel.org,
 Rick Chang <rick.chang@mediatek.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, openbmc@lists.ozlabs.org,
 Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
 Andy Gross <agross@kernel.org>, Corentin Labbe <clabbe@baylibre.com>,
 Yong Zhi <yong.zhi@intel.com>, Shawn Tu <shawnx.tu@intel.com>,
 Christian Hemp <c.hemp@phytec.de>, Benoit Parrot <bparrot@ti.com>,
 linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Anton Sviridenko <anton@corp.bluecherry.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Robert Foss <robert.foss@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Colin Ian King <colin.king@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

media Kconfig has two entries associated to V4L API:
VIDEO_DEV and VIDEO_V4L2.

On Kernel 2.6.x, there were two V4L APIs, each one with its own flag.
VIDEO_DEV were meant to:
	1) enable Video4Linux and make its Kconfig options to appear;
	2) it makes the Kernel build the V4L core.

while VIDEO_V4L2 where used to distinguish between drivers that
implement the newer API and drivers that implemented the former one.

With time, such meaning changed, specially after the removal of
all V4L version 1 drivers.

At the current implementation, VIDEO_DEV only does (1): it enables
the media options related to V4L, that now has:

	menu "Video4Linux options"
		visible if VIDEO_DEV

	source "drivers/media/v4l2-core/Kconfig"
	endmenu

but it doesn't affect anymore the V4L core drivers.

The rationale is that the V4L2 core has a "soft" dependency
at the I2C bus, and now requires to select a number of other
Kconfig options:

	config VIDEO_V4L2
		tristate
		depends on (I2C || I2C=n) && VIDEO_DEV
		select RATIONAL
		select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
		default (I2C || I2C=n) && VIDEO_DEV

In the past, merging them would be tricky, but it seems that it is now
possible to merge those symbols, in order to simplify V4L dependencies.

Let's keep VIDEO_DEV, as this one is used on some make *defconfig
configurations.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/input/rmi4/Kconfig                    |   2 +-
 drivers/input/touchscreen/Kconfig             |   4 +-
 drivers/media/Kconfig                         |   3 +
 drivers/media/common/saa7146/Kconfig          |   2 +-
 drivers/media/dvb-core/Kconfig                |   2 +-
 drivers/media/dvb-frontends/Kconfig           |   4 +-
 drivers/media/i2c/Kconfig                     | 250 +++++++++---------
 drivers/media/i2c/ccs/Kconfig                 |   2 +-
 drivers/media/i2c/cx25840/Kconfig             |   2 +-
 drivers/media/i2c/et8ek8/Kconfig              |   2 +-
 drivers/media/i2c/m5mols/Kconfig              |   2 +-
 drivers/media/pci/Kconfig                     |   2 +-
 drivers/media/pci/bt8xx/Kconfig               |   2 +-
 drivers/media/pci/cobalt/Kconfig              |   2 +-
 drivers/media/pci/cx18/Kconfig                |   2 +-
 drivers/media/pci/dt3155/Kconfig              |   2 +-
 drivers/media/pci/intel/ipu3/Kconfig          |   2 +-
 drivers/media/pci/ivtv/Kconfig                |   2 +-
 drivers/media/pci/meye/Kconfig                |   2 +-
 drivers/media/pci/saa7146/Kconfig             |   6 +-
 drivers/media/pci/sta2x11/Kconfig             |   2 +-
 drivers/media/pci/tw5864/Kconfig              |   2 +-
 drivers/media/pci/tw68/Kconfig                |   2 +-
 drivers/media/pci/tw686x/Kconfig              |   2 +-
 drivers/media/platform/Kconfig                |   6 +-
 drivers/media/platform/allegro-dvt/Kconfig    |   2 +-
 drivers/media/platform/am437x/Kconfig         |   2 +-
 drivers/media/platform/amphion/Kconfig        |   2 +-
 drivers/media/platform/aspeed/Kconfig         |   2 +-
 drivers/media/platform/atmel/Kconfig          |   8 +-
 drivers/media/platform/cadence/Kconfig        |   4 +-
 drivers/media/platform/coda/Kconfig           |   2 +-
 drivers/media/platform/davinci/Kconfig        |  12 +-
 drivers/media/platform/exynos-gsc/Kconfig     |   2 +-
 drivers/media/platform/exynos4-is/Kconfig     |   2 +-
 drivers/media/platform/intel/Kconfig          |   2 +-
 drivers/media/platform/marvell-ccic/Kconfig   |   4 +-
 drivers/media/platform/meson/ge2d/Kconfig     |   2 +-
 drivers/media/platform/mtk-jpeg/Kconfig       |   2 +-
 drivers/media/platform/mtk-mdp/Kconfig        |   2 +-
 drivers/media/platform/mtk-vcodec/Kconfig     |   2 +-
 drivers/media/platform/mtk-vpu/Kconfig        |   2 +-
 drivers/media/platform/nxp/Kconfig            |   8 +-
 drivers/media/platform/nxp/imx-jpeg/Kconfig   |   2 +-
 drivers/media/platform/omap/Kconfig           |   2 +-
 drivers/media/platform/omap3isp/Kconfig       |   2 +-
 drivers/media/platform/qcom/camss/Kconfig     |   2 +-
 drivers/media/platform/qcom/venus/Kconfig     |   2 +-
 drivers/media/platform/renesas/Kconfig        |  12 +-
 .../media/platform/renesas/rcar-vin/Kconfig   |   4 +-
 drivers/media/platform/rockchip/rga/Kconfig   |   2 +-
 .../media/platform/rockchip/rkisp1/Kconfig    |   2 +-
 drivers/media/platform/s3c-camif/Kconfig      |   2 +-
 drivers/media/platform/s5p-g2d/Kconfig        |   2 +-
 drivers/media/platform/s5p-jpeg/Kconfig       |   2 +-
 drivers/media/platform/s5p-mfc/Kconfig        |   2 +-
 drivers/media/platform/sti/bdisp/Kconfig      |   2 +-
 drivers/media/platform/sti/delta/Kconfig      |   2 +-
 drivers/media/platform/sti/hva/Kconfig        |   2 +-
 drivers/media/platform/stm32/Kconfig          |   4 +-
 .../media/platform/sunxi/sun4i-csi/Kconfig    |   2 +-
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   2 +-
 drivers/media/platform/sunxi/sun8i-di/Kconfig |   2 +-
 .../media/platform/sunxi/sun8i-rotate/Kconfig |   2 +-
 drivers/media/platform/tegra/vde/Kconfig      |   2 +-
 drivers/media/platform/ti-vpe/Kconfig         |   4 +-
 drivers/media/platform/via/Kconfig            |   2 +-
 drivers/media/platform/xilinx/Kconfig         |   2 +-
 drivers/media/radio/Kconfig                   |  54 ++--
 drivers/media/radio/si470x/Kconfig            |   2 +-
 drivers/media/radio/wl128x/Kconfig            |   2 +-
 drivers/media/spi/Kconfig                     |   4 +-
 drivers/media/test-drivers/Kconfig            |   2 +-
 drivers/media/test-drivers/vicodec/Kconfig    |   2 +-
 drivers/media/test-drivers/vimc/Kconfig       |   2 +-
 drivers/media/test-drivers/vivid/Kconfig      |   2 +-
 drivers/media/tuners/Kconfig                  |   6 +-
 drivers/media/tuners/e4000.c                  |   6 +-
 drivers/media/tuners/fc2580.c                 |   6 +-
 drivers/media/usb/airspy/Kconfig              |   2 +-
 drivers/media/usb/au0828/Kconfig              |   6 +-
 drivers/media/usb/cpia2/Kconfig               |   2 +-
 drivers/media/usb/dvb-usb-v2/Kconfig          |   8 +-
 drivers/media/usb/dvb-usb/Kconfig             |   4 +-
 drivers/media/usb/gspca/Kconfig               |  96 +++----
 drivers/media/usb/gspca/gl860/Kconfig         |   2 +-
 drivers/media/usb/gspca/m5602/Kconfig         |   2 +-
 drivers/media/usb/hackrf/Kconfig              |   2 +-
 drivers/media/usb/hdpvr/Kconfig               |   2 +-
 drivers/media/usb/msi2500/Kconfig             |   2 +-
 drivers/media/usb/pvrusb2/Kconfig             |   2 +-
 drivers/media/usb/pwc/Kconfig                 |   2 +-
 drivers/media/usb/s2255/Kconfig               |   2 +-
 drivers/media/usb/stkwebcam/Kconfig           |   2 +-
 drivers/media/usb/usbtv/Kconfig               |   2 +-
 drivers/media/usb/uvc/Kconfig                 |   2 +-
 drivers/media/usb/zr364xx/Kconfig             |   2 +-
 drivers/media/v4l2-core/Kconfig               |  12 +-
 drivers/media/v4l2-core/Makefile              |   2 +-
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
 116 files changed, 363 insertions(+), 368 deletions(-)

diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
index 16119f760d11..c0163b983ce6 100644
--- a/drivers/input/rmi4/Kconfig
+++ b/drivers/input/rmi4/Kconfig
@@ -110,7 +110,7 @@ config RMI4_F3A
 
 config RMI4_F54
 	bool "RMI4 Function 54 (Analog diagnostics)"
-	depends on VIDEO_V4L2=y || (RMI4_CORE=m && VIDEO_V4L2=m)
+	depends on VIDEO_DEV=y || (RMI4_CORE=m && VIDEO_DEV=m)
 	select VIDEOBUF2_VMALLOC
 	select RMI4_F55
 	help
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 2f6adfb7b938..ff7794cecf69 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -131,7 +131,7 @@ config TOUCHSCREEN_ATMEL_MXT
 config TOUCHSCREEN_ATMEL_MXT_T37
 	bool "Support T37 Diagnostic Data"
 	depends on TOUCHSCREEN_ATMEL_MXT
-	depends on VIDEO_V4L2=y || (TOUCHSCREEN_ATMEL_MXT=m && VIDEO_V4L2=m)
+	depends on VIDEO_DEV=y || (TOUCHSCREEN_ATMEL_MXT=m && VIDEO_DEV=m)
 	select VIDEOBUF2_VMALLOC
 	help
 	  Say Y here if you want support to output data from the T37
@@ -1252,7 +1252,7 @@ config TOUCHSCREEN_SUN4I
 config TOUCHSCREEN_SUR40
 	tristate "Samsung SUR40 (Surface 2.0/PixelSense) touchscreen"
 	depends on USB && MEDIA_USB_SUPPORT && HAS_DMA
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_SG
 	help
 	  Say Y here if you want support for the Samsung SUR40 touchscreen
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 01b536863657..2d02d9a44b94 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -160,6 +160,9 @@ menu "Media core support"
 config VIDEO_DEV
 	tristate "Video4Linux core"
 	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_TEST_SUPPORT
+	depends on (I2C || I2C=n)
+	select RATIONAL
+	select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
 	help
 	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
 	  radio devices and by some input devices.
diff --git a/drivers/media/common/saa7146/Kconfig b/drivers/media/common/saa7146/Kconfig
index 3e85c0c3fd9a..a0aa155e5d85 100644
--- a/drivers/media/common/saa7146/Kconfig
+++ b/drivers/media/common/saa7146/Kconfig
@@ -5,6 +5,6 @@ config VIDEO_SAA7146
 
 config VIDEO_SAA7146_VV
 	tristate
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF_DMA_SG
 	select VIDEO_SAA7146
diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 6ffac618417b..8b3f2d53cd62 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -6,7 +6,7 @@
 config DVB_MMAP
 	bool "Enable DVB memory-mapped API (EXPERIMENTAL)"
 	depends on DVB_CORE
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_CORE
+	depends on VIDEO_DEV=y || VIDEO_DEV=DVB_CORE
 	select VIDEOBUF2_VMALLOC
 	help
 	  This option enables DVB experimental memory-mapped API, which
diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
index 2c1ed98d43c5..4101f9b1e731 100644
--- a/drivers/media/dvb-frontends/Kconfig
+++ b/drivers/media/dvb-frontends/Kconfig
@@ -510,7 +510,7 @@ config DVB_RTL2832
 
 config DVB_RTL2832_SDR
 	tristate "Realtek RTL2832 SDR"
-	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_V4L2 && MEDIA_SDR_SUPPORT && USB
+	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_DEV && MEDIA_SDR_SUPPORT && USB
 	select DVB_RTL2832
 	select VIDEOBUF2_VMALLOC
 	default m if !MEDIA_SUBDRV_AUTOSELECT
@@ -681,7 +681,7 @@ config DVB_AU8522_DTV
 
 config DVB_AU8522_V4L
 	tristate "Auvitek AU8522 based ATV demod"
-	depends on VIDEO_V4L2 && DVB_CORE && I2C
+	depends on VIDEO_DEV && DVB_CORE && I2C
 	select DVB_AU8522
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e7194c1be4d2..5abc169f0a5c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -3,7 +3,7 @@
 # Multimedia Video device configuration
 #
 
-if VIDEO_V4L2
+if VIDEO_DEV
 
 comment "IR I2C driver auto-selected by 'Autoselect ancillary drivers'"
 	depends on MEDIA_SUBDRV_AUTOSELECT && I2C && RC_CORE
@@ -36,7 +36,7 @@ menu "Audio decoders, processors and mixers"
 
 config VIDEO_TVAUDIO
 	tristate "Simple audio decoder chips"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for several audio decoder chips found on some bt8xx boards:
 	  Philips: tda9840, tda9873h, tda9874h/a, tda9850, tda985x, tea6300,
@@ -48,7 +48,7 @@ config VIDEO_TVAUDIO
 
 config VIDEO_TDA7432
 	tristate "Philips TDA7432 audio processor"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for tda7432 audio decoder chip found on some bt8xx boards.
 
@@ -66,7 +66,7 @@ config VIDEO_TDA9840
 
 config VIDEO_TDA1997X
 	tristate "NXP TDA1997x HDMI receiver"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on SND_SOC
 	select HDMI
 	select SND_PCM
@@ -99,7 +99,7 @@ config VIDEO_TEA6420
 
 config VIDEO_MSP3400
 	tristate "Micronas MSP34xx audio decoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Micronas MSP34xx series of audio decoders.
 
@@ -108,7 +108,7 @@ config VIDEO_MSP3400
 
 config VIDEO_CS3308
 	tristate "Cirrus Logic CS3308 audio ADC"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Cirrus Logic CS3308 High Performance 8-Channel
 	  Analog Volume Control
@@ -118,7 +118,7 @@ config VIDEO_CS3308
 
 config VIDEO_CS5345
 	tristate "Cirrus Logic CS5345 audio ADC"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Cirrus Logic CS5345 24-bit, 192 kHz
 	  stereo A/D converter.
@@ -128,7 +128,7 @@ config VIDEO_CS5345
 
 config VIDEO_CS53L32A
 	tristate "Cirrus Logic CS53L32A audio ADC"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Cirrus Logic CS53L32A low voltage
 	  stereo A/D converter.
@@ -138,7 +138,7 @@ config VIDEO_CS53L32A
 
 config VIDEO_TLV320AIC23B
 	tristate "Texas Instruments TLV320AIC23B audio codec"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Texas Instruments TLV320AIC23B audio codec.
 
@@ -147,7 +147,7 @@ config VIDEO_TLV320AIC23B
 
 config VIDEO_UDA1342
 	tristate "Philips UDA1342 audio codec"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips UDA1342 audio codec.
 
@@ -156,7 +156,7 @@ config VIDEO_UDA1342
 
 config VIDEO_WM8775
 	tristate "Wolfson Microelectronics WM8775 audio ADC with input mixer"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Wolfson Microelectronics WM8775 high
 	  performance stereo A/D Converter with a 4 channel input mixer.
@@ -166,7 +166,7 @@ config VIDEO_WM8775
 
 config VIDEO_WM8739
 	tristate "Wolfson Microelectronics WM8739 stereo audio ADC"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Wolfson Microelectronics WM8739
 	  stereo A/D Converter.
@@ -176,7 +176,7 @@ config VIDEO_WM8739
 
 config VIDEO_VP27SMPX
 	tristate "Panasonic VP27's internal MPX"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the internal MPX of the Panasonic VP27s tuner.
 
@@ -185,7 +185,7 @@ config VIDEO_VP27SMPX
 
 config VIDEO_SONY_BTF_MPX
 	tristate "Sony BTF's internal MPX"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the internal MPX of the Sony BTF-PG472Z tuner.
 
@@ -198,7 +198,7 @@ menu "RDS decoders"
 
 config VIDEO_SAA6588
 	tristate "SAA6588 Radio Chip RDS decoder support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 
 	help
 	  Support for this Radio Data System (RDS) decoder. This allows
@@ -214,7 +214,7 @@ menu "Video decoders"
 
 config VIDEO_ADV7180
 	tristate "Analog Devices ADV7180 decoder"
-	depends on GPIOLIB && VIDEO_V4L2 && I2C
+	depends on GPIOLIB && VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_ASYNC
@@ -226,7 +226,7 @@ config VIDEO_ADV7180
 
 config VIDEO_ADV7183
 	tristate "Analog Devices ADV7183 decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  V4l2 subdevice driver for the Analog Devices
 	  ADV7183 video decoder.
@@ -236,7 +236,7 @@ config VIDEO_ADV7183
 
 config VIDEO_ADV748X
 	tristate "Analog Devices ADV748x decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on OF
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -251,7 +251,7 @@ config VIDEO_ADV748X
 
 config VIDEO_ADV7604
 	tristate "Analog Devices ADV7604 decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on GPIOLIB || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -277,7 +277,7 @@ config VIDEO_ADV7604_CEC
 
 config VIDEO_ADV7842
 	tristate "Analog Devices ADV7842 decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
@@ -300,7 +300,7 @@ config VIDEO_ADV7842_CEC
 
 config VIDEO_BT819
 	tristate "BT819A VideoStream decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for BT819A video decoder.
 
@@ -309,7 +309,7 @@ config VIDEO_BT819
 
 config VIDEO_BT856
 	tristate "BT856 VideoStream decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for BT856 video decoder.
 
@@ -318,7 +318,7 @@ config VIDEO_BT856
 
 config VIDEO_BT866
 	tristate "BT866 VideoStream decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for BT866 video decoder.
 
@@ -327,7 +327,7 @@ config VIDEO_BT866
 
 config VIDEO_ISL7998X
 	tristate "Intersil ISL7998x video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on OF_GPIO
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -337,7 +337,7 @@ config VIDEO_ISL7998X
 
 config VIDEO_KS0127
 	tristate "KS0127 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for KS0127 video decoder.
 
@@ -349,7 +349,7 @@ config VIDEO_KS0127
 
 config VIDEO_ML86V7667
 	tristate "OKI ML86V7667 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the OKI Semiconductor ML86V7667 video decoder.
 
@@ -358,7 +358,7 @@ config VIDEO_ML86V7667
 
 config VIDEO_SAA7110
 	tristate "Philips SAA7110 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips SAA7110 video decoders.
 
@@ -367,7 +367,7 @@ config VIDEO_SAA7110
 
 config VIDEO_SAA711X
 	tristate "Philips SAA7111/3/4/5 video decoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips SAA7111/3/4/5 video decoders.
 
@@ -376,7 +376,7 @@ config VIDEO_SAA711X
 
 config VIDEO_TC358743
 	tristate "Toshiba TC358743 decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select HDMI
@@ -397,7 +397,7 @@ config VIDEO_TC358743_CEC
 
 config VIDEO_TVP514X
 	tristate "Texas Instruments TVP514x video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the TI TVP5146/47
@@ -409,7 +409,7 @@ config VIDEO_TVP514X
 
 config VIDEO_TVP5150
 	tristate "Texas Instruments TVP5150 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_FWNODE
 	select REGMAP_I2C
 	help
@@ -420,7 +420,7 @@ config VIDEO_TVP5150
 
 config VIDEO_TVP7002
 	tristate "Texas Instruments TVP7002 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_FWNODE
 	help
 	  Support for the Texas Instruments TVP7002 video decoder.
@@ -430,7 +430,7 @@ config VIDEO_TVP7002
 
 config VIDEO_TW2804
 	tristate "Techwell TW2804 multiple video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Techwell tw2804 multiple video decoder.
 
@@ -439,7 +439,7 @@ config VIDEO_TW2804
 
 config VIDEO_TW9903
 	tristate "Techwell TW9903 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Techwell tw9903 multi-standard video decoder
 	  with high quality down scaler.
@@ -449,7 +449,7 @@ config VIDEO_TW9903
 
 config VIDEO_TW9906
 	tristate "Techwell TW9906 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Techwell tw9906 enhanced multi-standard comb filter
 	  video decoder with YCbCr input support.
@@ -459,7 +459,7 @@ config VIDEO_TW9906
 
 config VIDEO_TW9910
 	tristate "Techwell TW9910 video decoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_ASYNC
 	help
 	  Support for Techwell TW9910 NTSC/PAL/SECAM video decoder.
@@ -469,7 +469,7 @@ config VIDEO_TW9910
 
 config VIDEO_VPX3220
 	tristate "vpx3220a, vpx3216b & vpx3214c video decoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for VPX322x video decoders.
 
@@ -479,7 +479,7 @@ config VIDEO_VPX3220
 config VIDEO_MAX9286
 	tristate "Maxim MAX9286 GMSL deserializer support"
 	depends on I2C && I2C_MUX
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on OF_GPIO
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
@@ -494,7 +494,7 @@ comment "Video and audio decoders"
 
 config VIDEO_SAA717X
 	tristate "Philips SAA7171/3/4 audio/video decoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips SAA7171/3/4 audio/video decoders.
 
@@ -510,7 +510,7 @@ menu "Video encoders"
 
 config VIDEO_SAA7127
 	tristate "Philips SAA7127/9 digital video encoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips SAA7127/9 digital video encoders.
 
@@ -519,7 +519,7 @@ config VIDEO_SAA7127
 
 config VIDEO_SAA7185
 	tristate "Philips SAA7185 video encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Philips SAA7185 video encoder.
 
@@ -528,7 +528,7 @@ config VIDEO_SAA7185
 
 config VIDEO_ADV7170
 	tristate "Analog Devices ADV7170 video encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Analog Devices ADV7170 video encoder driver
 
@@ -537,7 +537,7 @@ config VIDEO_ADV7170
 
 config VIDEO_ADV7175
 	tristate "Analog Devices ADV7175 video encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Analog Devices ADV7175 video encoder driver
 
@@ -565,7 +565,7 @@ config VIDEO_ADV7393
 
 config VIDEO_ADV7511
 	tristate "Analog Devices ADV7511 encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on DRM_I2C_ADV7511=n || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -588,7 +588,7 @@ config VIDEO_ADV7511_CEC
 
 config VIDEO_AD9389B
 	tristate "Analog Devices AD9389B encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 
@@ -608,7 +608,7 @@ config VIDEO_AK881X
 
 config VIDEO_THS8200
 	tristate "Texas Instruments THS8200 video encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_ASYNC
 	help
 	  Support for the Texas Instruments THS8200 video encoder.
@@ -622,7 +622,7 @@ menu "Video improvement chips"
 
 config VIDEO_UPD64031A
 	tristate "NEC Electronics uPD64031A Ghost Reduction"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_ASYNC
 	help
 	  Support for the NEC Electronics uPD64031A Ghost Reduction
@@ -635,7 +635,7 @@ config VIDEO_UPD64031A
 
 config VIDEO_UPD64083
 	tristate "NEC Electronics uPD64083 3-Dimensional Y/C separation"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the NEC Electronics uPD64083 3-Dimensional Y/C
 	  separation video chip. It is used to improve the quality of
@@ -650,7 +650,7 @@ menu "Audio/Video compression chips"
 
 config VIDEO_SAA6752HS
 	tristate "Philips SAA6752HS MPEG-2 Audio/Video Encoder"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select CRC32
 	help
 	  Support for the Philips SAA6752HS MPEG-2 video and MPEG-audio/AC-3
@@ -666,7 +666,7 @@ menu "SDR tuner chips"
 
 config SDR_MAX2175
 	tristate "Maxim 2175 RF to Bits tuner"
-	depends on VIDEO_V4L2 && MEDIA_SDR_SUPPORT && I2C
+	depends on VIDEO_DEV && MEDIA_SDR_SUPPORT && I2C
 	select REGMAP_I2C
 	select V4L2_ASYNC
 	help
@@ -684,7 +684,7 @@ menu "Miscellaneous helper chips"
 
 config VIDEO_THS7303
 	tristate "THS7303/53 Video Amplifier"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select V4L2_ASYNC
 	help
 	  Support for TI THS7303/53 video amplifier
@@ -694,7 +694,7 @@ config VIDEO_THS7303
 
 config VIDEO_M52790
 	tristate "Mitsubishi M52790 A/V switch"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	 Support for the Mitsubishi M52790 A/V switch.
 
@@ -703,7 +703,7 @@ config VIDEO_M52790
 
 config VIDEO_I2C
 	tristate "I2C transport video support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select VIDEOBUF2_VMALLOC
 	imply HWMON
 	help
@@ -717,7 +717,7 @@ config VIDEO_I2C
 
 config VIDEO_ST_MIPID02
 	tristate "STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -745,7 +745,7 @@ config VIDEO_CCS_PLL
 
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -758,7 +758,7 @@ config VIDEO_HI556
 
 config VIDEO_HI846
 	tristate "Hynix Hi-846 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -771,7 +771,7 @@ config VIDEO_HI846
 
 config VIDEO_HI847
         tristate "Hynix Hi-847 sensor support"
-        depends on I2C && VIDEO_V4L2
+        depends on I2C && VIDEO_DEV
         select MEDIA_CONTROLLER
         select VIDEO_V4L2_SUBDEV_API
         select V4L2_FWNODE
@@ -784,7 +784,7 @@ config VIDEO_HI847
 
 config VIDEO_IMX208
 	tristate "Sony IMX208 sensor support"
-	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on I2C && VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
 	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
@@ -795,7 +795,7 @@ config VIDEO_IMX208
 
 config VIDEO_IMX214
 	tristate "Sony IMX214 sensor support"
-	depends on GPIOLIB && I2C && VIDEO_V4L2
+	depends on GPIOLIB && I2C && VIDEO_DEV
 	select V4L2_FWNODE
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -809,7 +809,7 @@ config VIDEO_IMX214
 
 config VIDEO_IMX219
 	tristate "Sony IMX219 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -822,7 +822,7 @@ config VIDEO_IMX219
 
 config VIDEO_IMX258
 	tristate "Sony IMX258 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -834,7 +834,7 @@ config VIDEO_IMX258
 
 config VIDEO_IMX274
 	tristate "Sony IMX274 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
@@ -844,7 +844,7 @@ config VIDEO_IMX274
 
 config VIDEO_IMX290
 	tristate "Sony IMX290 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
@@ -858,7 +858,7 @@ config VIDEO_IMX290
 
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -871,7 +871,7 @@ config VIDEO_IMX319
 config VIDEO_IMX334
 	tristate "Sony IMX334 sensor support"
 	depends on OF_GPIO
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
@@ -885,7 +885,7 @@ config VIDEO_IMX334
 config VIDEO_IMX335
 	tristate "Sony IMX335 sensor support"
 	depends on OF_GPIO
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
@@ -898,7 +898,7 @@ config VIDEO_IMX335
 
 config VIDEO_IMX355
 	tristate "Sony IMX355 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -911,7 +911,7 @@ config VIDEO_IMX355
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
 	depends on OF_GPIO
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
@@ -924,7 +924,7 @@ config VIDEO_IMX412
 
 config VIDEO_OG01A1B
 	tristate "OmniVision OG01A1B sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -937,7 +937,7 @@ config VIDEO_OG01A1B
 
 config VIDEO_OV02A10
 	tristate "OmniVision OV02A10 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -950,7 +950,7 @@ config VIDEO_OV02A10
 
 config VIDEO_OV08D10
         tristate "OmniVision OV08D10 sensor support"
-        depends on I2C && VIDEO_V4L2
+        depends on I2C && VIDEO_DEV
         select MEDIA_CONTROLLER
         select VIDEO_V4L2_SUBDEV_API
         select V4L2_FWNODE
@@ -963,7 +963,7 @@ config VIDEO_OV08D10
 
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2640 camera.
@@ -973,7 +973,7 @@ config VIDEO_OV2640
 
 config VIDEO_OV2659
 	tristate "OmniVision OV2659 sensor support"
-	depends on VIDEO_V4L2 && I2C && GPIOLIB
+	depends on VIDEO_DEV && I2C && GPIOLIB
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -984,7 +984,7 @@ config VIDEO_OV2659
 
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
@@ -996,7 +996,7 @@ config VIDEO_OV2680
 
 config VIDEO_OV2685
 	tristate "OmniVision OV2685 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	help
@@ -1008,7 +1008,7 @@ config VIDEO_OV2685
 
 config VIDEO_OV2740
 	tristate "OmniVision OV2740 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on ACPI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -1024,7 +1024,7 @@ config VIDEO_OV2740
 config VIDEO_OV5640
 	tristate "OmniVision OV5640 sensor support"
 	depends on OF
-	depends on GPIOLIB && VIDEO_V4L2 && I2C
+	depends on GPIOLIB && VIDEO_DEV && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1035,7 +1035,7 @@ config VIDEO_OV5640
 config VIDEO_OV5645
 	tristate "OmniVision OV5645 sensor support"
 	depends on OF
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1048,7 +1048,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1061,7 +1061,7 @@ config VIDEO_OV5647
 
 config VIDEO_OV5648
 	tristate "OmniVision OV5648 sensor support"
-	depends on I2C && PM && VIDEO_V4L2
+	depends on I2C && PM && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1074,7 +1074,7 @@ config VIDEO_OV5648
 
 config VIDEO_OV6650
 	tristate "OmniVision OV6650 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV6650 camera.
@@ -1084,7 +1084,7 @@ config VIDEO_OV6650
 
 config VIDEO_OV5670
 	tristate "OmniVision OV5670 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1097,7 +1097,7 @@ config VIDEO_OV5670
 
 config VIDEO_OV5675
 	tristate "OmniVision OV5675 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1110,7 +1110,7 @@ config VIDEO_OV5675
 
 config VIDEO_OV5693
 	tristate "OmniVision OV5693 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1121,7 +1121,7 @@ config VIDEO_OV5693
 
 config VIDEO_OV5695
 	tristate "OmniVision OV5695 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1132,7 +1132,7 @@ config VIDEO_OV5695
 
 config VIDEO_OV7251
 	tristate "OmniVision OV7251 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1145,7 +1145,7 @@ config VIDEO_OV7251
 
 config VIDEO_OV772X
 	tristate "OmniVision OV772x sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select REGMAP_SCCB
 	select V4L2_FWNODE
 	help
@@ -1157,7 +1157,7 @@ config VIDEO_OV772X
 
 config VIDEO_OV7640
 	tristate "OmniVision OV7640 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7640 camera.
@@ -1167,7 +1167,7 @@ config VIDEO_OV7640
 
 config VIDEO_OV7670
 	tristate "OmniVision OV7670 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1176,7 +1176,7 @@ config VIDEO_OV7670
 
 config VIDEO_OV7740
 	tristate "OmniVision OV7740 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select REGMAP_SCCB
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
@@ -1184,7 +1184,7 @@ config VIDEO_OV7740
 
 config VIDEO_OV8856
 	tristate "OmniVision OV8856 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1197,7 +1197,7 @@ config VIDEO_OV8856
 
 config VIDEO_OV8865
 	tristate "OmniVision OV8865 sensor support"
-	depends on I2C && PM && VIDEO_V4L2
+	depends on I2C && PM && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1211,7 +1211,7 @@ config VIDEO_OV8865
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF_GPIO
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
@@ -1224,14 +1224,14 @@ config VIDEO_OV9282
 
 config VIDEO_OV9640
 	tristate "OmniVision OV9640 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9640 camera sensor.
 
 config VIDEO_OV9650
 	tristate "OmniVision OV9650/OV9652 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_SCCB
@@ -1241,7 +1241,7 @@ config VIDEO_OV9650
 
 config VIDEO_OV9734
 	tristate "OmniVision OV9734 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on ACPI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -1255,7 +1255,7 @@ config VIDEO_OV9734
 
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1265,7 +1265,7 @@ config VIDEO_OV13858
 
 config VIDEO_OV13B10
 	tristate "OmniVision OV13B10 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1275,7 +1275,7 @@ config VIDEO_OV13B10
 
 config VIDEO_VS6624
 	tristate "ST VS6624 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  This is a Video4Linux2 sensor driver for the ST VS6624
 	  camera.
@@ -1285,7 +1285,7 @@ config VIDEO_VS6624
 
 config VIDEO_MT9M001
 	tristate "mt9m001 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1294,7 +1294,7 @@ config VIDEO_MT9M001
 
 config VIDEO_MT9M032
 	tristate "MT9M032 camera sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_APTINA_PLL
@@ -1304,7 +1304,7 @@ config VIDEO_MT9M032
 
 config VIDEO_MT9M111
 	tristate "mt9m111, mt9m112 and mt9m131 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select V4L2_FWNODE
 	help
 	  This driver supports MT9M111, MT9M112 and MT9M131 cameras from
@@ -1312,7 +1312,7 @@ config VIDEO_MT9M111
 
 config VIDEO_MT9P031
 	tristate "Aptina MT9P031 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_APTINA_PLL
@@ -1323,7 +1323,7 @@ config VIDEO_MT9P031
 
 config VIDEO_MT9T001
 	tristate "Aptina MT9T001 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1332,7 +1332,7 @@ config VIDEO_MT9T001
 
 config VIDEO_MT9T112
 	tristate "Aptina MT9T111/MT9T112 support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) MT9T111 and MT9T112 3 Mpixel camera.
@@ -1342,7 +1342,7 @@ config VIDEO_MT9T112
 
 config VIDEO_MT9V011
 	tristate "Micron mt9v011 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the Micron
 	  mt0v011 1.3 Mpixel camera.  It currently only works with the
@@ -1350,7 +1350,7 @@ config VIDEO_MT9V011
 
 config VIDEO_MT9V032
 	tristate "Micron MT9V032 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP_I2C
@@ -1361,7 +1361,7 @@ config VIDEO_MT9V032
 
 config VIDEO_MT9V111
 	tristate "Aptina MT9V111 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor driver for the Aptina/Micron
 	  MT9V111 sensor.
@@ -1371,13 +1371,13 @@ config VIDEO_MT9V111
 
 config VIDEO_SR030PC30
 	tristate "Siliconfile SR030PC30 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This driver supports SR030PC30 VGA camera from Siliconfile
 
 config VIDEO_NOON010PC30
 	tristate "Siliconfile NOON010PC30 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1418,7 +1418,7 @@ config VIDEO_RDACM21
 
 config VIDEO_RJ54N1
 	tristate "Sharp RJ54N1CB0C sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a V4L2 sensor driver for Sharp RJ54N1CB0C CMOS image
 	  sensor.
@@ -1428,7 +1428,7 @@ config VIDEO_RJ54N1
 
 config VIDEO_S5K6AA
 	tristate "Samsung S5K6AAFX sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1437,7 +1437,7 @@ config VIDEO_S5K6AA
 
 config VIDEO_S5K6A3
 	tristate "Samsung S5K6A3 sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
@@ -1446,7 +1446,7 @@ config VIDEO_S5K6A3
 
 config VIDEO_S5K4ECGX
 	tristate "Samsung S5K4ECGX sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select CRC32
@@ -1456,7 +1456,7 @@ config VIDEO_S5K4ECGX
 
 config VIDEO_S5K5BAF
 	tristate "Samsung S5K5BAF sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1469,7 +1469,7 @@ source "drivers/media/i2c/et8ek8/Kconfig"
 
 config VIDEO_S5C73M3
 	tristate "Samsung S5C73M3 sensor support"
-	depends on I2C && SPI && VIDEO_V4L2
+	depends on I2C && SPI && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1484,7 +1484,7 @@ menu "Lens drivers"
 
 config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
-	depends on GPIOLIB && I2C && VIDEO_V4L2
+	depends on GPIOLIB && I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_ASYNC
 	help
@@ -1493,7 +1493,7 @@ config VIDEO_AD5820
 
 config VIDEO_AK7375
 	tristate "AK7375 lens voice coil support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_ASYNC
@@ -1505,7 +1505,7 @@ config VIDEO_AK7375
 
 config VIDEO_DW9714
 	tristate "DW9714 lens voice coil support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_ASYNC
@@ -1517,7 +1517,7 @@ config VIDEO_DW9714
 
 config VIDEO_DW9768
 	tristate "DW9768 lens voice coil support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -1529,7 +1529,7 @@ config VIDEO_DW9768
 
 config VIDEO_DW9807_VCM
 	tristate "DW9807 lens voice coil support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_ASYNC
@@ -1546,7 +1546,7 @@ menu "Flash devices"
 
 config VIDEO_ADP1653
 	tristate "ADP1653 flash support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_ASYNC
 	help
@@ -1555,7 +1555,7 @@ config VIDEO_ADP1653
 
 config VIDEO_LM3560
 	tristate "LM3560 dual flash driver support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select REGMAP_I2C
 	select V4L2_ASYNC
@@ -1565,7 +1565,7 @@ config VIDEO_LM3560
 
 config VIDEO_LM3646
 	tristate "LM3646 dual flash driver support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select REGMAP_I2C
 	select V4L2_ASYNC
@@ -1574,4 +1574,4 @@ config VIDEO_LM3646
 	  flash, torch LEDs.
 endmenu
 
-endif # VIDEO_V4L2
+endif # VIDEO_DEV
diff --git a/drivers/media/i2c/ccs/Kconfig b/drivers/media/i2c/ccs/Kconfig
index 59f35b33ddc1..71671db3d993 100644
--- a/drivers/media/i2c/ccs/Kconfig
+++ b/drivers/media/i2c/ccs/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CCS
 	tristate "MIPI CCS/SMIA++/SMIA sensor support"
-	depends on I2C && VIDEO_V4L2 && HAVE_CLK
+	depends on I2C && VIDEO_DEV && HAVE_CLK
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEO_CCS_PLL
diff --git a/drivers/media/i2c/cx25840/Kconfig b/drivers/media/i2c/cx25840/Kconfig
index e392f8e023f6..46f15702cf55 100644
--- a/drivers/media/i2c/cx25840/Kconfig
+++ b/drivers/media/i2c/cx25840/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX25840
 	tristate "Conexant CX2584x audio/video decoders"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	help
 	  Support for the Conexant CX2584x audio/video decoders.
 
diff --git a/drivers/media/i2c/et8ek8/Kconfig b/drivers/media/i2c/et8ek8/Kconfig
index afcc4ea764f6..398dd4d21df1 100644
--- a/drivers/media/i2c/et8ek8/Kconfig
+++ b/drivers/media/i2c/et8ek8/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_ET8EK8
 	tristate "ET8EK8 camera sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/i2c/m5mols/Kconfig b/drivers/media/i2c/m5mols/Kconfig
index 6f0ef33b7ee1..7f0af32f4376 100644
--- a/drivers/media/i2c/m5mols/Kconfig
+++ b/drivers/media/i2c/m5mols/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_M5MOLS
 	tristate "Fujitsu M-5MOLS 8MP sensor support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
index 2cd8e328dda9..92b156530d91 100644
--- a/drivers/media/pci/Kconfig
+++ b/drivers/media/pci/Kconfig
@@ -61,7 +61,7 @@ config VIDEO_PCI_SKELETON
 	tristate "Skeleton PCI V4L2 driver"
 	depends on SAMPLES
 	depends on MEDIA_TEST_SUPPORT
-	depends on PCI && VIDEO_V4L2
+	depends on PCI && VIDEO_DEV
 	select VIDEOBUF2_MEMOPS
 	select VIDEOBUF2_DMA_CONTIG
 	help
diff --git a/drivers/media/pci/bt8xx/Kconfig b/drivers/media/pci/bt8xx/Kconfig
index 3f56decbb681..927190281bd5 100644
--- a/drivers/media/pci/bt8xx/Kconfig
+++ b/drivers/media/pci/bt8xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_BT848
 	tristate "BT848 Video For Linux"
-	depends on VIDEO_DEV && PCI && I2C && VIDEO_V4L2
+	depends on PCI && I2C && VIDEO_DEV
 	select I2C_ALGOBIT
 	select VIDEOBUF_DMA_SG
 	depends on RC_CORE
diff --git a/drivers/media/pci/cobalt/Kconfig b/drivers/media/pci/cobalt/Kconfig
index d8d9ea6b09bc..e13e36141199 100644
--- a/drivers/media/pci/cobalt/Kconfig
+++ b/drivers/media/pci/cobalt/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_COBALT
 	tristate "Cisco Cobalt support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on PCI_MSI && MTD_COMPLEX_MAPPINGS
 	depends on (GPIOLIB && DRM_I2C_ADV7511=n) || COMPILE_TEST
 	depends on SND
diff --git a/drivers/media/pci/cx18/Kconfig b/drivers/media/pci/cx18/Kconfig
index 7074a1071302..a4e32fdcfd3d 100644
--- a/drivers/media/pci/cx18/Kconfig
+++ b/drivers/media/pci/cx18/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CX18
 	tristate "Conexant cx23418 MPEG encoder support"
-	depends on VIDEO_V4L2 && DVB_CORE && PCI && I2C
+	depends on VIDEO_DEV && DVB_CORE && PCI && I2C
 	select I2C_ALGOBIT
 	select VIDEOBUF_VMALLOC
 	depends on RC_CORE
diff --git a/drivers/media/pci/dt3155/Kconfig b/drivers/media/pci/dt3155/Kconfig
index a3d24b8a719b..2b76de195aa5 100644
--- a/drivers/media/pci/dt3155/Kconfig
+++ b/drivers/media/pci/dt3155/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_DT3155
 	tristate "DT3155 frame grabber"
-	depends on PCI && VIDEO_DEV && VIDEO_V4L2
+	depends on PCI && VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Enables dt3155 device driver for the DataTranslation DT3155 frame grabber.
diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index dce8274c81e6..39bd3be0b43d 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_IPU3_CIO2
 	tristate "Intel ipu3-cio2 driver"
-	depends on VIDEO_V4L2 && PCI
+	depends on VIDEO_DEV && PCI
 	depends on ACPI || COMPILE_TEST
 	depends on X86
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/pci/ivtv/Kconfig b/drivers/media/pci/ivtv/Kconfig
index e70502902b73..9be52101bc4f 100644
--- a/drivers/media/pci/ivtv/Kconfig
+++ b/drivers/media/pci/ivtv/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_IVTV
 	tristate "Conexant cx23416/cx23415 MPEG encoder/decoder support"
-	depends on VIDEO_V4L2 && PCI && I2C
+	depends on VIDEO_DEV && PCI && I2C
 	select I2C_ALGOBIT
 	depends on RC_CORE
 	select VIDEO_TUNER
diff --git a/drivers/media/pci/meye/Kconfig b/drivers/media/pci/meye/Kconfig
index fed1f4a01817..3e69b66f1a5b 100644
--- a/drivers/media/pci/meye/Kconfig
+++ b/drivers/media/pci/meye/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_MEYE
 	tristate "Sony Vaio Picturebook Motion Eye Video For Linux"
-	depends on PCI && VIDEO_V4L2
+	depends on PCI && VIDEO_DEV
 	depends on SONY_LAPTOP
 	depends on X86 || COMPILE_TEST
 	help
diff --git a/drivers/media/pci/saa7146/Kconfig b/drivers/media/pci/saa7146/Kconfig
index 8e83cd044075..3bbb68a0ed7b 100644
--- a/drivers/media/pci/saa7146/Kconfig
+++ b/drivers/media/pci/saa7146/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_HEXIUM_GEMINI
 	tristate "Hexium Gemini frame grabber"
-	depends on PCI && VIDEO_V4L2 && I2C
+	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
 	  This is a video4linux driver for the Hexium Gemini frame
@@ -13,7 +13,7 @@ config VIDEO_HEXIUM_GEMINI
 
 config VIDEO_HEXIUM_ORION
 	tristate "Hexium HV-PCI6 and Orion frame grabber"
-	depends on PCI && VIDEO_V4L2 && I2C
+	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	help
 	  This is a video4linux driver for the Hexium HV-PCI6 and
@@ -24,7 +24,7 @@ config VIDEO_HEXIUM_ORION
 
 config VIDEO_MXB
 	tristate "Siemens-Nixdorf 'Multimedia eXtension Board'"
-	depends on PCI && VIDEO_V4L2 && I2C
+	depends on PCI && VIDEO_DEV && I2C
 	select VIDEO_SAA7146_VV
 	select VIDEO_TUNER
 	select VIDEO_SAA711X if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
index 27bb78513631..a96e170ab04e 100644
--- a/drivers/media/pci/sta2x11/Kconfig
+++ b/drivers/media/pci/sta2x11/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config STA2X11_VIP
 	tristate "STA2X11 VIP Video For Linux"
-	depends on PCI && VIDEO_V4L2 && VIRT_TO_BUS && I2C
+	depends on PCI && VIDEO_DEV && VIRT_TO_BUS && I2C
 	depends on STA2X11 || COMPILE_TEST
 	select GPIOLIB if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/pci/tw5864/Kconfig b/drivers/media/pci/tw5864/Kconfig
index d376d4ed65b9..0a0f3191f238 100644
--- a/drivers/media/pci/tw5864/Kconfig
+++ b/drivers/media/pci/tw5864/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TW5864
 	tristate "Techwell TW5864 video/audio grabber and encoder"
-	depends on VIDEO_DEV && PCI && VIDEO_V4L2
+	depends on VIDEO_DEV && PCI && VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Support for boards based on Techwell TW5864 chip which provides
diff --git a/drivers/media/pci/tw68/Kconfig b/drivers/media/pci/tw68/Kconfig
index af0cb60337bb..ef29be7db493 100644
--- a/drivers/media/pci/tw68/Kconfig
+++ b/drivers/media/pci/tw68/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TW68
 	tristate "Techwell tw68x Video For Linux"
-	depends on VIDEO_DEV && PCI && VIDEO_V4L2
+	depends on VIDEO_DEV && PCI && VIDEO_DEV
 	select VIDEOBUF2_DMA_SG
 	help
 	  Support for Techwell tw68xx based frame grabber boards.
diff --git a/drivers/media/pci/tw686x/Kconfig b/drivers/media/pci/tw686x/Kconfig
index 631c90868b8b..a4edad6aaf89 100644
--- a/drivers/media/pci/tw686x/Kconfig
+++ b/drivers/media/pci/tw686x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_TW686X
 	tristate "Intersil/Techwell TW686x video capture cards"
-	depends on PCI && VIDEO_DEV && VIDEO_V4L2 && SND
+	depends on PCI && VIDEO_DEV && SND
 	select VIDEOBUF2_VMALLOC
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_DMA_SG
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 721f27ef0130..f15ab9739823 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -30,7 +30,7 @@ config DVB_PLATFORM_DRIVERS
 
 config V4L_MEM2MEM_DRIVERS
 	bool "Memory-to-memory multimedia devices"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Say Y here to enable selecting drivers for V4L devices that
 	  use system memory for both source and destination buffers, as opposed
@@ -42,7 +42,7 @@ config V4L_MEM2MEM_DRIVERS
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
@@ -53,7 +53,7 @@ config VIDEO_MUX
 	tristate "Video Multiplexer"
 	depends on V4L_PLATFORM_DRIVERS
 	select MULTIPLEXER
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select REGMAP
diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index dd528e9d0958..c3f76a6fb6f8 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_ALLEGRO_DVT
 	tristate "Allegro DVT Video IP Core"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/am437x/Kconfig b/drivers/media/platform/am437x/Kconfig
index 619cefca7590..2e24fff7e625 100644
--- a/drivers/media/platform/am437x/Kconfig
+++ b/drivers/media/platform/am437x/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_AM437X_VPFE
 	tristate "TI AM437x VPFE video capture driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on SOC_AM43XX || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/amphion/Kconfig b/drivers/media/platform/amphion/Kconfig
index 13899649f766..e9ddca7a9e4a 100644
--- a/drivers/media/platform/amphion/Kconfig
+++ b/drivers/media/platform/amphion/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_AMPHION_VPU
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on MEDIA_SUPPORT
 	depends on VIDEO_DEV
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_MEM2MEM_DEV
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/aspeed/Kconfig b/drivers/media/platform/aspeed/Kconfig
index 5025e892844c..810902c8a85a 100644
--- a/drivers/media/platform/aspeed/Kconfig
+++ b/drivers/media/platform/aspeed/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Support for the Aspeed Video Engine (VE) embedded in the Aspeed
diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 5122290729ae..abeb0ac595b3 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_ATMEL_ISC
 	tristate "ATMEL Image Sensor Controller (ISC) support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && COMMON_CLK
+	depends on VIDEO_DEV && COMMON_CLK
 	depends on ARCH_AT91 || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -17,7 +17,7 @@ config VIDEO_ATMEL_ISC
 config VIDEO_ATMEL_XISC
 	tristate "ATMEL eXtended Image Sensor Controller (XISC) support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && COMMON_CLK && VIDEO_V4L2_SUBDEV_API
 	depends on ARCH_AT91 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select REGMAP_MMIO
@@ -36,7 +36,7 @@ config VIDEO_ATMEL_ISC_BASE
 config VIDEO_ATMEL_ISI
 	tristate "ATMEL Image Sensor Interface (ISI) support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_AT91 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
@@ -47,7 +47,7 @@ config VIDEO_ATMEL_ISI
 config VIDEO_MICROCHIP_CSI2DC
 	tristate "Microchip CSI2 Demux Controller"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && COMMON_CLK && OF
+	depends on VIDEO_DEV && COMMON_CLK && OF
 	depends on ARCH_AT91 || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
index 79a7e9fb2575..acfa0ef6247e 100644
--- a/drivers/media/platform/cadence/Kconfig
+++ b/drivers/media/platform/cadence/Kconfig
@@ -13,7 +13,7 @@ if VIDEO_CADENCE
 
 config VIDEO_CADENCE_CSI2RX
 	tristate "Cadence MIPI-CSI2 RX Controller"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
@@ -25,7 +25,7 @@ config VIDEO_CADENCE_CSI2RX
 
 config VIDEO_CADENCE_CSI2TX
 	tristate "Cadence MIPI-CSI2 TX Controller"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/coda/Kconfig b/drivers/media/platform/coda/Kconfig
index ae495fd7b25a..22b654018f3c 100644
--- a/drivers/media/platform/coda/Kconfig
+++ b/drivers/media/platform/coda/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_CODA
 	tristate "Chips&Media Coda multi-standard codec IP"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2 && OF && (ARCH_MXC || COMPILE_TEST)
+	depends on VIDEO_DEV && OF && (ARCH_MXC || COMPILE_TEST)
 	select SRAM
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/media/platform/davinci/Kconfig b/drivers/media/platform/davinci/Kconfig
index 7e5f92b0082a..c61e697aeb12 100644
--- a/drivers/media/platform/davinci/Kconfig
+++ b/drivers/media/platform/davinci/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_DAVINCI_VPIF_DISPLAY
 	tristate "TI DaVinci VPIF V4L2-Display driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF2_DMA_CONTIG
@@ -19,7 +19,7 @@ config VIDEO_DAVINCI_VPIF_DISPLAY
 config VIDEO_DAVINCI_VPIF_CAPTURE
 	tristate "TI DaVinci VPIF video capture driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF2_DMA_CONTIG
@@ -35,7 +35,7 @@ config VIDEO_DAVINCI_VPIF_CAPTURE
 config VIDEO_DM6446_CCDC
 	tristate "TI DM6446 CCDC video capture driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF_DMA_CONTIG
@@ -52,7 +52,7 @@ config VIDEO_DM6446_CCDC
 config VIDEO_DM355_CCDC
 	tristate "TI DM355 CCDC video capture driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF_DMA_CONTIG
@@ -69,7 +69,7 @@ config VIDEO_DM355_CCDC
 config VIDEO_DM365_ISIF
 	tristate "TI DM365 ISIF video capture driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF_DMA_CONTIG
@@ -84,7 +84,7 @@ config VIDEO_DM365_ISIF
 config VIDEO_DAVINCI_VPBE_DISPLAY
 	tristate "TI DaVinci VPBE V4L2-Display driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/exynos-gsc/Kconfig b/drivers/media/platform/exynos-gsc/Kconfig
index f9bdffe915b4..7244d63c9646 100644
--- a/drivers/media/platform/exynos-gsc/Kconfig
+++ b/drivers/media/platform/exynos-gsc/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_SAMSUNG_EXYNOS_GSC
 	tristate "Samsung Exynos G-Scaler driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/exynos4-is/Kconfig b/drivers/media/platform/exynos4-is/Kconfig
index 868bb86c7699..da33faa7132e 100644
--- a/drivers/media/platform/exynos4-is/Kconfig
+++ b/drivers/media/platform/exynos4-is/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_SAMSUNG_EXYNOS4_IS
 	tristate "Samsung S5P/EXYNOS4 SoC series Camera Subsystem driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF && COMMON_CLK
+	depends on VIDEO_DEV && OF && COMMON_CLK
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/intel/Kconfig b/drivers/media/platform/intel/Kconfig
index aeda421f7248..d47a2cf6f334 100644
--- a/drivers/media/platform/intel/Kconfig
+++ b/drivers/media/platform/intel/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_PXA27x
 	tristate "PXA27x Quick Capture Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on PXA27x || COMPILE_TEST
 	select VIDEOBUF2_DMA_SG
 	select SG_SPLIT
diff --git a/drivers/media/platform/marvell-ccic/Kconfig b/drivers/media/platform/marvell-ccic/Kconfig
index bfe655b2cedd..474795668930 100644
--- a/drivers/media/platform/marvell-ccic/Kconfig
+++ b/drivers/media/platform/marvell-ccic/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_CAFE_CCIC
 	tristate "Marvell 88ALP01 (Cafe) CMOS Camera Controller support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on PCI && I2C && VIDEO_V4L2
+	depends on PCI && I2C && VIDEO_DEV
 	depends on COMMON_CLK
 	select VIDEO_OV7670
 	select VIDEOBUF2_VMALLOC
@@ -16,7 +16,7 @@ config VIDEO_CAFE_CCIC
 config VIDEO_MMP_CAMERA
 	tristate "Marvell Armada 610 integrated camera controller support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on COMMON_CLK
 	select VIDEO_OV7670
diff --git a/drivers/media/platform/meson/ge2d/Kconfig b/drivers/media/platform/meson/ge2d/Kconfig
index 8c3f3b1b6b05..312c4169e3c2 100644
--- a/drivers/media/platform/meson/ge2d/Kconfig
+++ b/drivers/media/platform/meson/ge2d/Kconfig
@@ -1,7 +1,7 @@
 config VIDEO_MESON_GE2D
 	tristate "Amlogic 2D Graphic Acceleration Unit"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_MESON || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/mtk-jpeg/Kconfig b/drivers/media/platform/mtk-jpeg/Kconfig
index 72ed920b011a..39c4d1bc66ce 100644
--- a/drivers/media/platform/mtk-jpeg/Kconfig
+++ b/drivers/media/platform/mtk-jpeg/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_MEDIATEK_JPEG
 	tristate "Mediatek JPEG Codec driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/mtk-mdp/Kconfig b/drivers/media/platform/mtk-mdp/Kconfig
index 0cc743165a1a..9f13a42899bd 100644
--- a/drivers/media/platform/mtk-mdp/Kconfig
+++ b/drivers/media/platform/mtk-mdp/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_MEDIATEK_MDP
 	tristate "Mediatek MDP driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/mtk-vcodec/Kconfig b/drivers/media/platform/mtk-vcodec/Kconfig
index 635801a19d55..c5c76753c626 100644
--- a/drivers/media/platform/mtk-vcodec/Kconfig
+++ b/drivers/media/platform/mtk-vcodec/Kconfig
@@ -9,7 +9,7 @@ config VIDEO_MEDIATEK_VCODEC
 	tristate "Mediatek Video Codec driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on MTK_IOMMU || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
 	# The two following lines ensure we have the same state ("m" or "y") as
diff --git a/drivers/media/platform/mtk-vpu/Kconfig b/drivers/media/platform/mtk-vpu/Kconfig
index df679ea79ed0..2a8443a93ce0 100644
--- a/drivers/media/platform/mtk-vpu/Kconfig
+++ b/drivers/media/platform/mtk-vpu/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_MEDIATEK_VPU
 	tristate "Mediatek Video Processor Unit"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
 	    This driver provides downloading VPU firmware and
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index df52d32ebe50..af5cd4eb6bf3 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -6,7 +6,7 @@ menuconfig VIDEO_IMX
 	bool "V4L2 capture drivers for NXP i.MX devices"
 	depends on V4L_PLATFORM_DRIVERS
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Say yes here to enable support for capture drivers on i.MX SoCs.
 	  Support for the single SoC features are selectable in the sub-menu
@@ -29,7 +29,7 @@ endif # VIDEO_IMX
 config VIDEO_VIU
 	tristate "Freescale/NXP VIU Video Driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && (PPC_MPC512x || COMPILE_TEST) && I2C
+	depends on VIDEO_DEV && (PPC_MPC512x || COMPILE_TEST) && I2C
 	select VIDEOBUF_DMA_CONTIG
 	default y
 	help
@@ -44,7 +44,7 @@ config VIDEO_VIU
 config VIDEO_IMX_PXP
 	tristate "i.MX Pixel Pipeline (PXP)"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2 && (ARCH_MXC || COMPILE_TEST)
+	depends on VIDEO_DEV && (ARCH_MXC || COMPILE_TEST)
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	help
@@ -54,7 +54,7 @@ config VIDEO_IMX_PXP
 config VIDEO_MX2_EMMAPRP
 	tristate "Freescale/NXP MX2 eMMa-PrP support"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on SOC_IMX27 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/nxp/imx-jpeg/Kconfig b/drivers/media/platform/nxp/imx-jpeg/Kconfig
index cbf6101a8b1d..5214dcd7fab5 100644
--- a/drivers/media/platform/nxp/imx-jpeg/Kconfig
+++ b/drivers/media/platform/nxp/imx-jpeg/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_IMX8_JPEG
 	tristate "IMX8 JPEG Encoder/Decoder"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select V4L2_JPEG_HELPER
diff --git a/drivers/media/platform/omap/Kconfig b/drivers/media/platform/omap/Kconfig
index 789d5e5686c7..a9dbe1097775 100644
--- a/drivers/media/platform/omap/Kconfig
+++ b/drivers/media/platform/omap/Kconfig
@@ -10,7 +10,7 @@ config VIDEO_OMAP2_VOUT
 	depends on MMU
 	depends on FB_OMAP2 || (COMPILE_TEST && FB_OMAP2=n)
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_CONTIG
 	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
 	help
diff --git a/drivers/media/platform/omap3isp/Kconfig b/drivers/media/platform/omap3isp/Kconfig
index 85f0cf063153..f0a680938d5e 100644
--- a/drivers/media/platform/omap3isp/Kconfig
+++ b/drivers/media/platform/omap3isp/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_OMAP3
 	tristate "OMAP 3 Camera support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	depends on (ARCH_OMAP3 && OMAP_IOMMU) || COMPILE_TEST
 	depends on COMMON_CLK && OF
 	select ARM_DMA_USE_IOMMU if OMAP_IOMMU
diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 56be91578706..4eda48cb1adf 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -1,7 +1,7 @@
 config VIDEO_QCOM_CAMSS
 	tristate "Qualcomm V4L2 Camera Subsystem driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index de0fe3f7be5f..bfd50e8f3421 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -1,7 +1,7 @@
 config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2 && QCOM_SMEM
+	depends on VIDEO_DEV && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index e1329a60d3fa..0c0de21584ba 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -5,7 +5,7 @@
 config VIDEO_RENESAS_CEU
 	tristate "Renesas Capture Engine Unit (CEU) driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_SHMOBILE || ARCH_R7S72100 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
@@ -15,7 +15,7 @@ config VIDEO_RENESAS_CEU
 config VIDEO_RCAR_ISP
 	tristate "R-Car Image Signal Processor (ISP)"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -45,7 +45,7 @@ source "drivers/media/platform/renesas/rcar-vin/Kconfig"
 config VIDEO_RENESAS_FDP1
 	tristate "Renesas Fine Display Processor"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on (!ARM64 && !VIDEO_RENESAS_FCP) || VIDEO_RENESAS_FCP
 	select VIDEOBUF2_DMA_CONTIG
@@ -60,7 +60,7 @@ config VIDEO_RENESAS_FDP1
 config VIDEO_RENESAS_JPU
 	tristate "Renesas JPEG Processing Unit"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
@@ -87,7 +87,7 @@ config VIDEO_RENESAS_FCP
 config VIDEO_RENESAS_VSP1
 	tristate "Renesas VSP1 Video Processing Engine"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on (!ARM64 && !VIDEO_RENESAS_FCP) || VIDEO_RENESAS_FCP
 	select MEDIA_CONTROLLER
@@ -105,7 +105,7 @@ config VIDEO_RENESAS_VSP1
 config VIDEO_RCAR_DRIF
 	tristate "Renesas Digital Radio Interface (DRIF)"
 	depends on SDR_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select VIDEOBUF2_VMALLOC
 	select V4L2_ASYNC
diff --git a/drivers/media/platform/renesas/rcar-vin/Kconfig b/drivers/media/platform/renesas/rcar-vin/Kconfig
index 34b7ea6f1246..de55fe63d84c 100644
--- a/drivers/media/platform/renesas/rcar-vin/Kconfig
+++ b/drivers/media/platform/renesas/rcar-vin/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_RCAR_CSI2
 	tristate "R-Car MIPI CSI-2 Receiver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -18,7 +18,7 @@ config VIDEO_RCAR_CSI2
 config VIDEO_RCAR_VIN
 	tristate "R-Car Video Input (VIN) Driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_RENESAS || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/rockchip/rga/Kconfig b/drivers/media/platform/rockchip/rga/Kconfig
index 0106cc8a93a7..727a0f6ea466 100644
--- a/drivers/media/platform/rockchip/rga/Kconfig
+++ b/drivers/media/platform/rockchip/rga/Kconfig
@@ -1,7 +1,7 @@
 config VIDEO_ROCKCHIP_RGA
 	tristate "Rockchip Raster 2d Graphic Acceleration Unit"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select VIDEOBUF2_DMA_SG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/rockchip/rkisp1/Kconfig b/drivers/media/platform/rockchip/rkisp1/Kconfig
index c2e464317929..dabd7e42c193 100644
--- a/drivers/media/platform/rockchip/rkisp1/Kconfig
+++ b/drivers/media/platform/rockchip/rkisp1/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_ROCKCHIP_ISP1
 	tristate "Rockchip Image Signal Processing v1 Unit driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/s3c-camif/Kconfig b/drivers/media/platform/s3c-camif/Kconfig
index e8ef9e06dc1b..8cb8d1ac3edc 100644
--- a/drivers/media/platform/s3c-camif/Kconfig
+++ b/drivers/media/platform/s3c-camif/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_S3C_CAMIF
 	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && I2C && PM
+	depends on VIDEO_DEV && I2C && PM
 	depends on ARCH_S3C64XX || PLAT_S3C24XX || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/s5p-g2d/Kconfig b/drivers/media/platform/s5p-g2d/Kconfig
index 9bc9d90a666a..28ab88fc2d7c 100644
--- a/drivers/media/platform/s5p-g2d/Kconfig
+++ b/drivers/media/platform/s5p-g2d/Kconfig
@@ -1,7 +1,7 @@
 config VIDEO_SAMSUNG_S5P_G2D
 	tristate "Samsung S5P and EXYNOS4 G2D 2d graphics accelerator driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/s5p-jpeg/Kconfig b/drivers/media/platform/s5p-jpeg/Kconfig
index e522860d2b15..11f6e99dec39 100644
--- a/drivers/media/platform/s5p-jpeg/Kconfig
+++ b/drivers/media/platform/s5p-jpeg/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_SAMSUNG_S5P_JPEG
 	tristate "Samsung S5P/Exynos3250/Exynos4 JPEG codec driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/s5p-mfc/Kconfig b/drivers/media/platform/s5p-mfc/Kconfig
index 34b52b0de304..7ee3b0c8d98b 100644
--- a/drivers/media/platform/s5p-mfc/Kconfig
+++ b/drivers/media/platform/s5p-mfc/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_SAMSUNG_S5P_MFC
 	tristate "Samsung S5P MFC Video Codec"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	help
diff --git a/drivers/media/platform/sti/bdisp/Kconfig b/drivers/media/platform/sti/bdisp/Kconfig
index e583fb924f52..496f8aedf0a4 100644
--- a/drivers/media/platform/sti/bdisp/Kconfig
+++ b/drivers/media/platform/sti/bdisp/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_STI_BDISP
 	tristate "STMicroelectronics BDISP 2D blitter driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_STI || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/sti/delta/Kconfig b/drivers/media/platform/sti/delta/Kconfig
index 0bbc7edce208..efa936b1cc8a 100644
--- a/drivers/media/platform/sti/delta/Kconfig
+++ b/drivers/media/platform/sti/delta/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_STI_DELTA
 	tristate "STMicroelectronics DELTA multi-format video decoder V4L2 driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_STI || COMPILE_TEST
 	help
 		This V4L2 driver enables DELTA multi-format video decoder
diff --git a/drivers/media/platform/sti/hva/Kconfig b/drivers/media/platform/sti/hva/Kconfig
index a092a9b146f1..2107f934d883 100644
--- a/drivers/media/platform/sti/hva/Kconfig
+++ b/drivers/media/platform/sti/hva/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_STI_HVA
 	tristate "STMicroelectronics HVA multi-format video encoder V4L2 driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_STI || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/stm32/Kconfig b/drivers/media/platform/stm32/Kconfig
index f4726010ca14..1a8a3fb98495 100644
--- a/drivers/media/platform/stm32/Kconfig
+++ b/drivers/media/platform/stm32/Kconfig
@@ -4,7 +4,7 @@
 config VIDEO_STM32_DCMI
 	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && OF
+	depends on VIDEO_DEV && OF
 	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select MEDIA_CONTROLLER
@@ -20,7 +20,7 @@ config VIDEO_STM32_DCMI
 config VIDEO_STM32_DMA2D
 	tristate "STM32 Chrom-Art Accelerator (DMA2D)"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_STM32 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/sunxi/sun4i-csi/Kconfig b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
index 43ad2dd7da5d..7960e6836f41 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun4i-csi/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_SUN4I_CSI
 	tristate "Allwinner A10 CMOS Sensor Interface Support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
+	depends on VIDEO_DEV && COMMON_CLK  && HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
index 6d9cf1963c41..0345901617d4 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
+++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_SUN6I_CSI
 	tristate "Allwinner V3s Camera Sensor Interface driver"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
+	depends on VIDEO_DEV && COMMON_CLK  && HAS_DMA
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/platform/sunxi/sun8i-di/Kconfig
index 8d762e664d45..ff71e06ee2df 100644
--- a/drivers/media/platform/sunxi/sun8i-di/Kconfig
+++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_SUN8I_DEINTERLACE
 	tristate "Allwinner Deinterlace driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
 	depends on COMMON_CLK && OF
 	depends on PM
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/Kconfig b/drivers/media/platform/sunxi/sun8i-rotate/Kconfig
index 64a8ea76e917..cfba29072d75 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/Kconfig
+++ b/drivers/media/platform/sunxi/sun8i-rotate/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_SUN8I_ROTATE
 	tristate "Allwinner DE2 rotation driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on ARCH_SUNXI || COMPILE_TEST
 	depends on COMMON_CLK && OF
 	depends on PM
diff --git a/drivers/media/platform/tegra/vde/Kconfig b/drivers/media/platform/tegra/vde/Kconfig
index 584b78d8d66c..f7454823bbbb 100644
--- a/drivers/media/platform/tegra/vde/Kconfig
+++ b/drivers/media/platform/tegra/vde/Kconfig
@@ -2,7 +2,7 @@ config VIDEO_TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on ARCH_TEGRA || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select DMA_SHARED_BUFFER
 	select IOMMU_IOVA
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/platform/ti-vpe/Kconfig b/drivers/media/platform/ti-vpe/Kconfig
index a9ee0189f2f2..3cc644eab026 100644
--- a/drivers/media/platform/ti-vpe/Kconfig
+++ b/drivers/media/platform/ti-vpe/Kconfig
@@ -15,7 +15,7 @@ config VIDEO_TI_CSC
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on V4L_PLATFORM_DRIVERS
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
@@ -44,7 +44,7 @@ config VIDEO_TI_CAL_MC
 config VIDEO_TI_VPE
 	tristate "TI VPE (Video Processing Engine) driver"
 	depends on V4L_MEM2MEM_DRIVERS
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on SOC_DRA7XX || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/media/platform/via/Kconfig b/drivers/media/platform/via/Kconfig
index 1dcf789dce96..a289f5c81b7c 100644
--- a/drivers/media/platform/via/Kconfig
+++ b/drivers/media/platform/via/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_VIA_CAMERA
 	tristate "VIAFB camera controller support"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on FB_VIA && VIDEO_V4L2
+	depends on FB_VIA && VIDEO_DEV
 	select VIDEOBUF2_DMA_SG
 	select VIDEO_OV7670
 	help
diff --git a/drivers/media/platform/xilinx/Kconfig b/drivers/media/platform/xilinx/Kconfig
index a9531d5efd50..439120c45eb1 100644
--- a/drivers/media/platform/xilinx/Kconfig
+++ b/drivers/media/platform/xilinx/Kconfig
@@ -3,7 +3,7 @@
 config VIDEO_XILINX
 	tristate "Xilinx Video IP (EXPERIMENTAL)"
 	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_V4L2  && OF && HAS_DMA
+	depends on VIDEO_DEV  && OF && HAS_DMA
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/radio/Kconfig b/drivers/media/radio/Kconfig
index d29e29645e04..9b388e652633 100644
--- a/drivers/media/radio/Kconfig
+++ b/drivers/media/radio/Kconfig
@@ -5,13 +5,13 @@
 
 menuconfig RADIO_ADAPTERS
 	bool "Radio Adapters"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on MEDIA_RADIO_SUPPORT
 	default y
 	help
 	  Say Y here to enable selecting AM/FM radio adapters.
 
-if RADIO_ADAPTERS && VIDEO_V4L2
+if RADIO_ADAPTERS && VIDEO_DEV
 
 config RADIO_TEA575X
 	tristate
@@ -20,13 +20,13 @@ source "drivers/media/radio/si470x/Kconfig"
 
 config RADIO_SI4713
 	tristate "Silicon Labs Si4713 FM Radio with RDS Transmitter support"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 
 source "drivers/media/radio/si4713/Kconfig"
 
 config RADIO_SI476X
 	tristate "Silicon Laboratories Si476x I2C FM Radio"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	depends on MFD_SI476X_CORE
 	depends on SND_SOC
 	select SND_SOC_SI476X
@@ -43,7 +43,7 @@ config RADIO_SI476X
 
 config USB_MR800
 	tristate "AverMedia MR 800 USB FM radio support"
-	depends on USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  Say Y here if you want to connect this type of radio to your
 	  computer's USB port. Note that the audio is not digital, and
@@ -55,7 +55,7 @@ config USB_MR800
 
 config USB_DSBR
 	tristate "D-Link/GemTek USB FM radio support"
-	depends on USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  Say Y here if you want to connect this type of radio to your
 	  computer's USB port. Note that the audio is not digital, and
@@ -67,7 +67,7 @@ config USB_DSBR
 
 config RADIO_MAXIRADIO
 	tristate "Guillemot MAXI Radio FM 2000 radio"
-	depends on VIDEO_V4L2 && PCI
+	depends on VIDEO_DEV && PCI
 	select RADIO_TEA575X
 	help
 	  Choose Y here if you have this radio card.  This card may also be
@@ -118,7 +118,7 @@ config RADIO_SHARK2
 
 config USB_KEENE
 	tristate "Keene FM Transmitter USB support"
-	depends on USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  Say Y here if you want to connect this type of FM transmitter
 	  to your computer's USB port.
@@ -128,7 +128,7 @@ config USB_KEENE
 
 config USB_RAREMONO
 	tristate "Thanko's Raremono AM/FM/SW radio support"
-	depends on USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  The 'Thanko's Raremono' device contains the Si4734 chip from Silicon Labs Inc.
 	  It is one of the very few or perhaps the only consumer USB radio device
@@ -142,7 +142,7 @@ config USB_RAREMONO
 
 config USB_MA901
 	tristate "Masterkit MA901 USB FM radio support"
-	depends on USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  Say Y here if you want to connect this type of radio to your
 	  computer's USB port. Note that the audio is not digital, and
@@ -154,7 +154,7 @@ config USB_MA901
 
 config RADIO_TEA5764
 	tristate "TEA5764 I2C FM radio support"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  Say Y here if you want to use the TEA5764 FM chip found in
 	  EZX phones. This FM chip is present in EZX phones from Motorola,
@@ -173,7 +173,7 @@ config RADIO_TEA5764_XTAL
 
 config RADIO_SAA7706H
 	tristate "SAA7706H Car Radio DSP"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  Say Y here if you want to use the SAA7706H Car radio Digital
 	  Signal Processor, found for instance on the Russellville development
@@ -185,7 +185,7 @@ config RADIO_SAA7706H
 
 config RADIO_TEF6862
 	tristate "TEF6862 Car Radio Enhanced Selectivity Tuner"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  Say Y here if you want to use the TEF6862 Car Radio Enhanced
 	  Selectivity Tuner, found for instance on the Russellville development
@@ -197,7 +197,7 @@ config RADIO_TEF6862
 
 config RADIO_TIMBERDALE
 	tristate "Enable the Timberdale radio driver"
-	depends on MFD_TIMBERDALE && VIDEO_V4L2
+	depends on MFD_TIMBERDALE && VIDEO_DEV
 	depends on I2C	# for RADIO_SAA7706H
 	select RADIO_TEF6862
 	select RADIO_SAA7706H
@@ -208,7 +208,7 @@ config RADIO_TIMBERDALE
 
 config RADIO_WL1273
 	tristate "Texas Instruments WL1273 I2C FM Radio"
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	select MFD_CORE
 	select MFD_WL1273_CORE
 	select FW_LOADER
@@ -245,7 +245,7 @@ config RADIO_ISA
 config RADIO_CADET
 	tristate "ADS Cadet AM/FM Tuner"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Choose Y here if you have one of these AM/FM radio cards, and then
 	  fill in the port address below.
@@ -256,7 +256,7 @@ config RADIO_CADET
 config RADIO_RTRACK
 	tristate "AIMSlab RadioTrack (aka RadioReveal) support"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have one of these FM radio cards, and then fill
@@ -288,7 +288,7 @@ config RADIO_RTRACK_PORT
 config RADIO_RTRACK2
 	tristate "AIMSlab RadioTrack II support"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have this FM radio card, and then fill in the
@@ -312,7 +312,7 @@ config RADIO_RTRACK2_PORT
 config RADIO_AZTECH
 	tristate "Aztech/Packard Bell Radio"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have one of these FM radio cards, and then fill
@@ -333,7 +333,7 @@ config RADIO_AZTECH_PORT
 config RADIO_GEMTEK
 	tristate "GemTek Radio card (or compatible) support"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have this FM radio card, and then fill in the
@@ -374,7 +374,7 @@ config RADIO_GEMTEK_PROBE
 config RADIO_MIROPCM20
 	tristate "miroSOUND PCM20 radio"
 	depends on ISA || COMPILE_TEST
-	depends on ISA_DMA_API && VIDEO_V4L2 && SND
+	depends on ISA_DMA_API && VIDEO_DEV && SND
 	select SND_ISA
 	select SND_MIRO
 	help
@@ -389,7 +389,7 @@ config RADIO_MIROPCM20
 config RADIO_SF16FMI
 	tristate "SF16-FMI/SF16-FMP/SF16-FMD Radio"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Choose Y here if you have one of these FM radio cards.
 
@@ -399,7 +399,7 @@ config RADIO_SF16FMI
 config RADIO_SF16FMR2
 	tristate "SF16-FMR2/SF16-FMD2 Radio"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_TEA575X
 	help
 	  Choose Y here if you have one of these FM radio cards.
@@ -410,7 +410,7 @@ config RADIO_SF16FMR2
 config RADIO_TERRATEC
 	tristate "TerraTec ActiveRadio ISA Standalone"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have this FM radio card.
@@ -425,7 +425,7 @@ config RADIO_TERRATEC
 config RADIO_TRUST
 	tristate "Trust FM radio card"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  This is a driver for the Trust FM radio cards. Say Y if you have
@@ -449,7 +449,7 @@ config RADIO_TRUST_PORT
 config RADIO_TYPHOON
 	tristate "Typhoon Radio (a.k.a. EcoRadio)"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have one of these FM radio cards, and then fill
@@ -484,7 +484,7 @@ config RADIO_TYPHOON_MUTEFREQ
 config RADIO_ZOLTRIX
 	tristate "Zoltrix Radio"
 	depends on ISA || COMPILE_TEST
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select RADIO_ISA
 	help
 	  Choose Y here if you have one of these FM radio cards, and then fill
diff --git a/drivers/media/radio/si470x/Kconfig b/drivers/media/radio/si470x/Kconfig
index 7161bd6cd13c..9f7d35b04a13 100644
--- a/drivers/media/radio/si470x/Kconfig
+++ b/drivers/media/radio/si470x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config RADIO_SI470X
 	tristate "Silicon Labs Si470x FM Radio Receiver support"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  This is a driver for devices with the Silicon Labs SI470x
 	  chip (either via USB or I2C buses).
diff --git a/drivers/media/radio/wl128x/Kconfig b/drivers/media/radio/wl128x/Kconfig
index d5ae3388d3db..3e7713872e3f 100644
--- a/drivers/media/radio/wl128x/Kconfig
+++ b/drivers/media/radio/wl128x/Kconfig
@@ -4,7 +4,7 @@
 #
 config RADIO_WL128X
 	tristate "Texas Instruments WL128x FM Radio"
-	depends on VIDEO_V4L2 && RFKILL && TTY && TI_ST
+	depends on VIDEO_DEV && RFKILL && TTY && TI_ST
 	depends on GPIOLIB || COMPILE_TEST
 	help
 	  Choose Y here if you have this FM radio chip.
diff --git a/drivers/media/spi/Kconfig b/drivers/media/spi/Kconfig
index 857ef4ace6e9..01e4e6cce027 100644
--- a/drivers/media/spi/Kconfig
+++ b/drivers/media/spi/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if VIDEO_V4L2
+if VIDEO_DEV
 
 comment "SPI I2C drivers auto-selected by 'Autoselect ancillary drivers'"
 	depends on MEDIA_HIDE_ANCILLARY_SUBDRV && SPI
@@ -9,7 +9,7 @@ menu "SPI helper chips"
 
 config VIDEO_GS1662
 	tristate "Gennum Serializers video"
-	depends on SPI && VIDEO_V4L2
+	depends on SPI && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	help
diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
index e27d6602545d..d663d822ec75 100644
--- a/drivers/media/test-drivers/Kconfig
+++ b/drivers/media/test-drivers/Kconfig
@@ -12,7 +12,7 @@ source "drivers/media/test-drivers/vivid/Kconfig"
 
 config VIDEO_VIM2M
 	tristate "Virtual Memory-to-Memory Driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/test-drivers/vicodec/Kconfig b/drivers/media/test-drivers/vicodec/Kconfig
index d77c67810c73..a7a828eec2a4 100644
--- a/drivers/media/test-drivers/vicodec/Kconfig
+++ b/drivers/media/test-drivers/vicodec/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VICODEC
 	tristate "Virtual Codec Driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	select V4L2_MEM2MEM_DEV
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
index ea37a102dec8..0d5169819cac 100644
--- a/drivers/media/test-drivers/vimc/Kconfig
+++ b/drivers/media/test-drivers/vimc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIMC
 	tristate "Virtual Media Controller Driver (VIMC)"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select FONT_SUPPORT
 	select FONT_8x16
 	select MEDIA_CONTROLLER
diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index c3abde2986b2..318799d317ba 100644
--- a/drivers/media/test-drivers/vivid/Kconfig
+++ b/drivers/media/test-drivers/vivid/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIVID
 	tristate "Virtual Video Test Driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64 && FB
+	depends on VIDEO_DEV && !SPARC32 && !SPARC64 && FB
 	depends on HAS_DMA
 	select FONT_SUPPORT
 	select FONT_8x16
diff --git a/drivers/media/tuners/Kconfig b/drivers/media/tuners/Kconfig
index 4605bb377574..81d1d56b9317 100644
--- a/drivers/media/tuners/Kconfig
+++ b/drivers/media/tuners/Kconfig
@@ -85,7 +85,7 @@ config MEDIA_TUNER_TEA5767
 
 config MEDIA_TUNER_MSI001
 	tristate "Mirics MSi001"
-	depends on MEDIA_SUPPORT && SPI && VIDEO_V4L2
+	depends on MEDIA_SUPPORT && SPI && VIDEO_DEV
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Mirics MSi001 silicon tuner driver.
@@ -223,7 +223,7 @@ config MEDIA_TUNER_TDA18212
 
 config MEDIA_TUNER_E4000
 	tristate "Elonics E4000 silicon tuner"
-	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
+	depends on MEDIA_SUPPORT && I2C && VIDEO_DEV
 	select REGMAP_I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
@@ -231,7 +231,7 @@ config MEDIA_TUNER_E4000
 
 config MEDIA_TUNER_FC2580
 	tristate "FCI FC2580 silicon tuner"
-	depends on MEDIA_SUPPORT && I2C && VIDEO_V4L2
+	depends on MEDIA_SUPPORT && I2C && VIDEO_DEV
 	select REGMAP_I2C
 	default m if !MEDIA_SUBDRV_AUTOSELECT
 	help
diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
index 3f1f9af92bc9..a3a8d051dc6c 100644
--- a/drivers/media/tuners/e4000.c
+++ b/drivers/media/tuners/e4000.c
@@ -257,7 +257,7 @@ static int e4000_set_params(struct e4000_dev *dev)
 /*
  * V4L2 API
  */
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 static const struct v4l2_frequency_band bands[] = {
 	{
 		.type = V4L2_TUNER_RF,
@@ -654,7 +654,7 @@ static int e4000_probe(struct i2c_client *client,
 	if (ret)
 		goto err_kfree;
 
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 	/* Register controls */
 	v4l2_ctrl_handler_init(&dev->hdl, 9);
 	dev->bandwidth_auto = v4l2_ctrl_new_std(&dev->hdl, &e4000_ctrl_ops,
@@ -713,7 +713,7 @@ static int e4000_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "\n");
 
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 	v4l2_ctrl_handler_free(&dev->hdl);
 #endif
 	kfree(dev);
diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.c
index 7639a305048f..1b5961bdf2d5 100644
--- a/drivers/media/tuners/fc2580.c
+++ b/drivers/media/tuners/fc2580.c
@@ -357,7 +357,7 @@ static const struct dvb_tuner_ops fc2580_dvb_tuner_ops = {
 /*
  * V4L2 API
  */
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 static const struct v4l2_frequency_band bands[] = {
 	{
 		.type = V4L2_TUNER_RF,
@@ -552,7 +552,7 @@ static int fc2580_probe(struct i2c_client *client,
 		goto err_kfree;
 	}
 
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 	/* Register controls */
 	v4l2_ctrl_handler_init(&dev->hdl, 2);
 	dev->bandwidth_auto = v4l2_ctrl_new_std(&dev->hdl, &fc2580_ctrl_ops,
@@ -594,7 +594,7 @@ static int fc2580_remove(struct i2c_client *client)
 
 	dev_dbg(&client->dev, "\n");
 
-#if IS_ENABLED(CONFIG_VIDEO_V4L2)
+#if IS_ENABLED(CONFIG_VIDEO_DEV)
 	v4l2_ctrl_handler_free(&dev->hdl);
 #endif
 	kfree(dev);
diff --git a/drivers/media/usb/airspy/Kconfig b/drivers/media/usb/airspy/Kconfig
index 458345217f78..0662d8701c44 100644
--- a/drivers/media/usb/airspy/Kconfig
+++ b/drivers/media/usb/airspy/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_AIRSPY
 	tristate "AirSpy"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	help
 	  This is a video4linux2 driver for AirSpy SDR device.
diff --git a/drivers/media/usb/au0828/Kconfig b/drivers/media/usb/au0828/Kconfig
index 05cc6c48c26f..31799b6ff91f 100644
--- a/drivers/media/usb/au0828/Kconfig
+++ b/drivers/media/usb/au0828/Kconfig
@@ -2,12 +2,12 @@
 
 config VIDEO_AU0828
 	tristate "Auvitek AU0828 support"
-	depends on I2C && INPUT && DVB_CORE && USB && VIDEO_V4L2
+	depends on I2C && INPUT && DVB_CORE && USB && VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_DVB
 	select I2C_ALGOBIT
 	select VIDEO_TVEEPROM
-	select VIDEOBUF2_VMALLOC if VIDEO_V4L2
+	select VIDEOBUF2_VMALLOC if VIDEO_DEV
 	select DVB_AU8522_DTV if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_XC5000 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MXL5007T if MEDIA_SUBDRV_AUTOSELECT
@@ -22,7 +22,7 @@ config VIDEO_AU0828
 config VIDEO_AU0828_V4L2
 	bool "Auvitek AU0828 v4l2 analog video support"
 	depends on VIDEO_AU0828
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=VIDEO_AU0828
+	depends on VIDEO_DEV=y || VIDEO_DEV=VIDEO_AU0828
 	select DVB_AU8522_V4L if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_TUNER
 	default y
diff --git a/drivers/media/usb/cpia2/Kconfig b/drivers/media/usb/cpia2/Kconfig
index e2c18ab0262b..da2c6862b4a2 100644
--- a/drivers/media/usb/cpia2/Kconfig
+++ b/drivers/media/usb/cpia2/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_CPIA2
 	tristate "CPiA2 Video For Linux"
-	depends on VIDEO_DEV && USB && VIDEO_V4L2
+	depends on USB && VIDEO_DEV
 	help
 	  This is the video4linux driver for cameras based on Vision's CPiA2
 	  (Colour Processor Interface ASIC), such as the Digital Blue QX5
diff --git a/drivers/media/usb/dvb-usb-v2/Kconfig b/drivers/media/usb/dvb-usb-v2/Kconfig
index 60ca8b9d070b..a4600a97d1fd 100644
--- a/drivers/media/usb/dvb-usb-v2/Kconfig
+++ b/drivers/media/usb/dvb-usb-v2/Kconfig
@@ -40,7 +40,7 @@ config DVB_USB_AF9035
 	select MEDIA_TUNER_FC0011 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MXL5007T if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_TDA18218 if MEDIA_SUBDRV_AUTOSELECT
-	select MEDIA_TUNER_FC2580 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_V4L2)
+	select MEDIA_TUNER_FC2580 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_DEV)
 	select MEDIA_TUNER_IT913X if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Say Y here to support the Afatech AF9035 based DVB USB receiver.
@@ -139,12 +139,12 @@ config DVB_USB_RTL28XXU
 	select DVB_CXD2841ER if MEDIA_SUBDRV_AUTOSELECT
 	select DVB_RTL2830
 	select DVB_RTL2832
-	select DVB_RTL2832_SDR if (MEDIA_SUBDRV_AUTOSELECT && MEDIA_SDR_SUPPORT && VIDEO_V4L2)
+	select DVB_RTL2832_SDR if (MEDIA_SUBDRV_AUTOSELECT && MEDIA_SDR_SUPPORT && VIDEO_DEV)
 	select DVB_SI2168 if MEDIA_SUBDRV_AUTOSELECT
-	select MEDIA_TUNER_E4000 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_V4L2)
+	select MEDIA_TUNER_E4000 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_DEV)
 	select MEDIA_TUNER_FC0012 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_FC0013 if MEDIA_SUBDRV_AUTOSELECT
-	select MEDIA_TUNER_FC2580 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_V4L2)
+	select MEDIA_TUNER_FC2580 if (MEDIA_SUBDRV_AUTOSELECT && VIDEO_DEV)
 	select MEDIA_TUNER_MT2060 if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_MXL5005S if MEDIA_SUBDRV_AUTOSELECT
 	select MEDIA_TUNER_QT1010 if MEDIA_SUBDRV_AUTOSELECT
diff --git a/drivers/media/usb/dvb-usb/Kconfig b/drivers/media/usb/dvb-usb/Kconfig
index 7498110142e4..6df96c2bf569 100644
--- a/drivers/media/usb/dvb-usb/Kconfig
+++ b/drivers/media/usb/dvb-usb/Kconfig
@@ -150,8 +150,8 @@ config DVB_USB_CXUSB
 
 config DVB_USB_CXUSB_ANALOG
 	bool "Analog support for the Conexant USB2.0 hybrid reference design"
-	depends on DVB_USB_CXUSB && VIDEO_V4L2
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_USB_CXUSB
+	depends on DVB_USB_CXUSB && VIDEO_DEV
+	depends on VIDEO_DEV=y || VIDEO_DEV=DVB_USB_CXUSB
 	select VIDEO_CX25840
 	select VIDEOBUF2_VMALLOC
 	help
diff --git a/drivers/media/usb/gspca/Kconfig b/drivers/media/usb/gspca/Kconfig
index dca4e16ed133..2b106a7fcf4c 100644
--- a/drivers/media/usb/gspca/Kconfig
+++ b/drivers/media/usb/gspca/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig USB_GSPCA
 	tristate "GSPCA based webcams"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on INPUT || INPUT=n
 	select VIDEOBUF2_VMALLOC
 	help
@@ -17,7 +17,7 @@ menuconfig USB_GSPCA
 	  module will be called gspca_main.
 
 
-if USB_GSPCA && VIDEO_V4L2
+if USB_GSPCA && VIDEO_DEV
 
 source "drivers/media/usb/gspca/m5602/Kconfig"
 source "drivers/media/usb/gspca/stv06xx/Kconfig"
@@ -25,7 +25,7 @@ source "drivers/media/usb/gspca/gl860/Kconfig"
 
 config USB_GSPCA_BENQ
 	tristate "Benq USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for the Benq DC E300 camera.
 
@@ -34,7 +34,7 @@ config USB_GSPCA_BENQ
 
 config USB_GSPCA_CONEX
 	tristate "Conexant Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Conexant chip.
 
@@ -43,7 +43,7 @@ config USB_GSPCA_CONEX
 
 config USB_GSPCA_CPIA1
 	tristate "cpia CPiA (version 1) Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for USB cameras based on the cpia
 	  CPiA chip. Note that you need at least version 0.6.4 of libv4l for
@@ -54,7 +54,7 @@ config USB_GSPCA_CPIA1
 
 config USB_GSPCA_DTCS033
 	tristate "DTCS033 (Scopium) USB Astro-Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for the Scopium camera
 	  for planetary astrophotography.
@@ -64,7 +64,7 @@ config USB_GSPCA_DTCS033
 
 config USB_GSPCA_ETOMS
 	tristate "Etoms USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Etoms chip.
 
@@ -73,7 +73,7 @@ config USB_GSPCA_ETOMS
 
 config USB_GSPCA_FINEPIX
 	tristate "Fujifilm FinePix USB V4L2 driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the FinePix chip.
 
@@ -82,7 +82,7 @@ config USB_GSPCA_FINEPIX
 
 config USB_GSPCA_JEILINJ
 	tristate "Jeilin JPEG USB V4L2 driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on this Jeilin chip.
 
@@ -91,7 +91,7 @@ config USB_GSPCA_JEILINJ
 
 config USB_GSPCA_JL2005BCD
 	tristate "JL2005B/C/D USB V4L2 driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based the
 	  JL2005B, JL2005C, or JL2005D chip.
@@ -101,7 +101,7 @@ config USB_GSPCA_JL2005BCD
 
 config USB_GSPCA_KINECT
 	tristate "Kinect sensor device USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for the Microsoft Kinect sensor device.
 
@@ -110,7 +110,7 @@ config USB_GSPCA_KINECT
 
 config USB_GSPCA_KONICA
 	tristate "Konica USB Camera V4L2 driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Konica chip.
 
@@ -119,7 +119,7 @@ config USB_GSPCA_KONICA
 
 config USB_GSPCA_MARS
 	tristate "Mars USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Mars chip.
 
@@ -128,7 +128,7 @@ config USB_GSPCA_MARS
 
 config USB_GSPCA_MR97310A
 	tristate "Mars-Semi MR97310A USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the MR97310A chip.
 
@@ -137,7 +137,7 @@ config USB_GSPCA_MR97310A
 
 config USB_GSPCA_NW80X
 	tristate "Divio based (NW80x) USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the NW80x chips.
 
@@ -146,7 +146,7 @@ config USB_GSPCA_NW80X
 
 config USB_GSPCA_OV519
 	tristate "OV51x / OVFX2 / W996xCF USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on one of these:
 	  OV511(+), OV518(+), OV519, OVFX2, W9967CF, W9968CF
@@ -156,7 +156,7 @@ config USB_GSPCA_OV519
 
 config USB_GSPCA_OV534
 	tristate "OV534 OV772x USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the OV534 chip
 	  and sensor OV772x (e.g. Sony Playstation EYE)
@@ -166,7 +166,7 @@ config USB_GSPCA_OV534
 
 config USB_GSPCA_OV534_9
 	tristate "OV534 OV965x USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the OV534 chip
 	  and sensor OV965x (e.g. Hercules Dualpix)
@@ -176,7 +176,7 @@ config USB_GSPCA_OV534_9
 
 config USB_GSPCA_PAC207
 	tristate "Pixart PAC207 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the PAC207 chip.
 
@@ -185,7 +185,7 @@ config USB_GSPCA_PAC207
 
 config USB_GSPCA_PAC7302
 	tristate "Pixart PAC7302 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the PAC7302 chip.
 
@@ -194,7 +194,7 @@ config USB_GSPCA_PAC7302
 
 config USB_GSPCA_PAC7311
 	tristate "Pixart PAC7311 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the PAC7311 chip.
 
@@ -203,7 +203,7 @@ config USB_GSPCA_PAC7311
 
 config USB_GSPCA_SE401
 	tristate "SE401 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the
 	  Endpoints (formerly known as AOX) se401 chip.
@@ -213,7 +213,7 @@ config USB_GSPCA_SE401
 
 config USB_GSPCA_SN9C2028
 	tristate "SONIX Dual-Mode USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want streaming support for Sonix SN9C2028 cameras.
 	  These are supported as stillcams in libgphoto2/camlibs/sonix.
@@ -223,7 +223,7 @@ config USB_GSPCA_SN9C2028
 
 config USB_GSPCA_SN9C20X
 	tristate "SN9C20X USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the
 	  sn9c20x chips (SN9C201 and SN9C202).
@@ -233,7 +233,7 @@ config USB_GSPCA_SN9C20X
 
 config USB_GSPCA_SONIXB
 	tristate "SONIX Bayer USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Sonix
 	  chips with Bayer format (SN9C101, SN9C102 and SN9C103).
@@ -243,7 +243,7 @@ config USB_GSPCA_SONIXB
 
 config USB_GSPCA_SONIXJ
 	tristate "SONIX JPEG USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Sonix
 	  chips with JPEG format (SN9C102P, SN9C105 and >= SN9C110).
@@ -253,7 +253,7 @@ config USB_GSPCA_SONIXJ
 
 config USB_GSPCA_SPCA500
 	tristate "SPCA500 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA500 chip.
 
@@ -262,7 +262,7 @@ config USB_GSPCA_SPCA500
 
 config USB_GSPCA_SPCA501
 	tristate "SPCA501 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA501 chip.
 
@@ -271,7 +271,7 @@ config USB_GSPCA_SPCA501
 
 config USB_GSPCA_SPCA505
 	tristate "SPCA505 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA505 chip.
 
@@ -280,7 +280,7 @@ config USB_GSPCA_SPCA505
 
 config USB_GSPCA_SPCA506
 	tristate "SPCA506 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA506 chip.
 
@@ -289,7 +289,7 @@ config USB_GSPCA_SPCA506
 
 config USB_GSPCA_SPCA508
 	tristate "SPCA508 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA508 chip.
 
@@ -298,7 +298,7 @@ config USB_GSPCA_SPCA508
 
 config USB_GSPCA_SPCA561
 	tristate "SPCA561 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA561 chip.
 
@@ -307,7 +307,7 @@ config USB_GSPCA_SPCA561
 
 config USB_GSPCA_SPCA1528
 	tristate "SPCA1528 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SPCA1528 chip.
 
@@ -316,7 +316,7 @@ config USB_GSPCA_SPCA1528
 
 config USB_GSPCA_SQ905
 	tristate "SQ Technologies SQ905 based USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SQ905 chip.
 
@@ -325,7 +325,7 @@ config USB_GSPCA_SQ905
 
 config USB_GSPCA_SQ905C
 	tristate "SQ Technologies SQ905C based USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SQ905C chip.
 
@@ -334,7 +334,7 @@ config USB_GSPCA_SQ905C
 
 config USB_GSPCA_SQ930X
 	tristate "SQ Technologies SQ930X based USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the SQ930X chip.
 
@@ -343,7 +343,7 @@ config USB_GSPCA_SQ930X
 
 config USB_GSPCA_STK014
 	tristate "Syntek DV4000 (STK014) USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the STK014 chip.
 
@@ -352,7 +352,7 @@ config USB_GSPCA_STK014
 
 config USB_GSPCA_STK1135
 	tristate "Syntek STK1135 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the STK1135 chip.
 
@@ -361,7 +361,7 @@ config USB_GSPCA_STK1135
 
 config USB_GSPCA_STV0680
 	tristate "STV0680 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the STV0680 chip.
 
@@ -370,7 +370,7 @@ config USB_GSPCA_STV0680
 
 config USB_GSPCA_SUNPLUS
 	tristate "SUNPLUS USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the Sunplus
 	  SPCA504(abc) SPCA533 SPCA536 chips.
@@ -380,7 +380,7 @@ config USB_GSPCA_SUNPLUS
 
 config USB_GSPCA_T613
 	tristate "T613 (JPEG Compliance) USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the T613 chip.
 
@@ -389,7 +389,7 @@ config USB_GSPCA_T613
 
 config USB_GSPCA_TOPRO
 	tristate "TOPRO USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the
 	  TP6800 and TP6810 Topro chips.
@@ -399,7 +399,7 @@ config USB_GSPCA_TOPRO
 
 config USB_GSPCA_TOUPTEK
 	tristate "Touptek USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the ToupTek UCMOS
 	  / AmScope MU series camera.
@@ -409,7 +409,7 @@ config USB_GSPCA_TOUPTEK
 
 config USB_GSPCA_TV8532
 	tristate "TV8532 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the TV8531 chip.
 
@@ -418,7 +418,7 @@ config USB_GSPCA_TV8532
 
 config USB_GSPCA_VC032X
 	tristate "VC032X USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the VC032X chip.
 
@@ -427,7 +427,7 @@ config USB_GSPCA_VC032X
 
 config USB_GSPCA_VICAM
 	tristate "ViCam USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for the 3com homeconnect camera
 	  (vicam).
@@ -437,7 +437,7 @@ config USB_GSPCA_VICAM
 
 config USB_GSPCA_XIRLINK_CIT
 	tristate "Xirlink C-It USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for Xirlink C-It bases cameras.
 
@@ -446,7 +446,7 @@ config USB_GSPCA_XIRLINK_CIT
 
 config USB_GSPCA_ZC3XX
 	tristate "ZC3XX USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the ZC3XX chip.
 
diff --git a/drivers/media/usb/gspca/gl860/Kconfig b/drivers/media/usb/gspca/gl860/Kconfig
index 2dfd2704c915..e5a35ca72b60 100644
--- a/drivers/media/usb/gspca/gl860/Kconfig
+++ b/drivers/media/usb/gspca/gl860/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_GL860
 	tristate "GL860 USB Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the GL860 chip.
 
diff --git a/drivers/media/usb/gspca/m5602/Kconfig b/drivers/media/usb/gspca/m5602/Kconfig
index 0a250652d717..d616408b67d9 100644
--- a/drivers/media/usb/gspca/m5602/Kconfig
+++ b/drivers/media/usb/gspca/m5602/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_M5602
 	tristate "ALi USB m5602 Camera Driver"
-	depends on VIDEO_V4L2 && USB_GSPCA
+	depends on VIDEO_DEV && USB_GSPCA
 	help
 	  Say Y here if you want support for cameras based on the
 	  ALi m5602 connected to various image sensors.
diff --git a/drivers/media/usb/hackrf/Kconfig b/drivers/media/usb/hackrf/Kconfig
index 2267cebfdecb..1cf9b4d3a514 100644
--- a/drivers/media/usb/hackrf/Kconfig
+++ b/drivers/media/usb/hackrf/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_HACKRF
 	tristate "HackRF"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	help
 	  This is a video4linux2 driver for HackRF SDR device.
diff --git a/drivers/media/usb/hdpvr/Kconfig b/drivers/media/usb/hdpvr/Kconfig
index 617400b27314..ee45a89aa607 100644
--- a/drivers/media/usb/hdpvr/Kconfig
+++ b/drivers/media/usb/hdpvr/Kconfig
@@ -2,7 +2,7 @@
 
 config VIDEO_HDPVR
 	tristate "Hauppauge HD PVR support"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  This is a video4linux driver for Hauppauge's HD PVR USB device.
 
diff --git a/drivers/media/usb/msi2500/Kconfig b/drivers/media/usb/msi2500/Kconfig
index b403603bcc81..c2ded6482a5b 100644
--- a/drivers/media/usb/msi2500/Kconfig
+++ b/drivers/media/usb/msi2500/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_MSI2500
 	tristate "Mirics MSi2500"
-	depends on VIDEO_V4L2 && SPI
+	depends on VIDEO_DEV && SPI
 	select VIDEOBUF2_VMALLOC
 	select MEDIA_TUNER_MSI001
diff --git a/drivers/media/usb/pvrusb2/Kconfig b/drivers/media/usb/pvrusb2/Kconfig
index e6a4f730591b..f2b64e49c5a2 100644
--- a/drivers/media/usb/pvrusb2/Kconfig
+++ b/drivers/media/usb/pvrusb2/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_PVRUSB2
 	tristate "Hauppauge WinTV-PVR USB2 support"
-	depends on VIDEO_V4L2 && I2C
+	depends on VIDEO_DEV && I2C
 	select VIDEO_TUNER
 	select VIDEO_TVEEPROM
 	select VIDEO_CX2341X
diff --git a/drivers/media/usb/pwc/Kconfig b/drivers/media/usb/pwc/Kconfig
index 7cebf6314a67..2078bd5ecf41 100644
--- a/drivers/media/usb/pwc/Kconfig
+++ b/drivers/media/usb/pwc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_PWC
 	tristate "USB Philips Cameras"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	help
 	  Say Y or M here if you want to use one of these Philips & OEM
diff --git a/drivers/media/usb/s2255/Kconfig b/drivers/media/usb/s2255/Kconfig
index e4a0c914d9c3..889593b21889 100644
--- a/drivers/media/usb/s2255/Kconfig
+++ b/drivers/media/usb/s2255/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_S2255
 	tristate "USB Sensoray 2255 video capture device"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	help
 	  Say Y here if you want support for the Sensoray 2255 USB device.
diff --git a/drivers/media/usb/stkwebcam/Kconfig b/drivers/media/usb/stkwebcam/Kconfig
index 775a5151539c..d94d023f1aa0 100644
--- a/drivers/media/usb/stkwebcam/Kconfig
+++ b/drivers/media/usb/stkwebcam/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_STKWEBCAM
 	tristate "USB Syntek DC1125 Camera support"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Say Y here if you want to use this type of camera.
 	  Supported devices are typically found in some Asus laptops,
diff --git a/drivers/media/usb/usbtv/Kconfig b/drivers/media/usb/usbtv/Kconfig
index 84799c7203d3..578a0e693f8b 100644
--- a/drivers/media/usb/usbtv/Kconfig
+++ b/drivers/media/usb/usbtv/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_USBTV
 	tristate "USBTV007 video capture support"
-	depends on VIDEO_V4L2 && SND
+	depends on VIDEO_DEV && SND
 	select SND_PCM
 	select VIDEOBUF2_VMALLOC
 
diff --git a/drivers/media/usb/uvc/Kconfig b/drivers/media/usb/uvc/Kconfig
index 4c2f4a3216f2..ca51ee8e45f3 100644
--- a/drivers/media/usb/uvc/Kconfig
+++ b/drivers/media/usb/uvc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_VIDEO_CLASS
 	tristate "USB Video Class (UVC)"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF2_VMALLOC
 	help
 	  Support for the USB Video Class (UVC).  Currently only video
diff --git a/drivers/media/usb/zr364xx/Kconfig b/drivers/media/usb/zr364xx/Kconfig
index 49b4257487bb..a9fb02566c4b 100644
--- a/drivers/media/usb/zr364xx/Kconfig
+++ b/drivers/media/usb/zr364xx/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config USB_ZR364XX
 	tristate "USB ZR364XX Camera support"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select VIDEOBUF_GEN
 	select VIDEOBUF_VMALLOC
 	help
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 6ee75c6c820e..1be9a2cc947a 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -3,17 +3,9 @@
 # Generic video config states
 #
 
-# Enable the V4L2 core and API
-config VIDEO_V4L2
-	tristate
-	depends on (I2C || I2C=n) && VIDEO_DEV
-	select RATIONAL
-	select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
-	default (I2C || I2C=n) && VIDEO_DEV
-
 config VIDEO_V4L2_I2C
 	bool
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	default y
 
 config VIDEO_V4L2_SUBDEV_API
@@ -64,7 +56,7 @@ config V4L2_MEM2MEM_DEV
 # Used by LED subsystem flash drivers
 config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
-	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
 	depends on LEDS_CLASS_FLASH
 	select V4L2_ASYNC
 	help
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 1ec7e9cae1fa..41d91bd10cf2 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -38,4 +38,4 @@ obj-$(CONFIG_VIDEOBUF_GEN) += videobuf-core.o
 obj-$(CONFIG_VIDEOBUF_VMALLOC) += videobuf-vmalloc.o
 
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
-obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o videodev.o
+obj-$(CONFIG_VIDEO_DEV) += v4l2-dv-timings.o videodev.o
diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index aeed5803dfb1..2c8d7fdcc5f7 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -11,7 +11,7 @@ menuconfig INTEL_ATOMISP
 
 config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
-	depends on VIDEO_V4L2 && INTEL_ATOMISP
+	depends on VIDEO_DEV && INTEL_ATOMISP
 	depends on PMIC_OPREGION
 	select IOSF_MBI
 	select VIDEOBUF_VMALLOC
diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index a772b833a85f..e726101b24e4 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -6,7 +6,7 @@
 config VIDEO_ATOMISP_OV2722
 	tristate "OVT ov2722 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the OVT
 	  OV2722 raw camera.
@@ -18,7 +18,7 @@ config VIDEO_ATOMISP_OV2722
 config VIDEO_ATOMISP_GC2235
 	tristate "Galaxy gc2235 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the OVT
 	  GC2235 raw camera.
@@ -40,7 +40,7 @@ config VIDEO_ATOMISP_MSRLIST_HELPER
 config VIDEO_ATOMISP_MT9M114
 	tristate "Aptina mt9m114 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the Micron
 	  mt9m114 1.3 Mpixel camera.
@@ -52,7 +52,7 @@ config VIDEO_ATOMISP_MT9M114
 config VIDEO_ATOMISP_GC0310
 	tristate "GC0310 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
@@ -60,7 +60,7 @@ config VIDEO_ATOMISP_GC0310
 config VIDEO_ATOMISP_OV2680
 	tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the Omnivision
 	  OV2680 raw camera.
@@ -72,7 +72,7 @@ config VIDEO_ATOMISP_OV2680
 config VIDEO_ATOMISP_OV5693
 	tristate "Omnivision ov5693 sensor support"
 	depends on ACPI
-	depends on I2C && VIDEO_V4L2
+	depends on I2C && VIDEO_DEV
 	help
 	  This is a Video4Linux2 sensor-level driver for the Micron
 	  ov5693 5 Mpixel camera.
@@ -88,7 +88,7 @@ config VIDEO_ATOMISP_OV5693
 config VIDEO_ATOMISP_LM3554
        tristate "LM3554 flash light driver"
 	depends on ACPI
-       depends on VIDEO_V4L2 && I2C
+       depends on VIDEO_DEV && I2C
 	help
 	 This is a Video4Linux2 sub-dev driver for the LM3554
 	 flash light driver.
diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
index 3c5d833322c8..0172a6822ec2 100644
--- a/drivers/staging/media/hantro/Kconfig
+++ b/drivers/staging/media/hantro/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_HANTRO
 	tristate "Hantro VPU driver"
 	depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || ARCH_SUNXI || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index c3bf433ba3e3..0bacac302d7e 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -4,7 +4,7 @@ config VIDEO_IMX_MEDIA
 	depends on ARCH_MXC || COMPILE_TEST
 	depends on HAS_DMA
 	depends on VIDEO_DEV
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
index 3e9640523e50..114a1d8e7cc8 100644
--- a/drivers/staging/media/ipu3/Kconfig
+++ b/drivers/staging/media/ipu3/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_IPU3_IMGU
 	tristate "Intel ipu3-imgu driver"
-	depends on PCI && VIDEO_V4L2
+	depends on PCI && VIDEO_DEV
 	depends on X86
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/staging/media/max96712/Kconfig b/drivers/staging/media/max96712/Kconfig
index acde14fd5c4d..117fadf81bd0 100644
--- a/drivers/staging/media/max96712/Kconfig
+++ b/drivers/staging/media/max96712/Kconfig
@@ -3,7 +3,7 @@ config VIDEO_MAX96712
 	tristate "Maxim MAX96712 Quad GMSL2 Deserializer support"
 	depends on I2C
 	depends on OF_GPIO
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
 	select MEDIA_CONTROLLER
diff --git a/drivers/staging/media/meson/vdec/Kconfig b/drivers/staging/media/meson/vdec/Kconfig
index 9e1450193392..19ffea987b89 100644
--- a/drivers/staging/media/meson/vdec/Kconfig
+++ b/drivers/staging/media/meson/vdec/Kconfig
@@ -2,7 +2,7 @@
 
 config VIDEO_MESON_VDEC
 	tristate "Amlogic video decoder driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && HAS_DMA
+	depends on VIDEO_DEV && HAS_DMA
 	depends on ARCH_MESON || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
diff --git a/drivers/staging/media/omap4iss/Kconfig b/drivers/staging/media/omap4iss/Kconfig
index 6c254907a27b..6d1f55b09132 100644
--- a/drivers/staging/media/omap4iss/Kconfig
+++ b/drivers/staging/media/omap4iss/Kconfig
@@ -2,7 +2,7 @@
 
 config VIDEO_OMAP4
 	tristate "OMAP 4 Camera support"
-	depends on VIDEO_V4L2  && I2C
+	depends on VIDEO_DEV  && I2C
 	depends on ARCH_OMAP4 || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/staging/media/rkvdec/Kconfig b/drivers/staging/media/rkvdec/Kconfig
index dc7292f346fa..e963d60cc6ad 100644
--- a/drivers/staging/media/rkvdec/Kconfig
+++ b/drivers/staging/media/rkvdec/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_ROCKCHIP_VDEC
 	tristate "Rockchip Video Decoder driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select MEDIA_CONTROLLER_REQUEST_API
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/staging/media/sunxi/cedrus/Kconfig b/drivers/staging/media/sunxi/cedrus/Kconfig
index da369950bbf2..21c13f9b6e33 100644
--- a/drivers/staging/media/sunxi/cedrus/Kconfig
+++ b/drivers/staging/media/sunxi/cedrus/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_SUNXI_CEDRUS
 	tristate "Allwinner Cedrus VPU driver"
-	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on HAS_DMA
 	depends on OF
 	select MEDIA_CONTROLLER
diff --git a/drivers/staging/media/tegra-video/Kconfig b/drivers/staging/media/tegra-video/Kconfig
index 1f35da4b134e..df1b2cff2417 100644
--- a/drivers/staging/media/tegra-video/Kconfig
+++ b/drivers/staging/media/tegra-video/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_TEGRA
 	tristate "NVIDIA Tegra VI driver"
 	depends on TEGRA_HOST1X
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index faef008b8554..3fb3e27e04a8 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -1,6 +1,6 @@
 config VIDEO_ZORAN
 	tristate "Zoran ZR36057/36067 Video For Linux (Deprecated)"
-	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2
+	depends on PCI && I2C_ALGOBIT && VIDEO_DEV
 	depends on !ALPHA
 	depends on DEBUG_FS
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/staging/most/video/Kconfig b/drivers/staging/most/video/Kconfig
index e0964ca5e7b3..e16cc5e104b7 100644
--- a/drivers/staging/most/video/Kconfig
+++ b/drivers/staging/most/video/Kconfig
@@ -5,7 +5,7 @@
 
 config MOST_VIDEO
 	tristate "Video"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	help
 	  Say Y here if you want to commumicate via Video 4 Linux.
 
diff --git a/drivers/staging/vc04_services/bcm2835-camera/Kconfig b/drivers/staging/vc04_services/bcm2835-camera/Kconfig
index d0653d1ed3c7..dcda565f9b38 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-camera/Kconfig
@@ -2,7 +2,7 @@
 config VIDEO_BCM2835
 	tristate "BCM2835 Camera"
 	depends on MEDIA_SUPPORT
-	depends on VIDEO_V4L2 && (ARCH_BCM2835 || COMPILE_TEST)
+	depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
 	select BCM2835_VCHIQ
 	select BCM2835_VCHIQ_MMAL
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index dd58094f0b85..4fa2ddf322b4 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -448,7 +448,7 @@ config USB_CONFIGFS_F_HID
 config USB_CONFIGFS_F_UVC
 	bool "USB Webcam function"
 	depends on USB_CONFIGFS
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	depends on VIDEO_DEV
 	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
diff --git a/drivers/usb/gadget/legacy/Kconfig b/drivers/usb/gadget/legacy/Kconfig
index de6668e58481..0a7b382fbe27 100644
--- a/drivers/usb/gadget/legacy/Kconfig
+++ b/drivers/usb/gadget/legacy/Kconfig
@@ -500,7 +500,7 @@ endif
 # or video class gadget drivers), or specific hardware, here.
 config USB_G_WEBCAM
 	tristate "USB Webcam Gadget"
-	depends on VIDEO_V4L2
+	depends on VIDEO_DEV
 	select USB_LIBCOMPOSITE
 	select VIDEOBUF2_DMA_SG
 	select VIDEOBUF2_VMALLOC
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 41ce12597177..a55836225401 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -559,7 +559,7 @@ config SND_ES1968_RADIO
 	bool "Enable TEA5757 radio tuner support for es1968"
 	depends on SND_ES1968
 	depends on MEDIA_RADIO_SUPPORT
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=SND_ES1968
+	depends on VIDEO_DEV=y || VIDEO_DEV=SND_ES1968
 	select RADIO_ADAPTERS
 	select RADIO_TEA575X
 
@@ -583,7 +583,7 @@ config SND_FM801_TEA575X_BOOL
 	bool "ForteMedia FM801 + TEA5757 tuner"
 	depends on SND_FM801
 	depends on MEDIA_RADIO_SUPPORT
-	depends on VIDEO_V4L2=y || VIDEO_V4L2=SND_FM801
+	depends on VIDEO_DEV=y || VIDEO_DEV=SND_FM801
 	select RADIO_ADAPTERS
 	select RADIO_TEA575X
 	help
-- 
2.35.1

