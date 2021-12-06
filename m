Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D337F46AE33
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 00:02:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JqJ5gsDz2yPd
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 10:02:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GYAnhANv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=GYAnhANv; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Jpg12b4z2x9K
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 10:02:03 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2EE01615;
 Mon,  6 Dec 2021 15:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638831721;
 bh=PfnosDLpxYdQ6c3hQ5+vc9mO0JFtLFuIafEO3Iuo1vA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYAnhANvMcBNLZ1jHgRFZnLgPFJo94E0xmwSeKb8s69/Ld14tZYgZxn1s8ZoqEnGf
 7agbWAN4kDN4zjO7psm5TKDXe3/uw6w3wKtrfzJgy7ASybSS6P80ORZVMwPx1hNLAe
 sdqISN9EzNT2G0dy2BOi07zrLXbVTxdpuWKaXKWQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: add Delta AHE-50DC fan control module driver
Date: Mon,  6 Dec 2021 15:01:52 -0800
Message-Id: <20211206230153.16891-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206230153.16891-1-zev@bewilderbeest.net>
References: <20211206230153.16891-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This device is an integrated module of the Delta AHE-50DC Open19 power
shelf.  For lack of proper documentation, this driver has been developed
referencing an existing (GPL) driver that was included in a code release
from LinkedIn [1].  It provides four fan speeds, four temperatures, and
one voltage reading, as well as a handful of warning and fault
indicators.

[1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 MAINTAINERS                       |   6 +
 drivers/hwmon/Kconfig             |  11 ++
 drivers/hwmon/Makefile            |   1 +
 drivers/hwmon/delta-ahe50dc-fan.c | 265 ++++++++++++++++++++++++++++++
 4 files changed, 283 insertions(+)
 create mode 100644 drivers/hwmon/delta-ahe50dc-fan.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ac052200ecb..d3f54b6f9550 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5425,6 +5425,12 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/platform/sti/delta
 
+DELTA AHE-50DC FAN CONTROL MODULE DRIVER
+M:	Zev Weiss <zev@bewilderbeest.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/delta-ahe50dc-fan.c
+
 DELTA DPS920AB PSU DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 43e5245874ad..394a9e99fedc 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -505,6 +505,17 @@ config SENSORS_DELL_SMM
 	  When option I8K is also enabled this driver provides legacy /proc/i8k
 	  userspace interface for i8kutils package.
 
+config SENSORS_DELTA_AHE50DC_FAN
+	tristate "Delta AHE-50DC fan control module"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for the fan control
+	  module of the Delta AHE-50DC Open19 power shelf.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called delta-ahe50dc-fan.
+
 config SENSORS_DA9052_ADC
 	tristate "Dialog DA9052/DA9053 ADC"
 	depends on PMIC_DA9052
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 3a1551b3d570..ea73ddab5fd3 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_SENSORS_CORSAIR_PSU) += corsair-psu.o
 obj-$(CONFIG_SENSORS_DA9052_ADC)+= da9052-hwmon.o
 obj-$(CONFIG_SENSORS_DA9055)+= da9055-hwmon.o
 obj-$(CONFIG_SENSORS_DELL_SMM)	+= dell-smm-hwmon.o
+obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_DME1737)	+= dme1737.o
 obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
 obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
diff --git a/drivers/hwmon/delta-ahe50dc-fan.c b/drivers/hwmon/delta-ahe50dc-fan.c
new file mode 100644
index 000000000000..d76301d9128a
--- /dev/null
+++ b/drivers/hwmon/delta-ahe50dc-fan.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Delta AHE-50DC power shelf fan control module driver
+ *
+ * Copyright 2021 Zev Weiss <zev@bewilderbeest.net>
+ */
+
+#include <linux/module.h>
+#include <linux/hwmon.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+
+static const u8 AHE50DC_FAN_TEMP_REGS[] = { 0x8d, 0x8e, 0x8f, 0xd0 };
+static const u8 AHE50DC_FAN_SPEED_REGS[] = { 0x90, 0x91, 0x92, 0x93 };
+static const u8 AHE50DC_FAN_FAN_STATUS_REGS[] = { 0x81, 0x82 };
+#define AHE50DC_FAN_VIN_REG 0x88
+#define AHE50DC_FAN_CHIP_STATUS_REG 0x79
+
+static int ahe50dc_fan_get_temp(struct regmap *regmap, int channel, long *val)
+{
+	int ret;
+	unsigned int reg;
+
+	if (channel >= ARRAY_SIZE(AHE50DC_FAN_TEMP_REGS))
+		return -EINVAL;
+
+	ret = regmap_read(regmap, AHE50DC_FAN_TEMP_REGS[channel], &reg);
+	if (ret < 0)
+		return ret;
+
+	/* Temp regs report tenths of a degree C; convert to millidegrees */
+	*val = reg * 100;
+
+	return 0;
+}
+
+static int ahe50dc_fan_get_fan(struct regmap *regmap, int channel, long *val)
+{
+	int ret;
+	unsigned int reg;
+
+	if (channel >= ARRAY_SIZE(AHE50DC_FAN_SPEED_REGS))
+		return -EINVAL;
+
+	ret = regmap_read(regmap, AHE50DC_FAN_SPEED_REGS[channel], &reg);
+	if (ret < 0)
+		return ret;
+
+	*val = reg;
+
+	return 0;
+}
+
+static int ahe50dc_fan_get_fan_status(struct regmap *regmap, int channel, u32 attr, long *val)
+{
+	int ret;
+	unsigned int reg, bit;
+	int regidx = channel / 2;
+
+	if (regidx >= ARRAY_SIZE(AHE50DC_FAN_FAN_STATUS_REGS) ||
+	    (attr != hwmon_fan_fault && attr != hwmon_fan_alarm))
+		return -EINVAL;
+
+	ret = regmap_read(regmap, AHE50DC_FAN_FAN_STATUS_REGS[regidx], &reg);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Fan status register bits:
+	 *   bit 0: fan 1/3 fault
+	 *   bit 1: fan 1/3 warn
+	 *   bit 8: fan 2/4 fault
+	 *   bit 9: fan 2/4 warn
+	 */
+	bit = ((channel % 2) * 8) + (attr == hwmon_fan_alarm);
+	*val = !!(reg & BIT(bit));
+
+	return 0;
+}
+
+static int ahe50dc_fan_get_vin(struct regmap *regmap, int channel, long *val)
+{
+	int ret;
+	unsigned int reg;
+
+	if (channel)
+		return -EINVAL;
+
+	ret = regmap_read(regmap, AHE50DC_FAN_VIN_REG, &reg);
+	if (ret < 0)
+		return ret;
+
+	*val = reg;
+
+	return 0;
+}
+
+static int ahe50dc_fan_get_chip_status(struct regmap *regmap, enum hwmon_sensor_types type,
+				       int channel, u32 attr, long *val)
+{
+	int ret;
+	unsigned int reg, bit;
+
+	if (type == hwmon_temp && attr == hwmon_temp_alarm && channel == 4)
+		bit = 2;
+	else if (type == hwmon_fan && attr == hwmon_fan_alarm && channel == 4)
+		bit = 11;
+	else if (type == hwmon_in && attr == hwmon_in_alarm && channel == 1)
+		bit = 15;
+	else
+		return -EINVAL;
+
+	ret = regmap_read(regmap, AHE50DC_FAN_CHIP_STATUS_REG, &reg);
+	if (ret < 0)
+		return ret;
+
+	*val = !!(reg & BIT(bit));
+
+	return 0;
+}
+
+static int ahe50dc_fan_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+			    int channel, long *val)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return ahe50dc_fan_get_temp(regmap, channel, val);
+		case hwmon_temp_alarm:
+			return ahe50dc_fan_get_chip_status(regmap, type, channel, attr, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_fan:
+		switch (attr) {
+		case hwmon_fan_input:
+			return ahe50dc_fan_get_fan(regmap, channel, val);
+		case hwmon_fan_alarm:
+		case hwmon_fan_fault:
+			if (channel == 4)
+				return ahe50dc_fan_get_chip_status(regmap, type, channel,
+								   attr, val);
+			return ahe50dc_fan_get_fan_status(regmap, channel, attr, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return ahe50dc_fan_get_vin(regmap, channel, val);
+		case hwmon_in_alarm:
+			return ahe50dc_fan_get_chip_status(regmap, type, channel, attr, val);
+		default:
+			return -EOPNOTSUPP;
+		}
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int ahe50dc_fan_read_labels(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+				   int channel, const char **str)
+{
+	if (attr == hwmon_in_input && channel < 2) {
+		*str = channel ? "vout" : "vin";
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t ahe50dc_fan_is_visible(const void *data, enum hwmon_sensor_types type,
+				      u32 attr, int channel)
+{
+	return 0444;
+}
+
+static const struct hwmon_channel_info *ahe50dc_fan_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT,
+			   HWMON_T_ALARM),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ALARM,
+			   HWMON_F_INPUT | HWMON_F_FAULT | HWMON_F_ALARM,
+			   HWMON_F_ALARM),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_ALARM | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops ahe50dc_fan_ops = {
+	.is_visible = ahe50dc_fan_is_visible,
+	.read = ahe50dc_fan_read,
+	.read_string = ahe50dc_fan_read_labels,
+};
+
+static const struct hwmon_chip_info ahe50dc_fan_chip_info = {
+	.ops = &ahe50dc_fan_ops,
+	.info = ahe50dc_fan_info,
+};
+
+static const struct regmap_config ahe50dc_fan_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.val_format_endian = REGMAP_ENDIAN_LITTLE,
+};
+
+static int ahe50dc_fan_probe(struct i2c_client *client)
+{
+	struct regmap *regmap;
+	struct device *hwmon_dev;
+	struct device *dev = &client->dev;
+
+	regmap = devm_regmap_init_i2c(client, &ahe50dc_fan_regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(regmap);
+	}
+
+	i2c_set_clientdata(client, regmap);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, regmap,
+							 &ahe50dc_fan_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct i2c_device_id ahe50dc_fan_id[] = {
+	{ "ahe50dc_fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ahe50dc_fan_id);
+
+const struct of_device_id __maybe_unused ahe50dc_fan_of_match[] = {
+	{ .compatible = "delta,ahe50dc-fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ahe50dc_fan_of_match);
+
+static struct i2c_driver ahe50dc_fan_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "ahe50dc_fan",
+		.of_match_table = of_match_ptr(ahe50dc_fan_of_match),
+	},
+	.probe_new = ahe50dc_fan_probe,
+	.id_table = ahe50dc_fan_id,
+};
+module_i2c_driver(ahe50dc_fan_driver);
+
+MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
+MODULE_DESCRIPTION("Driver for Delta AHE-50DC power shelf fan control module");
+MODULE_LICENSE("GPL");
-- 
2.34.1

