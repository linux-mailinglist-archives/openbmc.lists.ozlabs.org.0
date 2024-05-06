Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3418BCFB1
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 16:08:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jlns6Yrn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY3D004xWz30gp
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2024 00:08:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jlns6Yrn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY3CQ2436z30Vb
	for <openbmc@lists.ozlabs.org>; Tue,  7 May 2024 00:08:00 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36c82ca80adso8483495ab.3
        for <openbmc@lists.ozlabs.org>; Mon, 06 May 2024 07:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715004477; x=1715609277; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aAZJzXInwxGRxI5GCBjBMEAl1UZd5rP3agaaG22JzPc=;
        b=jlns6Yrn7pW4gwsxzcsZXBJF7JF50pe+wN6c9pHfUJCQuY6suRTxjrVnpube3tt4Mb
         G0dpNUGs66Z4/NjKzWjwtDgUxk3CF4gmSNt/AZnT83vL3YHs53tI5BmkLKK3N5MeEWqa
         BYtN6buVNKcd8TWNAW/zhvLROow69Jqyug01wT7pRNrpBzhzB7sxbtwdHaE/9jzC4UUI
         NNOgJKQIKe/zsQNmjjCuvMahfgWy9eAY/fvXzUHkFseezrZDAem5csDY6v9+qQvGKYtH
         VT29RWXrehMPFNnD7++J7X5/tFlAtbO02601DP0mu3OTTsGmfZZ4Jaf28d5E6Tytq9b/
         EL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715004477; x=1715609277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAZJzXInwxGRxI5GCBjBMEAl1UZd5rP3agaaG22JzPc=;
        b=lZ26lajsZSRvq+eomqIgZYQmMt+ItJbGYRVo5QJ/fOrZtU6rxQQqEsR3eZDPtHHLXM
         K0eEfxjQZ/9F7IwAoyysJFtqPI0HrGx+fUhPxDxBqomeusL4hhIpvfzEgYFdGpTXzS6U
         UTTUMB9NBng+iCUAOlGYJG5ffVpBF9cqeAdlcu62xXxXCzE1LT+1Fr8XNGL/wf8K+FYv
         fPopZbRQrB2gEzHgjLlp8TUKj411zV1lreBDaoYKD+cdJIzXj5rsDf5SkGHhnBpDiZbZ
         VtYTXlfdRS8Jif1XmxvSjEo7PCPsHdv87E7/fWYU1dpTzgnD+rHhG5Nv01w9B8lTUXJk
         eNyw==
X-Gm-Message-State: AOJu0YwV+4Ys6Jmjok6JQfqFaGGK52HrsefpoJruAb0qpBh0WF/7w5T2
	6u0JOfoJ8QLoqypwCoVCpbxYrYgGQAdlDGvtmp5BTNgRybEBusQfbWdTUg==
X-Google-Smtp-Source: AGHT+IHVZ1npxPIdnnFV76/qJ33t96jHxKMiz7nPArfG9TKPluuIqUhJvZWJWr1KJycU+D3Nr+IZLg==
X-Received: by 2002:a92:dad2:0:b0:36c:4cf6:7d6a with SMTP id o18-20020a92dad2000000b0036c4cf67d6amr10360342ilq.25.1715004476994;
        Mon, 06 May 2024 07:07:56 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a5-20020a63d405000000b0060c5179a0a5sm8052965pgh.50.2024.05.06.07.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 07:07:56 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux,dev-6.6 1/2] hwmon: (pmbus) Add support for Infineon XDP710
Date: Mon,  6 May 2024 22:06:45 +0800
Message-Id: <20240506140646.2506138-1-peteryin.openbmc@gmail.com>
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
Cc: peteryin.openbmc@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

LORE Link: https://lore.kernel.org/all/b72919f4-4b54-4452-bc3b-979aa8f8d7d3@roeck-us.net/
Add support for Infineon XDP710.This is a Hot-Swap Controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/xdp710.rst |  83 +++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |   9 +++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/xdp710.c   | 132 +++++++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)
 create mode 100644 Documentation/hwmon/xdp710.rst
 create mode 100644 drivers/hwmon/pmbus/xdp710.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 1ca7a4fe1f8f..b2546925fb15 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -250,6 +250,7 @@ Hardware Monitoring Kernel Drivers
    wm831x
    wm8350
    xgene-hwmon
+   xdp710
    xdpe12284
    xdpe152c4
    zl6100
diff --git a/Documentation/hwmon/xdp710.rst b/Documentation/hwmon/xdp710.rst
new file mode 100644
index 000000000000..083891f27818
--- /dev/null
+++ b/Documentation/hwmon/xdp710.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver xdp710
+====================
+
+Supported chips:
+
+  * Infineon XDP710
+
+    Prefix: 'xdp710'
+
+  * Datasheet
+
+    Publicly available at the Infineon website : https://www.infineon.com/dgdl/Infineon-XDP710-001-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c8412f8d301848a5316290b97
+
+Author:
+
+	Peter Yin <peteryin.openbmc@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Infineon XDP710 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct and linear format for reading input voltage,
+output voltage, output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 557ae0c414b0..c775128c2ea7 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -511,6 +511,15 @@ config SENSORS_UCD9200
 	  This driver can also be built as a module. If so, the module will
 	  be called ucd9200.
 
+config SENSORS_XDP710
+	tristate "Infineon XDP710 family"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  XDP710.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called xdp710.
+
 config SENSORS_XDPE152
 	tristate "Infineon XDPE152 family"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f14ecf03ad77..4fe630793721 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
+obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
 obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
new file mode 100644
index 000000000000..a00f79cda5e5
--- /dev/null
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Infineon XDP710 Hot-Swap Controller
+ */
+
+#include <linux/bitops.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define XDP710_REG_CFG		0xD3
+#define XDP710_V_SNS_CFG	0xD4
+#define XDP710_CS_RNG		0xD5
+
+/*
+ * The table to map configuration register values
+ * to sense resistor values
+ */
+const int microOhmRsense[] = {
+	200, 250, 300, 330, 400, 470, 500, 600,
+	670, 700, 750, 800, 900, 1000, 1100, 1200,
+	1250, 1300, 1400, 1500, 1600, 1700, 1800, 1900,
+	2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700,
+	2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
+	3700, 3800, 3900, 4000, 4100, 4200, 4300, 4400,
+	4500, 4600, 4700, 4800, 4900, 5000, 5500, 6000,
+	6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000
+};
+
+static struct pmbus_driver_info xdp710_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 4653,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = -2,
+	.m[PSC_VOLTAGE_OUT] = 4653,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = -2,
+	.m[PSC_CURRENT_OUT] = 23165,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = -2,
+	.m[PSC_POWER] = 4211,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -2,
+	.m[PSC_TEMPERATURE] = 52,
+	.b[PSC_TEMPERATURE] = 14321,
+	.R[PSC_TEMPERATURE] = -1,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int xdp710_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	u8 cs_rng;
+	u8 vtlm_rng;
+	int rsense;
+	int ret;
+	int m = 0;
+
+	info = devm_kmemdup(&client->dev, &xdp710_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get CS_RNG");
+		return ret;
+	}
+	cs_rng = (ret >> 6) & GENMASK(1, 0);
+
+	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get V_SNS_CFG");
+		return ret;
+	}
+	vtlm_rng = ret & GENMASK(1, 0);
+
+	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get REG_CFG");
+		return ret;
+	}
+	ret &= GENMASK(5, 0);
+	rsense = microOhmRsense[ret];
+
+	info->m[PSC_VOLTAGE_IN] <<= vtlm_rng;
+	info->m[PSC_VOLTAGE_OUT] <<= vtlm_rng;
+
+	m = info->m[PSC_CURRENT_OUT];
+	info->m[PSC_CURRENT_OUT] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng,
+						     1000);
+
+	m = info->m[PSC_POWER];
+	info->m[PSC_POWER] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng, 1000);
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id xdp710_of_match[] = {
+	{ .compatible = "infineon,xdp710" },
+	{}
+};
+
+static const struct i2c_device_id xdp710_id[] = {
+	{"xdp710", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, xdp710_id);
+
+static struct i2c_driver xdp710_driver = {
+	.driver = {
+		   .name = "xdp710",
+		   .of_match_table = xdp710_of_match,
+	},
+	.probe = xdp710_probe,
+	.id_table = xdp710_id,
+};
+module_i2c_driver(xdp710_driver);
+
+MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for XDP710 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.25.1

