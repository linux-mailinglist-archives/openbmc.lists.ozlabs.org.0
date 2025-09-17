Return-Path: <openbmc+bounces-654-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D1B7F001
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp66p6Pz3cZ9;
	Wed, 17 Sep 2025 16:01:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088910;
	cv=none; b=Oc4/JhnqERb2PRfZbXt7Z2iosyvaNqLF1girpxvku2c0SUhCQHge85pNV7Ms7x/xl58ZvD93nFuoB6pGUjt/FxLghHJkbFKH6GvZO7txme+pmRiHxG1IHfCbpYbdNVnLXq9I+1aNLMVvjNAMLbUpZPOGH6JJ5Toz4+1V9WrKoqb8le2DkTbsIpx8HeVR9P1DumyACdVZgRb43iPTdVNi87DjXDTvYVaocQ0HLydS8AgV4fLtr5V252pTcxsHfcQEyvVdxhBnKQBHx8R3p27OJaJRDgqaakDFIDKaAyxzh+4QcACPhD++Wu7OAGR9PsrmabVUq2Fz83PYDAhRuqimWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088910; c=relaxed/relaxed;
	bh=Hzlp2P52nth6UG0sJk33ZgOWmzSON82s56GVJBOVnR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaWPy+Qxh2kduzCD5CtiLT7oIYNaZlXazJm/2qm0mjoIDtFH4EwwEhdl5b6/s7Mf4J1dUwymD7TEwoUAebfZEb92BhtJf1zwyXxTzeeR1b9WjfxswLTRZAgXKDvsFf7aMDpOD9nOfvulVs671V+Qt4vKvaOpK/7MhqkOdjmSIJ3UMjRhwtQKA3TP1M2SHaJOmn7ONxTITNsbvvSq+1kJ4kv8iqvKuhhYQLmyuL0Ia0LPsJtYaWNlU6l6fB7nYl/4p1SFgRi4yu5yTl4lWmec4zxJusv7fWXbz9qqU6hqNneSKygpnIZ0L/UDZ5rwPPa65TiEvMshdfGnLaUBnmCr9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l80JgLXQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=l80JgLXQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp61Vt5z3ccF
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:50 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b5229007f31so4271421a12.2
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088908; x=1758693708; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hzlp2P52nth6UG0sJk33ZgOWmzSON82s56GVJBOVnR0=;
        b=l80JgLXQXl7gzUK5xrhLopcgWCLgWqb/qC68mJtF5cvZ9aZnxN7gyyaIGZRNaNFkdb
         llsKmpCayTstWEdgcIiaqD4n4OyVw9CY4icWryZpximg2080JZHFR4Z2/1R5Hc8A7CYF
         9tcmwAiIhF5QvCshrLtu03rcM9AABgUS7ucoyYr5rhHRvA6kkxRourP12U4Vo4x2sS67
         8aE+NACKZJwccnf0ZR/FV9Sbu1bxG7RwxjafIzj+oBsaDU0tVZ7HbnZcZbjnOg6HzcuE
         JrxO/EEo15oybGO73T7wzSjzJSoHbl+zBK0n9D6QBG32t26u5QTXapCG4kRae+UuU3y2
         XbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088908; x=1758693708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hzlp2P52nth6UG0sJk33ZgOWmzSON82s56GVJBOVnR0=;
        b=pDoYmZfX5aVkA0Y/VEnwxvWCZe6cfnomGV8Vs5FEgHMr2Q2IE5Y0AEAzQy8+qsDmb6
         lIqV7r8zsQLS0uSv9/NLu5kmaTGol8ulU9bpVtui9gGmSGLSAH8MUXq3KwBCFy9ICDDV
         AjUaSSnq3F+mvamz4ZuGe629Jx8dTjPlrAHxkV9DRV/z7e53+TznRpyL4sYm5925KbCr
         ByJRc/BPc55dhv5XbxirHH867nA/8b8yq1CA5FZmfYw6BA5fvaD9OXdHWUc8j1E1lRdF
         Gz1HBy7nDLyD6y4nR8LEXGzeVzKbiEz5PBW57xnfj3hduf1jOO99iWFcmz6ORb8PNgUo
         +Rrw==
X-Forwarded-Encrypted: i=1; AJvYcCUYODZleXDMyrdkXqT2rWsGhZj+EZeWlrbLcMoWV6WlZWPovL5uePFCrH6GFpjiYytEJhf8ZOTd@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBPGrayjD7VqABZQ9gzxhmtK3M2OOEQiKYIpqUUiaix1bMhfYl
	S3VmiPlWd43Z/cvpQmejVJ/fW/g3gtub2Lz0rbAhmaF0jE/CWZ98NN7l
X-Gm-Gg: ASbGnctW8zciWIa8LubJFtQ70Vx3gADQbc9heMp9nCkT2IOodAFvlHOfaF3fxWmskaX
	dvPlz29f+MXxC4Ew76wXim7clxjUtfENg3xgCFeLE26kk8R9J5oTVAh3GbEh6GNA2CnMZVs2/j3
	Mi+HWL/QP+EwSHQLq4SmykmzAdyEWnndHX6ydd9qUUfmrPdnLOw8HMSCcifhbT9eLYCr45goIy8
	0OV7SVv/FGMIhBn5k6/EUXuvMiON09HoB03ePysJoMjpKWAaDCmcrJ2yEwrl9Cd6nJv34gG0/zE
	6380DnJ5bI+XQyiQk2FhQSZ2fvND7e3sXEZ689VyQ8kM3lNV64YVKGlrwQffkYiHvhePjki/f+j
	BKe1/aytSwvosisfKt/rukicjQtC6xx21WPFN+2UipJn2j5qXAh4e/Yg6YWtWpKgLi3OQTekiW6
	bPO93653n2PCcx5zTz5JWcD3QgPA==
X-Google-Smtp-Source: AGHT+IEjd0vaWqIsWyYCILvBkjnBpnS58EYD7y8/8d5MJlWnHL14PSMDvnx0/L1FtBDv6ZCi6Zc7oQ==
X-Received: by 2002:a17:902:e80a:b0:25c:343a:12eb with SMTP id d9443c01a7336-268118a5f34mr14093765ad.4.1758088905872;
        Tue, 16 Sep 2025 23:01:45 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:45 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 6/9] hwmon: (ina238) Add support for INA228
Date: Wed, 17 Sep 2025 14:01:31 +0800
Message-ID: <20250917060134.2383005-7-peteryin.openbmc@gmail.com>
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

From: Jonas Rebmann <jre@pengutronix.de>

Add support for the Texas Instruments INA228 Ultra-Precise
Power/Energy/Charge Monitor.

The INA228 is very similar to the INA238 but offers four bits of extra
precision in the temperature, voltage and current measurement fields.
It also supports energy and charge monitoring, the latter of which is
not supported through this patch.

While it seems in the datasheet that some constants such as LSB values
differ between the 228 and the 238, they differ only for those registers
where four bits of precision have been added and they differ by a factor
of 16 (VBUS, VSHUNT, DIETEMP, CURRENT).

Therefore, the INA238 constants are still applicable with regard
to the bit of the same significance.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
Link: https://lore.kernel.org/r/20250718-ina228-v2-3-227feb62f709@pengutronix.de
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit fd470f4ed80ce0807943b8d6802ca41044c73521)
---
 drivers/hwmon/ina238.c | 106 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 5e43bbe8817d..5a394eeff676 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2021 Nathan Rossi <nathan.rossi@digi.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
@@ -107,6 +108,7 @@
 #define INA238_DIE_TEMP_LSB		1250000 /* 125.0000 mC/lsb */
 #define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
 #define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
+#define INA228_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
 static const struct regmap_config ina238_regmap_config = {
 	.max_register = INA238_REGISTERS,
@@ -114,9 +116,10 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
-enum ina238_ids { ina238, ina237, sq52206 };
+enum ina238_ids { ina238, ina237, sq52206, ina228 };
 
 struct ina238_config {
+	bool has_20bit_voltage_current; /* vshunt, vbus and current are 20-bit fields */
 	bool has_power_highest;		/* chip detection power peak */
 	bool has_energy;		/* chip detection energy */
 	u8 temp_shift;			/* fixed parameters for temp calculate */
@@ -137,6 +140,7 @@ struct ina238_data {
 
 static const struct ina238_config ina238_config[] = {
 	[ina238] = {
+		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
 		.temp_shift = 4,
@@ -146,6 +150,7 @@ static const struct ina238_config ina238_config[] = {
 		.temp_lsb = INA238_DIE_TEMP_LSB,
 	},
 	[ina237] = {
+		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
 		.temp_shift = 4,
@@ -155,6 +160,7 @@ static const struct ina238_config ina238_config[] = {
 		.temp_lsb = INA238_DIE_TEMP_LSB,
 	},
 	[sq52206] = {
+		.has_20bit_voltage_current = false,
 		.has_energy = true,
 		.has_power_highest = true,
 		.temp_shift = 0,
@@ -163,6 +169,16 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
 		.temp_lsb = SQ52206_DIE_TEMP_LSB,
 	},
+	[ina228] = {
+		.has_20bit_voltage_current = true,
+		.has_energy = true,
+		.has_power_highest = false,
+		.temp_shift = 0,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_lsb = INA228_DIE_TEMP_LSB,
+	},
 };
 
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
@@ -199,6 +215,65 @@ static int ina238_read_reg40(const struct i2c_client *client, u8 reg, u64 *val)
 	return 0;
 }
 
+static int ina238_read_field_s20(const struct i2c_client *client, u8 reg, s32 *val)
+{
+	u32 regval;
+	int err;
+
+	err = ina238_read_reg24(client, reg, &regval);
+	if (err)
+		return err;
+
+	/* bits 3-0 Reserved, always zero */
+	regval >>= 4;
+
+	*val = sign_extend32(regval, 19);
+
+	return 0;
+}
+
+static int ina228_read_shunt_voltage(struct device *dev, u32 attr, int channel,
+				     long *val)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int regval;
+	int err;
+
+	err = ina238_read_field_s20(data->client, INA238_SHUNT_VOLTAGE, &regval);
+	if (err)
+		return err;
+
+	/*
+	 * gain of 1 -> LSB / 4
+	 * This field has 16 bit on ina238. ina228 adds another 4 bits of
+	 * precision. ina238 conversion factors can still be applied when
+	 * dividing by 16.
+	 */
+	*val = (regval * INA238_SHUNT_VOLTAGE_LSB) * data->gain / (1000 * 4) / 16;
+	return 0;
+}
+
+static int ina228_read_bus_voltage(struct device *dev, u32 attr, int channel,
+				   long *val)
+{
+	struct ina238_data *data = dev_get_drvdata(dev);
+	int regval;
+	int err;
+
+	err = ina238_read_field_s20(data->client, INA238_BUS_VOLTAGE, &regval);
+	if (err)
+		return err;
+
+	/*
+	 * gain of 1 -> LSB / 4
+	 * This field has 16 bit on ina238. ina228 adds another 4 bits of
+	 * precision. ina238 conversion factors can still be applied when
+	 * dividing by 16.
+	 */
+	*val = (regval * data->config->bus_voltage_lsb) / 1000 / 16;
+	return 0;
+}
+
 static int ina238_read_in(struct device *dev, u32 attr, int channel,
 			  long *val)
 {
@@ -211,6 +286,8 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 	case 0:
 		switch (attr) {
 		case hwmon_in_input:
+			if (data->config->has_20bit_voltage_current)
+				return ina228_read_shunt_voltage(dev, attr, channel, val);
 			reg = INA238_SHUNT_VOLTAGE;
 			break;
 		case hwmon_in_max:
@@ -234,6 +311,8 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 	case 1:
 		switch (attr) {
 		case hwmon_in_input:
+			if (data->config->has_20bit_voltage_current)
+				return ina228_read_bus_voltage(dev, attr, channel, val);
 			reg = INA238_BUS_VOLTAGE;
 			break;
 		case hwmon_in_max:
@@ -341,13 +420,25 @@ static int ina238_read_current(struct device *dev, u32 attr, long *val)
 
 	switch (attr) {
 	case hwmon_curr_input:
-		err = regmap_read(data->regmap, INA238_CURRENT, &regval);
-		if (err < 0)
-			return err;
+		if (data->config->has_20bit_voltage_current) {
+			err = ina238_read_field_s20(data->client, INA238_CURRENT, &regval);
+			if (err)
+				return err;
+		} else {
+			err = regmap_read(data->regmap, INA238_CURRENT, &regval);
+			if (err < 0)
+				return err;
+			/* sign-extend */
+			regval = (s16)regval;
+		}
 
 		/* Signed register, fixed 1mA current lsb. result in mA */
-		*val = div_s64((s16)regval * INA238_FIXED_SHUNT * data->gain,
+		*val = div_s64((s64)regval * INA238_FIXED_SHUNT * data->gain,
 			       data->rshunt * 4);
+
+		/* Account for 4 bit offset */
+		if (data->config->has_20bit_voltage_current)
+			*val /= 16;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -750,6 +841,7 @@ static int ina238_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ina238_id[] = {
+	{ "ina228", ina228 },
 	{ "ina237", ina237 },
 	{ "ina238", ina238 },
 	{ "sq52206", sq52206 },
@@ -758,6 +850,10 @@ static const struct i2c_device_id ina238_id[] = {
 MODULE_DEVICE_TABLE(i2c, ina238_id);
 
 static const struct of_device_id __maybe_unused ina238_of_match[] = {
+	{
+		.compatible = "ti,ina228",
+		.data = (void *)ina228
+	},
 	{
 		.compatible = "ti,ina237",
 		.data = (void *)ina237
-- 
2.43.0


