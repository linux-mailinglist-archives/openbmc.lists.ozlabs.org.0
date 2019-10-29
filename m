Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E015AE8F4E
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 19:30:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472gB36jCfzF1kQ
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 05:30:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M+qU0iVJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472fzr355nzDvrJ
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 05:21:27 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f19so10110081pgn.13
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Clfao4MVfwGCKR4XCTV4NJFDPI9oRu0IBr+PjR38taY=;
 b=M+qU0iVJbGu6eocJhpsmlmI3VM3sLtX/nbW/2eqHj19XeNkwhYbnHWpVGn7oEXEcSt
 bs617WGfD3jdSfUIkwQnfOI8QW8VCNj0cfZ6bbB7KeJhy+BGJewfE+KpxdeguCn/eY20
 Uxxdjw8JiTuUAiodTVp4iwRDY8Tq/wZTgvvVOn/Zm8XVinTKtWlz5T3N7qAaMxBQY23v
 nw7QvVjwDUJkbng/f53NDqCPNd9CHRTbbzCbn8qE4nAndkynvAaqHR3GQGJr2lrb4oz8
 8Sr2QOW+fJKeXm8xGBeqom5w2eABXXgJ5kONrmYdaEm+F4MJV2Mo8vJ+sNSjvtd2INeq
 QJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Clfao4MVfwGCKR4XCTV4NJFDPI9oRu0IBr+PjR38taY=;
 b=QQ1lg5nEpIHuOuiDuqYmiOvPOmBEKzQ2iVcMFOOPRGyO7vh5jY+29jvYf6m6+oh4SG
 jfhKdfgsLw5DKdpJJH82TnTxH4EMcJQU90VP1FfJvzkVa8+gHZtqFfQksxei959iEMxb
 tuY7hj5XCprAJhG5vqFo3MmbwkLHsbKgP/JNAizWkhRl55QXDbaglW4+UDv1bgEL3fbY
 AG0CZ5CdNqTjQbyOlp/wwBo8gYg9mgWjXq/vv+ahcXV8rg9leT3NrOjxouvaC+FFQxoy
 0rnZD9i/IOIoVjeilCur+4Y+yCIVWfIrk8l3b5HGVpBs8VIjUlTQcqKC3Uk2hyMX6Jvx
 Hs1g==
X-Gm-Message-State: APjAAAWG0ai6bvZbVm1xQtVeZBWOi+ShiP93us664t0vFjMtprAzpVmR
 v/yMmhcfYXglhd5gCUR9vgM=
X-Google-Smtp-Source: APXvYqznjuwg+B00bepasMaHeTHS+v7IKuM7Ivz/IZ7YKTnSACmkS0/cTFPZvZVVm8kYjOB557Cb9A==
X-Received: by 2002:aa7:97b3:: with SMTP id d19mr28670644pfq.50.1572373284537; 
 Tue, 29 Oct 2019 11:21:24 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:3a3e])
 by smtp.gmail.com with ESMTPSA id j10sm13488418pfn.128.2019.10.29.11.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 11:21:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 1/2] hwmon: (pmbus) add driver for BEL PFE1100 and PFE3000
Date: Tue, 29 Oct 2019 11:20:53 -0700
Message-Id: <20191029182054.32279-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029182054.32279-1-rentao.bupt@gmail.com>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
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

Add "bel-pfe" pmbus driver to support hardware monitoring for BEL PFE1100
and PFE3000 power supplies.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - combined PFE1100 and PFE3000 driver logic into the single patch.
   - adjusted includes to alphabetic order.
   - updated PFE3000's page number from 8 to 7 because the last page is
     reserved.
   - fixed/removed typo in commit description.

 drivers/hwmon/pmbus/Kconfig   |   9 +++
 drivers/hwmon/pmbus/Makefile  |   1 +
 drivers/hwmon/pmbus/bel-pfe.c | 131 ++++++++++++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
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
index 000000000000..f236e18f45a5
--- /dev/null
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for BEL PFE family power supplies.
+ *
+ * Copyright (c) 2019 Facebook Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+enum chips {pfe1100, pfe3000};
+
+/*
+ * Disable status check for pfe3000 devices, because some devices report
+ * communication error (invalid command) for VOUT_MODE command (0x20)
+ * although correct VOUT_MODE (0x16) is returned: it leads to incorrect
+ * exponent in linear mode.
+ */
+static struct pmbus_platform_data pfe3000_plat_data = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
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
+
+	[pfe3000] = {
+		.pages = 7,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_VOLTAGE_OUT] = linear,
+		.format[PSC_CURRENT_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+		.format[PSC_POWER] = linear,
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_FAN] = linear,
+
+		/* Page 0: V1. */
+		.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			   PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12 |
+			   PMBUS_HAVE_VIN | PMBUS_HAVE_IIN |
+			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
+			   PMBUS_HAVE_TEMP3 | PMBUS_HAVE_STATUS_TEMP |
+			   PMBUS_HAVE_VCAP,
+
+		/* Page 1: Vsb. */
+		.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+			   PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+			   PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
+			   PMBUS_HAVE_POUT,
+
+		/*
+		 * Page 2: V1 Ishare.
+		 * Page 3: Reserved.
+		 * Page 4: V1 Cathode.
+		 * Page 5: Vsb Cathode.
+		 * Page 6: V1 Sense.
+		 */
+		.func[2] = PMBUS_HAVE_VOUT,
+		.func[4] = PMBUS_HAVE_VOUT,
+		.func[5] = PMBUS_HAVE_VOUT,
+		.func[6] = PMBUS_HAVE_VOUT,
+	},
+};
+
+static int pfe_pmbus_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	int model;
+
+	model = (int)id->driver_data;
+
+	/*
+	 * PFE3000-12-069RA devices may not stay in page 0 during device
+	 * probe which leads to probe failure (read status word failed).
+	 * So let's set the device to page 0 at the beginning.
+	 */
+	if (model == pfe3000) {
+		client->dev.platform_data = &pfe3000_plat_data;
+		i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
+	}
+
+	return pmbus_do_probe(client, id, &pfe_driver_info[model]);
+}
+
+static const struct i2c_device_id pfe_device_id[] = {
+	{"pfe1100", pfe1100},
+	{"pfe3000", pfe3000},
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

