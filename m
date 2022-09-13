Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63D5B91FE
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfCw3PHDz2xGH
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:06:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fii-usa.com header.i=@fii-usa.com header.a=rsa-sha256 header.s=selector1 header.b=ohhia+b4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fii-usa.com (client-ip=40.107.94.43; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=charles.boyer@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fii-usa.com header.i=@fii-usa.com header.a=rsa-sha256 header.s=selector1 header.b=ohhia+b4;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRv8r1Scvz2xsD
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 05:46:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2wI0xg/k0NVp7AH8/tBKKxMvivtRG21qKoqW16BWVdV69+ZcZCdri5iF3YDUAjIohZzNYuU3idHAEqPr4eQT9X6sXDPNDdwabh/KyXew8JV3psObAl1VKVuvhpXFx+CUdICMYJ3G7UnOqHG6ykVFm8JhGouMj0tR5Y5Jz0rVWfNwqs06iVkjgVE1aMbmerM+60Ma5iame2MfeDqhszBV41XVNYbEPLlR+hWUb49t7irSjdVzHCxPy1o5+0UlbnqDT8F2phEto/Yf8fDuWKSmUixXY/ObUS2Qva4JbqljZMsL/hXpjzwvm65/eDsdO3yobESSdtQiiDfZhhRUEXKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQY+LbeGJp3SDD6KAjEoiwIpQzRhs0gEY0oRg5DFMRw=;
 b=dpDCh9yQ4u12pXSc1173kr4lWelhvd0KHJHI8giUYadkqhlJC3A2hukBRsj2avWIMF835XFOM7gS710J+LtXaYAURgZL+88bSPFZlsYohxSpjqpQyaZXBmbQw46cqLi3PaQQ5HQddGpYh1empc8XbC3MMpJi0VjbDD9sE72g8dbMgbWK4fl+gWCmgo88cXRpd9SGwVhlIw66sjJoA81swnrVXyry2J6bL0yzGTYEP7GPpL7fgWd42d8lnnhCm8HFdAoNWrZPW2iTqFUy4Er0f/JeLUffVl/3Y0Yz2WXzkld1dQfNr2EspFLTnmwv1Uvbd+kTHEzOyPLXC4ZB+aStng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fii-usa.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQY+LbeGJp3SDD6KAjEoiwIpQzRhs0gEY0oRg5DFMRw=;
 b=ohhia+b4bE+9iWlIQXL1EvselihaOC8qTW/6kKY7XXZ10nST5i5ilICJjcRcaeMrcZuIjDl4utsgrdN2rkbtDuflz+xfGmL632l2h7zd36ikQI6YK+vMZjG/xTGaLZ9pmUI2c1ZXdLuXz2zjm1SBqSrc1GaTz38Q1WkF+PyG87PPKJs72wJD1jx6lI2lM6PHVIn1y1j+Oh7B7T/FFqbsCNAhWHROJNIthrYyNeLG6Z5uwRkKeFeZ01VE4HKfclQv3H7s0hIFN+r1Nx5F3uASV/lh+blFk4SjDcYv/gNd1pHqs7UdHA/rmYN9G0wzReQI4S/xfDFOuf4UcDNJb8v70g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-usa.com;
Received: from SN6PR08MB4032.namprd08.prod.outlook.com (2603:10b6:805:22::29)
 by BN7PR08MB5121.namprd08.prod.outlook.com (2603:10b6:408:32::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 19:45:43 +0000
Received: from SN6PR08MB4032.namprd08.prod.outlook.com
 ([fe80::984b:27f0:a8b:8550]) by SN6PR08MB4032.namprd08.prod.outlook.com
 ([fe80::984b:27f0:a8b:8550%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 19:45:42 +0000
From: Charles Boyer <Charles.Boyer@fii-usa.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	Benjamin Fair <benjaminfair@google.com>,
	Vivekanand Veeracholan <vveerach@google.com>,
	Lancelot Kao <lancelot.cy.kao@fii-usa.com>,
	Mustafa Shehabi <mustafa.shehabi@fii-na.com>,
	Charles Boyer <Charles.Boyer@fii-usa.com>
Subject: [PATCH linux dev-5.15] iio:adc: Add TI TLA202x ADCs device driver
Date: Tue, 13 Sep 2022 14:44:51 -0500
Message-Id: <20220913194451.29378-1-Charles.Boyer@fii-usa.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0056.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::8) To SN6PR08MB4032.namprd08.prod.outlook.com
 (2603:10b6:805:22::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR08MB4032:EE_|BN7PR08MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 451d5394-1aba-4f7c-7c08-08da95c08b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QZ3VbvXP+u4AjOrjK1bllij3vFt76gCRlk0WSzlPFi7Hicz2ogBavEXq02uhquvjdAnzjhl+DqVnNfdXeBdvQHrcUT1g6S9C8o7CkAVbl6JgcBfrK9Pw/1QOIG/EAE2+ixImFeKObt2lRyRg/Whj7P5kRSdpTxAljWRofX9qf5+J2pwzcCTYqfnlzBel6j0EpTWdNvzQUpqC/lK2dbWXUlbOBofLR/wIgEZmZAi/KVZp0uN+K+DefgiDfdGDANtIBKi/9LTCPCunfEDy8p64w3h2vNCs2QauxhuIRf8+HII/PXQk/k1S+mJSuZfQV9MMUBXlbNY6z64/ApUAxAWAkasVeIaQZu836UWFTsFjJE7fEz/7UC6Qpz3V45VOA3emwzdRNJliemSmYb1BRSMtpEiicC6szl+B/t1fQH+kf7qe6TMOQbYGPwse3zOkSblH0AmbFWUiRWWqt5s1nI9BMSd1pLC11RV74uymCGOlgUR5TGeCT1f+hEe9kqjBIiJtq+mQBgHGBgzFOjyng3g54sKAIxiB6kgpRgLS0rZQvRLqN/2B5U0dAQUmhfcYgYYavksGOtgy4F98Nr+QKOMMH83USCsk++Pg/1+fKVgl2m0EJpcr8JsY9HUc3+zo83eXfyn8mjVS3jOfhfgZTJJ1Iz1paAddQBrcDbaCjhrF928PQR5EEjXFeURfA1+YlDjE7ZawTyWifzaW2BX1ZHi0ymOwGliujeWWeEAkySIw32e0svO48tKGWfL4pnm/lDYLlroHhrH2hAHXDoyDmgsa6qlbv8YNyHS7yijVYRFbNTg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB4032.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199015)(7049001)(6486002)(8676002)(186003)(966005)(2906002)(1076003)(38100700002)(66476007)(30864003)(8936002)(478600001)(66556008)(36756003)(2616005)(38350700002)(316002)(66946007)(4326008)(6506007)(52116002)(6512007)(26005)(110136005)(6666004)(5660300002)(86362001)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YlmnAHaNn02ZLCbWxe8thlDLJjeu38v6UEXS7VauUAY7dVu0gEJYpo9jCbqq?=
 =?us-ascii?Q?Rjrfsh6DWjm4qMtuEGBYRYxRwELFWKnBDL5PGU7AnqFJJLQqOAKen4LQZmZ4?=
 =?us-ascii?Q?rTUaurn/W3zwaGGHRMB2fhTyySY0HuebFqE36GwDiXta+5JEufT+u+5C6zO2?=
 =?us-ascii?Q?LpAX6XMBGSvChy9fUSpWNHvITxbc4Z2qJLpreyRFlUjEWaekPyvyD53Ll4iU?=
 =?us-ascii?Q?b+TZZ0pfPSGYIsoYtlf9O672tkjz11jC8Rq8p6vXw1E8W5GcpWVJ/2qn0mza?=
 =?us-ascii?Q?vHefWP4/0ZbOV2QC9oRC0XcdxSRA7yBf3skmIPHDwSg/yn4sAlIb9oDr+P9K?=
 =?us-ascii?Q?V3dxCwzVxKFXFCrurFUisGOO+lzXvSymhopnDNEQMupAGudPbPJ+g4EwQe8/?=
 =?us-ascii?Q?bKiD5tH6iDgv2oqhIwIggSAs9y9MzwlxwwfgkIQMYJDGeJ4437gnvpiEVM0I?=
 =?us-ascii?Q?TU/1n7UgPYwp/RrYl24YLT86E4wEdXcXhHnR5peTnCV701+yi/XY1fR+oJvX?=
 =?us-ascii?Q?BVg/IqpJDD+c7nrcHcVvMooFrqhj35moZsy6UNL49SfThdvPvnRhTV2nsL0G?=
 =?us-ascii?Q?rk7ZN/aUptJfyXw/dvIeyC/UkCfuQrO5zlOjLBF8NeyXJa5Zn+KGV/MYn6TG?=
 =?us-ascii?Q?2eJd1sQ7JMXxPYTwDHJbDPhIIGeK3IXwgixM65fExJxKjqep+f2yrrI453XL?=
 =?us-ascii?Q?ivVptQwrf9HuouR3qztY+RqIFu4ebQD9a1b/B91WcKbm4lAzGq1yVPZNlT4E?=
 =?us-ascii?Q?PXFfkFbdtn1qSvesCOG/xoIOx5/cPjDngAvKsDJ2qDbgbRF9++J67VLchvCj?=
 =?us-ascii?Q?Pylc1MTg+xm/7rVsdVY5N+nR3svEQZUNbcbePjlta/HoTi5BWtKR8vCpYplu?=
 =?us-ascii?Q?+6fXlmfBCFCcOjTpSLZpTJlKkQ4Jkw2h2DbtXJC+vG+Tw03gtk8E5BQQJmnE?=
 =?us-ascii?Q?Xd0OTywvYJ1316/Z2sJtzZCgOv8R5JOg3i/GRFw9cKqUGBsmzSVCUtZgDynH?=
 =?us-ascii?Q?kNKKkbdaAXK/4TvRmV040LEWN7JMAVUrimR7ryxGk42Mb94TA5ceu+gd6eXq?=
 =?us-ascii?Q?VChXFGuMpRcSsc9Sap5OHynj6/InGTVwtzR7DzzWSHqWyW3OZHLOnd+ctipH?=
 =?us-ascii?Q?jNls1/UqKkfyGIQh4bFJ6SLr73t5auShicILqdcUkAxIapwBuKsIa/HwilHt?=
 =?us-ascii?Q?ArAOO8sfLsr/l1t2D8l/ovf/qlWTYFiEzNAuwbSvOtB8LYI+xC/sSNBV3AaH?=
 =?us-ascii?Q?kdyML+Z4dvi7Pt0JYbEXIsP8Z5p5WpBV0zkBSZIE0yoU327k7hEB3eG/l/Gy?=
 =?us-ascii?Q?HVmoM+G/ZggjYsfcqLSVPy4kVH2GGwzr1hqIWy8OZ5/omjXs6NuLlBzvuL7E?=
 =?us-ascii?Q?xpR98YLtEbK1I7Cc2rqjeOZ1pwQuIHB5uRZN9sKlVJxeLkCsAjKBIwa5Ser0?=
 =?us-ascii?Q?7r6dKjKuVNrGCtMO4Qbx/5jsn+5iGzuHh+KrhDn5nyB6Itr4+t+aqzCldk3Q?=
 =?us-ascii?Q?HrOKQnt+hpWKBRlBy6H/D9j6bdfK74EPlHOmIgiDeAu1iOJi9AGztsiUwrhp?=
 =?us-ascii?Q?vXWWkyBzR5pzpLMde6RlOYjvX/uS1qUvgHSPx79fw05Cq2X4slZkJuLf9uTy?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451d5394-1aba-4f7c-7c08-08da95c08b04
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB4032.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 19:45:42.8057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jykv5OCkGXIy64weNAAoV+TsIBCuIERv+ft0AFZKjZGlYfvsOncnWYAN+Q9B0qFKm0+rlHMJN+pn09OF+N3W8xQ9WS8ovEaGbDR410hMiwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5121
X-Mailman-Approved-At: Thu, 15 Sep 2022 11:04:43 +1000
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
Cc: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Basic driver for Texas Instruments TLA202x series ADCs. Input
channels are configurable from the device tree. Input scaling
is supported. Trigger buffer support is not yet implemented.
https://patchwork.kernel.org/project/linux-iio/patch/1553608583-29006-1-git-send-email-ibtsam.haq.0x01@gmail.com/

Datasheets can be found here:
https://www.ti.com/lit/gpn/TLA2024

Signed-off-by: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Signed-off-by: Mustafa Shehabi <mustafa.shehabi@fii-na.com>
Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
---
 drivers/iio/adc/Kconfig      |  11 +
 drivers/iio/adc/Makefile     |   1 +
 drivers/iio/adc/ti-tla2024.c | 460 +++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 drivers/iio/adc/ti-tla2024.c

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index af168e1c9fdb..a08ac927538c 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1188,6 +1188,17 @@ config TI_AM335X_ADC
 	  To compile this driver as a module, choose M here: the module will be
 	  called ti_am335x_adc.
 
+config TI_TLA2024
+    tristate "Texas Instruments TLA2024/TLA2022/TLA2021 ADC driver"
+    depends on OF
+    depends on I2C
+    help
+      Say yes here to build support for Texas Instruments TLA2024,
+      TLA2022 or TLA2021 I2C Analog to Digital Converters.
+
+      To compile this driver as a module, choose M here: the
+      module will be called ti-tla2024.
+
 config TI_TLC4541
 	tristate "Texas Instruments TLC4541 ADC driver"
 	depends on SPI
diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
index d68550f493e3..52d2034b1501 100644
--- a/drivers/iio/adc/Makefile
+++ b/drivers/iio/adc/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_TI_ADS8688) += ti-ads8688.o
 obj-$(CONFIG_TI_ADS124S08) += ti-ads124s08.o
 obj-$(CONFIG_TI_ADS131E08) += ti-ads131e08.o
 obj-$(CONFIG_TI_AM335X_ADC) += ti_am335x_adc.o
+obj-$(CONFIG_TI_TLA2024) += ti-tla2024.o
 obj-$(CONFIG_TI_TLC4541) += ti-tlc4541.o
 obj-$(CONFIG_TI_TSC2046) += ti-tsc2046.o
 obj-$(CONFIG_TWL4030_MADC) += twl4030-madc.o
diff --git a/drivers/iio/adc/ti-tla2024.c b/drivers/iio/adc/ti-tla2024.c
new file mode 100644
index 000000000000..f0eed4ad68f8
--- /dev/null
+++ b/drivers/iio/adc/ti-tla2024.c
@@ -0,0 +1,460 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Texas Instruments TLA2021/TLA2022/TLA2024 12-bit ADC driver
+ *
+ * Copyright (C) 2019 Koninklijke Philips N.V.
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#define TLA2024_DATA 0x00
+#define TLA2024_DATA_RES_MASK GENMASK(15, 4)
+#define TLA2024_DATA_RES_SHIFT 4
+
+#define TLA2024_CONF 0x01
+#define TLA2024_CONF_OS_MASK BIT(15)
+#define TLA2024_CONF_OS_SHIFT 15
+#define TLA2024_CONF_MUX_MASK GENMASK(14, 12)
+#define TLA2024_CONF_MUX_SHIFT 12
+#define TLA2024_CONF_PGA_MASK GENMASK(11, 9)
+#define TLA2024_CONF_PGA_SHIFT 9
+#define TLA2024_CONF_MODE_MASK BIT(8)
+#define TLA2024_CONF_MODE_SHIFT 8
+#define TLA2024_CONF_DR_MASK GENMASK(7, 5)
+#define TLA2024_CONF_DR_SHIFT 5
+
+#define TLA2024_CONV_RETRY 10
+
+struct tla202x_model {
+	unsigned int mux_available;
+	unsigned int pga_available;
+};
+
+struct tla2024 {
+	struct i2c_client *i2c;
+	struct tla202x_model *model;
+	struct mutex lock;
+	u8 used_mux_channels;
+};
+
+struct tla2024_channel {
+	int ainp;
+	int ainn;
+	const char *datasheet_name;
+	bool differential;
+};
+
+static const struct tla2024_channel tla2024_all_channels[] = {
+	{0, 1, "AIN0-AIN1", 1},
+	{0, 3, "AIN0-AIN3", 1},
+	{1, 3, "AIN1-AIN3", 1},
+	{2, 3, "AIN2-AIN3", 1},
+	{0, -1, "AIN0", 0},
+	{1, -1, "AIN1", 0},
+	{2, -1, "AIN2", 0},
+	{3, -1, "AIN3", 0},
+};
+
+static int tla2024_find_chan_idx(u32 ainp_in, u32 ainn_in, u16 *idx)
+{
+	u16 i;
+
+	for (i = 0; i < ARRAY_SIZE(tla2024_all_channels); i++) {
+		if ((tla2024_all_channels[i].ainp == ainp_in) &&
+		    (tla2024_all_channels[i].ainn == ainn_in)) {
+			*idx = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+#define TLA202x_MODEL(_mux, _pga)		\
+	{					\
+		.mux_available = (_mux),	\
+		.pga_available = (_pga),	\
+	}
+
+enum tla2024_model_id {
+	TLA2021 = 0,
+	TLA2022 = 1,
+	TLA2024 = 2,
+};
+
+static struct tla202x_model tla202x_models[] = {
+	[TLA2021] = TLA202x_MODEL(0, 0),
+	[TLA2022] = TLA202x_MODEL(0, 1),
+	[TLA2024] = TLA202x_MODEL(1, 1),
+};
+
+static const int tla2024_scale[] = { /* scale, int plus micro */
+	3, 0, 2, 0, 1, 0, 0, 500000, 0, 250000, 0, 125000 };
+
+static int tla2024_get(struct tla2024 *priv, u8 addr, u16 mask,
+		       u16 shift, u16 *val)
+{
+	int ret;
+	u16 data;
+
+	ret = i2c_smbus_read_word_swapped(priv->i2c, addr);
+	if (ret < 0)
+		return ret;
+
+	data = ret;
+	*val = (mask & data) >> shift;
+
+	return 0;
+}
+
+static int tla2024_set(struct tla2024 *priv, u8 addr, u16 mask,
+		       u16 shift, u16 val)
+{
+	int ret;
+	u16 data;
+
+	ret = i2c_smbus_read_word_swapped(priv->i2c, addr);
+	if (ret < 0)
+		return ret;
+
+	data = ret;
+	data &= ~mask;
+	data |= mask & (val << shift);
+
+	ret = i2c_smbus_write_word_swapped(priv->i2c, addr, data);
+
+	return ret;
+}
+
+static int tla2024_read_avail(struct iio_dev *idev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+
+		*length = ARRAY_SIZE(tla2024_scale);
+		*vals = tla2024_scale;
+
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_LIST;
+	}
+
+	return -EINVAL;
+}
+
+static int tla2024_of_find_chan(struct tla2024 *priv, struct device_node *ch)
+{
+	u16 chan_idx = 0;
+	u32 ainp, ainn;
+	int ret;
+
+	ret = of_property_read_u32_index(ch, "single-channel", 0, &ainp);
+	if (ret) {
+		ret = of_property_read_u32_index(ch,
+						 "diff-channels", 0, &ainp);
+		if (ret)
+			return ret;
+
+		ret = of_property_read_u32_index(ch,
+						 "diff-channels", 1, &ainn);
+		if (ret)
+			return ret;
+
+	} else {
+		ainn = UINT_MAX;
+	}
+
+	ret = tla2024_find_chan_idx(ainp, ainn, &chan_idx);
+	if (ret < 0)
+		return ret;
+
+	/* if model doesn"t have mux then only channel 0 is allowed */
+	if (!priv->model->mux_available && chan_idx)
+		return -EINVAL;
+
+	/* if already used */
+	if ((priv->used_mux_channels) & (1 << chan_idx))
+		return -EINVAL;
+
+	return chan_idx;
+}
+
+static int tla2024_init_chan(struct iio_dev *idev, struct device_node *node,
+			     struct iio_chan_spec *chan)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	u16 chan_idx;
+	int ret;
+
+	ret = tla2024_of_find_chan(priv, node);
+	if (ret < 0)
+		return ret;
+
+	chan_idx = ret;
+	priv->used_mux_channels |= BIT(chan_idx);
+	chan->type = IIO_VOLTAGE;
+	chan->channel = tla2024_all_channels[chan_idx].ainp;
+	chan->channel2 = tla2024_all_channels[chan_idx].ainn;
+	chan->differential = tla2024_all_channels[chan_idx].differential;
+	chan->datasheet_name = tla2024_all_channels[chan_idx].datasheet_name;
+	chan->indexed = 1;
+	chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+	chan->info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SCALE);
+	chan->info_mask_shared_by_all_available = BIT(IIO_CHAN_INFO_SCALE);
+
+	return 0;
+}
+
+static int tla2024_wait(struct tla2024 *priv)
+{
+	int ret;
+	unsigned int retry = TLA2024_CONV_RETRY;
+	u16 status;
+
+	do {
+		if (!--retry)
+			return -EIO;
+		ret = tla2024_get(priv, TLA2024_CONF, TLA2024_CONF_OS_MASK,
+				  TLA2024_CONF_OS_SHIFT, &status);
+		if (ret < 0)
+			return ret;
+		if (!status)
+			usleep_range(25, 1000);
+	} while (!status);
+
+	return ret;
+}
+
+static int tla2024_singleshot_conv(struct tla2024 *priv,
+				   struct iio_chan_spec const *chan, int *val)
+{
+	int ret;
+	u32 ainp = chan->channel;
+	u32 ainn = chan->channel2;
+	u16 chan_id, data;
+	s16 tmp;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_MODE_MASK,
+			  TLA2024_CONF_MODE_SHIFT, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_find_chan_idx(ainp, ainn, &chan_id);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_MUX_MASK,
+			  TLA2024_CONF_MUX_SHIFT, chan_id);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_OS_MASK,
+			  TLA2024_CONF_OS_SHIFT, 1);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_wait(priv);
+	if (ret < 0)
+		return ret;
+
+	ret = tla2024_get(priv, TLA2024_DATA, TLA2024_DATA_RES_MASK,
+			  TLA2024_DATA_RES_SHIFT, &data);
+	if (ret < 0)
+		return ret;
+
+	tmp = (s16)(data << TLA2024_DATA_RES_SHIFT);
+	*val = tmp >> TLA2024_DATA_RES_SHIFT;
+	return IIO_VAL_INT;
+}
+
+static int tla2024_set_scale(struct tla2024 *priv, int val, int val2)
+{
+	int i;
+
+	if (!(priv->model->pga_available))
+		return -EINVAL; /* scale can't be changed if no pga */
+
+	for (i = 0; i < ARRAY_SIZE(tla2024_scale); i = i + 2) {
+		if ((tla2024_scale[i] == val) &&
+		    (tla2024_scale[i + 1] == val2))
+			break;
+	}
+
+	if (i == ARRAY_SIZE(tla2024_scale))
+		return -EINVAL;
+
+	return tla2024_set(priv, TLA2024_CONF, TLA2024_CONF_PGA_MASK,
+			   TLA2024_CONF_PGA_SHIFT, i >> 1);
+}
+
+static int tla2024_get_scale(struct tla2024 *priv, int *val, int *val2)
+{
+	u16 data;
+	int ret;
+
+	if (!(priv->model->pga_available)) {
+		*val = 1; /* Scale always 1 mV when no PGA */
+		return IIO_VAL_INT;
+	}
+	ret = tla2024_get(priv, TLA2024_CONF, TLA2024_CONF_PGA_MASK,
+			  TLA2024_CONF_PGA_SHIFT, &data);
+	if (ret < 0)
+		return ret;
+
+	/* gain for the 3bit pga values 6 and 7 is same as at 5 */
+	if (data >= (ARRAY_SIZE(tla2024_scale) >> 1))
+		data = (ARRAY_SIZE(tla2024_scale) >> 1) - 1;
+
+	*val = tla2024_scale[data << 1];
+	*val2 = tla2024_scale[(data << 1) + 1];
+	return IIO_VAL_INT_PLUS_MICRO;
+}
+
+static int tla2024_read_raw(struct iio_dev *idev,
+			    struct iio_chan_spec const *channel, int *val,
+			    int *val2, long mask)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		mutex_lock(&priv->lock);
+		ret = tla2024_singleshot_conv(priv, channel, val);
+		mutex_unlock(&priv->lock);
+		return ret;
+
+	case IIO_CHAN_INFO_SCALE:
+		return tla2024_get_scale(priv, val, val2);
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int tla2024_write_raw(struct iio_dev *idev,
+			     struct iio_chan_spec const *chan,
+			     int val, int val2, long mask)
+{
+	struct tla2024 *priv = iio_priv(idev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		mutex_lock(&priv->lock);
+		ret = tla2024_set_scale(priv, val, val2);
+		mutex_unlock(&priv->lock);
+		return ret;
+	}
+
+	return -EINVAL;
+}
+
+static int tla2024_of_chan_init(struct iio_dev *idev)
+{
+	struct device_node *node = idev->dev.of_node;
+	struct device_node *child;
+	struct iio_chan_spec *channels;
+	int ret, i, num_channels;
+
+	num_channels = of_get_available_child_count(node);
+	if (!num_channels) {
+		dev_err(&idev->dev, "no channels configured\n");
+		return -ENODEV;
+	}
+
+	channels = devm_kcalloc(&idev->dev, num_channels,
+				sizeof(struct iio_chan_spec), GFP_KERNEL);
+	if (!channels)
+		return -ENOMEM;
+
+	i = 0;
+	for_each_available_child_of_node(node, child) {
+		ret = tla2024_init_chan(idev, child, &channels[i]);
+		if (ret) {
+			of_node_put(child);
+			return ret;
+		}
+		i++;
+	}
+
+	idev->channels = channels;
+	idev->num_channels = num_channels;
+
+	return 0;
+}
+
+static const struct iio_info tla2024_info = {
+	.read_raw = tla2024_read_raw,
+	.write_raw = tla2024_write_raw,
+	.read_avail = tla2024_read_avail,
+};
+
+static int tla2024_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct iio_dev *iio;
+	struct tla2024 *priv;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -EOPNOTSUPP;
+
+	iio = devm_iio_device_alloc(&client->dev, sizeof(*priv));
+	if (!iio)
+		return -ENOMEM;
+
+	priv = iio_priv(iio);
+	priv->i2c = client;
+	priv->model = &tla202x_models[id->driver_data];
+	mutex_init(&priv->lock);
+
+	iio->dev.parent = &client->dev;
+	iio->dev.of_node = client->dev.of_node;
+	iio->name = client->name;
+	iio->modes = INDIO_DIRECT_MODE;
+	iio->info = &tla2024_info;
+
+	ret = tla2024_of_chan_init(iio);
+	if (ret < 0)
+		return ret;
+
+	return devm_iio_device_register(&client->dev, iio);
+}
+
+static const struct i2c_device_id tla2024_id[] = {
+	{ "tla2024", TLA2024 },
+	{ "tla2022", TLA2022 },
+	{ "tla2021", TLA2021 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tla2024_id);
+
+static const struct of_device_id tla2024_of_match[] = {
+	{ .compatible = "ti,tla2024" },
+	{ .compatible = "ti,tla2022" },
+	{ .compatible = "ti,tla2021" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tla2024_of_match);
+
+static struct i2c_driver tla2024_driver = {
+	.driver = {
+		.name = "tla2024",
+		.of_match_table = of_match_ptr(tla2024_of_match),
+	},
+	.probe = tla2024_probe,
+	.id_table = tla2024_id,
+};
+module_i2c_driver(tla2024_driver);
+
+MODULE_AUTHOR("Ibtsam Haq <ibtsam.haq@philips.com>");
+MODULE_DESCRIPTION("Texas Instruments TLA2021/TLA2022/TLA2024 ADC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

