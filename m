Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10734E9FC
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 16:12:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8rxB6rp7z3brc
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 01:12:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=tMlLZG8O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.101;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=tMlLZG8O; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2101.outbound.protection.outlook.com [40.107.243.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8rvr0hMRz3bqy;
 Wed, 31 Mar 2021 01:11:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD0NkUI4i4XvHK5E7Yhnta32tCSaOfURtZwaBAXvUSsmBBpaMaHTBl7KCHVkrfyXOvNyB0v51uTHD4KBqNKKfc5Xau2kkNaY9L/ZirHTCVbpd65ktSjYL3nxg+Qk3HhV1yOns0rFVBNj1wHHoVWuKFa44Ugwu5Ve5fQP3OxC4K5Ao6CbibHIdcrd20cHLInEDJQ/Bcfbdb+cFTqMHb1TZhDY/1Z6/b4uMBSwu84J8dHcw9zM8qtfnIMvvNlsFxP0BZ7PtBkV2iF13t1B22nO1JmyGM6vqiIxWl+8QuIpJ3YF+zRSltR2/nJrZ6WRxbPM7yfQG+3ad8LO4xLPPJpgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl7AbniGyQZLNJ7+Q4QC8JWrE1KO2/ydCpx9+Flx7Co=;
 b=jP4Q2IoluGDzM9khjJIvCW6gx9CwmTvrs+pGOb8FY73w9HKx3f7odi3wvoc5n18fUedASYt7MKd/xj43dpoaPLpBa63Fl3g+CSCxyo7AtsGrq4b6vrDt0HWbt0iBsHPUSnRdR6L3bgtI/6jR4SCx++P+ql66jibcpfv3rLq1XbYIXhesl0vG2KyhSn+/sWk2fgNrBtMzCthf1l8FEi+CjTjJmgeuOHvsuYjiZG9uI42iz56sJlPUJJcawucoE0xFVd0YZ8uF8/tw+xeyzqqPBdqfEXV/2jti8taIq/WxTWRMtoGXU/VPbLXqy10ZQZPUcox2zPBvIhN3OP4xJRjmVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl7AbniGyQZLNJ7+Q4QC8JWrE1KO2/ydCpx9+Flx7Co=;
 b=tMlLZG8OFm33cpsiqH+YEmLlNWh/Dl8yM+lSIZUduRgyKjYUTJfDwJmnmYjhsvLTlqHPsTpbCZ0oVHUD0mMhcw6s//8LD3g36/s0n9tAkxGSqPQxKKXRHoZS6hKfoJ85KE6zEuZZdfV+23PGxb2cmEC2uHkh4hEMimJcKPHLNqM=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6338.prod.exchangelabs.com (2603:10b6:303:7b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.30; Tue, 30 Mar 2021 14:10:59 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 14:10:59 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
Date: Tue, 30 Mar 2021 21:10:28 +0700
Message-Id: <20210330141029.20412-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210330141029.20412-1-quan@os.amperecomputing.com>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Tue, 30 Mar 2021 14:10:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c4c0f9-ef12-4f20-552d-08d8f385a45c
X-MS-TrafficTypeDiagnostic: MW4PR01MB6338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6338F9057B655744F3B5FFD5F27D9@MW4PR01MB6338.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gSpemlJkYk4VOSTL4nB6teVURY3xRD5fkvmz3oCx5L/5ylI84aSl6nzGEY5go7swV5z18iWF8qCk24xj3YqFLmKMmi3fh210fivPq/XsrdZsNhNJ8d/6HjPpGZXw3iLGY5QB30KySG5POnDaNVH+v5dD1fRo4TFiWxV6qsSGbqNJQjBxPHOQvedWsbZtEbznkNY89WOUY6cryqIuEUs17d+KkGEp0SRch5HF2gwJqj3Kj1A+++f4Tlxb4ES+4J1PJXfQPYGDylFDC2Kt1xPHWzho5222XEU1ZgIYWF4tgH/xgQpaDzYbChs33/QHLxfSBqmkjwSLEYz5RV8EWOwTGWvCKxTLDr/Rf/S0P3Z7ksc9az0rbKMkVQrp36oz8/M8ibZ9n3+fgueg8ww8vK31XqHEJJM+kOEepB7Z2DQ/tJojOU0a7nShNXj9c6N6OcNXrgz+6PjUVtNxJ6Nsfd8cCmMXI8twU3NeLHgBxvJXtRC4OpHovHWzpts3nHMw2pOgSEAVPoBsSBpeW1JqXeeDLN1UC6hOsQHQ39G/C8Svsg/ye/dQuEk4MNbfXrnFV91pHWP+W5Oym9ZLXHEkemfBsZ8WOhNfUpjxeDrufeT392ZoQALgYsaCOuoKlEpVDsAOtZsMG+FbyXv0VCjiwcK125EC31PLbeIdi4HL9PkRW1n3ueV7A9J7Ehu8560Eq7hnwOmadPEZvmn/RRsyhn3oBOoRa/Uy4Z6vjI2rdMUHNGIDjdn3+plFBxfAVeqAvj2/Z81Y1d/xLG1QGIXWuEvGYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(5660300002)(2906002)(956004)(186003)(16526019)(6512007)(66556008)(66476007)(6666004)(921005)(107886003)(52116002)(8676002)(7416002)(8936002)(86362001)(38100700001)(66946007)(110136005)(6506007)(83380400001)(498600001)(6486002)(4326008)(1076003)(30864003)(26005)(54906003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NjNRc1AyMXBIby9YNTFNQ3I1NzJWcXp6dXo2NjZmZExqQVFVZG1oOWFVR3Ns?=
 =?utf-8?B?dkpQWTBhMnc1VVZ0Lzd5OE1pMjYwd3Rmd04zaUF3ZGJOKzQvdElYYWhuL2Vz?=
 =?utf-8?B?aW1tUHpXYUR5bnowUFFxM1Irc1NldUVISUZaMzRjZnBjTUtvTXZxTlJzd0Vk?=
 =?utf-8?B?OURGdDhPRjNFY3hlSVRUOHVzZjB1Wkg4bnN0QnFXMFFqV04yOTJqY2FmZHl3?=
 =?utf-8?B?bVM0R2pUMVlpR0t1b3ZpMlpHOWYwNEpNQUJSRVhYaEIrU1MvcEhVOU5yTWkx?=
 =?utf-8?B?M0ZHbE9aMjVPYjVpeWsvUEtqT0xTc0JxYk5yRC85dDlWSWprUUFYMDlZKzVR?=
 =?utf-8?B?Rm1ybG9pY29wbDdxR1dMbzhwREh2ZlJYaXpIblpGdDZ5bU5rQW5NODM3anBZ?=
 =?utf-8?B?US9TY3A5V2pDMmQvZFlWS20wbTFNTHpPaXNIek9aN3hvdzFkYjRadzJsM0tV?=
 =?utf-8?B?dmJhODVqekhQTE5pQmhKUVRDU0lDbFlNRzV6UlpoaWw4R0hTUlpoUHd6dGVD?=
 =?utf-8?B?VFp2R2ZqTmU1Q1VHS3lwMEtYcURMV0wyUWZzUktDbDdoNGZtc1J3UEh5MjY3?=
 =?utf-8?B?NERGNngrNCtnNU9ybDFSWW9NS0RhcjNUdEtIakpqci9HWUluK0h0VmxZSTdU?=
 =?utf-8?B?Vnl4MkpkYTR5RzJWR3M2emE1UHUvQkM0NVlEVmM5TmVqcXptOEpkUzBoTElN?=
 =?utf-8?B?QlFzQU1NbDRoajJYRnl1Y29CcGpnR2pGVS9WeUhtYkdnL3NMUVZMNEYvMGpk?=
 =?utf-8?B?WVFmVld2Z3BudUl0MkZvdkowSFAySFlhZEM5RVJCYXUwN2hycHlnQnY5RWZi?=
 =?utf-8?B?WU15WmxGWVh4b05hbmNKK2NGSEZsZmhHZTNoYTBWdU1PRE5Pc2FjcFFiZDJZ?=
 =?utf-8?B?ZjFFOVo4RFlFMXNvWXVQbGpxMllobHlaTlpORFcxekNUNkhuWWFXaktReFMy?=
 =?utf-8?B?U255K09pdzVzcjhnODlUZjVqTE9YUmh2bWRNQ0tFRjRIT0xNNm1mTGhuQ1ln?=
 =?utf-8?B?TFFKNW8ydVdMNE1xWGZ5dnRqN0hHYTZ6dHVEQW5qQWtGSjA3NWtYM1B2ZkZ3?=
 =?utf-8?B?RWF4ckVSZVVQZnJTd2dSWjhSVXFxbVR1ZkxlbFZLZExsLzhXQmpaT2w2RUVu?=
 =?utf-8?B?elhoeGNybDRQdmEzM29nNjg0ZWZKbW10NHZFeGtEREFWdVZQalVJR1BvMnRB?=
 =?utf-8?B?TkhZSDZSZjRBMzkyTlBVelAyVzJlNkRaZUlGNStZaTlGVmNKbG5BOU12Y0Yx?=
 =?utf-8?B?Z1BTNWxCK2dvV29QUFY0Sk9YeEl0bmgvUlVGWW1wS2RGKzVvMTRFT2hqYUdP?=
 =?utf-8?B?b2dFS2JaT0ZyS3FGR1dWZU1PRXNjUUY5YzJHZzdMRjBUYVZLWmVSd0U4OU1z?=
 =?utf-8?B?dXgwU2tZeUR5TkVpNytRejkzdXZxZ0srTnVVUThDcjkvandEaEFaNUJmMmZF?=
 =?utf-8?B?VFBycVBHblRiVTBkRmdWeExqZ2FQMjBpWndKMkp5OER6ZERlb1BCaDBVcE1z?=
 =?utf-8?B?QVk0WVBhbGQvamFtRlg0N2pUT2hFNjNqSXhuaUFNajIvYzU4VlFFazY0Qkd0?=
 =?utf-8?B?a2xoV0ZhejZsbE5xR2NDZHNkdlR2aGVRMWc1Qk45TENpM2lMQkR0dFVHZjhS?=
 =?utf-8?B?RE1PZkJldWpPWk4ybmxXL1VSM1ZuWkJPSDVUUFpzK3VNWXVtQ2RpVDVscGcw?=
 =?utf-8?B?eHE5YlFZa3ViM0ZOMUV6NnNJQWpqaWJIcWtORUlud28vUzNsSERRVDFUUFF2?=
 =?utf-8?Q?uOvWFARjh7aAlW3g1iyHNhEp+K2ttGAJqs5Uy63?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c4c0f9-ef12-4f20-552d-08d8f385a45c
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 14:10:59.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUJuAzAV1NTx1k5k1de2OfGuZQdwbYLOL7QU2pZxE1mLb82pQBb6Cuzm503waeM8phJP9kpdo0/7USbWJJ+MsyW2hnuCdGgzu4szQ0lN1fE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6338
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
in-band IPMI communication with their host in management (BMC) side.

This commits adds support specifically for Aspeed AST2500 which commonly
used as Board Management Controllers.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/char/ipmi/Kconfig           |  22 +
 drivers/char/ipmi/Makefile          |   2 +
 drivers/char/ipmi/ssif_bmc.c        | 645 ++++++++++++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h        |  92 ++++
 drivers/char/ipmi/ssif_bmc_aspeed.c | 132 ++++++
 5 files changed, 893 insertions(+)
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 07847d9a459a..45be57023577 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -133,6 +133,28 @@ config ASPEED_BT_IPMI_BMC
 	  found on Aspeed SOCs (AST2400 and AST2500). The driver
 	  implements the BMC side of the BT interface.
 
+config SSIF_IPMI_BMC
+	tristate "SSIF IPMI BMC driver"
+	select I2C
+	select I2C_SLAVE
+	help
+	  This enables the IPMI SMBus system interface (SSIF) at the
+	  management (BMC) side.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF).
+
+config ASPEED_SSIF_IPMI_BMC
+	depends on ARCH_ASPEED || COMPILE_TEST
+	select SSIF_IPMI_BMC
+	tristate "Aspeed SSIF IPMI BMC driver"
+	help
+	  Provides a driver for the SSIF IPMI interface found on
+	  Aspeed AST2500 SoC.
+
+	  The driver implements the BMC side of the SMBus system
+	  interface (SSIF), specific for Aspeed AST2500 SoC.
+
 config IPMB_DEVICE_INTERFACE
 	tristate 'IPMB Interface handler'
 	depends on I2C
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..05b993f7335b 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -27,3 +27,5 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
+obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
+obj-$(CONFIG_ASPEED_SSIF_IPMI_BMC) += ssif_bmc_aspeed.o
diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
new file mode 100644
index 000000000000..ae6e8750c795
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+
+#include "ssif_bmc.h"
+
+/*
+ * Call in WRITE context
+ */
+static int send_ssif_bmc_response(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!non_blocking) {
+retry:
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       !ssif_bmc->response_in_progress);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (ssif_bmc->response_in_progress) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+
+		goto retry;
+	}
+
+	/*
+	 * Check the response data length from userspace to determine the type
+	 * of the response message whether it is single-part or multi-part.
+	 */
+	ssif_bmc->is_singlepart_read =
+		(ssif_msg_len(&ssif_bmc->response) <= (MAX_PAYLOAD_PER_TRANSACTION + 1)) ?
+		true : false; /* 1: byte of length */
+
+	ssif_bmc->response_in_progress = true;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
+}
+
+/*
+ * Call in READ context
+ */
+static int receive_ssif_bmc_request(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
+{
+	unsigned long flags;
+	int ret;
+
+	if (!non_blocking) {
+retry:
+		ret = wait_event_interruptible(ssif_bmc->wait_queue,
+					       ssif_bmc->request_available);
+		if (ret)
+			return ret;
+	}
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (!ssif_bmc->request_available) {
+		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+		if (non_blocking)
+			return -EAGAIN;
+		goto retry;
+	}
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	return 0;
+}
+
+/* Handle SSIF message that will be sent to user */
+static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	mutex_lock(&ssif_bmc->file_mutex);
+
+	ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
+	if (ret < 0)
+		goto out;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	count = min_t(ssize_t, count, ssif_msg_len(&ssif_bmc->request));
+	memcpy(&msg, &ssif_bmc->request, count);
+	ssif_bmc->request_available = false;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	ret = copy_to_user(buf, &msg, count);
+out:
+	mutex_unlock(&ssif_bmc->file_mutex);
+
+	return (ret < 0) ? ret : count;
+}
+
+/* Handle SSIF message that is written by user */
+static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
+			      loff_t *ppos)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	struct ssif_msg msg;
+	unsigned long flags;
+	ssize_t ret;
+
+	if (count > sizeof(struct ssif_msg))
+		return -EINVAL;
+
+	mutex_lock(&ssif_bmc->file_mutex);
+
+	ret = copy_from_user(&msg, buf, count);
+	if (ret)
+		goto out;
+
+	spin_lock_irqsave(&ssif_bmc->lock, flags);
+	if (count >= ssif_msg_len(&ssif_bmc->response))
+		memcpy(&ssif_bmc->response, &msg, count);
+	else
+		ret = -EINVAL;
+	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
+
+	if (ret)
+		goto out;
+
+	ret = send_ssif_bmc_response(ssif_bmc, file->f_flags & O_NONBLOCK);
+	if (!ret && ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
+out:
+	mutex_unlock(&ssif_bmc->file_mutex);
+
+	return (ret < 0) ? ret : count;
+}
+
+static long ssif_bmc_ioctl(struct file *file, unsigned int cmd, unsigned long param)
+{
+	return 0;
+}
+
+static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
+{
+	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
+	unsigned int mask = 0;
+
+	mutex_lock(&ssif_bmc->file_mutex);
+	poll_wait(file, &ssif_bmc->wait_queue, wait);
+
+	/*
+	 * The request message is now available so userspace application can
+	 * get the request
+	 */
+	if (ssif_bmc->request_available)
+		mask |= POLLIN;
+
+	mutex_unlock(&ssif_bmc->file_mutex);
+	return mask;
+}
+
+/*
+ * System calls to device interface for user apps
+ */
+static const struct file_operations ssif_bmc_fops = {
+	.owner		= THIS_MODULE,
+	.read		= ssif_bmc_read,
+	.write		= ssif_bmc_write,
+	.poll		= ssif_bmc_poll,
+	.unlocked_ioctl	= ssif_bmc_ioctl,
+};
+
+/* Called with ssif_bmc->lock held. */
+static int handle_request(struct ssif_bmc_ctx *ssif_bmc)
+{
+	if (ssif_bmc->set_ssif_bmc_status)
+		ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
+
+	/* Request message is available to process */
+	ssif_bmc->request_available = true;
+	/*
+	 * This is the new READ request.
+	 * Clear the response buffer of the previous transaction
+	 */
+	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
+	wake_up_all(&ssif_bmc->wait_queue);
+	return 0;
+}
+
+/* Called with ssif_bmc->lock held. */
+static int complete_response(struct ssif_bmc_ctx *ssif_bmc)
+{
+	/* Invalidate response in buffer to denote it having been sent. */
+	ssif_bmc->response.len = 0;
+	ssif_bmc->response_in_progress = false;
+	ssif_bmc->nbytes_processed = 0;
+	ssif_bmc->remain_len = 0;
+	memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
+	wake_up_all(&ssif_bmc->wait_queue);
+	return 0;
+}
+
+static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 response_len = 0;
+	int idx = 0;
+	u8 data_len;
+
+	data_len = ssif_bmc->response.len;
+	switch (ssif_bmc->smbus_cmd) {
+	case SSIF_IPMI_MULTIPART_READ_START:
+		/*
+		 * Read Start length is 32 bytes.
+		 * Read Start transfer first 30 bytes of IPMI response
+		 * and 2 special code 0x00, 0x01.
+		 */
+		*val = MAX_PAYLOAD_PER_TRANSACTION;
+		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
+		ssif_bmc->block_num = 0;
+
+		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
+		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
+		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
+
+		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
+
+		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
+		       response_len);
+		break;
+
+	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
+		/*
+		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
+		 * IPMI data plus block number byte.
+		 */
+		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
+			/*
+			 * This is READ End message
+			 *  Return length is the remaining response data length
+			 *  plus block number
+			 *  Block number 0xFF is to indicate this is last message
+			 *
+			 * Return length is: remain response plus block number
+			 */
+			*val = ssif_bmc->remain_len + 1;
+			ssif_bmc->block_num = 0xFF;
+			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
+			response_len = ssif_bmc->remain_len;
+		} else {
+			/*
+			 * This is READ Middle message
+			 *  Response length is the maximum SMBUS transfer length
+			 *  Block number byte is incremented
+			 * Return length is maximum SMBUS transfer length
+			 */
+			*val = MAX_PAYLOAD_PER_TRANSACTION;
+			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
+			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
+			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
+			ssif_bmc->block_num++;
+		}
+
+		memcpy(&ssif_bmc->response_buf[idx],
+		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
+		       response_len);
+		break;
+
+	default:
+		/* Do not expect to go to this case */
+		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
+		break;
+	}
+
+	ssif_bmc->nbytes_processed += response_len;
+}
+
+static void set_singlepart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf = (u8 *)&ssif_bmc->response;
+
+	/*
+	 * Do not expect the IPMI response has data length 0.
+	 * With some I2C SMBus controllers (Aspeed I2C), return 0 for
+	 * the SMBus Read Request callback might cause bad state for
+	 * the bus. So return 1 byte length so that master will
+	 * resend the Read Request because the length of response is
+	 * less than a normal IPMI response.
+	 *
+	 * Otherwise, return the length of IPMI response
+	 */
+	*val = (buf[ssif_bmc->msg_idx]) ? buf[ssif_bmc->msg_idx] : 0x1;
+}
+
+/* Process the IPMI response that will be read by master */
+static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf;
+	u8 pec_len, addr, len;
+	u8 pec = 0;
+
+	pec_len = ssif_bmc->pec_support ? 1 : 0;
+	/* PEC - Start Read Address */
+	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+	pec = i2c_smbus_pec(pec, &addr, 1);
+	/* PEC - SSIF Command */
+	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
+	/* PEC - Restart Write Address */
+	addr = addr | 0x01;
+	pec = i2c_smbus_pec(pec, &addr, 1);
+
+	if (ssif_bmc->is_singlepart_read) {
+		/* Single-part Read processing */
+		buf = (u8 *)&ssif_bmc->response;
+
+		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
+			ssif_bmc->msg_idx++;
+			*val = buf[ssif_bmc->msg_idx];
+		} else if (ssif_bmc->response.len &&
+			   (ssif_bmc->msg_idx == ssif_bmc->response.len)) {
+			ssif_bmc->msg_idx++;
+			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
+		} else {
+			*val = 0;
+		}
+		/* Invalidate response buffer to denote it is sent */
+		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
+			complete_response(ssif_bmc);
+	} else {
+		/* Multi-part Read processing */
+		switch (ssif_bmc->smbus_cmd) {
+		case SSIF_IPMI_MULTIPART_READ_START:
+		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
+			buf = (u8 *)&ssif_bmc->response_buf;
+			*val = buf[ssif_bmc->msg_idx];
+			ssif_bmc->msg_idx++;
+			break;
+		default:
+			/* Do not expect to go to this case */
+			pr_err("Error: Unexpected SMBus command received 0x%x\n",
+			       ssif_bmc->smbus_cmd);
+			break;
+		}
+		len = (ssif_bmc->block_num == 0xFF) ?
+		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
+		if (ssif_bmc->msg_idx == (len + 1)) {
+			pec = i2c_smbus_pec(pec, &len, 1);
+			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
+		}
+		/* Invalidate response buffer to denote last response is sent */
+		if (ssif_bmc->block_num == 0xFF &&
+		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
+			complete_response(ssif_bmc);
+		}
+	}
+}
+
+static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
+{
+	u8 *buf;
+	u8 smbus_cmd;
+
+	buf = (u8 *)&ssif_bmc->request;
+	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
+		return;
+
+	smbus_cmd = ssif_bmc->smbus_cmd;
+	switch (smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		/* Single-part write */
+		buf[ssif_bmc->msg_idx - 1] = *val;
+		ssif_bmc->msg_idx++;
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+		/* Reset length to zero */
+		if (ssif_bmc->msg_idx == 1)
+			ssif_bmc->request.len = 0;
+
+		fallthrough;
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		/* Multi-part write, 2nd byte received is length */
+		if (ssif_bmc->msg_idx == 1) {
+			ssif_bmc->request.len += *val;
+			ssif_bmc->recv_len = *val;
+		} else {
+			buf[ssif_bmc->msg_idx - 1 +
+			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
+		}
+
+		ssif_bmc->msg_idx++;
+
+		break;
+	default:
+		/* Do not expect to go to this case */
+		pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);
+		break;
+	}
+}
+
+static bool validate_pec(struct ssif_bmc_ctx *ssif_bmc)
+{
+	u8 rpec = 0, cpec = 0;
+	bool ret = true;
+	u8 addr, index;
+	u8 *buf;
+
+	buf = (u8 *)&ssif_bmc->request;
+	switch (ssif_bmc->smbus_cmd) {
+	case SSIF_IPMI_SINGLEPART_WRITE:
+		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
+			/* PEC is not included */
+			ssif_bmc->pec_support = false;
+			return true;
+		}
+
+		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1))
+			goto error;
+
+		/* PEC is included */
+		ssif_bmc->pec_support = true;
+		rpec = buf[ssif_bmc->msg_idx - 2];
+		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+		cpec = i2c_smbus_pec(cpec, &addr, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
+		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
+		if (rpec != cpec) {
+			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
+			ret = false;
+		}
+
+		break;
+	case SSIF_IPMI_MULTIPART_WRITE_START:
+	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
+	case SSIF_IPMI_MULTIPART_WRITE_END:
+		index = ssif_bmc->request.len - ssif_bmc->recv_len;
+		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
+			/* PEC is not included */
+			ssif_bmc->pec_support = false;
+			return true;
+		}
+
+		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1))
+			goto error;
+
+		/* PEC is included */
+		ssif_bmc->pec_support = true;
+		rpec = buf[ssif_bmc->msg_idx - 2 + index];
+		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
+		cpec = i2c_smbus_pec(cpec, &addr, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
+		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
+		/* As SMBus specification does not allow the length
+		 * (byte count) in the Write-Block protocol to be zero.
+		 * Therefore, it is illegal to have the last Middle
+		 * transaction in the sequence carry 32-bytes and have
+		 * a length of ‘0’ in the End transaction.
+		 * But some users may try to use this way and we should
+		 * prevent ssif_bmc driver broken in this case.
+		 */
+		if (ssif_bmc->recv_len != 0)
+			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
+
+		if (rpec != cpec) {
+			pr_err("Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
+			ret = false;
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+error:
+	/* Do not expect to go to this case */
+	pr_err("Error: Unexpected length received %d\n", ssif_msg_len(&ssif_bmc->request));
+
+	return false;
+}
+
+static void complete_write_received(struct ssif_bmc_ctx *ssif_bmc)
+{
+	u8 cmd = ssif_bmc->smbus_cmd;
+
+	/* A BMC that receives an invalid PEC shall drop the data for the write
+	 * transaction and any further transactions (read or write) until
+	 * the next valid read or write Start transaction is received
+	 */
+	if (!validate_pec(ssif_bmc)) {
+		pr_err("Received invalid PEC\n");
+		return;
+	}
+
+	if (cmd == SSIF_IPMI_SINGLEPART_WRITE || cmd == SSIF_IPMI_MULTIPART_WRITE_END)
+		handle_request(ssif_bmc);
+}
+
+/*
+ * Callback function to handle I2C slave events
+ */
+static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
+{
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	spin_lock(&ssif_bmc->lock);
+
+	/* I2C Event Handler:
+	 *   I2C_SLAVE_READ_REQUESTED	0x0
+	 *   I2C_SLAVE_WRITE_REQUESTED	0x1
+	 *   I2C_SLAVE_READ_PROCESSED	0x2
+	 *   I2C_SLAVE_WRITE_RECEIVED	0x3
+	 *   I2C_SLAVE_STOP		0x4
+	 */
+	switch (event) {
+	case I2C_SLAVE_READ_REQUESTED:
+		ssif_bmc->msg_idx = 0;
+		if (ssif_bmc->is_singlepart_read)
+			set_singlepart_response_buffer(ssif_bmc, val);
+		else
+			set_multipart_response_buffer(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_REQUESTED:
+		ssif_bmc->msg_idx = 0;
+		break;
+
+	case I2C_SLAVE_READ_PROCESSED:
+		handle_read_processed(ssif_bmc, val);
+		break;
+
+	case I2C_SLAVE_WRITE_RECEIVED:
+		/*
+		 * First byte is SMBUS command, not a part of SSIF message.
+		 * SSIF request buffer starts with msg_idx 1 for the first
+		 *  buffer byte.
+		 */
+		if (ssif_bmc->msg_idx == 0) {
+			/* SMBUS command can vary (single or multi-part) */
+			ssif_bmc->smbus_cmd = *val;
+			ssif_bmc->msg_idx++;
+		} else {
+			handle_write_received(ssif_bmc, val);
+		}
+
+		break;
+
+	case I2C_SLAVE_STOP:
+		/*
+		 * PEC byte is appended at the end of each transaction.
+		 * Detect PEC is support or not after receiving write request
+		 * completely.
+		 */
+		if (ssif_bmc->last_event == I2C_SLAVE_WRITE_RECEIVED)
+			complete_write_received(ssif_bmc);
+		/* Reset message index */
+		ssif_bmc->msg_idx = 0;
+		break;
+
+	default:
+		break;
+	}
+	ssif_bmc->last_event = event;
+	spin_unlock(&ssif_bmc->lock);
+
+	return 0;
+}
+
+struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+	int ret;
+
+	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc) + sizeof_priv, GFP_KERNEL);
+	if (!ssif_bmc)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock_init(&ssif_bmc->lock);
+
+	init_waitqueue_head(&ssif_bmc->wait_queue);
+	ssif_bmc->request_available = false;
+	ssif_bmc->response_in_progress = false;
+
+	mutex_init(&ssif_bmc->file_mutex);
+
+	/* Register misc device interface */
+	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
+	ssif_bmc->miscdev.name = DEVICE_NAME;
+	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
+	ssif_bmc->miscdev.parent = &client->dev;
+	ret = misc_register(&ssif_bmc->miscdev);
+	if (ret)
+		goto out;
+
+	ssif_bmc->client = client;
+	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
+
+	/* Register I2C slave */
+	i2c_set_clientdata(client, ssif_bmc);
+	ret = i2c_slave_register(client, ssif_bmc_cb);
+	if (ret) {
+		misc_deregister(&ssif_bmc->miscdev);
+		goto out;
+	}
+
+	return ssif_bmc;
+
+out:
+	devm_kfree(&client->dev, ssif_bmc);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(ssif_bmc_alloc);
+
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
new file mode 100644
index 000000000000..a2ee090572db
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * The driver for BMC side of SSIF interface
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+#ifndef __SSIF_BMC_H__
+#define __SSIF_BMC_H__
+
+#define DEVICE_NAME				"ipmi-ssif-host"
+
+#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
+
+#define MSG_PAYLOAD_LEN_MAX			252
+
+/* A standard SMBus Transaction is limited to 32 data bytes */
+#define MAX_PAYLOAD_PER_TRANSACTION		32
+
+#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
+#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
+
+#define SSIF_IPMI_SINGLEPART_WRITE		0x2
+#define SSIF_IPMI_SINGLEPART_READ		0x3
+#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
+#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
+#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
+#define SSIF_IPMI_MULTIPART_READ_START		0x3
+#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
+
+struct ssif_msg {
+	u8 len;
+	u8 netfn_lun;
+	u8 cmd;
+	u8 payload[MSG_PAYLOAD_LEN_MAX];
+} __packed;
+
+static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
+{
+	return ssif_msg->len + 1;
+}
+
+#define SSIF_BMC_BUSY   0x01
+#define SSIF_BMC_READY  0x02
+
+struct ssif_bmc_ctx {
+	struct i2c_client	*client;
+	struct miscdevice	miscdev;
+	u8			smbus_cmd;
+	struct ssif_msg		request;
+	bool			request_available;
+	struct ssif_msg		response;
+	bool			response_in_progress;
+	/* Response buffer for Multi-part Read Transaction */
+	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
+	/* Flag to identify a Multi-part Read Transaction */
+	bool			is_singlepart_read;
+	u8			nbytes_processed;
+	u8			remain_len;
+	u8			recv_len;
+	/* Block Number of a Multi-part Read Transaction */
+	u8			block_num;
+	size_t			msg_idx;
+	enum i2c_slave_event	last_event;
+	bool			pec_support;
+	spinlock_t		lock;
+	wait_queue_head_t	wait_queue;
+	struct mutex		file_mutex;
+	void (*set_ssif_bmc_status)(struct ssif_bmc_ctx *ssif_bmc, unsigned int flags);
+	void			*priv;
+};
+
+static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
+{
+	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
+}
+
+struct ssif_bmc_ctx *ssif_bmc_alloc(struct i2c_client *client, int sizeof_priv);
+
+#endif /* __SSIF_BMC_H__ */
diff --git a/drivers/char/ipmi/ssif_bmc_aspeed.c b/drivers/char/ipmi/ssif_bmc_aspeed.c
new file mode 100644
index 000000000000..a563fcff5acc
--- /dev/null
+++ b/drivers/char/ipmi/ssif_bmc_aspeed.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * The driver for BMC side of Aspeed SSIF interface
+ *
+ * Copyright (c) 2021, Ampere Computing LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ */
+
+#include <linux/i2c.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+#include <linux/iopoll.h>
+
+#include "ssif_bmc.h"
+
+struct aspeed_i2c_bus {
+	struct i2c_adapter              adap;
+	struct device                   *dev;
+	void __iomem                    *base;
+	struct reset_control            *rst;
+	/* Synchronizes I/O mem access to base. */
+	spinlock_t                      lock;
+};
+
+#define ASPEED_I2C_INTR_CTRL_REG	0x0c
+#define ASPEED_I2CD_INTR_SLAVE_MATCH	BIT(7)
+#define ASPEED_I2CD_INTR_RX_DONE	BIT(2)
+static void aspeed_i2c_enable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
+{
+	unsigned long current_mask;
+
+	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
+	writel(current_mask | mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
+}
+
+static void aspeed_i2c_disable_interrupt(struct aspeed_i2c_bus *bus, unsigned long mask)
+{
+	unsigned long current_mask;
+
+	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
+	writel(current_mask & ~mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
+}
+
+static void aspeed_set_ssif_bmc_status(struct ssif_bmc_ctx *ssif_bmc, unsigned int status)
+{
+	struct aspeed_i2c_bus *bus;
+	unsigned long flags;
+
+	bus = (struct aspeed_i2c_bus *)ssif_bmc->priv;
+	if (!bus)
+		return;
+
+	spin_lock_irqsave(&bus->lock, flags);
+
+	if (status & SSIF_BMC_BUSY) {
+		/* Ignore RX_DONE and SLAVE_MATCH when slave busy processing */
+		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
+		aspeed_i2c_disable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
+	} else if (status & SSIF_BMC_READY) {
+		/* Enable RX_DONE and SLAVE_MATCH when slave ready */
+		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_RX_DONE);
+		aspeed_i2c_enable_interrupt(bus, ASPEED_I2CD_INTR_SLAVE_MATCH);
+	}
+
+	spin_unlock_irqrestore(&bus->lock, flags);
+}
+
+static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct ssif_bmc_ctx *ssif_bmc;
+
+	ssif_bmc = ssif_bmc_alloc(client, sizeof(struct aspeed_i2c_bus));
+	if (IS_ERR(ssif_bmc))
+		return PTR_ERR(ssif_bmc);
+
+	ssif_bmc->priv = i2c_get_adapdata(client->adapter);
+	ssif_bmc->set_ssif_bmc_status = aspeed_set_ssif_bmc_status;
+
+	return 0;
+}
+
+static int ssif_bmc_remove(struct i2c_client *client)
+{
+	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
+
+	i2c_slave_unregister(client);
+	misc_deregister(&ssif_bmc->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id ssif_bmc_match[] = {
+	{ .compatible = "aspeed,ast2500-ssif-bmc" },
+	{ },
+};
+
+static const struct i2c_device_id ssif_bmc_id[] = {
+	{ DEVICE_NAME, 0 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
+
+static struct i2c_driver ssif_bmc_driver = {
+	.driver		= {
+		.name		= DEVICE_NAME,
+		.of_match_table = ssif_bmc_match,
+	},
+	.probe		= ssif_bmc_probe,
+	.remove		= ssif_bmc_remove,
+	.id_table	= ssif_bmc_id,
+};
+
+module_i2c_driver(ssif_bmc_driver);
+
+MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Linux device driver of Aspeed BMC IPMI SSIF interface.");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

