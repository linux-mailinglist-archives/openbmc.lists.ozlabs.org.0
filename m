Return-Path: <openbmc+bounces-652-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1FB7F019
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp42GtYz3cb1;
	Wed, 17 Sep 2025 16:01:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088908;
	cv=none; b=dfAj81npqT1uVvzBKK9KecGuz7WccjKh0zJqDL3H0XjaSHDZzXCw1eNtvhlySHXABh9/PtrVox1Q+OL/AtMr+XyoQm7+T7LrRe9zsdisyMUVU42P+s8CNw01K3zGKn7w2Qniw+NLdXtQnVuShANGrq7sWZK/sOThshA455KxDZGN0mv4sS/1+RYQ0d9kF0D61cmIZZkMu97CYNgL2ATPi0kywh1yu36n8vMW2fUUkTkY0HF6WegzRMCMVlFeol8ye53IYuNsZ5LYRWO7PoWW+yfzZhIhNCZFyAmFBqsAIsZdreFvwV5tVclkYKl+QTV6iPjxBmdnSsJcC05dAGw7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088908; c=relaxed/relaxed;
	bh=vQmuTAU9a5kL1f9Gro6CBTDp9AQ82yQASTv9Eui9FM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCFAAehRgN8inLQtGll0TPwg3sMUrDibHC+Z0WDIha9SaoIU6y5PDbvPr7+Zv0I0F2o+vP8jMu6r4dETwFyQE9nAQJ4Sq80KEGXsU9FhNj2AARaGPeAgapKdxeuzQQiv+C8PioQOF8SvjbuFdRXoEwmf0uQxplbDTdi7U96ZWWqwihPqr9Ak62PPMBiLYFJdoSlZ930Acrsb1tFBj5icSi7Vedzp7hpQaHVmHduA23E9dM9gQ+iPpuggSpCeQmlqLipkiFDLIfmTf0kGjpeuDlkuRqGpJYPsJt4hNOUE9ar+c7suxYoee6kTP0/2OMxfw4ALO5TvO03IHo0fu2Ueng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TaLSWWl5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TaLSWWl5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp34pHpz3cZ9
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:47 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so4210979a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088906; x=1758693706; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQmuTAU9a5kL1f9Gro6CBTDp9AQ82yQASTv9Eui9FM4=;
        b=TaLSWWl5738rIHDR8XQZi90OCRGEH9D2cV5v643Om6pT8VWWLXl9uj0Gh0qjWLm3Ve
         bc/JkdFcJ9PCOCrp95sjPlu0LSngf+LX0ZvnffzcmEOWn1RutMkYBLZtgQrAFU6GZAzU
         uU5s4yfe5WZk3q8mz8SCZ8hS+g7FKfKmxSsiLr4+mDEzYJd5I9NX0ObF6L3otGckKpLi
         bBL5wukuQKZuNaDJj5ES6FhnC+a5ItFOH0j6UQxdt9lYVhLZ8ssHkzhvBVOI30JuKgwF
         BVx1EDM0S5mJLeua+PrkYraCMs0gu7kcqV+GnGfcLJy+/UMaEGJaqhxf0Msdr3BScAZg
         uHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088906; x=1758693706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQmuTAU9a5kL1f9Gro6CBTDp9AQ82yQASTv9Eui9FM4=;
        b=CSReHLIrvstbqAe1DM1alhK89k3U9TFeGTv2hAn5ygJWQUHzqNavgU+5GnkVBLJhqQ
         6BXksNRFlsr8bSM7ROuwhBBMri+tLrREQ7YvAzVc8Zj/KtGOrbYo+G9qk+5ARjr4uLMW
         9mFvrsbu65TpaEesRAVuhHSPdh1SP0luWN6/0FtsxqsOkG0k+jCJ52mo7pRkjBsB+FdG
         ZO2yM1QGg6m9/vdIiFCfJ0TFsf98vA28DLPH8XncMH/HnHs6AleryLsorb+osk8OF1/y
         wInoxq6Z4tz5TxUx5tD1c7I1WOKEWefO3QsdsCOWWlBg90QifdqAznAXkJjE3y1Rhb6u
         5ElQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLQkq5OKhMoYiIUcXnvB6W4sNhRogPwB0+71bGme7WkCOZGfsLsAC6EbmGnFr3C8qtp02seYx0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzV5Gt5CSYOybJ6UrjaGYXFKFYBHjExoUcaqUyKQIde5bmLEed+
	tNjnJvBCjKbqmNu6M5+PL9PRHyUjzvC29M4ILPN5mEoLsAUMjk8JgBrDyRl/8A==
X-Gm-Gg: ASbGncs3qEGGuKyiss/GJJ73qsTy8RVadmpCylq9qdXjATsb2WSJO47l9Rg5By25HuY
	izFH2aQKuG9eSMqu32NvC+0eTbT1dO9hHdukAg32vgXP9Ney9F0BDYs6er38DcvRD0+ZUsWVoQb
	KEoxfbT3AZgGmlJTiM7V823xoLkjF20ht+akL0zG2o8kRmlKpOeFhjnbNSUWblroCd1N+n31DAV
	3SfXuXW7jTB7Hu36me/fwT9plzHzBJiQnYWrriv6VafFyOvUnfaCq+egeAQFhZSlqhXuIrXzJz6
	TrZVKkMnf9rG+Y7SxVevCiDbdZOKyYyqoEZOWPTYDW8xRS1mwFpWmsqkr2PPttR4UtabrHDa2Om
	cZt7+UD0+L44By6xlyhbvxEiUHBu4IIhxw3Zzr0UfcLGMfF7/LsD9EI+gJnLqOaaEtiQjIKdxSI
	EZgdEUDRTOxvVONO2Pby+mDoU24YWTIdEq0X4F
X-Google-Smtp-Source: AGHT+IHWKb8wFzt+Jyig9tbnvhEjvYFDIQu0HtQb7zo/aUGDqvZSbwi3bF1jFmiVhq4BhMUCbYZBAA==
X-Received: by 2002:a17:902:d48b:b0:24d:1f99:713a with SMTP id d9443c01a7336-268136f9d6bmr12257805ad.31.1758088904386;
        Tue, 16 Sep 2025 23:01:44 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:43 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 5/9] hwmon: (ina238) Fix inconsistent whitespace
Date: Wed, 17 Sep 2025 14:01:30 +0800
Message-ID: <20250917060134.2383005-6-peteryin.openbmc@gmail.com>
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

Some purely cosmetic changes in ina238.c:

 - When aligning definitions, do so consistently with tab stop of 8.
 - Use spaces instead of tabs around operators.
 - Align wrapped lines.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
Link: https://lore.kernel.org/r/20250718-ina228-v2-1-227feb62f709@pengutronix.de
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit cde1cc6b6079fa24c236bff3d58f7f8b4b1fc1bb)
---
 drivers/hwmon/ina238.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 9a5fd16a4ec2..5e43bbe8817d 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -41,7 +41,7 @@
 
 #define INA238_CONFIG_ADCRANGE		BIT(4)
 #define SQ52206_CONFIG_ADCRANGE_HIGH	BIT(4)
-#define SQ52206_CONFIG_ADCRANGE_LOW		BIT(3)
+#define SQ52206_CONFIG_ADCRANGE_LOW	BIT(3)
 
 #define INA238_DIAG_ALERT_TMPOL		BIT(7)
 #define INA238_DIAG_ALERT_SHNTOL	BIT(6)
@@ -104,7 +104,7 @@
 
 #define INA238_SHUNT_VOLTAGE_LSB	5 /* 5 uV/lsb */
 #define INA238_BUS_VOLTAGE_LSB		3125 /* 3.125 mV/lsb */
-#define INA238_DIE_TEMP_LSB			1250000 /* 125.0000 mC/lsb */
+#define INA238_DIE_TEMP_LSB		1250000 /* 125.0000 mC/lsb */
 #define SQ52206_BUS_VOLTAGE_LSB		3750 /* 3.75 mV/lsb */
 #define SQ52206_DIE_TEMP_LSB		78125 /* 7.8125 mC/lsb */
 
@@ -118,12 +118,12 @@ enum ina238_ids { ina238, ina237, sq52206 };
 
 struct ina238_config {
 	bool has_power_highest;		/* chip detection power peak */
-	bool has_energy;			/* chip detection energy */
-	u8 temp_shift;				/* fixed parameters for temp calculate */
+	bool has_energy;		/* chip detection energy */
+	u8 temp_shift;			/* fixed parameters for temp calculate */
 	u32 power_calculate_factor;	/* fixed parameters for power calculate */
-	u16 config_default;			/* Power-on default state */
+	u16 config_default;		/* Power-on default state */
 	int bus_voltage_lsb;		/* use for temperature calculate, uV/lsb */
-	int temp_lsb;				/* use for temperature calculate */
+	int temp_lsb;			/* use for temperature calculate */
 };
 
 struct ina238_data {
@@ -271,7 +271,7 @@ static int ina238_read_in(struct device *dev, u32 attr, int channel,
 		if (channel == 0)
 			/* gain of 1 -> LSB / 4 */
 			*val = (regval * INA238_SHUNT_VOLTAGE_LSB) *
-					data->gain / (1000 * 4);
+				data->gain / (1000 * 4);
 		else
 			*val = (regval * data->config->bus_voltage_lsb) / 1000;
 		break;
@@ -370,7 +370,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -381,7 +381,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 			return err;
 
 		/* Fixed 1mA lsb, scaled by 1000000 to have result in uW */
-		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64(regval * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -395,7 +395,7 @@ static int ina238_read_power(struct device *dev, u32 attr, long *val)
 		 * Truncated 24-bit compare register, lower 8-bits are
 		 * truncated. Same conversion to/from uW as POWER register.
 		 */
-		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT *	data->gain *
+		power = div_u64((regval << 8) * 1000ULL * INA238_FIXED_SHUNT * data->gain *
 				data->config->power_calculate_factor, 4 * 100 * data->rshunt);
 		/* Clamp value to maximum value of long */
 		*val = clamp_val(power, 0, LONG_MAX);
@@ -448,7 +448,7 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 			return err;
 		/* Signed, result in mC */
 		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-						(s64)data->config->temp_lsb, 10000);
+			       (s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max:
 		err = regmap_read(data->regmap, INA238_TEMP_LIMIT, &regval);
@@ -456,7 +456,7 @@ static int ina238_read_temp(struct device *dev, u32 attr, long *val)
 			return err;
 		/* Signed, result in mC */
 		*val = div_s64(((s64)((s16)regval) >> data->config->temp_shift) *
-						(s64)data->config->temp_lsb, 10000);
+			       (s64)data->config->temp_lsb, 10000);
 		break;
 	case hwmon_temp_max_alarm:
 		err = regmap_read(data->regmap, INA238_DIAG_ALERT, &regval);
@@ -501,8 +501,8 @@ static ssize_t energy1_input_show(struct device *dev,
 		return ret;
 
 	/* result in uJ */
-	energy = div_u64(regval * INA238_FIXED_SHUNT *	data->gain * 16 * 10 *
-				data->config->power_calculate_factor, 4 * data->rshunt);
+	energy = div_u64(regval * INA238_FIXED_SHUNT * data->gain * 16 * 10 *
+			 data->config->power_calculate_factor, 4 * data->rshunt);
 
 	return sysfs_emit(buf, "%llu\n", energy);
 }
-- 
2.43.0


