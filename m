Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8250AE12
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:52:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzTS388yz3bYw
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:52:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ifYoutSa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::70f;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ifYoutSa; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNb5SmBz3bY6
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnZZYjUNUjNtUNIzzaIrn0lkzXeSiKcXuHDD8x5SXsvFmvTTM5JNDTWdweMOXF7Gy0lHfvm7H9MvwkN5TMU4JucdiVBO6sjNG/pkt7fF0QakenFZfYBy4OGJbPh59EsXyqeTutKQNr5HLDTpc8fOPaNKUl/5IxtOyuiXy9qVk9Z3+IBalPG46et2bJbiHYDsTL8gtyz4C3r+4wwJzNwVzxQ34+rwFzAMqaSojTfzhyxd4/s2AA0hzs+G2g9I6F1wCOwYflS26I064Bf2inDZIwsbowVjA072QL6K63Znl4peW6g+4zjfkwyvben6B3eBuANV+ndx3o/HG2rVn04iaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPLBQJxKYqwOxcgTU8j2CKy193bPvhctvPDUM3mTFGA=;
 b=cFhNL5ndlbkhFuQNzsOeZGW2SbWicYvoaq1yHRChirlj6IzeD/ZJbL8kA5DktbP1+HZl5Q5cp/65V8KqFAxD5xdqugdAKpqDvoClFz4XKoMax5givJ1WUQS8kjRuLQ4/Fol112jyVmroVRV6lcgaqn2W4AnO0ZhCFf33BQx2DnetR6J7fFC6u9v93NPAxI1go9qCcw9RmD/S60qwSFm8VAkDuvJF14JgP+Eo7deKNvTbIfRjvVTf3x0Y61fnW5VYwleIpPwy/70//M5ME5M+0jQyogPgNsWIf/jk5NIS20kWpH30j2t9uouDfoxEQ1xfEdt6+Gq+zascGN4QTc9d0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPLBQJxKYqwOxcgTU8j2CKy193bPvhctvPDUM3mTFGA=;
 b=ifYoutSazFiEoS0TUJIrVQ1B2QudxvytXqcQ08iYv9wveLo0Rm+LM6n+chRHMn31Ny2DiOfALFswCm5Xh6YuBtjcYymHuKOvXdMhwdrCBW/jJs5thr46RzDaCsOUY4GJhbaiEw/a/F3RHQ++WeiqbJevfys5c/gqgOqBlVga0mo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6293.prod.exchangelabs.com (2603:10b6:510:13::6) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:38 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:38 +0000
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
Subject: [PATCH v8 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc driver
Date: Fri, 22 Apr 2022 09:46:49 +0700
Message-Id: <20220422024653.2199489-6-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 21e7844d-07d0-4634-ba23-08da240a765f
X-MS-TrafficTypeDiagnostic: PH0PR01MB6293:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB6293D813830F73A0E2464E10F2F79@PH0PR01MB6293.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 92i4RmQI5eVycWNYUujN4ep+ONtkkAvqwxv42R5e8QNX7sSgfDwOB+XFxPFebN6Qw/PoRx/Mzy1Xs7o7IxYGghvKZ330bvXotNoUTFYzielYhDcJlNRqMG1DgZZXFIWSUuxHzpkYzEbz1D3XTaP5eoRAR/Cfjo7HmQMZk6t2nkf5tlthLTZE8qX0rcWuR5u+70/EK6iIqX3If1t+P233A2CF+RpsQGHf8yLsM0knUP9A45PL51ZR6HSuoqJnhnfDEfbRQgEXbqIqhzWgQU6oJeI5BYR9fJUNxk5ljk0wP2xTkaSRHynh1lSkKvzh6v7oqdM7O8RFrpjsX2rmdnYcYhU7yOqCuhY9VmHnp8trTbUO1vB2qs7lvJ4qlpV3SGnW43HV5e+2kCNNKtdeKAJ5EqhvlGdHqtdL0O8RxrpiLFn2TYTu8cdDYcdwpRHQqju9+2z/Mi/lAPKoC4G+xbr7hu9e+PG7Y0eWVtX1UmBgPsc9rj3QP1e/vd0duA1QX7iof6xErN3Hx6KmaniepupD5o+fg2gO62pgBlNQKxVhBISkQyjWTFZXTA6iREPKMf/VvKCNR+TU98Qqx+A4fWa8Sp1T5z36BTUzVsnnm1kqWHd6HdFwa4+3M3Ki1Y0zaP+/s/7wTcJt5HKzwZWWGwvZ1++cx/gcgPQhBWAhXwDzuLxYk9P5qjA/7TogWWfz4sZMppeM2nMXzWSJJwZVVasDa04w9ZktozgX+vwtgllm+i4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66476007)(66556008)(7416002)(66946007)(2616005)(1076003)(107886003)(6512007)(26005)(8676002)(83380400001)(52116002)(6506007)(38350700002)(4326008)(921005)(54906003)(110136005)(38100700002)(86362001)(2906002)(6666004)(8936002)(316002)(5660300002)(508600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nEynoEkmneOzZ30wjLrKh6eMmd4hXoVYWcWiA32zKqyfWgevVqwvXgxVkIND?=
 =?us-ascii?Q?xUGVRMQJorRsuOn7zW+SK14PcuXCldysrAhfyrbH+WN83rwXSTBAM3MWZb9e?=
 =?us-ascii?Q?Qv8aTHqIRs3Sz9UZiZFRtxo2eHANDgYoUBbXvazFnTj4f/EYSntJfMaeYL+T?=
 =?us-ascii?Q?tbTUJfRxRoxuqyE+SKGNsHKNKDjM6VdQblcsYjJK/a8+jnc/sbRCjN8JVBLe?=
 =?us-ascii?Q?pTLFsJLcsuodZQaOmR0g7tckKo+JfNCa1V5UPL6jQmqkEFcLGIg5PjePcxLx?=
 =?us-ascii?Q?8Inh21Vy66xo2eoCCELXuL1cDxovOEltnytYg4pHnEFAiQ2hg8exYVVZ/ZGg?=
 =?us-ascii?Q?pykC9s0yFLaz2KUYVLVqzQwG/7h5SMWdBilAJOK1AqGz2NAEeacubt5GjNh9?=
 =?us-ascii?Q?W0GhotyqRYu8mll9d7MvvR28HiGar+yHuZ2gvyBQxAkXm8QTtalcsrxhZ5aG?=
 =?us-ascii?Q?tbhphC9QT6rAHdstyjlUe7vmw2V8LW1kD9TBK3wZTmHw0j9LrQ+BuBxmYp2d?=
 =?us-ascii?Q?bKQPbujHICoqDeXHuNNHTQBA9LWWvhn0L0IhVSbT/9k5oNEn9vhmwfIE2r0M?=
 =?us-ascii?Q?/Rl+/qiAFzV/FpedWdrFvLNC2fqyPxcEbAd48sSpdjf265mj5rDZ4CGSVsDh?=
 =?us-ascii?Q?vHTXYlGOqPVgHvb8BFX9nBQgawsyAcqeqTOa7CtRdKwEm6oBaFy87zrt/z6v?=
 =?us-ascii?Q?A5mwrMzFryeb9ClVPj8F9xBhsFGWOF4Idl3rfrmAFhzhQBlptlzbF8eM8F+O?=
 =?us-ascii?Q?xHuZL362rQbxKRg1Z/DHMC0QCKC6vrmncCoRddkihwHg80aldgVzxhEtw6qj?=
 =?us-ascii?Q?VzYeOkBL6HRxDiHfNI2FNV9gXOi6WtaroMS0Pp0a5sqVlQhFkYAuza9ZlnSK?=
 =?us-ascii?Q?11g8yKPSLZIbWrNTX1iv63YmruQl+vc6N9anK6PH62NVvHYuyfTMn7/ZW51V?=
 =?us-ascii?Q?br1wJz+8Gw5Q9WybdGtuzbcl2jIb28XbxgultberY2lLJPudlVv+ivR6tgjQ?=
 =?us-ascii?Q?RCG/EUKKsN0tlAe5S2iXKlaYFpvHD2b3vqCxKFtg7sSButOK/XjBtehRnhwH?=
 =?us-ascii?Q?ZTgy6jpzIdBURZ1/+y535hL820GtWgI8sPjK2ka9MVQG0MG9N7HdtCIC+Ptc?=
 =?us-ascii?Q?faA69iz+CCcCHIw0c7znmtzLZGmXaEApLucB8TxxErFMrd6N2BaWXTR9Io9a?=
 =?us-ascii?Q?tfht6z0RpT9Mm2SGhhcqaT08v2uiu5vvfaCUFTwqo7iff0MZy6X62mVnIVTB?=
 =?us-ascii?Q?yL1rZyMazr5ipHZL1wxOoY2hdoQJCHYGe3Uymuvils86vVTpAyq6wGPOvbyM?=
 =?us-ascii?Q?7/GUg2W5Q91w4x6N6jcq30PeI0MomDhtXLbDm3Ym1O/JxqsmAAMao3DY9dGH?=
 =?us-ascii?Q?3Lz9wa1DEHuaFKsaregGSPoi0Xkwes+yHZ26GuLxAe+iqeU5wpXIaLAntscy?=
 =?us-ascii?Q?bUdZeiIuSTCOU+0om4lej99kc+tL9mGSvoaJMwuaFILeIo/c4dMnXeTLGyGk?=
 =?us-ascii?Q?ho9FJC+xGc0xVIXF2ldLSTtsTx5PCebbojiMf2uSHpKokXlaYT9nZZ1WtbEO?=
 =?us-ascii?Q?U1MgevSKZWPeIZZm1hF3j38a+JLCb/EDOWLGnJUJn5r4MkUCp15pLCTsPjly?=
 =?us-ascii?Q?mQ3TFbPm2aqnb85pEmHgsIKYW1592IYO/vh5zvKOayBs8qflWTpFfVT+VfSY?=
 =?us-ascii?Q?Q+scXJBP3dPkVxqE1UsJsgmnNHM1N2hO5Pug558H0RsQM3guPo4GjQ1k1RBt?=
 =?us-ascii?Q?TxIwlC7AfBpoEXZ5n5IQrJrd5F8Ne4pTxEdChaHK4kdyCkZdD0TO?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e7844d-07d0-4634-ba23-08da240a765f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:38.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nykhc5I5j/Juy8AeQRrFiXmc1Aicm8/+OeTBiYvTC5ccOem19Nx38TBy62k7JytSqosA+DJGpsq9CwhCubZ+4KDU/+fPFKcTgqmxwRhOnT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6293
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

This commit adds driver support for accessing various information
reported by Ampere's SMpro co-processor such as Boot Progress and
other miscellaneous data.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v8:
  + Update wording for SMPRO_MISC in Kconfig file           [Quan]
  + Switch to use sysfs_emit()                              [Quan]

Changes in v7:
  + Fix wrong return type of *_show/store()
  functions                                    [kernel robot test]
  + Adjust patch order to remove dependence with
  smpro-mfd                                            [Lee Jones]

Changes in v6:
  + First introduced in v6 [Quan]

 drivers/misc/Kconfig      |  10 +++
 drivers/misc/Makefile     |   1 +
 drivers/misc/smpro-misc.c | 161 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/misc/smpro-misc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 9fbe6797c440..368fbe73853e 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -188,6 +188,16 @@ config SMPRO_ERRMON
 	  To compile this driver as a module, say M here. The driver will be
 	  called smpro-errmon.
 
+config SMPRO_MISC
+	tristate "Ampere Computing SMPro miscellaneous driver"
+	depends on MFD_SMPRO || COMPILE_TEST
+	help
+	  Say Y here to get support for the SMpro error miscellalenous function
+	  provided by Ampere Computing's Altra and Altra Max SoCs.
+
+	  To compile this driver as a module, say M here. The driver will be
+	  called smpro-misc.
+
 config CS5535_MFGPT
 	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
 	depends on MFD_CS5535
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 483308a6e113..e61e462924d0 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
 obj-$(CONFIG_SGI_XP)		+= sgi-xp/
 obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
 obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
+obj-$(CONFIG_SMPRO_MISC)	+= smpro-misc.o
 obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
 obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
 obj-$(CONFIG_HP_ILO)		+= hpilo.o
diff --git a/drivers/misc/smpro-misc.c b/drivers/misc/smpro-misc.c
new file mode 100644
index 000000000000..4b98098ace8f
--- /dev/null
+++ b/drivers/misc/smpro-misc.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMpro Misc Driver
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
+ */
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* Boot Stage/Progress Registers */
+#define BOOTSTAGE_SELECT	0xB0
+#define BOOTSTAGE_STATUS_LO	0xB1
+#define BOOTSTAGE_CUR_STAGE	0xB2
+#define BOOTSTAGE_STATUS_HI	0xB3
+
+/* SOC State Registers */
+#define SOC_POWER_LIMIT		0xE5
+
+struct smpro_misc {
+	struct regmap *regmap;
+};
+
+static ssize_t boot_progress_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct smpro_misc *misc = dev_get_drvdata(dev);
+	u32 boot_progress;
+	u8 current_stage;
+	u8 boot_status;
+	u8 boot_stage;
+	u32 select;
+	u32 reg_lo;
+	u32 reg;
+	int ret;
+
+	/* Read current boot stage */
+	ret = regmap_read(misc->regmap, BOOTSTAGE_CUR_STAGE, &reg);
+	if (ret)
+		return ret;
+
+	current_stage = reg & 0xff;
+
+	/* Read the boot progress */
+	ret = regmap_read(misc->regmap, BOOTSTAGE_SELECT, &select);
+	if (ret)
+		return ret;
+
+	boot_stage = (select >> 8) & 0xff;
+	boot_status = select & 0xff;
+
+	if (boot_stage > current_stage)
+		return -EINVAL;
+
+	ret = regmap_read(misc->regmap,	BOOTSTAGE_STATUS_LO, &reg_lo);
+	if (!ret)
+		ret = regmap_read(misc->regmap, BOOTSTAGE_STATUS_HI, &reg);
+	if (ret)
+		return ret;
+
+	boot_progress = swab16(reg) << 16 | swab16(reg_lo);
+
+	/* Tell firmware to provide next boot stage next time */
+	if (boot_stage < current_stage) {
+		ret = regmap_write(misc->regmap, BOOTSTAGE_SELECT, ((select & 0xff00) | 0x1));
+		if (ret)
+			return ret;
+	}
+
+	return sysfs_emit(buf, "%02x%02x%08x\n", boot_stage, boot_status, boot_progress);
+}
+
+static DEVICE_ATTR_RO(boot_progress);
+
+static ssize_t soc_power_limit_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	struct smpro_misc *misc = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(misc->regmap, SOC_POWER_LIMIT, &value);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+static ssize_t soc_power_limit_store(struct device *dev, struct device_attribute *da,
+				     const char *buf, size_t count)
+{
+	struct smpro_misc *misc = dev_get_drvdata(dev);
+	unsigned long val;
+	s32 ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(misc->regmap, SOC_POWER_LIMIT, (unsigned int)val);
+	if (ret)
+		return -EPROTO;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(soc_power_limit);
+
+static struct attribute *smpro_misc_attrs[] = {
+	&dev_attr_boot_progress.attr,
+	&dev_attr_soc_power_limit.attr,
+	NULL
+};
+
+static const struct attribute_group smpro_misc_attr_group = {
+	.attrs = smpro_misc_attrs
+};
+
+static int smpro_misc_probe(struct platform_device *pdev)
+{
+	struct smpro_misc *misc;
+	int ret;
+
+	misc = devm_kzalloc(&pdev->dev, sizeof(struct smpro_misc), GFP_KERNEL);
+	if (!misc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, misc);
+
+	misc->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!misc->regmap)
+		return -ENODEV;
+
+	ret = sysfs_create_group(&pdev->dev.kobj, &smpro_misc_attr_group);
+	if (ret)
+		dev_err(&pdev->dev, "SMPro misc sysfs registration failed\n");
+
+	return 0;
+}
+
+static int smpro_misc_remove(struct platform_device *pdev)
+{
+	sysfs_remove_group(&pdev->dev.kobj, &smpro_misc_attr_group);
+	pr_info("SMPro misc sysfs entries removed");
+
+	return 0;
+}
+
+static struct platform_driver smpro_misc_driver = {
+	.probe		= smpro_misc_probe,
+	.remove		= smpro_misc_remove,
+	.driver = {
+		.name	= "smpro-misc",
+	},
+};
+
+module_platform_driver(smpro_misc_driver);
+
+MODULE_AUTHOR("Tung Nguyen <tungnguyen@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Ampere Altra SMpro Misc driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

