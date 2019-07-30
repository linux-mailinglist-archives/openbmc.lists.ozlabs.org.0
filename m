Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E979E52
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 03:51:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yKKh2N2dzDqS6
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 11:51:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::74a;
 helo=mail-qk1-x74a.google.com;
 envelope-from=3wqi_xqmkb40591x55x2v.t5356v4s3t2z9a9.5g2rs9.58x@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fdFR5q4K"; 
 dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yKJQ1k5bzDqQh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 11:50:22 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id k13so53647431qkj.4
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 18:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=dqaEtqOF/pQXTRb474isDZm3YTN0n5tJQwlbG5LYOOw=;
 b=fdFR5q4KVb9Sg6TumsbZs/WmVhKDuLKIxtdeIYJO/23BsJVP8fNhJQJW9ECBPHa8t/
 t06TcZ2F7m8TesgQBBiQ17oe7DAqDc04weVmBbaXN6LDS1/VdkxHeYTgSGa+7h4ZO4Ws
 dC6/SPeewOJpIVc4+aQLBqnk+jFPfPL9Sh362rgFXLGlX7widzLozPu3FRUETLIOAA6L
 xOpcGTtidfPNp8HRbm5VJ6ko1z5VKJQjrZJUuevLvBP0a7Tb5AvqjBZMP+xT7ZoGyxPJ
 j21lsxcqr/l3S7sLhHNOHZHC4MyX2520drlyYNUDmuxtURIJl5dXBG0nUDIVm+zdXFCH
 HePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=dqaEtqOF/pQXTRb474isDZm3YTN0n5tJQwlbG5LYOOw=;
 b=e0A4y0GhDQJNM1SS1aPXGN/PwvnTC0qG2FYqObQSyt6Xi2SO2HTBup/w23vnVLtl8t
 ZFfpzmgq5ieltvefdI4zdC47K2KYisASbRJk4zFeBp7ygncftFvJ+LhcspSx60QDR74P
 smp3c+/HCygmtUeZxb9X8cvDrwX4kSfgTtUxKpTJouDhbm3G05n28QdUEuC18LA7s7f2
 lCDDWyFy8sWSSz0xRnckS+5FUiCEjcrUjZnkXtNYl3R9b4LqYnYj3iugKn0V6DuxBwz/
 goCF1P/Fwp1aJhZMElaq4cXe8DK1ZrZXfu1fNhZC3xVHI5CCl85JGEs8ZqCSDCotTGpM
 fd7A==
X-Gm-Message-State: APjAAAVf2+UegGgZCzm0VA42e8yjLI4KF5svqsUhhYjwO3qfXa+ypXDh
 nM1UedCyrmn4PQjEZXgtK7d/rw0=
X-Google-Smtp-Source: APXvYqzfjAoAkRg7zFr0nNQh03Cch8lLpgqLNQ4pZpobYTOco1hYX1DDuQgnfkd3AFRDUjeL6vD1fMU=
X-Received: by 2002:a37:8d82:: with SMTP id p124mr76230799qkd.63.1564451418456; 
 Mon, 29 Jul 2019 18:50:18 -0700 (PDT)
Date: Mon, 29 Jul 2019 21:49:53 -0400
Message-Id: <20190730014955.34059-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH v2 1/3] misc: aspeed: Add Aspeed UART routing control driver.
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver adds sysfs files that allow the BMC userspace to configure
how UARTs and physical serial I/O ports are routed.

Tested: Checked correct behavior (both read & write) on TYAN S7106
board by manually changing routing settings and confirming that bits
flow as expected. Tested for UART1 and UART3 as this board doesn't have
the other UARTs wired up in a testable way.

Signed-off-by: Oskar Senft <osk@google.com>
---
Changes since v1:
 Moved from drivers/misc into drivers/soc.
 Added support for AST2400.

 .../stable/sysfs-driver-aspeed-uart-routing   |  14 +
 .../misc-devices/aspeed-uart-routing.txt      |  50 +++
 drivers/soc/aspeed/Kconfig                    |   7 +
 drivers/soc/aspeed/Makefile                   |   7 +-
 drivers/soc/aspeed/aspeed-uart-routing.c      | 385 ++++++++++++++++++
 5 files changed, 460 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
 create mode 100644 Documentation/misc-devices/aspeed-uart-routing.txt
 create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
new file mode 100644
index 000000000000..5068737d9c12
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-uart-routing
@@ -0,0 +1,14 @@
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/io*
+Date:		August 2018
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the input source for the specific physical
+		serial I/O port.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-uart-routing/*/uart*
+Date:		August 2018
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the input source for the specific UART.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/Documentation/misc-devices/aspeed-uart-routing.txt b/Documentation/misc-devices/aspeed-uart-routing.txt
new file mode 100644
index 000000000000..dcfdf90a6b6b
--- /dev/null
+++ b/Documentation/misc-devices/aspeed-uart-routing.txt
@@ -0,0 +1,50 @@
+Kernel driver aspeed-uart-routing
+=================================
+
+Supported chips:
+Aspeed AST24xx
+Aspeed AST25xx
+
+Author:
+Google LLC
+
+Description
+-----------
+
+The Aspeed AST24xx/AST25xx allow to dynamically route the inputs for the
+built-in UARTS and physical serial I/O ports.
+
+This allows, for example, to connect the output of UART to another UART.
+This can be used to enable host<->BMC communication via UARTs, e.g. to allow
+access to the host's serial console.
+
+This driver is for the BMC side. The sysfs files allow the BMC userspace
+which owns the system configuration policy, to configure how UARTs and
+physical serial I/O ports are routed.
+
+The driver provides the following files in sysfs:
+uart1		Configure the input signal to UART1.
+uart2		Configure the input signal to UART2.
+uart3		Configure the input signal to UART3.
+uart4		Configure the input signal to UART4.
+uart5		Configure the input signal to UART5.
+io1		Configure the input signal to physical serial port 1.
+io2		Configure the input signal to physical serial port 2.
+io3		Configure the input signal to physical serial port 3.
+io4		Configure the input signal to physical serial port 4.
+io5		Configure the input signal to physical serial port 5.
+
+When read, each file shows the list of available options with the currently
+selected option marked by square brackets "[]". The list of available options
+depends on the selected file.
+
+Example:
+$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+[io1] io2 io3 io4 uart2 uart3 uart4 io6
+
+In this case, UART1 gets its input signal from IO1 (physical serial port 1).
+
+$ echo -n "uart3" \
+  >/sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+$ cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
+io1 io2 io3 io4 uart2 [uart3] uart4 io6
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 323e177aa74d..ab11dd81c752 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -29,4 +29,11 @@ config ASPEED_P2A_CTRL
 	  ioctl()s, the driver also provides an interface for userspace mappings to
 	  a pre-defined region.
 
+config ASPEED_UART_ROUTING
+	depends on SOC_ASPEED && REGMAP && MFD_SYSCON
+	tristate "Aspeed ast2400/2500 UART routing control"
+	help
+	  Control Aspeed ast2400/ast2500 UART routing via sysfs. This enables UART
+	  and I/O components to be dynamically connected at runtime.
+
 endmenu
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b64be47f2b1f..2fb979dec443 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
-obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
-obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
+obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
+obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
new file mode 100644
index 000000000000..937191bfc740
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * UART Routing driver for Aspeed AST24xx/AST25xx
+ *
+ * Copyright (c) 2018 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+/* The Aspeed AST24xx/AST25xx allow to dynamically route the inputs for the
+ * built-in UARTS and physical serial I/O ports.
+ *
+ * This allows, for example, to connect the output of UART to another UART.
+ * This can be used to enable host<->BMC communication via UARTs, e.g. to allow
+ * access to the host's serial console.
+ *
+ * This driver is for the BMC side. The sysfs files allow the BMC userspace
+ * which owns the system configuration policy, to configure how UARTs and
+ * physical serial I/O ports are routed.
+ */
+
+#define ASPEED_HICRA_IO1	"io1"
+#define ASPEED_HICRA_IO2	"io2"
+#define ASPEED_HICRA_IO3	"io3"
+#define ASPEED_HICRA_IO4	"io4"
+#define ASPEED_HICRA_IO5	"io5"
+#define ASPEED_HICRA_IO6	"io6"
+#define ASPEED_HICRA_UART1	"uart1"
+#define ASPEED_HICRA_UART2	"uart2"
+#define ASPEED_HICRA_UART3	"uart3"
+#define ASPEED_HICRA_UART4	"uart4"
+#define ASPEED_HICRA_UART5	"uart5"
+
+struct aspeed_uart_routing {
+	struct device		*dev;
+	void __iomem		*regs;
+	spinlock_t		lock;
+};
+
+struct aspeed_uart_routing_selector {
+	struct device_attribute	dev_attr;
+	int			shift;
+	int			mask;
+	const char		* const options[];
+};
+
+#define to_routing_selector(_dev_attr)					\
+	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
+
+
+static ssize_t aspeed_uart_routing_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf);
+
+static ssize_t aspeed_uart_routing_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t count);
+
+#define ROUTING_ATTR(_name) {						\
+	.attr = {.name = _name,					\
+		 .mode = VERIFY_OCTAL_PERMISSIONS(0644) }, \
+	.show = aspeed_uart_routing_show,				\
+	.store = aspeed_uart_routing_store,				\
+}
+
+static struct aspeed_uart_routing_selector uart5_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART5),
+	.shift = 28,
+	.mask = 0xf,
+	.options = {
+		    ASPEED_HICRA_IO5,   // 0
+		    ASPEED_HICRA_IO1,   // 1
+		    ASPEED_HICRA_IO2,   // 2
+		    ASPEED_HICRA_IO3,   // 3
+		    ASPEED_HICRA_IO4,   // 4
+		    ASPEED_HICRA_UART1, // 5
+		    ASPEED_HICRA_UART2, // 6
+		    ASPEED_HICRA_UART3, // 7
+		    ASPEED_HICRA_UART4, // 8
+		    ASPEED_HICRA_IO6,   // 9
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart4_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART4),
+	.shift = 25,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO4,   // 0
+		    ASPEED_HICRA_IO1,   // 1
+		    ASPEED_HICRA_IO2,   // 2
+		    ASPEED_HICRA_IO3,   // 3
+		    ASPEED_HICRA_UART1, // 4
+		    ASPEED_HICRA_UART2, // 5
+		    ASPEED_HICRA_UART3, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+	},
+};
+
+static struct aspeed_uart_routing_selector uart3_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART3),
+	.shift = 22,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO3,   // 0
+		    ASPEED_HICRA_IO4,   // 1
+		    ASPEED_HICRA_IO1,   // 2
+		    ASPEED_HICRA_IO2,   // 3
+		    ASPEED_HICRA_UART4, // 4
+		    ASPEED_HICRA_UART1, // 5
+		    ASPEED_HICRA_UART2, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart2_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART2),
+	.shift = 19,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO2,   // 0
+		    ASPEED_HICRA_IO3,   // 1
+		    ASPEED_HICRA_IO4,   // 2
+		    ASPEED_HICRA_IO1,   // 3
+		    ASPEED_HICRA_UART3, // 4
+		    ASPEED_HICRA_UART4, // 5
+		    ASPEED_HICRA_UART1, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector uart1_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_UART1),
+	.shift = 16,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_IO1,   // 0
+		    ASPEED_HICRA_IO2,   // 1
+		    ASPEED_HICRA_IO3,   // 2
+		    ASPEED_HICRA_IO4,   // 3
+		    ASPEED_HICRA_UART2, // 4
+		    ASPEED_HICRA_UART3, // 5
+		    ASPEED_HICRA_UART4, // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io5_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO5),
+	.shift = 12,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART5, // 0
+		    ASPEED_HICRA_UART1, // 1
+		    ASPEED_HICRA_UART2, // 2
+		    ASPEED_HICRA_UART3, // 3
+		    ASPEED_HICRA_UART4, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO3,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io4_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO4),
+	.shift = 9,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART4, // 0
+		    ASPEED_HICRA_UART5, // 1
+		    ASPEED_HICRA_UART1, // 2
+		    ASPEED_HICRA_UART2, // 3
+		    ASPEED_HICRA_UART3, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO2,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io3_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO3),
+	.shift = 6,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART3, // 0
+		    ASPEED_HICRA_UART4, // 1
+		    ASPEED_HICRA_UART5, // 2
+		    ASPEED_HICRA_UART1, // 3
+		    ASPEED_HICRA_UART2, // 4
+		    ASPEED_HICRA_IO1,   // 5
+		    ASPEED_HICRA_IO2,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io2_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO2),
+	.shift = 3,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART2, // 0
+		    ASPEED_HICRA_UART3, // 1
+		    ASPEED_HICRA_UART4, // 2
+		    ASPEED_HICRA_UART5, // 3
+		    ASPEED_HICRA_UART1, // 4
+		    ASPEED_HICRA_IO3,   // 5
+		    ASPEED_HICRA_IO4,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+static struct aspeed_uart_routing_selector io1_sel = {
+	.dev_attr = ROUTING_ATTR(ASPEED_HICRA_IO1),
+	.shift = 0,
+	.mask = 0x7,
+	.options = {
+		    ASPEED_HICRA_UART1, // 0
+		    ASPEED_HICRA_UART2, // 1
+		    ASPEED_HICRA_UART3, // 2
+		    ASPEED_HICRA_UART4, // 3
+		    ASPEED_HICRA_UART5, // 4
+		    ASPEED_HICRA_IO3,   // 5
+		    ASPEED_HICRA_IO4,   // 6
+		    ASPEED_HICRA_IO6,   // 7
+		    NULL,               // NULL termination
+		    },
+};
+
+
+static struct attribute *aspeed_uart_routing_attrs[] = {
+	&uart1_sel.dev_attr.attr,
+	&uart2_sel.dev_attr.attr,
+	&uart3_sel.dev_attr.attr,
+	&uart4_sel.dev_attr.attr,
+	&uart5_sel.dev_attr.attr,
+	&io1_sel.dev_attr.attr,
+	&io2_sel.dev_attr.attr,
+	&io3_sel.dev_attr.attr,
+	&io4_sel.dev_attr.attr,
+	&io5_sel.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_uart_routing_attr_group = {
+	.attrs = aspeed_uart_routing_attrs,
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
+	val = (readl(uart_routing->regs) >> sel->shift) & sel->mask;
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
+	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
+	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
+	int val;
+	u32 reg;
+
+	val = match_string(sel->options, -1, buf);
+	if (val < 0) {
+		dev_err(dev, "invalid value \"%s\"\n", buf);
+		return -EINVAL;
+	}
+
+	spin_lock(&uart_routing->lock);
+	reg = readl(uart_routing->regs);
+	// Zero out existing value in specified bits.
+	reg &= ~(sel->mask << sel->shift);
+	// Set new value in specified bits.
+	reg |= (val & sel->mask) << sel->shift;
+	writel(reg, uart_routing->regs);
+	spin_unlock(&uart_routing->lock);
+
+	return count;
+}
+
+static int aspeed_uart_routing_probe(struct platform_device *pdev)
+{
+	struct aspeed_uart_routing *uart_routing;
+	struct resource *res;
+	int rc;
+
+	uart_routing = devm_kzalloc(&pdev->dev,
+				    sizeof(*uart_routing),
+				    GFP_KERNEL);
+	if (!uart_routing)
+		return -ENOMEM;
+
+	spin_lock_init(&uart_routing->lock);
+	uart_routing->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	uart_routing->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(uart_routing->regs))
+		return PTR_ERR(uart_routing->regs);
+
+	rc = sysfs_create_group(&uart_routing->dev->kobj,
+				&aspeed_uart_routing_attr_group);
+	if (rc < 0)
+		return rc;
+
+	platform_set_drvdata(pdev, uart_routing);
+
+	return 0;
+}
+
+static int aspeed_uart_routing_remove(struct platform_device *pdev)
+{
+	struct aspeed_uart_routing *uart_routing = platform_get_drvdata(pdev);
+
+	sysfs_remove_group(&uart_routing->dev->kobj,
+			   &aspeed_uart_routing_attr_group);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2400-uart-routing" },
+	{ .compatible = "aspeed,ast2500-uart-routing" },
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
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
-- 
2.22.0.709.g102302147b-goog

