Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 513283C6A34
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP96q1ddPz3bg4
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 16:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rhCC5qPA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.124;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=rhCC5qPA; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2124.outbound.protection.outlook.com [40.107.102.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP94L6J6Jz304T;
 Tue, 13 Jul 2021 16:01:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCOpk1rUqx4zeelDYOK0mlxfFQWv5pqnprKysrkpHtp48G49Khp4vp7vuLGlFMaXim71KpUOVO6cYWJ9mIfgkY8l+YVnEVFbkEht+57b+lm0LzYhJQG7eZTJdzYaQvDmAN/xtA7EQemUJw57kKmHUK2043hQkgj2ZVDmruASowcqegcf1VWIK3Aor50bjX2MOL+sgfkeJ/npRh/MMBmnDVV3Zvr9gEriz/dLhb0eFi/Uwwpr3d2YrOXzGlS5k2x5VeW2XBxoLYLna6eFlXYBf5qVTTZVXSFf32Go/QOuUq7y3NA0OJJlv1Id8my6A/im4McCbIycbzYGrykKvxq5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBQREZWovQNCc9Is2Jae8kyMwstggOes3QZqJ2XU5vw=;
 b=GQPhQN/V8Co/FjwekxEJne2gK+DAfp4UJZTsCi1J6TntANt/Ul93PWynwCAV57wOu78tYe14k0YDdybS6PU4gq52qUG8Jn09u7mwfiiD9l0smGO8T+yy6qFBk3boQ0Ta8C0xvCUxyWsex54njV873gC/e5EMim58tXa3/m2cwkrvWJplAlW4TyMOhjjTwZTk4n11MMp/Le2nrVkDmVU9mdlzP3RLZezKGnczVaUkKS1Dnsj+Taj5kYc7hgQzR7o3+flWoHkcnS8GjM+eP19Pc+58Jzipjslj0FKuExqKNseIXl13ESskwUDN/bL3cIgsKvokxH9FOY9toxwUDhy8OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBQREZWovQNCc9Is2Jae8kyMwstggOes3QZqJ2XU5vw=;
 b=rhCC5qPAdBCtewB7nPQokl+QPW32vqRBkiyFIbs7kFj1deDRxpeCF7x2LdXAdfD3HC63pAmpJBiGq8a+MaHoBu7pN0s7cfuxw/PoOAukZM7p8QgeBLTC7TqYVL5A4AH977NDkMSzpRvETjndiS4bDkIV3EMHslChI3h+PizT9Eo=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2592.prod.exchangelabs.com (2603:10b6:300:3e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 06:01:12 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:01:12 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Date: Tue, 13 Jul 2021 13:00:31 +0700
Message-Id: <20210713060031.31568-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713060031.31568-1-quan@os.amperecomputing.com>
References: <20210713060031.31568-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:01:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43451686-dcf4-454a-e413-08d945c39e06
X-MS-TrafficTypeDiagnostic: MWHPR01MB2592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB25925A47CF176E7E3EAF89D6F2149@MWHPR01MB2592.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngABFzCSVXpF1C48gkIo+YpMZw1nT9BIGjhe6C6gOaBzswQCKhc3p5k/UY029T5COU1z0w6wkOaJFNTrJT8F38VEq4Nu6ZufD9yOmEJK9GDhPGQqJ6VEEToAKiiUAaBQi8hI6TPwBhDrXngXANs/lKqE2pnSnsqPgIVWx068hAZBwSNhpFtzxyFxk5Mtry/4ktqxSN807UmFtZu0ICqWqPW4vaElglRQRAO9TfDE8ber0Gejm/m17aAMyk+KXbCICf7W+Ph3v7fBh6pXpz2F8bONJHsJtJseRk8K4GGj/O1ANQ8HwbyLZftyDwtQ00bgsGwMq87vFALozUWsa8pN3I7GlffNwBHGiYxNO8xWkxCR0xl1VRpDTtNQAp84z18dTv3tE1kY3CiWUed32tT9ENGEofSbUgqmpIUCtqYZ2TmjBR8LfcLkE6jHEyLkCWth4MfrzI5p265mcAQsXrQgyGQoyl0+RAiikCY/7fNA9NR/er78kwEoWfA0wMzrWo9JsbIIbYo71g/c3GX4pjnvfvYdiJjPnYmH/UpbScG4POxcthpr54QV8aULga4zZOjiSEeGEAQTOCG0nmpFIhR2aiddHWwiG/sbeJDb5PAmzfs047vu+UjyleYTeuB6kKK21sS5voLYCHiPi/NUXGx6QQGqKw5qyMxie5qOoxV3OV7sJve2DlM25NxeZNzt4q8rbFYKtfH3Z0boSa6P/BNpfZiUu5EAmU+L+7p1EfsDKJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(136003)(396003)(366004)(2616005)(86362001)(110136005)(956004)(316002)(5660300002)(107886003)(66946007)(54906003)(66556008)(66476007)(4326008)(478600001)(38100700002)(38350700002)(6666004)(921005)(6512007)(52116002)(6506007)(83380400001)(26005)(2906002)(8676002)(7416002)(8936002)(186003)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5hpEjD6H4Lg6vH7khlo83nWCYadxF+9CLbC9GTWTQqqhaTvzc4Zd6h26qNQX?=
 =?us-ascii?Q?sAWbDrKZitwmovNYuC94zGQLQR/Ca//v8SM0iuw8nR+6zpheiB+Mc6xo1Xgk?=
 =?us-ascii?Q?fdBx9FJjrIKUSGQFcL3ppBli2hS0ebQHsf2rUFdYcsZ4RI4PUR7nljwaK5NK?=
 =?us-ascii?Q?aER6sJFnlfiNoRzWx+HgnB9iammq+4se2970+8LOnO+aCI7/pSrLgrOBQ6iG?=
 =?us-ascii?Q?nzL9ape4lfE2NrfelnuNXZeorz56XMYXtGNdeLoGzwcGaM1YrS+eh5TEQyqw?=
 =?us-ascii?Q?OzWDpzgnk2wvuvgYG7ew+7ikqGUkTxlq+X40oaXldRXcu5BmzPYDOIMJ2ouy?=
 =?us-ascii?Q?CnLwrUhiTUt4Rc1HtSrisBsk1gZD9hAZbXO6IDgiZrnua9Ru7sqEmGc8NjIU?=
 =?us-ascii?Q?YF+GymvffaPw+YxeT/85RANiZ/zdjiAROYp40Tl7PJVh7dRw0k1ARLWwrTiF?=
 =?us-ascii?Q?d+EfochLF2ayX11zRbehPGsjJ68dtgUukJ8ZmwCTWdD+47rDgnNN2yBlsWzS?=
 =?us-ascii?Q?IttGUjdVlhXNG+22P6HaRiTJgkQ0cdjcCvAmeD2XgFda5XHe6XhWLpA9Azg+?=
 =?us-ascii?Q?W+eS7eE4gWfSGMiHYXLr3kS5OQaWpEZ7jflfovmUMm4j9WznIJX7Wm8p8I3K?=
 =?us-ascii?Q?bnUJPS3mpGL+MEBjj7CHmBIgC2vRsfhHxSzgden7Ciupe3jZoZm3WChvG1YI?=
 =?us-ascii?Q?sVZEthpuLLI5X8XxGow8AjGHj6ql2/dDvpthGZnWnmmbBLC0ed3JwRa5jlVv?=
 =?us-ascii?Q?ZtdjRZGnj3Ndl9HOKvWO9yynXnxY/alw4jUVL0IQCGGWupmf6V0uslYOlSfj?=
 =?us-ascii?Q?2lsicBCkOZ0BLckyoMurO6yrU9doI3ckP4vGfTJIW1N5D3s4UGmxpx/kfjOA?=
 =?us-ascii?Q?zpS9NUIGimLrjFNYzqBnrayon3+vUhobw2UMCqKvNT66BM/McBty1zOWY2WW?=
 =?us-ascii?Q?+m3U8OW/EMQTow3FNZRrF3Y4VkoLv0x5wauygb6gqiW9oWMmHWJaVg110TbG?=
 =?us-ascii?Q?J6IfJ+W+0Xj8mCXAEv82Ndwf/cXoXS4jLR434MhrnHSYy5LsGdjA8xTpb+BN?=
 =?us-ascii?Q?gg0ClCcZMNNi+dXekUCHdNBPQE0rIFG7nlsmue162mEtRYMcTa/dwfTZPomU?=
 =?us-ascii?Q?yttapewBT0QpL5ioat4JI3roq766PTCdTUZ6ZbyyPgfAEHy3eCG+id1S0BVN?=
 =?us-ascii?Q?o9yGiNEwMoNUX9NukaO/ygpO5vUaZyeoz5oM5W6GbPwd3buUubiG1y5m20Ut?=
 =?us-ascii?Q?A58ZirKfWtG5GNyEZztlFr0Cjy9anfwXoYCUkl6TLF1KP4apA854BE03bb3H?=
 =?us-ascii?Q?PRr4fVIX+v4rSb1VEYvt7V9C?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43451686-dcf4-454a-e413-08d945c39e06
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:01:12.5324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZg56d0yq6LySWPCm0/58v+Bc20f6ZrxKactSTLZ3KtG9mBBFg8ztbDupGW5iGOj+rFhDeDYaG85KdJFir0V2wQeD7YfQA+r0CgTJt0BzVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2592
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

Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v5:
  + None

Changes in v4:
  + None

Changes in v3:
  + None

Changes in v2:
  + Removed "virtual" sensors [Guenter]
  + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
  + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
  + Clarified "highest" meaning in documentation [Guenter]
  + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
  + Removed Socket TDP sensor [Quan]
  + Included sensor type and channel in labels [Quan]

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/smpro-hwmon.rst | 101 ++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index bc01601ea81a..b6579882f51b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -172,6 +172,7 @@ Hardware Monitoring Kernel Drivers
    sis5595
    sl28cpld
    smm665
+   smpro-hwmon
    smsc47b397
    smsc47m192
    smsc47m1
diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
new file mode 100644
index 000000000000..f978b1370e16
--- /dev/null
+++ b/Documentation/hwmon/smpro-hwmon.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver Ampere(R)'s Altra(R) SMpro hwmon
+==============================================
+
+Supported chips:
+
+  * Ampere(R) Altra(R)
+
+    Prefix: 'smpro'
+
+    Reference: Altra SoC BMC Interface Specification
+
+Author: Thu Nguyen <thu@os.amperecomputing.com>
+
+Description
+-----------
+This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
+SMpro co-processor (SMpro).
+The following sensor types are supported by the driver:
+
+  * temperature
+  * voltage
+  * current
+  * power
+
+The SMpro interface provides the registers to query the various sensors and
+their values which are then exported to userspace by this driver.
+
+Usage Notes
+-----------
+
+SMpro hwmon driver creates at least two sysfs files for each sensor.
+
+* File ``<sensor_type><idx>_label`` reports the sensor label.
+* File ``<sensor_type><idx>_input`` returns the sensor value.
+
+The sysfs files are allocated in the SMpro root fs folder.
+There is one root folder for each SMpro instance.
+
+When the SoC is turned off, the driver will fail to read registers
+and return -ENXIO.
+
+Sysfs entries
+-------------
+
+The following sysfs files are supported:
+
+* Ampere(R) Altra(R):
+
+============    =============   ======  ===============================================
+Name            Unit            Perm    Description
+temp1_input     milli Celsius   RO      SoC temperature
+temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
+temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
+temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
+temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
+temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
+temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
+temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
+temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
+temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
+temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
+temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
+temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
+temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
+temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
+in0_input       milli Volts     RO      Core voltage
+in1_input       milli Volts     RO      SoC voltage
+in2_input       milli Volts     RO      DIMM VRD1 voltage
+in3_input       milli Volts     RO      DIMM VRD2 voltage
+in4_input       milli Volts     RO      RCA VRD voltage
+cur1_input      milli Amperes   RO      Core VRD current
+cur2_input      milli Amperes   RO      SoC VRD current
+cur3_input      milli Amperes   RO      DIMM VRD1 current
+cur4_input      milli Amperes   RO      DIMM VRD2 current
+cur5_input      milli Amperes   RO      RCA VRD current
+power1_input    micro Watts     RO      Core VRD power
+power2_input    micro Watts     RO      SoC VRD power
+power3_input    micro Watts     RO      DIMM VRD1 power
+power4_input    micro Watts     RO      DIMM VRD2 power
+power5_input    micro Watts     RO      RCA VRD power
+============    =============   ======  ===============================================
+
+Example::
+
+    # cat in0_input
+    830
+    # cat temp1_input
+    37000
+    # cat curr1_input
+    9000
+    # cat power5_input
+    19500000
-- 
2.28.0

