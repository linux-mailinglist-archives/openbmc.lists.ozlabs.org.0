Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E322A5197B2
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSKW5BMJz3bcy
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:56:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mX7+SrYA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=mX7+SrYA; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSFq4c6Sz3064
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 16:53:03 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5B216C64;
 Tue,  3 May 2022 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651647181;
 bh=T+pl3SJCSzXLJOiH4mZIAgFL9b9XXugAhhglLLH5nDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mX7+SrYAMIBw0ZLAA5ZzfrgVbR8MjFejgzDqwOnI8FCj2J1NgvmTaWjXI+clUMs0N
 jR6qTIFaLnCw7hHAh74Z03lX/zB5GpyDTYCtkHc+Z170TfVPhO+XpLSTpxFWKm2z8K
 qWSrjHbBxfJbard91MS1vaOx+QKoy65660GrjmCg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 6/6] regulator: core: Add external-consumer driver
Date: Tue,  3 May 2022 23:52:52 -0700
Message-Id: <20220504065252.6955-6-zev@bewilderbeest.net>
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

An external consumer is a dummy device representing a device external
to the system that is supplied by a regulator designated for external
output.  It is purely a virtual placeholder to instantiate a regulator
by calling regulator_get() on it from its probe function.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/regulator/Kconfig |  9 +++++++++
 drivers/regulator/core.c  | 28 ++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 5ef2306fce04..5ec390687a81 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -56,6 +56,15 @@ config REGULATOR_USERSPACE_CONSUMER
 
 	  If unsure, say no.
 
+config REGULATOR_EXTERNAL_CONSUMER
+	bool "External regulator consumer support"
+	help
+	  Some regulators supply devices that are entirely external to
+	  the system.  This driver provides a placeholder consumer
+	  representing such devices.
+
+	  If unsure, say no.
+
 config REGULATOR_88PG86X
 	tristate "Marvell 88PG86X voltage regulators"
 	depends on I2C
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index d873606eb41f..4f348b3d5290 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -19,6 +19,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regulator/consumer.h>
@@ -6070,6 +6071,33 @@ static int regulator_summary_show(struct seq_file *s, void *data)
 DEFINE_SHOW_ATTRIBUTE(regulator_summary);
 #endif /* CONFIG_DEBUG_FS */
 
+#ifdef CONFIG_REGULATOR_EXTERNAL_CONSUMER
+static int regulator_external_output_probe(struct platform_device *pdev)
+{
+	struct regulator *reg;
+
+	reg = devm_regulator_get_external(&pdev->dev, "vout");
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	return 0;
+}
+
+static const struct of_device_id reg_external_consumer_of_match_table[] = {
+	{ .compatible = "regulator-external-output" },
+	{ },
+};
+
+static struct platform_driver reg_external_consumer_driver = {
+	.driver = {
+		.name = "reg-external-consumer",
+		.of_match_table = reg_external_consumer_of_match_table,
+	},
+	.probe = regulator_external_output_probe,
+};
+builtin_platform_driver(reg_external_consumer_driver);
+#endif /* CONFIG_REGULATOR_EXTERNAL_CONSUMER */
+
 static int __init regulator_init(void)
 {
 	int ret;
-- 
2.36.0

