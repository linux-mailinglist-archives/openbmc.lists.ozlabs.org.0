Return-Path: <openbmc+bounces-547-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A751B3D95B
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 08:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFdW41L6Cz3057;
	Mon,  1 Sep 2025 15:59:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756706384;
	cv=none; b=PyMztA6CWA5p8f3KYcUZKkcs0xjweYImO9Wureo1e51K8X4MJIM994qJDKuFZh11ldJmzRH7zivMcRQdL4z3GpiNonYB0/JG9H+uAloTw9weYgEbpMB5vYWncsOYYwkZNW6CPVnydS20f51ohRd2fg1xqVoGsGfx5YgmpZTmj8NmS7CUGp/pwc3cpUtCltJHqw8cr1jvFyaACl683suFhc+gnZvjWUI5vMz7nOHnRKJvct+IFNUzhbOvyXyss/KK6PqFUjTiQM4JyKQW7AXdg/HNAiUC33f7GBTPVENWhXcH9X52k/outFdRXdrlrKlq/bg9y9cOFbfJZvEL9ldU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756706384; c=relaxed/relaxed;
	bh=pdfL/EfThtqQe1nHdb6JHX0jIJe81dC0aKtfyjsvruE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2dTHix7NlwZaPEoNVOv3kLYQOx4I3AEDHTFCfC/1/Jgzf4mjTloEDPBqqvV2gKHuWBxL96lJXuykEsDQhJF+G8ew/wxGKGfSOYqaKNeIwmK0gkr8keUiqweEK3c/MMuju5NhD12Da+pe7G4T/kPkFLUrOrLyHD9MCLKiZswchjY0pVC/GcIik11bDn/sVmGv1P2XiSZ2WwFTzQeV2/aN2tEU235sNn1nOVUDm8tYxF78Vsi12PWT7IfSVJkkU4ZQUvInk/IRnwPxh2g5FfzoqcboatNj0L934zELV+v+l5usOW/IJiCUyq9dLdm8y/RZ5S9G9OS8vAIq9b1+7GIqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFdW34Ntqz306S;
	Mon,  1 Sep 2025 15:59:43 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:23 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:23 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 07/10] PHY: aspeed: Add ASPEED PCIe PHY driver
Date: Mon, 1 Sep 2025 13:59:19 +0800
Message-ID: <20250901055922.1553550-8-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce support for Aspeed PCIe PHY controller available in
AST2600/2700.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/aspeed/Kconfig           |  15 ++
 drivers/phy/aspeed/Makefile          |   2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c | 209 +++++++++++++++++++++++++++
 5 files changed, 228 insertions(+)
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-pcie.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..ac4bf46f24e2 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
 
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
+source "drivers/phy/aspeed/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
 source "drivers/phy/freescale/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..12fd50e5ea9b 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
+					   aspeed/	\
 					   broadcom/	\
 					   cadence/	\
 					   freescale/	\
diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
new file mode 100644
index 000000000000..6aeeca84091f
--- /dev/null
+++ b/drivers/phy/aspeed/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Aspeed platforms
+#
+config PHY_ASPEED_PCIE
+	tristate "ASPEED PCIe PHY driver"
+	select GENERIC_PHY
+	depends on ARCH_ASPEED
+	default y
+	help
+	  This option enables support for the ASPEED PCIe PHY driver.
+	  The driver provides the necessary interface to control and
+	  configure the PCIe PHY hardware found on ASPEED SoCs.
+	  It is required for proper operation of PCIe devices on
+	  platforms using ASPEED chips.
\ No newline at end of file
diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
new file mode 100644
index 000000000000..7203152f44bf
--- /dev/null
+++ b/drivers/phy/aspeed/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_ASPEED_PCIE)		+= phy-aspeed-pcie.o
\ No newline at end of file
diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/phy-aspeed-pcie.c
new file mode 100644
index 000000000000..4b78ceeb5a5e
--- /dev/null
+++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2025 Aspeed Technology Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/phy/pcie.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/* AST2600 PCIe Host Controller Registers */
+#define PEHR_GLOBAL		0x30
+#define  AST2600_PORT_TYPE_MASK		GENMASK(5, 4)
+#define  AST2600_PORT_TYPE(x)		FIELD_PREP(AST2600_PORT_TYPE_MASK, x)
+#define PEHR_LOCK		0x7c
+#define  PCIE_UNLOCK			0xa8
+
+/* AST2700 PEHR */
+#define PEHR_MISC_58		0x58
+#define  LOCAL_SCALE_SUP		BIT(0)
+#define PEHR_MISC_5C		0x5c
+#define  CONFIG_RC_DEVICE		BIT(30)
+#define PEHR_MISC_60		0x60
+#define  AST2700_PORT_TYPE_MASK		GENMASK(7, 4)
+#define  PORT_TYPE_ROOT			BIT(6)
+#define PEHR_MISC_70		0x70
+#define  POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
+#define  POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+#define PEHR_MISC_78		0x78
+#define  COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
+#define  COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
+
+/**
+ * struct aspeed_pcie_phy - PCIe PHY information
+ * @dev: pointer to device structure
+ * @reg: PCIe host register base address
+ * @phy: pointer to PHY structure
+ * @platform: platform specific information
+ */
+struct aspeed_pcie_phy {
+	struct device *dev;
+	void __iomem *reg;
+	struct phy *phy;
+	const struct aspeed_pcie_phy_platform *platform;
+};
+
+/**
+ * struct aspeed_pcie_phy_platform - Platform information
+ * @phy_ops: phy operations
+ */
+struct aspeed_pcie_phy_platform {
+	const struct phy_ops *phy_ops;
+};
+
+static int ast2600_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	writel(PCIE_UNLOCK, pcie_phy->reg + PEHR_LOCK);
+
+	return 0;
+}
+
+static int ast2600_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		writel(AST2600_PORT_TYPE(0x3), pcie_phy->reg + PEHR_GLOBAL);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2600_phy_ops = {
+	.init		= ast2600_phy_init,
+	.set_mode	= ast2600_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int ast2700_phy_init(struct phy *phy)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+
+	writel(POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa),
+	       pcie_phy->reg + PEHR_MISC_70);
+	writel(COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8),
+	       pcie_phy->reg + PEHR_MISC_78);
+	writel(LOCAL_SCALE_SUP, pcie_phy->reg + PEHR_MISC_58);
+
+	return 0;
+}
+
+static int ast2700_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				int submode)
+{
+	struct aspeed_pcie_phy *pcie_phy = phy_get_drvdata(phy);
+	u32 cfg_val;
+
+	switch (submode) {
+	case PHY_MODE_PCIE_RC:
+		writel(CONFIG_RC_DEVICE, pcie_phy->reg + PEHR_MISC_5C);
+		cfg_val = readl(pcie_phy->reg + PEHR_MISC_60);
+		cfg_val &= ~AST2700_PORT_TYPE_MASK;
+		cfg_val |= PORT_TYPE_ROOT;
+		writel(cfg_val, pcie_phy->reg + PEHR_MISC_60);
+		break;
+	default:
+		dev_err(&phy->dev, "Unsupported submode %d\n", submode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct phy_ops ast2700_phy_ops = {
+	.init		= ast2700_phy_init,
+	.set_mode	= ast2700_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+const struct aspeed_pcie_phy_platform pcie_phy_ast2600 = {
+	.phy_ops = &ast2600_phy_ops,
+};
+
+const struct aspeed_pcie_phy_platform pcie_phy_ast2700 = {
+	.phy_ops = &ast2700_phy_ops,
+};
+
+static int aspeed_pcie_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct aspeed_pcie_phy *pcie_phy;
+	const struct aspeed_pcie_phy_platform *md;
+
+	md = of_device_get_match_data(dev);
+	if (!md)
+		return -ENODEV;
+
+	pcie_phy = devm_kzalloc(dev, sizeof(*pcie_phy), GFP_KERNEL);
+	if (!pcie_phy)
+		return -ENOMEM;
+
+	pcie_phy->reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcie_phy->reg))
+		return PTR_ERR(pcie_phy->reg);
+
+	pcie_phy->dev = dev;
+	pcie_phy->platform = md;
+
+	pcie_phy->phy = devm_phy_create(dev, dev->of_node,
+					pcie_phy->platform->phy_ops);
+	if (IS_ERR(pcie_phy->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie_phy->phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(pcie_phy->phy, pcie_phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id aspeed_pcie_phy_of_match_table[] = {
+	{
+		.compatible = "aspeed,ast2600-pcie-phy",
+		.data = &pcie_phy_ast2600,
+	},
+	{
+		.compatible = "aspeed,ast2700-pcie-phy",
+		.data = &pcie_phy_ast2700,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_pcie_of_match_table);
+
+static struct platform_driver aspeed_pcie_driver = {
+	.probe		= aspeed_pcie_phy_probe,
+	.driver = {
+		.name	= "aspeed-pcie-phy",
+		.of_match_table = aspeed_pcie_phy_of_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pcie_driver);
+
+MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
+MODULE_DESCRIPTION("ASPEED PCIe PHY");
+MODULE_LICENSE("GPL");
-- 
2.43.0


