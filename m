Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAAA4D9068
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXtr4qRzz30Mg
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:34:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nl72LKsR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nl72LKsR; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHM0t61hnz2yb9;
 Tue, 15 Mar 2022 03:09:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C6A16132C;
 Mon, 14 Mar 2022 16:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D48C340F5;
 Mon, 14 Mar 2022 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647274139;
 bh=nr94XDM9gYoD8hJrTjCkScLFgQoYClNcKkwHr7WI9fg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nl72LKsRTNYo/6nisMGoyn8ucXuRXrefGB2rQ2jq2K7p0CcEGJTvyMGfKvqQekPXp
 /TQw1tSrucdymvJ4MPHT1xkiIj0Bpwn/BExesM0zVYZzoAAk6PJPUZWvv+nuTIXt3x
 KgjQxDgYYA4D5OptVA6MlWrguHBL7Pfyz9MBBkqrM8MdqzvUv07Fcw/OWaKKnfZD+a
 jlJsVOQK7vBZkbSwCF5fSWbXws8jlLmX1ukEUMt0k4VFSyctElA9L34eOSWidmfAE1
 VCDBK3qO2broWbzfLJVOvvJssOOikp16pEPQOwWMeQPnn3qo2lZxchnOZX+1lABTBU
 LXcBSDCmBqW1Q==
Date: Mon, 14 Mar 2022 17:08:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] media: Kconfig: cleanup VIDEO_DEV dependencies
Message-ID: <20220314170829.52ac4381@coco.lan>
In-Reply-To: <20220314150745.ph2jpjpvdft3645v@uno.localdomain>
References: <42ae3d28d4d822f3e14db76b99f2f4c41688ae3e.1647155467.git.mchehab@kernel.org>
 <20220314150745.ph2jpjpvdft3645v@uno.localdomain>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?B?xYF1?= =?UTF-8?B?a2Fzeg==?= Stelmach <l.stelmach@samsung.com>,
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
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>,
 Ray Jui <rjui@broadcom.com>, mjpeg-users@lists.sourceforge.net,
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
 Niklas =?UTF-8?B?U8O2?= =?UTF-8?B?ZGVybHVuZA==?=
 <niklas.soderlund@ragnatech.se>, Colin Ian King <colin.king@intel.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Em Mon, 14 Mar 2022 16:07:45 +0100
Jacopo Mondi <jacopo@jmondi.org> escreveu:

> Hi Mauro
> 
> On Sun, Mar 13, 2022 at 08:12:05AM +0100, Mauro Carvalho Chehab wrote:
> > media Kconfig has two entries associated to V4L API:
> > VIDEO_DEV and VIDEO_V4L2.
> >
> > On Kernel 2.6.x, there were two V4L APIs, each one with its own flag.
> > VIDEO_DEV were meant to:
> > 	1) enable Video4Linux and make its Kconfig options to appear;
> > 	2) it makes the Kernel build the V4L core.
> >
> > while VIDEO_V4L2 where used to distinguish between drivers that
> > implement the newer API and drivers that implemented the former one.
> >
> > With time, such meaning changed, specially after the removal of
> > all V4L version 1 drivers.
> >
> > At the current implementation, VIDEO_DEV only does (1): it enables
> > the media options related to V4L, that now has:
> >
> > 	menu "Video4Linux options"
> > 		visible if VIDEO_DEV
> >
> > 	source "drivers/media/v4l2-core/Kconfig"
> > 	endmenu
> >
> > but it doesn't affect anymore the V4L core drivers.
> >
> > The rationale is that the V4L2 core has a "soft" dependency
> > at the I2C bus, and now requires to select a number of other
> > Kconfig options:
> >
> > 	config VIDEO_V4L2
> > 		tristate
> > 		depends on (I2C || I2C=n) && VIDEO_DEV
> > 		select RATIONAL
> > 		select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
> > 		default (I2C || I2C=n) && VIDEO_DEV
> >
> > In the past, merging them would be tricky, but it seems that it is now
> > possible to merge those symbols, in order to simplify V4L dependencies.
> >
> > Let's keep VIDEO_DEV, as this one is used on some make *defconfig
> > configurations.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  drivers/input/rmi4/Kconfig                    |   2 +-
> >  drivers/input/touchscreen/Kconfig             |   4 +-
> >  drivers/media/Kconfig                         |   3 +
> >  drivers/media/common/saa7146/Kconfig          |   2 +-
> >  drivers/media/dvb-core/Kconfig                |   2 +-
> >  drivers/media/dvb-frontends/Kconfig           |   4 +-
> >  drivers/media/i2c/Kconfig                     | 250 +++++++++---------
> >  drivers/media/i2c/ccs/Kconfig                 |   2 +-
> >  drivers/media/i2c/cx25840/Kconfig             |   2 +-
> >  drivers/media/i2c/et8ek8/Kconfig              |   2 +-
> >  drivers/media/i2c/m5mols/Kconfig              |   2 +-
> >  drivers/media/pci/Kconfig                     |   2 +-
> >  drivers/media/pci/bt8xx/Kconfig               |   2 +-
> >  drivers/media/pci/cobalt/Kconfig              |   2 +-
> >  drivers/media/pci/cx18/Kconfig                |   2 +-
> >  drivers/media/pci/dt3155/Kconfig              |   2 +-
> >  drivers/media/pci/intel/ipu3/Kconfig          |   2 +-
> >  drivers/media/pci/ivtv/Kconfig                |   2 +-
> >  drivers/media/pci/meye/Kconfig                |   2 +-
> >  drivers/media/pci/saa7146/Kconfig             |   6 +-
> >  drivers/media/pci/sta2x11/Kconfig             |   2 +-
> >  drivers/media/pci/tw5864/Kconfig              |   2 +-
> >  drivers/media/pci/tw68/Kconfig                |   2 +-
> >  drivers/media/pci/tw686x/Kconfig              |   2 +-
> >  drivers/media/platform/Kconfig                |   6 +-
> >  drivers/media/platform/allegro-dvt/Kconfig    |   2 +-
> >  drivers/media/platform/am437x/Kconfig         |   2 +-
> >  drivers/media/platform/amphion/Kconfig        |   2 +-
> >  drivers/media/platform/aspeed/Kconfig         |   2 +-
> >  drivers/media/platform/atmel/Kconfig          |   8 +-
> >  drivers/media/platform/cadence/Kconfig        |   4 +-
> >  drivers/media/platform/coda/Kconfig           |   2 +-
> >  drivers/media/platform/davinci/Kconfig        |  12 +-
> >  drivers/media/platform/exynos-gsc/Kconfig     |   2 +-
> >  drivers/media/platform/exynos4-is/Kconfig     |   2 +-
> >  drivers/media/platform/intel/Kconfig          |   2 +-
> >  drivers/media/platform/marvell-ccic/Kconfig   |   4 +-
> >  drivers/media/platform/meson/ge2d/Kconfig     |   2 +-
> >  drivers/media/platform/mtk-jpeg/Kconfig       |   2 +-
> >  drivers/media/platform/mtk-mdp/Kconfig        |   2 +-
> >  drivers/media/platform/mtk-vcodec/Kconfig     |   2 +-
> >  drivers/media/platform/mtk-vpu/Kconfig        |   2 +-
> >  drivers/media/platform/nxp/Kconfig            |   8 +-
> >  drivers/media/platform/nxp/imx-jpeg/Kconfig   |   2 +-
> >  drivers/media/platform/omap/Kconfig           |   2 +-
> >  drivers/media/platform/omap3isp/Kconfig       |   2 +-
> >  drivers/media/platform/qcom/camss/Kconfig     |   2 +-
> >  drivers/media/platform/qcom/venus/Kconfig     |   2 +-
> >  drivers/media/platform/renesas/Kconfig        |  12 +-
> >  .../media/platform/renesas/rcar-vin/Kconfig   |   4 +-
> >  drivers/media/platform/rockchip/rga/Kconfig   |   2 +-
> >  .../media/platform/rockchip/rkisp1/Kconfig    |   2 +-
> >  drivers/media/platform/s3c-camif/Kconfig      |   2 +-
> >  drivers/media/platform/s5p-g2d/Kconfig        |   2 +-
> >  drivers/media/platform/s5p-jpeg/Kconfig       |   2 +-
> >  drivers/media/platform/s5p-mfc/Kconfig        |   2 +-
> >  drivers/media/platform/sti/bdisp/Kconfig      |   2 +-
> >  drivers/media/platform/sti/delta/Kconfig      |   2 +-
> >  drivers/media/platform/sti/hva/Kconfig        |   2 +-
> >  drivers/media/platform/stm32/Kconfig          |   4 +-
> >  .../media/platform/sunxi/sun4i-csi/Kconfig    |   2 +-
> >  .../media/platform/sunxi/sun6i-csi/Kconfig    |   2 +-
> >  drivers/media/platform/sunxi/sun8i-di/Kconfig |   2 +-
> >  .../media/platform/sunxi/sun8i-rotate/Kconfig |   2 +-
> >  drivers/media/platform/tegra/vde/Kconfig      |   2 +-
> >  drivers/media/platform/ti-vpe/Kconfig         |   4 +-
> >  drivers/media/platform/via/Kconfig            |   2 +-
> >  drivers/media/platform/xilinx/Kconfig         |   2 +-
> >  drivers/media/radio/Kconfig                   |  54 ++--
> >  drivers/media/radio/si470x/Kconfig            |   2 +-
> >  drivers/media/radio/wl128x/Kconfig            |   2 +-
> >  drivers/media/spi/Kconfig                     |   4 +-
> >  drivers/media/test-drivers/Kconfig            |   2 +-
> >  drivers/media/test-drivers/vicodec/Kconfig    |   2 +-
> >  drivers/media/test-drivers/vimc/Kconfig       |   2 +-
> >  drivers/media/test-drivers/vivid/Kconfig      |   2 +-
> >  drivers/media/tuners/Kconfig                  |   6 +-
> >  drivers/media/tuners/e4000.c                  |   6 +-
> >  drivers/media/tuners/fc2580.c                 |   6 +-
> >  drivers/media/usb/airspy/Kconfig              |   2 +-
> >  drivers/media/usb/au0828/Kconfig              |   6 +-
> >  drivers/media/usb/cpia2/Kconfig               |   2 +-
> >  drivers/media/usb/dvb-usb-v2/Kconfig          |   8 +-
> >  drivers/media/usb/dvb-usb/Kconfig             |   4 +-
> >  drivers/media/usb/gspca/Kconfig               |  96 +++----
> >  drivers/media/usb/gspca/gl860/Kconfig         |   2 +-
> >  drivers/media/usb/gspca/m5602/Kconfig         |   2 +-
> >  drivers/media/usb/hackrf/Kconfig              |   2 +-
> >  drivers/media/usb/hdpvr/Kconfig               |   2 +-
> >  drivers/media/usb/msi2500/Kconfig             |   2 +-
> >  drivers/media/usb/pvrusb2/Kconfig             |   2 +-
> >  drivers/media/usb/pwc/Kconfig                 |   2 +-
> >  drivers/media/usb/s2255/Kconfig               |   2 +-
> >  drivers/media/usb/stkwebcam/Kconfig           |   2 +-
> >  drivers/media/usb/usbtv/Kconfig               |   2 +-
> >  drivers/media/usb/uvc/Kconfig                 |   2 +-
> >  drivers/media/usb/zr364xx/Kconfig             |   2 +-
> >  drivers/media/v4l2-core/Kconfig               |  12 +-
> >  drivers/media/v4l2-core/Makefile              |   2 +-
> >  drivers/staging/media/atomisp/Kconfig         |   2 +-
> >  drivers/staging/media/atomisp/i2c/Kconfig     |  14 +-
> >  drivers/staging/media/hantro/Kconfig          |   2 +-
> >  drivers/staging/media/imx/Kconfig             |   2 +-
> >  drivers/staging/media/ipu3/Kconfig            |   2 +-
> >  drivers/staging/media/max96712/Kconfig        |   2 +-
> >  drivers/staging/media/meson/vdec/Kconfig      |   2 +-
> >  drivers/staging/media/omap4iss/Kconfig        |   2 +-
> >  drivers/staging/media/rkvdec/Kconfig          |   2 +-
> >  drivers/staging/media/sunxi/cedrus/Kconfig    |   2 +-
> >  drivers/staging/media/tegra-video/Kconfig     |   2 +-
> >  drivers/staging/media/zoran/Kconfig           |   2 +-
> >  drivers/staging/most/video/Kconfig            |   2 +-
> >  .../vc04_services/bcm2835-camera/Kconfig      |   2 +-
> >  drivers/usb/gadget/Kconfig                    |   2 +-
> >  drivers/usb/gadget/legacy/Kconfig             |   2 +-
> >  sound/pci/Kconfig                             |   4 +-
> >  116 files changed, 363 insertions(+), 368 deletions(-)
> >
> > diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
> > index 16119f760d11..c0163b983ce6 100644
> > --- a/drivers/input/rmi4/Kconfig
> > +++ b/drivers/input/rmi4/Kconfig
> > @@ -110,7 +110,7 @@ config RMI4_F3A
> >
> >  config RMI4_F54
> >  	bool "RMI4 Function 54 (Analog diagnostics)"
> > -	depends on VIDEO_V4L2=y || (RMI4_CORE=m && VIDEO_V4L2=m)
> > +	depends on VIDEO_DEV=y || (RMI4_CORE=m && VIDEO_DEV=m)
> >  	select VIDEOBUF2_VMALLOC
> >  	select RMI4_F55
> >  	help
> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> > index 2f6adfb7b938..ff7794cecf69 100644
> > --- a/drivers/input/touchscreen/Kconfig
> > +++ b/drivers/input/touchscreen/Kconfig
> > @@ -131,7 +131,7 @@ config TOUCHSCREEN_ATMEL_MXT
> >  config TOUCHSCREEN_ATMEL_MXT_T37
> >  	bool "Support T37 Diagnostic Data"
> >  	depends on TOUCHSCREEN_ATMEL_MXT
> > -	depends on VIDEO_V4L2=y || (TOUCHSCREEN_ATMEL_MXT=m && VIDEO_V4L2=m)
> > +	depends on VIDEO_DEV=y || (TOUCHSCREEN_ATMEL_MXT=m && VIDEO_DEV=m)
> >  	select VIDEOBUF2_VMALLOC
> >  	help
> >  	  Say Y here if you want support to output data from the T37
> > @@ -1252,7 +1252,7 @@ config TOUCHSCREEN_SUN4I
> >  config TOUCHSCREEN_SUR40
> >  	tristate "Samsung SUR40 (Surface 2.0/PixelSense) touchscreen"
> >  	depends on USB && MEDIA_USB_SUPPORT && HAS_DMA
> > -	depends on VIDEO_V4L2
> > +	depends on VIDEO_DEV
> >  	select VIDEOBUF2_DMA_SG
> >  	help
> >  	  Say Y here if you want support for the Samsung SUR40 touchscreen
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index 01b536863657..2d02d9a44b94 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -160,6 +160,9 @@ menu "Media core support"
> >  config VIDEO_DEV
> >  	tristate "Video4Linux core"
> >  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT || MEDIA_TEST_SUPPORT
> > +	depends on (I2C || I2C=n)  
> 
> Is this I2C || I2C=n intentional ?

Yes. See, I2C is a tristate, so, the above evaluates to:

	if I2C=n => no dependency at I2C

If I2C is either "M" or "Y"

	config VIDEO_DEV depends on I2C.

That's the way to tell the build system that, if I2C is 
compiled as "M", VIDEO_DEV can't be compiled as "Y".


> 
> > +	select RATIONAL
> > +	select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
> >  	help
> >  	  Enables the V4L2 API, used by cameras, analog TV, video grabbers,
> >  	  radio devices and by some input devices.
> > diff --git a/drivers/media/common/saa7146/Kconfig b/drivers/media/common/saa7146/Kconfig
> > index 3e85c0c3fd9a..a0aa155e5d85 100644
> > --- a/drivers/media/common/saa7146/Kconfig
> > +++ b/drivers/media/common/saa7146/Kconfig
> > @@ -5,6 +5,6 @@ config VIDEO_SAA7146
> >
> >  config VIDEO_SAA7146_VV
> >  	tristate
> > -	depends on VIDEO_V4L2
> > +	depends on VIDEO_DEV
> >  	select VIDEOBUF_DMA_SG
> >  	select VIDEO_SAA7146
> > diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
> > index 6ffac618417b..8b3f2d53cd62 100644
> > --- a/drivers/media/dvb-core/Kconfig
> > +++ b/drivers/media/dvb-core/Kconfig
> > @@ -6,7 +6,7 @@
> >  config DVB_MMAP
> >  	bool "Enable DVB memory-mapped API (EXPERIMENTAL)"
> >  	depends on DVB_CORE
> > -	depends on VIDEO_V4L2=y || VIDEO_V4L2=DVB_CORE
> > +	depends on VIDEO_DEV=y || VIDEO_DEV=DVB_CORE
> >  	select VIDEOBUF2_VMALLOC
> >  	help
> >  	  This option enables DVB experimental memory-mapped API, which
> > diff --git a/drivers/media/dvb-frontends/Kconfig b/drivers/media/dvb-frontends/Kconfig
> > index 2c1ed98d43c5..4101f9b1e731 100644
> > --- a/drivers/media/dvb-frontends/Kconfig
> > +++ b/drivers/media/dvb-frontends/Kconfig
> > @@ -510,7 +510,7 @@ config DVB_RTL2832
> >
> >  config DVB_RTL2832_SDR
> >  	tristate "Realtek RTL2832 SDR"
> > -	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_V4L2 && MEDIA_SDR_SUPPORT && USB
> > +	depends on DVB_CORE && I2C && I2C_MUX && VIDEO_DEV && MEDIA_SDR_SUPPORT && USB
> >  	select DVB_RTL2832
> >  	select VIDEOBUF2_VMALLOC
> >  	default m if !MEDIA_SUBDRV_AUTOSELECT
> > @@ -681,7 +681,7 @@ config DVB_AU8522_DTV
> >
> >  config DVB_AU8522_V4L
> >  	tristate "Auvitek AU8522 based ATV demod"
> > -	depends on VIDEO_V4L2 && DVB_CORE && I2C
> > +	depends on VIDEO_DEV && DVB_CORE && I2C
> >  	select DVB_AU8522
> >  	default m if !MEDIA_SUBDRV_AUTOSELECT
> >  	help
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index e7194c1be4d2..5abc169f0a5c 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -3,7 +3,7 @@
> >  # Multimedia Video device configuration
> >  #
> >
> > -if VIDEO_V4L2
> > +if VIDEO_DEV
> >
> >  comment "IR I2C driver auto-selected by 'Autoselect ancillary drivers'"
> >  	depends on MEDIA_SUBDRV_AUTOSELECT && I2C && RC_CORE
> > @@ -36,7 +36,7 @@ menu "Audio decoders, processors and mixers"
> >
> >  config VIDEO_TVAUDIO
> >  	tristate "Simple audio decoder chips"
> > -	depends on VIDEO_V4L2 && I2C
> > +	depends on VIDEO_DEV && I2C  
> 
> Are there symbols in drivers/media/i2c that do not depend on I2C ?
> Could we make the menu conditional on I2C presence ?

It shouldn't have any, but simplifying it is outside the scope of this
patch. 

> 
> >  	help
> >  	  Support for several audio decoder chips found on some bt8xx boards:
> >  	  Philips: tda9840, tda9873h, tda9874h/a, tda9850, tda985x, tea6300,
> > @@ -48,7 +48,7 @@ config VIDEO_TVAUDIO  
> 
> [snip]
> 
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config VIDEO_TW5864
> >  	tristate "Techwell TW5864 video/audio grabber and encoder"
> > -	depends on VIDEO_DEV && PCI && VIDEO_V4L2
> > +	depends on VIDEO_DEV && PCI && VIDEO_DEV  
> 
> Double VIDEO_DEV
> 
> >  	select VIDEOBUF2_DMA_CONTIG
> >  	help
> >  	  Support for boards based on Techwell TW5864 chip which provides
> > diff --git a/drivers/media/pci/tw68/Kconfig b/drivers/media/pci/tw68/Kconfig
> > index af0cb60337bb..ef29be7db493 100644
> > --- a/drivers/media/pci/tw68/Kconfig
> > +++ b/drivers/media/pci/tw68/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config VIDEO_TW68
> >  	tristate "Techwell tw68x Video For Linux"
> > -	depends on VIDEO_DEV && PCI && VIDEO_V4L2
> > +	depends on VIDEO_DEV && PCI && VIDEO_DEV  
> 
> Same here
> 
> >  	select VIDEOBUF2_DMA_SG
> >  	help
> >  	  Support for Techwell tw68xx based frame grabber boards.  
> 
> [snip]
> 
> > diff --git a/drivers/media/platform/amphion/Kconfig b/drivers/media/platform/amphion/Kconfig
> > index 13899649f766..e9ddca7a9e4a 100644
> > --- a/drivers/media/platform/amphion/Kconfig
> > +++ b/drivers/media/platform/amphion/Kconfig
> > @@ -5,7 +5,7 @@ config VIDEO_AMPHION_VPU
> >  	depends on ARCH_MXC || COMPILE_TEST
> >  	depends on MEDIA_SUPPORT
> >  	depends on VIDEO_DEV
> > -	depends on VIDEO_V4L2
> > +	depends on VIDEO_DEV  
> 
> VIDEO_DEV already listed
> 
> >  	select MEDIA_CONTROLLER
> >  	select V4L2_MEM2MEM_DEV
> >  	select VIDEOBUF2_DMA_CONTIG  
> 
> [snip]
> 
> >
> > -if RADIO_ADAPTERS && VIDEO_V4L2
> > +if RADIO_ADAPTERS && VIDEO_DEV
> >
> >  config RADIO_TEA575X
> >  	tristate
> > @@ -20,13 +20,13 @@ source "drivers/media/radio/si470x/Kconfig"
> >
> >  config RADIO_SI4713
> >  	tristate "Silicon Labs Si4713 FM Radio with RDS Transmitter support"
> > -	depends on VIDEO_V4L2
> > +	depends on VIDEO_DEV  
> 
> Isn't this menu section already conditional to VIDEO_DEV

Yes. I'll drop those extra dependencies on this file.

> 
> [snip]
> 
> With the above minors fixed
> 
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> Thanks
>    j



Thanks,
Mauro
