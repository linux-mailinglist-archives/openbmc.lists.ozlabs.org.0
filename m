Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538263592EA
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:16:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjwC1NRNz3bs2
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:16:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DUbcAoJ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DUbcAoJ0; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjsR02g0z302Y;
 Fri,  9 Apr 2021 13:14:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xvs/uD0wzf/J9iFhx86NYJY0I5BUY29Yo2PeCwmeRsRHQlhVp7TY41zJ5rJQttSv8+vOEiD1p01Pawcse5Ro+LSMyaJH2qlDAy70joFJKOHWRJuWZtZVLe8tQ2T+au0JvVKL6TBRQpBXi3kESE+D3/YIu8a8c/xyVoe4lPrOKzrM/PpD4oejhjl+TlhW/fyICT1kpw4PYSy6kZ3iQQcsvwqGHL3PeFsByM3s36WQSDit25kChtYFHoW3ViPRkfIpYUE2w97M/i2b+GJ0rqNPtWMpgfGU4hqh8jY13telBSz49ojSrFRVneAJxloP7hNLiW5z/jrESOfavd6wDBumHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsnJgrS+GjqZP32bh7ZFKSuGXYYU0wjYM7emkHcqBJU=;
 b=WvqTFnIg8nv6AQq6NAaSGUkjA7XSq6dHzzCVuuWF0afrfvlCi/3erhvkhB7XN6C8hMle3I6gHF0va191Vs2Ojlu7QpcjjU2EZmkvnWhfngzHafQ4cxelI9/jX298vJ9F8TGNQl6tPLmHIgCc37fuWqmqdo/J/SsFCiVrQcMnsI4GuWUBSl4yRIKipcLSOEqaWY2H3Ur795K5dv5SjaZvDJgQjuxyy1j4deGxrJ7jODLKQRHe3W2DG3TScCr+BK8Sv9FCx1i4WC5rBFSzkBqTmdEVDsRCJnFBxtdi5EdK8QDbbWuzLI7v4TrriyOOLXj+Alzr/ohU2weW3gIWtx7M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsnJgrS+GjqZP32bh7ZFKSuGXYYU0wjYM7emkHcqBJU=;
 b=DUbcAoJ0f7vY5koER9qmqG2if2Lq9a9sV/UM3Thl+JJnk7iJgGu1V3Dc/MnQrCJZwEMMSrFB6o+ANdwkDRaT+TQrGwO0yApAJKSY52nnb5W1k/KNcMf7Yj8fOXoXE2HjfKzknxDq1WT3a/jjPrTrBn28BDFaCqVYfn956yY5luQ=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2991.prod.exchangelabs.com (2603:10b6:301:36::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 9 Apr 2021 03:14:17 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 03:14:17 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Date: Fri,  9 Apr 2021 10:13:32 +0700
Message-Id: <20210409031332.21919-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210409031332.21919-1-quan@os.amperecomputing.com>
References: <20210409031332.21919-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 03:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71606360-701b-4caf-5a3e-08d8fb058f88
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2991C578E3A7B301AE8A01B7F2739@MWHPR0101MB2991.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXStxnZ2YuhheHFNTSEDRMZLqAgU2wj3w9pWtwrrn7r+iJiUNBxHCxCAn/dqmSpGeCGbzEJb3og52ubXbF6odkJzw/Bd5PQiV8UbjkDP/qJ+iomEGr7pWfsVdJwwa8gmpysIiv7Kq0Gy8VqVMQlhSDOxR0ZVpngcxKm7wnYO1FUuGhqfYdIdlH+5DyRMSNMQjQJxIkCtx6tBhua1OctRjNaooKf/h7Ru7M9Vyp9bgw9jeSjSA9OcUWwCLSA9COYJl9qxdQBOkT9E+SRHW5naixZOoE1V+acNwfc64YGyChevXD1xMStCuL10Av/bUvzMBA7CefWg4pw9bP4TJPfGUsAn00sEDni0r4M2xvAh2ud1E8qLeFvUsUH8N5rBqoOi3mFfi/+9j0FqVjMqnjUEhxkK/ayLJ16Nly/mrKa4+JGiIVU037mF0Md/YkCvM5CYN/I1pMvAtCvInJnXjHJGk4d4XyE1UIp9FqWxzX6IF6i0sPZmJPdqIP9DFlltwBsOmO1fk1rRWYxd8t8VgYVtHZ36LfpgjtIxe6e/wV7sc6RtZV/KKGOylGB2UCvqfFVUHs4EmZD4HryBum0vlSVxlXEvtbqK4NnT4TRLkLeuRtro3gZnUfBjujlNAuE/YBPF1RXwmA6E/OayA48BF20GKlkCl6XQzSHvXF4IKaDIZiwLv66k7p5rJHWI5ZqDUxbJFbm9aKgs1i8Wbpl4swiOEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(6512007)(478600001)(38350700001)(921005)(6666004)(26005)(316002)(6486002)(1076003)(2906002)(86362001)(7416002)(186003)(16526019)(6506007)(5660300002)(107886003)(38100700001)(4326008)(66946007)(956004)(8936002)(8676002)(2616005)(52116002)(66556008)(54906003)(110136005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Dl9HssQy4PzFCvxo/wa8YQgrTa4kMmOcqHOmGGwGIGpnOU74y8o8ENvBWrTs?=
 =?us-ascii?Q?2Dcu34B8qsuVkhsI4Rj/2mRWkIt+P7rSwa8sziQDyOXYY/NAH9jHKela6+Rl?=
 =?us-ascii?Q?icc5+uDGBTddSy+1sfjwXQI04yXNLZ5WjXC+3+7l5Dix3zJFLcfnE+KW5e2d?=
 =?us-ascii?Q?S/69LjptyGPyLl2mlLwm6fg5u0i6fcw2Vsp9WP3FHgC0g2Wq07aSJmXC4lk0?=
 =?us-ascii?Q?nyrMxONx6n5JENUOZyjZZ3vsyG5aeMvylvaax7S7oHNmJyQFqEdPyWeIXGC5?=
 =?us-ascii?Q?5v7lIX6LOJZD1XZaCALHNazFklmq3hPD2nQiudK9e6FNECH8dpmPaPBTL4jw?=
 =?us-ascii?Q?cPS7O8k3Oa+nYCnkF9kdCfd/NKPV9frApTgrksyRP7A4Mg9Dm8n4H6Os68ED?=
 =?us-ascii?Q?lu6YAC3l69GwKHGB64cBWK17HQFCq7AnuF5cL1APAXfAwcL0oajbvgm4Vt2T?=
 =?us-ascii?Q?eDvd7ixuRgo1GCm0u9eWLZXEGNjpQmlWuCFnZZdH+G13bHlwhxU+TwcVmCs8?=
 =?us-ascii?Q?t28UJ66n43Y09lwhvBomEUwXxFa1VlKus+olwfY5AcR1tD+kbPKxXTjPjV+b?=
 =?us-ascii?Q?g0Z2ivUNo7DEFKGrIOohQQzfRfzN3Uf02wf08p289g8CrJ4iatuExTpXqcKU?=
 =?us-ascii?Q?zgOf31U7Mo0HjU4JGo/Kpt4oiejrS/rG3KkSdCy1ltVUlnpe/3cMlH/80AiH?=
 =?us-ascii?Q?2I51FHP9ILtMUL7kvQvxKLHVQAPuUIg8r1ix/EAGMzG9x1OyYgLXvDFvme5S?=
 =?us-ascii?Q?KzWfGdQg7rx/rV+rKSYDFV6PRGlRUnflWAmFvvyI13jXS/zK/RYyBblGvcDU?=
 =?us-ascii?Q?hJ1QP0uzmZPkQhzgMhFCfemzVatYc3mMNl9KNbZx2g6z+erWht55zSwdgatg?=
 =?us-ascii?Q?SRtFg7PBjryrqWFg901Msi2WNWPai1oAFFn3NQ0ItBrsw2yCWrEKgw6UUBX/?=
 =?us-ascii?Q?QqDuJsmm7vS3uuexxvAcANBFXdGy6jY7kRpOa/I3ETgfmlEJK2jdkdAQp1rA?=
 =?us-ascii?Q?xiY5mcp8KWFlE3qwv92IxTE2GurKiqvZocFBMoLfOvWRlc7y/RGXc+yUqe73?=
 =?us-ascii?Q?yuEqvydT9shz+WdXUYYnkiAxLuxXDU3vrFPiSFv8Q4h8+NNxpOtNxdQNgCXd?=
 =?us-ascii?Q?0ay1/UbgYE8fz/uit4D6NWmfz3yXJ5BD/Qq3nEI29Xes8RIuCEQm/c80p843?=
 =?us-ascii?Q?+DZh34sGbufBq1RUMbkcLW6iwi3ZgJ3HUf5miGru+SpFGIxtVsHZkc+qYEU1?=
 =?us-ascii?Q?YDgSmvCtFbPuephILLsi5iOPbNxCgh56mX/pR5mabCPdMO8PI7IArexqqm4k?=
 =?us-ascii?Q?H42a8/3iLLWrep/NH6qAVoEA?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71606360-701b-4caf-5a3e-08d8fb058f88
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 03:14:17.7919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIlhlrX/amz3YTJnZfH+EJNN36TtN2EELGsVv6qIAMGCVzlQqEi6ERY7vxLxR4FLbmGS16Oe8DAhsClXTCmKju9ETUcc1ETbTit+V+gR0gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2991
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
 Documentation/hwmon/smpro-hwmon.rst | 101 ++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 48bfa7887dd4..3e3631b253b6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -166,6 +166,7 @@ Hardware Monitoring Kernel Drivers
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

