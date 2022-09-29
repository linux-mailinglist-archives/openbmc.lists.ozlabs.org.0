Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B575EF276
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT3y2CxCz3blT
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=eHn6AisC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.100; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=eHn6AisC;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2100.outbound.protection.outlook.com [40.107.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT2j2dXFz30F7
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:43:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ykjy3UkyuYMLIlPmFj0gUHyPu58FSLzmiihViGX0gMxwlV++aWjJZ/tB9gDLlaRD8Hc8Q734mnI/a0xTeGhpX4aByJvyNDv7LjvI2i4itYYrK6PTZA4X90xMyUbR8WeYRNq6YjUwTyLBJkFw5J0hI5P/btHAYC4o2W1PQRy4Rdab1utGfftLffDGX5IQkldKtTiZl0L6Zr32Nfp8rrW+wUvZJP6pcrhZ03GODuej/76ajeCQXkkkQG1guH6fZavm+ozM+vaZ+CcdszIomtc8EVyHdUqd2JmVfevXKzTRzUUzl/bdlNpxD2uknowmNbPR1Imrx09ddBU/uhB5nr2IAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZTN6I8nwhhpRYiGWF6W/BCptuQk22D4zJA/Pk2wrdU=;
 b=AwYQlpzAg3uKrlsZAA2jYtQB0W3gxcsOELh/CNenJlxnqjJBM0LsCZcSOuWaLUZWcxnqzsrEpKWfB7TSDIW/5Xv4G98uNByDO+pqwdhfVaH5UxTVvVSUebo53PbnsLlk4IiTSE8LIZN/1a1LhBBoRI62/JcH2FTbjhSZpeacLfPSDO9aNlCMlceSRvKQp5QH3PdRKbd+9Uc1MqAPO9rpqkov32ZWJyIzkOnMlULv/g3uMpK/oy4H2O5kxXrVMBzx+3YpshDPCfyQ4XtugkoyPQ0QmVKaxXx5QxOabUwbx+9kVvjSBnB/iJqFnzmgSXvO62DacnCPNNP2c+MVEzAN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZTN6I8nwhhpRYiGWF6W/BCptuQk22D4zJA/Pk2wrdU=;
 b=eHn6AisCQyYkg8cNPsuPfRHUPfopBuim97WqRWnhxTtxilI2GL7XCyLVh8WkAPraTeyB8GUDdSXL3paMFPDoUZC+Z90cH53mXSIV6DFXL1I3Q3eC5Uvz6XvJcN1X1C6ZtbY37AFIeaCX3qOKXrrO/5lovesSy4qaKb+JpGyrUOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN8PR01MB5682.prod.exchangelabs.com (2603:10b6:408:be::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Thu, 29 Sep 2022 09:43:50 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:43:50 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: macro@orcam.me.uk,
	Lee Jones <lee@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Thu Nguyen <thu@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v9 1/9] hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
Date: Thu, 29 Sep 2022 16:43:13 +0700
Message-Id: <20220929094321.770125-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929094321.770125-1-quan@os.amperecomputing.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BN8PR01MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cab5ac-88cf-4ea7-96aa-08daa1ff1cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Y4hMdXrUK126Zg/XL0uE/+CsFa1QIotnC26tpPhbRkiFHtnMeFLUBycTJa3a1UBneEtzqvv4Wr878+7jwXxfTTcp7tRmk8pXVgDVg5ttpXWXUvvzHrKLiE7N+uhASioIt10dUQDtZYkbyPWsCaJx2KOPtbJZZYW7kQCMBj6b5ca849nnFnvGvzt+tg3NJYp0gPj8rYDRVhSwPjZ7xRbm1EZJBNDcEGGVZP6DIt5AtKgkLRhDTP1Um+C8aoAQ42T4b4OQKePCV72fLvrCvRon4I91M8FaaE+BWlNgWoaFTeZL84PN9NRPpp8iuik2zNm7i7yY6FhU/ZW1CNFWqia3jrfS7DNDXqzALlvToIHChKBo09BNSUuOC8QdwehiDl/wSobhlUbScpjwg4yPsMxLPzTSc72B5+MW4NAq3P1i+sAMa2LLqcUU8vsf6t4KUm2l/GXhaxmM7WT8oImdSNUhu4rE33wHBJiPe66dFSEu62Ua7WiOZQHXmBfGBGpfUMfp5GKVw+QhuIIIpUyG1Z9BI9aGJHUrBKhs+Pvy9GwzFm2kelxsJd5kzpWZXcPkQCn6eLMp6Anu19NtmMKO/WC5OMHtEqZZsLjJQvao39/q83vSSwbchgFLcEF91isXtgVsSdMNh5LyLE3/4BOJtEmThg9Is1KJRMsVJglRH7K/DqTt1HAlB4kuhbORdrwZyJ8r55SIj0UudUs7hSp6gRlaSwnBGoe/4lQgbTbQuqBdc27XPbrB1qc7ZFkKvybMTMNd2zWmd9hQCLpDjs5LrPy99SmxN/ytIeDZoTLexhhR2pofDgZrEY9iz/rje5lu1IUVvtAaZ1oh3pquiiUhl1tS8w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(7416002)(30864003)(26005)(86362001)(6512007)(107886003)(110136005)(5660300002)(8936002)(66476007)(66556008)(8676002)(6666004)(41300700001)(83380400001)(4326008)(316002)(66946007)(2906002)(186003)(52116002)(1076003)(6506007)(2616005)(38350700002)(6486002)(38100700002)(921005)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OKiml1iH+Lpk/5YKGs6KLyx3GKCbDB38GtFci1ApkU6HwyeYdDBhVaVfZ55t?=
 =?us-ascii?Q?t0lO2/nA0qrENEOK4wl7yGa4V+dC9DgosYxpqXhgi4aeaePf/6fIJV1z1ygE?=
 =?us-ascii?Q?Ccae0pWmiWVUJHbC53kIiFixkw++8k5b4D16b8wVu6LjoUnDxt2Tu7hyWovO?=
 =?us-ascii?Q?dzGkfeQlJhFpPLL0YMdykA+fdNibNaxkVL9grcPbbn8a1zMj4DNmxZxLEalx?=
 =?us-ascii?Q?mggpwzluN26n9TPt1C9OjhUQ2J+aI+izL150HajajLOPRQaRcB1sZop1+QG0?=
 =?us-ascii?Q?DhZBbzI1LKYs6psG3mR2vWztppLWndJvkWvYMgrxHXM8m5L/wgmPGq+/L3Tc?=
 =?us-ascii?Q?La6IIiC+VtsaA7j9wmxoGY6uD0kG5EucvqOhsxwPC5vkewfg71cUGeBYPQ84?=
 =?us-ascii?Q?R0zVXAWrmLEhRT/SGKMgGWScF0HLAdcw5KYmdMpGGmum0pQLMNF2mO+/D6i6?=
 =?us-ascii?Q?/YXSCDRM2G120torAGjDS59LJQ0kLsljl6IgCzXOLJR8zO+w63gtckqDWcUo?=
 =?us-ascii?Q?ezrhBLjWO/99AL/ryhfrr/IIlv0HXdACN5g5BbZEFl5xjkn3la9azMQOAwRe?=
 =?us-ascii?Q?D25EkeiZ7Dwdha4gQi7WEiF6gV9/i9lJ7Ejr799Im6igY4KFzwdLN9/8uLOQ?=
 =?us-ascii?Q?seHLedlgKRvWKFWc3kxlrv691LwK8o2qH5gW904DZLgorYvQGmLYWqvKlZys?=
 =?us-ascii?Q?Em6LACORs58z2HQZtVKiNqCStZjqV+/ikgYCXFLKQbZCqvxQ46B1Rldc+MrG?=
 =?us-ascii?Q?hyVrZBl8STRnaTvTSx1g7Nz6miHL7WsRyplc7FNNvNlZwyF4tzUfZT6FT1sT?=
 =?us-ascii?Q?ToLgGk4DwLBoUapk5z14/aj2UnKWbXvDR0YWuqgw8rJoF+tnv89GhwFqHEtZ?=
 =?us-ascii?Q?XPjNYCvbcsb8qcJWrHiUebsGwHRXe326hgslzsE4pHOVyaNNy7zoHRqZQC8V?=
 =?us-ascii?Q?dBGZwN0TCIz+9YIadnkJeEN42psP5B33yukBQwE60djWqOA6BKXBx89xdMwP?=
 =?us-ascii?Q?gvh6fPDnCbDPxbl+0u0r3Lm+h5jdVRJQuditSjgpxKB4F4tKWRcCQREHoB9F?=
 =?us-ascii?Q?798a/2/wkrS5PeAka2lXnXNsnMHpuB22MI+irqUJQiZmuzpMIHMA4VJGoJMs?=
 =?us-ascii?Q?zWpedUm/atdHEQfNjwq6VCfe/6Kr6rfeyxW8UYnWZBpVdU2zpFbvWrOYtTgc?=
 =?us-ascii?Q?QTW1CLQ4MTHj2UE5q4gu2r9cK1XrBFRzCciigWUJrnsOpT9c3dG1OfCo209p?=
 =?us-ascii?Q?nxz+QzgFsHdk3ucERQ6e/N/ym+KMmEUgvdh0mKhZwF+ypQVY9J6vxccijufU?=
 =?us-ascii?Q?ZVejQqBnlJk+malIljXMmlPK66dPwhCJ+N9sW5q3MODuvJMzbbC9JI0yY843?=
 =?us-ascii?Q?tuIQ3+1Qo0pp4yXqakeK67ma5459/MudfFCodmiPkBi29bFcVFplWPs3hfpO?=
 =?us-ascii?Q?Vrqy4cTkOw1sGSD5Oh+9Ee42yi596KtU3zzpn0ZZBNyXolPPWps0wVv68vTN?=
 =?us-ascii?Q?UNMEZUkPZ5CamZ0rmp1xxHDIRGnZMLOmRhPPH+UnR0mE2yAPDus0LYtzZ/Nt?=
 =?us-ascii?Q?hX19NlQG1OH4kMVcAg3/pR0HOAfUJiGZFkg4SoHhB5jpDdl8YiMeDCOaNH0H?=
 =?us-ascii?Q?sJaawVvLhQMzwpIwPPjy53U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cab5ac-88cf-4ea7-96aa-08daa1ff1cae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:43:50.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/8bkRGjOQi86ax6JZAOKSwrUc7dqRb/gNebZiV2NlSH9nkfK6/1NGxTvUJf8FN8OlE1pU1LeXA5YsDAFmN3F1aY2ZsnJOJvIED8NQof/o8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR01MB5682
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds support for Ampere SMpro hwmon driver. This driver
supports accessing various CPU sensors provided by the SMpro co-processor
including temperature, power, voltages, and current.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v9:
  + Insert 'break;' to avoid fall-through [kernel test robot]
  + Update SPDX license                                [Greg]

Changes in v8:
  + Masks reserved bit when read 10-bit power value    [Quan]
  + Insert 'break;' to avoid fall-through [kernel test robot]

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
 drivers/hwmon/smpro-hwmon.c | 463 ++++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 drivers/hwmon/smpro-hwmon.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 7ac3daaf59ce..e7ec6af309c7 100644
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
index 11d076cad8a2..c5cd7e3a67ff 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_SHT4x)	+= sht4x.o
 obj-$(CONFIG_SENSORS_SHTC1)	+= shtc1.o
 obj-$(CONFIG_SENSORS_SIS5595)	+= sis5595.o
 obj-$(CONFIG_SENSORS_SMM665)	+= smm665.o
+obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
diff --git a/drivers/hwmon/smpro-hwmon.c b/drivers/hwmon/smpro-hwmon.c
new file mode 100644
index 000000000000..ee54e21c2c12
--- /dev/null
+++ b/drivers/hwmon/smpro-hwmon.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: GPL-2.0-only
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

