Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7D18C34A
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 23:50:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k2Dp3llJzDrRF
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 09:50:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com;
 envelope-from=3t_zzxgukb24wgzkusaasxq.oayabqznyoxuefe.alxmne.ads@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=D58DQpMO; dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k2BS1bF7zDqwl
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 09:48:25 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 12so3240587pgv.1
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 15:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=daAIaHfAowUZnlB+gQ9F2twiXtJ/k675xDN/AXRDz80=;
 b=D58DQpMOZMX27/DqenqrRZ1qh32jVv7pnCGN5iLGUaqlyxQ9qK9nNbqv0+Ge/dLmeD
 mCc55BDqqhABHuyISMzStL9SjZQ+3hZ3b3x8L/3C4yAI/lI5V79C2S3AksdmETSpssYJ
 fHzZj4Eh7AClJ2wljNkgwrj5vmoNTpp9HA8LXjNyO1nFLpAx16Qsbu8glA2PxapDbXlw
 XbQNfnvqobP35g31yZXlmN2341RjcL8N5URmNU+5tmjbi3HBWPC5TvZFY8b/jmoT4O20
 pRTc/1kdy0TFK8LAQIu8uOGu6lzsuCJL5nQxRNp2WD206+gVnUHlSdYWedlWbU5wzany
 bqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=daAIaHfAowUZnlB+gQ9F2twiXtJ/k675xDN/AXRDz80=;
 b=VPHcPwvd53jgKcLSUjY0KL791juB4tO7QFIsxoHNHzIRKrPqZ+vujO9OyJ2w5wJb0n
 wZO74OQbPNElHve34z6Ps7AFUvKqq7eF0PmXraouPm4eQZegAid0/8uvJRwpagt5WU2y
 ik3dO1YtwNZ/JoNqWWL7hEiV+pj8TLr+YS5Q+oQY+aDadYnGM42JALw3+5GUIjy86Tjk
 gUEr/RPnuUz4ri2FBxB/3UDsT7CCa6qG18XwFxaO7mBwKfoagvccZ6SCVFyz1iFZPgP9
 7clnxWy7ACkjUOwhiNwzXpJaiKQ5ICABQkNsJAHcomM6P9lLdUz7XDdkoDuyMYqgmvwh
 BB1g==
X-Gm-Message-State: ANhLgQ0m0uOF5zM4UaOc/litn22CJrn6taoaHxVGXIKzZp0pFNO3WT1/
 gT6MVyDvAaObEbfrTXuQkMGstcZGhg==
X-Google-Smtp-Source: ADFU+vspVp28sr/nUmOHl3FPDBiezHbu9HG1rD9n3Yec9TbA0sVOCwPgFSSYn4aEmBo1cSwkiKG1fKDaZA==
X-Received: by 2002:a17:90a:358e:: with SMTP id
 r14mr113557pjb.182.1584658103594; 
 Thu, 19 Mar 2020 15:48:23 -0700 (PDT)
Date: Thu, 19 Mar 2020 15:48:10 -0700
In-Reply-To: <20200319224812.202013-1-kunyi@google.com>
Message-Id: <20200319224812.202013-2-kunyi@google.com>
Mime-Version: 1.0
References: <20200319224812.202013-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v1 1/3] hwmon: (sbtsi) Add basic support for
 SB-TSI sensors
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
interface that reports AMD SoC's Ttcl (normalized temperature),
and resembles a typical 8-pin remote temperature sensor's I2C interface
to BMC.

This commit adds basic support using this interface to read CPU
temperature, and read/write high/low CPU temp thresholds.

Test status: tested reading temp1_input, and reading/writing
temp1_max/min.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/sbtsi_temp.c | 218 +++++++++++++++++++++++++++++++++++++
 3 files changed, 229 insertions(+)
 create mode 100644 drivers/hwmon/sbtsi_temp.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 05a30832c6ba..9585dcd01d1b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1412,6 +1412,16 @@ config SENSORS_RASPBERRYPI_HWMON
 	  This driver can also be built as a module. If so, the module
 	  will be called raspberrypi-hwmon.
 
+config SENSORS_SBTSI
+	tristate "Emulated SB-TSI temperature sensor"
+	depends on I2C
+	help
+	  If you say yes here you get support for emulated temperature
+	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sbtsi_temp.
+
 config SENSORS_SHT15
 	tristate "Sensiron humidity and temperature sensors. SHT15 and compat."
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..cd109f003ce4 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
+obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
new file mode 100644
index 000000000000..f998d944a515
--- /dev/null
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
+ *                compliant AMD SoC temperature device.
+ *
+ * Copyright (c) 2020, Google Inc.
+ * Copyright (c) 2020, Kun Yi <kunyi@google.com>
+ */
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+
+/*
+ * SB-TSI registers only support SMBus byte data access. "_INT" registers are
+ * the integer part of a temperature value or limit, and "_DEC" registers are
+ * corresponding decimal parts.
+ */
+#define SBTSI_REG_TEMP_INT		0x01 /* RO */
+#define SBTSI_REG_STATUS		0x02 /* RO */
+#define SBTSI_REG_CONFIG		0x03 /* RO */
+#define SBTSI_REG_TEMP_HIGH_INT		0x07 /* RW */
+#define SBTSI_REG_TEMP_LOW_INT		0x08 /* RW */
+#define SBTSI_REG_TEMP_DEC		0x10 /* RW */
+#define SBTSI_REG_TEMP_HIGH_DEC		0x13 /* RW */
+#define SBTSI_REG_TEMP_LOW_DEC		0x14 /* RW */
+#define SBTSI_REG_REV			0xFF /* RO */
+
+#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
+
+#define SBTSI_TEMP_MIN	(0)
+#define SBTSI_TEMP_MAX	(255875)
+#define SBTSI_REV_MAX_VALID_ID	(4)
+
+struct sbtsi_data {
+	struct device *dev;
+	struct i2c_client *client;
+	struct mutex lock;
+};
+
+/*
+ * From SB-TSI spec: CPU temperature readings and limit registers encode the
+ * temperature in increments of 0.125 from 0 to 255.875. The "high byte"
+ * register encodes the base-2 of the integer portion, and the upper 3 bits of
+ * the "low byte" encode in base-2 the decimal portion.
+ *
+ * e.g. INT=0x19, DEC=0x20 represents 25.125 degrees Celsius
+ *
+ * Therefore temperature in millidegree Celsius =
+ *   (INT + DEC / 256) * 1000 = (INT * 8 + DEC / 32) * 125
+ */
+static inline int SBTSI_REGS_TO_TEMP(s32 integer, s32 decimal)
+{
+	return (((u32)integer << 3) + ((u32)decimal >> 5)) * 125;
+}
+
+/*
+ * Inversely, given temperature in millidegree Celsius
+ *   INT = (TEMP / 125) / 8
+ *   DEC = ((TEMP / 125) % 8) * 32
+ * Caller have to make sure temp doesn't exceed 255875, the max valid value.
+ */
+static inline void SBTSI_TEMP_TO_REGS(u32 temp, u8 *integer, u8 *decimal)
+{
+	temp /= 125;
+	*integer = temp >> 3;
+	*decimal = (temp & 0x7) << 5;
+}
+
+static ssize_t sbtsi_show_temp(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct sbtsi_data *data = dev_get_drvdata(dev);
+	struct i2c_client *client = data->client;
+	s32 err, temp_int, temp_dec;
+	u8 read_order;
+
+	/*
+	 * ReadOrder bit specifies the reading order of integer and decimal
+	 * part of CPU temp for atomic reads. If bit == 0, reading integer part
+	 * triggers latching of the decimal part, so integer part should be read
+	 * first. If bit == 1, read order should be reversed.
+	 */
+	err = i2c_smbus_read_byte_data(client, SBTSI_REG_CONFIG);
+	if (err < 0)
+		return err;
+
+	read_order = (u8)err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT);
+
+	if (read_order == 0) {
+		temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
+		temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
+	} else {
+		temp_dec = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_DEC);
+		temp_int = i2c_smbus_read_byte_data(client, SBTSI_REG_TEMP_INT);
+	}
+
+	if (temp_int < 0)
+		return temp_int;
+	if (temp_dec < 0)
+		return temp_dec;
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n",
+			 SBTSI_REGS_TO_TEMP(temp_int, temp_dec));
+}
+
+#define sbtsi_show_temp_limit(name, REG) \
+static ssize_t sbtsi_show_##name(struct device *dev, \
+				 struct device_attribute *attr, char *buf) \
+{ \
+	struct sbtsi_data *data = dev_get_drvdata(dev); \
+	struct i2c_client *client = data->client; \
+	s32 temp_int, temp_dec; \
+\
+	temp_int = i2c_smbus_read_byte_data(client, REG##_INT); \
+	temp_dec = i2c_smbus_read_byte_data(client, REG##_DEC); \
+\
+	if (temp_int < 0) \
+		return temp_int; \
+	if (temp_dec < 0) \
+		return temp_dec; \
+\
+	return scnprintf(buf, PAGE_SIZE, "%d\n", \
+			 SBTSI_REGS_TO_TEMP(temp_int, temp_dec)); \
+}
+
+sbtsi_show_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
+sbtsi_show_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
+
+#define sbtsi_set_temp_limit(name, REG) \
+static ssize_t sbtsi_set_##name(struct device *dev, \
+				struct device_attribute *attr, \
+				const char *buf, size_t count) \
+{ \
+	struct sbtsi_data *data = dev_get_drvdata(dev); \
+	struct i2c_client *client = data->client; \
+	long val; \
+	u8 temp_int, temp_dec; \
+	int err = kstrtol(buf, 10, &val); \
+	if (err) \
+		return err; \
+\
+	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX); \
+	mutex_lock(&data->lock); \
+	SBTSI_TEMP_TO_REGS(val, &temp_int, &temp_dec); \
+	i2c_smbus_write_byte_data(client, REG##_INT, temp_int); \
+	i2c_smbus_write_byte_data(client, REG##_DEC, temp_dec); \
+	mutex_unlock(&data->lock); \
+\
+	return count; \
+}
+
+sbtsi_set_temp_limit(temp1_min, SBTSI_REG_TEMP_LOW);
+sbtsi_set_temp_limit(temp1_max, SBTSI_REG_TEMP_HIGH);
+
+static SENSOR_DEVICE_ATTR(temp1_input, 0444, sbtsi_show_temp, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp1_min, 0644, sbtsi_show_temp1_min,
+			  sbtsi_set_temp1_min, 1);
+static SENSOR_DEVICE_ATTR(temp1_max, 0644, sbtsi_show_temp1_max,
+			  sbtsi_set_temp1_max, 2);
+
+static struct attribute *sbtsi_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_min.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(sbtsi);
+
+static int sbtsi_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct sbtsi_data *data;
+
+	data = devm_kzalloc(dev, sizeof(struct sbtsi_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+
+	hwmon_dev =
+		devm_hwmon_device_register_with_groups(dev, client->name, data,
+						       sbtsi_groups);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "sensor '%s'\n", client->name);
+
+	return 0;
+}
+
+static const struct i2c_device_id sbtsi_id[] = {
+	{"sbtsi", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbtsi_id);
+
+static struct i2c_driver sbtsi_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "sbtsi",
+	},
+	.probe = sbtsi_probe,
+	.id_table = sbtsi_id,
+};
+
+module_i2c_driver(sbtsi_driver);
+
+MODULE_AUTHOR("Kun Yi <kunyi@google.com>");
+MODULE_DESCRIPTION("Hwmon driver for AMD SB-TSI emulated sensor");
+MODULE_LICENSE("GPL");
-- 
2.25.1.696.g5e7596f4ac-goog

