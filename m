Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297B47EB55
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv4d6W90z2ynx
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:20:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SqvvTlOg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.93;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=SqvvTlOg; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2093.outbound.protection.outlook.com [40.107.220.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyV5g2Kz30J9;
 Fri, 24 Dec 2021 15:15:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY9kGnxYGSxaLKQzytZU8asLHzHK0K7mhsjpDbSfFoTdzNJKKFowrdnyu62JoWgKIXZD2n63zOKeuBUvVcLj2yS0aW5cWzzYh3YJnAPa7P1Us663zS45VPlan0xGO6XnWUuTbsIJ1HqHrveG5FoObisua/c/ger1BB9v/3u+WbvFNsCVGfo2U7zaKro4CXaJtmZO1QDh3t0F9QhxZP7RtrU5Qq2vFhP9Az/yqj3qwtH4LzkMiDreeqb+OQ1F3K/s1GH30fH9p+rnkv2n1EqpZnu4h5dG/9Fu6jcCVyUO6hXusxdBcRn34yuOzt06HtRvgRHU8Ad1IsoBuSgqB2gbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlFGJDCTjRvHXJNEBU0LtM+T7wqZYKornvjwo2lDnDI=;
 b=lLw7pcylHKGR6hIiCCVUZ+Qv4WsGRD9x6jLuK/NJbgPX0iMUmxRgOWEpDKGnjQkFLEDtmSc1dXNwJXmMdq41rdi2FuVSwpGbvrU+FFsPRmbWFQeOpHJtQSpBMycjQBV7T/P16/mj9EnbxTurNULK4rSIirH/MZCnQ8F1JSljtq6IRihv2MI8T0Z2cZICsUPxP8wFtNfdoF55hqdukMYM14HJoCPInNEOwtmCrHHw35hHubtf4vJfq6HOGgRxKVwef86Jl9erpYlpvv8U5pAwOTnBtBpFKNFBqFQIh/J/N/5JgALZ6trfiPUu9FICDj8Ut568ajOXvIo4MJuuxhERtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlFGJDCTjRvHXJNEBU0LtM+T7wqZYKornvjwo2lDnDI=;
 b=SqvvTlOgxFZozp7kbT5VIW6/fNvcIJCZfdm8aXjzdICSyGuYi6QSzDJeWQEJTDKbuy8h5eGEeFDmvXX8THy7zekz7Sqheu0cWgdhrM0SIEEU+kZiAzIYgAokuPazolDw1zy29fivWM6IPFnQtY8M84MteUWBsqklU19Gt5HzFMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:23 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:23 +0000
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
Subject: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error monitor
 driver
Date: Fri, 24 Dec 2021 11:13:49 +0700
Message-Id: <20211224041352.29405-7-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 47ab4a83-9595-4db9-abe0-08d9c6940175
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB518990FB0FDB57C73DF47556F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0C0FC6/is7g5e4jOB3unMYJhLjc8LieTbOaQQbrvMM24nmRqjyZPqHk6erV2RDLHHuFLOCOsfIem4se/1cxgamzKaXOgq29GV1WENyWkmpGTnD4iqh+MnS3ZP6K3oDN1bR/Ul2OQk/jN1NFWoXHVwC7YmGZ5/Wyo3UYJIFBkB1MOcFRhkZWchOUYFWWbXWF9ZqLBW/l7IUNcDvIIyj0ezHX3/4k2C6f6g/hLrtD1LdEoPVlBiYhsDL+RTFoKqfjg2T9kqxZdQqkYJ6qklVazbLSxpoPIjOdbcnkn9a5bYp2Q9W3YrTi89KFSNCklN+G3aWkSAMGGJ9YP3ubav8ypSCFmpO43pdEtwfKuGRfPhIU5o8EoAJTGY5GftERp3jRVoRFF7hgIFNuCR3XN/Bz2Xm61yUUc9FFCoZIUa7LjVV1opAtfn9FBYgDNkgEEU8l0TvGbJ7Ahs3tCGFphPO/pVbohwI1CGGFuCpmpgF1dU3z+3mOJZ+87C9hywD1feX+1WS5/W+lACwRz6SaUh4EW0jAV2U0q/W1hNe9bTg5FnnQtRoMMvjFBPv96AmwvynNvEnwgF8XYs60hr5K2KQTCu4aIl7NOtD97Mj6SEOE8NODSfX8mzNgVfdLGiXzGYXTtjhLY0w99vPA0MyGpDJdazVVEltMvpIZs0GeqtIZI3IqBRcAOj5AlqvJdIGA74Fs7RkAF8G7afN+Y+sc/h9PXG9MhcD/dGHfGwOV36c6fboo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(30864003)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e60Wrz9RYGG+SbTXI7okQkaD6eknKnDDHHwB1znEY+W9CDczVlyRT2c9zop6?=
 =?us-ascii?Q?Y6WO887dI3Cwzt23eEtYoU74JlXri7qPlUb2jXcL1vV60/NUVXjtWJPBBLl7?=
 =?us-ascii?Q?rIGjAF+bj7LZBp9xsH95tLHT1UQoH4QyDez2zRDoaVUp8E/CyMGDhuMDYn5m?=
 =?us-ascii?Q?JKNaFdW5IU30et5/MVYWisrQJQUikqqyCXOAL29tzjgtEGqz6LHeOHJkNymo?=
 =?us-ascii?Q?CYuYn7fnhW444tpWOQaoauTGO7XPEcaofXvAUK6lXXNaZBlhSNrF4LCF2dVs?=
 =?us-ascii?Q?T51ZfNH9yGNC9BadDewA3/DyaAGRU+MmKXiJaw4LlDOcHGyvVL3iLCw0UN6b?=
 =?us-ascii?Q?YN8JzLdHzVv9g39h9NJoZnvplPCVRriLE5jnjZq9FW6RixTEsb5Yur03g0DT?=
 =?us-ascii?Q?JWDKw9fW4Oham67q1r9WTySzs0VTcw/7MEuvsi+vGiGEkdg6BjPCy5H7/JjR?=
 =?us-ascii?Q?6LzbUp3jkDO+mi//1BkKbc5PznpcmGjk7spa5Od5GOXO/oFZ6YFozUhu0ciI?=
 =?us-ascii?Q?M4QWOlx+P7Knwr/Uzt+BZGdm7QAmc8u451W4byS5ENoU1udtAZQ62uczRUpg?=
 =?us-ascii?Q?ro9mGh/9thBRH1d94SUgCO/xZJYsd4l8Y4gw9HPNtfE0ZgFAWdTmWX8Ziv2B?=
 =?us-ascii?Q?0lp56eTLJcSiGl2n6CbV+PqfmEGK6V9GSXa88uLnpTB7w8+ZH9B7PX3u3ufD?=
 =?us-ascii?Q?y3tepM8r3HTcAaniaVg3pL2H0WYkM/PnkEDl9V6p/ANNQ8b84ksA1xtBpXg1?=
 =?us-ascii?Q?sLsjSj5+A9JJpivpc3VbKVgB6YTqxtxDu4r6He/Epm4zoD7ptVeZrqfuU1nG?=
 =?us-ascii?Q?XXP9Zl1xwdDvwufkV7ZXCQ5HyUVuJJ0GnFWP++VEaitoWCKG+Ctqq3v1swVW?=
 =?us-ascii?Q?YXqzUsAy3cIZVEQ9UJ8io/fEgJJxjyF/1S9wvXuaKkuu+nPwQwzeduq5vChI?=
 =?us-ascii?Q?+6G+mf2VotwMo1qbnPfibV+Pecjhh1rb7lw9XK3vC1kLBOxjZPswmhUKCf06?=
 =?us-ascii?Q?4nI38U86wb5WcLbYWYKpbse28TetfwaMtvNJRsfEt8vCByCK0nNMeWutJqko?=
 =?us-ascii?Q?i2Vbqrng2Y4+bWI4bX1YGaJiM/Q5ArlHi7Z542Qg8bRV3ODn1xHElT8XT2vC?=
 =?us-ascii?Q?WFfe9Rniql2jc4C0gjbcKFr6egE5KBe2yTco0KLZ66NaEm+MMk+wbxj6Q5Dx?=
 =?us-ascii?Q?2JdvxjtR1tKnKnFjk6BN7LCS5o5TjYldvXZWJjzkl1ho9OHvi3zFmQhvQtX+?=
 =?us-ascii?Q?Ou6KRIvJfBJSbPVIBY0S/3irfqOwgq8GVmd63qz+0T5v1GJGfeMxocUeUKU6?=
 =?us-ascii?Q?cfFmWNn0OGmldj4K1tjUsJgwKjNiaaEIPNcdkBj4zGYe4k1dq47HUabKjJ08?=
 =?us-ascii?Q?TG1/q1C72QvlKvdUeuN7O7lV7ZPgJNr5bUlfKxLphiJI52ljpcXrPOmhXInd?=
 =?us-ascii?Q?6/zqHwSUWoSBAyrH8dC9ORwW6cDWKIqbKjzjPwrfaT/UZPLbjnbI/cZub+9h?=
 =?us-ascii?Q?I7AE+M/7FfWFZuHI9lemU4plikJwdso5I7c4Uw8QSQuIf0NTWVluO/L3AzlN?=
 =?us-ascii?Q?Caljx4HnpEwbi6vG+pZWRiSj0vlZ0Oj7gnUReAoeov931BhMLN/AkURzZjsm?=
 =?us-ascii?Q?YAdRhK8CoDJuS+QGq9jWSqf0JThOEfFm6EIJuOTEV8NYip1FVap3jvqlU3Ah?=
 =?us-ascii?Q?7jErF/88a0cSQxjK+/0iNdZSCY4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ab4a83-9595-4db9-abe0-08d9c6940175
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:23.5021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyS+BNH8XjY0qG5MH4YkMdWqLKyQBD3a9W94H52YoEzQX3pvTV7rFVWTVUagWioBH5iHVXZi+1fpKifPa4J7/dvyePX9Q43E++cfTJYgOt8=
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

This commit adds Ampere's SMpro error monitor driver for monitoring
and reporting RAS-related errors as reported by SMpro co-processor
found on Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Change in v6:
  + First introduced in v6 [Quan]

 drivers/mfd/smpro-mfd.c     |   1 +
 drivers/misc/Kconfig        |   7 +
 drivers/misc/Makefile       |   1 +
 drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
 4 files changed, 580 insertions(+)
 create mode 100644 drivers/misc/smpro-errmon.c

diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
index 132d4e2dde12..a7cd64bf9eaa 100644
--- a/drivers/mfd/smpro-mfd.c
+++ b/drivers/mfd/smpro-mfd.c
@@ -27,6 +27,7 @@ static const struct regmap_config simple_word_regmap_config = {
 
 static const struct mfd_cell smpro_devs[] = {
 	MFD_CELL_NAME("smpro-hwmon"),
+	MFD_CELL_NAME("smpro-errmon"),
 };
 
 static int smpro_mfd_probe(struct i2c_client *i2c)
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 0f5a49fc7c9e..0cbd8a2561a7 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -176,6 +176,13 @@ config SGI_XP
 	  this feature will allow for direct communication between SSIs
 	  based on a network adapter and DMA messaging.
 
+config SMPRO_ERRMON
+	tristate "Ampere Computing SMPro error monitor driver"
+	depends on MFD_SMPRO || COMPILE_TEST
+	help
+	  If you say yes here you get support for error monitor function
+	  provides by Ampere Computing's SoC with SMpro processor.
+
 config CS5535_MFGPT
 	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
 	depends on MFD_CS5535
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index a086197af544..8ec9961b941b 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
 obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
 obj-$(CONFIG_SGI_XP)		+= sgi-xp/
 obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
+obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
 obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
 obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
 obj-$(CONFIG_HP_ILO)		+= hpilo.o
diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
new file mode 100644
index 000000000000..d694ebb06977
--- /dev/null
+++ b/drivers/misc/smpro-errmon.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMpro Error Monitoring Driver
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* GPI RAS Error Registers */
+#define GPI_RAS_ERR		0x7E
+
+/* Core and L2C Error Registers */
+#define CORE_CE_ERR_CNT		0x80
+#define CORE_CE_ERR_LEN		0x81
+#define CORE_CE_ERR_DATA	0x82
+#define CORE_UE_ERR_CNT		0x83
+#define CORE_UE_ERR_LEN		0x84
+#define CORE_UE_ERR_DATA	0x85
+
+/* Memory Error Registers */
+#define MEM_CE_ERR_CNT		0x90
+#define MEM_CE_ERR_LEN		0x91
+#define MEM_CE_ERR_DATA		0x92
+#define MEM_UE_ERR_CNT		0x93
+#define MEM_UE_ERR_LEN		0x94
+#define MEM_UE_ERR_DATA		0x95
+
+/* RAS Error/Warning Registers */
+#define ERR_SMPRO_TYPE		0xA0
+#define ERR_PMPRO_TYPE		0xA1
+#define ERR_SMPRO_INFO_LO	0xA2
+#define ERR_SMPRO_INFO_HI	0xA3
+#define ERR_SMPRO_DATA_LO	0xA4
+#define ERR_SMPRO_DATA_HI	0xA5
+#define WARN_SMPRO_INFO_LO	0xAA
+#define WARN_SMPRO_INFO_HI	0xAB
+#define ERR_PMPRO_INFO_LO	0xA6
+#define ERR_PMPRO_INFO_HI	0xA7
+#define ERR_PMPRO_DATA_LO	0xA8
+#define ERR_PMPRO_DATA_HI	0xA9
+#define WARN_PMPRO_INFO_LO	0xAC
+#define WARN_PMPRO_INFO_HI	0xAD
+
+/* PCIE Error Registers */
+#define PCIE_CE_ERR_CNT		0xC0
+#define PCIE_CE_ERR_LEN		0xC1
+#define PCIE_CE_ERR_DATA	0xC2
+#define PCIE_UE_ERR_CNT		0xC3
+#define PCIE_UE_ERR_LEN		0xC4
+#define PCIE_UE_ERR_DATA	0xC5
+
+/* Other Error Registers */
+#define OTHER_CE_ERR_CNT	0xD0
+#define OTHER_CE_ERR_LEN	0xD1
+#define OTHER_CE_ERR_DATA	0xD2
+#define OTHER_UE_ERR_CNT	0xD8
+#define OTHER_UE_ERR_LEN	0xD9
+#define OTHER_UE_ERR_DATA	0xDA
+
+/* Event Source Registers */
+#define EVENT_SRC1		0x62
+#define EVENT_SRC2		0x63
+
+/* Event Data Registers */
+#define VRD_WARN_FAULT_EVENT_DATA	0x78
+#define VRD_HOT_EVENT_DATA		0x79
+#define DIMM_HOT_EVENT_DATA		0x7A
+#define DIMM_2X_REFRESH_EVENT_DATA	0x96
+
+#define MAX_READ_BLOCK_LENGTH	48
+#define NUM_I2C_MESSAGES	2
+#define MAX_READ_ERROR		35
+#define MAX_MSG_LEN		128
+
+#define RAS_SMPRO_ERRS		0
+#define RAS_PMPRO_ERRS		1
+
+enum RAS_48BYTES_ERR_TYPES {
+	CORE_CE_ERRS,
+	CORE_UE_ERRS,
+	MEM_CE_ERRS,
+	MEM_UE_ERRS,
+	PCIE_CE_ERRS,
+	PCIE_UE_ERRS,
+	OTHER_CE_ERRS,
+	OTHER_UE_ERRS,
+	NUM_48BYTES_ERR_TYPE,
+};
+
+struct smpro_error_hdr {
+	u8 err_count;	/* Number of the RAS errors */
+	u8 err_len;	/* Number of data bytes */
+	u8 err_data;	/* Start of 48-byte data */
+};
+
+/*
+ * Included Address of registers to get Count, Length of data and Data
+ * of the 48 bytes error data
+ */
+struct smpro_error_hdr smpro_error_table[NUM_48BYTES_ERR_TYPE] = {
+	{CORE_CE_ERR_CNT, CORE_CE_ERR_LEN, CORE_CE_ERR_DATA},
+	{CORE_UE_ERR_CNT, CORE_UE_ERR_LEN, CORE_UE_ERR_DATA},
+	{MEM_CE_ERR_CNT, MEM_CE_ERR_LEN, MEM_CE_ERR_DATA},
+	{MEM_UE_ERR_CNT, MEM_UE_ERR_LEN, MEM_UE_ERR_DATA},
+	{PCIE_CE_ERR_CNT, PCIE_CE_ERR_LEN, PCIE_CE_ERR_DATA},
+	{PCIE_UE_ERR_CNT, PCIE_UE_ERR_LEN, PCIE_UE_ERR_DATA},
+	{OTHER_CE_ERR_CNT, OTHER_CE_ERR_LEN, OTHER_CE_ERR_DATA},
+	{OTHER_UE_ERR_CNT, OTHER_UE_ERR_LEN, OTHER_UE_ERR_DATA},
+};
+
+/*
+ * List of SCP registers which are used to get
+ * one type of RAS Internal errors.
+ */
+struct smpro_int_error_hdr {
+	u8 err_type;
+	u8 err_info_low;
+	u8 err_info_high;
+	u8 err_data_high;
+	u8 err_data_low;
+	u8 warn_info_low;
+	u8 warn_info_high;
+};
+
+struct smpro_int_error_hdr list_smpro_int_error_hdr[2] = {
+	{
+	 ERR_SMPRO_TYPE,
+	 ERR_SMPRO_INFO_LO, ERR_SMPRO_INFO_HI,
+	 ERR_SMPRO_DATA_LO, ERR_SMPRO_DATA_HI,
+	 WARN_SMPRO_INFO_LO, WARN_SMPRO_INFO_HI
+	},
+	{
+	 ERR_PMPRO_TYPE,
+	 ERR_PMPRO_INFO_LO, ERR_PMPRO_INFO_HI,
+	 ERR_PMPRO_DATA_LO, ERR_PMPRO_DATA_HI,
+	 WARN_PMPRO_INFO_LO, WARN_PMPRO_INFO_HI
+	},
+};
+
+struct smpro_errmon {
+	struct regmap *regmap;
+};
+
+enum EVENT_TYPES {
+	VRD_WARN_FAULT_EVENTS,
+	VRD_HOT_EVENTS,
+	DIMM_HOT_EVENTS,
+	NUM_EVENTS_TYPE,
+};
+
+struct smpro_event_hdr {
+	u8 event_src;	/* Source register of event type */
+	u8 event_data;	/* Data register of event type */
+};
+
+/* Included Address of event source and data registers */
+struct smpro_event_hdr smpro_event_table[NUM_EVENTS_TYPE] = {
+	{EVENT_SRC1, VRD_WARN_FAULT_EVENT_DATA},
+	{EVENT_SRC1, VRD_HOT_EVENT_DATA},
+	{EVENT_SRC2, DIMM_HOT_EVENT_DATA}
+};
+
+static int read_i2c_block_data(struct i2c_client *client, u16 address, u16 length, u8 *data)
+{
+	unsigned char outbuf[MAX_READ_BLOCK_LENGTH];
+	unsigned char inbuf[2];
+	struct i2c_msg msgs[2];
+	ssize_t ret;
+
+	inbuf[0] = (address & 0xff);
+	inbuf[1] = length;
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = 2;
+	msgs[0].buf = inbuf;
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = (client->flags  & I2C_M_TEN) | I2C_M_RD;
+	msgs[1].len = length;
+	msgs[1].buf = outbuf;
+
+	ret = i2c_transfer(client->adapter, msgs, NUM_I2C_MESSAGES);
+	if (ret < 0)
+		return ret;
+
+	if (ret != NUM_I2C_MESSAGES)
+		return -EIO;
+
+	memcpy(data, outbuf, length);
+
+	return length;
+}
+
+static int errmon_read_block(struct regmap *map, u16 address, u16 length, u8 *data)
+{
+	struct i2c_client *client = to_i2c_client(regmap_get_device(map));
+	int ret;
+
+	regmap_acquire_lock(map);
+
+	ret = read_i2c_block_data(client, address, length, data);
+
+	regmap_release_lock(map);
+
+	return ret;
+}
+
+static ssize_t smpro_event_data_read(struct device *dev,
+				     struct device_attribute *da, char *buf,
+				     int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	unsigned char msg[MAX_MSG_LEN] = {'\0'};
+	struct smpro_event_hdr event_info;
+	s32 event_data = 0;
+	int ret;
+
+	*buf = 0;
+	if (channel >= NUM_EVENTS_TYPE)
+		goto done;
+
+	event_info = smpro_event_table[channel];
+	ret = regmap_read(errmon->regmap, event_info.event_data, &event_data);
+	if (ret)
+		goto done;
+
+	ret = scnprintf(msg, MAX_MSG_LEN, "%02x %04x\n", channel, event_data);
+	strncat(buf, msg, ret);
+done:
+	return strlen(buf);
+}
+
+static ssize_t smpro_error_data_read(struct device *dev, struct device_attribute *da,
+				     char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	unsigned char err_data[MAX_READ_BLOCK_LENGTH];
+	unsigned char msg[MAX_MSG_LEN] = {'\0'};
+	struct smpro_error_hdr err_info;
+	s32 err_count = 1, err_length = 0;
+	u8 i = 0;
+	int len;
+	int ret;
+
+	*buf = 0;
+	if (channel >= NUM_48BYTES_ERR_TYPE)
+		goto done;
+
+	err_info = smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info.err_count, &err_count);
+	if (ret || err_count <= 0)
+		goto done;
+
+	/* Bit 8 indentifies the overflow status of one error type */
+	if (err_count & BIT(8)) {
+		len = scnprintf(msg, MAX_MSG_LEN,
+				"%02x %02x %04x %08x %016llx %016llx %016llx %016llx %016llx\n",
+				0xFF, 0xFF, 0, 0, 0LL, 0LL, 0LL, 0LL, 0LL);
+		strncat(buf, msg, len);
+	}
+
+	/* Error count is the low byte */
+	err_count = err_count & 0xff;
+
+	if (err_count > MAX_READ_ERROR)
+		err_count = MAX_READ_ERROR;
+
+	for (i = 0; i < err_count; i++) {
+		ret = regmap_read(errmon->regmap, err_info.err_len, &err_length);
+		if (ret || err_length <= 0)
+			break;
+
+		if (err_length > MAX_READ_BLOCK_LENGTH)
+			err_length = MAX_READ_BLOCK_LENGTH;
+
+		ret = errmon_read_block(errmon->regmap, err_info.err_data, err_length, err_data);
+		if (ret < 0)
+			break;
+		/*
+		 * The output of Core/Memory/PCIe/Others UE/CE errors follows below format:
+		 * <Error Type>  <Error SubType>  <Instance>  <Error Status> \
+		 * <Error Address>  <Error Misc 0> <Error Misc 1> <Error Misc2> <Error Misc 3>
+		 * Where:
+		 *  + Error Type: The hardwares cause the errors. (1 byte)
+		 *  + SubType: Sub type of error in the specified hardware error. (1 byte)
+		 *  + Instance: Combination of the socket, channel,
+		 *    slot cause the error. (2 bytes)
+		 *  + Error Status: Encode of error status. (4 bytes)
+		 *  + Error Address: The address in device causes the errors. (8 bytes)
+		 *  + Error Misc 0/1/2/3: Addition info about the errors. (8 bytes for each)
+		 * Reference Altra SOC BMC Interface specification.
+		 */
+		len = scnprintf(msg, MAX_MSG_LEN,
+				"%02x %02x %04x %08x %016llx %016llx %016llx %016llx %016llx\n",
+				err_data[0], err_data[1], *(u16 *)&err_data[2],
+				*(u32 *)&err_data[4], *(u64 *)&err_data[8],
+				*(u64 *)&err_data[16], *(u64 *)&err_data[24],
+				*(u64 *)&err_data[32], *(u64 *)&err_data[40]);
+
+		/* go to next error */
+		ret = regmap_write(errmon->regmap, err_info.err_count, 0x100);
+		if (ret)
+			break;
+
+		/* add error message to buffer */
+		strncat(buf, msg, len);
+	}
+done:
+	return strlen(buf);
+}
+
+static s32 smpro_internal_err_get_info(struct regmap *regmap, u8 addr, u8 addr1, u8 addr2, u8 addr3,
+				       u8 subtype, char *buf)
+{
+	unsigned int ret_hi = 0, ret_lo = 0, data_lo = 0, data_hi = 0;
+	int ret;
+
+	ret = regmap_read(regmap, addr, &ret_lo);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(regmap, addr1, &ret_hi);
+	if (ret)
+		return ret;
+
+	if (addr2 != 0xff) {
+		ret = regmap_read(regmap, addr2, &data_lo);
+		if (ret)
+			return ret;
+		ret = regmap_read(regmap, addr3, &data_hi);
+		if (ret)
+			return ret;
+	}
+	/*
+	 * Output format:
+	 * <errType> <image> <dir> <Location> <errorCode> <data>
+	 * Where:
+	 *   + errType: SCP Error Type (3 bits)
+	 *      1: Warning
+	 *      2: Error
+	 *      4: Error with data
+	 *   + image: SCP Image Code (8 bits)
+	 *   + dir: Direction (1 bit)
+	 *      0: Enter
+	 *      1: Exit
+	 *   + location: SCP Module Location Code (8 bits)
+	 *   + errorCode: SCP Error Code (16 bits)
+	 *   + data : Extensive data (32 bits)
+	 *      All bits are 0 when errType is warning or error.
+	 */
+	return scnprintf(buf, MAX_MSG_LEN, "%01x %02x %01x %02x %04x %04x%04x\n",
+			 subtype, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
+			 ret_hi & 0xff, ret_lo, data_hi, data_lo);
+}
+
+static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
+				       char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr err_info;
+	unsigned char msg[MAX_MSG_LEN] = {'\0'};
+	unsigned int err_type;
+	unsigned int value;
+	int ret = 0;
+
+	*buf = 0;
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &value);
+	if (ret)
+		goto done;
+
+	if (!((channel == RAS_SMPRO_ERRS && (value & BIT(0))) ||
+	      (channel == RAS_PMPRO_ERRS && (value & BIT(1)))))
+		goto done;
+
+	err_info = list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info.err_type, &err_type);
+	if (ret)
+		goto done;
+
+	/* Warning type */
+	if (err_type & BIT(0)) {
+		ret = smpro_internal_err_get_info(errmon->regmap, err_info.warn_info_low,
+						  err_info.warn_info_high, 0xff, 0xff, 1, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+
+	/* Error with data type */
+	if (err_type & BIT(2)) {
+		ret = smpro_internal_err_get_info(errmon->regmap, err_info.err_info_low,
+						  err_info.err_info_high, err_info.err_data_low,
+						  err_info.err_data_high, 4, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+	/* Error type */
+	else if (err_type & BIT(1)) {
+		ret = smpro_internal_err_get_info(errmon->regmap, err_info.err_info_low,
+						  err_info.err_info_high, 0xff, 0xff, 2, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+
+	/* clear the read errors */
+	regmap_write(errmon->regmap, err_info.err_type, err_type);
+
+done:
+	return strlen(buf);
+}
+
+static int errors_core_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, CORE_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_core_ce);
+
+static int errors_core_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, CORE_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_core_ue);
+
+static int errors_mem_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, MEM_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_mem_ce);
+
+static int errors_mem_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, MEM_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_mem_ue);
+
+static int errors_pcie_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, PCIE_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pcie_ce);
+
+static int errors_pcie_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, PCIE_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pcie_ue);
+
+static int errors_other_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, OTHER_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_other_ce);
+
+static int errors_other_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, OTHER_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_other_ue);
+
+static int errors_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(errors_smpro);
+
+static int errors_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pmpro);
+
+static int event_vrd_warn_fault_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_event_data_read(dev, da, buf, VRD_WARN_FAULT_EVENTS);
+}
+static DEVICE_ATTR_RO(event_vrd_warn_fault);
+
+static int event_vrd_hot_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_event_data_read(dev, da, buf, VRD_HOT_EVENTS);
+}
+static DEVICE_ATTR_RO(event_vrd_hot);
+
+static int event_dimm_hot_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_event_data_read(dev, da, buf, DIMM_HOT_EVENTS);
+}
+static DEVICE_ATTR_RO(event_dimm_hot);
+
+static struct attribute *smpro_errmon_attrs[] = {
+	&dev_attr_errors_core_ce.attr,
+	&dev_attr_errors_core_ue.attr,
+	&dev_attr_errors_mem_ce.attr,
+	&dev_attr_errors_mem_ue.attr,
+	&dev_attr_errors_pcie_ce.attr,
+	&dev_attr_errors_pcie_ue.attr,
+	&dev_attr_errors_other_ce.attr,
+	&dev_attr_errors_other_ue.attr,
+	&dev_attr_errors_smpro.attr,
+	&dev_attr_errors_pmpro.attr,
+	&dev_attr_event_vrd_warn_fault.attr,
+	&dev_attr_event_vrd_hot.attr,
+	&dev_attr_event_dimm_hot.attr,
+	NULL
+};
+
+static const struct attribute_group smpro_errmon_attr_group = {
+	.attrs = smpro_errmon_attrs
+};
+
+static int smpro_errmon_probe(struct platform_device *pdev)
+{
+	struct smpro_errmon *errmon;
+	int ret;
+
+	errmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_errmon), GFP_KERNEL);
+	if (!errmon)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, errmon);
+
+	errmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!errmon->regmap)
+		return -ENODEV;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &smpro_errmon_attr_group);
+	if (ret)
+		dev_err(&pdev->dev, "SMPro errmon sysfs registration failed\n");
+
+	return 0;
+}
+
+static int smpro_errmon_remove(struct platform_device *pdev)
+{
+	sysfs_remove_group(&pdev->dev.kobj, &smpro_errmon_attr_group);
+	pr_info("SMPro errmon sysfs entries removed");
+
+	return 0;
+}
+
+static struct platform_driver smpro_errmon_driver = {
+	.probe          = smpro_errmon_probe,
+	.remove         = smpro_errmon_remove,
+	.driver = {
+		.name   = "smpro-errmon",
+	},
+};
+
+module_platform_driver(smpro_errmon_driver);
+
+MODULE_AUTHOR("Tung Nguyen <tung.nguyen@amperecomputing.com>");
+MODULE_AUTHOR("Thinh Pham <thinh.pham@amperecomputing.com>");
+MODULE_AUTHOR("Hoang Nguyen <hnguyen@amperecomputing.com>");
+MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Ampere Altra SMpro driver");
+MODULE_LICENSE("GPL");
-- 
2.28.0

