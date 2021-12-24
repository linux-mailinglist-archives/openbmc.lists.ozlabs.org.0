Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05E47EB59
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv6t3gX5z305W
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:22:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lq1rE3Jj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.96;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=lq1rE3Jj; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2096.outbound.protection.outlook.com [40.107.220.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyy2Z2cz307C;
 Fri, 24 Dec 2021 15:15:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfNMCkeGOgZ4hpxX0AQoKzsqXTLwFHkeYz3ycDk5T++tTW7BDfKaPn1OC8ZM/+5OZ26ejIM/g9Mz0IU+zZiSJsU7vnPH5EBF5y6aRlsany+1qVn/ctVaZBYbFco4S9mPTnApXrTtfAZkhtd7YLhcOJCo64+TZO8+LVwLGo7nuzU3EQeEpZ3mHejnlloPcKVmBciOlh6iove6D3wV6XfWW+//i/XG0b2qVzHPjcRk5rOCmM8UfxVFrHn88G5UaQ0PGKc0UPETjt3KKNGBFl9oz0LJEo0/+/cSVUrV28zHLv9X7PJ8AelRqqBa9Tub5F1CoL069EJadB2LLXu1wDs7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1Yw7pQz0XjU9IN3CqqMWxnC6/qGFVtqG7Fo+JdzLeg=;
 b=cAvjSwcepsqqShbaXxvkxXrIDvoSjnSfgUu4ekYTjnCXxth05vignY5nMEuDI6i9RpBjnbJJw0PCmAfaLj6ich3rKaHofFGNtcB41LaTzxvjU0jDPuNYsjbuOXfNHzaDfP4FcgcAsH+LZ9sypTqJJ4rYeRQChb1FKTbXaWo95xvax+pIcVJ+WWRKKaGfh5eXhEthJj8fmJscZXqu29fFOJi0pXU+OfHyXzNLNC28uplFo5oxUKTT2lTDg/rmfmairF82Gli0Z4Y5H8zgi3uMqtmgGJmuzPdxa6em7nWV4KUsmBuYNz8FBtGmOEtRmAGOzvupBX77gzI1ysDeR+yEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1Yw7pQz0XjU9IN3CqqMWxnC6/qGFVtqG7Fo+JdzLeg=;
 b=lq1rE3Jj6wXhz/Lkl4HFmknIQYaEkkcUO9teSsvnD55ETbABX+lkzRRwYHGQjUaWIb6Oavm3zJXSZreXNPiTfXdVnPq3wTue66wGq7lQB98v7Sc1uOSFxc1xvPBscyEGP1kpsiYpW02hciYRYCcb2bWDm3V13L+MN++hYmDZbG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:35 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:35 +0000
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
Subject: [PATCH v6 8/9] misc: smpro-misc: Add Ampere's Altra SMpro misc driver
Date: Fri, 24 Dec 2021 11:13:51 +0700
Message-Id: <20211224041352.29405-9-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2755b1eb-dff5-4a23-d22a-08d9c69408b2
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB5189199C4E0AE6AEC3E43A05F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1JvSoMZOWN28FNS99Omi8aZm//lIrfIZBcz2mUw0RWKLyUlmRfy8nRQR5Ks8IQhhBmn8RW+b0pfR8n60QzbjfbfQaRIo3Jz0kg7gca5tABKJ7DlQLuJ91O+jEXEhLKc0T6C7H8kaDNrcyb0bDZQBv0BFqc2wCCmqzdPyk2KAz6ETwj6ycRVDZcImOBqT5LBL6NpKl51n+XxP3Q20SfPPGMYUwSQWgVO7Ss8BxNvmvqckYC3DemwDQWt4tp7paXswn3Qn3XSUFx/6R29hvfKXq7ZpUirGB0lwI2FonlAueS4ZSTlhaeTJpd/JwmZS1Rv39Q877fO3CV0bV2n0habI7HnurCdpZZCWTBm7CbUHAYrZvQTPIfvU46bWXO9u8w03mSp1Pszm3OFNww2qqTy7OUEIVjsuEAtqlKqfGgqg+9TF9woqAVCjrU8PdP3NJdtqoGCiEre3eK9tuoJeOdi1WWA9HWmG+fIDTjkhaT30/ANodkyzjZUhbgTg4J17RGRvCpNbk+ba3qS8HlLwCUGGHKPTdIV+gRAFS6+OHHrj1jXScWCANVupaWrhX0VOrrEkNFWB3B3Q6UXRV8fb1NneejM5KySAffq0Nt550OQXgB6Q42XnszgDdbS6V0s6+I6IEVElJg/iF8m0V/1MJpBt6DIgfKhOswHdWPQO7tCTh7k0eIUWMFJCVswHluvPDWW3Kjcp5SwUCh5RPIXgAK+hzTRZRgiLMAckSIDLd5QbKR8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8lctm8R+wGZdn9R7uVSEssoxJpMzGNYui8sbMrUN6wy52/FSmooBOwaeaME?=
 =?us-ascii?Q?shzTxxXbHOLzGGcTGhbl12qI0476+s9um4rqfDfueqqanl0UxCKMHXj0UeHN?=
 =?us-ascii?Q?rVkJXubaOnPTBCW+JwxHkMZ8SxQthfYbSK/bQp2WZykgx9hwFNi1eXBAY6lh?=
 =?us-ascii?Q?zQGQ8Iw9AERkB3lXy/ZOyJ6jZh6h+v/sZjTb3rODKykExrY9vCdcCEYCxU8a?=
 =?us-ascii?Q?KXCXhkhm6tUFqjJuRJUEOAPvwEnS7XK33K0BMMJGiM9O2fdNGWs+MY6R/O6K?=
 =?us-ascii?Q?zZIfGFtvlvYdHrVNfHNb0OYM4JAY8cUDvrBft12sPctByx0ZEdF0MilEQy1o?=
 =?us-ascii?Q?qoylqhcqdmZGAgNqnKxFZenQsGzx96KWuEVdNIS65q06kZDdnBSvzBs08TA6?=
 =?us-ascii?Q?YV8jAk4YtRqIJJlKYjCSmwN98fvIdFf8xZcQwvtOmOKKP8TXtsvBKxCi14sP?=
 =?us-ascii?Q?av9Vh4Irw3UOhQfQagfxdFMEizBTy9wNvsVu18ViGskxUWB/Bi3NK7JwRkm1?=
 =?us-ascii?Q?3P1CXyVx6R5wIHkv0+e6IDAwrghlrSbuef1oEzFTOa9D1vt4UL/SjZSQrxuj?=
 =?us-ascii?Q?C2zKT8EC4uvV5YfrNLhX0csjL7ft2FvnRnnLo08bdMDBHr4kRnXObD01aOTq?=
 =?us-ascii?Q?Wzd3hUSK8tUnAsN+j75YThZ/cLCqgKOsR3mutUuohn9++VPMc/+QaB1uHugS?=
 =?us-ascii?Q?QXs5Jaj3sUNNU2xwRZK15QtXPn93311mH4HwGCywr+ZlohNqDo9vYEfbPXam?=
 =?us-ascii?Q?/TEK4572UGEphmHCZ2TeK+VlL5Wf1fIEWAnBsozwIgPumVDWaG+R3KOr3y77?=
 =?us-ascii?Q?vWdlbU+fAgoJiCRH2Xk/OmkVa5hPS0KfZzsdXH4jzRfvUc6DFOKPrVqV9TJI?=
 =?us-ascii?Q?tz7IbIiRUT6Hm1vAHSclQnmNs2IKhv+fzpJkC0U8Ym+tuwdmUh/pl0diEXhf?=
 =?us-ascii?Q?50vusTeQz1VVEcC9klM6+ek02uqtclcRYUyEJd1kU3a5BOSxNi3j5lYaQSmj?=
 =?us-ascii?Q?YkAQirf8HtQWoZt99w2eOWg19n8HJEmToJntdRjbNJKfYgOvyAFr5THKIEW7?=
 =?us-ascii?Q?0CCEOSp+jCvilRDa6SNoO2yTVzMbsHqFfUKgRAVoila73du7yzvm/qdxMg2b?=
 =?us-ascii?Q?TqVvnLdC2q1u7j48r85WTBZhX+6Ortfzs0c+6CtkaBeeUSKnmYGHa5UeePAJ?=
 =?us-ascii?Q?o26izikQ1v1X3XzzXO8tEKl+RbmxXpAaIDbiy2FBG/6qArdUS1B9vFcQLFa+?=
 =?us-ascii?Q?FrjoSDgFJRDqHH7EtHoSejv4oSRLsa9aVmqTDANItqmXArvdKyD7zOp8SETi?=
 =?us-ascii?Q?2Sv2qGg2/vRTaH1Er+Fj/mfBbzBu2jvuK61sorhzKtmpNPZgefN73EkH6pAN?=
 =?us-ascii?Q?Ul78IPXNdm1o3BxdoaGDPg/0WPzb0b1UV/XT4ppHJuVWzLsqmQZPMxUYldyq?=
 =?us-ascii?Q?i0xUz+bCpkkPCmDF8R0lk7weEtzLmbfjBp9ZuZ1nLiatEwA0NBeo1ai5brME?=
 =?us-ascii?Q?N0fXd1J5Skfd2UDdYIge/k/ppQdaU4htK64y7De5xQHZxtnWBZgHXP21arhq?=
 =?us-ascii?Q?1PUcyf6mvUB0MXDZlQH3FIY+Dv3hBnLchm0Xdq3lMd5e540RkHXrHLnc833d?=
 =?us-ascii?Q?4eYGgwYa5LRFTOCNBHF9q34j/ruRXnYAonWlswsQ2r1sQQHia7IXrhdI+99t?=
 =?us-ascii?Q?DVf48whBJ17DrBLpjLF4XxGnzos=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2755b1eb-dff5-4a23-d22a-08d9c69408b2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:35.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVPfr7N1KS4z8/TUTxlG8mMMuS8Rutb6mWpMxoQZl1MFckIZBrkQmKvKPcRpkv8uWgDk7wqga2NN7nJLLja4yasDPvDxtHvC3awI/Rskgow=
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

This commit adds driver support for accessing various information
reported by Ampere's SMpro co-processor such as Boot Progress and
other miscellaneous data.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Change in v6:
  + First introduced in v6 [Quan]

 drivers/mfd/smpro-mfd.c   |   1 +
 drivers/misc/Kconfig      |   7 ++
 drivers/misc/Makefile     |   1 +
 drivers/misc/smpro-misc.c | 177 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 drivers/misc/smpro-misc.c

diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
index a7cd64bf9eaa..5611dd30f8f4 100644
--- a/drivers/mfd/smpro-mfd.c
+++ b/drivers/mfd/smpro-mfd.c
@@ -28,6 +28,7 @@ static const struct regmap_config simple_word_regmap_config = {
 static const struct mfd_cell smpro_devs[] = {
 	MFD_CELL_NAME("smpro-hwmon"),
 	MFD_CELL_NAME("smpro-errmon"),
+	MFD_CELL_NAME("smpro-misc"),
 };
 
 static int smpro_mfd_probe(struct i2c_client *i2c)
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 0cbd8a2561a7..df53cbf62931 100644
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
index 8ec9961b941b..bbfee81499de 100644
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
index 000000000000..6fe9d25ce31c
--- /dev/null
+++ b/drivers/misc/smpro-misc.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMpro Misc Driver
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
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
+static int boot_progress_show(struct device *dev, struct device_attribute *da, char *buf)
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
+static int soc_power_limit_show(struct device *dev, struct device_attribute *da, char *buf)
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
+static int soc_power_limit_store(struct device *dev, struct device_attribute *da,
+				 const char *buf, size_t count)
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
2.28.0

