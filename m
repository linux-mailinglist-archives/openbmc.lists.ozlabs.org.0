Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0250AE0F
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzR36s2Nz3bWm
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:50:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YNbJ74rJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::72f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YNbJ74rJ; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNH2fvDz2xnF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiewbDvI6GRvvVHbNXB9rLki3yItogvv4zWVeqW9yMDx9c7z2YzUh/0xIGQzO3vM6l41la7xvUuItGNAstmCQqbovgS1+/5BLvRGh0NIP7kcPAsEYJscmF6LXm0wWHMhy8Eg+CXqjHFVm4e9+jGTaZaW5aza4Dimhu7zZil6g5ZBYO8l/H0aK++D1LbatogNOK5E9H7YrXjLLt4Mtdff1W4MWi5+oW7ZKw5/43HZT7ony7Y64kj9h+zauFfh52KEUG0fadKxAr84Bz9ReeDJacc3oybTy63A14v1gQ8zygObGCuZQlZahlq3hOqGlZrkOHmEyNnxtNL0SJ8ShLcm6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S1bEHvPU7y+ESrUa70BctbsZtclu97EsZfzWX7eq00=;
 b=LxcYClu5Hct4EThjiNkwMM4d51yjqyy+YN/J0Rx7lEdLLTPINWNDEB/PMqpoL6STRlS8ByIuxoh26ioz/S/qc5rIcMoyfjbO5l+Bv1QV2EuggV3kehzGWp2V1RjhMKeOdG3u93jjWBV0UOUDMK2F0DCa+j5zjbKcd3XairFvhoCTjjeAm/EiZ7knfSCL7luzfxcDG3lKsUBocW5/KuXEGa1+ApbOC0gTkyIXxEaYaOBxScN4/ZsstGOBdaSAEjLYjCXzzrUASjhbZt4I9xl+P8aCpc4iUhHOCm4FZZeLtyFyV+d8L+pQTaGSxisJ2le1VfVk/pqpImBR9FhcPB9Hlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S1bEHvPU7y+ESrUa70BctbsZtclu97EsZfzWX7eq00=;
 b=YNbJ74rJI2r1MgN/ZysMeL+7SHVWpZ8J5jcat37X+ymSy03sMyAOBERD1Tu4XCDXrkQLReA0+TFHnsvnd7FrhtPVVDBfx8oqFE/ICumq+3dyWjRCYoVhT1WrHV5hydQ70kKIVzchbrMwcBLYE8B4WzlezHM44V0S4iYqT/2IL7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:28 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:28 +0000
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
Subject: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error monitor
 driver
Date: Fri, 22 Apr 2022 09:46:47 +0700
Message-Id: <20220422024653.2199489-4-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: aa7d6936-29b1-4680-aae1-08da240a707e
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB4653AD5DE364E0F2B4666398F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T0Jh5DCmZnoygJ8Voi/77b5zTus1yYyVd1ftNc3wQrjUrr81xG8ivG5hbso3bdW+OYDeBFp77fXX+ywm3RMvxdPtYLk0CwkdS9POzPrT4vrw7zNjzgoHknhz/PCxDqLLfBAS4oAHere41SQWpeLGzEdj0bTzpL2ob78IDFffLJQe4IvkyDl8is9dYOp1M1Fh8jY6DW22E1iHR4M7cAIofMDvBwkfGuK2RGp8XfGkdLdBItpBegloQOXsXKEHq1fcRlZCavaLCPDj76bfpUNb2064Q5PFiCnpzUXTOKaeo9NTVVqSaAODOt828lkIdIqNuzae/Q0wxJLhnar32uiXs1REIeWsVX2DWmjU989fFs4GthUTwYz01n1i5rApGsF88YK1AT4AfL9vga5fC6hKWdN9sgSC9URf0jkPs2RCw82WXw1iB2kCyVBTVuD/WteeX4bQwx81/z+qQbjBu/HGaobNU3Or/Kmn9TbuocY3mW+Dza276P0Z3Nmvn8KapF/RadjLP3NtxbAGloPTeB0Vyyp1FehxVmjrwZAWikxxvo66goqPstP1fCnn9+9yU0mQpgjG8Sm6mccPZug0LJv1d/Leeyr6Hq46WnsQdrk5biuQ0b5N+aQifamidaQZ61Y3EWcwIp6ICvaPCRj0a1Jx5ba8o509fXEN3US4B+rKshcllXCnODbRBJe3/2M/ZzjZ3ug8tegWqRKXhVRiF1hT+Se0uYG+RzRWCoSey2/XiBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(30864003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k8PxbsUvWy7znXyLGRiHvIOWDjgcJrzqBwZTnF92CrTbttV4nAwLhzvUd1my?=
 =?us-ascii?Q?/KNqy1huKPAYPazBN+DhelgpqWHbqVK3b22q/TE4FAEE+YTIslpj8D4m39Z5?=
 =?us-ascii?Q?ydtH6o3vpPQducKuMJK0/xslfieX4bJ26MggqQz1qea6OXdG2ZBujAmKegQM?=
 =?us-ascii?Q?GAxVH1p8B9lP+4N7kXD3KEDBU+mJhfz0MpINDkwyXgt6ci37IHw5t1LQRbCt?=
 =?us-ascii?Q?lbJGNFu3LWj+V/3fRBG2UNxSyKWDJNsWFTKzaYtEsvoKtt+VYindbRKrYIva?=
 =?us-ascii?Q?dsBUH742f0xmXUuWhz8fCGUutQu/72cvEvAXB1PV0jTcq6KgSMicY54DHmJp?=
 =?us-ascii?Q?8uaPhb6AujV2cJDA8LCEIi0qoeZv+YFFhm3im/dibQzUMnNwdraZRFgoXuzD?=
 =?us-ascii?Q?MZW/CgjMFjn6SRkkWfqhgyI4kEDF8OV0/FEkmjpniyYN2tQpxNNUooxoSxje?=
 =?us-ascii?Q?TZVU2KL/RitziS17BxFz719XEqtcJlt3sBKabg5r0uo9RZbxmoNjFHmTyekm?=
 =?us-ascii?Q?SUlPSzoQuLZlXAo8hImVHetPAOG+3fcRrwMd8kE3V57tjo7BoXkAAtKO2Byj?=
 =?us-ascii?Q?gmZhtCXvGTeTVt5344UlCSOSbhDBbJeAe/Jz9KxKvHLTrpnRG3L9ZjX1f/4D?=
 =?us-ascii?Q?nujVRTD/883wTJuVjZrXnRFEvmzy0VmUS9c8UaLzNHeCrUqCwildL9vKru0l?=
 =?us-ascii?Q?lWCqYsaaxC19MwVcKGKZZiWun9evGf2uUrdkSqYHDctrYNpVp8H50gbXpCf1?=
 =?us-ascii?Q?LBaXRSqpqUqgr5Vw1/gs6aVNqiV096MmSvpABRlOKu7vtTBNfZMDTrr6+RgC?=
 =?us-ascii?Q?s90OUmNRV1/DpSVNVgVVzBHJRN/W0ylcpAnyxOK1JEopTQIO4Inv/nuIbCPk?=
 =?us-ascii?Q?pFghlp1y2bbVkVMYsn6qLs6FcKRnenGmh/TWF9caO3GHbI218x3MGO77VwBz?=
 =?us-ascii?Q?dtkFO6ojyeDzg28eCROCXgkEjnYvqFADkyz9CrvwqKUz6Ogo518bEp85SwXq?=
 =?us-ascii?Q?oOKKuiEhGh+z+L41GAPJItKoQhEK5OdKTvCIZ5/D54v3+TIZG5U61FmyOF8A?=
 =?us-ascii?Q?G47Sw/nW6Bgp/w4xbS4rJ18XgqCefgRTVnKGCY/Z700P76nRmMjX7n4+1YGL?=
 =?us-ascii?Q?hQSKhmUjsNTKs/5YjRxuAD7Yzo1GfMiGPnqXyoPTjMtUi6nnQ2TleAcGF3mW?=
 =?us-ascii?Q?cCxu1nDDDyFRag+2oirLLRjjMstUcU3gqWhKxmTYZMM00jp25sctKWOXX4XB?=
 =?us-ascii?Q?b0uGIznO+Fr3J3LJEqOmwl6mplqfxjUIJl7cz2UM1jXHDfrVcmWNTMw65SrV?=
 =?us-ascii?Q?+OVApb8HRfpjz2zmw1XzTAZBAabPS3x4CIORa3oJgYNsiD0zQc6hOcFvgRB4?=
 =?us-ascii?Q?N+d882AmGYSZWubXoEih0IhXKRmjR3Tgt1KVnGFnuVtlzkq07/imdNaDe0ZT?=
 =?us-ascii?Q?UYpmMWU5OabXDfpmJCnXHn2TI+VyyGQ2eFR0kJpl/D9PoJPY6d7MujD3Q8OW?=
 =?us-ascii?Q?CV59kVAkwtHvRTgBiduUWhcZg5as70zJviUnkSTutDXSGGiDT5L41r+mwUcq?=
 =?us-ascii?Q?/t8+pBY2/ze0VQXAjGNU1NmFNsKrA5OPDF1U7x/qIuui0ukf5UWPDkeXTsIH?=
 =?us-ascii?Q?EXS0Q3ZcP2macTu+mDQetizH4SEIQMtxfQRbrvEKtbY5iNRDyMbfb9FAXa48?=
 =?us-ascii?Q?nbv4kzW8Vgm9AsC46+WY2BZyVu6uxiFtOm9bCKBSAHWBaqd/hiuRE3QKwk6k?=
 =?us-ascii?Q?+UHkHGmYC0BpMFYJhOhOHa1D5WbIsRFaGmTgy3OhGTbv0dAz8rh2?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7d6936-29b1-4680-aae1-08da240a707e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:28.4624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc9+UT3q7k5pVE+l5dlgbQIfEAPRPlI+0dJzWVVhHAmR5HPAE/UQMkeWfXe7dYEpa/P2VHuP/7Qy9Y4VcykRRIN+Sgq5VL+FI2oX8nhE2po=
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

This commit adds Ampere's SMpro error monitor driver for monitoring
and reporting RAS-related errors as reported by SMpro co-processor
found on Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v8:
  + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
  + Avoid uninitialized variable use               [kernel test robot]
  + Switch to use sysfs_emit()                                  [Greg]
  + Make sysfs to return single value                           [Greg]
  + Change errors_* sysfs to error_*                            [Quan]
  + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
  overflow status of each type of HW errors                     [Quan]
  + Add some minor refactor                                     [Quan]

Changes in v7:
  + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
  + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
  + Validate number of errors before read                       [Quan]
  + Fix wrong return type of *_show() function     [kernel test robot]
  + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
  + Use pointer instead of stack memory                         [Quan]

Changes in v6:
  + First introduced in v6 [Quan]

 drivers/misc/Kconfig        |  12 +
 drivers/misc/Makefile       |   1 +
 drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
 3 files changed, 490 insertions(+)
 create mode 100644 drivers/misc/smpro-errmon.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 41d2bb0ae23a..9fbe6797c440 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -176,6 +176,18 @@ config SGI_XP
 	  this feature will allow for direct communication between SSIs
 	  based on a network adapter and DMA messaging.
 
+config SMPRO_ERRMON
+	tristate "Ampere Computing SMPro error monitor driver"
+	depends on MFD_SMPRO || COMPILE_TEST
+	help
+	  Say Y here to get support for the SMpro error monitor function
+	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
+	  loading, the driver creates sysfs files which can be use to gather
+	  multiple HW error data reported via read and write system calls.
+
+	  To compile this driver as a module, say M here. The driver will be
+	  called smpro-errmon.
+
 config CS5535_MFGPT
 	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
 	depends on MFD_CS5535
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 70e800e9127f..483308a6e113 100644
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
index 000000000000..df7d8fc4ff3f
--- /dev/null
+++ b/drivers/misc/smpro-errmon.c
@@ -0,0 +1,477 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Ampere Computing SoC's SMpro Error Monitoring Driver
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
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
+/* Event Data Registers */
+#define VRD_WARN_FAULT_EVENT_DATA	0x78
+#define VRD_HOT_EVENT_DATA		0x79
+#define DIMM_HOT_EVENT_DATA		0x7A
+#define DIMM_2X_REFRESH_EVENT_DATA	0x96
+
+#define MAX_READ_BLOCK_LENGTH	48
+#define NUM_I2C_MESSAGES	2
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
+	u8 max_err_cnt;	/* Max num of errors */
+};
+
+/*
+ * Included Address of registers to get Count, Length of data and Data
+ * of the 48 bytes error data
+ */
+static struct smpro_error_hdr smpro_error_table[NUM_48BYTES_ERR_TYPE] = {
+	{CORE_CE_ERR_CNT, CORE_CE_ERR_LEN, CORE_CE_ERR_DATA, 32},
+	{CORE_UE_ERR_CNT, CORE_UE_ERR_LEN, CORE_UE_ERR_DATA, 32},
+	{MEM_CE_ERR_CNT, MEM_CE_ERR_LEN, MEM_CE_ERR_DATA, 16},
+	{MEM_UE_ERR_CNT, MEM_UE_ERR_LEN, MEM_UE_ERR_DATA, 16},
+	{PCIE_CE_ERR_CNT, PCIE_CE_ERR_LEN, PCIE_CE_ERR_DATA, 96},
+	{PCIE_UE_ERR_CNT, PCIE_UE_ERR_LEN, PCIE_UE_ERR_DATA, 96},
+	{OTHER_CE_ERR_CNT, OTHER_CE_ERR_LEN, OTHER_CE_ERR_DATA, 8},
+	{OTHER_UE_ERR_CNT, OTHER_UE_ERR_LEN, OTHER_UE_ERR_DATA, 8},
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
+static struct smpro_int_error_hdr list_smpro_int_error_hdr[2] = {
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
+/* Included Address of event source and data registers */
+static u8 smpro_event_table[NUM_EVENTS_TYPE] = {
+	VRD_WARN_FAULT_EVENT_DATA,
+	VRD_HOT_EVENT_DATA,
+	DIMM_HOT_EVENT_DATA,
+};
+
+static ssize_t smpro_event_data_read(struct device *dev,
+				     struct device_attribute *da, char *buf,
+				     int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	s32 event_data;
+	int ret;
+
+	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
+	if (ret)
+		goto done;
+
+	ret = sysfs_emit(buf, "%02x%04x\n", channel, event_data);
+	/* Clear event after read */
+	if (event_data != 0)
+		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
+done:
+	return ret;
+}
+
+static ssize_t smpro_overflow_data_read(struct device *dev, struct device_attribute *da,
+					char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_error_hdr *err_info;
+	s32 err_count;
+	int ret;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
+	if (ret)
+		return ret;
+
+	/* Bit 8 indicates the overflow status */
+	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
+}
+
+static ssize_t smpro_error_data_read(struct device *dev, struct device_attribute *da,
+				     char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	unsigned char err_data[MAX_READ_BLOCK_LENGTH];
+	struct smpro_error_hdr *err_info;
+	s32 err_count, err_length;
+	int count = 0;
+	int ret;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
+	/* Error count is the low byte */
+	err_count &= 0xff;
+	if (ret || !err_count || err_count > err_info->max_err_cnt)
+		goto done;
+
+	ret = regmap_read(errmon->regmap, err_info->err_len, &err_length);
+	if (ret || err_length <= 0)
+		goto done;
+
+	if (err_length > MAX_READ_BLOCK_LENGTH)
+		err_length = MAX_READ_BLOCK_LENGTH;
+
+	memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
+	ret = regmap_noinc_read(errmon->regmap, err_info->err_data, err_data, err_length);
+	if (ret < 0)
+		goto done;
+
+	/*
+	 * The output of Core/Memory/PCIe/Others UE/CE errors follows below format:
+	 * <Error Type><Error SubType><Instance><Error Status>\
+	 * <Error Address><Error Misc 0><Error Misc 1><Error Misc2><Error Misc 3>
+	 * Where:
+	 *  + Error Type: The hardwares cause the errors. (1 byte)
+	 *  + SubType: Sub type of error in the specified hardware error. (1 byte)
+	 *  + Instance: Combination of the socket, channel,
+	 *    slot cause the error. (2 bytes)
+	 *  + Error Status: Encode of error status. (4 bytes)
+	 *  + Error Address: The address in device causes the errors. (8 bytes)
+	 *  + Error Misc 0/1/2/3: Addition info about the errors. (8 bytes for each)
+	 * Reference Altra SOC BMC Interface specification.
+	 */
+	count = sysfs_emit(buf, "%02x%02x%04x%08x%016llx%016llx%016llx%016llx%016llx\n",
+			   err_data[0], err_data[1], *(u16 *)&err_data[2],
+			   *(u32 *)&err_data[4], *(u64 *)&err_data[8],
+			   *(u64 *)&err_data[16], *(u64 *)&err_data[24],
+			   *(u64 *)&err_data[32], *(u64 *)&err_data[40]);
+
+	/* go to next error */
+	ret = regmap_write(errmon->regmap, err_info->err_count, 0x100);
+done:
+	return ret ? ret : count;
+}
+
+/*
+ * Output format:
+ * <errType><image><dir><Location><errorCode><data>
+ * Where:
+ *   + errType: SCP Error Type (3 bits)
+ *      1: Warning
+ *      2: Error
+ *      4: Error with data
+ *   + image: SCP Image Code (8 bits)
+ *   + dir: Direction (1 bit)
+ *      0: Enter
+ *      1: Exit
+ *   + location: SCP Module Location Code (8 bits)
+ *   + errorCode: SCP Error Code (16 bits)
+ *   + data : Extensive data (32 bits)
+ *      All bits are 0 when errType is warning or error.
+ */
+static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
+				       char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr *err_info;
+	unsigned int data_lo = 0, data_hi = 0;
+	unsigned int ret_hi, ret_lo;
+	unsigned int err_type;
+	unsigned int value;
+	int count = 0;
+	int ret;
+
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &value);
+	if (ret)
+		goto done;
+
+	if (!((channel == RAS_SMPRO_ERRS && (value & BIT(0))) ||
+	      (channel == RAS_PMPRO_ERRS && (value & BIT(1)))))
+		goto done;
+
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->err_type, &err_type);
+	if (ret)
+		goto done;
+
+	ret = regmap_read(errmon->regmap, err_info->err_info_low, &ret_lo);
+	if (ret)
+		goto done;
+
+	ret = regmap_read(errmon->regmap, err_info->err_info_high, &ret_hi);
+	if (ret)
+		goto done;
+
+	if (err_type & BIT(2)) {
+		/* Error with data type */
+		ret = regmap_read(errmon->regmap, err_info->err_data_low, &data_lo);
+		if (ret)
+			goto done;
+
+		ret = regmap_read(errmon->regmap, err_info->err_data_high, &data_hi);
+		if (ret)
+			goto done;
+
+		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
+				   4, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
+				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
+		/* clear the read errors */
+		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(2));
+
+	} else if (err_type & BIT(1)) {
+		/* Error type */
+		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
+				   2, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
+				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
+		/* clear the read errors */
+		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(1));
+
+	} else if (err_type & BIT(0)) {
+		/* Warning type */
+		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
+				   1, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
+				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
+		/* clear the read errors */
+		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(0));
+	}
+done:
+	return ret ? ret : count;
+}
+
+#define ERROR_OVERFLOW_RO(_error, _index) \
+	static ssize_t overflow_##_error##_show(struct device *dev,            \
+						struct device_attribute *da,   \
+						char *buf)                     \
+	{                                                                      \
+		return smpro_overflow_data_read(dev, da, buf, _index);         \
+	}                                                                      \
+	static DEVICE_ATTR_RO(overflow_##_error)
+
+ERROR_OVERFLOW_RO(core_ce, CORE_CE_ERRS);
+ERROR_OVERFLOW_RO(core_ue, CORE_UE_ERRS);
+ERROR_OVERFLOW_RO(mem_ce, MEM_CE_ERRS);
+ERROR_OVERFLOW_RO(mem_ue, MEM_UE_ERRS);
+ERROR_OVERFLOW_RO(pcie_ce, PCIE_CE_ERRS);
+ERROR_OVERFLOW_RO(pcie_ue, PCIE_UE_ERRS);
+ERROR_OVERFLOW_RO(other_ce, OTHER_CE_ERRS);
+ERROR_OVERFLOW_RO(other_ue, OTHER_UE_ERRS);
+
+#define ERROR_RO(_error, _index) \
+	static ssize_t error_##_error##_show(struct device *dev,            \
+					     struct device_attribute *da,   \
+					     char *buf)                     \
+	{                                                                   \
+		return smpro_error_data_read(dev, da, buf, _index);         \
+	}                                                                   \
+	static DEVICE_ATTR_RO(error_##_error)
+
+ERROR_RO(core_ce, CORE_CE_ERRS);
+ERROR_RO(core_ue, CORE_UE_ERRS);
+ERROR_RO(mem_ce, MEM_CE_ERRS);
+ERROR_RO(mem_ue, MEM_UE_ERRS);
+ERROR_RO(pcie_ce, PCIE_CE_ERRS);
+ERROR_RO(pcie_ue, PCIE_UE_ERRS);
+ERROR_RO(other_ce, OTHER_CE_ERRS);
+ERROR_RO(other_ue, OTHER_UE_ERRS);
+
+static ssize_t error_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(error_smpro);
+
+static ssize_t error_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(error_pmpro);
+
+#define EVENT_RO(_event, _index) \
+	static ssize_t event_##_event##_show(struct device *dev,            \
+					     struct device_attribute *da,   \
+					     char *buf)                     \
+	{                                                                   \
+		return smpro_event_data_read(dev, da, buf, _index);         \
+	}                                                                   \
+	static DEVICE_ATTR_RO(event_##_event)
+
+EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENTS);
+EVENT_RO(vrd_hot, VRD_HOT_EVENTS);
+EVENT_RO(dimm_hot, DIMM_HOT_EVENTS);
+
+static struct attribute *smpro_errmon_attrs[] = {
+	&dev_attr_overflow_core_ce.attr,
+	&dev_attr_overflow_core_ue.attr,
+	&dev_attr_overflow_mem_ce.attr,
+	&dev_attr_overflow_mem_ue.attr,
+	&dev_attr_overflow_pcie_ce.attr,
+	&dev_attr_overflow_pcie_ue.attr,
+	&dev_attr_overflow_other_ce.attr,
+	&dev_attr_overflow_other_ue.attr,
+	&dev_attr_error_core_ce.attr,
+	&dev_attr_error_core_ue.attr,
+	&dev_attr_error_mem_ce.attr,
+	&dev_attr_error_mem_ue.attr,
+	&dev_attr_error_pcie_ce.attr,
+	&dev_attr_error_pcie_ue.attr,
+	&dev_attr_error_other_ce.attr,
+	&dev_attr_error_other_ue.attr,
+	&dev_attr_error_smpro.attr,
+	&dev_attr_error_pmpro.attr,
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
2.35.1

