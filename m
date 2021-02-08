Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53791313241
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:27:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4zQ2WlFzDrCt
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:27:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kristo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TGskujnE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYxPS6vpJzDqfK
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2021 17:46:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E47364E59;
 Mon,  8 Feb 2021 06:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612766761;
 bh=laV8svMkkIZgkEjMImPDqav9pFAGfCHDdtEUcbdDnvY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TGskujnEd6wHa7WkmlrA/txwqRTcJGBrt+G8G29pmkA5kZJTpP9p0uA0OBvZIqSvD
 JxUKjVIlJL7BN44ZogKx96Zw8qus91VU68qdycGrSWnEl44/V2NTQUC1OLOTCdF4Gu
 FGXrZfB1UlGCm0us6h06+bTEmrWyNdKdO1cQE50Xn9aYIA9cVXbE7c/MBRqdiuZ1jz
 yRAPPdGXm7pgspO8bff3EiWF+togadvuTOEFB2flyG4QXvLieVjLI1n9IWbF4cIrlT
 j4bPAIhCO/OgcnQj5qsi4LQSz7dkKfKSzdR46yYTRQHb0tQHuVB44086JDEOFAZDLc
 NgM8lbk2wAojg==
Subject: Re: [PATCH 00/21] [Set 2] Rid W=1 warnings from Clock
To: Lee Jones <lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
From: Tero Kristo <kristo@kernel.org>
Message-ID: <b801364c-951a-af9f-d7ad-2440afe1ed88@kernel.org>
Date: Mon, 8 Feb 2021 08:45:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Feb 2021 22:58:03 +1100
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
 =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>,
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
 =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rajan Vaja <rajan.vaja@xilinx.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Nuvoton Technologies <tali.perry@nuvoton.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/01/2021 14:45, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the last set.  Clock is clean after this.
> 
> Lee Jones (21):
>    clk: zynq: pll: Fix kernel-doc formatting in 'clk_register_zynq_pll's
>      header
>    clk: ti: clkt_dpll: Fix some kernel-doc misdemeanours
>    clk: ti: dpll3xxx: Fix some kernel-doc headers and promote other
>      worthy ones
>    clk: qcom: clk-regmap: Provide missing description for
>      'devm_clk_register_regmap()'s dev param
>    clk: sunxi: clk-sun9i-core: Demote non-conformant kernel-doc headers
>    clk: sunxi: clk-usb: Demote obvious kernel-doc abuse
>    clk: tegra: clk-tegra30: Remove unused variable 'reg'
>    clk: clkdev: Ignore suggestion to use gnu_printf() as it's not
>      appropriate here
>    clk: tegra: cvb: Provide missing description for
>      'tegra_cvb_add_opp_table()'s align param
>    clk: ti: dpll44xx: Fix some potential doc-rot
>    clk: renesas: renesas-cpg-mssr: Fix formatting issues for
>      'smstpcr_saved's documentation
>    clk: sunxi: clk-sun6i-ar100: Demote non-conformant kernel-doc header
>    clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
>    clk: clk-fixed-mmio: Demote obvious kernel-doc abuse
>    clk: clk-npcm7xx: Remove unused static const tables 'npcm7xx_gates'
>      and 'npcm7xx_divs_fx'
>    clk: qcom: mmcc-msm8974: Remove unused static const tables
>      'mmcc_xo_mmpll0_1_2_gpll0{map}'
>    clk: clk-xgene: Add description for 'mask' and fix formatting for
>      'flags'
>    clk: qcom: clk-rpm: Remove a bunch of superfluous code
>    clk: spear: Move prototype to accessible header
>    clk: imx: Move 'imx6sl_set_wait_clk()'s prototype out to accessible
>      header
>    clk: zynqmp: divider: Add missing description for 'max_div'
> 
>   arch/arm/mach-imx/common.h             |   1 -
>   arch/arm/mach-imx/cpuidle-imx6sl.c     |   1 +
>   arch/arm/mach-imx/pm-imx6.c            |   1 +
>   arch/arm/mach-spear/generic.h          |  12 ---
>   arch/arm/mach-spear/spear13xx.c        |   1 +
>   drivers/clk/clk-fixed-mmio.c           |   2 +-
>   drivers/clk/clk-npcm7xx.c              | 108 -------------------------
>   drivers/clk/clk-xgene.c                |   5 +-
>   drivers/clk/clkdev.c                   |   7 ++
>   drivers/clk/imx/clk-imx6sl.c           |   1 +
>   drivers/clk/qcom/clk-regmap.c          |   1 +
>   drivers/clk/qcom/clk-rpm.c             |  63 ---------------
>   drivers/clk/qcom/gcc-ipq4019.c         |   7 +-
>   drivers/clk/qcom/mmcc-msm8974.c        |  16 ----
>   drivers/clk/renesas/renesas-cpg-mssr.c |   4 +-
>   drivers/clk/spear/spear1310_clock.c    |   1 +
>   drivers/clk/spear/spear1340_clock.c    |   1 +
>   drivers/clk/sunxi/clk-sun6i-ar100.c    |   2 +-
>   drivers/clk/sunxi/clk-sun9i-core.c     |   8 +-
>   drivers/clk/sunxi/clk-usb.c            |   2 +-
>   drivers/clk/tegra/clk-tegra30.c        |   5 +-
>   drivers/clk/tegra/cvb.c                |   1 +
>   drivers/clk/ti/clkt_dpll.c             |   3 +-
>   drivers/clk/ti/dpll3xxx.c              |  20 ++---
>   drivers/clk/ti/dpll44xx.c              |   6 +-

For the TI portions:

Reviewed-by: Tero Kristo <kristo@kernel.org>

>   drivers/clk/zynq/pll.c                 |  12 +--
>   drivers/clk/zynqmp/divider.c           |   1 +
>   include/linux/clk/imx.h                |  15 ++++
>   include/linux/clk/spear.h              |  23 ++++++
>   29 files changed, 92 insertions(+), 238 deletions(-)
>   create mode 100644 include/linux/clk/imx.h
>   create mode 100644 include/linux/clk/spear.h
> 
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: "Emilio López" <emilio@elopez.com.ar>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Loc Ho <lho@apm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: Patrick Venture <venture@google.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Rajan Vaja <rajan.vaja@xilinx.com>
> Cc: Rajeev Kumar <rajeev-dlh.kumar@st.com>
> Cc: Richard Woodruff <r-woodruff2@ti.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: "Sören Brinkmann" <soren.brinkmann@xilinx.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Viresh Kumar <vireshk@kernel.org>
> 

