Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C11324DD1
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 11:21:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmTMz0DxLz3cZg
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 21:21:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BVGDvHGo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.135;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=BVGDvHGo; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2135.outbound.protection.outlook.com [40.107.243.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmTL951lRz3cKY;
 Thu, 25 Feb 2021 21:19:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTC8KbNwdz615HLK+89Yx5rjyvS8xiFD/fUwfoHhqM244FTlgOAPmGVGZqkdeaOkIg9W91awCqV9a/B2vkdxnIrE0UbPpFOq7RJp0VXa6hQze4H852Z29VUoVJ8lgEY99Y6jhtlZeH4btZRlZyKvoY7g9LnHNFSSx8Ld3DK5tO/7HB4GslwJIIVWIddJoRaswbNyMEuctSNTL7bAVal/e4WorASrx/Y4I87EaUdZAOlUeqSXZ39T9b+0Z/Wv4c7XLo8TdUCCWn+TWvJ/mo+8O/2ingKdlaLksjZcrEq+IYSJReiWqNhKr2gx1ZAouEHToOMTmytoF1MiOjPHWHfUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQMp98nD0Cu+sJhz7WS7zz3wKhwMHqb5p1dVdd56QdU=;
 b=SVRqsSPUagzx7ARd992uGs+J4O+oKQmiiRxYvsaJlXbRrIgW5x+ILoVRLZvCJmdoOY+a+MFtNFlSZ2kJ5Y1enTC3h2PBmd4pnv4yLgtZDpT9+BeIW6YginR0ArXjyUtOvn7mKFXHK5XNuroyYzeyLGAMXjc/HAsOla5kD5c+A1qoD2ZcYMd4iIqmK1J/OI0VZjpjBy/1tVvAgqRUx7C22bl4f1TfzKes66RkjuDPvyWpWJYLxlFDPLUg0Gtt/6HzepQhy0gKGwrb06dp3ZixVFrydttgSLLpZyJy2cQRhOmjwybnKq16nX5iaYDGeGhogbZyhxlffXClgWePtsTwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQMp98nD0Cu+sJhz7WS7zz3wKhwMHqb5p1dVdd56QdU=;
 b=BVGDvHGoWrUKvoLBetewjoaqiOwjpllNtIY6bCGXca9yuQVj2V3Yrw/hqFZM6U7395vJ5H4zu6XXR2mbm8/2gSz5lSksrlLt/huBN6Dw+3GFniw8Yg1mQKtffvgO3OAEh5ONpS9BWmEGg4QajjpbPvWBy+N/zOiGCnyU9NnTq/8=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Thu, 25 Feb 2021 10:19:44 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 10:19:44 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Thu, 25 Feb 2021 17:18:53 +0700
Message-Id: <20210225101854.13896-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210225101854.13896-1-quan@os.amperecomputing.com>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0061.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 10:19:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92b473fa-c1fb-47e6-8e82-08d8d976de7e
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320295C2E1E79760BCC3D47F29E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BnYWbr2xN6JzflhTs73r9h71d2vM6lwM0NVYIT2QAsP6J9R60WOc/PHZgdFhgXlMT5FPzBRgUIakM45vj2e3GbFOEXk17geP9/um15+dTjbCXVaBk2TEXkenvg5hmhraH+GlkVjgsgy1MZacdbeyi/CYZxxLUePsqdX1yD5EVtFC+U1sCsSOy7QK38H15CWRmevrQ8PeFUyFb1MeC3s9kDCiucUt+W4hEIRimNp1z0ZhWS+4WgItUC/wp8mJ4W+I1dHNJpcGJI5FMe1WWPZdzD1WRk97KLZ4UznAU/pGIvdTw5OX3cwFlYegxwV62SpqXEchYeAzukPZsb2SHfHrKfRjtaJrbL6l1dwbV6APCwuy8oKciw44Xb6Nns6KIkq1iG6wKXw/p2UBcU8oOQsJidGQty4Oam6oLpSBMpc7k04Ptc4CQk/NCIYNGwhxzdlL/KNokm9mpW/A9+Mz0l7GU7r0jt57PnQEinrHb7pGCmtJDLoU2N+neJlwROZkaQxs1AajGvteuwX+clzVU17I4grdr/yewSLS1B6ga+/EU+3gNX6VANWQmWvzihvJiY04i1yCpBjIZ5yDXHJbP+VVFzdFZNWtYVfBkibgFPV/ewgaK/yBQSHyUwHC9oRLLnvtWwsP5Hl20WKMhNrOh7fgM4tSJX7KE6/iR6Tkd681hsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(83380400001)(956004)(2616005)(66556008)(6512007)(6666004)(107886003)(110136005)(66946007)(66476007)(52116002)(8936002)(921005)(316002)(86362001)(26005)(2906002)(1076003)(5660300002)(6486002)(186003)(4326008)(30864003)(6506007)(16526019)(8676002)(7416002)(478600001)(54906003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UchllQNoVDDZuw2oNK6JrNQMVti/5mTxsL7fXVmeImrOPpLdA3JBE6dGqnNm?=
 =?us-ascii?Q?fKfUKBZ/Zbd9FR7H6/a0iji3RwEEU+c0818g8rWoL0yIGvfCbVqUxIl92BBi?=
 =?us-ascii?Q?HHz5/FcEd6arF8Equ5Cktt7HGFWTS+on+vaxsG3mTOrFDjD1yaGtVwORmlYr?=
 =?us-ascii?Q?bgOeebnRcRdaYjRJnuM+9tSGo1CzSFKWZ2TL+wAG6Y2tj+HAFwqqM4xtqbTU?=
 =?us-ascii?Q?9BsnpEwzgNwUqZys7WWFW42p7jgyfJX0uhm6XkOyDbofne/fClL4dAXl2REJ?=
 =?us-ascii?Q?S0dYr4VENuF3LAEZsIN5QqMIGuYeQYoETDrLiYpLJGaxTOXUucmyDJlT66+w?=
 =?us-ascii?Q?ICf2jQUJF4Kvp1sNy0fJp5xjnK/CWiXaeB+P6oYFj4jWBikLkavv0KL1T3Nv?=
 =?us-ascii?Q?9fpuTAuVxoP1e2+DYmsf82WK159/PZI1JxJlhQBvE+2tKsFZ49ZsDndD7RdI?=
 =?us-ascii?Q?UH0nhGEbvB9x84L6I95LFLp7/4elk1YXvSUZg9bjjgeG5VaVaO56mJKHfgYj?=
 =?us-ascii?Q?aem6kYUKf+KpjforrA2JkzjO5ighlyxFVotTQ3jD+GOqjYv5QKkz01faYiVq?=
 =?us-ascii?Q?4ZBMrOucbHl1cf8uGBU3Zr52sqZFZWPCWtjFcZIe/c16fDQLq69GMvFSUAAI?=
 =?us-ascii?Q?+AbHAZQ9FJyB+N0/C7fPVDhD2w82c+a5peE4kV0GFGK7OI46SZ7H1el9iZpX?=
 =?us-ascii?Q?O+NppfdmQ3WtOJxHn8QzsR2R3KXMEQHL6q6W5tjmaIkPRarSzSE96qQOmL4Q?=
 =?us-ascii?Q?OxL2TGDztADILoe5eYIru3fb1RHQR7QOSS36SBzjRQUHKXwjIcnaN6HvSI+p?=
 =?us-ascii?Q?FJuqNm/R1IqJlOJ58WzCQU/w2qMOWRqK5uhDjQtLmq89oQ9/OpO6+Vy8YgPx?=
 =?us-ascii?Q?aNT51BmSHkYC4JLZms/w2O+C82xO5t8wZklpcT0yyNDriNuwIepQLIzVRutM?=
 =?us-ascii?Q?YkIUzAuKLQ2zEYaL5vlg2nSJpZ7ED2Mf/xchYQCUnneuDAtIrgtY+Fi5Z5yW?=
 =?us-ascii?Q?32SmTak4Xp15fDk2MEsD7uq2FkLffzAEXkqN7zi/fcZI7mYAi3TkXrMLGyR1?=
 =?us-ascii?Q?Vv4LVcIDzs1gWVpwgsULUSDI8TDG6CMEQ0dKpR8uLy2YdM1ntFUYQIWNEY6G?=
 =?us-ascii?Q?BIlvtO4WTLvgGLdsFtjXAQuvIEGsnN4Ov3igyeYmwhxtyUPVJEyCOzJCyV+S?=
 =?us-ascii?Q?J4EtVvqpXTs9WIecm/22g2yIzqrwsO9SFZWcHJ85jO1n9iarC2N/y35pAnab?=
 =?us-ascii?Q?sV4AQoS9ht9sH9CSQtwWj012fhNKMlXXEGVXpu9WqIU6uXAp1HSQ+qxUcyta?=
 =?us-ascii?Q?BaARkHmC2nZtJOYKFl7uCRUB?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b473fa-c1fb-47e6-8e82-08d8d976de7e
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:19:43.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0I6MhyGfFW7Gzx7XunjZjCj8eanTu9VM9MwORSw49HzXtu0u6PEkLeWuEQS7pJCFzU7eqwM0mPi0Pwmks7XdmoQMbN5OlLigM7JIVoHIqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds support for Ampere SMpro hwmon driver. This driver
supports accessing various CPU sensors provided by the SMpro co-processor
including temperature, power, voltages, and current.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/hwmon/Kconfig       |   8 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/smpro-hwmon.c | 620 ++++++++++++++++++++++++++++++++++++
 3 files changed, 629 insertions(+)
 create mode 100644 drivers/hwmon/smpro-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 54f04e61fb83..7b0458bf903c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -67,6 +67,14 @@ config SENSORS_ABITUGURU3
 	  This driver can also be built as a module. If so, the module
 	  will be called abituguru3.
 
+config SENSORS_SMPRO
+	tristate "Ampere's Altra SMpro hardware monitoring driver"
+	depends on MFD_SMPRO
+	help
+	  If you say yes here you get support for the thermal, voltage,
+	  current and power sensors of Ampere's Altra processor family SoC
+	  with SMpro co-processor.
+
 config SENSORS_AD7314
 	tristate "Analog Devices AD7314 and compatibles"
 	depends on SPI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index fe38e8a5c979..ac0892540abb 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -173,6 +173,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
new file mode 100644
index 000000000000..d70764ffc78f
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,620 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMPro Hardware Monitoring Driver
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/bitfield.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+/* Identification Registers */
+#define MANUFACTURER_ID_REG		0x02
+#define AMPERE_MANUFACTURER_ID		0xCD3A
+
+/* Capability Registers  */
+#define SOC_TDP_REG			0x0E
+
+/* Logical Power Sensor Registers */
+#define SOC_TEMP_REG			0x10
+#define SOC_VRD_TEMP_REG		0x11
+#define DIMM_VRD_TEMP_REG		0x12
+#define CORE_VRD_TEMP_REG		0x13
+#define CH0_DIMM_TEMP_REG		0x14
+#define CH1_DIMM_TEMP_REG		0x15
+#define CH2_DIMM_TEMP_REG		0x16
+#define CH3_DIMM_TEMP_REG		0x17
+#define CH4_DIMM_TEMP_REG		0x18
+#define CH5_DIMM_TEMP_REG		0x19
+#define CH6_DIMM_TEMP_REG		0x1A
+#define CH7_DIMM_TEMP_REG		0x1B
+#define RCA_VRD_TEMP_REG		0x1C
+
+#define CORE_VRD_PWR_REG		0x20
+#define SOC_PWR_REG			0x21
+#define DIMM_VRD1_PWR_REG		0x22
+#define DIMM_VRD2_PWR_REG		0x23
+#define CORE_VRD_PWR_MW_REG		0x26
+#define SOC_PWR_MW_REG			0x27
+#define DIMM_VRD1_PWR_MW_REG		0x28
+#define DIMM_VRD2_PWR_MW_REG		0x29
+#define RCA_VRD_PWR_REG			0x2A
+#define RCA_VRD_PWR_MW_REG		0x2B
+
+#define MEM_HOT_THRESHOLD_REG		0x32
+#define SOC_VR_HOT_THRESHOLD_REG	0x33
+#define CORE_VRD_VOLT_REG		0x34
+#define SOC_VRD_VOLT_REG		0x35
+#define DIMM_VRD1_VOLT_REG		0x36
+#define DIMM_VRD2_VOLT_REG		0x37
+#define RCA_VRD_VOLT_REG		0x38
+
+#define CORE_VRD_CURR_REG		0x39
+#define SOC_VRD_CURR_REG		0x3A
+#define DIMM_VRD1_CURR_REG		0x3B
+#define DIMM_VRD2_CURR_REG		0x3C
+#define RCA_VRD_CURR_REG		0x3D
+
+/* Add for DIMM group */
+#define DIMM_GROUP_DUMMY_REG		0xFF
+
+struct smpro_hwmon {
+	struct regmap *regmap;
+};
+
+static const u8 temp_regs[] = {
+	SOC_TEMP_REG,
+	SOC_VRD_TEMP_REG,
+	DIMM_VRD_TEMP_REG,
+	CORE_VRD_TEMP_REG,
+	/* reserved for DIMM G0 */
+	DIMM_GROUP_DUMMY_REG,
+	CH0_DIMM_TEMP_REG,
+	CH1_DIMM_TEMP_REG,
+	CH2_DIMM_TEMP_REG,
+	CH3_DIMM_TEMP_REG,
+	/* reserved for DIMM G1 */
+	DIMM_GROUP_DUMMY_REG,
+	CH4_DIMM_TEMP_REG,
+	CH5_DIMM_TEMP_REG,
+	CH6_DIMM_TEMP_REG,
+	CH7_DIMM_TEMP_REG,
+	MEM_HOT_THRESHOLD_REG,
+	SOC_VR_HOT_THRESHOLD_REG,
+	RCA_VRD_TEMP_REG,
+};
+
+static const u8 volt_regs[] = {
+	CORE_VRD_VOLT_REG,
+	SOC_VRD_VOLT_REG,
+	DIMM_VRD1_VOLT_REG,
+	DIMM_VRD2_VOLT_REG,
+	/* vrd1 has higher priority than vrd2 using vrd1 as output for ddr */
+	DIMM_VRD1_VOLT_REG,
+	RCA_VRD_VOLT_REG,
+};
+
+static const u8 curr_regs[] = {
+	CORE_VRD_CURR_REG,
+	SOC_VRD_CURR_REG,
+	DIMM_VRD1_CURR_REG,
+	DIMM_VRD2_CURR_REG,
+	RCA_VRD_CURR_REG,
+};
+
+enum pwr_regs {
+	CORE_VRD_PWR,
+	SOC_PWR,
+	DIMM_VRD1_PWR,
+	DIMM_VRD2_PWR,
+	CPU_VRD_PWR,
+	DIMM_VRD_PWR,
+	RCA_VRD_PWR,
+	SOC_TDP_PWR,
+};
+static const char * const label[] = {
+	"SoC",
+	"SoC VRD",
+	"DIMM VRD",
+	"DIMM VRD1",
+	"DIMM VRD2",
+	"CORE VRD",
+	"CH0 DIMM",
+	"CH1 DIMM",
+	"CH2 DIMM",
+	"CH3 DIMM",
+	"CH4 DIMM",
+	"CH5 DIMM",
+	"CH6 DIMM",
+	"CH7 DIMM",
+	"MEM HOT",
+	"SoC VR HOT",
+	"CPU VRD",
+	"RCA VRD",
+	"SOC TDP",
+	"DIMM G0",
+	"DIMM G1",
+};
+
+static int smpro_read_temp(struct device *dev, u32 attr, int channel,
+				long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int t_max = 0xffffffff;
+	unsigned int value;
+	s32 i;
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (temp_regs[channel] == DIMM_GROUP_DUMMY_REG) {
+			for (i = 1; i <= 4; i++) {
+				ret = regmap_read(hwmon->regmap,
+						temp_regs[channel + i], &value);
+				if (ret)
+					return ret;
+				/* continue if invalid */
+				if (value == 0xffff)
+					continue;
+
+				value &= 0x1ff; /* 9-bit value */
+				if (t_max != 0xffffffff)
+					t_max = (value > t_max) ? value : t_max;
+				else
+					t_max = value;
+			}
+
+			if (t_max == 0xffffffff)
+				return -1;
+
+			*val = t_max * 1000;
+		} else {
+			ret = regmap_read(hwmon->regmap,
+					temp_regs[channel], &value);
+			if (ret)
+				return ret;
+			*val = (value & 0x1ff) * 1000;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int smpro_read_in(struct device *dev, u32 attr, int channel,
+				long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = regmap_read(hwmon->regmap, volt_regs[channel], &value);
+		if (ret < 0)
+			return ret;
+		*val = value & 0x7fff; /* 15-bit value */
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read_curr(struct device *dev, u32 attr, int channel,
+				long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (attr) {
+	case hwmon_curr_input:
+		ret = regmap_read(hwmon->regmap, curr_regs[channel], &value);
+		if (ret < 0)
+			return ret;
+		*val = value & 0x7fff; /* 15-bit value */
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read_power(struct device *dev, u32 attr, int channel,
+				long *val_pwr)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int val2, val2_mw;
+	unsigned int val, val_mw;
+	int ret;
+
+	switch (attr) {
+	case hwmon_power_input:
+		switch (channel) {
+		case CORE_VRD_PWR:
+			ret = regmap_read(hwmon->regmap,
+					CORE_VRD_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						CORE_VRD_PWR_MW_REG, &val_mw);
+			if (ret)
+				return ret;
+			break;
+		case SOC_PWR:
+			ret = regmap_read(hwmon->regmap,
+					SOC_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						SOC_PWR_MW_REG, &val_mw);
+			if (ret)
+				return ret;
+			break;
+		case DIMM_VRD1_PWR:
+			ret = regmap_read(hwmon->regmap,
+					DIMM_VRD1_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						DIMM_VRD1_PWR_MW_REG, &val_mw);
+			if (ret)
+				return ret;
+			break;
+		case DIMM_VRD2_PWR:
+			ret = regmap_read(hwmon->regmap,
+					DIMM_VRD2_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						DIMM_VRD2_PWR_MW_REG, &val_mw);
+			if (ret)
+				return ret;
+			break;
+		case RCA_VRD_PWR:
+			ret = regmap_read(hwmon->regmap,
+					RCA_VRD_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						RCA_VRD_PWR_MW_REG, &val_mw);
+			if (ret)
+				return ret;
+			break;
+		case SOC_TDP_PWR:
+			ret = regmap_read(hwmon->regmap,
+					SOC_TDP_REG, &val);
+			if (ret)
+				return ret;
+			break;
+		case CPU_VRD_PWR:
+			ret = regmap_read(hwmon->regmap,
+					CORE_VRD_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						CORE_VRD_PWR_MW_REG, &val_mw);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						SOC_PWR_REG, &val2);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						SOC_PWR_MW_REG, &val2_mw);
+			if (ret)
+				return ret;
+			break;
+		case DIMM_VRD_PWR:
+			ret = regmap_read(hwmon->regmap,
+					DIMM_VRD1_PWR_REG, &val);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						DIMM_VRD1_PWR_MW_REG, &val_mw);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						DIMM_VRD2_PWR_REG, &val2);
+			if (!ret)
+				ret = regmap_read(hwmon->regmap,
+						DIMM_VRD2_PWR_MW_REG, &val2_mw);
+			if (ret)
+				return ret;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		/* Set to 0 if invalid */
+		if (val_mw == 0xffff)
+			val_mw = 0;
+		if (val2_mw == 0xffff)
+			val2_mw = 0;
+
+		*val_pwr = (val + val2) * 1000000 + (val_mw + val2_mw) * 1000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
+				u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_temp:
+		return smpro_read_temp(dev, attr, channel, val);
+	case hwmon_in:
+		return smpro_read_in(dev, attr, channel, val);
+	case hwmon_power:
+		return smpro_read_power(dev, attr, channel, val);
+	case hwmon_curr:
+		return smpro_read_curr(dev, attr, channel, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_write(struct device *dev, enum hwmon_sensor_types type,
+				u32 attr, int channel, long val)
+{
+	return -EOPNOTSUPP;
+}
+
+static umode_t smpro_is_visible(const void *data,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	return 0444;
+}
+
+static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
+				char *buf)
+{
+	int index = to_sensor_dev_attr(devattr)->index;
+
+	return sprintf(buf, "%s\n", label[index]);
+}
+
+static const u32 smpro_temp_config[] = {
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpro_temp = {
+	.type = hwmon_temp,
+	.config = smpro_temp_config,
+};
+
+static const u32 smpro_in_config[] = {
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	HWMON_I_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpro_in = {
+	.type = hwmon_in,
+	.config = smpro_in_config,
+};
+
+static const u32 smpro_curr_config[] = {
+	HWMON_C_INPUT,
+	HWMON_C_INPUT,
+	HWMON_C_INPUT,
+	HWMON_C_INPUT,
+	HWMON_C_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpro_curr = {
+	.type = hwmon_curr,
+	.config = smpro_curr_config,
+};
+
+static const u32 smpro_power_config[] = {
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	HWMON_P_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info smpro_power = {
+	.type = hwmon_power,
+	.config = smpro_power_config,
+};
+
+static const struct hwmon_channel_info *smpro_info[] = {
+	&smpro_temp,
+	&smpro_in,
+	&smpro_power,
+	&smpro_curr,
+	NULL
+};
+
+static const struct hwmon_ops smpro_hwmon_ops = {
+	.is_visible = smpro_is_visible,
+	.read = smpro_read,
+	.write = smpro_write,
+};
+
+static const struct hwmon_chip_info smpro_chip_info = {
+	.ops = &smpro_hwmon_ops,
+	.info = smpro_info,
+};
+
+static SENSOR_DEVICE_ATTR(temp1_label, 0444, show_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(temp2_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(temp3_label, 0444, show_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(temp5_label, 0444, show_label, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp6_label, 0444, show_label, NULL, 6);
+static SENSOR_DEVICE_ATTR(temp7_label, 0444, show_label, NULL, 7);
+static SENSOR_DEVICE_ATTR(temp8_label, 0444, show_label, NULL, 8);
+static SENSOR_DEVICE_ATTR(temp9_label, 0444, show_label, NULL, 9);
+static SENSOR_DEVICE_ATTR(temp10_label, 0444, show_label, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp11_label, 0444, show_label, NULL, 10);
+static SENSOR_DEVICE_ATTR(temp12_label, 0444, show_label, NULL, 11);
+static SENSOR_DEVICE_ATTR(temp13_label, 0444, show_label, NULL, 12);
+static SENSOR_DEVICE_ATTR(temp14_label, 0444, show_label, NULL, 13);
+static SENSOR_DEVICE_ATTR(temp15_label, 0444, show_label, NULL, 14);
+static SENSOR_DEVICE_ATTR(temp16_label, 0444, show_label, NULL, 15);
+static SENSOR_DEVICE_ATTR(temp17_label, 0444, show_label, NULL, 17);
+
+static SENSOR_DEVICE_ATTR(in0_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(in1_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(in2_label, 0444, show_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(in3_label, 0444, show_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(in4_label, 0444, show_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(in5_label, 0444, show_label, NULL, 17);
+
+static SENSOR_DEVICE_ATTR(power1_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(power2_label, 0444, show_label, NULL, 0);
+static SENSOR_DEVICE_ATTR(power3_label, 0444, show_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(power4_label, 0444, show_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(power5_label, 0444, show_label, NULL, 16);
+static SENSOR_DEVICE_ATTR(power6_label, 0444, show_label, NULL, 2);
+static SENSOR_DEVICE_ATTR(power7_label, 0444, show_label, NULL, 17);
+static SENSOR_DEVICE_ATTR(power8_label, 0444, show_label, NULL, 18);
+
+static SENSOR_DEVICE_ATTR(curr1_label, 0444, show_label, NULL, 5);
+static SENSOR_DEVICE_ATTR(curr2_label, 0444, show_label, NULL, 1);
+static SENSOR_DEVICE_ATTR(curr3_label, 0444, show_label, NULL, 3);
+static SENSOR_DEVICE_ATTR(curr4_label, 0444, show_label, NULL, 4);
+static SENSOR_DEVICE_ATTR(curr5_label, 0444, show_label, NULL, 17);
+
+static struct attribute *smpro_attrs[] = {
+	&sensor_dev_attr_temp1_label.dev_attr.attr,
+	&sensor_dev_attr_temp2_label.dev_attr.attr,
+	&sensor_dev_attr_temp3_label.dev_attr.attr,
+	&sensor_dev_attr_temp4_label.dev_attr.attr,
+	&sensor_dev_attr_temp5_label.dev_attr.attr,
+	&sensor_dev_attr_temp6_label.dev_attr.attr,
+	&sensor_dev_attr_temp7_label.dev_attr.attr,
+	&sensor_dev_attr_temp8_label.dev_attr.attr,
+	&sensor_dev_attr_temp9_label.dev_attr.attr,
+	&sensor_dev_attr_temp10_label.dev_attr.attr,
+	&sensor_dev_attr_temp11_label.dev_attr.attr,
+	&sensor_dev_attr_temp12_label.dev_attr.attr,
+	&sensor_dev_attr_temp13_label.dev_attr.attr,
+	&sensor_dev_attr_temp14_label.dev_attr.attr,
+	&sensor_dev_attr_temp15_label.dev_attr.attr,
+	&sensor_dev_attr_temp16_label.dev_attr.attr,
+	&sensor_dev_attr_temp17_label.dev_attr.attr,
+
+	&sensor_dev_attr_in0_label.dev_attr.attr,
+	&sensor_dev_attr_in1_label.dev_attr.attr,
+	&sensor_dev_attr_in2_label.dev_attr.attr,
+	&sensor_dev_attr_in3_label.dev_attr.attr,
+	&sensor_dev_attr_in4_label.dev_attr.attr,
+	&sensor_dev_attr_in5_label.dev_attr.attr,
+
+	&sensor_dev_attr_curr1_label.dev_attr.attr,
+	&sensor_dev_attr_curr2_label.dev_attr.attr,
+	&sensor_dev_attr_curr3_label.dev_attr.attr,
+	&sensor_dev_attr_curr4_label.dev_attr.attr,
+	&sensor_dev_attr_curr5_label.dev_attr.attr,
+
+	&sensor_dev_attr_power1_label.dev_attr.attr,
+	&sensor_dev_attr_power2_label.dev_attr.attr,
+	&sensor_dev_attr_power3_label.dev_attr.attr,
+	&sensor_dev_attr_power4_label.dev_attr.attr,
+	&sensor_dev_attr_power5_label.dev_attr.attr,
+	&sensor_dev_attr_power6_label.dev_attr.attr,
+	&sensor_dev_attr_power7_label.dev_attr.attr,
+	&sensor_dev_attr_power8_label.dev_attr.attr,
+
+	NULL
+};
+ATTRIBUTE_GROUPS(smpro);
+
+static int is_valid_id(struct regmap *regmap)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
+
+	return  (ret || (val != AMPERE_MANUFACTURER_ID)) ? 0 : 1;
+}
+
+static int smpro_hwmon_probe(struct platform_device *pdev)
+{
+	struct smpro_hwmon *hwmon;
+	struct device *hwmon_dev;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon),
+			GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!hwmon->regmap)
+		return -ENODEV;
+
+	/* Check for valid ID */
+	if (!is_valid_id(hwmon->regmap))
+		dev_warn(&pdev->dev, "Hmmh, SMPro not ready yet\n");
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+			"smpro_hwmon", hwmon,
+			&smpro_chip_info, smpro_groups);
+	if (IS_ERR(hwmon_dev))
+		dev_err(&pdev->dev, "failed to register as hwmon device");
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static const struct of_device_id smpro_hwmon_of_match[] = {
+	{ .compatible = "ampere,ac01-hwmon" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, smpro_hwmon_of_match);
+
+static struct platform_driver smpro_hwmon_driver = {
+	.probe		= smpro_hwmon_probe,
+	.driver = {
+		.name	= "smpro-hwmon",
+		.of_match_table = smpro_hwmon_of_match,
+	},
+};
+
+module_platform_driver(smpro_hwmon_driver);
+
+MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Ampere Altra SMPro hwmon driver");
+MODULE_LICENSE("GPL");
-- 
2.28.0

