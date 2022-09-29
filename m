Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE15F5EF2B9
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdTDJ3Njpz3c6H
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GY1yA5Tl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.108; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GY1yA5Tl;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2108.outbound.protection.outlook.com [40.107.220.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3k0GzWz3bms
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn9FzMFZ1+LeD7wHSYmKNtneq+z4t3m9Yx0Bpu1RcytALIYuWv8tah1tlc3pCecPIP0Fm6VDvN4Wg+djxGarYsaCqe2Hb2c0YOYLhilPY580yVp3sz/y6LyqLoRrmYM5Yq+w9EZWzV+0ekxEsxJD45Z4fyYp0elyXmOe3UxwsB6cgw8JnbfTJyhUDNHcNuJCn45GBOWW1Nm8BzCv4486d1M7/UffyeJ0XGo7JAw6QcQ91SOJ9f1CS/LrufVjqbvq8ymhHQio0JTIPDrf9BjHilLzfnGUePxc16/EnbFTfs5+O+8tLNLZwK49mbXXuCeDHOW7gR4xaqMwsk/It9BmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYHtBRlBTl2f/CuzjE06GSUC8C9hxa+md5Hl4+EAqIQ=;
 b=J2Op/l1DrH8xgGt+efwi1Y94KQZe9ilG3eowPk97zsOrHSAruBbGqmUpTPgDwYQdeQmCaNlXoK7veNDS+JXwgMuj7qQQskfu0itigRwv+H0SnBfMrb13epCvRGI97Pu57HLcwYNPXiY0nfYdkQQbxeFdUW4R3QbnnSVvK2MNm/7kGg17hErG8KIALfdnraZuXcjEoWuxAuXYiPiFYfBU8yonABQr9IvaIHR5iZoMZEEROKOkTg42ZehXVM1kVSwYt/RCPf/Xo/keWPZLNmG5Kh2p9NxRPFynR8KWdDVTSqZliI5ztMfKG0KSu4ZzM3DH3VJ41cZnUoAdOWzO11D1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYHtBRlBTl2f/CuzjE06GSUC8C9hxa+md5Hl4+EAqIQ=;
 b=GY1yA5TlzIr4LenQUdi1OlgeBSjlspjNau+fBojUP9ROgKbhsQvDrwsxC4JKMftLayGdiuXdEH5Ega14pUb7CPO/p6mHuyoCGFKGGGYseEe53NjZYz86h7Kn3+9rMQ921mR3i6eUDi8ki9QFjUHyvfIqkyN5vQccDG7FlDA6BR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN2PR01MB5503.prod.exchangelabs.com (2603:10b6:208:11b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:36 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:36 +0000
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
Subject: [PATCH v9 9/9] docs: ABI: testing: Document the Ampere Altra Family's SMpro sysfs interfaces
Date: Thu, 29 Sep 2022 16:43:21 +0700
Message-Id: <20220929094321.770125-10-quan@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MN2PR01MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 00dbd368-f74d-4981-6b0e-08daa1ff3832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	82dGJQxWOwj8M2/OiWI6WhkQCJSkpmmFHFrUrLlyzwoPFPy2lSZYcPWuSVMs/I4kDkETx8xvhIIg6RzLSxUo5vtnReY37E0nQbAgjWhPxZ9XIWQKvqVWRXpHQgh5a652E84NWRv6E47yAbjfAZph+DnU9tbl8VhXXPQ+lrxW/2Rt9caolbhUI3WsY3FfM2KCMjd5e3v8qFVJAysvCMbLke8qV6y74Hm0x1cGD4QQZkhBUetojvU1DY3akC868MQkGgdIRJyVS22ZZP2L3OuMQ0Pu6Nf4ms0Q/PprlRbqR0hmJkb8GqhXR/TST++KM4KCixYRsvC8ao7RjITIpebAKJd+6jw8jjW6CizYhugbfVKqIm6V0stxDArYFt6jzbdMrIBy36U8NJkCfteKAm6Vo9OY9ZJhMz4cM5cEFkW7uzWr9D5UZeOcDLlwmi10x9L8eNsJcUdQM5oemRgeomoaPA8SZy8tqwX50WlgzVJF1OrtSGAD63wu0wO1ghWTKmwYU7ipjifjlGAdpBlumD4TxOxqBN0t6TaEH9WUruRp/OmAtcSKAV9UOe6gHVxut741ddCPbong9GbGayl6GL1TKfjT4u1e2qbNvotbjNYUhsVimGyjVTJFxmoZoEGW2zr2P3+Yfjmi4oPuT8SBN/0FlRVk0gjmikv6HNupfSScCi0eHGH1Ym6ROXKEps5aSRtKXIIJ3K1DEQKySGf6stry98lLa6ZaYAxa768RLdQEmn8bryyk3Ez5ae6eHJysfWKSrF5505L3cDa83Ioxom2WYnp/Nv0KcHXxvju87QzN4Lc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199015)(6486002)(478600001)(186003)(1076003)(110136005)(5660300002)(6506007)(7416002)(2906002)(2616005)(921005)(6666004)(107886003)(66946007)(66476007)(8676002)(66556008)(4326008)(316002)(26005)(6512007)(52116002)(8936002)(41300700001)(83380400001)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SdoqTurq34UZnNLATBE2VblyhZwHkQ7FIUB9fOTIXBNc8pZiYC+ls+yTxOIp?=
 =?us-ascii?Q?tufmkq/+PmyO3gcG2JaMhWapYr68LlDJxz7UIcXgcSVhpUqOpPyGZL/8ObkW?=
 =?us-ascii?Q?TNVEXIyYFyHtav8VBNqObWWUSrXKamDWM4Fl1+TcWAL4sKQacezGibIxa3Tn?=
 =?us-ascii?Q?pLfb0DkyBfXRGHU6TuhxUNN/V8r3pR092+65tbvD5oJ2CJ7JwlqldTpsT7jH?=
 =?us-ascii?Q?kwROp8n+m7D172R2+vzzO/xPtX4PF+Dul8aPdgQe67vcf7TEe+mXHO2tsLLr?=
 =?us-ascii?Q?aOIubY4jjkp7551bygkyfVzX4Cvq5hZExsMB88WwSidCd+X9+pU59Rd39KJB?=
 =?us-ascii?Q?LfIDg/CwM2g+dd3cyCl4H5HA+4lN9I/Z7xz71xJvhJr24Ecn60lAYJodurn7?=
 =?us-ascii?Q?ZD3IWCuzvWVELpX29ST4E471X2zNVG9g7Yvy4EO2Y3gCM6Xv3uVqER2G59jc?=
 =?us-ascii?Q?r1nbMS18PjeT+RpnTFSNel+lEXIQxKp0EAP0NARxHjsJBfiET2XSpK26o8PN?=
 =?us-ascii?Q?BNcbX2d2AZyiz1cRY8O37nvOzHVn0V74k/Q6QKdtHdf65c0Q2gNIggGaaMkx?=
 =?us-ascii?Q?Gx01QRd4DXXinEk3svdYgbelTsPFGfh8Z05f2krOqllZrCCHn//RN1zWvji7?=
 =?us-ascii?Q?PJgwT9phYbGdztAwzqnp24df53pymJElhBS7/h3/7SyQldTnVlLv4YDonusU?=
 =?us-ascii?Q?jiTUZw5P4uoS9QfoyqixEn3UONcpGM+YFMwJjnmMbuJZ8k6CM1E2wzlBWwgO?=
 =?us-ascii?Q?gobybNxO6KfkSuZaTo443RXwSiCA2SQx9SzED3WRuGZbcpzsNmjYTqTgiSAz?=
 =?us-ascii?Q?oxvk60OKOz3kAVPC8+17sRRIbYwSovbDHQ1j5yfEQAxXPbgtMHK04JVxBTnO?=
 =?us-ascii?Q?9hiAnhUGFcO+lDJdixJuqF7YesANgeMxRNbcxOIA35ZX6l/jmmSL1LLVHkor?=
 =?us-ascii?Q?hBHspQfylF0kX/FO1xfVz4OxNHRdfyFmHQFm2vwW7vb+CvDRa7BUGpDX++6u?=
 =?us-ascii?Q?b4bCsOVjkc8yS8K0U6hrIzvQqLB/dCdtyLA4AJ2CF4tz1Juv94YcsCJDm/yV?=
 =?us-ascii?Q?8z4T8Sbrom6oVkJ1WjokJ7cBroWKny7cSkIgEj6k5MAx0ZaI4egezU6K6tu0?=
 =?us-ascii?Q?XQSnJ+6l8pNQpBYuNBuLDTOTecISBWx4iL48g4G3wWEPiK6MImXBNm84UhBa?=
 =?us-ascii?Q?JVaKsftEwxtxvsIhI0wFshRcJNVLxiJApS9CKdVAHCHa97x4zB+6M4Yb2rkM?=
 =?us-ascii?Q?BYkvkkFDfhUgUYls2WXTq2jBed3ifI55cf2YtcEzNGVGEIbNSX1ggqmgT1+T?=
 =?us-ascii?Q?boLq0hIKOS58N43Eon0JdfmzAT/hK9ZGnciOSQJMVUt/JTpE2Crjd9SUink/?=
 =?us-ascii?Q?oVdT4zdWKYeU2oBsVqSXpZMfYwrk1N35Y6NzwpvTrDV9dSJ8ed0N5hY2KC6A?=
 =?us-ascii?Q?eKKN03A8ZXrhKgs3l7uTXpOz4CpUNPlE4iWVxSZAFyibXp5H0OCMXaIwlYGh?=
 =?us-ascii?Q?LTwGqv1U4pAVetnwBrqOFWGaF+lSfLpA+lOnFgMAdt+ygqSoL7KuQJnSd+ST?=
 =?us-ascii?Q?8ZnWsf6YQgCTrQI9K4uhP/XNgdKTjlgX8Uzl9hVCXh6r50eG7rlqfBHFpWEZ?=
 =?us-ascii?Q?alcupiw1GdDVHztd4Kc9vYk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00dbd368-f74d-4981-6b0e-08daa1ff3832
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:36.1968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+oQ4dKkbwbZE/UJ5f9JSq3rxqYUEugN7b1+zSXLPru+lLDmUm53+/KZf9MbsZebmt9XaQ+xzTfHM5Bri+c+KpJBQYpVp32L1PfeGi4nmfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5503
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

Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v9:
  + Remove unnecessary channel info for VRD and DIMM event  [Quan]
  + Update to align with sysfs changes                      [Quan]

Changes in v8:
  + Sysfs to return single value in hex format              [Greg]
  + Fix KernelVersion info                                  [Greg]
  + Change errors_* to error_*                              [Quan]
  + Added overflow_[core|mem|pcie|other]_[ce|ue]            [Quan]

Changes in v7:
  + First introduce in v7                                   [Greg]

 .../sysfs-bus-platform-devices-ampere-smpro   | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
new file mode 100644
index 000000000000..d8f82a06570d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -0,0 +1,125 @@
+What:		/sys/bus/platform/devices/smpro-errmon.*/error_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record printed
+		in hex format.
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
+		See section 3.3 Ampere (Vendor-Specific) Error Record Formats,
+		Altra Family RAS Supplement.
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
+What:           /sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[smpro|pmpro]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the internal firmware error/warning printed as hex format.
+
+		The detail of each sysfs entries is as below:
+		+---------------+------------------------------------------------------+
+		|   Error       |                   Sysfs entry                        |
+		+---------------+------------------------------------------------------+
+		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro |
+		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro  |
+		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro |
+		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro  |
+		+---------------+------------------------------------------------------+
+		See more details in section 5.10 RAS Internal Error Register Definitions,
+		Altra Family Soc BMC Interface Specification.
+
+What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
+KernelVersion:	5.18
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
+		in hex format as below:
+
+		AAAA
+		Where:
+		  AAAA: The event detail information data
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

