Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0B351C0E
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 20:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBBqk3wvNz2yRS
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 05:42:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hPTEjKBT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hPTEjKBT; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBBqS5zx6z2xZy
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 05:41:55 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id 15so3346661ljj.0
 for <openbmc@lists.ozlabs.org>; Thu, 01 Apr 2021 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TAIJj15PaJeu5CdH3bfpxSC3mQ/moAdCq204T6HqdrU=;
 b=hPTEjKBT0nhDF5TYgzBDIUu8sIjb+uWTl4DyeZk2Qp5lLgge8B/HVnqtq4q3sbQYpA
 9EmJLDaIb0pv9uol+ZNsKbJSXQ18xcqtCXJnDV4eOIgDZoj8WF1VqtmQh7J8VESqkFJD
 Cs2O6WlQMCPEg8fc+xDNjwKJvS1XuhRPBBrSHP9ueLQwmch/9ifGU3od5RZU2etcUPrc
 ApUiVrF36KIGUQg6wG7kTWS29z/EiiAC70CWL0NEda8P5I6UDjIefCEw5ZcyQEo1irFX
 SYIxGDL07thWofO+2Y2AqUW4Ji7MTF16u3S4xaRmYDFbTb8kaeBq0/vSVO5egfrOqQjH
 POrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAIJj15PaJeu5CdH3bfpxSC3mQ/moAdCq204T6HqdrU=;
 b=iQ4wCBjXoFS+4NLePYrt6J4fUUBxB0IK/J9iEvWdG9AG5yPTl5yZGK5+oqHZzelNUJ
 QkOwCGT9CIhNSf8ir6HHJVCxcgJEcBOi1pHXuhx9aA+SOqyjgkc1LaoH9uny++FlvCzs
 lxADKX/nwGYpwTJ3Hs7/VkbzUXTmty+2+TomYbhmrSXfyhdHJOI5+9Wty3IyV4r6UV3t
 dXhzAiZKrJaLCxdLG5H9mdqKLkezl/YuZMP2FzOiSWsLn+2PMtrHqYiWNB1JxaqQUAb1
 8SkWx0PvkWVmtKTTMJ74zTSL9a8MGdfQADuhQKHm6gK3LAOp+MkHNhUCdrHiTmqszJty
 eN6w==
X-Gm-Message-State: AOAM530TFWAtwwAlyaebvRM1oCTxdDFABDPTL8Iog37Cz2T+/5bNk8mJ
 1TSCx/J1F9kw0ouz+NfChbY=
X-Google-Smtp-Source: ABdhPJyLKrDPvPrR7SEIwXJRm7F4kUpFLYVFiVdHLBrqBPEjySsahioJUw/MVXp3ZssKVDAPp++sCw==
X-Received: by 2002:a05:651c:201d:: with SMTP id
 s29mr6067511ljo.315.1617302509886; 
 Thu, 01 Apr 2021 11:41:49 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-10-29.ip.moscow.rt.ru. [46.242.10.29])
 by smtp.gmail.com with ESMTPSA id 80sm621321lfd.14.2021.04.01.11.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:41:49 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: aladyshev22@gmail.com, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 2/3] hwmon: (sbtsi) Add basic support for SB-TSI
 sensors
Date: Thu,  1 Apr 2021 21:41:46 +0300
Message-Id: <20210401184147.2506-2-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401184147.2506-1-aladyshev22@gmail.com>
References: <20210401184147.2506-1-aladyshev22@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Kun Yi <kunyi@google.com>

SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
interface that reports AMD SoC's Ttcl (normalized temperature),
and resembles a typical 8-pin remote temperature sensor's I2C interface
to BMC.

This commit adds basic support using this interface to read CPU
temperature, and read/write high/low CPU temp thresholds.

To instantiate this driver on an AMD CPU with SB-TSI
support, the i2c bus number would be the bus connected from the board
management controller (BMC) to the CPU. The i2c address is specified in
Section 6.3.1 of the spec [1]: The SB-TSI address is normally 98h for
socket 0 and 90h for socket 1, but it could vary based on hardware address
select pins.

[1]: https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf

Test status: tested reading temp1_input, and reading/writing
temp1_max/min.

Signed-off-by: Kun Yi <kunyi@google.com>
Link: https://lore.kernel.org/r/20201211215427.3281681-2-kunyi@google.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/Kconfig      |  10 ++
 drivers/hwmon/Makefile     |   1 +
 drivers/hwmon/sbtsi_temp.c | 250 +++++++++++++++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/hwmon/sbtsi_temp.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9aa89d7d4193..c2c17af21bb7 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1487,6 +1487,16 @@ config SENSORS_RASPBERRYPI_HWMON
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
index ae41ee71a71b..3daaec15c134 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_S3C)	+= s3c-hwmon.o
+obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
 obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
 obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
 obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
new file mode 100644
index 000000000000..e35357c48b8e
--- /dev/null
+++ b/drivers/hwmon/sbtsi_temp.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * sbtsi_temp.c - hwmon driver for a SBI Temperature Sensor Interface (SB-TSI)
+ *                compliant AMD SoC temperature device.
+ *
+ * Copyright (c) 2020, Google Inc.
+ * Copyright (c) 2020, Kun Yi <kunyi@google.com>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
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
+
+#define SBTSI_CONFIG_READ_ORDER_SHIFT	5
+
+#define SBTSI_TEMP_MIN	0
+#define SBTSI_TEMP_MAX	255875
+
+/* Each client has this additional data */
+struct sbtsi_data {
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
+static inline int sbtsi_reg_to_mc(s32 integer, s32 decimal)
+{
+	return ((integer << 3) + (decimal >> 5)) * 125;
+}
+
+/*
+ * Inversely, given temperature in millidegree Celsius
+ *   INT = (TEMP / 125) / 8
+ *   DEC = ((TEMP / 125) % 8) * 32
+ * Caller have to make sure temp doesn't exceed 255875, the max valid value.
+ */
+static inline void sbtsi_mc_to_reg(s32 temp, u8 *integer, u8 *decimal)
+{
+	temp /= 125;
+	*integer = temp >> 3;
+	*decimal = (temp & 0x7) << 5;
+}
+
+static int sbtsi_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
+{
+	struct sbtsi_data *data = dev_get_drvdata(dev);
+	s32 temp_int, temp_dec;
+	int err;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		/*
+		 * ReadOrder bit specifies the reading order of integer and
+		 * decimal part of CPU temp for atomic reads. If bit == 0,
+		 * reading integer part triggers latching of the decimal part,
+		 * so integer part should be read first. If bit == 1, read
+		 * order should be reversed.
+		 */
+		err = i2c_smbus_read_byte_data(data->client, SBTSI_REG_CONFIG);
+		if (err < 0)
+			return err;
+
+		mutex_lock(&data->lock);
+		if (err & BIT(SBTSI_CONFIG_READ_ORDER_SHIFT)) {
+			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
+			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
+		} else {
+			temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_INT);
+			temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_DEC);
+		}
+		mutex_unlock(&data->lock);
+		break;
+	case hwmon_temp_max:
+		mutex_lock(&data->lock);
+		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_INT);
+		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_HIGH_DEC);
+		mutex_unlock(&data->lock);
+		break;
+	case hwmon_temp_min:
+		mutex_lock(&data->lock);
+		temp_int = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_INT);
+		temp_dec = i2c_smbus_read_byte_data(data->client, SBTSI_REG_TEMP_LOW_DEC);
+		mutex_unlock(&data->lock);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+
+	if (temp_int < 0)
+		return temp_int;
+	if (temp_dec < 0)
+		return temp_dec;
+
+	*val = sbtsi_reg_to_mc(temp_int, temp_dec);
+
+	return 0;
+}
+
+static int sbtsi_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	struct sbtsi_data *data = dev_get_drvdata(dev);
+	int reg_int, reg_dec, err;
+	u8 temp_int, temp_dec;
+
+	switch (attr) {
+	case hwmon_temp_max:
+		reg_int = SBTSI_REG_TEMP_HIGH_INT;
+		reg_dec = SBTSI_REG_TEMP_HIGH_DEC;
+		break;
+	case hwmon_temp_min:
+		reg_int = SBTSI_REG_TEMP_LOW_INT;
+		reg_dec = SBTSI_REG_TEMP_LOW_DEC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
+	sbtsi_mc_to_reg(val, &temp_int, &temp_dec);
+
+	mutex_lock(&data->lock);
+	err = i2c_smbus_write_byte_data(data->client, reg_int, temp_int);
+	if (err)
+		goto exit;
+
+	err = i2c_smbus_write_byte_data(data->client, reg_dec, temp_dec);
+exit:
+	mutex_unlock(&data->lock);
+	return err;
+}
+
+static umode_t sbtsi_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_min:
+			return 0644;
+		case hwmon_temp_max:
+			return 0644;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *sbtsi_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX),
+	NULL
+};
+
+static const struct hwmon_ops sbtsi_hwmon_ops = {
+	.is_visible = sbtsi_is_visible,
+	.read = sbtsi_read,
+	.write = sbtsi_write,
+};
+
+static const struct hwmon_chip_info sbtsi_chip_info = {
+	.ops = &sbtsi_hwmon_ops,
+	.info = sbtsi_info,
+};
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
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data, &sbtsi_chip_info,
+							 NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id sbtsi_id[] = {
+	{"sbtsi", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, sbtsi_id);
+
+static const struct of_device_id __maybe_unused sbtsi_of_match[] = {
+	{
+		.compatible = "amd,sbtsi",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sbtsi_of_match);
+
+static struct i2c_driver sbtsi_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "sbtsi",
+		.of_match_table = of_match_ptr(sbtsi_of_match),
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
2.25.1

