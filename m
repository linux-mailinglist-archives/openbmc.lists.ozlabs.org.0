Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409F50AE10
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzRs6q2cz2y7V
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mfOTDJzR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::72f;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mfOTDJzR; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNH5xCrz2xnF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVUgR9M1a6QWL8ivDZQDnxMQRBP2LNI7TUDuE0JUDYpXbNYhdeAJPMKmYNLOT70xhD+Kv20ZiASPYToFKcfdkAH4rd8lgEN7H1IhB+sQz2HtxzRX79ryxvsnQEJfGTj5EGI2vPCmlLkdrJykjZdcr1o+4S+w+t+4F1isod++qDdpBVkTU6do+d9ysBmVyd2L4FAUpyV58AyuQK/xR1u551Y2bnKkc+MCzZGRZ4dGUiFnIvbP7cWtXUO3OyBlcYWNv9UyqatP7oqnnxWU12f9WXrZ/SfOZAfOrD9dYzcucqjw9WN/6se8lYauV6xAhsNcfaye3C5ysiizgfaOtC4pOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6AcyDmq65UuSAChFGuwit7QRzxdfzVIs3Mc/m9BSZU=;
 b=bpNR/hr97oWVTKRMwNfDaxuU0UAoxj7tYBDzii1CrzjQAwHvlSw5kNCChjmkdxAvIkOqj5cJjl5MHPCtKckET1B5Z1XSr833CvXQ+1UN6NRT67HBb5IDN8930hFcti2XupRFFqwMqQSpF0wnweiWGOWQ6GPhfxafJoMyu8FVH3Hs2MjH/8zLQjH3ZsIHPoezfVQ5kq3MoYwf8khCvW3clHwZYEdUNlXWaulZPoYadnSZCW1TyTDmlT7SofSt6tH+OyWaX0Mrtu3jSxF3ZpyMauc3jRzy821n1Eyl8YcS3QToa+d2eNxFIOt4Yo9Dk4h02cMm2bLaCzNm6jfeU07yjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6AcyDmq65UuSAChFGuwit7QRzxdfzVIs3Mc/m9BSZU=;
 b=mfOTDJzRNIDmeWCVh5mkKY29B+LAH2gSLc3xso/PXHpn+JDSAS2VjNGh31zx4auM1JprOqqGA3kuIgB+T3EgLLvVM+Y9U1vrRC2IukU5R7dx98CmUsYugdZuUOnljIuWr8p85sqel4RMc2JXULjivorVCfE0/tDGn2qx0eht8MA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4653.prod.exchangelabs.com (2603:10b6:805:cc::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 02:47:33 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:33 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v8 4/9] docs: misc-devices: (smpro-errmon) Add documentation
Date: Fri, 22 Apr 2022 09:46:48 +0700
Message-Id: <20220422024653.2199489-5-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422024653.2199489-1-quan@os.amperecomputing.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5124b977-683a-474b-f847-08da240a736d
X-MS-TrafficTypeDiagnostic: SN6PR01MB4653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB465398F5A88E038E9313CF78F2F79@SN6PR01MB4653.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16l6eNZgJmLhMvv4H8KOvXBlv7W0oF/CFAQ/VfeLfMfRmZLyIhJn0+EGsAnnsx8k2cv9B1X1kuc9ENccIuY/tqOk0X7n7xwGZC0yr/HLuUN7y2fDTSuzFyR7Z9y6LR132lw4NMY8+Xv52HRrdFJqG0QFxnK9KkB5kT25DxJ259A1DhZjNW23JlEoxVnvibZq9D5+E3wHtoAAu99SDk98Pv9Z1UzxOr8Q6sLYUPnpVv2dQ4PxJtamG43ZTx8NlgILwsh+dNwgIiflQ9+oB4UnRNbwDl2nAW5kmlW1tTABbaZDbyAfeZ8OdPyTOnzMI+VZz+k9NfszJWOxsvUFs38zQfytE/Po2Ngk+4R0FnOyi5DVtsvTYxJtP+/MhTr2ycyjGHYgah5uRgzVlUk5wyEfSd5qea17FjE2GuNgg/1No1kdWzJkKR4sDSq6QNHLVCZD7Cz2otMQ5BNlgu88n2qGgjxbOTUg9WbbemyDDGj24woDCHb2MRQdERZ4Lit4meWMGwGyqGlxd7hiF6P+/VZZw+TmZq49yx3CMLrRqyW5QN8OOZaYw9hO86gyLyeuOwuMQEbOHoD0WSGRLo81K/ASIdn7fio+GdZSyRo0ct5yQ7mTrHODDSKPz+wf6oxO61XCxt+ibj5Ks5pKCXVSOFTozEAzKWnx3rnmo8wZuWLypCpOmTxuibv7TAg54SN4svvQRjsC1lDCCugy0/hOBOfIwCQ6/yer2/gqwz5JGArSROw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(6506007)(6512007)(508600001)(54906003)(8936002)(7416002)(66946007)(66476007)(107886003)(8676002)(316002)(110136005)(2616005)(1076003)(6666004)(66556008)(52116002)(186003)(26005)(86362001)(2906002)(5660300002)(921005)(83380400001)(4326008)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2PAqQrq1Kiidba+jibCNgXKHBXvsC7ru/V7Ao77vsjD9lWmOjTYoZyWM0fwy?=
 =?us-ascii?Q?ELLexJtXdE7SCy/WzRrxK3i5RBvyISYU491pf2bZ1T77quMR7Vj9RNOHz2mS?=
 =?us-ascii?Q?p6EENPuDDqOv3SYJ4P+lhA+ejUGyVtQpABIXM5OTNyWdY2fRMj18Lh2FoQyH?=
 =?us-ascii?Q?DjoUmMHDX7+O/cliv9uUWaMxHi8hyc9G7uQI1ZGbSjO0owus+K+B6jrJ/o6P?=
 =?us-ascii?Q?U2eCYIATJs4F0FFTL4iCV7yQjxt2KAE1Ovv9BiGG64aHe81OEytemPBzRGz4?=
 =?us-ascii?Q?IMdnfxobE9EwKKRCC7mDcnKZ5Jkz4lmy4wxu9j16WANA+HQmON1uC8C2/CMP?=
 =?us-ascii?Q?BJikfB9J8Q8SGL7XEjG6tr3ojhz2aYaja3Vty5AhWc34Y37j1nBjdYulRgY3?=
 =?us-ascii?Q?7uViZ5zd8V8FAbpHtol6+JoDHBgLpnCSHzCgZNYqkseP+VfFMqhNNVNG/UL0?=
 =?us-ascii?Q?W7AIskoyuxbZhe5rM0vWnVXdeB5nURvaRaveJbPsbDwW+2uLwjKBhhkfZHWL?=
 =?us-ascii?Q?4tXQiSJDlfNmi38ndzWbN4hVYpHl13Ek1MRkIwQLGOP8Ucc6LZB6pn4Bcs2F?=
 =?us-ascii?Q?duLwMTLbCIaM3Nf4y0xj0vHnApHdSY4aqOUcRbhtcOIVVTxL4onvAMXMoWHm?=
 =?us-ascii?Q?8c65OR8caGfw29EnxCylhPZJNnn9MZQx2WXxt7LDo3U2lKtsHCaddL9uGoyP?=
 =?us-ascii?Q?DWPdAV/9z9pKG6y8AG0BB2gmYMPrvZLdfFA48980fvjaGc29q3Y9lsVHCA+v?=
 =?us-ascii?Q?c55go17fljT0bQin4VXrNHa62MtNQdAp7Ope0s5KGsWykFro+kq8ZoZxI/iZ?=
 =?us-ascii?Q?IuVCDkJN5S+uThVKi+RC3rY+7bM0Layn1bEQ8Uju7gC+PMn73CnGuXCCFj4R?=
 =?us-ascii?Q?zAlxMU+Flg5f5Bbj9NafpmNvIy5t4Mp4iYpdmbYu+LKj5obBKDWRes/eh3lC?=
 =?us-ascii?Q?tLrxXIAcdGnUtcXsrKmb5zWKX48bhXc4sYaMzqLzpYznTDMvX2WrxCOpuEB5?=
 =?us-ascii?Q?/0spHXtw0rYVbu65+G3H1bYS5cjOK1AG/122Sctv6O9bkUvBcrq8PtwBXy76?=
 =?us-ascii?Q?orCgoHW8yAU4YD5GeZrEDswO6osLjAXLBptxv1wEdBa0r1bSK0TZrgii6z+j?=
 =?us-ascii?Q?zq9ynT8iwZXijNhqylaUAO7Okfy5feX9h/Tb6U4ISchVFjyyKmGPKN+rIhUK?=
 =?us-ascii?Q?RY6HFtZK6Ivo+Q6JOXiH9WEwvn8VtpmDWBRUV5TGnGpGK/psrprjA80WipYV?=
 =?us-ascii?Q?71TOUHAsgJd/91eHgPkIrAUZSKJIdzCY87ju8uTpN6jKwygxqMEd/5ABi2ay?=
 =?us-ascii?Q?XU5r5H5fVIhcooHNyeUvHXildkggndJ97+OontlSQBhjp961gZHVQwritkpH?=
 =?us-ascii?Q?cEphmxJe0eRoDQ37mpGVpDcBFL7VGiuVR8PTM1tn+bswvuT6b5QrwMQcbVBn?=
 =?us-ascii?Q?V/2vrhvVsNBQjQRGyOfwNQ8VCcqrEo9K/FIpdr7cYeSpRoROZRDqDEMRJjxj?=
 =?us-ascii?Q?OkQkTFrZsnBilnIFC5rm3cguFyvphBBfil9fO6C7xGm8Ai/xwbQcydzi/T/F?=
 =?us-ascii?Q?LgnjYgyls0Sh74D6YSjacFeWJgYtBlaF/Cyo57m2p+FzdmF7ydzTYPfBbUjF?=
 =?us-ascii?Q?KsMrhLpkR3+q3nuGfkkEHA1rSZcll4B41Q1OIh76yn3QjJYTOt3vYIGg54Lv?=
 =?us-ascii?Q?oBW8bP4Fxie1ayUX0BkMyDktrviXF5tAYYi8eU9cKvi9N9yXJ3vvdzvgub8q?=
 =?us-ascii?Q?Bkxj9jmJesBgKoG1KCRu1adE95qMdBPtNOL67eZ9wAqhrGOaefMa?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5124b977-683a-474b-f847-08da240a736d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:33.4018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVwBB5bK4Fl4LmJaKO9slCc1awabSjBla0+d58ZXhbxBOdRuFn8Pwu+V9ICvMImxJ0MowK2KWCfcS2JpKlbykexhOLO0um7yjnclTxfir+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4653
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
Changes in v8:
  + Update to reflect single value per sysfs  [Quan]

Changes in v7:
  + None

Changes in v6:
  + First introduced in v6 [Quan]

 Documentation/misc-devices/index.rst        |   1 +
 Documentation/misc-devices/smpro-errmon.rst | 198 ++++++++++++++++++++
 2 files changed, 199 insertions(+)
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
index 000000000000..53599904da70
--- /dev/null
+++ b/Documentation/misc-devices/smpro-errmon.rst
@@ -0,0 +1,198 @@
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
+
+The SMpro interface provides the registers to query the status of the SoC alerts/events
+and their data and export to userspace by this driver.
+
+Usage Notes
+-----------
+
+SMpro errmon driver creates the sysfs files for each host alert/event type.
+Example: ``error_core_ce`` to get Core CE error type.
+
+To get a host alert/event type, the user will read the corresponding sysfs file.
+
+* If the alert/event is absented, the sysfs file returns empty.
+* If the alerts/events are presented, one each read to the sysfs, the oldest alert/event will be reported until all the errors are read out..
+
+The format of the error lines is defended on the alert/event type.
+
+1) Type 1 for Core/Memory/PCIe/Other CE/UE alert types::
+
+    <Error Type><Error SubType><Instance><Error Status><Error Address><Error Misc 0><Error Misc 1><Error Misc2><Error Misc 3>
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
+    # cat error_other_ce
+    0a020000000030e400000000000000800000020000000000000000000000000000000000000000000000000000000000
+
+    The size of the alert buffer for this error type is 8 alerts.
+    When the buffer is overflowed, the read to overflow_other_ce will return 1, otherwise it returns 0.
+
+    Example:
+    # cat overflow_other_ce
+    1
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
+    <Error Type><Error SubType><Direction><Error Location><Error Code><Error Data>
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
+    01040108003500000000
+
+3) Type 3 for the VRD hot, VRD /warn/fault, DIMM Hot event::
+
+    <Event Channel><Event Data>
+
+    Where:
+    * Event channel:
+        00: VRD Warning Fault
+        01: VRD Hot
+        02: DIMM hot
+    * Event Data: Extensive data if have in format of four hex characters.
+
+    Example:
+    #cat event_vrd_hot
+    010000
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
+    ============================ ========================== =========== ========================
-- 
2.35.1

