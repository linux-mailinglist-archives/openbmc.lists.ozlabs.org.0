Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA74D905C
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:30:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXp21x3Rz3085
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:30:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fltQenL+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fltQenL+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGc1r15Djz2xgb;
 Sun, 13 Mar 2022 21:52:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13E75B80CBE;
 Sun, 13 Mar 2022 10:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273E0C340EC;
 Sun, 13 Mar 2022 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647168729;
 bh=WCgJLNmJn89eRx4DwYQ1y4Yv2DkBnoc9GfKMP4+ftaE=;
 h=From:To:Cc:Subject:Date:From;
 b=fltQenL+s7whS4KfDypncBtCKglPAwvKNeKOIa55jx+4x7u5IMUX9wZpU5BKSu7o9
 h5SUIsbdvl9sy+0f3wh2qsAJI+tk55CrkdITmU0p9JKM0kZmlg+XcH9hN6UBiCSsBj
 tge4Ol25DxUe13jOexqaOd6qY56IDnRgRxjjkL6WFHc7jOVbyxzYG981+i6VwM5+di
 yfT3N8DTDSa4CjfYneghWfMNHjxIkZ601CvlkT0lqq0pC013QMeuf5DcKDpSszYF1O
 5LTAc0Pj1enri7qlKn/+r+B8jIsFI24m/SDRuj86tVy8Ooq/eRklN6j5FwUFKiWDw+
 mp+CSsSoMUcag==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nTLpW-001I1F-LH; Sun, 13 Mar 2022 11:52:06 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 00/24] Organize media platform drivers per manufacturer
Date: Sun, 13 Mar 2022 11:51:41 +0100
Message-Id: <cover.1647167750.git.mchehab@kernel.org>
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Yong Deng <yong.deng@magewell.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Michael Tretter <m.tretter@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series comes after the one I sent earlier today sorting media/platform Makefile and Kconfig.

It basically groups all drivers per vendor, ensuring that each vendor has a Makefile/Kconfig
pair.

The end goal is to keep the platform Makefile/Kconfig clean and easier to maintain, less
prune to errors. After applying both series, the size of such files were drastically reduced:

	 drivers/media/platform/Kconfig  |  731 ++------------------------------
	 drivers/media/platform/Makefile |  115 +----
	 2 files changed, 78 insertions(+), 768 deletions(-)

Mauro Carvalho Chehab (24):
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
  media: platform/*/Kconfig: make menus more uniform

 Documentation/admin-guide/media/fimc.rst      |  2 +-
 Documentation/admin-guide/media/omap3isp.rst  |  2 +-
 .../admin-guide/media/omap4_camera.rst        |  2 +-
 .../media/drivers/davinci-vpbe-devel.rst      | 20 ++++----
 .../driver-api/media/drivers/fimc-devel.rst   | 14 +++---
 Documentation/driver-api/media/v4l2-event.rst |  2 +-
 MAINTAINERS                                   | 48 +++++++++----------
 drivers/media/platform/Kconfig                | 30 ++++--------
 drivers/media/platform/Makefile               | 41 +++++-----------
 drivers/media/platform/allegro-dvt/Kconfig    |  3 ++
 drivers/media/platform/allwinner/Kconfig      |  6 +++
 .../platform/{sunxi => allwinner}/Makefile    |  0
 .../{sunxi => allwinner}/sun4i-csi/Kconfig    |  0
 .../{sunxi => allwinner}/sun4i-csi/Makefile   |  0
 .../sun4i-csi/sun4i_csi.c                     |  0
 .../sun4i-csi/sun4i_csi.h                     |  0
 .../sun4i-csi/sun4i_dma.c                     |  0
 .../sun4i-csi/sun4i_v4l2.c                    |  0
 .../{sunxi => allwinner}/sun6i-csi/Kconfig    |  0
 .../{sunxi => allwinner}/sun6i-csi/Makefile   |  0
 .../sun6i-csi/sun6i_csi.c                     |  0
 .../sun6i-csi/sun6i_csi.h                     |  0
 .../sun6i-csi/sun6i_csi_reg.h                 |  0
 .../sun6i-csi/sun6i_video.c                   |  0
 .../sun6i-csi/sun6i_video.h                   |  0
 .../{sunxi => allwinner}/sun8i-di/Kconfig     |  0
 .../{sunxi => allwinner}/sun8i-di/Makefile    |  0
 .../{sunxi => allwinner}/sun8i-di/sun8i-di.c  |  0
 .../{sunxi => allwinner}/sun8i-di/sun8i-di.h  |  0
 .../{sunxi => allwinner}/sun8i-rotate/Kconfig |  0
 .../sun8i-rotate/Makefile                     |  0
 .../sun8i-rotate/sun8i-formats.h              |  0
 .../sun8i-rotate/sun8i-rotate.h               |  0
 .../sun8i-rotate/sun8i_formats.c              |  0
 .../sun8i-rotate/sun8i_rotate.c               |  0
 drivers/media/platform/amlogic/Kconfig        |  5 ++
 drivers/media/platform/amlogic/Makefile       |  2 +
 .../ge2d => amlogic/meson-ge2d}/Kconfig       |  0
 .../ge2d => amlogic/meson-ge2d}/Makefile      |  0
 .../ge2d => amlogic/meson-ge2d}/ge2d-regs.h   |  0
 .../{meson/ge2d => amlogic/meson-ge2d}/ge2d.c |  0
 drivers/media/platform/aspeed/Kconfig         |  3 ++
 drivers/media/platform/atmel/Kconfig          |  3 ++
 drivers/media/platform/cadence/Kconfig        | 13 +----
 .../platform/{coda => chips-media}/Kconfig    |  3 ++
 .../platform/{coda => chips-media}/Makefile   |  0
 .../platform/{coda => chips-media}/coda-bit.c |  0
 .../{coda => chips-media}/coda-common.c       |  0
 .../platform/{coda => chips-media}/coda-gdi.c |  0
 .../{coda => chips-media}/coda-h264.c         |  0
 .../{coda => chips-media}/coda-jpeg.c         |  0
 .../{coda => chips-media}/coda-mpeg2.c        |  0
 .../{coda => chips-media}/coda-mpeg4.c        |  0
 .../platform/{coda => chips-media}/coda.h     |  0
 .../{coda => chips-media}/coda_regs.h         |  2 +-
 .../platform/{coda => chips-media}/imx-vdoa.c |  0
 .../platform/{coda => chips-media}/imx-vdoa.h |  0
 .../platform/{coda => chips-media}/trace.h    |  2 +-
 drivers/media/platform/intel/Kconfig          |  3 ++
 .../{marvell-ccic => marvell}/Kconfig         |  3 ++
 .../{marvell-ccic => marvell}/Makefile        |  0
 .../{marvell-ccic => marvell}/cafe-driver.c   |  0
 .../{marvell-ccic => marvell}/mcam-core.c     |  0
 .../{marvell-ccic => marvell}/mcam-core.h     |  0
 .../{marvell-ccic => marvell}/mmp-driver.c    |  0
 drivers/media/platform/mediatek/Kconfig       |  8 ++++
 drivers/media/platform/mediatek/Makefile      |  5 ++
 .../platform/{ => mediatek}/mtk-jpeg/Kconfig  |  0
 .../platform/{ => mediatek}/mtk-jpeg/Makefile |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_core.c   |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_core.h   |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.c |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_dec_hw.h |  0
 .../mtk-jpeg/mtk_jpeg_dec_parse.c             |  0
 .../mtk-jpeg/mtk_jpeg_dec_parse.h             |  0
 .../mtk-jpeg/mtk_jpeg_dec_reg.h               |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.c |  0
 .../{ => mediatek}/mtk-jpeg/mtk_jpeg_enc_hw.h |  0
 .../platform/{ => mediatek}/mtk-mdp/Kconfig   |  0
 .../platform/{ => mediatek}/mtk-mdp/Makefile  |  2 +-
 .../{ => mediatek}/mtk-mdp/mtk_mdp_comp.c     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_comp.h     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_core.c     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_core.h     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_ipi.h      |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_m2m.c      |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_m2m.h      |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_regs.c     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_regs.h     |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_vpu.c      |  0
 .../{ => mediatek}/mtk-mdp/mtk_mdp_vpu.h      |  0
 .../{ => mediatek}/mtk-vcodec/Kconfig         |  0
 .../{ => mediatek}/mtk-vcodec/Makefile        |  0
 .../mtk-vcodec/mtk_vcodec_dec.c               |  0
 .../mtk-vcodec/mtk_vcodec_dec.h               |  0
 .../mtk-vcodec/mtk_vcodec_dec_drv.c           |  0
 .../mtk-vcodec/mtk_vcodec_dec_hw.c            |  0
 .../mtk-vcodec/mtk_vcodec_dec_hw.h            |  0
 .../mtk-vcodec/mtk_vcodec_dec_pm.c            |  0
 .../mtk-vcodec/mtk_vcodec_dec_pm.h            |  0
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  0
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  0
 .../mtk-vcodec/mtk_vcodec_drv.h               |  0
 .../mtk-vcodec/mtk_vcodec_enc.c               |  0
 .../mtk-vcodec/mtk_vcodec_enc.h               |  0
 .../mtk-vcodec/mtk_vcodec_enc_drv.c           |  0
 .../mtk-vcodec/mtk_vcodec_enc_pm.c            |  0
 .../mtk-vcodec/mtk_vcodec_enc_pm.h            |  0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.c |  0
 .../{ => mediatek}/mtk-vcodec/mtk_vcodec_fw.h |  0
 .../mtk-vcodec/mtk_vcodec_fw_priv.h           |  0
 .../mtk-vcodec/mtk_vcodec_fw_scp.c            |  0
 .../mtk-vcodec/mtk_vcodec_fw_vpu.c            |  0
 .../mtk-vcodec/mtk_vcodec_intr.c              |  0
 .../mtk-vcodec/mtk_vcodec_intr.h              |  0
 .../mtk-vcodec/mtk_vcodec_util.c              |  0
 .../mtk-vcodec/mtk_vcodec_util.h              |  0
 .../mtk-vcodec/vdec/vdec_h264_if.c            |  0
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        |  0
 .../mtk-vcodec/vdec/vdec_vp8_if.c             |  0
 .../mtk-vcodec/vdec/vdec_vp9_if.c             |  0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_base.h |  0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_if.c   |  0
 .../{ => mediatek}/mtk-vcodec/vdec_drv_if.h   |  0
 .../{ => mediatek}/mtk-vcodec/vdec_ipi_msg.h  |  0
 .../mtk-vcodec/vdec_msg_queue.c               |  0
 .../mtk-vcodec/vdec_msg_queue.h               |  0
 .../{ => mediatek}/mtk-vcodec/vdec_vpu_if.c   |  0
 .../{ => mediatek}/mtk-vcodec/vdec_vpu_if.h   |  0
 .../mtk-vcodec/venc/venc_h264_if.c            |  0
 .../mtk-vcodec/venc/venc_vp8_if.c             |  0
 .../{ => mediatek}/mtk-vcodec/venc_drv_base.h |  0
 .../{ => mediatek}/mtk-vcodec/venc_drv_if.c   |  0
 .../{ => mediatek}/mtk-vcodec/venc_drv_if.h   |  0
 .../{ => mediatek}/mtk-vcodec/venc_ipi_msg.h  |  0
 .../{ => mediatek}/mtk-vcodec/venc_vpu_if.c   |  0
 .../{ => mediatek}/mtk-vcodec/venc_vpu_if.h   |  0
 .../platform/{ => mediatek}/mtk-vpu/Kconfig   |  0
 .../platform/{ => mediatek}/mtk-vpu/Makefile  |  0
 .../platform/{ => mediatek}/mtk-vpu/mtk_vpu.c |  0
 .../platform/{ => mediatek}/mtk-vpu/mtk_vpu.h |  0
 drivers/media/platform/nvidia/Kconfig         |  5 ++
 .../{tegra/vde => nvidia/tegra-vde}/Kconfig   |  0
 .../{tegra/vde => nvidia/tegra-vde}/Makefile  |  0
 .../vde => nvidia/tegra-vde}/dmabuf-cache.c   |  0
 .../{tegra/vde => nvidia/tegra-vde}/h264.c    |  0
 .../{tegra/vde => nvidia/tegra-vde}/iommu.c   |  0
 .../{tegra/vde => nvidia/tegra-vde}/trace.h   |  2 +-
 .../{tegra/vde => nvidia/tegra-vde}/v4l2.c    |  0
 .../{tegra/vde => nvidia/tegra-vde}/vde.c     |  0
 .../{tegra/vde => nvidia/tegra-vde}/vde.h     |  0
 drivers/media/platform/nxp/Kconfig            | 23 +++------
 drivers/media/platform/nxp/Makefile           |  1 +
 .../media/platform/{ => nxp}/amphion/Kconfig  |  0
 .../media/platform/{ => nxp}/amphion/Makefile |  0
 .../media/platform/{ => nxp}/amphion/vdec.c   |  0
 .../media/platform/{ => nxp}/amphion/venc.c   |  0
 .../media/platform/{ => nxp}/amphion/vpu.h    |  0
 .../platform/{ => nxp}/amphion/vpu_cmds.c     |  0
 .../platform/{ => nxp}/amphion/vpu_cmds.h     |  0
 .../platform/{ => nxp}/amphion/vpu_codec.h    |  0
 .../platform/{ => nxp}/amphion/vpu_color.c    |  0
 .../platform/{ => nxp}/amphion/vpu_core.c     |  0
 .../platform/{ => nxp}/amphion/vpu_core.h     |  0
 .../platform/{ => nxp}/amphion/vpu_dbg.c      |  0
 .../platform/{ => nxp}/amphion/vpu_defs.h     |  0
 .../platform/{ => nxp}/amphion/vpu_drv.c      |  0
 .../platform/{ => nxp}/amphion/vpu_helpers.c  |  0
 .../platform/{ => nxp}/amphion/vpu_helpers.h  |  0
 .../platform/{ => nxp}/amphion/vpu_imx8q.c    |  0
 .../platform/{ => nxp}/amphion/vpu_imx8q.h    |  0
 .../platform/{ => nxp}/amphion/vpu_malone.c   |  0
 .../platform/{ => nxp}/amphion/vpu_malone.h   |  0
 .../platform/{ => nxp}/amphion/vpu_mbox.c     |  0
 .../platform/{ => nxp}/amphion/vpu_mbox.h     |  0
 .../platform/{ => nxp}/amphion/vpu_msgs.c     |  0
 .../platform/{ => nxp}/amphion/vpu_msgs.h     |  0
 .../platform/{ => nxp}/amphion/vpu_rpc.c      |  0
 .../platform/{ => nxp}/amphion/vpu_rpc.h      |  0
 .../platform/{ => nxp}/amphion/vpu_v4l2.c     |  0
 .../platform/{ => nxp}/amphion/vpu_v4l2.h     |  0
 .../platform/{ => nxp}/amphion/vpu_windsor.c  |  0
 .../platform/{ => nxp}/amphion/vpu_windsor.h  |  0
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    |  2 +-
 drivers/media/platform/qcom/Kconfig           |  3 ++
 drivers/media/platform/qcom/Makefile          |  3 ++
 drivers/media/platform/renesas/Kconfig        |  2 +
 drivers/media/platform/renesas/rcar_jpu.c     |  2 +-
 drivers/media/platform/rockchip/Kconfig       |  3 ++
 drivers/media/platform/rockchip/Makefile      |  3 ++
 drivers/media/platform/samsung/Kconfig        | 10 ++++
 drivers/media/platform/samsung/Makefile       |  7 +++
 .../platform/{ => samsung}/exynos-gsc/Kconfig |  0
 .../{ => samsung}/exynos-gsc/Makefile         |  0
 .../{ => samsung}/exynos-gsc/gsc-core.c       |  0
 .../{ => samsung}/exynos-gsc/gsc-core.h       |  0
 .../{ => samsung}/exynos-gsc/gsc-m2m.c        |  0
 .../{ => samsung}/exynos-gsc/gsc-regs.c       |  0
 .../{ => samsung}/exynos-gsc/gsc-regs.h       |  0
 .../platform/{ => samsung}/exynos4-is/Kconfig |  0
 .../{ => samsung}/exynos4-is/Makefile         |  0
 .../{ => samsung}/exynos4-is/common.c         |  0
 .../{ => samsung}/exynos4-is/common.h         |  0
 .../{ => samsung}/exynos4-is/fimc-capture.c   |  0
 .../{ => samsung}/exynos4-is/fimc-core.c      |  0
 .../{ => samsung}/exynos4-is/fimc-core.h      |  0
 .../exynos4-is/fimc-is-command.h              |  0
 .../{ => samsung}/exynos4-is/fimc-is-errno.c  |  0
 .../{ => samsung}/exynos4-is/fimc-is-errno.h  |  0
 .../{ => samsung}/exynos4-is/fimc-is-i2c.c    |  0
 .../{ => samsung}/exynos4-is/fimc-is-i2c.h    |  0
 .../{ => samsung}/exynos4-is/fimc-is-param.c  |  0
 .../{ => samsung}/exynos4-is/fimc-is-param.h  |  0
 .../{ => samsung}/exynos4-is/fimc-is-regs.c   |  0
 .../{ => samsung}/exynos4-is/fimc-is-regs.h   |  0
 .../{ => samsung}/exynos4-is/fimc-is-sensor.c |  0
 .../{ => samsung}/exynos4-is/fimc-is-sensor.h |  0
 .../{ => samsung}/exynos4-is/fimc-is.c        |  0
 .../{ => samsung}/exynos4-is/fimc-is.h        |  0
 .../{ => samsung}/exynos4-is/fimc-isp-video.c |  0
 .../{ => samsung}/exynos4-is/fimc-isp-video.h |  0
 .../{ => samsung}/exynos4-is/fimc-isp.c       |  0
 .../{ => samsung}/exynos4-is/fimc-isp.h       |  0
 .../{ => samsung}/exynos4-is/fimc-lite-reg.c  |  0
 .../{ => samsung}/exynos4-is/fimc-lite-reg.h  |  0
 .../{ => samsung}/exynos4-is/fimc-lite.c      |  0
 .../{ => samsung}/exynos4-is/fimc-lite.h      |  0
 .../{ => samsung}/exynos4-is/fimc-m2m.c       |  0
 .../{ => samsung}/exynos4-is/fimc-reg.c       |  0
 .../{ => samsung}/exynos4-is/fimc-reg.h       |  0
 .../{ => samsung}/exynos4-is/media-dev.c      |  0
 .../{ => samsung}/exynos4-is/media-dev.h      |  0
 .../{ => samsung}/exynos4-is/mipi-csis.c      |  0
 .../{ => samsung}/exynos4-is/mipi-csis.h      |  0
 .../platform/{ => samsung}/s3c-camif/Kconfig  |  0
 .../platform/{ => samsung}/s3c-camif/Makefile |  0
 .../{ => samsung}/s3c-camif/camif-capture.c   |  0
 .../{ => samsung}/s3c-camif/camif-core.c      |  0
 .../{ => samsung}/s3c-camif/camif-core.h      |  0
 .../{ => samsung}/s3c-camif/camif-regs.c      |  0
 .../{ => samsung}/s3c-camif/camif-regs.h      |  0
 .../platform/{ => samsung}/s5p-g2d/Kconfig    |  0
 .../platform/{ => samsung}/s5p-g2d/Makefile   |  0
 .../platform/{ => samsung}/s5p-g2d/g2d-hw.c   |  0
 .../platform/{ => samsung}/s5p-g2d/g2d-regs.h |  0
 .../platform/{ => samsung}/s5p-g2d/g2d.c      |  0
 .../platform/{ => samsung}/s5p-g2d/g2d.h      |  0
 .../platform/{ => samsung}/s5p-jpeg/Kconfig   |  0
 .../platform/{ => samsung}/s5p-jpeg/Makefile  |  0
 .../{ => samsung}/s5p-jpeg/jpeg-core.c        |  2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-core.h        |  2 +-
 .../s5p-jpeg/jpeg-hw-exynos3250.c             |  0
 .../s5p-jpeg/jpeg-hw-exynos3250.h             |  2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.c  |  0
 .../{ => samsung}/s5p-jpeg/jpeg-hw-exynos4.h  |  0
 .../{ => samsung}/s5p-jpeg/jpeg-hw-s5p.c      |  2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-hw-s5p.h      |  2 +-
 .../{ => samsung}/s5p-jpeg/jpeg-regs.h        |  2 +-
 .../platform/{ => samsung}/s5p-mfc/Kconfig    |  0
 .../platform/{ => samsung}/s5p-mfc/Makefile   |  0
 .../{ => samsung}/s5p-mfc/regs-mfc-v10.h      |  0
 .../{ => samsung}/s5p-mfc/regs-mfc-v6.h       |  0
 .../{ => samsung}/s5p-mfc/regs-mfc-v7.h       |  0
 .../{ => samsung}/s5p-mfc/regs-mfc-v8.h       |  0
 .../platform/{ => samsung}/s5p-mfc/regs-mfc.h |  0
 .../platform/{ => samsung}/s5p-mfc/s5p_mfc.c  |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd.c       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd.h       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.c    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v5.h    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.c    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_cmd_v6.h    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_common.h    |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_ctrl.c      |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_ctrl.h      |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_debug.h     |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_dec.c       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_dec.h       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_enc.c       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_enc.h       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_intr.c      |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_intr.h      |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_iommu.h     |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr.c       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr.h       |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.c    |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v5.h    |  0
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.c    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_opr_v6.h    |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_pm.c        |  2 +-
 .../{ => samsung}/s5p-mfc/s5p_mfc_pm.h        |  2 +-
 drivers/media/platform/sti/Kconfig            |  4 ++
 drivers/media/platform/sti/Makefile           |  6 +++
 .../media/platform/{ => sti}/stm32/Kconfig    |  0
 .../media/platform/{ => sti}/stm32/Makefile   |  0
 .../platform/{ => sti}/stm32/dma2d/dma2d-hw.c |  0
 .../{ => sti}/stm32/dma2d/dma2d-regs.h        |  0
 .../platform/{ => sti}/stm32/dma2d/dma2d.c    |  0
 .../platform/{ => sti}/stm32/dma2d/dma2d.h    |  0
 .../platform/{ => sti}/stm32/stm32-dcmi.c     |  0
 drivers/media/platform/sunxi/Kconfig          |  6 ---
 drivers/media/platform/ti/Kconfig             |  9 ++++
 drivers/media/platform/ti/Makefile            |  6 +++
 .../media/platform/{ => ti}/am437x/Kconfig    |  0
 .../media/platform/{ => ti}/am437x/Makefile   |  0
 .../platform/{ => ti}/am437x/am437x-vpfe.c    |  0
 .../platform/{ => ti}/am437x/am437x-vpfe.h    |  0
 .../{ => ti}/am437x/am437x-vpfe_regs.h        |  0
 .../media/platform/{ => ti}/davinci/Kconfig   |  0
 .../media/platform/{ => ti}/davinci/Makefile  |  0
 .../{ => ti}/davinci/ccdc_hw_device.h         |  0
 .../platform/{ => ti}/davinci/dm355_ccdc.c    |  0
 .../{ => ti}/davinci/dm355_ccdc_regs.h        |  0
 .../platform/{ => ti}/davinci/dm644x_ccdc.c   |  0
 .../{ => ti}/davinci/dm644x_ccdc_regs.h       |  0
 .../media/platform/{ => ti}/davinci/isif.c    |  0
 .../platform/{ => ti}/davinci/isif_regs.h     |  0
 .../media/platform/{ => ti}/davinci/vpbe.c    |  0
 .../platform/{ => ti}/davinci/vpbe_display.c  |  0
 .../platform/{ => ti}/davinci/vpbe_osd.c      |  0
 .../platform/{ => ti}/davinci/vpbe_osd_regs.h |  0
 .../platform/{ => ti}/davinci/vpbe_venc.c     |  0
 .../{ => ti}/davinci/vpbe_venc_regs.h         |  0
 .../platform/{ => ti}/davinci/vpfe_capture.c  |  0
 .../media/platform/{ => ti}/davinci/vpif.c    |  0
 .../media/platform/{ => ti}/davinci/vpif.h    |  0
 .../platform/{ => ti}/davinci/vpif_capture.c  |  0
 .../platform/{ => ti}/davinci/vpif_capture.h  |  0
 .../platform/{ => ti}/davinci/vpif_display.c  |  0
 .../platform/{ => ti}/davinci/vpif_display.h  |  0
 .../media/platform/{ => ti}/davinci/vpss.c    |  0
 drivers/media/platform/{ => ti}/omap/Kconfig  |  0
 drivers/media/platform/{ => ti}/omap/Makefile |  0
 .../media/platform/{ => ti}/omap/omap_vout.c  |  0
 .../platform/{ => ti}/omap/omap_vout_vrfb.c   |  0
 .../platform/{ => ti}/omap/omap_vout_vrfb.h   |  0
 .../platform/{ => ti}/omap/omap_voutdef.h     |  0
 .../platform/{ => ti}/omap/omap_voutlib.c     |  0
 .../platform/{ => ti}/omap/omap_voutlib.h     |  0
 .../media/platform/{ => ti}/omap3isp/Kconfig  |  0
 .../media/platform/{ => ti}/omap3isp/Makefile |  0
 .../{ => ti}/omap3isp/cfa_coef_table.h        |  0
 .../platform/{ => ti}/omap3isp/gamma_table.h  |  0
 .../media/platform/{ => ti}/omap3isp/isp.c    |  0
 .../media/platform/{ => ti}/omap3isp/isp.h    |  0
 .../platform/{ => ti}/omap3isp/ispccdc.c      |  0
 .../platform/{ => ti}/omap3isp/ispccdc.h      |  0
 .../platform/{ => ti}/omap3isp/ispccp2.c      |  0
 .../platform/{ => ti}/omap3isp/ispccp2.h      |  0
 .../platform/{ => ti}/omap3isp/ispcsi2.c      |  0
 .../platform/{ => ti}/omap3isp/ispcsi2.h      |  0
 .../platform/{ => ti}/omap3isp/ispcsiphy.c    |  0
 .../platform/{ => ti}/omap3isp/ispcsiphy.h    |  0
 .../media/platform/{ => ti}/omap3isp/isph3a.h |  0
 .../platform/{ => ti}/omap3isp/isph3a_aewb.c  |  0
 .../platform/{ => ti}/omap3isp/isph3a_af.c    |  0
 .../platform/{ => ti}/omap3isp/isphist.c      |  0
 .../platform/{ => ti}/omap3isp/isphist.h      |  0
 .../platform/{ => ti}/omap3isp/isppreview.c   |  0
 .../platform/{ => ti}/omap3isp/isppreview.h   |  0
 .../media/platform/{ => ti}/omap3isp/ispreg.h |  0
 .../platform/{ => ti}/omap3isp/ispresizer.c   |  0
 .../platform/{ => ti}/omap3isp/ispresizer.h   |  0
 .../platform/{ => ti}/omap3isp/ispstat.c      |  0
 .../platform/{ => ti}/omap3isp/ispstat.h      |  0
 .../platform/{ => ti}/omap3isp/ispvideo.c     |  0
 .../platform/{ => ti}/omap3isp/ispvideo.h     |  0
 .../{ => ti}/omap3isp/luma_enhance_table.h    |  0
 .../{ => ti}/omap3isp/noise_filter_table.h    |  0
 .../platform/{ => ti}/omap3isp/omap3isp.h     |  0
 .../media/platform/{ti-vpe => ti/vpe}/Kconfig |  0
 .../platform/{ti-vpe => ti/vpe}/Makefile      |  0
 .../{ti-vpe => ti/vpe}/cal-camerarx.c         |  0
 .../platform/{ti-vpe => ti/vpe}/cal-video.c   |  0
 .../media/platform/{ti-vpe => ti/vpe}/cal.c   |  0
 .../media/platform/{ti-vpe => ti/vpe}/cal.h   |  0
 .../platform/{ti-vpe => ti/vpe}/cal_regs.h    |  0
 .../media/platform/{ti-vpe => ti/vpe}/csc.c   |  0
 .../media/platform/{ti-vpe => ti/vpe}/csc.h   |  0
 .../media/platform/{ti-vpe => ti/vpe}/sc.c    |  0
 .../media/platform/{ti-vpe => ti/vpe}/sc.h    |  0
 .../platform/{ti-vpe => ti/vpe}/sc_coeff.h    |  0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.c |  0
 .../media/platform/{ti-vpe => ti/vpe}/vpdma.h |  0
 .../platform/{ti-vpe => ti/vpe}/vpdma_priv.h  |  0
 .../media/platform/{ti-vpe => ti/vpe}/vpe.c   |  0
 .../platform/{ti-vpe => ti/vpe}/vpe_regs.h    |  0
 drivers/media/platform/via/Kconfig            |  3 ++
 drivers/media/platform/xilinx/Kconfig         |  7 ++-
 389 files changed, 214 insertions(+), 167 deletions(-)
 create mode 100644 drivers/media/platform/allwinner/Kconfig
 rename drivers/media/platform/{sunxi => allwinner}/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_dma.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun4i-csi/sun4i_v4l2.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_csi_reg.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun6i-csi/sun6i_video.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-di/sun8i-di.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/Kconfig (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/Makefile (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-formats.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i-rotate.h (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_formats.c (100%)
 rename drivers/media/platform/{sunxi => allwinner}/sun8i-rotate/sun8i_rotate.c (100%)
 create mode 100644 drivers/media/platform/amlogic/Kconfig
 create mode 100644 drivers/media/platform/amlogic/Makefile
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Kconfig (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/Makefile (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d-regs.h (100%)
 rename drivers/media/platform/{meson/ge2d => amlogic/meson-ge2d}/ge2d.c (100%)
 rename drivers/media/platform/{coda => chips-media}/Kconfig (94%)
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
 rename drivers/media/platform/{marvell-ccic => marvell}/Kconfig (97%)
 rename drivers/media/platform/{marvell-ccic => marvell}/Makefile (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/cafe-driver.c (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mcam-core.c (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mcam-core.h (100%)
 rename drivers/media/platform/{marvell-ccic => marvell}/mmp-driver.c (100%)
 create mode 100644 drivers/media/platform/mediatek/Kconfig
 create mode 100644 drivers/media/platform/mediatek/Makefile
 rename drivers/media/platform/{ => mediatek}/mtk-jpeg/Kconfig (100%)
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
 rename drivers/media/platform/{ => mediatek}/mtk-mdp/Kconfig (100%)
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
 rename drivers/media/platform/{ => mediatek}/mtk-vcodec/Kconfig (100%)
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
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/Kconfig (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/Makefile (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.c (100%)
 rename drivers/media/platform/{ => mediatek}/mtk-vpu/mtk_vpu.h (100%)
 create mode 100644 drivers/media/platform/nvidia/Kconfig
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/Kconfig (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/Makefile (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/dmabuf-cache.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/h264.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/iommu.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/trace.h (97%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/v4l2.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/vde.c (100%)
 rename drivers/media/platform/{tegra/vde => nvidia/tegra-vde}/vde.h (100%)
 rename drivers/media/platform/{ => nxp}/amphion/Kconfig (100%)
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
 create mode 100644 drivers/media/platform/qcom/Makefile
 create mode 100644 drivers/media/platform/rockchip/Makefile
 create mode 100644 drivers/media/platform/samsung/Kconfig
 create mode 100644 drivers/media/platform/samsung/Makefile
 rename drivers/media/platform/{ => samsung}/exynos-gsc/Kconfig (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-core.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-core.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-m2m.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-regs.c (100%)
 rename drivers/media/platform/{ => samsung}/exynos-gsc/gsc-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/exynos4-is/Kconfig (100%)
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
 rename drivers/media/platform/{ => samsung}/s3c-camif/Kconfig (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-capture.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-core.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-core.h (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-regs.c (100%)
 rename drivers/media/platform/{ => samsung}/s3c-camif/camif-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/Kconfig (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/Makefile (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d-hw.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d-regs.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d.c (100%)
 rename drivers/media/platform/{ => samsung}/s5p-g2d/g2d.h (100%)
 rename drivers/media/platform/{ => samsung}/s5p-jpeg/Kconfig (100%)
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
 rename drivers/media/platform/{ => samsung}/s5p-mfc/Kconfig (100%)
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
 create mode 100644 drivers/media/platform/sti/Makefile
 rename drivers/media/platform/{ => sti}/stm32/Kconfig (100%)
 rename drivers/media/platform/{ => sti}/stm32/Makefile (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-hw.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d-regs.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.c (100%)
 rename drivers/media/platform/{ => sti}/stm32/dma2d/dma2d.h (100%)
 rename drivers/media/platform/{ => sti}/stm32/stm32-dcmi.c (100%)
 delete mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/ti/Kconfig
 create mode 100644 drivers/media/platform/ti/Makefile
 rename drivers/media/platform/{ => ti}/am437x/Kconfig (100%)
 rename drivers/media/platform/{ => ti}/am437x/Makefile (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe.c (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe.h (100%)
 rename drivers/media/platform/{ => ti}/am437x/am437x-vpfe_regs.h (100%)
 rename drivers/media/platform/{ => ti}/davinci/Kconfig (100%)
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
 rename drivers/media/platform/{ => ti}/omap/Kconfig (100%)
 rename drivers/media/platform/{ => ti}/omap/Makefile (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout_vrfb.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_vout_vrfb.h (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutdef.h (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutlib.c (100%)
 rename drivers/media/platform/{ => ti}/omap/omap_voutlib.h (100%)
 rename drivers/media/platform/{ => ti}/omap3isp/Kconfig (100%)
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
 rename drivers/media/platform/{ti-vpe => ti/vpe}/Kconfig (100%)
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

-- 
2.35.1


