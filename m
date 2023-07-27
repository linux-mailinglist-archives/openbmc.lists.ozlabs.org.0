Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3531765D36
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 22:25:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6jHLX4Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBj1f4mvqz3cPd
	for <lists+openbmc@lfdr.de>; Fri, 28 Jul 2023 06:25:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6jHLX4Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBhzW666yz3cQC
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2023 06:23:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690489400; x=1722025400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OgFau61Z2mObHuP5OjMQaKjoGa0QY/P4lHkwjOZm5gw=;
  b=S6jHLX4Y7/O78vx7dluC+Y0nf4jT0+jlCcuebAX0pp8tMg3094DQEMv1
   fPhhp1rEiIybsEdwR8nBUZHKpNw/axYM4asavh1OuUKu2tq1utslBXhzU
   +A4t4kX0qjr6Urf9rHEW5n8zBH5VsdB0exbC62ch0B7tW/e3Je1mB0Ixo
   1tZQBpI+uH1DfeIDAZHUrRa13gcVvV0F9P8jlY7zmjAcqqbOKP5fWhhlI
   1a5Bdrz9WGjvXqqNWzHxTF32QdyTogdI34Dzfzo9a7aGYSbW/BRZs8fpZ
   xPBSh4Uynabk29JmBmrtS/FGOxGz41OOxP6TxZyLc3m1Lu474YYubkLSw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368442766"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="368442766"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900980489"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="900980489"
Received: from mtyszka-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.133.203])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:11 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] peci: Add peci-npcm controller driver
Date: Thu, 27 Jul 2023 22:21:24 +0200
Message-Id: <20230727202126.1477515-3-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727202126.1477515-1-iwona.winiarska@intel.com>
References: <20230727202126.1477515-1-iwona.winiarska@intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Conor Dooley <conor+dt@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tomer Maimon <tmaimon77@gmail.com>

Add support for Nuvoton NPCM BMC hardware to the Platform Environment
Control Interface (PECI) subsystem.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
Changes v1 -> v2:

* Removed period from the end of copyright (Paul)
---
 drivers/peci/controller/Kconfig     |  16 ++
 drivers/peci/controller/Makefile    |   1 +
 drivers/peci/controller/peci-npcm.c | 298 ++++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 drivers/peci/controller/peci-npcm.c

diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
index 2fc5e2abb74a..4f9c245ad042 100644
--- a/drivers/peci/controller/Kconfig
+++ b/drivers/peci/controller/Kconfig
@@ -16,3 +16,19 @@ config PECI_ASPEED
 
 	  This driver can also be built as a module. If so, the module will
 	  be called peci-aspeed.
+
+config PECI_NPCM
+	tristate "Nuvoton NPCM PECI support"
+	depends on ARCH_NPCM || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	help
+	  This option enables PECI controller driver for Nuvoton NPCM7XX
+	  and NPCM8XX SoCs. It allows BMC to discover devices connected
+	  to it and communicate with them using PECI protocol.
+
+	  Say Y here if you want support for the Platform Environment Control
+	  Interface (PECI) bus adapter driver on the Nuvoton NPCM SoCs.
+
+	  This support is also available as a module. If so, the module
+	  will be called peci-npcm.
diff --git a/drivers/peci/controller/Makefile b/drivers/peci/controller/Makefile
index 022c28ef1bf0..e247449bb423 100644
--- a/drivers/peci/controller/Makefile
+++ b/drivers/peci/controller/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_PECI_ASPEED)	+= peci-aspeed.o
+obj-$(CONFIG_PECI_NPCM)		+= peci-npcm.o
diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
new file mode 100644
index 000000000000..ec613d35c796
--- /dev/null
+++ b/drivers/peci/controller/peci-npcm.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology corporation
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/peci.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+/* NPCM GCR module */
+#define NPCM_INTCR3_OFFSET	0x9C
+#define NPCM_INTCR3_PECIVSEL	BIT(19)
+
+/* NPCM PECI Registers */
+#define NPCM_PECI_CTL_STS	0x00
+#define NPCM_PECI_RD_LENGTH	0x04
+#define NPCM_PECI_ADDR		0x08
+#define NPCM_PECI_CMD		0x0C
+#define NPCM_PECI_CTL2		0x10
+#define NPCM_PECI_WR_LENGTH	0x1C
+#define NPCM_PECI_PDDR		0x2C
+#define NPCM_PECI_DAT_INOUT(n)	(0x100 + ((n) * 4))
+
+#define NPCM_PECI_MAX_REG	0x200
+
+/* NPCM_PECI_CTL_STS - 0x00 : Control Register */
+#define NPCM_PECI_CTRL_DONE_INT_EN	BIT(6)
+#define NPCM_PECI_CTRL_ABRT_ERR		BIT(4)
+#define NPCM_PECI_CTRL_CRC_ERR		BIT(3)
+#define NPCM_PECI_CTRL_DONE		BIT(1)
+#define NPCM_PECI_CTRL_START_BUSY	BIT(0)
+
+/* NPCM_PECI_RD_LENGTH - 0x04 : Command Register */
+#define NPCM_PECI_RD_LEN_MASK		GENMASK(6, 0)
+
+/* NPCM_PECI_CMD - 0x10 : Command Register */
+#define NPCM_PECI_CTL2_MASK		GENMASK(7, 6)
+
+/* NPCM_PECI_WR_LENGTH - 0x1C : Command Register */
+#define NPCM_PECI_WR_LEN_MASK		GENMASK(6, 0)
+
+/* NPCM_PECI_PDDR - 0x2C : Command Register */
+#define NPCM_PECI_PDDR_MASK		GENMASK(4, 0)
+
+#define NPCM_PECI_INT_MASK		(NPCM_PECI_CTRL_ABRT_ERR | \
+					 NPCM_PECI_CTRL_CRC_ERR  | \
+					 NPCM_PECI_CTRL_DONE)
+
+#define NPCM_PECI_IDLE_CHECK_TIMEOUT_USEC	(50 * USEC_PER_MSEC)
+#define NPCM_PECI_IDLE_CHECK_INTERVAL_USEC	(10 * USEC_PER_MSEC)
+#define NPCM_PECI_CMD_TIMEOUT_MS_DEFAULT	1000
+#define NPCM_PECI_CMD_TIMEOUT_MS_MAX		60000
+#define NPCM_PECI_HOST_NEG_BIT_RATE_DEFAULT	15
+#define NPCM_PECI_PULL_DOWN_DEFAULT		0
+
+struct npcm_peci {
+	u32			cmd_timeout_ms;
+	struct completion	xfer_complete;
+	struct regmap		*regmap;
+	u32			status;
+	spinlock_t		lock; /* to sync completion status handling */
+	struct peci_controller *controller;
+	struct device		*dev;
+	struct clk		*clk;
+	int			irq;
+};
+
+static int npcm_peci_xfer(struct peci_controller *controller, u8 addr, struct peci_request *req)
+{
+	struct npcm_peci *priv = dev_get_drvdata(controller->dev.parent);
+	unsigned long timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
+	unsigned int msg_rd;
+	u32 cmd_sts;
+	int i, ret;
+
+	/* Check command sts and bus idle state */
+	ret = regmap_read_poll_timeout(priv->regmap, NPCM_PECI_CTL_STS, cmd_sts,
+				       !(cmd_sts & NPCM_PECI_CTRL_START_BUSY),
+				       NPCM_PECI_IDLE_CHECK_INTERVAL_USEC,
+				       NPCM_PECI_IDLE_CHECK_TIMEOUT_USEC);
+	if (ret)
+		return ret; /* -ETIMEDOUT */
+
+	spin_lock_irq(&priv->lock);
+	reinit_completion(&priv->xfer_complete);
+
+	regmap_write(priv->regmap, NPCM_PECI_ADDR, addr);
+	regmap_write(priv->regmap, NPCM_PECI_RD_LENGTH, NPCM_PECI_WR_LEN_MASK & req->rx.len);
+	regmap_write(priv->regmap, NPCM_PECI_WR_LENGTH, NPCM_PECI_WR_LEN_MASK & req->tx.len);
+
+	if (req->tx.len) {
+		regmap_write(priv->regmap, NPCM_PECI_CMD, req->tx.buf[0]);
+
+		for (i = 0; i < (req->tx.len - 1); i++)
+			regmap_write(priv->regmap, NPCM_PECI_DAT_INOUT(i), req->tx.buf[i + 1]);
+	}
+
+#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
+	dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.len : %#02x\n",
+		addr, req->tx.len, req->rx.len);
+	print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req->tx.len);
+#endif
+
+	priv->status = 0;
+	regmap_update_bits(priv->regmap, NPCM_PECI_CTL_STS, NPCM_PECI_CTRL_START_BUSY,
+			   NPCM_PECI_CTRL_START_BUSY);
+
+	spin_unlock_irq(&priv->lock);
+
+	ret = wait_for_completion_interruptible_timeout(&priv->xfer_complete, timeout);
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0) {
+		dev_dbg(priv->dev, "timeout waiting for a response\n");
+		return -ETIMEDOUT;
+	}
+
+	spin_lock_irq(&priv->lock);
+
+	if (priv->status != NPCM_PECI_CTRL_DONE) {
+		spin_unlock_irq(&priv->lock);
+		dev_dbg(priv->dev, "no valid response, status: %#02x\n", priv->status);
+		return -EIO;
+	}
+
+	regmap_write(priv->regmap, NPCM_PECI_CMD, 0);
+
+	for (i = 0; i < req->rx.len; i++) {
+		regmap_read(priv->regmap, NPCM_PECI_DAT_INOUT(i), &msg_rd);
+		req->rx.buf[i] = (u8)msg_rd;
+	}
+
+	spin_unlock_irq(&priv->lock);
+
+#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
+	print_hex_dump_bytes("RX : ", DUMP_PREFIX_NONE, req->rx.buf, req->rx.len);
+#endif
+	return 0;
+}
+
+static irqreturn_t npcm_peci_irq_handler(int irq, void *arg)
+{
+	struct npcm_peci *priv = arg;
+	u32 status_ack = 0;
+	u32 status;
+
+	spin_lock(&priv->lock);
+	regmap_read(priv->regmap, NPCM_PECI_CTL_STS, &status);
+	priv->status |= (status & NPCM_PECI_INT_MASK);
+
+	if (status & NPCM_PECI_CTRL_CRC_ERR)
+		status_ack |= NPCM_PECI_CTRL_CRC_ERR;
+
+	if (status & NPCM_PECI_CTRL_ABRT_ERR)
+		status_ack |= NPCM_PECI_CTRL_ABRT_ERR;
+
+	/*
+	 * All commands should be ended up with a NPCM_PECI_CTRL_DONE
+	 * bit set even in an error case.
+	 */
+	if (status & NPCM_PECI_CTRL_DONE) {
+		status_ack |= NPCM_PECI_CTRL_DONE;
+		complete(&priv->xfer_complete);
+	}
+
+	regmap_write_bits(priv->regmap, NPCM_PECI_CTL_STS, NPCM_PECI_INT_MASK, status_ack);
+
+	spin_unlock(&priv->lock);
+	return IRQ_HANDLED;
+}
+
+static int npcm_peci_init_ctrl(struct npcm_peci *priv)
+{
+	u32 cmd_sts;
+	int ret;
+
+	priv->clk = devm_clk_get_enabled(priv->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(priv->dev, "failed to get ref clock\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	ret = device_property_read_u32(priv->dev, "cmd-timeout-ms", &priv->cmd_timeout_ms);
+	if (ret) {
+		priv->cmd_timeout_ms = NPCM_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	} else if (priv->cmd_timeout_ms > NPCM_PECI_CMD_TIMEOUT_MS_MAX ||
+		   priv->cmd_timeout_ms == 0) {
+		dev_warn(priv->dev, "invalid cmd-timeout-ms: %u, falling back to: %u\n",
+			 priv->cmd_timeout_ms, NPCM_PECI_CMD_TIMEOUT_MS_DEFAULT);
+
+		priv->cmd_timeout_ms = NPCM_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	}
+
+	regmap_update_bits(priv->regmap, NPCM_PECI_CTL2, NPCM_PECI_CTL2_MASK,
+			   NPCM_PECI_PULL_DOWN_DEFAULT << 6);
+
+	regmap_update_bits(priv->regmap, NPCM_PECI_PDDR, NPCM_PECI_PDDR_MASK,
+			   NPCM_PECI_HOST_NEG_BIT_RATE_DEFAULT);
+
+	ret = regmap_read_poll_timeout(priv->regmap, NPCM_PECI_CTL_STS, cmd_sts,
+				       !(cmd_sts & NPCM_PECI_CTRL_START_BUSY),
+				       NPCM_PECI_IDLE_CHECK_INTERVAL_USEC,
+				       NPCM_PECI_IDLE_CHECK_TIMEOUT_USEC);
+	if (ret)
+		return ret; /* -ETIMEDOUT */
+
+	/* PECI interrupt enable */
+	regmap_update_bits(priv->regmap, NPCM_PECI_CTL_STS, NPCM_PECI_CTRL_DONE_INT_EN,
+			   NPCM_PECI_CTRL_DONE_INT_EN);
+
+	return 0;
+}
+
+static const struct regmap_config npcm_peci_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = NPCM_PECI_MAX_REG,
+	.fast_io = true,
+};
+
+static struct peci_controller_ops npcm_ops = {
+	.xfer = npcm_peci_xfer,
+};
+
+static int npcm_peci_probe(struct platform_device *pdev)
+{
+	struct peci_controller *controller;
+	struct npcm_peci *priv;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	dev_set_drvdata(&pdev->dev, priv);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base, &npcm_peci_regmap_config);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
+
+	ret = devm_request_irq(&pdev->dev, priv->irq, npcm_peci_irq_handler,
+			       0, "peci-npcm-irq", priv);
+	if (ret)
+		return ret;
+
+	init_completion(&priv->xfer_complete);
+	spin_lock_init(&priv->lock);
+
+	ret = npcm_peci_init_ctrl(priv);
+	if (ret)
+		return ret;
+
+	controller = devm_peci_controller_add(priv->dev, &npcm_ops);
+	if (IS_ERR(controller))
+		return dev_err_probe(priv->dev, PTR_ERR(controller),
+				     "failed to add npcm peci controller\n");
+
+	priv->controller = controller;
+
+	return 0;
+}
+
+static const struct of_device_id npcm_peci_of_table[] = {
+	{ .compatible = "nuvoton,npcm750-peci", },
+	{ .compatible = "nuvoton,npcm845-peci", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_peci_of_table);
+
+static struct platform_driver npcm_peci_driver = {
+	.probe  = npcm_peci_probe,
+	.driver = {
+		.name           = KBUILD_MODNAME,
+		.of_match_table = npcm_peci_of_table,
+	},
+};
+module_platform_driver(npcm_peci_driver);
+
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_DESCRIPTION("NPCM PECI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PECI);
-- 
2.40.1

