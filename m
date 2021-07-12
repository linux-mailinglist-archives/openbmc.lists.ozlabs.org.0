Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD483C6630
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 00:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNyfM3nd2z3blB
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:11:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNydG4TWZz3068;
 Tue, 13 Jul 2021 08:10:42 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="295709128"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="295709128"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:09:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="464390274"
Received: from jzloch-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.136.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:09:44 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 07/14] peci: Add peci-aspeed controller driver
Date: Tue, 13 Jul 2021 00:04:40 +0200
Message-Id: <20210712220447.957418-8-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712220447.957418-1-iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

ASPEED AST24xx/AST25xx/AST26xx SoCs supports the PECI electrical
interface (a.k.a PECI wire).

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS                           |   9 +
 drivers/peci/Kconfig                  |   6 +
 drivers/peci/Makefile                 |   3 +
 drivers/peci/controller/Kconfig       |  12 +
 drivers/peci/controller/Makefile      |   3 +
 drivers/peci/controller/peci-aspeed.c | 501 ++++++++++++++++++++++++++
 6 files changed, 534 insertions(+)
 create mode 100644 drivers/peci/controller/Kconfig
 create mode 100644 drivers/peci/controller/Makefile
 create mode 100644 drivers/peci/controller/peci-aspeed.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 47411e2b6336..4ba874afa2fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2865,6 +2865,15 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621.rst
 F:	drivers/hwmon/asc7621.c
 
+ASPEED PECI CONTROLLER
+M:	Iwona Winiarska <iwona.winiarska@intel.com>
+M:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/peci/peci-aspeed.yaml
+F:	drivers/peci/controller/peci-aspeed.c
+
 ASPEED PINCTRL DRIVERS
 M:	Andrew Jeffery <andrew@aj.id.au>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
index 601cc3c3c852..0d0ee8009713 100644
--- a/drivers/peci/Kconfig
+++ b/drivers/peci/Kconfig
@@ -12,3 +12,9 @@ menuconfig PECI
 
 	  This support is also available as a module. If so, the module
 	  will be called peci.
+
+if PECI
+
+source "drivers/peci/controller/Kconfig"
+
+endif # PECI
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
index 2bb2f51bcda7..621a993e306a 100644
--- a/drivers/peci/Makefile
+++ b/drivers/peci/Makefile
@@ -3,3 +3,6 @@
 # Core functionality
 peci-y := core.o sysfs.o
 obj-$(CONFIG_PECI) += peci.o
+
+# Hardware specific bus drivers
+obj-y += controller/
diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
new file mode 100644
index 000000000000..8ddbe494677f
--- /dev/null
+++ b/drivers/peci/controller/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PECI_ASPEED
+	tristate "ASPEED PECI support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	help
+	  Enable this driver if you want to support ASPEED PECI controller.
+
+	  This driver can be also build as a module. If so, the module
+	  will be called peci-aspeed.
diff --git a/drivers/peci/controller/Makefile b/drivers/peci/controller/Makefile
new file mode 100644
index 000000000000..022c28ef1bf0
--- /dev/null
+++ b/drivers/peci/controller/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_PECI_ASPEED)	+= peci-aspeed.o
diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
new file mode 100644
index 000000000000..888b46383ea4
--- /dev/null
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2012-2017 ASPEED Technology Inc.
+// Copyright (c) 2018-2021 Intel Corporation
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/peci.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <asm/unaligned.h>
+
+/* ASPEED PECI Registers */
+/* Control Register */
+#define ASPEED_PECI_CTRL			0x00
+#define   ASPEED_PECI_CTRL_SAMPLING_MASK	GENMASK(19, 16)
+#define   ASPEED_PECI_CTRL_READ_MODE_MASK	GENMASK(13, 12)
+#define   ASPEED_PECI_CTRL_READ_MODE_COUNT	BIT(12)
+#define   ASPEED_PECI_CTRL_READ_MODE_DBG	BIT(13)
+#define   ASPEED_PECI_CTRL_CLK_SOURCE_MASK	BIT(11)
+#define   ASPEED_PECI_CTRL_CLK_DIV_MASK		GENMASK(10, 8)
+#define   ASPEED_PECI_CTRL_INVERT_OUT		BIT(7)
+#define   ASPEED_PECI_CTRL_INVERT_IN		BIT(6)
+#define   ASPEED_PECI_CTRL_BUS_CONTENT_EN	BIT(5)
+#define   ASPEED_PECI_CTRL_PECI_EN		BIT(4)
+#define   ASPEED_PECI_CTRL_PECI_CLK_EN		BIT(0)
+
+/* Timing Negotiation Register */
+#define ASPEED_PECI_TIMING_NEGOTIATION		0x04
+#define   ASPEED_PECI_TIMING_MESSAGE_MASK	GENMASK(15, 8)
+#define   ASPEED_PECI_TIMING_ADDRESS_MASK	GENMASK(7, 0)
+
+/* Command Register */
+#define ASPEED_PECI_CMD				0x08
+#define   ASPEED_PECI_CMD_PIN_MON		BIT(31)
+#define   ASPEED_PECI_CMD_STS_MASK		GENMASK(27, 24)
+#define     ASPEED_PECI_CMD_STS_ADDR_T_NEGO	0x3
+#define   ASPEED_PECI_CMD_IDLE_MASK		\
+	  (ASPEED_PECI_CMD_STS_MASK | ASPEED_PECI_CMD_PIN_MON)
+#define   ASPEED_PECI_CMD_FIRE			BIT(0)
+
+/* Read/Write Length Register */
+#define ASPEED_PECI_RW_LENGTH			0x0c
+#define   ASPEED_PECI_AW_FCS_EN			BIT(31)
+#define   ASPEED_PECI_READ_LEN_MASK		GENMASK(23, 16)
+#define   ASPEED_PECI_WRITE_LEN_MASK		GENMASK(15, 8)
+#define   ASPEED_PECI_TAGET_ADDR_MASK		GENMASK(7, 0)
+
+/* Expected FCS Data Register */
+#define ASPEED_PECI_EXP_FCS			0x10
+#define   ASPEED_PECI_EXP_READ_FCS_MASK		GENMASK(23, 16)
+#define   ASPEED_PECI_EXP_AW_FCS_AUTO_MASK	GENMASK(15, 8)
+#define   ASPEED_PECI_EXP_WRITE_FCS_MASK	GENMASK(7, 0)
+
+/* Captured FCS Data Register */
+#define ASPEED_PECI_CAP_FCS			0x14
+#define   ASPEED_PECI_CAP_READ_FCS_MASK		GENMASK(23, 16)
+#define   ASPEED_PECI_CAP_WRITE_FCS_MASK	GENMASK(7, 0)
+
+/* Interrupt Register */
+#define ASPEED_PECI_INT_CTRL			0x18
+#define   ASPEED_PECI_TIMING_NEGO_SEL_MASK	GENMASK(31, 30)
+#define     ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO	0
+#define     ASPEED_PECI_2ND_BIT_OF_ADDR_NEGO	1
+#define     ASPEED_PECI_MESSAGE_NEGO		2
+#define   ASPEED_PECI_INT_MASK			GENMASK(4, 0)
+#define   ASPEED_PECI_INT_BUS_TIMEOUT		BIT(4)
+#define   ASPEED_PECI_INT_BUS_CONNECT		BIT(3)
+#define   ASPEED_PECI_INT_W_FCS_BAD		BIT(2)
+#define   ASPEED_PECI_INT_W_FCS_ABORT		BIT(1)
+#define   ASPEED_PECI_INT_CMD_DONE		BIT(0)
+
+/* Interrupt Status Register */
+#define ASPEED_PECI_INT_STS			0x1c
+#define   ASPEED_PECI_INT_TIMING_RESULT_MASK	GENMASK(29, 16)
+	  /* bits[4..0]: Same bit fields in the 'Interrupt Register' */
+
+/* Rx/Tx Data Buffer Registers */
+#define ASPEED_PECI_W_DATA0			0x20
+#define ASPEED_PECI_W_DATA1			0x24
+#define ASPEED_PECI_W_DATA2			0x28
+#define ASPEED_PECI_W_DATA3			0x2c
+#define ASPEED_PECI_R_DATA0			0x30
+#define ASPEED_PECI_R_DATA1			0x34
+#define ASPEED_PECI_R_DATA2			0x38
+#define ASPEED_PECI_R_DATA3			0x3c
+#define ASPEED_PECI_W_DATA4			0x40
+#define ASPEED_PECI_W_DATA5			0x44
+#define ASPEED_PECI_W_DATA6			0x48
+#define ASPEED_PECI_W_DATA7			0x4c
+#define ASPEED_PECI_R_DATA4			0x50
+#define ASPEED_PECI_R_DATA5			0x54
+#define ASPEED_PECI_R_DATA6			0x58
+#define ASPEED_PECI_R_DATA7			0x5c
+#define   ASPEED_PECI_DATA_BUF_SIZE_MAX		32
+
+/* Timing Negotiation */
+#define ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT	8
+#define ASPEED_PECI_RD_SAMPLING_POINT_MAX	(BIT(4) - 1)
+#define ASPEED_PECI_CLK_DIV_DEFAULT		0
+#define ASPEED_PECI_CLK_DIV_MAX			(BIT(3) - 1)
+#define ASPEED_PECI_MSG_TIMING_DEFAULT		1
+#define ASPEED_PECI_MSG_TIMING_MAX		(BIT(8) - 1)
+#define ASPEED_PECI_ADDR_TIMING_DEFAULT		1
+#define ASPEED_PECI_ADDR_TIMING_MAX		(BIT(8) - 1)
+
+/* Timeout */
+#define ASPEED_PECI_IDLE_CHECK_TIMEOUT_US	(50 * USEC_PER_MSEC)
+#define ASPEED_PECI_IDLE_CHECK_INTERVAL_US	(10 * USEC_PER_MSEC)
+#define ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT	(1000)
+#define ASPEED_PECI_CMD_TIMEOUT_MS_MAX		(1000)
+
+struct aspeed_peci {
+	struct peci_controller controller;
+	struct device *dev;
+	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *rst;
+	int irq;
+	spinlock_t lock; /* to sync completion status handling */
+	struct completion xfer_complete;
+	u32 status;
+	u32 cmd_timeout_ms;
+	u32 msg_timing;
+	u32 addr_timing;
+	u32 rd_sampling_point;
+	u32 clk_div;
+};
+
+static inline struct aspeed_peci *to_aspeed_peci(struct peci_controller *a)
+{
+	return container_of(a, struct aspeed_peci, controller);
+}
+
+static void aspeed_peci_init_regs(struct aspeed_peci *priv)
+{
+	u32 val;
+
+	val = FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, ASPEED_PECI_CLK_DIV_DEFAULT);
+	val |= ASPEED_PECI_CTRL_PECI_CLK_EN;
+	writel(val, priv->base + ASPEED_PECI_CTRL);
+	/*
+	 * Timing negotiation period setting.
+	 * The unit of the programmed value is 4 times of PECI clock period.
+	 */
+	val = FIELD_PREP(ASPEED_PECI_TIMING_MESSAGE_MASK, priv->msg_timing);
+	val |= FIELD_PREP(ASPEED_PECI_TIMING_ADDRESS_MASK, priv->addr_timing);
+	writel(val, priv->base + ASPEED_PECI_TIMING_NEGOTIATION);
+
+	/* Clear interrupts */
+	val = readl(priv->base + ASPEED_PECI_INT_STS) | ASPEED_PECI_INT_MASK;
+	writel(val, priv->base + ASPEED_PECI_INT_STS);
+
+	/* Set timing negotiation mode and enable interrupts */
+	val = FIELD_PREP(ASPEED_PECI_TIMING_NEGO_SEL_MASK, ASPEED_PECI_1ST_BIT_OF_ADDR_NEGO);
+	val |= ASPEED_PECI_INT_MASK;
+	writel(val, priv->base + ASPEED_PECI_INT_CTRL);
+
+	val = FIELD_PREP(ASPEED_PECI_CTRL_SAMPLING_MASK, priv->rd_sampling_point);
+	val |= FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, priv->clk_div);
+	val |= ASPEED_PECI_CTRL_PECI_EN;
+	val |= ASPEED_PECI_CTRL_PECI_CLK_EN;
+	writel(val, priv->base + ASPEED_PECI_CTRL);
+}
+
+static inline int aspeed_peci_check_idle(struct aspeed_peci *priv)
+{
+	u32 cmd_sts = readl(priv->base + ASPEED_PECI_CMD);
+
+	if (FIELD_GET(ASPEED_PECI_CMD_STS_MASK, cmd_sts) == ASPEED_PECI_CMD_STS_ADDR_T_NEGO)
+		aspeed_peci_init_regs(priv);
+
+	return readl_poll_timeout(priv->base + ASPEED_PECI_CMD,
+				  cmd_sts,
+				  !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
+				  ASPEED_PECI_IDLE_CHECK_INTERVAL_US,
+				  ASPEED_PECI_IDLE_CHECK_TIMEOUT_US);
+}
+
+static int aspeed_peci_xfer(struct peci_controller *controller,
+			    u8 addr, struct peci_request *req)
+{
+	struct aspeed_peci *priv = to_aspeed_peci(controller);
+	unsigned long flags, timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
+	u32 peci_head;
+	int ret;
+
+	if (req->tx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX ||
+	    req->rx.len > ASPEED_PECI_DATA_BUF_SIZE_MAX)
+		return -EINVAL;
+
+	/* Check command sts and bus idle state */
+	ret = aspeed_peci_check_idle(priv);
+	if (ret)
+		return ret; /* -ETIMEDOUT */
+
+	spin_lock_irqsave(&priv->lock, flags);
+	reinit_completion(&priv->xfer_complete);
+
+	peci_head = FIELD_PREP(ASPEED_PECI_TAGET_ADDR_MASK, addr) |
+		    FIELD_PREP(ASPEED_PECI_WRITE_LEN_MASK, req->tx.len) |
+		    FIELD_PREP(ASPEED_PECI_READ_LEN_MASK, req->rx.len);
+
+	writel(peci_head, priv->base + ASPEED_PECI_RW_LENGTH);
+
+	memcpy_toio(priv->base + ASPEED_PECI_W_DATA0, req->tx.buf,
+		    req->tx.len > 16 ? 16 : req->tx.len);
+	if (req->tx.len > 16)
+		memcpy_toio(priv->base + ASPEED_PECI_W_DATA4, req->tx.buf + 16,
+			    req->tx.len - 16);
+
+	dev_dbg(priv->dev, "HEAD : 0x%08x\n", peci_head);
+	print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req->tx.len);
+
+	priv->status = 0;
+	writel(ASPEED_PECI_CMD_FIRE, priv->base + ASPEED_PECI_CMD);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	ret = wait_for_completion_interruptible_timeout(&priv->xfer_complete, timeout);
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0) {
+		dev_dbg(priv->dev, "Timeout waiting for a response!\n");
+		return -ETIMEDOUT;
+	}
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	writel(0, priv->base + ASPEED_PECI_CMD);
+
+	if (priv->status != ASPEED_PECI_INT_CMD_DONE) {
+		spin_unlock_irqrestore(&priv->lock, flags);
+		dev_dbg(priv->dev, "No valid response!\n");
+		return -EIO;
+	}
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	memcpy_fromio(req->rx.buf, priv->base + ASPEED_PECI_R_DATA0,
+		      req->rx.len > 16 ? 16 : req->rx.len);
+	if (req->rx.len > 16)
+		memcpy_fromio(req->rx.buf + 16, priv->base + ASPEED_PECI_R_DATA4,
+			      req->rx.len - 16);
+
+	print_hex_dump_bytes("RX : ", DUMP_PREFIX_NONE, req->rx.buf, req->rx.len);
+
+	return 0;
+}
+
+static irqreturn_t aspeed_peci_irq_handler(int irq, void *arg)
+{
+	struct aspeed_peci *priv = arg;
+	u32 status;
+
+	spin_lock(&priv->lock);
+	status = readl(priv->base + ASPEED_PECI_INT_STS);
+	writel(status, priv->base + ASPEED_PECI_INT_STS);
+	priv->status |= (status & ASPEED_PECI_INT_MASK);
+
+	/*
+	 * In most cases, interrupt bits will be set one by one but also note
+	 * that multiple interrupt bits could be set at the same time.
+	 */
+	if (status & ASPEED_PECI_INT_BUS_TIMEOUT)
+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_BUS_TIMEOUT\n");
+
+	if (status & ASPEED_PECI_INT_BUS_CONNECT)
+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_BUS_CONNECT\n");
+
+	if (status & ASPEED_PECI_INT_W_FCS_BAD)
+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_W_FCS_BAD\n");
+
+	if (status & ASPEED_PECI_INT_W_FCS_ABORT)
+		dev_dbg_ratelimited(priv->dev, "ASPEED_PECI_INT_W_FCS_ABORT\n");
+
+	/*
+	 * All commands should be ended up with a ASPEED_PECI_INT_CMD_DONE bit
+	 * set even in an error case.
+	 */
+	if (status & ASPEED_PECI_INT_CMD_DONE)
+		complete(&priv->xfer_complete);
+
+	spin_unlock(&priv->lock);
+
+	return IRQ_HANDLED;
+}
+
+static void __sanitize_clock_divider(struct aspeed_peci *priv)
+{
+	u32 clk_div;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "clock-divider", &clk_div);
+	if (ret) {
+		clk_div = ASPEED_PECI_CLK_DIV_DEFAULT;
+	} else if (clk_div > ASPEED_PECI_CLK_DIV_MAX) {
+		dev_warn(priv->dev, "Invalid clock-divider: %u, Using default: %u\n",
+			 clk_div, ASPEED_PECI_CLK_DIV_DEFAULT);
+
+		clk_div = ASPEED_PECI_CLK_DIV_DEFAULT;
+	}
+
+	priv->clk_div = clk_div;
+}
+
+static void __sanitize_msg_timing(struct aspeed_peci *priv)
+{
+	u32 msg_timing;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "msg-timing", &msg_timing);
+	if (ret) {
+		msg_timing = ASPEED_PECI_MSG_TIMING_DEFAULT;
+	} else if (msg_timing > ASPEED_PECI_MSG_TIMING_MAX) {
+		dev_warn(priv->dev, "Invalid msg-timing : %u, Use default : %u\n",
+			 msg_timing, ASPEED_PECI_MSG_TIMING_DEFAULT);
+
+		msg_timing = ASPEED_PECI_MSG_TIMING_DEFAULT;
+	}
+
+	priv->msg_timing = msg_timing;
+}
+
+static void __sanitize_addr_timing(struct aspeed_peci *priv)
+{
+	u32 addr_timing;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "addr-timing", &addr_timing);
+	if (ret) {
+		addr_timing = ASPEED_PECI_ADDR_TIMING_DEFAULT;
+	} else if (addr_timing > ASPEED_PECI_ADDR_TIMING_MAX) {
+		dev_warn(priv->dev, "Invalid addr-timing : %u, Use default : %u\n",
+			 addr_timing, ASPEED_PECI_ADDR_TIMING_DEFAULT);
+
+		addr_timing = ASPEED_PECI_ADDR_TIMING_DEFAULT;
+	}
+
+	priv->addr_timing = addr_timing;
+}
+
+static void __sanitize_rd_sampling_point(struct aspeed_peci *priv)
+{
+	u32 rd_sampling_point;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "rd-sampling-point", &rd_sampling_point);
+	if (ret) {
+		rd_sampling_point = ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT;
+	} else if (rd_sampling_point > ASPEED_PECI_RD_SAMPLING_POINT_MAX) {
+		dev_warn(priv->dev, "Invalid rd-sampling-point: %u, Use default : %u\n",
+			 rd_sampling_point, ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT);
+
+		rd_sampling_point = ASPEED_PECI_RD_SAMPLING_POINT_DEFAULT;
+	}
+
+	priv->rd_sampling_point = rd_sampling_point;
+}
+
+static void __sanitize_cmd_timeout(struct aspeed_peci *priv)
+{
+	u32 timeout;
+	int ret;
+
+	ret = device_property_read_u32(priv->dev, "cmd-timeout-ms", &timeout);
+	if (ret) {
+		timeout = ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	} else if (timeout > ASPEED_PECI_CMD_TIMEOUT_MS_MAX || timeout == 0) {
+		dev_warn(priv->dev, "Invalid cmd-timeout-ms: %u, Use default: %u\n",
+			 timeout, ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT);
+
+		timeout = ASPEED_PECI_CMD_TIMEOUT_MS_DEFAULT;
+	}
+
+	priv->cmd_timeout_ms = timeout;
+}
+
+static void aspeed_peci_device_property_sanitize(struct aspeed_peci *priv)
+{
+	__sanitize_clock_divider(priv);
+	__sanitize_msg_timing(priv);
+	__sanitize_addr_timing(priv);
+	__sanitize_rd_sampling_point(priv);
+	__sanitize_cmd_timeout(priv);
+}
+
+static void aspeed_peci_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static int aspeed_peci_init_ctrl(struct aspeed_peci *priv)
+{
+	int ret;
+
+	priv->clk = devm_clk_get(priv->dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->clk), "Failed to get clk source\n");
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(priv->dev, aspeed_peci_disable_clk, priv->clk);
+	if (ret)
+		return ret;
+
+	aspeed_peci_device_property_sanitize(priv);
+
+	aspeed_peci_init_regs(priv);
+
+	return 0;
+}
+
+static int aspeed_peci_probe(struct platform_device *pdev)
+{
+	struct aspeed_peci *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	dev_set_drvdata(priv->dev, priv);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->irq = platform_get_irq(pdev, 0);
+	if (!priv->irq)
+		return priv->irq;
+
+	ret = devm_request_irq(&pdev->dev, priv->irq, aspeed_peci_irq_handler,
+			       0, "peci-aspeed-irq", priv);
+	if (ret)
+		return ret;
+
+	init_completion(&priv->xfer_complete);
+	spin_lock_init(&priv->lock);
+
+	priv->controller.xfer = aspeed_peci_xfer;
+
+	priv->rst = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->rst)) {
+		dev_err(&pdev->dev, "Missing or invalid reset controller entry\n");
+		return PTR_ERR(priv->rst);
+	}
+	reset_control_deassert(priv->rst);
+
+	ret = aspeed_peci_init_ctrl(priv);
+	if (ret)
+		return ret;
+
+	return peci_controller_add(&priv->controller, priv->dev);
+}
+
+static int aspeed_peci_remove(struct platform_device *pdev)
+{
+	struct aspeed_peci *priv = dev_get_drvdata(&pdev->dev);
+
+	peci_controller_remove(&priv->controller);
+	reset_control_assert(priv->rst);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_peci_of_table[] = {
+	{ .compatible = "aspeed,ast2400-peci", },
+	{ .compatible = "aspeed,ast2500-peci", },
+	{ .compatible = "aspeed,ast2600-peci", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_peci_of_table);
+
+static struct platform_driver aspeed_peci_driver = {
+	.probe  = aspeed_peci_probe,
+	.remove = aspeed_peci_remove,
+	.driver = {
+		.name           = "peci-aspeed",
+		.of_match_table = aspeed_peci_of_table,
+	},
+};
+module_platform_driver(aspeed_peci_driver);
+
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("ASPEED PECI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PECI);
-- 
2.31.1

