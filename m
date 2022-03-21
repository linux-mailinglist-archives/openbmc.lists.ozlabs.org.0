Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DC4E21E5
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMS9q4V9jz2yJw
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:15:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vuw9nYOm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=vuw9nYOm; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS8d3Lx4z2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:14:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKa6+BKh9VRPP0g4wCwOrjXWNV4mFZhBlPrPuwhrm03EICSG0Z7dINYYSd1czq15+mVPYpmGiPnONT+w/87ebYz6f89tAW8EqVaWp7LFWabB1CBwCHAEbtEg2qbImTbra7nR4XwLjwb27A0lgtAfpEBYvuKxPIiPhDK7xEHuYS7TYjbPTR04o4TJWJ551vbY2tANgO3GXFeACXcneB0JFcyJj9uwiw6ux/Ov+THQMQ7MyFrF/lSIy+5wLEcS0xssWwUwtoUZwM538jmPuy93VfdHDX1O11CwgV94XHOpm5ydlg4vptItKqGcQjuop+b2zxHyPyFEg4gJyzG5JKaKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HbID+FckdOZ85t6zD8zvgqjzzXrxoGBCmrC6dmG3to=;
 b=hLBsEy/nmZ2QVDxpFNrXdo2WvpcqghakDz/9BHOv39INuyXCW0IegTUqRxh1l2MpkHPTfmKsIu3OmSKpZPE7mFlGQ/0JsYmYh/tCEi/mTkPiQ/zShL6a4ErBAjo71RIvaEzcF5vjsmJaRgBDs1o7kp1pN+c0e16rlzR6U1t8qKEPKLjnBUDHSbXG+U/YvIcE7EfOpSHwiq826yQPAP1z1IGIfyauoQCt9DitwcmUfif14TEIh++pFGOPyQ5doVqbo2yXrsA6KMCkelX4orJMSWGqxLILcEx9o/a7q5MJaUnZAteQVdSlufIBrzdKbyE3yx4zLx7h/OMnJVRK1DsArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HbID+FckdOZ85t6zD8zvgqjzzXrxoGBCmrC6dmG3to=;
 b=vuw9nYOmbySs20xpnUIhRWdxLXM7KLO0t+JTM0eRSKrjmwI8IVfgY/GVg+zGOx3yqPLs7HGTKKePjXDEObAOr5ENkVr+FnvLhn4PLKUEdSa0GZNIjACu4feGC/jToe0N55A4y5cUJI7gPHf82B7oOnf3+fCECsJKiZUD5CS99DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:14:38 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:14:38 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 linux-kernel@vger.kernel.org (open list),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Mon, 21 Mar 2022 15:13:47 +0700
Message-Id: <20220321081355.6802-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321081355.6802-1-quan@os.amperecomputing.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe65f9e3-8c46-4ed6-c0a7-08da0b12d766
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB2738D11721DDAB47D71914C5F2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wd39Q96oEdvDuh3LhZOnLjNMxpZfJ5EMMK5B2ECZBNtUSzZwtTdzZ3CBxHPTPQ/vW3FQcNoZO8ibWlrIZkzN592Rc8aRMe3gHgJ9K/RJvnCV9E9EL9jdFu4nU1RHR3PY3IPrud/8IrEcXbh24ZuBMtzXGLqOZTcphJCgazJrjK3FM+rFWj5nsAKd5i3omZdvshWcIFIGR/2fRG523qyfG4uBZT6jDSKKAYfug0MpZqJr/9UqTvSBE1u5t39wnS2VA+FJnRlwqbMZ95BOWmRdxEerd2U9RZg8QCrMxJqqAFFcnuv1JREhFfpKUZVd/GUF5zB6hq0SCnvXzAS1Anw+ytzgfr1IACxTr0IkF94jPpvoo2Bo7BR38zjkW6OI4y+0zhuwIatgFJsXHUJc1P7OTx3Sc+1GiicpEKk5eZXW/hcFRJSIZRnoQvhHvoaMl8+9LLY3VEzKz+S2AwaJ1DLq8XcGPPY3E+DfBj1CKiMGupiPOAQLATrewthOu0MpqqBjYTlmpdCbWPZx1u2JpualIjMaw9KJ7KGd8fP7JEA7sT4b8v47Yx/BevjgZk9L4MS4tb/uQXQibxWvszwJJehuGp+2KeGjCIOAcfbHSIhKAAnZldIdGB/PPyD50muNFCkfY51fGNZ0GjuZj7mi6cE7hS+8x1ev+1tmjSr1OKW5NyMS3inXmrXo1mloLcW/ljoh+8YmH4ZcTxFse6M7qumX4LM7P1ff4MOxig1n3pQR78Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(30864003)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KoM2k/ZTQaENy7pTYlXuxoUyI/3Okp5p8BWmeKe8bTpt1Ji4DszoenY1d+Cf?=
 =?us-ascii?Q?shAu1yKOzLrXTanLed1R87eib5vAFuIym+/myx6HGwNmejT9wtMvlqLAWej6?=
 =?us-ascii?Q?zAHgtA9NHqRrWWykzFcy2VDPC2PYz9DRJWBzykzDiWMXgykEvnph6S/o5q12?=
 =?us-ascii?Q?ICCrYDmuaeDLkEjQVye+k7UA8Hfn3zddr3QsVMOr46a66VvXH1ysSVTMw7c1?=
 =?us-ascii?Q?UnWq3k/1BFzojd6vi6hoOcKW5oCkJSo+1p9ZjXqdBaaFc3Qv9csQhgMjWPM2?=
 =?us-ascii?Q?EVMoyGKbPbeq1q4q1g3YLOE10UdaLFjcQ7nONCXO0X0IyHePX2HWCDCcThVL?=
 =?us-ascii?Q?/D1YaZFI9rrio5/T4YT/33CeNPqlhkVV1Db3nBVczjBXRCjNVpbUwRG52EJj?=
 =?us-ascii?Q?YKmyveN+aPxLUUBHJyiuNS1Lye7E2H7qZa6dZV9FtU6diPIZ6CwkAl3u7Grd?=
 =?us-ascii?Q?9NGs4EVhidnB4+8RoSMUo9RbMJh2LjeFM+RfWuZgnwtC7F2giIT8MTtT/MdH?=
 =?us-ascii?Q?oNnVuhFHVIjuE9tztBW3KaQRDtlgPaOg8h+3nzYY6BDxOxI2hZv82FqWEuMD?=
 =?us-ascii?Q?MOi6gXqGyM6nRrMygNMn2WNH5xyJQ/rJA4J8XkwTpGtnv8v6WJ2ebka8XM7O?=
 =?us-ascii?Q?Hq7v/4hf28vTweS8jcTnuSCZKBb5xEUIAlJGZ9rj9mjfJlMT1Ts3CH9XvtWi?=
 =?us-ascii?Q?G9IG6m+Hb/T8+uJ50UfH7bQxy9DqqKB0XWv7wCOxxKxtQSk6Cmzzk99j0v8x?=
 =?us-ascii?Q?2CgvySZLrjQHjnyL7cRCyznz7Aq0Fe2a14VtB6j0rDE/qWDLNXqiqyfrSWaD?=
 =?us-ascii?Q?GVaVjANGJqHo+hg4bImyMP6wITV0kOaID6lX+C1oRkIF89ErP5fm92TAKdvy?=
 =?us-ascii?Q?EhtTPNpR857ayDLJS6k2aXPiPc7KVFBQyTduCgK0vskdyTIOwVakHMRGrKVc?=
 =?us-ascii?Q?Jpm3tyNEn4Px2l2GwrBewNqDnhBE7huB6Dc/iMpbg7UW1furIh2FAGvNzt00?=
 =?us-ascii?Q?t/2lnsorCm1QtmZGKjqgf93egk3PcceMPBRZl9ZXkIYGeUrSVTTwEQMh3PzT?=
 =?us-ascii?Q?RZZUmOBVkU/zXEUQW4oD7Dd3DStGiNHxIocKqVdv07zK+h5qKLEHGDDX3OUE?=
 =?us-ascii?Q?exPYSXAxUkJN+tyLMissTQTIEb4hrSbP8ZvYKkULmbe4Ulc2dlkVlQPY4Dzp?=
 =?us-ascii?Q?aVVkBU2wQhIa7jxSkk+jZsRKyZx4eFGdSkjGguHNqDv7AP2ao7m0RAH4GUjJ?=
 =?us-ascii?Q?+eGIJiJ7C7cCPB0UWdc72RT5DFJ7vSJq+Itpd9/4erYKP0902ZDNawwhHI0v?=
 =?us-ascii?Q?ONBG2ekAnBMnV2McXONnd2eSwnmgctzHCMLrtwkCwO2fJl5czbNhtDVymknB?=
 =?us-ascii?Q?feHmjVgIGfENXfmx9MJOZlPoFWwxEJkrLjFjm4nwRtg6TvqCEkbJXAG+PKZG?=
 =?us-ascii?Q?lxN+log/U94BtyGd0QVaV80nuB+32ufjLlOZz6H0j+3LNvuhjLlmyIondAq1?=
 =?us-ascii?Q?W8Ut1KorPLGGJpY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe65f9e3-8c46-4ed6-c0a7-08da0b12d766
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:14:38.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+Rjh6CpOVXxBJo1YhrY+jZS1ogAveilZDIJlykdD78YEOL2p4dZDX12bWDIrNtAvnx/AyKY299kOWw2PszI+GSIW33PzieUcgqzJlEva8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2738
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
index 68a8a27ab3b7..d85d81dc7c13 100644
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
index 000000000000..b2bf84971fe8
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,463 @@
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
+MODULE_LICENSE("GPL");
-- 
2.35.1

