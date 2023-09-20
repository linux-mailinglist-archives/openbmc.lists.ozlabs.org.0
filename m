Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2D7A723E
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:42:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uLn7GGb3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr6qb4fM4z2xdd
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:42:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uLn7GGb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr6n839Tyz3c5c
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:40:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv4i0IF4geSi2aTIoWuOskQGCsQqS9+ioo+TQr575FS75ZTqaGkVN6TEh4NRo7KAlTcK939PldkT7K2y9GhgJR+Wq6JXCL0F0PFO0wukcQNnMGYfPiIfXkvZ0sb+w7BvwwQ4BeHXf99YfhD2ULeRNb32I/3qS2d0ePOjdR2g957GFSXzRm0IH2nkr0dN6WQkrow/ZLUorh5gr2fTTPsp0WO4tQVHmuBXuf8BQcM3Rn7MMt4qIWe4zPKehDdj9PAIp0qjtkYTJQXcVb/S5qBALUZuJztfi/4c0d0oEcpIZ76o4ZJcb6zkXLuXLd8Qm5nWvhN187O8aKqvTbVnQ72lOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0YLRWNsc7LuoMF41QwihBMAfCVZb95nAynMzJzN43U=;
 b=L+tM0alkYJ3rfJkulfAnTTJOqAlLIMgZJa2G76+FBTijLpsoV9ptvRKkYibKZCAdDlgPcGb72MyV7EXY7TaJpqsKw/RvjtendCO6HxAZ3cOly3wgoQk5MA35ZJyfORuhyXzNin05sBT7kxY/s+S7+cC2pjE5+ExlXwDgfOLfJgLEcQLBpppQFjs6Ba/ISiilBaQB8m72dBOiCJ9d57ZtAYxblOK4Fbsc8ZRH2xo+qMM/VcLS/6A0bfBnYigJUx6DzRNdelQZDh6XsnK3g/nG4f79r9DnEX4xCT0qL1i6AlzAz0wfuszMeV9sG0WClvpkCcsRIimxqRRv5iWx3eb2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0YLRWNsc7LuoMF41QwihBMAfCVZb95nAynMzJzN43U=;
 b=uLn7GGb3lBynMBCjHhEqKyrBme8mInowmG95+gGrUHW+X3b6ZMr2ZYPYiuliM5abumm50lEyFzzN1199uLL4ZZACWCbXSsfb1FdlWBKpURbMyJvKjumakmUFMskphLRS6FG/UfOjKvSZGLnoF4Dj+niTC8MN53axOl02DYw27JcTwkmYjNaEiRfm1J/5v+FgX0SUui+H8Sa8Rqm3fQC4b4b23eeq+ZktSv/yhd0vThbFS26FBSzeYMgyrnYam8VkK9a+pxmj8DfrxlB8bD3YIxALNERS8OlG44gi1/Fl5PFhSZqJA11KOcQUdI8QehhaHwT1yFlPPL9Qg14UOX+OFg==
Received: from KL1PR0401CA0020.apcprd04.prod.outlook.com (2603:1096:820:e::7)
 by PSBPR04MB3943.apcprd04.prod.outlook.com (2603:1096:301:a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 20 Sep
 2023 05:39:50 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:820:e:cafe::4f) by KL1PR0401CA0020.outlook.office365.com
 (2603:1096:820:e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Wed, 20 Sep 2023 05:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:39:49
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v1 2/2] hwmon: Add support for ina233
Date: Wed, 20 Sep 2023 13:39:32 +0800
Message-Id: <20230920053932.1556545-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920053932.1556545-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230920053932.1556545-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|PSBPR04MB3943:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8db78812-a87f-420b-7ee0-08dbb99c019d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	V0q0o+AOX5QeNyJJuI244lbCgNB5WKIJ2zaQs7emiwgFHi29MYj1sv2zkvfvdWXL3TTYNKtP2/KD6RUyG51uM7SA7KhBNiD+m5lWaQZQYYmkQcJKjXYjiP7Y8at9qboEsDg9xYgm0YTj0f5kpDkINbq/7xBwWRtL/awdJKzshCB8RaXw5NW04ER/c4Q4AiCBb0iZ7jnTLfqP0XYG0GXHZedq1DOZZW7kNtjAmC0QTby0o9eaEcIM2Cwd41k52RDNkXa+hQJ1gBCw3uwzw6StgkpCo3CEmeOGK+91pIz4rM5nbgjxBmIg25cfedjpnwrWAo5UsbEHiQiNhAxfOcgj/AOVHcO1MwzviR+U1q6CFTVbb9iVju2lCozrnbZBXbJZeggn1XqIeDq9D1959h1sNPfzOmMOITbuIDGPEm4a0VeiFdZZChbCAbicmOxA2jAhO4KeW3I6gG4gqx3byRRGYeXSGAVL/Z9r+dCmF2FtYXoe1FRHUu1CY4EYUFedP0MZF2PgVyOhhpDmYOwsHjrDd0CZ9nSbNBmxaIETl+inM6OD5skxjOabb0Crk2d12F+cfajDHD37qPO2j/Vl8/BMhcnL4cKeiP1b9Op/I5RpLyDrlBH9zGCSKiNHQkPgEwLNxtvdCHZJ1LijhpA6f+VNDhuHdzQtHf3Pfd32UsGPb4jXXq2sEuwLKitxcgnBrKZjfkiD4dpMaIJoaxm3knV69Q==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(346002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(2906002)(5660300002)(26005)(1076003)(40480700001)(336012)(41300700001)(316002)(70206006)(70586007)(36736006)(478600001)(8676002)(4326008)(8936002)(6666004)(6506007)(6486002)(6512007)(956004)(36756003)(2616005)(36860700001)(9316004)(47076005)(107886003)(356005)(81166007)(86362001)(83380400001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:39:49.5255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db78812-a87f-420b-7ee0-08dbb99c019d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB3943
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The INA233 device is a current, voltage and power monitor
with an I2C-, SMBus-,and PMBus-compatible interface
that is compliant with digital bus voltages from 1.8 V to 5.0 V.
The device monitors and reports values for current, voltage and power.
The integrated power accumulator can be used for energy
or average power calculations. Programmable calibration value,
conversion times and averaging when combined with an internal multiplier
enable direct readouts of current in amperes and power in watts.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/hwmon/pmbus/Kconfig  |  9 ++++
 drivers/hwmon/pmbus/Makefile |  1 +
 drivers/hwmon/pmbus/ina233.c | 89 ++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/ina233.c

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index a40fafa42d32..4a852de5c487 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -470,4 +470,13 @@ config SENSORS_ZL6100
 	  This driver can also be built as a module. If so, the module will
 	  be called zl6100.
 
+config SENSORS_INA233
+        tristate "Texas Instruments INA233 and compatibles"
+        help
+          If you say yes here you get hardware monitoring support for Texas
+          Instruments INA233.
+
+          This driver can also be built as a module. If so, the module will
+          be called ina233.
+
 endif # PMBUS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index e1a68d740c59..c5d547d9f304 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -49,3 +49,4 @@ obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
+obj-${CONFIG_SENSORS_INA233} 	+= ina233.o
diff --git a/drivers/hwmon/pmbus/ina233.c b/drivers/hwmon/pmbus/ina233.c
new file mode 100644
index 000000000000..393b595344c5
--- /dev/null
+++ b/drivers/hwmon/pmbus/ina233.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Hardware monitoring driver for Texas Instruments INA233
+ *
+ * Copyright (c) 2017 Google Inc
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define MFR_CALIBRATION	0xd4
+
+struct pmbus_driver_info ina233_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
+	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT
+		| PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT,
+	.m[PSC_VOLTAGE_IN] = 8,
+	.m[PSC_VOLTAGE_OUT] = 8,
+	.R[PSC_VOLTAGE_IN] = 2,
+	.R[PSC_VOLTAGE_OUT] = 2,
+};
+
+static int ina233_probe(struct i2c_client *client)
+{
+	int ret;
+	u16 shunt;
+	u16 current_lsb;
+	of_property_read_u16(client->dev.of_node, "resistor-calibration", &shunt);
+
+	ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, shunt);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to set calibration\n");
+		return ret;
+	}
+	ret = of_property_read_u16(client->dev.of_node, "current-lsb", &current_lsb);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to set current_lsb\n");
+		return ret;
+	} else {
+		// Referenced by table of Telemetryand WarningConversionCoefficients in datasheet
+		ina233_info.m[PSC_CURRENT_IN] = 1000 / current_lsb;
+		ina233_info.m[PSC_CURRENT_OUT] = 1000 / current_lsb;
+		ina233_info.m[PSC_POWER] = 40 / current_lsb;
+	}
+
+	return pmbus_do_probe(client, &ina233_info);
+}
+
+static const struct i2c_device_id ina233_id[] = {
+	{"ina233", 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, ina233_id);
+
+static const struct of_device_id __maybe_unused ina233_of_match[] = {
+	{ .compatible = "ti,ina233" },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, ina233_of_match);
+
+static struct i2c_driver ina233_driver = {
+	.driver = {
+		   .name = "ina233",
+		   .of_match_table = of_match_ptr(ina233_of_match),
+		   },
+	.probe_new = ina233_probe,
+	.id_table = ina233_id,
+};
+
+module_i2c_driver(ina233_driver);
+
+MODULE_AUTHOR("Eli Huang <eli_huang@wiwynn.com>");
+MODULE_DESCRIPTION("PMBus driver for Texas Instruments INA233 and compatible chips");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PMBUS);
+
-- 
2.25.1

