Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC692EB9DB
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:09:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9f8y38KNzDqVT
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 17:09:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9dyJ0hN6zDqbp;
 Wed,  6 Jan 2021 17:00:36 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1065sFZt004600;
 Wed, 6 Jan 2021 13:54:15 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Jan 2021 13:58:49 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <tglx@linutronix.de>, <maz@kernel.org>, <p.zabel@pengutronix.de>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] irqchip/aspeed: Add Aspeed eSPI interrupt controller
Date: Wed, 6 Jan 2021 13:59:37 +0800
Message-ID: <20210106055939.19386-5-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1065sFZt004600
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The eSPI interrupt controller acts as a SW IRQ number
decoder to correctly control/dispatch interrupts of
the eSPI peripheral, virtual wire, out-of-band, and
flash channels.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/irqchip/Makefile             |   2 +-
 drivers/irqchip/irq-aspeed-espi-ic.c | 251 ++++++++++++++++++++++++
 include/soc/aspeed/espi.h            | 279 +++++++++++++++++++++++++++
 3 files changed, 531 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-aspeed-espi-ic.c
 create mode 100644 include/soc/aspeed/espi.h

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 0ac93bfaec61..56da4a3123f8 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -86,7 +86,7 @@ obj-$(CONFIG_MVEBU_PIC)			+= irq-mvebu-pic.o
 obj-$(CONFIG_MVEBU_SEI)			+= irq-mvebu-sei.o
 obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
+obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o irq-aspeed-espi-ic.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
 obj-$(CONFIG_IRQ_UNIPHIER_AIDET)	+= irq-uniphier-aidet.o
diff --git a/drivers/irqchip/irq-aspeed-espi-ic.c b/drivers/irqchip/irq-aspeed-espi-ic.c
new file mode 100644
index 000000000000..8a5cc8fe3f0c
--- /dev/null
+++ b/drivers/irqchip/irq-aspeed-espi-ic.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+
+#include <soc/aspeed/espi.h>
+#include <dt-bindings/interrupt-controller/aspeed-espi-ic.h>
+
+#define DEVICE_NAME	"aspeed-espi-ic"
+#define IRQCHIP_NAME	"eSPI-IC"
+
+#define ESPI_IC_IRQ_NUM	7
+
+struct aspeed_espi_ic {
+	struct regmap *map;
+	int irq;
+	int gpio_irq;
+	struct irq_domain *irq_domain;
+};
+
+static void aspeed_espi_ic_gpio_isr(struct irq_desc *desc)
+{
+	unsigned int irq;
+	struct aspeed_espi_ic *espi_ic = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
+	irq = irq_find_mapping(espi_ic->irq_domain,
+				   ASPEED_ESPI_IC_CTRL_RESET);
+	generic_handle_irq(irq);
+
+	irq = irq_find_mapping(espi_ic->irq_domain,
+				   ASPEED_ESPI_IC_CHAN_RESET);
+	generic_handle_irq(irq);
+
+	chained_irq_exit(chip, desc);
+}
+
+static void aspeed_espi_ic_isr(struct irq_desc *desc)
+{
+	unsigned int sts;
+	unsigned int irq;
+	struct aspeed_espi_ic *espi_ic = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+
+	chained_irq_enter(chip, desc);
+
+	regmap_read(espi_ic->map, ESPI_INT_STS, &sts);
+
+	if (sts & ESPI_INT_STS_PERIF_BITS) {
+		irq = irq_find_mapping(espi_ic->irq_domain,
+				       ASPEED_ESPI_IC_PERIF_EVENT);
+		generic_handle_irq(irq);
+	}
+
+	if (sts & ESPI_INT_STS_VW_BITS) {
+		irq = irq_find_mapping(espi_ic->irq_domain,
+				       ASPEED_ESPI_IC_VW_EVENT);
+		generic_handle_irq(irq);
+	}
+
+	if (sts & ESPI_INT_STS_OOB_BITS) {
+		irq = irq_find_mapping(espi_ic->irq_domain,
+				       ASPEED_ESPI_IC_OOB_EVENT);
+		generic_handle_irq(irq);
+	}
+
+	if (sts & ESPI_INT_STS_FLASH_BITS) {
+		irq = irq_find_mapping(espi_ic->irq_domain,
+				       ASPEED_ESPI_IC_FLASH_EVENT);
+		generic_handle_irq(irq);
+	}
+
+	if (sts & ESPI_INT_STS_HW_RST_DEASSERT) {
+		irq = irq_find_mapping(espi_ic->irq_domain,
+				       ASPEED_ESPI_IC_CTRL_EVENT);
+		generic_handle_irq(irq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void aspeed_espi_ic_irq_disable(struct irq_data *data)
+{
+	struct aspeed_espi_ic *espi_ic = irq_data_get_irq_chip_data(data);
+
+	switch (data->hwirq) {
+	case ASPEED_ESPI_IC_CTRL_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_HW_RST_DEASSERT,
+				   0);
+		break;
+	case ASPEED_ESPI_IC_PERIF_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_PERIF_BITS, 0);
+		break;
+	case ASPEED_ESPI_IC_VW_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_VW_BITS, 0);
+		break;
+	case ASPEED_ESPI_IC_OOB_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_OOB_BITS, 0);
+		break;
+	case ASPEED_ESPI_IC_FLASH_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_FLASH_BITS, 0);
+		break;
+	}
+}
+
+static void aspeed_espi_ic_irq_enable(struct irq_data *data)
+{
+	struct aspeed_espi_ic *espi_ic = irq_data_get_irq_chip_data(data);
+
+	switch (data->hwirq) {
+	case ASPEED_ESPI_IC_CTRL_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_HW_RST_DEASSERT,
+				   ESPI_INT_EN_HW_RST_DEASSERT);
+		break;
+	case ASPEED_ESPI_IC_PERIF_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_PERIF_BITS,
+				   ESPI_INT_EN_PERIF_BITS);
+		break;
+	case ASPEED_ESPI_IC_VW_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_VW_BITS,
+				   ESPI_INT_EN_VW_BITS);
+		break;
+	case ASPEED_ESPI_IC_OOB_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_OOB_BITS,
+				   ESPI_INT_EN_OOB_BITS);
+		break;
+	case ASPEED_ESPI_IC_FLASH_EVENT:
+		regmap_update_bits(espi_ic->map, ESPI_INT_EN,
+				   ESPI_INT_EN_FLASH_BITS,
+				   ESPI_INT_EN_FLASH_BITS);
+		break;
+	}
+}
+
+static struct irq_chip aspeed_espi_ic_chip = {
+	.name = IRQCHIP_NAME,
+	.irq_enable = aspeed_espi_ic_irq_enable,
+	.irq_disable = aspeed_espi_ic_irq_disable,
+};
+
+static int aspeed_espi_ic_map(struct irq_domain *domain, unsigned int irq,
+			     irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &aspeed_espi_ic_chip, handle_simple_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops aspeed_espi_ic_domain_ops = {
+	.map = aspeed_espi_ic_map,
+};
+
+static int aspeed_espi_ic_probe(struct platform_device *pdev)
+{
+	struct device *dev;
+	struct aspeed_espi_ic *espi_ic;
+
+	dev = &pdev->dev;
+
+	espi_ic = devm_kzalloc(dev, sizeof(*espi_ic), GFP_KERNEL);
+	if (!espi_ic)
+		return -ENOMEM;
+
+	espi_ic->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(espi_ic->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return -ENODEV;
+	}
+
+	espi_ic->irq = platform_get_irq(pdev, 0);
+	if (espi_ic->irq < 0)
+		return espi_ic->irq;
+
+	espi_ic->gpio_irq = platform_get_irq(pdev, 1);
+	if (espi_ic->gpio_irq < 0)
+		return espi_ic->gpio_irq;
+
+	espi_ic->irq_domain = irq_domain_add_linear(dev->of_node, ESPI_IC_IRQ_NUM,
+						    &aspeed_espi_ic_domain_ops,
+						    espi_ic);
+	if (!espi_ic->irq_domain) {
+		dev_err(dev, "cannot to add irq domain\n");
+		return -ENOMEM;
+	}
+
+	irq_set_chained_handler_and_data(espi_ic->irq,
+					 aspeed_espi_ic_isr,
+					 espi_ic);
+
+	irq_set_chained_handler_and_data(espi_ic->gpio_irq,
+					 aspeed_espi_ic_gpio_isr,
+					 espi_ic);
+
+	dev_set_drvdata(dev, espi_ic);
+
+	dev_info(dev, "eSPI IRQ controller initialized\n");
+
+	return 0;
+}
+
+static int aspeed_espi_ic_remove(struct platform_device *pdev)
+{
+	struct aspeed_espi_ic *espi_ic = platform_get_drvdata(pdev);
+
+	irq_domain_remove(espi_ic->irq_domain);
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_ic_of_matches[] = {
+	{ .compatible = "aspeed,ast2600-espi-ic" },
+	{ },
+};
+
+static struct platform_driver aspeed_espi_ic_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = aspeed_espi_ic_of_matches,
+	},
+	.probe = aspeed_espi_ic_probe,
+	.remove = aspeed_espi_ic_remove,
+};
+
+module_platform_driver(aspeed_espi_ic_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Aspeed eSPI interrupt controller");
+MODULE_LICENSE("GPL v2");
diff --git a/include/soc/aspeed/espi.h b/include/soc/aspeed/espi.h
new file mode 100644
index 000000000000..c9a4f51737ee
--- /dev/null
+++ b/include/soc/aspeed/espi.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ * Author: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+ */
+#ifndef _ASPEED_ESPI_H_
+#define _ASPEED_ESPI_H_
+
+#include <linux/bits.h>
+
+/* eSPI register offset */
+#define ESPI_CTRL			0x000
+#define   ESPI_CTRL_FLASH_TX_DMA_EN		BIT(23)
+#define   ESPI_CTRL_FLASH_RX_DMA_EN		BIT(22)
+#define   ESPI_CTRL_OOB_TX_DMA_EN		BIT(21)
+#define   ESPI_CTRL_OOB_RX_DMA_EN		BIT(20)
+#define   ESPI_CTRL_PERIF_NP_TX_DMA_EN		BIT(19)
+#define   ESPI_CTRL_PERIF_PC_TX_DMA_EN		BIT(17)
+#define   ESPI_CTRL_PERIF_PC_RX_DMA_EN		BIT(16)
+#define   ESPI_CTRL_FLASH_SW_MODE_MASK		GENMASK(11, 10)
+#define   ESPI_CTRL_FLASH_SW_MODE_SHIFT		10
+#define   ESPI_CTRL_PERIF_PC_RX_DMA_EN		BIT(16)
+#define   ESPI_CTRL_FLASH_SW_RDY		BIT(7)
+#define   ESPI_CTRL_OOB_SW_RDY			BIT(4)
+#define   ESPI_CTRL_VW_SW_RDY			BIT(3)
+#define   ESPI_CTRL_PERIF_SW_RDY		BIT(1)
+#define ESPI_STS			0x004
+#define ESPI_INT_STS			0x008
+#define   ESPI_INT_STS_HW_RST_DEASSERT		BIT(31)
+#define   ESPI_INT_STS_OOB_RX_TMOUT		BIT(23)
+#define   ESPI_INT_STS_VW_SYSEVT1		BIT(22)
+#define   ESPI_INT_STS_FLASH_TX_ERR		BIT(21)
+#define   ESPI_INT_STS_OOB_TX_ERR		BIT(20)
+#define   ESPI_INT_STS_FLASH_TX_ABT		BIT(19)
+#define   ESPI_INT_STS_OOB_TX_ABT		BIT(18)
+#define   ESPI_INT_STS_PERIF_NP_TX_ABT		BIT(17)
+#define   ESPI_INT_STS_PERIF_PC_TX_ABT		BIT(16)
+#define   ESPI_INT_STS_FLASH_RX_ABT		BIT(15)
+#define   ESPI_INT_STS_OOB_RX_ABT		BIT(14)
+#define   ESPI_INT_STS_PERIF_NP_RX_ABT		BIT(13)
+#define   ESPI_INT_STS_PERIF_PC_RX_ABT		BIT(12)
+#define   ESPI_INT_STS_PERIF_NP_TX_ERR		BIT(11)
+#define   ESPI_INT_STS_PERIF_PC_TX_ERR		BIT(10)
+#define   ESPI_INT_STS_VW_GPIOEVT		BIT(9)
+#define   ESPI_INT_STS_VW_SYSEVT		BIT(8)
+#define   ESPI_INT_STS_FLASH_TX_CMPLT		BIT(7)
+#define   ESPI_INT_STS_FLASH_RX_CMPLT		BIT(6)
+#define   ESPI_INT_STS_OOB_TX_CMPLT		BIT(5)
+#define   ESPI_INT_STS_OOB_RX_CMPLT		BIT(4)
+#define   ESPI_INT_STS_PERIF_NP_TX_CMPLT	BIT(3)
+#define   ESPI_INT_STS_PERIF_PC_TX_CMPLT	BIT(1)
+#define   ESPI_INT_STS_PERIF_PC_RX_CMPLT	BIT(0)
+#define ESPI_INT_EN			0x00c
+#define   ESPI_INT_EN_HW_RST_DEASSERT		BIT(31)
+#define   ESPI_INT_EN_OOB_RX_TMOUT		BIT(23)
+#define   ESPI_INT_EN_VW_SYSEVT1		BIT(22)
+#define   ESPI_INT_EN_FLASH_TX_ERR		BIT(21)
+#define   ESPI_INT_EN_OOB_TX_ERR		BIT(20)
+#define   ESPI_INT_EN_FLASH_TX_ABT		BIT(19)
+#define   ESPI_INT_EN_OOB_TX_ABT		BIT(18)
+#define   ESPI_INT_EN_PERIF_NP_TX_ABT		BIT(17)
+#define   ESPI_INT_EN_PERIF_PC_TX_ABT		BIT(16)
+#define   ESPI_INT_EN_FLASH_RX_ABT		BIT(15)
+#define   ESPI_INT_EN_OOB_RX_ABT		BIT(14)
+#define   ESPI_INT_EN_PERIF_NP_RX_ABT		BIT(13)
+#define   ESPI_INT_EN_PERIF_PC_RX_ABT		BIT(12)
+#define   ESPI_INT_EN_PERIF_NP_TX_ERR		BIT(11)
+#define   ESPI_INT_EN_PERIF_PC_TX_ERR		BIT(10)
+#define   ESPI_INT_EN_VW_GPIOEVT		BIT(9)
+#define   ESPI_INT_EN_VW_SYSEVT			BIT(8)
+#define   ESPI_INT_EN_FLASH_TX_CMPLT		BIT(7)
+#define   ESPI_INT_EN_FLASH_RX_CMPLT		BIT(6)
+#define   ESPI_INT_EN_OOB_TX_CMPLT		BIT(5)
+#define   ESPI_INT_EN_OOB_RX_CMPLT		BIT(4)
+#define   ESPI_INT_EN_PERIF_NP_TX_CMPLT		BIT(3)
+#define   ESPI_INT_EN_PERIF_PC_TX_CMPLT		BIT(1)
+#define   ESPI_INT_EN_PERIF_PC_RX_CMPLT		BIT(0)
+#define ESPI_PERIF_PC_RX_DMA		0x010
+#define ESPI_PERIF_PC_RX_CTRL		0x014
+#define   ESPI_PERIF_PC_RX_CTRL_PEND_SERV	BIT(31)
+#define   ESPI_PERIF_PC_RX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define   ESPI_PERIF_PC_RX_CTRL_LEN_SHIFT	12
+#define   ESPI_PERIF_PC_RX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define   ESPI_PERIF_PC_RX_CTRL_TAG_SHIFT	8
+#define   ESPI_PERIF_PC_RX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define   ESPI_PERIF_PC_RX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_PC_RX_PORT		0x018
+#define ESPI_PERIF_PC_TX_DMA		0x020
+#define ESPI_PERIF_PC_TX_CTRL		0x024
+#define	  ESPI_PERIF_PC_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_PERIF_PC_TX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define	  ESPI_PERIF_PC_TX_CTRL_LEN_SHIFT	12
+#define	  ESPI_PERIF_PC_TX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define	  ESPI_PERIF_PC_TX_CTRL_TAG_SHIFT	8
+#define	  ESPI_PERIF_PC_TX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define	  ESPI_PERIF_PC_TX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_PC_TX_PORT		0x028
+#define ESPI_PERIF_NP_TX_DMA		0x030
+#define ESPI_PERIF_NP_TX_CTRL		0x034
+#define   ESPI_PERIF_NP_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_PERIF_NP_TX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define	  ESPI_PERIF_NP_TX_CTRL_LEN_SHIFT	12
+#define	  ESPI_PERIF_NP_TX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define	  ESPI_PERIF_NP_TX_CTRL_TAG_SHIFT	8
+#define	  ESPI_PERIF_NP_TX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define	  ESPI_PERIF_NP_TX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_NP_TX_PORT		0x038
+#define ESPI_OOB_RX_DMA			0x040
+#define ESPI_OOB_RX_CTRL		0x044
+#define	  ESPI_OOB_RX_CTRL_PEND_SERV		BIT(31)
+#define	  ESPI_OOB_RX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_OOB_RX_CTRL_LEN_SHIFT		12
+#define	  ESPI_OOB_RX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_OOB_RX_CTRL_TAG_SHIFT		8
+#define	  ESPI_OOB_RX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_OOB_RX_CTRL_CYC_SHIFT		0
+#define ESPI_OOB_RX_PORT		0x048
+#define ESPI_OOB_TX_DMA			0x050
+#define ESPI_OOB_TX_CTRL		0x054
+#define	  ESPI_OOB_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_OOB_TX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_OOB_TX_CTRL_LEN_SHIFT		12
+#define	  ESPI_OOB_TX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_OOB_TX_CTRL_TAG_SHIFT		8
+#define	  ESPI_OOB_TX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_OOB_TX_CTRL_CYC_SHIFT		0
+#define ESPI_OOB_TX_PORT		0x058
+#define ESPI_FLASH_RX_DMA		0x060
+#define ESPI_FLASH_RX_CTRL		0x064
+#define	  ESPI_FLASH_RX_CTRL_PEND_SERV		BIT(31)
+#define	  ESPI_FLASH_RX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_FLASH_RX_CTRL_LEN_SHIFT		12
+#define	  ESPI_FLASH_RX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_FLASH_RX_CTRL_TAG_SHIFT		8
+#define	  ESPI_FLASH_RX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_FLASH_RX_CTRL_CYC_SHIFT		0
+#define ESPI_FLASH_RX_PORT		0x068
+#define ESPI_FLASH_TX_DMA		0x070
+#define ESPI_FLASH_TX_CTRL		0x074
+#define	  ESPI_FLASH_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_FLASH_TX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_FLASH_TX_CTRL_LEN_SHIFT		12
+#define	  ESPI_FLASH_TX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_FLASH_TX_CTRL_TAG_SHIFT		8
+#define	  ESPI_FLASH_TX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_FLASH_TX_CTRL_CYC_SHIFT		0
+#define ESPI_FLASH_TX_PORT		0x078
+#define ESPI_CTRL2			0x080
+#define   ESPI_CTRL2_MEMCYC_RD_DIS		BIT(6)
+#define   ESPI_CTRL2_MEMCYC_WR_DIS		BIT(4)
+#define ESPI_PERIF_PC_RX_SADDR		0x084
+#define ESPI_PERIF_PC_RX_TADDR		0x088
+#define ESPI_PERIF_PC_RX_MASK		0x08c
+#define   ESPI_PERIF_PC_RX_MASK_CFG_WP		BIT(0)
+#define ESPI_SYSEVT_INT_EN		0x094
+#define ESPI_SYSEVT			0x098
+#define   ESPI_SYSEVT_HOST_RST_ACK		BIT(27)
+#define   ESPI_SYSEVT_RST_CPU_INIT		BIT(26)
+#define   ESPI_SYSEVT_SLV_BOOT_STS		BIT(23)
+#define   ESPI_SYSEVT_NON_FATAL_ERR		BIT(22)
+#define   ESPI_SYSEVT_FATAL_ERR			BIT(21)
+#define   ESPI_SYSEVT_SLV_BOOT_DONE		BIT(20)
+#define   ESPI_SYSEVT_OOB_RST_ACK		BIT(16)
+#define   ESPI_SYSEVT_NMI_OUT			BIT(10)
+#define   ESPI_SYSEVT_SMI_OUT			BIT(9)
+#define   ESPI_SYSEVT_HOST_RST_WARN		BIT(8)
+#define   ESPI_SYSEVT_OOB_RST_WARN		BIT(6)
+#define   ESPI_SYSEVT_PLTRSTN			BIT(5)
+#define   ESPI_SYSEVT_SUSPEND			BIT(4)
+#define   ESPI_SYSEVT_S5_SLEEP			BIT(2)
+#define   ESPI_SYSEVT_S4_SLEEP			BIT(1)
+#define   ESPI_SYSEVT_S3_SLEEP			BIT(0)
+#define ESPI_VW_GPIO_VAL		0x09c
+#define ESPI_GEN_CAP_N_CONF		0x0a0
+#define ESPI_CH0_CAP_N_CONF		0x0a4
+#define ESPI_CH1_CAP_N_CONF		0x0a8
+#define ESPI_CH2_CAP_N_CONF		0x0ac
+#define ESPI_CH3_CAP_N_CONF		0x0b0
+#define ESPI_CH3_CAP_N_CONF2		0x0b4
+#define ESPI_SYSEVT1_INT_EN		0x100
+#define   ESPI_SYSEVT1_INT_EN_SUSPEND_WARN	BIT(0)
+#define ESPI_SYSEVT1			0x104
+#define   ESPI_SYSEVT1_SUSPEND_ACK		BIT(20)
+#define   ESPI_SYSEVT1_SUSPEND_WARN		BIT(0)
+#define ESPI_SYSEVT_INT_T0		0x110
+#define ESPI_SYSEVT_INT_T1		0x114
+#define ESPI_SYSEVT_INT_T2		0x118
+#define   ESPI_SYSEVT_INT_T2_HOST_RST_WARN	BIT(8)
+#define   ESPI_SYSEVT_INT_T2_OOB_RST_WARN	BIT(6)
+#define ESPI_SYSEVT_INT_STS		0x11c
+#define   ESPI_SYSEVT_INT_STS_NMI_OUT		BIT(10)
+#define   ESPI_SYSEVT_INT_STS_SMI_OUT		BIT(9)
+#define   ESPI_SYSEVT_INT_STS_HOST_RST_WARN	BIT(8)
+#define   ESPI_SYSEVT_INT_STS_OOB_RST_WARN	BIT(6)
+#define   ESPI_SYSEVT_INT_STS_PLTRSTN		BIT(5)
+#define   ESPI_SYSEVT_INT_STS_SUSPEND		BIT(4)
+#define   ESPI_SYSEVT_INT_STS_S5_SLEEP		BIT(2)
+#define   ESPI_SYSEVT_INT_STS_S4_SLEEP		BIT(1)
+#define   ESPI_SYSEVT_INT_STS_S3_SLEEP		BIT(0)
+#define ESPI_SYSEVT1_INT_T0		0x120
+#define   ESPI_SYSEVT1_INT_T0_SUSPEND_WARN	BIT(0)
+#define ESPI_SYSEVT1_INT_T1		0x124
+#define ESPI_SYSEVT1_INT_T2		0x128
+#define ESPI_SYSEVT1_INT_STS		0x12c
+#define   ESPI_SYSEVT1_INT_STS_SUSPEND_WARN	BIT(0)
+#define ESPI_OOB_RX_DMA_RB_SIZE		0x130
+#define ESPI_OOB_RX_DMA_RD_PTR		0x134
+#define	  ESPI_OOB_RX_DMA_RD_PTR_UPDATE		BIT(31)
+#define ESPI_OOB_RX_DMA_WS_PTR		0x138
+#define   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN	BIT(31)
+#define   ESPI_OOB_RX_DMA_WS_PTR_SP_MASK	GENMASK(25, 16)
+#define   ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT	16
+#define   ESPI_OOB_RX_DMA_WS_PTR_WP_MASK	GENMASK(9, 0)
+#define   ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT	0
+#define ESPI_OOB_TX_DMA_RB_SIZE		0x140
+#define ESPI_OOB_TX_DMA_RD_PTR		0x144
+#define	  ESPI_OOB_TX_DMA_RD_PTR_UPDATE		BIT(31)
+#define ESPI_OOB_TX_DMA_WR_PTR		0x148
+#define	  ESPI_OOB_TX_DMA_WR_PTR_SEND_EN	BIT(31)
+
+/* collect ESPI_INT_STS bits of eSPI channels for convenience */
+#define ESPI_INT_STS_PERIF_BITS			\
+	(ESPI_INT_STS_PERIF_NP_TX_ABT		\
+	| ESPI_INT_STS_PERIF_PC_TX_ABT		\
+	| ESPI_INT_STS_PERIF_NP_RX_ABT		\
+	| ESPI_INT_STS_PERIF_PC_RX_ABT		\
+	| ESPI_INT_STS_PERIF_NP_TX_ERR		\
+	| ESPI_INT_STS_PERIF_PC_TX_ERR		\
+	| ESPI_INT_STS_PERIF_NP_TX_CMPLT	\
+	| ESPI_INT_STS_PERIF_PC_TX_CMPLT	\
+	| ESPI_INT_STS_PERIF_PC_RX_CMPLT)
+#define ESPI_INT_STS_VW_BITS		\
+	(ESPI_INT_STS_VW_SYSEVT1	\
+	| ESPI_INT_STS_VW_GPIOEVT	\
+	| ESPI_INT_STS_VW_SYSEVT)
+#define ESPI_INT_STS_OOB_BITS		\
+	(ESPI_INT_STS_OOB_RX_TMOUT	\
+	| ESPI_INT_STS_OOB_TX_ERR	\
+	| ESPI_INT_STS_OOB_TX_ABT	\
+	| ESPI_INT_STS_OOB_RX_ABT	\
+	| ESPI_INT_STS_OOB_TX_CMPLT	\
+	| ESPI_INT_STS_OOB_RX_CMPLT)
+#define ESPI_INT_STS_FLASH_BITS	\
+	(ESPI_INT_STS_FLASH_TX_ERR	\
+	| ESPI_INT_STS_FLASH_TX_ABT	\
+	| ESPI_INT_STS_FLASH_RX_ABT	\
+	| ESPI_INT_STS_FLASH_TX_CMPLT	\
+	| ESPI_INT_STS_FLASH_RX_CMPLT)
+
+/* collect ESPI_INT_EN bits of eSPI channels for convenience */
+#define ESPI_INT_EN_PERIF_BITS		\
+	(ESPI_INT_EN_PERIF_NP_TX_ABT	\
+	| ESPI_INT_EN_PERIF_PC_TX_ABT	\
+	| ESPI_INT_EN_PERIF_NP_RX_ABT	\
+	| ESPI_INT_EN_PERIF_PC_RX_ABT	\
+	| ESPI_INT_EN_PERIF_NP_TX_ERR	\
+	| ESPI_INT_EN_PERIF_PC_TX_ERR	\
+	| ESPI_INT_EN_PERIF_NP_TX_CMPLT	\
+	| ESPI_INT_EN_PERIF_PC_TX_CMPLT	\
+	| ESPI_INT_EN_PERIF_PC_RX_CMPLT)
+#define ESPI_INT_EN_VW_BITS		\
+	(ESPI_INT_EN_VW_SYSEVT1	\
+	| ESPI_INT_EN_VW_GPIOEVT	\
+	| ESPI_INT_EN_VW_SYSEVT)
+#define ESPI_INT_EN_OOB_BITS		\
+	(ESPI_INT_EN_OOB_RX_TMOUT	\
+	| ESPI_INT_EN_OOB_TX_ERR	\
+	| ESPI_INT_EN_OOB_TX_ABT	\
+	| ESPI_INT_EN_OOB_RX_ABT	\
+	| ESPI_INT_EN_OOB_TX_CMPLT	\
+	| ESPI_INT_EN_OOB_RX_CMPLT)
+#define ESPI_INT_EN_FLASH_BITS		\
+	(ESPI_INT_EN_FLASH_TX_ERR	\
+	| ESPI_INT_EN_FLASH_TX_ABT	\
+	| ESPI_INT_EN_FLASH_RX_ABT	\
+	| ESPI_INT_EN_FLASH_TX_CMPLT	\
+	| ESPI_INT_EN_FLASH_RX_CMPLT)
+
+#endif
-- 
2.17.1

