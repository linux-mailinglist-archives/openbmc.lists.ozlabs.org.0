Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000466B38E6
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 09:37:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXzvk6Fcjz3cjK
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 19:37:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=c9UzbKyC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::705; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=c9UzbKyC;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXzry1vz6z3cBF
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 19:35:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV1oK24DJS5tvu5037G3fMR61LQmUf1rHTIeMh8eQ5bQJFZms/+kgrwSDzDk1SGHQTdVRGsfrGq8Ay9GrfXgL98oc+WbROyXojTJwfddnxc98+noJFe1xEs/VX452xvaTUFKpgGeDUlbz++pWhhiX9x0Yytfq7r5wSPWWzKuLV1EeqZIuguBYaEVa9VPfj1OZ0ClcEKwGf9ZLYeuK0a6IFyTG6bXGTJmaE3PDn060BK4OSdd4Ja94zCua5T72Cm6a9AqM26zMFQGEojcuOQ+06PxPQylQstgDS+sIt7B2YlExErRyoQWj7nhE1lH+16wF9aE62cbONeBvNvzrBqW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRLPb2sXuW8r6ok6n6zo2W5AWbDjwMi+cmJb4GcOE5A=;
 b=hPUZb7E8Mdm/Hkg84Xc63m8Po4MOyI4E/EPkTtPuG9zsx85G5ZefTklFN1JAJtnhPqxRodHY9q/IXCduELHIrRpoVzdGh8CbsJPbusoY5yeNd/Az1tAMaWe6HTeelTCZWn+wNIffHnvsRECZp+SloODhDWtoN7ZYlyIpauMUIZMKoJLAEq1vmZrabgRwJfOBGyKyMmGxtcu3Uh++OR1S7QQNp951Nf5ZCvcH3pKKwNPCXhCKpqIMO5VVn7lEtW+c5X6+mkg24oGxQ6BCbGqwkZ6w1ClA+waqWvq3bagq2Dfkdzbv76yoTT6bW4eoQhexrNDU7MOIqUNYb8oDMJ1rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRLPb2sXuW8r6ok6n6zo2W5AWbDjwMi+cmJb4GcOE5A=;
 b=c9UzbKyCVJI2TmCQrjPI5SSoJLyVrne3YfefAe26LOf2E9DuiaFIcOZiixlwKnSYUah4PRzld46ugBR6wY3bcjsLwiO+YHkV19s+/tC/f7HofF+13CBRYRcehiTnOlHmhKCjRxYS5+Ojsz5ZeguFPOmvVllfT32S7QgSK75JIZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MN2PR01MB5917.prod.exchangelabs.com (2603:10b6:208:194::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 08:35:10 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10%3]) with mapi id 15.20.6134.028; Fri, 10 Mar 2023
 08:35:10 +0000
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
Subject: [PATCH v3 2/2] misc: smpro-errmon: Add dimm training failure syndrome
Date: Fri, 10 Mar 2023 15:34:16 +0700
Message-Id: <20230310083416.3670980-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230310083416.3670980-1-quan@os.amperecomputing.com>
References: <20230310083416.3670980-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|MN2PR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: f81f4239-0e26-4656-0889-08db21425c30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NYCgdyxhHdTGlUf2UOVt+pURizeqb/mpOnlzJk+SRYX2/aB3y8Ys+TGx55hWH2rziDBBwFM51MWIo83BJN+EaEksHAW9tA2U2p0nmwiiUAueZ/dyau/ACK1yyIuvzrCJVLRpjOEHq3Frd8YcRJ3syUCM+hmMdGIc4k7ymAzjm2qn+M5cYzYH51zc9zGjD+k/Jcs3i4Dk1Acxry1xHenPI1+0lBOIJNQzV8sdGOTMVffYIHojgiR4eI/Zl1ZHVwIzx+Gox2QTKLJBwhuuxS4xAO5o/fgvrtz/M7N+5SWn+VOT7bmVOYZ5v5BPHGU8tnY8yAuofwe3JIPd2nZVLJOzG0oSD9scDhYD/as8LTj5I1vhIDakmK0TxP8PDLAXcErgsr2QjG/1R29+o8FNfajq8HH+QiuyZB04dznyVuc7WcedC2sNNDkgSBomjyt7EzkWAT4VqCjQceo606v+qfdRE3fWRax6BUO3zIcojrO2xzMCbaq4JynFgsC4QDw+vxpx+Ehun/fhy4FCofKv1bq+scBPyp11yrX9NgbH26x6ycK2JTS7MvMMq83pMbc15IJopOlUE0BMv6KCS3HKXgFSaj/8zXevFU5HnPkJkq/MzP36st671rYP4idi+w0WDyBB1U6vLg/2BMpFfmSWfMT4UKa/wIWxrtknyaiFSQrquiOJdxCanD1bykmjOmoulGD5
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(54906003)(110136005)(6506007)(38350700002)(38100700002)(86362001)(1076003)(2616005)(6512007)(26005)(107886003)(83380400001)(186003)(316002)(52116002)(5660300002)(478600001)(6486002)(41300700001)(66556008)(8936002)(2906002)(4326008)(8676002)(66946007)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?urNAX2V17Ot4Q95mHLstr18p0zPP301GZ+U36aY2yuO5NomC6rqq/go37tEb?=
 =?us-ascii?Q?bM2Kg3/WBLNSSEXt0x+Wj/YzjTycl6jffUGFmhMeSmVTSlIPqpjDXL2MimTu?=
 =?us-ascii?Q?Qu7y5IPVEKL8fIUEWb7s/jXDAssxUXqP6PXArsq6bhCDoCRJD20XvHRvHt5T?=
 =?us-ascii?Q?WNvXqYILpkRPjwP+A5Nw1RrvlqFkB0Am1nT9TfS4MVgpTLrkaF7hsy/fbypv?=
 =?us-ascii?Q?HFjCOlvNeEo8YZ/hTCfnKaIgo5LM9jJ6TyxeeFe3gEbgQGgqrGTw8bLF38Tm?=
 =?us-ascii?Q?/JsZzQbfCSsZuwrRNvP/vtZWEMcz7vlJ8k6KZoGymXcS5nqBxUkiQqLXEKy8?=
 =?us-ascii?Q?pkfRJ07C7ElVYlI1VHJldv1sdcld8S6PTEGH+dFXPmJY0keXE/NUN0MuShPU?=
 =?us-ascii?Q?XOTlyD5htBlv1ET+Aj7Z1oAKUlnryj0U2EXY1z8i1B07J/2e3t/Jnfg9+G3n?=
 =?us-ascii?Q?TUobkf1bYC8/UoOVQwFUKuQo7sqhDKQYC1v0wnzBvr6XDVQLiedwtseVmtjd?=
 =?us-ascii?Q?EkqvjR24qU4FMz9iWLsgz9H1U5vv6ifXO6gQrE0kHqY8CV+xIqhPDZ13qOlR?=
 =?us-ascii?Q?iVT3DBPpkI6qg6HONRMtrykHlDnjWsH2hAbhVKkyKBnVG4eQo1Me2UPD6Kds?=
 =?us-ascii?Q?RPlpmsOcNDgcEUbzjTskO7Hi8VOyVs4+gwOM3h5ZeTgI7sOgeOP+B6rOXrG1?=
 =?us-ascii?Q?MbH7pKKAUcnWt2lLaaBew8i5WRRF7rGwlUaJpmkk2H6SCjBKabp0fEqdvaSK?=
 =?us-ascii?Q?xZSJWW3/Cj3D5dhcag8jXQ9G1u63LFxfrifSiGzDj1UU9oQwdYMzl+lTPnnI?=
 =?us-ascii?Q?mKyDXSolqJMr5xAWCGOyjlFFYpS9QpP7eWKN8kik7qKM21CTjjJ7nWHPx4x/?=
 =?us-ascii?Q?yR2O/STuD5wvI0r11XMFl0Szt88AzqzDOUMZ3X8eYOaQeQT2alvJck2qGv74?=
 =?us-ascii?Q?5BgJOQuKjGUWAs4vOLSVVjZM5Ctl/pIGd51FwMPhC0+tWUIITsIFf4w1tj8R?=
 =?us-ascii?Q?yosnW5Nd/QkTCETWf5IQ5ZxRZVe/4O2Xz2hs+7ZWMW5J/X9SUt8qLGJgkoAK?=
 =?us-ascii?Q?tz4dGKpIs3eQO6Kg6LgpYfTihoLjRurbO7AxoFAiR7EPEofJBh47SQ6knJzw?=
 =?us-ascii?Q?oBBfqQr22fVMFY/6FW2CdMnjpRwLPvgI8qV1tvxqOd8QclVm+MwGvHdjePk8?=
 =?us-ascii?Q?jUpw6d0Yw8InAFQkkASpYpCScMEZN0Hvq0vNfC0ViBASk7LU3yhMcjblpBOk?=
 =?us-ascii?Q?3Gpp0pNplc8gqDxUPba4Z19pbpVppdntcnVHUHWKtS5qMTUmJuhxMR2rpnJ9?=
 =?us-ascii?Q?KohRhAHB/yz1OHSRROIxG8ggQjw+AO85ve6F278xxZne48JSqvy1CboU21Yd?=
 =?us-ascii?Q?nyfBuFupFXpD8CjGt+mAPgXmV2zIg3G4p36dgtCeUVD6efL88vwFIS7DQXX5?=
 =?us-ascii?Q?bAZgyH+XU0RR0gPKb7FcUvUso37ZF1Y/O+5G9Ny9owZIxWLMeNjODWygdqsV?=
 =?us-ascii?Q?Ez7FF4B+n9niDOnQEz3nN060xFGto3wQZtRszIxf43p3f5zLl9nvdm3fkmT4?=
 =?us-ascii?Q?BfMN9lIKE+MNlI2uCh4fOhW2gQ6UK+vfnlXRiXDEzQf07R50t3XuV8mjJJEa?=
 =?us-ascii?Q?MZj7SW4lpL4oO+RASN0Zs80=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f4239-0e26-4656-0889-08db21425c30
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:35:10.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsllEoQPGzCUsi/XQaNJWN/FpO8Tn42J8ZY2EYh0gHg9nBSShAkl6WWNZhZhSwUipMzhvj1sN6NTTP26eT4oOxyT8nznFUNM6Q9gSvRQjqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5917
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

Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
to BMC when DIMM training failed.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + Corrected kernel version to 6.4                       [Greg]

v2:
  + Change "to initialized" to "to initialize"            [Paul]
  + Corrected kernel version to 6.3                  [Greg,Paul]
  + Corrected variables type to 'unsigned int"            [Paul]
---
 .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
 drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index 14b58c893df5..fead760dcf77 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -265,6 +265,16 @@ Description:
 		For more details, see section `5.7 GPI Status Registers and 5.9 Memory Error Register Definitions,
 		Altra Family Soc BMC Interface Specification`.
 
+What:		/sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
+KernelVersion:	6.4
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) The sysfs returns the 2-byte DIMM failure syndrome data for slot
+		0-15 if it failed to initialize.
+
+		For more details, see section `5.11 Boot Stage Register Definitions,
+		Altra Family Soc BMC Interface Specification`.
+
 What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
 KernelVersion:	6.1
 Contact:	Quan Nguyen <quan@os.amperecomputing.com>
diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
index 1635e881aefb..a1f0b2c77fac 100644
--- a/drivers/misc/smpro-errmon.c
+++ b/drivers/misc/smpro-errmon.c
@@ -47,6 +47,12 @@
 #define WARN_PMPRO_INFO_LO	0xAC
 #define WARN_PMPRO_INFO_HI	0xAD
 
+/* Boot Stage Register */
+#define BOOTSTAGE		0xB0
+#define DIMM_SYNDROME_SEL	0xB4
+#define DIMM_SYNDROME_ERR	0xB5
+#define DIMM_SYNDROME_STAGE	4
+
 /* PCIE Error Registers */
 #define PCIE_CE_ERR_CNT		0xC0
 #define PCIE_CE_ERR_LEN		0xC1
@@ -468,6 +474,61 @@ EVENT_RO(vrd_hot, VRD_HOT_EVENT);
 EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
 EVENT_RO(dimm_2x_refresh, DIMM_2X_REFRESH_EVENT);
 
+static ssize_t smpro_dimm_syndrome_read(struct device *dev, struct device_attribute *da,
+					char *buf, unsigned int slot)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	unsigned int data;
+	int ret;
+
+	ret = regmap_read(errmon->regmap, BOOTSTAGE, &data);
+	if (ret)
+		return ret;
+
+	/* check for valid stage */
+	data = (data >> 8) & 0xff;
+	if (data != DIMM_SYNDROME_STAGE)
+		return ret;
+
+	/* Write the slot ID to retrieve Error Syndrome */
+	ret = regmap_write(errmon->regmap, DIMM_SYNDROME_SEL, slot);
+	if (ret)
+		return ret;
+
+	/* Read the Syndrome error */
+	ret = regmap_read(errmon->regmap, DIMM_SYNDROME_ERR, &data);
+	if (ret || !data)
+		return ret;
+
+	return sysfs_emit(buf, "%04x\n", data);
+}
+
+#define EVENT_DIMM_SYNDROME(_slot) \
+	static ssize_t event_dimm##_slot##_syndrome_show(struct device *dev,          \
+							 struct device_attribute *da, \
+							 char *buf)                   \
+	{                                                                             \
+		return smpro_dimm_syndrome_read(dev, da, buf, _slot);                 \
+	}                                                                             \
+	static DEVICE_ATTR_RO(event_dimm##_slot##_syndrome)
+
+EVENT_DIMM_SYNDROME(0);
+EVENT_DIMM_SYNDROME(1);
+EVENT_DIMM_SYNDROME(2);
+EVENT_DIMM_SYNDROME(3);
+EVENT_DIMM_SYNDROME(4);
+EVENT_DIMM_SYNDROME(5);
+EVENT_DIMM_SYNDROME(6);
+EVENT_DIMM_SYNDROME(7);
+EVENT_DIMM_SYNDROME(8);
+EVENT_DIMM_SYNDROME(9);
+EVENT_DIMM_SYNDROME(10);
+EVENT_DIMM_SYNDROME(11);
+EVENT_DIMM_SYNDROME(12);
+EVENT_DIMM_SYNDROME(13);
+EVENT_DIMM_SYNDROME(14);
+EVENT_DIMM_SYNDROME(15);
+
 static struct attribute *smpro_errmon_attrs[] = {
 	&dev_attr_overflow_core_ce.attr,
 	&dev_attr_overflow_core_ue.attr,
@@ -493,6 +554,22 @@ static struct attribute *smpro_errmon_attrs[] = {
 	&dev_attr_event_vrd_hot.attr,
 	&dev_attr_event_dimm_hot.attr,
 	&dev_attr_event_dimm_2x_refresh.attr,
+	&dev_attr_event_dimm0_syndrome.attr,
+	&dev_attr_event_dimm1_syndrome.attr,
+	&dev_attr_event_dimm2_syndrome.attr,
+	&dev_attr_event_dimm3_syndrome.attr,
+	&dev_attr_event_dimm4_syndrome.attr,
+	&dev_attr_event_dimm5_syndrome.attr,
+	&dev_attr_event_dimm6_syndrome.attr,
+	&dev_attr_event_dimm7_syndrome.attr,
+	&dev_attr_event_dimm8_syndrome.attr,
+	&dev_attr_event_dimm9_syndrome.attr,
+	&dev_attr_event_dimm10_syndrome.attr,
+	&dev_attr_event_dimm11_syndrome.attr,
+	&dev_attr_event_dimm12_syndrome.attr,
+	&dev_attr_event_dimm13_syndrome.attr,
+	&dev_attr_event_dimm14_syndrome.attr,
+	&dev_attr_event_dimm15_syndrome.attr,
 	NULL
 };
 
-- 
2.35.1

