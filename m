Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD683E7D41
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 00:50:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472BKz159CzF0WP
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 10:50:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gvCOXy/A"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472BJk0Mw5zDrdh
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 10:49:25 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id c8so8141199pgb.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 16:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KUGQ/r655QOzhF8y8PZXKFFUJNm6vbuBEcIikKPosIk=;
 b=gvCOXy/AmjPJG9Au95pDstcxJyiVgdnOiM7g6r9Mvoc7HQKAXyPdIcDaDZVNhbNMTu
 aeDUOQgXB/9BSiKMiDyFBQ8gei9wo1w34Il1GIcW0XX8VpojdcznlZzOC/Ucv+EfhMo2
 9NbmGKfhduldh/Gf3Xw4+Sm/uHGa/pFyesLWBbWwipUsE1cw9ohIi3JxJYc1gGnRiGT5
 67bYqTImcYLNOu9pasOq5qLNGOBYKt3VEKq0RHADaRlWNFPtJ5/KjOVg6iHRNknFqTGr
 MFsGlXwPr8Y/81bIATvsNgwkpoJvaaE+TjUA7a41c9e5MgN2pjNAVfyiIdaLdd0SG1wh
 4oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KUGQ/r655QOzhF8y8PZXKFFUJNm6vbuBEcIikKPosIk=;
 b=gCfLEBalzjwnGAuUfKvdt6hVqH/qFL+fTzbB1bLElI+guDVFxSL3QmabrXPLgll/0L
 6Uzege7JTSnVGy9tvC4Qv+98PFV/IAUp9V2sYGj19r9G1CYBQEuELHLvQkqyq5e1dR/A
 OkhivYsakE/lmYDel/7s7MvRpunDl6eSt5tuGGH0ZLbPC6NrbbTMKFXwGs+EPC8mqh5Z
 p7ZI53q0awdAI+t9cLguxLcafav7CsY/sI9tmX6LHGllAFfevwD/ieo3i/G9LevX/fgP
 qkBPYtUlsxut9O3+7aUg+2nSE4sGgJKpsEwL5r6PFih0c+N8spg/tUvY/1bxHvybUKip
 X+ZA==
X-Gm-Message-State: APjAAAXKVcnmnQuO8Kpz6iw1znDDsuI5+3KNk440QqDx+17ohJFEz5j1
 +f8l7hWSQvMXfY9MERs4E/eJKMuG8nk=
X-Google-Smtp-Source: APXvYqyB/VIWUUD6euIc1wIAj7+Kw8nEW24WdP9LBMqAwLPwyQpm/OUafznT7RjIrvuNsjxE/Wnw0A==
X-Received: by 2002:a17:90a:7bcc:: with SMTP id
 d12mr2429491pjl.63.1572306563244; 
 Mon, 28 Oct 2019 16:49:23 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:c0c7])
 by smtp.gmail.com with ESMTPSA id d4sm597119pjs.9.2019.10.28.16.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 16:49:22 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/3] hwmon: (pmbus) add BEL PFE1100 power supply driver
Date: Mon, 28 Oct 2019 16:49:02 -0700
Message-Id: <20191028234904.12441-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028234904.12441-1-rentao.bupt@gmail.com>
References: <20191028234904.12441-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add the driver to support BEL PFE1100 which is 1100 Wat AC to DC power
supply. The chip has only 1 page.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/hwmon/pmbus/Kconfig   |  9 +++++
 drivers/hwmon/pmbus/Makefile  |  1 +
 drivers/hwmon/pmbus/bel-pfe.c | 68 +++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/bel-pfe.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index d62d69bb7e49..59859979571d 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -36,6 +36,15 @@ config SENSORS_ADM1275
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
 
+config SENSORS_BEL_PFE
+	tristate "Bel PFE Compatible Power Supplies"
+	help
+	  If you say yes here you get hardware monitoring support for BEL
+	  PFE1100 and PFE3000 Power Supplies.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called bel-pfe.
+
 config SENSORS_IBM_CFFPS
 	tristate "IBM Common Form Factor Power Supply"
 	depends on LEDS_CLASS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 03bacfcfd660..3f8c1014938b 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
 obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
 obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
new file mode 100644
index 000000000000..117f9af21bf3
--- /dev/null
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for BEL PFE family power supplies.
+ *
+ * Copyright (c) 2019 Facebook Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include "pmbus.h"
+
+enum chips {pfe1100};
+
+static struct pmbus_driver_info pfe_driver_info[] = {
+	[pfe1100] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_POWER] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_FAN] = linear,
+
+		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			   PMBUS_HAVE_POUT |
+			   PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |
+			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+			   PMBUS_HAVE_STATUS_TEMP |
+			   PMBUS_HAVE_FAN12,
+	},
+};
+
+static int pfe_pmbus_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	int model;
+
+	model = (int)id->driver_data;
+	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
+}
+
+static const struct i2c_device_id pfe_device_id[] = {
+	{"pfe1100", pfe1100},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, pfe_device_id);
+
+static struct i2c_driver pfe_pmbus_driver = {
+	.driver = {
+		   .name = "bel-pfe",
+	},
+	.probe = pfe_pmbus_probe,
+	.remove = pmbus_do_remove,
+	.id_table = pfe_device_id,
+};
+
+module_i2c_driver(pfe_pmbus_driver);
+
+MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
+MODULE_DESCRIPTION("PMBus driver for BEL PFE Family Power Supplies");
+MODULE_LICENSE("GPL");
-- 
2.17.1

