Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4845197AF
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:55:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSJr4vv8z3bXN
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=XIAM0IKu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=XIAM0IKu; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSFq1Jslz3064
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 16:53:02 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 216F3B99;
 Tue,  3 May 2022 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651647181;
 bh=m4z66kOy61XB3YkIh8WlfoxIbCbvY+16ZM4qwHUbBBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIAM0IKuWfkMLBw5I6TN8RwRk6YfcPhRKWHhDJOoN2PFWLUeQpmPc9mW4qY/Su/wP
 8V7TBbkcdPHDuXYEnOszXdHw+qsgXuKmWaQ4YzNNooLxzW+U9Nw/2JFKiRCgQ+m/bh
 PUzPEPIwAfpc1m4LbXJ1K5jSIp9XB7O0X+dcK1Ng=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 5/6] regulator: core: Add external get type
Date: Tue,  3 May 2022 23:52:51 -0700
Message-Id: <20220504065252.6955-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504065252.6955-1-zev@bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

EXTERNAL_GET is similar to EXCLUSIVE_GET, but requires opt-in
agreement from the supply (whose constraints must designate it as
external_output).  It is intended for use only within the regulator
subsystem, and hence is not exposed in the public headers.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/regulator/core.c     | 16 +++++++++++++---
 drivers/regulator/devres.c   |  7 +++++++
 drivers/regulator/internal.h |  3 +++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index b7617926336f..d873606eb41f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2087,6 +2087,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	struct regulator_dev *rdev;
 	struct regulator *regulator;
 	struct device_link *link;
+	bool is_external;
 	int ret;
 
 	if (get_type >= MAX_GET_TYPE) {
@@ -2129,8 +2130,9 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 			break;
 
 		case EXCLUSIVE_GET:
+		case EXTERNAL_GET:
 			dev_warn(dev,
-				 "dummy supplies not allowed for exclusive requests\n");
+				 "dummy supplies not allowed for exclusive or external requests\n");
 			fallthrough;
 
 		default:
@@ -2144,12 +2146,20 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 		return regulator;
 	}
 
-	if (get_type == EXCLUSIVE_GET && rdev->open_count) {
+	if ((get_type == EXCLUSIVE_GET || get_type == EXTERNAL_GET) && rdev->open_count) {
 		regulator = ERR_PTR(-EBUSY);
 		put_device(&rdev->dev);
 		return regulator;
 	}
 
+	/* EXTERNAL_GET is valid if and only if the regulator is designated for external output */
+	is_external = rdev->constraints && rdev->constraints->external_output;
+	if ((get_type == EXTERNAL_GET) != is_external) {
+		regulator = ERR_PTR(-EINVAL);
+		put_device(&rdev->dev);
+		return regulator;
+	}
+
 	mutex_lock(&regulator_list_mutex);
 	ret = (rdev->coupling_desc.n_resolved != rdev->coupling_desc.n_coupled);
 	mutex_unlock(&regulator_list_mutex);
@@ -2182,7 +2192,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	}
 
 	rdev->open_count++;
-	if (get_type == EXCLUSIVE_GET) {
+	if (get_type == EXCLUSIVE_GET || get_type == EXTERNAL_GET) {
 		rdev->exclusive = 1;
 
 		ret = _regulator_is_enabled(rdev);
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 9113233f41cd..36df9e9ff175 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -70,6 +70,13 @@ struct regulator *devm_regulator_get_exclusive(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_get_exclusive);
 
+/* For regulator-core internal use only */
+struct regulator *devm_regulator_get_external(struct device *dev,
+					      const char *id)
+{
+	return _devm_regulator_get(dev, id, EXTERNAL_GET);
+}
+
 /**
  * devm_regulator_get_optional - Resource managed regulator_get_optional()
  * @dev: device to supply
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 1e9c71642143..c176a416c571 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -116,10 +116,13 @@ static inline bool of_check_coupling_data(struct regulator_dev *rdev)
 enum regulator_get_type {
 	NORMAL_GET,
 	EXCLUSIVE_GET,
+	EXTERNAL_GET,
 	OPTIONAL_GET,
 	MAX_GET_TYPE
 };
 
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
+struct regulator *devm_regulator_get_external(struct device *dev,
+					      const char *id);
 #endif
-- 
2.36.0

