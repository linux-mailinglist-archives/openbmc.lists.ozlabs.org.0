Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7626367D6E
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 11:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQs945Q3Zz30C3
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 19:11:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=drRg57wu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::701;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=drRg57wu; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQs7557ppz2ypn;
 Thu, 22 Apr 2021 19:09:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJXVJhZ5tBgW32eno1Sa98R6aBUjDlP7/7oLuNWCAYPURdWLTsox7UE5Bdtl1jFEG8wYLaFUDvsJ+Ypkmxzz8CwzBNBqJVCK1tiA8xZqzfNOZoYU1qEl/cGc97NAjGBZ5iV8JK2ZFw38OW+eDyDj9HrvoEuMllP8kL5dXF5FcDcxcvw8EGC6dbFuvBkaI78jBsGeqrQ9Z9lrvEUvEZkSqCWeXSw44nD97beim2+9Oz9RDitP9BKqTVdApcSQ/Z81mFg+BGGUuq8xGYob/T5yUSk2HyQhCnjtSOAw8wEXS/ahavZB34SiYcCfvxE5Fpp59BynOVT2saMXzSdZ9aIblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHtZZScaAQ4w+1Op5oHwedgahJ+rkBXX1HxSVVtbzcc=;
 b=NW0hCDrIgeCSe+KZeJRjSUHpAW6Nx+OaW0Ai5izSZCrHldAnyD+rHgafiqigNFwg1w69i/LdihGCtn3IaBswsEJDEN6R+hM0aDlPCf0JfcxL0s7T1JnrUzqb5ybFPJsQ4Jbgb5Td9TQVvm8tCMd/u6tUAJC4bM/4Ewv/1RAzCScqSZL4XK5+j10GLUTZm8z3qfkI8jutcrvBJG4LAmzq4Dz+rQlay31EyCjEez/5HbUXx9wNYl6z0ZZGx5yec7SB6brYmPB8VGfnE92cpsyn/QlLmUaGz87c+j02Mffz6pRDcegr1f31XskVUC2hmdl1oqKkvquQE5sR2myTU+UIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHtZZScaAQ4w+1Op5oHwedgahJ+rkBXX1HxSVVtbzcc=;
 b=drRg57wu+u14+XtcrY88YZSTKJA1CsPRdrVqZeoZDzTTVhl9+zL2ipuwbKxCJ5nIdXFDUYpUdFmLt+a2o5imQCAQpfFAIuMY8gGHlnPFZDs/nmRPvL/b5pHk+/eyQ/t4XVmWMc4sre9+AZVsIvbzqhy6EzmuBiyKL/B6WDTZKaU=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6356.prod.exchangelabs.com (2603:10b6:303:66::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 22 Apr 2021 09:09:18 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:09:18 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Thu, 22 Apr 2021 16:08:42 +0700
Message-Id: <20210422090843.4614-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210422090843.4614-1-quan@os.amperecomputing.com>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:09:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f086dd-5bcd-421e-1b50-08d9056e4ef7
X-MS-TrafficTypeDiagnostic: MW4PR01MB6356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6356775D97E62727AB4E2DCDF2469@MW4PR01MB6356.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3kmuZtV21gIGOjOEr41DDQm3+mCAX+f/HQaaoT93WmWUKn1y+G9lIH1pcrWo4t8upPj+IZxfsD+1b9F14hC9SgeOUcNjyVZVWHpHshb9/nNe+u2sx/XHvuJs4vjy2pDv0UGKS5Cm8O0GE8sjxUe2d7s7FcUKmzVRk9I+fPO/kHAtFRHliJGc60vRpR9RC2mB20mNeIVR69nyr7MVGqi2N1nfDdEj56xFJ+ikC00+ANMZwhfGo75AZJQ3gfI7GetyP3bFDLlzQW/n6/jmwrEj7pyqQn5Hf5OP7T6QmIz4JJxD06OxWrgyB8IfS3T20qkSmARNuHm534j8TgrN9P/EJbj5CMc+crYVZNjcidMmecIUNo5um3ZqA4zf97uRtBlDPIWkPDiaEkLI1IbM3pY6JDtOI72LzSKQG7nBCD+jHVmY627DRgSwVukgk8hXfURZ5uxTRYLqW4eiXG64EFNToi1TlcJxe6vfc/XmiU/qfM6UEHBBubzAirajyEbt89h8tVAHUFzGnA6gaDEdasQAyr6WyLJT5GmTAJrByMll2cvpfL3J0o+1LIPTI8glI3mSBPV78gyKfB83Dl4HsBn3XKXBqSSNkhUxfxSu7/ydenIQGG+eSZy4+p4G+4kuYy4eYoh00yeZX5yku9YTIZe43oxp1vU1r9dKAvMxuQUUM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(110136005)(38100700002)(26005)(107886003)(5660300002)(86362001)(956004)(2906002)(6512007)(1076003)(6666004)(316002)(8676002)(186003)(83380400001)(66476007)(4326008)(16526019)(66556008)(52116002)(38350700002)(921005)(7416002)(2616005)(30864003)(8936002)(478600001)(6486002)(66946007)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mlt1PfaR/+ar/fPeDUDY/wBH5SHb1OgN6LAVkZ2l1G8NvFtQyNWyXLmDN+K7?=
 =?us-ascii?Q?sugLnZEwzHuuHqjOU+K+weDw+KELxt/PaxWMBYPsf2NrBNGHwM++yAe3n2ne?=
 =?us-ascii?Q?/joG0GhPqimrq8BrB8n0I5ID8kvjvlm1PHL/KeEBztafvv2u3Pk1YWI8UW/x?=
 =?us-ascii?Q?63dtzSKPnzrQZ/LJ+GY5fWuVAXBXVB5ZLrWH6cuUCmNwreaBHE4GbNTd+8oI?=
 =?us-ascii?Q?lpKkq/QlXZzCYbanR8wPFYF/29d8DOclBXA/DeC1uxl5PSGCwl6DEpCR7eXL?=
 =?us-ascii?Q?MGf+zb2ua9o9rxSfV5BdKem0KqLnZ4wYZYyeZu6qhtPZ8EHAVIdi/SuKDI6m?=
 =?us-ascii?Q?E6W+FrxvwqxYfZ/uRz2dkgrfqeGh+Vz2Bbz39v9DfD56gZyNJqziP+2GKjvt?=
 =?us-ascii?Q?zDJ2ZLrmlyfbHExljuXQQglsAZxp2aVUsa0KVYknucRf/bQDTeknm8NnSfKm?=
 =?us-ascii?Q?ATA2t5FPi4RjI1Xe8lt6nwuH6zN8t28wDnN6B+bWztAblfgkc1TkxJe/P0TE?=
 =?us-ascii?Q?b6QlpR9Ky6kuTM9h/rUClD+vZV34eZYvYrJHTPkP9Xk91qfd1ZKbIefe3pAl?=
 =?us-ascii?Q?o/NNt2QMKMCaxhYIS2HorOd/hZ5DPs+IkczDWBN7WD6Um9Bi6zRc9f7xd+cd?=
 =?us-ascii?Q?SIdxGiEDuplYOGcId/SrEL8xNjvsXdhXcBxxIaTe/z3g8n7vqzsA7bGOLtdo?=
 =?us-ascii?Q?KSIzQtMWNCfAgYLRp1twJTG2dV+HXsPkyHeaBIQPtvt7kh5+KtmLCNBpqpuN?=
 =?us-ascii?Q?ws/12CSd0VzOLdusEgMkOiuRz6LxsAqpBuxuobqMQKYBO4kmjE1b1cVY77pe?=
 =?us-ascii?Q?BdMgLdnEOnH4AQQuIo3C6Jil21BaHxaDAAg6/OF6OdROu/UfzJ1UbcJpQSA5?=
 =?us-ascii?Q?ui/tRbBkGPsW0gmm8OtrvAMqvYCRDcCY9fKegGDlwb64OO/ec6rbnWxtbUrt?=
 =?us-ascii?Q?crxG4g9GdTb3uGzvnnYdsxFVYW197V9njKr3Sf//ery7FYgZJfjQPNBMb8gS?=
 =?us-ascii?Q?xWRfx9ukpJORH59ltvtbx65xHQW8LiuXMMPsIvFwJVfbVt4VnPchrcQWI+FS?=
 =?us-ascii?Q?IqNoS495e+DhN55EJugWdOQuOJMci4k2FqBM0EiWMqw8B60M7o4xSIbVylDg?=
 =?us-ascii?Q?WCfouqXPI6kvFmUAc6EEIS821r6csCUOxQsJAuhWfNM2Pux5O1AnolpHwuqd?=
 =?us-ascii?Q?kscPK+O1OSArfXRRgPRrx8MMfqcoS71zJHC5YKIMDzz+eueqbHuDRCrZMX5f?=
 =?us-ascii?Q?hc+jmkCi+k8fV9bBd0BTSibSfMnATZ3jiiewco/H55Id/0SoBbTy2atGql8o?=
 =?us-ascii?Q?4FFxj2PGhpb/TwgJQbBLmkfe?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f086dd-5bcd-421e-1b50-08d9056e4ef7
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:09:18.2652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWDJRFtQXs73EdZ78nPAuK25OSxj/rfC/a6E9kGSoErnn149zoZI5hb9LNFHa1za+3/u6AGNxhNEvzVfnfGs6KkBKYpf0JKCpyMQavHtlhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6356
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
 drivers/hwmon/smpro-hwmon.c | 491 ++++++++++++++++++++++++++++++++++++
 3 files changed, 500 insertions(+)
 create mode 100644 drivers/hwmon/smpro-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 0ddc974b102e..ba4b5a911baf 100644
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
index 59e78bc212cf..b25391f9c651 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -174,6 +174,7 @@ obj-$(CONFIG_SENSORS_SHT3x)	+= sht3x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
new file mode 100644
index 000000000000..1be3d98e73c7
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,491 @@
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
+/* Identification Registers */
+#define MANUFACTURER_ID_REG	0x02
+#define AMPERE_MANUFACTURER_ID	0xCD3A
+
+/* Logical Power Sensor Registers */
+#define SOC_TEMP		0x00
+#define SOC_VRD_TEMP		0x01
+#define DIMM_VRD_TEMP		0x02
+#define CORE_VRD_TEMP		0x03
+#define CH0_DIMM_TEMP		0x04
+#define CH1_DIMM_TEMP		0x05
+#define CH2_DIMM_TEMP		0x06
+#define CH3_DIMM_TEMP		0x07
+#define CH4_DIMM_TEMP		0x08
+#define CH5_DIMM_TEMP		0x09
+#define CH6_DIMM_TEMP		0x0A
+#define CH7_DIMM_TEMP		0x0B
+#define RCA_VRD_TEMP		0x0C
+
+#define CORE_VRD_PWR		0x10
+#define SOC_PWR			0x11
+#define DIMM_VRD1_PWR		0x12
+#define DIMM_VRD2_PWR		0x13
+#define CORE_VRD_PWR_MW		0x16
+#define SOC_PWR_MW		0x17
+#define DIMM_VRD1_PWR_MW	0x18
+#define DIMM_VRD2_PWR_MW	0x19
+#define RCA_VRD_PWR		0x1A
+#define RCA_VRD_PWR_MW		0x1B
+
+#define MEM_HOT_THRESHOLD	0x22
+#define SOC_VR_HOT_THRESHOLD	0x23
+#define CORE_VRD_VOLT		0x24
+#define SOC_VRD_VOLT		0x25
+#define DIMM_VRD1_VOLT		0x26
+#define DIMM_VRD2_VOLT		0x27
+#define RCA_VRD_VOLT		0x28
+
+#define CORE_VRD_CURR		0x29
+#define SOC_VRD_CURR		0x2A
+#define DIMM_VRD1_CURR		0x2B
+#define DIMM_VRD2_CURR		0x2C
+#define RCA_VRD_CURR		0x2D
+
+struct smpro_hwmon {
+	struct regmap *regmap;
+	u32 offset;
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
+		ret = regmap_read(hwmon->regmap, hwmon->offset + temperature[channel].reg, &value);
+		if (ret)
+			return ret;
+		break;
+	case hwmon_temp_crit:
+		ret = regmap_read(hwmon->regmap,
+				  hwmon->offset + temperature[channel].reg_ext, &value);
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
+		ret = regmap_read(hwmon->regmap, hwmon->offset + voltage[channel].reg, &value);
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
+		ret = regmap_read(hwmon->regmap, hwmon->offset + curr_sensor[channel].reg, &value);
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
+		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg, &val);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(hwmon->regmap, hwmon->offset + power[channel].reg_ext, &val_mw);
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
+			ret = regmap_read(hwmon->regmap,
+					  hwmon->offset + temperature[channel].reg, &value);
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
+	unsigned int val;
+	int ret;
+
+	hwmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return -ENOMEM;
+
+	hwmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!hwmon->regmap)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &hwmon->offset);
+	if (ret)
+		return -EINVAL;
+
+	/* Check for valid ID */
+	ret = regmap_read(hwmon->regmap, MANUFACTURER_ID_REG, &val);
+	if (ret)
+		return ret;
+
+	if (val != AMPERE_MANUFACTURER_ID)
+		return -ENODEV;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "smpro_hwmon",
+							 hwmon, &smpro_chip_info, NULL);
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
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

