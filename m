Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 532733592E8
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjvg2F5sz30GR
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:16:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kPJ22Z9r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=kPJ22Z9r; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjsQ2mgDz2yYg;
 Fri,  9 Apr 2021 13:14:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1m+mp8f3oO/+5CjrZrrZTWfi0uutLQML1zEW5b/thanoKM30UGIBaAB5QMby+iosMt2oP07CDbBnw5vBQgim39pbfFk7rDPgebggLNRcd4+GmtAYryJjFvqgueXlc3fzYMDfZx6tnSs0+TkZMIL5uf/58xBvgSx4QFngBCUta0T8RMS05m/ZbnhP4I1H+CHePYH0hB8x1C4GXtSBGXhtrhQMgZy74FOVp4/dItSrTha6hZ9os9ZuvmaFPbeVxE9rDyf69bh9+flxRiLRXRhCJI9VMatMW0BtnmVXlfqysnYMYzUEAvovYw7VI4PyRxppx9K0o99mK9vDFgnGqSwxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJjWqff7UmjKtBAuThyOP0BAJvXIU6v8o7tkm8uqwlE=;
 b=MLp8OFYTSnxmVIUlT6J7POCCd0nE0eDdCEXyXM+w0FcDzVEXvQ0o7a/FRoW3m3bJqYPMBDCPEDOzSbTgS9CqxaSXgT9/GaMIYcz5QPfrmPpGgW2mV5v+610PYk2TY2Jt1pKtrYAezWArOdiA3uqx1URDUDFvjG3sDlL+yYUFqN7aNZIffAAVfEO7c6VXMHAQMcPik+7atBF7NSqA0P8MmNSMEY4RmmUqz8MBuYwajRpARlf0Q++XvGQJ2+GxxpnEKyfoYdKiMvrLm4bQVynkKxL+awsRqEp5yX/OUwcVm/8CtJbmhckHuq2JA8pRA2nV4rGE7DIn7t4HrlnjQjXOSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJjWqff7UmjKtBAuThyOP0BAJvXIU6v8o7tkm8uqwlE=;
 b=kPJ22Z9r7yMdthWUX5IX4GqNDJGbFyr8sQCBuEdrtRRVIgry1HYsPkSGhlNWWt/6ftZa5ZELeYocnvZh+Ppe/O0kJbwlc1CcU6ICzaTheW2PblUdyoT+4FwcxVoiG2CSq0DthgQl+4Oye5SXcwbHoGhNts+1IYdyWVyZBuhuq40=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2991.prod.exchangelabs.com (2603:10b6:301:36::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 9 Apr 2021 03:14:13 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 03:14:13 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Fri,  9 Apr 2021 10:13:31 +0700
Message-Id: <20210409031332.21919-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210409031332.21919-1-quan@os.amperecomputing.com>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 03:14:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4fe143b-ca47-40b2-0190-08d8fb058d11
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2991393DAEF8EFFC90EE782EF2739@MWHPR0101MB2991.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFfFfUQ1eR7OFBUBn0k8pUVCnypX+3+eLVutpAkkodlrFg97hB2eg8SxOt9BS/8CN78ybZkyyfDEWF1nnUwExcyx0B0hJpaecWgViNv3FBhfaBFhoqAghTZ6wnCg6Bwxhh58hX9xB/6kmwI0esgUrhOibcjIQgtVZTjZqyti9ViISCGNng9Pv5qg30OWxz9JW6e+pVMNCZ45+T9kOJGkQj9TqNssPC7H+vufG8FD6mmBjuxsZ1FQW7ppCYqQcUQbI8NJz7hnOl7E5+9yggz/oy3jb3477w2aYndiGPRRR0YYWWw8yM/Edo41XCe6AgmuoVBdTbMQmqfIbJVx6jG7DocR0mX4C3zxMMzmIsRelp7oNXgEUk95+Z4CtPAEj4knwP0jeTLRpFUJXsAys6RRRmzOyoxu9wJsN3ZMjV49hsDs7oV2nl2kbnDHuCsL1I6qaFyJNAyEKgTGABsuLnGjHf286JJ7N0bvlMMAAAOR4xJAxrcAJJkwerZ1z1l8Nxi9ktj6UsAlxuB5pPDPEC3BtYGyKnbAoOdG18vxY6cef+C3r9c7syotgHOMHBM01uFycpYjEqQkwVyPkDhtV+3tSIbX834LGOizg4Qpg7kI80tLMJOSp6AiGzaMNuf668eZeNH/BKAPzgEH6FVdof6ukwa92HdytYZsO0H46Z1TET7d/jVpg+y1SCZ55xAvUk5AFnEztqdXNuYBYoWF6nmeNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(6512007)(30864003)(478600001)(38350700001)(921005)(6666004)(26005)(316002)(6486002)(1076003)(83380400001)(2906002)(86362001)(7416002)(186003)(16526019)(6506007)(5660300002)(107886003)(38100700001)(4326008)(66946007)(956004)(8936002)(8676002)(2616005)(52116002)(66556008)(54906003)(110136005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OZ+N1n2WXz2Vx52OZwGXuq8nk63NXmw0/UGHx1oSD+gQdMLh80kSogV4n24T?=
 =?us-ascii?Q?5UZmZ7lVnifRisBdv9ryI/AcI2LFz6zVWtMsPEBv6mLh0ClTJS5fhGJXM5IX?=
 =?us-ascii?Q?WqOvdx299MAS0eOOy7dfwo4uZXaz0MSCRltXpDkEv+Fp3HmG5YaNkgbOTQi+?=
 =?us-ascii?Q?znGHlcjN7wMtSHwVEZuEDv/YgbDkd5M6oa2RASodKyQRL3VHHE4AFbTY9FPx?=
 =?us-ascii?Q?qbt7pMaDOAVPmpMojGwmjetK5n49NyMSkWIoWjYzifoSlyXZozGIC4SViVIe?=
 =?us-ascii?Q?IXieauz4da/5faHS22NgOcEHbOYCT6AWlSTtChfyOLvRYScRJLgB2GWXrIsg?=
 =?us-ascii?Q?Zf8SwsZZe5pKcyTdAyBnhDyoE4vKSygVp9BBd7L7/sd+IPZMwbBeoaztmiWJ?=
 =?us-ascii?Q?AgbQ/GPgztDCrLSewugxatlAcPCJnXPgtvfcwlFQG8SGSl+DZETft8NRLMqZ?=
 =?us-ascii?Q?9KyK5CIkEaG/ZYZXn700u+8vsCNjAVDxDamGp4fJQiMbYuoPt+Ho7eEq8qYJ?=
 =?us-ascii?Q?ipgOczmYgFzDFlNKsOQkpUJyaBzB+EbxioLbXVOVZ2MBdcKAWOae/HjOn8o9?=
 =?us-ascii?Q?zz4tjcnGr7suZYCXdWlbCloocLJSdRTMV1Izii21N5X/z37IYQIL+I2D77kf?=
 =?us-ascii?Q?L3HgRPMCyT8MeCIHQ/Fkt1SrwAeYZejMRqq7LoRGZmk7GYVyyE8fnd48JrDi?=
 =?us-ascii?Q?rKoKqu6A9K2pSIryvh3zPbJmf/UWzfQ8PlEN9Bpwp6U2vKMdw0OIjslRXdUQ?=
 =?us-ascii?Q?pnTS981lhagneAp9pbxwRPh4Y2s+MzsgEA4MOYDYIhAc9ewxGeUOfgTbYgxs?=
 =?us-ascii?Q?Dbdg5p3yPk5WG6nlO3hxswiEsrMkgeFUfsU7BzHsiADQwp8Uge7L3uIO7GXI?=
 =?us-ascii?Q?PwEGuA7r08EWcUo/pR+x4ue1n5alm5+5500X/R881S+L6ZnwrUmdUOVl8wOm?=
 =?us-ascii?Q?Tmi+TLYsv69N9HL595V0vntpX1BRLoo2vi/xF9j79+sV8hCgG//w7Hgvs6eT?=
 =?us-ascii?Q?j4QL6xcA4oFihh8E5K6kLNZMqF09LlCUV9/iAwcXQU6P/bswV4S7k0xnRO+f?=
 =?us-ascii?Q?Kiv8UPw9x8HK0N+rQvWNpo77JV3ZBPZz8QRSmZRYkKTxM9zGkCc+M9Swk0QV?=
 =?us-ascii?Q?L4V0ekRTMND6Ztwl8jGkpIvCabjYp7o0fNUX7D5mBjjYZy9NmfwDvGYzUT8L?=
 =?us-ascii?Q?L5TCTPZbW38DHjowFusqPAaSNp7ep6iQ1eMfik9c5on7iZOBGwuNrvJVkza0?=
 =?us-ascii?Q?/OYXNhDiik30Cn9J+m9ANVXv9lIP9LMXf0+gzz0WYqhZf97yAvdFWBFoDE4F?=
 =?us-ascii?Q?+rNLge/JAzmkTDvCGobW/RAe?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fe143b-ca47-40b2-0190-08d8fb058d11
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 03:14:13.6673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StolC0xgogMLbSgmqlcSWkVKER7ODzuKmTCbdhKDXvEQCOSsVitqS3yT9+uZnKR1Ng9OYoU6pJt4el08B2L5a0iQVdXDOgQKuSSaXf68RhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2991
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
index 000000000000..a3389fcbad82
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
+		return -EPROBE_DEFER;
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

