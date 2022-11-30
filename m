Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C163D8ED
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 16:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMjM767fbz3bfj
	for <lists+openbmc@lfdr.de>; Thu,  1 Dec 2022 02:10:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMjKT5bZMz304s
	for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2022 02:09:13 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 2AUF94q2020113
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 17:09:04 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 30 Nov
 2022 17:09:03 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 30 Nov
 2022 23:09:01 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 30 Nov 2022 23:09:01 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 6A69763A6B; Wed, 30 Nov 2022 17:09:00 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <ulf.hansson@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>,
        <adrian.hunter@intel.com>, <skhan@linuxfoundation.org>,
        <davidgow@google.com>, <pbrobinson@gmail.com>, <gsomlo@gmail.com>,
        <briannorris@chromium.org>, <arnd@arndb.de>, <krakoczy@antmicro.com>,
        <andy.shevchenko@gmail.com>
Subject: [PATCH v1 2/2] mmc: sdhci-npcm: Add NPCM SDHCI driver
Date: Wed, 30 Nov 2022 17:08:57 +0200
Message-ID: <20221130150857.67113-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221130150857.67113-1-tmaimon77@gmail.com>
References: <20221130150857.67113-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC sdhci-pltfm controller driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/mmc/host/Kconfig      |  8 ++++
 drivers/mmc/host/Makefile     |  1 +
 drivers/mmc/host/sdhci-npcm.c | 81 +++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 drivers/mmc/host/sdhci-npcm.c

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index fb1062a6394c..4b2d9ce4308c 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -709,6 +709,14 @@ config MMC_TMIO
 	  This provides support for the SD/MMC cell found in TC6393XB,
 	  T7L66XB and also HTC ASIC3
 
+config MMC_SDHCI_NPCM
+	tristate "Secure Digital Host Controller Interface support for NPCM"
+	depends on ARCH_NPCM || COMPILE_TEST
+	depends on MMC_SDHCI_PLTFM
+	help
+	  This provides support for the SD/eMMC controller found in
+	  NPCM BMC family SoCs.
+
 config MMC_SDHI
 	tristate "Renesas SDHI SD/SDIO controller support"
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 4e4ceb32c4b4..801086613d7f 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_MMC_SPI)		+= of_mmc_spi.o
 obj-$(CONFIG_MMC_S3C)   	+= s3cmci.o
 obj-$(CONFIG_MMC_SDRICOH_CS)	+= sdricoh_cs.o
 obj-$(CONFIG_MMC_TMIO)		+= tmio_mmc.o
+obj-$(CONFIG_MMC_SDHCI_NPCM)	+= sdhci-npcm.o
 obj-$(CONFIG_MMC_TMIO_CORE)	+= tmio_mmc_core.o
 obj-$(CONFIG_MMC_SDHI)		+= renesas_sdhi_core.o
 obj-$(CONFIG_MMC_SDHI_SYS_DMAC)		+= renesas_sdhi_sys_dmac.o
diff --git a/drivers/mmc/host/sdhci-npcm.c b/drivers/mmc/host/sdhci-npcm.c
new file mode 100644
index 000000000000..298c5f3e7c2b
--- /dev/null
+++ b/drivers/mmc/host/sdhci-npcm.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NPCM SDHC MMC host controller driver.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/mmc/host.h>
+#include <linux/mmc/mmc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include "sdhci-pltfm.h"
+
+static const struct sdhci_pltfm_data npcm_sdhci_pdata = {
+	.quirks  = SDHCI_QUIRK_DELAY_AFTER_POWER,
+	.quirks2 = SDHCI_QUIRK2_STOP_WITH_TC |
+		   SDHCI_QUIRK2_NO_1_8_V,
+};
+
+static int npcm_sdhci_probe(struct platform_device *pdev)
+{
+	struct sdhci_pltfm_host *pltfm_host;
+	struct sdhci_host *host;
+	u32 caps;
+	int ret;
+
+	host = sdhci_pltfm_init(pdev, &npcm_sdhci_pdata, 0);
+	if (IS_ERR(host))
+		return PTR_ERR(host);
+
+	pltfm_host = sdhci_priv(host);
+	pltfm_host->clk = devm_clk_get(&pdev->dev, NULL);
+
+	if (!IS_ERR(pltfm_host->clk))
+		clk_prepare_enable(pltfm_host->clk);
+
+	caps = sdhci_readl(host, SDHCI_CAPABILITIES);
+	if (caps & SDHCI_CAN_DO_8BIT)
+		host->mmc->caps |= MMC_CAP_8_BIT_DATA;
+
+	ret = mmc_of_parse(host->mmc);
+	if (ret)
+		goto err_sdhci_add;
+
+	ret = sdhci_add_host(host);
+	if (ret)
+		goto err_sdhci_add;
+
+	return 0;
+
+err_sdhci_add:
+	clk_disable_unprepare(pltfm_host->clk);
+	sdhci_pltfm_free(pdev);
+	return ret;
+}
+
+static const struct of_device_id npcm_sdhci_of_match[] = {
+	{ .compatible = "nuvoton,npcm750-sdhci" },
+	{ .compatible = "nuvoton,npcm845-sdhci" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_sdhci_of_match);
+
+static struct platform_driver npcm_sdhci_driver = {
+	.driver = {
+		.name	= "npcm-sdhci",
+		.of_match_table = npcm_sdhci_of_match,
+		.pm	= &sdhci_pltfm_pmops,
+	},
+	.probe		= npcm_sdhci_probe,
+	.remove		= sdhci_pltfm_unregister,
+};
+
+module_platform_driver(npcm_sdhci_driver);
+
+MODULE_DESCRIPTION("NPCM Secure Digital Host Controller Interface driver");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

