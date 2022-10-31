Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EA612F23
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 03:49:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0yKK38n4z3c3V
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 13:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lMB7xQZY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.99; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=lMB7xQZY;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0yFX4Cd3z2yyZ
	for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 13:45:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7uRYhdeL8oqhwNuKXPVP3hHJqDrTNFwylMHjmRwSHONzhsUzcpGx/TKe6GN8zP7YHTh/F7M8UFMkP13dGE/rstOIbcmFIwnX7YA0SwpSmI/Se3Arig71iCDIv9DZjtH9NrPfPUfJA1tlZmdSpQiaU12f0Y5297iKif26os6ls4beMPmSEaghO2dm9qlcct7pRX6iR6/aV0P4fBgCloeqJkenucIDALynKr+dSXk63OAkfxXRzxeVofPgz+njtuN8rS5CnyE81MGKg0J2vYMK8bpUMXAZFakca8zrvcSVLbviqkP0LcazE9uZAKAGFkEJGDjq8fIyxQApNbxsJ9UDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo2oxZdDgQx+ZTaFH4lEd2Iu8cT2Pz+K2sjMlN4vUL8=;
 b=D8am8yccKuDAxRDhQJri5Du37DE0L9o50GxANhLB+StXC/BMIKGO5LUFDakncXskb/wtt/E9EdM/1bNYvrIsLHYssfC2KR5MyGUoR3USFXBF0RfEeiDNFMW/LIn4uQlqL5t/XhMV0mUbqc9uGpc7eHaxrC6b0MBuyUCs3AabfGNuQiuoqZ509c5+Rrxrv5IR1MESMn2KdzkbwSpd75+YaoMPwwGrq2dTaCBZUYYtrfP6Y2C3R5r/4GUy85OuvyuLWJ4iztTiyPlcWlXvxGvMrlbmLsOhGhudCVeJUF3VuQcJ2G9W6n3Y1Rd+697QoMdrnY5a1xnA0QLw8awxCVouQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo2oxZdDgQx+ZTaFH4lEd2Iu8cT2Pz+K2sjMlN4vUL8=;
 b=lMB7xQZYlQUVPZxnhoRHGSv081V7YWBb7K24OkEIGe7mDhNLWK8Ia56IvIDt2+HEAJxoA4AHICNt47JFX+6uOIwY/4BCgjOxA980BXUPUJAZtB8DiH8UXGKHFavyy8qcJk4ikEAR6zhAM4WysoXw5TJ2AUNEKzOFJZvxrVk8Uoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BYAPR01MB5336.prod.exchangelabs.com (2603:10b6:a03:11e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Mon, 31 Oct 2022 02:45:36 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90])
 by SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90%7]) with
 mapi id 15.20.5769.015; Mon, 31 Oct 2022 02:45:36 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 3/3] misc: smpro-misc: Add Ampere's Altra SMpro misc driver
Date: Mon, 31 Oct 2022 09:44:42 +0700
Message-Id: <20221031024442.2490881-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221031024442.2490881-1-quan@os.amperecomputing.com>
References: <20221031024442.2490881-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BYAPR01MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a0ceb5-1dc9-4ecc-fc06-08dabae9fd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Qmsx11DWgd/SnqTT+bnkGlfwpoBccMWnDvtFSp39yu3qM17iYSFHTxmoibPqMGY4U81id3QDG3H2n4MIffydlwoB16tu6zZ3kad8e6wzJseYJ57RiJNrm9eVMxvgnWksja6EV1NkjBz/NK+sDGYfAi8jBfFRtaSXZhAgqvzN4PGXiETVqTa9XLRz7hva5EiC3I/KGOT2CIC0OYJbv2S3uvbNf9RBAHIgdiIyDF5sGSmUOfy/aYKz2Vkyd82QbELBCvhdstP7pl54mUbgKKdPPJYdoNi6TSCJ8zBHuFcQ3WlXny2j5XHjGRhDf7fX49uGr/PiEhg4Pt3zW2OEoB8xMPsnSNcSZll+5oS3FIHWUjfdLnqAT7MHXkBTF/vol/MhED/n/+W84TanaSxP9BIKqXNgBKoMGLLx3PaRVJNqB4wI9cQjjuecT3h2U4qBcyUlSqDtK1bmaHYLQzJRqRo8iiWnf1Fm1dysdG55jt20ZKasgtfwE4mjkGNFJIOHK23UulYE63iIlbUJxUvsMQPWpMd9SEbp2T7ExxKgCbi1Ou/llHckKTQjzg1USP19ljxz40F+dfmGf1jtsV1dv+Owxs6zGM7afCVI/ipY3DolGPa+Az/z0RKPNbizhw0nclg1Do4vzifj2aPvGEJWvASlNS2U26JaIxfD8Ek/kXGEBPaIdeaJ+7BnwrRmQc4FFE9u3uvVG8A/qaNRSvKC+jaTwbBpS0KrwazPmON9wsNkP6xsy73pMQ/9r554EFlqHzm2oCxmqqzqzOtfE5K8JurhPQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39840400004)(366004)(451199015)(38100700002)(38350700002)(66476007)(66556008)(8676002)(66946007)(54906003)(110136005)(4326008)(6486002)(316002)(86362001)(83380400001)(2906002)(52116002)(26005)(6506007)(6512007)(8936002)(186003)(5660300002)(6666004)(107886003)(41300700001)(478600001)(7416002)(2616005)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XUhmrtlnk/Ht3+1HFWPdN5+iyY/jgP+yZPkMWbE2UAD1LLSa1K/iiY20tzCF?=
 =?us-ascii?Q?+aNupyTjvZar9iM9T2ph8ySXxdTtDxHED1KaPtN0O609mCeGneGOhQ2aFEg4?=
 =?us-ascii?Q?cDRP1+vWnChEGL5z6gRM5nONBNrWg6WlrfTbrDr4GxgUdwsRqgXtmxI9dQyo?=
 =?us-ascii?Q?IXkUVw5tflF0tUxyiYRpuRmz7NE865qzuSXbulsP9aPG9mX5H6Fe7yCyYkpX?=
 =?us-ascii?Q?QzmiI+JNwXSI7BAPJAt2joFTEu547jgU9BD/bUpDfNn619V87jNj6Ghiv2tc?=
 =?us-ascii?Q?7zfLdtNH6sOu9l7VtriSQZYE28O5eK5ae5etigOPC9EW7cMEQrDFVkrmhM2b?=
 =?us-ascii?Q?WNRp2TXuUA53GzHpl1NFJhF9YNI1f6xOgiWHT1dr71lOL3MzWqqFZIEEQpIF?=
 =?us-ascii?Q?jFtPZWCD2Nq/zHZA0pNIU9VZHUgajvxz90Nn5RgpAfT9WSnmZJi97YTtYD6D?=
 =?us-ascii?Q?tz2axd3BYI+LqbpUj04UI+stnme80XbyRic23JD2TXi0ws2HwCx6RlOLu+FT?=
 =?us-ascii?Q?4E7WWMmOvUBnBTQzFwANewERMmFHMszT5hduJemRMRAcT8t0+dbiIdikFL//?=
 =?us-ascii?Q?aWOhiXuFVJ7TXQdaQwW6TxAbk88mZBSIKMoIgrTdd+wYBDW4u9fbu1ZgGKAf?=
 =?us-ascii?Q?KCWoyTFKJI9kMzmjU3CWJQWpBvYQlY8q8zRlkrefO0+KP3OPnpmnvaehfevo?=
 =?us-ascii?Q?BtJmDbx9Eb4ThcyI8A/M9MlHOhxkgtqWldPsV+e4Z/TT7hjR3Dv8/x7pnrTs?=
 =?us-ascii?Q?zPrtvKF8ZYpd/7T/ofWmDwFDuwMoIUaXDKuMHai/oGaRFE2F2bwbwLi5Xmuy?=
 =?us-ascii?Q?1u0AC02kBG12HM797f/qXj67pGPzQ5DYkgatDyJgkRT1YEK3DsQI+wj0ydIx?=
 =?us-ascii?Q?J7Ha42txkhn4WhkJXkol+6QHaEZdlkTRgDrfA0h35Kn5L8zcMTKhm7PoBoMP?=
 =?us-ascii?Q?RrE/wDD24f9NOGo4llrTr0gbBqcsp3fE0Cex1l+fDqP+M6dVNH57wunAYu0R?=
 =?us-ascii?Q?P5WbjIJkvvlF70h/vsNSL6fEXUYxG9sunsLfAoTrFxE99TYBj6uxUPF8bcF3?=
 =?us-ascii?Q?weUd7NfI3HYWbf+GPugPhcpX2avg1evsEDdy/15pSBeXTCYTe6X8mMeRrehb?=
 =?us-ascii?Q?rDiEH1G9hpjk5lPR5KWZAByntzExDz3Ctk0YMt0MARydLcqb00u3jt9y+N+k?=
 =?us-ascii?Q?BpuzKKLVcuF0eKvdIKA6tuDUE5E9WcK0SstbqdE/PsQDYApd1I30G4Z7h5fR?=
 =?us-ascii?Q?DPrIqwXURKW38uUxcIYy8Ofr4dqhSk0wisHRQCbxtnutpfqOONa58VjHQw4J?=
 =?us-ascii?Q?OvHHKqF7n35cSxNWRcb20x1nznMdfBhVwTWJaaSH3wi+OWAUMVfjJukH0+eI?=
 =?us-ascii?Q?03YpoULlQwc4+ZXXBz2BzpNa123+Ucfm1xiicIfTqmt8kNEb7k+5KNhyF0Mz?=
 =?us-ascii?Q?l0rumRvKX2CTGMVwHrlFH3euwpl0zRhni9jeXfOD1xQsh1j8ALG+/LO/aZH8?=
 =?us-ascii?Q?aR7AxYf4tVCZTyIF71v+h/dsSBHRCNAirABuI/ZQOUsZji3SvNmfIaUbpFvs?=
 =?us-ascii?Q?LxASYWQGGWq3HiZ1rTVj2zan+V6VJNEMKhsA2W8QGadI8enq93rDfxOzCNKh?=
 =?us-ascii?Q?wbLafnm28LcDf/XmeCF8QGs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a0ceb5-1dc9-4ecc-fc06-08dabae9fd35
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 02:45:36.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12PTDnGihPajvKLrqRbk7R1LHeDh4x1QB+5/KiWShTtCesgTxOcA4YrJn8uVNMnVjIo6meS4us96lFUHwTJjgKaIsQZQVglWGwdBnIggIqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5336
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add driver support for accessing various information reported by
Ampere's SMpro co-processor such as Boot Progress and other
miscellaneous data.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v10:
  + Fix document format                                    [Bagas]
  + Update commit message: s/This commit adds/Add/         [Bagas]
  + Only use Documentation/ABI/                             [Greg]
  + Drop Documentation/misc-devices/smpro-misc.rst          [Greg]

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
---
 .../sysfs-bus-platform-devices-ampere-smpro   |  48 ++++++
 drivers/misc/Kconfig                          |  10 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/smpro-misc.c                     | 145 ++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 drivers/misc/smpro-misc.c

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
index 2b84dc8c3149..ca93c215ef99 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -262,3 +262,51 @@ Description:
 		For more details, see section `5.7 GPI Status Registers,
 		Altra Family Soc BMC Interface Specification`.
 
+What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) Contains the boot stages information in hex as format below::
+
+		    AABBCCCCCCCC
+
+		where:
+
+		  - ``AA``      : The boot stages
+
+		    - 00: SMpro firmware booting
+		    - 01: PMpro firmware booting
+		    - 02: ATF BL1 firmware booting
+		    - 03: DDR initialization
+		    - 04: DDR training report status
+		    - 05: ATF BL2 firmware booting
+		    - 06: ATF BL31 firmware booting
+		    - 07: ATF BL32 firmware booting
+		    - 08: UEFI firmware booting
+		    - 09: OS booting
+
+		  - ``BB``      : Boot status
+
+		    - 00: Not started
+		    - 01: Started
+		    - 02: Completed without error
+		    - 03: Failed.
+
+		  - ``CCCCCCCC``: Boot status information defined for each boot stages
+
+		For details, see section `5.11 Boot Stage Register Definitions`
+		and section `6. Processor Boot Progress Codes, Altra Family Soc BMC
+		Interface Specification`.
+
+
+What:		/sys/bus/platform/devices/smpro-misc*/soc_power_limit
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RW) Contains the desired SoC power limit in Watt.
+		Writes to this sysfs set the desired SoC power limit (W).
+		Reads from this register return the current SoC power limit (W).
+		The value ranges:
+
+		  - Minimum: 120 W
+		  - Maximum: Socket TDP power
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

