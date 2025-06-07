Return-Path: <openbmc+bounces-131-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D31AD10F6
	for <lists+openbmc@lfdr.de>; Sun,  8 Jun 2025 06:31:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFMZ74nhlz307V;
	Sun,  8 Jun 2025 14:31:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749281608;
	cv=none; b=PN5y9RmQjMDaQ3BEt8zMAzH613WVJFmLSv6MiomfJ9rzrmz84/oe+WrvYRs0KBjQdCdTYKWbfokre1mkCpKD+MW8Q3ikhD/4PGy2doP14FLmudRj7XcFd0s0UeOrrk+C4cenUJgwKc85Sf9IAng2nR2mf46Tltiv++rpTKvt5K0i7AKeluGQk78Zhek16XHQkyULIJjirNmMzMWs+azWAIGhaWuClEJcvsAlnEe71bUTbcMVZV0cQX9bik8IKwSzdsL34QHSr/aVf2ctv9KEQn08eDWIRryGtQulGPp+/qgp9MtpK9sAhOo0j2ibcJZ1QX2fTFzeVg2nveudzJ6Law==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749281608; c=relaxed/relaxed;
	bh=yzZ+FR4HzaCtTAYaQshj0u1B9QZKyH9oqhZpNyfvfBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bo23zByY6JxudPases74oSmI0rzf+ElDqpKo0Id6vIJMRx63lIepCcPq+R1MnuzeIwx21+O6sijqKbtF8xx5ZZu++8k/vdjKzoT67ITgwQ6TxkgN1oHhGMCJcDrLicy6ovCVcaCJEBAbLhpb4IrDs4ETw0Hyc0QnK0HH7iF98IL07zLbDblMseqYbFLsbASpGuXOoVU8a7RWDZ0BzYe21mAD637tXZn6nOD+RFUA7K0y38b3QMOQrXBHr7XWaqluvdgA4SDGNCwskSftAlnLCIp7lK9uTs+kK4EJSY/AEMlH5EN+IjvXbUsiaSIr9MhF4WKa1IucaU52SsO0E81SGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDqft4jjrz2xnM;
	Sat,  7 Jun 2025 17:33:25 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8CxaWr66kNoARUPAQ--.43723S3;
	Sat, 07 Jun 2025 15:32:10 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDxu8Tw6kNo4JwOAQ--.43155S2;
	Sat, 07 Jun 2025 15:32:06 +0800 (CST)
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
Subject: [PATCH v3 00/35] mmc: Cleanup sdhci_pltfm_free()/sdhci_free_host() usage
Date: Sat,  7 Jun 2025 15:31:50 +0800
Message-ID: <cover.1749127796.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMDxu8Tw6kNo4JwOAQ--.43155S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Xw4Utr1UGF4DGFW7Gr17Jwc_yoW7Ar1rpa
	ySqrWa9r43Cr95WrZxJw1UZw15Xr4rX39Fgry5tw4FqFW3Ca4UKrsrAFy0qryDZ3yxJr48
	t3WDJw1UGr95K3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUt529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUeVpB3UUUUU==
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all:

After the first part of the cleanup[1], there are sdhci related
drivers that need further cleanup.

This patchset is the second part of the cleanup series, and since sdhci has
sdhci_alloc_host() as the general interface, our main job is to clean up
sdhci_pltfm_free() and sdhci_free_host().

[1]: https://lore.kernel.org/all/cover.1748933789.git.zhoubinbin@loongson.cn/

Thanks.

-----
V3:
- Collect Reviewed-by and Acked-by tags.
Patch-19:
  - Use dev_err_probe() to cleanup the code.
Patch-32:
  - Fix build warning by lkp:
	https://lore.kernel.org/all/202505300815.tjQRQD6z-lkp@intel.com/

Link to V2:
https://lore.kernel.org/all/cover.1748515612.git.zhoubinbin@loongson.cn/

V2:
- Collect Reviewed-by and Acked-by tags.

Patch-01:
 - Set sdhci_free_host() to empty, rather than dropping it.
Patch-07:
 - Set sdhci_pltfm_free() to empty, rather than dropping it.
Patch-22:
 - As requested by Yixun, retain the goto scheme.
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
  mmc: sdhci: Drop sdhci_free_host()/sdhci_pltfm_free() interface

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
 drivers/mmc/host/sdhci-of-at91.c    | 30 ++++++++++----------------
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
 drivers/mmc/host/sdhci-xenon.c      | 15 +++++--------
 drivers/mmc/host/sdhci.c            |  9 +-------
 drivers/mmc/host/sdhci.h            |  1 -
 drivers/mmc/host/sdhci_am654.c      | 20 ++++++-----------
 drivers/mmc/host/sdhci_f_sdh30.c    | 13 ++++--------
 36 files changed, 135 insertions(+), 356 deletions(-)


base-commit: d2c6acff6386f43ed307822454b970c831c48f1b
-- 
2.47.1


