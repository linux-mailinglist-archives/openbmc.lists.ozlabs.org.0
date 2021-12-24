Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4447EB58
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:21:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKv5c5PwQz3bY9
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:21:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CtACp87C;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.93;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=CtACp87C; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2093.outbound.protection.outlook.com [40.107.220.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKtyW23vTz30Qx;
 Fri, 24 Dec 2021 15:15:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjJ8Y94P8zNzPHwEKl1TSx/G/a3IU1gNhuwg6NSMNucnY7EGKhMcnS+txnfjq7bUbmEJFoc9djVwkxNhajHTTFhxhwwigDwdGJdwyTSfaq5fmq1Ru3irp4/BomXhPxhTAyUALXG2HX2oSAqz/gTZ9Pc3EN3Q1Z03IzfdmUgRcfAxyDwkot4f7n9d1FnzejDX1Luc80geZzPnTJ2h1L4nVJASPqgupPJzKu64b1QJEbEfCvIgb1jW5RneuMG3toWQ84nioj9RGsZiTMOsGSgm74VLYz/XtlMF6Ya/7o9LVmYUhJksF3THQghxaO171BHFTCZnnzNwMYxLPG7xmsGYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XRBSIudnNo5ZBP5/WFVqdLLKajOa7RM40koBifDgVc=;
 b=Bu9lrq1EAZQowc5OTqi7lYOx9m9Bo2e6yVRic0FSb5kaS0uLaMZuhk63nu8flQYX1KRB4uGMtLkq/xnINFAfCMmFtwb4GbgufDVV8ZgvvaNnNAt3vxXMaiYU31EuYrmP+xGLJzJnRnItRLC97BicM+iLKI9b6lwqmRAT1qb4QCE7ejK4LmkbzPGhFHbbRQd2AM7REQrS3CICXoXeGUFJD90GaAWHBw4FHfgItaxKYDPFiWKQg2X46nX+jcovpW4tDtr9Api1+sIocJLzvVEjBSBl10oyffjmvG+L9bxfLZvpRgF4BW8PLcqVmX+Xsdi1ZNxilGnco8dR4tGsWi2F1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XRBSIudnNo5ZBP5/WFVqdLLKajOa7RM40koBifDgVc=;
 b=CtACp87CgfudwVAz7vXE2HlEljclEmjLtT5jBUF+4PFTs69MFCGQ92PwE0kiUUv56RCzmJFhpKt0kg56F1WtOCMgFVpbwNSZQXcrz49RG+Ov/uosQmU+tLvKl1dYVQXk1Lj1w2QKGS7xbRr0mBMNVT32+MsBrrZphBkJfb2sp30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:15:29 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:15:29 +0000
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
Subject: [PATCH v6 7/9] docs: misc-devices: (smpro-errmon) Add documentation
Date: Fri, 24 Dec 2021 11:13:50 +0700
Message-Id: <20211224041352.29405-8-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 478aaae3-43ac-4912-6a09-08d9c6940510
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB5189ECBEF7669DCA63D9B55BF27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzVxJRvcgS50uregaRH2+t+aLctdFztuLgDYdlDZ35yBEXHMbFenh4DRo1I8kSNE1XiyD0XIoslaIW/M33roj0vsdoNQsCkxpewzflYmDoV7dMs6nIft3eAoQq0Oi5fyirJE3MZiT8N9rxv386s3kRmqD3P3PjJdffVfPAZ0d/NSI2d4EmJvnYp5iYIkVhePTADXN80ZhJXABqszBZTv8iRPubkQZaSQdS0a9yPYwhjvOuWLpuAd+l8F8INJ3h3GZJ9CbEXxEdRXm8IxuazjoEZLeJt0zjnIer39aXqm9BInb9lK0nJweLQaefbkHd3pIZiJLZNM7a+xMnZgQyKhJV2vrv2zMNW00U13mBc3+zN/5xD5dWyK82JtB+hssqbyiGM6AG3oACYlGJNB/y40mCGd2ciu08QrJSQBegfsqWw7Pcr1iu02G24Ecc2zO9BorcC1Emq3yvq5o4kShWR2F+7NmkNskNFlJsIlxg0cyHezzPTkgP3W/DLQeg3naOGa6jeVzTkON+9/TsOcM/Y/nFwenKRgeVTV/3F23UQgB96aqO9xNO7Z3SHdwHPwdBuwS7gClPW9lCW74LP9s70menBcHrQan6owq2twFVgI6WjLKhiMpTP/VGgdiSG7NkwFOHW5gM06/tMzYhWIEeglXAxrd4HALVmucaK2AhL5wb0WcRj/l0QBECan3yDsa4rr4F88GSwGB/l/0g/pVneFrDJE14lt1ZbGFRc2K6aJiHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YNwdHi9deINffalroAnUgOVsQbVcamQq49kXyFCgxy8+crubrABHHq/l8w+q?=
 =?us-ascii?Q?BWH3/2/SQxOkxtX87JFEi/T+Yj58CAnTuKWvj29OWdHiK8jgdtSoaBt5i/g9?=
 =?us-ascii?Q?MbPneExTbtbo+P1cRpNn/XBazR/kQAu8doncBTlf6icqtM2g0iFiMf24Q6qt?=
 =?us-ascii?Q?y0KDMTGvHndCdLbmLt6YosAA2pfqozGpuCOOufx5S/ZyswLl8MtLPiHHs1/m?=
 =?us-ascii?Q?JJwm/2nGXJwTSGP0OIjKYjBjV/3gG169c5RqAct5gXdkYO8KgEy5ng2sNOLn?=
 =?us-ascii?Q?1CiBAmCY+F2VnscbFDp5utgiFuK7DphujHTFM7Ysr2QrR7b5g5CRvphQ5t/9?=
 =?us-ascii?Q?oFiLz+N1e/JHAS4ZXCDe/QTukwNz3fzXz6TEPaepB/KUHWtSSKxjWQMBcwNm?=
 =?us-ascii?Q?hbkCuecDPRSWLuaNV+3F2O7rSIT4zEgfuso+1laNXPz4ixckeiHiJf9YDEb0?=
 =?us-ascii?Q?GB2ByQf2ZoiwDhWqKxw71Oocw3E0Rbc7ZrDhKOYO01mSvkn8NxiO2JAKuVho?=
 =?us-ascii?Q?ml9m5GPBWWfg/Cvac73VS14mtCDpIt6zUkVt+Bji6S1zcyY/v33ohorXbaoh?=
 =?us-ascii?Q?bEU4rV03cvmKfoxKpWy8wnTLuyKcnTVFSVUJoOZd1PDWvekcPvm5dxFzAjVP?=
 =?us-ascii?Q?lf+VuIKWFQbQv309gZ8rc6jB28L7oH1zLZwylbMIW7/E/OtMy1SJWI/jX/Hw?=
 =?us-ascii?Q?b1uxSQ/0XyRsWmReWn+Qth5hxNCwddQBX0b3C1BsDR1eDdPXTxEFPvZS4qbk?=
 =?us-ascii?Q?HPb6hXlrEgZ5eyvfn5oiYsOpy9STUri+FVUhv3vXJzVqPR0j2zH9QRwewxm9?=
 =?us-ascii?Q?5EyH7LuRwZA/vAJrWlk0u/Vftzb8UfZZyaEfdTF1QV7RpZQgwbKS7YxOKTfG?=
 =?us-ascii?Q?u0nAiepKZpmVZePN2FajlEviMyg52HT+a76eTVET28L88g326Sq7NOGiji8+?=
 =?us-ascii?Q?1ffKW7qgvsgMdyWsR4iCAJa924g2PJWTocClFtm1RW0HMrIWWGYMJmid1IsF?=
 =?us-ascii?Q?nlRP8/1OKj5GCnkJ5waWtqySZTg7c3EIF2BI1PlUIxp0nimrQ+CM87q+ENmB?=
 =?us-ascii?Q?duFBTIzy42n8E3jaxJoaKlc+YFQEJvVcxVq7glCXSRCQoGn4u1heLv53mIqQ?=
 =?us-ascii?Q?BNfs4ExXLcZyuHM5Kta1JjgQNaUQmu0gOfE9FGEIeb3iUMEt1kIpypSnmvRp?=
 =?us-ascii?Q?U9lzgbMVEs9TBBRv8jYR3a6RqgAiBhzvvpa/vsat0zDRyhXnmMWobQtWCxRW?=
 =?us-ascii?Q?08f0+coC+bCXlkx+o+9crZtmtFBVqShzM5NzWawRYMPF2UfslUv2KOQrQxQU?=
 =?us-ascii?Q?F2ayHp88VOG2VpTq1tYLQwfK9wp0rFJJfw4Sh0RraW0aB/pJ0JwK/n1Y7PLl?=
 =?us-ascii?Q?L2O1FtwsstguvC3iOs+Vn4a+/4EAXn/MOjNUlmxTTZJTpziVKZuZ6rtUAyWn?=
 =?us-ascii?Q?gFYpaVz91eH4unHsvykC5eDsDVzjEtXwNbJW9fH28u9uixFXmSDEHve/Gx29?=
 =?us-ascii?Q?Dw/5Vqr3XGzydFbtB0MI/76YfjvUDX3bEvVHxG/jjSK8FSU+pxW1ShBV4stJ?=
 =?us-ascii?Q?fqWlljO+zeisfCHVrs8vrqfq+Gv96MzWf+R4klDc2tjTC5xuodn3mI2PDFPJ?=
 =?us-ascii?Q?v2ZCBMMB3u5c4mK5LQa5QNnJJJQdm8TQ2twi/ofOltjoH/eJgad02Dboc4uZ?=
 =?us-ascii?Q?zzfnnXygFHwNYdYxOKOQwrLKXxU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478aaae3-43ac-4912-6a09-08d9c6940510
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:15:29.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q5+/TE9zzfwkZ9hoBr6xFCZ3a8Wc+RKiqRq0QYzxcsz+XrZlJBu9Ucd7QG/vaBEoCrzW3rp0Ey5fQuxobtnvQNtcahNmOwzU8ciKg/zLc4=
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

Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Change in v6:
  + First introduced in v6 [Quan]

 Documentation/misc-devices/index.rst        |   1 +
 Documentation/misc-devices/smpro-errmon.rst | 206 ++++++++++++++++++++
 2 files changed, 207 insertions(+)
 create mode 100644 Documentation/misc-devices/smpro-errmon.rst

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 30ac58f81901..7a6a6263cbab 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -26,6 +26,7 @@ fit into other categories.
    lis3lv02d
    max6875
    pci-endpoint-test
+   smpro-errmon
    spear-pcie-gadget
    uacce
    xilinx_sdfec
diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/misc-devices/smpro-errmon.rst
new file mode 100644
index 000000000000..e05d19412c07
--- /dev/null
+++ b/Documentation/misc-devices/smpro-errmon.rst
@@ -0,0 +1,206 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver Ampere(R)'s Altra(R) SMpro errmon
+===============================================
+
+Supported chips:
+
+  * Ampere(R) Altra(R)
+
+    Prefix: 'smpro'
+
+    Preference: Altra SoC BMC Interface Specification
+
+Author: Thu Nguyen <thu@os.amperecomputing.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
+SMpro co-processor (SMpro).
+The following SoC alert/event types are supported by the errmon driver:
+
+* Core CE/UE errors
+* Memory CE/UE errors
+* PCIe CE/UE errors
+* Other CE/UE errors
+* Internal SMpro/PMpro errors
+* VRD hot
+* VRD warn/fault
+* DIMM Hot
+* DIMM 2x refresh rate
+
+The SMpro interface provides the registers to query the status of the SoC alerts/events
+and their data and export to userspace by this driver.
+
+Usage Notes
+-----------
+
+SMpro errmon driver creates the sysfs files for each host alert/event type.
+Example: ``errors_core_ce`` to get Core CE error type.
+
+To get a host alert/event type, the user will read the corresponding sysfs file.
+
+* If the alert/event is absented, the sysfs file returns empty.
+* If the alerts/events are presented, the existing alerts/events will be reported as the error lines.
+
+The format of the error lines is defended on the alert/event type.
+
+1) Type 1 for Core/Memory/PCIe/Other CE/UE alert types::
+
+    <Error Type> <Error SubType> <Instance> <Error Status> <Error Address> <Error Misc 0> <Error Misc 1> <Error Misc2> <Error Misc 3>
+
+    Where:
+    * Error Type: The hardwares cause the errors in format of two hex characters.
+    * SubType: Sub type of error in the specified hardware error in format of two hex characters.
+    * Instance: Combination of the socket, channel, slot cause the error in format of four hex characters.
+    * Error Status: Encode of error status in format of eight hex characters.
+    * Error Address: The address in device causes the errors in format of sixteen hex characters.
+    * Error Misc 0/1/2/3: Addition info about the errors. Each field is in format of sixteen hex characters.
+
+    Example:
+    # cat errors_other_ce
+    0a 02 0000 000030e4 0000000000000080 0000020000000000 0000000000000000 0000000000000000 0000000000000000
+    0a 01 0000 000030e4 0000000000000080 0000020000000000 0000000000000000 0000000000000000 0000000000000000
+
+    The size of the alert buffer for this error type is 8 alerts.
+    When the buffer is overflowed, the errmon driver will be added the overflowed alert line to sysfs output.
+
+    ff ff 0000 00000000 0000000000000080 0000000000000000 0000000000000000 0000000000000000 0000000000000000
+
+Below table defines the value of Error types, Sub Types, Sub component and instance:
+
+    ============   ==========    =========   ===============  ================
+    Error Group    Error Type    Sub type    Sub component    Instance
+    CPM            0             0           Snoop-Logic      CPM #
+    CPM            0             2           Armv8 Core 1     CPM #
+    MCU            1             1           ERR1             MCU # | SLOT << 11
+    MCU            1             2           ERR2             MCU # | SLOT << 11
+    MCU            1             3           ERR3             MCU #
+    MCU            1             4           ERR4             MCU #
+    MCU            1             5           ERR5             MCU #
+    MCU            1             6           ERR6             MCU #
+    MCU            1             7           Link Error       MCU #
+    Mesh           2             0           Cross Point      X | (Y << 5) | NS <<11
+    Mesh           2             1           Home Node(IO)    X | (Y << 5) | NS <<11
+    Mesh           2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
+    Mesh           2             4           CCIX Node        X | (Y << 5) | NS <<11
+    2P Link        3             0           N/A              Altra 2P Link #
+    GIC            5             0           ERR0             0
+    GIC            5             1           ERR1             0
+    GIC            5             2           ERR2             0
+    GIC            5             3           ERR3             0
+    GIC            5             4           ERR4             0
+    GIC            5             5           ERR5             0
+    GIC            5             6           ERR6             0
+    GIC            5             7           ERR7             0
+    GIC            5             8           ERR8             0
+    GIC            5             9           ERR9             0
+    GIC            5             10          ERR10            0
+    GIC            5             11          ERR11            0
+    GIC            5             12          ERR12            0
+    GIC            5             13-21       ERR13            RC# + 1
+    SMMU           6             TCU         100              RC #
+    SMMU           6             TBU0        0                RC #
+    SMMU           6             TBU1        1                RC #
+    SMMU           6             TBU2        2                RC #
+    SMMU           6             TBU3        3                RC #
+    SMMU           6             TBU4        4                RC #
+    SMMU           6             TBU5        5                RC #
+    SMMU           6             TBU6        6                RC #
+    SMMU           6             TBU7        7                RC #
+    SMMU           6             TBU8        8                RC #
+    SMMU           6             TBU9        9                RC #
+    PCIe AER       7             Root        0                RC #
+    PCIe AER       7             Device      1                RC #
+    PCIe RC        8             RCA HB      0                RC #
+    PCIe RC        8             RCB HB      1                RC #
+    PCIe RC        8             RASDP       8                RC #
+    OCM            9             ERR0        0                0
+    OCM            9             ERR1        1                0
+    OCM            9             ERR2        2                0
+    SMpro          10            ERR0        0                0
+    SMpro          10            ERR1        1                0
+    SMpro          10            MPA_ERR     2                0
+    PMpro          11            ERR0        0                0
+    PMpro          11            ERR1        1                0
+    PMpro          11            MPA_ERR     2                0
+    =============  ==========    =========   ===============  ================
+
+
+2) Type 2 for the Internal SMpro/PMpro alert types::
+
+    <Error Type> <Error SubType> <Direction> <Error Location> <Error Code> <Error Data>
+
+    Where:
+    * Error Type: SMpro/PMpro Error types in format of two hex characters.
+      + 1: Warning
+      + 2: Error
+      + 4: Error with data
+    * Error SubType: SMpro/PMpro Image Code in format of two hex characters.
+    * Direction: Direction in format of two hex characters.
+      + 0: Enter
+      + 1: Exit
+    * Error Location: SMpro/PMpro Module Location code in format of two hex characters.
+    * Error Code: SMpro/PMpro Error code in format of four hex characters.
+    * Error Data: Extensive datae in format of eight hex characters.
+      All bits are 0 when Error Type is warning or error.
+
+    Example:
+    # cat errors_smpro
+    01 04 01 08 0035 00000000
+
+3) Type 3 for the VRD hot, VRD /warn/fault, DIMM Hot, DIMM 2x refresh rate event::
+
+    <Event Type> <Event SubType> <Direction> <Event Location> [Event Data]
+
+    Where:
+    * Event Type: event type in format of two hex characters.
+    * Event SubType: event sub type in format of two hex characters.
+    * Direction: Direction in format of two hex characters.
+      + 0: Asserted
+      + 1: De-asserted
+    * Event Location: The index of component cause the alert in format of two hex characters.
+    * Event Data: Extensive data if have in format of four hex characters.
+
+    Example:
+    #cat event_vr_hot
+    00 02 00 00 -> /* DIMM VRD hot event is asserted at channel 0 */
+    00 02 01 00 -> /* DIMM VRD hot event is de-asserted at channel 0 */
+    00 01 00 03 -> /* Core VRD hot event is asserted at channel 3 */
+    00 00 00 00 -> /* SoC  VRD hot event is asserted */
+    00 00 00 00 -> /* SoC  VRD hot event is de-asserted */
+    00 02 00 06 -> /* DIMM VRD hot event is de-asserted at channel 6 */
+
+Sysfs entries
+-------------
+
+The following sysfs files are supported:
+
+* Ampere(R) Altra(R):
+
+Alert Types:
+
+    ================= =============== =========================================================== =======
+    Alert Type        Sysfs name      Description                                                 Format
+    Core CE Errors    errors_core_ce  Triggered by CPU when Core has an CE error                  1
+    Core UE Errors    errors_core_ue  Triggered by CPU when Core has an UE error                  1
+    Memory CE Errors  errors_mem_ce   Triggered by CPU when Memory has an CE error                1
+    Memory UE Errors  errors_mem_ue   Triggered by CPU when Memory has an UE error                1
+    PCIe CE Errors    errors_pcie_ce  Triggered by CPU when any PCIe controller has any CE error  1
+    PCIe UE Errors    errors_pcie_ue  Triggered by CPU when any PCIe controller has any UE error  1
+    Other CE Errors   errors_other_ce Triggered by CPU when any Others CE error                   1
+    Other UE Errors   errors_other_ue Triggered by CPU when any Others UE error                   1
+    SMpro Errors      errors_smpro    Triggered by CPU when system have SMpro error               2
+    PMpro Errors      errors_pmpro    Triggered by CPU when system have PMpro error               2
+    ================= =============== =========================================================== =======
+
+Event Type:
+
+    ============================ ========================== =========== ========================
+    Event Type                   Sysfs name                 Event Type  Sub Type
+    VRD HOT                      event_vrd_hot              0           0: SoC, 1: Core, 2: DIMM
+    VR Warn/Fault                event_vrd_warn_fault       1           0: SoC, 1: Core, 2: DIMM
+    DIMM Hot                     event_dimm_hot             2           NA (Default 0)
+    DIMM 2x refresh rate status  event_dimm_2x_refresh      3           NA (Default 0)
+    ============================ ========================== =========== ========================
-- 
2.28.0

