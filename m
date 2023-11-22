Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C42067F3E36
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 07:35:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NLJPnEbW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZs1h58vFz3ckQ
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 17:35:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NLJPnEbW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZs126rD9z3cCh
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 17:34:45 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cb4d366248so3196692b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 22:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634882; x=1701239682; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRJsK/wyEkgX8WzdbpvbVaZWN+Ud3wIJUdGw9y8eTWU=;
        b=NLJPnEbWl1mFNCimVEsMyU3plnkGt5pHNW6mvzB82VsAbpMhOG5GowqQQ9auKj0tpv
         yl6wRoJGrcPuyTyXE9Mu0veT/VzMnCt4TMmIhrrxPx5RbaXUTiWIKT7eygEg8H4pANLf
         gHMDoZTevF3ToEstw5V/F8srbTYxyAQv4N+v7x1Do29M2/GR4nE7TT0OPof9S6qSZRac
         WF7cPi8+w3uzpRAoEc8j2LSMHQA/2GDq3Ws1Bu9o9ZDJeGvUb/claFkeBXkGS5jqKM9W
         LGwjw4VEkEvoeBgQtIYDbfvRk2YzmWzmsF9+UMcKcSmeAdK38lGLI973C6WxeOYI8c7U
         5PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634882; x=1701239682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRJsK/wyEkgX8WzdbpvbVaZWN+Ud3wIJUdGw9y8eTWU=;
        b=rgHSbjIDlYo/BVjFoXkv+9jl919eaRDLVd6pZMG/VsOVrVifMvpCPrOBtaUIxGao2z
         nELKethZ0942J6YY+TquLgjPgvPwfE6q/aNWAHstcxZv+6dwz8qPsQppqj/k9uucgWxV
         kXDjF4uLcPuWgsUQGIIL67u4x4N90zII0V2t0UQTZY8GJ9wn7YQ1X88yusJoZ98f6hIs
         p2t7hIzrcPekqVe0CsK1sS9zwVWdQsUZnDOjSLNh1yUoY0Iyke514dYZ8gBdNUGrAI1N
         1K16SUgSR2azBOSqakYMiu9Mi5Sr3ED0LpikXqDlDLafnFkcEXaujTnROBxu+UGrntC9
         +q4w==
X-Gm-Message-State: AOJu0YzX4VQE3ZUdw8utAnKHwy6Jbp8/6j4ybQV2leqOuQ/D7Qgo7tyi
	h4Z7bL+ygPlIZRa/mjdzfkI5tN7p1KY=
X-Google-Smtp-Source: AGHT+IFwVjoINz+B2dtCZQDge45UFIiU54vXBvT+s4DSsK+ZMvAzjbGY2PK8CCsAPV8p88ahAAPJvw==
X-Received: by 2002:a05:6a20:3ca3:b0:172:6771:d766 with SMTP id b35-20020a056a203ca300b001726771d766mr1436096pzj.51.1700634882541;
        Tue, 21 Nov 2023 22:34:42 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id s11-20020a170902ea0b00b001cf76664db6sm962714plg.309.2023.11.21.22.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 22:34:42 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.5 2/2] hwmon: (pmbus) Add support for MPS Multi-phase mp5990
Date: Wed, 22 Nov 2023 14:32:28 +0800
Message-Id: <20231122063228.4037027-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231122063228.4037027-1-potin.lai@quantatw.com>
References: <20231122063228.4037027-1-potin.lai@quantatw.com>
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Peter Yin <peteryin.openbmc@gmail.com>

Add support for mp5990 device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a Hot-Swap Controller.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp5990.rst |  84 ++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp5990.c   | 177 +++++++++++++++++++++++++++++++++
 5 files changed, 272 insertions(+)
 create mode 100644 Documentation/hwmon/mp5990.rst
 create mode 100644 drivers/hwmon/pmbus/mp5990.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 75b869ff6c53e..1247244b8b4c1 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -158,6 +158,7 @@ Hardware Monitoring Kernel Drivers
    mp2888
    mp2975
    mp5023
+   mp5990
    nct6683
    nct6775
    nct7802
diff --git a/Documentation/hwmon/mp5990.rst b/Documentation/hwmon/mp5990.rst
new file mode 100644
index 0000000000000..6f2f0c099d449
--- /dev/null
+++ b/Documentation/hwmon/mp5990.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5990
+====================
+
+Supported chips:
+
+  * MPS MP5990
+
+    Prefix: 'mp5990'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5990.html
+
+Author:
+
+	Peter Yin <peteryin.openbmc@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5990 Hot-Swap Controller.
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
index 2b43326b602b9..20391bdde16a9 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -335,6 +335,15 @@ config SENSORS_MP5023
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5023.
 
+config SENSORS_MP5990
+	tristate "MPS MP5990"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP5990.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5990.
+
 config SENSORS_MPQ7932_REGULATOR
 	bool "Regulator support for MPQ7932"
 	depends on SENSORS_MPQ7932 && REGULATOR
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 94e28f6d6a618..eea38c77ed1db 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
+obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
 obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c
new file mode 100644
index 0000000000000..2d721b6acfb87
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5990.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP5990 Hot-Swap Controller
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+#define MP5990_EFUSE_CFG	(0xC4)
+#define MP5990_VOUT_FORMAT	BIT(9)
+
+struct mp5990_data {
+	struct pmbus_driver_info info;
+	u8 vout_mode;
+	u8 vout_linear_exponent;
+};
+
+#define to_mp5990_data(x)  container_of(x, struct mp5990_data, info)
+
+static int mp5990_read_byte_data(struct i2c_client *client, int page, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp5990_data *data = to_mp5990_data(info);
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		if (data->vout_mode == linear) {
+			/*
+			 * The VOUT format is linear11, not linear16.
+			 * We should enforce the VOUT in linear mode and
+			 * return exponent value.
+			 */
+			return data->vout_linear_exponent;
+		}
+
+		/*
+		 * The datasheet does not support the VOUT command,
+		 * but the device responds with a default value of 0x17.
+		 * In the standard, 0x17 represents linear mode. However,
+		 * Therefore, we should enforce the VOUT in the direct format
+		 * when format use default direct mode.
+		 */
+		return PB_VOUT_MODE_DIRECT;
+
+	default:
+		return -ENODATA;
+	}
+}
+
+static int mp5990_read_word_data(struct i2c_client *client, int page,
+				 int phase, int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp5990_data *data = to_mp5990_data(info);
+	int ret;
+	s32 mantissa;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * Because the VOUT mode is linear11 and not linear16,
+		 * we disregard bits[15:11] and report based on the VOUT mode.
+		 */
+		if (data->vout_mode == linear) {
+			mantissa = ((s16)((ret & 0x7ff) << 5)) >> 5;
+			ret = mantissa;
+		}
+		break;
+	default:
+		return -ENODATA;
+	}
+
+	return ret;
+}
+
+static struct pmbus_driver_info mp5990_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
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
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.read_byte_data = mp5990_read_byte_data,
+	.read_word_data = mp5990_read_word_data,
+};
+
+static int mp5990_probe(struct i2c_client *client)
+{
+	struct pmbus_driver_info *info;
+	struct mp5990_data *data;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp5990_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp5990_info, sizeof(*info));
+	info = &data->info;
+
+	/* Read Vout Config */
+	ret = i2c_smbus_read_word_data(client, MP5990_EFUSE_CFG);
+	if (ret < 0) {
+		dev_err(&client->dev, "Can't get vout mode.");
+		return ret;
+	}
+
+	/*
+	 * EFUSE_CFG (0xC4) bit9=1 is linear mode, bit=0 is direct mode.
+	 */
+	if (ret & MP5990_VOUT_FORMAT) {
+		data->vout_mode = linear;
+		data->info.format[PSC_VOLTAGE_IN] = linear;
+		data->info.format[PSC_VOLTAGE_OUT] = linear;
+		data->info.format[PSC_CURRENT_OUT] = linear;
+		data->info.format[PSC_POWER] = linear;
+		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+		if (ret < 0) {
+			dev_err(&client->dev, "Can't get vout exponent.");
+			return ret;
+		}
+		data->vout_linear_exponent = (u8)((ret >> 11) & 0x1f);
+	} else {
+		data->vout_mode = direct;
+	}
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id mp5990_of_match[] = {
+	{ .compatible = "mps,mp5990" },
+	{}
+};
+
+static const struct i2c_device_id mp5990_id[] = {
+	{"mp5990", 0},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mp5990_id);
+
+static struct i2c_driver mp5990_driver = {
+	.driver = {
+		   .name = "mp5990",
+		   .of_match_table = mp5990_of_match,
+	},
+	.probe = mp5990_probe,
+	.id_table = mp5990_id,
+};
+module_i2c_driver(mp5990_driver);
+
+MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MP5990 HSC");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.31.1

