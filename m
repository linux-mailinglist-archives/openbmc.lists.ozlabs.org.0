Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07036527B3E
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 02:57:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1gnp6HQZz3cB8
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 10:57:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1glW65xdz3byS;
 Mon, 16 May 2022 10:55:19 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24G0eXN4022584;
 Mon, 16 May 2022 08:40:33 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 May
 2022 08:54:05 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <jk@codeconstruct.com.au>, <a.kartashev@yadro.com>,
 <patrick.rudolph@9elements.com>, <dphadke@linux.microsoft.com>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/4] soc: aspeed: Add eSPI driver
Date: Mon, 16 May 2022 08:54:11 +0800
Message-ID: <20220516005412.4844-4-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516005412.4844-1-chiawei_wang@aspeedtech.com>
References: <20220516005412.4844-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24G0eXN4022584
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
Cc: ryan_chen@aspeedtech.com, kernel test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Aspeed eSPI controller is slave device to communicate with
the master through the Enhanced Serial Peripheral Interface (eSPI).
All of the four eSPI channels, namely peripheral, virtual wire,
out-of-band, and flash are supported.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/soc/aspeed/Kconfig             |  11 +
 drivers/soc/aspeed/Makefile            |   5 +
 drivers/soc/aspeed/aspeed-espi-ctrl.c  | 214 ++++++++++
 drivers/soc/aspeed/aspeed-espi-ctrl.h  | 309 ++++++++++++++
 drivers/soc/aspeed/aspeed-espi-flash.c | 352 ++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-flash.h |  45 ++
 drivers/soc/aspeed/aspeed-espi-ioc.h   | 195 +++++++++
 drivers/soc/aspeed/aspeed-espi-oob.c   | 558 +++++++++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-oob.h   |  70 ++++
 drivers/soc/aspeed/aspeed-espi-perif.c | 511 ++++++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-perif.h |  45 ++
 drivers/soc/aspeed/aspeed-espi-vw.c    | 142 +++++++
 drivers/soc/aspeed/aspeed-espi-vw.h    |  21 +
 13 files changed, 2478 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ioc.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-oob.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-oob.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-perif.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-perif.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-vw.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-vw.h

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..b56414dc0743 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,17 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+config ASPEED_ESPI
+	bool "ASPEED eSPI slave driver"
+	select REGMAP
+	select MFD_SYSCON
+	default n
+	help
+	  Enable driver support for the Aspeed eSPI engine. The eSPI engine
+	  plays as a slave device in BMC to communicate with the Host over
+	  the eSPI interface. The four eSPI channels, namely peripheral,
+	  virtual wire, out-of-band, and flash are supported.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..1bc433be7e93 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,8 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_ESPI)		+= aspeed-espi-ctrl.o \
+					   aspeed-espi-perif.o \
+					   aspeed-espi-vw.o \
+					   aspeed-espi-oob.o \
+					   aspeed-espi-flash.o
diff --git a/drivers/soc/aspeed/aspeed-espi-ctrl.c b/drivers/soc/aspeed/aspeed-espi-ctrl.c
new file mode 100644
index 000000000000..ce2967f851f2
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ctrl.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+
+#include "aspeed-espi-ioc.h"
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-perif.h"
+#include "aspeed-espi-vw.h"
+#include "aspeed-espi-oob.h"
+#include "aspeed-espi-flash.h"
+
+#define DEVICE_NAME "aspeed-espi-ctrl"
+
+static irqreturn_t aspeed_espi_ctrl_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	struct aspeed_espi_ctrl *espi_ctrl = (struct aspeed_espi_ctrl *)arg;
+
+	regmap_read(espi_ctrl->map, ESPI_INT_STS, &sts);
+
+	if (sts & ESPI_INT_STS_PERIF_BITS) {
+		aspeed_espi_perif_event(sts, espi_ctrl->perif);
+		regmap_write(espi_ctrl->map, ESPI_INT_STS, sts & ESPI_INT_STS_PERIF_BITS);
+	}
+
+	if (sts & ESPI_INT_STS_VW_BITS) {
+		aspeed_espi_vw_event(sts, espi_ctrl->vw);
+		regmap_write(espi_ctrl->map, ESPI_INT_STS, sts & ESPI_INT_STS_VW_BITS);
+	}
+
+	if (sts & (ESPI_INT_STS_OOB_BITS)) {
+		aspeed_espi_oob_event(sts, espi_ctrl->oob);
+		regmap_write(espi_ctrl->map, ESPI_INT_STS, sts & ESPI_INT_STS_OOB_BITS);
+	}
+
+	if (sts & ESPI_INT_STS_FLASH_BITS) {
+		aspeed_espi_flash_event(sts, espi_ctrl->flash);
+		regmap_write(espi_ctrl->map, ESPI_INT_STS, sts & ESPI_INT_STS_FLASH_BITS);
+	}
+
+	if (sts & ESPI_INT_STS_HW_RST_DEASSERT) {
+		aspeed_espi_perif_enable(espi_ctrl->perif);
+		aspeed_espi_vw_enable(espi_ctrl->vw);
+		aspeed_espi_oob_enable(espi_ctrl->oob);
+		aspeed_espi_flash_enable(espi_ctrl->flash);
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T0, 0x0);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T1, 0x0);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_EN, 0xffffffff);
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_T0, 0x1);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_EN, 0x1);
+
+		if (espi_ctrl->model->version == ESPI_AST2500)
+			regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T2,
+				     ESPI_SYSEVT_INT_T2_HOST_RST_WARN |
+				     ESPI_SYSEVT_INT_T2_OOB_RST_WARN);
+
+		regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+				   ESPI_INT_EN_HW_RST_DEASSERT,
+				   ESPI_INT_EN_HW_RST_DEASSERT);
+
+		regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT,
+				   ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE,
+				   ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE);
+
+		regmap_write(espi_ctrl->map, ESPI_INT_STS, ESPI_INT_STS_HW_RST_DEASSERT);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_ctrl_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct aspeed_espi_ctrl *espi_ctrl;
+	struct device *dev = &pdev->dev;
+
+	espi_ctrl = devm_kzalloc(dev, sizeof(*espi_ctrl), GFP_KERNEL);
+	if (!espi_ctrl)
+		return -ENOMEM;
+
+	espi_ctrl->model = of_device_get_match_data(dev);
+
+	espi_ctrl->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(espi_ctrl->map)) {
+		dev_err(dev, "cannot get remap\n");
+		return -ENODEV;
+	}
+
+	espi_ctrl->irq = platform_get_irq(pdev, 0);
+	if (espi_ctrl->irq < 0)
+		return espi_ctrl->irq;
+
+	espi_ctrl->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(espi_ctrl->clk)) {
+		dev_err(dev, "cannot get clock\n");
+		return -ENODEV;
+	}
+
+	rc = clk_prepare_enable(espi_ctrl->clk);
+	if (rc) {
+		dev_err(dev, "cannot enable clock\n");
+		return rc;
+	}
+
+	espi_ctrl->perif = aspeed_espi_perif_alloc(dev, espi_ctrl);
+	if (IS_ERR(espi_ctrl->perif)) {
+		dev_err(dev, "failed to allocate peripheral channel\n");
+		return PTR_ERR(espi_ctrl->perif);
+	}
+
+	espi_ctrl->vw = aspeed_espi_vw_alloc(dev, espi_ctrl);
+	if (IS_ERR(espi_ctrl->vw)) {
+		dev_err(dev, "failed to allocate virtual wire channel\n");
+		return PTR_ERR(espi_ctrl->vw);
+	}
+
+	espi_ctrl->oob = aspeed_espi_oob_alloc(dev, espi_ctrl);
+	if (IS_ERR(espi_ctrl->oob)) {
+		dev_err(dev, "failed to allocate out-of-band channel\n");
+		return PTR_ERR(espi_ctrl->oob);
+	}
+
+	espi_ctrl->flash = aspeed_espi_flash_alloc(dev, espi_ctrl);
+	if (rc) {
+		dev_err(dev, "failed to allocate flash channel\n");
+		return PTR_ERR(espi_ctrl->flash);
+	}
+
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T0, 0x0);
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T1, 0x0);
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_EN, 0xffffffff);
+
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_T0, 0x1);
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_EN, 0x1);
+
+	rc = devm_request_irq(dev, espi_ctrl->irq,
+			      aspeed_espi_ctrl_isr,
+			      0, DEVICE_NAME, espi_ctrl);
+	if (rc) {
+		dev_err(dev, "failed to request IRQ\n");
+		return rc;
+	}
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_HW_RST_DEASSERT,
+			   ESPI_INT_EN_HW_RST_DEASSERT);
+
+	dev_set_drvdata(dev, espi_ctrl);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_ctrl_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_ctrl *espi_ctrl = dev_get_drvdata(dev);
+
+	aspeed_espi_perif_free(dev, espi_ctrl->perif);
+	aspeed_espi_vw_free(dev, espi_ctrl->vw);
+	aspeed_espi_oob_free(dev, espi_ctrl->oob);
+	aspeed_espi_flash_free(dev, espi_ctrl->flash);
+
+	return 0;
+}
+
+static const struct aspeed_espi_model ast2500_model = {
+	.version = ESPI_AST2500,
+};
+
+static const struct aspeed_espi_model ast2600_model = {
+	.version = ESPI_AST2600,
+};
+
+static const struct of_device_id aspeed_espi_ctrl_of_matches[] = {
+	{ .compatible = "aspeed,ast2500-espi-ctrl",
+	  .data = &ast2500_model },
+	{ .compatible = "aspeed,ast2600-espi-ctrl",
+	  .data = &ast2600_model },
+	{ },
+};
+
+static struct platform_driver aspeed_espi_ctrl_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = aspeed_espi_ctrl_of_matches,
+	},
+	.probe = aspeed_espi_ctrl_probe,
+	.remove = aspeed_espi_ctrl_remove,
+};
+
+module_platform_driver(aspeed_espi_ctrl_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI Slave Device");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/aspeed/aspeed-espi-ctrl.h b/drivers/soc/aspeed/aspeed-espi-ctrl.h
new file mode 100644
index 000000000000..8e26cd647a7f
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ctrl.h
@@ -0,0 +1,309 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_CTRL_H_
+#define _ASPEED_ESPI_CTRL_H_
+
+#include <linux/bits.h>
+
+enum aspeed_espi_version {
+	ESPI_AST2500,
+	ESPI_AST2600,
+};
+
+struct aspeed_espi_model {
+	uint32_t version;
+};
+
+struct aspeed_espi_ctrl {
+	struct device *dev;
+
+	struct regmap *map;
+	struct clk *clk;
+
+	int irq;
+
+	struct aspeed_espi_perif *perif;
+	struct aspeed_espi_vw *vw;
+	struct aspeed_espi_oob *oob;
+	struct aspeed_espi_flash *flash;
+
+	const struct aspeed_espi_model *model;
+};
+
+/* eSPI register offset */
+#define ESPI_CTRL		0x000
+#define   ESPI_CTRL_OOB_RX_SW_RST		BIT(28)
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
+#define   ESPI_CTRL_VW_GPIO_SW_MODE		BIT(9)
+#define   ESPI_CTRL_FLASH_SW_RDY		BIT(7)
+#define   ESPI_CTRL_OOB_SW_RDY			BIT(4)
+#define   ESPI_CTRL_VW_SW_RDY			BIT(3)
+#define   ESPI_CTRL_PERIF_SW_RDY		BIT(1)
+#define ESPI_STS		0x004
+#define ESPI_INT_STS		0x008
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
+#define ESPI_INT_EN		0x00c
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
+#define ESPI_PERIF_PC_RX_DMA	0x010
+#define ESPI_PERIF_PC_RX_CTRL	0x014
+#define   ESPI_PERIF_PC_RX_CTRL_PEND_SERV	BIT(31)
+#define   ESPI_PERIF_PC_RX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define   ESPI_PERIF_PC_RX_CTRL_LEN_SHIFT	12
+#define   ESPI_PERIF_PC_RX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define   ESPI_PERIF_PC_RX_CTRL_TAG_SHIFT	8
+#define   ESPI_PERIF_PC_RX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define   ESPI_PERIF_PC_RX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_PC_RX_PORT	0x018
+#define ESPI_PERIF_PC_TX_DMA	0x020
+#define ESPI_PERIF_PC_TX_CTRL	0x024
+#define	  ESPI_PERIF_PC_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_PERIF_PC_TX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define	  ESPI_PERIF_PC_TX_CTRL_LEN_SHIFT	12
+#define	  ESPI_PERIF_PC_TX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define	  ESPI_PERIF_PC_TX_CTRL_TAG_SHIFT	8
+#define	  ESPI_PERIF_PC_TX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define	  ESPI_PERIF_PC_TX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_PC_TX_PORT	0x028
+#define ESPI_PERIF_NP_TX_DMA	0x030
+#define ESPI_PERIF_NP_TX_CTRL	0x034
+#define   ESPI_PERIF_NP_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_PERIF_NP_TX_CTRL_LEN_MASK	GENMASK(23, 12)
+#define	  ESPI_PERIF_NP_TX_CTRL_LEN_SHIFT	12
+#define	  ESPI_PERIF_NP_TX_CTRL_TAG_MASK	GENMASK(11, 8)
+#define	  ESPI_PERIF_NP_TX_CTRL_TAG_SHIFT	8
+#define	  ESPI_PERIF_NP_TX_CTRL_CYC_MASK	GENMASK(7, 0)
+#define	  ESPI_PERIF_NP_TX_CTRL_CYC_SHIFT	0
+#define ESPI_PERIF_NP_TX_PORT	0x038
+#define ESPI_OOB_RX_DMA		0x040
+#define ESPI_OOB_RX_CTRL	0x044
+#define	  ESPI_OOB_RX_CTRL_PEND_SERV		BIT(31)
+#define	  ESPI_OOB_RX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_OOB_RX_CTRL_LEN_SHIFT		12
+#define	  ESPI_OOB_RX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_OOB_RX_CTRL_TAG_SHIFT		8
+#define	  ESPI_OOB_RX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_OOB_RX_CTRL_CYC_SHIFT		0
+#define ESPI_OOB_RX_PORT	0x048
+#define ESPI_OOB_TX_DMA		0x050
+#define ESPI_OOB_TX_CTRL	0x054
+#define	  ESPI_OOB_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_OOB_TX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_OOB_TX_CTRL_LEN_SHIFT		12
+#define	  ESPI_OOB_TX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_OOB_TX_CTRL_TAG_SHIFT		8
+#define	  ESPI_OOB_TX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_OOB_TX_CTRL_CYC_SHIFT		0
+#define ESPI_OOB_TX_PORT	0x058
+#define ESPI_FLASH_RX_DMA	0x060
+#define ESPI_FLASH_RX_CTRL	0x064
+#define	  ESPI_FLASH_RX_CTRL_PEND_SERV		BIT(31)
+#define	  ESPI_FLASH_RX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_FLASH_RX_CTRL_LEN_SHIFT		12
+#define	  ESPI_FLASH_RX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_FLASH_RX_CTRL_TAG_SHIFT		8
+#define	  ESPI_FLASH_RX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_FLASH_RX_CTRL_CYC_SHIFT		0
+#define ESPI_FLASH_RX_PORT	0x068
+#define ESPI_FLASH_TX_DMA	0x070
+#define ESPI_FLASH_TX_CTRL	0x074
+#define	  ESPI_FLASH_TX_CTRL_TRIGGER		BIT(31)
+#define	  ESPI_FLASH_TX_CTRL_LEN_MASK		GENMASK(23, 12)
+#define	  ESPI_FLASH_TX_CTRL_LEN_SHIFT		12
+#define	  ESPI_FLASH_TX_CTRL_TAG_MASK		GENMASK(11, 8)
+#define	  ESPI_FLASH_TX_CTRL_TAG_SHIFT		8
+#define	  ESPI_FLASH_TX_CTRL_CYC_MASK		GENMASK(7, 0)
+#define	  ESPI_FLASH_TX_CTRL_CYC_SHIFT		0
+#define ESPI_FLASH_TX_PORT	0x078
+#define ESPI_CTRL2		0x080
+#define   ESPI_CTRL2_MEMCYC_RD_DIS		BIT(6)
+#define   ESPI_CTRL2_MEMCYC_WR_DIS		BIT(4)
+#define ESPI_PERIF_PC_RX_SADDR	0x084
+#define ESPI_PERIF_PC_RX_TADDR	0x088
+#define ESPI_PERIF_PC_RX_MASK	0x08c
+#define   ESPI_PERIF_PC_RX_MASK_CFG_WP		BIT(0)
+#define ESPI_SYSEVT_INT_EN	0x094
+#define ESPI_SYSEVT		0x098
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
+#define ESPI_VW_GPIO_VAL	0x09c
+#define ESPI_GEN_CAP_N_CONF	0x0a0
+#define ESPI_CH0_CAP_N_CONF	0x0a4
+#define ESPI_CH1_CAP_N_CONF	0x0a8
+#define ESPI_CH2_CAP_N_CONF	0x0ac
+#define ESPI_CH3_CAP_N_CONF	0x0b0
+#define ESPI_CH3_CAP_N_CONF2	0x0b4
+#define ESPI_SYSEVT1_INT_EN	0x100
+#define ESPI_SYSEVT1		0x104
+#define   ESPI_SYSEVT1_SUSPEND_ACK		BIT(20)
+#define   ESPI_SYSEVT1_SUSPEND_WARN		BIT(0)
+#define ESPI_SYSEVT_INT_T0	0x110
+#define ESPI_SYSEVT_INT_T1	0x114
+#define ESPI_SYSEVT_INT_T2	0x118
+#define   ESPI_SYSEVT_INT_T2_HOST_RST_WARN	ESPI_SYSEVT_HOST_RST_WARN
+#define   ESPI_SYSEVT_INT_T2_OOB_RST_WARN	ESPI_SYSEVT_OOB_RST_WARN
+#define ESPI_SYSEVT_INT_STS	0x11c
+#define   ESPI_SYSEVT_INT_STS_NMI_OUT		ESPI_SYSEVT_NMI_OUT
+#define   ESPI_SYSEVT_INT_STS_SMI_OUT		ESPI_SYSEVT_SMI_OUT
+#define   ESPI_SYSEVT_INT_STS_HOST_RST_WARN	ESPI_SYSEVT_HOST_RST_WARN
+#define   ESPI_SYSEVT_INT_STS_OOB_RST_WARN	ESPI_SYSEVT_OOB_RST_WARN
+#define   ESPI_SYSEVT_INT_STS_PLTRSTN		ESPI_SYSEVT_PLTRSTN
+#define   ESPI_SYSEVT_INT_STS_SUSPEND		ESPI_SYSEVT_SUSPEND
+#define   ESPI_SYSEVT_INT_STS_S5_SLEEP		ESPI_SYSEVT_INT_S5_SLEEP
+#define   ESPI_SYSEVT_INT_STS_S4_SLEEP		ESPI_SYSEVT_INT_S4_SLEEP
+#define   ESPI_SYSEVT_INT_STS_S3_SLEEP		ESPI_SYSEVT_INT_S3_SLEEP
+#define ESPI_SYSEVT1_INT_T0	0x120
+#define ESPI_SYSEVT1_INT_T1	0x124
+#define ESPI_SYSEVT1_INT_T2	0x128
+#define ESPI_SYSEVT1_INT_STS	0x12c
+#define   ESPI_SYSEVT1_INT_STS_SUSPEND_WARN	ESPI_SYSEVT1_SUSPEND_WARN
+#define ESPI_OOB_RX_DMA_RB_SIZE	0x130
+#define ESPI_OOB_RX_DMA_RD_PTR	0x134
+#define	  ESPI_OOB_RX_DMA_RD_PTR_UPDATE		BIT(31)
+#define ESPI_OOB_RX_DMA_WS_PTR	0x138
+#define   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN	BIT(31)
+#define   ESPI_OOB_RX_DMA_WS_PTR_SP_MASK	GENMASK(27, 16)
+#define   ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT	16
+#define   ESPI_OOB_RX_DMA_WS_PTR_WP_MASK	GENMASK(11, 0)
+#define   ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT	0
+#define ESPI_OOB_TX_DMA_RB_SIZE	0x140
+#define ESPI_OOB_TX_DMA_RD_PTR	0x144
+#define	  ESPI_OOB_TX_DMA_RD_PTR_UPDATE		BIT(31)
+#define ESPI_OOB_TX_DMA_WR_PTR	0x148
+#define	  ESPI_OOB_TX_DMA_WR_PTR_SEND_EN	BIT(31)
+
+/* collect ESPI_INT_STS bits of eSPI channels for convenience */
+#define ESPI_INT_STS_PERIF_BITS			\
+	(ESPI_INT_STS_PERIF_NP_TX_ABT |		\
+	 ESPI_INT_STS_PERIF_PC_TX_ABT |		\
+	 ESPI_INT_STS_PERIF_NP_RX_ABT |		\
+	 ESPI_INT_STS_PERIF_PC_RX_ABT |		\
+	 ESPI_INT_STS_PERIF_NP_TX_ERR |		\
+	 ESPI_INT_STS_PERIF_PC_TX_ERR |		\
+	 ESPI_INT_STS_PERIF_NP_TX_CMPLT |	\
+	 ESPI_INT_STS_PERIF_PC_TX_CMPLT |	\
+	 ESPI_INT_STS_PERIF_PC_RX_CMPLT)
+
+#define ESPI_INT_STS_VW_BITS		\
+	(ESPI_INT_STS_VW_SYSEVT1 |	\
+	 ESPI_INT_STS_VW_GPIOEVT |	\
+	 ESPI_INT_STS_VW_SYSEVT)
+
+#define ESPI_INT_STS_OOB_BITS		\
+	(ESPI_INT_STS_OOB_RX_TMOUT |	\
+	 ESPI_INT_STS_OOB_TX_ERR |	\
+	 ESPI_INT_STS_OOB_TX_ABT |	\
+	 ESPI_INT_STS_OOB_RX_ABT |	\
+	 ESPI_INT_STS_OOB_TX_CMPLT |	\
+	 ESPI_INT_STS_OOB_RX_CMPLT)
+
+#define ESPI_INT_STS_FLASH_BITS		\
+	(ESPI_INT_STS_FLASH_TX_ERR |	\
+	 ESPI_INT_STS_FLASH_TX_ABT |	\
+	 ESPI_INT_STS_FLASH_RX_ABT |	\
+	 ESPI_INT_STS_FLASH_TX_CMPLT |	\
+	 ESPI_INT_STS_FLASH_RX_CMPLT)
+
+/* collect ESPI_INT_EN bits of eSPI channels for convenience */
+#define ESPI_INT_EN_PERIF_BITS			\
+	(ESPI_INT_EN_PERIF_NP_TX_ABT |		\
+	 ESPI_INT_EN_PERIF_PC_TX_ABT |		\
+	 ESPI_INT_EN_PERIF_NP_RX_ABT |		\
+	 ESPI_INT_EN_PERIF_PC_RX_ABT |		\
+	 ESPI_INT_EN_PERIF_NP_TX_ERR |		\
+	 ESPI_INT_EN_PERIF_PC_TX_ERR |		\
+	 ESPI_INT_EN_PERIF_NP_TX_CMPLT |	\
+	 ESPI_INT_EN_PERIF_PC_TX_CMPLT |	\
+	 ESPI_INT_EN_PERIF_PC_RX_CMPLT)
+
+#define ESPI_INT_EN_VW_BITS		\
+	(ESPI_INT_EN_VW_SYSEVT1 |	\
+	 ESPI_INT_EN_VW_GPIOEVT |	\
+	 ESPI_INT_EN_VW_SYSEVT)
+
+#define ESPI_INT_EN_OOB_BITS		\
+	(ESPI_INT_EN_OOB_RX_TMOUT |	\
+	 ESPI_INT_EN_OOB_TX_ERR |	\
+	 ESPI_INT_EN_OOB_TX_ABT |	\
+	 ESPI_INT_EN_OOB_RX_ABT |	\
+	 ESPI_INT_EN_OOB_TX_CMPLT |	\
+	 ESPI_INT_EN_OOB_RX_CMPLT)
+
+#define ESPI_INT_EN_FLASH_BITS		\
+	(ESPI_INT_EN_FLASH_TX_ERR |	\
+	 ESPI_INT_EN_FLASH_TX_ABT |	\
+	 ESPI_INT_EN_FLASH_RX_ABT |	\
+	 ESPI_INT_EN_FLASH_TX_CMPLT |	\
+	 ESPI_INT_EN_FLASH_RX_CMPLT)
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-flash.c b/drivers/soc/aspeed/aspeed-espi-flash.c
new file mode 100644
index 000000000000..d1ede22f22e3
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-flash.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#include <linux/fs.h>
+#include <linux/of_device.h>
+#include <linux/miscdevice.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+
+#include "aspeed-espi-ioc.h"
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-flash.h"
+
+#define FLASH_MDEV_NAME	"aspeed-espi-flash"
+
+static long aspeed_espi_flash_get_rx(struct file *fp,
+				     struct aspeed_espi_ioc *ioc,
+				     struct aspeed_espi_flash *espi_flash)
+{
+	int i, rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+
+	if (fp->f_flags & O_NONBLOCK) {
+		if (mutex_trylock(&espi_flash->get_rx_mtx))
+			return -EBUSY;
+
+		if (!espi_flash->rx_ready) {
+			rc = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+	} else {
+		mutex_lock(&espi_flash->get_rx_mtx);
+
+		if (!espi_flash->rx_ready) {
+			rc = wait_event_interruptible(espi_flash->wq,
+						      espi_flash->rx_ready);
+			if (rc == -ERESTARTSYS) {
+				rc = -EINTR;
+				goto unlock_mtx_n_out;
+			}
+		}
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_ctrl->map, ESPI_FLASH_RX_CTRL, &reg);
+	cyc = (reg & ESPI_FLASH_RX_CTRL_CYC_MASK) >> ESPI_FLASH_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_FLASH_RX_CTRL_TAG_MASK) >> ESPI_FLASH_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_FLASH_RX_CTRL_LEN_MASK) >> ESPI_FLASH_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	switch (cyc) {
+	case ESPI_FLASH_READ:
+	case ESPI_FLASH_WRITE:
+	case ESPI_FLASH_ERASE:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_flash_rwe);
+		break;
+	case ESPI_FLASH_SUC_CMPLT_D_MIDDLE:
+	case ESPI_FLASH_SUC_CMPLT_D_FIRST:
+	case ESPI_FLASH_SUC_CMPLT_D_LAST:
+	case ESPI_FLASH_SUC_CMPLT_D_ONLY:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_flash_cmplt);
+		break;
+	case ESPI_FLASH_SUC_CMPLT:
+	case ESPI_FLASH_UNSUC_CMPLT:
+		pkt_len = len + sizeof(struct espi_flash_cmplt);
+		break;
+	default:
+		rc = -EFAULT;
+		goto unlock_mtx_n_out;
+	}
+
+	if (ioc->pkt_len < pkt_len) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	if (espi_flash->dma_mode) {
+		memcpy(hdr + 1, espi_flash->dma.rx_virt,
+		       pkt_len - sizeof(*hdr));
+	} else {
+		for (i = sizeof(*hdr); i < pkt_len; ++i) {
+			regmap_read(espi_ctrl->map,
+				    ESPI_FLASH_RX_PORT, &reg);
+			pkt[i] = reg & 0xff;
+		}
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_flash->lock, flags);
+
+	regmap_write_bits(espi_ctrl->map, ESPI_FLASH_RX_CTRL,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV);
+
+	espi_flash->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_flash->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->get_rx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_flash_put_tx(struct file *fp,
+				     struct aspeed_espi_ioc *ioc,
+				     struct aspeed_espi_flash *espi_flash)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+
+	if (!mutex_trylock(&espi_flash->put_tx_mtx))
+		return -EAGAIN;
+
+	regmap_read(espi_ctrl->map, ESPI_FLASH_TX_CTRL, &reg);
+	if (reg & ESPI_FLASH_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_flash->dma_mode) {
+		memcpy(espi_flash->dma.tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_ctrl->map,
+				     ESPI_FLASH_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_FLASH_TX_CTRL_CYC_SHIFT) & ESPI_FLASH_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_FLASH_TX_CTRL_TAG_SHIFT) & ESPI_FLASH_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_FLASH_TX_CTRL_LEN_SHIFT) & ESPI_FLASH_TX_CTRL_LEN_MASK)
+		| ESPI_FLASH_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_ctrl->map, ESPI_FLASH_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->put_tx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_flash_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_flash *espi_flash = container_of(
+			fp->private_data,
+			struct aspeed_espi_flash,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_FLASH_GET_RX:
+		return aspeed_espi_flash_get_rx(fp, &ioc, espi_flash);
+	case ASPEED_ESPI_FLASH_PUT_TX:
+		return aspeed_espi_flash_put_tx(fp, &ioc, espi_flash);
+	};
+
+	return -EINVAL;
+}
+
+void aspeed_espi_flash_event(uint32_t sts, struct aspeed_espi_flash *espi_flash)
+{
+	unsigned long flags;
+
+	if (sts & ESPI_INT_STS_FLASH_RX_CMPLT) {
+		spin_lock_irqsave(&espi_flash->lock, flags);
+		espi_flash->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_flash->lock, flags);
+		wake_up_interruptible(&espi_flash->wq);
+	}
+}
+
+void aspeed_espi_flash_enable(struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_MODE_MASK,
+			   (espi_flash->safs_mode << ESPI_CTRL_FLASH_SW_MODE_SHIFT));
+
+	if (espi_flash->dma_mode) {
+		regmap_write(espi_ctrl->map, ESPI_FLASH_TX_DMA, dma->tx_addr);
+		regmap_write(espi_ctrl->map, ESPI_FLASH_RX_DMA, dma->rx_addr);
+		regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+				   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN,
+				   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN);
+	}
+
+	regmap_write(espi_ctrl->map, ESPI_INT_STS,
+		     ESPI_INT_STS_FLASH_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_FLASH_BITS,
+			   ESPI_INT_EN_FLASH_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_RDY,
+			   ESPI_CTRL_FLASH_SW_RDY);
+}
+
+static const struct file_operations aspeed_espi_flash_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_flash_ioctl,
+};
+
+void *aspeed_espi_flash_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int rc = 0;
+	struct aspeed_espi_flash *espi_flash;
+	struct aspeed_espi_flash_dma *dma;
+
+	espi_flash = devm_kzalloc(dev, sizeof(*espi_flash), GFP_KERNEL);
+	if (!espi_flash)
+		return ERR_PTR(-ENOMEM);
+
+	espi_flash->ctrl = espi_ctrl;
+
+	init_waitqueue_head(&espi_flash->wq);
+
+	spin_lock_init(&espi_flash->lock);
+
+	mutex_init(&espi_flash->put_tx_mtx);
+	mutex_init(&espi_flash->get_rx_mtx);
+
+	if (of_property_read_bool(dev->of_node, "flash,dma-mode"))
+		espi_flash->dma_mode = 1;
+
+	of_property_read_u32(dev->of_node, "flash,safs-mode", &espi_flash->safs_mode);
+	if (espi_flash->safs_mode >= SAFS_MODES) {
+		dev_err(dev, "invalid SAFS mode\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (espi_flash->dma_mode) {
+		dma = &espi_flash->dma;
+
+		dma->tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+						  &dma->tx_addr, GFP_KERNEL);
+		if (!dma->tx_virt) {
+			dev_err(dev, "cannot allocate DMA TX buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+
+		dma->rx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+						  &dma->rx_addr, GFP_KERNEL);
+		if (!dma->rx_virt) {
+			dev_err(dev, "cannot allocate DMA RX buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	espi_flash->mdev.parent = dev;
+	espi_flash->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_flash->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", FLASH_MDEV_NAME);
+	espi_flash->mdev.fops = &aspeed_espi_flash_fops;
+	rc = misc_register(&espi_flash->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return ERR_PTR(rc);
+	}
+
+	aspeed_espi_flash_enable(espi_flash);
+
+	return espi_flash;
+}
+
+void aspeed_espi_flash_free(struct device *dev, struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+
+	if (espi_flash->dma_mode) {
+		dma_free_coherent(dev, PAGE_SIZE, dma->tx_virt, dma->tx_addr);
+		dma_free_coherent(dev, PAGE_SIZE, dma->rx_virt, dma->rx_addr);
+	}
+
+	mutex_destroy(&espi_flash->put_tx_mtx);
+	mutex_destroy(&espi_flash->get_rx_mtx);
+
+	misc_deregister(&espi_flash->mdev);
+}
diff --git a/drivers/soc/aspeed/aspeed-espi-flash.h b/drivers/soc/aspeed/aspeed-espi-flash.h
new file mode 100644
index 000000000000..bd5177329e50
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-flash.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_FLASH_H_
+#define _ASPEED_ESPI_FLASH_H_
+
+enum aspeed_espi_flash_safs_mode {
+	SAFS_MODE_MIX,
+	SAFS_MODE_SW,
+	SAFS_MODE_HW,
+	SAFS_MODES,
+};
+
+struct aspeed_espi_flash_dma {
+	void *tx_virt;
+	dma_addr_t tx_addr;
+	void *rx_virt;
+	dma_addr_t rx_addr;
+};
+
+struct aspeed_espi_flash {
+	uint32_t safs_mode;
+
+	uint32_t dma_mode;
+	struct aspeed_espi_flash_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	struct mutex get_rx_mtx;
+	struct mutex put_tx_mtx;
+
+	spinlock_t lock;
+
+	struct miscdevice mdev;
+	struct aspeed_espi_ctrl *ctrl;
+};
+
+void aspeed_espi_flash_event(uint32_t sts, struct aspeed_espi_flash *espi_flash);
+void aspeed_espi_flash_enable(struct aspeed_espi_flash *espi_flash);
+void *aspeed_espi_flash_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl);
+void aspeed_espi_flash_free(struct device *dev, struct aspeed_espi_flash *espi_flash);
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-ioc.h b/drivers/soc/aspeed/aspeed-espi-ioc.h
new file mode 100644
index 000000000000..a78f1069841f
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ioc.h
@@ -0,0 +1,195 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_IOC_H
+#define _ASPEED_ESPI_IOC_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/*
+ * eSPI cycle type encoding
+ *
+ * Section 5.1 Cycle Types and Packet Format,
+ * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ */
+#define ESPI_PERIF_MEMRD32		0x00
+#define ESPI_PERIF_MEMRD64		0x02
+#define ESPI_PERIF_MEMWR32		0x01
+#define ESPI_PERIF_MEMWR64		0x03
+#define ESPI_PERIF_MSG			0x10
+#define ESPI_PERIF_MSG_D		0x11
+#define ESPI_PERIF_SUC_CMPLT		0x06
+#define ESPI_PERIF_SUC_CMPLT_D_MIDDLE	0x09
+#define ESPI_PERIF_SUC_CMPLT_D_FIRST	0x0b
+#define ESPI_PERIF_SUC_CMPLT_D_LAST	0x0d
+#define ESPI_PERIF_SUC_CMPLT_D_ONLY	0x0f
+#define ESPI_PERIF_UNSUC_CMPLT		0x0c
+#define ESPI_OOB_MSG			0x21
+#define ESPI_FLASH_READ			0x00
+#define ESPI_FLASH_WRITE		0x01
+#define ESPI_FLASH_ERASE		0x02
+#define ESPI_FLASH_SUC_CMPLT		0x06
+#define ESPI_FLASH_SUC_CMPLT_D_MIDDLE	0x09
+#define ESPI_FLASH_SUC_CMPLT_D_FIRST	0x0b
+#define ESPI_FLASH_SUC_CMPLT_D_LAST	0x0d
+#define ESPI_FLASH_SUC_CMPLT_D_ONLY	0x0f
+#define ESPI_FLASH_UNSUC_CMPLT		0x0c
+
+/*
+ * eSPI packet format structure
+ *
+ * Section 5.1 Cycle Types and Packet Format,
+ * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ */
+struct espi_comm_hdr {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+};
+
+struct espi_perif_mem32 {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __packed;
+
+struct espi_perif_mem64 {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __packed;
+
+struct espi_perif_msg {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t msg_code;
+	uint8_t msg_byte[4];
+	uint8_t data[];
+} __packed;
+
+struct espi_perif_cmplt {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+} __packed;
+
+struct espi_oob_msg {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+};
+
+struct espi_flash_rwe {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __packed;
+
+struct espi_flash_cmplt {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+} __packed;
+
+struct aspeed_espi_ioc {
+	uint32_t pkt_len;
+	uint8_t *pkt;
+};
+
+/*
+ * we choose the longest header and the max payload size
+ * based on the Intel specification to define the maximum
+ * eSPI packet length
+ */
+#define ESPI_PLD_LEN_MIN	(1UL << 6)
+#define ESPI_PLD_LEN_MAX	(1UL << 12)
+#define ESPI_PKT_LEN_MAX	(sizeof(struct espi_perif_msg) + ESPI_PLD_LEN_MAX)
+
+#define __ASPEED_ESPI_IOCTL_MAGIC	0xb8
+
+/*
+ * The IOCTL-based interface works in the eSPI packet in/out paradigm.
+ *
+ * Only the virtual wire IOCTL is a special case which does not send
+ * or receive an eSPI packet. However, to keep a more consisten use from
+ * userspace, we make all of the four channel drivers serve through the
+ * IOCTL interface.
+ *
+ * For the eSPI packet format, refer to
+ *   Section 5.1 Cycle Types and Packet Format,
+ *   Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ *
+ * For the example user apps using these IOCTL, refer to
+ *   https://github.com/AspeedTech-BMC/aspeed_app/tree/master/espi_test
+ */
+
+/*
+ * Peripheral Channel (CH0)
+ *  - ASPEED_ESPI_PERIF_PC_GET_RX
+ *      Receive an eSPI Posted/Completion packet
+ *  - ASPEED_ESPI_PERIF_PC_PUT_TX
+ *      Transmit an eSPI Posted/Completion packet
+ *  - ASPEED_ESPI_PERIF_NP_PUT_TX
+ *      Transmit an eSPI Non-Posted packet
+ */
+#define ASPEED_ESPI_PERIF_PC_GET_RX	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x00, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_PERIF_PC_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x01, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_PERIF_NP_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x02, struct aspeed_espi_ioc)
+/*
+ * Virtual Wire Channel (CH1)
+ *  - ASPEED_ESPI_VW_GET_GPIO_VAL
+ *      Read the input value of GPIO over the VW channel
+ *  - ASPEED_ESPI_VW_PUT_GPIO_VAL
+ *      Write the output value of GPIO over the VW channel
+ */
+#define ASPEED_ESPI_VW_GET_GPIO_VAL	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x10, uint8_t)
+#define ASPEED_ESPI_VW_PUT_GPIO_VAL	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x11, uint8_t)
+/*
+ * Out-of-band Channel (CH2)
+ *  - ASPEED_ESPI_OOB_GET_RX
+ *      Receive an eSPI OOB packet
+ *  - ASPEED_ESPI_OOB_PUT_TX
+ *      Transmit an eSPI OOB packet
+ */
+#define ASPEED_ESPI_OOB_GET_RX		_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x20, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_OOB_PUT_TX		_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x21, struct aspeed_espi_ioc)
+/*
+ * Flash Channel (CH3)
+ *  - ASPEED_ESPI_FLASH_GET_RX
+ *      Receive an eSPI flash packet
+ *  - ASPEED_ESPI_FLASH_PUT_TX
+ *      Transmit an eSPI flash packet
+ */
+#define ASPEED_ESPI_FLASH_GET_RX	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x30, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_FLASH_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x31, struct aspeed_espi_ioc)
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-oob.c b/drivers/soc/aspeed/aspeed-espi-oob.c
new file mode 100644
index 000000000000..2e0cc427b6c1
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-oob.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#include <linux/fs.h>
+#include <linux/of_device.h>
+#include <linux/miscdevice.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+
+#include "aspeed-espi-ioc.h"
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-oob.h"
+
+#define OOB_MDEV_NAME	"aspeed-espi-oob"
+
+/* DMA descriptor is supported since AST2600 */
+#define OOB_DMA_DESC_MAX_NUM	1024
+#define OOB_DMA_TX_DESC_CUST	0x04
+
+/* descriptor-based RX DMA handling */
+static long aspeed_espi_oob_dma_desc_get_rx(struct file *fp,
+					    struct aspeed_espi_ioc *ioc,
+					    struct aspeed_espi_oob *espi_oob)
+{
+	int rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t wptr, sptr;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	struct oob_rx_dma_desc *d;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_oob->ctrl;
+
+	regmap_read(espi_ctrl->map, ESPI_OOB_RX_DMA_WS_PTR, &reg);
+	wptr = (reg & ESPI_OOB_RX_DMA_WS_PTR_WP_MASK) >> ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT;
+	sptr = (reg & ESPI_OOB_RX_DMA_WS_PTR_SP_MASK) >> ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT;
+
+	d = &espi_oob->dma.rx_desc[sptr];
+
+	if (!d->dirty)
+		return -EFAULT;
+
+	pkt_len = ((d->len) ? d->len : 0x1000) + sizeof(struct espi_comm_hdr);
+
+	if (ioc->pkt_len < pkt_len)
+		return -EINVAL;
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt)
+		return -ENOMEM;
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = d->cyc;
+	hdr->tag = d->tag;
+	hdr->len_h = d->len >> 8;
+	hdr->len_l = d->len & 0xff;
+	memcpy(hdr + 1, espi_oob->dma.rx_virt + (PAGE_SIZE * sptr), pkt_len - sizeof(*hdr));
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_oob->lock, flags);
+
+	/* make current descriptor available again */
+	d->dirty = 0;
+
+	sptr = (sptr + 1) % espi_oob->dma.rx_desc_num;
+	wptr = (wptr + 1) % espi_oob->dma.rx_desc_num;
+
+	reg = ((wptr << ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT) & ESPI_OOB_RX_DMA_WS_PTR_WP_MASK)
+		| ((sptr << ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT) & ESPI_OOB_RX_DMA_WS_PTR_SP_MASK)
+		| ESPI_OOB_RX_DMA_WS_PTR_RECV_EN;
+	regmap_write(espi_ctrl->map, ESPI_OOB_RX_DMA_WS_PTR, reg);
+
+	/* set ready flag base on the next RX descriptor */
+	espi_oob->rx_ready = espi_oob->dma.rx_desc[sptr].dirty;
+
+	spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_get_rx(struct file *fp,
+				   struct aspeed_espi_ioc *ioc,
+				   struct aspeed_espi_oob *espi_oob)
+{
+	int i, rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_oob->ctrl;
+
+	if (fp->f_flags & O_NONBLOCK) {
+		if (mutex_trylock(&espi_oob->get_rx_mtx))
+			return -EBUSY;
+
+		if (!espi_oob->rx_ready) {
+			rc = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+	} else {
+		mutex_lock(&espi_oob->get_rx_mtx);
+
+		if (!espi_oob->rx_ready) {
+			rc = wait_event_interruptible(espi_oob->wq,
+						      espi_oob->rx_ready);
+			if (rc == -ERESTARTSYS) {
+				rc = -EINTR;
+				goto unlock_mtx_n_out;
+			}
+		}
+	}
+
+	if (espi_oob->dma_mode && espi_ctrl->model->version != ESPI_AST2500) {
+		rc = aspeed_espi_oob_dma_desc_get_rx(fp, ioc, espi_oob);
+		goto unlock_mtx_n_out;
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_ctrl->map, ESPI_OOB_RX_CTRL, &reg);
+	cyc = (reg & ESPI_OOB_RX_CTRL_CYC_MASK) >> ESPI_OOB_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_OOB_RX_CTRL_TAG_MASK) >> ESPI_OOB_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_OOB_RX_CTRL_LEN_MASK) >> ESPI_OOB_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) + sizeof(struct espi_comm_hdr);
+
+	if (ioc->pkt_len < pkt_len) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	if (espi_oob->dma_mode) {
+		memcpy(hdr + 1, espi_oob->dma.rx_virt,
+		       pkt_len - sizeof(*hdr));
+	} else {
+		for (i = sizeof(*hdr); i < pkt_len; ++i) {
+			regmap_read(espi_ctrl->map,
+				    ESPI_OOB_RX_PORT, &reg);
+			pkt[i] = reg & 0xff;
+		}
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_oob->lock, flags);
+
+	regmap_write_bits(espi_ctrl->map, ESPI_OOB_RX_CTRL,
+			  ESPI_OOB_RX_CTRL_PEND_SERV,
+			  ESPI_OOB_RX_CTRL_PEND_SERV);
+
+	espi_oob->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_oob->get_rx_mtx);
+
+	return rc;
+}
+
+/* descriptor-based TX DMA handling */
+static long aspeed_espi_oob_dma_desc_put_tx(struct file *fp,
+					    struct aspeed_espi_ioc *ioc,
+					    struct aspeed_espi_oob *espi_oob)
+{
+	int rc = 0;
+	uint32_t rptr, wptr;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct oob_tx_dma_desc *d;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_oob->ctrl;
+
+	pkt = vzalloc(ioc->pkt_len);
+	if (!pkt)
+		return -ENOMEM;
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/* kick HW to reflect the up-to-date read/write pointer */
+	regmap_write(espi_ctrl->map, ESPI_OOB_TX_DMA_RD_PTR,
+		     ESPI_OOB_TX_DMA_RD_PTR_UPDATE);
+
+	regmap_read(espi_ctrl->map, ESPI_OOB_TX_DMA_RD_PTR, &rptr);
+	regmap_read(espi_ctrl->map, ESPI_OOB_TX_DMA_WR_PTR, &wptr);
+
+	if (((wptr + 1) % espi_oob->dma.tx_desc_num) == rptr) {
+		rc = -EBUSY;
+		goto free_n_out;
+	}
+
+	d = &espi_oob->dma.tx_desc[wptr];
+	d->cyc = hdr->cyc;
+	d->tag = hdr->tag;
+	d->len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+	d->msg_type = OOB_DMA_TX_DESC_CUST;
+
+	memcpy(espi_oob->dma.tx_virt + (PAGE_SIZE * wptr), hdr + 1,
+	       ioc->pkt_len - sizeof(*hdr));
+
+	dma_wmb();
+
+	wptr = (wptr + 1) % espi_oob->dma.tx_desc_num;
+	wptr |= ESPI_OOB_TX_DMA_WR_PTR_SEND_EN;
+	regmap_write(espi_ctrl->map, ESPI_OOB_TX_DMA_WR_PTR, wptr);
+
+free_n_out:
+	vfree(pkt);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_put_tx(struct file *fp,
+				   struct aspeed_espi_ioc *ioc,
+				   struct aspeed_espi_oob *espi_oob)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_oob->ctrl;
+
+	if (!mutex_trylock(&espi_oob->put_tx_mtx))
+		return -EBUSY;
+
+	if (espi_oob->dma_mode && espi_ctrl->model->version != ESPI_AST2500) {
+		rc = aspeed_espi_oob_dma_desc_put_tx(fp, ioc, espi_oob);
+		goto unlock_mtx_n_out;
+	}
+
+	regmap_read(espi_ctrl->map, ESPI_OOB_TX_CTRL, &reg);
+	if (reg & ESPI_OOB_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_mtx_n_out;
+	}
+
+	if (ioc->pkt_len > ESPI_PKT_LEN_MAX) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_oob->dma_mode) {
+		memcpy(espi_oob->dma.tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_ctrl->map,
+				     ESPI_OOB_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_OOB_TX_CTRL_CYC_SHIFT) & ESPI_OOB_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_OOB_TX_CTRL_TAG_SHIFT) & ESPI_OOB_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_OOB_TX_CTRL_LEN_SHIFT) & ESPI_OOB_TX_CTRL_LEN_MASK)
+		| ESPI_OOB_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_ctrl->map, ESPI_OOB_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_oob->put_tx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_oob *espi_oob = container_of(
+			fp->private_data,
+			struct aspeed_espi_oob,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_OOB_GET_RX:
+		return aspeed_espi_oob_get_rx(fp, &ioc, espi_oob);
+	case ASPEED_ESPI_OOB_PUT_TX:
+		return aspeed_espi_oob_put_tx(fp, &ioc, espi_oob);
+	};
+
+	return -EINVAL;
+}
+
+void aspeed_espi_oob_event(uint32_t sts, struct aspeed_espi_oob *espi_oob)
+{
+	unsigned long flags;
+
+	if (sts & ESPI_INT_STS_OOB_RX_CMPLT) {
+		spin_lock_irqsave(&espi_oob->lock, flags);
+		espi_oob->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+		wake_up_interruptible(&espi_oob->wq);
+	}
+}
+
+void aspeed_espi_oob_enable(struct aspeed_espi_oob *espi_oob)
+{
+	int i;
+	struct aspeed_espi_oob_dma *dma = &espi_oob->dma;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_oob->ctrl;
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_SW_RDY | ESPI_CTRL_OOB_RX_SW_RST, 0);
+
+	if (espi_oob->dma_mode)
+		regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+				   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN, 0);
+	else
+		regmap_write(espi_ctrl->map, ESPI_OOB_RX_CTRL, ESPI_OOB_RX_CTRL_PEND_SERV);
+
+	/*
+	 * cleanup OOB RX FIFO to get rid of the data
+	 * of OOB early init side-effect
+	 */
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_RX_SW_RST, ESPI_CTRL_OOB_RX_SW_RST);
+
+	regmap_write(espi_ctrl->map, ESPI_OOB_RX_CTRL,
+		     ESPI_OOB_RX_CTRL_PEND_SERV);
+
+	if (espi_oob->dma_mode) {
+		regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+				   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN,
+				   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN);
+
+		if (espi_ctrl->model->version == ESPI_AST2500) {
+			regmap_write(espi_ctrl->map, ESPI_OOB_TX_DMA, dma->tx_addr);
+			regmap_write(espi_ctrl->map, ESPI_OOB_RX_DMA, dma->rx_addr);
+		} else {
+			for (i = 0; i < dma->tx_desc_num; ++i)
+				dma->tx_desc[i].data_addr = dma->tx_addr + (i * PAGE_SIZE);
+
+			for (i = 0; i < dma->rx_desc_num; ++i) {
+				dma->rx_desc[i].data_addr = dma->rx_addr + (i * PAGE_SIZE);
+				dma->rx_desc[i].dirty = 0;
+			}
+
+			regmap_write(espi_ctrl->map, ESPI_OOB_TX_DMA, dma->tx_desc_addr);
+			regmap_write(espi_ctrl->map, ESPI_OOB_TX_DMA_RB_SIZE, dma->tx_desc_num);
+
+			regmap_write(espi_ctrl->map, ESPI_OOB_RX_DMA, dma->rx_desc_addr);
+			regmap_write(espi_ctrl->map, ESPI_OOB_RX_DMA_RB_SIZE, dma->rx_desc_num);
+			regmap_update_bits(espi_ctrl->map, ESPI_OOB_RX_DMA_WS_PTR,
+					   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN,
+					   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN);
+		}
+	}
+
+	regmap_write(espi_ctrl->map, ESPI_INT_STS,
+		     ESPI_INT_STS_OOB_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_OOB_BITS,
+			   ESPI_INT_EN_OOB_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_SW_RDY,
+			   ESPI_CTRL_OOB_SW_RDY);
+}
+
+static const struct file_operations aspeed_espi_oob_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_oob_ioctl,
+};
+
+void *aspeed_espi_oob_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int rc = 0;
+	struct aspeed_espi_oob *espi_oob;
+	struct aspeed_espi_oob_dma *dma;
+
+	espi_oob = devm_kzalloc(dev, sizeof(*espi_oob), GFP_KERNEL);
+	if (!espi_oob)
+		return ERR_PTR(-ENOMEM);
+
+	espi_oob->ctrl = espi_ctrl;
+
+	init_waitqueue_head(&espi_oob->wq);
+
+	spin_lock_init(&espi_oob->lock);
+
+	mutex_init(&espi_oob->put_tx_mtx);
+	mutex_init(&espi_oob->get_rx_mtx);
+
+	if (of_property_read_bool(dev->of_node, "oob,dma-mode"))
+		espi_oob->dma_mode = 1;
+
+	if (espi_oob->dma_mode) {
+		dma = &espi_oob->dma;
+
+		/* Descriptor based OOB DMA is supported since AST2600 */
+		if (espi_ctrl->model->version != ESPI_AST2500) {
+			of_property_read_u32(dev->of_node, "oob,dma-tx-desc-num",
+					     &dma->tx_desc_num);
+			of_property_read_u32(dev->of_node, "oob,dma-rx-desc-num",
+					     &dma->rx_desc_num);
+
+			if (!dma->tx_desc_num || !dma->rx_desc_num) {
+				dev_err(dev, "invalid zero number of DMA channels\n");
+				return ERR_PTR(-EINVAL);
+			}
+
+			if (dma->tx_desc_num >= OOB_DMA_DESC_MAX_NUM ||
+			    dma->rx_desc_num >= OOB_DMA_DESC_MAX_NUM) {
+				dev_err(dev, "too many number of DMA channels\n");
+				return ERR_PTR(-EINVAL);
+			}
+
+			dma->tx_desc = dma_alloc_coherent(dev,
+							  sizeof(*dma->tx_desc) * dma->tx_desc_num,
+							  &dma->tx_desc_addr, GFP_KERNEL);
+			if (!dma->tx_desc) {
+				dev_err(dev, "cannot allocate DMA TX descriptor\n");
+				return ERR_PTR(-ENOMEM);
+			}
+
+			dma->rx_desc = dma_alloc_coherent(dev,
+							  sizeof(*dma->rx_desc) * dma->rx_desc_num,
+							  &dma->rx_desc_addr, GFP_KERNEL);
+			if (!dma->rx_desc) {
+				dev_err(dev, "cannot allocate DMA RX descriptor\n");
+				return ERR_PTR(-ENOMEM);
+			}
+		}
+
+		/*
+		 * DMA descriptors are consumed in the circular
+		 * queue paradigm. Therefore, one dummy slot is
+		 * reserved to detect the full condition.
+		 *
+		 * For AST2500 without DMA descriptors supported,
+		 * the number of the queue slot should be 1 here.
+		 */
+		dma->tx_desc_num += 1;
+		dma->rx_desc_num += 1;
+
+		dma->tx_virt = dma_alloc_coherent(dev, PAGE_SIZE * dma->tx_desc_num,
+						  &dma->tx_addr, GFP_KERNEL);
+		if (!dma->tx_virt) {
+			dev_err(dev, "cannot allocate DMA TX buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+
+		dma->rx_virt = dma_alloc_coherent(dev, PAGE_SIZE * dma->rx_desc_num,
+						  &dma->rx_addr, GFP_KERNEL);
+		if (!dma->rx_virt) {
+			dev_err(dev, "cannot allocate DMA RX buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	espi_oob->mdev.parent = dev;
+	espi_oob->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_oob->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", OOB_MDEV_NAME);
+	espi_oob->mdev.fops = &aspeed_espi_oob_fops;
+	rc = misc_register(&espi_oob->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return ERR_PTR(rc);
+	}
+
+	aspeed_espi_oob_enable(espi_oob);
+
+	return espi_oob;
+}
+
+void aspeed_espi_oob_free(struct device *dev, struct aspeed_espi_oob *espi_oob)
+{
+	struct aspeed_espi_oob_dma *dma = &espi_oob->dma;
+
+	if (espi_oob->dma_mode) {
+		dma_free_coherent(dev, sizeof(*dma->tx_desc) * dma->tx_desc_num,
+				  dma->tx_desc, dma->tx_desc_addr);
+		dma_free_coherent(dev, sizeof(*dma->rx_desc) * dma->rx_desc_num,
+				  dma->rx_desc, dma->rx_desc_addr);
+		dma_free_coherent(dev, PAGE_SIZE * dma->tx_desc_num,
+				  dma->tx_virt, dma->tx_addr);
+		dma_free_coherent(dev, PAGE_SIZE * dma->rx_desc_num,
+				  dma->rx_virt, dma->rx_addr);
+	}
+
+	mutex_destroy(&espi_oob->put_tx_mtx);
+	mutex_destroy(&espi_oob->get_rx_mtx);
+
+	misc_deregister(&espi_oob->mdev);
+}
diff --git a/drivers/soc/aspeed/aspeed-espi-oob.h b/drivers/soc/aspeed/aspeed-espi-oob.h
new file mode 100644
index 000000000000..03d74ef39e8b
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-oob.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_OOB_H_
+#define _ASPEED_ESPI_OOB_H_
+
+struct oob_tx_dma_desc {
+	uint32_t data_addr;
+	uint8_t cyc;
+	uint16_t tag : 4;
+	uint16_t len : 12;
+	uint8_t msg_type : 3;
+	uint8_t raz0 : 1;
+	uint8_t pec : 1;
+	uint8_t int_en : 1;
+	uint8_t pause : 1;
+	uint8_t raz1 : 1;
+	uint32_t raz2;
+	uint32_t raz3;
+} __packed;
+
+struct oob_rx_dma_desc {
+	uint32_t data_addr;
+	uint8_t cyc;
+	uint16_t tag : 4;
+	uint16_t len : 12;
+	uint8_t raz : 7;
+	uint8_t dirty : 1;
+} __packed;
+
+struct aspeed_espi_oob_dma {
+	uint32_t tx_desc_num;
+	uint32_t rx_desc_num;
+
+	struct oob_tx_dma_desc *tx_desc;
+	dma_addr_t tx_desc_addr;
+
+	struct oob_rx_dma_desc *rx_desc;
+	dma_addr_t rx_desc_addr;
+
+	void *tx_virt;
+	dma_addr_t tx_addr;
+
+	void *rx_virt;
+	dma_addr_t rx_addr;
+};
+
+struct aspeed_espi_oob {
+	uint32_t dma_mode;
+	struct aspeed_espi_oob_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	struct mutex get_rx_mtx;
+	struct mutex put_tx_mtx;
+
+	spinlock_t lock;
+
+	struct miscdevice mdev;
+	struct aspeed_espi_ctrl *ctrl;
+};
+
+void aspeed_espi_oob_event(uint32_t sts, struct aspeed_espi_oob *espi_oob);
+void aspeed_espi_oob_enable(struct aspeed_espi_oob *espi_oob);
+void *aspeed_espi_oob_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl);
+void aspeed_espi_oob_free(struct device *dev, struct aspeed_espi_oob *espi_oob);
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-perif.c b/drivers/soc/aspeed/aspeed-espi-perif.c
new file mode 100644
index 000000000000..ebf3d9978b4a
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-perif.c
@@ -0,0 +1,511 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#include <linux/fs.h>
+#include <linux/of_device.h>
+#include <linux/miscdevice.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+
+#include "aspeed-espi-ioc.h"
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-perif.h"
+
+#define PERIF_MDEV_NAME		"aspeed-espi-peripheral"
+#define PERIF_MEMCYC_UNLOCK_KEY	0xfedc756e
+#define PERIF_MEMCYC_SIZE_MIN	0x10000
+
+static long aspeed_espi_perif_pc_get_rx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	unsigned long flags;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_perif->ctrl;
+
+	if (fp->f_flags & O_NONBLOCK) {
+		if (mutex_trylock(&espi_perif->pc_rx_mtx))
+			return -EBUSY;
+
+		if (!espi_perif->rx_ready) {
+			rc = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+	} else {
+		mutex_lock(&espi_perif->pc_rx_mtx);
+
+		if (!espi_perif->rx_ready) {
+			rc = wait_event_interruptible(espi_perif->wq,
+						      espi_perif->rx_ready);
+			if (rc == -ERESTARTSYS) {
+				rc = -EINTR;
+				goto unlock_mtx_n_out;
+			}
+		}
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_ctrl->map, ESPI_PERIF_PC_RX_CTRL, &reg);
+	cyc = (reg & ESPI_PERIF_PC_RX_CTRL_CYC_MASK) >> ESPI_PERIF_PC_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_PERIF_PC_RX_CTRL_TAG_MASK) >> ESPI_PERIF_PC_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_PERIF_PC_RX_CTRL_LEN_MASK) >> ESPI_PERIF_PC_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	switch (cyc) {
+	case ESPI_PERIF_MSG:
+		pkt_len = len + sizeof(struct espi_perif_msg);
+		break;
+	case ESPI_PERIF_MSG_D:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_perif_msg);
+		break;
+	case ESPI_PERIF_SUC_CMPLT_D_MIDDLE:
+	case ESPI_PERIF_SUC_CMPLT_D_FIRST:
+	case ESPI_PERIF_SUC_CMPLT_D_LAST:
+	case ESPI_PERIF_SUC_CMPLT_D_ONLY:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_perif_cmplt);
+		break;
+	case ESPI_PERIF_SUC_CMPLT:
+	case ESPI_PERIF_UNSUC_CMPLT:
+		pkt_len = len + sizeof(struct espi_perif_cmplt);
+		break;
+	default:
+		rc = -EFAULT;
+		goto unlock_mtx_n_out;
+	}
+
+	if (ioc->pkt_len < pkt_len) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	if (espi_perif->dma_mode) {
+		memcpy(hdr + 1, espi_perif->dma.pc_rx_virt,
+		       pkt_len - sizeof(*hdr));
+	} else {
+		for (i = sizeof(*hdr); i < pkt_len; ++i) {
+			regmap_read(espi_ctrl->map,
+				    ESPI_PERIF_PC_RX_PORT, &reg);
+			pkt[i] = reg & 0xff;
+		}
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_perif->lock, flags);
+
+	regmap_write_bits(espi_ctrl->map, ESPI_PERIF_PC_RX_CTRL,
+			  ESPI_PERIF_PC_RX_CTRL_PEND_SERV,
+			  ESPI_PERIF_PC_RX_CTRL_PEND_SERV);
+
+	espi_perif->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_perif->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_perif->pc_rx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_perif_pc_put_tx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_perif->ctrl;
+
+	if (!mutex_trylock(&espi_perif->pc_tx_mtx))
+		return -EAGAIN;
+
+	regmap_read(espi_ctrl->map, ESPI_PERIF_PC_TX_CTRL, &reg);
+	if (reg & ESPI_PERIF_PC_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_perif->dma_mode) {
+		memcpy(espi_perif->dma.pc_tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_ctrl->map,
+				     ESPI_PERIF_PC_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_PERIF_PC_TX_CTRL_CYC_SHIFT) & ESPI_PERIF_PC_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_PERIF_PC_TX_CTRL_TAG_SHIFT) & ESPI_PERIF_PC_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_PERIF_PC_TX_CTRL_LEN_SHIFT) & ESPI_PERIF_PC_TX_CTRL_LEN_MASK)
+		| ESPI_PERIF_PC_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_ctrl->map, ESPI_PERIF_PC_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_n_out:
+	mutex_unlock(&espi_perif->pc_tx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_perif_np_put_tx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_perif->ctrl;
+
+	if (!mutex_trylock(&espi_perif->np_tx_mtx))
+		return -EAGAIN;
+
+	regmap_read(espi_ctrl->map, ESPI_PERIF_NP_TX_CTRL, &reg);
+	if (reg & ESPI_PERIF_NP_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_perif->dma_mode) {
+		memcpy(espi_perif->dma.np_tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_ctrl->map,
+				     ESPI_PERIF_NP_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_PERIF_NP_TX_CTRL_CYC_SHIFT) & ESPI_PERIF_NP_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_PERIF_NP_TX_CTRL_TAG_SHIFT) & ESPI_PERIF_NP_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_PERIF_NP_TX_CTRL_LEN_SHIFT) & ESPI_PERIF_NP_TX_CTRL_LEN_MASK)
+		| ESPI_PERIF_NP_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_ctrl->map, ESPI_PERIF_NP_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_n_out:
+	mutex_unlock(&espi_perif->np_tx_mtx);
+
+	return rc;
+
+}
+
+static long aspeed_espi_perif_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_perif *espi_perif = container_of(
+			fp->private_data,
+			struct aspeed_espi_perif,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_PERIF_PC_GET_RX:
+		return aspeed_espi_perif_pc_get_rx(fp, &ioc, espi_perif);
+	case ASPEED_ESPI_PERIF_PC_PUT_TX:
+		return aspeed_espi_perif_pc_put_tx(fp, &ioc, espi_perif);
+	case ASPEED_ESPI_PERIF_NP_PUT_TX:
+		return aspeed_espi_perif_np_put_tx(fp, &ioc, espi_perif);
+	};
+
+	return -EINVAL;
+}
+
+static int aspeed_espi_perif_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	struct aspeed_espi_perif *espi_perif = container_of(
+			fp->private_data,
+			struct aspeed_espi_perif,
+			mdev);
+	unsigned long vm_size = vma->vm_end - vma->vm_start;
+	pgprot_t prot = vma->vm_page_prot;
+
+	if (!espi_perif->mcyc_enable)
+		return -EPERM;
+
+	if (((vma->vm_pgoff << PAGE_SHIFT) + vm_size) > espi_perif->mcyc_size)
+		return -EINVAL;
+
+	prot = pgprot_noncached(prot);
+
+	if (remap_pfn_range(vma, vma->vm_start,
+			    (espi_perif->mcyc_taddr >> PAGE_SHIFT) + vma->vm_pgoff,
+			    vm_size, prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+void aspeed_espi_perif_event(uint32_t sts, struct aspeed_espi_perif *espi_perif)
+{
+	unsigned long flags;
+
+	if (sts & ESPI_INT_STS_PERIF_PC_RX_CMPLT) {
+		spin_lock_irqsave(&espi_perif->lock, flags);
+		espi_perif->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_perif->lock, flags);
+
+		wake_up_interruptible(&espi_perif->wq);
+	}
+}
+
+void aspeed_espi_perif_enable(struct aspeed_espi_perif *espi_perif)
+{
+	struct aspeed_espi_perif_dma *dma = &espi_perif->dma;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_perif->ctrl;
+
+	if (espi_perif->mcyc_enable) {
+		if (espi_ctrl->model->version == ESPI_AST2500) {
+			regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_MASK,
+				     PERIF_MEMCYC_UNLOCK_KEY);
+			regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_MASK,
+				     espi_perif->mcyc_mask);
+		} else {
+			regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_MASK,
+				     espi_perif->mcyc_mask | ESPI_PERIF_PC_RX_MASK_CFG_WP);
+			regmap_update_bits(espi_ctrl->map, ESPI_CTRL2,
+					   ESPI_CTRL2_MEMCYC_RD_DIS | ESPI_CTRL2_MEMCYC_WR_DIS, 0);
+		}
+
+		regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_SADDR, espi_perif->mcyc_saddr);
+		regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_TADDR, espi_perif->mcyc_taddr);
+	}
+
+	if (espi_perif->dma_mode) {
+		regmap_write(espi_ctrl->map, ESPI_PERIF_PC_RX_DMA, dma->pc_rx_addr);
+		regmap_write(espi_ctrl->map, ESPI_PERIF_PC_TX_DMA, dma->pc_tx_addr);
+		regmap_write(espi_ctrl->map, ESPI_PERIF_NP_TX_DMA, dma->np_tx_addr);
+
+		regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+				   ESPI_CTRL_PERIF_NP_TX_DMA_EN |
+				   ESPI_CTRL_PERIF_PC_TX_DMA_EN |
+				   ESPI_CTRL_PERIF_PC_RX_DMA_EN,
+				   ESPI_CTRL_PERIF_NP_TX_DMA_EN |
+				   ESPI_CTRL_PERIF_PC_TX_DMA_EN |
+				   ESPI_CTRL_PERIF_PC_RX_DMA_EN);
+	}
+
+	regmap_write(espi_ctrl->map, ESPI_INT_STS,
+		     ESPI_INT_STS_PERIF_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_PERIF_BITS,
+			   ESPI_INT_EN_PERIF_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_PERIF_SW_RDY,
+			   ESPI_CTRL_PERIF_SW_RDY);
+}
+
+static const struct file_operations aspeed_espi_perif_fops = {
+	.owner = THIS_MODULE,
+	.mmap = aspeed_espi_perif_mmap,
+	.unlocked_ioctl = aspeed_espi_perif_ioctl,
+};
+
+void *aspeed_espi_perif_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int rc;
+	struct aspeed_espi_perif *espi_perif;
+	struct aspeed_espi_perif_dma *dma;
+
+	espi_perif = devm_kzalloc(dev, sizeof(*espi_perif), GFP_KERNEL);
+	if (!espi_perif)
+		return ERR_PTR(-ENOMEM);
+
+	espi_perif->ctrl = espi_ctrl;
+
+	init_waitqueue_head(&espi_perif->wq);
+
+	spin_lock_init(&espi_perif->lock);
+
+	mutex_init(&espi_perif->pc_rx_mtx);
+	mutex_init(&espi_perif->pc_tx_mtx);
+	mutex_init(&espi_perif->np_tx_mtx);
+
+	espi_perif->mcyc_enable = of_property_read_bool(dev->of_node, "perif,memcyc-enable");
+	if (espi_perif->mcyc_enable) {
+		rc = of_property_read_u32(dev->of_node, "perif,memcyc-src-addr",
+					  &espi_perif->mcyc_saddr);
+		if (rc) {
+			dev_err(dev, "cannot get Host source address for memory cycle\n");
+			return ERR_PTR(-ENODEV);
+		}
+
+		rc = of_property_read_u32(dev->of_node, "perif,memcyc-size",
+					  &espi_perif->mcyc_size);
+		if (rc) {
+			dev_err(dev, "cannot get size for memory cycle\n");
+			return ERR_PTR(-ENODEV);
+		}
+
+		if (espi_perif->mcyc_size < PERIF_MEMCYC_SIZE_MIN)
+			espi_perif->mcyc_size = PERIF_MEMCYC_SIZE_MIN;
+		else
+			espi_perif->mcyc_size = roundup_pow_of_two(espi_perif->mcyc_size);
+
+		espi_perif->mcyc_mask = ~(espi_perif->mcyc_size - 1);
+		espi_perif->mcyc_virt = dma_alloc_coherent(dev, espi_perif->mcyc_size,
+							   &espi_perif->mcyc_taddr, GFP_KERNEL);
+		if (!espi_perif->mcyc_virt) {
+			dev_err(dev, "cannot allocate memory cycle region\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	if (of_property_read_bool(dev->of_node, "perif,dma-mode")) {
+		dma = &espi_perif->dma;
+
+		dma->pc_tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+						     &dma->pc_tx_addr, GFP_KERNEL);
+		if (!dma->pc_tx_virt) {
+			dev_err(dev, "cannot allocate posted TX DMA buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+
+		dma->pc_rx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+						     &dma->pc_rx_addr, GFP_KERNEL);
+		if (!dma->pc_rx_virt) {
+			dev_err(dev, "cannot allocate posted RX DMA buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+
+		dma->np_tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+				&dma->np_tx_addr, GFP_KERNEL);
+		if (!dma->np_tx_virt) {
+			dev_err(dev, "cannot allocate non-posted TX DMA buffer\n");
+			return ERR_PTR(-ENOMEM);
+		}
+
+		espi_perif->dma_mode = 1;
+	}
+
+	espi_perif->mdev.parent = dev;
+	espi_perif->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_perif->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", PERIF_MDEV_NAME);
+	espi_perif->mdev.fops = &aspeed_espi_perif_fops;
+	rc = misc_register(&espi_perif->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return ERR_PTR(rc);
+	}
+
+	aspeed_espi_perif_enable(espi_perif);
+
+	return espi_perif;
+}
+
+void aspeed_espi_perif_free(struct device *dev, struct aspeed_espi_perif *espi_perif)
+{
+	struct aspeed_espi_perif_dma *dma = &espi_perif->dma;
+
+	if (espi_perif->mcyc_virt)
+		dma_free_coherent(dev, espi_perif->mcyc_size,
+				  espi_perif->mcyc_virt,
+				  espi_perif->mcyc_taddr);
+
+	if (espi_perif->dma_mode) {
+		dma_free_coherent(dev, PAGE_SIZE, dma->pc_tx_virt,
+				  dma->pc_tx_addr);
+		dma_free_coherent(dev, PAGE_SIZE, dma->pc_rx_virt,
+				  dma->pc_rx_addr);
+		dma_free_coherent(dev, PAGE_SIZE, dma->np_tx_virt,
+				  dma->np_tx_addr);
+	}
+
+	mutex_destroy(&espi_perif->pc_tx_mtx);
+	mutex_destroy(&espi_perif->np_tx_mtx);
+
+	misc_deregister(&espi_perif->mdev);
+}
diff --git a/drivers/soc/aspeed/aspeed-espi-perif.h b/drivers/soc/aspeed/aspeed-espi-perif.h
new file mode 100644
index 000000000000..1b964e4680f5
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-perif.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_PERIF_H_
+#define _ASPEED_ESPI_PERIF_H_
+
+struct aspeed_espi_perif_dma {
+	void *pc_tx_virt;
+	dma_addr_t pc_tx_addr;
+	void *pc_rx_virt;
+	dma_addr_t pc_rx_addr;
+	void *np_tx_virt;
+	dma_addr_t np_tx_addr;
+};
+
+struct aspeed_espi_perif {
+	uint32_t mcyc_enable;
+	void *mcyc_virt;
+	uint32_t mcyc_saddr;
+	phys_addr_t mcyc_taddr;
+	uint32_t mcyc_size;
+	uint32_t mcyc_mask;
+
+	uint32_t dma_mode;
+	struct aspeed_espi_perif_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	spinlock_t lock;
+	struct mutex pc_rx_mtx;
+	struct mutex pc_tx_mtx;
+	struct mutex np_tx_mtx;
+
+	struct miscdevice mdev;
+	struct aspeed_espi_ctrl *ctrl;
+};
+
+void aspeed_espi_perif_event(uint32_t sts, struct aspeed_espi_perif *espi_perif);
+void aspeed_espi_perif_enable(struct aspeed_espi_perif *espi_perif);
+void *aspeed_espi_perif_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl);
+void aspeed_espi_perif_free(struct device *dev, struct aspeed_espi_perif *espi_perif);
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-vw.c b/drivers/soc/aspeed/aspeed-espi-vw.c
new file mode 100644
index 000000000000..2bdfedfea12e
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-vw.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#include <linux/fs.h>
+#include <linux/of_device.h>
+#include <linux/miscdevice.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+
+#include "aspeed-espi-ioc.h"
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-vw.h"
+
+#define VW_MDEV_NAME	"aspeed-espi-vw"
+
+static long aspeed_espi_vw_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	uint32_t val;
+
+	struct aspeed_espi_vw *espi_vw = container_of(fp->private_data,
+						      struct aspeed_espi_vw,
+						      mdev);
+	struct aspeed_espi_ctrl *espi_ctrl = espi_vw->ctrl;
+
+	switch (cmd) {
+	case ASPEED_ESPI_VW_GET_GPIO_VAL:
+		regmap_read(espi_ctrl->map, ESPI_VW_GPIO_VAL, &val);
+		if (put_user(val, (uint32_t __user *)arg))
+			return -EFAULT;
+		break;
+
+	case ASPEED_ESPI_VW_PUT_GPIO_VAL:
+		if (get_user(val, (uint32_t __user *)arg))
+			return -EFAULT;
+		regmap_write(espi_ctrl->map, ESPI_VW_GPIO_VAL, val);
+		break;
+
+	default:
+		return -EINVAL;
+	};
+
+	return 0;
+}
+
+void aspeed_espi_vw_event(uint32_t sts, struct aspeed_espi_vw *espi_vw)
+{
+	uint32_t sysevt_sts;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_vw->ctrl;
+
+	regmap_read(espi_ctrl->map, ESPI_INT_STS, &sts);
+
+	if (sts & ESPI_INT_STS_VW_SYSEVT) {
+		regmap_read(espi_ctrl->map, ESPI_SYSEVT_INT_STS, &sysevt_sts);
+
+		if (espi_ctrl->model->version == ESPI_AST2500) {
+			if (sysevt_sts & ESPI_SYSEVT_INT_STS_HOST_RST_WARN)
+				regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT,
+						   ESPI_SYSEVT_HOST_RST_ACK,
+						   ESPI_SYSEVT_HOST_RST_ACK);
+
+			if (sysevt_sts & ESPI_SYSEVT_INT_STS_OOB_RST_WARN)
+				regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT,
+						   ESPI_SYSEVT_OOB_RST_ACK,
+						   ESPI_SYSEVT_OOB_RST_ACK);
+		}
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_STS, sysevt_sts);
+	}
+
+	if (sts & ESPI_INT_STS_VW_SYSEVT1) {
+		regmap_read(espi_ctrl->map, ESPI_SYSEVT1_INT_STS, &sysevt_sts);
+
+		if (sysevt_sts & ESPI_SYSEVT1_INT_STS_SUSPEND_WARN)
+			regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT1,
+					   ESPI_SYSEVT1_SUSPEND_ACK,
+					   ESPI_SYSEVT1_SUSPEND_ACK);
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_STS, sysevt_sts);
+	}
+}
+
+void aspeed_espi_vw_enable(struct aspeed_espi_vw *espi_vw)
+{
+	struct aspeed_espi_ctrl *espi_ctrl = espi_vw->ctrl;
+
+	regmap_write(espi_ctrl->map, ESPI_INT_STS,
+		     ESPI_INT_STS_VW_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_VW_BITS,
+			   ESPI_INT_EN_VW_BITS);
+
+	/*
+	 * Enforce VW GPIO to SW mode due to security concern.
+	 * The HW mode allows the Host to manipulate BMC GPIOs
+	 * without notififications.
+	 */
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_VW_GPIO_SW_MODE | ESPI_CTRL_VW_SW_RDY,
+			   ESPI_CTRL_VW_GPIO_SW_MODE | ESPI_CTRL_VW_SW_RDY);
+}
+
+static const struct file_operations aspeed_espi_vw_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_vw_ioctl,
+};
+
+void *aspeed_espi_vw_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int rc;
+	struct aspeed_espi_vw *espi_vw;
+
+	espi_vw = devm_kzalloc(dev, sizeof(*espi_vw), GFP_KERNEL);
+	if (!espi_vw)
+		return ERR_PTR(-ENOMEM);
+
+	espi_vw->ctrl = espi_ctrl;
+
+	espi_vw->mdev.parent = dev;
+	espi_vw->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_vw->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", VW_MDEV_NAME);
+	espi_vw->mdev.fops = &aspeed_espi_vw_fops;
+	rc = misc_register(&espi_vw->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return ERR_PTR(rc);
+	}
+
+	aspeed_espi_vw_enable(espi_vw);
+
+	return espi_vw;
+}
+
+void aspeed_espi_vw_free(struct device *dev, struct aspeed_espi_vw *espi_vw)
+{
+	misc_deregister(&espi_vw->mdev);
+}
diff --git a/drivers/soc/aspeed/aspeed-espi-vw.h b/drivers/soc/aspeed/aspeed-espi-vw.h
new file mode 100644
index 000000000000..aba9c414ac1b
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-vw.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2021 ASPEED Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_VW_H_
+#define _ASPEED_ESPI_VW_H_
+
+struct aspeed_espi_vw {
+	int irq;
+	int irq_reset;
+
+	struct miscdevice mdev;
+	struct aspeed_espi_ctrl *ctrl;
+};
+
+void aspeed_espi_vw_event(uint32_t sts, struct aspeed_espi_vw *espi_vw);
+void aspeed_espi_vw_enable(struct aspeed_espi_vw *espi_vw);
+void *aspeed_espi_vw_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl);
+void aspeed_espi_vw_free(struct device *dev, struct aspeed_espi_vw *espi_vw);
+
+#endif
-- 
2.25.1

