Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03E93FD3CB
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 08:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzvDJ62Pzz2yHZ
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 16:24:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzvC352xWz2yHB;
 Wed,  1 Sep 2021 16:23:41 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18163GIR058025;
 Wed, 1 Sep 2021 14:03:16 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Sep 2021 14:22:17 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <osk@google.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/2] soc: aspeed: Add LPC UART routing support
Date: Wed, 1 Sep 2021 14:22:15 +0800
Message-ID: <20210901062216.32675-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
References: <20210901062216.32675-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18163GIR058025
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add driver support for the LPC UART routing control. Users can perform
runtime configuration of the RX muxes among the UART controllers and the
UART TXD/RXD IO pins. This is achieved through the exported sysfs interface.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/soc/aspeed/Kconfig                   |  11 +
 drivers/soc/aspeed/Makefile                  |   9 +-
 drivers/soc/aspeed/aspeed-lpc-uart-routing.c | 621 +++++++++++++++++++
 3 files changed, 637 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-lpc-uart-routing.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 243ca196e6ad..6866757e6be2 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -24,6 +24,17 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
+config ASPEED_LPC_UART_ROUTING
+	tristate "ASPEED LPC uart routing control"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Provides a driver to control the LPC UART routing paths.
+	  An sysfs interface is exported allowing users to perform
+	  runtime configuration of the RX muxes between the UART
+	  controllers and I/O pins.
+
 config ASPEED_P2A_CTRL
 	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fcab7192e1a4..87ad6578ddbb 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
-obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
-obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
-obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
+obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
+obj-$(CONFIG_ASPEED_LPC_UART_ROUTING)	+= aspeed-lpc-uart-routing.o
+obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
diff --git a/drivers/soc/aspeed/aspeed-lpc-uart-routing.c b/drivers/soc/aspeed/aspeed-lpc-uart-routing.c
new file mode 100644
index 000000000000..141d0d08b4ff
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-lpc-uart-routing.c
@@ -0,0 +1,621 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2018 Google LLC
+ * Copyright (c) 2021 Aspeed Technology Inc.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+
+/* register offsets */
+#define HICR9	0x98
+#define HICRA	0x9c
+
+/* attributes options */
+#define UART_ROUTING_IO1	"io1"
+#define UART_ROUTING_IO2	"io2"
+#define UART_ROUTING_IO3	"io3"
+#define UART_ROUTING_IO4	"io4"
+#define UART_ROUTING_IO5	"io5"
+#define UART_ROUTING_IO6	"io6"
+#define UART_ROUTING_IO10	"io10"
+#define UART_ROUTING_UART1	"uart1"
+#define UART_ROUTING_UART2	"uart2"
+#define UART_ROUTING_UART3	"uart3"
+#define UART_ROUTING_UART4	"uart4"
+#define UART_ROUTING_UART5	"uart5"
+#define UART_ROUTING_UART6	"uart6"
+#define UART_ROUTING_UART10	"uart10"
+#define UART_ROUTING_RES	"reserved"
+
+struct aspeed_uart_routing {
+	struct regmap *map;
+	spinlock_t lock;
+	struct attribute_group const *attr_grp;
+};
+
+struct aspeed_uart_routing_selector {
+	struct device_attribute	dev_attr;
+	uint32_t reg;
+	uint32_t mask;
+	uint32_t shift;
+	const char *const options[];
+};
+
+#define to_routing_selector(_dev_attr)					\
+	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf);
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count);
+
+#define ROUTING_ATTR(_name) {					\
+	.attr = {.name = _name,					\
+		 .mode = VERIFY_OCTAL_PERMISSIONS(0644) },	\
+	.show = aspeed_uart_routing_show,			\
+	.store = aspeed_uart_routing_store,			\
+}
+
+/* routing selector for AST25xx */
+static struct aspeed_uart_routing_selector ast2500_io6_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO6),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO5,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART5),
+	.reg = HICRA,
+	.shift = 28,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO5,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO6,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_uart1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io5_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO5),
+	.reg = HICRA,
+	.shift = 12,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2500_io1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART5,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO6,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2500_uart_routing_attrs[] = {
+	&ast2500_io6_sel.dev_attr.attr,
+	&ast2500_uart5_sel.dev_attr.attr,
+	&ast2500_uart4_sel.dev_attr.attr,
+	&ast2500_uart3_sel.dev_attr.attr,
+	&ast2500_uart2_sel.dev_attr.attr,
+	&ast2500_uart1_sel.dev_attr.attr,
+	&ast2500_io5_sel.dev_attr.attr,
+	&ast2500_io4_sel.dev_attr.attr,
+	&ast2500_io3_sel.dev_attr.attr,
+	&ast2500_io2_sel.dev_attr.attr,
+	&ast2500_io1_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2500_uart_routing_attr_group = {
+	.attrs = ast2500_uart_routing_attrs,
+};
+
+/* routing selector for AST26xx */
+static struct aspeed_uart_routing_selector ast2600_uart10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART10),
+	.reg = HICR9,
+	.shift = 12,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_IO10,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io10_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO10),
+	.reg = HICR9,
+	.shift = 8,
+	.mask = 0xf,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+			UART_ROUTING_RES,
+		    UART_ROUTING_UART10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
+	.reg = HICRA,
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO10,
+		    NULL,
+	},
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
+	.reg = HICRA,
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
+	.reg = HICRA,
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_uart1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
+	.reg = HICRA,
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io4_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
+	.reg = HICRA,
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io3_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
+	.reg = HICRA,
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_IO1,
+		    UART_ROUTING_IO2,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io2_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
+	.reg = HICRA,
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct aspeed_uart_routing_selector ast2600_io1_sel = {
+	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
+	.reg = HICRA,
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    UART_ROUTING_UART1,
+		    UART_ROUTING_UART2,
+		    UART_ROUTING_UART3,
+		    UART_ROUTING_UART4,
+		    UART_ROUTING_UART10,
+		    UART_ROUTING_IO3,
+		    UART_ROUTING_IO4,
+		    UART_ROUTING_IO10,
+		    NULL,
+		    },
+};
+
+static struct attribute *ast2600_uart_routing_attrs[] = {
+	&ast2600_uart10_sel.dev_attr.attr,
+	&ast2600_io10_sel.dev_attr.attr,
+	&ast2600_uart4_sel.dev_attr.attr,
+	&ast2600_uart3_sel.dev_attr.attr,
+	&ast2600_uart2_sel.dev_attr.attr,
+	&ast2600_uart1_sel.dev_attr.attr,
+	&ast2600_io4_sel.dev_attr.attr,
+	&ast2600_io3_sel.dev_attr.attr,
+	&ast2600_io2_sel.dev_attr.attr,
+	&ast2600_io1_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group ast2600_uart_routing_attr_group = {
+	.attrs = ast2600_uart_routing_attrs,
+};
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val, pos, len;
+
+	regmap_read(uart_routing->map, sel->reg, &val);
+	val = (val >> sel->shift) & sel->mask;
+
+	len = 0;
+	for (pos = 0; sel->options[pos] != NULL; ++pos) {
+		if (pos == val) {
+			len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+					"[%s] ", sel->options[pos]);
+		} else {
+			len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+					"%s ", sel->options[pos]);
+		}
+	}
+
+	if (val >= pos) {
+		len += snprintf(buf + len, PAGE_SIZE - 1 - len,
+				"[unknown(%d)]", val);
+	}
+
+	len += snprintf(buf + len, PAGE_SIZE - 1 - len, "\n");
+
+	return len;
+}
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
+	unsigned long flags;
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val;
+
+	val = match_string(sel->options, -1, buf);
+	if (val < 0) {
+		dev_err(dev, "invalid value \"%s\"\n", buf);
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&uart_routing->lock, flags);
+
+	regmap_update_bits(uart_routing->map, sel->reg,
+			(sel->mask << sel->shift),
+			(val & sel->mask) << sel->shift);
+
+	spin_unlock_irqrestore(&uart_routing->lock, flags);
+
+	return count;
+}
+
+static int aspeed_uart_routing_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct device *dev = &pdev->dev;
+	struct aspeed_uart_routing *uart_routing;
+
+	uart_routing = devm_kzalloc(&pdev->dev,
+				    sizeof(*uart_routing),
+				    GFP_KERNEL);
+	if (!uart_routing) {
+		dev_err(dev, "cannot allocate memory\n");
+		return -ENOMEM;
+	}
+
+	uart_routing->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(uart_routing->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return PTR_ERR(uart_routing->map);
+	}
+
+	uart_routing->attr_grp = of_device_get_match_data(dev);
+
+	spin_lock_init(&uart_routing->lock);
+
+	rc = sysfs_create_group(&dev->kobj,
+				uart_routing->attr_grp);
+	if (rc < 0)
+		return rc;
+
+	dev_set_drvdata(dev, uart_routing);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_uart_routing_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_uart_routing *uart_routing = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&dev->kobj,
+			   uart_routing->attr_grp);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2500-lpc-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2600-lpc-uart-routing",
+	  .data = &ast2600_uart_routing_attr_group },
+	{ },
+};
+
+static struct platform_driver aspeed_uart_routing_driver = {
+	.driver = {
+		.name = "aspeed-lpc-uart-routing",
+		.of_match_table = aspeed_uart_routing_table,
+	},
+	.probe = aspeed_uart_routing_probe,
+	.remove = aspeed_uart_routing_remove,
+};
+
+module_platform_driver(aspeed_uart_routing_driver);
+
+MODULE_AUTHOR("Oskar Senft <osk@google.com>");
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
-- 
2.17.1

