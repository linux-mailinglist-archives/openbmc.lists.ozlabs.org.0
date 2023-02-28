Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9F6A5588
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 10:22:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQsMj2FPQz3cB9
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 20:22:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pEWD+eG3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=pEWD+eG3;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQsL06qkpz3bM7
	for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2023 20:20:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlMZ4yB/NWoPaeCLL+4DqNLwyVWpY2iULNvpUWeX4izsfG2WjCcwOy/Uio2P95L6NANmCSHOmNwvul14JvmdPGCzllIfWdXcSqdjyI71nMHZ/a3z1zX0gpD4XbRwQeT0/ZfH9+jwl7hbdZIquDT6xwzVn653OJyMgKicKamia7ktLDNDagphxlgK/0FuuIHrMnCH6xYBCrcfGuoNB5J62AP8koIo7MG8gsYkqs3IAkiZBVdiAhTPYKonl/8Wo/yLGzYVTU1Dq5EY2ChMYF8o3vIIl9qO7WU3b1a8DiS3cFXo34PpUp1lpYAdGCy0bYilnOFpcxf5G1FpEsAxmR+neA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0misMnx6cvjIGdOA5m/VXu6Mp0EgEiByanMBZdcmFw=;
 b=gsmI6unjzLQSSbWuemUE9tAkK31lvm4bz5P4RjiuhVoqZs3sieB2qqVt1OLvR8saHfKEA1rY/pKOyP6QycNxsM715bUM6Y9LcHMwSdgv51df713PcDTvbFknEPTkR0BogNyhp/WHpUyblZIi8X6XLT4EnhG2YuOrtuf5BscvTm/cwuZ+km11gKpi5YkuFSD9KKl4ytxjY2IMNr7uhqECQi6DsTZ8oCqMfV2OVIMx5enleUEdPMbuZxJTLxfSD97AWaw9aWzhWrB9Eif5nOEj57SxhEUMhD157xErqJdTfh4PQqpDr1pnZGUJlS8DSSRh0sUFuwubqGficSoeMn9KPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0misMnx6cvjIGdOA5m/VXu6Mp0EgEiByanMBZdcmFw=;
 b=pEWD+eG3niL4y8y4kEg7uE4D3Qx6IyvDaAxzRbg0WgpFvc+veUfzrLlBjIoKy/WmNgWriHBOhjXpyiMtSvJqYhvdIm4qbME70fIm9yOof23OpXRtV0/nCw4dKcSz1TFvAtH2D3T2lzRpSQHV4wqjis9TSxGXQtUy/J1nye4Knew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MN0PR01MB7780.prod.exchangelabs.com (2603:10b6:208:37f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Tue, 28 Feb 2023 09:20:34 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10%3]) with mapi id 15.20.6134.028; Tue, 28 Feb 2023
 09:20:34 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2 1/2] misc: smpro-errmon: Add DIMM 2x Refresh rate event
Date: Tue, 28 Feb 2023 16:20:09 +0700
Message-Id: <20230228092010.1863419-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230228092010.1863419-1-quan@os.amperecomputing.com>
References: <20230228092010.1863419-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::33)
 To SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|MN0PR01MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8c0b60-bb23-4e34-eeaa-08db196d0bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	W6fRP6zteCAKzq+9OAbhWIzhCHvKmEtnvW5+5lMPBE3YyXbLbT7Ac96pbjmKBBFQlDj//1cwFr95iGz4ANnXuSg/qt6zGZhnCxHFL7hmE2E6J38Dxjk65/UZNBaGJfOGHsc1lT6pPaAMrR0hS2q7TX7iC/kmhgkwjUYkk0W/yuh6claI7X/wOuCNdh+gX2iOVTUVFZTarg3PBx5EFgEKA0P5F2laIpQtZaj+rYatcanZ0wknoJkvug7YRfaCIzT+EHj8u//r5fzNRs9GvZtc17kTM/vXGiLIKNOad2UQwSoqrr3Rgj6vOA2PY11UC5EuY8KTbBeifLUTGvq5Qs3faBXFFtYHOTMGM+iVr5YJmPK7D37BGB+XoB1V3V91BoCeTqUEMfdJwm1jE3E5CXHYw10GAXLmlIDYsF0qkBkjnvO13FwjqOn3Y2bDvmmnAHUyPQcgBw8aXmE4UuXHxmhvEyx37wCaVfbM0L8oiqXdXex4/wKS6CS9DGVQ0llR3uIl5bBsRDrfZCEK1IGiKwp8pCT9zDM2gfy/cJinS+KPvH0Ys13m52iheKR7KY7uKILsL8e2lspTjDIwvRhslYRXCTEBKAplzJs52YyiXNZbxWrPtTfbLxsNhep7PBBArkP7/0ZfmF3RopBAcZ9VSGerIhRux1Eb59q7l73xK6NZiCaYVbDVcr3EnMSEasfmxeDwrABkNUahdFCnyeJCBgA0ng==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(451199018)(86362001)(8676002)(66556008)(4326008)(66946007)(8936002)(41300700001)(5660300002)(66476007)(2906002)(38100700002)(38350700002)(6486002)(316002)(478600001)(52116002)(107886003)(6666004)(110136005)(54906003)(1076003)(6506007)(2616005)(186003)(6512007)(83380400001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JnaNbgyebHc1N6g5wQOt71+xh00wA+CNVdaSNl934UC1fxaofKtkxJu98sqX?=
 =?us-ascii?Q?miRWn56Fv8phTREkJrIGxCB16Xe4t5+UrtFZjHmarG+tPkx50zYB5ny//DTq?=
 =?us-ascii?Q?PplxJ30GFgp9B+joW5Mme/CfBrr0BwAMvhpgP88Y07NwQ1zbLsybZBCNZRXw?=
 =?us-ascii?Q?eoviGBq7phCVc92POPxDXa8CulfXkaYkkVEJizjdjeADtVMc+yxf8/G2hMiJ?=
 =?us-ascii?Q?+bH8TMR+D86O26MJE5Q+FECw3EYNrBh3noVfELx9yNqUJnRLJxCQsrwcA9CF?=
 =?us-ascii?Q?sHg07X3dW3DO9lNvwrPKPwUZHMzvZuCXwuR0IJl+izSoXndEqXqeMtxTlW2m?=
 =?us-ascii?Q?8de1zKF1NlKCLs8C6O7Npb/5nnk8VjYFf1HSKX93Yd95VC3syFVaDfcX3RQk?=
 =?us-ascii?Q?ah0AQiofi+2Y9GQ3+otHX5gigY8bIoiRVnn7LBPQYKpjxQ6XXMyW4MkMMLHH?=
 =?us-ascii?Q?Wfz5QLZN97oHyQ2cUsWxwRPyETvivaD3j4OkB1JA7L6Uyb/97IUVvtlekPyD?=
 =?us-ascii?Q?ZMlz2S9dCB+1kjZyuUinsFcZBtfe20r7IAv0CqVEO7tYLNudNbFU9Rpjp3Hl?=
 =?us-ascii?Q?FUhegLofKtuzTQrzr4KHnzbKbXDcuKJOAD2oe74KP6qlqyegT1j6x9/hthx9?=
 =?us-ascii?Q?QFH0NAscrk1ooo8b54rE/B0VI7RC0IiLjHHYyTV+zXwbPQqcZr8+H9Bda/WB?=
 =?us-ascii?Q?HTymo8LVURosJY5YYdkoPaEGuEoa0xb2al+Q/pE+U++cvGlv5cNpBbH4cbu2?=
 =?us-ascii?Q?mzboSkFht02e+yVcWDnXGK4uKIcLROU2nn0+nj1jpvQ0LzLfpVYczEchNtP2?=
 =?us-ascii?Q?1nPhy7iSsMXTxZHpDG/vb9+sHIzpozFt5Sg+wQc4O5NkjlDuyjJM57Y/cXsp?=
 =?us-ascii?Q?mnHpmrhqrmjbLixZUTkWA1tinstz5i6z7Vp/oGbd/OJCdjn0Q9mmh8h4//hW?=
 =?us-ascii?Q?PYXAMNuAVVpu+FNyVNzmn6YYn7vE/sl8WwrBiubWXMJCqkQ24+UPblTTZgSm?=
 =?us-ascii?Q?H/5EjZmIfMEJUHIO1g/tVLzYgudu4lsBneNbdFdmyP3szMpSrUrmFx+MnIgy?=
 =?us-ascii?Q?o6jGWPNIQmjbFj/qGYwgBGuDbXQjwVG4KoTk037lgjuXwSmYIgkv01sMaYeZ?=
 =?us-ascii?Q?1/2L+cSTMKJ7iActV6o0Lw707WXDIiYesIXHymkEo4Q7AQeTS4mu6Vp7XDFG?=
 =?us-ascii?Q?2aWQwVonh9bvN3JqgQn8T5c7VI10stUUkIIxLzTF2v/kDmnAYWYLu7bOrt0p?=
 =?us-ascii?Q?ZqqBvympTnMrVIdArcXSuRa8BLBJ6aRM8JS7nakyV+/7AM44n1HiJrSJHSRj?=
 =?us-ascii?Q?JXGZCauSs44idlfWkoWUklrhSJC4jlnRxidWBf2scny8TojGbQi3xPVEPqZO?=
 =?us-ascii?Q?ODRPjDf8CeIhBvOEH3BhADiuX1ospSaUAc3ObnyzTrmyNJ446NdXMmTVjY3g?=
 =?us-ascii?Q?CkdZTHQLtybx5xiGBHri5sjKB3fNZy2RKBSN0TIqoGlXHtWlpyWMM0W/5uQG?=
 =?us-ascii?Q?wJ1uDDsBtaGn595s08VwjpSYrZJhf3Tl2qvVl7INNkB4ZtvY5s9u1GvtYwLx?=
 =?us-ascii?Q?GhrwTWTBZwudpR60y2Velq+FtY+zG2lK/6sygvQd2PfSby4YNV/WsSKNLscj?=
 =?us-ascii?Q?0REZUZRCH2Rh8jAEu28oGJI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8c0b60-bb23-4e34-eeaa-08db196d0bc5
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 09:20:34.4894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xv1R0hQwzqh6oTtl9XXon+OMxd8VbO7F2VS4zkYbKSaJg2ET6raTACE5z+dMXmBe7eAOoVkLNaN8VzE8+u9yMu29dATmCiQUfMJPBdmiUPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7780
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In high temperature condition, JEDEC spec requires memory controller to
double the refresh rate. This commit adds event_dimm_2x_refresh sysfs
to report that events for all memory channels.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Corrected kernel version to 6.3                  [Greg,Paul]
---
 .../ABI/testing/sysfs-bus-platform-devices-ampere-smpro  | 9 ++++++---
 drivers/misc/smpro-errmon.c                              | 5 +++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index ca93c215ef99..5a8d1af49a2b 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -234,8 +234,8 @@ Description:
 		For details, see section `5.10 RAS Internal Error Register Definitions,
 		Altra Family Soc BMC Interface Specification`.
 
-What:		/sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
-KernelVersion:	6.1
+What:		/sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot|dimm_2x_refresh]
+KernelVersion:	6.1 (event_[vrd_warn_fault|vrd_hot|dimm_hot]), 6.3 (event_dimm_2x_refresh)
 Contact:	Quan Nguyen <quan@os.amperecomputing.com>
 Description:
 		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
@@ -258,8 +258,11 @@ Description:
 		+---------------+---------------------------------------------------------------+---------------------+
 		| DIMM HOT      | /sys/bus/platform/devices/smpro-errmon.*/event_dimm_hot       | DIMM Hot            |
 		+---------------+---------------------------------------------------------------+---------------------+
+		| DIMM 2X       | /sys/bus/platform/devices/smpro-errmon.*/event_dimm_2x_refresh| DIMM 2x refresh rate|
+		| REFRESH RATE  |                                                               | event in high temp  |
+		+---------------+---------------------------------------------------------------+---------------------+
 
-		For more details, see section `5.7 GPI Status Registers,
+		For more details, see section `5.7 GPI Status Registers and 5.9 Memory Error Register Definitions,
 		Altra Family Soc BMC Interface Specification`.
 
 What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
index d1431d419aa4..1635e881aefb 100644
--- a/drivers/misc/smpro-errmon.c
+++ b/drivers/misc/smpro-errmon.c
@@ -67,6 +67,7 @@
 #define VRD_WARN_FAULT_EVENT_DATA	0x78
 #define VRD_HOT_EVENT_DATA		0x79
 #define DIMM_HOT_EVENT_DATA		0x7A
+#define DIMM_2X_REFRESH_EVENT_DATA	0x96
 
 #define MAX_READ_BLOCK_LENGTH	48
 
@@ -190,6 +191,7 @@ enum EVENT_TYPES {
 	VRD_WARN_FAULT_EVENT,
 	VRD_HOT_EVENT,
 	DIMM_HOT_EVENT,
+	DIMM_2X_REFRESH_EVENT,
 	NUM_EVENTS_TYPE,
 };
 
@@ -198,6 +200,7 @@ static u8 smpro_event_table[NUM_EVENTS_TYPE] = {
 	VRD_WARN_FAULT_EVENT_DATA,
 	VRD_HOT_EVENT_DATA,
 	DIMM_HOT_EVENT_DATA,
+	DIMM_2X_REFRESH_EVENT_DATA,
 };
 
 static ssize_t smpro_event_data_read(struct device *dev,
@@ -463,6 +466,7 @@ static DEVICE_ATTR_RO(warn_pmpro);
 EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENT);
 EVENT_RO(vrd_hot, VRD_HOT_EVENT);
 EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
+EVENT_RO(dimm_2x_refresh, DIMM_2X_REFRESH_EVENT);
 
 static struct attribute *smpro_errmon_attrs[] = {
 	&dev_attr_overflow_core_ce.attr,
@@ -488,6 +492,7 @@ static struct attribute *smpro_errmon_attrs[] = {
 	&dev_attr_event_vrd_warn_fault.attr,
 	&dev_attr_event_vrd_hot.attr,
 	&dev_attr_event_dimm_hot.attr,
+	&dev_attr_event_dimm_2x_refresh.attr,
 	NULL
 };
 
-- 
2.35.1

