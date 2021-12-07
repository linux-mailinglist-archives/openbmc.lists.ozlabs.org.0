Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8AB46B38D
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 08:17:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7WpQ4F03z2ygC
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 18:17:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=iwXCxdWK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=iwXCxdWK; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7WnK4cLbz2yNr
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 18:16:37 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9E5AB613;
 Mon,  6 Dec 2021 23:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638861395;
 bh=PIgWBfr7NlDyLh1IthwfQRyuqF481hHqjknNlJLAOVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iwXCxdWKSMwEUxASGsXG6oodySehPT6euHr/8CghUCnj7Z+GUGBryX8GWwjIeqNnv
 IUwgWnNJRiTcbm+rg8LskGZzE8uvgtQmrMXF2jVZwzSlsLMrSSi5HBqMVESYcDLV9B
 9ngCHIomAYE2nmB+zfrKEY+DO8LX3HjaZTxyFdiU=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (pmbus) Add Delta AHE-50DC fan control module
 driver
Date: Mon,  6 Dec 2021 23:15:20 -0800
Message-Id: <20211207071521.543-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211207071521.543-1-zev@bewilderbeest.net>
References: <20211207071521.543-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 Zev Weiss <zev@bewilderbeest.net>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This device is an integrated module of the Delta AHE-50DC Open19 power
shelf.  For lack of proper documentation, this driver has been developed
referencing an existing (GPL) driver that was included in a code release
from LinkedIn [1].  It provides four fan speeds, four temperatures, and
one voltage reading, as well as a handful of warning and fault
indicators.

[1] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 MAINTAINERS                             |  6 ++
 drivers/hwmon/pmbus/Kconfig             | 12 ++++
 drivers/hwmon/pmbus/Makefile            |  1 +
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c | 84 +++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/delta-ahe50dc-fan.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ac052200ecb..8bb7ba52d2f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5425,6 +5425,12 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/platform/sti/delta
 
+DELTA AHE-50DC FAN CONTROL MODULE DRIVER
+M:	Zev Weiss <zev@bewilderbeest.net>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	drivers/hwmon/pmbus/delta-ahe50dc-fan.c
+
 DELTA DPS920AB PSU DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..937e1c2c11e7 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -66,6 +66,18 @@ config SENSORS_BPA_RS600
 	  This driver can also be built as a module. If so, the module will
 	  be called bpa-rs600.
 
+config SENSORS_DELTA_AHE50DC_FAN
+	tristate "Delta AHE-50DC fan control module"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get hardware monitoring support for
+	  the integrated fan control module of the Delta AHE-50DC
+	  Open19 power shelf.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called delta-ahe50dc-fan.
+
 config SENSORS_FSP_3Y
 	tristate "FSP/3Y-Power power supplies"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..a56b2897288d 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
 obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
+obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
 obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
new file mode 100644
index 000000000000..07b1e7c5f5f5
--- /dev/null
+++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Delta AHE-50DC power shelf fan control module driver
+ *
+ * Copyright 2021 Zev Weiss <zev@bewilderbeest.net>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+#define AHE50DC_PMBUS_READ_TEMP4 0xd0
+
+static int ahe50dc_fan_read_word_data(struct i2c_client *client, int page, int phase, int reg)
+{
+	/* temp1 in (virtual) page 1 is remapped to mfr-specific temp4 */
+	if (page == 1) {
+		if (reg == PMBUS_READ_TEMPERATURE_1)
+			return i2c_smbus_read_word_data(client, AHE50DC_PMBUS_READ_TEMP4);
+		return -EOPNOTSUPP;
+	}
+	return -ENODATA;
+}
+
+static struct pmbus_driver_info ahe50dc_fan_info = {
+	.pages = 2,
+	.format[PSC_FAN] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.m[PSC_FAN] = 1,
+	.b[PSC_FAN] = 0,
+	.R[PSC_FAN] = 0,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 1,
+	.m[PSC_VOLTAGE_IN] = 1,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 3,
+	.func[0] = PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		PMBUS_HAVE_VIN | PMBUS_HAVE_FAN12 | PMBUS_HAVE_FAN34 |
+		PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_STATUS_FAN34 | PMBUS_PAGE_VIRTUAL,
+	.func[1] = PMBUS_HAVE_TEMP | PMBUS_PAGE_VIRTUAL,
+	.read_word_data = ahe50dc_fan_read_word_data,
+};
+
+static struct pmbus_platform_data ahe50dc_fan_data = {
+	.flags = PMBUS_NO_CAPABILITY,
+};
+
+static int ahe50dc_fan_probe(struct i2c_client *client)
+{
+	client->dev.platform_data = &ahe50dc_fan_data;
+	return pmbus_do_probe(client, &ahe50dc_fan_info);
+}
+
+static const struct i2c_device_id ahe50dc_fan_id[] = {
+	{ "ahe50dc_fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ahe50dc_fan_id);
+
+static const struct of_device_id __maybe_unused ahe50dc_fan_of_match[] = {
+	{ .compatible = "delta,ahe50dc-fan" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ahe50dc_fan_of_match);
+
+static struct i2c_driver ahe50dc_fan_driver = {
+	.driver = {
+		   .name = "ahe50dc_fan",
+		   .of_match_table = of_match_ptr(ahe50dc_fan_of_match),
+	},
+	.probe_new = ahe50dc_fan_probe,
+	.id_table = ahe50dc_fan_id,
+};
+module_i2c_driver(ahe50dc_fan_driver);
+
+MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
+MODULE_DESCRIPTION("Driver for Delta AHE-50DC power shelf fan control module");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
-- 
2.34.1

