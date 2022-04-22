Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6D450AE41
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzY61QZCz3bbG
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:55:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=FUkr77Bd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::719;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=FUkr77Bd; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNh2Y5jz3bXw
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLF+j3AvPaLf0xjAlBTynhX17EdEKoYOwfvD99910uZUTrFARYCbb08h0ioxXACCHlTzMMWW1Vin0MVga8fw4CAbXqPeTGO15PsAY3aNPJjPTzrtv7h7KdyFo3HoBLhKXevfdVO3jrXwfM8AeIvIs6+caGkV8gOOXxlTE7iyLD7d6WyWiYGY1mimMfcto5tLjy6Ls4pXd/6x4xNxATEfY28x/NXv6anifr5mibeCvtAI8WQlb0NAnaRp+MrmbR3eOeEUtPdFuuDLRs2Sh1NPIxF6c4cWnEUpECXY3v+0GLHLZoLknZ2IBwG4g7VmaaAFj4TTF2aR+xr1UFyfQk1gAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKW3tX2irOcFfd4A5C7Ny+p3TT6LDPyX3IvlKuTfscE=;
 b=Nfc/CP2RxH+95XB2fUUvGyeKX+ApKyjFOQAx9SZOMp1xENP9x8eW0asQT3x2We+1jz6fPtu/ll+xt63mdnpANrUa+A9my44erbklK7PRNRmBgPb339Cm3/eYbYywQKS32aJqdNFrRVxImTX1AgFER3sFihvROicz1mg0NLMoFTusySB2sObNbRrtqi8+3JCQMokjjesgbVVVyZBmdAAnnRSEheJ0wZgNRCi4pFMXNVgGsfeWvNhy1MAqQVqsV3ap+ZxDwfcKQ5cWe4rmftVaHDsXUgTy4dNEWhhPIoF1fO/Ch5/HM1PDDcpyuE4AFEhOn/AxrJU32i0SnVXjjWCimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKW3tX2irOcFfd4A5C7Ny+p3TT6LDPyX3IvlKuTfscE=;
 b=FUkr77BdWxHs9h/HvobKJJGcapNlw7LiNoxgfhCQBsQ/9o1bvCFqMDEDkVbbU8gELaSfw8lXFvOvHUTfbmk3YOyU6he3XC7+2Ln+88k/e5BzPei8yQwitelu1WXMv5eypEc++LP0cAcodvI4wYCoRfsKssYlCfqnO4Wxz8DuJUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:58 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:58 +0000
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
Subject: [PATCH v8 9/9] docs: ABI: testing: Document the Ampere Altra Family's
 SMpro sysfs interfaces
Date: Fri, 22 Apr 2022 09:46:53 +0700
Message-Id: <20220422024653.2199489-10-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0858b4ab-b3e5-40ba-54d9-08da240a8245
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB4653115963C5410E5A868DB0F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbST7Z0rpWJ/O+Ka059B+jWZ1bDf1tLtlL+R9X0bVM/0nTakGLPdlyVE2RQi9+Y8uVXgjuWgStXXtMuiU16RIbeFOZ8UUWMeIjPG6b244Y3oP89V/qgQ1bPMppKZ4+IJEnycNcvdbuXE5RYG5+yoMvzjDhFny2DDIGr1tEO5SuujN46SnTdQky+RmnrAc+m544EpZVr386jH2mnm6XA4tNrsKLFHLbaGq2uqUmqsNl4UOQEQnX2Kkh9zSwC7jrMPf7ZJw+SO94NLeqZBN6VQK3EQZrBqGhvDkFpFWru4kY/2/SSzpo5KjKVco++WWJAhR4FwuIViH1IJwPx0JAoece9MVTvQwJTvcBZSa8lM1Eicz1Tj1LUmccmNropmr9dKOw1bJ/AqNMSGdTBxtOUkffjWWa5F/e1t5CdwNN8jGStmBukHurK39RRmvnUWxUvB+E2VgX4wNYgpWrHGbRhSNeWV74kWqgYzFAar8bT9/GktrVgjTd3dlVb0gCZWAXGio4iXItOsGS0Ws0fo9DydIYYZQr4/BapYjk/0zZLRzX8HBwQCHCFcu7GFYGzIsNGfZCpZkiOjt2eqRSFKOef5a8outjtrrLCpiCkahnN164R0BoWMwokY4UH6ubA3q3HRKwbLKYXLQVidFQM6f0PHWSpaW9I04rOnw5UAvuR8+CAySfa42YepdMPs3Z8tHKPob161GTRXya3QojsJbMYqBooWKIPNHfYpv/E+LiBE5Lo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKxtAaoYVY8LRLued8o3R8S6NDPNYLOHuP118n4MS2PTFgjbkE+RaQhF2I4C?=
 =?us-ascii?Q?7U1aU3fPXiGeG/jg9VoECEiSfXTpc/bmQkIkouiut25+4rOYteQBuXLHl79x?=
 =?us-ascii?Q?7T2t6Bl44LVoY3Fz4HJW7AgxMhvnhCWiJjczs0yhRub/piDvrQKhZNqL4xeO?=
 =?us-ascii?Q?nYgavSO7Q2OgYramgHdbj/IB9UfdHYrFoJwVoyIWuGLObcLbW+nE6wzjXL2Z?=
 =?us-ascii?Q?qW1re7/Tq/mbZnx1poSPzqPijCIF2quL1ZAbbhJ+KR6n405NnjoeaQClcgAF?=
 =?us-ascii?Q?fOtmXEr58aR3+1s6ShBAEbMNsUNhXS4MeyeeyTEMSAaEbSuldL7A9kym+C0L?=
 =?us-ascii?Q?Fy3Lef2WeT1ShmYzaanblYDGxIpYxME0Bjiua/RRAkShlmpHFkLfTnzwuuKS?=
 =?us-ascii?Q?loGB8bQ//f2tNxHsKkJJRAAnI9v9iGwwYyygTW04csZ4nu0zqS/oS3ChRyba?=
 =?us-ascii?Q?vMF9TQAdW308eSI08lYfLq0wzmvFKXVXRiMGzbYG1oo9ws5kx7rIgwKRUPPS?=
 =?us-ascii?Q?dZidovry3IRDuOcqaD/boKJeBicTElNXLZ/eiCmOFrsHaKyRsFwdhQr/933a?=
 =?us-ascii?Q?yoLcpXKeIc4qEIMAt+YvCoFaOizKO1WMLq+DCXOHXplATtj9dEdgONRBiFh4?=
 =?us-ascii?Q?H9y7aMuZEp5kc5b8r9Pt2ZrYcTHRGhz22VVXOvHe+qRTwbQu5BCuVixb5FDe?=
 =?us-ascii?Q?XXaINIo3A+lw+6hAW3anPy5ASU5F2KgKToWqkvCm+Q6tXxsqla8hLv9OjmLq?=
 =?us-ascii?Q?5i7GafOwmsu//aAXZWEFFoGSGJd3sBJiyldL6DL5PPNAmCQ8YfNT02V+6ghv?=
 =?us-ascii?Q?aFeC2IyO2x5aygsOsg61lRzCOg+nfUnQ9999erTFONpseGhzV0F48Dv+arlJ?=
 =?us-ascii?Q?jAvOiNAzbtGhJrsLUovU8suaFBH+yTIg0lFzdJIHsQ6CGJ0b+wwHVIzqUiPM?=
 =?us-ascii?Q?lsq40xZDi4r/H2E5bLhJSThJLvi/a5hcCrcCmL/M6EHPA6ykD/wU2Llr03VH?=
 =?us-ascii?Q?ZcRLLZqYeVDzdAsvdpxBfS0usaLNgwqeCqePhm8k0nkJj5rYS41Yg3XH3roS?=
 =?us-ascii?Q?wFztjS7lcPC7prjqDCTJNUBWEsKVQkMaUjerel1rzZvbkOkLSFUSbw1iSpgB?=
 =?us-ascii?Q?6ZilIxfOU8caCjZbdWzpm9YvdgjugBWTD36JYwtuFi0VUyI98r/30bhCGNpn?=
 =?us-ascii?Q?gIoIKjWxmYQcRbbmdjmoMqljy9o0Y5eCuwN6J2krDAikD5RVMN/tjExjwDue?=
 =?us-ascii?Q?mDQMSqzFWGla10P3w8RShCZEZTAYjpvE1c/ISk0jUsu03NbOZ6OcQiyM1lH/?=
 =?us-ascii?Q?QiteU5tam9Ll5PX7JuJzD9NiK4Pugn6AzHO7o7LbNrTZVDAZMlFQMyFVvi2V?=
 =?us-ascii?Q?/+Bj8BCiXfz5MlDsVHWfGy2Uls4Rwp6SlaTod/aBcSRe8YxI7/zMOQJmjjxq?=
 =?us-ascii?Q?s7tpD1VoU2uJcq2gDQAod7mlefPXnq1kroKM0bc4Odp8LGWJzcH3KGZLAbKq?=
 =?us-ascii?Q?tlcb5KlnoXX13zip3zPelaxn8ZbeISdwUg+k920g3vD+gdb0GZUJxAkqh26y?=
 =?us-ascii?Q?pQMDISlknde/NVnQm0ptAU09+VzEIJSwE2pzU0pWmyioZ8CPR3qW8ujIQgwG?=
 =?us-ascii?Q?yAGDLdhh1QWFAnKFRmycaskDmKz8iIUq7t95Y+4dxOh45pY1eCAsBhRi8Icm?=
 =?us-ascii?Q?QubEa3jFH6ekiM4rE+YIi5YOEoKdBpUiS+3cLIFce3P1wWOPNFT6H605sMlM?=
 =?us-ascii?Q?8QrOlXC6FMgYaBqAUtwsXzqpRxdsIOfBnkK5O/8AilhtnysQ1H+d?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0858b4ab-b3e5-40ba-54d9-08da240a8245
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:58.3326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Dmkw7r0STh8G6q5IXY2gdeV17IccBj8GRGLWTKSuMt1kk09mNSgl5y6LplQ+GRzCxgwDWMCI8nWgqOkq9JfHQ8QoXuCE7vn09pffEnTpH8=
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

Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v8:
  + Sysfs to return single value in hex format              [Greg]
  + Fix KernelVersion info                                  [Greg]
  + Change errors_* to error_*                              [Quan]
  + Added overflow_[core|mem|pcie|other]_[ce|ue]            [Quan]

Changes in v7:
  + First introduce in v7                                   [Greg]

 .../sysfs-bus-platform-devices-ampere-smpro   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
new file mode 100644
index 000000000000..41edab6c3e28
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -0,0 +1,157 @@
+What:		/sys/bus/platform/devices/smpro-errmon.*/error_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record, see [1],
+		printed in hex format as below:
+
+		AABBCCCCDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD\
+		DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
+		Where:
+		  AA       : Error Type
+		  BB       : Subtype
+		  CCCC     : Instance
+		  DDD...DDD: 44-byte value similar to the Arm RAS standard error record
+
+		See [1] below for the format details.
+
+		The detail of each sysfs entries is as below:
+		+-------------+---------------------------------------------------------+
+		|   Error     |                   Sysfs entry                           |
+		+-------------+---------------------------------------------------------+
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce |
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue |
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce  |
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue  |
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce |
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue |
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce|
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue|
+		+-------------+---------------------------------------------------------+
+		UE: Uncorrect-able Error
+		CE: Correct-able Error
+
+		[1] Section 3.3 Ampere (Vendor-Specific) Error Record Formats,
+		    Altra Family RAS Supplement.
+
+
+What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Return the overflow status of each type HW error reported:
+		  0      : No overflow
+		  1      : There is an overflow and the oldest HW errors are dropped
+
+		The detail of each sysfs entries is as below:
+		+-------------+-----------------------------------------------------------+
+		|   Overflow  |                   Sysfs entry                             |
+		+-------------+-----------------------------------------------------------+
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ce |
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ue |
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ce  |
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ue  |
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ce |
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ue |
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ce|
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ue|
+		+-------------+-----------------------------------------------------------+
+		UE: Uncorrect-able Error
+		CE: Correct-able Error
+
+What:           /sys/bus/platform/devices/smpro-errmon.*/error_[smpro|pmpro]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the internal firmware error record printed as hex format
+		as below:
+
+		ABBCDDEEEEFFFFFFFF
+		Where:
+		  A       : Firmware Error Type
+		              1: Warning
+		              2: Error
+			      4: Error with data
+		  BB      : Firmware Image Code (8-bit value)
+		  C       : Direction:
+		              0: Enter
+		              1: Exit
+		  DD      : Location, firmware module location code (8-bit value)
+		  EEEE    : Error Code, firmware Error Code (16-bit value)
+		  FFFFFFFF: Extensive data (32-bit value)
+
+		Example:
+		  root@mtjade:~# cat /sys/bus/platform/devices/smpro-errmon.1.auto/error_smpro
+		  109008000a00000000
+
+		The detail of each sysfs entries is as below:
+		+-------------+-------------------------------------------------------+
+		|   Error     |                   Sysfs entry                         |
+		+-------------+-------------------------------------------------------+
+		| SMpro error | /sys/bus/platform/devices/smpro-errmon.*/error_smpro  |
+		| PMpro error | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro  |
+		+-------------+-------------------------------------------------------+
+		See more details in section 5.10 RAS Internal Error Register Definitions,
+		Altra Family Soc BMC Interface Specification.
+
+
+What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
+		in hex format as below:
+
+		AABBBB
+		Where:
+		  AA  : The event channel
+		          00: VRD Warning Fault
+		          01: VRD Hot
+			  02: DIMM host
+		  BBBB: The event detail information data
+
+		See more details in section 5.7 GPI Status Registers,
+		Altra Family Soc BMC Interface Specification.
+
+
+What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the boot stages information in hex as format below:
+
+		AABBCCCCCCCC
+		Where:
+		  AA      : The boot stages
+		              00: SMpro firmware booting
+		              01: PMpro firmware booting
+		              02: ATF BL1 firmware booting
+		              03: DDR initialization
+		              04: DDR training report status
+		              05: ATF BL2 firmware booting
+		              06: ATF BL31 firmware booting
+		              07: ATF BL32 firmware booting
+		              08: UEFI firmware booting
+		              09: OS booting
+		  BB      : Boot status
+		              00: Not started
+		              01: Started
+		              02: Completed without error
+		              03: Failed.
+		  CCCCCCCC: Boot status information defined for each boot stages
+
+		See more details in section 5.11 Boot Stage Register Definitions,
+		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
+		Interface Specification.
+
+
+What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RW) Contains the desired SoC power limit in Watt.
+		Writes to this sysfs set the desired SoC power limit (W).
+		Reads from this register return the current SoC power limit (W).
+		The value ranges:
+		  Minimum: 120 W
+		  Maximum: Socket TDP power
-- 
2.35.1

