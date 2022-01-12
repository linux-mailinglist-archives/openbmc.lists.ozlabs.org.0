Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990A748BEB7
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 07:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYdbd3Flpz2yfd
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 17:54:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=yflyX1hL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.255.136;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=yflyX1hL; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2136.outbound.protection.outlook.com [40.107.255.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYdb75DYpz2xsW
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 17:54:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7uuuoigGIvO3TMMtQep9nelG9KZO14zVqdXe7gHRaqCcPgcTn4Nl4/J/AE3tUDp3bQPrjPTk04A3ZhoBR+f9jMA+woYDHOmOyxM5NF9ksqSE/x0/rnvgiVss1TTRpb+af/0EPVfAVc9Kpb+NU2ARs5p+XEUbVAhpozXXuN3t5wMoeOFMsDEuh+iCe1Uy1sxTv3efXoz/cwOX4e9NyqVZjITwrGT6IIR9PG82Ng147E14e505PuSagfsLhAw60Bdj2jO1PY2asFl7UkzezjWY6i75XOb/40/CYAF/SkoDhOEjxcFhsGwEj3q9oYm//QVxxVQqL9IWhK/Q2EpO8AGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pGFubS9lMPVfRb1QTXhD0SPcizRlMn+gYxYWz3i4Z8=;
 b=oJwTXCQQA1s+YtmIdT/rvYg8U5f7tOYmG4lG+NgH/7xIqC30VaUiXHez08EOPpE5HXuRYzWza7eskqCPArVcaKXMamppTGAqL14ar8NPBbOXllfhFPGTgJS7P+2CHjtYf1e1tWQy2SP/gA+yMqv1dbiB0jxWBh7RdXS1EkIOoIRHbKBCxZWnXWboRgFrYWg6ZjPLSKg2UO/Ozo/c93zAd2wUfYH5yiKEdRrgb0SQ4pi9t8d/IW6pTUuPfXlTWKwGiF6Q4jNPC/fts22tt7ni3H6ijnmd1OcKQulACBenVH/Zo2JQjAC8vdbZduRGigmXx55/Ug01+usO74LAWSCpJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pGFubS9lMPVfRb1QTXhD0SPcizRlMn+gYxYWz3i4Z8=;
 b=yflyX1hLG3UDy8OLOAwjqIVab+fwB897/eR/4/bsuvsJ4A957LBSRtQT1eiTotc1dxhYW3c6BFfoSO23SpzlnnltIPGXTdTn7Wro3nytQEBivWcgy1Xz5qgdNIMMUv0xTEWxlDgMvrwW/u2/FWy0clI0W3EAm8qbg8mR0Dz3NPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (20.177.162.145) by
 HKAPR04MB3972.apcprd04.prod.outlook.com (20.180.90.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Wed, 12 Jan 2022 06:54:04 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4867.011; Wed, 12 Jan 2022
 06:54:04 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 1/1] hwmon: (pmbus) Add support for MPS
 Multi-phase mp5023
Date: Wed, 12 Jan 2022 14:53:50 +0800
Message-Id: <20220112065350.20680-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bf02973-2623-47a6-117c-08d9d5985242
X-MS-TrafficTypeDiagnostic: HKAPR04MB3972:EE_
X-Microsoft-Antispam-PRVS: <HKAPR04MB3972AEAA5AC6C54350DB4CDA8E529@HKAPR04MB3972.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:389;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghLtl/8WWQTO00TCCmmDlFIgYU0a3iyffXVtFOYcFaiYW2AXxSk/W1m4rEWGsdFXPapw1Cq2z2Dm5nrZfVx0X0aY3aFm5rsM0S8DVw+Lhb8FnH60CbpoP1L+4mIkD9fjtGgpnUjKi7zQyOABJZQ5lazxb0BqdqBPyP1T3zg107aKUc4GbdbG0cn9T9W9EomVJ5kjhRi76gJDuVAAMItQSzCCbMO/9F0zjCc91MmpX4JLwhMK+bFffz/tGv0uUULH/1YcdsRD7VY2SAK5JEi+oc7wAzaLp93jeYLlBJxOyCwYg5EAaGdECs4pkXUNaSiYgidZiUd93yVtImxxsuR/+dLU7JKl4mwoKprVihCLGTIthbc6ByD3nNmBL0jf3y/yiK+TIxuu/+fqdPGBbH4T5SCA3vxFM4D3SSht63L9gbLoDbdkp/f7loIPbRhW9ly5fzyxzaiI+wUo5wAli2E0cSzQodXVrbI3JTLlRNPR3nl4MwiNDJSZk+0QY4ROpbXmNXxJs+FSxIKWdIgHtaaxs5vmo9jH/FpidIzCOAiDSfjdaqGX1cfmW7AIpjNnpDuaT96RoeDNg892RyeZu1k71hE3TmKorNzCs6ZESx9ATp/HAlmEkqoyf+VXhBPBARtoFF9k+viPcDvtxvqky6uauZTBvi/TS9uELyJ6PBi8gPRNCjXWjKJVsN0W1gh9xl/JIza4lXrgCjdAgChV9rzb5dCsmRa54UGHwarzkT/axfkGJcJoeJ52Quw2myNmP4JIPy8jzxdtdP8bWEnQVCC2ZibK9QkMyuAoPdAWPEXmw/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(966005)(66476007)(52116002)(6486002)(508600001)(26005)(86362001)(36756003)(6666004)(66946007)(316002)(4326008)(8936002)(2616005)(5660300002)(8676002)(83380400001)(38350700002)(186003)(38100700002)(45080400002)(2906002)(1076003)(44832011)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Du89RBupndP8fyzVpfGIbXBAz9I1gaGDqr1lQJ1zG5avI2m93CDYCRMMAj+/?=
 =?us-ascii?Q?kRFal9d3AsBo1JjrE/Nu1J1HvrHeySpmgKw6bLE2F1fwBseT28cZ/9PCBSyz?=
 =?us-ascii?Q?mUU296wUPQsCH54HGYNthqNaUvvZC6gag4k/uMdQsV04rnCi3SHQ1rO4rMUT?=
 =?us-ascii?Q?DkUzJgGQdVGjdQQAbcEmKjx4AaU4L9D1g1+1HUI4ODE5In2rducbTiav87l4?=
 =?us-ascii?Q?02q6s7ZU7eITU8PU7CTouTd+8ttyQEj6yiQUhIvloteR2lBO75dgOs8evTo8?=
 =?us-ascii?Q?nFk3tUSmBW8xK+8FMAayRAZ1HqK9skHUxVG6bQLnncIAnZ+II2QARDjPxA3h?=
 =?us-ascii?Q?37Za4NvU8sS+mXUTQIm5Uncwwoqx2XPkXdBSy5Cb5OxIinGUbi+nVCPDxsXH?=
 =?us-ascii?Q?wxZ7CbgGabfJsTZ0FW45mkVPM6uBl8jg9d2F2kbVV1GL2N86YEUdhI28SHse?=
 =?us-ascii?Q?v7z9e7c/ink7c8GmOlfHTeYA+07c7O24NBENKNYC6kjTnDOYqCAFRsn2mK0v?=
 =?us-ascii?Q?mWGidtEeYKtWVxhhNo2rpH3SOPHBv+XVPSKex0pfowD0WK1EOAgos1TE6ThC?=
 =?us-ascii?Q?NFAHRHYAbwL1cJTG/vDcJyJVrb/tcs1B0ZzWMTDevQuvfrqoEMQcj6kcHHQA?=
 =?us-ascii?Q?SVLP7f6NTe3HQSFxcvFvVba/k4Exf/IIIUY5E9i4jijhUh/1q/Tkt9btQ40H?=
 =?us-ascii?Q?NGFo9qSlbIRyO0BCibiNkE3j3CRaUrniAIFe0926wwPLEZY9IUY+mnA3wwTS?=
 =?us-ascii?Q?7CZbcvjEMCyhZJ3XHVDadh/M6efVGbj69OLQ4FbU01FM/zlqlC6Y6XtHdEUK?=
 =?us-ascii?Q?P3HdpYLpI6vE57HXnGamn71EcJpnisZS5R1Z6PxHwKB5Vn7ZiCuRY5Bpygco?=
 =?us-ascii?Q?OeMyHADCe0qQhyvawbmFUhlTb50ttAlsD7rVbFtXYTcW5YFe2FOzAAlErq6e?=
 =?us-ascii?Q?/Yz1/Ros9hkeTVGBEMzMt9Db7XOBcQ3gwQQgaaw+W9vljJ/159zEO00yjGGH?=
 =?us-ascii?Q?I1ie6VA+R1NCYpinz9sem8+/OWUrm/aIzSOKzAu8iYjQYXar63oOMx8SAMk7?=
 =?us-ascii?Q?GwPnpDmH5U3uyCkDQvGWXCBydnUaKemgEtLiiXiCwocLOx7KJXbFMpjZRomS?=
 =?us-ascii?Q?oNea/E1SeeG+NICFQhEjY0zLzFC7eaOFwvRtC7lwIInJF+qnwKslr59ent0m?=
 =?us-ascii?Q?At1kdjapI/Kpwo1FEGo2+1iZlSXZImD6VWcGg9dppuPxdVHn5DCnudQnQTFB?=
 =?us-ascii?Q?N2U6NQSlfc3FESng8F70V85HRFtU7dsV4/TYkJ9EODiAxqFFuVow/10lWKt/?=
 =?us-ascii?Q?zfhoHUAun1C1sNlBeHSZSVSSKNnj1hk4X7E+xFq1uj0ynzndiM/yVIiwEAU2?=
 =?us-ascii?Q?dGPsKpF9fSDwDGje23rESetvclyy7IMGYIY4B5+KqDNhwZRLV8SuccgSLNdH?=
 =?us-ascii?Q?+eJV//8m8CuUGpvu354yZ4WImGtHch4d+6h5V31UAG+its2HWUds6pramal9?=
 =?us-ascii?Q?9eLuH6rRJj0rNv26mTPLoj0ZE5yiQKCqxoblslN0ksAS8/mr5qvBYfo7/nbm?=
 =?us-ascii?Q?KdjMhYAT10Fd10odn+n8/3abXq8vUqUXKR/ryNRW7gSIyqzIAQs9kLT9bBKH?=
 =?us-ascii?Q?OeYNGMqlFNBz3s2J+twaSc4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf02973-2623-47a6-117c-08d9d5985242
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:54:04.2692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBqaBFX2I07KW7yBpK+MvKeJC+7xXKPODoOdGkuP4laH5oDO1phVOVedD9KVXUBd0Y/EilM1i1WSM+awmvPk2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3972
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
Cc: potin.lai@quantatw.com, Howard Chiu <howard.chiu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Howard Chiu <howard.chiu@quantatw.com>

Add support for mp5023 device from Monolithic Power Systems, Inc. (MPS)
vendor. This is a Hot-Swap Controller.

Link: https://lore.kernel.org/r/HKAPR04MB400349AA406694FB976D78D096709@HKAPR04MB4003.apcprd04.prod.outlook.com
Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>

---
Change since v1:
- update commit message
- add lore link for reference
---
 Documentation/hwmon/mp5023.rst | 84 ++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig    |  9 ++++
 drivers/hwmon/pmbus/Makefile   |  1 +
 drivers/hwmon/pmbus/mp5023.c   | 66 ++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 Documentation/hwmon/mp5023.rst
 create mode 100644 drivers/hwmon/pmbus/mp5023.c

diff --git a/Documentation/hwmon/mp5023.rst b/Documentation/hwmon/mp5023.rst
new file mode 100644
index 000000000000..af5ab1345a91
--- /dev/null
+++ b/Documentation/hwmon/mp5023.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5023
+====================
+
+Supported chips:
+
+  * MPS MP5023
+
+    Prefix: 'mp5023'
+
+  * Datasheet
+
+    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5023.html
+
+Author:
+
+	Howard Chiu <howard.chiu@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5023 Hot-Swap Controller.
+
+Device complaint with:
+
+- PMBus rev 1.3 interface.
+
+Device supports direct format for reading input voltage, output voltage,
+output current, input power and temperature.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_max**
+
+**in1_max_alarm**
+
+**in1_min**
+
+**in1_min_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_alarm**
+
+**curr1_max**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+**power1_alarm**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_max**
+
+**temp1_max_alarm**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index ffb609cee3a4..b56bd8542864 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -276,6 +276,15 @@ config SENSORS_MP2975
 	  This driver can also be built as a module. If so, the module will
 	  be called mp2975.
 
+config SENSORS_MP5023
+	tristate "MPS MP5023"
+	help
+	  If you say yes here you get hardware monitoring support for MPS
+	  MP5023.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5023.
+
 config SENSORS_PIM4328
 	tristate "Flex PIM4328 and compatibles"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 0ed4d596a948..61cdc24b1309 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
 obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
 obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
 obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
+obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
 obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
 obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
new file mode 100644
index 000000000000..14d3934aa099
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for MPS MP5023 Hot-Swap Controller
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include "pmbus.h"
+
+static struct pmbus_driver_info mp5023_info = {
+	.pages = 1,
+
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_CURRENT_OUT] = direct,
+	.format[PSC_POWER] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 32,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+	.m[PSC_VOLTAGE_OUT] = 32,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+	.m[PSC_CURRENT_OUT] = 16,
+	.b[PSC_CURRENT_OUT] = 0,
+	.R[PSC_CURRENT_OUT] = 0,
+	.m[PSC_POWER] = 1,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = 0,
+	.m[PSC_TEMPERATURE] = 2,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+
+	.func[0] =
+		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+};
+
+static int mp5023_probe(struct i2c_client *client)
+{
+	return pmbus_do_probe(client, &mp5023_info);
+}
+
+static const struct of_device_id __maybe_unused mp5023_of_match[] = {
+	{ .compatible = "mps,mp5023", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, mp5023_of_match);
+
+static struct i2c_driver mp5023_driver = {
+	.driver = {
+		   .name = "mp5023",
+		   .of_match_table = of_match_ptr(mp5023_of_match),
+	},
+	.probe_new = mp5023_probe,
+};
+
+module_i2c_driver(mp5023_driver);
+
+MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
+MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
+MODULE_LICENSE("GPL");
-- 
2.17.1

