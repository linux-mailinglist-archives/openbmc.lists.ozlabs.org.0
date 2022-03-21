Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E864E21E6
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:16:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSBd3JFFz30DB
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:16:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=gVHHlYSa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=gVHHlYSa; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS8d6kDJz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:14:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMCW3H8peFyqavGFWw7hUGsBx6o16eebmQRnkb5JcD0hhD2cCWmbma7TWGuZejMczNXavFG2Z6YFtFOy5HMUWC/RIHuf1l249i8qgT3ddNmdYI0C2ea8ssjmI2kt5ygt+m9skf/eXCX5G6cqB86PYmDgdLFJbHJa/WOoi/jq5j5TsU0JUOOyC38q5YMGcJu2n0mv8V6s7r/GL2jhanJ1ZNkK0awraZCyaVnS/JbOL7jUCzm7RUTyLtlJYLn1RXNctY4CnTA6e7l4i1gflgxhGKyFrBDQ0WNBKxxMj/Akv5SsCtFCl5nzqNx6d41yAu7TW99Si6y/xhseTWdRyeEELA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=molUBPO8hhlFg1mSUCLrPNUknyDfngmXbbSHMXz13wo=;
 b=AAd5RtUG5r+eTXj+kDCQJUxtiRz2IWMvgfVvvxR6KeSL+1warT92vNUiwJgyuMzptUnaTNt758uqjlj85KSwBHqA4h/WRWC0ADi6kt82tWTQzGpqoinoJwqdZPzToxxXETT7YT3JTAUMGR3ZlxJb1G31ORqkIfl1wYX4KUdUjSYIGyOa6I1v/vyqMwRQD5tXY+RS2X1ecSoe7gdvEZEUz5PwNVpInmQ2qvI3Jd7B6Gv6xvcXiwnO/C6cSp0qkDwzMA45XuwKzPdfaVS8MwJoDQoFYO7sZtvGlyqikeqlVDeuC4kovgx2ObnZHIONvMWI7SHIgKCgPMf0i+1/4Zy3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=molUBPO8hhlFg1mSUCLrPNUknyDfngmXbbSHMXz13wo=;
 b=gVHHlYSay786PO0WFEg00zTqUytSXEgUsraAyQnIaI7Ib3YX+aHpZY9F4B+Ib7lAFhVqvp/OHWZJ+o1U2yx7a2fMBwOc9IHRZMdRMi8hz+mhLAN3at8WEVMo0TxJBOVmum9NgJsGwFyDpDIB5SuyfiLUPG7SgdsO30Z9yB0hlq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:14:43 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:14:43 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 linux-kernel@vger.kernel.org (open list),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 2/9] docs: hwmon: (smpro-hwmon) Add documentation
Date: Mon, 21 Mar 2022 15:13:48 +0700
Message-Id: <20220321081355.6802-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321081355.6802-1-quan@os.amperecomputing.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b185918-72ad-4120-9e84-08da0b12dab0
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB2738A822B0CB215B895578C6F2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXyg9XU4EZyNw61Tg/XBMHQdUxzzt0gq4zrvwi0Sf+TXSeOkl7ialNcmvPCvP2HdhZbl5WeHKqEz/V26+uOJ2FhmApNnWEddAEgGkDW9NJ3uMysg5daGV1fTy3QVxdD1bdr0cC6WJxUL/FhQ0cAgZYQG6vuf3X4+7XiVHTEf7+np01rskBr1Gx+d1rjoLe/rO2FZVZ079KuNOCrZAKuequ4w45KuN9EMOavxow78Zl5/SJ9KT26016VIg+QO32P9bVS8C7gYa7ODLcxWTxPFwG5YZgiLWtsWQUGuF2e9728Dd1SYO4yIiY52+kofuLL2NhEJtm3dCGhWeVnW71mCE0mR99XC18MJUyME7aFNGlxbDtZu4w9zFL58w0boqeF3gNtg9nEXd5F1mSyWy6tqoszPs1nM0Z1WtPFh9L5IO2D6urqP/yd/hnaxVdd+GccXk1joafpC/41vPqgz5OpeDGKY6Q/wtRuQi+EYb+89muY9UY6crgAFLTlszoBL9Nw5DjQkZ/52jhWl4SISIe+3/YC41sCjEEFCDLl+U1x98JHNwdV46QNSs4d+Kdi1RnACwQQ202YBVHsiAbmwXyzurIloo5oSgYM5atfy4S3jU+Ui3d1PTHEB2B3zMQ7j2B6NWeBx6hvFLCaga1UnZBn8Pfq8Zye8oMlfxAtgnUUMQaenBMRvzrR8ooI4Xi1/ojD/lKPSSXBQNDY7UfJBZ52wcdB2tPi85ZCcus9J0COM4sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQ80XCb/330diS8nkRlyl8Oof6frapfep23OVNCivdWzH8uHn6tEYRST7Jy+?=
 =?us-ascii?Q?igIIKi3KYtUMHz+61wCj2z8SyNOwBfWYA9UOFre7f7aAcLrNkLDV7oYCpifa?=
 =?us-ascii?Q?XYKdUllW3Wom5YQO3SISkHU+AczaZNEHPdsLNNW6fzdssw0tIQm4XVcsrjP8?=
 =?us-ascii?Q?u0DMcLZUSrGnl1y/s7J/S3oCvSVjvY/rUXbVeQB3JM4xGBeRK2MgrUqSAfQ1?=
 =?us-ascii?Q?WAwqnI7aHVL9KvOaLvCVYExMMLIMkFwtAKPvKz5lRRBkE1/ToOAlt2riesxS?=
 =?us-ascii?Q?Yxg4CCCa92dAgRCMez15lcgiRP5VglesCOBRsIUA/k6RhvjkJZv3U8tB5y5N?=
 =?us-ascii?Q?Cp005W31yJrQZkbkrjsdH0Y19jnrldFsa946CzNi7noL/w6BIKq7fafXVKqz?=
 =?us-ascii?Q?y2EbrLOiUmU08btp43n/AiPbu+gHkFMy9egdXeD2jrsn6lgVFvJ0G5NehsgC?=
 =?us-ascii?Q?S0EsO/zfJ+GHDdQ2kFsV5VguYnb747O5weK1vmQKvdg5SYgRNzkGfeZlFE6e?=
 =?us-ascii?Q?niH+BRxyhSEYnIyoVeFRd5b7tUSctoTJpX1VoBII4wDUINUopseMZA1VHggp?=
 =?us-ascii?Q?J7rYhzXBE/vU8OhcAOIToxFXelLAYIKVt+fj3LfqVsdzyDH3WETOz5VvUF3D?=
 =?us-ascii?Q?n5KiIIsX05yyc3iGYIihpqyofwobDs5p6rCpqW755v9Q+6IDopqw/ZCZpyuc?=
 =?us-ascii?Q?uhiAvn6kpAqqMdfswyNRfI7aXD3M3xYerLHeIpno4yc1Dj6jttifkt1Ts4AC?=
 =?us-ascii?Q?evefsrvQBROYFOjxdEvXbCoIcZtacX9w5aghrcy/Bou807wiqHGJef8hUlHN?=
 =?us-ascii?Q?7G3a8c+XOXdmXgzvCFUccxjTSNTVSWyilTMwgdRlHxm2KjuPU3XBmjyZ0DD2?=
 =?us-ascii?Q?XyABSjNWIlKZAXFoJlo3ju6fqiqwv2DBcK84qmjy57cV4LqVXfTDkH63peT6?=
 =?us-ascii?Q?dzx8Cn/zNhpw9eeIZzzI9oaL+Rj3XZVsBJRC6Zy8bQWoR/vAhwHMKlbRXJrr?=
 =?us-ascii?Q?grIZuoXGcEc6h8xGtzlvdMp2QAws92fHKkAApwblzTxIJqn1YUD6DdV/Ncyg?=
 =?us-ascii?Q?GoIbNee9dT8tkqLrvoI0XCnXMuZYLyE9X9qmWwfEuAn3SIapVhVs9i9Sf82f?=
 =?us-ascii?Q?h6bSBE2rrIfHTM1W9Ar4cdomagVCFn6yS46H+2USx3rJ5Kqley0VhEpyw6P8?=
 =?us-ascii?Q?k/UijtNssJXElvr4BP3i/z/ElZt87q8hv2qL3rpCN+BcQ1xRA58CNsx0NKc7?=
 =?us-ascii?Q?KI9wDfbLV6zlPavlOGhK60AA1uUcsGXawOxlC9hXrdUOuqEjNFwyZv1yg5un?=
 =?us-ascii?Q?XLxVI/dlfQ4kFrYmn4NosIBSAMEbYXH5nDoROFS7ydZQqRnAffrpGBxVlNny?=
 =?us-ascii?Q?bVcxonehPQhLQtSbttHrCP8hHPi0TG/cE0IQzyZMqejhyfvwiXTn4iczwu/V?=
 =?us-ascii?Q?viDA3mi48T9HEDZdFwOHCzaFsG/1yxAC//cq4kDj4T8HxMq9X/Kt2FxNB4Y2?=
 =?us-ascii?Q?7BrPOP5NzXZ+TRo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b185918-72ad-4120-9e84-08da0b12dab0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:14:43.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkHmDltipSR3dBmk3R4ITW4BWOBfXAiJRYkLu8FjW48yy5eDBaLGfOI1Nuv9rlXJWIUkuz8b6J/w2K9pW6opP5Z8QcsFE9Y3wMsDTv10P/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2738
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
Changes in v7:
  + None

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

