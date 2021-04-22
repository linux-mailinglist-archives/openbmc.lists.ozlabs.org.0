Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95D367D70
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 11:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQs9t11XVz30BN
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 19:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rB4bDemz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.129;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=rB4bDemz; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2129.outbound.protection.outlook.com [40.107.223.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQs7C3zhDz2yys;
 Thu, 22 Apr 2021 19:09:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6vklRxQoDLUJfuQ7GIp05eBngkBEfFctg2EXadYzw/6zWunkWAnO/pdzWuUDU/Pxh24OZsMGdtYqBf7PuhV4QtcQL3KGgQzlCXAD2u56r1HYUDpxfNiFj9auIdLiw9NGBQtlNcn6UBrtMfYvKey9i18oQPd71loTGFIKhD7BNYEWxm8DItiOmH2uE+rRUYf8WEL7en4bxJHdNN2AualSSOYFJxTfvDZxr1+Eyz7I/q14RXwh3G9UplMC3Ekmt8Gn84lU8KDtLC53QG+8JAmI7k6fNLsVe4wTVFfRk0GFtY84Bvkf53HbwMVjAD836l8Nv3SfddP8/G91Es7ADe2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmRWFMCUEMT+cz4GcPH/zDJcrRXlqg8GmLXCr741EyQ=;
 b=WzzQxFWhAik/V6NtmWycw5QX1cCKvnmTSfTv89sQj3Koo4i+9lnXoesUrAhWcO4D4EgDKIQoXdNAZa29QNrktoaO/lEtXxKXCT71cNzKnQe7ObtyIZJ4Lg3UR2aklcw23Uf3xd/ZrcnN4wIJ6BcljftdYJTnTg5j8+Bmm/pGMqb9EkZzmpBQROk2coV9XH2NWkoZF39pSyF0vSIk6I29BmP4VFGzKSxcJ5xU0uLuRo8hCERSn5ZZuMbEOt2aCm5bbv9ehG8gw40SuahF7SCwiguSI6WGoQVqE6lwVM539MExa+lWcU2yfbpLrm0dQgiowM3lAKcNHysrXbXuTAmXnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmRWFMCUEMT+cz4GcPH/zDJcrRXlqg8GmLXCr741EyQ=;
 b=rB4bDemzBcEz0pmBplkhP4a81ooc80VYvCaeqLyU/aqKxaSWvLum0cJ8upJ6hN7ZPSOI811BGtLD7OhKyRRdtZImj210gboRHJnb70Zjl0IRtMgcUbNeceLsLKyr3dukicuyTWIF7CeWtWE6tTqSR2Q/t/YS0ho5LVgdHIC6t14=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6356.prod.exchangelabs.com (2603:10b6:303:66::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 22 Apr 2021 09:09:22 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:09:22 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 4/4] docs: hwmon: (smpro-hwmon) Add documentation
Date: Thu, 22 Apr 2021 16:08:43 +0700
Message-Id: <20210422090843.4614-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210422090843.4614-1-quan@os.amperecomputing.com>
References: <20210422090843.4614-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:09:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6257fa2-3e15-406a-15fa-08d9056e515b
X-MS-TrafficTypeDiagnostic: MW4PR01MB6356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB63560B3696B1666277C90409F2469@MW4PR01MB6356.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OGutW08rP8lwUNv3Zgs9Q//bWIgfqkJjuUuWBRY21RSoqOCdI+tJvTNgZ30PF4eF9mOvf1fkQqa/g16LHC1RXD1UzT9lpphylTge+gldaPvIq3mfXCBKW0rBeK1F3fkx9SySr2pnWTRInJyvvQIlMAGu9XtU7SMbJQFARP2rACar/6ZEMUKVBBHVOtwoVwkhkhh9DdaYOyJoZzSVQad0jP9NovCuvK107K91Z1AZ4ar6GyJrdl1apTnEpSFhf4XMz37IdNmgMIXX6I1/kjzeLJM7XDdszBRD1ZDuVV6ThIQiyQIPaVTRScKFvQSoWpsZoVzqbILp8CjU3EVKsLgwE0uspNWt7EUsxIBfWJV4WWbG/vD/ydBRkN8/WdcPplAZs1BhyElvAfPSmAIMb2WW9phZshgwc1+qusa4uk8xo6yF3rD7DysjvToVYGmcjOq92tJIQGtjbKDEFfEcRL4YMUf9PowG0a31Srl0jeonnJSMLJt/9MJDQ0AldcunJTNhYcLmMHToJP6eWKtPggvP+M3uPU6xsVXBwwzJdsFWygPHLHLA9mz8O6WRDW1CHQJzDTv5yJtMA/9jfdmjVYgaZuDrlRIsQdJwvMeGPJd5fdfswJ1AL81on+XcZ6Pwx5UJAUKprTTTudo5HD5GiDo1K4owcudCK959cr5yu34utMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(110136005)(38100700002)(26005)(107886003)(5660300002)(86362001)(956004)(2906002)(6512007)(1076003)(6666004)(316002)(8676002)(186003)(83380400001)(66476007)(4326008)(16526019)(66556008)(52116002)(38350700002)(921005)(7416002)(2616005)(8936002)(478600001)(6486002)(66946007)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M0xsnyCf5rcBQ7TkwE2TB5XkBMs3L/nO7EZ3tZkHxX1VVGSt1pjmIXa9TKyJ?=
 =?us-ascii?Q?qaQDwerfb/xbBQXzMHG73qtuLxAf4TkypuZWlTI0q8Z5J7Xt7AhyuHQPUBSk?=
 =?us-ascii?Q?exFzvyuerg78wqBKLa/UwP2s51JKCT3sgFXMmkNT0DMGe4Av1uJg337PTP8y?=
 =?us-ascii?Q?O3UysX3YVOw6y+q+uKACGbTt+SkU4mqD17+aBUAz/ASRRohMwzKMcddwwmqb?=
 =?us-ascii?Q?OzP4GimAuqV4B2YNHws6I/8wPNL0ERheb1imP0NL5lPeqjXfK9ZIFk5lk8Si?=
 =?us-ascii?Q?l6DDtFAOxXTgAerwrvOP/lH6AjeD8ea1uu4YbockThxJiGMHMP/TPZTK6ePB?=
 =?us-ascii?Q?OOMf7kgpj4hYQn+M9v9uao5qv9k4w6JhZH2G6/LGqV1OhsTqcYmUHsRXsaz+?=
 =?us-ascii?Q?o8CQnZvZZP6aeUshbAaoe7vch4q6FQ9NUtp+PCnV7ehrPPVzFVfWpSguF6ZY?=
 =?us-ascii?Q?muxQlmM2VcGn4AL9uWrIr80pAye+gSFH4UcOzgpMN8bJnLJIVK9RLBacZq4M?=
 =?us-ascii?Q?nJX3cobEEwnG52HsQic+ovJ5hGvX2oEvXyf/cy30+vpCf7Jz6zNojemj42KD?=
 =?us-ascii?Q?yDVkPYoSGZLcDBWvKccF5pe7u5emiiy7gW9foDjHXUM5b7J2POjKWROX7puL?=
 =?us-ascii?Q?XwVnYiVcgEDBM6cDi77ArnvoP4VQehJUPTH7gqNetVvRsO/wV4QKYOHF7zw8?=
 =?us-ascii?Q?/a2ryN4YTfWg3iorZUg7/mHZI5Q7gl3G92EZQnkuLVK8ZydjdYP8ciY1kYI2?=
 =?us-ascii?Q?A32H6Coqy2tSbNdV77860BnQc8riCLoh6+QGG/dWHpYHFP33+HiWiuH+wyVr?=
 =?us-ascii?Q?yMqC2hSFOLp/8QUDwEOrFp6o7eDtLSt+xBNsplvaMGqLdJzPmnirYTJgP3yO?=
 =?us-ascii?Q?Vdw8KgSEN9LmOGmW9uw52YWUfPX/yfumf8CBCXUdild9AnrbN+1GlhK2yX80?=
 =?us-ascii?Q?rHwK7USHSFnBJ0T66mw+4JlZepKK4XXMQ6OPQU8TBUE4NMkTnve74W08fzeq?=
 =?us-ascii?Q?s1eSysCpeJLJvOwj1C69ZeuvZGwHFYNYm5+UnZr1fb0DypkxvgmXXD4k38nV?=
 =?us-ascii?Q?E0zh72h1m4ASTvqlkqzGgzqbraz3eaveE87/W1QH8mah74Hs7BvKMyAwi2yu?=
 =?us-ascii?Q?usUF2o8PyqrOHmGOtXHSQ3fEWqmxFSh2ZU66QTycfgpd4VS413T6s7+TsQNT?=
 =?us-ascii?Q?xzNi0xnW+dcukkv8MpqCPnG++abo3MhiMAvklBJB9A83krhIWIoHyVG7D+CM?=
 =?us-ascii?Q?/g8+qLNf4EvfFuk+Oko5HoxFIAPFXKtJBQtdYrORK9TahtoJBAsOUXr0sW5d?=
 =?us-ascii?Q?p6evghcTQoERP66CZYisuPAL?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6257fa2-3e15-406a-15fa-08d9056e515b
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:09:22.2868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzqU6EJjqfwyS2nZ5DwcgNul7Y4XCachP0kmZ2VFJa7zhLi0msAXznWgdOcCIhVzNsQWWcchwVpzehfIGHooMZxual2UoKdI5ByEaY99Ins=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6356
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

