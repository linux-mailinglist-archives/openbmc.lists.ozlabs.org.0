Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D505EF28B
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT596J4Dz3bwQ
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Q+fvEDpJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.98; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Q+fvEDpJ;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2098.outbound.protection.outlook.com [40.107.220.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3628cdz3c65
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y17u73f7W7LjM0ODSTCaD/H2nr4hC/9UgV9d+eTv+25fqGMOGdX59DeSw93iXKtobq44Kc/mLIIPJQZqv8JFoLtXqEXZs1DKXoJJ1H14r5O3L91mJGd7lpbaBc72DpGrXswAeeLACKVud+QqXQP3OjYeFhdk2NE+PM55tBoa89feSprKxvNnei4Kp6cfU3qY/J5AaFZg7HsTtqldo/mU/Cf0UoQljpJ1GYsOoH010eva2sTHhq+90vjqzX8khLqziKFYCPjHSM7yRPdTH0vUp+IK5D3ircvTcQJevlCbv6MB2k/0fhHBvEljDHiv+BDv9aeLRErL4SYT0QOuUpWd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1qC682PG7wbJhuLtv5pwxZ9Ny/IOkEVJuRpOL7lHZE=;
 b=Gzm0JJTV+lSgN2MBfe2USDOqOS5rrMKt1syXBpL96DEjaPy9Kj1zfNi7nmKvYr/jiiS8+Asv9AF1nOzHQi9ZPR1pB96DxHvyvt1tQeCNygA3NiYQWayfcNG1Mw0Zdb5JnBCgNrzsaOm+qb9KolXAWMqCbr0RKQyqXTT6NHcWjypSco4Nz+03DVCGB8fz+1dX3hgbNMer2E9BYblo2KnBxzGtNb+kkKbmCNYVikk378AqnxnU9PbnyjWJoTHn3Oi5h2j0VtFiLhz4vsjljzEFQ+PbQKNx5NZBGGRcZuctkIV0Tq4QPTImkb63l6PpMC19Hgqi/6vppvywnFoM7bmUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1qC682PG7wbJhuLtv5pwxZ9Ny/IOkEVJuRpOL7lHZE=;
 b=Q+fvEDpJ1c7Pze5pwtccTaO4S0jW7zzszqsoVSOmt26gyWPmqqKfQ1UNshP/j/ln1OPSvsm3A26hClaH4JG5/5Fw11Y+q7pDKwGRBOyCnuSLPIokcKpnRVUaOtH0UDEVefMzvsJgZ4ziaz2JYOfBucQHcPxprT9jW8lIWzR1AOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN2PR01MB5503.prod.exchangelabs.com (2603:10b6:208:11b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:43:56 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:43:56 +0000
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
Subject: [PATCH v9 2/9] docs: hwmon: (smpro-hwmon) Add documentation
Date: Thu, 29 Sep 2022 16:43:14 +0700
Message-Id: <20220929094321.770125-3-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3f1e272d-10e0-40db-9156-08daa1ff2010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5rHRUaKPZ0piORGClHPSrE8kFnZ8D04CaUTn7R8xAooHGjgucngBVxD+F8TUT22lSrINijs76S5j+LtZ2urbXEra1qEAkfDkBFLCVcPzIVOYp+XbEwrkSK9gAsMWp6kKCzDL0Bm060xjPWC3PQ4RCP0DB6ytZO8cEcuYjb3RqORfqajHKb3hL0XuhrhQ8CSTAiKMB1NadBO4kc4av2kt70DbOP1t4uMmod+H+u2QtRrihFbJDWNtBF2JxnKTM6voWsXWr/8hUslS2+zmwAa5pCR446BbpGHDaJdbR/0wRy5hRA8JLXn36T8Px5N5JZlsLmWAB2Qx0K3Y3GXKIZqn8GVmOrenv3yclM62Ma3HvgxqPARTKiRTum+P7bRjjX8xAjRbiEJbrwMl3xbU4LbVcm6K8Fo5wLVC3ZtuKK1RQJILE99hxqlw6kjGZo3XYsaArh4ILMY06LF0Fqz1QR6JebPIRfN5kxc91YN5rVO7f419Mu8xh07VGH417Jak6RIJry4Due7CcaqJ3WzdrBjF5hcIZ/9H3KgHK7KeGlKK3HEHlbckD34nyEXNsl88SVKQ152O6PmB443A6PKsfaU2Xg+pp3vURN+JhEEQPIV2F8gAQVsYmRYuQ5xW/Pj/24m6tvBfaqGutN+q2rKeyuvvyfjdGKtjuk4wfDFKVGZ79LnjdjCctUC7ht9IqlOWog9vl6wPOMLr+3ZwYXEFPOlKx7O5P2U4ZgBJA/uVMjcQqf8ddcppHTYINk6dezBy6jjLEZ89nE0Ep7IUb3N+SlnBb/EIhMDdTLskCBqVlRKjlZc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39850400004)(451199015)(6486002)(478600001)(186003)(1076003)(110136005)(5660300002)(6506007)(7416002)(2906002)(2616005)(921005)(6666004)(107886003)(66946007)(66476007)(8676002)(66556008)(4326008)(316002)(26005)(6512007)(52116002)(8936002)(41300700001)(83380400001)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7XIjIfqp30VcRWAL5EfHOSFbigqRqX4m4f9FL0eJ8qiWIWeT6k3Bu/i/7SCF?=
 =?us-ascii?Q?huHlrv1oJ1xzWTCN9jN3jbghcNdxBuQcqzI6bkfjvUbrzckHWXOMEu0gIXFl?=
 =?us-ascii?Q?9FSyPrlZdhZwqDWoGE+enAMnMioAa4MgjpIfXyerJfuccK4ML7ol+BSgHFUJ?=
 =?us-ascii?Q?At8iQu0+75qTohIsBPzspJOjlpjy2XYrEYInOK+GQ9Q6UKRAC0+imdVa/2P1?=
 =?us-ascii?Q?wbmfbYW2UAyyT3aM3k3zkuTSCtDxOsNpf7w09Q92m94pc9xMzAz8aU84oQcG?=
 =?us-ascii?Q?apsFR5F3HsJ668iIot9aEJozgObScKhofWU3aHLxQE98DkfiOa7ykSlvoyDT?=
 =?us-ascii?Q?hRrx1rQBlUd2WN5eHN9SGtGDUVnGAt8jHJZijgnQV+cJMLjjQucBhJy+79nb?=
 =?us-ascii?Q?vhLvuqmhN3wdSI0HmfwP1R2zvpKHXIFl7NefQ5sQ8Qn2hkSyrQhO1mtQNptN?=
 =?us-ascii?Q?aRt849RCOFVz5LObeM0tVMDkclmkaXH4WZgVIK6F/4Cr5PSIHKU9rpRVXyaC?=
 =?us-ascii?Q?G3l5FWMH0YUxhPvx5zJMF5r0nMQgPqorY5SzwBhtMHkkfz+YQrGKdTtx6YY/?=
 =?us-ascii?Q?8KO8Fuw4WyCfSp5aC3yNT9zJOwDjR2nDl72+NlH+bZqfU8rFDCCbmdixdoZi?=
 =?us-ascii?Q?byPO5z4cyl87694o9u45/lEa4zGrnLPS1PWZ3Y4sHkoDVItJHEgU/N4DbyD0?=
 =?us-ascii?Q?jah4C/jv0ZPC7o2Yqce0bL0GP5V+sagWyRNhRlXB3HOWcqCtxDE7tzpaWQre?=
 =?us-ascii?Q?65SXnG2BYanfRWBQPjy3OFO6IuYNuExEObgOBSboRpUkUtjrCGctaqD/yAus?=
 =?us-ascii?Q?9ywEfToueZUrwrOVXBbUsYw8yNPREJp7UNcNOsVBpoadLBCn/yZqVXUsA30Y?=
 =?us-ascii?Q?EYeI1f0uOorQhUkBknwp1RFRTHRP56Oi88VzVmzzgcpzoLKmzKb9SU6TEN0H?=
 =?us-ascii?Q?K77CpAcjGjnGB853I+U4AIeLmPCAzt/yn1GgZJgPSyXGd2tXyQO5L+148zsz?=
 =?us-ascii?Q?fczAqSSu3az6/qMLqzw9fUdjmPkwsBEWzpYuGBVdrSjsCSL6+S33smJ9eN2S?=
 =?us-ascii?Q?NaVAJVI95PtnaN+0ZoSArxTPKEf9gKTxp5sf5GbabTQ/r1URasHsVo7gUiWj?=
 =?us-ascii?Q?foryLFC3nuGVAldtgh9RJxKo8XTsjjXgusW3KutxoqZ/4V9tSKNhwTkbXQI1?=
 =?us-ascii?Q?l7oK/rJUmQk9kHNG5o9UbpDkiTZz6GE5IM4fmvRtJDxTSl4/D4TnV9LtXZMJ?=
 =?us-ascii?Q?l0KrlBSmi9BcrLqGOGrphKGLy3zBGNJPXGxgBmyYp0/d5V18Nr16Z9lZzC03?=
 =?us-ascii?Q?deA/fdptdtrAanACj/bRIgygt1wac3Yd7Mxv0C6lfXIJhX+1LaYESNyAoCUO?=
 =?us-ascii?Q?XRq14w7jpKEMwxU10z0npqJgsBpRx4A1zNp+/vIH7d6P0VmGdPdamXIRuGpO?=
 =?us-ascii?Q?HJI7lrYOz9f4PXBx5IR/baZKycw4tkSiTrjjghyFDQqLLSGkOUB+sg8u2dCe?=
 =?us-ascii?Q?sGlymi5jI3k11hbLqSagFHq5lxg18oVEU5B4Pda9cIksn8A23+8jtNfTbLq5?=
 =?us-ascii?Q?FY/ml47Es+GldpDepjm9p76lRr3g1JvVZzISEVuUXnRqbdF4s1ONMfo1na7n?=
 =?us-ascii?Q?ZAODBuULNnrl7Mf+hAF3Rog=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1e272d-10e0-40db-9156-08daa1ff2010
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:43:55.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6O+wfA6iVvzIKlj7KxQJf6f8y9r5WXH5GLyyf2Q/JawOfT8++Ujgyk4uGFpWyM3AwSOZk5TX2XcurYLcLrERmz/N4g+gxaRT6EapjFOA6ZI=
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

Add documentation for the Ampere(R)'s Altra(R) SMpro hwmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v9:
  + Update SPDX license                                [Greg]

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
index c1d11cf13eef..ddff3c5713d7 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -187,6 +187,7 @@ Hardware Monitoring Kernel Drivers
    sis5595
    sl28cpld
    smm665
+   smpro-hwmon
    smsc47b397
    smsc47m192
    smsc47m1
diff --git a/Documentation/hwmon/smpro-hwmon.rst b/Documentation/hwmon/smpro-hwmon.rst
new file mode 100644
index 000000000000..3a9b14dacf89
--- /dev/null
+++ b/Documentation/hwmon/smpro-hwmon.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0-only
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

