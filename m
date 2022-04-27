Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BC510D9A
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 03:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp0rQ5MTFz3blK
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 11:04:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=UWcIU7X4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=UWcIU7X4; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp0pm4n1Qz2y0B
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 11:02:40 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A05EC819;
 Tue, 26 Apr 2022 18:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651021358;
 bh=Vw7r44A8o0MWYqRhr7FsTCN7GJe+3FuBLMgl/1jdrQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWcIU7X48iS1j6zOoR/bM0uuA9U+DPnbG7hTT5Qhd0YELbMDYLrQZPjcXjqNZUazC
 lZXk4lAlT5REJ9VdFEEhnU1CKKSuQKBrqJi479fCx7bmgldUUqT09KXb51taxYT1PW
 5vW/+1N/OYw68n/RtKMW2PT+Md4dDd7zDAjJ9o2o=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v4 3/7] hwmon: (nct6775) Rearrange attr-group initialization
Date: Tue, 26 Apr 2022 18:01:50 -0700
Message-Id: <20220427010154.29749-4-zev@bewilderbeest.net>
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

We now track the number of attribute groups in nct6775_data, as a
measure to simplify handling differences in the set of enabled
attribute groups between nct6775 drivers (platform & i2c).  As a side
effect, we also reduce the amount of IS_ERR()/PTR_ERR() boilerplate a
bit.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/nct6775.c | 84 ++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index be99a1890ccd..36bdbb176601 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1199,6 +1199,7 @@ struct nct6775_data {
 	const char *name;
 
 	const struct attribute_group *groups[7];
+	u8 num_groups;
 
 	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
 				    * 3=temp_crit, 4=temp_lcrit
@@ -1404,10 +1405,18 @@ struct sensor_template_group {
 	int base;
 };
 
-static struct attribute_group *
-nct6775_create_attr_group(struct device *dev,
-			  const struct sensor_template_group *tg,
-			  int repeat)
+static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
+{
+	/* Need to leave a NULL terminator at the end of data->groups */
+	if (data->num_groups == ARRAY_SIZE(data->groups) - 1)
+		return -ENOBUFS;
+
+	data->groups[data->num_groups++] = group;
+	return 0;
+}
+
+static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_data *data,
+					   const struct sensor_template_group *tg, int repeat)
 {
 	struct attribute_group *group;
 	struct sensor_device_attr_u *su;
@@ -1418,28 +1427,28 @@ nct6775_create_attr_group(struct device *dev,
 	int i, count;
 
 	if (repeat <= 0)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	t = tg->templates;
 	for (count = 0; *t; t++, count++)
 		;
 
 	if (count == 0)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
 	if (group == NULL)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
 			     GFP_KERNEL);
 	if (attrs == NULL)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	su = devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
 			       GFP_KERNEL);
 	if (su == NULL)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	group->attrs = attrs;
 	group->is_visible = tg->is_visible;
@@ -1477,7 +1486,7 @@ nct6775_create_attr_group(struct device *dev,
 		}
 	}
 
-	return group;
+	return nct6775_add_attr_group(data, group);
 }
 
 static bool is_word_sized(struct nct6775_data *data, u16 reg)
@@ -4316,11 +4325,9 @@ static int nct6775_probe(struct platform_device *pdev)
 	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
 	int num_reg_temp, num_reg_temp_mon, num_reg_tsi_temp;
 	u8 cr2a;
-	struct attribute_group *group;
 	struct device *hwmon_dev;
 	struct sensor_template_group tsi_temp_tg;
 	const struct regmap_config *regmapcfg;
-	int num_attr_groups = 0;
 
 	if (sio_data->access == access_direct) {
 		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -5165,46 +5172,39 @@ static int nct6775_probe(struct platform_device *pdev)
 		return err;
 
 	/* Register sysfs hooks */
-	group = nct6775_create_attr_group(dev, &nct6775_pwm_template_group,
-					  data->pwm_num);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	data->groups[num_attr_groups++] = group;
-
-	group = nct6775_create_attr_group(dev, &nct6775_in_template_group,
-					  fls(data->have_in));
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-
-	data->groups[num_attr_groups++] = group;
-
-	group = nct6775_create_attr_group(dev, &nct6775_fan_template_group,
-					  fls(data->has_fan));
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+	err = nct6775_add_template_attr_group(dev, data, &nct6775_pwm_template_group,
+					      data->pwm_num);
+	if (err)
+		return err;
 
-	data->groups[num_attr_groups++] = group;
+	err = nct6775_add_template_attr_group(dev, data, &nct6775_in_template_group,
+					      fls(data->have_in));
+	if (err)
+		return err;
 
-	group = nct6775_create_attr_group(dev, &nct6775_temp_template_group,
-					  fls(data->have_temp));
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+	err = nct6775_add_template_attr_group(dev, data, &nct6775_fan_template_group,
+					      fls(data->has_fan));
+	if (err)
+		return err;
 
-	data->groups[num_attr_groups++] = group;
+	err = nct6775_add_template_attr_group(dev, data, &nct6775_temp_template_group,
+					      fls(data->have_temp));
+	if (err)
+		return err;
 
 	if (data->have_tsi_temp) {
 		tsi_temp_tg.templates = nct6775_tsi_temp_template;
 		tsi_temp_tg.is_visible = nct6775_tsi_temp_is_visible;
 		tsi_temp_tg.base = fls(data->have_temp) + 1;
-		group = nct6775_create_attr_group(dev, &tsi_temp_tg, fls(data->have_tsi_temp));
-		if (IS_ERR(group))
-			return PTR_ERR(group);
-
-		data->groups[num_attr_groups++] = group;
+		err = nct6775_add_template_attr_group(dev, data, &tsi_temp_tg,
+						      fls(data->have_tsi_temp));
+		if (err)
+			return err;
 	}
 
-	data->groups[num_attr_groups++] = &nct6775_group_other;
+	err = nct6775_add_attr_group(data, &nct6775_group_other);
+	if (err)
+		return err;
 
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, data->name,
 							   data, data->groups);
-- 
2.36.0

