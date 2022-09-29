Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3115EF293
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT6R4vTdz3bxp
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BqIfWdjd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.125; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=BqIfWdjd;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2125.outbound.protection.outlook.com [40.107.94.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3C632Sz3c29
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGQ7/cOF9S3Ztgaoow9XRldW3JEqVrs/4k3gnJ3Vg04al+k8c95wRkvQBtc/grJN+scp3r0bE8TE+Ic/uU4f3KKYKNA05+VAOGY3P+gMvATpvTLbTT0BUA32l6UNMMfDOrvGN+1822u7u6FY3Ac2xE3eodPJ5E0VEw0ZH9lHC0/pIut7rKC1yBk9+zkVasm8Y7LrnaMlzTl60n/eYyDAXRLQ4bgyDjBaHINwv2yMMymS12OH7vUOn56zUumHUAr/HhfT6x4WZ4TtkEpFSMf+hLs3FtqG6H2ScSmqL2qDjQY5VSH5xJyUmSlw24/CcfN/LsXbrfKDWaEGyjBGL3N97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqwBPGST1eUBTatAkSSveHiCnMq5XsMYpp0k0AmKZqc=;
 b=COw1aAN4V3X7iABXbefDXdX41ZtN0oGC9KkfJKgiO67LU9H95lDgpA9aIuYEpdOr4/pf+ERNMNmLcCRiZpK79DnwEk7YR1POAZUGpfH8Kpyl1H588L0doJf/8CUqOG4dD2+FBu8EWuICgrcHv7Ea6LkxqfoFNvIfKTtwg0shzChyRzmYZzARdC9rxDcSj4ZRvMyZNOkexlPohtQqlnQcaaME2V0Qt7VjV6CrXKGHI9N1uhZp0H8rruFQ13aFFxCaydm3JqvGkN9r8l4aB4OppmRm1irS+sSBLDuXeoW3wZKG3mlF2GIZYWh1ln6pZQAqkV/5OnP4K8sO3KwB/my3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqwBPGST1eUBTatAkSSveHiCnMq5XsMYpp0k0AmKZqc=;
 b=BqIfWdjd3MRYzxBOFU3I25P2tzB33VCYh9N07/W1YigvhXAxT1zIdhCNpp0wfHDK1dPFivkjko/zUA5QucGkpZeEmokLV2Sdk93Ub6YC0afzQvQ68CvcX39OKbfb8OIgKXnEii83c31JGKjh1piBIb+ikMpW/hqpzUq1kt4qX70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4798.prod.exchangelabs.com (2603:10b6:805:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:01 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:01 +0000
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
Subject: [PATCH v9 3/9] misc: smpro-errmon: Add Ampere's SMpro error monitor driver
Date: Thu, 29 Sep 2022 16:43:15 +0700
Message-Id: <20220929094321.770125-4-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7a6c9943-51c2-4055-6fd5-08daa1ff2398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8I6oRcDLKtxVICYfLy369lpCnYt1y4g7rbXc8i/XphCBFDjgVofjM41tl8Vncs1ZfMHv9N7BG2SOofLRwFo0kkem7qAZa2hACfZlLHRyvxy+0PP8cURmVjJNoffmA1X2+6Ytg6LEqLDz1b3UznkOkGecX/wLkwuZRuIa5+LER03Bmw2xMNRp5JYcv9+l/Bw4Xk5np3SHlmPfyCvBJ6PoWzIQw9HNSNB4exFg/0aCqhnuzySCTeaSiTAEN8iuPrKkARUxWQlRRornEbxlsS03Ic4HF0Oyr3/5BZ7yl/ddK8A3M1n5oMXAi250dK1Z4pAf0SXFKLgTcDWDfJps8Gvif0vMXBEpHwMp/Wbmw/w8qORPRZrdj4gNIBkGHOjd1l1Ik3fRgUrx8blLYwsqfgMp8CF/ESDwbxL6MBAglKu1ogWwqd7qD8pM7fP7T9Jo5nUrWXyIphK6ujNZMT5L8JgqEYXtwfdwKtRs85IlXKYV45Pl6TtHm3ZtZ+8Uh+Tn0zkHyWsxNwevRjorvZCn+nFcjF1yo1b/eBkzZPtzVOLkDE7l1vJTnEw2DAkTCGsxVj81Gm6vcdKfYOoA//IHvigsG7qmy6leRu/65jq7awoiUvgJNr8MQdGuEaz1zRuvxvekg7JMApQ+WcH+8a4eZsOiT0jiIzo8z+d5oYmW7gOBYLRDU1jf+OSMOcfvbc7GyMIFAoIepMI+C5GRq3JtQRgdxJm7NHr+2Pwg9M94DPW/upCsrm9lkMD10Cl+9RzL2Xzg6IbL+vsxQyq6sqi2Tgm2ExoZ2RYyuRwla9wCxz+x/Gc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199015)(921005)(66476007)(66946007)(66556008)(8676002)(4326008)(83380400001)(110136005)(478600001)(6666004)(6512007)(6506007)(2906002)(26005)(52116002)(41300700001)(316002)(38350700002)(38100700002)(86362001)(30864003)(8936002)(6486002)(1076003)(107886003)(5660300002)(2616005)(7416002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zEGxH4JT7i0KVE+pVZkTbBJe+i6Aw/z1W4MeDi/KkWB0SQTf+q5DLWHqrTkH?=
 =?us-ascii?Q?qtFE9k/gCpSW0hxjbtOASDkn8mxdV74p88x2QxnL7FlDR5r/1ITjfXYfHjjm?=
 =?us-ascii?Q?YSTZlmWZzqUFM3QzHmDU1YZ6I+PRqj8RC4WElcq9lp84oDSPY0jP/HRmhZ75?=
 =?us-ascii?Q?cUXsEzMDIsT+eOjL3j3OLjVB9Bh3Jh56pJhsvHlhgwsEjioV0ngJ1SpNXQjL?=
 =?us-ascii?Q?1I3pyOek+DRvK0CQNvGb9hKZXhOIOuqKWMQXI3kHpKzQsBWxPpQz5uJFYEIp?=
 =?us-ascii?Q?BmM/34WVCjxemHIhqWZ5fl7PKt6iv5G6TTnFvsyY+2JZxL/mCjg3z+N/WMsC?=
 =?us-ascii?Q?B3RIbLdr931H316e40h6C0CzkoVjR7XIcxTVAVfjH40yRU4ZZWmn7gM3oHIx?=
 =?us-ascii?Q?BAdG4k6d1UvTcZ/SADFHLrohaINuqUM+6J3RS2+uU138XPcHRva+K8A8h7KM?=
 =?us-ascii?Q?ut5RS+3IoBcBMf9pC/DRclS0pj2TmrjZuPwV4+S5S3tUuZGSm7tVQ2bIVSGg?=
 =?us-ascii?Q?vI+iQra6GeiGVgOEyhK+K/qN6uxVVjKcOnqeDl6tRLSSqITWcZuFGhR3VaCC?=
 =?us-ascii?Q?b5ZPE/lmYzrPO6na578SI7BaeKLaP/HPd98fQiavbavmmfHhchVISvq4mEFH?=
 =?us-ascii?Q?y2lMPW4FdMryOPqrRMN8NFLIvgy4LuH9CYbXUQdXKNLUSju6poSNpOsyGDFQ?=
 =?us-ascii?Q?cjrl1iBDFZ5GCxzwm5Z3KaQo+oZXJSayNM8w9M0e7BU9Mnz7C98GzVlAj/E5?=
 =?us-ascii?Q?wPpRqyzuMRCZN8lYJNipmty3yyitVFH0WR1n14WxYv6crfRW+UoK74ms3Dyw?=
 =?us-ascii?Q?A5MRurLJc0VPD7imiHckOt+1dfCtu9GHjNTVUonh8SinqyXdGYC4jAP0Jq0o?=
 =?us-ascii?Q?ShK6oVGUikFdkN6MqP8g9VDGxY/L+2Psym3GKNgF5skarQ/ztsRnQCmfNqM4?=
 =?us-ascii?Q?8fJ325GZ5oXbtDktBfrg8h9GJOk71DRjXGCfMC7JReYl6oMANdUvjmMyvpFZ?=
 =?us-ascii?Q?h7UXUEhIWfb6SO6GqBfY85hP32x7jUMc2ZlHLuX2D5AeYE9IHXHyukO3zZLH?=
 =?us-ascii?Q?Euueu98+4o5Tpi8sNIlZQgcoeSOQdvp/5yD0EAEPWsRhbfc60+B7gWAak0/N?=
 =?us-ascii?Q?WFdFpQjtBVvCU6Mup2nOGLe3NdfTMz2W0ldBF0e2Q+U3esKKXmkhbd6Udxnb?=
 =?us-ascii?Q?7stexsYd6fh0i/heiXQI6k3Umk3xqcrZPjjbcHvK3dJ09BHqhgL3WyxU3ZCK?=
 =?us-ascii?Q?Z6UVp29kATFVM24EVuGmqaWsErxSBEzM626Z5c45fKp1Jn5s/gyYrNdjkldv?=
 =?us-ascii?Q?pB+UJkyIEm3lhVLz1i9l54JyPTTUQFXHowyo/+bhknKps3z7svidtl/OW4lE?=
 =?us-ascii?Q?FM7Pwjq0m60I1GCwynwr5NkLXBY5y4s63f7+Qr0C0tRerHx6tSIetRjCZtUf?=
 =?us-ascii?Q?VdBsujzxDETSmki8w6gaaIgHn66hE8lLmfEIzX1lIOLaE8RleH1NFciQx4If?=
 =?us-ascii?Q?dVz0xhOla8R7MjaTLXv4TTTDfZvm5V6MQsva2sUTXdF7V9p9Yqyk5lc98QLA?=
 =?us-ascii?Q?fKw3yugnID5QqpfGrSXlELAViONCeOsJetbX44pNzFC5GSJsIT/wGR88r6FB?=
 =?us-ascii?Q?UXZMzqG0R7UvGHJOGjMCHxI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a6c9943-51c2-4055-6fd5-08daa1ff2398
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:01.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4DbzV42eTdx1iKk1PDiXW6oXy+KOVHz3oEN75JErcYgdtHn3QYwygmojUM82fVQYzdwEE2Dbi3NKub78Nq/oRIxLn7mWB3VTgBHqyFg868=
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

This commit adds Ampere's SMpro error monitor driver for monitoring
and reporting RAS-related errors as reported by SMpro co-processor
found on Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v9:
  + Fix ugly static struct define                               [Greg]
  + Remove unused defines and update documentation              [Quan]
  + Add minor refactor code                                     [Quan]
  + Fix messy goto                                              [Greg]
  + Update SPDX licence                                         [Greg]
  + Use ATTRIBUTE_GROUPS()                                      [Greg]
  + Use dev_groups instead of sysfs_create_group() to avoid
  racing issue with user space                                  [Greg]
  + Refactor code to fix unnecessary initialization issue       [Quan]
  + Refactor code to avoid clever encoding issue                [Quan]
  + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
  + Add minor code refactor                                     [Quan]

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
 drivers/misc/smpro-errmon.c | 529 ++++++++++++++++++++++++++++++++++++
 3 files changed, 542 insertions(+)
 create mode 100644 drivers/misc/smpro-errmon.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 358ad56f6524..b9ceee949dab 100644
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
index ac9b3e757ba1..bbe24d4511a3 100644
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
index 000000000000..d1431d419aa4
--- /dev/null
+++ b/drivers/misc/smpro-errmon.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+
+#define MAX_READ_BLOCK_LENGTH	48
+
+#define RAS_SMPRO_ERR		0
+#define RAS_PMPRO_ERR		1
+
+enum RAS_48BYTES_ERR_TYPES {
+	CORE_CE_ERR,
+	CORE_UE_ERR,
+	MEM_CE_ERR,
+	MEM_UE_ERR,
+	PCIE_CE_ERR,
+	PCIE_UE_ERR,
+	OTHER_CE_ERR,
+	OTHER_UE_ERR,
+	NUM_48BYTES_ERR_TYPE,
+};
+
+struct smpro_error_hdr {
+	u8 count;	/* Number of the RAS errors */
+	u8 len;		/* Number of data bytes */
+	u8 data;	/* Start of 48-byte data */
+	u8 max_cnt;	/* Max num of errors */
+};
+
+/*
+ * Included Address of registers to get Count, Length of data and Data
+ * of the 48 bytes error data
+ */
+static struct smpro_error_hdr smpro_error_table[] = {
+	[CORE_CE_ERR] = {
+		.count = CORE_CE_ERR_CNT,
+		.len = CORE_CE_ERR_LEN,
+		.data = CORE_CE_ERR_DATA,
+		.max_cnt = 32
+	},
+	[CORE_UE_ERR] = {
+		.count = CORE_UE_ERR_CNT,
+		.len = CORE_UE_ERR_LEN,
+		.data = CORE_UE_ERR_DATA,
+		.max_cnt = 32
+	},
+	[MEM_CE_ERR] = {
+		.count = MEM_CE_ERR_CNT,
+		.len = MEM_CE_ERR_LEN,
+		.data = MEM_CE_ERR_DATA,
+		.max_cnt = 16
+	},
+	[MEM_UE_ERR] = {
+		.count = MEM_UE_ERR_CNT,
+		.len = MEM_UE_ERR_LEN,
+		.data = MEM_UE_ERR_DATA,
+		.max_cnt = 16
+	},
+	[PCIE_CE_ERR] = {
+		.count = PCIE_CE_ERR_CNT,
+		.len = PCIE_CE_ERR_LEN,
+		.data = PCIE_CE_ERR_DATA,
+		.max_cnt = 96
+	},
+	[PCIE_UE_ERR] = {
+		.count = PCIE_UE_ERR_CNT,
+		.len = PCIE_UE_ERR_LEN,
+		.data = PCIE_UE_ERR_DATA,
+		.max_cnt = 96
+	},
+	[OTHER_CE_ERR] = {
+		.count = OTHER_CE_ERR_CNT,
+		.len = OTHER_CE_ERR_LEN,
+		.data = OTHER_CE_ERR_DATA,
+		.max_cnt = 8
+	},
+	[OTHER_UE_ERR] = {
+		.count = OTHER_UE_ERR_CNT,
+		.len = OTHER_UE_ERR_LEN,
+		.data = OTHER_UE_ERR_DATA,
+		.max_cnt = 8
+	},
+};
+
+/*
+ * List of SCP registers which are used to get
+ * one type of RAS Internal errors.
+ */
+struct smpro_int_error_hdr {
+	u8 type;
+	u8 info_l;
+	u8 info_h;
+	u8 data_l;
+	u8 data_h;
+	u8 warn_l;
+	u8 warn_h;
+};
+
+static struct smpro_int_error_hdr list_smpro_int_error_hdr[] = {
+	[RAS_SMPRO_ERR] = {
+		.type = ERR_SMPRO_TYPE,
+		.info_l = ERR_SMPRO_INFO_LO,
+		.info_h = ERR_SMPRO_INFO_HI,
+		.data_l = ERR_SMPRO_DATA_LO,
+		.data_h = ERR_SMPRO_DATA_HI,
+		.warn_l = WARN_SMPRO_INFO_LO,
+		.warn_h = WARN_SMPRO_INFO_HI,
+	},
+	[RAS_PMPRO_ERR] = {
+		.type = ERR_PMPRO_TYPE,
+		.info_l = ERR_PMPRO_INFO_LO,
+		.info_h = ERR_PMPRO_INFO_HI,
+		.data_l = ERR_PMPRO_DATA_LO,
+		.data_h = ERR_PMPRO_DATA_HI,
+		.warn_l = WARN_PMPRO_INFO_LO,
+		.warn_h = WARN_PMPRO_INFO_HI,
+	},
+};
+
+struct smpro_errmon {
+	struct regmap *regmap;
+};
+
+enum EVENT_TYPES {
+	VRD_WARN_FAULT_EVENT,
+	VRD_HOT_EVENT,
+	DIMM_HOT_EVENT,
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
+		return ret;
+	/* Clear event after read */
+	if (event_data != 0)
+		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
+
+	return sysfs_emit(buf, "%04x\n", event_data);
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
+	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
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
+	int ret;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
+	/* Error count is the low byte */
+	err_count &= 0xff;
+	if (ret || !err_count || err_count > err_info->max_cnt)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->len, &err_length);
+	if (ret || err_length <= 0)
+		return ret;
+
+	if (err_length > MAX_READ_BLOCK_LENGTH)
+		err_length = MAX_READ_BLOCK_LENGTH;
+
+	memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
+	ret = regmap_noinc_read(errmon->regmap, err_info->data, err_data, err_length);
+	if (ret < 0)
+		return ret;
+
+	/* clear the error */
+	ret = regmap_write(errmon->regmap, err_info->count, 0x100);
+	if (ret)
+		return ret;
+	/*
+	 * The output of Core/Memory/PCIe/Others UE/CE errors follows the format
+	 * specified in section 5.8.1 CE/UE Error Data record in
+	 * Altra SOC BMC Interface specification.
+	 */
+	return sysfs_emit(buf, "%*phN\n", MAX_READ_BLOCK_LENGTH, err_data);
+}
+
+/*
+ * Output format:
+ * <4-byte hex value of error info><4-byte hex value of error extensive data>
+ * Where:
+ *   + error info : The error information
+ *   + error data : Extensive data (32 bits)
+ * Reference to section 5.10 RAS Internal Error Register Definition in
+ * Altra SOC BMC Interface specification
+ */
+static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
+				       char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr *err_info;
+	unsigned int err[4] = { 0 };
+	unsigned int err_type;
+	unsigned int val;
+	int ret;
+
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &val);
+	if (ret)
+		return ret;
+
+	if ((channel == RAS_SMPRO_ERR && !(val & BIT(0))) ||
+	    (channel == RAS_PMPRO_ERR && !(val & BIT(1))))
+		return 0;
+
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->type, &val);
+	if (ret)
+		return ret;
+
+	err_type = (val & BIT(1)) ? BIT(1) :
+		   (val & BIT(2)) ? BIT(2) : 0;
+
+	if (!err_type)
+		return 0;
+
+	ret = regmap_read(errmon->regmap, err_info->info_l, err + 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->info_h, err);
+	if (ret)
+		return ret;
+
+	if (err_type & BIT(2)) {
+		/* Error with data type */
+		ret = regmap_read(errmon->regmap, err_info->data_l, err + 3);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(errmon->regmap, err_info->data_h, err + 2);
+		if (ret)
+			return ret;
+	}
+
+	/* clear the read errors */
+	ret = regmap_write(errmon->regmap, err_info->type, err_type);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%*phN\n", (int)sizeof(err), err);
+}
+
+/*
+ * Output format:
+ * <4-byte hex value of warining info>
+ * Reference to section 5.10 RAS Internal Error Register Definition in
+ * Altra SOC BMC Interface specification
+ */
+static ssize_t smpro_internal_warn_read(struct device *dev, struct device_attribute *da,
+					char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr *err_info;
+	unsigned int warn[2] = { 0 };
+	unsigned int val;
+	int ret;
+
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &val);
+	if (ret)
+		return ret;
+
+	if ((channel == RAS_SMPRO_ERR && !(val & BIT(0))) ||
+	    (channel == RAS_PMPRO_ERR && !(val & BIT(1))))
+		return 0;
+
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->type, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & BIT(0)))
+		return 0;
+
+	ret = regmap_read(errmon->regmap, err_info->warn_l, warn + 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->warn_h, warn);
+	if (ret)
+		return ret;
+
+	/* clear the warning */
+	ret = regmap_write(errmon->regmap, err_info->type, BIT(0));
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%*phN\n", (int)sizeof(warn), warn);
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
+ERROR_OVERFLOW_RO(core_ce, CORE_CE_ERR);
+ERROR_OVERFLOW_RO(core_ue, CORE_UE_ERR);
+ERROR_OVERFLOW_RO(mem_ce, MEM_CE_ERR);
+ERROR_OVERFLOW_RO(mem_ue, MEM_UE_ERR);
+ERROR_OVERFLOW_RO(pcie_ce, PCIE_CE_ERR);
+ERROR_OVERFLOW_RO(pcie_ue, PCIE_UE_ERR);
+ERROR_OVERFLOW_RO(other_ce, OTHER_CE_ERR);
+ERROR_OVERFLOW_RO(other_ue, OTHER_UE_ERR);
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
+ERROR_RO(core_ce, CORE_CE_ERR);
+ERROR_RO(core_ue, CORE_UE_ERR);
+ERROR_RO(mem_ce, MEM_CE_ERR);
+ERROR_RO(mem_ue, MEM_UE_ERR);
+ERROR_RO(pcie_ce, PCIE_CE_ERR);
+ERROR_RO(pcie_ue, PCIE_UE_ERR);
+ERROR_RO(other_ce, OTHER_CE_ERR);
+ERROR_RO(other_ue, OTHER_UE_ERR);
+
+static ssize_t error_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERR);
+}
+static DEVICE_ATTR_RO(error_smpro);
+
+static ssize_t error_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERR);
+}
+static DEVICE_ATTR_RO(error_pmpro);
+
+static ssize_t warn_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_warn_read(dev, da, buf, RAS_SMPRO_ERR);
+}
+static DEVICE_ATTR_RO(warn_smpro);
+
+static ssize_t warn_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_warn_read(dev, da, buf, RAS_PMPRO_ERR);
+}
+static DEVICE_ATTR_RO(warn_pmpro);
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
+EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENT);
+EVENT_RO(vrd_hot, VRD_HOT_EVENT);
+EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
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
+	&dev_attr_warn_smpro.attr,
+	&dev_attr_warn_pmpro.attr,
+	&dev_attr_event_vrd_warn_fault.attr,
+	&dev_attr_event_vrd_hot.attr,
+	&dev_attr_event_dimm_hot.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(smpro_errmon);
+
+static int smpro_errmon_probe(struct platform_device *pdev)
+{
+	struct smpro_errmon *errmon;
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
+	return 0;
+}
+
+static struct platform_driver smpro_errmon_driver = {
+	.probe          = smpro_errmon_probe,
+	.driver = {
+		.name   = "smpro-errmon",
+		.dev_groups = smpro_errmon_groups,
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

