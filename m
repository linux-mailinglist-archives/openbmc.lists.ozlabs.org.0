Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63C50AE38
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:54:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzXK2rgdz2yb6
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:54:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SXNoAiSF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::719;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=SXNoAiSF; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNg5yYCz3bbj
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:48:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyqD8P7Y7WS0pZ2o0diBWPEqwq/DJN1XbKx5e2uMCz62Z5dKXkR40wrc+k6pCPSblBsdCN7InmK5eCfTk3JO0Z9b3LWHEiK+mYGIYDrfR86WOYUSCggbCAL/ICJ9rwglSMU8Uz6Z1bupz+eqE1aKcwh9L4bagu4cF1hvuqPYZ25R4xoHQhXjGGmYyJ23wP72LPotywsf59oLzj0TVd77KFdPC2sD3ikP+z2PsFk/0vw1qZ8tMhsQfHP90sbFH8XdwRRvuoqjm37ofFmPTFJ+1e5cBu7uke31c9NPe2V6oHff30V47Ao0upv5H+E1N+gfg9XdRHc/H3sB2RcxUMe5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnrAO+TUBaGQrq9QXlzH6zS1QhvA1MVma3bRyO3j2B8=;
 b=kuauGSgh946v5fpkvvw1t++nAL9KqsJs2fz0U8U1vo2DaxA/+IL/lDk5d6/rDDOM8UMBwBr/7O3hi0HhX+JBfUzjoBnVZbskb1ZPwubXNkEeNg1ULjvey5/0FpHpi1GlDinQZctCLDS2f8gjGlSeVkFFVjm5uaKKK+RhTc/CFcKTjddTgKyvumPjZo/kgKkEPaIAsuLGTcgSvIhHiEJIS+9FWvpB8smy92ZFpA+FmemmWrzR0Ra0VWJZ8xjVFL3LYzZh86elqgqZjPpYpIdJYMnWnqd4qaPJmkvMd45L5VTCoZq/ePUngmVFlLC2Y4KadsTWggWQ5CFLj9edHlRMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnrAO+TUBaGQrq9QXlzH6zS1QhvA1MVma3bRyO3j2B8=;
 b=SXNoAiSFcR6kaFvEoLi5g4BJznCFAUE5PNK6ulTgkf3Ks3JQz3jttAAW8Zj5G715nxGriuVmeZrCir9Aa/ZvPc2i2Us1eaHg9NopObIpnfYSZQu5aaEFvkUwd7HMXCBDt4ZBMYJ8566zmS9crGp75ov2nlsnnTA2L+YwN2Z2HOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:53 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:53 +0000
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
Subject: [PATCH v8 8/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
Date: Fri, 22 Apr 2022 09:46:52 +0700
Message-Id: <20220422024653.2199489-9-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: ebc4b520-bfbc-46e8-e751-08da240a7f42
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB46533CF55648611041866596F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atkPWbsP70OLKlO8Wx+27osjFpHNnmgcbhaWtLSdQ4quSXhC7pMoGOkeDdFPqEEKQyerYwTsQbA4B0Z4KceXqSpqSCFjPyqsgcwVRt/oGZHa1wy6pVpqmsN9RWSA/3KvqPNhmfgX6rFD+LE+F4Xopqn8IHKuzjcAEbZEgJu1SLrdNTXvHssp38iT5YVl6RoW3Iv7Z8RpqFvVBtPbRFQYYdtQrVZKv24u1Mq09YHU1dA4JsoC1/Lt8YsfMrFjBWOzxHp6405RLzQze21SkrC5qSQG13lrmZNlbk3cwIKMFUlqhEa81ReWStPtaVdtJHINUV3OMyG2tUobzGs2l/1TJEC617LlKvINipKz47Uk/qe0eVf8A3T9l3/c/oYkprp8UQgGou6OdH8rCKf7KUtZHSD2IYJdMqF+tOi4R4u9mJJmioZHGhtrC2ZkC/h62o+rkApVlycX8DvrKrzpbbmXscvnyeFhCtE9YH9iqO+2nIKTqf7+deWeQr61Gsh4e1Ncv5gSxadymA2zghvxwGyDJkMLklDyMrs3PytExKwbxYH0FEU7OT0eUbTe/S1tXGewES0RtGl+sB4maYusD58VjVKzTx43nKrlpA7ZTZPYlItpDH95iGJUVk+YGNrGvqLjs8TUuIr8G3dRkyfZRfDOxKBatH0mC4cOpru9RQwrlQwkyB01oCoPsBRuwfE8+u6ethjnK6tsJejagvGKtHom0UXRXbKNgIwGdsgyTGDQAj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBpn9NkGAAouNRFNaU33in19DEwxBlZoT8ucPsXZNmsdtwd6RojCaaRXaAY+?=
 =?us-ascii?Q?ODmxY4Q4zBypvE1T6Q3d/d8vCJF75HoUwF6R22ichr2rnXQWGIl+1c8xRsW/?=
 =?us-ascii?Q?6igdZ4uf+cRsIsvoRBOnUN0ptK5DJnSNkjOXSt43OqpdMIRO2gvr/T3znz/c?=
 =?us-ascii?Q?p8xI4gXoo+0CiHbwLrmJ0Z/Eo5WKeaG4amUpu9c+IkF4ePZVbN7X1mCEnDww?=
 =?us-ascii?Q?vzr9V2RLD3UgYIgMhVWTG722lcrin8UZw76n8CycAAfhkKXROed8oTi9rHCw?=
 =?us-ascii?Q?cg29tfoN1F1m5xWQhTCdLzlTRn0yF/pXixYIzBDelN8Qre7H2zTkGGdOM/+I?=
 =?us-ascii?Q?HQavcW3KEA622lda1mwpueMOpniwbS6AV4+y+Gsga9NLcKDHhU0icb2lSFZt?=
 =?us-ascii?Q?bLyLbjEhbyEwvc1F5mIcman0Gi/ICBzXtXhc1rstGpd1R9e7kGuehfxtyFrT?=
 =?us-ascii?Q?kEipLB5ZhnJJ8be2sITqzI9cjsfptypC8lqcIdS+i+7tHb+oo38GNIc5MPF9?=
 =?us-ascii?Q?5rTct67gL+5UDiWKDRLOZ3mOBrQRmCm6pQR5uit7fvbFiltfWbIQQN3L/6ud?=
 =?us-ascii?Q?Gt9wQbBts3Y8lATZEbsyHZzJF0n7yBm4YCdCfQ2OV8ZVc+u8HhrEz69afJVW?=
 =?us-ascii?Q?0t9mEOQ4ri5mrwsOooRg6HrBdJ0uvAiRfPvNGaG6AlR+h5fRXsPatCk4w5HR?=
 =?us-ascii?Q?Ni8V7Z8BmBJcW32IrHqldLqCJ0ppIUX1oVzDS0z7EfDDkDwWfuJc3SJFubNK?=
 =?us-ascii?Q?/4qGQ3p18UoFJTVbXAR2yIVkZ6NOCz/o7Lij3cl1nLEJvPyiwR5eF6bsxeaZ?=
 =?us-ascii?Q?n+Tayuvdtl2oRwsIDIo8aYFSp/JrJqRQ2QNzvPpGKeZOgD3GCSjVSL9HPLi9?=
 =?us-ascii?Q?Fpsm1Nts0lrcQpsPS8unlviL4MKtuJUTZeNVFhtF8kLEZb9wMXS+3dhaFy/c?=
 =?us-ascii?Q?6FfZ00XCeK49vW4K3A8AYHSROQI9JdVpGUSRbW9g2xXiaFjFHHqLr76OJW34?=
 =?us-ascii?Q?qM/QOvcDQ/uV9JV9mX4i31EZGOhx4l7DIeqsAYhAGjylUF7Axy/TATj4Le7O?=
 =?us-ascii?Q?6VV54U+L2FfFQsc+h1OXJyou4+j7r98fKrxPzfbgjZXXWrTkEEiHCQQTySJM?=
 =?us-ascii?Q?NFVU0sca9OKGmSMY7uH/UhkYoiLWgDX0T73CdVxOiQwMggmJYO+Hu8Ra+4Lp?=
 =?us-ascii?Q?iqnRYC9FqA7ZKfS7sugK7qeaVXyVZ0aw8mAnp23yOitlz8uxMRNK/J9Sl80b?=
 =?us-ascii?Q?H5Q0CucdzcJDtFLEVuCgvNvTX12tPzaTJm3xge8+pRw5d+jNcElbqwRvHOwx?=
 =?us-ascii?Q?tyyfyLBrMK6U4unUdMEiM0SjdJUn5OWFZoT+Jy95vltByR/yce1D/1Qf0m2E?=
 =?us-ascii?Q?XjTAxTmOv1hAENjBxo2zj/k6KZeB3qMSRGmE9QuhgfGACL+52suCGdnr13Mo?=
 =?us-ascii?Q?BvbfYmKbNyGksPc/fpaujz8WMjpj4+hlwxkm/XPN5oFCAS+CiKKeVopa+5Mw?=
 =?us-ascii?Q?97bnGao36yZYfqntYSE/sFGn1BOMQa+d+rmZxqesqAnDf3MZu0X0qrPhmTID?=
 =?us-ascii?Q?it91j3GbRHhpn0e/M8iV7r6McHWcQ86Iv8l5gw5tY8O8pGae8tFraZMvsweN?=
 =?us-ascii?Q?6QOsJ+jpoQCLwYx0FVSAE8au0o1p9S36IjpEZkxB18UuTEGmxfkmT6BE5C6i?=
 =?us-ascii?Q?/eESBZBnEr2Hh2RR4Ay+AG949JuM+hrTuhvJQv0I4EYEN+VxFdxtjfKK7NHG?=
 =?us-ascii?Q?ddtYUGlEhp767fcsyWU7sXCfIcQjqY5g814vug9IWQgDdZ2xWSzl?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc4b520-bfbc-46e8-e751-08da240a7f42
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:53.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pROL/w+CLf/ePWcHK9bpCQaBhs6kS2Z5ZJXdV4T9DO3uXWcxIW25RYO5HihsAbZqXnwdZ94GvXYL9AqxCG9FE04ussmAjdQLQkJKvETm+z8=
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

Adds Multi-function devices driver for SMpro co-processor found on the
Mt.Jade hardware reference platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v8:
  + None

Changes in v7:
  + Smpro-mfd now significant changes in compare with simple-mfd-i2c
    driver, remove the copyright note about simple-mfd-i2c    [Quan]
  + Install bus->read/write()  to handle multiple types of bus
    access.                                                   [Quan]
  + Update license to MODULE_LICENSE("GPL")                   [Quan]
  + Add others minor refactor the code                        [Quan]

Changes in v6:
  + Update license part to reflect that this driver is clone from
  simple-mfd-i2c driver [Quan]

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

 drivers/mfd/Kconfig     |  12 ++++
 drivers/mfd/Makefile    |   1 +
 drivers/mfd/smpro-mfd.c | 134 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 drivers/mfd/smpro-mfd.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3b59456f5545..383d0e6cfb91 100644
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
index 858cacf659d6..36f8981cc4fd 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
 
 obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
 obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
+obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
 obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
 
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
new file mode 100644
index 000000000000..485c4f89ebd9
--- /dev/null
+++ b/drivers/mfd/smpro-mfd.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ampere Altra Family SMPro MFD - I2C
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
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
+static int smpro_mfd_write(void *context, const void *data, size_t count)
+{
+	struct device *dev = context;
+	struct i2c_client *i2c = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_master_send(i2c, data, count);
+	if (ret == count)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static int smpro_mfd_read(void *context, const void *reg, size_t reg_size,
+			  void *val, size_t val_size)
+{
+	struct device *dev = context;
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct i2c_msg xfer[2];
+	unsigned char buf[2];
+	int ret;
+
+	xfer[0].addr = i2c->addr;
+	xfer[0].flags = 0;
+
+	buf[0] = *(u8 *)reg;
+	buf[1] = val_size;
+	xfer[0].len = 2;
+	xfer[0].buf = buf;
+
+	xfer[1].addr = i2c->addr;
+	xfer[1].flags = I2C_M_RD;
+	xfer[1].len = val_size;
+	xfer[1].buf = val;
+
+	ret = i2c_transfer(i2c->adapter, xfer, 2);
+	if (ret == 2)
+		return 0;
+	else if (ret < 0)
+		return ret;
+	else
+		return -EIO;
+}
+
+static const struct regmap_bus smpro_regmap_bus = {
+	.read = smpro_mfd_read,
+	.write = smpro_mfd_write,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+};
+
+static bool smpro_mfd_readable_noinc_reg(struct device *dev, unsigned int reg)
+{
+	return  (reg == 0x82 || reg == 0x85 || reg == 0x92 || reg == 0x95 ||
+		 reg == 0xC2 || reg == 0xC5 || reg == 0xD2 || reg == 0xDA);
+}
+
+static const struct regmap_config smpro_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.readable_noinc_reg = smpro_mfd_readable_noinc_reg,
+};
+
+static const struct mfd_cell smpro_devs[] = {
+	MFD_CELL_NAME("smpro-hwmon"),
+	MFD_CELL_NAME("smpro-errmon"),
+	MFD_CELL_NAME("smpro-misc"),
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
+		config = &smpro_regmap_config;
+
+	regmap = devm_regmap_init(&i2c->dev, &smpro_regmap_bus, &i2c->dev, config);
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
+	{ .compatible = "ampere,smpro", .data = &smpro_regmap_config },
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
+MODULE_LICENSE("GPL");
-- 
2.35.1

