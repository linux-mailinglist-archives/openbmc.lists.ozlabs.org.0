Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C882A4E2200
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSDG5XYkz3081
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:18:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vmIHL9JB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=vmIHL9JB; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS8f6HFCz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:14:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ceAvIJqLZV5zrL9IlVw1hfvlN8shW40jS7onu2P/hvLMghigEkLnP9djGLeKuwI6UlIvt0PIH+tB2ySXtuInaK33p1RGanILW8p253LoNLSGceGyGktwo4CHpcfgbU5eJx2MI3MyYvtmKWYFtFjwBRPi58WuwZSsocm80JObCjg6IAkypkPO3zt1A9iHvoyJMYyq1+m6muMbpqsoU2LvB7kmrUzGy+N68wnFoeLLq4YuYG6/iFplw52hhQhMbgX/vnkbHWbPoDOJclMTLQI/iY9b0VdOG+TemLZbtexDFfF/yfCWQqZczOUJ9wv8XSLO89sdMrZvYXeZ+XGer07d7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAw9+4c3MzMPzOt4/wXifFK9WLiGJlKNXVjANFrOWl0=;
 b=IFz+JSANp3N20bQMrDDv92smG45SnNvxX1r4zQQxu03NDSiDPXV9L+LccN4nfn1+294FLO63nRPljeMMoBsU+wDMV8u/MdpZ0wGWT3H3MBPp24KWhDxC5XjwJj2Me5T8mIxKvAeCNLP03NgCMZkd4q92Jg1WoJWpexHesvZPR8t31bIXmAfmTXugO++zjL5BpIdTWiVUdCJEfCsOLb0wYVvbYpviG26YNyW4RELKFCpj1kxiqwHRpr/XW5Ftc8+eOTJXrNLVuVTsMbgxH15QRft1/s5zXf/4tex0h/vfH5li5gqD6I3ni07Q9T7kzLeXOf4TY/0Cw4WzH6ItLIG+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAw9+4c3MzMPzOt4/wXifFK9WLiGJlKNXVjANFrOWl0=;
 b=vmIHL9JB/B5nVdxl+Qn1QhfOJUzmIrp768PAhrtnVLSzKvXkCPhPGpY03wKvEuHKJIQJFjBAhE8f5rdBuhh1OmBFs4rUtjRmrCmVGmRwXL3LJUF96+oaNPnOw7RkNnAWGibvO+cURg7xq62KgAXmsYOrXZdjE38Zdk/AjQo2b2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:14:54 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:14:54 +0000
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
Subject: [PATCH v7 4/9] docs: misc-devices: (smpro-errmon) Add documentation
Date: Mon, 21 Mar 2022 15:13:50 +0700
Message-Id: <20220321081355.6802-5-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: aa89d775-2557-4b14-93f6-08da0b12e138
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB273804DCB1105413B9BA649AF2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trc2GXABXiBI6judzF4eNXwXfD+Lx5uZWfYVjEJkYyRO7HJFy6hWIFeuk9RN0+vlMvVGGDgoCacafDM3/N5bLo5VGzau8JlF70bll2jtUSwJaA9isvLCSvwtT5VBqRugR53TLoUIq2thrTifwK1aXUILFQs984hHqLgdqL0QA9QCNllf632XWoHzqs3+mGw4bK7gLWlxQp93W/JfXNeEoMAw7Ds9/s9xHxbYQS0qmozQP/DHH+m0hDE/X2yQQyJTUvdopuVkR8YtXip7cnesyp5dHCx8Ceq4dhSN29WpC5JPmfWRih4ogw5Ik3VBE3xd5/As0IF3aQt09HD4+IRmNJn73x04NSWdEv3GjrJCUXvFKl+pUgE6L3mKXrLX+OwXeDzSyzUCgnlzd97qnts7Pb81YSCTK5BDZQOMn5ZhC1QQ6b3FBbJdu20zqHkPKidwbs6FzyFqDvPg7Qi72e4umvo9XZmRosaJuC/TB3FgmbRchuzRT+Ch52F/z00eVviTmCcZRXnm2pz/BKBVBRV6NsuuVRqHl4C7xJkjbhCCdb7qyjY/2OyO8Bt8ZyVfl60FZhKF1+yrvDIVZ4RqDV0gHyNwPL3AjNIOa3hzcYKi7Ywi8ZWgO2bEmc1OFXaeHJmly0dm/TyC6iHkys2I9BYW+r9nZNbNQwixmKAyrvpzu0t725q/SqUh4/0Rnsyh3rGBu0HzqivpHKt7G4BXAJa/15KJEBDg99kq0N/qo22Pffo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VGrlRWSPhOkC4GxZK+GKdndivTU9aI3FlIepDQqGyqvCzXcJKrzO1D8fq/p0?=
 =?us-ascii?Q?m+VS2xiAtXS4bodFyk/sh1F7ROBsyZlPcaFhy5TPq/Lg+ftUsH63ZrTrQLXa?=
 =?us-ascii?Q?x88SvDX1JXun9VsOWJm7uQnIwnulUMIjlizl1wCFjMQ6kGyzMOSPA8MmvM1g?=
 =?us-ascii?Q?ZPMvkFYiiP/gDnu3mYlZQBmrJmqvPEEq0RHS/mvjOEUoWFk6a47TISiC9tVy?=
 =?us-ascii?Q?2iiF2/3ajMLNbx70WJLLzXqDVHbyGqEg1BXzCZkkZeOuFFom6TQ52CtBsofS?=
 =?us-ascii?Q?i74uc5SF3bSXRAnOQJunNLGVAxKkwJ/jVAetNG0axqw1sjzAVkVQvCUkP6IH?=
 =?us-ascii?Q?6HSS83Ji8Z3hAQDy1lcGRow28Z+gUEyJT3/0fd+j5EvDWe86yk9fijcEEgM6?=
 =?us-ascii?Q?/gnO37u/It1/LFo1wx1wgWcrLsKonQSk/zfbqP3FbEz+key/LMA7bsJnOfH7?=
 =?us-ascii?Q?YycCz9iu3jPLxbgzcmHErvIL4mxkjE8yuSEo5w3+FrLOWQ4grZ3kyyLCl5iT?=
 =?us-ascii?Q?1mBaItpPQHFWR1OaENBcyoJej66+JnOB+rwTnogurk+8YLGL3Qa3POMK5uwP?=
 =?us-ascii?Q?Fk5K/nIBuxsm+o3f/eOamvCnDaQpFM7WYlopGUAwSyQPjRFJ+ns6g4eUf1Th?=
 =?us-ascii?Q?lhDfGzE3mUlQSeo3JMPT4doW7hFmWEFj+N5hGU/dn0lWV0Ds1VWWZtNHKW76?=
 =?us-ascii?Q?bLyXBEl5Jx8BANrdxmX0NCy0cAh7385BVycFfJLIStmBpytLSUmLwOZYCAf+?=
 =?us-ascii?Q?39kc4khj90c23yn78rwWk1GzN+7rIybdeABUBdEgObTDtU7wi6O2ArYqaqD9?=
 =?us-ascii?Q?M1RioTm86nv7VnZj3gBDCern6NOcc6mnJrdgqN+6HkbZK+s7lUqq9MCFA1m/?=
 =?us-ascii?Q?s/oZ8z6XPpZmV7SvWLfU6Jnk9hqfWWfVQDpbEDyzFwbHs/iNHt+9ycZeQYaf?=
 =?us-ascii?Q?0kmOZ54ILLeyVk0tNNWvHDUqpBkq7DJOi/7ldDzlHULYEP88seGyRbu/ReV3?=
 =?us-ascii?Q?jkueBD3zM03PxwPRu82Xjc+TGTNNNiiVu9OvkrM/YtQlTBX8MTr3ILIUD4wU?=
 =?us-ascii?Q?LwtycdESw8lSSMiQt3gl5O+sYEH67f9hDTB2TUIFBsp0S2TvE7NlWby8XKbH?=
 =?us-ascii?Q?XZYt51RXnr5SlhciU/g0JkmizvLObAXhAWzk/g8iLEH/nociyjYfrHSMy2yp?=
 =?us-ascii?Q?kS7+kg7a12BUVQYJj8nj6N2OIf5m7YnWDZ2kzG4Henp+sWcfCeyhJ0sCm86j?=
 =?us-ascii?Q?Y4KjN+EJPUMICKSy92i4sF94pqZNZTUJGgfUOs189IhbgUXhhCgsGcvXCU5L?=
 =?us-ascii?Q?WUibzYvAXAHPnSk5ueYndjn0qKr+DejUiooEW9Phj8MNjvk4yCkUKVrQ5ZXc?=
 =?us-ascii?Q?eOS53Txb4dKpRpOIKi6S1FzVR2iAEJrjV/2iUkCPrTCA276Gpvmq2G28Mr9i?=
 =?us-ascii?Q?DBLzhTmhNONNJvU4Vg5leTj9XiNabLkhCGobKNiOCNWrNG9+lI2+eEPdky5t?=
 =?us-ascii?Q?GbPKnmi1WqsJqsI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa89d775-2557-4b14-93f6-08da0b12e138
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:14:54.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTX2I7wNKUmyMPsqrGyjsX0demmwkTDniZaD0A+BYmfWDrwec55xb2KgbybmV2X+yw2FUJRgebQWKi9cBo1XLq3HlD2HqW5+tQc/kz6N9W4=
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

Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v7:
  + None

Changes in v6:
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
2.35.1

