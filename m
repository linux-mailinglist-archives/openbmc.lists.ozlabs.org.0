Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E147EB4F
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv2y0Llxz30Bm
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:19:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iZYBqDjY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.93;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=iZYBqDjY; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2093.outbound.protection.outlook.com [40.107.220.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyT5PyWz2ynk;
 Fri, 24 Dec 2021 15:15:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RB8AD2DMLBO8oPxXWfC5GXNUnPeZJvRuq0BCjFHOVBhlk6e3L/k4eh2rq/6rtFfbaVAG3l8KEwf1111Q1KrKxeJV2oPU+CmiVXbSyZxYqGcO7VkuhGOfFrJI4lkid39nSxH37/4QIVPddoFu7YCgAbg2aawvAWhf2bTVoRMEmZyeaiUi+UrWejAPmMu+++tQ+LrfWpkbUuga3teAPhUnV7dMe5+pamXEElsCxuNLAkoFvGB/D4M3ybcHNaX5vZOxGo134L4Tv8MOVlIQVi7USOF2tYphS5rc3wyDX7b0Xh8TCg2t78LUeghYP2FbInFx9AxBFWfm/wOYU6Notnd/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA0QHP9i/CMeY2RF1/2Xxuy8kD0O7t9IEvOb0icWvS8=;
 b=Q20dLyA4Umx6pB8H3tvQEaa5s5rj0iVYU4ejEUrrTB7doufyzdjIad1n/TWclfWznues7MpeHhsQEsTDl9BiqwIg8QE9qjSUdeyctTULoiRYq2JUWHgMyx4fxYafooZ03eNcoBJMJXDx7LMqG6LembE0dtP6bFZ83gNCG+D5lnoGlI7nhaU89xMRqaYbihAnC4O6zs8Y2q4s5K+K4exJiR6N26TYLnmXks/Cc9QEjfF85+mOnPl2pP3WD70R2Tv5p3UMitSFv1TuVm9XJ7+rn7a7zYr5ncD3sNCn+37o7D45suBdHSXz4c/tadqaz4gBDBeERWIsyN+G8Rh08Viefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA0QHP9i/CMeY2RF1/2Xxuy8kD0O7t9IEvOb0icWvS8=;
 b=iZYBqDjYgSKbwhvmTjMaae7A3QbpE3LMdV7UekTRs1LdRM5fOzTfcE5cZt4j8vIP7EGwxiKaVOa8mMvKGiTwbN9uRu/ApwIoAahYeRV2YieUa3O4mqn11VKOixJrM9Au65Myoswh/DZV3nvVoRiq4twjQbC3kfHfHV5xKjLmK8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:12 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:11 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 4/9] docs: hwmon: (smpro-hwmon) Add documentation
Date: Fri, 24 Dec 2021 11:13:47 +0700
Message-Id: <20211224041352.29405-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211224041352.29405-1-quan@os.amperecomputing.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f39db4d-fd3b-4cc7-a66c-08d9c693fa57
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB5189BEBDC86F673ECD764914F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfBfS+6vMEffASpCHdYb8ULeey4dz90sAduJQ5aOQ4w0QItxqcTFg4yqkE0SFZJXtlj0bawhuL9+k9/THanGgwUXj+mIB4N+Gr7Dum1Rmfg2EpnTqWPFiH8dF4WsrFAqYx1X1OPx2X5ipdHZXws4EqGSKtyz874g+oQWzqdADc2QklXTEqT6KZp8D8l8d42BA5AdVWI9xTRy1fOpZXYbO8+Xxtb8K5GQqc/11ZSVa56/Dv4iAzBnaBZnCcSYaDu7XoRIv5wjY0E+fUmQe1j9zxPBx8D07OD++7COwlY7qQZle6LGJ9rtVaC7U57MgCFpPAeNTzi0+bo74/mZ3cGen1ZMaIC/y4iBpXy8ku/djZGeAdAt26k8/CZU3LivAc/xfbzvGvZU/ywXrjCglydQ0MCG6TCa0XGFKXljn7Bvw1TTmbRZLjM2Yrrj7IyhrbooDiJlIMZMkpLNZCIIlapKw6/tMOH3GjhEI4ozXdrgQbdhH0bxkna8jv/FP/DrAML/YFtFY4HtJsdffd2A6zSvV4D04b9nsG4DEJYP5DBpN/B1Q72EySHiJTj5Sglk4pwYDwAij+2Kab98h4sKnYLzQmh4TWpb5WPE9zJMIDJUkr1NtygGHR4mEeqn5dDSUs3jugYZLrssEC/o5gm3S6dSNg+voz4UsabdEjecT20B5QOyQMKiy6G3iuzfU5DZmiuVOYsJxFQ3KnwqW/NQtn1Ipg7ERkZKTv39npHjkUUZoGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UjSzoc6XbuJd+WnlZJLDTPlXHfsN5fUm6HULIaYTbiPApEiyS5bwfhbQZBpB?=
 =?us-ascii?Q?Ttkg1LkyyJVYEyyNwecb4ff9slW0HCMdIgQ4XmTuSqdnvb0M5v/nyMFBPXCU?=
 =?us-ascii?Q?yAyee9+uxqnP4E2mGdM4ataPlGKLgyVnV3ER4BCZbPe4qT6T+Ts1AKhUsY+g?=
 =?us-ascii?Q?puNX5nGaLcEWvPRIMVAPncvgkKeZsGfslAkA4bEQ9zWvgWt+hpvYyJL1yLwO?=
 =?us-ascii?Q?jUsCAQceyMz/7q2/hodS8L5GYbhYyQiyYAsP4Xr+xu3aijdAnEvKxkz6WD4i?=
 =?us-ascii?Q?IHQ1VoIHHUYaUESUPv5iPZ3XdQ9MNDRlJWTLnJzKdc/d5tOc0tQg6xoaIjVa?=
 =?us-ascii?Q?KmIwjrRRO9VWhkJcfTNmgjO/vwejFD8QdKTIZO4VphhvphQjU+IApb0/L0IH?=
 =?us-ascii?Q?UV3k+JQK1qjmKUnCJ9qdMBnxivS8FAkch49Jwm4LJvS8G2FLX+MlUTjPZ0Ce?=
 =?us-ascii?Q?VQMTPGaqYNnLNj5IUk0d5KoeJAdg7OuThIAfX4oFlqfGWZH19FnZsth1JEC3?=
 =?us-ascii?Q?u+SFoYXjuEnCdcFDyZvc7gNPUtNDwjT4IebXF40oHJLyZpO9pf66qFmS6N7c?=
 =?us-ascii?Q?ML3VzVEnSbKVSviv6IDw02Ia53Q+lJHVS0nQbbcRVDeVPbiqldnBsscDrIos?=
 =?us-ascii?Q?kSSqoxACt2Ul7iZ/Jp9RAjk9FZJ2WjfxIQegUQ9Q+2upkhpnXEJUWLUvzF0n?=
 =?us-ascii?Q?U78yWmnKD16wVSifAwdET9ZUKCOHVRw7ZF0bOgd2gHd7PdH+tu5rhxm1znRd?=
 =?us-ascii?Q?gzTin1J40bykbhTjoSaG4X6GJvZ95C2ypeSFK3iRNStQYRUoSOE0YehMcUeB?=
 =?us-ascii?Q?StZOSGbEoM+8FFM7tC/Wsx/aKtjw/pdY5dykXtZZTOHXTXkL0dZv9aGyua8U?=
 =?us-ascii?Q?b97wztxHEuZxrdM20rUTNGDiF+LKkv/jzp3eoupRKjAMmV2DtdjPWPRqTaXC?=
 =?us-ascii?Q?fCWl7XsZiBg55M8wLaybuCj7vVgr7HYyWy38n3criNVhjCQnDht21ltLp9jC?=
 =?us-ascii?Q?caqG8pod4/bHXpNq07BK0lqLYC6eIK180lpXYBbhrc0BS2mf4Iuxwnqu9H9q?=
 =?us-ascii?Q?SOE5ZUdBWst+avtmJVrKg68yntlTTsd+fhQCn0LFbMSUiiAeg1qzXB7qrje2?=
 =?us-ascii?Q?KEGl1Cte2BmiZpRe584kzxf+ShNOx0QcO2/mf4eWu9CuEUJqHF0ls+PZo+PS?=
 =?us-ascii?Q?cLLqV+ko4rQ1Re4Xuacol0haGJw0U04LyXko4Pfe24WHvvtR2dZjL0ruUxqT?=
 =?us-ascii?Q?a56djdahY9Qq/5637v0osctQxyXfS1LbSKT2h/SNmu1LAaXuI2wIOn3saqcd?=
 =?us-ascii?Q?cGMmcuVT0bfgYTjC7Nfq7gKCB4CWCyayAm0NDMYguKXoIz4qH7il77r+lh+H?=
 =?us-ascii?Q?lBqhyKlGTaA5BWADTTqpLjvpg3gmX35qeA9w8HW3FrKcLEnei4FSuQi3TezX?=
 =?us-ascii?Q?tDB3Te/ezFEyv241jkMO3PqHHS5tFGpvBx14US0DiR2CrJiWT8L1SIdo+P+K?=
 =?us-ascii?Q?0MYZp1Cf6hLXKkt0G8A1B84YaEVEKTmGsFSHY2H101Sh2WEq9qUqYK+fN8cH?=
 =?us-ascii?Q?u7xMLMK4vgQEPk72dZAtaadyxamlY6F/MzR6UagJS5G9/BaMMD/ULTBVPgUO?=
 =?us-ascii?Q?EtrK3L7aX87DjfEyOFNCFnRKk3RSI0NwYOlcqxjXYr79/D1kXRfzAKQ1VcDH?=
 =?us-ascii?Q?M4EHIzKpM8arA2k8bDNB9ADjJgI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f39db4d-fd3b-4cc7-a66c-08d9c693fa57
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:11.8125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMSwh/6JoVOi4QYZXClBBIu5TL2sewtSacO5whEPugqxe8mUTprpsOZ++KfrEsAxm418eQ7XuvlXAYRXvz6TnEzWHD3zM7+Am2nuNbGZ7S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5189
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
Cc: Thu Nguyen <thu@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v6:
  + None

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
index df20022c741f..79d1b8023186 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -180,6 +180,7 @@ Hardware Monitoring Kernel Drivers
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

