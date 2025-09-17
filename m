Return-Path: <openbmc+bounces-649-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F8B7F012
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp01FR2z3cYr;
	Wed, 17 Sep 2025 16:01:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088904;
	cv=none; b=JZmkbAcQfnokPcNsHz2XkGYGJuBQxZ7g93Y8vzm8j36BpoqhS+05hYeewCfBLsqxbrYrqDpDKaCzoUWgKgBef/T830f5uPczjBMR+nQoQDbYty1AyoHXbxTZeuuqh0dR3gIdCWkd+e2jcaPO6DCKtp9+4ye99AUInl7nXGYA9WKOyFl5ZYZCml0EHb/6DM93M8xOzJyBSrG83TxlyTR5yiFOx80nolSu3D8DPZDXkkL1w84kNWtvzgPVSbaJIfhVUd1HN6dv1n4YJ7JhDm3/KZWdcAG5nhXmw68tT+xEcaH5MwDv/nFIcieerMui2ro0ondNUTW7oqKd+XTvjl20vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088904; c=relaxed/relaxed;
	bh=o0YsWp50r4o+LsOMQo6mSmaqLQVIH4OcCwB+09h4bgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vx2d8T70OAdK/JVcVYtX1pJIXr5ghYz4U/75A+Dm6+DzX622eZNGlUxK3YxG6cal6L9JDfEKaULRiyiS9s5ew5Nu912kuNJNFGb0PYyWZN1gmMlrRUgw4590L/aNBY7nqeezkNoUkoY7BMPxE8bfbNAVv1wgyE15a1/gRh6VfY+6BbU47v+Md67dkz8PbhXO0nWySYri8LGI74ZHaEmfl725mlIfSg3pU4uEex7jCz88w3fjoL5Xr7R17I1POClItvHyAF/iQ8VhtlCB0EOskQm7M3tNFPOZcoA/N799H/fKYguPOMMCBBU1u6qNZtKAwCN0130WJ67g2vOacPS5bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UE9Nfd8C; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UE9Nfd8C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSny2WfFz3cDN
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:42 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso5259166a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088900; x=1758693700; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0YsWp50r4o+LsOMQo6mSmaqLQVIH4OcCwB+09h4bgU=;
        b=UE9Nfd8CJ3q35qZGn9pj2e0UWHTqt9OELQV/qNLEaH3p0rVZNOU6t/vuqMS76RTydW
         SFvBlaHFxBQLIuqHvEc+hCtE8pFLb4H1WOufdbIuYS/DishAqER3rNiB8OkNFI4zOfoc
         MhW+mZlyFi8WquEj8mFHUWpOatgVmCkIkmsqBOCfqQcJ/vVvvkxdVyOeZs/QkRmbAKeH
         F6YrH71RewHpnu45f8VpVRT9JNUTL652Rms6DAjHcrH1OzkwGuP8l5/qmfqX/f7gcn+o
         lG/7LPMT9xWBJQIQQdqGWGm5ku0DpNbl1enpLZ+ohjsTf0RDYy4m8uXPv4/6WtbRkLkF
         OIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088900; x=1758693700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0YsWp50r4o+LsOMQo6mSmaqLQVIH4OcCwB+09h4bgU=;
        b=CcIZ7zhrWrutZJJmZnXq74ubyRloWOJOn4oELDRQ6vN+INDjg5zOKrZ1soHitYlGfl
         K85LZLHMHfCutWydyIrMDB8ry8LdIQjHzIaoai/xX68celZWjXDP3Wdlx1VSEZBBSoDH
         7Q8DWpgAYewj1okvcDVtMkRUVI0wgFKov4+vsHftJPLZVQVdhE4D4pAGxmO2FH5p18A9
         QUs3u+CbwyXHu1sr7khKWZJg7wHy+zzhV9BvtGPxNX7ueTLRbrSe5ALOzZkdqtEp1Nnt
         S4XQUGmxH0aNXy1svhPHCTY7YqY0LHVrhYVgVSh0U89DlirPTS+aumNBct7v+959xzfb
         WI9A==
X-Forwarded-Encrypted: i=1; AJvYcCV8141hTB1Zk4pGkh/7OVS7LvtDGxPgbsqlaz+sIw0dfCz8IkWfcILv4NymSDCW+KSQRxC/v1P0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSKqLarMkZG5cHgJSxHnjS+p0L0hGKtYAsgrsZaVHxsmfUPkDT
	brAEK3OmgCWkr4F+oLRqoDC3tOLT3bDDy+JTliIMlkpBestiSGQ1jo1yO9XxXQ==
X-Gm-Gg: ASbGncvWch5WZ+XW2nBTSmKYlCURdRtDqZFNk1MESI7skMJfsBuCtEUljqr7xxb7xk6
	JIQrRoB0oi+CrpAkh7cTELGaAb/irGYRoxGnhskzuLx8Z9CEaJka5EYFtpbp3OhsbGz6g7hYgaL
	zlEPGuXFIMEBYLcRdJrAI5evsRJXzoxY+gLuBheRkGTOsJiauwBlOGeb4SHsPdebQhWjPIzcFfH
	PnLkPigPNmChh6Ce1ZfMZny99yG/D2vimRaUVJzcFGZW99e2VrIQ+gR85SX4qPpDJlC8vYeTWyx
	fb8VH/1rLXnSy/tBFs7Ji0pgNy395gS98lzjC3KXct7zhUL2sAixbqCN/f55XQy+islJ0VHCjkT
	tv7zWVG9lzgVDJNqVF4+a9qWLYT763TxqOIVbDUA/cyT73T/BB3s/Ii1z/Z8sQPyaE76gYC56nC
	JofS2UNLFO1mH5uKMbT3ybipxPww==
X-Google-Smtp-Source: AGHT+IHgMU6Uildrff85ES82/d481l+q2AaLsa/9FtgCjUsz0qm2E+iocR+tsLU5ClF/u6BQ0e5IJg==
X-Received: by 2002:a17:902:ceca:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-268138ff08fmr13790385ad.45.1758088900288;
        Tue, 16 Sep 2025 23:01:40 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:39 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 2/9] hwmon: (ina238) Add support for SQ52206
Date: Wed, 17 Sep 2025 14:01:27 +0800
Message-ID: <20250917060134.2383005-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
References: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Wenliang Yan <wenliang202407@163.com>

Add support for SQ52206 to the Ina238 driver. Add registers,
increase compatibility, add compatibility programs for
multiple chips.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
Link: https://lore.kernel.org/r/20250506053741.4837-3-wenliang202407@163.com
[groeck: Fixed checkpatch issues (alignment, {} placing)]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 6daaf15a11731c32f1c34920b1d22903704375f9)
---
 Documentation/hwmon/ina238.rst |  15 +++++
 drivers/hwmon/ina238.c         | 116 ++++++++++++++++++++++++++++++---
 2 files changed, 122 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/ina238.rst b/Documentation/hwmon/ina238.rst
index d9f479984420..d1b93cf8627f 100644
--- a/Documentation/hwmon/ina238.rst
+++ b/Documentation/hwmon/ina238.rst
@@ -14,6 +14,12 @@ Supported chips:
     Datasheet:
 	https://www.ti.com/lit/gpn/ina238
 
+  * Silergy SQ52206
+
+    Prefix: 'SQ52206'
+
+    Addresses: I2C 0x40 - 0x4f
+
 Author: Nathan Rossi <nathan.rossi@digi.com>
 
 Description
@@ -54,3 +60,12 @@ temp1_input		Die temperature measurement (mC)
 temp1_max		Maximum die temperature threshold (mC)
 temp1_max_alarm		Maximum die temperature alarm
 ======================= =======================================================
+
+Additional sysfs entries for sq52206
+------------------------------------
+
+======================= =======================================================
+energy1_input		Energy measurement (mJ)
+
+power1_input_highest	Peak Power (uW)
+======================= =======================================================
diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index c8d6bd3041b3..48b61328eb35 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -21,11 +21,14 @@
 #define INA238_CONFIG			0x0
 #define INA238_ADC_CONFIG		0x1
 #define INA238_SHUNT_CALIBRATION	0x2
+#define SQ52206_SHUNT_TEMPCO		0x3
 #define INA238_SHUNT_VOLTAGE		0x4
 #define INA238_BUS_VOLTAGE		0x5
 #define INA238_DIE_TEMP			0x6
 #define INA238_CURRENT			0x7
 #define INA238_POWER			0x8
+#define SQ52206_ENERGY			0x9
+#define SQ52206_CHARGE			0xa
 #define INA238_DIAG_ALERT		0xb
 #define INA238_SHUNT_OVER_VOLTAGE	0xc
 #define INA238_SHUNT_UNDER_VOLTAGE	0xd
@@ -33,9 +36,12 @@
 #define INA238_BUS_UNDER_VOLTAGE	0xf
 #define INA238_TEMP_LIMIT		0x10
 #define INA238_POWER_LIMIT		0x11
+#define SQ52206_POWER_PEAK		0x20
 #define INA238_DEVICE_ID		0x3f /* not available on INA237 */
 
 #define INA238_CONFIG_ADCRANGE		BIT(4)
+#define SQ52206_CONFIG_ADCRANGE_HIGH	BIT(4)
+#define SQ52206_CONFIG_ADCRANGE_LOW		BIT(3)
 
 #define INA238_DIAG_ALERT_TMPOL		BIT(7)
 #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
@@ -44,12 +50,13 @@
 #define INA238_DIAG_ALERT_BUSUL		BIT(3)
 #define INA238_DIAG_ALERT_POL		BIT(2)
 
-#define INA238_REGISTERS		0x11
+#define INA238_REGISTERS		0x20
 
 #define INA238_RSHUNT_DEFAULT		10000 /* uOhm */
 
 /* Default configuration of device on reset. */
 #define INA238_CONFIG_DEFAULT		0
+#define SQ52206_CONFIG_DEFAULT		0x0005
 /* 16 sample averaging, 1052us conversion time, continuous mode */
 #define INA238_ADC_CONFIG_DEFAULT	0xfb6a
 /* Configure alerts to be based on averaged value (SLOWALERT) */
@@ -87,14 +94,19 @@
  *  shunt = 0x4000 / (819.2 * 10^6) / 0.001 = 20000 uOhms (with 1mA/lsb)
  *
  *  Current (mA) = register value * 20000 / rshunt / 4 * gain
- *  Power (W) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  Power (mW) = 0.2 * register value * 20000 / rshunt / 4 * gain
+ *  (Specific for SQ52206)
+ *  Power (mW) = 0.24 * register value * 20000 / rshunt / 4 * gain
+ *  Energy (mJ) = 16 * 0.24 * register value * 20000 / rshunt / 4 * gain
  */
 #define INA238_CALIBRATION_VALUE	16384
 #define INA238_FIXED_SHUNT		20000
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB		125 /* 125 mC/lsb */
+#define INA238_DIE_TEMP_LSB			1250000 /* 125.0000 mC/lsb */
+#define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
+#define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
 static const struct regmap_config ina238_regmap_config = {
 	.max_register = INA238_REGISTERS,
@@ -102,7 +114,7 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
-enum ina238_ids { ina238, ina237 };
+enum ina238_ids { ina238, ina237, sq52206 };
 
 struct ina238_config {
 	bool has_power_highest;		/* chip detection power peak */
@@ -142,6 +154,15 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
 		.temp_lsb = INA238_DIE_TEMP_LSB,
 	},
+	[sq52206] = {
+		.has_energy = true,
+		.has_power_highest = true,
+		.temp_shift = 0,
+		.power_calculate_factor = 24,
+		.config_default = SQ52206_CONFIG_DEFAULT,
+		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
+		.temp_lsb = SQ52206_DIE_TEMP_LSB,
+	},
 };
 
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
@@ -160,6 +181,24 @@ static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
 	return 0;
 }
 
+static int ina238_read_reg40(const struct i2c_client *client, u8 reg, u64 *val)
+{
+	u8 data[5];
+	u32 low;
+	int err;
+
+	/* 40-bit register read */
+	err = i2c_smbus_read_i2c_block_data(client, reg, 5, data);
+	if (err < 0)
+		return err;
+	if (err != 5)
+		return -EIO;
+	low = (data[1] << 24) | (data[2] << 16) | (data[3] << 8) | data[4];
+	*val = ((long long)data[0] << 32) | low;
+
+	return 0;
+}
+
 static int ina238_read_in(struct device *dev, u32 attr, int channel,
 			  long *val)
 {
@@ -330,6 +369,17 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		if (err)
 			return err;
 
+		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
+				data->gain, 20 * data->rshunt);
+		/* Clamp value to maximum value of long */
+		*val = clamp_val(power, 0, LONG_MAX);
+		break;
+	case hwmon_power_input_highest:
+		err = ina238_read_reg24(data->client, SQ52206_POWER_PEAK, &regval);
+		if (err)
+			return err;
+
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
 		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
 				data->gain, 20 * data->rshunt);
@@ -437,6 +487,25 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
 
+static ssize_t energy1_input_show(struct device *dev,
+				  struct device_attribute *da, char *buf)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int ret;
+	u64 regval;
+	u64 energy;
+
+	ret = ina238_read_reg40(data->client, SQ52206_ENERGY, &regval);
+	if (ret)
+		return ret;
+
+	/* result in mJ */
+	energy = div_u64(regval * INA238_FIXED_SHUNT *	data->gain * 16 *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
+
+	return sysfs_emit(buf, "%llu\n", energy);
+}
+
 static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
@@ -456,7 +525,7 @@ static int ina238_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static int ina238_write(struct device *dev, enum hwmon_sensor_types type,
-		       u32 attr, int channel, long val)
+			u32 attr, int channel, long val)
 {
 	struct ina238_data *data = dev_get_drvdata(dev);
 	int err;
@@ -486,6 +555,9 @@ static umode_t ina238_is_visible(const void *drvdata,
 				 enum hwmon_sensor_types type,
 				 u32 attr, int channel)
 {
+	const struct ina238_data *data = drvdata;
+	bool has_power_highest = data->config->has_power_highest;
+
 	switch (type) {
 	case hwmon_in:
 		switch (attr) {
@@ -513,6 +585,10 @@ static umode_t ina238_is_visible(const void *drvdata,
 			return 0444;
 		case hwmon_power_max:
 			return 0644;
+		case hwmon_power_input_highest:
+			if (has_power_highest)
+				return 0444;
+			return 0;
 		default:
 			return 0;
 		}
@@ -546,7 +622,8 @@ static const struct hwmon_channel_info * const ina238_info[] = {
 			   HWMON_C_INPUT),
 	HWMON_CHANNEL_INFO(power,
 			   /* 0: power */
-			   HWMON_P_INPUT | HWMON_P_MAX | HWMON_P_MAX_ALARM),
+			   HWMON_P_INPUT | HWMON_P_MAX |
+			   HWMON_P_MAX_ALARM | HWMON_P_INPUT_HIGHEST),
 	HWMON_CHANNEL_INFO(temp,
 			   /* 0: die temperature */
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_ALARM),
@@ -564,6 +641,15 @@ static const struct hwmon_chip_info ina238_chip_info = {
 	.info = ina238_info,
 };
 
+/* energy attributes are 5 bytes wide so we need u64 */
+static DEVICE_ATTR_RO(energy1_input);
+
+static struct attribute *ina238_attrs[] = {
+	&dev_attr_energy1_input.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ina238);
+
 static int ina238_probe(struct i2c_client *client)
 {
 	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -604,15 +690,21 @@ static int ina238_probe(struct i2c_client *client)
 	/* load shunt gain value */
 	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
 		data->gain = 4; /* Default of ADCRANGE = 0 */
-	if (data->gain != 1 && data->gain != 4) {
+	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
 		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
 		return -EINVAL;
 	}
 
 	/* Setup CONFIG register */
 	config = data->config->config_default;
-	if (data->gain == 1)
+	if (chip == sq52206) {
+		if (data->gain == 1)
+			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
+		else if (data->gain == 2)
+			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
+	} else if (data->gain == 1) {
 		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
+	}
 	ret = regmap_write(data->regmap, INA238_CONFIG, config);
 	if (ret < 0) {
 		dev_err(dev, "error configuring the device: %d\n", ret);
@@ -645,7 +737,8 @@ static int ina238_probe(struct i2c_client *client)
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
 							 &ina238_chip_info,
-							 NULL);
+							 data->config->has_energy ?
+								ina238_groups : NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
@@ -658,6 +751,7 @@ static int ina238_probe(struct i2c_client *client)
 static const struct i2c_device_id ina238_id[] = {
 	{ "ina237", ina237 },
 	{ "ina238", ina238 },
+	{ "sq52206", sq52206 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ina238_id);
@@ -671,6 +765,10 @@ static const struct of_device_id __maybe_unused ina238_of_match[] = {
 		.compatible = "ti,ina238",
 		.data = (void *)ina238
 	},
+	{
+		.compatible = "silergy,sq52206",
+		.data = (void *)sq52206
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ina238_of_match);
-- 
2.43.0


