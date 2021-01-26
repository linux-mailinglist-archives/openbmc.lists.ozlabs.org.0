Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 315AC304D6C
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 01:22:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQPSW29TGzDqcg
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 11:22:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HKlil30J; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ60j0xlmzDqw1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:45:51 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id y187so2634177wmd.3
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 04:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgDoxTkqCtX7qRFLVzIhqucftM+usnXCOOEJb4UlRps=;
 b=HKlil30JX5XDC2QgJygSa3PW1ij81XFJmGM9hvEgd+MqWPBopjh8B4oKb5p6/RTl/h
 YaGgR5dCEbp9kTHydbkyFjb9taaxXD4hQuvNkEZyQd/3V8QHbJVES2Xv/l9Q5W1MLlZ1
 o+5ldum3NNByprXng2exIICoLcvAOXxilOuG+GHw3raMicPEoV3QrdN0yfNBo+YaINvH
 8HW3ThaNd08HbLqjlaREB1k7zDeEt9pK1xx1Rxx1oRQqR6bahgrEmXEy0hlSW3RtU/at
 Ge0jATWRVhoSL7UT+EGH0cF0itZkbmoSLDC0gsIOe/xdljbJ/Xk8x7RBWBUCsNGtTAI+
 inBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HgDoxTkqCtX7qRFLVzIhqucftM+usnXCOOEJb4UlRps=;
 b=dyNR15Bm5NvICv1/gdVdi9NiNXvlefYifBxC8eF5Kyk1TZvxlMrt8DGn2XIUdQsSq9
 d2fEzmFcrelIAutEn9tctH4tCwdLq2qtQG2eGK9Sbm2QoOSOBVMmqLw4NcFL/5epTRXi
 eY4dTZs/pBAkURPNHplNZG5R0ysNRB649Y9t393LHrGaEwmOHvrFe7ttXh5BvHt7kSG/
 w5H5HN0N/+GYtzEZRLDadlG/F1SjSLWt9shfVYq3OngpxIrHskOv0MSxIbCFijNDi1XF
 IWrob+INzFWGu7sT/c4gisZhqEKeEBdZ4yn77BpUULYZ3oynXfQvjtRLyEgfnOz6m2FI
 vm5w==
X-Gm-Message-State: AOAM532d/JpTtP9FKSXbVf67oFBItOOPkcTJzIVJyhWKmOZdSYVeBNoD
 nT182PPFuJ4KP0jO7GwI26raUw==
X-Google-Smtp-Source: ABdhPJw3EEAAvcpTE1X6uWF7W1nwVVyQMNjGyt1XrFtc8unQRk9L1XWmIU+HRd62tLEG3E2YvY6hIA==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr4437355wma.35.1611665144908; 
 Tue, 26 Jan 2021 04:45:44 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 04:45:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
Date: Tue, 26 Jan 2021 12:45:19 +0000
Message-Id: <20210126124540.3320214-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Jan 2021 11:19:02 +1100
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
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Kumar <rajeev-dlh.kumar@st.com>, Jan Kotas <jank@cadence.com>,
 Russell King <linux@armlinux.org.uk>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
 Viresh Kumar <vireshk@kernel.org>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Loc Ho <lho@apm.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Woodruff <r-woodruff2@ti.com>, Tali Perry <tali.perry1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Tero Kristo <kristo@kernel.org>,
 Rajan Vaja <rajan.vaja@xilinx.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the last set.  Clock is clean after this.

Lee Jones (21):
  clk: zynq: pll: Fix kernel-doc formatting in 'clk_register_zynq_pll's
    header
  clk: ti: clkt_dpll: Fix some kernel-doc misdemeanours
  clk: ti: dpll3xxx: Fix some kernel-doc headers and promote other
    worthy ones
  clk: qcom: clk-regmap: Provide missing description for
    'devm_clk_register_regmap()'s dev param
  clk: sunxi: clk-sun9i-core: Demote non-conformant kernel-doc headers
  clk: sunxi: clk-usb: Demote obvious kernel-doc abuse
  clk: tegra: clk-tegra30: Remove unused variable 'reg'
  clk: clkdev: Ignore suggestion to use gnu_printf() as it's not
    appropriate here
  clk: tegra: cvb: Provide missing description for
    'tegra_cvb_add_opp_table()'s align param
  clk: ti: dpll44xx: Fix some potential doc-rot
  clk: renesas: renesas-cpg-mssr: Fix formatting issues for
    'smstpcr_saved's documentation
  clk: sunxi: clk-sun6i-ar100: Demote non-conformant kernel-doc header
  clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
  clk: clk-fixed-mmio: Demote obvious kernel-doc abuse
  clk: clk-npcm7xx: Remove unused static const tables 'npcm7xx_gates'
    and 'npcm7xx_divs_fx'
  clk: qcom: mmcc-msm8974: Remove unused static const tables
    'mmcc_xo_mmpll0_1_2_gpll0{map}'
  clk: clk-xgene: Add description for 'mask' and fix formatting for
    'flags'
  clk: qcom: clk-rpm: Remove a bunch of superfluous code
  clk: spear: Move prototype to accessible header
  clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible
    header
  clk: zynqmp: divider: Add missing description for 'max_div'

 arch/arm/mach-imx/common.h             |   1 -
 arch/arm/mach-imx/cpuidle-imx6sl.c     |   1 +
 arch/arm/mach-imx/pm-imx6.c            |   1 +
 arch/arm/mach-spear/generic.h          |  12 ---
 arch/arm/mach-spear/spear13xx.c        |   1 +
 drivers/clk/clk-fixed-mmio.c           |   2 +-
 drivers/clk/clk-npcm7xx.c              | 108 -------------------------
 drivers/clk/clk-xgene.c                |   5 +-
 drivers/clk/clkdev.c                   |   7 ++
 drivers/clk/imx/clk-imx6sl.c           |   1 +
 drivers/clk/qcom/clk-regmap.c          |   1 +
 drivers/clk/qcom/clk-rpm.c             |  63 ---------------
 drivers/clk/qcom/gcc-ipq4019.c         |   7 +-
 drivers/clk/qcom/mmcc-msm8974.c        |  16 ----
 drivers/clk/renesas/renesas-cpg-mssr.c |   4 +-
 drivers/clk/spear/spear1310_clock.c    |   1 +
 drivers/clk/spear/spear1340_clock.c    |   1 +
 drivers/clk/sunxi/clk-sun6i-ar100.c    |   2 +-
 drivers/clk/sunxi/clk-sun9i-core.c     |   8 +-
 drivers/clk/sunxi/clk-usb.c            |   2 +-
 drivers/clk/tegra/clk-tegra30.c        |   5 +-
 drivers/clk/tegra/cvb.c                |   1 +
 drivers/clk/ti/clkt_dpll.c             |   3 +-
 drivers/clk/ti/dpll3xxx.c              |  20 ++---
 drivers/clk/ti/dpll44xx.c              |   6 +-
 drivers/clk/zynq/pll.c                 |  12 +--
 drivers/clk/zynqmp/divider.c           |   1 +
 include/linux/clk/imx.h                |  15 ++++
 include/linux/clk/spear.h              |  23 ++++++
 29 files changed, 92 insertions(+), 238 deletions(-)
 create mode 100644 include/linux/clk/imx.h
 create mode 100644 include/linux/clk/spear.h

Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Gross <agross@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Benjamin Fair <benjaminfair@google.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: "Emilio López" <emilio@elopez.com.ar>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jan Kotas <jank@cadence.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Loc Ho <lho@apm.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Nancy Yuen <yuenn@google.com>
Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: openbmc@lists.ozlabs.org
Cc: Patrick Venture <venture@google.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Rajan Vaja <rajan.vaja@xilinx.com>
Cc: Rajeev Kumar <rajeev-dlh.kumar@st.com>
Cc: Richard Woodruff <r-woodruff2@ti.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: "Sören Brinkmann" <soren.brinkmann@xilinx.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>
-- 
2.25.1

