Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22D9432A42
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:19:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCWV1tkfz3c80
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:19:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=NoEuweyE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=NoEuweyE; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCT512Hpz30Pd
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:17:27 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 337CFA6C;
 Mon, 18 Oct 2021 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634599044;
 bh=MMWIxAR/CvsTFPvv1W4m7AKZySaUv6b4lACqgR2q2+0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NoEuweyEmpRCERsuxwBFF1XmxXcV8Zacopbmuq2DHrO3JMiHGCO1chuRq6kDhGg35
 sgr3kz5ScDB7FmGKjN7PDTCb27GJIGuulAQuf+31vFyR+vphLnIK4v+AQn4yjFu8Ge
 VIkVeduK8L5fUs4L7c0PMAmDg34OFODYFsg0hTGA=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.14 3/8] hwmon: (pmbus/lm25066) Avoid forward
 declaration of lm25066_id
Date: Mon, 18 Oct 2021 16:17:09 -0700
Message-Id: <20211018231714.19054-4-zev@bewilderbeest.net>
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

Reordering things to put the table before the probe function
eliminates the need for it.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Link: https://lore.kernel.org/r/20210928092242.30036-4-zev@bewilderbeest.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/lm25066.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 3616705aafde..4dc003ff859e 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -234,8 +234,6 @@ struct lm25066_data {
 
 #define to_lm25066_data(x)  container_of(x, struct lm25066_data, info)
 
-static const struct i2c_device_id lm25066_id[];
-
 static int lm25066_read_word_data(struct i2c_client *client, int page,
 				  int phase, int reg)
 {
@@ -436,6 +434,16 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
 	return ret;
 }
 
+static const struct i2c_device_id lm25066_id[] = {
+	{"lm25056", lm25056},
+	{"lm25066", lm25066},
+	{"lm5064", lm5064},
+	{"lm5066", lm5066},
+	{"lm5066i", lm5066i},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, lm25066_id);
+
 static int lm25066_probe(struct i2c_client *client)
 {
 	int config;
@@ -509,17 +517,6 @@ static int lm25066_probe(struct i2c_client *client)
 	return pmbus_do_probe(client, info);
 }
 
-static const struct i2c_device_id lm25066_id[] = {
-	{"lm25056", lm25056},
-	{"lm25066", lm25066},
-	{"lm5064", lm5064},
-	{"lm5066", lm5066},
-	{"lm5066i", lm5066i},
-	{ }
-};
-
-MODULE_DEVICE_TABLE(i2c, lm25066_id);
-
 /* This is the driver that will be inserted */
 static struct i2c_driver lm25066_driver = {
 	.driver = {
-- 
2.33.1

