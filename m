Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C44625215
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 05:02:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7lQK6fvzz3cMb
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 15:02:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=omKmN4ya;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=omKmN4ya;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7lKg5zwZz3cGH
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 14:57:59 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E58E166A;
	Thu, 10 Nov 2022 19:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668139075;
	bh=9XzyxCG+VrXJs0xHrgajhPg2J8eGKS09zggXsc8XXDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omKmN4yamHbQEoIkC+ul5lqCUoA69l9H4BiFuXl2P7aAf4DzLEGNMxPS/B+JwlhCL
	 /iayu/RVpUokimvpJ86qNmst5hNATiEux/YgtvXL2gmF3V0eWzvU/n2JGH0QLt+nCa
	 IyrrNmRn6B9Qpo1i27PlTAgdbv0Qyh7HcIfZ6MuM=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.0 1/7] regulator: Add devm helpers for get and enable
Date: Thu, 10 Nov 2022 19:57:41 -0800
Message-Id: <20221111035747.31663-2-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Matti Vaittinen <mazziesaccount@gmail.com>

A few regulator consumer drivers seem to be just getting a regulator,
enabling it and registering a devm-action to disable the regulator at
the driver detach and then forget about it.

We can simplify this a bit by adding a devm-helper for this pattern.
Add devm_regulator_get_enable() and devm_regulator_get_enable_optional()

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Link: https://lore.kernel.org/r/ed7b8841193bb9749d426f3cb3b199c9460794cd.1660292316.git.mazziesaccount@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit da279e6965b3838e99e5c0ab8f76b87bf86b31a5)
---
 drivers/regulator/devres.c         | 164 +++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h |  27 +++++
 2 files changed, 191 insertions(+)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 32823a87fd40..3265e75e97ab 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -70,6 +70,65 @@ struct regulator *devm_regulator_get_exclusive(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_get_exclusive);
 
+static void regulator_action_disable(void *d)
+{
+	struct regulator *r = (struct regulator *)d;
+
+	regulator_disable(r);
+}
+
+static int _devm_regulator_get_enable(struct device *dev, const char *id,
+				      int get_type)
+{
+	struct regulator *r;
+	int ret;
+
+	r = _devm_regulator_get(dev, id, get_type);
+	if (IS_ERR(r))
+		return PTR_ERR(r);
+
+	ret = regulator_enable(r);
+	if (!ret)
+		ret = devm_add_action_or_reset(dev, &regulator_action_disable, r);
+
+	if (ret)
+		devm_regulator_put(r);
+
+	return ret;
+}
+
+/**
+ * devm_regulator_get_enable_optional - Resource managed regulator get and enable
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * Get and enable regulator for duration of the device life-time.
+ * regulator_disable() and regulator_put() are automatically called on driver
+ * detach. See regulator_get_optional() and regulator_enable() for more
+ * information.
+ */
+int devm_regulator_get_enable_optional(struct device *dev, const char *id)
+{
+	return _devm_regulator_get_enable(dev, id, OPTIONAL_GET);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_enable_optional);
+
+/**
+ * devm_regulator_get_enable - Resource managed regulator get and enable
+ * @dev: device to supply
+ * @id:  supply name or regulator ID.
+ *
+ * Get and enable regulator for duration of the device life-time.
+ * regulator_disable() and regulator_put() are automatically called on driver
+ * detach. See regulator_get() and regulator_enable() for more
+ * information.
+ */
+int devm_regulator_get_enable(struct device *dev, const char *id)
+{
+	return _devm_regulator_get_enable(dev, id, NORMAL_GET);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_get_enable);
+
 /**
  * devm_regulator_get_optional - Resource managed regulator_get_optional()
  * @dev: device to supply
@@ -194,6 +253,111 @@ int devm_regulator_bulk_get_const(struct device *dev, int num_consumers,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_bulk_get_const);
 
+static int devm_regulator_bulk_match(struct device *dev, void *res,
+				     void *data)
+{
+	struct regulator_bulk_devres *match = res;
+	struct regulator_bulk_data *target = data;
+
+	/*
+	 * We check the put uses same consumer list as the get did.
+	 * We _could_ scan all entries in consumer array and check the
+	 * regulators match but ATM I don't see the need. We can change this
+	 * later if needed.
+	 */
+	return match->consumers == target;
+}
+
+/**
+ * devm_regulator_bulk_put - Resource managed regulator_bulk_put()
+ * @consumers: consumers to free
+ *
+ * Deallocate regulators allocated with devm_regulator_bulk_get(). Normally
+ * this function will not need to be called and the resource management
+ * code will ensure that the resource is freed.
+ */
+void devm_regulator_bulk_put(struct regulator_bulk_data *consumers)
+{
+	int rc;
+	struct regulator *regulator = consumers[0].consumer;
+
+	rc = devres_release(regulator->dev, devm_regulator_bulk_release,
+			    devm_regulator_bulk_match, consumers);
+	if (rc != 0)
+		WARN_ON(rc);
+}
+EXPORT_SYMBOL_GPL(devm_regulator_bulk_put);
+
+static void devm_regulator_bulk_disable(void *res)
+{
+	struct regulator_bulk_devres *devres = res;
+	int i;
+
+	for (i = 0; i < devres->num_consumers; i++)
+		regulator_disable(devres->consumers[i].consumer);
+}
+
+/**
+ * devm_regulator_bulk_get_enable - managed get'n enable multiple regulators
+ *
+ * @dev:           device to supply
+ * @num_consumers: number of consumers to register
+ * @id:            list of supply names or regulator IDs
+ *
+ * @return 0 on success, an errno on failure.
+ *
+ * This helper function allows drivers to get several regulator
+ * consumers in one operation with management, the regulators will
+ * automatically be freed when the device is unbound.  If any of the
+ * regulators cannot be acquired then any regulators that were
+ * allocated will be freed before returning to the caller.
+ */
+int devm_regulator_bulk_get_enable(struct device *dev, int num_consumers,
+				   const char * const *id)
+{
+	struct regulator_bulk_devres *devres;
+	struct regulator_bulk_data *consumers;
+	int i, ret;
+
+	devres = devm_kmalloc(dev, sizeof(*devres), GFP_KERNEL);
+	if (!devres)
+		return -ENOMEM;
+
+	devres->consumers = devm_kcalloc(dev, num_consumers, sizeof(*consumers),
+					 GFP_KERNEL);
+	consumers = devres->consumers;
+	if (!consumers)
+		return -ENOMEM;
+
+	devres->num_consumers = num_consumers;
+
+	for (i = 0; i < num_consumers; i++)
+		consumers[i].supply = id[i];
+
+	ret = devm_regulator_bulk_get(dev, num_consumers, consumers);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_consumers; i++) {
+		ret = regulator_enable(consumers[i].consumer);
+		if (ret)
+			goto unwind;
+	}
+
+	ret = devm_add_action(dev, devm_regulator_bulk_disable, devres);
+	if (!ret)
+		return 0;
+
+unwind:
+	while (--i >= 0)
+		regulator_disable(consumers[i].consumer);
+
+	devm_regulator_bulk_put(consumers);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_regulator_bulk_get_enable);
+
 static void devm_rdev_release(struct device *dev, void *res)
 {
 	regulator_unregister(*(struct regulator_dev **)res);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index bc6cda706d1f..ee3b4a014611 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -207,6 +207,8 @@ struct regulator *__must_check regulator_get_optional(struct device *dev,
 						      const char *id);
 struct regulator *__must_check devm_regulator_get_optional(struct device *dev,
 							   const char *id);
+int devm_regulator_get_enable(struct device *dev, const char *id);
+int devm_regulator_get_enable_optional(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
@@ -244,12 +246,15 @@ int __must_check regulator_bulk_get(struct device *dev, int num_consumers,
 				    struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get(struct device *dev, int num_consumers,
 					 struct regulator_bulk_data *consumers);
+void devm_regulator_bulk_put(struct regulator_bulk_data *consumers);
 int __must_check devm_regulator_bulk_get_const(
 	struct device *dev, int num_consumers,
 	const struct regulator_bulk_data *in_consumers,
 	struct regulator_bulk_data **out_consumers);
 int __must_check regulator_bulk_enable(int num_consumers,
 				       struct regulator_bulk_data *consumers);
+int devm_regulator_bulk_get_enable(struct device *dev, int num_consumers,
+				   const char * const *id);
 int regulator_bulk_disable(int num_consumers,
 			   struct regulator_bulk_data *consumers);
 int regulator_bulk_force_disable(int num_consumers,
@@ -354,6 +359,17 @@ devm_regulator_get_exclusive(struct device *dev, const char *id)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline int devm_regulator_get_enable(struct device *dev, const char *id)
+{
+	return -ENODEV;
+}
+
+static inline int devm_regulator_get_enable_optional(struct device *dev,
+						     const char *id)
+{
+	return -ENODEV;
+}
+
 static inline struct regulator *__must_check
 regulator_get_optional(struct device *dev, const char *id)
 {
@@ -375,6 +391,10 @@ static inline void devm_regulator_put(struct regulator *regulator)
 {
 }
 
+static inline void devm_regulator_bulk_put(struct regulator_bulk_data *consumers)
+{
+}
+
 static inline int regulator_register_supply_alias(struct device *dev,
 						  const char *id,
 						  struct device *alias_dev,
@@ -465,6 +485,13 @@ static inline int regulator_bulk_enable(int num_consumers,
 	return 0;
 }
 
+static inline int devm_regulator_bulk_get_enable(struct device *dev,
+						 int num_consumers,
+						 const char * const *id)
+{
+	return 0;
+}
+
 static inline int regulator_bulk_disable(int num_consumers,
 					 struct regulator_bulk_data *consumers)
 {
-- 
2.38.1

