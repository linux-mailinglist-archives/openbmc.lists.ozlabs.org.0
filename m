Return-Path: <openbmc+bounces-102-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64712AC8734
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 06:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7qRY58cdz2yfx;
	Fri, 30 May 2025 14:06:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748523398;
	cv=none; b=ZFErMLV2pZAIo+/4reJp1qyajrY11sZAWvo64J1bdX2qZejcFQ4YtCmVps1WeTlY/qK9tO2zGvzGbEQgOrtKd+yE8J6Hx52n0umZRICKICurYerjCTak56Rfpf+Dora0YLrJiCJumZFx2UtwAnXrLykt5xcXq0q3IqwFVUnfs9Az4hz8P5atLNeoaQ85/ehQEErPaeyg+RxcfuolGqxHywOOIR7fJYXYAcpYTSBNdiRgcAbVmyP+RAwEa4b0kvrbBMFTxxJQJWGtkxH8tVjQKmcNWc+pKmRQefWjlLqbrBdKc1Iz7XqiDeJXZeun6+LCMB/yiNPdy12cqd+v5w8h1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748523398; c=relaxed/relaxed;
	bh=rmVSecU3fSg579ePWaVwZNpoD7ReV7J57LSHk6R//xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jACm3w3Pad7MJwNA8Wz/21qiLcXesNG2sM16ZhnfTeiUlWNNwzsXmsL/qdCloDcLd5Z4TVzE0vvgaseTJCeQuO2veaHoOpmcmtINVAtp4dcwAYUEH5LziHL/eh+V9hQl/x4JNYjFJG3pUhgkoER361E3lfNwE7f68W03mOM7Mv5P6d9EkLdJWKw6klxNdheS0J9U3mDpB461CupGriPWCbjYq9akJ2uG5VNEw7HF+Q0H7aL4vSar8kHuI3U2uhjBS+n4xkMNtV9+W02Mytj7l8Tkm+xHg9v8wuetYIR6B4T+LzUn11O0+BwljXhZIfzIMNXnrCrWUDTnxSQZ6vFGfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7RFw4vppz2xCC;
	Thu, 29 May 2025 22:56:35 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8Bx7eKAWThoJCkCAQ--.52297S3;
	Thu, 29 May 2025 20:56:32 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCxbsV1WThoTrH6AA--.60122S2;
	Thu, 29 May 2025 20:56:27 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	Michal Simek <michal.simek@amd.com>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org,
	Aubin Constans <aubin.constans@microchip.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Hu Ziji <huziji@marvell.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 00/35] mmc: Cleanup sdhci_pltfm_free()/sdhci_free_host() usage
Date: Thu, 29 May 2025 20:56:10 +0800
Message-ID: <cover.1748515612.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsV1WThoTrH6AA--.60122S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw1kXr43tFy8Ary7GFW5CFX_yoW7GrW5pa
	ySqrWa9r43Cr95WrZxJw1UZw15Xr4rX39Fgry5tw4FqFW3Ca4UKrsrAFy0qryDZ3yxJr48
	t3WDJw1UGr95K3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUt529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUndwI3UUUUU==
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all:

After the first part of the cleanup[1], there are sdhci related
drivers that need further cleanup.

This patchset is the second part of the cleanup series, and since sdhci has
sdhci_alloc_host() as the general interface, our main job is to clean up
sdhci_pltfm_free() and sdhci_free_host().

[1]:https://lore.kernel.org/all/cover.1747877175.git.zhoubinbin@loongson.cn/

Thanks.

-----
V2:
- Collect Reviewed-by and Acked-by tags.
Patch-01:
 - Set sdhci_free_host() to empty, rather than dropping it.
Patch-07:
 - Set sdhci_pltfm_free() to empty, rather than dropping it.
Patch-22:
 - As requested by Yixun, keep the goto scheme.
Patch-35:
 - New patch;
 - Since all calls have been cleaned up, sdhci_pltfm_free()/sdhci_free_host()
   are now dropped directly;

Link to V1:
https://lore.kernel.org/all/cover.1747792905.git.zhoubinbin@loongson.cn/

Binbin Zhou (35):
  mmc: sdhci: Use devm_mmc_alloc_host() helper
  mmc: sdhci-acpi: Drop the use of sdhci_free_host()
  mmc: sdhci-milbeaut: Drop the use of sdhci_free_host()
  mmc: sdhci-pci: Drop the use of sdhci_free_host()
  mmc: sdhci-s3c: Drop the use of sdhci_free_host()
  mmc: sdhci-spear: Drop the use of sdhci_free_host()
  mmc: sdhci-pltfm: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-bcm-kona: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-brcmstb: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-cadence: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-dove: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-esdhc-imx: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-esdhc-mcf: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-iproc: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-msm: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-arasan: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-at91: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-dwcmshc: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-esdhc: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-k1: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-ma35d1: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-of-sparx5: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-omap: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-pic32: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-pxav2: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-pxav3: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-sprd: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-st: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-tegra: Drop the use of sdhci_pltfm_free()
  mmc: sdhci-xenon: Drop the use of sdhci_pltfm_free()
  mmc: sdhci_am654: Drop the use of sdhci_pltfm_free()
  mmc: sdhci_f_sdh30: Drop the use of sdhci_pltfm_free()
  mmc: sdhci: Drop sdhci_free_host()/sdhci_pltfm_free() definitions

 drivers/mmc/host/sdhci-acpi.c       |  3 ---
 drivers/mmc/host/sdhci-bcm-kona.c   |  2 --
 drivers/mmc/host/sdhci-brcmstb.c    |  1 -
 drivers/mmc/host/sdhci-cadence.c    | 21 ++++++------------
 drivers/mmc/host/sdhci-dove.c       | 12 ++---------
 drivers/mmc/host/sdhci-esdhc-imx.c  |  3 ---
 drivers/mmc/host/sdhci-esdhc-mcf.c  | 25 ++++++----------------
 drivers/mmc/host/sdhci-iproc.c      | 18 ++++------------
 drivers/mmc/host/sdhci-milbeaut.c   | 19 ++++++-----------
 drivers/mmc/host/sdhci-msm.c        | 11 ++++------
 drivers/mmc/host/sdhci-npcm.c       | 15 +++----------
 drivers/mmc/host/sdhci-of-arasan.c  | 26 +++++++----------------
 drivers/mmc/host/sdhci-of-aspeed.c  | 10 ++-------
 drivers/mmc/host/sdhci-of-at91.c    | 23 +++++++-------------
 drivers/mmc/host/sdhci-of-dwcmshc.c | 14 +++++-------
 drivers/mmc/host/sdhci-of-esdhc.c   | 11 ++--------
 drivers/mmc/host/sdhci-of-k1.c      |  1 -
 drivers/mmc/host/sdhci-of-ma35d1.c  | 23 +++++++-------------
 drivers/mmc/host/sdhci-of-sparx5.c  | 24 +++++++--------------
 drivers/mmc/host/sdhci-omap.c       | 21 ++++++------------
 drivers/mmc/host/sdhci-pci-core.c   |  9 ++------
 drivers/mmc/host/sdhci-pic32.c      |  9 +++-----
 drivers/mmc/host/sdhci-pltfm.c      | 16 +-------------
 drivers/mmc/host/sdhci-pltfm.h      |  1 -
 drivers/mmc/host/sdhci-pxav2.c      | 26 ++++++-----------------
 drivers/mmc/host/sdhci-pxav3.c      |  7 +-----
 drivers/mmc/host/sdhci-s3c.c        | 16 ++++----------
 drivers/mmc/host/sdhci-spear.c      | 11 ++++------
 drivers/mmc/host/sdhci-sprd.c       | 33 +++++++++--------------------
 drivers/mmc/host/sdhci-st.c         |  6 ++----
 drivers/mmc/host/sdhci-tegra.c      |  9 +++-----
 drivers/mmc/host/sdhci-xenon.c      |  9 ++------
 drivers/mmc/host/sdhci.c            |  9 +-------
 drivers/mmc/host/sdhci.h            |  1 -
 drivers/mmc/host/sdhci_am654.c      | 20 ++++++-----------
 drivers/mmc/host/sdhci_f_sdh30.c    | 13 ++++--------
 36 files changed, 129 insertions(+), 349 deletions(-)


base-commit: d2c6acff6386f43ed307822454b970c831c48f1b
-- 
2.47.1


