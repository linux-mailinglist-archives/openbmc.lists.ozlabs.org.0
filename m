Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4584E2206
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:19:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSFw6JnZz30PK
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:19:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HpTwtRCS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::724;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HpTwtRCS; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS926p05z3bNn
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:15:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/sxgHUtMo8IoOIQf7MzFS0RdGdTX012rS7Vk5iFDDmT2QgOwXTvodhtWMCF0b6Tsp8EO1PoSjF2PqaPDD4YfZ9Tlwg7uP+uOeNz2h7MVxY5HuI6fuPwWc3kRE27ps1L0x3UGO8zM1hcjYe671BD2gU2N+bC7AfU/ySmIKvEry+1YFsNTcuqrCJohI7zwutzx4w1nnYZW5k4+/wEHwAJTLtY0oBb+qmqzfd3J0mNhtA+HNeRl34r+4nmv56MEzB2jetw8RsrfeLeZKwAEW1CiTd0OXW/v2UtcEaS5FY8a9PfCSoPoDF9x0oL4/QjX/zn3q3xPZE9p2ng/DF2ZJ7kAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gz2V2hUboZee0NoS7N5UB0JFSqluoRrgP3NksaIA48=;
 b=MyzLbxfN606+b1yfrnjrXvzHT9bKDsDVOiTbO3GoeV+KYD2qHDGeteMg29SlXadz/ziEx9lDZWEVlcs8xmA6Ft3zF5TtThPCd2P6K9iinKvtxbE2ce24wkuPNNnvlsU7LSvy8Lmw1DtPLktlKSLDRCyIPf/8B5J1tPnyevqrS+O9qQ8JiIqYWTQxLERdyQqzBpHicH1A3vtt3xQoSeGvQR0UETTX0wtPWD3EcFHLRBJREeeF5A/2oEvf7EFYv2Wwa06MqYwy1PrOjtKPJ6M4fNwwykudNl2m2quNWKdP2HsBaKKezqwXXQP7k/rUlKUr2aNJk+2eb2g1yc5crXdv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gz2V2hUboZee0NoS7N5UB0JFSqluoRrgP3NksaIA48=;
 b=HpTwtRCSCTkKF8HUICvH55gkFx/J4W1TEZyNR0uEJqrLLs120S+n1K5pfr/XeaaSmr7g2ZstrTU4ofBgaT8y8Ko7sOiP7VlGN1IDjBG+UawQH5IISFWCT9Dvz4/2jkPWaaVWdAbakDhySRqzsAVtwEpyB0QKSWSauyOXK/Ogrvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:15:00 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:15:00 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 linux-kernel@vger.kernel.org (open list),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc driver
Date: Mon, 21 Mar 2022 15:13:51 +0700
Message-Id: <20220321081355.6802-6-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321081355.6802-1-quan@os.amperecomputing.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 148c7f75-288b-406b-3f7e-08da0b12e480
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB2738DFA0F443DF11E75F3836F2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdEvNxsCgPChJH0X6CZmcZ9QjeemnQKygaFnCBur+LJ2ekcJjwOhuWjoVfO/kz5/kARfdQyXkD1luGJvvVwl28aMqSw+wb09jVSfrojS28yIksrwhlD7mutxxDWPKS+MhfzpxDWbQdBYXPbeWNbdJNg926sk4WFWSEulAsFjzgCU1kY7C8HG/XtKg9e8qGx82BzARdP3J4Lw1CxrGb0N6JfeS5F/hB11SAF0LZBQgMxl4Q48zAlsydyQ8eNlZPiwbdGVTeiiJzcBHQoRaGZJxw2aM4sJxoc8d03Ph1e1SrGph5fJrnu8CkIdqwDD0ZbI/JjvLNxOuyJw3VuyVK4/FQONHFoz2m1wC7hnT+3ocESvbZAx8OwESXrS7m8rZTzRY2VUu1Z2jCn45jJNZ6WpuLnmgpDonGzYFQVJdYKspqvYDQ/IT9Eah/ao3DoLW2WLJX6W4FNfKkGVpnWVBwGoGcYJVTsbpYefWrCES+rK8Y3WlqWS+6AXFyf4DN00Pku3HgT68NQQEmRkmTTaMu/P32FNL/ZIoZBmO2AJTl994DiyHWZdk2yyi0rfzMcyAO30FlOigRWCoO46ES/RdvxV3Y6/yx1Md8S/w79EPGv8rA3B6IJDAD/E01OtxyFn6WLFO1Vq65pE7WvNXojHpvfcC/SmFWXeNuaoBzW9nkf4nsfWKQ4p8EVJg3rQz68xBYCsDQbvA4MA4OqSiZXhS9kntANb2aXbveJ3EhJNpIHkVm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWVkfcMKFR4UHRZ+Muvv5IZDnrx+faIUKccxRaisJcIRK1yj+Jin16eCbUzB?=
 =?us-ascii?Q?eFi1TvzZYV18BQZBXlwjlO8GKMtdOXWZsEglDYh2p0jcKrev9jgVfrH/vDu2?=
 =?us-ascii?Q?zgM239bIJaRACGtLvCVjLe2pOQqSLiGj24xqTPh9KXE1WhprTG5AA2otKBoC?=
 =?us-ascii?Q?3kO1/2PsoxHvxNKVzHjlsVtOCw8GWB1Sy6HIM3tWBg5O3FA00Yy7rpQMlqu7?=
 =?us-ascii?Q?y5/s5dF7hwE8mxzxeu5ixO0z/zMqQeyOE8aWYjIqkhi8JS165MybXGP8sY7v?=
 =?us-ascii?Q?x57nFQC63FGujfxrvBK0DECEKGtREp3FfTSAY8Ecprsi3jDmCUVnzOQrQRax?=
 =?us-ascii?Q?lE7KcqKCFHrL8sZDtBHH2zEEO8RmnYqb4jR7YtPrpsRPMRDGNhqRQhN6sZht?=
 =?us-ascii?Q?9m1f4C/6nEk+wgbDBI4JGfcZW2K8iufYs52vFxE+Ts2X34fQYfj9HKdL2LCY?=
 =?us-ascii?Q?WDztwkWKSw46fb2JfueUEO/YLGoduLV7R9LVSKjVfUGeDGaJ8hsoKaapePA/?=
 =?us-ascii?Q?CUCrnsr/kJNkSIsUtVLWYgtLygXRofXLb98znEFzWtL76eerHNqEe1uOlr2V?=
 =?us-ascii?Q?CTJy7TvvUGL8nPCcX58gXbsiFEq0aWPKEC2jIoziqKIBl7rBWj0E/1JjRUul?=
 =?us-ascii?Q?18Y6E+fCP3PdKeZHw/KuDaDDiWgP2p7kV4cDXu7TWOjZ2pj00ysQXAbR0FxC?=
 =?us-ascii?Q?F2lBI1fVEZBr9BYliOFh2Og68SuPtZ8YM4FsmwFAhUrlhEzdommIV62L2GtQ?=
 =?us-ascii?Q?ieyDZzK3XrK7Vr4dRz3b3rALvOoNLabBDvDNHSbT0Z6QjG8VEB4WbTWFMi7q?=
 =?us-ascii?Q?UutlDao3cZWNodd/84pyRLR0OYSV5rfReCRg3iRnfl5Z79Fjhn8r+k2VsNyZ?=
 =?us-ascii?Q?5CMvXDZgBaP3iZBKxTl2HICtyGGQRrOcJUylCvnNeJEgTSnDD+5tFJNKTk4k?=
 =?us-ascii?Q?GAtFrWxVw2yZLFayrHlyNECDU7PfH6Myf+yHhCthivBjLFdiYQIRqr+OIF5O?=
 =?us-ascii?Q?owA5It+bYh7q2GmCNb08aamVhL19cpL8dnkAF2sBT+h+PPEk25VrxCJiGwMj?=
 =?us-ascii?Q?mXk5OjD7m+R2ljKMDFwDfyD5shZTNCpTZ3iYk6fAZWEWsxQoF2CRtM2eJgUc?=
 =?us-ascii?Q?nHLeCYH+FkuVbJWYOWYlTVg9FtLHHYIMivBYAtexpUqJzhcQiUv7Bm5qzJmu?=
 =?us-ascii?Q?TRPBPZSf9/g1pcxFJWngp/xH1d8mSbCfT66VAF+X8g0cZMyEhkF1FIUFdUpW?=
 =?us-ascii?Q?7fqnlxUYeeA4M1y2n4J46te9+z+6EdAhlqW+ndAZICFrtk61l2ZAo8Piy+gi?=
 =?us-ascii?Q?QjmCvJO57rSi9CAlqVk6PUhzvvb0mPGAdSjlhSaVoPEqAr8iqfnq9J1QiSv7?=
 =?us-ascii?Q?UK15Q4AWb0W86WbQAB6vs1jDRtYbuWyBRGq/ObO0EINPPXAeyDrGIJJHkt5l?=
 =?us-ascii?Q?TDu7n554WZ2h97uMXGlLz1GVmJyNq1usVGtwEZJJwfi7i3YkjLyiPQ2Oa+Eq?=
 =?us-ascii?Q?xfgv4eHgyRybpWw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148c7f75-288b-406b-3f7e-08da0b12e480
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:15:00.0397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnIj6Cj9AiL31QMFUgI+3RwmeAa8Qr+2HyvoacNEP7cU9Y+0ww9FhUf7SRx0VQEl2PZ2+7ohyu0XvaEEucfom1xZmanPdtE63jHfzDZnWTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2738
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
Changes in v7:
  + Fix wrong return type of *_show/store() functions [kernel robot
test]
  + Adjust patch order to remove dependence with smpro-mfd    [Lee
Jones]

Changes in v6:
  + First introduced in v6 [Quan]

 drivers/misc/Kconfig      |   7 ++
 drivers/misc/Makefile     |   1 +
 drivers/misc/smpro-misc.c | 177 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/misc/smpro-misc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4e1a0b451f3d..f1371d6584e8 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -183,6 +183,13 @@ config SMPRO_ERRMON
 	  If you say yes here you get support for error monitor function
 	  provides by Ampere Computing's SoC with SMpro processor.
 
+config SMPRO_MISC
+	tristate "Ampere Computing SMPro miscellaneous driver"
+	depends on MFD_SMPRO || COMPILE_TEST
+	help
+	  If you say yes here you get support for the miscellaleous function
+	  provides by Ampere Computing's SoC with SMpro processor.
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
index 000000000000..fadaa66a699e
--- /dev/null
+++ b/drivers/misc/smpro-misc.c
@@ -0,0 +1,177 @@
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
+/* Boot stages */
+enum {
+	BOOTSTAGE_SMPRO = 0,
+	BOOTSTAGE_PMPRO,
+	BOOTSTAGE_ATF_BL1,
+	BOOTSTAGE_DDR_INIT,
+	BOOTSTAGE_DDR_INIT_PROGRESS,
+	BOOTSTAGE_ATF_BL2,
+	BOOTSTAGE_ATF_BL31,
+	BOOTSTAGE_ATF_BL32,
+	BOOTSTAGE_UEFI,
+	BOOTSTAGE_OS,
+	BOOTSTAGE_MAX
+};
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
+	return snprintf(buf, PAGE_SIZE, "0x%02x 0x%02x 0x%08x\n",
+			boot_stage, boot_status, boot_progress);
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
+	return snprintf(buf, PAGE_SIZE, "%d\n", value);
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

