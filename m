Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A485B47EB4A
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv0h3Llkz305Z
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SYBfp/m4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.136;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=SYBfp/m4; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKty755jCz2xXZ;
 Fri, 24 Dec 2021 15:15:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kta/unBXwHzTFjPZjyZftPSeZyQ1Xtt5VSnLQWB00Bl7hr5ei3fmgLB1cWGu6lQyJJW8BPWRuW8O8/pWsTX5m5KeRiJHRM5r2MyJyl/T/k1c8sz5fzq4cIRomxSB/EO+5Lrz4n78JozDjfCR0ZUlZBC6rnYhsrxRXNWd5lMz7YhXPkNJXT3AuWS3496QkMyV8EOsqQXyj5B6nU9hXfC3j8w1iakjIO2mYJ3C5RHiFSpaW0BSeXyPphF60MUnZ5HgIKX8ydFrePXYUINkNI683eTjmzYVyZ4ykvxgEuCBeLA+938oqkH2Y7N8w3x8hrVEoj4RPieqsR2d24+NZkK2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLqkXgdQPLBuNBvp8YeS+Y4ND7tkoXKEucTJ7wfjHDc=;
 b=F7fS8xZ+QBZTYj0D/7d9sg4/fXEx6td05CSpwt1YAQm0TiNUqUw1h7F2TkjjUoG0F4UF+BRueNhZJE250MVGtv1rNn3blWngr0GViRTsQYX7dLSJ0MkfUAztIKIKc1HeNoAsM6NSzCWn+XK3wOBP4qUwH7uzB4ghlvpDzzmVvPJH2pZaND+hxZ9KUfL2CMQtrek15SP3ZilrCW8EfMuRwqKbcapTJwSC/OprFLjKCP/I4f5iNfD5tDUw4v/7EXqmAPLWatWXosv5uoDrJxswqjGCco1kkADevICoZlKrkH6LFO/IhDuATLTLfRm3FGUwEz7YUWD5ARNFDv1UNuHCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLqkXgdQPLBuNBvp8YeS+Y4ND7tkoXKEucTJ7wfjHDc=;
 b=SYBfp/m4JXO9UFLC+HfnM0C4+6MRd9aISz9q3jd/+q9vOaCm3zGWSGMbitXZVV2S0FJNRDYUbMkj0vPtaLz08WYCHpTf4mU2ohU5uiBgMcyPYR4vnVcNnPh5YhjgX6BgeQso4gXBG9T3SUPhEpANAq1Qk/bNBnlfkANbeT7T55w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:00 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:14:59 +0000
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
Subject: [PATCH v6 2/9] mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
Date: Fri, 24 Dec 2021 11:13:45 +0700
Message-Id: <20211224041352.29405-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 88ceebcd-2c6c-4e31-0fd2-08d9c693f33e
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB518942AF8AF2CF3C9147CA1DF27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38C6AmF/I0J77iIj7FOtMg5ELSR5bo4uSYnltnTuar5WN/EKPfwNQGJgqh3BAsAmpgbTgkoVskMEKuhBjo1kw/t/PcbPOG4VDpB+S4PrSFhUYqWTYdzXzZkv6vxGNjuIWFdljr6NWonqelqYXiyRtp9aiAcQ31psAm3rvxfKK9eIDuNgsaFimPL4VFw221NUhZD/WFo1zFDhxqMHWlWj5HWI0i8XVR6MFTuNEyNxrcw+G0zbCTSR+GnOr/oliGigrOb/wpz1fGWZL/t1n6UHqpiBzOs8iFGLjhf6390lLenwPe9yowku8gSG0FAj3bZWNopqmc52MptYMw8mGZlhmq5y0Nr5Gr33YLhd0Bo+3bjE9yR9FPuqHgC2QRZRMIFbmD+jppF7Ig7V4fHO8FA8WLZnnf0+PcS7AHqDx6y1c4vCOQw9orNtqZ5Skx+se+/RReJKqKEWhPU8FBt5UeE1CL7LNJy0s7NTssVYzDPfDlZyN8Jy71HfuZwDu8Y2NaEJpAtEAOge9zqYehqkyEwv9reTe7bm1740dh744TXgIeb3EekIU7u57J+fyGg0Sjy37OLkPdhHJ+tqLEw6u2qzPFtiVqYOlebWxT+dnxkbAYPhjKT6X0/BUtFl2zyKW1CvVFLdOvDc6z3ICkPp1O9TdeiaV21AgGbu4jDplj466Zs/ACpYkxRfUAppR4K5KTe/FlDsoQS3apUFDof0I7NLUHbLwgAvj/XF+eBMje5Dav0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFxIwkqK4eBb4HCKmNrGah8zjFfTf01XjUghqdwihBJ61b9w3burAPtxyH+U?=
 =?us-ascii?Q?lkNOG2ftMmQFk94kSpXkHWjBm8ovONrqnnSR1oo0qVphkK5MO9/EnsXzRsqC?=
 =?us-ascii?Q?nBdA2/LcYzoxIwuTQ2HrVjhUObiCRmFfsQSGUc8b5djRKsgVBTabf9bW67Wv?=
 =?us-ascii?Q?ohrygkN3Os7hP/Q93MikjAkxsrzq49k5WPdFxuv3fVumQWIeiD8o/p6sk012?=
 =?us-ascii?Q?N6S1BxmXPc9ommdNehhN5/5mlTDghyJjUUoJoQclJOAYjtMyPkZr/dAQxQWM?=
 =?us-ascii?Q?vdfP94MlYGVwR845eBOOiEODVRsM172UE+uelcDMhAjKE6mJAeQzmrXjH1f1?=
 =?us-ascii?Q?GVILLyqcIReskLJXY2pl65vLqBp3E6DAzWm0svtHiiOgjDhV2R1f+MkUJpWx?=
 =?us-ascii?Q?pH4SakUFmRm66WTuNa/HJHBfR9VvpQ8XOPWN/e3H355lRfLewBoa37Du5/Oa?=
 =?us-ascii?Q?0LxBRF1HFMQ+B+O/CbL4Sd6qwHuGcjtmQgJUcVmEN95f3uqG4r9lx7brsJ6V?=
 =?us-ascii?Q?G7bZjnGH8/LixjkRSk5G8HSXAo2xRw0+0Tkpd5NsHZjMhyuMNsd43tFakRiK?=
 =?us-ascii?Q?AV7K5Z1jiBNtyEM+JWjaaYYv8Bp9Wr/T5L58e1MMFpDkxo86as/w/Ue/lIRo?=
 =?us-ascii?Q?nokEujG6I9RHnP0Pg8Q8o1BzFJHr7nXpETEbl2pVZGXH6rON2Vpv6tXU70Oe?=
 =?us-ascii?Q?USYiQApDneaieND9RA7k9dGLTgK+TOpc+HANv8UbAggWN8Dbpp1ztFDcKsSD?=
 =?us-ascii?Q?U9JTSRJBWGdruTVPztQQQ8P0/3VTjaAW514w+TyFVtbs21Nql23UKP8HVe0G?=
 =?us-ascii?Q?c/1yPX+iVlZ6AodVYuz+q+BCsgfKnKcz2Jp+8hCFfftBdI9aiuig1QtUJa88?=
 =?us-ascii?Q?71XlfYgTd3TG09opv6WK3NjI+tIaLxhZsYZ0kRPdBeI+dKzQB6KIf+SQTZqc?=
 =?us-ascii?Q?rGxTPLYAPBnbm5rqsnHeClpP0C+bEWDaG7b6rWrMgJMsxdWmg7RVKPoI/JeJ?=
 =?us-ascii?Q?ZKngPzgw/WvnJxM5IE5LSRi4zipuU26Pcif6Js2OvmQQKVx3rXrnxtXHdm0M?=
 =?us-ascii?Q?7JsT77NipKaCeZtUfolLl7E1rRTNK2SclVnK3ria1d4yhTgpxIxytUZjVBM5?=
 =?us-ascii?Q?JSG/eHtItNc0SX9CDDKHAolUQMvzAbv/3qkK+PG95G1kT70Kmj7TGyH4BkE4?=
 =?us-ascii?Q?ljxcCK0ebsYyHxSwd2a/P53TUQ37sgJMQ2F2D6lyItuR6wnTxYuPZp0KPCqb?=
 =?us-ascii?Q?yp+UE0loUOag4m/c1wagMjX/IG5VSVKJnIjU1D8jNN6ZGL101Gw7X8bxcqN1?=
 =?us-ascii?Q?dEDCnj/rvw9t3HHOi/fNYlXtAU1X9Bt5Zs0vmpqyTjW4F11gntjCB4V8BbZ3?=
 =?us-ascii?Q?gXpQ3Ar+9dFBpU7O6uYBkgH/kpkRSYP6mXuOG8llTAtHJVNsFRIKUaJ4hWca?=
 =?us-ascii?Q?2/ELCjzLwxQdGde/2iPu7NBGwK7oL0siF19QSDl0hAJbPa3ARzFdNVAOBaZ4?=
 =?us-ascii?Q?2s6AVhV45rJAEU9gxPG0B0d7P29YUXgVkEZwt1I+zybQj+8OATm2yRL1tw6S?=
 =?us-ascii?Q?jJJ2y0gyCfoa3d0ky+RdlSUWL8Uw0JTge/zE73yC2ELTKP78dT9MCsv9zHix?=
 =?us-ascii?Q?mCWZQEyVC5VQHe5DjzCO1B5MqT0SCG98esTu6diDx4bCFtg1C8qx4TNh6GpQ?=
 =?us-ascii?Q?ib/O6p1WeARyCKzHDpQoTNEccRg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ceebcd-2c6c-4e31-0fd2-08d9c693f33e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:14:59.6195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVz/xAMg8WSJxZbxO8yQ4FmNKfmFOxED8KhQOJmhIgbSGGer+4FdEPKzEjhvonOfSc0/mXgGLhwB9WEb+o+rU9vQlFBrh1B3RGMdOhDhjNw=
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

Adds Multi-function devices driver for SMpro co-processor found on the
Mt.Jade hardware reference platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
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

 drivers/mfd/Kconfig     | 12 +++++++
 drivers/mfd/Makefile    |  1 +
 drivers/mfd/smpro-mfd.c | 76 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/mfd/smpro-mfd.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a21cbdf89477..a886da5018b1 100644
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
index 4d53e951a92d..fbcd09dce5ce 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -267,6 +267,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
 
 obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
 obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
+obj-$(CONFIG_MFD_SMPRO)		+= smpro-mfd.o
 obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
 
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
new file mode 100644
index 000000000000..132d4e2dde12
--- /dev/null
+++ b/drivers/mfd/smpro-mfd.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ampere Altra Family SMPro MFD - I2C
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ * Author: Quan Nguyen <quan@os.amperecomputing..com>
+ *
+ * Based on simple-mfd-i2c.c:
+ * Copyright (c) by Michael Walle <michael@walle.cc>
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

