Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378287FAD8
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 10:36:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xb90abbb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzRST0nwwz3vXD
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 20:36:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Xb90abbb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRR55fc2z3dSn;
	Tue, 19 Mar 2024 20:35:29 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1df01161b39so26511445ad.3;
        Tue, 19 Mar 2024 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840927; x=1711445727; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MXxJB8PKQSVoedYGBCRVO5DK3W3cY0ONtFwPc++/B0=;
        b=Xb90abbblnzk6i8x6Jo551wY4h/gPl4U7A4VxKubZlhkPAf6P0sTDr2BQk8oTDsQag
         Qsg3/zjMvPNSm9yYmnmonUb3OXW15JGcnZEX5nY7/VpeEwZ93/NiNvkjucOjcfZ4f+GL
         10UPl74YY1wFdMT9mCEiSzfhw8Z16Px6UrBen8ZYqU8UgzgE1YtN99IHhecAV3gG1zgF
         ycqv1xAHqKwiCV4aJ5Mbv0HcC+Bn1tkDRA/ClmadaMXUBcWEqvtP0XwjNAyUoGzp0aFK
         dkkYkmgnz1N2SjVN5wjjd6UBrgptesKvFV4Vkp9rO7Pa4C1sKzIrVBmi2PafSxuQT7aa
         4XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840927; x=1711445727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MXxJB8PKQSVoedYGBCRVO5DK3W3cY0ONtFwPc++/B0=;
        b=OSPdB+EZpv+Og4MiNUqvs5EQZWSOkZJvDF/q2IFh0le1XutGgfv24gWYtV4hVzyMrG
         9Ahw2lrBjk0gO5Zkay5OrKE2hHhtkXlxSM14PMSIaN+56hYyA7HQG9xCjaglv9b6nJkZ
         QAL7Inc7GVYojcWdyeLt00sG+nviou8cv2BlzoXCDzGe91stfmSspY22ROJV66+LXhdS
         aPhKC2bJ9F9gJi1ILcBqZ+Vhoz6zRxeFTaUsL4yEvPeQj7wGnVPpV0nJNXpN1/1cJVqM
         OtQbeWkm/u303e5oBNdHJVVmSFNiofhl9LuyE3Re8fSti2aTRftKTwgmo/zYiAQw//HZ
         FvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwrST9UPqYRfW++hPFxA26Kiweu1Ewl5W7RC3KCK5CAV3w0yFM79A+NIrUiAjxJkSdmJDxFCCDNGO8UzDVGbaab/jLRh5Te2J/SrFqa0PAbuMjU17ILURN8PNq4oq9771E8DebY+gk
X-Gm-Message-State: AOJu0YxUyt2oesU0pReh9bf9lZwr+1rpmM5JFGsjgFKaZyVo5leH8Ry0
	GQkJy/caoAMLlLj2wH2wze5t9w74hFQHMrpdNu70xRnqgvnAEo4ncsXjLsjT99c=
X-Google-Smtp-Source: AGHT+IHWsc9Bt7xqpubWV7WTMRBUCiitonSBRTjiTvdsCl34cE99jFd6nOA1EEyOLOZiRjGNlukrlQ==
X-Received: by 2002:a17:903:40c1:b0:1de:fbc3:8e59 with SMTP id t1-20020a17090340c100b001defbc38e59mr13300726pld.21.1710840926821;
        Tue, 19 Mar 2024 02:35:26 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:26 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/4] Add eSPI device driver (flash channel)
Date: Tue, 19 Mar 2024 15:04:02 +0530
Message-Id: <20240319093405.39833-2-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, manojkiran.eda@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch adds the driver support for the eSPI controller of
Aspeed 5/6th generation SoCs. This controller is a slave device
communicating with a master over Enhanced Serial Peripheral
Interface (eSPI).

eSPI supports 4 channels, namely peripheral, virtual wire,
out-of-band, and flash, and operates at max frequency of 66MHz.

But at the moment, this patch set only supports the mafs mode
(master attached flash sharing mode) in the flash channel.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 drivers/soc/aspeed/Kconfig                  |  38 ++
 drivers/soc/aspeed/Makefile                 |   2 +
 drivers/soc/aspeed/aspeed-espi-ctrl.c       | 197 +++++++++
 drivers/soc/aspeed/aspeed-espi-ctrl.h       | 169 +++++++
 drivers/soc/aspeed/aspeed-espi-flash-mafs.c | 467 ++++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-flash.h      |  71 +++
 6 files changed, 944 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.h
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash-mafs.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.h

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..c300ee8fe33a 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,44 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+menu "ASPEED eSPI Support"
+
+config ASPEED_ESPI
+	bool "ASPEED eSPI slave driver"
+	select REGMAP
+	select MFD_SYSCON
+	depends on ASPEED_ESPI_FLASH
+	default n
+	help
+	  Enable driver support for the Aspeed eSPI engine. The eSPI engine
+	  plays as a slave device in BMC to communicate with the Host over
+	  the eSPI interface.
+
+menu "ASPEED eSPI Flash channel support"
+
+config  ASPEED_ESPI_FLASH
+	bool "ASPEED eSPI flash channel support"
+	default n
+	depends on ASPEED_ESPI_FLASH_MAFS
+	select ASPEED_ESPI
+	help
+	  Enable eSPI flash channel support.
+
+menu "ASPEED eSPI flash modes"
+
+config ASPEED_ESPI_FLASH_MAFS
+	bool "Master attached flash sharing (MAFS) support in eSPI"
+	default n
+	select ASPEED_ESPI_FLASH
+	help
+	  Select this option if you have a Master attached flash connected to
+	  the eSPI controller.
+
+endmenu # eSPI Flash Modes
+endmenu # eSPI Flash Channel support
+endmenu # eSPI Support
+
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..cecbba700071 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_ESPI)               += aspeed-espi-ctrl.o
+obj-$(CONFIG_ASPEED_ESPI_FLASH_MAFS)    += aspeed-espi-flash-mafs.o
diff --git a/drivers/soc/aspeed/aspeed-espi-ctrl.c b/drivers/soc/aspeed/aspeed-espi-ctrl.c
new file mode 100644
index 000000000000..7e2b86849fd0
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ctrl.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 Aspeed Technology Inc.
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
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-flash.h"
+
+/**
+ * aspeed_espi_ctrl_isr - function to handle various interrupts
+ * @irq: interrupt line
+ * @arg: pointer to access device registers
+ *
+ * Returns IRQ_HANDLED
+ */
+static irqreturn_t aspeed_espi_ctrl_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	struct aspeed_espi_ctrl *espi_ctrl = (struct aspeed_espi_ctrl *)arg;
+
+	regmap_read(espi_ctrl->map, ESPI_INT_STS, &sts);
+
+	if (sts & ESPI_INT_STS_FLASH_BITS) {
+		aspeed_espi_flash_event(sts, espi_ctrl->flash);
+		regmap_write(espi_ctrl->map, ESPI_INT_STS,
+			     sts & ESPI_INT_STS_FLASH_BITS);
+	}
+
+	if (sts & ESPI_INT_STS_HW_RST_DEASSERT) {
+		aspeed_espi_flash_enable(espi_ctrl->flash);
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T0, 0x0);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_T1, 0x0);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_EN, 0xffffffff);
+
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_T0, 0x1);
+		regmap_write(espi_ctrl->map, ESPI_SYSEVT1_INT_EN, 0x1);
+
+		regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+				   ESPI_INT_EN_HW_RST_DEASSERT,
+				   ESPI_INT_EN_HW_RST_DEASSERT);
+
+		regmap_update_bits(
+			espi_ctrl->map, ESPI_SYSEVT,
+			ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE,
+			ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE);
+
+		regmap_write(espi_ctrl->map, ESPI_INT_STS,
+			     ESPI_INT_STS_HW_RST_DEASSERT);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * aspeed_espi_ctrl_probe - function to probe the platform driver
+ * @pdev: platform device
+ *
+ * Returns 0 on success, -ENOMEM on error
+ */
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
+		return PTR_ERR(espi_ctrl->map);
+	}
+
+	espi_ctrl->irq = platform_get_irq(pdev, 0);
+	if (espi_ctrl->irq < 0)
+		return espi_ctrl->irq;
+
+	espi_ctrl->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(espi_ctrl->clk)) {
+		dev_err(dev, "cannot get clock\n");
+		return PTR_ERR(espi_ctrl->clk);
+	}
+
+	rc = clk_prepare_enable(espi_ctrl->clk);
+	if (rc) {
+		dev_err(dev, "cannot enable clock\n");
+		return rc;
+	}
+
+	/*
+	 * This takes care of deferred probe , incase the mtd core
+	 * subsystem is not probed yet.
+	 */
+	espi_ctrl->flash = aspeed_espi_flash_alloc(dev, espi_ctrl);
+	if (IS_ERR(espi_ctrl->flash)) {
+		dev_err(dev, "failed to allocate flash channel\n");
+		pr_info("flash alloc failed with return code %ld\n",
+			PTR_ERR(espi_ctrl->flash));
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
+	rc = devm_request_irq(dev, espi_ctrl->irq, aspeed_espi_ctrl_isr, 0,
+			      DEVICE_NAME, espi_ctrl);
+	if (rc) {
+		dev_err(dev, "failed to request IRQ\n");
+		return rc;
+	}
+
+	// clear the interrupt enable register
+	regmap_write(espi_ctrl->map, ESPI_INT_EN_CLR, 0x7fffffff);
+
+	// Disable the interrupts in all channels except flash channel
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN,
+			   ESPI_INT_EN_FLASH_BITS | ESPI_INT_EN_HW_RST_DEASSERT,
+			   ESPI_INT_EN_FLASH_BITS |
+				   ESPI_INT_STS_HW_RST_DEASSERT);
+
+	dev_set_drvdata(dev, espi_ctrl);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+/**
+ * aspeed_espi_ctrl_remove - Release the driver
+ * @pdev: the platform device
+ *
+ * Returns 0
+ */
+static int aspeed_espi_ctrl_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_ctrl *espi_ctrl = dev_get_drvdata(dev);
+
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
+	{ .compatible = "aspeed,ast2500-espi-ctrl", .data = &ast2500_model },
+	{ .compatible = "aspeed,ast2600-espi-ctrl", .data = &ast2600_model },
+	{},
+};
+MODULE_DEVICE_TABLE(of, aspeed_espi_ctrl_of_matches);
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
+MODULE_AUTHOR("Manojkiran Eda <manojkiran.eda@gmail.com>");
+MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI Slave Device");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/aspeed/aspeed-espi-ctrl.h b/drivers/soc/aspeed/aspeed-espi-ctrl.h
new file mode 100644
index 000000000000..5c4950c84b01
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ctrl.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 Aspeed Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_CTRL_H_
+#define _ASPEED_ESPI_CTRL_H_
+
+#include <linux/bits.h>
+
+#define DEVICE_NAME "aspeed-espi-ctrl"
+
+/**
+ * enum aspeed_espi_version - Enumeration to capture aspeed versions that this
+ *                            driver supports
+ * @ESPI_AST2500: eSPI for AST2500 Model
+ * @ESPI_AST2600: eSPI for AST2600 Model
+ *
+ * This enumeration captures various aspeed models that this driver supports
+ */
+
+enum aspeed_espi_version {
+	ESPI_AST2500,
+	ESPI_AST2600,
+};
+
+/**
+ * struct aspeed_espi_model - structure to capture version of espi
+ * @version: espi version
+ *
+ * Structure to capture version of eSPI
+ */
+struct aspeed_espi_model {
+	uint32_t version;
+};
+
+/**
+ * struct aspeed_espi_ctrl - structure to group various channels of the driver
+ * @dev: platform device pointer
+ * @map: register map for the device
+ * @clk: clock for the device
+ * @irq: interrupt request
+ * @flash: pointer to flash channel of eSPI
+ * @model: pointer to version of eSPI
+ *
+ * Structure to capture version of eSPI
+ */
+struct aspeed_espi_ctrl {
+	struct device *dev;
+	struct regmap *map;
+	struct clk *clk;
+	int irq;
+	struct aspeed_espi_flash *flash;
+	const struct aspeed_espi_model *model;
+};
+
+/* eSPI register offset */
+#define ESPI_CTRL 0x000
+#define ESPI_CTRL_FLASH_TX_DMA_EN BIT(23)
+#define ESPI_CTRL_FLASH_RX_DMA_EN BIT(22)
+#define ESPI_CTRL_FLASH_SW_MODE_MASK GENMASK(11, 10)
+#define ESPI_CTRL_FLASH_SW_MODE_SHIFT 10
+#define ESPI_CTRL_FLASH_SW_RDY BIT(7)
+
+#define ESPI_STS 0x004
+#define ESPI_CTRL_FLASH_CHAN_RDY BIT(6)
+
+#define ESPI_INT_STS 0x008
+#define ESPI_INT_STS_HW_RST_DEASSERT BIT(31)
+#define ESPI_INT_STS_FLASH_TX_ERR BIT(21)
+#define ESPI_INT_STS_FLASH_TX_ABT BIT(19)
+#define ESPI_INT_STS_FLASH_RX_ABT BIT(15)
+#define ESPI_INT_STS_FLASH_TX_CMPLT BIT(7)
+#define ESPI_INT_STS_FLASH_RX_CMPLT BIT(6)
+#define ESPI_INT_EN 0x00c
+#define ESPI_INT_EN_HW_RST_DEASSERT BIT(31)
+#define ESPI_INT_EN_FLASH_TX_ERR BIT(21)
+#define ESPI_INT_EN_FLASH_TX_ABT BIT(19)
+#define ESPI_INT_EN_FLASH_RX_ABT BIT(15)
+#define ESPI_INT_EN_FLASH_TX_CMPLT BIT(7)
+#define ESPI_INT_EN_FLASH_RX_CMPLT BIT(6)
+#define ESPI_INT_EN_CLR 0x0fc
+#define ESPI_FLASH_RX_DMA 0x060
+#define ESPI_FLASH_RX_CTRL 0x064
+#define ESPI_FLASH_RX_CTRL_PEND_SERV BIT(31)
+#define ESPI_FLASH_RX_CTRL_LEN_MASK GENMASK(23, 12)
+#define ESPI_FLASH_RX_CTRL_LEN_SHIFT 12
+#define ESPI_FLASH_RX_CTRL_TAG_MASK GENMASK(11, 8)
+#define ESPI_FLASH_RX_CTRL_TAG_SHIFT 8
+#define ESPI_FLASH_RX_CTRL_CYC_MASK GENMASK(7, 0)
+#define ESPI_FLASH_RX_CTRL_CYC_SHIFT 0
+#define ESPI_FLASH_RX_PORT 0x068
+#define ESPI_FLASH_TX_DMA 0x070
+#define ESPI_FLASH_TX_CTRL 0x074
+#define ESPI_FLASH_TX_CTRL_TRIGGER BIT(31)
+#define ESPI_FLASH_TX_CTRL_LEN_MASK GENMASK(23, 12)
+#define ESPI_FLASH_TX_CTRL_LEN_SHIFT 12
+#define ESPI_FLASH_TX_CTRL_TAG_MASK GENMASK(11, 8)
+#define ESPI_FLASH_TX_CTRL_TAG_SHIFT 8
+#define ESPI_FLASH_TX_CTRL_CYC_MASK GENMASK(7, 0)
+#define ESPI_FLASH_TX_CTRL_CYC_SHIFT 0
+#define ESPI_FLASH_TX_PORT 0x078
+#define ESPI_CTRL2 0x080
+#define ESPI_CTRL2_MEMCYC_RD_DIS BIT(6)
+#define ESPI_CTRL2_MEMCYC_WR_DIS BIT(4)
+#define ESPI_SYSEVT_INT_EN 0x094
+#define ESPI_SYSEVT 0x098
+#define ESPI_SYSEVT_HOST_RST_ACK BIT(27)
+#define ESPI_SYSEVT_RST_CPU_INIT BIT(26)
+#define ESPI_SYSEVT_SLV_BOOT_STS BIT(23)
+#define ESPI_SYSEVT_NON_FATAL_ERR BIT(22)
+#define ESPI_SYSEVT_FATAL_ERR BIT(21)
+#define ESPI_SYSEVT_SLV_BOOT_DONE BIT(20)
+#define ESPI_SYSEVT_NMI_OUT BIT(10)
+#define ESPI_SYSEVT_SMI_OUT BIT(9)
+#define ESPI_SYSEVT_HOST_RST_WARN BIT(8)
+#define ESPI_SYSEVT_PLTRSTN BIT(5)
+#define ESPI_SYSEVT_SUSPEND BIT(4)
+#define ESPI_SYSEVT_S5_SLEEP BIT(2)
+#define ESPI_SYSEVT_S4_SLEEP BIT(1)
+#define ESPI_SYSEVT_S3_SLEEP BIT(0)
+#define ESPI_GEN_CAP_N_CONF 0x0a0
+#define ESPI_CH0_CAP_N_CONF 0x0a4
+#define ESPI_CH1_CAP_N_CONF 0x0a8
+#define ESPI_CH2_CAP_N_CONF 0x0ac
+#define ESPI_CH3_CAP_N_CONF 0x0b0
+#define ESPI_CH3_CAP_N_CONF_ERASE_MASK GENMASK(4, 2)
+#define ESPI_CH3_CAP_N_CONF_ERASE_SHIFT 2
+#define ESPI_CH3_CAP_N_CONF_ERASE_SIZE_4KB 1
+#define ESPI_CH3_CAP_N_CONF_ERASE_SIZE_64KB 2
+#define ESPI_CH3_CAP_N_CONF_ERASE_SIZE_4KB_64KB 3
+#define ESPI_CH3_CAP_N_CONF_ERASE_SIZE_128KB 4
+#define ESPI_CH3_CAP_N_CONF_ERASE_SIZE_256KB 5
+#define ESPI_CH3_CAP_N_CONF2 0x0b4
+#define ESPI_SYSEVT1_INT_EN 0x100
+#define ESPI_SYSEVT1 0x104
+#define ESPI_SYSEVT1_SUSPEND_ACK BIT(20)
+#define ESPI_SYSEVT1_SUSPEND_WARN BIT(0)
+#define ESPI_SYSEVT_INT_T0 0x110
+#define ESPI_SYSEVT_INT_T1 0x114
+#define ESPI_SYSEVT_INT_T2 0x118
+#define ESPI_SYSEVT_INT_T2_HOST_RST_WARN ESPI_SYSEVT_HOST_RST_WARN
+#define ESPI_SYSEVT_INT_STS 0x11c
+#define ESPI_SYSEVT_INT_STS_NMI_OUT ESPI_SYSEVT_NMI_OUT
+#define ESPI_SYSEVT_INT_STS_SMI_OUT ESPI_SYSEVT_SMI_OUT
+#define ESPI_SYSEVT_INT_STS_HOST_RST_WARN ESPI_SYSEVT_HOST_RST_WARN
+#define ESPI_SYSEVT_INT_STS_PLTRSTN ESPI_SYSEVT_PLTRSTN
+#define ESPI_SYSEVT_INT_STS_SUSPEND ESPI_SYSEVT_SUSPEND
+#define ESPI_SYSEVT_INT_STS_S5_SLEEP ESPI_SYSEVT_INT_S5_SLEEP
+#define ESPI_SYSEVT_INT_STS_S4_SLEEP ESPI_SYSEVT_INT_S4_SLEEP
+#define ESPI_SYSEVT_INT_STS_S3_SLEEP ESPI_SYSEVT_INT_S3_SLEEP
+#define ESPI_SYSEVT1_INT_T0 0x120
+#define ESPI_SYSEVT1_INT_T1 0x124
+#define ESPI_SYSEVT1_INT_T2 0x128
+#define ESPI_SYSEVT1_INT_STS 0x12c
+#define ESPI_SYSEVT1_INT_STS_SUSPEND_WARN ESPI_SYSEVT1_SUSPEND_WARN
+
+/* collect ESPI_INT_STS bits of eSPI channels for convenience */
+#define ESPI_INT_STS_FLASH_BITS                                    \
+	(ESPI_INT_STS_FLASH_TX_ERR | ESPI_INT_STS_FLASH_TX_ABT |   \
+	 ESPI_INT_STS_FLASH_RX_ABT | ESPI_INT_STS_FLASH_TX_CMPLT | \
+	 ESPI_INT_STS_FLASH_RX_CMPLT)
+
+/* collect ESPI_INT_EN bits of eSPI channels for convenience */
+#define ESPI_INT_EN_FLASH_BITS                                   \
+	(ESPI_INT_EN_FLASH_TX_ERR | ESPI_INT_EN_FLASH_TX_ABT |   \
+	 ESPI_INT_EN_FLASH_RX_ABT | ESPI_INT_EN_FLASH_TX_CMPLT | \
+	 ESPI_INT_EN_FLASH_RX_CMPLT)
+
+#endif
diff --git a/drivers/soc/aspeed/aspeed-espi-flash-mafs.c b/drivers/soc/aspeed/aspeed-espi-flash-mafs.c
new file mode 100644
index 000000000000..ac5d55833109
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-flash-mafs.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyrigt 2024 Aspeed Technology Inc.
+ */
+#include <linux/fs.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/miscdevice.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/uaccess.h>
+#include <linux/vmalloc.h>
+#include <linux/miscdevice.h>
+#include <linux/dma-mapping.h>
+
+#include "aspeed-espi-ctrl.h"
+#include "aspeed-espi-flash.h"
+
+static long aspeed_espi_flash_rx(uint8_t *cyc, uint16_t *len, uint32_t *addr,
+				 uint8_t *pkt, size_t *pkt_len,
+				 struct aspeed_espi_flash *espi_flash)
+{
+	unsigned long flags;
+	uint32_t reg, rx_pkt_len, addr_be;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+	void *rx_virt_ptr;
+	ulong to;
+	int ret;
+
+	spin_lock_irqsave(&espi_flash->spinlock, flags);
+
+	to = msecs_to_jiffies(100);
+	ret = wait_event_interruptible_lock_irq_timeout(
+		espi_flash->wq, espi_flash->rx_sts, espi_flash->spinlock, to);
+
+	spin_unlock_irqrestore(&espi_flash->spinlock, flags);
+
+	if (ret == -ERESTARTSYS)
+		return -EINTR;
+	else if (!ret)
+		return -ETIMEDOUT;
+	else if (espi_flash->rx_sts & ESPI_INT_STS_FLASH_RX_ABT)
+		return -EFAULT;
+	else
+		ret = 0;
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_ctrl->map, ESPI_FLASH_RX_CTRL, &reg);
+	*cyc = (reg & ESPI_FLASH_RX_CTRL_CYC_MASK) >>
+	       ESPI_FLASH_RX_CTRL_CYC_SHIFT;
+	*len = (reg & ESPI_FLASH_RX_CTRL_LEN_MASK) >>
+	       ESPI_FLASH_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	switch (*cyc) {
+	case ESPI_FLASH_READ:
+	case ESPI_FLASH_WRITE:
+	case ESPI_FLASH_ERASE:
+		rx_virt_ptr = espi_flash->dma.rx_virt + sizeof(addr_be);
+		rx_pkt_len = (*len) ? *len : ESPI_PLD_LEN_MAX;
+
+		if (addr) {
+			memcpy(&addr_be, espi_flash->dma.rx_virt,
+			       sizeof(addr_be));
+			*addr = ntohl(addr_be);
+		}
+
+		break;
+	case ESPI_FLASH_SUC_CMPLT_D_MIDDLE:
+	case ESPI_FLASH_SUC_CMPLT_D_FIRST:
+	case ESPI_FLASH_SUC_CMPLT_D_LAST:
+	case ESPI_FLASH_SUC_CMPLT_D_ONLY:
+		rx_pkt_len = (*len) ? *len : ESPI_PLD_LEN_MAX;
+		rx_virt_ptr = espi_flash->dma.rx_virt;
+		break;
+	case ESPI_FLASH_SUC_CMPLT:
+	case ESPI_FLASH_UNSUC_CMPLT:
+	case ESPI_FLASH_UNSUC_CMPLT_ONLY:
+		/* No data received */
+		rx_pkt_len = 0;
+		rx_virt_ptr = NULL;
+		break;
+	default:
+		rx_pkt_len = 0;
+		ret = -EFAULT;
+	}
+	if (pkt_len)
+		*pkt_len = rx_pkt_len;
+
+	if (rx_pkt_len && pkt_len && pkt) {
+		if (*pkt_len >= rx_pkt_len)
+			memcpy(pkt, rx_virt_ptr, rx_pkt_len);
+		else
+			ret = -EINVAL;
+	}
+
+	spin_lock_irqsave(&espi_flash->spinlock, flags);
+
+	regmap_write_bits(espi_ctrl->map, ESPI_FLASH_RX_CTRL,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV);
+
+	espi_flash->rx_sts = 0;
+
+	spin_unlock_irqrestore(&espi_flash->spinlock, flags);
+	return ret;
+}
+
+static long
+aspeed_espi_flash_rx_get_completion(struct aspeed_espi_flash *espi_flash)
+{
+	uint8_t cyc;
+	uint16_t len;
+	int ret;
+
+	ret = aspeed_espi_flash_rx(&cyc, &len, NULL, NULL, 0, espi_flash);
+	if (ret)
+		return ret;
+
+	if (cyc != ESPI_FLASH_SUC_CMPLT) {
+		dev_notice(espi_flash->ctrl->dev, "eSPI Rx response was not successful\n");
+		return -EFAULT;
+	}
+	return 0;
+}
+
+static long aspeed_espi_flash_put_tx(uint8_t cyc, uint16_t len, uint32_t addr,
+				     const uint8_t *pkt, size_t pkt_len,
+				     struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+	unsigned long flags;
+	uint32_t reg, addr_be;
+	ulong to;
+	int ret = 0;
+
+	/* Test if flash channel is ready */
+	regmap_read(espi_ctrl->map, ESPI_STS, &reg);
+	if (!(reg & ESPI_CTRL_FLASH_CHAN_RDY)) {
+		dev_notice(espi_flash->ctrl->dev, "eSPI flash channel not ready\n");
+		return -EIO;
+	}
+
+	/* Test if TX ready */
+	regmap_read(espi_ctrl->map, ESPI_FLASH_TX_CTRL, &reg);
+	if (reg & ESPI_FLASH_TX_CTRL_TRIGGER) {
+		dev_notice(espi_flash->ctrl->dev, "eSPI Tx operation still pending\n");
+		return -EBUSY;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	addr_be = htonl(addr);
+	memcpy(espi_flash->dma.tx_virt, &addr_be, sizeof(addr_be));
+	if (pkt && pkt_len)
+		memcpy(espi_flash->dma.tx_virt + sizeof(addr_be), pkt, pkt_len);
+
+	dma_wmb();
+
+	spin_lock_irqsave(&espi_flash->spinlock, flags);
+	espi_flash->tx_sts = 0;
+	espi_flash->rx_sts = 0;
+
+	reg = ((cyc << ESPI_FLASH_TX_CTRL_CYC_SHIFT) &
+	       ESPI_FLASH_TX_CTRL_CYC_MASK) |
+	      ((len << ESPI_FLASH_TX_CTRL_LEN_SHIFT) &
+	       ESPI_FLASH_TX_CTRL_LEN_MASK) |
+	      ESPI_FLASH_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_ctrl->map, ESPI_FLASH_TX_CTRL, reg);
+
+	to = msecs_to_jiffies(100);
+	ret = wait_event_interruptible_lock_irq_timeout(
+		espi_flash->wq, espi_flash->tx_sts, espi_flash->spinlock, to);
+	if (ret == -ERESTARTSYS)
+		ret = -EINTR;
+	else if (!ret) {
+		dev_notice(espi_flash->ctrl->dev, "eSPI Tx operation not processed within 100msec\n");
+		ret = -ETIMEDOUT;
+	} else if (espi_flash->tx_sts &
+		   (ESPI_INT_STS_FLASH_TX_ERR | ESPI_INT_STS_FLASH_TX_ABT)) {
+		dev_notice(espi_flash->ctrl->dev, "eSPI Tx operation declined by remote\n");
+
+		ret = -EFAULT;
+	} else
+		ret = 0;
+
+	spin_unlock_irqrestore(&espi_flash->spinlock, flags);
+	return ret;
+}
+
+void aspeed_espi_flash_event(uint32_t sts, struct aspeed_espi_flash *espi_flash)
+{
+	unsigned long flags;
+
+	if (!(sts & ESPI_INT_STS_FLASH_BITS))
+		return;
+
+	spin_lock_irqsave(&espi_flash->spinlock, flags);
+	espi_flash->rx_sts |=
+		sts & (ESPI_INT_STS_FLASH_RX_ABT | ESPI_INT_STS_FLASH_RX_CMPLT);
+	espi_flash->tx_sts |=
+		sts & (ESPI_INT_STS_FLASH_TX_ERR | ESPI_INT_STS_FLASH_TX_ABT |
+		       ESPI_INT_STS_FLASH_TX_CMPLT);
+	spin_unlock_irqrestore(&espi_flash->spinlock, flags);
+	wake_up_interruptible(&espi_flash->wq);
+}
+
+static int aspeed_espi_flash_erase(struct mtd_info *mtd,
+				   struct erase_info *instr)
+{
+	struct aspeed_espi_flash *espi_flash = mtd->priv;
+	int ret = 0;
+
+	/* Sanity checks */
+	if ((uint32_t)instr->len % espi_flash->mtd.erasesize)
+		return -EINVAL;
+
+	if ((uint32_t)instr->addr % espi_flash->mtd.erasesize)
+		return -EINVAL;
+
+	mutex_lock(&espi_flash->lock);
+
+	while (instr->len) {
+		ret = aspeed_espi_flash_put_tx(ESPI_FLASH_ERASE,
+					       espi_flash->erase_mask,
+					       instr->addr, NULL, 0,
+					       espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		ret = aspeed_espi_flash_rx_get_completion(espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		instr->len -= espi_flash->mtd.erasesize;
+		instr->addr += espi_flash->mtd.erasesize;
+	}
+
+unlock_mtx_n_out:
+	instr->fail_addr = instr->addr;
+
+	mutex_unlock(&espi_flash->lock);
+	return ret;
+}
+
+static int aspeed_espi_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
+				  size_t *retlen, u_char *buf)
+{
+	struct aspeed_espi_flash *espi_flash = mtd->priv;
+	uint16_t len_pt, len_rx;
+	size_t pkt_len;
+	uint8_t cyc;
+	int ret = 0;
+
+	mutex_lock(&espi_flash->lock);
+
+	while (len) {
+		len_pt = (len > ESPI_PLD_LEN_MIN) ? ESPI_PLD_LEN_MIN : len;
+
+		ret = aspeed_espi_flash_put_tx(ESPI_FLASH_READ, len_pt, from,
+					       NULL, 0, espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		pkt_len = len_pt;
+		len_rx = 0;
+		cyc = 0;
+		ret = aspeed_espi_flash_rx(&cyc, &len_rx, NULL, buf, &pkt_len,
+					   espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		if (cyc != ESPI_FLASH_SUC_CMPLT_D_ONLY) {
+			dev_notice(espi_flash->ctrl->dev, "eSPI Rx response was not successful\n");
+			ret = -EFAULT;
+			goto unlock_mtx_n_out;
+		}
+		if (pkt_len != len_pt) {
+			dev_notice(espi_flash->ctrl->dev,
+				"eSPI Rx response has unexpected data length\n");
+			ret = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+
+		len -= len_pt;
+		buf += len_pt;
+		from += len_pt;
+		*retlen += len_pt;
+	}
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->lock);
+	return ret;
+}
+
+static int aspeed_espi_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
+				   size_t *retlen, const u_char *buf)
+{
+	struct aspeed_espi_flash *espi_flash = mtd->priv;
+	uint16_t len_pt;
+	int ret = 0;
+
+	mutex_lock(&espi_flash->lock);
+
+	while (len) {
+		len_pt = (len > ESPI_PLD_LEN_MIN) ? ESPI_PLD_LEN_MIN : len;
+
+		ret = aspeed_espi_flash_put_tx(ESPI_FLASH_WRITE, len_pt, to,
+					       buf, len_pt, espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		ret = aspeed_espi_flash_rx_get_completion(espi_flash);
+		if (ret)
+			goto unlock_mtx_n_out;
+
+		len -= len_pt;
+		buf += len_pt;
+		to += len_pt;
+		*retlen += len_pt;
+	}
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->lock);
+	return ret;
+}
+
+void aspeed_espi_flash_enable(struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+	struct aspeed_espi_ctrl *espi_ctrl = espi_flash->ctrl;
+
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_MODE_MASK, 0);
+
+	/* Enable DMA transfers */
+	regmap_write(espi_ctrl->map, ESPI_FLASH_TX_DMA, dma->tx_addr);
+	regmap_write(espi_ctrl->map, ESPI_FLASH_RX_DMA, dma->rx_addr);
+	regmap_update_bits(
+		espi_ctrl->map, ESPI_CTRL,
+		ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN,
+		ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN);
+
+	/* Enable interrupts */
+	regmap_write(espi_ctrl->map, ESPI_INT_STS, ESPI_INT_STS_FLASH_BITS);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_INT_EN, ESPI_INT_EN_FLASH_BITS,
+			   ESPI_INT_EN_FLASH_BITS);
+
+	/* Set Flash Channel Software Ready */
+	regmap_update_bits(espi_ctrl->map, ESPI_CTRL, ESPI_CTRL_FLASH_SW_RDY,
+			   ESPI_CTRL_FLASH_SW_RDY);
+}
+
+void *aspeed_espi_flash_alloc(struct device *dev,
+			      struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int ret, index;
+	struct aspeed_espi_flash_dma *dma;
+	struct mtd_info *mtd;
+	struct aspeed_espi_flash *espi_flash;
+	struct resource res;
+	u32 reg;
+
+	espi_flash =
+		devm_kzalloc(dev, sizeof(struct aspeed_espi_flash), GFP_KERNEL);
+	if (!espi_flash)
+		return ERR_PTR(-ENOMEM);
+
+	espi_flash->ctrl = espi_ctrl;
+
+	/* Bus lock */
+	mutex_init(&espi_flash->lock);
+
+	init_waitqueue_head(&espi_flash->wq);
+
+	spin_lock_init(&espi_flash->spinlock);
+
+	dma = &espi_flash->dma;
+
+	dma->tx_virt =
+		dma_alloc_coherent(dev, PAGE_SIZE, &dma->tx_addr, GFP_KERNEL);
+	if (!dma->tx_virt) {
+		dev_err(dev, "cannot allocate DMA TX buffer\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	dma->rx_virt =
+		dma_alloc_coherent(dev, PAGE_SIZE, &dma->rx_addr, GFP_KERNEL);
+	if (!dma->rx_virt) {
+		dev_err(dev, "cannot allocate DMA RX buffer\n");
+		return ERR_PTR(-ENOMEM);
+	}
+	index = of_property_match_string(dev->of_node, "reg-names",
+					 "espi_flash");
+	ret = of_address_to_resource(dev->of_node, index, &res);
+	if (ret < 0) {
+		dev_err(dev,
+			"Could not find espi_flash resource block size in devtree\n");
+		return ERR_PTR(-ENODEV);
+	}
+	reg = resource_size(&res);
+	mtd = &espi_flash->mtd;
+	mtd->dev.parent = dev;
+	mtd->size = reg;
+	mtd->flags = MTD_CAP_NORFLASH;
+	mtd->_erase = aspeed_espi_flash_erase;
+	mtd->_read = aspeed_espi_flash_read;
+	mtd->_write = aspeed_espi_flash_write;
+	mtd->type = MTD_NORFLASH;
+	mtd->name = "espi-flash-mafs";
+
+	regmap_read(espi_ctrl->map, ESPI_CH3_CAP_N_CONF, &reg);
+	reg = (reg & ESPI_CH3_CAP_N_CONF_ERASE_MASK) >>
+	      ESPI_CH3_CAP_N_CONF_ERASE_SHIFT;
+	espi_flash->erase_mask = reg;
+	switch (reg) {
+	case ESPI_CH3_CAP_N_CONF_ERASE_SIZE_4KB:
+	case ESPI_CH3_CAP_N_CONF_ERASE_SIZE_4KB_64KB:
+		mtd->erasesize = 0x1000;
+		espi_flash->erase_mask = 1;
+		break;
+	case ESPI_CH3_CAP_N_CONF_ERASE_SIZE_64KB:
+		mtd->erasesize = 0x10000;
+		break;
+	case ESPI_CH3_CAP_N_CONF_ERASE_SIZE_128KB:
+		mtd->erasesize = 0x20000;
+		break;
+	case ESPI_CH3_CAP_N_CONF_ERASE_SIZE_256KB:
+		mtd->erasesize = 0x40000;
+		break;
+	default:
+		dev_notice(dev, "Unknown erase size %x\n", reg);
+		return ERR_PTR(-ENODEV);
+	}
+
+	mtd->writesize = 1;
+	mtd->owner = THIS_MODULE;
+	mtd->priv = espi_flash;
+
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		dev_notice(dev, "aspeed-espi-mtd: Failed to register mtd device\n");
+		return ERR_PTR(ret);
+	}
+
+	aspeed_espi_flash_enable(espi_flash);
+	return espi_flash;
+}
+
+void aspeed_espi_flash_free(struct device *dev,
+			    struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+
+	dma_free_coherent(dev, PAGE_SIZE, dma->tx_virt, dma->tx_addr);
+	dma_free_coherent(dev, PAGE_SIZE, dma->rx_virt, dma->rx_addr);
+
+	mtd_device_unregister(&espi_flash->mtd);
+}
diff --git a/drivers/soc/aspeed/aspeed-espi-flash.h b/drivers/soc/aspeed/aspeed-espi-flash.h
new file mode 100644
index 000000000000..08d0a79796e2
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-flash.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2024 Aspeed Technology Inc.
+ */
+#ifndef _ASPEED_ESPI_FLASH_H_
+#define _ASPEED_ESPI_FLASH_H_
+
+#include <linux/mtd/mtd.h>
+
+/*
+ * eSPI cycle type encoding
+ *
+ * Section 5.1 Cycle Types and Packet Format,
+ * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ */
+#define ESPI_FLASH_READ                 0x00
+#define ESPI_FLASH_WRITE                0x01
+#define ESPI_FLASH_ERASE                0x02
+#define ESPI_FLASH_SUC_CMPLT            0x06
+#define ESPI_FLASH_SUC_CMPLT_D_MIDDLE   0x09
+#define ESPI_FLASH_SUC_CMPLT_D_FIRST    0x0b
+#define ESPI_FLASH_SUC_CMPLT_D_LAST     0x0d
+#define ESPI_FLASH_SUC_CMPLT_D_ONLY     0x0f
+#define ESPI_FLASH_UNSUC_CMPLT          0x0c
+#define ESPI_FLASH_UNSUC_CMPLT_ONLY     0x0e
+
+/*
+ * we choose the longest header and the max payload size
+ * based on the Intel specification to define the maximum
+ * eSPI packet length
+ */
+#define ESPI_PLD_LEN_MIN        (1UL << 6)
+#define ESPI_PLD_LEN_MAX        (1UL << 12)
+
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
+
+	unsigned short		page_offset;	/* offset in flash address */
+	unsigned int		page_size;	   /* of bytes per page */
+	struct mutex			lock;
+	struct aspeed_espi_flash_dma	dma;
+	struct mtd_info			mtd;
+	struct aspeed_espi_ctrl		*ctrl;
+	uint8_t				erase_mask;
+	uint32_t			tx_sts;
+	uint32_t			rx_sts;
+	wait_queue_head_t		wq;
+	spinlock_t			spinlock;
+};
+
+void aspeed_espi_flash_event(uint32_t sts, struct aspeed_espi_flash *espi_flash);
+void aspeed_espi_flash_enable(struct aspeed_espi_flash *espi_flash);
+void *aspeed_espi_flash_alloc(struct device *dev, struct aspeed_espi_ctrl *espi_ctrl);
+void aspeed_espi_flash_free(struct device *dev, struct aspeed_espi_flash *espi_flash);
+
+#endif
+
-- 
2.40.1

