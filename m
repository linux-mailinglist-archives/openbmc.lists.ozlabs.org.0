Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71A4D2505
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 01:53:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCtwJ0km5z3bP4
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 11:53:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iwypJDTS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=iwypJDTS; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCtsx1fdmz30JM
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 11:51:00 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0A43EB23;
 Tue,  8 Mar 2022 16:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646787060;
 bh=YIZv9+SIesyx8doHGzmEElUtCe6o5nXvWYN+qH+1//E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iwypJDTSxCkHuV1nER7CiajiD6Alq/GrJXuHyvXRcN+KMWkM3MruZFHFKkcKnqnHc
 zU1+Vg1rQ18Wvw4NAAA4M1CZ9nhhcnji7Gmk8vQoD4XgH4ZSHNj6sx9LBh1kMCpj8f
 Gzy5hJNSq/zhSsaX4wJU5zEdz+DuAW62hw5T19Bk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v2 4/6] hwmon: (nct6775) Add read-only mode
Date: Tue,  8 Mar 2022 16:50:45 -0800
Message-Id: <20220309005047.5107-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309005047.5107-1-zev@bewilderbeest.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When enabled, all write bits are removed from the modes of all sysfs
attribute files.  This provides a bit of infrastructure for the
upcoming i2c version of this driver, which should generally avoid
writes to device registers so as not to interfere with simultaneous
use of the device via the LPC interface.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/hwmon/nct6775.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 36bdbb176601..99b4e308a053 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1348,6 +1348,7 @@ struct nct6775_data {
 	u8 sio_reg_enable;
 
 	struct regmap *regmap;
+	bool read_only;
 };
 
 struct sensor_device_template {
@@ -1405,6 +1406,11 @@ struct sensor_template_group {
 	int base;
 };
 
+static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
+{
+	return data->read_only ? (attr->mode & ~0222) : attr->mode;
+}
+
 static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
 {
 	/* Need to leave a NULL terminator at the end of data->groups */
@@ -2371,7 +2377,7 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 	if (!(data->have_in & BIT(in)))
 		return 0;
 
-	return attr->mode;
+	return nct6775_attr_mode(data, attr);
 }
 
 SENSOR_TEMPLATE_2(in_input, "in%d_input", S_IRUGO, show_in_reg, NULL, 0, 0);
@@ -2607,7 +2613,7 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
 	if (nr == 5 && data->kind != nct6775)
 		return 0;
 
-	return attr->mode;
+	return nct6775_attr_mode(data, attr);
 }
 
 SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
@@ -2834,7 +2840,7 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 	if (nr > 7 && !(data->have_temp_fixed & BIT(temp)))
 		return 0;
 
-	return attr->mode;
+	return nct6775_attr_mode(data, attr);
 }
 
 SENSOR_TEMPLATE_2(temp_input, "temp%d_input", S_IRUGO, show_temp, NULL, 0, 0);
@@ -2908,7 +2914,7 @@ static umode_t nct6775_tsi_temp_is_visible(struct kobject *kobj, struct attribut
 	struct nct6775_data *data = dev_get_drvdata(dev);
 	int temp = index / 2;
 
-	return (data->have_tsi_temp & BIT(temp)) ? attr->mode : 0;
+	return (data->have_tsi_temp & BIT(temp)) ? nct6775_attr_mode(data, attr) : 0;
 }
 
 /*
@@ -3766,7 +3772,7 @@ static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
 		if (api > data->auto_pwm_num)
 			return 0;
 	}
-	return attr->mode;
+	return nct6775_attr_mode(data, attr);
 }
 
 SENSOR_TEMPLATE_2(pwm_stop_time, "pwm%d_stop_time", S_IWUSR | S_IRUGO,
@@ -3961,7 +3967,7 @@ static umode_t nct6775_other_is_visible(struct kobject *kobj,
 			return 0;
 	}
 
-	return attr->mode;
+	return nct6775_attr_mode(data, attr);
 }
 
 /*
-- 
2.35.1

