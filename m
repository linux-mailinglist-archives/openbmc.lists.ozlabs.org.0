Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FB785BAE
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 09:37:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4640Zk5ttczDqdt
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 17:37:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.146; helo=unicom146.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom146.biz-email.net (unicom146.biz-email.net
 [210.51.26.146])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4640Z532KzzDqFZ
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 17:36:53 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom146.biz-email.net (Antispam) with ASMTP (SSL) id ZPS77040;
 Thu, 08 Aug 2019 15:36:40 +0800
Received: from localhost (10.100.1.52) by Jtjnmail201618.home.langchao.com
 (10.100.2.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 8 Aug 2019
 15:36:36 +0800
From: John Wang <wangzqbj@inspur.com>
To: <mine260309@gmail.com>, <linux@roeck-us.net>, <jdelvare@suse.com>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <joel@jms.id.au>, <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
 <duanzhijia01@inspur.com>
Subject: [PATCH] hwmon: pmbus: Add Inspur Power System power supply driver
Date: Thu, 8 Aug 2019 15:36:36 +0800
Message-ID: <20190808073636.18611-1-wangzqbj@inspur.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201610.home.langchao.com (10.100.2.10) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the driver to monitor Inspur Power System power supplies
with hwmon over pmbus.

This driver adds debugfs entries for addintional power supply data,
including vendor,model,part_number,serial number,firmware revision,
hardware revision,and psu mode(active/standby).

Signed-off-by: John Wang <wangzqbj@inspur.com>
---
 drivers/hwmon/pmbus/Kconfig        |   9 +
 drivers/hwmon/pmbus/Makefile       |   1 +
 drivers/hwmon/pmbus/inspur-ipsps.c | 291 +++++++++++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 30751eb9550a..c09357c26b10 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -203,4 +203,13 @@ config SENSORS_ZL6100
 	  This driver can also be built as a module. If so, the module will
 	  be called zl6100.
 
+config SENSORS_INSPUR_IPSPS
+	tristate "INSPUR Power System Power Supply"
+	help
+	  If you say yes here you get hardware monitoring support for the INSPUR
+	  Power System power supply.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called inspur-ipsps.
+
 endif # PMBUS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 2219b9300316..fde2d10cd05c 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -23,3 +23,4 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
 obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
+obj-$(CONFIG_SENSORS_INSPUR_IPSPS)	+= inspur-ipsps.o
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
new file mode 100644
index 000000000000..7dc2b00cb192
--- /dev/null
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2019 Inspur Corp.
+ */
+
+#include <linux/bitops.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+
+#include "pmbus.h"
+
+#define IPSPS_VENDOR_ID		0x99
+#define IPSPS_MODEL		0x9A
+#define IPSPS_FW_VERSION	0x9B
+#define IPSPS_PN		0x9C
+#define IPSPS_SN		0x9E
+#define IPSPS_HW_VERSION	0xB0
+#define IPSPS_MODE		0xFC
+
+#define MODE_ACTIVE		0x55
+#define MODE_STANDBY		0x0E
+#define MODE_REDUNDANCY		0x00
+
+#define MODE_ACTIVE_STRING		"active"
+#define MODE_STANDBY_STRING		"standby"
+#define MODE_REDUNDANCY_STRING		"redundancy"
+
+struct ipsps_attr {
+	u8 reg;
+	umode_t mode;
+	const char *name;
+	int mask;
+	const struct file_operations *fops;
+};
+
+struct ipsps_entry {
+	struct i2c_client *client;
+	u8 reg;
+};
+
+static ssize_t ipsps_string_read(struct file *file, char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	struct ipsps_entry *entry = file->private_data;
+	char data[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
+	int i, rc;
+
+	rc = i2c_smbus_read_block_data(entry->client, entry->reg, data);
+	if (rc <= 0)
+		return rc;
+
+	for (i = 0; i < rc; i++) {
+		if (data[i] == '#')
+			break;
+	}
+
+	data[i] = '\n';
+	i++;
+	data[i] = '\0';
+	i++;
+
+	return simple_read_from_buffer(buf, count, ppos, data, i);
+
+}
+
+static ssize_t ipsps_fw_version_read(struct file *file, char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	char data[I2C_SMBUS_BLOCK_MAX] = { 0 };
+	int rc;
+	struct ipsps_entry *entry = file->private_data;
+
+	rc = i2c_smbus_read_block_data(entry->client, entry->reg, data);
+	if (rc < 0)
+		return rc;
+
+	if (rc != 6)
+		return -ENODATA;
+
+	rc = snprintf(data, sizeof(data), "%d.%02d.%02d\n",
+			data[1], data[2], data[3]);
+
+	return simple_read_from_buffer(buf, count, ppos, data, rc);
+}
+
+static ssize_t ipsps_mode_read(struct file *file,
+					    char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	int rc;
+	char data[64] = { 0 };
+	struct ipsps_entry *entry = file->private_data;
+
+	rc = i2c_smbus_read_byte_data(entry->client, entry->reg);
+	if (rc < 0)
+		return rc;
+
+	switch (rc) {
+	case MODE_ACTIVE:
+		rc = snprintf(data, sizeof(data), "[%s] %s %s\n",
+				MODE_ACTIVE_STRING,
+				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		break;
+	case MODE_STANDBY:
+		rc = snprintf(data, sizeof(data), "%s [%s] %s\n",
+				MODE_ACTIVE_STRING,
+				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		break;
+	case MODE_REDUNDANCY:
+		rc = snprintf(data, sizeof(data), "%s %s [%s]\n",
+				MODE_ACTIVE_STRING,
+				MODE_STANDBY_STRING, MODE_REDUNDANCY_STRING);
+		break;
+	default:
+		rc = snprintf(data, sizeof(data), "unspecified\n");
+		break;
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, data, rc);
+}
+
+static ssize_t ipsps_mode_write(struct file *file, const char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	int rc;
+	char data[64] = { 0 };
+	struct ipsps_entry *entry = file->private_data;
+
+	rc = simple_write_to_buffer(data, sizeof(data), ppos, buf, count);
+	if (rc < 0)
+		return rc;
+
+	if (strcmp(MODE_STANDBY_STRING, data) == 0 ||
+			strcmp(MODE_STANDBY_STRING"\n", data) == 0) {
+		rc = i2c_smbus_write_byte_data(entry->client, entry->reg,
+						MODE_STANDBY);
+		if (rc < 0)
+			return rc;
+		return count;
+	} else if (strcmp(MODE_ACTIVE_STRING, data) == 0 ||
+			strcmp(MODE_ACTIVE_STRING"\n", data) == 0) {
+		rc = i2c_smbus_write_byte_data(entry->client, entry->reg,
+						MODE_ACTIVE);
+		if (rc < 0)
+			return rc;
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static const struct file_operations ipsps_string_fops = {
+	.llseek = noop_llseek,
+	.open = simple_open,
+	.read = ipsps_string_read,
+};
+
+static const struct file_operations ipsps_fw_version_fops = {
+	.llseek = noop_llseek,
+	.open = simple_open,
+	.read = ipsps_fw_version_read,
+};
+
+static const struct file_operations ipsps_mode_fops = {
+	.llseek = noop_llseek,
+	.open = simple_open,
+	.read = ipsps_mode_read,
+	.write = ipsps_mode_write,
+};
+
+struct ipsps_attr ipsps_attrs[] = {
+	{
+		.name = "vendor",
+		.fops = &ipsps_string_fops,
+		.reg = IPSPS_VENDOR_ID,
+		.mode = 0444,
+	}, {
+		.name = "model",
+		.fops = &ipsps_string_fops,
+		.reg = IPSPS_MODEL,
+		.mode = 0444,
+	}, {
+		.name = "fw_version",
+		.fops = &ipsps_fw_version_fops,
+		.reg = IPSPS_FW_VERSION,
+		.mode = 0444,
+	}, {
+		.name = "part_number",
+		.fops = &ipsps_string_fops,
+		.reg = IPSPS_PN,
+		.mode = 0444,
+	}, {
+		.name = "serial_number",
+		.fops = &ipsps_string_fops,
+		.reg = IPSPS_SN,
+		.mode = 0444,
+	}, {
+		.name = "hw_version",
+		.fops = &ipsps_string_fops,
+		.reg = IPSPS_HW_VERSION,
+		.mode = 0444,
+	}, {
+		.name = "mode",
+		.fops = &ipsps_mode_fops,
+		.reg = IPSPS_MODE,
+		.mode = 0644,
+	}
+
+};
+
+static struct pmbus_driver_info ipsps_info = {
+	.pages = 1,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_FAN12 |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
+		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_FAN12,
+};
+
+static struct pmbus_platform_data ipsps_pdata = {
+	.flags = PMBUS_SKIP_STATUS_CHECK,
+};
+
+static int ipsps_probe(struct i2c_client *client,
+			   const struct i2c_device_id *id)
+{
+	int i, rc;
+	struct dentry *debugfs;
+	struct dentry *ipsps_dir;
+	struct ipsps_entry *entry;
+
+	client->dev.platform_data = &ipsps_pdata;
+	rc = pmbus_do_probe(client, id, &ipsps_info);
+	if (rc)
+		return rc;
+
+	/* Don't fail the probe if we can't create debugfs */
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
+
+	ipsps_dir = debugfs_create_dir(client->name, debugfs);
+	if (!ipsps_dir)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ipsps_attrs); ++i) {
+		entry = devm_kzalloc(&client->dev, sizeof(*entry), GFP_KERNEL);
+		if (!entry)
+			return 0;
+
+		entry->client = client;
+		entry->reg = ipsps_attrs[i].reg;
+		debugfs_create_file(ipsps_attrs[i].name, ipsps_attrs[i].mode,
+					ipsps_dir, entry, ipsps_attrs[i].fops);
+	}
+
+	return 0;
+}
+
+static const struct i2c_device_id ipsps_id[] = {
+	{ "inspur_ipsps1", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ipsps_id);
+
+static const struct of_device_id ipsps_of_match[] = {
+	{ .compatible = "inspur,ipsps1" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ipsps_of_match);
+
+static struct i2c_driver ipsps_driver = {
+	.driver = {
+		.name = "inspur-ipsps",
+		.of_match_table = ipsps_of_match,
+	},
+	.probe = ipsps_probe,
+	.remove = pmbus_do_remove,
+	.id_table = ipsps_id,
+};
+
+module_i2c_driver(ipsps_driver);
+
+MODULE_AUTHOR("John Wang");
+MODULE_DESCRIPTION("PMBus driver for Inspur Power System power supplies");
+MODULE_LICENSE("GPL");
-- 
2.17.1

