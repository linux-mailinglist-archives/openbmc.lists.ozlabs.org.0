Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76A408470
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 08:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7GCZ26KKz2yK4
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 16:04:42 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7G9n5RSvz2xrr;
 Mon, 13 Sep 2021 16:03:08 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18D5gg92094965;
 Mon, 13 Sep 2021 13:42:44 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Sep 2021 14:02:27 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v4 3/4] soc: aspeed: Add UART routing support
Date: Mon, 13 Sep 2021 14:02:30 +0800
Message-ID: <20210913060231.15619-4-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210913060231.15619-1-chiawei_wang@aspeedtech.com>
References: <20210913060231.15619-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18D5gg92094965
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
Cc: yulei.sh@bytedance.com, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add driver support for the UART routing control. Users can perform
runtime configuration of the RX muxes among the UART controllers and
the UART IO pins.

The sysfs interface is also exported for the convenience of routing paths
check and update.

Signed-off-by: Oskar Senft <osk@google.com>
Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Tested-by: Lei YU <yulei.sh@bytedance.com>
---
 .../testing/sysfs-driver-aspeed-uart-routing  |  15 +
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   9 +-
 drivers/soc/aspeed/aspeed-uart-routing.c      | 603 ++++++++++++++++++
 4 files changed, 633 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c

diff --git a/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
new file mode 100644
index 000000000000..65f899f1f055
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
@@ -0,0 +1,15 @@
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+Date:		September 2021
+Contact:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+Description:	Selects the RX source of the UARTx device. The current
+		selection will be marked with the '[]' brackets.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+Date:		September 2021
+Contact:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+Description:	Selects the RX source of IOx pins. The current selection
+		will be marked with the '[]' brackets.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 243ca196e6ad..f579ee0b5afa 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -24,6 +24,16 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
+config ASPEED_UART_ROUTING
+	tristate "ASPEED uart routing control"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Provides a driver to control the UART routing paths, allowing
+	  users to perform runtime configuration of the RX muxes among
+	  the UART controllers and I/O pins.
+
 config ASPEED_P2A_CTRL
 	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fcab7192e1a4..b35d74592964 100644
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
+obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
+obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
new file mode 100644
index 000000000000..ef8b24fd1851
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -0,0 +1,603 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2018 Google LLC
+ * Copyright (c) 2021 Aspeed Technology Inc.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
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
+	struct attribute_group const *attr_grp;
+};
+
+struct aspeed_uart_routing_selector {
+	struct device_attribute	dev_attr;
+	uint8_t reg;
+	uint8_t mask;
+	uint8_t shift;
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
+		if (pos == val)
+			len += sysfs_emit_at(buf, len, "[%s] ", sel->options[pos]);
+		else
+			len += sysfs_emit_at(buf, len, "%s ", sel->options[pos]);
+	}
+
+	if (val >= pos)
+		len += sysfs_emit_at(buf, len, "[unknown(%d)]", val);
+
+	len += sysfs_emit_at(buf, len, "\n");
+
+	return len;
+}
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count)
+{
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
+	regmap_update_bits(uart_routing->map, sel->reg,
+			(sel->mask << sel->shift),
+			(val & sel->mask) << sel->shift);
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
+	uart_routing = devm_kzalloc(&pdev->dev, sizeof(*uart_routing), GFP_KERNEL);
+	if (!uart_routing)
+		return -ENOMEM;
+
+	uart_routing->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(uart_routing->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return PTR_ERR(uart_routing->map);
+	}
+
+	uart_routing->attr_grp = of_device_get_match_data(dev);
+
+	rc = sysfs_create_group(&dev->kobj, uart_routing->attr_grp);
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
+	sysfs_remove_group(&dev->kobj, uart_routing->attr_grp);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2400-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2500-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2600-uart-routing",
+	  .data = &ast2600_uart_routing_attr_group },
+	{ },
+};
+
+static struct platform_driver aspeed_uart_routing_driver = {
+	.driver = {
+		.name = "aspeed-uart-routing",
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

