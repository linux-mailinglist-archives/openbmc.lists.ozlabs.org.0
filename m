Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E8C4692F7
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 10:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6zDS3JPGz2yg5
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 20:49:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GDMIPX2J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=howard10703049@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GDMIPX2J; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6zD43NNsz2xBf
 for <openbmc@lists.ozlabs.org>; Mon,  6 Dec 2021 20:49:22 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id i12so9651501pfd.6
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 01:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z2BjDEgb1geXX23eueBJ8huMJsVheVTO+vtnXDvOfJY=;
 b=GDMIPX2J0f7KJ0XmRRftnGD/papuMsDAE5wyIx9auFWaCCXz8DFwp3YEJb37pIr00q
 lfKgS1+j/lVeWMBx5FfUYznU+OJa/EiEbEoDaX0AbQuhSS1J8Jrv0nR99YG0zVGhgB+z
 e5G0FvLQWmHoq/370+Izj8VaDYPdbSupTSNvoto4YrzU6qTfBBeYDf7iPrjbkJ+0afcq
 FUkESU3HbGPjTkGdyjyeq8m/9fqpHglcCGeErIYGa0K6M78E+u07slHSgCokGpveQBqc
 U9VPGHJwMFIWGOTwryDGu2Mpgbjy7hOC6GNVQv4uzfcvOR7BlRASh9I7npdvnveZ0Hex
 Wg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z2BjDEgb1geXX23eueBJ8huMJsVheVTO+vtnXDvOfJY=;
 b=fOYnDgFKzNZBmEqlN+XCAOlx0T7TQahYHSxknA40TmhYi+uDGQJ1+FSDuOg//3P4lK
 yZteld9Ra7Gq9137nUZP+5f8YwHRdR5k8UB8f2JWBVR/BIL623JnquVul+oqqDsMfweN
 ZEfoDg8A44JTvaQpOnBuPKkvtkz5Zss4zWYojY40+jOkRc0xUeTmKF/Qe5gRH2VBcB5P
 B2sbN4he9pVoStQ3SUgRkV/jsFBxNTyA1m+R7ZiVJQ+f3bfIuDz1hU1xT38+gAXZuKqA
 fleTj0LmhDd4/gQz7OUbBUTu/ABRAWMf4HGLHOOMqOnKvYB+ShA/ZzjP4HyA/NXrMTTL
 yL/A==
X-Gm-Message-State: AOAM5309Bh/4u6EGpautQtnvYxCuhVObnDEHabk0iqfEjAgG+DpAwMZs
 b1CbwdHZOdGvZzhKdaSVuSQqMJY8hfc=
X-Google-Smtp-Source: ABdhPJwPc7gXL8IAZAGEU7mDr5jFxkJlmSGN7yCDBItGNkYSZx1q3dfmnm0Jxhd4cqhvz67nQtbAuQ==
X-Received: by 2002:a63:8849:: with SMTP id l70mr17992714pgd.257.1638784159349; 
 Mon, 06 Dec 2021 01:49:19 -0800 (PST)
Received: from howard-System-Product-Name.dhcpserver.bu9bmc.local
 (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
 by smtp.gmail.com with ESMTPSA id e6sm9203810pgr.24.2021.12.06.01.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 01:49:18 -0800 (PST)
From: Howard Chiu <howard10703049@gmail.com>
X-Google-Original-From: Howard Chiu <howard.chiu@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7] hwmon: (pmbus) Add support for MPS Multi-phase
 mp5023 controller (Pre-release)
Date: Mon,  6 Dec 2021 17:47:05 +0800
Message-Id: <20211206094705.282598-1-howard.chiu@quantatw.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Howard Chiu <howard.chiu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for mp5023 device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a Hot-Swap Controller

This patch is a pre-release version for OpenBMC because I did not documentate it well yet.

Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
Change-Id: Ice992a1681e3800eb2b16d1622ab78eed0b4113f
---
 drivers/hwmon/pmbus/Kconfig  |  9 +++++
 drivers/hwmon/pmbus/Makefile |  1 +
 drivers/hwmon/pmbus/mp5023.c | 66 ++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/mp5023.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..b56bd8542864 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -276,6 +276,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP5023
+	tristate "MPS MP5023"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP5023.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5023.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..61cdc24b1309 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
new file mode 100644
index 000000000000..2d2048c9765e
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP5023 Hot-Swap Controller
+ */
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5023_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 2,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mp5023_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mp5023_info);
+}
+
+static const struct of_device_id __maybe_unused mp5023_of_match[] = {
+	{ .compatible = "mps,mp5023", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mp5023_of_match);
+
+static struct i2c_driver mp5023_driver = {
+	.driver = {
+		   .name = "mp5023",
+		   .of_match_table = of_match_ptr(mp5023_of_match),
+	},
+	.probe_new = mp5023_probe,
+};
+
+module_i2c_driver(mp5023_driver);
+
+MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
+MODULE_LICENSE("GPL");
-- 
2.25.1

