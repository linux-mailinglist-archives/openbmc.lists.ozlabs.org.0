Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A063669596C
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 07:48:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGBcv3Dtgz3c7Q
	for <lists+openbmc@lfdr.de>; Tue, 14 Feb 2023 17:48:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JxD/d924;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::72b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=JxD/d924;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGBYg6Bz4z3c6V
	for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2023 17:45:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TicLpZ1Y5XMSmnuLLDHh1oVnQsL8Wol9nJvGtEx/WoIBrk+mItC3xGkDfmUM0xvQ5DGs1vC5CJgadfpDrgwwSJ0quJsdCtN58+vzzkADPq3sF7IBaMBkb7U78VZ+MrlyBFTeRLjjWJl9ryNHLpcM3Ru658eRzb0tQoFmvP6cqr3BRNmFWuYUqnVOv8m3EYtnEylz6HEJ7jaGz4V38mM+Ph6gcO9VDamSpk5BtQGOh91Ab3i8TnnX5Qaj5P3BinEt77ueIDJgenDqFOsq8pdGxfb7MJJlqgKmKAtYak6jY+voxhj40/aVMJVTID/R0Ww0jnhpzyP80ktWt86OfQl94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWAUChPo/u4uLIMKqytJT9gJ5W5sswUJY4XizDq0Y3Q=;
 b=Kmthv1hxloVFY2OowDrYc+sEbCbDqJhmB8sRPf17ucc8LA/Itj6SVl4GgY+pkGhTzpoQwEPY5MWCOnKYy/v9kflkDWNXi9VvxgdBUsR/G+xkr8IjE/Tt6kbOglCYciWLF1fyoXgVbjeD3EcXGEHjeFhOkihWwPrOnvVvBbBl+3FhmO/5NdZ75akxkEIgBzmduMR3xAuVKBZfsrcKBV8DGOcNWKgZvB49/pe3GAcYz2uvU4pQ1uPPMqPwjWa5egtQ88HVIxTRcvpRpEZCQCAbddWUPoSrfVK02Qz3BDliqYEDy08RDnKBJWbGtXKWaACU0aLkll6hRIUm68uaPSFilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWAUChPo/u4uLIMKqytJT9gJ5W5sswUJY4XizDq0Y3Q=;
 b=JxD/d924eLnbj1EjpOIAmvObOCEE1GiKlcUjVXuYlqA+i9XBExIhQgk3RTBo8xA36oadt4J+/o4WwHaDDbRmlok1BMbQeoRZ5S644bLnhCktGDL+d70D0isU+pl9Ks+tLajwKrn7+Wwsc4XA5cDpwTjYH84HOPa9ecWtSGsMbyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM4PR01MB7738.prod.exchangelabs.com (2603:10b6:8:66::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Tue, 14 Feb 2023 06:45:38 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 06:45:38 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH 2/2] misc: smpro-errmon: Add dimm training failure syndrome
Date: Tue, 14 Feb 2023 13:45:09 +0700
Message-Id: <20230214064509.3622044-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230214064509.3622044-1-quan@os.amperecomputing.com>
References: <20230214064509.3622044-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM4PR01MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2b7dc1-3261-40b9-ebfb-08db0e571508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	G0meULAQiqfM9LcqRl1E3ZCDNGdyomJ5M26be3I1qKyStnebbgPlCrcCRtIBNDv9xNqedaWh7BqH9Jof1f0867l/KPmzB+Au2eZHy1+CTyT65WQC/MATW/0SxaWDRNNFHZzxXx2gL/zU2y8yrbZ8ReP4ISrE/tPmW50Ax7nBKSl8wog+9TcgX4JDuLU58XfLh7n40P0zsbe9LKLYKvQLP0s4h9cxe+2Lfl6Q55a/GIrusPtqM7+Iy8yX8EqhQxme4BHT+IstLVqTMdI5ZFAqUSl91/WebEAiO6xMgQIbKaLQB3cBH3axZJEg5/a/xvfbuqjcotMkd00Rj+3v5qNcGn0x9+H/Gj9VZIc/19AzAZ/J03BzZaS0mS/hMQZIxph2HYLNJN+aNVrQ1RlbjhdLT3eEw9cetOQb7XRG4ghv0V2XBuJsPdSSZQy9ERzqbSzE2AniiL/6aL3MNUuF4MTPCnvmrT9VvQzE+QiEcllNiHXb+lZmnrTOe8OjVF3Y9W0Nzcdgp3cZIP60diXAL2bmqexmNfSUzMe0tkFC5nQdrneDL0l2xAj+NPe8BLdZiiJSPvlCvj9LBLWec7Ow5zDYV9etmRgz0qjMm1yP9gCuq/s4WxTcZnqwNxtYCmEgt7LDFBMUUNs3vxeaCP8/ntQoRMvNNAjGz25r8bg8K8svViTWyB53C5hnXUYpvHZx8fKhExLOLt6qXuNmZCbcVxvUgg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(451199018)(2906002)(8936002)(83380400001)(5660300002)(41300700001)(478600001)(6666004)(107886003)(6486002)(1076003)(26005)(186003)(66946007)(52116002)(6512007)(2616005)(6506007)(38100700002)(38350700002)(86362001)(4326008)(8676002)(66476007)(66556008)(54906003)(110136005)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HpXTjnsuOKLkt93t3uK/hNBD4MPAZvrQDL6PirhdfVZ7Lx0pXsr52eSc5hBw?=
 =?us-ascii?Q?4VvxBXsXh2D69/G05dS3zyI6h26a+SSwYpZSqhImTDXetEhzhuFNYaZEiDp/?=
 =?us-ascii?Q?vSGrMNQj1sIxXbBqOKUCjDzld0GFLnIzb68XN1p9xza/J8W0F8U/z3hRDpgg?=
 =?us-ascii?Q?+DXmeQpqmE4cfZnQBS9bQc22yVO66e2+Lfk/L3Vm6XBa92E2ApafE8QQTLiU?=
 =?us-ascii?Q?s6XGHMWZ4JhxjQw++/3oW+FRLoYHb2yd95DwyRAVC45fg3tXvb2zfB6ITnub?=
 =?us-ascii?Q?iCEhcoa/+0i05NUKLldPrFSEVIQ9b/+ao2G6NFRzjDaolgsJemHOXtB78hVN?=
 =?us-ascii?Q?Ya0Xg6COM3XWIEaqWqFDVbt9fLuU1ymM7DVJvSljtAGm7aaHNvHhBP9XsvG7?=
 =?us-ascii?Q?sXq0NXPSHt3QKYDDzh3ogLBGalBn42bLiJQ0CvI78GNRZwEu7J6AOgkRpRbq?=
 =?us-ascii?Q?sNeoDXwO40f4ZAC0AYsYzvuCbxjVkmp1dK6C6MoFGaoWFIGGA/w5uhJu0Xyx?=
 =?us-ascii?Q?PZzSvD1ODG7Kzv/VyFdQKLqbTZMPY7aVRYVquAHQMbEmOelTIJ7GUEr35D07?=
 =?us-ascii?Q?tCbao73blJo+UuDQiM/n9cukdqj01E9dLS3UyWz0Rkzj9ruENKSY8pGXyKJx?=
 =?us-ascii?Q?GJFNuE89amNwALN+VBCAQON3ZbvsJWVyiftxNDbu02IidOMrzLwABM/iFoVE?=
 =?us-ascii?Q?6B2Lw+34pgVOvXFe2xQLWT00/69s1THvg54oS4tLb8RE4P8u8ry7dvdTw6FD?=
 =?us-ascii?Q?A8X9aXzNYhgifs9qptB99ZMGEeryhmOzg2nTzZ9cyAgTQUONgims07JEP6ov?=
 =?us-ascii?Q?dHbEU87p98M4OfQsRiBKdJTjl4KMF4XFZhy5bxWtWoICI5kJxOdZ7JhTZfii?=
 =?us-ascii?Q?Qtaf214qhAdjM549BNDF4NpBiStT8EopkVfs5a+fHOYN+IcdCNXIKU1tvp4y?=
 =?us-ascii?Q?+C3OJhXeXD4+nKRwdBkLnblCrYw2HSywHVrwqiw9oFEsyHccapZ8paJj3nKA?=
 =?us-ascii?Q?j2P5MK0PKz0R4+8tIdJSz8S+6C9vtBKfFmn0YyEBjOn3v11uxpBb972Sdz0l?=
 =?us-ascii?Q?5F2vJV0FKljnwkE4lZNDdK4CkBtl5W+PByL8xQK+TsG0GdC4mBOPNiRQ8i6h?=
 =?us-ascii?Q?A0y/B0v/oT6QIV93IHpiOysJExaN9SS+9fWaAR0uFacc10Qanp0Ks1D5806v?=
 =?us-ascii?Q?U65uvwJL25MV3CcrZutAq8QUU3XlRVGHJIxduedyCQ5Lo6wysThoXmlFoUAO?=
 =?us-ascii?Q?eqwJPgtIdKjal+OHAq31rSWOze1UcAI7HIeJodg5JMEmG2nGgRBnaTEKqOsC?=
 =?us-ascii?Q?wKtGOcJCDPoXPGXck7JV9hZoVnFsa6AZH7fw5iX35zHBa1uhua+u0qF0FiQr?=
 =?us-ascii?Q?d07ACdBrtt20+gMKAQjO6oPAZ6W6jiOBxB6/nSxzTri9/xvFtMQwedUpSM3+?=
 =?us-ascii?Q?yxkecWPeSoLJWZgqOehbEBuIjl+DO2tR3iAqI0xxIhIb65FMpl92EFVZL2eU?=
 =?us-ascii?Q?3POHvF4TqfaxbvHCVmqwvKaqIp6tSl+ufIaV2F78imS+R+RQmWds1ufrMhGc?=
 =?us-ascii?Q?K4E+1q9FowiWNxEPhlsO5jHS69gDIcOh3bKyj7VyJU+GPdZ12yHuziR7es8f?=
 =?us-ascii?Q?I+kVqj7s2sEAOKc+JbNJu6g=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2b7dc1-3261-40b9-ebfb-08db0e571508
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 06:45:38.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eo0RfXqXuxXyr34Heigbm8FfdqfX+pcsKnMrKnk+yQlXakxvsDBUX/eUql0omiM8BmQ7438lca3cvOrCKLu1NEEiuljogpCCWPgn1tEo/38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR01MB7738
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
to BMC when DIMM training failed.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
 drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index d4e3f308c451..c35f1d45e656 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -265,6 +265,16 @@ Description:
 		For more details, see section `5.7 GPI Status Registers and 5.9 Memory Error Register Definitions,
 		Altra Family Soc BMC Interface Specification`.
 
+What:		/sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) The sysfs returns the 2-byte DIMM failure syndrome data for slot
+		0-15 if it failed to initialized.
+
+		For more details, see section `5.11 Boot Stage Register Definitions,
+		Altra Family Soc BMC Interface Specification`.
+
 What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
 KernelVersion:	6.1
 Contact:	Quan Nguyen <quan@os.amperecomputing.com>
diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
index 1635e881aefb..3e8570cbb740 100644
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
+					char *buf, int slot)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	s32 data;
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

