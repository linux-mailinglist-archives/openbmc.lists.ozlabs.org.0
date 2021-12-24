Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC447EB4B
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:18:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv1W6kG8z2yp9
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:18:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=WsN86RQC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.136;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=WsN86RQC; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKty811t2z2xXZ;
 Fri, 24 Dec 2021 15:15:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUOCHMIQ90knSELc4tKX3ABSWf4MVagtkNOgmd8H+xovOp4keDhHcgd6JFTPpugxMmI4qGC9uSIhvCLj3ScdK4KkKUtpvE0PgPbyPsIW+DAIvgX29OdNlSrjuJZOe2Y5vaCVhsAm8Krc23+poKoKqlr9vZw3gM40l4Y3c5gby1OzKGjqtEvxBOnSZRmvZnIHx4R6o5bhPjE4qgKRgPX9R6DRDDZ0FPDbNfU7xH/7mJNcX6MJ3DcUP9jFZKKXpT/IyV3BeHxda5OKd524qgMveBlzHxxsmc8nUBVqLYRbBBoGGig9pCHyZXDGprkYTmYBUhhEK+9BvBlynWcku+WBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HR88yNTR87ulSLUtYyUZHK+k//lt2io8QO7ZAvNVAPQ=;
 b=QPhK8MEFgYvGT7iZGQKxwKdR9GMdQOF3Qyz3l86pQ2GI+Tuk57uviZClwhR1LMOtAVnhdyzr3pBLBpDH4gQGFzSh0D24Z842elk7hKPCcdillA2Mm/Pm1HkBFlP+Ew4mj+09nY4p2vp1ICrliqk6DfJTAH0nDqBfqGf8hAB5CHMFZa9gQ8ZRvFfK/yyv8NJ2PkZ99hUnkqIsrLAbzCxGeDrpV571xX8mf+qqnsibsJdHHzZ7USqwj6pAocEj1GmrMetWOrQ37CIu8/ZMJhEO7iuCCSmIje+tZcmcpCw2SlDhsYsEpO5HG/bzay65swmdlS4bWpYIL1rRmclsjjoCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HR88yNTR87ulSLUtYyUZHK+k//lt2io8QO7ZAvNVAPQ=;
 b=WsN86RQCXBbw+l28FLC6zcNYjGP7eodHNpbt4qemmwqDg1YmHhqrqjlJHjEq4iurPSUg2LZSrjdaDBBPh3hgOsO48315iGRB4LA2JA0wxmUl3ldTprP4zV2iPZAHynOuNUP4r83fqnxt9knLhlYKT6FxMAIAa4pnXYdI1cm+o8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:05 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:05 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 3/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Fri, 24 Dec 2021 11:13:46 +0700
Message-Id: <20211224041352.29405-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211224041352.29405-1-quan@os.amperecomputing.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21b8a894-bb9c-4760-3894-08d9c693f6b5
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB51895A424D33EA9F9BBC22ABF27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6l47N7G0h/krKoLeM6QVYhavF5tsPV2yKj+PWVWTbxmAILz6Qpokedg/IG5iIWY8g8MxPOtaZjJpqWhBsDo05GjxpBe371p+zWwkYcoqU7C2nvAc7H28MH0NOvvx7RK5q7tI8RaXA4BTiz4g/diqQp81Ql0xSrmMmYEM9aDk8chn2FRQqaeT90DFb4Nn1bSk3GaqdtiG5MN4yDKm0qjer7qrs6n0PMR5Ca+JRRQ96RYO0g2JI2/oYJBZjQxZk4jdjhiaPfrIl0F44nMbAEyk+buv1slfm6lPvFvfct4hpj/OuOKg2SQ9jirbBQ5luAqZOG1oFZYE3Yv3HnN0wywBcI9cSqUhXlH7/uFx3MMCa7uJ+UH4vfDMT7znzR5upFf8X3/+nOgACvJIw35Z84vubnt/aWH4HLgWAMsEChLcrhKBgjIfhbivLz+cnvU/WMgaTjDEZhzlOGCzwOVDov3TVN9O+bCqnzR51+m1rJOs191PC6h2bLM/3OIMpb1P515Px+rgn6EOh9AFFvVvonoi0DdTNkr3Y3yDfwsTz1+xSnMQvuwXqyLJsc82sV+MTf+inG2fvGmK6qEavliT+C/oApWzih3pmESLi/BNGu8YW4FW6ihf8/TJ4F5sg4ytk20i97qH8An83RP3nBoaz4HVr55CI22sCq7mBMjG4uDIeVa9LvvGQm4voMUzGY2j3FXAv7edjQXH+gvvEDSOjDwNH2niz0LpZ++QQnuENfTUlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(30864003)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R4qvb+RExUvslFGZrDg0dW7qMghGSE4JXqSzTk6D0oZm4I32uDbrJ2FkXvWt?=
 =?us-ascii?Q?/vRCwYu3cl/dn28jZVH4irwVlpsF5yjhEJklqqta0J08++3zuE6oB19UKtXY?=
 =?us-ascii?Q?SyYu6JSqGEfwOpN9imNRzuFgoXYW3TWaArrXTASmGvO3LHgAZF0OajxZUccF?=
 =?us-ascii?Q?u7BUl4z8A10539JfeDfvHfn+8M5OOzPjKOOZAB67+o1T+7EGzF8b0fa5jSN6?=
 =?us-ascii?Q?g3+VVZ3JG1fXx+nGbzl/qS/0q3gDWFsSv+7x/tlBrqA+7Pbokk8l7pm9JpD4?=
 =?us-ascii?Q?g476NNFDvwbT9bCDcm9fQS4N4uXykHKQoPUNsCHsglCx7BGPPGKBcg4H4gTb?=
 =?us-ascii?Q?cA6WQGwGQc9dzK47E0JEojjVtpy+wGHYWxKMv3u111E/aBmI7jqgVQmKNuGv?=
 =?us-ascii?Q?kuXP6Hv83lYSNuf99KxzJ+FlqKwXjpvdxk1U9s0rYi2zIDlhPj4NvG0sz3z+?=
 =?us-ascii?Q?56jf7+QhbiuOI+5Iy94szB1Sacx3mQy/M/KN2fM+wUqtb5Q6cB6vI/eHeraW?=
 =?us-ascii?Q?zSxu4uLMLTMdGwuJC/LuceURcnUj/905EbOGonJxJfCnDCqu0knKr+6xw7ye?=
 =?us-ascii?Q?FVgdLi0dHB+r/yjoDumN7wHLPLYItyynfKW2akQNn5jaTGfH1xJ1EaLX1htd?=
 =?us-ascii?Q?Aal+Rj2UoDhrfgYKWay9KhKgfnO/VMnpdOOekJ8oe1Uc+mDV0wEPRylVOu69?=
 =?us-ascii?Q?D1fnNJNLAZVQJNwUGqLJdyEa7/oNCbfn/n4t0AUsb6MHWS1McsvYNMWXg0wv?=
 =?us-ascii?Q?yjzxBeJdmrmJxcqyn5DQ83Kkof67+R+RLCKznuN3+A1u3hS3AKHNhO70LzgF?=
 =?us-ascii?Q?x2q/7DaZNKjscrM3o1V5ARszLMDx1rtZNrp2IVvcps/i3gwDRR92zoYZ6qft?=
 =?us-ascii?Q?6d5IUAqmnU8emVunFScTV8KD2psnDXL08P+F2uJeHSwNnehzCPUTGx32ARWC?=
 =?us-ascii?Q?nkTMWfyjWlZvP27bgM3lRt0hmlhhB7gbcUPlGf5Nre1P90eDTgQd5hMA7D//?=
 =?us-ascii?Q?ZSsKr89tj7+RJZWSfRiu9BPB422QiXMUEpW3Zih71FKuSQsrFecH2F+IHaXG?=
 =?us-ascii?Q?FMoVyMcZr5TtXsM+956Km3GvrqAflKG8SDEcEtFyH0fmLzTva1l/fIO9/c7a?=
 =?us-ascii?Q?BFYd7Dl5sUEKChw22YDmmHetiNDSYv9H9dr/L5S+3xzwHqnA4XJt63DTl5ja?=
 =?us-ascii?Q?tTGL7CST4gZC5qP7PJ75GKObyAua7VoRkIisDQ5+ojcRrQhmliIPIa13awk3?=
 =?us-ascii?Q?LQcMbHc9XuyTOgUPvEEFCBIIvywqE/nKuhfcG5QDgzjzW85RwEerdbmh2/L+?=
 =?us-ascii?Q?7FeVGkudqB+ngxVgku/D6EKx8vaJV4JT+0VWD26W6Ii2cw+U8gcC6R68pOYU?=
 =?us-ascii?Q?Cbl88rjxCXl8OEZd9Tmc7F1SdxqvYWwi8TtHRUkfVSgKtpjtJsnQl9WbVDPu?=
 =?us-ascii?Q?z6v8k9eva4z6dQHfc2V+t28z4yHSEF+J/agQdiRUV1dqZtm4k8DM0FCzqiHQ?=
 =?us-ascii?Q?xDmeF0uvLSYWC1KazIGSNy8R+7LsO3+DALHA2tWXcHScY9kk98WDAf4Bism3?=
 =?us-ascii?Q?EE59mQV4tkq7taF904XSZTIQsGiWqXorxoKymTqqL66cu79EX9jdCIsImeqK?=
 =?us-ascii?Q?vWA9bjPzBMrcnmXn4YGICl74pAdMCq22hnIkWck6ib+xZIIr/EZ1zyL3Yl0x?=
 =?us-ascii?Q?dmkAaqtADLlz/eq35tZISc+2iPY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b8a894-bb9c-4760-3894-08d9c693f6b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:05.4948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xt4cr8wBxGUHycaciKFwX0IKmsZzOBjyx8pBYuDoYItrEKvbyqsPdfsbEawvv8Yt2cyKHmc6oBrV5tWjAIPayjn1/nEhUK2nu72wm/ILf6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5189
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
 Phong Vo <phong@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds support for Ampere SMpro hwmon driver. This driver
supports accessing various CPU sensors provided by the SMpro co-processor
including temperature, power, voltages, and current.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v6:
  + None

Changes in v5:
  + Drop ManufacturerID checking when probe as it was checked during
  smpro-mfd probing [Quan]
  + Drop the use of register offset [Quan]
  + Removed the use of compatible string as it is instantiated by
  smpro-mfd driver [Quan]
  + Thanks Guenter for the Reviewed-by in last version, but it was
  not added because there's some changes in this version. Really
  appreciate if you could help again, thank you.

Changes in v4:
  + Returned regmap_read() error code [Guenter]

Changes in v3:
  + Handled negative temperature value [Guenter]
  + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
  + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
  + Removed smpro_write() function [Guenter]
  + Added minor refactor changes [Quan]

Changes in v2:
  + Removed "virtual" sensors [Guenter]
  + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
  + Corrected return error code when host is turn off [Guenter]
  + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
  + Removed license info as SPDX-License-Identifier existed [Guenter]
  + Added is_visible() support [Guenter]
  + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
  + Made is_valid_id() return boolean [Guenter]
  + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
  + Removed unnecessary error message when dev register fail [Guenter]
  + Removed Socket TDP sensor [Quan]
  + Included sensor type and channel in labels [Quan]
  + Refactorized code to fix checkpatch.pl --strict complaint [Quan]

 drivers/hwmon/Kconfig       |   8 +
 drivers/hwmon/Makefile      |   1 +
 drivers/hwmon/smpro-hwmon.c | 463 ++++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 drivers/hwmon/smpro-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8df25f1079ba..493e44577317 100644
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
index 185f946d698b..0365015b8bae 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
new file mode 100644
index 000000000000..b01ceea33ddd
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMPro Hardware Monitoring Driver
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+/* Logical Power Sensor Registers */
+#define SOC_TEMP		0x10
+#define SOC_VRD_TEMP		0x11
+#define DIMM_VRD_TEMP		0x12
+#define CORE_VRD_TEMP		0x13
+#define CH0_DIMM_TEMP		0x14
+#define CH1_DIMM_TEMP		0x15
+#define CH2_DIMM_TEMP		0x16
+#define CH3_DIMM_TEMP		0x17
+#define CH4_DIMM_TEMP		0x18
+#define CH5_DIMM_TEMP		0x19
+#define CH6_DIMM_TEMP		0x1A
+#define CH7_DIMM_TEMP		0x1B
+#define RCA_VRD_TEMP		0x1C
+
+#define CORE_VRD_PWR		0x20
+#define SOC_PWR			0x21
+#define DIMM_VRD1_PWR		0x22
+#define DIMM_VRD2_PWR		0x23
+#define CORE_VRD_PWR_MW		0x26
+#define SOC_PWR_MW		0x27
+#define DIMM_VRD1_PWR_MW	0x28
+#define DIMM_VRD2_PWR_MW	0x29
+#define RCA_VRD_PWR		0x2A
+#define RCA_VRD_PWR_MW		0x2B
+
+#define MEM_HOT_THRESHOLD	0x32
+#define SOC_VR_HOT_THRESHOLD	0x33
+#define CORE_VRD_VOLT		0x34
+#define SOC_VRD_VOLT		0x35
+#define DIMM_VRD1_VOLT		0x36
+#define DIMM_VRD2_VOLT		0x37
+#define RCA_VRD_VOLT		0x38
+
+#define CORE_VRD_CURR		0x39
+#define SOC_VRD_CURR		0x3A
+#define DIMM_VRD1_CURR		0x3B
+#define DIMM_VRD2_CURR		0x3C
+#define RCA_VRD_CURR		0x3D
+
+struct smpro_hwmon {
+	struct regmap *regmap;
+};
+
+struct smpro_sensor {
+	const u8 reg;
+	const u8 reg_ext;
+	const char *label;
+};
+
+static const struct smpro_sensor temperature[] = {
+	{
+		.reg = SOC_TEMP,
+		.label = "temp1 SoC"
+	},
+	{
+		.reg = SOC_VRD_TEMP,
+		.reg_ext = SOC_VR_HOT_THRESHOLD,
+		.label = "temp2 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD_TEMP,
+		.label = "temp3 DIMM VRD"
+	},
+	{
+		.reg = CORE_VRD_TEMP,
+		.label = "temp4 CORE VRD"
+	},
+	{
+		.reg = CH0_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp5 CH0 DIMM"
+	},
+	{
+		.reg = CH1_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp6 CH1 DIMM"
+	},
+	{
+		.reg = CH2_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp7 CH2 DIMM"
+	},
+	{
+		.reg = CH3_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp8 CH3 DIMM"
+	},
+	{
+		.reg = CH4_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp9 CH4 DIMM"
+	},
+	{
+		.reg = CH5_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp10 CH5 DIMM"
+	},
+	{
+		.reg = CH6_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp11 CH6 DIMM"
+	},
+	{
+		.reg = CH7_DIMM_TEMP,
+		.reg_ext = MEM_HOT_THRESHOLD,
+		.label = "temp12 CH7 DIMM"
+	},
+	{
+		.reg = RCA_VRD_TEMP,
+		.label = "temp13 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor voltage[] = {
+	{
+		.reg = CORE_VRD_VOLT,
+		.label = "vout0 CORE VRD"
+	},
+	{
+		.reg = SOC_VRD_VOLT,
+		.label = "vout1 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD1_VOLT,
+		.label = "vout2 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_VOLT,
+		.label = "vout3 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_VOLT,
+		.label = "vout4 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor curr_sensor[] = {
+	{
+		.reg = CORE_VRD_CURR,
+		.label = "iout1 CORE VRD"
+	},
+	{
+		.reg = SOC_VRD_CURR,
+		.label = "iout2 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD1_CURR,
+		.label = "iout3 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_CURR,
+		.label = "iout4 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_CURR,
+		.label = "iout5 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor power[] = {
+	{
+		.reg = CORE_VRD_PWR,
+		.reg_ext = CORE_VRD_PWR_MW,
+		.label = "power1 CORE VRD"
+	},
+	{
+		.reg = SOC_PWR,
+		.reg_ext = SOC_PWR_MW,
+		.label = "power2 SoC"
+	},
+	{
+		.reg = DIMM_VRD1_PWR,
+		.reg_ext = DIMM_VRD1_PWR_MW,
+		.label = "power3 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_PWR,
+		.reg_ext = DIMM_VRD2_PWR_MW,
+		.label = "power4 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_PWR,
+		.reg_ext = RCA_VRD_PWR_MW,
+		.label = "power5 RCA VRD"
+	},
+};
+
+static int smpro_read_temp(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
+		if (ret)
+			return ret;
+		break;
+	case hwmon_temp_crit:
+		ret = regmap_read(hwmon->regmap, temperature[channel].reg_ext, &value);
+		if (ret)
+			return ret;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*val = sign_extend32(value, 8) * 1000;
+	return 0;
+}
+
+static int smpro_read_in(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = regmap_read(hwmon->regmap, voltage[channel].reg, &value);
+		if (ret < 0)
+			return ret;
+		/* 15-bit value in 1mV */
+		*val = value & 0x7fff;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read_curr(struct device *dev, u32 attr, int channel, long *val)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (attr) {
+	case hwmon_curr_input:
+		ret = regmap_read(hwmon->regmap, curr_sensor[channel].reg, &value);
+		if (ret < 0)
+			return ret;
+		/* Scale reported by the hardware is 1mA */
+		*val = value & 0x7fff;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read_power(struct device *dev, u32 attr, int channel, long *val_pwr)
+{
+	struct smpro_hwmon *hwmon = dev_get_drvdata(dev);
+	unsigned int val = 0, val_mw = 0;
+	int ret;
+
+	switch (attr) {
+	case hwmon_power_input:
+		ret = regmap_read(hwmon->regmap, power[channel].reg, &val);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(hwmon->regmap, power[channel].reg_ext, &val_mw);
+		if (ret)
+			return ret;
+
+		*val_pwr = val * 1000000 + val_mw * 1000;
+		return 0;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int smpro_read(struct device *dev, enum hwmon_sensor_types type,
+		      u32 attr, int channel, long *val)
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
+static int smpro_read_string(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_label:
+			*str = temperature[channel].label;
+			return 0;
+		default:
+			break;
+		}
+		break;
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str = voltage[channel].label;
+			return 0;
+		default:
+			break;
+		}
+		break;
+
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_label:
+			*str = curr_sensor[channel].label;
+			return 0;
+		default:
+			break;
+		}
+		break;
+
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_label:
+			*str = power[channel].label;
+			return 0;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static umode_t smpro_is_visible(const void *data, enum hwmon_sensor_types type,
+				u32 attr, int channel)
+{
+	const struct smpro_hwmon *hwmon = data;
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+		case hwmon_temp_label:
+		case hwmon_temp_crit:
+			ret = regmap_read(hwmon->regmap, temperature[channel].reg, &value);
+			if (ret || value == 0xFFFF)
+				return 0;
+		break;
+		}
+	default:
+		break;
+	}
+
+	return 0444;
+}
+
+static const struct hwmon_channel_info *smpro_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_CRIT,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_LABEL,
+			   HWMON_P_INPUT | HWMON_P_LABEL,
+			   HWMON_P_INPUT | HWMON_P_LABEL,
+			   HWMON_P_INPUT | HWMON_P_LABEL,
+			   HWMON_P_INPUT | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_LABEL,
+			   HWMON_C_INPUT | HWMON_C_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops smpro_hwmon_ops = {
+	.is_visible = smpro_is_visible,
+	.read = smpro_read,
+	.read_string = smpro_read_string,
+};
+
+static const struct hwmon_chip_info smpro_chip_info = {
+	.ops = &smpro_hwmon_ops,
+	.info = smpro_info,
+};
+
+static int smpro_hwmon_probe(struct platform_device *pdev)
+{
+	struct smpro_hwmon *hwmon;
+	struct device *hwmon_dev;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!hwmon->regmap)
+		return -ENODEV;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "smpro_hwmon",
+							 hwmon, &smpro_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static struct platform_driver smpro_hwmon_driver = {
+	.probe		= smpro_hwmon_probe,
+	.driver = {
+		.name	= "smpro-hwmon",
+	},
+};
+
+module_platform_driver(smpro_hwmon_driver);
+
+MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Ampere Altra SMPro hwmon driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

