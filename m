Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A74B93EA29
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2024 01:52:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CphbBo4/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXJDx4StQz3cVW
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2024 09:52:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CphbBo4/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=wenliang202407@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 943 seconds by postgrey-1.37 at boromir; Fri, 26 Jul 2024 18:17:47 AEST
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVgbv1z7Cz3cZR
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2024 18:17:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=rHiyGD28ldm8iKF6bE
	S6nRUq4iOdwmoOb5aRtPbpBVk=; b=CphbBo4/iWmC/jBomCyII+VcBvmFYhe9LZ
	bKYeLOTIvFV7XdwdL01ViIke+TgsBF1FqZ2IhcfzwhMuBtF46d3FOzBeru1vJDkJ
	G0g0M8mJ5wRU8p2KvTSyOV7KXfyzoHmJOv/foGykx9kzwXamqXneBHsGxonjehcB
	THNv/RnjM=
Received: from 100ask.localdomain (unknown [36.18.43.186])
	by gzga-smtp-mta-g2-5 (Coremail) with SMTP id _____wDnjyTjV6NmeWAECA--.16615S3;
	Fri, 26 Jul 2024 16:01:46 +0800 (CST)
From: Wenliang <wenliang202407@163.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7 1/1] First commit driver
Date: Fri, 26 Jul 2024 04:01:37 -0400
Message-Id: <20240726080137.49537-2-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726080137.49537-1-wenliang202407@163.com>
References: <20240726080137.49537-1-wenliang202407@163.com>
X-CM-TRANSID: _____wDnjyTjV6NmeWAECA--.16615S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3KrWkZFyDAw17Gry5uryrtFb_yoW8XFy5Go
	WfXFs3Ww18JwnrCFW09wnrK3y7XFWUCrW8Zr1Svr4DC3ZrGr1Y934fKayrXry3Za1FqrWf
	Aw4xt34fJayrt3Wxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RdsqZUUUUU
X-Originating-IP: [36.18.43.186]
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiowso02VOEnZnagAAsR
X-Mailman-Approved-At: Mon, 29 Jul 2024 09:51:26 +1000
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
Cc: Wenliang <wenliang202407@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

---
 Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c | 563 +++++++++++++++++++
 1 file changed, 563 insertions(+)
 create mode 100644 Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c

diff --git a/Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c b/Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c
new file mode 100644
index 0000000..2847783
--- /dev/null
+++ b/Desktop/Linux-4.9.88/drivers/hwmon/SQ52205.c
@@ -0,0 +1,563 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for SQ52205 power monitor chip
+ *
+ * Copyright (C) 2024 Wenliang Yan <wenliang202407@163.com>
+ */
+
+#include "linux/device.h"
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/slab.h>
+#include <linux/i2c.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/delay.h>
+#include <linux/util_macros.h>
+#include <linux/regmap.h>
+
+// #include <linux/platform_data/sq522xx.h>
+
+/* common register definitions */
+#define SQ522XX_CONFIG			0x00
+#define SQ522XX_SHUNT_VOLTAGE		0x01 /* readonly */
+#define SQ522XX_BUS_VOLTAGE		0x02 /* readonly */
+#define SQ522XX_POWER			0x03 /* readonly */
+#define SQ522XX_CURRENT			0x04 /* readonly */
+#define SQ522XX_CALIBRATION		0x05
+
+
+/* SQ52205 register definitions */
+#define SQ52205_MASK_ENABLE		0x06
+#define SQ52205_ALERT_LIMIT		0x07
+#define SQ52205_EIN				0x0A
+#define SQ52205_ACCUM_CONFIG	0x0D
+
+
+/* register count */
+
+#define SQ52205_REGISTERS		0x0D
+
+#define SQ522XX_MAX_REGISTERS	0x0D
+
+/* settings - depend on use case */
+#define SQ52205_CONFIG_DEFAULT		0x4527	/* averages=16 */
+#define SQ52205_ACCUM_CONFIG_DEFAULT	0x044C
+
+/* worst case is 68.10 ms (~14.6Hz) */
+#define SQ522XX_CONVERSION_RATE		15
+#define SQ522XX_MAX_DELAY		69 /* worst case delay in ms */
+
+#define SQ522XX_RSHUNT_DEFAULT		10000	//10mOhms
+#define SQ52205_BUS_VOLTAGE_LSB		1250  	//1.25mV
+
+/* bit mask for reading the averaging setting in the configuration register */
+#define SQ52205_AVG_RD_MASK		0x0E00
+
+#define SQ52205_READ_AVG(reg)		(((reg) & SQ52205_AVG_RD_MASK) >> 9)
+#define SQ52205_SHIFT_AVG(val)		((val) << 9)
+
+
+
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
+				    data->rshunt);
+	
+	return regmap_write(data->regmap, SQ522XX_CALIBRATION, val);
+}
+
+/*
+ * Initialize the configuration and calibration registers.
+ */
+static int sq522xx_init(struct sq522xx_data *data)
+{	
+	int ret = regmap_write(data->regmap, SQ522XX_CONFIG,
+			       data->config->config_default);
+	if (ret < 0)
+		return ret;
+	// configure ENABLE register
+	ret = regmap_write(data->regmap, SQ52205_ACCUM_CONFIG,
+			    SQ52205_ACCUM_CONFIG_DEFAULT);	
+	if (ret < 0)
+		return ret;	
+	/*
+	 * Set current LSB to 1mA, shunt is in uOhms
+	 * 
+	 */
+	return sq522xx_calibrate(data);
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
+				dev_warn(dev, "chip not calibrated\n");
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
+			    unsigned int regval)
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
+static ssize_t sq522xx_show_value(struct device *dev,
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
+	return snprintf(buf, PAGE_SIZE, "%d\n",
+			sq522xx_get_value(data, attr->index, regval));
+}
+
+/*
+ * In order to keep calibration register value fixed, the product
+ * of current_lsb and shunt_resistor should also be fixed and equal
+ * to shunt_voltage_lsb = 1 / shunt_div multiplied by 10^9 in order
+ * to keep the scale.
+ */
+static ssize_t sq522xx_set_shunt(struct device *dev,
+				struct device_attribute *da,
+				const char *buf, size_t count)
+{
+	unsigned long val;
+	int status;
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+
+	status = kstrtoul(buf, 10, &val);
+	if (status < 0)
+		return status;
+
+	if (val == 0 ||
+	    /* Values greater than the calibration factor make no sense. */
+	    val > data->config->calibration_factor)
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
+static ssize_t sq522xx_show_shunt(struct device *dev,
+			      struct device_attribute *da,
+			      char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%li\n", data->rshunt);
+}
+
+
+
+static ssize_t sq52205_set_interval(struct device *dev,
+				   struct device_attribute *da,
+				   const char *buf, size_t count)
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
+				    SQ52205_AVG_RD_MASK,
+				    sq52205_interval_to_reg(val));
+	if (status < 0)
+		return status;
+
+	return count;
+}
+
+static ssize_t sq52205_show_interval(struct device *dev,
+				    struct device_attribute *da, char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	int status;
+	unsigned int regval;
+
+	status = regmap_read(data->regmap, SQ522XX_CONFIG, &regval);
+	if (status)
+		return status;
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", sq52205_reg_to_interval(regval));
+}
+
+static int sq52205_read_reg48(const struct i2c_client *client, u8 reg, long *accumulator_24, long *sample_count)
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
+			  (data[4] << 8) | 
+			   data[5]);
+	*sample_count = ((data[0] << 16) | 
+			  (data[1] << 8) | 
+			   data[2]);
+	
+	return 0;
+}
+
+static int sq52205_show_avg_power(struct device *dev,
+				    struct device_attribute *da, char *buf)
+{
+	struct sq522xx_data *data = dev_get_drvdata(dev);
+	long sample_count, accumulator_24, regval;
+	int status;
+
+	status = sq52205_read_reg48(data->client, SQ52205_EIN, &accumulator_24, &sample_count);
+	if (status)
+		return status;
+	regval = DIV_ROUND_CLOSEST(accumulator_24, sample_count);
+	regval = regval * data->config->power_lsb;
+	
+
+	return snprintf(buf, PAGE_SIZE, "%li\n", regval);
+}
+
+/* shunt voltage */
+static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, sq522xx_show_value, NULL,
+			  SQ522XX_SHUNT_VOLTAGE);
+
+/* bus voltage */
+static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, sq522xx_show_value, NULL,
+			  SQ522XX_BUS_VOLTAGE);
+
+/* calculated current */
+static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, sq522xx_show_value, NULL,
+			  SQ522XX_CURRENT);
+
+/* calculated power */
+static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, sq522xx_show_value, NULL,
+			  SQ522XX_POWER);
+
+/* shunt resistance */
+static SENSOR_DEVICE_ATTR(shunt_resistor, S_IRUGO | S_IWUSR,
+			  sq522xx_show_shunt, sq522xx_set_shunt,
+			  SQ522XX_CALIBRATION);
+
+/* update interval (sq52205 only) */
+static SENSOR_DEVICE_ATTR(update_interval, S_IRUGO | S_IWUSR,
+			  sq52205_show_interval, sq52205_set_interval, 0);
+
+/* update interval (sq52205 only) */
+static SENSOR_DEVICE_ATTR(calculate_avg_power, S_IRUGO,
+			  sq52205_show_avg_power, NULL, 0);
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
+static int sq522xx_probe(struct i2c_client *client,
+			const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct sq522xx_data *data;
+	struct device *hwmon_dev;
+	u32 val;
+	int ret, group = 0;
+	enum sq522xx_ids chip;
+
+	if (client->dev.of_node)
+		chip = (enum sq522xx_ids)of_device_get_match_data(&client->dev);
+	else
+		chip = id->driver_data;
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
+	if (of_property_read_u32(dev->of_node, "shunt-resistor", &val) < 0) {
+		val = SQ522XX_RSHUNT_DEFAULT;
+	}
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
+	ret = sq522xx_init(data);
+	if (ret < 0) {
+		dev_err(dev, "error configuring the device: %d\n", ret);
+		return -ENODEV;
+	}
+
+	data->groups[group++] = &sq522xx_group;
+	if (chip == sq52205)
+		data->groups[group++] = &sq52205_group;
+
+	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
+							   data, data->groups);
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
+static const struct of_device_id sq522xx_of_match[] = {
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

