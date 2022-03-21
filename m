Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 962964E21E8
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:17:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSCR3bxKz30JY
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=l4DkPXy2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=l4DkPXy2; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS8f2wMVz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:14:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT9vVRcJsp+D+QmgslY83O1fZY30K5iQxcwDEcOKCOA/pheZGm8MMDj8FXiRQ/O2LA4hTSg3mtxKrm3ZMWqJmlF280VFA1BlYg1esLV5TUTMP+KFPuMXb/igzy/hnDYLg0ZDXeZ/NMNwqY7AISVaVJJ1W4P7w6HhfJO8SM9IGfQvQkeKBN1A3iTzABDcDZW5hAsxv8oSegKIv0LeKWlK1XFKf21/+DpHRIeO4oyjgZwArG9TIUGjgZiJZbJDCVcWn5xjciMc/H7qXcHSXy8609A7diwcM5k4sunnz88u55hSWEj9DrMkvyihCSyJ1UaGViZkfAFCjwdaKImIM52i+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcYYNWgHsrE/Z8uZsrktWl10lcxxHkqVI8oR5ESOmsE=;
 b=Pn1C35dUncdrTQ7q/N2whW3qbMw7S0T5RyDMBejenZSZVN94EFt0gZZpsS58r+8qIKNglMBMhVdgMC4fd/niseXAoRKwMX8F6Qw7Gz6U2xYkajreQRGZ9FollByjgvF2QHwUfZbrPC6GiTu7w3t0b9lPNrvDsdNZIQ3T637TVsSb5nCzbOtkkUpCz5vIfmN76CYc8n5/5KCVtqym47n6jAecJJbhPVoD3EORYrvbWf0JTji0f+evPIUox/qW4T5syWQ+FxzpJYACMQOMGm6IswmZp4uisnrAth/wTdyPwdebahsCWN6z7C5hraa7/7f+J+j4lYj7SrDEznDbXHOYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcYYNWgHsrE/Z8uZsrktWl10lcxxHkqVI8oR5ESOmsE=;
 b=l4DkPXy2+QsxJjDtzASTq/DvFFdG9d5nhJdgUg2a/KFOX2a8eSQa+37qN8h+9hhsvhNEHRpfbiCjYt25YqSnLL/TgwhWL1HknBwYtuj+hCjyW3NmLSrpAqOwYycPOyXO4EZJpiMqKsSyoGHYGjnW+hT18VoxotMDGv//HHhzsg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:14:49 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:14:49 +0000
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
Subject: [PATCH v7 3/9] misc: smpro-errmon: Add Ampere's SMpro error monitor
 driver
Date: Mon, 21 Mar 2022 15:13:49 +0700
Message-Id: <20220321081355.6802-4-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 20658a0e-7d5f-40af-38a1-08da0b12ddf8
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB2738C56CB810D3149BEF159DF2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lyayk42mPDvJcpqarXKUcoAYTgoTOdbf4Qj+4CEq91TR30J0yw3NadKd7kzreF6QHxjRycpYHL8xCA/0DeCeIrfSDxdsCkGeQ8ZL7rZIgCo6bg51AdFpWD+jKZEREMS6+/hYeGMyo/2puf3c+hRk0Yv5W5EHIoU15jWCbNUrFzoIqdgLBbKzZXBWSqAGrvfkr25x8JlgRcsvuUpigDNsG2T6f1i15UvpNbNEbG30eg/fGGXsEKcJGJhhzN31zzgfBAUz0slktGBvdukQ6DwkIW3PMhsufSwF4Cb9EdO2aiF4HSFrsi7qvrkF54K0z1rpNqd20y71d3bReVXpDEj4JIBR/ItcFnBDEBFu8eYBUPL7QIw4+tzd0+ML8E3K4HY2dsug3WW3dyzxLMglt+SBBZau8wINPPYMCO5ltD5UC5gUTZlZWgMNHmeWL0/GQ3yCfWXrov3BziCnOW13W0Anh9sc+TciaBDS4+/hWQA+ZWgOZ9R11L9VafYD7q5pDj7F0nirts/7g1wHKGnf8t1bwuJOJGhepNdk7dtjS1BFhpDJ2YTgy2gpT7hp2nQ7yhzFzVGyG1iimmUN4vYGuWFlAmmoXr1y0w01KDm2mbXMZcRuqFazA89z2zBii1ZhPbGkEyapxSfVYISD/fEg4KxgZccL+easIyYGmYa/7nmDwsrxtnO+urVkTmZYTUkqWDkxC5baN6QSCMv4U8V4aiG+iXwzL2ko7z99Pebc10FObY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(30864003)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ytNQ8u1g/XfJdRr/0nk0YEIQfSgrdUIAOYj61u7QV6N+WspOTUC9YdYHXo8?=
 =?us-ascii?Q?J9GmisAYKv0G5au2t2WLkf81GpXyi+OxQaHSsIKZ8wVVkbJMs8Gqj/aU/H0X?=
 =?us-ascii?Q?6UH2zn+YjsKEqNzSgx5MffjAzz7253WnEtb2JYfq7hazeuas4nt/O3w1pVWO?=
 =?us-ascii?Q?TMMmBMDs3Yyne5zV8UXbw8/moC4bhtnBx0LqOm+wKI8xaL0Gg/O79Mka2Xdy?=
 =?us-ascii?Q?zxqzcPjPxQG2e/6ynY5mdxZoNMSG5rJ6yi6NSuqODlOcBHXdHyJVvs3MwU8A?=
 =?us-ascii?Q?VHM84QlVXkTOredfSCz2O5gR1HrzPquITAcXGWorZ9u7i0kQnXHjqdd3MTGu?=
 =?us-ascii?Q?I/vecq+LBX5n3d17wEV5Dj6FSsuXKVV7AsfQULUalj/qgNk5kynklumURXaD?=
 =?us-ascii?Q?t2l416VODi2+MPHF2a+L6TF3e7eLY1j9sTvQNTsh5IBnPUsaJjaSJ5ealyhA?=
 =?us-ascii?Q?uZ0BLPaGapDRuiG7X8WeWlAg20N19nFgIdJEcnwGbXQuP8l3S5PmDgUrBp4s?=
 =?us-ascii?Q?xW/xDPJ7DdLUHt5jcMoAVHJbWOrTt9kSSjWxgT7QZ0lBWCb0paTiP3bWDH6Z?=
 =?us-ascii?Q?obI8giTuaoVmfxEqI957yii3/EipfPhozx5onDxbZ23Kgvszj0KOK9wBps7J?=
 =?us-ascii?Q?JuocmsdlA2/Lxhki/3r5jJumCTuVvP3ae1jAF2EXhUXVde0hdEDGh0yY7zRg?=
 =?us-ascii?Q?ah0UG60Qw51bgJyqMrXdY6Np+b/tu0PfXHu3Cx1NSlbpyUrekdoSdoCV2lZp?=
 =?us-ascii?Q?7bE1txRZtN8IQgdiLv9lBgJcg/NiYGWACQSrzY1FqX531XesH7b8nHdj5jxq?=
 =?us-ascii?Q?CIUH0upVO+ktUmbFUK3KgRQLZmE/sfnRMwKOuHCDCW8L7gyOsoxQNsuKgkRS?=
 =?us-ascii?Q?aIHSkzCIbRUjTLlK5caaO4rWQdKQQnEY5JxU60x6OdCAkq7NrAI5+V25VPeV?=
 =?us-ascii?Q?JLvYeDBjHvuaAbv1GiFeAnGqZqklljyRGl4SxRE/x5maWNd+bXktADtuPIQG?=
 =?us-ascii?Q?ATRrba9zhSXbRinhmQzRt+RiQDZRS8KxFB3WgVEAmKzaaORFuUhYIXHthA4o?=
 =?us-ascii?Q?ZYvgT0tVgx3XUfmsfFkJRAC7mAfD5cFeqEZh/5Coiq07nkphoQOAjeeyqzeL?=
 =?us-ascii?Q?Su/vKoQRlodDEYFMZrrBjpDjbA9oDC01MzGvHkO3fDDFAVb4ZKK1ZYYK9xWs?=
 =?us-ascii?Q?WRGZJ9cPySqTHUHutyMcAzQV2iLx2bJDdDKa0eZooJNNMr71/mNsodkmGLGn?=
 =?us-ascii?Q?D4su5EidZ+7wKFxvyWcraTRBFRJ3hxMrplidySizmynyC1HIJFfklHEIyX4f?=
 =?us-ascii?Q?xj0QCTKpandtFW6twEzHS56BV58BduWUGmLTQRDjm+cDLIzM0+ln6ECnLLad?=
 =?us-ascii?Q?JjH8I5Lsdtzd6zbAsGOktezuFlsYhyeXwU/PLkuF586e2AIe6AJxKwHjUE93?=
 =?us-ascii?Q?9sNo1k2kd5vvnIfHwxIYe1pkF2XtVOhRb89upJaUSYxfhrJ5mtqC0OYFfOP6?=
 =?us-ascii?Q?q2aw040SBgnji1Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20658a0e-7d5f-40af-38a1-08da0b12ddf8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:14:49.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RM50jgX+H6aOcs29lLfDhALaUhcLoKeMvzrrDoGisOsaI1k01bDytwItRfBDoQXTPj0SSxyCCZb/rwgj/0tqm18vU7KY9w8AZNWFCcZyIY=
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

This commit adds Ampere's SMpro error monitor driver for monitoring
and reporting RAS-related errors as reported by SMpro co-processor
found on Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v7:
  + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
  + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
  + Validate number of errors before read                       [Quan]
  + Fix wrong return type of *_show() function     [kernel test robot]
  + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
  + Use pointer instead of stack memory                         [Quan]

Changes in v6:
  + First introduced in v6 [Quan]

 drivers/misc/Kconfig        |   7 +
 drivers/misc/Makefile       |   1 +
 drivers/misc/smpro-errmon.c | 517 ++++++++++++++++++++++++++++++++++++
 3 files changed, 525 insertions(+)
 create mode 100644 drivers/misc/smpro-errmon.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index a2b26426efba..4e1a0b451f3d 100644
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
index 000000000000..50970a48d5df
--- /dev/null
+++ b/drivers/misc/smpro-errmon.c
@@ -0,0 +1,517 @@
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
+	unsigned char msg[MAX_MSG_LEN] = {'\0'};
+	s32 event_data;
+	int ret;
+
+	*buf = 0;
+	if (channel >= NUM_EVENTS_TYPE)
+		goto done;
+
+	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
+	if (ret)
+		goto done;
+
+	ret = scnprintf(msg, MAX_MSG_LEN, "%02x %04x\n", channel, event_data);
+	strncat(buf, msg, ret);
+	/* Clear event after read */
+	if (event_data != 0)
+		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
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
+	struct smpro_error_hdr *err_info;
+	s32 err_count, err_length;
+	int ret, len, i;
+
+	*buf = 0;
+	if (channel >= NUM_48BYTES_ERR_TYPE)
+		goto done;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
+	/* Error count is the low byte */
+	err_count &= 0xff;
+	if (ret || err_count > err_info->max_err_cnt)
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
+	for (i = 0; i < err_count; i++) {
+		ret = regmap_read(errmon->regmap, err_info->err_len, &err_length);
+		if (ret || err_length <= 0)
+			break;
+
+		if (err_length > MAX_READ_BLOCK_LENGTH)
+			err_length = MAX_READ_BLOCK_LENGTH;
+
+		memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
+		ret = regmap_noinc_read(errmon->regmap, err_info->err_data, err_data, err_length);
+		if (ret < 0)
+			break;
+
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
+		ret = regmap_write(errmon->regmap, err_info->err_count, 0x100);
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
+static s32 smpro_internal_err_get_info(struct regmap *regmap, u8 addr, u8 addr1,
+				       u8 addr2, u8 addr3, u8 subtype, char *buf)
+{
+	unsigned int ret_hi, ret_lo, data_lo, data_hi;
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
+	struct smpro_int_error_hdr *err_info;
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
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->err_type, &err_type);
+	if (ret)
+		goto done;
+
+	/* Warning type */
+	if (err_type & BIT(0)) {
+		ret = smpro_internal_err_get_info(errmon->regmap, err_info->warn_info_low,
+						  err_info->warn_info_high, 0xff, 0xff, 1, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+
+	/* Error with data type */
+	if (err_type & BIT(2)) {
+		ret = smpro_internal_err_get_info(errmon->regmap,
+						  err_info->err_info_low,
+						  err_info->err_info_high,
+						  err_info->err_data_low,
+						  err_info->err_data_high, 4, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+	/* Error type */
+	else if (err_type & BIT(1)) {
+		ret = smpro_internal_err_get_info(errmon->regmap,
+						  err_info->err_info_low,
+						  err_info->err_info_high,
+						  0xff, 0xff, 2, msg);
+		if (ret < 0)
+			goto done;
+
+		strncat(buf, msg, ret);
+	}
+
+	/* clear the read errors */
+	regmap_write(errmon->regmap, err_info->err_type, err_type);
+
+done:
+	return strlen(buf);
+}
+
+static ssize_t errors_core_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, CORE_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_core_ce);
+
+static ssize_t errors_core_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, CORE_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_core_ue);
+
+static ssize_t errors_mem_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, MEM_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_mem_ce);
+
+static ssize_t errors_mem_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, MEM_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_mem_ue);
+
+static ssize_t errors_pcie_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, PCIE_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pcie_ce);
+
+static ssize_t errors_pcie_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, PCIE_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pcie_ue);
+
+static ssize_t errors_other_ce_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, OTHER_CE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_other_ce);
+
+static ssize_t errors_other_ue_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_error_data_read(dev, da, buf, OTHER_UE_ERRS);
+}
+static DEVICE_ATTR_RO(errors_other_ue);
+
+static ssize_t errors_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(errors_smpro);
+
+static ssize_t errors_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERRS);
+}
+static DEVICE_ATTR_RO(errors_pmpro);
+
+static ssize_t event_vrd_warn_fault_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_event_data_read(dev, da, buf, VRD_WARN_FAULT_EVENTS);
+}
+static DEVICE_ATTR_RO(event_vrd_warn_fault);
+
+static ssize_t event_vrd_hot_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_event_data_read(dev, da, buf, VRD_HOT_EVENTS);
+}
+static DEVICE_ATTR_RO(event_vrd_hot);
+
+static ssize_t event_dimm_hot_show(struct device *dev, struct device_attribute *da, char *buf)
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
2.35.1

