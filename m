Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D23C6A32
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP96F27wyz3bWc
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 16:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=EQ/RlqHn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.124;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=EQ/RlqHn; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2124.outbound.protection.outlook.com [40.107.102.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP94L2tKPz3036;
 Tue, 13 Jul 2021 16:01:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7c8HkSUOMDbu3u0Ab6F2DeqOKtfMOVCnwQIkY8YOCww/M22fc6RQ9Z3RG2tQKhtgtCKg8W8L19x5a+nfTUkl/jHcKHaHbA8gL6LvdXo+SbbLQPgbntxFaxEO3ZqZ5z0xHqqagwOzKDhBxvR0VAysGsbwObO4TzReMMRG1e1uvo/pEswx9HDl2EU1YTspWLvtKnYKuqGLGRGSnN/IDJRuuhMvJLC2MF63Zh9kR2L+XPtFb+LmO1OzdiV+XitQOei922xBY0r3hIJdtQO+nWQmUGjXbC7WNHnDPa/lWpY07K0Cf06gfDdO5B4gyWjX5OpzZPq/SvVb5yDHCIslJFwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIlu4DeF4kqtom/eXIT7XoBEdgyX1aEz1LW7tPRDBVc=;
 b=gFeqWqv240r2K8hJcb8S/vzD2aNaobnFnQckYK+YZTucghvz1r9mjzo2jh3nQu6M+HI6C4Xp6udn8YixGZURRwd8n1HaLC8wV6O3Y6mrA/ud1TsOF0IMIrU+WvdfDgGvYRUz0hz2pS/0rcGsRqd+ThDyvomATK3UXs87yMF5P05xwfpdOc4g7nklKJjDto0hHXTKJSvQondqARmx6mly8fqG9T2SOTBEOgT5kRwQkzoxib+5ESyPbgfP9X5mwCtyoPsTS08/ucaf1hXt5zVyZxVE52NXfqmayFcK+vgN0pdmZiSb9rCu+20LNwbV8QGNJml01Gvsy0+NoqXcJ1fPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RIlu4DeF4kqtom/eXIT7XoBEdgyX1aEz1LW7tPRDBVc=;
 b=EQ/RlqHn+yeR025Y25KzkBzKMflIOOPfvizF6NwslffkuvSd6rad0KciRMeoyo/Fke6dEgZx/VByr3MQ7WGOVKalXBWmsiLYivPur5NDQNqvdyEQxDMMFguUMK0ycEgZXwkB6aZ9qFu72MXlA2z5sBEhqbBRqKjIFeTX7yauzqM=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2592.prod.exchangelabs.com (2603:10b6:300:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 06:01:08 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:01:08 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 3/4] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Tue, 13 Jul 2021 13:00:30 +0700
Message-Id: <20210713060031.31568-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713060031.31568-1-quan@os.amperecomputing.com>
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:01:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07803524-da78-410e-a5f9-08d945c39bc0
X-MS-TrafficTypeDiagnostic: MWHPR01MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2592174C088DD9B31C3E3A11F2149@MWHPR01MB2592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wz7kKy4tQuHr6P6KOLC+9afdeNsVukZe10xM8QVRBiRJUNAlOzuX71a0227ANo89+Yk47tcsCAh4wTJvpZTUKIN0ImJMhRJ1VtsT6M7IxRYtZHVrTQcMtTcsf+H3H8NzLkDgA846vNZz6dsKvz/A3ZqDCvp6cCZjlycZm58E4eXwpJoRkSzZWqdquxn+7UTk9GZHvr7Npd+sh37kdCJkBaiwY0FwvySTlCEhBkc7u4Ud49ytiohwWCsYJgOkJhgfFSFxg50zEDUCuzJGnQZlcwqu5IY9/mEv4GZsam3Rch1DXUQEPHCSWkhT/FT2+Amh9TIRUUpiWXwBvObi71RAg6KwZbpkVFDux0UGLIW40hUOdA3Re60Pb06QwACJkYrookp4nKfArlJaKXVEVrGOxERmOA+g7tFzNx0vL54fij517Ncnq3NgPZFFuKdVyswUNLUIuE/gIPb9cSoDoQs3reEZ1LyKDsWO+GuV5XtUUtRKxONWTVVTGw3+AUQMns994WtUPzTOEds5aaeq0WLz1YOjchXn2F1qQ7hEfB+bnqiHNhtw5xB9T9gtztObJqW853pZ0ZVcLkLrFPL8i6QGBrOEk91jsUyhYKdkw5BD3oqk7dHyI0JOc8zZJwHr7p8DvkN1L2FecANAgPhQx1RiiobfBdYiaHEHMK4tm1GQ+hXaqNAcb5W3Qorvm5Ll4M6u3u4URkwfQRmEarAHcyMAufWwtUcDEARkJMjndz1h+Ko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(2616005)(86362001)(110136005)(956004)(316002)(5660300002)(30864003)(107886003)(66946007)(54906003)(66556008)(66476007)(4326008)(478600001)(38100700002)(38350700002)(6666004)(921005)(6512007)(52116002)(6506007)(83380400001)(26005)(2906002)(8676002)(7416002)(8936002)(186003)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iV6jz2zYed5LtbVcLQyevdhNvZers2D6Gd6rkLi6xtgyv5wO/IT8xjoxAk9A?=
 =?us-ascii?Q?9VCZdjtb+tixw6tOVI2+t45Od/ZtCeYbHdQYqYVrlm2i9cMbMj8W36pWa+Bf?=
 =?us-ascii?Q?bsFmlzcpY5RHXzbfoRxpqkZCAH2sq/e7NHKlLITOJpu4R3cuGS1l6jIncWd/?=
 =?us-ascii?Q?41gHicDrvFYeFZG5IAaA6krZwBQqbosJ82zq4fPfnQIiZlm9CiPctBMD6rOP?=
 =?us-ascii?Q?FnQKhUc0Xpt6NBr82x7ra9DCtHxf99rsWPW1vZnNcNd2TQy0jrh/yq1ZOlqm?=
 =?us-ascii?Q?ShNn7zHXNkHK8dVbSrqa26QO7f69LMZ98EZkD8d6QXhST4B4XHpnyIrbUCwd?=
 =?us-ascii?Q?3rp5Zam2G1IHELFC+CxnVsBb5GcoAvWiUwOUx6hC2Iss+b93ckAeeLBNUG1f?=
 =?us-ascii?Q?eJHTFDsMVggagw4gI9J9/Z6drWJpipMimGdRSIJBhq7/h2P0b1WYi9j7IY+F?=
 =?us-ascii?Q?qGvk/rQALGm5+k182Jw37h3j1Y0OMrWpfNUbevhi0UBMl0hgLvokUrPGahH1?=
 =?us-ascii?Q?/PJe+9cQwfPfgrBKgn9FRuhkz66n4S3JSbFCmatQN5IiABs2rqF/VbGw2PbP?=
 =?us-ascii?Q?TKCRTbFYVWO+5zObQeHWSrKZYaluKQXNpa7DZQ4ANzwywItG/Y7ZAvhMtAqW?=
 =?us-ascii?Q?+w5AH9qp9PC517/XvGN6r+bcey2IQw3uM7UBn2YNsuZKn9j6dWNzFDo506yb?=
 =?us-ascii?Q?fDQY/O5b8QEhPmgEbp4RRTjZ1Ig0FKQnjhQU4Ou2Sd11n7DjzDP6zR2hjiCx?=
 =?us-ascii?Q?c0GCN9LOz9A/UcWS9p+6Lj7Q+00ZcHpx3fPo7sPy4ngwU1pyozeuDtzAT7W1?=
 =?us-ascii?Q?bVOcQFKBCMhheTuU5rYdRUwImOYO3wrMNv6oIVDIC52KsMMl/+4Fb3EUNZmP?=
 =?us-ascii?Q?fnclvUwIXaba+JfNZxXJwl+L/SsqdNWtxZLg6Ok3k3lB+gCV8Sldo9+8IL5d?=
 =?us-ascii?Q?FM4vIq5D4RUMwE1HGMwt8kCuKm8qaovBlOzBlygRR9DrEdySAGA3IoIr3w9U?=
 =?us-ascii?Q?/iMYvaEeEoXfKvfG5ZCPHwbjMXF0vSZiadyPAr4Uz2xfzzAH2c4p9yKZRBru?=
 =?us-ascii?Q?B1Mjdmgd2kXEZOq6SI/vulPFkTwAL/evHWu0k381rAzPTmKTI6JuCmRi/MBZ?=
 =?us-ascii?Q?kkeak8H6oezAzwa3sbB1j2y0BFKNF2ZFcXmg92ZC6vIwZaQ397Ku+z1SYUTj?=
 =?us-ascii?Q?8rf4n15w68ma5gkWbqMAPhMrzFs6B6XjzO6m+GgJ3zL6jaNU3QG7VilJRTIW?=
 =?us-ascii?Q?6G4kOrbYNAJBRRk6qpKmr+51Cq2C+42ZXZbLtwzxqmWvgc4CNxuJ0Y312CRd?=
 =?us-ascii?Q?0jxXsev0/x8Il8E82zrm9Tgi?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07803524-da78-410e-a5f9-08d945c39bc0
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:01:08.6647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H54LqFG+OoX3ZWjNXI2mZfQL6rrTRlInUaS8KpAE6677MZWkjPIlC/XO/NQtqVUP/LXE81j6dCv9NtRUOQmOqE3goEE0TNivzW6Hi2f/6eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2592
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
index e3675377bc5d..903c5ef79a5a 100644
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
index d712c61c1f5e..9de5cd9911b0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -175,6 +175,7 @@ obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
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

