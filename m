Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E03C6A30
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP95k5Vl5z3bXX
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 16:02:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YBSdATJx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.124;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YBSdATJx; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2124.outbound.protection.outlook.com [40.107.102.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP94K6GZZz2yY0;
 Tue, 13 Jul 2021 16:01:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzEnahfJ9FjIyZVHBF2Izo+fYXR8t7f85avTap70sRU3VEuErSk2z876ovdvmuR7yNwk5fZUPSr0NTi0yJApeg0rgF9Vr/pXApk6TbF8V5FU1fgVfHK1JQ/gVMkvndCYk1mQYE/A/Bwixyj7RJGDpGjauMVqw8qZ1MKacvS/KpkymT8GWitLarvAHmo+H/37DWXEZcoEh1emOeMftduwMnVcfR6d8S4fMmKfrPCUqrbKkTs9svMxC5LIi+Ncw5gSMt39GuQ6LYH4c9HXHfdvsGRg6W+Uk3Lc04SYE0GChDZYJpzdC/doDSGwD8kacOCMwAdQLNP5d+k3uLXswGbMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdVT7SozrMy879stD8RvHLl7U6n+4sHk3ZrdKW0WzzU=;
 b=MoAjaj9BiTTlkufPZOdkwdJXT9oZrr+B5K0rclRcGKU+JB1EMLRbYumH9tCwt6UBu+zdrVzyLhG/Xot11zw3Ob9apLP+nfTi1JaNQiq2VEDG7T5aCH3fc1yPsPxRYMgVCjQdXrT8hMNhjAuLe4gRQUdlDTPlsxIYK9QnOrFXrEeSU2zt8xkeuDoXqurgWQFNU0NHmKTUYPQR0l6DJOtn2DFBedCsVuvq8ZwWeWgqlCSLQRC5EB62+f/GRZfKLzL4OsMtnP7na3mDCwPOoCxbBUOmjJ17GLP8kVEsnGgt7d+ZPhK04EKO/buLXB+SRXUdcNhsvAu50EbDVUXsXw3Blg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdVT7SozrMy879stD8RvHLl7U6n+4sHk3ZrdKW0WzzU=;
 b=YBSdATJx96PfnoQEFllraPPHjOdef8NmTo9/XvqfCRToVF+RZ5YyZ0sHOMgpZ2oNx8CF4TsadHB1LyQRpQl7Uh7fAivHH3dTkp+lLmpALdeR1G8/ekjLqbOkAyoCLf38AEdlsUtNHhv9u9S1oggfCTrMl6hNCyTCcaYWZZ38IBY=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2592.prod.exchangelabs.com (2603:10b6:300:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 06:01:04 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:01:04 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 2/4] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
Date: Tue, 13 Jul 2021 13:00:29 +0700
Message-Id: <20210713060031.31568-3-quan@os.amperecomputing.com>
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
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:01:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d593d9da-4508-46b8-5882-08d945c3995e
X-MS-TrafficTypeDiagnostic: MWHPR01MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB259238B6B78E78A53BCD8F29F2149@MWHPR01MB2592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjG7unxrNZiVBL9vG5T4XdEQ+YuKVVpEJKK9vwYQ/5cxGotudcSuxQaokK95SEp63GwwVZ5XxMe9xCYp5pSS7oEtQhdWHw83284uNhgadrFHlukAjLh3Qkb1VjqyNWjQ562+XDIlpurvBFd1iAVo1k+3uZVzMOHxCKkCae2KojhVKGobSeKWDHonrPYn8e8qcOa/P3AGoHY+W7Vr4W9wi6ZvJJ20gnGGSQ/dJI46VhBpWubxZrCJ0RoqH3E1YsPxc04xhzLNcVWbRYVt+ZzXjairj2zBQqblmkhGcU6i88680paNjAe7HcFr1l5qEovkWUOz5nr0eBB7jeDDfOi+wYYcIIm4OMWEbtm6bpIZjShbnCJcmzw3Nx6myEZ7y1HuVZrwTzDG+YAEqAgYud31jXRIlDxaQ9QNGh3NntsGggLtLP+5PA4QWWjWa9baCDWIsYdvKWF9BVQyfc3VWSxRNwUTa89dOjCxGp4FMxKY5x5uyfMxKKZIscIW4QkHjOADJ9KQrwKxZNts9DG1v0OIBDs9tSxVrcBCTAEWd7mWIvpgkIGzfSupPxoD4EKpyL4PRR6r9U++gZcESP9j3eye5kZbaPgdpufL7twohSjtsl4U2XIner6X0QnIPlzr8oqO/q05NTtpa8h0E3fB8IJt3kV5Iaj2sXbQkmicBGWjjsHcuq1oGNFiDSdJUxBoFTbUCboqaIAYXn0Je0+UIJJvhzA89btmIeIgyMKbah5mDZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(2616005)(86362001)(110136005)(956004)(316002)(5660300002)(107886003)(66946007)(54906003)(66556008)(66476007)(4326008)(478600001)(38100700002)(38350700002)(6666004)(921005)(6512007)(52116002)(6506007)(83380400001)(26005)(2906002)(8676002)(7416002)(8936002)(186003)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CshMkAO02ox0e9SExgmsipfuXpgwVKjMVUomL31qkaIWCv/FvHbBzCzfpGE?=
 =?us-ascii?Q?89lnNT9v6uQ3TMwBeJz6h62mZzKdgpOBF2P5iIvv67iEMdYCUw7Uz+6akjm0?=
 =?us-ascii?Q?DNfifFf4YufFZRcX0gFoTK8LBruWCiqHofBDt2gYBoylmH0PiV1BxJ2qna0D?=
 =?us-ascii?Q?O6sC4Qj9s1hQ6iRgYHsi3/BlDWOgED3MVRHHIMhzCl+da5bAAdXed3oCi0Ex?=
 =?us-ascii?Q?yLebUr8Zdp2dIKJCYe8AwARSBJwiij39rSDZUIulox6bHeIxIzoy5gbJqced?=
 =?us-ascii?Q?mXFY1kv9xd6XvvQczQssqW+fkBmMrRrHpvGPyuM0B0dJrzq7J5e1npbYLyJY?=
 =?us-ascii?Q?dPDLvLVVkNlfaZBFY1Lyr+OHHuzuB5PejnzuBhpbYMapPn/S1Dc9w7aSOPJx?=
 =?us-ascii?Q?MoVyEJCJo8PktBUY2+VwSByapdBMQcpR1P+Fhk2mVnQDj9JfGpsH8xTsiCnG?=
 =?us-ascii?Q?VZmcHe7YlsEmkC9wdiS+VZq/bSVQimiGxt4cv3q3IbZrvzUhFu1hpQxncH7F?=
 =?us-ascii?Q?giD9j9cbwQFv8DXM1H8eWyaqlj8b9MsWvPPSO/IfemfXK8wpfpRnHWQA3Yxf?=
 =?us-ascii?Q?U5MmL6V+1aXwao/H1vU5/Gemmqr6qflHfSzZG8mr57Ff0FPUcfq181I1bS1q?=
 =?us-ascii?Q?zjFhBzeJqDRZBUeccUOw4wmFVP4mdReTMTu+J79hv79aX/WdjED5q0ahPmo/?=
 =?us-ascii?Q?nO1w29CnkPPTx+fjJ0vmlXNMTh12/B3wSZGTODa0PYkSLEE6YYlObORefxnD?=
 =?us-ascii?Q?F486fdEH7Wql1Gn7nZVg7qgqpZGd96NqT1TqK1dRjp7QHRjX4fGVCKGj4DPH?=
 =?us-ascii?Q?VRqJLfOvJCPFRrCuGNlt4M5fyMFkkU7KQkEZrwJMoMJUcaVmGVMR3B4wZlAn?=
 =?us-ascii?Q?dxOYHwN8XbEpNqkPeu4/43yWmu/lLywTdHwxkZvDcOas+rdF2t1HYJ/Ciu5m?=
 =?us-ascii?Q?bIMP84X5OAqzo5PH62U9Bmqx8aVxOjfjzgDbngmn7JgNQVYN4nWV5/eo0Zlk?=
 =?us-ascii?Q?sgj//j9g8xwivSJ7v2v3URla7EPxItOy1Sfds+xTR73vBCFwIO71Y/PQtrbI?=
 =?us-ascii?Q?d43V7rButbZoPMb4dqPWoH2aAmL4Oywk6RETOY0Oy3ZfzZeUrxM6jOhMdaS6?=
 =?us-ascii?Q?4buqDpWHpg7BirmqiZeW+Nt2NupCoNwecNDZqaka2W4tT0t4rryBGEThaa+q?=
 =?us-ascii?Q?wpoR7DDYab4V6vK+4mleTmFGvqjMRGFCaFMvahV05p4JAEdYFRtBXMqBDsmj?=
 =?us-ascii?Q?iSX3MqT+E5NbV2OewCNMefX/Uwhz/hNlHTKMAHCN2IX82vtjHtVzvKUuMmW0?=
 =?us-ascii?Q?iNKwFarEiTMn3JSOcy1Myyge?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d593d9da-4508-46b8-5882-08d945c3995e
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:01:04.7589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m71O/7rhP/UI0ATFG7me9eWp8/6bJvt6g2oSCeJWAcPnuiFLTn89DZ4XmJaQ5RkDQZuwVAgbpkbmDHzSPG6fEf57fm0EE12GGJhHODExPr0=
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

Adds Multi-function devices driver for SMpro co-processor found on the
Mt.Jade hardware reference platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v5: 
  + Dropped the use of simple-mfd-i2c driver [Quan]
  + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
  sub-devices. This is to avoid DT nodes without resource issue [Quan]
  + Revised commit message [Quan]

Changes in v4:
  + Add "depends on I2C" to fix build issue found by kernel test
  robot [Guenter]

Changes in v3:
  + None

Changes in v2:
  + Used 'struct of_device_id's .data attribute [Lee Jones]

 drivers/mfd/Kconfig     | 12 +++++++
 drivers/mfd/Makefile    |  1 +
 drivers/mfd/smpro-mfd.c | 74 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 drivers/mfd/smpro-mfd.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6a3fd2d75f96..25e502cca32f 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -77,6 +77,18 @@ config MFD_AS3711
 	help
 	  Support for the AS3711 PMIC from AMS
 
+config MFD_SMPRO
+	tristate "Ampere Computing MFD SMpro core driver"
+	depends on I2C
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Say yes here to enable SMpro driver support for Ampere's Altra
+	  processor family.
+
+	  Ampere's Altra SMpro exposes an I2C regmap interface that can
+	  be accessed by child devices.
+
 config MFD_AS3722
 	tristate "ams AS3722 Power Management IC"
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 8116c19d5fd4..046fd36de85a 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -268,6 +268,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
 
 obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
 obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
+obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
 obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
 
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
new file mode 100644
index 000000000000..b0cd3c248507
--- /dev/null
+++ b/drivers/mfd/smpro-mfd.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ampere Altra Family SMPro MFD - I2C
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * Author: Quan Nguyen <quan@os.amperecomputing..com>
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/core.h>
+#include <linux/regmap.h>
+
+/* Identification Registers */
+#define MANUFACTURER_ID_REG     0x02
+#define AMPERE_MANUFACTURER_ID  0xCD3A
+
+static const struct regmap_config simple_word_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+};
+
+static const struct mfd_cell smpro_devs[] = {
+	MFD_CELL_NAME("smpro-hwmon"),
+};
+
+static int smpro_mfd_probe(struct i2c_client *i2c)
+{
+	const struct regmap_config *config;
+	struct regmap *regmap;
+	unsigned int val;
+	int ret;
+
+	config = device_get_match_data(&i2c->dev);
+	if (!config)
+		config = &simple_word_regmap_config;
+
+	regmap = devm_regmap_init_i2c(i2c, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Check for valid ID */
+	ret = regmap_read(regmap, MANUFACTURER_ID_REG, &val);
+	if (ret)
+		return ret;
+
+	if (val != AMPERE_MANUFACTURER_ID)
+		return -ENODEV;
+
+	return devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
+				    smpro_devs, ARRAY_SIZE(smpro_devs), NULL, 0, NULL);
+}
+
+static const struct of_device_id smpro_mfd_of_match[] = {
+	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
+	{}
+};
+MODULE_DEVICE_TABLE(of, smpro_mfd_of_match);
+
+static struct i2c_driver smpro_mfd_driver = {
+	.probe_new = smpro_mfd_probe,
+	.driver = {
+		.name = "smpro-mfd-i2c",
+		.of_match_table = smpro_mfd_of_match,
+	},
+};
+module_i2c_driver(smpro_mfd_driver);
+
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("SMPRO MFD - I2C driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

