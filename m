Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A14B9D7C
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 11:47:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzs321Vfgz3cP5
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 21:47:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jciqh0ot;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=jciqh0ot; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzs1y0hM0z3bTP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 21:46:13 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3C96CB98;
 Thu, 17 Feb 2022 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645094770;
 bh=SQvjKarSQnVSfGUf/SQbGhZom4+CH6pepOFEZVx59+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jciqh0otGJbTdn+SOnWBhWfeeNq0M5QiC59ykWAB5/I4N9BHwU3qvZE+ICRe/6NtL
 F267ucv4WMc0vCp9PeTavnmTGzo0j0nRi1buS1qFw/vIhAtbRm6/egmp79dtr4aN5v
 3XLOOP1UKHTYX8t/hIGm50smYUaB9fwWLYgxJA/0=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH 2/4] hwmon: (pmbus) lm25066: Add regulator support
Date: Thu, 17 Feb 2022 02:44:42 -0800
Message-Id: <20220217104444.7695-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217104444.7695-1-zev@bewilderbeest.net>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

While these chips aren't strictly advertised as voltage regulators per
se, they (aside from the lm25056) support the PMBus OPERATION command
to enable and disable their outputs and have status bits for reporting
various warnings and faults, and can hence usefully support all the
pmbus_regulator_ops operations.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/hwmon/pmbus/Kconfig   |  7 +++++++
 drivers/hwmon/pmbus/lm25066.c | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 41f6cbf96d3b..4acf63fd69b2 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -174,6 +174,13 @@ config SENSORS_LM25066
 	  This driver can also be built as a module. If so, the module will
 	  be called lm25066.
 
+config SENSORS_LM25066_REGULATOR
+	bool "Regulator support for LM25066 and compatibles"
+	depends on SENSORS_LM25066 && REGULATOR
+	help
+	  If you say yes here you get regulator support for National
+	  Semiconductor LM25066, LM5064, and LM5066.
+
 config SENSORS_LTC2978
 	tristate "Linear Technologies LTC2978 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 8402b41520eb..09792cd03d9f 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -435,6 +435,12 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
+static const struct regulator_desc lm25066_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+#endif
+
 static const struct i2c_device_id lm25066_id[] = {
 	{"lm25056", lm25056},
 	{"lm25066", lm25066},
@@ -545,6 +551,14 @@ static int lm25066_probe(struct i2c_client *client)
 	info->m[PSC_CURRENT_IN] = info->m[PSC_CURRENT_IN] * shunt / 1000;
 	info->m[PSC_POWER] = info->m[PSC_POWER] * shunt / 1000;
 
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
+	/* LM25056 doesn't support OPERATION */
+	if (data->id != lm25056) {
+		info->num_regulators = ARRAY_SIZE(lm25066_reg_desc);
+		info->reg_desc = lm25066_reg_desc;
+	}
+#endif
+
 	return pmbus_do_probe(client, info);
 }
 
-- 
2.35.1

