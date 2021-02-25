Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1B324DED
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 11:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmTNp5bVGz3cXv
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 21:22:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=m9G7dRay;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.116;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=m9G7dRay; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2116.outbound.protection.outlook.com [40.107.243.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmTLJ6d2Mz3cYt;
 Thu, 25 Feb 2021 21:19:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7ML6x8u55j0370K8o887xHft4qLwjOsE8Sg1iOYeJmUMc9bkS6ZTnq4F8pAopILEJf3BSEhc8CudJenAiBxgm/oZpxXdgldRkYo2Q2xcMHUUvXtm9d5BI9bYhLuPBveprOk4zD37uSRV0ZiINAe3uPCKSyGNFvffrtw70eIotoMh9+aa7QJ5ftTxteRJbZ7atV7RYkCW6qEHdRfhrwTlC4MsRnwrsnLWRGGe263jv62Sd8UTqgUm2NvJ8lhGTJlOv5R/yuc+WaNzBNCeermU44TGDAdrtxkq/fIaM3WjGCWBB2cJBC7BfWSvpnXzH2L2wGyTNH/3i+Bwo7rtjNm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkyHSHJRLQ6fQ93jdlCevffJIJ0yFPw8wMPrS9lW6e8=;
 b=n9g+gDmq53RgaouaTBi5YuWIkxLp/2A+OGE7zoPKpgKwNMYu8jkv7d4YtIS7FseHyKjE9DM4Qf9lC2934kap12whY1d7EPxKhACXySNbvn7rSiBz7H0SBM1iEL/H/w8PrVKpB/8Cx1d91EoOsrjDcfA2v/hRzIcjW/m/CspPA5KIuPH6T5NAUY5nu1O60jh6iIWxbya0Z4v1cfXRacZiLgTS6/4qpmXA+moU35hQtYrKPbE5gNYETap9uvhwg2bab0nb/tjgCtLXILxxMKg8LevUd9mIQiJHIShSsBvRgTW+pl2Vdj64247HmD7bodqy8GIBKLkJg77rlWtVEh+uHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkyHSHJRLQ6fQ93jdlCevffJIJ0yFPw8wMPrS9lW6e8=;
 b=m9G7dRayJ5S9emXf/biTV89dqA5ymKHWoKZv4xggH8C0jRmAel3JUqI0fCaLn4O8TrWkCyWThxzXOcCbigq86NX2CeuMn93xffsjJJbM0Z38Neo3CYzRJN/jZaY2bCixTjIJ1z9NaZZzPV8Y3cA00sP3yfpfe3kTkeyhBZ/S0Ts=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2320.prod.exchangelabs.com (2603:10b6:300:26::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Thu, 25 Feb 2021 10:19:48 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 10:19:48 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Date: Thu, 25 Feb 2021 17:18:54 +0700
Message-Id: <20210225101854.13896-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210225101854.13896-1-quan@os.amperecomputing.com>
References: <20210225101854.13896-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0061.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 10:19:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab4e49c-b88b-4df0-449b-08d8d976e0e0
X-MS-TrafficTypeDiagnostic: MWHPR01MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2320EC37841A6670C6E00E61F29E9@MWHPR01MB2320.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUCuUvIM30g3mwLe1T9vaRHx6rptcuFQndXn4vE5Czaax2cSdQwItqX0wRcUVI9rOzJaT9zk/9Thk242RXc57rlrEIQw43X+H+FaYRdLF3mlUp7fLf1z4gQZfgjlQP/34Z1deN1dw8Tz5dIDBMLso9cjra2ZQwcACJznsDPfAaVoW4JdnCgaPRZbIm/TovHCujyR7T5XAenGibf3/Ek5o6I41XFCPv2op/F9tu3CFwGBu1LoTJ4D//VhLpYGa6xCs2/84xO/LhkVEVyrFRWvH1A2wwSWsa0nFe9O23J1VK9bfygRbp9c105vz7e9+V83Z0L94ZHM8QVJWqmnkkoCM0MRI9G4dZQ3SD5I2cmuZOxtnXO3Pthfikh3/AdJx4SQyLdJnan7CxfoOIUBWY6Ynkdv0J5VRFet9FB/HmBHX45YfTkpzJ9BRG9puUrQBYa/EOt70/IzKSiMBeqGDGLUMkhu9pKDm6gTjsUmWUcpXVSNeMzRaXAS+8Z2ryJkvttvnJBIc1WAJ1baBAQnKoCaRYWvmvNy6H0rhfYSNKGi7RyRc14qngXH0yQJDIHlXewZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39830400003)(366004)(956004)(2616005)(66556008)(6512007)(6666004)(107886003)(110136005)(66946007)(66476007)(52116002)(8936002)(921005)(316002)(86362001)(26005)(2906002)(1076003)(5660300002)(6486002)(186003)(4326008)(6506007)(16526019)(8676002)(7416002)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QXdLhvg9zUOq17n2zoeMrdvwz2RfE8hy56C9eAZDFcSYR7zxuZpbLG+Nkcun?=
 =?us-ascii?Q?i3T3j7SPk83aViPG8gUTv6Wyh2bkZzdtZaSS76pbDBWfPuzdLYi9U0X1RPzx?=
 =?us-ascii?Q?IMUiLQoKlYaAJsmtEQAMwzTwF1HQC9zBiyR8INBXzB++pP32cdot8JESV0LY?=
 =?us-ascii?Q?TQ72NBsiQxhnWtTCHmbRTq1c4t9OQc6a4k9P96bgqbzo1XxYsWTgWtuerARz?=
 =?us-ascii?Q?JOlZdyeYPVEHT7T7W8LcfBJA5ZEhSBEiVC0kvH+ST1aWYTzPqBQ8Q72016cT?=
 =?us-ascii?Q?X1B143s0hp7/1FosBj/Oa3r8H7ihiPU8qBDG3pZvD4+l4xS43DyOHr6bcKo1?=
 =?us-ascii?Q?8vBJaMlZYpPcb5hpaODTVuykOM5pBCvZxt9HSlUOpIb78hdgbkBHbPIhQnGM?=
 =?us-ascii?Q?nByR7q5ieFeK8COiQVUpYYj7OigfnZH3WttLOL/HhZDtZDLPzOf3ol6cwEV0?=
 =?us-ascii?Q?r2IlMj+Zf+ND8I8Bklyv61lYYxKL+gcLFtm8zAAU73OBHQjIGAs5KpqqPC1f?=
 =?us-ascii?Q?14yXk3DSkuV7p1n45nHcDjnZ5bMgTMHDZ1zV5IlQs0760G46HdJV57Ietrqf?=
 =?us-ascii?Q?iNJLvO2A6TFaxVQCkQcTF24NssZeRKFp4f+d17pYGfpUuaMMDpalkmHR9wUy?=
 =?us-ascii?Q?//SmXd1Qa/63su/q66aOaBMstvo7YmiLxijHFKEtOr5EMfqdcS2c0p2/WVIO?=
 =?us-ascii?Q?Pju3tZUtAg9z5J/+/EdHhkq0hzpzb8Al2a6MCzaPaX8rPPk83dGZyPFBhFqu?=
 =?us-ascii?Q?UjgjWaZL9b7hp/DmPlZxkMke3kH/aQn1KDQcr1N8xl8iuZMejsxcv5Ok3rOq?=
 =?us-ascii?Q?bisoCnvUlTlM/vTv9AyZbBAvUduEgKtAGvHHFX7xO8RKd+hJ+pk9UPcDPCrV?=
 =?us-ascii?Q?RghPLyMEnp1lmot4trU2VLf4EecbUoP2LaX6HUKcIcBwcWXD1hTuG+ME/sbq?=
 =?us-ascii?Q?oE4TA5K2R4ylLTEbWmoj+dnhyQHdT0423ZjIHaeVTW1fgnfKZbxHfZ1p5M8a?=
 =?us-ascii?Q?mjQJOQ368h0yQkRh1EPogSip0PshkMXpSVzaTx1lXJcMoMZMhbiGztAYmn0f?=
 =?us-ascii?Q?ad5lSJkVzwoq7ndOECFn6MAExZWzhflOusMu6KDFGBQjLeIOvpoFG1mpcRHJ?=
 =?us-ascii?Q?ZlcqItRjSDow7re/p2Q12iRh8quTgl8c9iE/sbRNEUJD0tGvNChQ9AYv2n7i?=
 =?us-ascii?Q?EZgvh0TDWiFiomp/T10CYwlDLOeL9g67MF9ONuhbOZcOUh7Ffa4T5Q8wf0xQ?=
 =?us-ascii?Q?zWF1rFrDHjIyx52JV28Ws/9quVXWVJrL9dc43gmeqA8d1IQdRqYYe8P26whi?=
 =?us-ascii?Q?AUPVO2+3G9tDQLIy+zx82Z5M?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab4e49c-b88b-4df0-449b-08d8d976e0e0
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:19:48.0054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi+jbV/dfW7UmwL4kLOazqWWtBh+R2g/WK7bBxqbeBWIJHAMk4n9ZcPCaOI10eMs1ABs3cwwsDUMot/gjQcL0BO/Md2Ny4P2kfqMvXTBSIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2320
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
---
 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/smpro-hwmon.rst | 100 ++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 8d5a2df1ecb6..b48a980ed08b 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -164,6 +164,7 @@ Hardware Monitoring Kernel Drivers
    sis5595
    sl28cpld
    smm665
+   smpro-hwmon
    smsc47b397
    smsc47m192
    smsc47m1
diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
new file mode 100644
index 000000000000..d546b90982e5
--- /dev/null
+++ b/Documentation/hwmon/smpro-hwmon.rst
@@ -0,0 +1,100 @@
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
+SMpro hwmon driver creates two sysfs files for each sensor.
+
+* File ``<sensor_type><idx>_label`` reports the sensor label.
+* File ``<sensor_type><idx>_input`` returns the sensor value.
+
+The sysfs files are allocated in the SMpro root fs folder.
+There is one root folder for each SMpro instance.
+
+When the SoC is turned off, the driver is failed to read the registers.
+It returns TIMEDOUT Error(-110) for the read sensors.
+
+Sysfs entries
+-------------
+
+The following sysfs files are supported:
+
+* Ampere(R) Altra(R):
+
+===============    =============   ======= ===============================================
+Name        Unit        Perm    Description
+temp1_input     mili Celsius     RO    SoC temperature
+temp2_input     mili Celsius     RO    Highest temperature reported by the SoC VRDs
+temp3_input     mili Celsius     RO    Highest temperature reported by the DIMM VRDs
+temp4_input     mili Celsius     RO    Highest temperature reported by the Core VRDs
+temp5_input     mili Celsius     RO    Highest temperature of DIMM Channel 0 to 3
+temp6_input     mili Celsius     RO    Temperature of DIMM0 on CH0
+temp7_input     mili Celsius     RO    Temperature of DIMM0 on CH1
+temp8_input     mili Celsius     RO    Temperature of DIMM0 on CH2
+temp9_input     mili Celsius     RO    Temperature of DIMM0 on CH3
+temp10_input     mili Celsius     RO    Highest temperature of DIMM Channel 4 to 7
+temp11_input     mili Celsius     RO    Temperature of DIMM0 on CH4
+temp12_input     mili Celsius     RO    Temperature of DIMM0 on CH5
+temp13_input     mili Celsius     RO    Temperature of DIMM0 on CH6
+temp14_input     mili Celsius     RO    Temperature of DIMM0 on CH7
+temp15_input     mili Celsius     RO    MEM HOT Threshold
+temp16_input     mili Celsius     RO    SoC VRD HOT Threshold
+temp17_input     mili Celsius     RO    Highest temperature reported by the RCA VRD
+in0_input     mili Volt     RO    Core voltage
+in1_input     mili Volt     RO    SoC voltage
+in2_input     mili Volt     RO    DIMM VRD1 voltage
+in3_input     mili Volt     RO    DIMM VRD2 voltage
+in4_input     mili Volt     RO    Maximum voltage of DIMM VRD1 and VRD2
+in5_input     mili Volt     RO    RCA VRD voltage
+cur1_input     mili Ampere     RO    Core VRD current
+cur2_input     mili Ampere     RO    SoC VRD current
+cur3_input     mili Ampere     RO    DIMM VRD1 current
+cur4_input     mili Ampere     RO    DIMM VRD2 current
+cur5_input     mili Ampere     RO    RCA VRD current
+power1_input     nano Wat     RO    Core VRD power
+power2_input     nano Wat     RO    SoC VRD power
+power3_input     nano Wat     RO    DIMM VRD1 power
+power4_input     nano Wat     RO    DIMM VRD2 power
+power5_input     nano Wat     RO    CPU VRD power, total of SoC and Core VRD power
+power6_input     nano Wat     RO    Total of DIMM VRD1 and VRD2 power
+power7_input     nano Wat     RO    RCA VRD power
+power8_input     nano Wat     RO    Socket TDP
+===============    =============   ======= ===============================================
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

