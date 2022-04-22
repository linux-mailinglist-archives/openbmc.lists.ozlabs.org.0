Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A1150AE0E
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzQG6PvGz3bZt
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:49:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=fKl63A0/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::72f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=fKl63A0/; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNG6M45z2xnF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3HepG3WspnfBDVNZJfwmvpX21QzmEsBGYkRBsxA/SL9hjg/TV/BD2Vn4W4iNCTQud+MdBabGnh6vjhCRPktkNO2AXjeKEWl28cOQITBVQgs1QziQXthJz8ouceiZLE/GbOSTrjLKDSq0HVv+rJx/5srBIHLB7b2WfSS+3CL9bsjXUeRT0Mg34Pq6vNw4/AWZfRcH6kX9gXaTp709/t057QApbtXbeN5ATiXg0uG0ZypfNJBRDzdyROKtv3MVoJJXxHFndWhHNQBjozNb0PamtFRfynMQtdXHKrscKkTcLY0KxcgMM7uts9LRd0GsVQgSJzd5YXA7QkgBK/u4iGvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afvqeB6Z2lweX0m7tDAuHpSs9rm0WI0YY47l+3tPGTo=;
 b=D0q6kKzbz9r1eKmojnygZKlw9q3LHP7Yon7d8kxII7N0ru20fxZRexl+CiPUR8/iAgYrx19KcZhHprOn0Vl3qwV3LKqhFoBlCvk4V/hDV6+OdNFufElfAK8IIIodTnrMPr6aARU6qF1uSDoRqddRZu/HI795OLpMbSEWudryQrs9PI+hYFshko2waRPWXgs/+zxMQv9lGOtQZyT/rs6POBmU0NlYRoex4Dzs1M28or8IY/RjFRhMbNbQU5Vbuh0/lWLBWEeTTeMLKDcFRVGcbA+4eTdJJcxZeKs/oeDXc5YCgJof4gaM0G9L7bpYaupOtSGl3G8/a0u30cAr3U+yTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afvqeB6Z2lweX0m7tDAuHpSs9rm0WI0YY47l+3tPGTo=;
 b=fKl63A0/HaxKlyz8vDbO8vwDFgMuNzDSAjXIu+l3HqeiJA77oUzW7pra8sRJ/HjWPM54fr0AMio80IB10lfv4RLE+YguK85SshjdRuyo8FUxxoD+c4UwLhtawbrFAMxGcYG5V7j1EbXUpZe40zc76fUAZa+BC3hyHLrm0bqWtZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:26 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:23 +0000
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
Subject: [PATCH v8 2/9] docs: hwmon: (smpro-hwmon) Add documentation
Date: Fri, 22 Apr 2022 09:46:46 +0700
Message-Id: <20220422024653.2199489-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: e133c1ee-24c7-46f4-bb99-08da240a6d91
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB4653CE42AF611C13503E3070F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eyLufBxJnZtGUC9WRKexujaQb2l+GFM7L8DtUTW3L36IGfextl2jm1ghwJ8EpCzoAmlRaQTliZuP5NiKJBGQZNk/VZGo81QpXiD/g3dX40ISN7To4RsHRZRBWa+4bByf+8godpwrtYiyEjm+coqa7HiHw35prKE3+/C/+2TUSKLFeIhRfOF+pBeSlIDswBEDioC3VOIo83mEbjdWJtVO1cRJYZdhlaMkK3pc24NpBL4lxR0Fwjk6OMVt5GgHkHUeNJZA5d24qHI6JIJZ793oVFuH2jihENfQsa9ASNCRJAOmMegZRawwobufNN9dpW5apMKG1no85SZPFYBhl0uRiNMnHrYmKefIPzwawpcqpIeZBBDF8bA4WstYvKYN8MmJ7OOP4cXo0CDzsJTIHyUDaLMtV/ThH0G5tM2Nz53pqVRokxY2RaCzc+O2fH1rasH/lGJhpL9Nr5sElPI2gYe3i+VI7Ks5SCGN0THh/vRrU4ScUxSDItHbGSLnS0yshkSugkcZh5qlMIhUo231PfsQcE3m3DvcssCSaIjZ1iN2ceALsAwzTZN0sAdWIZsTfDgcwtq1DR2rtp6OcysRwuzHYr0s84y0+Uo+vIR8QlrRr/vjrBg6h/BreJq7VK0PfLwrVzqoduFfuP8qQZLHew/IvvQSFFcFCqNqTRRCUxFU1UNem0u40BsUIV7kQ0+/cxiKZV/GMbeUgPCRnk8ZIEUUvZbZ/DTQ31pz1B2SQV77bTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpYwwoPGCviKzD7RcVEG9xPhToxEUmbU2LG0WeorJO6sgANFa2T0sp9UfhhM?=
 =?us-ascii?Q?Vogmg3b1QP40ImrZw0+XAKl0Aaaj2ubHf9+OUA+GQVLTqALZX4JEjXZrODXq?=
 =?us-ascii?Q?3KiBbAJB+KZprbW9rVVWu6Imf7Uvnzw0+WRhs/bBChvbNqBiwtJYSPt7AXjb?=
 =?us-ascii?Q?nyGcEJJ5sx6IG/6c//Yd8Xw4YqH7vcsU3QzAEEDWOjTsACIJoX4xnuZU3Je+?=
 =?us-ascii?Q?KNSn0ufFhuX1RbxVAuni7GBaUTx9OPn3Fb+WrOZvLWRSY3qM0gN3bkxjYf0D?=
 =?us-ascii?Q?avR1QUmKd2eWKD/H1fOZ4ZxmJDAPfNXED/AH9W9UHwV9s4DCbpj2IavDbAom?=
 =?us-ascii?Q?/YRLNwPIgNNQRnHUBrA4/esPd4j6hSOCKaEZT/vrofnAo2A8EQp509e5VJik?=
 =?us-ascii?Q?qC2Hd64U3A2Z2TvoYZjQ2334t4q4MZ3ZimcZFpi0LgyS7WMew/gNTJG8uRpo?=
 =?us-ascii?Q?1z9ZP+QNI5j/xp1ATOfuH+wSG/KSc19kTXp6p7gquMNHfHIhFMaL08MsMAOV?=
 =?us-ascii?Q?D736QxG87MM9COY+BmilWzemnDy7xgaRB+E1iQxjYrw5rEyueIUYg5titssO?=
 =?us-ascii?Q?r94kKPXoMJBDzu/tl3HzeuelFFKg2z7OVCKZco+QuKi9G/CQXEIWChgK42p9?=
 =?us-ascii?Q?0kueFuybZNe7GcfbVBl/gY/VyX0U4wgXcUecGJzjSr+6LwBBNE+XQmjrdKhP?=
 =?us-ascii?Q?d/zaFj2cC/YzDSS5w5Y6BcXcR7iLqj7hFFyptUAbZvSQZiLS9UvDlkVJ7FEe?=
 =?us-ascii?Q?HH1X75pxlwRr8D0IIibLyuZsTeflA4NOfeqZFv5jMw9I5ORIouvYWr9vJYi4?=
 =?us-ascii?Q?FKLNH2+WyBfT8pS64fbu0Q7jLe1hE+VNJD88ZliWl5lHJvEwaMIt6y0w1iRa?=
 =?us-ascii?Q?eqCU7i4BmHed4e3DxOGpj3WvrMmHIDVHKEQJO6MscMFu/FGfkG1PQjuIuTkb?=
 =?us-ascii?Q?RBbFHBiwWDFYtfI4xXqZ6ueRybAMkD+Pa+SbDuW8G6YCC5IGb07OxZlHePt9?=
 =?us-ascii?Q?4p+xH2E7dS1i6tcG/xnP8NAFZxzg87IYQxsxTheA2kYV9inhAAU2vmV9PDiM?=
 =?us-ascii?Q?uSNJIcIk1I5n4g02pg6ZBDpNsnEfMS2eQI0/LkiCfx4NgVy3VfXqfmFMOqf6?=
 =?us-ascii?Q?QawoCHn5BFaJDN0fU74GFaG5UYTUJHQdlN5SyIFHPk2fqFwq5J3dOIkaSQBE?=
 =?us-ascii?Q?ccfg2rDkJxY1A2r9R85Ix3dIggAOocjuNLB8hkRzczcnM1ttc1AgdJFl5qd6?=
 =?us-ascii?Q?aY/IsgkTV+lECXJztJVv/pSaZKnvWzonOaTyPvHFfs5VS+zC74fyeIHqaKqE?=
 =?us-ascii?Q?3/0OGKAkoeKvvgJar0zatQ0HtBxuZr9VW5pElE0fhebn+Nb5BRhQVH7BPlf6?=
 =?us-ascii?Q?IqyZPd2gOvMv/TYeHnUIVRFn2fpXeD1fOgcNyNsgLarR8cPGUrMsMX1Ai2DE?=
 =?us-ascii?Q?0yKP3OharogL8hxccOAM0hF2XMUz7m67TT6Z8Ub1LHjCUdSuInQpAZWFTv1x?=
 =?us-ascii?Q?FqxcByX0KsZ3nk8oEj9L9btdgmlDPzVYQCKqVoZGpJDqWU83fVhCXzwiC1Iu?=
 =?us-ascii?Q?PcB/poc3jW2a5IrPQZwE59XboFQCPh7hqiNPEzCWA/R4pQQu7xH/BdiiIq+R?=
 =?us-ascii?Q?ETzFscGjPBv209Iw2msGzmsmiKSl61169m+Vgy+RQvb2atO+3iKqcaRLMZfd?=
 =?us-ascii?Q?NWoLFE+RHx43raQ7ghfOINu8QDz95NH0jtVMy7/Y4BgCkpBd0fqchPnpgpT5?=
 =?us-ascii?Q?8bHHyDHAC4zLvWPCYXT0re7oP3Vuw5TDhp91rZxWTA7uBIQPr7I/?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e133c1ee-24c7-46f4-bb99-08da240a6d91
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:23.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLKoplbs24dZ4nW02FaX7MjLcHCz/BpyLhYF9duto/ewcIqxS6Ng2dYfOPAX+kPwUZo1dg8m9noB3cZV/uaPaQu5Fzp1/aai5MY3MjKADZc=
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

Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes from v3=>v8:
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
index 863b76289159..833dd38c93a6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -184,6 +184,7 @@ Hardware Monitoring Kernel Drivers
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
2.35.1

