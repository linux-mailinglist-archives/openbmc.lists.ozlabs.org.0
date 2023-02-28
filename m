Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C36A5594
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 10:23:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQsNq5RCTz3cBF
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 20:23:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=J1ko6Yhx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=J1ko6Yhx;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQsL13Phfz3bM7
	for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2023 20:20:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsHiM6BPzPkfZw7BZU8g+b7tt7QWjchwzeilWV/1l/zH3mRlGRT/LGb/NlaX3LkU1W0PKu4wesvfIZEzTFxZwJLs7Tt6HMH16gUeQ/Co8VI2FaWBGNy8wCJ/VaS1411XQyHMjIc6DjBHcZnMyOqmGGpRUEECMYbKT0q9FVdEflPKHRKKZX9OMXSV6JGahNqzDlckXXhKTp6EXpgi2SCr+MRoilRDDvHxh2kPeiDAaRXrSnT95SlZq8fmW4Yp6rNBodtJmBsAYG7quBwDJ3mvsx0LGePn6MTWXad5R2RSiPgRoj/OzgvfJ3mTPxYylcRiaCsnFn/taJljcXroq3UGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HV3raVgT963lo0Qx8AhRmxaH03ccLTVpGLKw8OsSZFQ=;
 b=oWJIBvMK61qBxSqknHi254/zclcTtI0gZhAmrEzn+RJ4S9T2ptpwx/eRSGiExUK+gzyJxogg2sLQBSTRAsnaMzBtCDX5aiwv+3zJynI7EW3Zy5+CTbQX3LNgRNQefiNU8m7UAgWtAYfKYsy/I+B83e6SYhhb2bimIgo/kQL2IdL2hm57YndFtf2HnV82vQZqk0uqDRwDFhmjjHkobaa+9UjHdnNHcfjDZbQyqxXMpFDh2Ze8+4inupjIwnapCaAt9TariuBH45NMRLLVVKuKUePaVFPR6L72LbOnneTdheQR3ul/s0BUBbiosmePL68+/smvVyMFtEA4WGU9f9/8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HV3raVgT963lo0Qx8AhRmxaH03ccLTVpGLKw8OsSZFQ=;
 b=J1ko6YhxDSEk6i9aKVDRnObNnV6o9ufsBfCwouJ83/Ie7oYMLT41/rdxhv3FtzJBc8JQ8jwpCgqma7yF1+Vx57CzR071gkj7gUtewbe1FmOXHlsYY/kdU63g4h+C6ea5Al2EcnXm6L0PFzqUdLMPkQaaGHRQbX49m/WYg0sv1lE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 MN0PR01MB7780.prod.exchangelabs.com (2603:10b6:208:37f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Tue, 28 Feb 2023 09:20:38 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::ff57:42f9:7d6d:de10%3]) with mapi id 15.20.6134.028; Tue, 28 Feb 2023
 09:20:38 +0000
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
Subject: [PATCH v2 2/2] misc: smpro-errmon: Add dimm training failure syndrome
Date: Tue, 28 Feb 2023 16:20:10 +0700
Message-Id: <20230228092010.1863419-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd5f7b3b-316d-4fe3-0989-08db196d0dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nQf0d3T0LrgmFbxsJ1ck0ivHXC5LILDLDhUZWJsEDa+WyMWKJc+o4rhdUm9qtTiDm1ktS+uAeYSGZG2OYm5MjX2yeeknAEGXpxqppktb7O6hLoQ2ufN60ycNFCM1DTVWLsB454RsJB8Ni9enQSFjGHDX8tC7zVPhfbBBUOAUWE30bMB9/C6e9fa/jPmQqdNdZNClbdX5ftlYlig8Z6mrtmj7UikIT4bAMK1L8DtHhLL625/fuuOZq0NoNTaBT1uRzMvkOsuPb/MQRuQPQvoXg8FV5KVYYwrbwoEeaBSLm6Gu9cz1lhkSem0C4bq74Z73y/3BCdOQ0cHQ0hVfSdAdFFz8jnlZ7W8+XSoYq3hWWB4EezArYW2S6EKfrMnXfoqhMCiVitUhsu5g32+9/cCWyYrQKESwMyNpM4f331etLR158WsgrXP5H78kZs7u2pdQQ8wBVmkpDUF0agq+VHr34Z9MUc87l5FqkyFnhtwa/bfUY/BA+VTknUO/cEJ+MeNyIK72H6jM0cV/ztnPURpVR/frQ6qWP7RFSazZ8PeETtcJTGzwMkluSaoPuonzZNU3RpN7N2njkfzmEwHM77cplKU4kCcfR5vCFGUmRnLG61s6QAjZCuUD7/u/OAp0dg6ElrhF5wqf8SwO8x7Pc3kNh2LM88dX9LSB2kAmXAbjjwC9o/BCAgV/CN8M3wxLSY3S
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(451199018)(86362001)(8676002)(66556008)(4326008)(66946007)(8936002)(41300700001)(5660300002)(66476007)(2906002)(38100700002)(38350700002)(6486002)(316002)(478600001)(52116002)(107886003)(6666004)(110136005)(54906003)(1076003)(6506007)(2616005)(186003)(6512007)(83380400001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?f/1CKzMNCai8SF7Lhuz7LNDbNdWKXgdvVQhjFWjeVUPnO8uRGa16w/JJYlth?=
 =?us-ascii?Q?NZM1DvGMl0vjiXiw+PP4JMso11BH8I0bG/+2qF22ue9q5F3ZEM+cQjp0q0gq?=
 =?us-ascii?Q?3kD8oOpWo2Gq2A52cXtNdX6N9YZhbbGacbhi6c0/ditGuu1UndxcbpC1kM+J?=
 =?us-ascii?Q?a9ZmHwMN+H5esB78aO4EV+/gwOq0x8WDUclGHJ/JQr5Rt22A1KpW/wcoBUkr?=
 =?us-ascii?Q?vEBDtEXpt1ljOtlBI3jvAGcLT5gyYZcPnBjZpTjIEG5j7uIUo8NFLORLz7xc?=
 =?us-ascii?Q?fb/+zWi5S9DJUYdQsvsSvf0f/3zVhRff3Q9olairPyi8iHajucTHPjOa64Bl?=
 =?us-ascii?Q?shlr0YPwSH+fHYsXMkC4jcs61SDCsoWGp7evEOPgJLs10z68ypCgJhceOFr3?=
 =?us-ascii?Q?7nnO2/yEzwp1oRfhdmfXgoAPsD0LwegD2HPBUE7m7h1InC7z1FMrY3k4YrsV?=
 =?us-ascii?Q?5ZzZsYQN1M2R3wrbHGIYhxm9NB0WNW1UrBvUBYraNZ8iej2MSq16mLotqkEo?=
 =?us-ascii?Q?/P9P7ZiNQxAfGCVrUQmFYO0HRPGFolmY9FQrqV4Ke1F4M2vblpZgYUqSJg1p?=
 =?us-ascii?Q?m23cR1XE33v203emTwVoBrWaWWRMj1X6sioREjP42os3WwnrFC0VBLOLa8Dd?=
 =?us-ascii?Q?HO6chYt58g2u7HU0vdvjO1lsyzPERpqudLWcmjGrv/uA99wyJWwMFYYUiI5K?=
 =?us-ascii?Q?My2HYjnKCaif0fzn8vG0u6CiHxf2pe9If0FNrlpBrfHupQh4pefNTGVqM7Qx?=
 =?us-ascii?Q?GDd073vNjx9xEYD5yXHeypoZXyBR4ozXe0wN8e+ApuXrONRdXU2z3vcuAfFd?=
 =?us-ascii?Q?V0farP09ySA8NLjkeVIW74r2hk+on4YXebHxBZPSGJysi89XiXQfL+TOLflo?=
 =?us-ascii?Q?NrwDTRe/AkYv63Dc6ctptsDocM8/YpcwRSN7VzH1LFk7qSaddERD+0m7A/aA?=
 =?us-ascii?Q?NuxEg0iM52Mx3UPoGe47c9ofO163uJk/nr7k3yJ4acomH5OBI+YviA4UdLEf?=
 =?us-ascii?Q?DAl0PrlKHJD7tuJ49fu9/7f+WfbcU2EIaMw8w/3n0Ve7VO58wqwL69Ru0/N9?=
 =?us-ascii?Q?DzUxd+BjsG3dW5fEmavwg5saoNw/8Fdr8wt1MO4LN3V0BBntd7jCPIWaYqoU?=
 =?us-ascii?Q?MAlWh8DsomFqdTXKwsetlLFC3muj1lWXBY4bxK0zcWTb7NJA1dkB3nZaVMzJ?=
 =?us-ascii?Q?YCrm8OCtyQFCCB78tM487gL/rss0gLwpCtb3Rr0RyPFw5mOT9PwyePY+RsBm?=
 =?us-ascii?Q?6rim/54yPrULyiAefBIiAkjKUuInwd2c0K/JF6Vev1twtNwt6xgjFfr9IjhG?=
 =?us-ascii?Q?onNlYuIPf2YGq8d/XKY3FADsCGIcDK8Jk5rOcL9BukHFpre5xxah3v1Wci8v?=
 =?us-ascii?Q?cR2QI3Bm0imeYuJY0hxHylp9esvx4ho3usyetdbfAR2guSVKMip0xaMcQsmm?=
 =?us-ascii?Q?08bPD9j9I0ME7FNPnlvumrFEUjTK0vUwzwKWZYIiXx+jg3cEjGAYRGyuysLF?=
 =?us-ascii?Q?YmPPOVzkVy2DU963TsQzO90+ng3VNZrFMnom2DH+kk74Tr4UwUzOdUQTvZRQ?=
 =?us-ascii?Q?gLlV05+fnh5pNg45VarMOz6x4UPC/TA9TAx7LJzgtBT4CIyyjzsOXLQCLjvZ?=
 =?us-ascii?Q?kQKPclaFqOgKFw8nlGBzSj8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5f7b3b-316d-4fe3-0989-08db196d0dfb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 09:20:38.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD1Sb56xnuBVKhhvyqMA8F1ySdInS5khIjFne4m92pEuvNyouhi9ZEMgz8Q79oLiKBlEp+SeKFdtTjdxnA0/CnlQqglcc4GaDNuMGR6zcQE=
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

Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
to BMC when DIMM training failed.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v2:
  + Change "to initialized" to "to initialize"            [Paul]
  + Corrected kernel version to 6.3                  [Greg,Paul]
  + Corrected variables type to 'unsigned int"            [Paul]
---
 .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
 drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index 5a8d1af49a2b..44101d3fed22 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -265,6 +265,16 @@ Description:
 		For more details, see section `5.7 GPI Status Registers and 5.9 Memory Error Register Definitions,
 		Altra Family Soc BMC Interface Specification`.
 
+What:		/sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
+KernelVersion:	6.3
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

