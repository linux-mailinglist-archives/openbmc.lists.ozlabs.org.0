Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DDA7A726E
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 07:58:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Sri6dP6s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr7B83Rqvz3c27
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 15:58:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Sri6dP6s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::61f; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr7761RSDz3bWy
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:55:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvJM3quoPCtGkOVbvNZD2OMo+rhNYq10Q5/WXDpldbVGIrP2sPCvfca5VOKFKDVezAMWbIExtKXpxdG8Xb0op6yWWIwBbB3g6/8MCrdQAuKeT/TFcKcKgLVhs5Ubos21HoQGAGu7lIYwi0zlhE+ZDxrEVf5L4LOnnovBkUHIPTeT0oJs9qg+FC29UK5MTnOmwK3srS0X31m2MDm0UWTYAMJglsAfXZJHhxpOzUHBA08G7j0zEI99xYbZzsbZ4i72orTExf4engapIEUZ54cp1ryrQmdESfdg21dP8Vg4ebWtqc6mEaY5/qoLU+J2eT6UOAelo0GU3rF0a2AQqtIYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SngvFZz0WrVr9my/V+zZcgZ5AXSnL7bYwQPBnDdHscM=;
 b=EKsuXswaOz+Ujd5Est/BFDOXVK5O1Qq00Dul/zQMCANEO7QKXpz9G2SdZ7mYHNSksC+PTiVeFrR0loaRLx0kXqOCVwOKA1/2eLF+xsNjtK4AMKeISEn4SxjuiuD/A9s+cZ/YaJNORceGFX269kW38UXrIO2J/VmBuNyKwAYMGWw5y9Rtm3Jhs3DEqNWI8k/3Un78PdLNDfHh+fCVeXYcuq9PN09ZP6xdcr0rxoI2f/gE5BELD3/TDHVKQuSdg4uZpaQO1RM3NFtof6DFZnXSa1w7BG1iZAMYCk428PKAy6Yhcbt40isbGCCuMmGkDA26MpEGZEmG3lcng9VxEOx+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=jms.id.au smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SngvFZz0WrVr9my/V+zZcgZ5AXSnL7bYwQPBnDdHscM=;
 b=Sri6dP6skx3lEKGVxvDWqmoibm14CvKTetknBuk0CCuw6EamX9NlQeHj+EcKW5ail/K99tC8y7G75nOoIQYxb2x0APKdMUrQFcytyhlaOavI5ZJO4YnnlvjwFcO/UHDFSkwDAqvJZWDNWKwz5sXp9pIWmetXiaf2JyRQ8luG1F07zcsyOHgzk9/OkAFtGy7yZWMdvL4bmEj1dZY7k/pPTGKkTA3TWCRaKU7Cr6UjYniNOt/erUBdqgc1lX1ChvzDmxcNfhwMYb2+5E74zFFTjqVfmNrViBCPYY1B1hyxZFhvioMB8Jq4MEOpiGwrjRKcE80Euaou1aYkBpgGuUH/pA==
Received: from PS2PR06CA0003.apcprd06.prod.outlook.com (2603:1096:300:56::15)
 by SEYPR04MB7632.apcprd04.prod.outlook.com (2603:1096:101:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 05:55:26 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:300:56:cafe::7f) by PS2PR06CA0003.outlook.office365.com
 (2603:1096:300:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28 via Frontend
 Transport; Wed, 20 Sep 2023 05:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.6792.20 via Frontend Transport; Wed, 20 Sep 2023 05:55:26
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz
Subject: [PATCH linux dev-6.1 v2 2/2] hwmon: Add support for ina233
Date: Wed, 20 Sep 2023 13:55:14 +0800
Message-Id: <20230920055514.1668839-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|SEYPR04MB7632:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fb4001d-775a-4fd1-1136-08dbb99e2fda
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GFLBuAewC68eRYQrRdeATyO/uqG6dii1xKv3zOLJgCA80QnXOvx1HX2NFUQxk9BDgHjqW54z/EeiW93WVf7HzqYKmn52CecOU0a7OofpHX9d76VUSUC6wKGNdyMWYxERTa06znPr2ZMFTlDa1j01ATm30kHI2qJncTAy7FZtuipfjJ5KCrUE/TxYNgoB8nowxYiQ1UBtY3/6BcK+4koatgvPnNY4a18QvgpZhsi12KZ/JP4N6eGjjEC/fFdcJMiFmvfAUdDVXJq3BPWy8Oj2N4UCxNLhl8veOqMcf0a/l1vofIVdZl8RWtH8WXJNxo3Hfwg4F7pBjYzl1aar8JLpWduYE1RDpHnjGyQa6rlBq6x837FxXDG4O4L9JQpeIRqM/VBRF7A3jfIIu53iOCKFM3Kmjz8ST1VYrB5ETEdE+ASs/sOBSnsuL7u9gcO0BEFd6SUTT8C4dYy0sUkdpK3W4MjoGowiI0HJWMXH4GZm3bJH6S6PsASDrDpoGfKhDI3qfvzsEaJyI2hGHkvbI4+IjiXhyembV8hSIFv1DlxSXwJ5gel+vZIqDr3vjUcBrvKBt05sUyPHCUwrGlv4zwbdLEztBt0lSXc48XIpjvwROBSlp1h7bQQs1pFDJAHBJCfLVGWx/TOiTmPd5wCOWC+yyTHiuBURLFQHePvHXqbITA4P9W9kkyUfFAhiqPwabejXCzNEYiDteHzFXisr1ZPLVw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(478600001)(41300700001)(83380400001)(5660300002)(40480700001)(36736006)(6666004)(2906002)(70586007)(316002)(70206006)(4326008)(8936002)(8676002)(6506007)(6486002)(6512007)(956004)(1076003)(26005)(2616005)(107886003)(336012)(36860700001)(47076005)(86362001)(82740400003)(9316004)(36756003)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 05:55:26.0911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb4001d-775a-4fd1-1136-08dbb99e2fda
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7632
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
Changelog:
 v2 - Revise Makefile typo
 v1 - Add ina233 driver and binding document
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
index e1a68d740c59..e1e4b6f2e48a 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -49,3 +49,4 @@ obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
 obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
 obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
 obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
+obj-$(CONFIG_SENSORS_INA233) 	+= ina233.o
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

