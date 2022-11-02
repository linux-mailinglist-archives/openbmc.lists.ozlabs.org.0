Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD1615C36
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 07:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2Gyk5jTrz3cMm
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 17:22:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SWZzW6Ux;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.128; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SWZzW6Ux;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2128.outbound.protection.outlook.com [40.107.243.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2Gy63NM7z307C
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 17:22:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY9E0RXr+V+JxRHns5xHoBhZwVfkNbmkYQpvK7f0ys/4XAbndWslc4A6c4p3BtOMlx/31x/gintkhyxEfM1/Bx+3MGjdKR1l5aVke5aRwoWm0CKTEJy78N+N4wzy5bj4fK9XpRZpQU07XlTfc6Rv2p4Osi8VqRbi55akykCSjSAutKTdz3J4Wj4DSE3BNOaWKlJvOyhpFZDDimVwv4y0HDt/QmEGXbyab8zPtY84SRzDvBaUqOHle6o/nsRAbaR+r3x8AVS++otiN5uLn4duY37YQvJnYKwSzvMUGQ6sD8YOiJbFW4XUGOdgoOSZ9tYi/aGxoH2rsMLynEzfbMSXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ry8pFc20PzL+G+6Aq+qUOSE42ml9EzM3SxC9OYDN8s=;
 b=UQWV6cddWa5de41kH8KLzDOLLguikdQu78zfaw+mTVORL8aeQuATUMcsI+kuPG0ViR05brTpqRaWmAAwP+jdoA4rBsVmU8SuW2245sExguZaXQ0k1OcPrUCUnik4x8NHg509AAZMFxYtqRLrpUOZ8hvAptMQ7aZNQytPD/zXSYiT68Ak9nihsjboAZgBWJ60z84AaR2GhtyV7sTK72VJ8t2hIszVd4UwCaNTBYmr4GmoiT2s/uScDp9EGwROjr04dPGr121iaynWzCRmRcBdiCYpPev/gz2Z0iRh+Hd3NpPf0daBRWOoPEizpl5VB10Q8GjtmJjl9czBh5s/MaKIBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ry8pFc20PzL+G+6Aq+qUOSE42ml9EzM3SxC9OYDN8s=;
 b=SWZzW6UxgDrc9ZCqbBTNQQHl/1KBnAKxq+jaADqdb1nS9n81g6SXG1lAsQzEFVYUGuFhx/KkJMnWsIgaGMsAyvO4iKkyAj0M6Se5xJ7CP+tC6kZfYIIyW3CfrDVrTbpGaLI94MTkgPw4qhKBGovkl0cNhxzDBKaBh42dj+LmJ7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB3835.prod.exchangelabs.com (2603:10b6:5:87::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.16; Wed, 2 Nov 2022 06:21:45 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90])
 by SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90%7]) with
 mapi id 15.20.5769.021; Wed, 2 Nov 2022 06:21:45 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] docs: hwmon: (smpro-hwmon) Improve grammar and formatting
Date: Wed,  2 Nov 2022 13:21:03 +0700
Message-Id: <20221102062103.3135417-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB3835:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa1f40b-e7bd-463c-e544-08dabc9a83e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ejrmvWHtbdT2QyKsJQJ3tVM27rOP/121tCQwEyRq07l46qgEgAO8Y3ZI5+H9Lwz/u3dsvg8blk9wDcXCF20Nv4qZUqKlGwK9TOC+YTUOpW1HArbR7Blwr9MUjngwm84yR2KIlkEyBiGzfLvoyLsXYNzX+Y9B26bYeExrMs/7T7lSSz6/xeCSdhd8twEycfyG1TFVhgL9UJ1uUwsM/xqUeCaz05D4cDctX7jSrZO67ZBlALgKUEXwi23+aXjlGlGHkxPV53Itf4461pKY+UUOdVTVrUrQEvOBiJncvSVnmaRwwAKjHHx5f03DqBco6T0XNKi8Fm6I/tVGCPOuWOXO1a/8WTeYEF2Tb1SD2sgsvhpb/Yj/66OpfpBYa4nfuKfrDqP2XNUtzHI7GCTQZGu3IChSeqZjsxuHvXNWvEPqhHYDT1Ae+VMYfQYNSYXtlVv9IiDSsV6lOMSpHMtffVs5FA1Ptu36f8vakWUW/tQtlEr6l99/hLDCR3FuLFYV8DzGB7PbCBhMbKi1isIoIl62kMJCiGnt8g3rm6KaljdMm/ouCtHC0i4NVcbxRCkPowu5lqJI5dtLfNpno9Lo9QvQKgePT3nJ2rcKrrhOJozXMKqJ8O++cUVoopt36HhLvV4Drq/Ik971q9XopaKyLgIEGdwwf2IMSIRHRnQJflDB4Fdnox+qlfcY3LG/IEjVa9Go9YrD3IQW+uIp3DAhVFeJyhIj/7eWOD0qVct1ivB4x8RVRdkYmrbryOzdv51HrXdqPFyq5ynL+ZXwXiSp5Fed1jFdfCJcbqompF+XyQs/NPs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(451199015)(6486002)(6506007)(478600001)(966005)(38350700002)(110136005)(38100700002)(54906003)(186003)(316002)(107886003)(8936002)(86362001)(6666004)(2906002)(2616005)(1076003)(83380400001)(66476007)(66556008)(52116002)(5660300002)(4326008)(66946007)(8676002)(26005)(6512007)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xp5euZGUHsLN/pX/io6PTgtnIi5SOuQjGT44nMM4yQs8t00pL3L3TFWaBpa3?=
 =?us-ascii?Q?7M7CcAfMSe5mNVWIPnsL8hNprCfvS6eilGc5uNHtgvU3Ua6iR7eN+eM9WVJA?=
 =?us-ascii?Q?SHGB6ng06fDikjDxsitQ12jmZVcXieOXXNSBcqFOAQXNu4ZZxddw9mNrW8u+?=
 =?us-ascii?Q?2SqlS5I8/XyQM+jLvJudmn6FE8ZNmZleb+2iDJKXptp1dd6zELoEZU0hrqMV?=
 =?us-ascii?Q?g/vCflixGGlTc8ulXso3T0goKezirNNSeUNabLVWkaXc00Bnfzu85qaGIlmm?=
 =?us-ascii?Q?iEMcBMxC0vm/aq0+KnPOxMG5Xhu41zTKCJnI0oAjtTauR0D6dwxCGpgp7KUD?=
 =?us-ascii?Q?d70b7JmJSOvYkNScNBZJlHHFEi0nQXvrbglhPVQ5SXBPPPsXPhpN8qN4xlVo?=
 =?us-ascii?Q?X9jBBKxGnL10s4N0pDMWk0CWsRio4K6/dOhTO7oIU8okzQoaKfcWI9DDfKiG?=
 =?us-ascii?Q?Oc7mAQk9kZC23mInRYBINWuGobTkaHjN5AftKH8h2BM5MR/14vleIQY6IEug?=
 =?us-ascii?Q?tmx1xH890WhmO2Qzr1h+JOF0xltqwagAU+lLEvbPNqUjUbcg7sxLPcuqE2WM?=
 =?us-ascii?Q?G9DTfaZWg9SoO5eqHwMDP1xapYtRFVJCttpjW7AuDGQOFFYjpc4+B5lUrAku?=
 =?us-ascii?Q?ILY45qisIiN/GFtN1LvyQ+wdA9g+J12e0m8f7h2QA4bfAqPjvAcY416h9wxj?=
 =?us-ascii?Q?P78TWb5GpP+tX/5lXA0HeA+D5wOpecE8S1RVKZ0zYM0GMJ7unnGVcw6DAVoh?=
 =?us-ascii?Q?8gOrEXimuLvsIXFNwdWDlUp4AjGaEchWzGhwjneQUy4Zk+z5VgvRlJuwgbrl?=
 =?us-ascii?Q?8zxZTFkZCw0m8Gaapi+umtT7pREY7Yc4OiWtOrBlOmFpydrW1s/xBibYtKwX?=
 =?us-ascii?Q?FGN62J3FVX0Od2RgkDA6fxe1r3zLiBGZR7Uw17AOw5IUHD2XVYJAVWUsyruW?=
 =?us-ascii?Q?OiIfGQWH/fQ4kfeo9s3VlDq6r+Lfo2lsq1tIjtjs/3hFKmNzWCYp4874vt52?=
 =?us-ascii?Q?BitZUXaQBWtY7zIoOx5XN+XtQ14EcT4GI3ek4YUxByQzcevae0763Td9A4P6?=
 =?us-ascii?Q?nmmr8Rdk2PdRSkX/U8lsokN/qJtG0myUUaDuev4/tPJ51UoBkPw1C+yU8clJ?=
 =?us-ascii?Q?PhIlWfEQ0KFEgWcyBPxcPVR1N2/sZzCVD3FCuZ3ZMJqMWZvqyGcTPCjJHXVv?=
 =?us-ascii?Q?7kxp8N5SQktOl8HephcQ5ylQ79d3QTDwUEM00D5fN41OejU6lxcYph55kRdb?=
 =?us-ascii?Q?Q4slHUr2F9CDvd2+QBU2OUYF6cxvLtiUbyGYZziT13qgOYth4OUQOmJQAumD?=
 =?us-ascii?Q?11IERfUWIdPM1bcj8Bfqv2Rq7AybW+sFBJu07FPgjQ3HjRFFntQjXx7Q7iKP?=
 =?us-ascii?Q?ws7iDaklu0hCuwHIpwSYNjUBMpN0zBKpawIfb6gtQVCJzc1IlOc4EA8JLmJ9?=
 =?us-ascii?Q?vYFgupPEOxH3X7NWKtPFVL3M689mii5jrIuizIbz2rjHEQZt99FYydG2efGa?=
 =?us-ascii?Q?SRLyetDcML+BLDWZ2yZBqz96xC9U0eMx+ilWhf9JM4bLIoG72gjqSqtzqZm1?=
 =?us-ascii?Q?Oxis4b/5dn3IDR0cSahHRWkusD658XyKbiCBpuryPXWoFHFO3rZCvRqAIlj2?=
 =?us-ascii?Q?iMDQLFNiekyHhY5wWpk4y/Q=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa1f40b-e7bd-463c-e544-08dabc9a83e7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 06:21:45.5707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HIPs8vPYyhdp/JRhhay8eiNpEqfzrIzvYmNrVF5tumBsLuxpdObngW8/oc/C65xPsRrytgHeDEEsZ3mVooAQNwapYlmlLcuVf5L4iApPk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3835
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
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Quan Nguyen <quan@os.amperecomputing.com>, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Improve documentation grammar and formatting for the
Ampere(R)'s Altra(R) SMpro hwmon driver.

Thanks Bagas for the changes in the link below.

Link: https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/#mfea2167b99384486a1b75d9304536015116c1821
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 Documentation/hwmon/smpro-hwmon.rst | 111 ++++++++++++++--------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
index 3a9b14dacf89..fb7b3665735b 100644
--- a/Documentation/hwmon/smpro-hwmon.rst
+++ b/Documentation/hwmon/smpro-hwmon.rst
@@ -7,39 +7,39 @@ Supported chips:
 
   * Ampere(R) Altra(R)
 
-    Prefix: 'smpro'
+    Prefix: ``smpro``
 
-    Reference: Altra SoC BMC Interface Specification
+    Reference: `Altra SoC BMC Interface Specification`
 
 Author: Thu Nguyen <thu@os.amperecomputing.com>
 
 Description
 -----------
-This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
-SMpro co-processor (SMpro).
-The following sensor types are supported by the driver:
+The smpro-hwmon driver supports hardware monitoring for Ampere(R) Altra(R)
+SoCs based on the SMpro co-processor (SMpro).  The following sensor metrics
+are supported by the driver:
 
   * temperature
   * voltage
   * current
   * power
 
-The SMpro interface provides the registers to query the various sensors and
+The interface provides the registers to query the various sensors and
 their values which are then exported to userspace by this driver.
 
 Usage Notes
 -----------
 
-SMpro hwmon driver creates at least two sysfs files for each sensor.
+The driver creates at least two sysfs files for each sensor.
 
-* File ``<sensor_type><idx>_label`` reports the sensor label.
-* File ``<sensor_type><idx>_input`` returns the sensor value.
+* ``<sensor_type><idx>_label`` reports the sensor label.
+* ``<sensor_type><idx>_input`` returns the sensor value.
 
-The sysfs files are allocated in the SMpro root fs folder.
-There is one root folder for each SMpro instance.
+The sysfs files are allocated in the SMpro rootfs folder, with one root
+directory for each instance.
 
-When the SoC is turned off, the driver will fail to read registers
-and return -ENXIO.
+When the SoC is turned off, the driver will fail to read registers and
+return ``-ENXIO``.
 
 Sysfs entries
 -------------
@@ -48,48 +48,49 @@ The following sysfs files are supported:
 
 * Ampere(R) Altra(R):
 
-============    =============   ======  ===============================================
-Name            Unit            Perm    Description
-temp1_input     milli Celsius   RO      SoC temperature
-temp2_input     milli Celsius   RO      Max temperature reported among SoC VRDs
-temp2_crit      milli Celsius   RO      SoC VRD HOT Threshold temperature
-temp3_input     milli Celsius   RO      Max temperature reported among DIMM VRDs
-temp4_input     milli Celsius   RO      Max temperature reported among Core VRDs
-temp5_input     milli Celsius   RO      Temperature of DIMM0 on CH0
-temp5_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp6_input     milli Celsius   RO      Temperature of DIMM0 on CH1
-temp6_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp7_input     milli Celsius   RO      Temperature of DIMM0 on CH2
-temp7_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp8_input     milli Celsius   RO      Temperature of DIMM0 on CH3
-temp8_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp9_input     milli Celsius   RO      Temperature of DIMM0 on CH4
-temp9_crit      milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp10_input    milli Celsius   RO      Temperature of DIMM0 on CH5
-temp10_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp11_input    milli Celsius   RO      Temperature of DIMM0 on CH6
-temp11_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp12_input    milli Celsius   RO      Temperature of DIMM0 on CH7
-temp12_crit     milli Celsius   RO      MEM HOT Threshold for all DIMMs
-temp13_input    milli Celsius   RO      Max temperature reported among RCA VRDs
-in0_input       milli Volts     RO      Core voltage
-in1_input       milli Volts     RO      SoC voltage
-in2_input       milli Volts     RO      DIMM VRD1 voltage
-in3_input       milli Volts     RO      DIMM VRD2 voltage
-in4_input       milli Volts     RO      RCA VRD voltage
-cur1_input      milli Amperes   RO      Core VRD current
-cur2_input      milli Amperes   RO      SoC VRD current
-cur3_input      milli Amperes   RO      DIMM VRD1 current
-cur4_input      milli Amperes   RO      DIMM VRD2 current
-cur5_input      milli Amperes   RO      RCA VRD current
-power1_input    micro Watts     RO      Core VRD power
-power2_input    micro Watts     RO      SoC VRD power
-power3_input    micro Watts     RO      DIMM VRD1 power
-power4_input    micro Watts     RO      DIMM VRD2 power
-power5_input    micro Watts     RO      RCA VRD power
-============    =============   ======  ===============================================
-
-Example::
+  ============    =============  ======  ===============================================
+  Name            Unit           Perm    Description
+  ============    =============  ======  ===============================================
+  temp1_input     millicelsius   RO      SoC temperature
+  temp2_input     millicelsius   RO      Max temperature reported among SoC VRDs
+  temp2_crit      millicelsius   RO      SoC VRD HOT Threshold temperature
+  temp3_input     millicelsius   RO      Max temperature reported among DIMM VRDs
+  temp4_input     millicelsius   RO      Max temperature reported among Core VRDs
+  temp5_input     millicelsius   RO      Temperature of DIMM0 on CH0
+  temp5_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp6_input     millicelsius   RO      Temperature of DIMM0 on CH1
+  temp6_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp7_input     millicelsius   RO      Temperature of DIMM0 on CH2
+  temp7_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp8_input     millicelsius   RO      Temperature of DIMM0 on CH3
+  temp8_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp9_input     millicelsius   RO      Temperature of DIMM0 on CH4
+  temp9_crit      millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp10_input    millicelsius   RO      Temperature of DIMM0 on CH5
+  temp10_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp11_input    millicelsius   RO      Temperature of DIMM0 on CH6
+  temp11_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp12_input    millicelsius   RO      Temperature of DIMM0 on CH7
+  temp12_crit     millicelsius   RO      MEM HOT Threshold for all DIMMs
+  temp13_input    millicelsius   RO      Max temperature reported among RCA VRDs
+  in0_input       millivolts     RO      Core voltage
+  in1_input       millivolts     RO      SoC voltage
+  in2_input       millivolts     RO      DIMM VRD1 voltage
+  in3_input       millivolts     RO      DIMM VRD2 voltage
+  in4_input       millivolts     RO      RCA VRD voltage
+  cur1_input      milliamperes   RO      Core VRD current
+  cur2_input      milliamperes   RO      SoC VRD current
+  cur3_input      milliamperes   RO      DIMM VRD1 current
+  cur4_input      milliamperes   RO      DIMM VRD2 current
+  cur5_input      milliamperes   RO      RCA VRD current
+  power1_input    microwatts     RO      Core VRD power
+  power2_input    microwatts     RO      SoC VRD power
+  power3_input    microwatts     RO      DIMM VRD1 power
+  power4_input    microwatts     RO      DIMM VRD2 power
+  power5_input    microwatts     RO      RCA VRD power
+  ============    =============  ======  ===============================================
+
+  Example::
 
     # cat in0_input
     830
-- 
2.35.1

