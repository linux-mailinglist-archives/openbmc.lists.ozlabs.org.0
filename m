Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D75E969A
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 00:11:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbKpl2K8yz3bN6
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 08:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cP2gamUa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cP2gamUa;
	dkim-atps=neutral
X-Greylist: delayed 375 seconds by postgrey-1.36 at boromir; Mon, 26 Sep 2022 08:10:51 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbKpM6mBzz2xgN
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 08:10:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 2ED763BD;
	Sun, 25 Sep 2022 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1664143472;
	bh=54CarxfGVvUof/9qIVr0ut4k8aXovYrpOTYYHjV8uoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cP2gamUakgIlbxrUOI4X9QWeCkrwrJKF5sfq3z1X8h3s78S3dXINdnURzbxCn9QyE
	 BJzLfLK3id+MZbcuQ47NDx8BOF7ZJxoNOFzOyQgkf9fuvRJeWsiHEb01XSorzgaUy5
	 hwoCFhJGnLO+JmPPxQ3AJc12ZHlvmfMZIzZ4R1wU=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/3] regulator: devres: Add devm_regulator_bulk_get_exclusive()
Date: Sun, 25 Sep 2022 15:03:17 -0700
Message-Id: <20220925220319.12572-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925220319.12572-1-zev@bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
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

We had an exclusive variant of the devm_regulator_get() API, but no
corresponding variant for the bulk API; let's add one now.  We add a
generalized version of the existing regulator_bulk_get() function that
additionally takes a get_type parameter and redefine
regulator_bulk_get() in terms of it, then do similarly with
devm_regulator_bulk_get(), and finally add the new
devm_regulator_bulk_get_exclusive().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/regulator/core.c           | 42 +++++++++++--------
 drivers/regulator/devres.c         | 66 ++++++++++++++++++++++--------
 drivers/regulator/internal.h       |  2 +
 include/linux/regulator/consumer.h |  2 +
 4 files changed, 76 insertions(+), 36 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index d3e8dc32832d..1988859d8d02 100644
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
index 32823a87fd40..e32344829b4f 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -127,23 +127,9 @@ static void devm_regulator_bulk_release(struct device *dev, void *res)
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
@@ -153,7 +139,7 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 	if (!devres)
 		return -ENOMEM;
 
-	ret = regulator_bulk_get(dev, num_consumers, consumers);
+	ret = _regulator_bulk_get(dev, num_consumers, consumers, get_type);
 	if (!ret) {
 		devres->consumers = consumers;
 		devres->num_consumers = num_consumers;
@@ -164,8 +150,52 @@ int devm_regulator_bulk_get(struct device *dev, int num_consumers,
 
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
index bc6cda706d1f..e123cdc91d24 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -244,6 +244,8 @@ int __must_check regulator_bulk_get(struct device *dev, int num_consumers,
 				    struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get(struct device *dev, int num_consumers,
 					 struct regulator_bulk_data *consumers);
+int __must_check devm_regulator_bulk_get_exclusive(struct device *dev, int num_consumers,
+						   struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get_const(
 	struct device *dev, int num_consumers,
 	const struct regulator_bulk_data *in_consumers,
-- 
2.37.3

