Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE803510D9C
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 03:04:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp0s86BPDz3bfL
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 11:04:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=eUhWplX/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=eUhWplX/; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp0pm33HQz2xtp
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 11:02:40 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4C190545;
 Tue, 26 Apr 2022 18:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651021358;
 bh=pV3KvZBMmOfDoPB0XTggBR9mzQnGTLF3IQA2z31eE4w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eUhWplX/sRRTgRXgsMRBJErSNcDhknq4lHdCYjCRKpZvWiOH+e5z8Fr5KJJlBlH+e
 6FPE/XWjLWWA8t2TIgCMqTtY0Q1Mtg2zLYK4PcQls9J/3ZzNu+qOuUO7ZMEBeg9bBv
 iSGN8FtyukCqj3nFMUs2xPkRMpUE89/sZQ87oscY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v4 2/7] hwmon: (nct6775) Convert register access to regmap API
Date: Tue, 26 Apr 2022 18:01:49 -0700
Message-Id: <20220427010154.29749-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427010154.29749-1-zev@bewilderbeest.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Joel Stanley <joel@jms.id.au>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This replaces the nct6775_data->{read,write}_value function pointers
with a regmap.

The major difference is that the regmap access functions may fail, and
hence require checking at each call site.  While the existing WMI
register-access code had potential failure paths, they were masked by
the fact that the read_value() function returned the register value
directly, and hence squashed errors undetectably by simply returning
zero, and while the write_value() functions were capable of reporting
errors, all callers ignored them.

This improves the robustness of the existing code, and also prepares
the driver for an i2c version to be added soon, for which register
accesses are much more likely to actually fail.

The conversion of the register-access call sites is largely mechanical
(reading a register now returns the value via an out-param pointer,
and returned errors must be checked for and propagated to callers),
though the nct6775_write_fan_div() function is refactored slightly to
avoid duplicating nearly identical (and now lengthier) code in each
switch case.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/nct6775.c | 977 +++++++++++++++++++++++++++-------------
 1 file changed, 662 insertions(+), 315 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 2b91f7e05126..be99a1890ccd 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -55,6 +55,7 @@
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/nospec.h>
+#include <linux/regmap.h>
 #include <linux/wmi.h>
 #include "lm75.h"
 
@@ -1345,9 +1346,7 @@ struct nct6775_data {
 	u8 fandiv2;
 	u8 sio_reg_enable;
 
-	/* nct6775_*() callbacks  */
-	u16 (*read_value)(struct nct6775_data *data, u16 reg);
-	int (*write_value)(struct nct6775_data *data, u16 reg, u16 value);
+	struct regmap *regmap;
 };
 
 struct sensor_device_template {
@@ -1546,30 +1545,44 @@ static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
 	data->bank = bank;
 }
 
-static u16 nct6775_wmi_read_value(struct nct6775_data *data, u16 reg)
+static int nct6775_wmi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 {
-	int res, err, word_sized = is_word_sized(data, reg);
+	struct nct6775_data *data = ctx;
+	int err, word_sized = is_word_sized(data, reg);
 	u8 tmp = 0;
+	u16 res;
 
 	nct6775_wmi_set_bank(data, reg);
 
 	err = nct6775_asuswmi_read(data->bank, reg & 0xff, &tmp);
 	if (err)
-		return 0;
+		return err;
 
 	res = tmp;
 	if (word_sized) {
 		err = nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);
 		if (err)
-			return 0;
+			return err;
 
 		res = (res << 8) + tmp;
 	}
-	return res;
+	*val = res;
+	return 0;
+}
+
+static inline int nct6775_read_value(struct nct6775_data *data, u16 reg, u16 *value)
+{
+	unsigned int tmp;
+	int ret = regmap_read(data->regmap, reg, &tmp);
+
+	if (!ret)
+		*value = tmp;
+	return ret;
 }
 
-static int nct6775_wmi_write_value(struct nct6775_data *data, u16 reg, u16 value)
+static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value)
 {
+	struct nct6775_data *data = ctx;
 	int res, word_sized = is_word_sized(data, reg);
 
 	nct6775_wmi_set_bank(data, reg);
@@ -1587,6 +1600,11 @@ static int nct6775_wmi_write_value(struct nct6775_data *data, u16 reg, u16 value
 	return res;
 }
 
+static inline int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
+{
+	return regmap_write(data->regmap, reg, value);
+}
+
 /*
  * On older chips, only registers 0x50-0x5f are banked.
  * On more recent chips, all registers are banked.
@@ -1604,23 +1622,25 @@ static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
 	}
 }
 
-static u16 nct6775_read_value(struct nct6775_data *data, u16 reg)
+static int nct6775_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 {
-	int res, word_sized = is_word_sized(data, reg);
+	struct nct6775_data *data = ctx;
+	int word_sized = is_word_sized(data, reg);
 
 	nct6775_set_bank(data, reg);
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
-	res = inb_p(data->addr + DATA_REG_OFFSET);
+	*val = inb_p(data->addr + DATA_REG_OFFSET);
 	if (word_sized) {
 		outb_p((reg & 0xff) + 1,
 		       data->addr + ADDR_REG_OFFSET);
-		res = (res << 8) + inb_p(data->addr + DATA_REG_OFFSET);
+		*val = (*val << 8) + inb_p(data->addr + DATA_REG_OFFSET);
 	}
-	return res;
+	return 0;
 }
 
-static int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
+static int nct6775_reg_write(void *ctx, unsigned int reg, unsigned int value)
 {
+	struct nct6775_data *data = ctx;
 	int word_sized = is_word_sized(data, reg);
 
 	nct6775_set_bank(data, reg);
@@ -1635,83 +1655,85 @@ static int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
 }
 
 /* We left-align 8-bit temperature values to make the code simpler */
-static u16 nct6775_read_temp(struct nct6775_data *data, u16 reg)
+static int nct6775_read_temp(struct nct6775_data *data, u16 reg, u16 *val)
 {
-	u16 res;
+	int err;
+
+	err = nct6775_read_value(data, reg, val);
+	if (err)
+		return err;
 
-	res = data->read_value(data, reg);
 	if (!is_word_sized(data, reg))
-		res <<= 8;
+		*val <<= 8;
 
-	return res;
+	return 0;
 }
 
 static int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
 {
 	if (!is_word_sized(data, reg))
 		value >>= 8;
-	return data->write_value(data, reg, value);
+	return nct6775_write_value(data, reg, value);
 }
 
 /* This function assumes that the caller holds data->update_lock */
-static void nct6775_write_fan_div(struct nct6775_data *data, int nr)
+static int nct6775_write_fan_div(struct nct6775_data *data, int nr)
 {
-	u8 reg;
+	u16 reg;
+	int err;
+	u16 fandiv_reg = nr < 2 ? NCT6775_REG_FANDIV1 : NCT6775_REG_FANDIV2;
+	unsigned int oddshift = (nr & 1) * 4; /* masks shift by four if nr is odd */
 
-	switch (nr) {
-	case 0:
-		reg = (data->read_value(data, NCT6775_REG_FANDIV1) & 0x70)
-		    | (data->fan_div[0] & 0x7);
-		data->write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 1:
-		reg = (data->read_value(data, NCT6775_REG_FANDIV1) & 0x7)
-		    | ((data->fan_div[1] << 4) & 0x70);
-		data->write_value(data, NCT6775_REG_FANDIV1, reg);
-		break;
-	case 2:
-		reg = (data->read_value(data, NCT6775_REG_FANDIV2) & 0x70)
-		    | (data->fan_div[2] & 0x7);
-		data->write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	case 3:
-		reg = (data->read_value(data, NCT6775_REG_FANDIV2) & 0x7)
-		    | ((data->fan_div[3] << 4) & 0x70);
-		data->write_value(data, NCT6775_REG_FANDIV2, reg);
-		break;
-	}
+	err = nct6775_read_value(data, fandiv_reg, &reg);
+	if (err)
+		return err;
+	reg &= 0x70 >> oddshift;
+	reg |= data->fan_div[nr] & (0x7 << oddshift);
+	return nct6775_write_value(data, fandiv_reg, reg);
 }
 
-static void nct6775_write_fan_div_common(struct nct6775_data *data, int nr)
+static int nct6775_write_fan_div_common(struct nct6775_data *data, int nr)
 {
 	if (data->kind == nct6775)
-		nct6775_write_fan_div(data, nr);
+		return nct6775_write_fan_div(data, nr);
+	return 0;
 }
 
-static void nct6775_update_fan_div(struct nct6775_data *data)
+static int nct6775_update_fan_div(struct nct6775_data *data)
 {
-	u8 i;
+	int err;
+	u16 i;
 
-	i = data->read_value(data, NCT6775_REG_FANDIV1);
+	err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &i);
+	if (err)
+		return err;
 	data->fan_div[0] = i & 0x7;
 	data->fan_div[1] = (i & 0x70) >> 4;
-	i = data->read_value(data, NCT6775_REG_FANDIV2);
+	err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &i);
+	if (err)
+		return err;
 	data->fan_div[2] = i & 0x7;
 	if (data->has_fan & BIT(3))
 		data->fan_div[3] = (i & 0x70) >> 4;
+
+	return 0;
 }
 
-static void nct6775_update_fan_div_common(struct nct6775_data *data)
+static int nct6775_update_fan_div_common(struct nct6775_data *data)
 {
 	if (data->kind == nct6775)
-		nct6775_update_fan_div(data);
+		return nct6775_update_fan_div(data);
+	return 0;
 }
 
-static void nct6775_init_fan_div(struct nct6775_data *data)
+static int nct6775_init_fan_div(struct nct6775_data *data)
 {
-	int i;
+	int i, err;
+
+	err = nct6775_update_fan_div_common(data);
+	if (err)
+		return err;
 
-	nct6775_update_fan_div_common(data);
 	/*
 	 * For all fans, start with highest divider value if the divider
 	 * register is not initialized. This ensures that we get a
@@ -1723,19 +1745,26 @@ static void nct6775_init_fan_div(struct nct6775_data *data)
 			continue;
 		if (data->fan_div[i] == 0) {
 			data->fan_div[i] = 7;
-			nct6775_write_fan_div_common(data, i);
+			err = nct6775_write_fan_div_common(data, i);
+			if (err)
+				return err;
 		}
 	}
+
+	return 0;
 }
 
-static void nct6775_init_fan_common(struct device *dev,
-				    struct nct6775_data *data)
+static int nct6775_init_fan_common(struct device *dev,
+				   struct nct6775_data *data)
 {
-	int i;
-	u8 reg;
+	int i, err;
+	u16 reg;
 
-	if (data->has_fan_div)
-		nct6775_init_fan_div(data);
+	if (data->has_fan_div) {
+		err = nct6775_init_fan_div(data);
+		if (err)
+			return err;
+	}
 
 	/*
 	 * If fan_min is not set (0), set it to 0xff to disable it. This
@@ -1743,23 +1772,30 @@ static void nct6775_init_fan_common(struct device *dev,
 	 */
 	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
 		if (data->has_fan_min & BIT(i)) {
-			reg = data->read_value(data, data->REG_FAN_MIN[i]);
-			if (!reg)
-				data->write_value(data, data->REG_FAN_MIN[i],
-						  data->has_fan_div ? 0xff
-								    : 0xff1f);
+			err = nct6775_read_value(data, data->REG_FAN_MIN[i], &reg);
+			if (err)
+				return err;
+			if (!reg) {
+				err = nct6775_write_value(data, data->REG_FAN_MIN[i],
+							  data->has_fan_div ? 0xff : 0xff1f);
+				if (err)
+					return err;
+			}
 		}
 	}
+
+	return 0;
 }
 
-static void nct6775_select_fan_div(struct device *dev,
-				   struct nct6775_data *data, int nr, u16 reg)
+static int nct6775_select_fan_div(struct device *dev,
+				  struct nct6775_data *data, int nr, u16 reg)
 {
+	int err;
 	u8 fan_div = data->fan_div[nr];
 	u16 fan_min;
 
 	if (!data->has_fan_div)
-		return;
+		return 0;
 
 	/*
 	 * If we failed to measure the fan speed, or the reported value is not
@@ -1791,36 +1827,46 @@ static void nct6775_select_fan_div(struct device *dev,
 			}
 			if (fan_min != data->fan_min[nr]) {
 				data->fan_min[nr] = fan_min;
-				data->write_value(data, data->REG_FAN_MIN[nr],
-						  fan_min);
+				err = nct6775_write_value(data, data->REG_FAN_MIN[nr], fan_min);
+				if (err)
+					return err;
 			}
 		}
 		data->fan_div[nr] = fan_div;
-		nct6775_write_fan_div_common(data, nr);
+		err = nct6775_write_fan_div_common(data, nr);
+		if (err)
+			return err;
 	}
+
+	return 0;
 }
 
-static void nct6775_update_pwm(struct device *dev)
+static int nct6775_update_pwm(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j;
-	int fanmodecfg, reg;
+	int i, j, err;
+	u16 fanmodecfg, reg;
 	bool duty_is_dc;
 
 	for (i = 0; i < data->pwm_num; i++) {
 		if (!(data->has_pwm & BIT(i)))
 			continue;
 
-		duty_is_dc = data->REG_PWM_MODE[i] &&
-		  (data->read_value(data, data->REG_PWM_MODE[i])
-		   & data->PWM_MODE_MASK[i]);
+		err = nct6775_read_value(data, data->REG_PWM_MODE[i], &reg);
+		if (err)
+			return err;
+		duty_is_dc = data->REG_PWM_MODE[i] && (reg & data->PWM_MODE_MASK[i]);
 		data->pwm_mode[i] = !duty_is_dc;
 
-		fanmodecfg = data->read_value(data, data->REG_FAN_MODE[i]);
+		err = nct6775_read_value(data, data->REG_FAN_MODE[i], &fanmodecfg);
+		if (err)
+			return err;
 		for (j = 0; j < ARRAY_SIZE(data->REG_PWM); j++) {
 			if (data->REG_PWM[j] && data->REG_PWM[j][i]) {
-				data->pwm[j][i] = data->read_value(data,
-								   data->REG_PWM[j][i]);
+				err = nct6775_read_value(data, data->REG_PWM[j][i], &reg);
+				if (err)
+					return err;
+				data->pwm[j][i] = reg;
 			}
 		}
 
@@ -1835,17 +1881,22 @@ static void nct6775_update_pwm(struct device *dev)
 			u8 t = fanmodecfg & 0x0f;
 
 			if (data->REG_TOLERANCE_H) {
-				t |= (data->read_value(data,
-				      data->REG_TOLERANCE_H[i]) & 0x70) >> 1;
+				err = nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
+				if (err)
+					return err;
+				t |= (reg & 0x70) >> 1;
 			}
 			data->target_speed_tolerance[i] = t;
 		}
 
-		data->temp_tolerance[1][i] =
-			data->read_value(data,
-					 data->REG_CRITICAL_TEMP_TOLERANCE[i]);
+		err = nct6775_read_value(data, data->REG_CRITICAL_TEMP_TOLERANCE[i], &reg);
+		if (err)
+			return err;
+		data->temp_tolerance[1][i] = reg;
 
-		reg = data->read_value(data, data->REG_TEMP_SEL[i]);
+		err = nct6775_read_value(data, data->REG_TEMP_SEL[i], &reg);
+		if (err)
+			return err;
 		data->pwm_temp_sel[i] = reg & 0x1f;
 		/* If fan can stop, report floor as 0 */
 		if (reg & 0x80)
@@ -1854,7 +1905,9 @@ static void nct6775_update_pwm(struct device *dev)
 		if (!data->REG_WEIGHT_TEMP_SEL[i])
 			continue;
 
-		reg = data->read_value(data, data->REG_WEIGHT_TEMP_SEL[i]);
+		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[i], &reg);
+		if (err)
+			return err;
 		data->pwm_weight_temp_sel[i] = reg & 0x1f;
 		/* If weight is disabled, report weight source as 0 */
 		if (!(reg & 0x80))
@@ -1862,29 +1915,37 @@ static void nct6775_update_pwm(struct device *dev)
 
 		/* Weight temp data */
 		for (j = 0; j < ARRAY_SIZE(data->weight_temp); j++) {
-			data->weight_temp[j][i] = data->read_value(data,
-								   data->REG_WEIGHT_TEMP[j][i]);
+			err = nct6775_read_value(data, data->REG_WEIGHT_TEMP[j][i], &reg);
+			if (err)
+				return err;
+			data->weight_temp[j][i] = reg;
 		}
 	}
+
+	return 0;
 }
 
-static void nct6775_update_pwm_limits(struct device *dev)
+static int nct6775_update_pwm_limits(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j;
-	u8 reg;
-	u16 reg_t;
+	int i, j, err;
+	u16 reg, reg_t;
 
 	for (i = 0; i < data->pwm_num; i++) {
 		if (!(data->has_pwm & BIT(i)))
 			continue;
 
 		for (j = 0; j < ARRAY_SIZE(data->fan_time); j++) {
-			data->fan_time[j][i] =
-			  data->read_value(data, data->REG_FAN_TIME[j][i]);
+			err = nct6775_read_value(data, data->REG_FAN_TIME[j][i], &reg);
+			if (err)
+				return err;
+			data->fan_time[j][i] = reg;
 		}
 
-		reg_t = data->read_value(data, data->REG_TARGET[i]);
+		err = nct6775_read_value(data, data->REG_TARGET[i], &reg_t);
+		if (err)
+			return err;
+
 		/* Update only in matching mode or if never updated */
 		if (!data->target_temp[i] ||
 		    data->pwm_enable[i] == thermal_cruise)
@@ -1892,29 +1953,37 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		if (!data->target_speed[i] ||
 		    data->pwm_enable[i] == speed_cruise) {
 			if (data->REG_TOLERANCE_H) {
-				reg_t |= (data->read_value(data,
-					data->REG_TOLERANCE_H[i]) & 0x0f) << 8;
+				err = nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
+				if (err)
+					return err;
+				reg_t |= (reg & 0x0f) << 8;
 			}
 			data->target_speed[i] = reg_t;
 		}
 
 		for (j = 0; j < data->auto_pwm_num; j++) {
-			data->auto_pwm[i][j] =
-			  data->read_value(data,
-					   NCT6775_AUTO_PWM(data, i, j));
-			data->auto_temp[i][j] =
-			  data->read_value(data,
-					   NCT6775_AUTO_TEMP(data, i, j));
+			err = nct6775_read_value(data, NCT6775_AUTO_PWM(data, i, j), &reg);
+			if (err)
+				return err;
+			data->auto_pwm[i][j] = reg;
+
+			err = nct6775_read_value(data, NCT6775_AUTO_TEMP(data, i, j), &reg);
+			if (err)
+				return err;
+			data->auto_temp[i][j] = reg;
 		}
 
 		/* critical auto_pwm temperature data */
-		data->auto_temp[i][data->auto_pwm_num] =
-			data->read_value(data, data->REG_CRITICAL_TEMP[i]);
+		err = nct6775_read_value(data, data->REG_CRITICAL_TEMP[i], &reg);
+		if (err)
+			return err;
+		data->auto_temp[i][data->auto_pwm_num] = reg;
 
 		switch (data->kind) {
 		case nct6775:
-			reg = data->read_value(data,
-					       NCT6775_REG_CRITICAL_ENAB[i]);
+			err = nct6775_read_value(data, NCT6775_REG_CRITICAL_ENAB[i], &reg);
+			if (err)
+				return err;
 			data->auto_pwm[i][data->auto_pwm_num] =
 						(reg & 0x02) ? 0xff : 0x00;
 			break;
@@ -1931,120 +2000,158 @@ static void nct6775_update_pwm_limits(struct device *dev)
 		case nct6796:
 		case nct6797:
 		case nct6798:
-			reg = data->read_value(data,
-					data->REG_CRITICAL_PWM_ENABLE[i]);
-			if (reg & data->CRITICAL_PWM_ENABLE_MASK)
-				reg = data->read_value(data,
-					data->REG_CRITICAL_PWM[i]);
-			else
+			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[i], &reg);
+			if (err)
+				return err;
+			if (reg & data->CRITICAL_PWM_ENABLE_MASK) {
+				err = nct6775_read_value(data, data->REG_CRITICAL_PWM[i], &reg);
+				if (err)
+					return err;
+			} else {
 				reg = 0xff;
+			}
 			data->auto_pwm[i][data->auto_pwm_num] = reg;
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static struct nct6775_data *nct6775_update_device(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j;
+	int i, j, err = 0;
+	u16 reg;
 
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		/* Fan clock dividers */
-		nct6775_update_fan_div_common(data);
+		err = nct6775_update_fan_div_common(data);
+		if (err)
+			goto out;
 
 		/* Measured voltages and limits */
 		for (i = 0; i < data->in_num; i++) {
 			if (!(data->have_in & BIT(i)))
 				continue;
 
-			data->in[i][0] = data->read_value(data,
-							  data->REG_VIN[i]);
-			data->in[i][1] = data->read_value(data,
-					  data->REG_IN_MINMAX[0][i]);
-			data->in[i][2] = data->read_value(data,
-					  data->REG_IN_MINMAX[1][i]);
+			err = nct6775_read_value(data, data->REG_VIN[i], &reg);
+			if (err)
+				goto out;
+			data->in[i][0] = reg;
+
+			err = nct6775_read_value(data, data->REG_IN_MINMAX[0][i], &reg);
+			if (err)
+				goto out;
+			data->in[i][1] = reg;
+
+			err = nct6775_read_value(data, data->REG_IN_MINMAX[1][i], &reg);
+			if (err)
+				goto out;
+			data->in[i][2] = reg;
 		}
 
 		/* Measured fan speeds and limits */
 		for (i = 0; i < ARRAY_SIZE(data->rpm); i++) {
-			u16 reg;
-
 			if (!(data->has_fan & BIT(i)))
 				continue;
 
-			reg = data->read_value(data, data->REG_FAN[i]);
+			err = nct6775_read_value(data, data->REG_FAN[i], &reg);
+			if (err)
+				goto out;
 			data->rpm[i] = data->fan_from_reg(reg,
 							  data->fan_div[i]);
 
-			if (data->has_fan_min & BIT(i))
-				data->fan_min[i] = data->read_value(data,
-					   data->REG_FAN_MIN[i]);
+			if (data->has_fan_min & BIT(i)) {
+				err = nct6775_read_value(data, data->REG_FAN_MIN[i], &reg);
+				if (err)
+					goto out;
+				data->fan_min[i] = reg;
+			}
 
 			if (data->REG_FAN_PULSES[i]) {
-				data->fan_pulses[i] =
-				  (data->read_value(data,
-						    data->REG_FAN_PULSES[i])
-				   >> data->FAN_PULSE_SHIFT[i]) & 0x03;
+				err = nct6775_read_value(data, data->REG_FAN_PULSES[i], &reg);
+				if (err)
+					goto out;
+				data->fan_pulses[i] = (reg >> data->FAN_PULSE_SHIFT[i]) & 0x03;
 			}
 
-			nct6775_select_fan_div(dev, data, i, reg);
+			err = nct6775_select_fan_div(dev, data, i, reg);
+			if (err)
+				goto out;
 		}
 
-		nct6775_update_pwm(dev);
-		nct6775_update_pwm_limits(dev);
+		err = nct6775_update_pwm(dev);
+		if (err)
+			goto out;
+
+		err = nct6775_update_pwm_limits(dev);
+		if (err)
+			goto out;
 
 		/* Measured temperatures and limits */
 		for (i = 0; i < NUM_TEMP; i++) {
 			if (!(data->have_temp & BIT(i)))
 				continue;
 			for (j = 0; j < ARRAY_SIZE(data->reg_temp); j++) {
-				if (data->reg_temp[j][i])
-					data->temp[j][i] = nct6775_read_temp(data,
-									     data->reg_temp[j][i]);
+				if (data->reg_temp[j][i]) {
+					err = nct6775_read_temp(data, data->reg_temp[j][i], &reg);
+					if (err)
+						goto out;
+					data->temp[j][i] = reg;
+				}
 			}
 			if (i >= NUM_TEMP_FIXED ||
 			    !(data->have_temp_fixed & BIT(i)))
 				continue;
-			data->temp_offset[i] = data->read_value(data,
-								   data->REG_TEMP_OFFSET[i]);
+			err = nct6775_read_value(data, data->REG_TEMP_OFFSET[i], &reg);
+			if (err)
+				goto out;
+			data->temp_offset[i] = reg;
 		}
 
 		for (i = 0; i < NUM_TSI_TEMP; i++) {
 			if (!(data->have_tsi_temp & BIT(i)))
 				continue;
-			data->tsi_temp[i] = data->read_value(data, data->REG_TSI_TEMP[i]);
+			err = nct6775_read_value(data, data->REG_TSI_TEMP[i], &reg);
+			if (err)
+				goto out;
+			data->tsi_temp[i] = reg;
 		}
 
 		data->alarms = 0;
 		for (i = 0; i < NUM_REG_ALARM; i++) {
-			u8 alarm;
+			u16 alarm;
 
 			if (!data->REG_ALARM[i])
 				continue;
-			alarm = data->read_value(data, data->REG_ALARM[i]);
+			err = nct6775_read_value(data, data->REG_ALARM[i], &alarm);
+			if (err)
+				goto out;
 			data->alarms |= ((u64)alarm) << (i << 3);
 		}
 
 		data->beeps = 0;
 		for (i = 0; i < NUM_REG_BEEP; i++) {
-			u8 beep;
+			u16 beep;
 
 			if (!data->REG_BEEP[i])
 				continue;
-			beep = data->read_value(data, data->REG_BEEP[i]);
+			err = nct6775_read_value(data, data->REG_BEEP[i], &beep);
+			if (err)
+				goto out;
 			data->beeps |= ((u64)beep) << (i << 3);
 		}
 
 		data->last_updated = jiffies;
 		data->valid = true;
 	}
-
+out:
 	mutex_unlock(&data->update_lock);
-	return data;
+	return err ? ERR_PTR(err) : data;
 }
 
 /*
@@ -2058,6 +2165,9 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 	int index = sattr->index;
 	int nr = sattr->nr;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%ld\n", in_from_reg(data->in[nr][index], nr));
 }
 
@@ -2077,10 +2187,9 @@ store_in_reg(struct device *dev, struct device_attribute *attr, const char *buf,
 		return err;
 	mutex_lock(&data->update_lock);
 	data->in[nr][index] = in_to_reg(val, nr);
-	data->write_value(data, data->REG_IN_MINMAX[index - 1][nr],
-			  data->in[nr][index]);
+	err = nct6775_write_value(data, data->REG_IN_MINMAX[index - 1][nr], data->in[nr][index]);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2088,8 +2197,12 @@ show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = data->ALARM_BITS[sattr->index];
+	int nr;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
+	nr = data->ALARM_BITS[sattr->index];
 	return sprintf(buf, "%u\n",
 		       (unsigned int)((data->alarms >> nr) & 0x01));
 }
@@ -2097,14 +2210,15 @@ show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 static int find_temp_source(struct nct6775_data *data, int index, int count)
 {
 	int source = data->temp_src[index];
-	int nr;
+	int nr, err;
 
 	for (nr = 0; nr < count; nr++) {
-		int src;
+		u16 src;
 
-		src = data->read_value(data,
-				       data->REG_TEMP_SOURCE[nr]) & 0x1f;
-		if (src == source)
+		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[nr], &src);
+		if (err)
+			return err;
+		if ((src & 0x1f) == source)
 			return nr;
 	}
 	return -ENODEV;
@@ -2118,6 +2232,9 @@ show_temp_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 	unsigned int alarm = 0;
 	int nr;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	/*
 	 * For temperatures, there is no fixed mapping from registers to alarm
 	 * bits. Alarm bits are determined by the temperature source mapping.
@@ -2136,7 +2253,12 @@ show_beep(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	struct nct6775_data *data = nct6775_update_device(dev);
-	int nr = data->BEEP_BITS[sattr->index];
+	int nr;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	nr = data->BEEP_BITS[sattr->index];
 
 	return sprintf(buf, "%u\n",
 		       (unsigned int)((data->beeps >> nr) & 0x01));
@@ -2164,10 +2286,10 @@ store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
 		data->beeps |= (1ULL << nr);
 	else
 		data->beeps &= ~(1ULL << nr);
-	data->write_value(data, data->REG_BEEP[regindex],
-			  (data->beeps >> (regindex << 3)) & 0xff);
+	err = nct6775_write_value(data, data->REG_BEEP[regindex],
+				  (data->beeps >> (regindex << 3)) & 0xff);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2178,6 +2300,9 @@ show_temp_beep(struct device *dev, struct device_attribute *attr, char *buf)
 	unsigned int beep = 0;
 	int nr;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	/*
 	 * For temperatures, there is no fixed mapping from registers to beep
 	 * enable bits. Beep enable bits are determined by the temperature
@@ -2220,11 +2345,11 @@ store_temp_beep(struct device *dev, struct device_attribute *attr,
 		data->beeps |= (1ULL << bit);
 	else
 		data->beeps &= ~(1ULL << bit);
-	data->write_value(data, data->REG_BEEP[regindex],
-			  (data->beeps >> (regindex << 3)) & 0xff);
+	err = nct6775_write_value(data, data->REG_BEEP[regindex],
+				  (data->beeps >> (regindex << 3)) & 0xff);
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static umode_t nct6775_in_is_visible(struct kobject *kobj,
@@ -2275,6 +2400,9 @@ show_fan(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->rpm[nr]);
 }
 
@@ -2285,6 +2413,9 @@ show_fan_min(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       data->fan_from_reg_min(data->fan_min[nr],
 					      data->fan_div[nr]));
@@ -2297,6 +2428,9 @@ show_fan_div(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
 }
 
@@ -2382,16 +2516,18 @@ store_fan_min(struct device *dev, struct device_attribute *attr,
 			nr + 1, div_from_reg(data->fan_div[nr]),
 			div_from_reg(new_div));
 		data->fan_div[nr] = new_div;
-		nct6775_write_fan_div_common(data, nr);
+		err = nct6775_write_fan_div_common(data, nr);
+		if (err)
+			goto write_min;
 		/* Give the chip time to sample a new speed value */
 		data->last_updated = jiffies;
 	}
 
 write_min:
-	data->write_value(data, data->REG_FAN_MIN[nr], data->fan_min[nr]);
+	err = nct6775_write_value(data, data->REG_FAN_MIN[nr], data->fan_min[nr]);
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2399,8 +2535,12 @@ show_fan_pulses(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int p = data->fan_pulses[sattr->index];
+	int p;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	p = data->fan_pulses[sattr->index];
 	return sprintf(buf, "%d\n", p ? : 4);
 }
 
@@ -2413,7 +2553,7 @@ store_fan_pulses(struct device *dev, struct device_attribute *attr,
 	int nr = sattr->index;
 	unsigned long val;
 	int err;
-	u8 reg;
+	u16 reg;
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -2424,13 +2564,16 @@ store_fan_pulses(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->fan_pulses[nr] = val & 3;
-	reg = data->read_value(data, data->REG_FAN_PULSES[nr]);
+	err = nct6775_read_value(data, data->REG_FAN_PULSES[nr], &reg);
+	if (err)
+		goto out;
 	reg &= ~(0x03 << data->FAN_PULSE_SHIFT[nr]);
 	reg |= (val & 3) << data->FAN_PULSE_SHIFT[nr];
-	data->write_value(data, data->REG_FAN_PULSES[nr], reg);
+	err = nct6775_write_value(data, data->REG_FAN_PULSES[nr], reg);
+out:
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static umode_t nct6775_fan_is_visible(struct kobject *kobj,
@@ -2497,6 +2640,9 @@ show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
 }
 
@@ -2508,6 +2654,9 @@ show_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sattr->nr;
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[index][nr]));
 }
 
@@ -2528,10 +2677,9 @@ store_temp(struct device *dev, struct device_attribute *attr, const char *buf,
 
 	mutex_lock(&data->update_lock);
 	data->temp[index][nr] = LM75_TEMP_TO_REG(val);
-	nct6775_write_temp(data, data->reg_temp[index][nr],
-			   data->temp[index][nr]);
+	err = nct6775_write_temp(data, data->reg_temp[index][nr], data->temp[index][nr]);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2540,6 +2688,9 @@ show_temp_offset(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->temp_offset[sattr->index] * 1000);
 }
 
@@ -2561,10 +2712,10 @@ store_temp_offset(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->temp_offset[nr] = val;
-	data->write_value(data, data->REG_TEMP_OFFSET[nr], val);
+	err = nct6775_write_value(data, data->REG_TEMP_OFFSET[nr], val);
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2574,6 +2725,9 @@ show_temp_type(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
 }
 
@@ -2586,7 +2740,11 @@ store_temp_type(struct device *dev, struct device_attribute *attr,
 	int nr = sattr->index;
 	unsigned long val;
 	int err;
-	u8 vbat, diode, vbit, dbit;
+	u8 vbit, dbit;
+	u16 vbat, diode;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -2600,8 +2758,17 @@ store_temp_type(struct device *dev, struct device_attribute *attr,
 	data->temp_type[nr] = val;
 	vbit = 0x02 << nr;
 	dbit = data->DIODE_MASK << nr;
-	vbat = data->read_value(data, data->REG_VBAT) & ~vbit;
-	diode = data->read_value(data, data->REG_DIODE) & ~dbit;
+
+	err = nct6775_read_value(data, data->REG_VBAT, &vbat);
+	if (err)
+		goto out;
+	vbat &= ~vbit;
+
+	err = nct6775_read_value(data, data->REG_DIODE, &diode);
+	if (err)
+		goto out;
+	diode &= ~dbit;
+
 	switch (val) {
 	case 1:	/* CPU diode (diode, current mode) */
 		vbat |= vbit;
@@ -2613,11 +2780,13 @@ store_temp_type(struct device *dev, struct device_attribute *attr,
 	case 4:	/* thermistor */
 		break;
 	}
-	data->write_value(data, data->REG_VBAT, vbat);
-	data->write_value(data, data->REG_DIODE, diode);
-
+	err = nct6775_write_value(data, data->REG_VBAT, vbat);
+	if (err)
+		goto out;
+	err = nct6775_write_value(data, data->REG_DIODE, diode);
+out:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static umode_t nct6775_temp_is_visible(struct kobject *kobj,
@@ -2707,6 +2876,9 @@ static ssize_t show_tsi_temp(struct device *dev, struct device_attribute *attr,
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sysfs_emit(buf, "%u\n", tsi_temp_from_reg(data->tsi_temp[sattr->index]));
 }
 
@@ -2746,6 +2918,9 @@ show_pwm_mode(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
 }
 
@@ -2758,7 +2933,7 @@ store_pwm_mode(struct device *dev, struct device_attribute *attr,
 	int nr = sattr->index;
 	unsigned long val;
 	int err;
-	u8 reg;
+	u16 reg;
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -2776,13 +2951,16 @@ store_pwm_mode(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->pwm_mode[nr] = val;
-	reg = data->read_value(data, data->REG_PWM_MODE[nr]);
+	err = nct6775_read_value(data, data->REG_PWM_MODE[nr], &reg);
+	if (err)
+		goto out;
 	reg &= ~data->PWM_MODE_MASK[nr];
 	if (!val)
 		reg |= data->PWM_MODE_MASK[nr];
-	data->write_value(data, data->REG_PWM_MODE[nr], reg);
+	err = nct6775_write_value(data, data->REG_PWM_MODE[nr], reg);
+out:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2792,16 +2970,23 @@ show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	int nr = sattr->nr;
 	int index = sattr->index;
-	int pwm;
+	int err;
+	u16 pwm;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	/*
 	 * For automatic fan control modes, show current pwm readings.
 	 * Otherwise, show the configured value.
 	 */
-	if (index == 0 && data->pwm_enable[nr] > manual)
-		pwm = data->read_value(data, data->REG_PWM_READ[nr]);
-	else
+	if (index == 0 && data->pwm_enable[nr] > manual) {
+		err = nct6775_read_value(data, data->REG_PWM_READ[nr], &pwm);
+		if (err)
+			return err;
+	} else {
 		pwm = data->pwm[index][nr];
+	}
 
 	return sprintf(buf, "%d\n", pwm);
 }
@@ -2819,7 +3004,7 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	int maxval[7]
 	  = { 255, 255, data->pwm[3][nr] ? : 255, 255, 255, 255, 255 };
 	int err;
-	u8 reg;
+	u16 reg;
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -2828,16 +3013,21 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 
 	mutex_lock(&data->update_lock);
 	data->pwm[index][nr] = val;
-	data->write_value(data, data->REG_PWM[index][nr], val);
+	err = nct6775_write_value(data, data->REG_PWM[index][nr], val);
+	if (err)
+		goto out;
 	if (index == 2)	{ /* floor: disable if val == 0 */
-		reg = data->read_value(data, data->REG_TEMP_SEL[nr]);
+		err = nct6775_read_value(data, data->REG_TEMP_SEL[nr], &reg);
+		if (err)
+			goto out;
 		reg &= 0x7f;
 		if (val)
 			reg |= 0x80;
-		data->write_value(data, data->REG_TEMP_SEL[nr], reg);
+		err = nct6775_write_value(data, data->REG_TEMP_SEL[nr], reg);
 	}
+out:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 /* Returns 0 if OK, -EINVAL otherwise */
@@ -2864,40 +3054,54 @@ static int check_trip_points(struct nct6775_data *data, int nr)
 	return 0;
 }
 
-static void pwm_update_registers(struct nct6775_data *data, int nr)
+static int pwm_update_registers(struct nct6775_data *data, int nr)
 {
-	u8 reg;
+	u16 reg;
+	int err;
 
 	switch (data->pwm_enable[nr]) {
 	case off:
 	case manual:
 		break;
 	case speed_cruise:
-		reg = data->read_value(data, data->REG_FAN_MODE[nr]);
+		err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
+		if (err)
+			return err;
 		reg = (reg & ~data->tolerance_mask) |
 		  (data->target_speed_tolerance[nr] & data->tolerance_mask);
-		data->write_value(data, data->REG_FAN_MODE[nr], reg);
-		data->write_value(data, data->REG_TARGET[nr],
-				    data->target_speed[nr] & 0xff);
+		err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
+		if (err)
+			return err;
+		err = nct6775_write_value(data, data->REG_TARGET[nr],
+					  data->target_speed[nr] & 0xff);
+		if (err)
+			return err;
 		if (data->REG_TOLERANCE_H) {
 			reg = (data->target_speed[nr] >> 8) & 0x0f;
 			reg |= (data->target_speed_tolerance[nr] & 0x38) << 1;
-			data->write_value(data,
-					  data->REG_TOLERANCE_H[nr],
-					  reg);
+			err = nct6775_write_value(data, data->REG_TOLERANCE_H[nr], reg);
+			if (err)
+				return err;
 		}
 		break;
 	case thermal_cruise:
-		data->write_value(data, data->REG_TARGET[nr],
-				  data->target_temp[nr]);
+		err = nct6775_write_value(data, data->REG_TARGET[nr], data->target_temp[nr]);
+		if (err)
+			return err;
 		fallthrough;
 	default:
-		reg = data->read_value(data, data->REG_FAN_MODE[nr]);
+		err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
+		if (err)
+			return err;
 		reg = (reg & ~data->tolerance_mask) |
 		  data->temp_tolerance[0][nr];
-		data->write_value(data, data->REG_FAN_MODE[nr], reg);
+		err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
+		if (err)
+			return err;
 		break;
 	}
+
+	return 0;
 }
 
 static ssize_t
@@ -2906,6 +3110,9 @@ show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->pwm_enable[sattr->index]);
 }
 
@@ -2943,15 +3150,22 @@ store_pwm_enable(struct device *dev, struct device_attribute *attr,
 		 * turn off pwm control: select manual mode, set pwm to maximum
 		 */
 		data->pwm[0][nr] = 255;
-		data->write_value(data, data->REG_PWM[0][nr], 255);
+		err = nct6775_write_value(data, data->REG_PWM[0][nr], 255);
+		if (err)
+			goto out;
 	}
-	pwm_update_registers(data, nr);
-	reg = data->read_value(data, data->REG_FAN_MODE[nr]);
+	err = pwm_update_registers(data, nr);
+	if (err)
+		goto out;
+	err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
+	if (err)
+		goto out;
 	reg &= 0x0f;
 	reg |= pwm_enable_to_reg(val) << 4;
-	data->write_value(data, data->REG_FAN_MODE[nr], reg);
+	err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
+out:
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -2978,6 +3192,9 @@ show_pwm_temp_sel(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return show_pwm_temp_sel_common(data, buf, data->pwm_temp_sel[index]);
 }
 
@@ -2989,7 +3206,11 @@ store_pwm_temp_sel(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 	unsigned long val;
-	int err, reg, src;
+	int err, src;
+	u16 reg;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -3002,13 +3223,16 @@ store_pwm_temp_sel(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&data->update_lock);
 	src = data->temp_src[val - 1];
 	data->pwm_temp_sel[nr] = src;
-	reg = data->read_value(data, data->REG_TEMP_SEL[nr]);
+	err = nct6775_read_value(data, data->REG_TEMP_SEL[nr], &reg);
+	if (err)
+		goto out;
 	reg &= 0xe0;
 	reg |= src;
-	data->write_value(data, data->REG_TEMP_SEL[nr], reg);
+	err = nct6775_write_value(data, data->REG_TEMP_SEL[nr], reg);
+out:
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3019,6 +3243,9 @@ show_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return show_pwm_temp_sel_common(data, buf,
 					data->pwm_weight_temp_sel[index]);
 }
@@ -3031,7 +3258,11 @@ store_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 	unsigned long val;
-	int err, reg, src;
+	int err, src;
+	u16 reg;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -3047,19 +3278,24 @@ store_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
 	if (val) {
 		src = data->temp_src[val - 1];
 		data->pwm_weight_temp_sel[nr] = src;
-		reg = data->read_value(data, data->REG_WEIGHT_TEMP_SEL[nr]);
+		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[nr], &reg);
+		if (err)
+			goto out;
 		reg &= 0xe0;
 		reg |= (src | 0x80);
-		data->write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
+		err = nct6775_write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
 	} else {
 		data->pwm_weight_temp_sel[nr] = 0;
-		reg = data->read_value(data, data->REG_WEIGHT_TEMP_SEL[nr]);
+		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[nr], &reg);
+		if (err)
+			goto out;
 		reg &= 0x7f;
-		data->write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
+		err = nct6775_write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
 	}
+out:
 	mutex_unlock(&data->update_lock);
 
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3068,6 +3304,9 @@ show_target_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->target_temp[sattr->index] * 1000);
 }
 
@@ -3090,9 +3329,9 @@ store_target_temp(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->target_temp[nr] = val;
-	pwm_update_registers(data, nr);
+	err = pwm_update_registers(data, nr);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3102,6 +3341,9 @@ show_target_speed(struct device *dev, struct device_attribute *attr, char *buf)
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       fan_from_reg16(data->target_speed[nr],
 				      data->fan_div[nr]));
@@ -3127,9 +3369,9 @@ store_target_speed(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->target_speed[nr] = speed;
-	pwm_update_registers(data, nr);
+	err = pwm_update_registers(data, nr);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3141,6 +3383,9 @@ show_temp_tolerance(struct device *dev, struct device_attribute *attr,
 	int nr = sattr->nr;
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->temp_tolerance[index][nr] * 1000);
 }
 
@@ -3165,13 +3410,11 @@ store_temp_tolerance(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&data->update_lock);
 	data->temp_tolerance[index][nr] = val;
 	if (index)
-		pwm_update_registers(data, nr);
+		err = pwm_update_registers(data, nr);
 	else
-		data->write_value(data,
-				  data->REG_CRITICAL_TEMP_TOLERANCE[nr],
-				  val);
+		err = nct6775_write_value(data, data->REG_CRITICAL_TEMP_TOLERANCE[nr], val);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 /*
@@ -3188,8 +3431,12 @@ show_speed_tolerance(struct device *dev, struct device_attribute *attr,
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	int nr = sattr->index;
-	int target = data->target_speed[nr];
-	int tolerance = 0;
+	int target, tolerance = 0;
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	target = data->target_speed[nr];
 
 	if (target) {
 		int low = target - data->target_speed_tolerance[nr];
@@ -3239,9 +3486,9 @@ store_speed_tolerance(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->target_speed_tolerance[nr] = val;
-	pwm_update_registers(data, nr);
+	err = pwm_update_registers(data, nr);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 SENSOR_TEMPLATE_2(pwm, "pwm%d", S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 0);
@@ -3268,6 +3515,9 @@ show_weight_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sattr->nr;
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->weight_temp[index][nr] * 1000);
 }
 
@@ -3290,9 +3540,9 @@ store_weight_temp(struct device *dev, struct device_attribute *attr,
 
 	mutex_lock(&data->update_lock);
 	data->weight_temp[index][nr] = val;
-	data->write_value(data, data->REG_WEIGHT_TEMP[index][nr], val);
+	err = nct6775_write_value(data, data->REG_WEIGHT_TEMP[index][nr], val);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 SENSOR_TEMPLATE(pwm_weight_temp_sel, "pwm%d_weight_temp_sel", S_IWUSR | S_IRUGO,
@@ -3316,6 +3566,9 @@ show_fan_time(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sattr->nr;
 	int index = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n",
 		       step_time_from_reg(data->fan_time[index][nr],
 					  data->pwm_mode[nr]));
@@ -3339,9 +3592,9 @@ store_fan_time(struct device *dev, struct device_attribute *attr,
 	val = step_time_to_reg(val, data->pwm_mode[nr]);
 	mutex_lock(&data->update_lock);
 	data->fan_time[index][nr] = val;
-	data->write_value(data, data->REG_FAN_TIME[index][nr], val);
+	err = nct6775_write_value(data, data->REG_FAN_TIME[index][nr], val);
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3350,6 +3603,9 @@ show_auto_pwm(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", data->auto_pwm[sattr->nr][sattr->index]);
 }
 
@@ -3363,7 +3619,7 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 	int point = sattr->index;
 	unsigned long val;
 	int err;
-	u8 reg;
+	u16 reg;
 
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
@@ -3381,21 +3637,20 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&data->update_lock);
 	data->auto_pwm[nr][point] = val;
 	if (point < data->auto_pwm_num) {
-		data->write_value(data,
-				    NCT6775_AUTO_PWM(data, nr, point),
-				    data->auto_pwm[nr][point]);
+		err = nct6775_write_value(data, NCT6775_AUTO_PWM(data, nr, point),
+					  data->auto_pwm[nr][point]);
 	} else {
 		switch (data->kind) {
 		case nct6775:
 			/* disable if needed (pwm == 0) */
-			reg = data->read_value(data,
-					       NCT6775_REG_CRITICAL_ENAB[nr]);
+			err = nct6775_read_value(data, NCT6775_REG_CRITICAL_ENAB[nr], &reg);
+			if (err)
+				break;
 			if (val)
 				reg |= 0x02;
 			else
 				reg &= ~0x02;
-			data->write_value(data, NCT6775_REG_CRITICAL_ENAB[nr],
-					  reg);
+			err = nct6775_write_value(data, NCT6775_REG_CRITICAL_ENAB[nr], reg);
 			break;
 		case nct6776:
 			break; /* always enabled, nothing to do */
@@ -3409,22 +3664,22 @@ store_auto_pwm(struct device *dev, struct device_attribute *attr,
 		case nct6796:
 		case nct6797:
 		case nct6798:
-			data->write_value(data, data->REG_CRITICAL_PWM[nr],
-					    val);
-			reg = data->read_value(data,
-					data->REG_CRITICAL_PWM_ENABLE[nr]);
+			err = nct6775_write_value(data, data->REG_CRITICAL_PWM[nr], val);
+			if (err)
+				break;
+			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[nr], &reg);
+			if (err)
+				break;
 			if (val == 255)
 				reg &= ~data->CRITICAL_PWM_ENABLE_MASK;
 			else
 				reg |= data->CRITICAL_PWM_ENABLE_MASK;
-			data->write_value(data,
-					  data->REG_CRITICAL_PWM_ENABLE[nr],
-					  reg);
+			err = nct6775_write_value(data, data->REG_CRITICAL_PWM_ENABLE[nr], reg);
 			break;
 		}
 	}
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static ssize_t
@@ -3435,6 +3690,9 @@ show_auto_temp(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sattr->nr;
 	int point = sattr->index;
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	/*
 	 * We don't know for sure if the temperature is signed or unsigned.
 	 * Assume it is unsigned.
@@ -3462,15 +3720,14 @@ store_auto_temp(struct device *dev, struct device_attribute *attr,
 	mutex_lock(&data->update_lock);
 	data->auto_temp[nr][point] = DIV_ROUND_CLOSEST(val, 1000);
 	if (point < data->auto_pwm_num) {
-		data->write_value(data,
-				    NCT6775_AUTO_TEMP(data, nr, point),
-				    data->auto_temp[nr][point]);
+		err = nct6775_write_value(data, NCT6775_AUTO_TEMP(data, nr, point),
+					  data->auto_temp[nr][point]);
 	} else {
-		data->write_value(data, data->REG_CRITICAL_TEMP[nr],
-				    data->auto_temp[nr][point]);
+		err = nct6775_write_value(data, data->REG_CRITICAL_TEMP[nr],
+					  data->auto_temp[nr][point]);
 	}
 	mutex_unlock(&data->update_lock);
-	return count;
+	return err ? : count;
 }
 
 static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
@@ -3719,16 +3976,21 @@ static const struct attribute_group nct6775_group_other = {
 	.is_visible = nct6775_other_is_visible,
 };
 
-static inline void nct6775_init_device(struct nct6775_data *data)
+static inline int nct6775_init_device(struct nct6775_data *data)
 {
-	int i;
-	u8 tmp, diode;
+	int i, err;
+	u16 tmp, diode;
 
 	/* Start monitoring if needed */
 	if (data->REG_CONFIG) {
-		tmp = data->read_value(data, data->REG_CONFIG);
-		if (!(tmp & 0x01))
-			data->write_value(data, data->REG_CONFIG, tmp | 0x01);
+		err = nct6775_read_value(data, data->REG_CONFIG, &tmp);
+		if (err)
+			return err;
+		if (!(tmp & 0x01)) {
+			err = nct6775_write_value(data, data->REG_CONFIG, tmp | 0x01);
+			if (err)
+				return err;
+		}
 	}
 
 	/* Enable temperature sensors if needed */
@@ -3737,18 +3999,29 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 			continue;
 		if (!data->reg_temp_config[i])
 			continue;
-		tmp = data->read_value(data, data->reg_temp_config[i]);
-		if (tmp & 0x01)
-			data->write_value(data, data->reg_temp_config[i],
-					    tmp & 0xfe);
+		err = nct6775_read_value(data, data->reg_temp_config[i], &tmp);
+		if (err)
+			return err;
+		if (tmp & 0x01) {
+			err = nct6775_write_value(data, data->reg_temp_config[i], tmp & 0xfe);
+			if (err)
+				return err;
+		}
 	}
 
 	/* Enable VBAT monitoring if needed */
-	tmp = data->read_value(data, data->REG_VBAT);
-	if (!(tmp & 0x01))
-		data->write_value(data, data->REG_VBAT, tmp | 0x01);
+	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
+	if (err)
+		return err;
+	if (!(tmp & 0x01)) {
+		err = nct6775_write_value(data, data->REG_VBAT, tmp | 0x01);
+		if (err)
+			return err;
+	}
 
-	diode = data->read_value(data, data->REG_DIODE);
+	err = nct6775_read_value(data, data->REG_DIODE, &diode);
+	if (err)
+		return err;
 
 	for (i = 0; i < data->temp_fixed_num; i++) {
 		if (!(data->have_temp_fixed & BIT(i)))
@@ -3759,6 +4032,8 @@ static inline void nct6775_init_device(struct nct6775_data *data)
 		else				/* thermistor */
 			data->temp_type[i] = 4;
 	}
+
+	return 0;
 }
 
 static void
@@ -3982,18 +4257,20 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
 }
 
-static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
-			     int *available, int *mask)
+static int add_temp_sensors(struct nct6775_data *data, const u16 *regp,
+			    int *available, int *mask)
 {
-	int i;
-	u8 src;
+	int i, err;
+	u16 src;
 
 	for (i = 0; i < data->pwm_num && *available; i++) {
 		int index;
 
 		if (!regp[i])
 			continue;
-		src = data->read_value(data, regp[i]);
+		err = nct6775_read_value(data, regp[i], &src);
+		if (err)
+			return err;
 		src &= 0x1f;
 		if (!src || (*mask & BIT(src)))
 			continue;
@@ -4001,12 +4278,30 @@ static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 			continue;
 
 		index = __ffs(*available);
-		data->write_value(data, data->REG_TEMP_SOURCE[index], src);
+		err = nct6775_write_value(data, data->REG_TEMP_SOURCE[index], src);
+		if (err)
+			return err;
 		*available &= ~BIT(index);
 		*mask |= BIT(src);
 	}
+
+	return 0;
 }
 
+static const struct regmap_config nct6775_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_reg_read,
+	.reg_write = nct6775_reg_write,
+};
+
+static const struct regmap_config nct6775_wmi_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_wmi_reg_read,
+	.reg_write = nct6775_wmi_reg_write,
+};
+
 static int nct6775_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -4014,7 +4309,8 @@ static int nct6775_probe(struct platform_device *pdev)
 	struct nct6775_data *data;
 	struct resource *res;
 	int i, s, err = 0;
-	int src, mask, available;
+	int mask, available;
+	u16 src;
 	const u16 *reg_temp, *reg_temp_over, *reg_temp_hyst, *reg_temp_config;
 	const u16 *reg_temp_mon, *reg_temp_alternate, *reg_temp_crit;
 	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
@@ -4023,6 +4319,7 @@ static int nct6775_probe(struct platform_device *pdev)
 	struct attribute_group *group;
 	struct device *hwmon_dev;
 	struct sensor_template_group tsi_temp_tg;
+	const struct regmap_config *regmapcfg;
 	int num_attr_groups = 0;
 
 	if (sio_data->access == access_direct) {
@@ -4042,13 +4339,15 @@ static int nct6775_probe(struct platform_device *pdev)
 
 	if (sio_data->access == access_direct) {
 		data->addr = res->start;
-		data->read_value = nct6775_read_value;
-		data->write_value = nct6775_write_value;
+		regmapcfg = &nct6775_regmap_config;
 	} else {
-		data->read_value = nct6775_wmi_read_value;
-		data->write_value = nct6775_wmi_write_value;
+		regmapcfg = &nct6775_wmi_regmap_config;
 	}
 
+	data->regmap = devm_regmap_init(dev, NULL, data, regmapcfg);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
 	mutex_init(&data->update_lock);
 	data->name = nct6775_device_names[data->kind];
 	data->bank = 0xff;		/* Force initial bank selection */
@@ -4596,7 +4895,10 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (reg_temp[i] == 0)
 			continue;
 
-		src = data->read_value(data, data->REG_TEMP_SOURCE[i]) & 0x1f;
+		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[i], &src);
+		if (err)
+			return err;
+		src &= 0x1f;
 		if (!src || (mask & BIT(src)))
 			available |= BIT(i);
 
@@ -4607,8 +4909,12 @@ static int nct6775_probe(struct platform_device *pdev)
 	 * Now find unmonitored temperature registers and enable monitoring
 	 * if additional monitoring registers are available.
 	 */
-	add_temp_sensors(data, data->REG_TEMP_SEL, &available, &mask);
-	add_temp_sensors(data, data->REG_WEIGHT_TEMP_SEL, &available, &mask);
+	err = add_temp_sensors(data, data->REG_TEMP_SEL, &available, &mask);
+	if (err)
+		return err;
+	err = add_temp_sensors(data, data->REG_WEIGHT_TEMP_SEL, &available, &mask);
+	if (err)
+		return err;
 
 	mask = 0;
 	s = NUM_TEMP_FIXED;	/* First dynamic temperature attribute */
@@ -4616,7 +4922,10 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (reg_temp[i] == 0)
 			continue;
 
-		src = data->read_value(data, data->REG_TEMP_SOURCE[i]) & 0x1f;
+		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[i], &src);
+		if (err)
+			return err;
+		src &= 0x1f;
 		if (!src || (mask & BIT(src)))
 			continue;
 
@@ -4676,7 +4985,10 @@ static int nct6775_probe(struct platform_device *pdev)
 		if (reg_temp_mon[i] == 0)
 			continue;
 
-		src = data->read_value(data, data->REG_TEMP_SEL[i]) & 0x1f;
+		err = nct6775_read_value(data, data->REG_TEMP_SEL[i], &src);
+		if (err)
+			return err;
+		src &= 0x1f;
 		if (!src)
 			continue;
 
@@ -4760,12 +5072,19 @@ static int nct6775_probe(struct platform_device *pdev)
 
 	/* Check which TSIx_TEMP registers are active */
 	for (i = 0; i < num_reg_tsi_temp; i++) {
-		if (data->read_value(data, data->REG_TSI_TEMP[i]))
+		u16 tmp;
+
+		err = nct6775_read_value(data, data->REG_TSI_TEMP[i], &tmp);
+		if (err)
+			return err;
+		if (tmp)
 			data->have_tsi_temp |= BIT(i);
 	}
 
 	/* Initialize the chip */
-	nct6775_init_device(data);
+	err = nct6775_init_device(data);
+	if (err)
+		return err;
 
 	err = sio_data->sio_enter(sio_data);
 	if (err)
@@ -4841,7 +5160,9 @@ static int nct6775_probe(struct platform_device *pdev)
 	sio_data->sio_exit(sio_data);
 
 	/* Read fan clock dividers immediately */
-	nct6775_init_fan_common(dev, data);
+	err = nct6775_init_fan_common(dev, data);
+	if (err)
+		return err;
 
 	/* Register sysfs hooks */
 	group = nct6775_create_attr_group(dev, &nct6775_pwm_template_group,
@@ -4904,17 +5225,33 @@ static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
 
 static int __maybe_unused nct6775_suspend(struct device *dev)
 {
+	int err;
+	u16 tmp;
 	struct nct6775_data *data = nct6775_update_device(dev);
 
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	mutex_lock(&data->update_lock);
-	data->vbat = data->read_value(data, data->REG_VBAT);
+	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
+	if (err)
+		goto out;
+	data->vbat = tmp;
 	if (data->kind == nct6775) {
-		data->fandiv1 = data->read_value(data, NCT6775_REG_FANDIV1);
-		data->fandiv2 = data->read_value(data, NCT6775_REG_FANDIV2);
+		err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &tmp);
+		if (err)
+			goto out;
+		data->fandiv1 = tmp;
+
+		err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &tmp);
+		if (err)
+			goto out;
+		data->fandiv2 = tmp;
 	}
+out:
 	mutex_unlock(&data->update_lock);
 
-	return 0;
+	return err;
 }
 
 static int __maybe_unused nct6775_resume(struct device *dev)
@@ -4949,18 +5286,21 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 		if (!(data->have_in & BIT(i)))
 			continue;
 
-		data->write_value(data, data->REG_IN_MINMAX[0][i],
-				  data->in[i][1]);
-		data->write_value(data, data->REG_IN_MINMAX[1][i],
-				  data->in[i][2]);
+		err = nct6775_write_value(data, data->REG_IN_MINMAX[0][i], data->in[i][1]);
+		if (err)
+			goto abort;
+		err = nct6775_write_value(data, data->REG_IN_MINMAX[1][i], data->in[i][2]);
+		if (err)
+			goto abort;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
 		if (!(data->has_fan_min & BIT(i)))
 			continue;
 
-		data->write_value(data, data->REG_FAN_MIN[i],
-				  data->fan_min[i]);
+		err = nct6775_write_value(data, data->REG_FAN_MIN[i], data->fan_min[i]);
+		if (err)
+			goto abort;
 	}
 
 	for (i = 0; i < NUM_TEMP; i++) {
@@ -4968,16 +5308,23 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 			continue;
 
 		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
-			if (data->reg_temp[j][i])
-				nct6775_write_temp(data, data->reg_temp[j][i],
-						   data->temp[j][i]);
+			if (data->reg_temp[j][i]) {
+				err = nct6775_write_temp(data, data->reg_temp[j][i],
+							 data->temp[j][i]);
+				if (err)
+					goto abort;
+			}
 	}
 
 	/* Restore other settings */
-	data->write_value(data, data->REG_VBAT, data->vbat);
+	err = nct6775_write_value(data, data->REG_VBAT, data->vbat);
+	if (err)
+		goto abort;
 	if (data->kind == nct6775) {
-		data->write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
-		data->write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
+		err = nct6775_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
+		if (err)
+			goto abort;
+		err = nct6775_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
 	}
 
 abort:
-- 
2.36.0

