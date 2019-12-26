Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2912AB20
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 09:58:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k3lK6nRlzDq7d
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 19:58:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.115;
 helo=mail1.bemta23.messagelabs.com; envelope-from=pengms1@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k3kS6WxCzDq5k
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 19:57:36 +1100 (AEDT)
Received: from [67.219.246.207] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-east-1.aws.symcld.net id 4B/46-19290-DF5740E5;
 Thu, 26 Dec 2019 08:57:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmkeJIrShJLcpLzFFi42LJePGQW/dvKUu
 cQdcJQYsZex8wW5ydEGjR/noro8XlXXPYLJ4sPMNkcarlBYsDm8eCTaUe52csZPTY+b2B3WP9
 lqssHp83yQWwRrFm5iXlVySwZjz7e4i1oCem4nHDHqYGxul+XYxcHEICHUwSe253snUxcgI5s
 xkl7l1MALHZBNQkTs6+xwpiiwg0MkqsfOsP0sAs0MQoseLhZbCEsECpxMZ9m1hAbBYBVYnvk8
 8wgdi8As4Sh/suMoLYEgJyEjfPdTJPYORcwMiwitE0qSgzPaMkNzEzR9fQwEDX0NBI10TX2EI
 vsUo3Wa+0WDc1sbhE11AvsbxYr7gyNzknRS8vtWQTIzA8UgpY1HYwHvv6Vu8QoyQHk5Iob7wX
 U5wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7bApY4IcGi1PTUirTMHGCowqQlOHiURHiFgOEqx
 FtckJhbnJkOkTrFqMtxe8OSRcxCLHn5ealS4rxmIEUCIEUZpXlwI2Bxc4lRVkqYl5GBgUGIpy
 C1KDezBFX+FaM4B6OSMO/DEqApPJl5JXCbXgEdwQR0xEchJpAjShIRUlINTJy3b6/46caey3K
 ePfvCu4TOzduvHfr1WUV6atwb3iN7vp9LW7Sv7O7ShfNmzj/0fMPUeoeAYwwV2cXHD6vO5LC6
 s2/5ASmpZE+vd/t65Nzv5i77NkfOVYMnbPmRg3HMgb90lh+QDAjSO+THbfLv1Y2/1er7d60Lv
 1low1J542BNzbmiiXckyitqT0jJfXKd++WIpnqoyJU7z/OKhQ9InNpwxjq7UHTJ+v7nt3p2pL
 xvm3RZ8Hj6waRUt88H/xR/5/Keejv8+DLRe1v+293/r5BqEnxg5o/AD1Y2bx/cLVNLbT66+Kd
 yo/dL21Z5t663L2/ElSiuyil5tvjlp5ldQbfcRELX2ryzsN4+w0FLfMJ8JZbijERDLeai4kQA
 HrU3rhYDAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-28.tower-415.messagelabs.com!1577350653!852662!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27592 invoked from network); 26 Dec 2019 08:57:33 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.11)
 by server-28.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Dec 2019 08:57:33 -0000
Received: from smtpinternal.lenovo.com (unknown [10.96.80.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 48A7B22DA8BE69A31101;
 Thu, 26 Dec 2019 03:57:31 -0500 (EST)
Received: from hsbmc.10.240.0.10 (unknown [10.245.100.154])
 by Forcepoint Email with ESMTP id 50FF6529B030E9DB2A42;
 Thu, 26 Dec 2019 16:57:29 +0800 (CST)
From: Andrew Peng <pengms1@lenovo.com>
To: linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjaminfair@google.com
Subject: [PATCH linux dev-5.4 v1 0/1] hwmon: (pmbus) Add Infineon IR38164,
 Renesas RAA228006, and TI SN1701022 driver
Date: Thu, 26 Dec 2019 16:57:27 +0800
Message-Id: <1577350647-128938-1-git-send-email-pengms1@lenovo.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Andrew Peng <pengms1@lenovo.com>, openbmc@lists.ozlabs.org,
 Yonghui Liu <liuyh21@lenovo.com>, Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the pmbus driver for Infineon IR38164 Voltage Regulator driver.
Add the pmbus driver for Renesas RAA228006 Digital PWM Controller.
Add the pmbus driver for TI SN1701022 driver.

Signed-off-by: Andrew Peng <pengms1@lenovo.com>
Signed-off-by: Derek Lin <dlin23@lenovo.com>
Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
---
v1: initial version

 drivers/hwmon/pmbus/Kconfig     |  25 ++++++++
 drivers/hwmon/pmbus/Makefile    |   3 +
 drivers/hwmon/pmbus/ir38164.c   |  72 +++++++++++++++++++++++
 drivers/hwmon/pmbus/raa228006.c | 127 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/sn1701022.c |  80 +++++++++++++++++++++++++
 5 files changed, 307 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ir38164.c
 create mode 100644 drivers/hwmon/pmbus/raa228006.c
 create mode 100644 drivers/hwmon/pmbus/sn1701022.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 6106263..2312b58 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -73,6 +73,15 @@ config SENSORS_IR38064
 	  This driver can also be built as a module. If so, the module will
 	  be called ir38064.
 
+config SENSORS_IR38164
+	tristate "Infineon IR38164"
+	help
+	  If you say yes here you get hardware monitoring support for Infineon
+	  IR38164.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called ir38164.
+
 config SENSORS_IRPS5401
 	tristate "Infineon IRPS5401"
 	help
@@ -230,4 +239,20 @@ config SENSORS_ZL6100
 	  This driver can also be built as a module. If so, the module will
 	  be called zl6100.
 
+config SENSORS_RAA228006
+	tristate "RAA228006 and compatibles"
+	help
+	  If you say yes here you get hardware monitoring support for RAA228006.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called RAA228006.
+
+config SENSORS_SN1701022
+	tristate "SN1701022"
+	help
+	  If you say yes here you get hardware monitoring support for SN1701022.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called sn1701022.
+
 endif # PMBUS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 03bacfc..ba3aed5 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
 obj-$(CONFIG_SENSORS_INSPUR_IPSPS) += inspur-ipsps.o
 obj-$(CONFIG_SENSORS_IR35221)	+= ir35221.o
 obj-$(CONFIG_SENSORS_IR38064)	+= ir38064.o
+obj-$(CONFIG_SENSORS_IR38164)	+= ir38164.o
 obj-$(CONFIG_SENSORS_IRPS5401)	+= irps5401.o
 obj-$(CONFIG_SENSORS_ISL68137)	+= isl68137.o
 obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
@@ -26,3 +27,5 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
+obj-$(CONFIG_SENSORS_RAA228006)	+= raa228006.o
+obj-$(CONFIG_SENSORS_SN1701022)	+= sn1701022.o
diff --git a/drivers/hwmon/pmbus/ir38164.c b/drivers/hwmon/pmbus/ir38164.c
new file mode 100644
index 0000000..db89473
--- /dev/null
+++ b/drivers/hwmon/pmbus/ir38164.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for Infineon ir38164
+ *
+ * Copyright (C) 2019-present Lenovo
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor,
+ * Boston, MA  02110-1301, USA.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info ir38164_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = linear,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT,
+};
+
+static int ir38164_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &ir38164_info);
+}
+
+static const struct i2c_device_id ir38164_id[] = {
+	{"ir38164", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, ir38164_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver ir38164_driver = {
+	.driver = {
+		   .name = "ir38164",
+		   },
+	.probe = ir38164_probe,
+	.remove = pmbus_do_remove,
+	.id_table = ir38164_id,
+};
+
+module_i2c_driver(ir38164_driver);
+
+MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
+MODULE_DESCRIPTION("PMBus driver for Infineon ir38164");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/pmbus/raa228006.c b/drivers/hwmon/pmbus/raa228006.c
new file mode 100644
index 0000000..9aed481
--- /dev/null
+++ b/drivers/hwmon/pmbus/raa228006.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for raa228006
+ *
+ * Copyright (C) 2019-present Lenovo
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor,
+ * Boston, MA  02110-1301, USA.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static int raa228006_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct pmbus_driver_info *info;
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_READ_BYTE_DATA
+				| I2C_FUNC_SMBUS_READ_WORD_DATA
+				| I2C_FUNC_SMBUS_READ_BLOCK_DATA))
+		return -ENODEV;
+
+	/* By default this device doesn't boot to page 0, so set page 0
+	 * to access all pmbus registers.
+	 */
+
+	i2c_smbus_write_byte_data(client, 0, 0);
+
+	/* Read Manufacturer id */
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
+		return ret;
+	}
+
+	info = devm_kzalloc(&client->dev, sizeof(struct pmbus_driver_info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->format[PSC_VOLTAGE_IN] = direct;
+	info->format[PSC_VOLTAGE_OUT] = direct;
+	info->format[PSC_CURRENT_IN] = direct;
+	info->format[PSC_CURRENT_OUT] = direct;
+	info->format[PSC_POWER] = direct;
+	info->format[PSC_TEMPERATURE] = direct;
+	info->vrm_version = vr13;
+
+	info->m[PSC_VOLTAGE_IN] = 1,
+	info->b[PSC_VOLTAGE_IN] = 0,
+	info->R[PSC_VOLTAGE_IN] = 3,
+
+	info->m[PSC_VOLTAGE_OUT] = 1,
+	info->b[PSC_VOLTAGE_OUT] = 0,
+	info->R[PSC_VOLTAGE_OUT] = 0,
+
+	info->m[PSC_CURRENT_IN] = 1,
+	info->b[PSC_CURRENT_IN] = 0,
+	info->R[PSC_CURRENT_IN] = 1,
+
+	info->m[PSC_CURRENT_OUT] = 1,
+	info->b[PSC_CURRENT_OUT] = 0,
+	info->R[PSC_CURRENT_OUT] = 2,
+
+	info->m[PSC_POWER] = 1,
+	info->b[PSC_POWER] = 0,
+	info->R[PSC_POWER] = 3,
+
+	info->m[PSC_TEMPERATURE] = 1,
+	info->b[PSC_TEMPERATURE] = 0,
+	info->R[PSC_TEMPERATURE] = 3,
+
+	info->func[0] = PMBUS_HAVE_VIN
+		| PMBUS_HAVE_VOUT | PMBUS_HAVE_IIN
+		| PMBUS_HAVE_IOUT | PMBUS_HAVE_PIN
+		| PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP
+		| PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3
+		| PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT
+		| PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP;
+
+	info->pages = id->driver_data;
+
+	return pmbus_do_probe(client, id, info);
+}
+
+static const struct i2c_device_id raa228006_id[] = {
+	{"raa228006", 1},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, raa228006_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver raa228006_driver = {
+	.driver = {
+		   .name = "raa228006",
+		   },
+	.probe = raa228006_probe,
+	.remove = pmbus_do_remove,
+	.id_table = raa228006_id,
+};
+
+module_i2c_driver(raa228006_driver);
+
+MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
+MODULE_DESCRIPTION("PMBus driver for raa228006");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/pmbus/sn1701022.c b/drivers/hwmon/pmbus/sn1701022.c
new file mode 100644
index 0000000..0ba45ac
--- /dev/null
+++ b/drivers/hwmon/pmbus/sn1701022.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Hardware monitoring driver for sn1701022
+ *
+ * Copyright (C) 2019-present Lenovo
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin Street, Fifth Floor,
+ * Boston, MA  02110-1301, USA.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info sn1701022_info = {
+	.pages = 2,
+	.format[PSC_VOLTAGE_IN] = linear,
+	.format[PSC_VOLTAGE_OUT] = vid,
+	.vrm_version = vr12,
+	.format[PSC_CURRENT_OUT] = linear,
+	.format[PSC_CURRENT_IN] = linear,
+	.format[PSC_POWER] = linear,
+	.format[PSC_TEMPERATURE] = linear,
+
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT,
+
+	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+	    | PMBUS_HAVE_POUT,
+};
+
+static int sn1701022_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	return pmbus_do_probe(client, id, &sn1701022_info);
+}
+
+static const struct i2c_device_id sn1701022_id[] = {
+	{"sn1701022", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, sn1701022_id);
+
+/* This is the driver that will be inserted */
+static struct i2c_driver sn1701022_driver = {
+	.driver = {
+		   .name = "sn1701022",
+		   },
+	.probe = sn1701022_probe,
+	.remove = pmbus_do_remove,
+	.id_table = sn1701022_id,
+};
+
+module_i2c_driver(sn1701022_driver);
+
+MODULE_AUTHOR("Yonghui Liu <liuyh21@lenovo.com>");
+MODULE_DESCRIPTION("PMBus driver for  sn1701022");
+MODULE_LICENSE("GPL");
-- 
2.7.4

