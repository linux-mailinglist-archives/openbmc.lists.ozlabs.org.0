Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B06141E8
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 00:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1V4F0VvDz2xl6
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 10:39:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=EwCB7Wtq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=EwCB7Wtq;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1V1f3FVJz2ybK
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 10:37:25 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B6F643F9;
	Mon, 31 Oct 2022 16:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667259443;
	bh=elF8316zFSe4EfpL/QQF0WnD0i/ruhxqBXkJwaA32cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EwCB7WtqeyThaYYP5+CY5GzVluwTsWjnhg5OIF13CzJTW3DEgGv7hTUrVZ4czZ44d
	 fGCfuCePV3k3ZPQCINSVf2b2nVaAgYOPkTjNhycY5tjMYZKEENF6Dcaonz0132rjgc
	 qfolae8ENoSLEASJOsKIldIr8/Xh+hQXKqexmnu0=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 3/3] regulator: userspace-consumer: Handle regulator-output DT nodes
Date: Mon, 31 Oct 2022 16:37:04 -0700
Message-Id: <20221031233704.22575-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031233704.22575-1-zev@bewilderbeest.net>
References: <20221031233704.22575-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring <robh+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In addition to adding some fairly simple OF support code, we make some
slight adjustments to the userspace-consumer driver to properly
support use with regulator-output hardware:

 - We now do an exclusive get of the supply regulators so as to
   prevent regulator_init_complete_work from automatically disabling
   them.

 - Instead of assuming that the supply is initially disabled, we now
   query its state to determine the initial value of drvdata->enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v1:
 - removed 'regulator-leave-on' support, instead just setting
   .no_autoswitch if instantiated via DT
 - added .is_visible method to hide 'name' sysfs attribute when it's
   not set

 drivers/regulator/userspace-consumer.c       | 60 +++++++++++++++++---
 include/linux/regulator/userspace-consumer.h |  1 +
 2 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/userspace-consumer.c b/drivers/regulator/userspace-consumer.c
index 8ca28664776e..402c8037cf39 100644
--- a/drivers/regulator/userspace-consumer.c
+++ b/drivers/regulator/userspace-consumer.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/userspace-consumer.h>
@@ -24,6 +25,7 @@ struct userspace_consumer_data {
 
 	struct mutex lock;
 	bool enabled;
+	bool no_autoswitch;
 
 	int num_supplies;
 	struct regulator_bulk_data *supplies;
@@ -96,19 +98,50 @@ static struct attribute *attributes[] = {
 	NULL,
 };
 
+static umode_t attr_visible(struct kobject *kobj, struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct userspace_consumer_data *data = dev_get_drvdata(dev);
+
+	/* If a name hasn't been set, don't bother with the attribute */
+	if (attr == &dev_attr_name.attr && !data->name)
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group attr_group = {
 	.attrs	= attributes,
+	.is_visible =  attr_visible,
 };
 
 static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 {
+	struct regulator_userspace_consumer_data tmpdata;
 	struct regulator_userspace_consumer_data *pdata;
 	struct userspace_consumer_data *drvdata;
 	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata)
+	if (!pdata) {
+		if (!pdev->dev.of_node)
+			return -EINVAL;
+
+		pdata = &tmpdata;
+		memset(pdata, 0, sizeof(*pdata));
+
+		pdata->no_autoswitch = true;
+		pdata->num_supplies = 1;
+		pdata->supplies = devm_kzalloc(&pdev->dev, sizeof(*pdata->supplies), GFP_KERNEL);
+		if (!pdata->supplies)
+			return -ENOMEM;
+		pdata->supplies[0].supply = "vout";
+	}
+
+	if (pdata->num_supplies < 1) {
+		dev_err(&pdev->dev, "At least one supply required\n");
 		return -EINVAL;
+	}
 
 	drvdata = devm_kzalloc(&pdev->dev,
 			       sizeof(struct userspace_consumer_data),
@@ -119,21 +152,24 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 	drvdata->name = pdata->name;
 	drvdata->num_supplies = pdata->num_supplies;
 	drvdata->supplies = pdata->supplies;
+	drvdata->no_autoswitch = pdata->no_autoswitch;
 
 	mutex_init(&drvdata->lock);
 
-	ret = devm_regulator_bulk_get(&pdev->dev, drvdata->num_supplies,
-				      drvdata->supplies);
+	ret = devm_regulator_bulk_get_exclusive(&pdev->dev, drvdata->num_supplies,
+						drvdata->supplies);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to get supplies: %d\n", ret);
 		return ret;
 	}
 
+	platform_set_drvdata(pdev, drvdata);
+
 	ret = sysfs_create_group(&pdev->dev.kobj, &attr_group);
 	if (ret != 0)
 		return ret;
 
-	if (pdata->init_on) {
+	if (pdata->init_on && !pdata->no_autoswitch) {
 		ret = regulator_bulk_enable(drvdata->num_supplies,
 					    drvdata->supplies);
 		if (ret) {
@@ -143,8 +179,12 @@ static int regulator_userspace_consumer_probe(struct platform_device *pdev)
 		}
 	}
 
-	drvdata->enabled = pdata->init_on;
-	platform_set_drvdata(pdev, drvdata);
+	ret = regulator_is_enabled(pdata->supplies[0].consumer);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get regulator status\n");
+		goto err_enable;
+	}
+	drvdata->enabled = !!ret;
 
 	return 0;
 
@@ -160,17 +200,23 @@ static int regulator_userspace_consumer_remove(struct platform_device *pdev)
 
 	sysfs_remove_group(&pdev->dev.kobj, &attr_group);
 
-	if (data->enabled)
+	if (data->enabled && !data->no_autoswitch)
 		regulator_bulk_disable(data->num_supplies, data->supplies);
 
 	return 0;
 }
 
+static const struct of_device_id regulator_userspace_consumer_of_match[] = {
+	{ .compatible = "regulator-output", },
+	{},
+};
+
 static struct platform_driver regulator_userspace_consumer_driver = {
 	.probe		= regulator_userspace_consumer_probe,
 	.remove		= regulator_userspace_consumer_remove,
 	.driver		= {
 		.name		= "reg-userspace-consumer",
+		.of_match_table	= regulator_userspace_consumer_of_match,
 	},
 };
 
diff --git a/include/linux/regulator/userspace-consumer.h b/include/linux/regulator/userspace-consumer.h
index b5dba0628951..2249ee697f8b 100644
--- a/include/linux/regulator/userspace-consumer.h
+++ b/include/linux/regulator/userspace-consumer.h
@@ -21,6 +21,7 @@ struct regulator_userspace_consumer_data {
 	struct regulator_bulk_data *supplies;
 
 	bool init_on;
+	bool no_autoswitch;
 };
 
 #endif /* __REGULATOR_PLATFORM_CONSUMER_H_ */
-- 
2.38.1

