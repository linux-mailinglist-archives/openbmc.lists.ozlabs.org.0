Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407635EF29D
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT8z5gK2z3bxp
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:49:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=k2si6vyK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.125; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=k2si6vyK;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2125.outbound.protection.outlook.com [40.107.94.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3F36xnz3c6K
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9xDSoZXcKoE8Q6W71d4RoYRsuYK89FLyy3iJEJjzXcntH1ncw2DQ4+7pty/0k0tXvJm7yZqcPvZo+Xhtpud/PI3YGxI6njuFRDHE1o+C5zjeYTGq7iai/aB3HdrF5U30sgk2RVMbBIJ7C0gbkikymCLS7Wg1sYD8XEvFjXKWICJwtaX0bAJ2hKodF6jx+4ETk+bXi22qjCibha83kKTFa8Yb0/lgicuBvpYvnkqXqzRojT6GUmn0dM1vyUtrtgya3LdN98U7IrsWl29oZT+XF0r/lC9uvMeVOrXxZ+BB5rAGuBdrXO23XJ7AaczjvY/4Y8HJjEAWL0cQ/aJLMY1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvER1QptHrDi9CZrnYx+sa9GYAX7FsotnibH1e/FLbA=;
 b=VQ4Jf4QWsHniQ/LQBvkQHLjl7LdHLAj+Ok70GkV95xhxIcmiw1++qaeFhDZFrLYN9i7eym9lmTEw8WoCMH0Yf3rylNwEZzLqCR6tUy0TkbKiN5imZeZBuGChK5+IJtLfshHqiQhMJ2lcbl6r+Te/FmXPBzL5QfEX0vCqlpOuD6rfXHbdP+p2wH3/r4P/lRgn2FaVBRDd1FxLAm2k4UTU6/FsMPBaTYyUd3I8STM74BF0tlppzFsfDMa/P/MRc2Ej9ioluhq5vwucaXyOwB7VVUScaxnvLDSgH0ZE1ZXekNfgjeF/vSkXuJ/+8foJX0qK8njm7UwmgjYMkID1EnvMgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvER1QptHrDi9CZrnYx+sa9GYAX7FsotnibH1e/FLbA=;
 b=k2si6vyK5USLz3HzYrdtEsgtWTgXKXovt4K+MUBbYmxvgrsQldw/a5n/yEE/eoFAmt5sjNzIif904KvD6oedb3NLeQJ7QroyN1LrdssaMik4xcBvKpPTnT8Abr43VZirDYwM3Pk/AgoRPLoRE5+mtI5N5VSSHOZZWm7OwJOIhm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4798.prod.exchangelabs.com (2603:10b6:805:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:18 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:18 +0000
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
Subject: [PATCH v9 6/9] docs: misc-devices: (smpro-misc) Add documentation
Date: Thu, 29 Sep 2022 16:43:18 +0700
Message-Id: <20220929094321.770125-7-quan@os.amperecomputing.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|SN6PR01MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ac40aac-b81d-433e-274b-08daa1ff2ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Tm1VM2VftdKoMbYtFWIa6kfKd0k9CU4cRfFpZD3DLDxXkCSW04H4ePbCCgp34r751TB+hevpWPbGsnb/UxUCjwo0T1+IXZGsE/5qbiT/Y9thMsndXbtTmLTzS1w1t5X64xOgncaBA6+p3xVT0UkvW6oUchVSM54uyuqik/JxrPAdGMP9Ci9Xn58xfERC7NegwGR6ktugyTkROkyg4yrFis84V7pNYUlaaO422JOKkc/u4LeniQ8RXEVGweAJ13tkypilGbFNA+JioNiPBSj+7tRcZM5SiwAqF1uBC2wo9+vjSHHoYgQEGQFECalL7UQcRLVZuxAsAfKhe1nvkZ1+9QQPlGuJ8Ih6VxcIUBFnAXqJy1ZZfSRZlgoBiQh7ToXZUrjAFvZbe+VFgPW3YZhRWnC/VESPk7Azm1Gq0API//Shl8XokRiBfawxA0vFCv4dDbfvAxf6CysioJdYPBeZfJnD1MUAjetuX30U/1oklQ0OdJQuYRfB7IWkIVygVzEwHV6nCl813fT0oM9Prkfb4CAzeDAQCfWPeFivMZrhivQovtpgaoD1gZT+CNYdg8bzuQGzlFfcmoOWmyXpUXYWoaAzQG0V8nAP2AtFJdbLdx/QmsgLVzHbZdo2sAZkJO70kSIiIMU9nfibd63sh1/3z+8KUdilKx87OaVjo7I1tEyMFc1NCQ6NwsBfZtUui1123Hh0uLrmyVmUolg8l7Th92VQe3Xu2LlTmAKjLsRch8AYpLxZgkiUVvKbGVwuvYKj4f+TwzS+QHVuN1xJLF47W2qR2zhW4YciJ1zjbW93Hec=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199015)(921005)(66476007)(66946007)(66556008)(8676002)(4326008)(83380400001)(110136005)(478600001)(6512007)(6506007)(2906002)(26005)(52116002)(41300700001)(316002)(38350700002)(38100700002)(86362001)(8936002)(6486002)(1076003)(107886003)(5660300002)(2616005)(7416002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1VPApfgMHe/81+8JrDCcNuOfDBT+gdCDBt4SRZK4e2OEBQ+YeY9YXaMxbMtE?=
 =?us-ascii?Q?5yjTsQqI1hImngwkBjmk11Ljuq6eCxbp/ZZuqsKoGviI2Tfgl3sHywE3AWr3?=
 =?us-ascii?Q?rIcydKng7e2TRWZBFGj0W5SgPsgALXP4ToEds++AAhxv7UFGlbL9d20EnTRC?=
 =?us-ascii?Q?lWsNKmeDPEVUmWesGvBe1yHvMBXgNe/As9Oo+c4P4xJtzpWancZB0nAw3A78?=
 =?us-ascii?Q?2Jo22ih4Hd6inB+khcOgn2+xZYm5E4QqWPWTbABrUQ5L0SG0RXG2LbRNxUfO?=
 =?us-ascii?Q?bC0q7lRoMQmX6PGrHGRzD15oN5asbla/tgDA8YtoKkYpRJEN8darTN/BwO3x?=
 =?us-ascii?Q?XGKWrAY1SGNKmrGaXnBf/002maT+6dOA7OqTo/YNq1lMXWvTJP+NUsNPKLaX?=
 =?us-ascii?Q?vHTIwuPqSw6qxpuTFBohADPYyi8RwaDkyPi3BJIQsYmNLIuj6n7mcFkk2PSJ?=
 =?us-ascii?Q?uQ8nCSyqi9xGC90x7GT1U39OqBnzQAJeIfj8vZfYFOnnzZ8ZfvBwRSbHbYVe?=
 =?us-ascii?Q?gVld/ZMcgo0dh6VdYVWgklSAjtQls/R632w+taGkIc/d3jMIOBzsMHxu9uiG?=
 =?us-ascii?Q?Ykvh9YWEm+FwgQy7XgtIwu5KiqxmRJvZekQAsdMT/CzFsLm/RKmlrCpeMJq8?=
 =?us-ascii?Q?XR/vIKCAvr2qYewA7+oQ/CVATqwZND7WoLJJcrRlHN+LVoh8tTaSl3coCvAA?=
 =?us-ascii?Q?Is1ZaLr0jdGXNrn67HOdqwOO73QWaJPue4dhn913adGPMmb12hYtUiIB7fIt?=
 =?us-ascii?Q?5UhKBaZLTgOas1I6Y8G5/sB3fviGK4tvRPbGZE941nu64iPYASCLa6Cm0UMr?=
 =?us-ascii?Q?j8Pr4266sejf+/liOqeiYWu5MWyLbHqnvbSKsC0TxWZeB8GHk9KOAcNasLq0?=
 =?us-ascii?Q?a7gCWINJkZEVeRfjj8kASbWtSTbRKYD08UW232yNTZ500C+talTjGDxk3QWc?=
 =?us-ascii?Q?StxrLq6BU9/Q+/GUhqiBxXln/fU0L5E/skcVj4oIT6UmmmyFmnxg+27jqmL0?=
 =?us-ascii?Q?fsTFhTRV6bnRaky6hzLnTZ2uYVRWs4Tltb2zRGx2dq/4uG/rV3fTE9gGQ/k/?=
 =?us-ascii?Q?glJ61YNnGHqfl49mfD7Ysvt3gKHP59MRNZPYIPUFmnStJeSdvNnPG8dtFDfp?=
 =?us-ascii?Q?p911+5FsY9QHsTNxR5E0rtrkdlMoGsAg4kmUwWdYSrHbQmioFsu/8YgbU9J7?=
 =?us-ascii?Q?PFMnKZDr+dxD5CvnQPNLIqttImLJ2c/kjg4cC5sS7pO74XyvMNx7z/iQwuSo?=
 =?us-ascii?Q?VZLOU0LcLgsl5yFNSJf5LszPB6YIy3mf0FziQldWY0s3WCJAExW1b6FIIMfz?=
 =?us-ascii?Q?yZJh8ADwD+QhMb05Ytoox40IkmnzKbwgwLl+FxHLXB+sKOZgyhulNV3OZuJ7?=
 =?us-ascii?Q?tlwzo2m4w9hX3e2MqD7joU5h7JtintvRtt1PqJe8ocpKRY2JN5P4GWKjzfQN?=
 =?us-ascii?Q?CwdMDVL3/sTDTshybbErLd8WY4B70UX7TluhVy9YnId0ElZyPDgChOry4xyS?=
 =?us-ascii?Q?78wYgs/dtdq2rFQnC1UNEQJGZlvjECFoY/pBwkv89bNIAhpOm2hfnX+hDljH?=
 =?us-ascii?Q?lz7C9HIp4GxSEt/IlBJRP7GKR/JZ6XL5h/AYi7GzuTZfLFqBB9V1WWl1mYsq?=
 =?us-ascii?Q?H2StBgijd5ZlZud/AHAsexc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac40aac-b81d-433e-274b-08daa1ff2ddd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:18.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72HQDg9hEVgf8Ba9SmKSyR6ht0GfMAmnRcHMr4N3kN13YYvD9fPnmOzVd7effT08l8Np8JnFFlcQ+Xc2IVyB8UT8LShonTcI0AXo5nGpWWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4798
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

Adds documentation for the Ampere(R)'s Altra(R) SMpro misc driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v9:
  + Update SPDX licence                          [Greg]

Changes in v8:
  + Update to reflect single value per sysfs     [Quan]

Changes in v7:
  + None

Changes in v6:
  + First introduced in v6 [Quan]

 Documentation/misc-devices/index.rst      |  1 +
 Documentation/misc-devices/smpro-misc.rst | 82 +++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/misc-devices/smpro-misc.rst

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index b74b3b34a235..b40cd1b402f7 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -28,6 +28,7 @@ fit into other categories.
    oxsemi-tornado
    pci-endpoint-test
    smpro-errmon
+   smpro-misc
    spear-pcie-gadget
    uacce
    xilinx_sdfec
diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc-devices/smpro-misc.rst
new file mode 100644
index 000000000000..d21be4a09e69
--- /dev/null
+++ b/Documentation/misc-devices/smpro-misc.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver Ampere(R) Altra(R) SMpro miscellaneous
+====================================================
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
+
+This driver support the monitoring and configuration of various miscellaneous
+data provided by Ampere(R) Altra(R) SMpro processor.
+At this time, these include:
+
+  * Reading Boot Progress information
+  * Configuring SoC Power Limit
+
+Sysfs entries
+-------------
+
+1) Boot progress
+
+SMpro misc driver creates the sysfs files ``boot_progress``.
+The format of ``boot_progress`` file is as below::
+
+<boot stage><boot status><boot progress>
+
+Where:
+
+* Boot stage::
+
+    0: SMpro firmware booting.
+    1: PMpro firmware booting.
+    2: ATF BL1 firmware booting.
+    3: DDR initialization.
+    4: DDR training report status.
+    5: ATF BL2 firmware booting.
+    6: ATF BL31 firmware booting.
+    7: ATF BL32 firmware booting.
+    8: UEFI firmware booting.
+    9: OS booting.
+
+* Boot status::
+
+    0: Not started.
+    1: Started.
+    2: Complete without error.
+    3: Failure.
+
+* boot progress: 32 bits boot progress code
+
+The sysfs ``boot_progress`` only reports the boot state when the host is booting.
+If the host is already booted, it returns latest state.
+
+Example::
+
+    #cat boot_progress
+    0102808454A8
+
+2) SoC Power Limit
+
+SMpro misc driver creates the sysfs file ``soc_power_limit`` to get/set the SoC Power Limit.
+
+Reading this sysfs return the current setting of SoC Power Limit (W) in decimal string.
+Writing the desired value in decimal string to set the SoC Power Limit in Watt (W).
+The range of SoC Power Limit is 90-500(W) and will be ignored if out of range.
+
+Example::
+
+    #cat soc_power_limit
+    90
+    #echo 95 > soc_power_limit
+    #cat soc_power_limit
+    95
-- 
2.35.1

