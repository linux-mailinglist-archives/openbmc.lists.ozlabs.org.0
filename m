Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11D4D905A
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXnK1QZlz30Qv
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:29:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oiHsWppU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oiHsWppU; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGWMD3ssmz2yLX;
 Sun, 13 Mar 2022 18:22:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE7B460F76;
 Sun, 13 Mar 2022 07:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5840FC340F5;
 Sun, 13 Mar 2022 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647156114;
 bh=GHziQy0Uk4uTJH7a17gyMNm8mew5G6o5Vt+QUWf5uiQ=;
 h=From:To:Cc:Subject:Date:From;
 b=oiHsWppUezI4z1jSNg19Rxm4LFjBd1agV5AYdAZO2S+tUl5R15IIMEhzLVHHs5DaR
 U0gJusXv6HsiyrvB5UbunVnF/CkbShjCl/rJvGrTDsHOcBJKKRQZbk8o8Q4oDRfvhi
 Fq9E6DiOfp0J0VZ1KZMalHgjitojcNVCNYbnKhoVYpwPH0P86fJEpiD/GMYIZ7uPiu
 +w1OmW9fsctQJfp8hMimXwXM8qXURoh31LWADte9b27+c5G3kZMXmfLApYE0O/givN
 9dXwGxk6NwWgrAg6EahEvjoqypeEez7A6xqFD0aj3e6kiQOzHUnUFPX3LZ4kabAXIh
 HXREFoPBASacQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTIY2-0012vV-Ur; Sun, 13 Mar 2022 08:21:50 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 00/39]  Sort Makefiles and platform/Kconfig
Date: Sun, 13 Mar 2022 08:21:09 +0100
Message-Id: <cover.1647155572.git.mchehab@kernel.org>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Dafna Hirschfeld <dafna@fastmail.com>,
 Eddie James <eajames@linux.ibm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux1394-devel@lists.sourceforge.net, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Michael Tretter <m.tretter@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Shijie Qin <shijie.qin@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
 Jacob Chen <jacob-chen@iotwrt.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-tegra@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Benoit Parrot <bparrot@ti.com>, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Yong Deng <yong.deng@magewell.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-amlogic@lists.infradead.org,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Walls <awalls@md.metrocast.net>,
 Zhou Peng <eagle.zhou@nxp.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andy Gross <agross@kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Tomasz Figa <tfiga@chromium.org>, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev,
 Ming Qian <ming.qian@nxp.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Entries at Makefiles and Kconfig files end being merged on random order. 

Sort Makefile entries in alphabetical order. 

Sorting Kconfig is harder. So, for now, do it only for platform/Kconfig.

On platform/Kconfig, there is a mix of:
	- two ancillary drivers;
	- per-SoC drivers whose Kconfig/Makefile is on separate files;
	- per-SoC drivers whose Makefile is on separate files, but the
	  driver is at platform/Makefile;
	- per-SoC drivers that are specified inside platform/Makefile and
	  platform/Kconfig.

Give some order by ensuring that all non-generic drivers will be on
subdirectories.

The end goal is to have one directory below platform per manufacturer,
This series prepare for that.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-

v3:
  - used ASCII sort instead of LC-dependent sort;
  - add a comment about the sort at the files;
  - moved vsp1 driver ro renesas/ dir;
  - moved imx drivers to nxp/ dir;
  - the new MEDIA_PLATFORM_DRIVERS menu is on a separate patch and defaults to "Y";
  - split the several obj-y at usb/Makefile into one line per driver (sorted).

v2:
  - removed some renames at DVB frontend;
  - added patches for platform/Kconfig sort.

Mauro Carvalho Chehab (39):
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

 .../admin-guide/media/i2c-cardlist.rst        |   2 +-
 MAINTAINERS                                   |  24 +-
 drivers/media/Kconfig                         |   8 +-
 drivers/media/Makefile                        |   4 +-
 drivers/media/cec/platform/Makefile           |  16 +-
 drivers/media/common/Makefile                 |   5 +-
 drivers/media/common/videobuf2/Makefile       |   8 +-
 drivers/media/dvb-frontends/Makefile          | 193 ++---
 drivers/media/firewire/Makefile               |   2 +-
 drivers/media/i2c/Makefile                    |  92 +--
 drivers/media/pci/Makefile                    |  21 +-
 drivers/media/pci/cx18/cx18-driver.c          |   2 +-
 drivers/media/pci/cx18/cx18-dvb.c             |   2 +-
 drivers/media/pci/cx18/cx18-gpio.c            |   2 +-
 drivers/media/pci/cx23885/cx23885-cards.c     |   2 +-
 drivers/media/pci/cx23885/cx23885-dvb.c       |   2 +-
 drivers/media/pci/cx23885/cx23885-video.c     |   2 +-
 drivers/media/pci/cx88/cx88.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |   2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c            |   2 +-
 drivers/media/pci/saa7134/saa7134-cards.c     |   2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c       |   2 +-
 drivers/media/platform/Kconfig                | 753 ++----------------
 drivers/media/platform/Makefile               | 132 +--
 drivers/media/platform/allegro-dvt/Kconfig    |  16 +
 drivers/media/platform/am437x/Kconfig         |   1 +
 drivers/media/platform/amphion/Kconfig        |  20 +
 drivers/media/platform/aspeed/Kconfig         |  10 +
 drivers/media/platform/aspeed/Makefile        |   2 +
 .../platform/{ => aspeed}/aspeed-video.c      |   0
 drivers/media/platform/atmel/Kconfig          |   4 +
 drivers/media/platform/cadence/Kconfig        |   1 +
 drivers/media/platform/coda/Kconfig           |  17 +
 drivers/media/platform/davinci/Kconfig        |   6 +
 drivers/media/platform/exynos-gsc/Kconfig     |  10 +
 drivers/media/platform/exynos4-is/Kconfig     |   1 +
 drivers/media/platform/imx/Kconfig            |  24 -
 drivers/media/platform/imx/Makefile           |   1 -
 drivers/media/platform/intel/Kconfig          |  11 +
 drivers/media/platform/intel/Makefile         |   2 +
 .../media/platform/{ => intel}/pxa_camera.c   |   0
 drivers/media/platform/marvell-ccic/Kconfig   |   2 +
 drivers/media/platform/meson/ge2d/Kconfig     |  14 +
 drivers/media/platform/mtk-jpeg/Kconfig       |  16 +
 drivers/media/platform/mtk-mdp/Kconfig        |  17 +
 drivers/media/platform/mtk-vcodec/Kconfig     |  36 +
 drivers/media/platform/mtk-vpu/Kconfig        |  15 +
 drivers/media/platform/nxp/Kconfig            |  66 ++
 drivers/media/platform/nxp/Makefile           |   8 +
 drivers/media/platform/{ => nxp}/fsl-viu.c    |   0
 .../media/platform/{ => nxp}/imx-jpeg/Kconfig |   1 +
 .../platform/{ => nxp}/imx-jpeg/Makefile      |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.c |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.h |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg.c    |   0
 .../platform/{ => nxp}/imx-jpeg/mxc-jpeg.h    |   0
 .../platform/{imx => nxp}/imx-mipi-csis.c     |   0
 drivers/media/platform/{ => nxp}/imx-pxp.c    |   0
 drivers/media/platform/{ => nxp}/imx-pxp.h    |   0
 .../media/platform/{ => nxp}/mx2_emmaprp.c    |   0
 drivers/media/platform/omap/Kconfig           |   1 +
 drivers/media/platform/omap3isp/Kconfig       |  21 +
 drivers/media/platform/qcom/Kconfig           |   3 +
 drivers/media/platform/qcom/camss/Kconfig     |   9 +
 drivers/media/platform/qcom/venus/Kconfig     |  14 +
 drivers/media/platform/renesas/Kconfig        | 119 +++
 drivers/media/platform/renesas/Makefile       |  15 +
 .../media/platform/{ => renesas}/rcar-fcp.c   |   0
 .../media/platform/{ => renesas}/rcar-isp.c   |   0
 .../platform/{ => renesas}/rcar-vin/Kconfig   |   2 +
 .../platform/{ => renesas}/rcar-vin/Makefile  |   0
 .../{ => renesas}/rcar-vin/rcar-core.c        |   0
 .../{ => renesas}/rcar-vin/rcar-csi2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-dma.c         |   0
 .../{ => renesas}/rcar-vin/rcar-v4l2.c        |   0
 .../{ => renesas}/rcar-vin/rcar-vin.h         |   0
 .../media/platform/{ => renesas}/rcar_drif.c  |   0
 .../media/platform/{ => renesas}/rcar_fdp1.c  |   0
 .../media/platform/{ => renesas}/rcar_jpu.c   |   0
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
 drivers/media/platform/rockchip/Kconfig       |   3 +
 drivers/media/platform/rockchip/rga/Kconfig   |  14 +
 .../media/platform/rockchip/rkisp1/Kconfig    |  19 +
 drivers/media/platform/s3c-camif/Kconfig      |  15 +
 drivers/media/platform/s5p-g2d/Kconfig        |  11 +
 drivers/media/platform/s5p-jpeg/Kconfig       |  12 +
 drivers/media/platform/s5p-mfc/Kconfig        |   9 +
 drivers/media/platform/sti/Kconfig            |   5 +
 drivers/media/platform/sti/bdisp/Kconfig      |  10 +
 drivers/media/platform/sti/c8sectpfe/Kconfig  |   1 +
 drivers/media/platform/sti/delta/Kconfig      |  36 +
 drivers/media/platform/sti/hva/Kconfig        |  26 +
 drivers/media/platform/stm32/Kconfig          |  31 +
 drivers/media/platform/sunxi/Kconfig          |   2 +
 .../media/platform/sunxi/sun4i-csi/Kconfig    |   1 +
 .../media/platform/sunxi/sun6i-csi/Kconfig    |   1 +
 drivers/media/platform/sunxi/sun8i-di/Kconfig |  14 +
 .../media/platform/sunxi/sun8i-rotate/Kconfig |  14 +
 drivers/media/platform/tegra/vde/Kconfig      |  17 +
 drivers/media/platform/ti-vpe/Kconfig         |  62 ++
 drivers/media/platform/via/Kconfig            |  11 +
 drivers/media/platform/via/Makefile           |   2 +
 drivers/media/platform/{ => via}/via-camera.c |   0
 drivers/media/platform/{ => via}/via-camera.h |   0
 drivers/media/platform/xilinx/Kconfig         |   1 +
 drivers/media/radio/Makefile                  |  43 +-
 drivers/media/rc/Makefile                     |  47 +-
 drivers/media/rc/keymaps/Makefile             |  34 +-
 drivers/media/spi/Makefile                    |   7 +-
 drivers/media/test-drivers/Makefile           |  14 +-
 drivers/media/tuners/Makefile                 |  66 +-
 drivers/media/tuners/tuner-types.c            |   2 +-
 .../{tuner-xc2028-types.h => xc2028-types.h}  |   6 +-
 .../media/tuners/{tuner-xc2028.c => xc2028.c} |   6 +-
 .../media/tuners/{tuner-xc2028.h => xc2028.h} |   2 +-
 drivers/media/tuners/xc4000.c                 |   2 +-
 drivers/media/usb/Makefile                    |  40 +-
 drivers/media/usb/dvb-usb/cxusb.c             |   2 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   2 +-
 drivers/media/usb/em28xx/em28xx-i2c.c         |   2 +-
 drivers/media/usb/em28xx/em28xx.h             |   2 +-
 drivers/media/usb/gspca/Makefile              |  88 +-
 drivers/media/usb/tm6000/tm6000-cards.c       |   2 +-
 drivers/media/usb/tm6000/tm6000-dvb.c         |   2 +-
 drivers/media/usb/tm6000/tm6000-i2c.c         |   2 +-
 drivers/media/v4l2-core/Makefile              |  34 +-
 drivers/media/v4l2-core/tuner-core.c          |   2 +-
 168 files changed, 1316 insertions(+), 1175 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/Kconfig
 create mode 100644 drivers/media/platform/amphion/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Kconfig
 create mode 100644 drivers/media/platform/aspeed/Makefile
 rename drivers/media/platform/{ => aspeed}/aspeed-video.c (100%)
 create mode 100644 drivers/media/platform/coda/Kconfig
 create mode 100644 drivers/media/platform/exynos-gsc/Kconfig
 delete mode 100644 drivers/media/platform/imx/Kconfig
 delete mode 100644 drivers/media/platform/imx/Makefile
 create mode 100644 drivers/media/platform/intel/Kconfig
 create mode 100644 drivers/media/platform/intel/Makefile
 rename drivers/media/platform/{ => intel}/pxa_camera.c (100%)
 create mode 100644 drivers/media/platform/meson/ge2d/Kconfig
 create mode 100644 drivers/media/platform/mtk-jpeg/Kconfig
 create mode 100644 drivers/media/platform/mtk-mdp/Kconfig
 create mode 100644 drivers/media/platform/mtk-vcodec/Kconfig
 create mode 100644 drivers/media/platform/mtk-vpu/Kconfig
 create mode 100644 drivers/media/platform/nxp/Kconfig
 create mode 100644 drivers/media/platform/nxp/Makefile
 rename drivers/media/platform/{ => nxp}/fsl-viu.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/Kconfig (91%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/Makefile (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg-hw.h (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-jpeg/mxc-jpeg.h (100%)
 rename drivers/media/platform/{imx => nxp}/imx-mipi-csis.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.c (100%)
 rename drivers/media/platform/{ => nxp}/imx-pxp.h (100%)
 rename drivers/media/platform/{ => nxp}/mx2_emmaprp.c (100%)
 create mode 100644 drivers/media/platform/omap3isp/Kconfig
 create mode 100644 drivers/media/platform/qcom/Kconfig
 create mode 100644 drivers/media/platform/qcom/camss/Kconfig
 create mode 100644 drivers/media/platform/qcom/venus/Kconfig
 create mode 100644 drivers/media/platform/renesas/Kconfig
 create mode 100644 drivers/media/platform/renesas/Makefile
 rename drivers/media/platform/{ => renesas}/rcar-fcp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-isp.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Kconfig (93%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/Makefile (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-core.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-csi2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-dma.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-v4l2.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar-vin/rcar-vin.h (100%)
 rename drivers/media/platform/{ => renesas}/rcar_drif.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_fdp1.c (100%)
 rename drivers/media/platform/{ => renesas}/rcar_jpu.c (100%)
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
 create mode 100644 drivers/media/platform/rockchip/rga/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkisp1/Kconfig
 create mode 100644 drivers/media/platform/s3c-camif/Kconfig
 create mode 100644 drivers/media/platform/s5p-g2d/Kconfig
 create mode 100644 drivers/media/platform/s5p-jpeg/Kconfig
 create mode 100644 drivers/media/platform/s5p-mfc/Kconfig
 create mode 100644 drivers/media/platform/sti/Kconfig
 create mode 100644 drivers/media/platform/sti/bdisp/Kconfig
 create mode 100644 drivers/media/platform/sti/delta/Kconfig
 create mode 100644 drivers/media/platform/sti/hva/Kconfig
 create mode 100644 drivers/media/platform/stm32/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Kconfig
 create mode 100644 drivers/media/platform/tegra/vde/Kconfig
 create mode 100644 drivers/media/platform/ti-vpe/Kconfig
 create mode 100644 drivers/media/platform/via/Kconfig
 create mode 100644 drivers/media/platform/via/Makefile
 rename drivers/media/platform/{ => via}/via-camera.c (100%)
 rename drivers/media/platform/{ => via}/via-camera.h (100%)
 rename drivers/media/tuners/{tuner-xc2028-types.h => xc2028-types.h} (96%)
 rename drivers/media/tuners/{tuner-xc2028.c => xc2028.c} (99%)
 rename drivers/media/tuners/{tuner-xc2028.h => xc2028.h} (99%)

Diff from v2:

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a5cc49e27a6..848640546398 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12024,7 +12024,7 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,vsp1.yaml
-F:	drivers/media/platform/vsp1/
+F:	drivers/media/platform/renesas/vsp1/
 
 MEDIA DRIVERS FOR ST STV0910 DEMODULATOR ICs
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index f3f24c63536b..01b536863657 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -216,13 +216,12 @@ menu "Media drivers"
 comment "Drivers filtered as selected at 'Filter media drivers'"
 	depends on MEDIA_SUPPORT_FILTER
 
+comment "media drivers"
+
 source "drivers/media/usb/Kconfig"
 source "drivers/media/pci/Kconfig"
 source "drivers/media/radio/Kconfig"
 
-# Common driver options
-source "drivers/media/common/Kconfig"
-
 if MEDIA_PLATFORM_SUPPORT
 source "drivers/media/platform/Kconfig"
 source "drivers/media/mmc/Kconfig"
@@ -234,6 +233,9 @@ endif
 
 source "drivers/media/firewire/Kconfig"
 
+# Common driver options
+source "drivers/media/common/Kconfig"
+
 endmenu
 
 #
diff --git a/drivers/media/common/Makefile b/drivers/media/common/Makefile
index 2e3cc25c5695..ce84391ce664 100644
--- a/drivers/media/common/Makefile
+++ b/drivers/media/common/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += b2c2/ saa7146/ siano/ v4l2-tpg/ videobuf2/
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_VIDEO_CX2341X) += cx2341x.o
 obj-$(CONFIG_CYPRESS_FIRMWARE) += cypress_firmware.o
 obj-$(CONFIG_TTPCI_EEPROM) += ttpci-eeprom.o
diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/common/videobuf2/Makefile
index 7036e5d56e04..a6fe3f304685 100644
--- a/drivers/media/common/videobuf2/Makefile
+++ b/drivers/media/common/videobuf2/Makefile
@@ -6,6 +6,8 @@ ifeq ($(CONFIG_TRACEPOINTS),y)
   videobuf2-common-objs += vb2-trace.o
 endif
 
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_VIDEOBUF2_CORE) += videobuf2-common.o
 obj-$(CONFIG_VIDEOBUF2_DMA_CONTIG) += videobuf2-dma-contig.o
 obj-$(CONFIG_VIDEOBUF2_DMA_SG) += videobuf2-dma-sg.o
diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
index 2cb52330fba3..a93146cb428c 100644
--- a/drivers/media/dvb-frontends/Makefile
+++ b/drivers/media/dvb-frontends/Makefile
@@ -16,7 +16,8 @@ drxk-objs := drxk_hard.o
 stb0899-objs := stb0899_drv.o stb0899_algo.o
 stv0900-objs := stv0900_core.o stv0900_sw.o
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 
 obj-$(CONFIG_DVB_A8293) += a8293.o
 obj-$(CONFIG_DVB_AF9013) += af9013.o
diff --git a/drivers/media/pci/Makefile b/drivers/media/pci/Makefile
index b234a5d78777..2aa7027b6807 100644
--- a/drivers/media/pci/Makefile
+++ b/drivers/media/pci/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the kernel multimedia device drivers.
 #
 
+# Please keep it alphabetically sorted by directory
+# (e. g. LC_ALL=C sort Makefile)
 obj-y        +=	ttpci/		\
 		b2c2/		\
 		pluto2/		\
@@ -19,7 +21,8 @@ obj-y        +=	ttpci/		\
 
 obj-$(CONFIG_STA2X11_VIP) += sta2x11/
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_VIDEO_BT848) += bt8xx/
 obj-$(CONFIG_VIDEO_COBALT) += cobalt/
 obj-$(CONFIG_VIDEO_CX18) += cx18/
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3ad25c6a56c..721f27ef0130 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -5,6 +5,7 @@
 
 menuconfig MEDIA_PLATFORM_DRIVERS
 	bool "Media platform devices"
+	default "y"
 	help
 	  Say Y here to enable support for platform-specific media drivers.
 
@@ -47,6 +48,7 @@ config VIDEO_MEM2MEM_DEINTERLACE
 	select V4L2_MEM2MEM_DEV
 	help
 	    Generic deinterlacing V4L2 driver.
+
 config VIDEO_MUX
 	tristate "Video Multiplexer"
 	depends on V4L_PLATFORM_DRIVERS
@@ -71,10 +73,8 @@ source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/cadence/Kconfig"
 source "drivers/media/platform/coda/Kconfig"
 source "drivers/media/platform/davinci/Kconfig"
-source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/exynos-gsc/Kconfig"
-source "drivers/media/platform/imx-jpeg/Kconfig"
-source "drivers/media/platform/imx/Kconfig"
+source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/intel/Kconfig"
 source "drivers/media/platform/marvell-ccic/Kconfig"
 source "drivers/media/platform/meson/ge2d/Kconfig"
@@ -83,8 +83,8 @@ source "drivers/media/platform/mtk-mdp/Kconfig"
 source "drivers/media/platform/mtk-vcodec/Kconfig"
 source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
-source "drivers/media/platform/omap3isp/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
+source "drivers/media/platform/omap3isp/Kconfig"
 source "drivers/media/platform/qcom/Kconfig"
 source "drivers/media/platform/renesas/Kconfig"
 source "drivers/media/platform/rockchip/Kconfig"
@@ -100,4 +100,4 @@ source "drivers/media/platform/ti-vpe/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
 
-endif #MEDIA_PLATFORM_DRIVERS
+endif # MEDIA_PLATFORM_DRIVERS
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 1a6c41e6e261..20b07ae3ebf1 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the video capture/playback device drivers.
 #
 
-# Place here, alphabetically sorted, all directories
+# Place here, alphabetically sorted by directory
+# (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
 obj-y += aspeed/
 obj-y += am437x/
@@ -12,10 +13,8 @@ obj-y += atmel/
 obj-y += cadence/
 obj-y += coda/
 obj-y += davinci/
-obj-y += exynos4-is/
 obj-y += exynos-gsc/
-obj-y += imx/
-obj-y += imx-jpeg/
+obj-y += exynos4-is/
 obj-y += intel/
 obj-y += marvell-ccic/
 obj-y += meson/ge2d/
@@ -44,9 +43,10 @@ obj-y += sunxi/
 obj-y += tegra/vde/
 obj-y += ti-vpe/
 obj-y += via/
-obj-y += vsp1/
 obj-y += xilinx/
 
 # Please place here only ancillary drivers that aren't SoC-specific
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_VIDEO_MEM2MEM_DEINTERLACE)	+= m2m-deinterlace.o
 obj-$(CONFIG_VIDEO_MUX)			+= video-mux.o
diff --git a/drivers/media/platform/aspeed/Makefile b/drivers/media/platform/aspeed/Makefile
index 4ee15b3ddd90..b8394b7e537d 100644
--- a/drivers/media/platform/aspeed/Makefile
+++ b/drivers/media/platform/aspeed/Makefile
@@ -1 +1,2 @@
-obj-$(CONFIG_VIDEO_ASPEED)		+= aspeed-video.o
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_ASPEED) += aspeed-video.o
diff --git a/drivers/media/platform/imx/Kconfig b/drivers/media/platform/imx/Kconfig
deleted file mode 100644
index 7cd0617c9b1b..000000000000
--- a/drivers/media/platform/imx/Kconfig
+++ /dev/null
@@ -1,25 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-menuconfig VIDEO_IMX
-	bool "V4L2 capture drivers for NXP i.MX devices"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on ARCH_MXC || COMPILE_TEST
-	depends on VIDEO_DEV && VIDEO_V4L2
-	help
-	  Say yes here to enable support for capture drivers on i.MX SoCs.
-	  Support for the single SoC features are selectable in the sub-menu
-	  options.
-
-if VIDEO_IMX
-
-config VIDEO_IMX_MIPI_CSIS
-	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
-	select MEDIA_CONTROLLER
-	select V4L2_FWNODE
-	select VIDEO_V4L2_SUBDEV_API
-	default n
-	help
-	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
-	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
-
-endif # VIDEO_IMX
diff --git a/drivers/media/platform/imx/Makefile b/drivers/media/platform/imx/Makefile
deleted file mode 100644
index f72bdbe8e6ef..000000000000
--- a/drivers/media/platform/imx/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
diff --git a/drivers/media/platform/intel/Makefile b/drivers/media/platform/intel/Makefile
index 10ea23fb2bcc..45b5c59d57da 100644
--- a/drivers/media/platform/intel/Makefile
+++ b/drivers/media/platform/intel/Makefile
@@ -1 +1,2 @@
-obj-$(CONFIG_VIDEO_PXA27x)		+= pxa_camera.o
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_PXA27x) += pxa_camera.o
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 92724121ff91..df52d32ebe50 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -2,6 +2,30 @@
 
 # V4L drivers
 
+menuconfig VIDEO_IMX
+	bool "V4L2 capture drivers for NXP i.MX devices"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV && VIDEO_V4L2
+	help
+	  Say yes here to enable support for capture drivers on i.MX SoCs.
+	  Support for the single SoC features are selectable in the sub-menu
+	  options.
+
+if VIDEO_IMX
+
+config VIDEO_IMX_MIPI_CSIS
+	tristate "MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	default n
+	help
+	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
+	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
+
+endif # VIDEO_IMX
+
 config VIDEO_VIU
 	tristate "Freescale/NXP VIU Video Driver"
 	depends on V4L_PLATFORM_DRIVERS
@@ -38,3 +62,5 @@ config VIDEO_MX2_EMMAPRP
 	    MX2X chips have a PrP that can be used to process buffers from
 	    memory to memory. Operations include resizing and format
 	    conversion.
+
+source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 147bd7ad4ef4..a217cf7f109d 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_VIDEO_IMX_PXP)		+= imx-pxp.o
-obj-$(CONFIG_VIDEO_VIU)			+= fsl-viu.o
-obj-$(CONFIG_VIDEO_MX2_EMMAPRP)		+= mx2_emmaprp.o
+obj-y += imx-jpeg/
+
+obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
+obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
+obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
+obj-$(CONFIG_VIDEO_VIU) += fsl-viu.o
diff --git a/drivers/media/platform/imx-jpeg/Kconfig b/drivers/media/platform/nxp/imx-jpeg/Kconfig
similarity index 100%
rename from drivers/media/platform/imx-jpeg/Kconfig
rename to drivers/media/platform/nxp/imx-jpeg/Kconfig
diff --git a/drivers/media/platform/imx-jpeg/Makefile b/drivers/media/platform/nxp/imx-jpeg/Makefile
similarity index 100%
rename from drivers/media/platform/imx-jpeg/Makefile
rename to drivers/media/platform/nxp/imx-jpeg/Makefile
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
similarity index 100%
rename from drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
rename to drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.c
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
similarity index 100%
rename from drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
rename to drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
similarity index 100%
rename from drivers/media/platform/imx-jpeg/mxc-jpeg.c
rename to drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
similarity index 100%
rename from drivers/media/platform/imx-jpeg/mxc-jpeg.h
rename to drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
similarity index 100%
rename from drivers/media/platform/imx/imx-mipi-csis.c
rename to drivers/media/platform/nxp/imx-mipi-csis.c
diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
index fd2e0c5a8953..9518e6dd794d 100644
--- a/drivers/media/platform/renesas/Makefile
+++ b/drivers/media/platform/renesas/Makefile
@@ -4,11 +4,12 @@
 #
 
 obj-y += rcar-vin/
+obj-y += vsp1/
 
-obj-$(CONFIG_VIDEO_RCAR_DRIF)		+= rcar_drif.o
-obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
-obj-$(CONFIG_VIDEO_RENESAS_CEU)		+= renesas-ceu.o
-obj-$(CONFIG_VIDEO_RENESAS_FCP)		+= rcar-fcp.o
-obj-$(CONFIG_VIDEO_RENESAS_FDP1)	+= rcar_fdp1.o
-obj-$(CONFIG_VIDEO_RENESAS_JPU)		+= rcar_jpu.o
-obj-$(CONFIG_VIDEO_SH_VOU)		+= sh_vou.o
+obj-$(CONFIG_VIDEO_RCAR_DRIF) += rcar_drif.o
+obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
+obj-$(CONFIG_VIDEO_RENESAS_CEU) += renesas-ceu.o
+obj-$(CONFIG_VIDEO_RENESAS_FCP) += rcar-fcp.o
+obj-$(CONFIG_VIDEO_RENESAS_FDP1) += rcar_fdp1.o
+obj-$(CONFIG_VIDEO_RENESAS_JPU) += rcar_jpu.o
+obj-$(CONFIG_VIDEO_SH_VOU) += sh_vou.o
diff --git a/drivers/media/platform/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
similarity index 100%
rename from drivers/media/platform/vsp1/Makefile
rename to drivers/media/platform/renesas/vsp1/Makefile
diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1.h
rename to drivers/media/platform/renesas/vsp1/vsp1.h
diff --git a/drivers/media/platform/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_brx.c
rename to drivers/media/platform/renesas/vsp1/vsp1_brx.c
diff --git a/drivers/media/platform/vsp1/vsp1_brx.h b/drivers/media/platform/renesas/vsp1/vsp1_brx.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_brx.h
rename to drivers/media/platform/renesas/vsp1/vsp1_brx.h
diff --git a/drivers/media/platform/vsp1/vsp1_clu.c b/drivers/media/platform/renesas/vsp1/vsp1_clu.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_clu.c
rename to drivers/media/platform/renesas/vsp1/vsp1_clu.c
diff --git a/drivers/media/platform/vsp1/vsp1_clu.h b/drivers/media/platform/renesas/vsp1/vsp1_clu.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_clu.h
rename to drivers/media/platform/renesas/vsp1/vsp1_clu.h
diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_dl.c
rename to drivers/media/platform/renesas/vsp1/vsp1_dl.c
diff --git a/drivers/media/platform/vsp1/vsp1_dl.h b/drivers/media/platform/renesas/vsp1/vsp1_dl.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_dl.h
rename to drivers/media/platform/renesas/vsp1/vsp1_dl.h
diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_drm.c
rename to drivers/media/platform/renesas/vsp1/vsp1_drm.c
diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_drm.h
rename to drivers/media/platform/renesas/vsp1/vsp1_drm.h
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_drv.c
rename to drivers/media/platform/renesas/vsp1/vsp1_drv.c
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_entity.c
rename to drivers/media/platform/renesas/vsp1/vsp1_entity.c
diff --git a/drivers/media/platform/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_entity.h
rename to drivers/media/platform/renesas/vsp1/vsp1_entity.h
diff --git a/drivers/media/platform/vsp1/vsp1_hgo.c b/drivers/media/platform/renesas/vsp1/vsp1_hgo.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hgo.c
rename to drivers/media/platform/renesas/vsp1/vsp1_hgo.c
diff --git a/drivers/media/platform/vsp1/vsp1_hgo.h b/drivers/media/platform/renesas/vsp1/vsp1_hgo.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hgo.h
rename to drivers/media/platform/renesas/vsp1/vsp1_hgo.h
diff --git a/drivers/media/platform/vsp1/vsp1_hgt.c b/drivers/media/platform/renesas/vsp1/vsp1_hgt.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hgt.c
rename to drivers/media/platform/renesas/vsp1/vsp1_hgt.c
diff --git a/drivers/media/platform/vsp1/vsp1_hgt.h b/drivers/media/platform/renesas/vsp1/vsp1_hgt.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hgt.h
rename to drivers/media/platform/renesas/vsp1/vsp1_hgt.h
diff --git a/drivers/media/platform/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_histo.c
rename to drivers/media/platform/renesas/vsp1/vsp1_histo.c
diff --git a/drivers/media/platform/vsp1/vsp1_histo.h b/drivers/media/platform/renesas/vsp1/vsp1_histo.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_histo.h
rename to drivers/media/platform/renesas/vsp1/vsp1_histo.h
diff --git a/drivers/media/platform/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hsit.c
rename to drivers/media/platform/renesas/vsp1/vsp1_hsit.c
diff --git a/drivers/media/platform/vsp1/vsp1_hsit.h b/drivers/media/platform/renesas/vsp1/vsp1_hsit.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_hsit.h
rename to drivers/media/platform/renesas/vsp1/vsp1_hsit.h
diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_lif.c
rename to drivers/media/platform/renesas/vsp1/vsp1_lif.c
diff --git a/drivers/media/platform/vsp1/vsp1_lif.h b/drivers/media/platform/renesas/vsp1/vsp1_lif.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_lif.h
rename to drivers/media/platform/renesas/vsp1/vsp1_lif.h
diff --git a/drivers/media/platform/vsp1/vsp1_lut.c b/drivers/media/platform/renesas/vsp1/vsp1_lut.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_lut.c
rename to drivers/media/platform/renesas/vsp1/vsp1_lut.c
diff --git a/drivers/media/platform/vsp1/vsp1_lut.h b/drivers/media/platform/renesas/vsp1/vsp1_lut.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_lut.h
rename to drivers/media/platform/renesas/vsp1/vsp1_lut.h
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_pipe.c
rename to drivers/media/platform/renesas/vsp1/vsp1_pipe.c
diff --git a/drivers/media/platform/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_pipe.h
rename to drivers/media/platform/renesas/vsp1/vsp1_pipe.h
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_regs.h
rename to drivers/media/platform/renesas/vsp1/vsp1_regs.h
diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_rpf.c
rename to drivers/media/platform/renesas/vsp1/vsp1_rpf.c
diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_rwpf.c
rename to drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.h b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_rwpf.h
rename to drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
diff --git a/drivers/media/platform/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_sru.c
rename to drivers/media/platform/renesas/vsp1/vsp1_sru.c
diff --git a/drivers/media/platform/vsp1/vsp1_sru.h b/drivers/media/platform/renesas/vsp1/vsp1_sru.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_sru.h
rename to drivers/media/platform/renesas/vsp1/vsp1_sru.h
diff --git a/drivers/media/platform/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_uds.c
rename to drivers/media/platform/renesas/vsp1/vsp1_uds.c
diff --git a/drivers/media/platform/vsp1/vsp1_uds.h b/drivers/media/platform/renesas/vsp1/vsp1_uds.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_uds.h
rename to drivers/media/platform/renesas/vsp1/vsp1_uds.h
diff --git a/drivers/media/platform/vsp1/vsp1_uif.c b/drivers/media/platform/renesas/vsp1/vsp1_uif.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_uif.c
rename to drivers/media/platform/renesas/vsp1/vsp1_uif.c
diff --git a/drivers/media/platform/vsp1/vsp1_uif.h b/drivers/media/platform/renesas/vsp1/vsp1_uif.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_uif.h
rename to drivers/media/platform/renesas/vsp1/vsp1_uif.h
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_video.c
rename to drivers/media/platform/renesas/vsp1/vsp1_video.c
diff --git a/drivers/media/platform/vsp1/vsp1_video.h b/drivers/media/platform/renesas/vsp1/vsp1_video.h
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_video.h
rename to drivers/media/platform/renesas/vsp1/vsp1_video.h
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
similarity index 100%
rename from drivers/media/platform/vsp1/vsp1_wpf.c
rename to drivers/media/platform/renesas/vsp1/vsp1_wpf.c
diff --git a/drivers/media/platform/via/Makefile b/drivers/media/platform/via/Makefile
index e5cd95d27523..a5c04c825840 100644
--- a/drivers/media/platform/via/Makefile
+++ b/drivers/media/platform/via/Makefile
@@ -1 +1,2 @@
-obj-$(CONFIG_VIDEO_VIA_CAMERA)		+= via-camera.o
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_VIA_CAMERA) += via-camera.o
diff --git a/drivers/media/radio/Makefile b/drivers/media/radio/Makefile
index 615070803429..cfb6af7d3bc3 100644
--- a/drivers/media/radio/Makefile
+++ b/drivers/media/radio/Makefile
@@ -5,7 +5,8 @@
 
 shark2-objs := radio-shark2.o radio-tea5777.o
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_RADIO_AZTECH) += radio-aztech.o
 obj-$(CONFIG_RADIO_CADET) += radio-cadet.o
 obj-$(CONFIG_RADIO_GEMTEK) += radio-gemtek.o
diff --git a/drivers/media/rc/Makefile b/drivers/media/rc/Makefile
index be8657391f74..a9285266e944 100644
--- a/drivers/media/rc/Makefile
+++ b/drivers/media/rc/Makefile
@@ -9,7 +9,8 @@ rc-core-$(CONFIG_BPF_LIRC_MODE2) += bpf-lirc.o
 
 obj-$(CONFIG_RC_CORE) += rc-core.o
 
-# IR decoders - please keep it alphabetically sorted
+# IR decoders - please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_IR_IMON_DECODER) += ir-imon-decoder.o
 obj-$(CONFIG_IR_JVC_DECODER) += ir-jvc-decoder.o
 obj-$(CONFIG_IR_MCE_KBD_DECODER) += ir-mce_kbd-decoder.o
@@ -22,7 +23,8 @@ obj-$(CONFIG_IR_SHARP_DECODER) += ir-sharp-decoder.o
 obj-$(CONFIG_IR_SONY_DECODER) += ir-sony-decoder.o
 obj-$(CONFIG_IR_XMP_DECODER) += ir-xmp-decoder.o
 
-# stand-alone IR receivers/transmitters  - please keep it alphabetically sorted
+# stand-alone IR receivers/transmitters  - please keep it alphabetically
+# sorted by Kconfig name (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_IR_ENE) += ene_ir.o
 obj-$(CONFIG_IR_FINTEK) += fintek-cir.o
 obj-$(CONFIG_IR_GPIO_CIR) += gpio-ir-recv.o
diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps/Makefile
index a7e34ed39424..f513ff5caf4e 100644
--- a/drivers/media/rc/keymaps/Makefile
+++ b/drivers/media/rc/keymaps/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# Please keep keymaps alphabetically sorted
+# Please keep keymaps alphabetically sorted by directory name
+#(e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_RC_MAP) += \
 			rc-adstech-dvb-t-pci.o \
 			rc-alink-dtu-m.o \
diff --git a/drivers/media/spi/Makefile b/drivers/media/spi/Makefile
index 3c7c67cd048e..6ac7adc64124 100644
--- a/drivers/media/spi/Makefile
+++ b/drivers/media/spi/Makefile
@@ -2,5 +2,7 @@
 
 ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/cxd2880
 
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_CXD2880_SPI_DRV) += cxd2880-spi.o
 obj-$(CONFIG_VIDEO_GS1662) += gs1662.o
diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
index b0951a57dcc0..ff390b687189 100644
--- a/drivers/media/test-drivers/Makefile
+++ b/drivers/media/test-drivers/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the test drivers.
 #
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 
 obj-$(CONFIG_DVB_VIDTV) += vidtv/
 
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index 3657e89acdd1..bd350a285aad 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -6,8 +6,8 @@
 ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
 tda18271-objs := tda18271-maps.o tda18271-common.o tda18271-fe.o
 
-# Please keep it alphabetically sorted
-
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_MEDIA_TUNER_E4000) += e4000.o
 obj-$(CONFIG_MEDIA_TUNER_FC0011) += fc0011.o
 obj-$(CONFIG_MEDIA_TUNER_FC0012) += fc0012.o
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index f3daa71e8396..044bd46c799c 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -3,11 +3,20 @@
 # Makefile for the USB media device drivers
 #
 
-# DVB USB-only drivers
-obj-y += ttusb-dec/ ttusb-budget/ dvb-usb/ dvb-usb-v2/ siano/ b2c2/
-obj-y += zr364xx/ stkwebcam/ s2255/
+# DVB USB-only drivers. Please keep it alphabetically sorted by directory name
+# (e. g. LC_ALL=C sort Makefile)
+obj-y += b2c2/
+obj-y += dvb-usb/
+obj-y += dvb-usb-v2/
+obj-y += s2255/
+obj-y += siano/
+obj-y += stkwebcam/
+obj-y += ttusb-budget/
+obj-y += ttusb-dec/
+obj-y += zr364xx/
 
-# Please keep it alphabetically sorted
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 obj-$(CONFIG_DVB_AS102) += as102/
 obj-$(CONFIG_USB_AIRSPY) += airspy/
 obj-$(CONFIG_USB_GSPCA) += gspca/
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index b7440f0a6710..1ec7e9cae1fa 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -13,12 +13,17 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 
+# Please keep it alphabetically sorted by Kconfig name
+# (e. g. LC_ALL=C sort Makefile)
+
 obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o




