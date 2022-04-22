Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459C50AE0B
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzNh013Tz3bbr
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:48:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kL8tTnd6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::72f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=kL8tTnd6; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNF22T3z2xsW
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3Onj5YyPlyP7l6lzn0LaS5vXDIwIcc7Y4V9dFNuOSbVzQIPkS3x9IFn845v/mEDc85Z5nAWx6VBPVyr2KIgmbzw6r+SrsWQRHyqUO65V1xpCiv0ZGqDdTFp5ZwJsD/LYbEIR3OauIR7gvlXn5+FW+ptdFVUpbSgDyY9d7i1o51f8KkUFyI7pIP2Iyv0MFc6c0JrYQcWx/WDsj3enVdAgWIuLtELj1VSOTBNpbzdUQx11wBBpyA19WS5LKfmuGzFy+ZH8J8LnQZ34VZCnjz8CQALC4XLQZgYRPWFxS8x3WI4/plgvPDQXUxPSGH4IkUhV913mjA+xqTR6FjCRBfBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsXqVWNy+RRUK0ZdAuf12Eh6NTBhagtKgkMgXfNiGzk=;
 b=Qp2ZP4b9RMCsae6Tx0YbhoXIQB0XdM6+mBYkZq/bwWG07WQeqZ7z2nCU+s011qtLuDkf06s4X3z3ndgSEAmTuLwAg89IzgXiweZb5gFgxu2rdt+8e1KVzdi/MXozpGIg+nc7FbJwySLY8E2xgEz9yqtFdrd3l+u24E9bOE59g+tXON1mSBgmKcP6+0dr1xX5fbYE3z1FF4gyxRGzWmQKepFtgSMQM7J0kOITD/dhPrrpENVd7sLTR/K+kbAoTk9yYImfiNUp1ubC1fZVrtQlkI3fn0FBKY5Vh9YA9ETZ7eTyKD+8EJZahbyXSkY8W/zVQBL5SLK8NKQ30GlScEUgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsXqVWNy+RRUK0ZdAuf12Eh6NTBhagtKgkMgXfNiGzk=;
 b=kL8tTnd6FWErGZlvDfOV3fcNXYDrhLiXx/5rE2vXdRGVWz3oEemG9jTbsmt+/MbuNUeJWPWFWDhNDWg1v6+tqOuTkyltvT1d/lUPq7k5zhCsBO6qUZPkd36Jg95vgoIL/9/hXXcQRexukKUJ+pvl7hmTXaQaymrq8BaHHEiYD90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:19 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:18 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v8 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Fri, 22 Apr 2022 09:46:45 +0700
Message-Id: <20220422024653.2199489-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422024653.2199489-1-quan@os.amperecomputing.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c97fc791-6a7b-4f1f-bf1d-08da240a6a9f
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB4653D6E142032C0A729C2B79F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJRZC3wyiR2iNC1lUxkEIVbR90V7pnFUiYdFyGdq9+0lfMYqUb7Z7AV/5Cvc7q02YYPYjIbdd9WHOhY7bPEoVrNtUJl6ya0AJ0CMM4T68nC5cwcNk2f42CDW6VyMEGMh5QeBHw2gY/Oj/eoTJB9vzwjvlHVZLNu2Zn4w1IWBSxNU49XIRdaypYLW4rgpilfoTBFPLbfc/idXdJND3bZc0nR+5NeIgKxZAho82XuZoOlEq2SsHagPrQEffJmbg43xjt6vesRpOfDcMIYjGGuL+UHlUBhluYa5XL31Xd4rcUEUQ6jqiKY8Jza1oHI0zVRg0AdWSnUwkqt64422ChJZThcWptqg8qOqqEiBb54OuXId8P7UkxyTZV5CTHZ7yedRMG2rzxOc3cMMmKhX+hwZn28job4KjgMSBZiLv45PjvNUNWopqNkz1pFLRVJG5/heacp3z1P4xANQbt6rN5M6xs89jSv6+x8pmP02PYDqG79LuNeWc1V+Tx8iTx82FzcqyTPdixCS7zf+MRF+ZcGjI3uYxbFedq8WDBeU2pOpYNBn1VjZONpZRLhxpGOhcTqAU3H1nA2sVd/NwvKyXX5guRL2i2g2ZrImyKr6u+RN9yyuLOLoXByrmb8imQdRjQ+B1fvVoD7f0xGp8bfYxu0vYtrnDOHo0y8ec4IDjjLbsOy6ptOiUZ/hLEilR5IgH9oSzbsmQO8n3R1nfKD4BBFBvecMrvwMI6ok/5s3DzXQb+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(30864003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DU4ZefUANDuU3K43GJMNEu7udQJl9qLidq/CpzWlcQo2564JtO+KL4Yr3lzK?=
 =?us-ascii?Q?YJ+VDMhF7qVEen3tjCJ5zgAZ7105TkmM+kByiaM2LZC319RwRGKlOApnOhaf?=
 =?us-ascii?Q?5VLuwe9b+OhI3qX6X4YxZEwoyRwGh4unKLLM0CsY5Oa1kDkgzdfi9afd6R51?=
 =?us-ascii?Q?MoB9rtEclkg5vLwBUHPq7x0iIZ7thDB2sPe6sN/74OOgrM+XaLv9RGZPn8jj?=
 =?us-ascii?Q?zY/ov9WKoG52+yTu7HZfRSZfWnQzHxPt2ilfFx2gDerHTBMeXt9dSgDg7nID?=
 =?us-ascii?Q?hal1bLvznrkWVnpvS71aaD08YtxRmTYWmgnBoPhmrIStjbRKHUQ443QDu8pi?=
 =?us-ascii?Q?r0Mp1WTPKXBwCotyGHyQGZMx2HmrI0lLSqqqUMANxrT0h1VCG0xHRNJNaj1e?=
 =?us-ascii?Q?oZXl91IM87jHiWFEChiXUd/NxwCUy+nZFk82kwkR5NPZC5StY3saP3NVXj4T?=
 =?us-ascii?Q?UIDyE2Oi0VZyGDYFcXfnC93cvWPCoXU5w3jb9pUe8+4OXCp2TqtcrsOw6q+F?=
 =?us-ascii?Q?GEvGty/ueq99QOOmE6p0KQk0AqRc8xNOdPloKkIcSlPYFKWXE1eDbwtT7Yx4?=
 =?us-ascii?Q?aGysJQisSrBsg4pu63/m4og1RCUDSqjNBKOomJFevjGX6r4zc+OFskG8IQBJ?=
 =?us-ascii?Q?VAF3APachkGMMn21bMaSn2WCNpH5e8g0H3SqmcyEaAHz1DJGn69IN1wr3CVz?=
 =?us-ascii?Q?ZTw3zZjt9gFLDOiUV9kYWcv1iAEa4N070irPS9SAlmNp+wAgWM6dMRfr5AHP?=
 =?us-ascii?Q?WGU8+grI5fDdhnPdrEOEB70OEdzkDRH9cUqRjpWYn711pvCncVjOzGKXewFN?=
 =?us-ascii?Q?Hubefiz+7VcUQazjQ683A+W56dJLWltfrW9sqARpQx9T2rSbTp4EuZHhmQ2x?=
 =?us-ascii?Q?7mAg5Gl39S1CwZVH7Hft7k8cGWVDTmVduVU2REQpmC80Qo5XbG9uscTgGH08?=
 =?us-ascii?Q?K2OtT32T9akLqJiSVXPtsqXNX4z7QGfbkeaqPEsUzkvcO1UMg3horvfktJSP?=
 =?us-ascii?Q?eu2d/S3t+NrpyU5NgpU6cxR3g/w+bGWtyZ0NIS6dNgwCY60m1lc7KkvUDhU1?=
 =?us-ascii?Q?0jwjQkeWosQN/4hwqOEVdYtby/PkfqJ4XLwekKPg60/IHMLCC7jWlDciExd2?=
 =?us-ascii?Q?8xTu0/uvo8/DVNWqDRi6M8lZRXBjVMh2VfWzOuCH5tdIq0xOLgeG3RqnvMj+?=
 =?us-ascii?Q?Uw7ZGzpCbL6v4GUEcRu2i+wCUzY6d1y7xx3S63z3clPUvw1EBqpX0lVDIf7v?=
 =?us-ascii?Q?hZi1fhXvwPsozyJGcbQwiNMoes0gRi7HxmLGmmaAnl4m652gr62HVSK+oLac?=
 =?us-ascii?Q?MVemumOqYfKSvOLRdjr77U3+pjwVfgg1Xru3mx1mx17HrddEyYXr5pq+6Gbg?=
 =?us-ascii?Q?sulKqEWpqHdVA8dJYGVSNJS8fXp7/PeQYQxvXoSR9qWX762uQyHBcDbPQWCj?=
 =?us-ascii?Q?/kgG4OSh3rDYVl+IO3+NO6JfkjxYdhN7BsFL2n/AG7NyLrZu0ThZp55MExc2?=
 =?us-ascii?Q?RUDUStxyESYAKNly7fAG8vQ+HjrnsXealXXcAQVZVmttvZB94vlouFdT/fNs?=
 =?us-ascii?Q?xblMrEC8OgmTo2sG2+I4lsNToITSSE0c04QT3YOnYt6rG7NddAP0bqy6MX2Z?=
 =?us-ascii?Q?REqIjdap+MDmfCWY6fm5zVf3esWEWrn4Md71VbekZZluutxxLnf5Jv/kWhHC?=
 =?us-ascii?Q?q+wT02PuaI9W9n15ohQPr52K6gvzfRCUGDCDR4Y/3HoRem4vDJhai4ssCRBg?=
 =?us-ascii?Q?NL8LAh4VRU9RnW07AdZUJdZ1DWrhM4IPt63ISmSVycE26YXZoRaE?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97fc791-6a7b-4f1f-bf1d-08da240a6a9f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:18.6285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UIepxwPMXHmJ9dTyqWjGyUUdWFvLFp3R4zf+r5iTHep3EgPyLeDKAQ5W/YKSz3sHGpZAuE0dyTdwF5GeRFt2k9m7RTIxJM2WepM5NOTyEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4653
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v8:
  + Masks reserved bit when read 10-bit power value    [Quan]
  + Insert 'break;' to avoid fall-through [kernel test robot]
    Dear Guenter, I still keep your Reviewed-by here with these
  changes, expecting you are still OK with them. Please let me
  know if otherwise. Thanks.

Changes in v7:
  + Update GPL version [Quan]

Changes in v6:
  + None

Changes in v5:
  + Drop ManufacturerID checking when probe as it was checked during
  smpro-mfd probing [Quan]
  + Drop the use of register offset [Quan]
  + Removed the use of compatible string as it is instantiated by
  smpro-mfd driver [Quan]

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
 drivers/hwmon/smpro-hwmon.c | 465 ++++++++++++++++++++++++++++++++++++
 3 files changed, 474 insertions(+)
 create mode 100644 drivers/hwmon/smpro-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 1f1bb4d858cb..64a46e545a23 100644
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
index 8a03289e2aa4..00e0b187675b 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -182,6 +182,7 @@ obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
new file mode 100644
index 000000000000..ccf660f74290
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMPro Hardware Monitoring Driver
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
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
+		/* 10-bit value */
+		*val_pwr = (val & 0x3ff) * 1000000 + (val_mw & 0x3ff) * 1000;
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
+		default:
+			break;
+		}
+		break;
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
+MODULE_LICENSE("GPL");
-- 
2.35.1

