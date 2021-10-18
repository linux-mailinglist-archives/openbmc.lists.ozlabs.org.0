Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CABA432A52
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCZs4tHWz2yw3
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=UyADMHf3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=UyADMHf3; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCT7545Vz3cBg
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:17:31 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A1F64BA0;
 Mon, 18 Oct 2021 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634599044;
 bh=2ibrH3s+B7CCUJYm7fL2sTMDiDyhZQV7MwKwLPA9sbI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UyADMHf3yuuWwVpOEAjd5xgHIL7ACLYAHuSwUHuASSqXEUgd5NVpFF17qp0uRSSHJ
 6cghW3JJloZc65s4ASKstCtheoN2XwPNcv6vcS3UXVHa7PRhguCJUZktGUzr8R3WXM
 iCyRRfYcoZcd6X6n+3PBksmnvmaeZbFKSLQbe4vM=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.14 6/8] hwmon: (pmbus/lm25066) Add OF device ID
 table
Date: Mon, 18 Oct 2021 16:17:12 -0700
Message-Id: <20211018231714.19054-7-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211018231714.19054-1-zev@bewilderbeest.net>
References: <20211018231714.19054-1-zev@bewilderbeest.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have an
OF device ID table if the devices are registered via OF.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Link: https://lore.kernel.org/r/20210928092242.30036-7-zev@bewilderbeest.net
[groeck: Replaced reference to reasoning with reasoning, fixed checkpatch
 warnings, fixed compile warning comparing of_id->data w/ i2c_id->driver_data]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/lm25066.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dbbf8571c437..7dc5ffeab77d 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
+#include <linux/of_device.h>
 #include "pmbus.h"
 
 enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
@@ -444,12 +445,24 @@ static const struct i2c_device_id lm25066_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, lm25066_id);
 
+static const struct of_device_id __maybe_unused lm25066_of_match[] = {
+	{ .compatible = "ti,lm25056", .data = (void *)lm25056, },
+	{ .compatible = "ti,lm25066", .data = (void *)lm25066, },
+	{ .compatible = "ti,lm5064",  .data = (void *)lm5064,  },
+	{ .compatible = "ti,lm5066",  .data = (void *)lm5066,  },
+	{ .compatible = "ti,lm5066i", .data = (void *)lm5066i, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, lm25066_of_match);
+
 static int lm25066_probe(struct i2c_client *client)
 {
 	int config;
 	struct lm25066_data *data;
 	struct pmbus_driver_info *info;
 	const struct __coeff *coeff;
+	const struct of_device_id *of_id;
+	const struct i2c_device_id *i2c_id;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_READ_BYTE_DATA))
@@ -464,7 +477,14 @@ static int lm25066_probe(struct i2c_client *client)
 	if (config < 0)
 		return config;
 
-	data->id = i2c_match_id(lm25066_id, client)->driver_data;
+	i2c_id = i2c_match_id(lm25066_id, client);
+
+	of_id = of_match_device(lm25066_of_match, &client->dev);
+	if (of_id && (unsigned long)of_id->data != i2c_id->driver_data)
+		dev_notice(&client->dev, "Device mismatch: %s in device tree, %s detected\n",
+			   of_id->name, i2c_id->name);
+
+	data->id = i2c_id->driver_data;
 	info = &data->info;
 
 	info->pages = 1;
@@ -521,7 +541,8 @@ static int lm25066_probe(struct i2c_client *client)
 static struct i2c_driver lm25066_driver = {
 	.driver = {
 		   .name = "lm25066",
-		   },
+		   .of_match_table = of_match_ptr(lm25066_of_match),
+	},
 	.probe_new = lm25066_probe,
 	.id_table = lm25066_id,
 };
-- 
2.33.1

