Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D605834C183
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 03:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7wdt60tNz30D5
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 12:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YB0VjfWh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.104;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YB0VjfWh; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2104.outbound.protection.outlook.com [40.107.93.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7wbJ6xYcz303H;
 Mon, 29 Mar 2021 12:53:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mL7yqEbBr/oMeFcnqySjflV/N66eeDj/5BW3oeMizW20XpZ7jTuAW6PQW3oc1/XeRTeJrM/3+Z7oWzLaYXj+eCTci4shZwfo2tQzkAwkHNipgRQEPylua+IOHE9fnu61A9ishR7ImVPi7FwpfCGONNyaSIkP43GUmJTpw9bPmqZM0LknXnhxqfiMD8Qwx3VIp9AsHj+ciQ17brZuIdvN332n7BrXATVbGmWGYg++N6U3O+piRAdlbLqz0bD91Nw3bjH8HhaQ8TV5/JEa30PKSJZ+65VesfUvculHX89bnJjrrPpIe+WiGSnHEoCXVVCrGTnAyLvmH4UTnzlSVJ9zOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsnJgrS+GjqZP32bh7ZFKSuGXYYU0wjYM7emkHcqBJU=;
 b=SsJ7uzII+Ux5wvVXFJXfo8rI/aXnnwKuBd+6LQMi51u0RHUIxHtdUuPwZoEJvJQCLfFecNjp4MOFhmbkiuN9yZEShPwc1Lfy5/v5LsfRxSjF1oaM1TXWTs5167tJZi0edvj+T5UxVSuP7DNI0RKVTnGldaW3i+zfeMhzMnb3+IEapLmKNQw8Odk9ejEVGJ8HEEeDZ6h6R+g9L2xPqgtKzIrS4FuAwDLQi3FQUsGak5rIn6F5bNi220Y4tnYhuQKKjksxsY57DKo0ubTc2U2k0QoBdavgmEAxNjIe3PtIFMofGudenwjKHfsV7bZyv45H3smA89Gntk7nmVTSy6/4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsnJgrS+GjqZP32bh7ZFKSuGXYYU0wjYM7emkHcqBJU=;
 b=YB0VjfWh3kmgpeJpGyKO2WBVxX6fEe06PJEObXkYPzxf8+R3mqho5GEHN4yeI4es80z/LRRCZm5FhEnbyu4eYG/kVCzo7UXvljojkWTMGtnAbGv9Riw4BRyIqxEPTndcTkBuhDMGH5evrc8WIjT+/xZixcrZjuJDUsyhDuZO02g=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6226.prod.exchangelabs.com (2603:10b6:303:77::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 01:53:31 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:53:31 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Date: Mon, 29 Mar 2021 08:52:38 +0700
Message-Id: <20210329015238.19474-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329015238.19474-1-quan@os.amperecomputing.com>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 01:53:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9277a477-8a24-4115-f34c-08d8f2557426
X-MS-TrafficTypeDiagnostic: MW4PR01MB6226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6226B7E75B6D711271EB5471F27E9@MW4PR01MB6226.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdtugP+698pTxpSK5GPKOOzJTLz9dlVQ+KuJacMyD35ZJ4Ywhw0A+NsChFYH4qaoFo/BVUyfYk7EvyoFpZ/ZgK5EEZ5Xq45JzXl/oSTVwc6gzp+GYcPwYPajvaat+q6bLfCvDvRpjIguJXz99Z/ImyOqVIDFuwnc0Z8LNKxfBtA8V2jgvJB4E2fkYYZ8+zEtK5oO+NtTpB/y3Fir2H/0JWl8Y4zK0/1SD9g+O4VkTwAkXUn42ZoKnyIbI7noc8qqyt3P2zt3DYI3Oop4Tej2Gg+SXsAj27e3w+74PmbJFIDlN+uLP55TjoTzXPNu8weshHRG1x+jOVzX1X7wCB5BsSdBRjBTO1PMPsqoaPKF/BWZ3xgRgtJXtl5lQFIyNzjpSALBfD9PPacPtCApmLjp7vdpOe0nUQxDTMCkPqCk5McfT160fA1TNKbdRp7mw0XiRkJLndbXAsGd58wSk1QLTSPwPMzO2geijhbh5xXXtJC3FHyc5zD/VgnT0NuPXpynx/RB9tuEweJx+sft2WQMD42RXr9MDds21vupHhizez/RkpVvWI6G8vfg6B6jrecrTbG+vUJIxTRcipAELtq8DS+cKEOdI6wJSgIj0EGAd1XqMDYIWJDw7FlSrr10D0VenKHDLLMh2aHtMUtNvGc3XyhuUVVcnDIoC0Oiesuowc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(54906003)(6486002)(921005)(7416002)(52116002)(86362001)(6666004)(4326008)(66946007)(316002)(2906002)(8936002)(2616005)(478600001)(26005)(6506007)(66476007)(1076003)(16526019)(186003)(66556008)(107886003)(110136005)(8676002)(6512007)(38100700001)(5660300002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TJF51w6MYqCKUOmdHAiymyLkRfG337QCHQmFDSmrFtHd8Ojq4VVHs4EykLEp?=
 =?us-ascii?Q?3l0YjoBniCPjhD7sT/zZWCpTmUaRsf778rMfP0OSLBvhymvn0GTy5dyE9jUX?=
 =?us-ascii?Q?KNDurzxJCvxGtHOumKjNAmQ5y+L2ig24E76ocxEuk9G6d3yDG77e6okVJhk5?=
 =?us-ascii?Q?qrj8yAxpfFN4n+tH2rEz/wOpuBLGbeIV7Xwg6ekiiwFJtfsmBIVYqEuB991X?=
 =?us-ascii?Q?4wCdB9QbwBHHRoD37CFhpjNBSfrQqVPMTP9BZ+rcbgqzyBtsDNgSh9vqRFo9?=
 =?us-ascii?Q?ozmjLY+GRkEyL0zvsetNjbRH+8UzrurlrzveRxUU8G1RLHukqzwrB9Gn0AGP?=
 =?us-ascii?Q?knp6KFysGitf9HeNCxFqXOglx5IbO5A4YT7e7T3fnK3F6y6CXraO04DWQYZ4?=
 =?us-ascii?Q?30pPVlzwzGaCn1DFgZomXvgWtCUREUCPwTjxAwNMChgkXaKyxsMEgSubl+pK?=
 =?us-ascii?Q?mKFgAqkZnaoO6S/d2mW2sxdBFvvc2lGmA0SlgnEO2Nf7j1lWPMmSQyT/3f0v?=
 =?us-ascii?Q?4037QpGCG7tU52PX1Xsee6NZ3GZblAsHU3QPJ8CMbUSr8E9evQnotFLWm1Ml?=
 =?us-ascii?Q?MkKyqqOh4HH6a85EWvjIdnTYgHMFXxYRBXBNUqI4qVNfl3sWTOydMCxJ7TLZ?=
 =?us-ascii?Q?nmWOFafj1mCvnJMmXpMh872AL8i6NQ+cGx8x8OdXwcBQh862d4AWwbGLCsd0?=
 =?us-ascii?Q?WIii+nxGp19XsLcbP/8B1GeeblyfgR01s8u/HBXUeMMwli3EIo6qybo4VBrh?=
 =?us-ascii?Q?LqkOG8HNRaQakt5Gl/5AlBpIcnStp+WxuvnKtDKC7P4Dh+qydV6Z7INPuBCV?=
 =?us-ascii?Q?STwd2Cd0a4VtVNtinYMX+jNBD3NDNEIuYzvGaTfb/VGVUJ7BrfFd0k7rxk74?=
 =?us-ascii?Q?08+JxCtva3aN8Qgo+Uhu91ybN1fMsTf/plj9Rr76uAzzx9OGP6aDOBPrSfCv?=
 =?us-ascii?Q?AJVWhLuR0jMNTTXeQtzEKmNw0Cxcr3RaP66AfQhfEfnSE2kIqyPBF9H/9DoW?=
 =?us-ascii?Q?GI4XJBZKOIWAwzymzg9PIWJM+SSsfsoyeTRKb6NafOd9Ku2/Mo/A5biKgwEC?=
 =?us-ascii?Q?9HhJdEGo+tVbL1tejmtDLj2eVv/DiWYGo5PVuTKgJGxQaSowpq7ir/ZRmxQg?=
 =?us-ascii?Q?wagIerTkRSDY4zURqI8c7wHRcfqT2J3fIq0GyiukbOhGaGgTDsMxOr2Vdd/1?=
 =?us-ascii?Q?TJZLgJqL+FuNWUEfD5pL5Gt/ql+WU0SN/aM26ORMPDUE351biq46SXpSMira?=
 =?us-ascii?Q?D9e7PNRULLJ9twgLRhgrPXCRU+297d5TPPyhd66x4e9aFwq8BJXnyFEt3S8i?=
 =?us-ascii?Q?LmhDAgHAuCbKoNz1HQoJVLSL?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9277a477-8a24-4115-f34c-08d8f2557426
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:53:31.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8jJGPUjXLtBgRVVQZeolSML7V/gUoObiyCNvbpwHqMLAIfPveDt3F4dPf0LZsx7eswarIQEITZcep//wyW9LnZtrrCfuXMfA4A1EpHCDaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6226
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

