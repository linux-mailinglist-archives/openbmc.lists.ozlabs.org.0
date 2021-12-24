Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0347EB5E
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:23:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv7n1Mmyz305v
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:23:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=XXJFUdtx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.96;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=XXJFUdtx; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2096.outbound.protection.outlook.com [40.107.220.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyy6Tynz307C;
 Fri, 24 Dec 2021 15:15:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC/RauzfLNAT14NhqLUpHuLgKhNKu0wRXmGUggUdG160JbpSH3P5mf2yg31QoSyS3J1/hv5aQcU/WZ1o4kDwmpvtHKRB5WQxXhtqWXxIMKTpzdNhMNPlaTAqIJqfiQ8DI3FSQlOtW+kBg7/TFQwwg4+V8qV084DgvRMOYVcuoARpcvwFX+7TClQ2Bkwyx5VmcNtx+tIrR/8t6usxEYGFDTKEO6mYxMhoS6L8VZ3YmH81q8xBN2WraM0436QyX3zuC/PRAMj6KSfzLT/8Y6oLpV+OZqvKL/v2bmuV65rDfNfdU5CE9JADvwc/ni2/d3yEE5SG+Vun3OBopC7aLkRhFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s38IKSR2RFss8Paq83CL2kMZhmzdC/VFzoqi/vXv8JU=;
 b=ci0scw+5NeejBrQ7rx79YjFKonzOJet1jAY38tQ0+kR59tmA7D+/+rTcN3fapY5Va+mpVLbtmHQG+33BHQmYUiAm4qZOHmZJlG1B2/lGzzqzG8nNPTorKDg3HE+Cr1oftBOuMOCdEsh6vdhcKW5zg9leCudrJlV/SLOoVzaXWC6YCASPb7H+pKDUcQLSrvzSAuACHVga4AOD0jahRJc4c0RtztovFMpBbiDC6bUR/VfRTooCl65qYAbhGbL2UIWQqbBGPkDR01GuRAuwuxAIXirQTjIrs1Y5LQ9TlHLpl27LQGtadVYzgCZepuaGAeoNnxBT1ZiUuyIbzkHiHBGm9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s38IKSR2RFss8Paq83CL2kMZhmzdC/VFzoqi/vXv8JU=;
 b=XXJFUdtxjKNbkSBvOG0fFOKP9RYotOyO8HiiZy5aKR5MJ3mOH5HlMBB2wQbThdzOvdEDpin+LmYkCEc2qZYpfpvgswOBK06ycj6m++7PCTdxB9XjhxZ/KCME0udKcjxCvTt7x+RI9jvwpl4WnpKMMAFXl/vry48jk5O133sGwyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:41 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:41 +0000
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
Subject: [PATCH v6 9/9] docs: misc-devices: (smpro-misc) Add documentation
Date: Fri, 24 Dec 2021 11:13:52 +0700
Message-Id: <20211224041352.29405-10-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 756b32ae-3772-4052-bd5f-08d9c6940c52
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB5189D209238234FC89E35AC3F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RY6f11ZqOS08OYo5CWMvvsgoAxytNdUFFT4z+akDBPtVARt/vO7eUln0S+5VLy639TbBB29llq8jZpH+ieJsVDkuMRaodMKwHLzqZtAHZjvMOYdNHuz9wUEyo/JyhcU7NmicfexAE7Y6PwXt3f47PcaQGbDOMyEOEqGTmDMGBAjhKtOabCb93v3EegkA70Ks1Yha/p7iPnUCaEpvEMJOmzJFxyO1Lgwp6J2v5H9clJ47TXFhYprKRnjp72MKrXTuORTE7CGffe0FJLWbbf9U749HeL9OUDO+MxAxIw5HTX03Mv1YAoA0mZe6I1X263s9qrNNglF46WEpL0VmtygqsCQ2OHWNlO5dRuoW3Opatzxa4BcHF58XeZ7QMcLAwOfrPuaMWzG0o/dbSLLiTm5swV6kb1Eljmg4bkW7fm7oAkNNawy4pJDV3qcLJ1X9i5bWjO1rXEUdDXev9yHTI/vnqYV/9En5P40eGj4fQoR/OC9LPgb8SA27IS4jaYn4sCpgugdumZLCcUKgVwM41APvIRKuMH6Z7fI8Td2vdzQBPVnEUR9dYF5KShzdX9jQzIacGQUAWeRhNtVzWsZnxuXFjYgc96er/j9h5JdWhqyIh9CLscdCB5JvcRt4dGGDPTD0/t4o3KX3kFp/CyCa3FrhQ2RY/RT/yZaivjIMRCMEitHLtPvbx90elOzBSrCkNyMkYUIyRdfRK5SqS1MGhHb40ntVv7KeJtEOrAJQclpzM1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?awYqxjEsgevOTpb8EMeqo7BGpqGSmeMyS0LTSHnvBzPRZfGecrUWIKTK1FU+?=
 =?us-ascii?Q?oYZpNgwgpaZqKBpxWA83SrHuIuvVOirSDno2vdIwxLcDJO7qgMvOVjpZwvt1?=
 =?us-ascii?Q?IetXyqkNr1b/kUps8PECAVt9Mc5m/ygApqUccWhIfkYkDyGEeKiZLXOnUVoc?=
 =?us-ascii?Q?8XtBXcFgm2xP+uBBq0Sr7IZQK9i3HG5pVadBDK0RPYGOVC18z5Jhd4t9KyLw?=
 =?us-ascii?Q?+OkzPlXs21lOH050JPh8HF4K2/GhRW3Zpk6ukf7afbCMSPuUlNcFOujWjjwf?=
 =?us-ascii?Q?qdopBaFfh3IejqAbw/Ay8yeEdkPg124n1wgInaDlxJ9/ZxKDtsVJH8aMWBka?=
 =?us-ascii?Q?9KNjwDZIrI7GlepR6pQ6bkqsIAT5qkujXAZf9VwnwfSb9YZpnnIDEkf9px+K?=
 =?us-ascii?Q?jf86KWiiQQYiVIM9EI/nETBv8Q5UW5y/2YSZXD3WCjdu6TFWz8uNpqpLGsaj?=
 =?us-ascii?Q?Ttn7h6VlcLmqd1NZR9B5WebqmEe8+gNSpLgi9VHhqP96BT/JP92uEcAW1XKA?=
 =?us-ascii?Q?ptfFCeuhgkNuno8jVfpbp1ejFflL4SdubApqM0NAP0506EmADshumj03kAf7?=
 =?us-ascii?Q?xBz2MEpo3oNSDb7uah/vHjqpF+3QjyWDtuKxFUg4R6TlAH/Ef9NARbm0t1xq?=
 =?us-ascii?Q?W+aZfCZqrUM4EPivvS0sbEn5u0dlmVyEty7bBdDliUFaMSg+z5TUcjNsBk+B?=
 =?us-ascii?Q?M4B1w3pcypvd258vct1gqXo36w+879c/ve0uBuysXiih18ykqLM1xvLkcVVt?=
 =?us-ascii?Q?Cdde/cCES5klkd/6U96ZrJeuD072G/+CJYdKbRhb0vC/KtjCR4k7aI694dda?=
 =?us-ascii?Q?9SFsZToPSPWUKCX/FQPuOlEEmWvePfB5J4GZ82dR+HlnIQTw2Hc6aSMIJ0kO?=
 =?us-ascii?Q?j1WKUwGRNVk+gp+GNIlQ5k/FPgSpcLYCcrJPW/2yuNGz1TCj8OP6jL3QWo7k?=
 =?us-ascii?Q?zVE9FcKPu9jggGXhrIlFgoEJaMVZ8EmhFuAbSz0xxFjkyyI+oxApoEybMnLb?=
 =?us-ascii?Q?ohoNVp9+dYuDEP1PBeZW3yjvXm7JPouydOyCcj/zsAlmM05pYZxdA/Lfs/SM?=
 =?us-ascii?Q?sNlsKcMhx+6dYcowraPnIoBFrb9TXq9u9h37BBD7G7q/bg0SOTd4RxkFlZLN?=
 =?us-ascii?Q?YHuN2K3p/UlnPHscuvvCFV1TQPE7o2Rm2EaU1G4BqgNKfS/0Wr64WdJm173r?=
 =?us-ascii?Q?hAO/bN26hMAiSt17g/zeYkXQzhmsgzwMUT5e01nSsaqF1Oj779qySR/3wx6Z?=
 =?us-ascii?Q?37qdtDzTUrYh+IbvI12jh+ylatJhzttLLUqMvJvFOY9Ie0GHp3q5OUpT0nV+?=
 =?us-ascii?Q?93Kvv+zt4HT5iar6IQQ8FAWMbzeD9tRAATc4G/qF5oy92ULOdsuvTiTxVq7t?=
 =?us-ascii?Q?D9to7nXq73GEPvA2h95F2Ugt5gvE7NEtGIy3ow0lIAM/q5pW6xl0SRAxBplP?=
 =?us-ascii?Q?CpnYPM0WsypP2s02wEa+3u5A/yZnJUa1swcdknJK916CO446RB+203w4epnz?=
 =?us-ascii?Q?6/hhHZnbCSBXuByZOd+Ljz1dS5A6R5b98e25zOVogQohHxdTJNOhKg0Dratr?=
 =?us-ascii?Q?2aXtAwKiz1kR5CyoLcC56qJdUXkoo0HNAyvsXYaZdoRToEFwQmliZYbS2pXA?=
 =?us-ascii?Q?i+dlNF80VCrEy5cXrvCbJ42HZlrMqCeo7nnklMl1EBoaAVKPSbQbu9Gb/w3l?=
 =?us-ascii?Q?pl2AMm7uAMKa0zLVysWibxU2FL0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756b32ae-3772-4052-bd5f-08d9c6940c52
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:41.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FC68NAzdgdt3YQzQDDjmNG8MaVWhSyUwCAj6qIfJnYSC7fjtrlt8ieZRZbOY6c7NcwF2mScJ88vJK3UnGLv/8JjYHzaYwBJXVku2ooP+IfU=
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

Adds documentation for the Ampere(R)'s Altra(R) SMpro misc driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Change in v6:
  + First introduced in v6 [Quan]

 Documentation/misc-devices/index.rst      |  1 +
 Documentation/misc-devices/smpro-misc.rst | 82 +++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 Documentation/misc-devices/smpro-misc.rst

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 7a6a6263cbab..284568eca747 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -27,6 +27,7 @@ fit into other categories.
    max6875
    pci-endpoint-test
    smpro-errmon
+   smpro-misc
    spear-pcie-gadget
    uacce
    xilinx_sdfec
diff --git a/Documentation/misc-devices/smpro-misc.rst b/Documentation/misc-devices/smpro-misc.rst
new file mode 100644
index 000000000000..7c856eb1a7f3
--- /dev/null
+++ b/Documentation/misc-devices/smpro-misc.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
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
+<boot stage> <boot status> <boot progress>
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
+    0x01 0x02 0x808454A8
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
2.28.0

