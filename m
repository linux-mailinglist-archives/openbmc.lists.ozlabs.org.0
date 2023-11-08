Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E97E51E3
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 09:23:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0afcOfK9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQJ4c44q4z3cP7
	for <lists+openbmc@lfdr.de>; Wed,  8 Nov 2023 19:23:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=0afcOfK9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::615; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQJ1x5Sxjz2xFl
	for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2023 19:20:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuR+LtPq2atn9vmNXgpNo/hmQ7xlocHA80nYpmf7uWVFMTXdsbQvDE+4ClX6kruA3xy9eRBD7TNkQlgnSmOXuKrqzQLmMmsyre+sV+K1DyqpyhJgbUoNnvJNdlLSTl9pfky8wKwat8S1KBuAqJ49NkKNu9TVO29mLRJ26OVop2/jdLTPA3PHos+MIKAjXzN3QE30Jh0wrFL0qXrVYuMnRHhWmHbcnPop6kKzWso1XX/nREJlNTsM92bIBOLSwpT85aUBxwiR9QSjNP8wW5VIvbXnIBtUPBr/BOS0wCygkR9K+AA63b3Nq/8uMEchwWG/aogruxN2iE5CjLZ3Z3G+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LE9tm6PIktuqC3aPQpC7nP1QIhXmcKARYEgr0ZfycM=;
 b=Z8Em2P0uj0zYtX4W+c56P7IOsh8NhEJqz4zMMvpGBpUUv8Bhq2CP1hR9LUzX0PsFmYRI2zeCCP0McuwJja2jt7z2wRb2lp/SyWZfXvrcF5ev391xwDmP8qppl/xceUOMYaoosOIKtfLnKxCqaqpDveuzWZL74dkHxqUvCvis0LobKir2JatnzSdh6vUot0JnxwXfcsmBxUfm5EjkKA8CWTKD7YspLpXvVoH5qhy1/QwTAaKQo8WFd03oT0WM8i/Q0IULwCBpTxUQCa9E41wtZi7sjLOwAmazca8+UKjMqhFCkEpOfjdx6Yid+CAR2BRlHPuF+xU1fg50fH8Q2gfKVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LE9tm6PIktuqC3aPQpC7nP1QIhXmcKARYEgr0ZfycM=;
 b=0afcOfK9EjslAWJbYQoeGv8lCSmm3QeepMH2cj0ohFQlJWGwamkoFtXvWBj0w3DZWuqXDwvlqn6UUYWJBUbwKPoc6Re0Xg4CHnbUCXP2qfWUxUVeuy9pUbyxBv+CXfDVAEXOwcm6+CxpXV6sDsb9cygcpkDnohieg0K+69D2sxrEKMfPCVr7PSMB+ZMeqzAf9cAvi1IuBy1TIwhPhMNLtlq9RXQfxgikUPn0KqlaEX6AlxiufUiCZepoSCZUBmXHx/cTur4Ybqf5JCkqaHa9UR6GgSdi2Yj8BnfeFr5s6FXFAbTLDXLC9CcWeF0sddvpbpOw+JQYmeE4ogFYSSPq2A==
Received: from SGAP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::21) by
 TY0PR04MB7349.apcprd04.prod.outlook.com (2603:1096:405:13::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Wed, 8 Nov 2023 08:20:31 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:b6:cafe::19) by SGAP274CA0009.outlook.office365.com
 (2603:1096:4:b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 08:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 08:20:31
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v4 2/2] hwmon: pmbus: Add ltc4286 driver
Date: Wed,  8 Nov 2023 16:20:19 +0800
Message-Id: <20231108082019.1601366-3-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TY0PR04MB7349:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb605f72-ee57-4dff-1c37-08dbe0339307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3XPPD6SOFaiA/mHKmbuO8vPqouDrw2C7yH9jTb+rxCxmzOCnendVP4fKEPV0tdQN9ZxEtWqFHv2V42SPEa0hsI4nDsbEl8uC04vAG3JqhEQcUD7/s5lnS6RcJicX76W/Co/QXtuoD9qtD9b7h0rWTqd+K3RDqy+0A6dTBhqUmIQdZpwyOpgRnJVWqyhn1ty3BAWY3PBk3/Rpv+P1SIWdmweXvd5qWVgny8DIP2xnvusZXwOyyxOGvWMcrrRoUW7YEqjf3k5GOL/pJxq5LPX4E7RBdjdIvBWNExAk7uXbz+4hCNU+zv5cGcuHtWq0vElz07ibIo5ynDfVZp7Hpn37avaIaPeZiCFhvuJeQ3meMCdr1iwFJxOTXOftagsLszCpjf/I5nc8tfpcvCPEeuvx5qsXPSyXM4PHi94KBCScj8C8V+6eDwfOh/gWi+JdFmEDThTPE3XWFEV/2dN0OPSlw/vAtbPjuJH3zzEr6O1QC3sZJjII6dYp6eLU3/w7cU5x8r7K6M2I4aUXDyedEHGFMbJojSCJJ372oojkhK2fSFdcUTIEXIL7oBW9vvuiRbZsxDSgTr55cljhGl7zA/ZZD9R9952ARWjsICK9asd2qgr9nPZ3WRKjI26/+ti0I/rbPUv0Knr0LqnI88ZQ2+Ltw/c4aYrzxeleoDv6luFXwETJS/IhrZczQ3sZnIPZUoFkfb82PQR9DFOQ4QmjFxVifQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(46966006)(36840700001)(70586007)(70206006)(316002)(966005)(6486002)(6666004)(8676002)(4326008)(8936002)(478600001)(47076005)(1076003)(2616005)(107886003)(6512007)(6506007)(956004)(26005)(30864003)(66574015)(36736006)(36860700001)(83380400001)(41300700001)(336012)(2906002)(356005)(81166007)(82740400003)(86362001)(36756003)(5660300002)(40480700001)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 08:20:31.4290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb605f72-ee57-4dff-1c37-08dbe0339307
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB7349
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a driver to support ltc4286 chip

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Changelog:
  v4 - Add empty line before "config SENSORS_LTC4286" in Kconfig
     - Add ltc4286 to Documentation/hwmon/index.rst
     - Revise comment typo
     - Use devm_kmemdup instead of memcpy
     - Check MBR value before writting into
  v3 - Use dev_err_probe() instead of dev_err()
     - The VRANGE_SELECT bit only be written if it actually changed
     - Avoid the info pointer being overwritten
     - Check the MBR value range to avoid overflow
     - Revise ltc4286.rst to corrcet description
  v2 - Revise Linear Technologies LTC4286 to
       Analog Devices LTC4286 in Kconfig
     - Add more description for this driver in Kconfig
     - Add some comments for MBR setting in ltc4286.c
     - Add ltc4286.rst
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++
 drivers/hwmon/pmbus/Kconfig     |  10 ++
 drivers/hwmon/pmbus/Makefile    |   1 +
 drivers/hwmon/pmbus/ltc4286.c   | 177 ++++++++++++++++++++++++++++++++
 5 files changed, 284 insertions(+)
 create mode 100644 Documentation/hwmon/ltc4286.rst
 create mode 100644 drivers/hwmon/pmbus/ltc4286.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 75b869ff6c53..40d817f7c215 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -127,6 +127,7 @@ Hardware Monitoring Kernel Drivers
    ltc4245
    ltc4260
    ltc4261
+   ltc4286
    max127
    max15301
    max16064
diff --git a/Documentation/hwmon/ltc4286.rst b/Documentation/hwmon/ltc4286.rst
new file mode 100644
index 000000000000..2cd149676d86
--- /dev/null
+++ b/Documentation/hwmon/ltc4286.rst
@@ -0,0 +1,95 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver ltc4286
+=====================
+
+Supported chips:
+
+  * Analog Devices LTC4286
+
+    Prefix: 'ltc4286'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4286.pdf
+
+  * Analog Devices LTC4287
+
+    Prefix: 'ltc4287'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4287.pdf
+
+Author: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for Analog Devices LTC4286
+and LTC4287 Hot-Swap Controller and Digital Power Monitors.
+
+LTC4286 and LTC4287 are hot-swap controllers that allow a circuit board
+to be removed from or inserted into a live backplane. They also feature
+current and voltage readback via an integrated 12 bit analog-to-digital
+converter (ADC), accessed using a PMBus interface.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+The shunt value in micro-ohms can be set via device tree at compile-time. Please
+refer to the Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml for bindings
+if the device tree is used.
+
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data. Please see
+Documentation/hwmon/pmbus.rst for details.
+
+
+Sysfs entries
+-------------
+
+The following attributes are supported. Limits are read-write, history reset
+attributes are write-only, all other attributes are read-only.
+
+======================= =======================================================
+in1_label		"vin"
+in1_input		Measured voltage.
+in1_alarm		Input voltage alarm.
+in1_min 		Minimum input voltage.
+in1_max 		Maximum input voltage.
+
+in2_label		"vout1"
+in2_input		Measured voltage.
+in2_alarm		Output voltage alarm.
+in2_min 		Minimum output voltage.
+in2_max 		Maximum output voltage.
+
+curr1_label		"iout1"
+curr1_input		Measured current.
+curr1_alarm		Output current alarm.
+curr1_max		Maximum current.
+
+power1_label		"pin"
+power1_input		Input power.
+power1_alarm		Input power alarm.
+power1_max		Maximum poewr.
+
+temp1_input		Chip temperature.
+temp1_min		Minimum chip temperature.
+temp1_max		Maximum chip temperature.
+temp1_crit		Critical chip temperature.
+temp1_alarm		Chip temperature alarm.
+======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 4e3776702d7f..6036603f5fba 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -227,6 +227,16 @@ config SENSORS_LTC3815
 	  This driver can also be built as a module. If so, the module will
 	  be called ltc3815.
 
+config SENSORS_LTC4286
+	bool "Analog Devices LTC4286"
+	help
+	  LTC4286 is an integrated solution for hot swap applications that
+	  allows a board to be safely inserted and removed from a live
+	  backplane.
+	  This chip could be used to monitor voltage, current, ...etc.
+	  If you say yes here you get hardware monitoring support for Analog
+	  Devices LTC4286.
+
 config SENSORS_MAX15301
 	tristate "Maxim MAX15301"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 51d54f444cec..c9d83be099fe 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
 obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
 obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
 obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
+obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
 obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
 obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
 obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
new file mode 100644
index 000000000000..e6690b38349a
--- /dev/null
+++ b/drivers/hwmon/pmbus/ltc4286.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+/* LTC4286 register */
+#define LTC4286_MFR_CONFIG1	0xF2
+
+/* LTC4286 configuration */
+#define VRANGE_SELECT_BIT	BIT(1)
+
+#define LTC4286_MFR_ID_SIZE	3
+#define VRANGE_25P6		0
+
+/*
+ * Initialize the MBR as default settings which is referred to LTC4286 datasheet
+ * (March 22, 2022 version) table 3 page 16
+ */
+static struct pmbus_driver_info ltc4286_info = {
+	.pages = 1,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 1,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 1,
+	.m[PSC_CURRENT_OUT] = 1024,
+	.b[PSC_CURRENT_OUT] = 0,
+	/*
+	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
+	 * However, the rsense value that user input is micro ohm.
+	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
+	 */
+	.R[PSC_CURRENT_OUT] = 3 - 6,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	/*
+	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
+	 * However, the rsense value that user input is micro ohm.
+	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
+	 */
+	.R[PSC_POWER] = 4 - 6,
+	.m[PSC_TEMPERATURE] = 1,
+	.b[PSC_TEMPERATURE] = 273,
+	.R[PSC_TEMPERATURE] = 0,
+	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
+		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
+		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", 0 },
+						   { "ltc4287", 1 },
+						   {} };
+MODULE_DEVICE_TABLE(i2c, ltc4286_id);
+
+static int ltc4286_probe(struct i2c_client *client)
+{
+	int ret;
+	int temp_setting;
+	const struct i2c_device_id *mid;
+	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
+	struct pmbus_driver_info *info;
+	u32 rsense;
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	if (ret < 0) {
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer id\n");
+	}
+
+	/*
+	 * Refer to ltc4286 datasheet page 20
+	 * the manufacturer id is LTC
+	 */
+	if (ret != LTC4286_MFR_ID_SIZE ||
+	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
+		return dev_err_probe(&client->dev, ret,
+				     "Manufacturer id mismatch\n");
+	}
+
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	if (ret < 0) {
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to read manufacturer model\n");
+	}
+
+	for (mid = ltc4286_id; mid->name[0]; mid++) {
+		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
+			break;
+	}
+	if (!mid->name[0])
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "Unsupported device\n");
+
+	ret = of_property_read_u32(client->dev.of_node,
+				   "shunt-resistor-micro-ohms", &rsense);
+	if (ret < 0)
+		return ret;
+
+	if (rsense == 0)
+		return -EINVAL;
+
+	if (rsense > INT_MAX)
+		return -ERANGE;
+
+	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* Default of VRANGE_SELECT = 1, 102.4V */
+	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
+		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
+		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
+		if (ret < 0)
+			return dev_err_probe(
+				&client->dev, ret,
+				"Failed to read manufacturer configuration one\n");
+
+		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
+		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
+						ret);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret,
+					     "Failed to set vrange\n");
+
+		info->m[PSC_VOLTAGE_IN] = 128;
+		info->m[PSC_VOLTAGE_OUT] = 128;
+
+		temp_setting = 4 * rsense;
+		if (temp_setting > INT_MAX)
+			return dev_err_probe(&client->dev, -ERANGE,
+					     "Power coefficient overflow\n");
+		info->m[PSC_POWER] = temp_setting;
+	} else {
+		info->m[PSC_POWER] = rsense;
+	}
+
+	temp_setting = 1024 * rsense;
+	if (temp_setting > INT_MAX)
+		return dev_err_probe(&client->dev, -ERANGE,
+				     "Current coefficient overflow\n");
+	info->m[PSC_CURRENT_OUT] = temp_setting;
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct of_device_id ltc4286_of_match[] = {
+	{ .compatible = "lltc,ltc4286" },
+	{ .compatible = "lltc,ltc4287" },
+	{}
+};
+
+static struct i2c_driver ltc4286_driver = {
+	.driver = {
+		.name = "ltc4286",
+		.of_match_table = ltc4286_of_match,
+	},
+	.probe = ltc4286_probe,
+	.id_table = ltc4286_id,
+};
+
+module_i2c_driver(ltc4286_driver);
+
+MODULE_AUTHOR("Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>");
+MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");
+MODULE_LICENSE("GPL");
-- 
2.25.1

