Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B99510DB6
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 03:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp0vF2sdzz3bbn
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 11:06:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=E0k+u/mh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=E0k+u/mh; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp0pp1Bdxz2yhD
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 11:02:42 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 41F10C9F;
 Tue, 26 Apr 2022 18:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651021359;
 bh=7WpmyaGWcfsztprF68C1GD/d+QD/Y/KqUy43KBBqxuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E0k+u/mhV35XZ5ceyaXC1+WoCk1FRxC7kxC6igqKEBqgJUtcKRB63rqCIbRPRYVv+
 TQfZjcO97CXaryhdlXQzsYOm2wPPTGmFHB0wqaC6XTrJTOWpB718rTGGIkIMJMmfEj
 0hrdHwFOZozqx7f6aVwans68dErsZMn5lLgZvxbg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v4 5/7] hwmon: (nct6775) Convert S_I* permissions macros to
 octal
Date: Tue, 26 Apr 2022 18:01:52 -0700
Message-Id: <20220427010154.29749-6-zev@bewilderbeest.net>
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Checkpatch has been warning about these for a while; the octal
versions are both more comprehensible and more concise.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/hwmon/nct6775.c | 159 ++++++++++++++++------------------------
 1 file changed, 64 insertions(+), 95 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 99b4e308a053..5e741bcf2645 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -2380,14 +2380,11 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 	return nct6775_attr_mode(data, attr);
 }
 
-SENSOR_TEMPLATE_2(in_input, "in%d_input", S_IRUGO, show_in_reg, NULL, 0, 0);
-SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, show_alarm, NULL, 0);
-SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, show_beep, store_beep,
-		0);
-SENSOR_TEMPLATE_2(in_min, "in%d_min", S_IWUSR | S_IRUGO, show_in_reg,
-		  store_in_reg, 0, 1);
-SENSOR_TEMPLATE_2(in_max, "in%d_max", S_IWUSR | S_IRUGO, show_in_reg,
-		  store_in_reg, 0, 2);
+SENSOR_TEMPLATE_2(in_input, "in%d_input", 0444, show_in_reg, NULL, 0, 0);
+SENSOR_TEMPLATE(in_alarm, "in%d_alarm", 0444, show_alarm, NULL, 0);
+SENSOR_TEMPLATE(in_beep, "in%d_beep", 0644, show_beep, store_beep, 0);
+SENSOR_TEMPLATE_2(in_min, "in%d_min", 0644, show_in_reg, store_in_reg, 0, 1);
+SENSOR_TEMPLATE_2(in_max, "in%d_max", 0644, show_in_reg, store_in_reg, 0, 2);
 
 /*
  * nct6775_in_is_visible uses the index into the following array
@@ -2616,16 +2613,12 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
 	return nct6775_attr_mode(data, attr);
 }
 
-SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
-SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, show_alarm, NULL,
-		FAN_ALARM_BASE);
-SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, show_beep,
-		store_beep, FAN_ALARM_BASE);
-SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IWUSR | S_IRUGO, show_fan_pulses,
-		store_fan_pulses, 0);
-SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IWUSR | S_IRUGO, show_fan_min,
-		store_fan_min, 0);
-SENSOR_TEMPLATE(fan_div, "fan%d_div", S_IRUGO, show_fan_div, NULL, 0);
+SENSOR_TEMPLATE(fan_input, "fan%d_input", 0444, show_fan, NULL, 0);
+SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", 0444, show_alarm, NULL, FAN_ALARM_BASE);
+SENSOR_TEMPLATE(fan_beep, "fan%d_beep", 0644, show_beep, store_beep, FAN_ALARM_BASE);
+SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", 0644, show_fan_pulses, store_fan_pulses, 0);
+SENSOR_TEMPLATE(fan_min, "fan%d_min", 0644, show_fan_min, store_fan_min, 0);
+SENSOR_TEMPLATE(fan_div, "fan%d_div", 0444, show_fan_div, NULL, 0);
 
 /*
  * nct6775_fan_is_visible uses the index into the following array
@@ -2843,23 +2836,16 @@ static umode_t nct6775_temp_is_visible(struct kobject *kobj,
 	return nct6775_attr_mode(data, attr);
 }
 
-SENSOR_TEMPLATE_2(temp_input, "temp%d_input", S_IRUGO, show_temp, NULL, 0, 0);
-SENSOR_TEMPLATE(temp_label, "temp%d_label", S_IRUGO, show_temp_label, NULL, 0);
-SENSOR_TEMPLATE_2(temp_max, "temp%d_max", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 1);
-SENSOR_TEMPLATE_2(temp_max_hyst, "temp%d_max_hyst", S_IRUGO | S_IWUSR,
-		  show_temp, store_temp, 0, 2);
-SENSOR_TEMPLATE_2(temp_crit, "temp%d_crit", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 3);
-SENSOR_TEMPLATE_2(temp_lcrit, "temp%d_lcrit", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 4);
-SENSOR_TEMPLATE(temp_offset, "temp%d_offset", S_IRUGO | S_IWUSR,
-		show_temp_offset, store_temp_offset, 0);
-SENSOR_TEMPLATE(temp_type, "temp%d_type", S_IRUGO | S_IWUSR, show_temp_type,
-		store_temp_type, 0);
-SENSOR_TEMPLATE(temp_alarm, "temp%d_alarm", S_IRUGO, show_temp_alarm, NULL, 0);
-SENSOR_TEMPLATE(temp_beep, "temp%d_beep", S_IRUGO | S_IWUSR, show_temp_beep,
-		store_temp_beep, 0);
+SENSOR_TEMPLATE_2(temp_input, "temp%d_input", 0444, show_temp, NULL, 0, 0);
+SENSOR_TEMPLATE(temp_label, "temp%d_label", 0444, show_temp_label, NULL, 0);
+SENSOR_TEMPLATE_2(temp_max, "temp%d_max", 0644, show_temp, store_temp, 0, 1);
+SENSOR_TEMPLATE_2(temp_max_hyst, "temp%d_max_hyst", 0644, show_temp, store_temp, 0, 2);
+SENSOR_TEMPLATE_2(temp_crit, "temp%d_crit", 0644, show_temp, store_temp, 0, 3);
+SENSOR_TEMPLATE_2(temp_lcrit, "temp%d_lcrit", 0644, show_temp, store_temp, 0, 4);
+SENSOR_TEMPLATE(temp_offset, "temp%d_offset", 0644, show_temp_offset, store_temp_offset, 0);
+SENSOR_TEMPLATE(temp_type, "temp%d_type", 0644, show_temp_type, store_temp_type, 0);
+SENSOR_TEMPLATE(temp_alarm, "temp%d_alarm", 0444, show_temp_alarm, NULL, 0);
+SENSOR_TEMPLATE(temp_beep, "temp%d_beep", 0644, show_temp_beep, store_temp_beep, 0);
 
 /*
  * nct6775_temp_is_visible uses the index into the following array
@@ -3506,19 +3492,14 @@ store_speed_tolerance(struct device *dev, struct device_attribute *attr,
 	return err ? : count;
 }
 
-SENSOR_TEMPLATE_2(pwm, "pwm%d", S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 0);
-SENSOR_TEMPLATE(pwm_mode, "pwm%d_mode", S_IWUSR | S_IRUGO, show_pwm_mode,
-		store_pwm_mode, 0);
-SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", S_IWUSR | S_IRUGO, show_pwm_enable,
-		store_pwm_enable, 0);
-SENSOR_TEMPLATE(pwm_temp_sel, "pwm%d_temp_sel", S_IWUSR | S_IRUGO,
-		show_pwm_temp_sel, store_pwm_temp_sel, 0);
-SENSOR_TEMPLATE(pwm_target_temp, "pwm%d_target_temp", S_IWUSR | S_IRUGO,
-		show_target_temp, store_target_temp, 0);
-SENSOR_TEMPLATE(fan_target, "fan%d_target", S_IWUSR | S_IRUGO,
-		show_target_speed, store_target_speed, 0);
-SENSOR_TEMPLATE(fan_tolerance, "fan%d_tolerance", S_IWUSR | S_IRUGO,
-		show_speed_tolerance, store_speed_tolerance, 0);
+SENSOR_TEMPLATE_2(pwm, "pwm%d", 0644, show_pwm, store_pwm, 0, 0);
+SENSOR_TEMPLATE(pwm_mode, "pwm%d_mode", 0644, show_pwm_mode, store_pwm_mode, 0);
+SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0644, show_pwm_enable, store_pwm_enable, 0);
+SENSOR_TEMPLATE(pwm_temp_sel, "pwm%d_temp_sel", 0644, show_pwm_temp_sel, store_pwm_temp_sel, 0);
+SENSOR_TEMPLATE(pwm_target_temp, "pwm%d_target_temp", 0644, show_target_temp, store_target_temp, 0);
+SENSOR_TEMPLATE(fan_target, "fan%d_target", 0644, show_target_speed, store_target_speed, 0);
+SENSOR_TEMPLATE(fan_tolerance, "fan%d_tolerance", 0644, show_speed_tolerance,
+		store_speed_tolerance, 0);
 
 /* Smart Fan registers */
 
@@ -3560,18 +3541,16 @@ store_weight_temp(struct device *dev, struct device_attribute *attr,
 	return err ? : count;
 }
 
-SENSOR_TEMPLATE(pwm_weight_temp_sel, "pwm%d_weight_temp_sel", S_IWUSR | S_IRUGO,
-		  show_pwm_weight_temp_sel, store_pwm_weight_temp_sel, 0);
+SENSOR_TEMPLATE(pwm_weight_temp_sel, "pwm%d_weight_temp_sel", 0644,
+		show_pwm_weight_temp_sel, store_pwm_weight_temp_sel, 0);
 SENSOR_TEMPLATE_2(pwm_weight_temp_step, "pwm%d_weight_temp_step",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 0);
+		  0644, show_weight_temp, store_weight_temp, 0, 0);
 SENSOR_TEMPLATE_2(pwm_weight_temp_step_tol, "pwm%d_weight_temp_step_tol",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 1);
+		  0644, show_weight_temp, store_weight_temp, 0, 1);
 SENSOR_TEMPLATE_2(pwm_weight_temp_step_base, "pwm%d_weight_temp_step_base",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 2);
-SENSOR_TEMPLATE_2(pwm_weight_duty_step, "pwm%d_weight_duty_step",
-		  S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 5);
-SENSOR_TEMPLATE_2(pwm_weight_duty_base, "pwm%d_weight_duty_base",
-		  S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 6);
+		  0644, show_weight_temp, store_weight_temp, 0, 2);
+SENSOR_TEMPLATE_2(pwm_weight_duty_step, "pwm%d_weight_duty_step", 0644, show_pwm, store_pwm, 0, 5);
+SENSOR_TEMPLATE_2(pwm_weight_duty_base, "pwm%d_weight_duty_base", 0644, show_pwm, store_pwm, 0, 6);
 
 static ssize_t
 show_fan_time(struct device *dev, struct device_attribute *attr, char *buf)
@@ -3775,62 +3754,56 @@ static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
 	return nct6775_attr_mode(data, attr);
 }
 
-SENSOR_TEMPLATE_2(pwm_stop_time, "pwm%d_stop_time", S_IWUSR | S_IRUGO,
-		  show_fan_time, store_fan_time, 0, 0);
-SENSOR_TEMPLATE_2(pwm_step_up_time, "pwm%d_step_up_time", S_IWUSR | S_IRUGO,
+SENSOR_TEMPLATE_2(pwm_stop_time, "pwm%d_stop_time", 0644, show_fan_time, store_fan_time, 0, 0);
+SENSOR_TEMPLATE_2(pwm_step_up_time, "pwm%d_step_up_time", 0644,
 		  show_fan_time, store_fan_time, 0, 1);
-SENSOR_TEMPLATE_2(pwm_step_down_time, "pwm%d_step_down_time", S_IWUSR | S_IRUGO,
+SENSOR_TEMPLATE_2(pwm_step_down_time, "pwm%d_step_down_time", 0644,
 		  show_fan_time, store_fan_time, 0, 2);
-SENSOR_TEMPLATE_2(pwm_start, "pwm%d_start", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 1);
-SENSOR_TEMPLATE_2(pwm_floor, "pwm%d_floor", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 2);
-SENSOR_TEMPLATE_2(pwm_temp_tolerance, "pwm%d_temp_tolerance", S_IWUSR | S_IRUGO,
+SENSOR_TEMPLATE_2(pwm_start, "pwm%d_start", 0644, show_pwm, store_pwm, 0, 1);
+SENSOR_TEMPLATE_2(pwm_floor, "pwm%d_floor", 0644, show_pwm, store_pwm, 0, 2);
+SENSOR_TEMPLATE_2(pwm_temp_tolerance, "pwm%d_temp_tolerance", 0644,
 		  show_temp_tolerance, store_temp_tolerance, 0, 0);
 SENSOR_TEMPLATE_2(pwm_crit_temp_tolerance, "pwm%d_crit_temp_tolerance",
-		  S_IWUSR | S_IRUGO, show_temp_tolerance, store_temp_tolerance,
-		  0, 1);
+		  0644, show_temp_tolerance, store_temp_tolerance, 0, 1);
 
-SENSOR_TEMPLATE_2(pwm_max, "pwm%d_max", S_IWUSR | S_IRUGO, show_pwm, store_pwm,
-		  0, 3);
+SENSOR_TEMPLATE_2(pwm_max, "pwm%d_max", 0644, show_pwm, store_pwm, 0, 3);
 
-SENSOR_TEMPLATE_2(pwm_step, "pwm%d_step", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 4);
+SENSOR_TEMPLATE_2(pwm_step, "pwm%d_step", 0644, show_pwm, store_pwm, 0, 4);
 
 SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 0);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 0);
 SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 0);
+		  0644, show_auto_temp, store_auto_temp, 0, 0);
 
 SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 1);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 1);
 SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 1);
+		  0644, show_auto_temp, store_auto_temp, 0, 1);
 
 SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 2);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 2);
 SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 2);
+		  0644, show_auto_temp, store_auto_temp, 0, 2);
 
 SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 3);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 3);
 SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 3);
+		  0644, show_auto_temp, store_auto_temp, 0, 3);
 
 SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 4);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 4);
 SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 4);
+		  0644, show_auto_temp, store_auto_temp, 0, 4);
 
 SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 5);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 5);
 SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 5);
+		  0644, show_auto_temp, store_auto_temp, 0, 5);
 
 SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 6);
+		  0644, show_auto_pwm, store_auto_pwm, 0, 6);
 SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 6);
+		  0644, show_auto_temp, store_auto_temp, 0, 6);
 
 /*
  * nct6775_pwm_is_visible uses the index into the following array
@@ -3937,16 +3910,12 @@ clear_caseopen(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, show_alarm,
-			  clear_caseopen, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, show_alarm,
+static SENSOR_DEVICE_ATTR(intrusion0_alarm, 0644, show_alarm, clear_caseopen, INTRUSION_ALARM_BASE);
+static SENSOR_DEVICE_ATTR(intrusion1_alarm, 0644, show_alarm,
 			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, BEEP_ENABLE_BASE);
+static SENSOR_DEVICE_ATTR(intrusion0_beep, 0644, show_beep, store_beep, INTRUSION_ALARM_BASE);
+static SENSOR_DEVICE_ATTR(intrusion1_beep, 0644, show_beep, store_beep, INTRUSION_ALARM_BASE + 1);
+static SENSOR_DEVICE_ATTR(beep_enable, 0644, show_beep, store_beep, BEEP_ENABLE_BASE);
 
 static umode_t nct6775_other_is_visible(struct kobject *kobj,
 					struct attribute *attr, int index)
-- 
2.36.0

