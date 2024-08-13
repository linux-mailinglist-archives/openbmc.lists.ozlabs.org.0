Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2D94FA59
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 01:35:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jEyDA4Y/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjW9B27KFz2yNP
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 09:35:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jEyDA4Y/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=wenliang202407@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 932 seconds by postgrey-1.37 at boromir; Tue, 13 Aug 2024 01:58:52 AEST
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjK241Kdtz2xG6
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 01:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=BWj3O+9qLzn7QgB6+c
	iWiPiXlFllU4OL+eUWJfUiiTc=; b=jEyDA4Y/Gv7X4Oug20DNq4nOHqeS7bnRvF
	krWsoE79sAjiTIJhYVCXCh1Xf0XN2KTVMmjk3xTjw+wkZZpdSJdgUfw4Y7AeijcR
	wIlXP+8zcZQ1cfKizESVckmz4PdF34cyy7ay1QKAR366/T25SiQqwYf8iBJVL9lt
	qR5+Za0vM=
Received: from 100ask.localdomain (unknown [112.10.185.129])
	by gzga-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3_2N0LbpmjhJvAQ--.65241S2;
	Mon, 12 Aug 2024 23:42:44 +0800 (CST)
From: Wenliang <wenliang202407@163.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Subject: [PATCH linux dev 6.11 1/2] hwmon driver sq52205
Date: Mon, 12 Aug 2024 11:42:40 -0400
Message-Id: <20240812154240.3570-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3_2N0LbpmjhJvAQ--.65241S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cw4xAryfAry8Aw45Jry7Wrg_yoW8Ww1DGo
	WfWrs3Ww18XwnruFW09wnrK3y7XFWUCr4rX3WSvr4DCa17CF1Yvayftw4rJry3Za1FqrWr
	Aw4fK343Jayrtw1xn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4Rm_MaUUUUU
X-Originating-IP: [112.10.185.129]
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiGRA502XAkczrRQABs0
X-Mailman-Approved-At: Tue, 13 Aug 2024 09:34:28 +1000
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
Cc: Wenliang <wenliang202407@163.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I add a hwmon driver code sq52205.c, and synchronously modify the makefile
and Kconfig files.
Looking forward to your reply

Signed-off-by: Wenliang <wenliang202407@163.com>

---
 drivers/hwmon/Kconfig   |  13 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/sq52205.c | 558 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 572 insertions(+)
 create mode 100644 drivers/hwmon/sq52205.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index b60fe2e58ad6..7a6c21c9eee9 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2521,6 +2521,19 @@ config SENSORS_INTEL_M10_BMC_HWMON
 	  sensors monitor various telemetry data of different components on the
 	  card, e.g. board temperature, FPGA core temperature/voltage/current.
 
+config SENSORS_SQ52205
+	tristate "Silergy SQ52205 and compatibles"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for SQ52205 power monitor chips.
+
+	  The SQ52205 driver is configured for the default configuration of
+	  the part as described in the datasheet.
+	  Default value for Rshunt is 10 mOhms.
+	  This driver can also be built as a module. If so, the module
+	  will be called sq52205.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b1c7056c37db..270f88e3c6e6 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -207,6 +207,7 @@ obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
+obj-$(CONFIG_SENSORS_SQ52205)	+= sq52205.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
 obj-$(CONFIG_SENSORS_SURFACE_FAN)+= surface_fan.o
 obj-$(CONFIG_SENSORS_SY7636A)	+= sy7636a-hwmon.o
diff --git a/drivers/hwmon/sq52205.c b/drivers/hwmon/sq52205.c
new file mode 100644
index 000000000000..3d07fb70232b
--- /dev/null
+++ b/drivers/hwmon/sq52205.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for SQ52205 power monitor chip
+ *
+ * Copyright (C) 2024 Wenliang Yan <wenliang202407@163.com>
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/of.h>
+#include <linux/delay.h>
+#include <linux/util_macros.h>
+#include <linux/regmap.h>
+
+
+
+/* common register definitions */
+#define SQ522XX_CONFIG			0x00
+#define SQ522XX_SHUNT_VOLTAGE	0x01 /* readonly */
+#define SQ522XX_BUS_VOLTAGE		0x02 /* readonly */
+#define SQ522XX_POWER			0x03 /* readonly */
+#define SQ522XX_CURRENT			0x04 /* readonly */
+#define SQ522XX_CALIBRATION		0x05
+
+/* SQ52205 register definitions */
+#define SQ52205_MASK_ENABLE		0x06
+#define SQ52205_ALERT_LIMIT		0x07
+#define SQ52205_EIN				0x0A
+#define SQ52205_ACCUM_CONFIG	0x0D
+
+/* register count */
+#define SQ52205_REGISTERS		0x0D
+#define SQ522XX_MAX_REGISTERS	0x0D
+
+/* settings - default */
+#define SQ52205_CONFIG_DEFAULT		0x4527	/* averages=16 */
+#define SQ52205_ACCUM_CONFIG_DEFAULT	0x044C
+
+/* worst case is 68.10 ms (~14.6Hz) */
+#define SQ522XX_CONVERSION_RATE		15
+#define SQ522XX_MAX_DELAY		69 /* worst case delay in ms */
+
+#define SQ522XX_RSHUNT_DEFAULT		10000	//10mOhms
+#define SQ52205_BUS_VOLTAGE_LSB		1250	//1.25mV
+
+/* bit mask for reading the averaging setting in the configuration register */
+#define SQ52205_AVG_RD_MASK		0x0E00
+
+#define SQ52205_READ_AVG(reg)		(((reg) & SQ52205_AVG_RD_MASK) >> 9)
+#define SQ52205_SHIFT_AVG(val)		((val) << 9)
+
+/* common attrs, sq52205 attrs and NULL */
+#define SQ522XX_MAX_ATTRIBUTE_GROUPS	3
+
+/*
+ * Both bus voltage and shunt voltage conversion times for sq52205 are set
+ * to 0b0100 on POR, which translates to 2200 microseconds in total.
+ */
+#define SQ52205_TOTAL_CONV_TIME_DEFAULT	2200
+
+static struct regmap_config sq522xx_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+};
+
+enum sq522xx_ids { sq52205 };
+
+struct sq522xx_config {
+	u16 config_default;
+	int calibration_factor;
+	int registers;
+	int shunt_div;
+	int bus_voltage_shift;
+	int bus_voltage_lsb;	/* uV */
+	int power_lsb;			/* uW */
+};
+
+struct sq522xx_data {
+	const struct sq522xx_config *config;
+
+	long rshunt;
+
+	struct mutex config_lock;
+	struct i2c_client *client;
+	struct regmap *regmap;
+
+	const struct attribute_group *groups[SQ522XX_MAX_ATTRIBUTE_GROUPS];
+};
+
+static const struct sq522xx_config sq522xx_config[] = {
+	[sq52205] = {
+		.config_default = SQ52205_CONFIG_DEFAULT,
+		.calibration_factor = 5120000,
+		.registers = SQ52205_REGISTERS,
+		.shunt_div = 400,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = SQ52205_BUS_VOLTAGE_LSB,
+		.power_lsb = 25000,
+	},
+};
+
+/*
+ * Available averaging rates for sq52205. The indices correspond with
+ * the bit values expected by the chip (according to the sq52205 datasheet)
+ */
+static const int sq52205_avg_tab[] = { 1, 4, 16, 64, 128, 256, 512, 1024 };
+
+static int sq52205_reg_to_interval(u16 config)
+{
+	int avg = sq52205_avg_tab[SQ52205_READ_AVG(config)];
+
+	/*
+	 * Multiply the total conversion time by the number of averages.
+	 * Return the result in milliseconds.
+	 */
+	return DIV_ROUND_CLOSEST(avg * SQ52205_TOTAL_CONV_TIME_DEFAULT, 1000);
+}
+
+/*
+ * Return the new, shifted AVG field value of CONFIG register,
+ * to use with regmap_update_bits
+ */
+static u16 sq52205_interval_to_reg(int interval)
+{
+	int avg, avg_bits;
+
+	avg = DIV_ROUND_CLOSEST(interval * 1000,
+				SQ52205_TOTAL_CONV_TIME_DEFAULT);
+	avg_bits = find_closest(avg, sq52205_avg_tab,
+				ARRAY_SIZE(sq52205_avg_tab));
+
+	return SQ52205_SHIFT_AVG(avg_bits);
+}
+
+/*
+ * Calibration register is set to the best value, which eliminates
+ * truncation errors on calculating current register in hardware.
+ * According to datasheet the best values are 2048 for
+ * sq52205. They are hardcoded as calibration_value.
+ */
+static int sq522xx_calibrate(struct sq522xx_data *data)
+{
+	u16 val = DIV_ROUND_CLOSEST(data->config->calibration_factor,
+					data->rshunt);
+
+	return regmap_write(data->regmap, SQ522XX_CALIBRATION,
+				val);
+}
+
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int sq522xx_init(struct sq522xx_data *data)
+{
+	int ret = regmap_write(data->regmap, SQ522XX_CONFIG,
+				data->config->config_default);
+	if (ret < 0)
+		return ret;	
+
+	return sq522xx_calibrate(data);
+}
+static int sq52205_init(struct sq522xx_data *data)
+{
+	// configure ENABLE register
+	int ret = regmap_write(data->regmap, SQ52205_ACCUM_CONFIG,
+				SQ52205_ACCUM_CONFIG_DEFAULT);	
+	if (ret < 0)
+		return ret;	
+
+	return 0;
+}
+
+static int sq522xx_read_reg(struct device *dev, int reg, unsigned int *regval)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	int ret, retry;
+
+	dev_dbg(dev, "Starting register %d read\n", reg);
+
+	for (retry = 5; retry; retry--) {
+
+		ret = regmap_read(data->regmap, reg, regval);
+		if (ret < 0)
+			return ret;
+
+		dev_dbg(dev, "read %d, val = 0x%04x\n", reg, *regval);
+
+		/*
+		 * If the current value in the calibration register is 0, the
+		 * power and current registers will also remain at 0. In case
+		 * the chip has been reset let's check the calibration
+		 * register and reinitialize if needed.
+		 * We do that extra read of the calibration register if there
+		 * is some hint of a chip reset.
+		 */
+		if (*regval == 0) {
+			unsigned int cal;
+
+			ret = regmap_read(data->regmap, SQ522XX_CALIBRATION,
+					  &cal);
+			if (ret < 0)
+				return ret;
+
+			if (cal == 0) {
+				dev_warn(dev, "chip not calibrated, reinitializing\n");
+
+				ret = sq522xx_init(data);
+				if (ret < 0)
+					return ret;
+				/*
+				 * Let's make sure the power and current
+				 * registers have been updated before trying
+				 * again.
+				 */
+				msleep(SQ522XX_MAX_DELAY);
+				continue;
+			}
+		}
+		return 0;
+	}
+
+	/*
+	 * If we're here then although all write operations succeeded, the
+	 * chip still returns 0 in the calibration register. Nothing more we
+	 * can do here.
+	 */
+	dev_err(dev, "unable to reinitialize the chip\n");
+	return -ENODEV;
+}
+
+static int sq522xx_get_value(struct sq522xx_data *data, u8 reg,
+				unsigned int regval)
+{
+	int val;
+
+	switch (reg) {
+	case SQ522XX_SHUNT_VOLTAGE:
+		/* signed register , value is in mV*/
+		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
+		break;
+	case SQ522XX_BUS_VOLTAGE:
+		/* signed register , value is in mV*/
+		val = (regval >> data->config->bus_voltage_shift)
+		  * data->config->bus_voltage_lsb;
+		val = DIV_ROUND_CLOSEST(val, 1000);
+		break;
+	case SQ522XX_POWER:
+		/* value is in uV*/
+		val = regval * data->config->power_lsb;
+		break;
+	case SQ522XX_CURRENT:
+		/* signed register, LSB=1mA (selected), in mA */
+		val = (s16)regval;
+		break;
+	case SQ522XX_CALIBRATION:
+		val = DIV_ROUND_CLOSEST(data->config->calibration_factor,
+					regval);
+		break;
+	default:
+		/* programmer goofed */
+		WARN_ON_ONCE(1);
+		val = 0;
+		break;
+	}
+
+	return val;
+}
+
+static ssize_t sq522xx_value_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	unsigned int regval;
+
+	int err = sq522xx_read_reg(dev, attr->index, &regval);
+
+	if (err < 0)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", sq522xx_get_value(data, attr->index, regval));
+}
+
+
+/*
+ * In order to keep calibration register value fixed, the product
+ * of current_lsb and shunt_resistor should also be fixed and equal
+ * to shunt_voltage_lsb = 1 / shunt_div multiplied by 10^9 in order
+ * to keep the scale.
+ */
+static ssize_t sq522xx_shunt_store(struct device *dev,
+				  struct device_attribute *da,
+				  const char *buf, size_t count)
+{
+	unsigned long val;
+	int status;
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+
+	status = kstrtoul(buf, 10, &val);
+	if (status < 0)
+		return status;
+	/* Values greater than the calibration factor make no sense. */
+	if (val == 0 || val > data->config->calibration_factor)
+		return -EINVAL;
+
+	mutex_lock(&data->config_lock);
+	data->rshunt = val;
+	
+	status = sq522xx_calibrate(data);
+	mutex_unlock(&data->config_lock);
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+static ssize_t sq522xx_shunt_show(struct device *dev,
+				 struct device_attribute *da, char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%li\n", data->rshunt);
+}
+
+
+
+static ssize_t sq52205_interval_store(struct device *dev,
+					struct device_attribute *da,
+					const char *buf, size_t count)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int status;
+
+	status = kstrtoul(buf, 10, &val);
+	if (status < 0)
+		return status;
+
+	if (val > INT_MAX || val == 0)
+		return -EINVAL;
+
+	status = regmap_update_bits(data->regmap, SQ522XX_CONFIG,
+					SQ52205_AVG_RD_MASK,
+					sq52205_interval_to_reg(val));
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+static ssize_t sq52205_interval_show(struct device *dev,
+					struct device_attribute *da, char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	int status;
+	unsigned int regval;
+
+	status = regmap_read(data->regmap, SQ522XX_CONFIG, &regval);
+	if (status)
+		return status;
+
+	return sysfs_emit(buf, "%d\n", sq52205_reg_to_interval(regval));
+}
+
+static int sq52205_read_reg48(const struct i2c_client *client, u8 reg,
+					long *accumulator_24, long *sample_count)
+{
+	u8 data[6];
+	int err;
+	*accumulator_24 = 0;
+	*sample_count = 0;
+
+	/* 48-bit register read */
+	err = i2c_smbus_read_i2c_block_data(client, reg, 6, data);
+	if (err < 0)
+		return err;
+	if (err != 6)
+		return -EIO;
+	*accumulator_24 = ((data[3] << 16) |
+				(data[4] << 8) |
+				data[5]);
+	*sample_count = ((data[0] << 16) |
+				(data[1] << 8) |
+				data[2]);
+	
+	return 0;
+}
+
+static ssize_t sq52205_avg_power_show(struct device *dev,
+				    struct device_attribute *da, char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	long sample_count, accumulator_24, regval;
+	int status;
+
+	status = sq52205_read_reg48(data->client, SQ52205_EIN,
+						&accumulator_24, &sample_count);
+	if (status)
+		return status;
+	regval = DIV_ROUND_CLOSEST(accumulator_24, sample_count);
+	regval = regval * data->config->power_lsb;
+	
+
+	return sysfs_emit(buf, "%li\n", regval);
+}
+
+/* shunt voltage */
+static SENSOR_DEVICE_ATTR_RO(in0_input, sq522xx_value, SQ522XX_SHUNT_VOLTAGE);
+
+/* bus voltage */
+static SENSOR_DEVICE_ATTR_RO(in1_input, sq522xx_value, SQ522XX_BUS_VOLTAGE);
+
+/* calculated current */
+static SENSOR_DEVICE_ATTR_RO(curr1_input, sq522xx_value, SQ522XX_CURRENT);
+
+/* calculated power */
+static SENSOR_DEVICE_ATTR_RO(power1_input, sq522xx_value, SQ522XX_POWER);
+
+/* shunt resistance */
+static SENSOR_DEVICE_ATTR_RW(shunt_resistor, sq522xx_shunt, SQ522XX_CALIBRATION);
+
+/* update interval (sq52205 only) */
+static SENSOR_DEVICE_ATTR_RW(update_interval, sq52205_interval, 0);
+
+/* calculate_avg_power (sq52205 only) */
+static SENSOR_DEVICE_ATTR_RO(calculate_avg_power, sq52205_avg_power, 0);
+
+
+/* pointers to created device attributes */
+static struct attribute *sq522xx_attrs[] = {
+	&sensor_dev_attr_in0_input.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	&sensor_dev_attr_power1_input.dev_attr.attr,
+	&sensor_dev_attr_shunt_resistor.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group sq522xx_group = {
+	.attrs = sq522xx_attrs,
+};
+
+static struct attribute *sq52205_attrs[] = {
+	&sensor_dev_attr_update_interval.dev_attr.attr,
+	&sensor_dev_attr_calculate_avg_power.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group sq52205_group = {
+	.attrs = sq52205_attrs,
+};
+
+static const struct i2c_device_id sq522xx_id[];
+
+static int sq522xx_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct sq522xx_data *data;
+	struct device *hwmon_dev;
+	u32 val;
+	int ret, group = 0;
+	enum sq522xx_ids chip;
+
+	if (client->dev.of_node)
+		chip = (uintptr_t)of_device_get_match_data(&client->dev);
+	else
+		chip = i2c_match_id(sq522xx_id, client)->driver_data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	/* set the device type */
+	data->client = client;
+	data->config = &sq522xx_config[chip];
+	mutex_init(&data->config_lock);
+
+	if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0)
+		val = SQ522XX_RSHUNT_DEFAULT;
+	
+
+	if (val <= 0 || val > data->config->calibration_factor)
+		return -ENODEV;
+
+	data->rshunt = val;
+
+	sq522xx_regmap_config.max_register = data->config->registers;
+
+	data->regmap = devm_regmap_init_i2c(client, &sq522xx_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		dev_err(dev, "failed to allocate register map\n");
+		return PTR_ERR(data->regmap);
+	}
+
+
+	ret = sq522xx_init(data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return -ENODEV;
+	}
+	if (chip == sq52205) {
+		ret = sq52205_init(data);
+		if (ret < 0) {
+			dev_err(dev, "error configuring the device cal: %d\n", ret);
+			return -ENODEV;
+		}
+	}
+
+	data->groups[group++] = &sq522xx_group;
+	if (chip == sq52205)
+		data->groups[group++] = &sq52205_group;
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+								data, data->groups);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_info(dev, "power monitor %s (Rshunt = %li uOhm)\n",
+		 client->name, data->rshunt);
+
+	return 0;
+}
+
+static const struct i2c_device_id sq522xx_id[] = {
+	{ "sq52205", sq52205 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, sq522xx_id);
+
+static const struct of_device_id __maybe_unused sq522xx_of_match[] = {
+	{
+		.compatible = "silergy,sq52205",
+		.data = (void *)sq52205
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, sq522xx_of_match);
+
+static struct i2c_driver sq522xx_driver = {
+	.driver = {
+		.name	= "sq522xx",
+		.of_match_table = of_match_ptr(sq522xx_of_match),
+	},
+	.probe		= sq522xx_probe,
+	.id_table	= sq522xx_id,
+};
+
+module_i2c_driver(sq522xx_driver);
+
+MODULE_AUTHOR(" <wenliang202407@163.com> ");
+MODULE_DESCRIPTION("SQ522xx driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

