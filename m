Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278476251FA
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 04:58:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7lLC6t5Bz3dts
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 14:58:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bC872HQm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=bC872HQm;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7lKf6086z2xZ7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 14:57:58 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 27348B98;
	Thu, 10 Nov 2022 19:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668139075;
	bh=9+vZa7ARO6Ar2RQNcERy0+FKfVUJtEgmKe6Swwo8lsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bC872HQmmMsexyiU2F4WQHSxO1onVXOfOrpbQkCmxADT32GzcaKNvlrfxnQM25F/Z
	 cQAZXlXSz4ekX4O3qBrtb1vYDAzuBB3FR4TlX1XWO6L83DT8BvfN4afTQj3/OpfuOV
	 oYa+uvMrKVoDoQzt10LajE9H3GfTUyiUiSVK7YSE=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 2/7] regulator: devres: Add devm_regulator_bulk_get_exclusive()
Date: Thu, 10 Nov 2022 19:57:42 -0800
Message-Id: <20221111035747.31663-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111035747.31663-1-zev@bewilderbeest.net>
References: <20221111035747.31663-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We had an exclusive variant of the devm_regulator_get() API, but no
corresponding variant for the bulk API; let's add one now.  We add a
generalized version of the existing regulator_bulk_get() function that
additionally takes a get_type parameter and redefine
regulator_bulk_get() in terms of it, then do similarly with
devm_regulator_bulk_get(), and finally add the new
devm_regulator_bulk_get_exclusive().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Link: https://lore.kernel.org/r/20221031233704.22575-2-zev@bewilderbeest.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c           | 42 +++++++++++--------
 drivers/regulator/devres.c         | 66 ++++++++++++++++++++++--------
 drivers/regulator/internal.h       |  2 +
 include/linux/regulator/consumer.h |  2 +
 4 files changed, 76 insertions(+), 36 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c3871565fd7d..778433b68600 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4762,22 +4762,8 @@ static int _notifier_call_chain(struct regulator_dev *rdev,
 	return blocking_notifier_call_chain(&rdev->notifier, event, data);
 }
 
-/**
- * regulator_bulk_get - get multiple regulator consumers
- *
- * @dev:           Device to supply
- * @num_consumers: Number of consumers to register
- * @consumers:     Configuration of consumers; clients are stored here.
- *
- * @return 0 on success, an errno on failure.
- *
- * This helper function allows drivers to get several regulator
- * consumers in one operation.  If any of the regulators cannot be
- * acquired then any regulators that were allocated will be freed
- * before returning to the caller.
- */
-int regulator_bulk_get(struct device *dev, int num_consumers,
-		       struct regulator_bulk_data *consumers)
+int _regulator_bulk_get(struct device *dev, int num_consumers,
+			struct regulator_bulk_data *consumers, enum regulator_get_type get_type)
 {
 	int i;
 	int ret;
@@ -4786,8 +4772,8 @@ int regulator_bulk_get(struct device *dev, int num_consumers,
 		consumers[i].consumer = NULL;
 
 	for (i = 0; i < num_consumers; i++) {
-		consumers[i].consumer = regulator_get(dev,
-						      consumers[i].supply);
+		consumers[i].consumer = _regulator_get(dev,
+						       consumers[i].supply, get_type);
 		if (IS_ERR(consumers[i].consumer)) {
 			ret = dev_err_probe(dev, PTR_ERR(consumers[i].consumer),
 					    "Failed to get supply '%s'",
@@ -4814,6 +4800,26 @@ int regulator_bulk_get(struct device *dev, int num_consumers,
 
 	return ret;
 }
+
+/**
+ * regulator_bulk_get - get multiple regulator consumers
+ *
+ * @dev:           Device to supply
+ * @num_consumers: Number of consumers to register
+ * @consumers:     Configuration of consumers; clients are stored here.
+ *
+ * @return 0 on success, an errno on failure.
+ *
+ * This helper function allows drivers to get several regulator
+ * consumers in one operation.  If any of the regulators cannot be
+ * acquired then any regulators that were allocated will be freed
+ * before returning to the caller.
+ */
+int regulator_bulk_get(struct device *dev, int num_consumers,
+		       struct regulator_bulk_data *consumers)
+{
+	return _regulator_bulk_get(dev, num_consumers, consumers, NORMAL_GET);
+}
 EXPORT_SYMBOL_GPL(regulator_bulk_get);
 
 static void regulator_bulk_enable_async(void *data, async_cookie_t cookie)
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 3265e75e97ab..fec0398d98b0 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -186,23 +186,9 @@ static void devm_regulator_bulk_release(struct device *dev, void *res)
 	regulator_bulk_free(devres->num_consumers, devres->consumers);
 }
 
-/**
- * devm_regulator_bulk_get - managed get multiple regulator consumers
- *
- * @dev:           device to supply
- * @num_consumers: number of consumers to register
- * @consumers:     configuration of consumers; clients are stored here.
- *
- * @return 0 on success, an errno on failure.
- *
- * This helper function allows drivers to get several regulator
- * consumers in one operation with management, the regulators will
- * automatically be freed when the device is unbound.  If any of the
- * regulators cannot be acquired then any regulators that were
- * allocated will be freed before returning to the caller.
- */
-int devm_regulator_bulk_get(struct device *dev, int num_consumers,
-			    struct regulator_bulk_data *consumers)
+static int _devm_regulator_bulk_get(struct device *dev, int num_consumers,
+				    struct regulator_bulk_data *consumers,
+				    enum regulator_get_type get_type)
 {
 	struct regulator_bulk_devres *devres;
 	int ret;
@@ -212,7 +198,7 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 	if (!devres)
 		return -ENOMEM;
 
-	ret = regulator_bulk_get(dev, num_consumers, consumers);
+	ret = _regulator_bulk_get(dev, num_consumers, consumers, get_type);
 	if (!ret) {
 		devres->consumers = consumers;
 		devres->num_consumers = num_consumers;
@@ -223,8 +209,52 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 
 	return ret;
 }
+
+/**
+ * devm_regulator_bulk_get - managed get multiple regulator consumers
+ *
+ * @dev:           device to supply
+ * @num_consumers: number of consumers to register
+ * @consumers:     configuration of consumers; clients are stored here.
+ *
+ * @return 0 on success, an errno on failure.
+ *
+ * This helper function allows drivers to get several regulator
+ * consumers in one operation with management, the regulators will
+ * automatically be freed when the device is unbound.  If any of the
+ * regulators cannot be acquired then any regulators that were
+ * allocated will be freed before returning to the caller.
+ */
+int devm_regulator_bulk_get(struct device *dev, int num_consumers,
+			    struct regulator_bulk_data *consumers)
+{
+	return _devm_regulator_bulk_get(dev, num_consumers, consumers, NORMAL_GET);
+}
 EXPORT_SYMBOL_GPL(devm_regulator_bulk_get);
 
+/**
+ * devm_regulator_bulk_get_exclusive - managed exclusive get of multiple
+ * regulator consumers
+ *
+ * @dev:           device to supply
+ * @num_consumers: number of consumers to register
+ * @consumers:     configuration of consumers; clients are stored here.
+ *
+ * @return 0 on success, an errno on failure.
+ *
+ * This helper function allows drivers to exclusively get several
+ * regulator consumers in one operation with management, the regulators
+ * will automatically be freed when the device is unbound.  If any of
+ * the regulators cannot be acquired then any regulators that were
+ * allocated will be freed before returning to the caller.
+ */
+int devm_regulator_bulk_get_exclusive(struct device *dev, int num_consumers,
+				      struct regulator_bulk_data *consumers)
+{
+	return _devm_regulator_bulk_get(dev, num_consumers, consumers, EXCLUSIVE_GET);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_bulk_get_exclusive);
+
 /**
  * devm_regulator_bulk_get_const - devm_regulator_bulk_get() w/ const data
  *
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 1e9c71642143..fb4433068d29 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -122,4 +122,6 @@ enum regulator_get_type {
 
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
+int _regulator_bulk_get(struct device *dev, int num_consumers,
+			struct regulator_bulk_data *consumers, enum regulator_get_type get_type);
 #endif
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index ee3b4a014611..628a52b8e63f 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -247,6 +247,8 @@ int __must_check regulator_bulk_get(struct device *dev, int num_consumers,
 int __must_check devm_regulator_bulk_get(struct device *dev, int num_consumers,
 					 struct regulator_bulk_data *consumers);
 void devm_regulator_bulk_put(struct regulator_bulk_data *consumers);
+int __must_check devm_regulator_bulk_get_exclusive(struct device *dev, int num_consumers,
+						   struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get_const(
 	struct device *dev, int num_consumers,
 	const struct regulator_bulk_data *in_consumers,
-- 
2.38.1

