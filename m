Return-Path: <openbmc+bounces-650-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0528DB7F014
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp06WCGz3cDN;
	Wed, 17 Sep 2025 16:01:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088904;
	cv=none; b=BPWQeokG4bqsX+p1iSV9cM5FqpjOrhFEARla5I/hMP9uNMbLKlwKFLtdtZae6gQTSutM4YopfuLbu1GIZIcX6yqIWM2bPXR3yYgT2NFbsUkmWAC0aMA0rcKtELVp9NvZbzt24xBf2P+jcn7QFw3eW05o+87wMJsu6l6T+mdXG0jqKjnQdbBJmJ7hNrr4Wia+dmx1aGByrkxpBvD8d6BkAP3BrRhVmizzq0PgR38jiBmbwx8INpjh1egUJNxhjOeVPVbGfUHVkIM8KYeAxPQE/dqe7eGBz2dcIZPipPuWRE0XSU/riaOpuJQ4K6ZKwRPPqQtiKN3AP21vs3jv1mu5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088904; c=relaxed/relaxed;
	bh=wjEWwCMi2wYX62gODcUYlytnBtN5kdpwItst7b9U6Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEFpFHTcCpn9Ng2twnZc0EeCpjBKbht26o5x0gOJ2JPIBpcb6WxRpICmKQlsq8s/TOMXDVhJMPzIYD/0IubihoKeAwL3IPRet+H3oxiJ2JFxCo2C7NUAFJ106SmUG22Kca5aO8cP8De5JZClsBBOgO+Zpi/ORfwztzX7bROSRLYDRWTuyXHdk5ie9C7wTtvmWSjahuFYKQQOTtHpCZxVohaGC7+ciXJohAn0z7yrYTbjd/eIXao378w4b0WspCrQ9G99UZcVY2zcHi6O3SWcGtSJNy+2F3lOjcecYldRpyPLV8eOQl/zVPe642omGt7HVGx+McPNEZrnoJxrX1tBcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YiOlIstO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YiOlIstO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp00CBrz3c7q
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:43 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-267a5aeb9f1so18783135ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088902; x=1758693702; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjEWwCMi2wYX62gODcUYlytnBtN5kdpwItst7b9U6Is=;
        b=YiOlIstOGV4PKwQP/swhU61z1NDUvXaxhLJ/OGA0Y+nqobJE1mCCkT7MikBDceumlG
         Xl4KftZyFtwW5kMrg9MuX8TNhdW1TWppBjM4habgvCFuD/5/ao8n/pcJuTJmfb+mP2OJ
         +soM5BVJq1Mu6Cki7c1PKhYiOOUFVkLzzGHPcmoyDlzA9clmVlUUanWTnXgZN88e75xS
         9jdY57C344wHqvmkeZEJs4gcUeagF5qmz+7F+m/CBTdcIepGcDGRmMm+P8i9OBPufI40
         tDlPFCBBBm34wLr1olD/1Gaj7mvpJ7toNJpKkIOpWk7FK39tKtf3HwsMEApo9i9jc1a5
         wgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088902; x=1758693702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjEWwCMi2wYX62gODcUYlytnBtN5kdpwItst7b9U6Is=;
        b=PLDZDaUbfp08sK7hOPyupJHAfyRIkUje5GlZhRCQS3bd3oJtp7CQVB0PKo3ck4t92E
         J9mctJ6AOLgNwW8RkpyTjphCyEX5RCgK2I/SmhkeJeLo/gWgAr33ZbiNFiSGXattgyV1
         3U4FNUEvgxL6NSrzr9iwDLB7IM5kCogNMvuxyAlxTfqfayhpZLWB9zFbtJ8H0Gza1/44
         FN/80qURQiG+KV7RCd3mskfjHtimOanO1CnexBvR7KbiQy7qzEnESu+Vd3REHJGuMcIs
         D8Hc7XeIAK0JJM8yJcBIzgNNQYntC9sG/UYqJpcaqmEcI9WuefWj/otABsw9xWGmzMsN
         EPlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5aAtZpkx15MpYY6klrHB2zfXVTP7XvVIeBUeZ/LTxFRrtFFwUEIG9gsFXS7vIJELGD/eKwfVB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJnrLl2OAZvsTFdPK02qVTJKX9cZtCk2SJVtHVuQ3cifD8OD//
	FrmK+4HIvISYF2Db8GuVUTHoZLuKGdv0zn9ZdawFdt94N8cczLqj+Wl4
X-Gm-Gg: ASbGncsyyoXrdCf8W/l0Vnb1Eeh2/ymtYwCTZItmSLUlG2gQ9mEJnC8RjU0Dg2lKHM1
	D5VVG8a3yTvQxBwnodwD+731wm7jbqAAN2VRZl0eCXdtLEH0XlKLb7gRr0ptbbZSNSiTsTNY+CU
	Cjt3zeWnzYMivTGGgT6+Kvag3ZlQ3sC0QfBtdlzUpUUUmWXZXqfxJgHMFX9ATN/ZWWyrXazf0Od
	gjU34ac3Bm/Bm+wGeNxvam0YKAG797eLhdbGnQJ+RVLmk9jrzx4gQ1dO8xwk4WV++EH7Tj9Avbc
	rnCmyVepbi4gHX2swK2Z69X1LBHutDADU4yOi8aFjiftbvSKtBo6xHbsFurJE9K1AGnEMD/JJXy
	mZ5g9pINkrS+GxHI20lQelIPKHoNsBPFdwd9PEl4CbyrT2yMfeuJrAcx22qbM9qYON+t/Icn0q+
	hYw9jD0TAMTyK4RuVrr37pr+YkSg==
X-Google-Smtp-Source: AGHT+IGoMedwjA0PKfAXMWPOYpPp/tQSJF6zP/aS62p5xXetV8nqPOtdBhM1YHrIaIfCwbqQyQ2aZQ==
X-Received: by 2002:a17:902:c94b:b0:251:493c:43e9 with SMTP id d9443c01a7336-268118a4634mr10817765ad.3.1758088901779;
        Tue, 16 Sep 2025 23:01:41 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:41 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 3/9] hwmon: (ina238) Modify the calculation formula to adapt to different chips
Date: Wed, 17 Sep 2025 14:01:28 +0800
Message-ID: <20250917060134.2383005-4-peteryin.openbmc@gmail.com>
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

Modify the calculation formula to adapt to different chips.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
Link: https://lore.kernel.org/r/20250506053741.4837-4-wenliang202407@163.com
[groeck: Fixed checkpatch issue (space before and after arithmetic operators)]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 0d9f596b1fe3445040c05d0fa3842224fc77810b)
---
 drivers/hwmon/ina238.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 48b61328eb35..a4a41742786b 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -270,10 +270,10 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		regval = (s16)regval;
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
-			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) /
-			       (1000 * (4 - data->gain + 1));
+			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
+					data->gain / (1000 * 4);
 		else
-			*val = (regval * INA238_BUS_VOLTAGE_LSB) / 1000;
+			*val = (regval * data->config->bus_voltage_lsb) / 1000;
 		break;
 	case hwmon_in_max_alarm:
 	case hwmon_in_min_alarm:
@@ -298,8 +298,8 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 0:
 		/* signed value, clamp to max range +/-163 mV */
 		regval = clamp_val(val, -163, 163);
-		regval = (regval * 1000 * (4 - data->gain + 1)) /
-			 INA238_SHUNT_VOLTAGE_LSB;
+		regval = (regval * 1000 * 4) /
+			 (INA238_SHUNT_VOLTAGE_LSB * data->gain);
 		regval = clamp_val(regval, S16_MIN, S16_MAX);
 
 		switch (attr) {
@@ -315,7 +315,7 @@ static int ina238_write_in(struct device *dev, u32 attr, int channel,
 	case 1:
 		/* signed value, positive values only. Clamp to max 102.396 V */
 		regval = clamp_val(val, 0, 102396);
-		regval = (regval * 1000) / INA238_BUS_VOLTAGE_LSB;
+		regval = (regval * 1000) / data->config->bus_voltage_lsb;
 		regval = clamp_val(regval, 0, S16_MAX);
 
 		switch (attr) {
@@ -370,8 +370,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -381,8 +381,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *
-				data->gain, 20 * data->rshunt);
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -395,8 +395,8 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *
-			       data->gain, 20 * data->rshunt);
+		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
 		break;
@@ -428,8 +428,8 @@ static int ina238_write_power(struct device *dev, u32 attr, long val)
 	 * register.
 	 */
 	regval = clamp_val(val, 0, LONG_MAX);
-	regval = div_u64(val * 20ULL * data->rshunt,
-			 1000ULL * INA238_FIXED_SHUNT * data->gain);
+	regval = div_u64(val * 4 * 100 * data->rshunt, data->config->power_calculate_factor *
+			1000ULL * INA238_FIXED_SHUNT * data->gain);
 	regval = clamp_val(regval >> 8, 0, U16_MAX);
 
 	return regmap_write(data->regmap, INA238_POWER_LIMIT, regval);
@@ -446,17 +446,17 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 		err = regmap_read(data->regmap, INA238_DIE_TEMP, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
+						(s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
 		if (err)
 			return err;
-
-		/* Signed, bits 15-4 of register, result in mC */
-		*val = ((s16)regval >> 4) * INA238_DIE_TEMP_LSB;
+		/* Signed, result in mC */
+		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
+						(s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -480,9 +480,10 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 	if (attr != hwmon_temp_max)
 		return -EOPNOTSUPP;
 
-	/* Signed, bits 15-4 of register */
-	regval = (val / INA238_DIE_TEMP_LSB) << 4;
-	regval = clamp_val(regval, S16_MIN, S16_MAX) & 0xfff0;
+	/* Signed */
+	regval = clamp_val(val, -40000, 125000);
+	regval = div_s64(val * 10000, data->config->temp_lsb) << data->config->temp_shift;
+	regval = clamp_val(regval, S16_MIN, S16_MAX) & (0xffff << data->config->temp_shift);
 
 	return regmap_write(data->regmap, INA238_TEMP_LIMIT, regval);
 }
-- 
2.43.0


