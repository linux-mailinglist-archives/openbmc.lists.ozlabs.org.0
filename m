Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE95EF2B3
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdTCS3c8Vz3bqn
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=biuXb/2/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.108; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=biuXb/2/;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2108.outbound.protection.outlook.com [40.107.220.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3j2qCfz3bvs
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McGz46XMYec8odkmrOVHqwnNS9rwN1KvTfuH8rMhE2mUs6kKVLFarHbcZcHi+yLA5ZQZKEEa3n5cBS5NLy7cyZJugeWl09/D6rpdJeXjhiaLIEs7KEd1CKvdakZNOx1aBgiujDBC+Dz7S6dzxph94GjJzrLOH0Chj1kTo/IJdpXitllan6rkYfBVZEAE8CYGvWz11eZoLdybEbWEMC3H2VYbZ0VhixWbMXW6jkQe5k3+OFCaDpCcE+si77M3CLnQJrfc+xBguzuDxogoj+i4ojBxyqmieRCRlI5PtSWh2XVKA25uitiGc3YKX/KmK6C6WEsueRkuJS9wsR6BgU60/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob5rrouwYluwRSkcEf/1rWXKuCEjUn/B+x1vO3AMhpU=;
 b=mORdykbRBvpUR93OpB+7dgnsOp6rV7Ve4V/qBMr7u4kkGRFjAoIpX5FOFTRH7v86wFdRE8SsVseY29aQFsFMvH4XklwoFzIAo01wUvjG3cDKT8XqdFdyHSgFvm5X/2gPBcnS2aa/mmrigUiB9scF4yEr1RBje/pOKlSJM2KPcV13IqJoHFRX6dZu1o6zfhhsYu70RNs8RfygrAnOz0VZwZcwIY/JgUqbMxaAqriuyk6QV4uQ2tRUmXrsKPS0fJwQukMn5UxXWR31vPv+DeSEEJZMrCL4x0Q5A7QRglrS1HZt6EZNKrTJCUeSe6W3iCZDRpyEPQ7ZzP+YwjjOlWBuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob5rrouwYluwRSkcEf/1rWXKuCEjUn/B+x1vO3AMhpU=;
 b=biuXb/2/xa1brtFrkV0bSZw5RAfpRNsM8PwkrOG4YXzmo2Q2bloUsNMSNE+sSKOYSLa0IH16YEVr6T07O4zx9segN5MYxSvY3pc0f0+yej9oxBsy0OlJu/9Zh+wj0GCJh6eLeYX/kNlLB2DPOfBod6rBwBy3YfFEfb+fVzSGYS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN2PR01MB5503.prod.exchangelabs.com (2603:10b6:208:11b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:30 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:30 +0000
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
Subject: [PATCH v9 8/9] mfd: Add Ampere's Altra SMpro MFD driver
Date: Thu, 29 Sep 2022 16:43:20 +0700
Message-Id: <20220929094321.770125-9-quan@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MN2PR01MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fcc3d7-07cc-4ac5-09fc-08daa1ff34ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SXC1go2keEVsCD9yxIpTUKGFcXFsoPjKh/NQchefiSvJI16nbT4rJxb7JW7s0228M06SnE1ZIALN5Q0IMgb1W6G5H8f7JdPMBko6fKm/mLbguCCZJWILeJYwFojEbIHb0iAgijnlRMMcSkauDvtwWDEoYioeUZnSWP+2fAbC6Xh6x4DePvpN35X099ud7P0xwzaazS1PIGGcnkGkMt8R4mrbV2jWPJEuUvfhnqtRTfLIn7Y68DZr4exBWVqdC43HgvLzpuPqAuxYJTgwANR4PWG19oGvzLSXPW2Vng4WxCwqD/Lr2uOa7VNzbkDCwsv4OwirBqZUlyrbl8jIaJj3EpBcRlapL7ZCYVh2akMmOuWPAxC40lh6c5LET/kUJ9hMxhmVhbVisnxl7dB1oSYjv4HeR1QjWBbz2Ngqkj9rDV0mYRJ/wG0V5aSU1BXlXc7Upr6OjnGE7jE1Sh3nJ59RrHy9f5boHA2mhIyhj7mbzKNhFLSelT/ey+m1twfH+TeftoRsvku6IkLpXTDuY1JGngmBcasH1jVDrZwnrITF9pH3/r1ycpyYiIplt5flTaChvT8d0r/Upsc2EfyWPE/yaGB2DkZyhK2h5ELMwVEsovBLSg8tHeL62RQPXdrcS3O12IHA56fZ8JOQuVkLJLNoED363gLCVIuFE+QdoezDQf8zssEa6acnOTQTk5/UvFY083w/NshQkgKWaE1yeIKDZM2+dEaMTNOu7VltkkMowhwYbhjNKt8uV9epZCevLFsksT2fyDEnABquSTMuybzF935ibYzL4AdJakxP0AdpAS4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199015)(6486002)(478600001)(186003)(1076003)(110136005)(5660300002)(6506007)(7416002)(2906002)(2616005)(921005)(6666004)(107886003)(66946007)(66476007)(8676002)(66556008)(4326008)(316002)(26005)(6512007)(52116002)(8936002)(41300700001)(83380400001)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ix2OBWpIgav3BC1V7j0jlx7qwDjnZT3PZhe8n6fQotkP7Olzp1CljZa5mXqb?=
 =?us-ascii?Q?pQaMw3KwRywt6UfJIRA3+Z4qVDvNXv4XwuhZ8HSPPEZbKNzhJkFOHiv3V5VO?=
 =?us-ascii?Q?jAef+Yhm1ssCY3srZ42PLlctGWr+p3winFgkE1ho3h/nEUyECmqSqPwmyMTO?=
 =?us-ascii?Q?N6z1hbKO9gNginG/kg2jLDtFyV8iDlZlkKOf154bGpq569Zbpi0PG/H/oJe7?=
 =?us-ascii?Q?nBeIMvUysklkhYL5CuUDEPosMf1wV5LZgoCfxDGpa7e/PkHlR48YsSF9+Dom?=
 =?us-ascii?Q?Ij1LHcly2RSJVZl8OASYOC6KwcRU1BQp1kYLy9NXq0I4EMnDaOdX9R3o5h6Y?=
 =?us-ascii?Q?fCeRhS4XS8InJ+p0pUiflpYPovP367FDU4l9347UDkMDTwdUBT5MfDlazd8J?=
 =?us-ascii?Q?oqvc1H+k65gq4mrPTr1uTeU5haqz4ySFbqNMP8r9Yd5s2Vs05Xcmj/Fmbux+?=
 =?us-ascii?Q?MnM46BBfeDp3i2Y+MqHS/jZLfasMDtK+f3rpmjI881AVrehnjkNa9wAPKzex?=
 =?us-ascii?Q?qtbeE1ta/a7r9K53nHbyaULKVAwE1jplBw2Hsgu+38T44tNXa333UEmp2Ph9?=
 =?us-ascii?Q?Emb+ihe0GP0MGG7PGQSYS4bjlJupw7n6/PcD5iPpSU+2Goks3PeW6pj8XxaG?=
 =?us-ascii?Q?hBtZdw77Av2oe9uK3Oe7NQRoTFvwLCNuMf5o2RVHZnYFcrFXqR7MEJJVvOOc?=
 =?us-ascii?Q?aTOs8uOQiNBTzwlp1wC7KancRC0iMU+UlDj7Nlhu+TZI/A45hAUzSZS6Ka0I?=
 =?us-ascii?Q?pa68w5oZbvpdx78WhgLlxk+dIPtrPfAO/XGXg6OAhhEwonctiTz5GC/1o9m+?=
 =?us-ascii?Q?5r0eyg48z6J3JODKc9FafPYxDLvYJE+c4zQZhB4DT3Cn9lcTx4Y2zNkJ1j0s?=
 =?us-ascii?Q?JOsfFrAjzNEjZWl54SGHZa/69ROVuZGCz53iUPkBA2hy49+LVYwUbed7ghVt?=
 =?us-ascii?Q?+Akh6CLh+oE/1evu1ro6Ert8ANXv0KYiIYdBgtw8NazWn0oCV0twHrtBHMp4?=
 =?us-ascii?Q?Qm9KbS73jUslp4NcLfDf9e0S/WrhGnM58p1ahQ8NkqNDKuI8pkUp9c7he74S?=
 =?us-ascii?Q?kajxiMLybQk7XJ+pRZSwwr8bH9+qFWrGk2A0z1lb2TqRilcMtKdBK/cpvxHv?=
 =?us-ascii?Q?AomRSkYEDWZV5ln8Mn0ffH6mMtkAiMVsVIS+y2z5SWA+Wh491RVd0GP2PxUb?=
 =?us-ascii?Q?/zxRY+B6fXxXMuaGRtXWaeaiaq+ELWf6tmRJgiEsPf8XS0Y6ZdLCKNqA2w7a?=
 =?us-ascii?Q?NaN2c3Txv0QS6BP8M/Vg81DLZGo/3nZMwlSuSViHGf0kYkw/tPfawy7yaqcT?=
 =?us-ascii?Q?uEqWsuhb7xMGnzRZlsJlj1BveKCuJVnLyarS/8hGT4TGQmbI6og92PJKR8IS?=
 =?us-ascii?Q?VIvc8zexM4wMpCvyEuVFXComXcuggxCNX24I8n6gOl4gYlGwZyFKNqAlPxoO?=
 =?us-ascii?Q?tS2mO2Yu/v/H6VFj7XPEyHd/7huGPLT5bMOx3RrtjQV/e1OaY7AnfMs32AEV?=
 =?us-ascii?Q?GyDrsYq7jDmQl/hlLuvyiDoKo57iUr4m8VJ3nL7tpbBO9cYCWF+pnXRaEEfE?=
 =?us-ascii?Q?vmhlwXHVbJgMBI5I0NG+0fUpp+N//pYYL2EevzQKoF6Rqa/T+biAC8hyOrO3?=
 =?us-ascii?Q?RYyu1KoszdhKGJqEvf1WGBY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fcc3d7-07cc-4ac5-09fc-08daa1ff34ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:30.4746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqSrCJKlu8nDS7yB9ML7SJMRj3CsNrb4N8yERxLdxjXYo7SC6I4adoDbYG/XBOEAYV7m4O2Q5am9qgGf41eFGCLmMKFXZNvCAabCi9tdhtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5503
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

Adds Multi-function devices driver for SMpro co-processor found on the
Mt.Jade hardware reference platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---

Changes in v9:
  + Rename smpro-mfd.c to smpro-core.c                   [Lee Jones]
  + Fix include files in alphabetical order              [Lee Jones]
  + Add defines to avoid using magic numbers             [Lee Jones]
  + Return -EINVAL if device does not match              [Lee Jones]
  + Remove unneccessary comment                          [Lee Jones]
  + Refactor error path handling in smpro_core_read/write()   [Quan]

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

 drivers/mfd/Kconfig      |  12 ++++
 drivers/mfd/Makefile     |   1 +
 drivers/mfd/smpro-core.c | 138 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 drivers/mfd/smpro-core.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 8b93856de432..9e77f4762999 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -77,6 +77,18 @@ config MFD_AS3711
 	help
 	  Support for the AS3711 PMIC from AMS
 
+config MFD_SMPRO
+	tristate "Ampere Computing SMpro core driver"
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
index 7ed3ef4a698c..9387c3ddab4e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -271,6 +271,7 @@ obj-$(CONFIG_MFD_QCOM_PM8008)	+= qcom-pm8008.o
 
 obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
 obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
+obj-$(CONFIG_MFD_SMPRO)		+= smpro-core.o
 obj-$(CONFIG_MFD_INTEL_M10_BMC)   += intel-m10-bmc.o
 
 obj-$(CONFIG_MFD_ATC260X)	+= atc260x-core.o
diff --git a/drivers/mfd/smpro-core.c b/drivers/mfd/smpro-core.c
new file mode 100644
index 000000000000..d7729cf70378
--- /dev/null
+++ b/drivers/mfd/smpro-core.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ampere Altra Family SMPro core driver
+ * Copyright (c) 2022, Ampere Computing LLC
+ */
+
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/regmap.h>
+
+/* Identification Registers */
+#define MANUFACTURER_ID_REG     0x02
+#define AMPERE_MANUFACTURER_ID  0xCD3A
+
+#define CORE_CE_ERR_DATA        0x82
+#define CORE_UE_ERR_DATA        0x85
+#define MEM_CE_ERR_DATA         0x92
+#define MEM_UE_ERR_DATA         0x95
+#define PCIE_CE_ERR_DATA        0xC2
+#define PCIE_UE_ERR_DATA        0xC5
+#define OTHER_CE_ERR_DATA       0xD2
+#define OTHER_UE_ERR_DATA       0xDA
+
+static int smpro_core_write(void *context, const void *data, size_t count)
+{
+	struct device *dev = context;
+	struct i2c_client *i2c = to_i2c_client(dev);
+	int ret;
+
+	ret = i2c_master_send(i2c, data, count);
+	if (unlikely(ret != count))
+		return (ret < 0) ? ret : -EIO;
+
+	return 0;
+}
+
+static int smpro_core_read(void *context, const void *reg, size_t reg_size,
+			   void *val, size_t val_size)
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
+	if (unlikely(ret != 2))
+		return (ret < 0) ? ret : -EIO;
+
+	return 0;
+}
+
+static const struct regmap_bus smpro_regmap_bus = {
+	.read = smpro_core_read,
+	.write = smpro_core_write,
+	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+};
+
+static bool smpro_core_readable_noinc_reg(struct device *dev, unsigned int reg)
+{
+	return  (reg == CORE_CE_ERR_DATA || reg == CORE_UE_ERR_DATA ||
+		 reg == MEM_CE_ERR_DATA || reg == MEM_UE_ERR_DATA ||
+		 reg == PCIE_CE_ERR_DATA || reg == PCIE_UE_ERR_DATA ||
+		 reg == OTHER_CE_ERR_DATA || reg == OTHER_UE_ERR_DATA);
+}
+
+static const struct regmap_config smpro_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.readable_noinc_reg = smpro_core_readable_noinc_reg,
+};
+
+static const struct mfd_cell smpro_devs[] = {
+	MFD_CELL_NAME("smpro-hwmon"),
+	MFD_CELL_NAME("smpro-errmon"),
+	MFD_CELL_NAME("smpro-misc"),
+};
+
+static int smpro_core_probe(struct i2c_client *i2c)
+{
+	const struct regmap_config *config;
+	struct regmap *regmap;
+	unsigned int val;
+	int ret;
+
+	config = device_get_match_data(&i2c->dev);
+	if (!config)
+		return -EINVAL;
+
+	regmap = devm_regmap_init(&i2c->dev, &smpro_regmap_bus, &i2c->dev, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
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
+static const struct of_device_id smpro_core_of_match[] = {
+	{ .compatible = "ampere,smpro", .data = &smpro_regmap_config },
+	{}
+};
+MODULE_DEVICE_TABLE(of, smpro_core_of_match);
+
+static struct i2c_driver smpro_core_driver = {
+	.probe_new = smpro_core_probe,
+	.driver = {
+		.name = "smpro-core",
+		.of_match_table = smpro_core_of_match,
+	},
+};
+module_i2c_driver(smpro_core_driver);
+
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("SMPRO CORE - I2C driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

