Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D417F3235
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 16:19:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZShq0Jvmz3dKn
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 02:19:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZSg91LFBz3c2L
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 02:17:51 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 3ALFHfUh026535
	for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 17:17:42 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 21 Nov
 2023 17:17:41 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 21 Nov
 2023 23:17:39 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 21 Nov 2023 23:17:39 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id B26A35F63F;
	Tue, 21 Nov 2023 17:17:37 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 9EC7B235CE27; Tue, 21 Nov 2023 17:17:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <davem@davemloft.net>, <edumazet@google.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>,
        <peppe.cavallaro@st.com>, <joabreu@synopsys.com>,
        <mcoquelin.stm32@gmail.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v1 2/2] net: stmmac: Add NPCM support
Date: Tue, 21 Nov 2023 17:17:33 +0200
Message-ID: <20231121151733.2015384-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231121151733.2015384-1-tmaimon77@gmail.com>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC SoCs support to STMMAC dwmac driver.

And modify MAINTAINERS to add a new F: entry for this driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 MAINTAINERS                                   |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   9 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-npcm.c  | 121 ++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c9f868e13b6..43059c7d00c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2507,6 +2507,7 @@ F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*/*npcm*
 F:	drivers/*/*npcm*
 F:	drivers/rtc/rtc-nct3018y.c
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index a2b9e289aa36..2487a674d0d3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -121,6 +121,15 @@ config DWMAC_MESON
 	  the stmmac device driver. This driver is used for Meson6,
 	  Meson8, Meson8b and GXBB SoCs.
 
+config DWMAC_NPCM
+	tristate "Nuvoton NPCM dwmac support"
+	depends on OF && (ARCH_NPCM || COMPILE_TEST)
+	help
+	  Support for Ethernet controller on Nuvoton NPCM BMC SoCs.
+
+	  This selects the Nuvoton NPCM BMC SoC glue layer support for
+	  the stmmac device driver. This driver is used for NPCM8xx SoCs.
+
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 80e598bd4255..1c86c8ca39f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
 obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
 obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
 obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
+obj-$(CONFIG_DWMAC_NPCM)	+= dwmac-npcm.o
 obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
 obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
 obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c
new file mode 100644
index 000000000000..dbb857661142
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-npcm.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Nuvoton Technology corporation.
+
+#include <linux/device.h>
+#include <linux/ethtool.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/stmmac.h>
+
+#include "stmmac_platform.h"
+
+#define IND_AC_BA_REG		0x1FE
+#define SR_MII_CTRL		0x3E0000
+
+#define PCS_SR_MII_CTRL_REG	0x0
+#define PCS_SPEED_SELECT6	BIT(6)
+#define PCS_AN_ENABLE		BIT(12)
+#define PCS_SPEED_SELECT13	BIT(13)
+#define PCS_RST			BIT(15)
+
+#define PCS_MASK_SPEED		0xDFBF
+
+struct npcm_dwmac {
+	void __iomem	*reg;
+};
+
+static void npcm_dwmac_fix_mac_speed(void *priv, unsigned int speed,
+				     unsigned int mode)
+{
+	struct npcm_dwmac *dwmac = priv;
+	u16 val;
+
+	iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
+	val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
+	val &= PCS_MASK_SPEED;
+
+	switch (speed) {
+	case SPEED_1000:
+		val |= PCS_SPEED_SELECT6;
+		break;
+	case SPEED_100:
+		val |= PCS_SPEED_SELECT13;
+		break;
+	case SPEED_10:
+		break;
+	}
+
+	iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
+}
+
+void npcm_dwmac_pcs_init(struct npcm_dwmac *dwmac, struct device *dev,
+			 struct plat_stmmacenet_data *plat_dat)
+{
+	u16 val;
+
+	iowrite16((u16)(SR_MII_CTRL >> 9), dwmac->reg + IND_AC_BA_REG);
+	val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
+	val |= PCS_RST;
+	iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
+
+	while (val & PCS_RST)
+		val = ioread16(dwmac->reg + PCS_SR_MII_CTRL_REG);
+
+	val &= ~(PCS_AN_ENABLE);
+	iowrite16(val, dwmac->reg + PCS_SR_MII_CTRL_REG);
+}
+
+static int npcm_dwmac_probe(struct platform_device *pdev)
+{
+	struct plat_stmmacenet_data *plat_dat;
+	struct stmmac_resources stmmac_res;
+	struct npcm_dwmac *dwmac;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return ret;
+
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat_dat))
+		return PTR_ERR(plat_dat);
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		ret = -ENOMEM;
+
+	dwmac->reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dwmac->reg))
+		ret = PTR_ERR(dwmac->reg);
+
+	npcm_dwmac_pcs_init(dwmac, &pdev->dev, plat_dat);
+
+	plat_dat->has_gmac = true;
+	plat_dat->bsp_priv = dwmac;
+	plat_dat->fix_mac_speed = npcm_dwmac_fix_mac_speed;
+
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
+}
+
+static const struct of_device_id npcm_dwmac_match[] = {
+	{ .compatible = "nuvoton,npcm8xx-sgmii" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_dwmac_match);
+
+static struct platform_driver npcm_dwmac_driver = {
+	.probe  = npcm_dwmac_probe,
+	.remove_new = stmmac_pltfr_remove,
+	.driver = {
+		.name           = "npcm-dwmac",
+		.pm		= &stmmac_pltfr_pm_ops,
+		.of_match_table = npcm_dwmac_match,
+	},
+};
+module_platform_driver(npcm_dwmac_driver);
+
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM DWMAC glue layer");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

