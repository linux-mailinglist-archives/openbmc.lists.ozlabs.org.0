Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FB5EF299
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:48:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT872z0Jz3c6C
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:48:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AGpqcrSo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.125; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AGpqcrSo;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2125.outbound.protection.outlook.com [40.107.94.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3D6qQGz3c6K
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn5KUbN6XlPM+uA/H74F0ipabFAaT5HMYcZsrvyiXqSiOZ/5JEaVhH0939hrc/Avh3Qu0BCz2Nxmlpg23lTjdo97aX+T5VvE6A2B84B+J4Yl9rOvA0zAkOnS6MTgRliFaVVB6DwRLUxDrcilVwNhXnPkliJy8/oFtm9E+scug4ZfOVjAlVMGTpzGSBi4wq0oX7y85CMWOvK0ADBgcqjOc5kVT9p6d9TKWDcMIG6Qb5RD8eZH/VvrxJQfQZKKKWomEaJJwWZXtptT6K7rVEf4IOvGqdcIYlsdAldOqOyyNPfNqNXsoUSYcZrHJtPXV8FnMBRYIWfP672WpR9xPq6oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaav1Tk4ZmXRvJWChsyR395QKuSnIUzzdqfP7igEtx4=;
 b=lums15Z0CBj89oUjXQt1xQ8kKhKJJUkyY0PAl/adyRe2phPhSuSCzSNTlqZyCsBxk2qktMD7ZXC2EWiRlmlXYWYFh5LbmA5F4I2ckf9QX+Z+JuHQs1A0Z2KzYLohwM5PI1Nmfr8xjqa1YbcGM8JC7Rt17Jx4r++Smd6UwxJZrmSVr+vAySKP7XLN6MWw5JP/d6zLZgjqb0DVPWkCI+UqNnv06nVeoBSA9A9S+mY1pQefCQ1nnLcU0sc0U1gY3Ov0n+oGqW4GB/l+5T+S35/wfwoCesdxQyQEdhNkkvFEmXPJEgm0NGla35LokMSFeu33G2p/Z4gQJ0bE6nCBYo+x5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaav1Tk4ZmXRvJWChsyR395QKuSnIUzzdqfP7igEtx4=;
 b=AGpqcrSoG1W9v77tbbgEARveiWmn/JUghjJsJP+8GoPWB4itwj2ZTLIctbT05yHhSbgtf+Q377UnN+yfgIizK6j20uSD5kVKty5fTO7hdH+YgUAgiCT7jUtT0UX+y0nfKcZu0oOXSl65FMkqUgPsZGIfxSK1ccsU454rZvrcpfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4798.prod.exchangelabs.com (2603:10b6:805:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:13 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:13 +0000
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
Subject: [PATCH v9 5/9] misc: smpro-misc: Add Ampere's Altra SMpro misc driver
Date: Thu, 29 Sep 2022 16:43:17 +0700
Message-Id: <20220929094321.770125-6-quan@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|SN6PR01MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: c57f180d-2bed-40f8-0d8d-08daa1ff2a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PaVvqs9xrWqWzbLFvzvAffi9rTqL5YA+mY5RMMgZUz3Dtv5pGMHIAAymwT8yMSfALkwAk+oVuCi7fTvk7l58rtqrHXnWGnN5rGuCfpnOCwNQE1CCUlNeKN23pTLNh16KDEMAbwSDe+HiWF27f96lH1qp9uUnkiuPx6JGSsc1vaurRUegKoyojQa4ri8QBR5OALw+J2lEBOW4YL5SS2qe5ERUzaMIDnPWYLGkc71NpBaBhtWcpnG8WYu8TmHOs/ENARZyiBN9Q38mE6pXOH/Uy8XFNt11kBrTRZ6J5GD6fuoHGIeqqUSYWIBegMr098ZBwNtAj+jD+eEjZcB7pPjJz/ORQdD8dp97AdAjJr4+YG5/tmp+OdqLlDljHpOr53ajag2iIgbJKKv5G0oH/v5fgWF06e1gRSez/g+6o7jEf+kuz9veG30YTwxKm1qbBBxCfkLrms9k73s5nyeyN7fv0MjxfVuZESoI60b61tVs62vhofmQMq+9erSSr5ltj2wvrT9y0o7jMHvhM/ek/sjXdS6nAxAWBOkOP/wuwXHptP7cvDPwwoZFm8lzqCRaIxSM8vDHStoZIxhobS01YXCJl+Elop4zjI/Uom6wGK8hHR7hNEcCMvt28LqxU/QT0WqKOetMqSmkn4OkNHCawntmxukTR4m9y6cIdesdVr/MZoIGUeTWp9rQtsYjwubkHnIo757F3GNT4XjjS8KeCtz4W2q+qY0NDljsOiGcLTBre3gcYGHSL2uM33LNMxBzZK2RPH+SMWfFF9N7j6zZt60KtW60Xy+8+DmgHpnw4TENGJw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199015)(921005)(66476007)(66946007)(66556008)(8676002)(4326008)(83380400001)(110136005)(478600001)(6512007)(6506007)(2906002)(26005)(52116002)(41300700001)(316002)(38350700002)(38100700002)(86362001)(8936002)(6486002)(1076003)(107886003)(5660300002)(2616005)(7416002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7mubyrgxTFJLTO3XbdjUNJJ2DhQ0JUxHmGCSHmfcuUcn4pwVIgqlOY9jdX4n?=
 =?us-ascii?Q?AheTFGXG9awWWNhcq600zXPSe/Cc7GmAXAadNnKHCiww/XfqVis9NIt0ks/W?=
 =?us-ascii?Q?N54AxYp9kCABr0QeUh5JPye4fc9gTLhyzPHrvwJradDJIWx17rSDQHpMHVOU?=
 =?us-ascii?Q?RhDhcvU/Y/aVqbFDZXd+EqkudJzlbU2tjSCrs55XdVboi2/GNx+Or21+vhBo?=
 =?us-ascii?Q?jXP94Z7VcRvR7vCUsVZrrbwTByk1qjdBxG415tHJzd4MpK8Lo2ZTQss4+LBw?=
 =?us-ascii?Q?bmm93wU/TwB5jenMOSs7VIIuV3v8/36+m5006QXQpj2MRNEeRSdfIxsQDkYI?=
 =?us-ascii?Q?XJ+DWD9NWF8xfmYR5F7ewXbwjsvdJPLbyIrVR8Fsd5cuvGChgK3pQ77baSI0?=
 =?us-ascii?Q?WRBehiZSNeekpWsgrlSOsHGkxmgN6KglvNFfuI2nrN165vuy2lyQngTYFuSC?=
 =?us-ascii?Q?uOWsZOCh75PzmwzJGoSTGdf4ShPyOrMdlUYYcSa8+EN4P+zs6XVbsPZDss2w?=
 =?us-ascii?Q?jJVxagT2R2GW90zQ9JYgm0Wum6y+cG9AhJh6iTYd8yIOLKBGUm37oIB6Vfo4?=
 =?us-ascii?Q?QS38Da9rik6cS8Ci/kfBkd0YSSnLV5BRMo7llUNQw9icK8f1YkJQHiC89WoG?=
 =?us-ascii?Q?0bN8mSmo3TnkzsycR91BQWGzQKAsX+hlyXKW1LsSSsw5kE8QLbAhAbeREZQj?=
 =?us-ascii?Q?bkOn/XyNvvWnJ7Tgw9BRahCbsFkUu6koOWx9d1bxJr8pWghCy3zWAWwmx+34?=
 =?us-ascii?Q?yWq4FtAlHk5WFz1/CSIKtZMToOiVUv5YRU0m3UQyr0XHILC3K+EJREbXCwqT?=
 =?us-ascii?Q?t4ZcL22fOLAIopO4UcHjX2HMRF8eOIjF/SjYLN/jNe2cMPFcN7K9Cuvgmkpu?=
 =?us-ascii?Q?j2qU0ki1g+QnbBVwYTYMwntIUt0j4mNo1qb2nvuQRV45rBxZ3dc90pnEE74p?=
 =?us-ascii?Q?TNZTsuwO43IjFD7ZQPBZaWkGN0JQRhkgqVvPVruAAnnMmMPHn9MFgD31g8W3?=
 =?us-ascii?Q?Rbqa/TcGHVdQ0UU8XIpOKPv2EFL//5ET1IbziWxH1ehHoVba17iDSJZik0+I?=
 =?us-ascii?Q?Bn0ztYFzTYtOkNBV0QjU/scLZxB8Kv2pwFgaAYp3lCbfIRXpsJZpTO/Fctil?=
 =?us-ascii?Q?XO2rCy5CbdPWw6gDi8F9jDukL7INP2az4MsJwddxsCHdJtd3UcYNjCOylqlw?=
 =?us-ascii?Q?dO4FEWGhBwXjcxSaFXSG1shnzgLBFNipr8yk55YgFE4SsfwiCGqY8dKhBvhn?=
 =?us-ascii?Q?WobmfTw+Sp3IS+co9foBhGiwwlj0rBnXanj+yLnQs8GSMCcdXHegcqZX1X/Q?=
 =?us-ascii?Q?Nq5xO3oyTnfGwTVy4quVKcsyuOcS66w2zQj7WtKAIcRY5cG30qSJkYyAi6rb?=
 =?us-ascii?Q?C88OEZk3FQ1HiyrfkbsxQX0ZTHFMifDGv7vYt/W0yvBlXzimBsowslNjzQGn?=
 =?us-ascii?Q?3D5NTQUQileNp9OreyM4DBtr1sKUHXfvHXRkMpOUdZfyKYIRl9UbKhLPqFyQ?=
 =?us-ascii?Q?JVIpXu9dBJsAdl/3681VMbdSp64K6rc5VLB08Xeuc9qVvc41WAtGMLyTkrhN?=
 =?us-ascii?Q?nFHySSEcRDBR5oOaAkQTRx9Fh2ZbRgHKPi55Oq+39g4NNPnIiMnEENVQbb+C?=
 =?us-ascii?Q?ZvFGDTvkWU7xWu1wZauAKso=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57f180d-2bed-40f8-0d8d-08daa1ff2a74
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:13.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0A+DJuvhUWjcCblaSstOs+vNGntKicBtrXiF/UrpOlKEjKbvKjZX1JtJYSnMH0v9sqrKs+8gBDQkudsiAHtkdnQaiUntiYpu2P6+pLfStPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4798
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

This commit adds driver support for accessing various information
reported by Ampere's SMpro co-processor such as Boot Progress and
other miscellaneous data.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v9:
  + Update SPDX licence                                     [Greg]
  + Use ATTRIBUTE_GROUPS()                                  [Greg]
  + Use dev_groups instead of sysfs_create_group() to avoid
  racing issue with user space                              [Greg]
  + Refactor code to avoid clever encoding issue            [Quan]

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
 drivers/misc/smpro-misc.c | 145 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/misc/smpro-misc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index b9ceee949dab..9947b7892bd5 100644
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
index bbe24d4511a3..87b54a4a4422 100644
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
index 000000000000..6c427141e51b
--- /dev/null
+++ b/drivers/misc/smpro-misc.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+#define BOOTSTAGE	0xB0
+#define BOOTSTAGE_LO	0xB1
+#define CUR_BOOTSTAGE	0xB2
+#define BOOTSTAGE_HI	0xB3
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
+	u16 boot_progress[3] = { 0 };
+	u32 bootstage;
+	u8 boot_stage;
+	u8 cur_stage;
+	u32 reg_lo;
+	u32 reg;
+	int ret;
+
+	/* Read current boot stage */
+	ret = regmap_read(misc->regmap, CUR_BOOTSTAGE, &reg);
+	if (ret)
+		return ret;
+
+	cur_stage = reg & 0xff;
+
+	ret = regmap_read(misc->regmap, BOOTSTAGE, &bootstage);
+	if (ret)
+		return ret;
+
+	boot_stage = (bootstage >> 8) & 0xff;
+
+	if (boot_stage > cur_stage)
+		return -EINVAL;
+
+	ret = regmap_read(misc->regmap,	BOOTSTAGE_LO, &reg_lo);
+	if (!ret)
+		ret = regmap_read(misc->regmap, BOOTSTAGE_HI, &reg);
+	if (ret)
+		return ret;
+
+	/* Firmware to report new boot stage next time */
+	if (boot_stage < cur_stage) {
+		ret = regmap_write(misc->regmap, BOOTSTAGE, ((bootstage & 0xff00) | 0x1));
+		if (ret)
+			return ret;
+	}
+
+	boot_progress[0] = bootstage;
+	boot_progress[1] = swab16(reg);
+	boot_progress[2] = swab16(reg_lo);
+
+	return sysfs_emit(buf, "%*phN\n", (int)sizeof(boot_progress), boot_progress);
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
+ATTRIBUTE_GROUPS(smpro_misc);
+
+static int smpro_misc_probe(struct platform_device *pdev)
+{
+	struct smpro_misc *misc;
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
+	return 0;
+}
+
+static struct platform_driver smpro_misc_driver = {
+	.probe		= smpro_misc_probe,
+	.driver = {
+		.name	= "smpro-misc",
+		.dev_groups = smpro_misc_groups,
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

