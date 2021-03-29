Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B728434C17E
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 03:55:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7wdK533yz30Cp
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 12:55:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=s8cLZ4zA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.104;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=s8cLZ4zA; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2104.outbound.protection.outlook.com [40.107.93.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7wbJ2Vz4z3049;
 Mon, 29 Mar 2021 12:53:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHhkwT6wjD4lkA23qS9bPG1Bq7OeQnZekbRaIz8MVrU33esy00kH5CPlHZ8EO48LQZhc1orDFKKpyI4HjONhoeVO9wB3hZz7qw0OmZsGTa1iWc/AAC4DkfvFVUUANpg6S+aZr4C4RoAa9f1hrR/8jZUOaRRGcreBGT6azxQ1NYVc+tU6gQxCD5wSU42E7U9ztbZ6OPs9YdygIJJMCXhzm5RgoRYyRQ7l2nXSqav7CfcEAtlLc8TI2g2fkwE6Q/m9ZPP5nc0xthK9mWM/WXJ6oJ8zpJb8nEB3lMRNnmsrr1K0gDKxDGrXK56mquAYmUMHdeZPFWnR539/QZtgm7OTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyus1SbJBujDJCxPynyJmjU0vFdcDZNg4DZU0eEOFtM=;
 b=oXhCx1SnF8RJ/msuuVw0BihxOrJytpa0zvGPiGXH5O2NcejFeaZXgGnQvM5JauaEPlQLAr1w87TlMmsvEHmbR/xJ5E9OSRHFe0GDCncQxQ2P51zzeXcZylIkmTUCRoWRs68ETGZT2QmvID/xKWSuCRIiRMs0V4iQyyK00efIzfl8l66qsstQKpn9im+mfuHY2kKI/K/jTPyLsVAup16dQfmQVma+vy0nxRAlQDk5PAib8sfYw0IlJeN/EqAnbqYW5FaAebHe94LsRjeKYwtqZ1zj5emp3o+H7fzeGyzoNkhTzjl/6IN3o72PrPmreec1R8N7t47U08InUczfHpBbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyus1SbJBujDJCxPynyJmjU0vFdcDZNg4DZU0eEOFtM=;
 b=s8cLZ4zAgTMVBPVZFPGRYW0pcncgyLQrlOF+wLiLj4AQULd91tjxVJHvUyOcZ9B1wTFnOyHfK3dh8mr91Ki1s7lwB1BWEB9zUNP8wBLOXXtc+A+a9/TaipVKZVYLBZNu3chMTJcruUP+agGcShaMAVCZJnP4ADWd0zecwcUbMSg=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6226.prod.exchangelabs.com (2603:10b6:303:77::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 01:53:27 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:53:27 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Mon, 29 Mar 2021 08:52:37 +0700
Message-Id: <20210329015238.19474-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329015238.19474-1-quan@os.amperecomputing.com>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 01:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e2f5855-4fcd-4e17-6110-08d8f2557146
X-MS-TrafficTypeDiagnostic: MW4PR01MB6226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB62265BCC27877311E7CAA792F27E9@MW4PR01MB6226.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EbfnUdQLg1x/v4LVITokVTmVmG/tFR9lVB9C8XJo/wWxmpxNRhTWADNLWh6YnpWLu7q6SGeYOf/etmhuoRuLJJ4P9FiwFI3/rUVigUT3XYzJRzIkquUZe0XIHoqUTprJosbL+pNz6NAFcklnnCEesFHIpjEvEU8bxbxY7qKDvLSTBf6aMuXPpHj+57RaSeRhsluee2BT3z9kVrdNZN5bdCJI3lgozWH791FT2xKq2RrgLumA3W5txBm7VEz/0yo3dGPz1qkNYl8Bi0nTMTWlwWFxbZ9wTf9LaPWJHE+XrrUuFmmSTvMmeQv0N3tXEfkrQwZGN/1x8J5I4/b0/dmj03Unfim1dlcVjZOysu+lB1VougewA+f9lJ/LqaYc/902ObAOMDp1IfNpO+9/THe8tUeZCeXHCu1uw7QtJWEZELw/xpXPMpQxkeAGBw7GRtHPsxz9D05VmrbTYnDHZUQMoQLyQh+zKbm+fD9DWZb07j0O9F9a1XFe9x4K6IrMt/VwujBtm15rr2afbmqtYj5i5l1TPDONMz2Us7c1U7J2xctQCySckwGw1YRjpA3rxlMzCyXHwycQ5tLUennEIZ6cRkFR5gsQGop3MBNA1pXDbQjA0KLzBmCL798BngDF5HVniHpEugdy2Iz7veXICTKMCdO6rQ0YkjiFZyDahW6uvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(54906003)(6486002)(921005)(7416002)(52116002)(86362001)(6666004)(4326008)(66946007)(316002)(2906002)(8936002)(2616005)(478600001)(26005)(6506007)(30864003)(66476007)(1076003)(16526019)(186003)(66556008)(107886003)(83380400001)(110136005)(8676002)(6512007)(38100700001)(5660300002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KHWyyJdr7vQLwpMAkoNcKRlwbNRpHMLvA94XpKfHkaIaLlb2ZE1UYxX6+yLt?=
 =?us-ascii?Q?hZsOgrZcbDChvy/WbNK/jsMe5TG/NKYaa8CN3mdAnOj/xIOCL671BPSuVfIx?=
 =?us-ascii?Q?4wSw5YAGunHWcBSiH9TwiJwRySX5xur8waGWy9VT9Mjdzm8mjn3yHDzFfvBu?=
 =?us-ascii?Q?+P5dKxkVMgCJ+nqmeuCK/QQT4BocbZpN/h/nTaMMBm1c45jL9FHP1ydWAi7+?=
 =?us-ascii?Q?gnTqZ5JpIh1M8AnQBG6FccM7pKKJepR1/I0v74ePxDuq7jK2jQ+5CFSHaG+w?=
 =?us-ascii?Q?cUZUkU8ADSmGDqr+guEutomSYjgBw3PSeUcTZCaJeFaI67lhbDaw9Arjrdx+?=
 =?us-ascii?Q?3O44aLoY1LkUlRmr4zS6I//JPBa6H/kFMMTouBYElJlLvmUeLKS+t3V5awmA?=
 =?us-ascii?Q?nnGAe6uyZZ6FwSkeLuZl0oJDvOF+FH9BdEl/qaxVRCzwSbJZZel0Cq6N3jqW?=
 =?us-ascii?Q?c7Puj6X1G1D4OFEK0cECJA3j5M7elie+L+XabaiPzzkaflni676ztTpwgC1a?=
 =?us-ascii?Q?jSBY+RafT8ISf8dBw5KkdzNGp44dzaOIyZ0AB3Op2R0gV3CBBv9v/2yBV86B?=
 =?us-ascii?Q?NsVSjo+yOnUgmHq7cSbyzipw8PTHZfziGZDBDArMoEDIaPgFZLYxlkXUWcqX?=
 =?us-ascii?Q?EZF14KseHLWRHyape8A+jvXX9W/46nGc0LrAyyD0AHDsVZvl31/V4t9hnDuL?=
 =?us-ascii?Q?u2iL/z3+s/cAQTyIA0LHmJO0ZrRZci8lHejiUIiNQHE4Zt0kzrbNfpuYeCde?=
 =?us-ascii?Q?11LNV0icXRU9tNqKiQujKvL+jogJbboIPN+c08mPDyvtDXM+BfHWA+UCX+ac?=
 =?us-ascii?Q?yrAvJxOk52JoG8+bMLR9MnrvDw2DgfJ/ReQbhWv5ubjBUHr2SQk4Q6SqIw9r?=
 =?us-ascii?Q?OrREP5HLhNlixA+sxJrxlmqzDRUaPqN/cm2KWXldO0m5pO7AhGPFiEctOwJD?=
 =?us-ascii?Q?MLVXT1f9yCPm9x5eSyH4WItTYKn3UE9dYk/SxcrzNYnRdhC9hxFhzLr0Wio+?=
 =?us-ascii?Q?ok06wsKJ52twVx9QRtbECTawGisKYDdMeyQAsNpo21qQKfuVm3EG0bWat3+w?=
 =?us-ascii?Q?LFGMEwvslV4q2bmXelXIkOap58Rj1NmLmBp20yaMLYTt9ph44/47Dr9NT91c?=
 =?us-ascii?Q?mA8bbUyeNsotDNTc5iIgdkvO5ZqqpLzAuVZPUO5XmhojwEgcZ+UufFODPNm/?=
 =?us-ascii?Q?XRn0HMtcvPIx2fPk+j4KFF9iZQc9NVGyhS5+gwAftk8liQb+tWSSlyLdbT8k?=
 =?us-ascii?Q?qbiN8vOo3NujgSHSUonb8tWNtr+8Ny3S6hWRUsYIbAz0wqHREhWV8lUpkk1o?=
 =?us-ascii?Q?zYAPa0wwZd0/8fqzxYUK9odt?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2f5855-4fcd-4e17-6110-08d8f2557146
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:53:27.0588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ABSot6hW9iEJ5EX10oHHKGHcLJxyo7SauNeynVuX76hymGi6GFnwMiJ6o7Db5HhnWzw4f1NMxE/dccQEG8qtoxjD+o+z6DN5jM0hJLgcGns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6226
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
 drivers/hwmon/smpro-hwmon.c | 494 ++++++++++++++++++++++++++++++++++++
 3 files changed, 503 insertions(+)
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
index 000000000000..4277736ebc6e
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,494 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMPro Hardware Monitoring Driver
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
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
+		.reg = SOC_TEMP_REG,
+		.label = "temp1 SoC"
+	},
+	{
+		.reg = SOC_VRD_TEMP_REG,
+		.label = "temp2 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD_TEMP_REG,
+		.label = "temp3 DIMM VRD"
+	},
+	{
+		.reg = CORE_VRD_TEMP_REG,
+		.label = "temp4 CORE VRD"
+	},
+	{
+		.reg = CH0_DIMM_TEMP_REG,
+		.label = "temp5 CH0 DIMM"
+	},
+	{
+		.reg = CH1_DIMM_TEMP_REG,
+		.label = "temp6 CH1 DIMM"
+	},
+	{
+		.reg = CH2_DIMM_TEMP_REG,
+		.label = "temp7 CH2 DIMM"
+	},
+	{
+		.reg = CH3_DIMM_TEMP_REG,
+		.label = "temp8 CH3 DIMM"
+	},
+	{
+		.reg = CH4_DIMM_TEMP_REG,
+		.label = "temp9 CH4 DIMM"
+	},
+	{
+		.reg = CH5_DIMM_TEMP_REG,
+		.label = "temp10 CH5 DIMM"
+	},
+	{
+		.reg = CH6_DIMM_TEMP_REG,
+		.label = "temp11 CH6 DIMM"
+	},
+	{
+		.reg = CH7_DIMM_TEMP_REG,
+		.label = "temp12 CH7 DIMM"
+	},
+	{
+		.reg = RCA_VRD_TEMP_REG,
+		.label = "temp13 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor voltage[] = {
+	{
+		.reg = CORE_VRD_VOLT_REG,
+		.label = "vout0 CORE VRD"
+	},
+	{
+		.reg = SOC_VRD_VOLT_REG,
+		.label = "vout1 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD1_VOLT_REG,
+		.label = "vout2 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_VOLT_REG,
+		.label = "vout3 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_VOLT_REG,
+		.label = "vout4 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor curr_sensor[] = {
+	{
+		.reg = CORE_VRD_CURR_REG,
+		.label = "iout1 CORE VRD"
+	},
+	{
+		.reg = SOC_VRD_CURR_REG,
+		.label = "iout2 SoC VRD"
+	},
+	{
+		.reg = DIMM_VRD1_CURR_REG,
+		.label = "iout3 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_CURR_REG,
+		.label = "iout4 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_CURR_REG,
+		.label = "iout5 RCA VRD"
+	},
+};
+
+static const struct smpro_sensor power[] = {
+	{
+		.reg = CORE_VRD_PWR_REG,
+		.reg_ext = CORE_VRD_PWR_MW_REG,
+		.label = "power1 CORE VRD"
+	},
+	{
+		.reg = SOC_PWR_REG,
+		.reg_ext = SOC_PWR_MW_REG,
+		.label = "power2 SoC"
+	},
+	{
+		.reg = DIMM_VRD1_PWR_REG,
+		.reg_ext = DIMM_VRD1_PWR_MW_REG,
+		.label = "power3 DIMM VRD1"
+	},
+	{
+		.reg = DIMM_VRD2_PWR_REG,
+		.reg_ext = DIMM_VRD2_PWR_MW_REG,
+		.label = "power4 DIMM VRD2"
+	},
+	{
+		.reg = RCA_VRD_PWR_REG,
+		.reg_ext = RCA_VRD_PWR_MW_REG,
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
+		ret = regmap_read(hwmon->regmap,
+				  temperature[channel].reg, &value);
+		if (ret)
+			return ret;
+		*val = (value & 0x1ff) * 1000;
+		break;
+	case hwmon_temp_crit:
+		if (temperature[channel].reg == SOC_VRD_TEMP_REG) {
+			ret = regmap_read(hwmon->regmap, SOC_VR_HOT_THRESHOLD_REG, &value);
+			if (ret)
+				return ret;
+			*val = (value & 0x1ff) * 1000;
+		} else {
+			/* Report same MEM HOT threshold across DIMM channels */
+			ret = regmap_read(hwmon->regmap, MEM_HOT_THRESHOLD_REG, &value);
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
+		/* Scale reported by the hardware is 1mV */
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
+static int smpro_write(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long val)
+{
+	return -EOPNOTSUPP;
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
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_label:
+			*str = voltage[channel].label;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_curr:
+		switch (attr) {
+		case hwmon_curr_label:
+			*str = curr_sensor[channel].label;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+
+	case hwmon_power:
+		switch (attr) {
+		case hwmon_power_label:
+			*str = power[channel].label;
+			return 0;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
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
+	.write = smpro_write,
+	.read_string = smpro_read_string,
+};
+
+static const struct hwmon_chip_info smpro_chip_info = {
+	.ops = &smpro_hwmon_ops,
+	.info = smpro_info,
+};
+
+static bool is_valid_id(struct regmap *regmap)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
+
+	return  (ret || (val != AMPERE_MANUFACTURER_ID)) ? false : true;
+}
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
+	/* Check for valid ID */
+	if (!is_valid_id(hwmon->regmap))
+		return -EPROBE_DEFER;
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

