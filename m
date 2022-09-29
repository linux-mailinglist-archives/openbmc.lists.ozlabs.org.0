Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6E5EF298
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:47:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT7H1Ss7z3blT
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VaIDce9o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.125; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VaIDce9o;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2125.outbound.protection.outlook.com [40.107.94.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3D3JfDz3bVt
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgXMp1+MybFphg8qQ7cJg3CTQoS3ILEEhMFhfZhZlwfaKfaT/TRGUQC5aWzv4Hjlcj+/Y4mFsNr94ayiRQVL6Qic1uzm/qVpXEQu/Nbf5EBd3B8YXO0qXKkYVChoFJBWrfgFB3wK1griBcGk1HVjKjQP2kx1muCw28r/fgAX24KzFXm50ZUNcKsraMQsUyKHglxbdINOtQdf639ywNFP5CYKVpeDbFPmPjZ/WZXrCUCf3OBjYYBlsBY1WoRzGXT31uqjALgKjYG/EluxJxEh2GHSwMdUD6+VaDWRyxl+LqDsY/iS6L1n8F9mrdcBRkeAtJhP5FZacQo6DO5dWwh55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkBW859ZdBZmAWyKy90wABvS2LCe5tg5KiF9REzsHD8=;
 b=XxJqbT1M2UDxG8JeB/3GXUdnm8w10a+znEPn207mzBg5wbpQlveHtKRWWpsaliCQ8gA+PgHdWyhMp7DvEeRFp93SZnLZ8qmqfNTH7O4KMZQd/fdOh9GNfUI6ReQhnxhLRB9lYe8LVsl9pJ/u3Yqq9+/Q6amXB1gtTW2kOZTb/emFB/bEBeGSE0W5rTegh1ovxePZ3HeQJGpGQAum+/lpelc1pXKhBe8bYH4SK25Nn4cgJRQ232e14PIurE2c0NGrZM3bFos1lko/rkIQIVc/eNpnQYsPKgffdxz6drKBxYzaYyuQgmycHskpgaYSeLu7QrOcJPL5IFnhaGu1FnOWtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkBW859ZdBZmAWyKy90wABvS2LCe5tg5KiF9REzsHD8=;
 b=VaIDce9oYpHD8JEtwwRQv0KJOXU9ZUIna+UkB1f7wkHbaSgxoB7C2ubl96mm/5zE1XMpledIlkeYgsOGUU9FTtNpYkHUYlOki4hx1NVZ5DoHfl4S941k2EJ+cGj9CqWl3S3ozcebjMyom148nW03OxGhVYRbrY/083CcU785JtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4798.prod.exchangelabs.com (2603:10b6:805:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:07 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:07 +0000
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
Subject: [PATCH v9 4/9] docs: misc-devices: (smpro-errmon) Add documentation
Date: Thu, 29 Sep 2022 16:43:16 +0700
Message-Id: <20220929094321.770125-5-quan@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: fcbbaaea-ff49-473b-5717-08daa1ff2706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5AR7Gdhj/Pql8uuspKbSYR0sH8ayNMysOiKj1luTQ+3Un4IY25LivzO7+oo7ZYTx7CfP5hXcrTv/FxLENbP/Dn/Zd8hIzsoZDPOj5c+rkPd/OiGZdsb//nbdhx6y742PfQYRa0Ec5ta8+66CvYniShhnPX8pwjGDmF1Dla3rLFIGxY26zwmnouvSms3ir2XMNFlmg+mvmBwWo2TlxwM5RZ5Hq42obXOGsNUiMNhehK/AOquA7B0XoQC/CiqI2kEj8/Iihfyi5AC/XaPxnu4AbHg9n7ZsRRR5xT6W2kDdXWtEx7C45DDFlyLew9e+bRBzttEjGcxp3i2sz5ykloAOdV34hsDR2wY5Pg1hXqpf/SotTtQ0kn+pyyyNBnT84c+gUYjbjqo7wyaGd+YUBxI3b9wg5FZolX4P2ZrHOf60Y/dpdVipf2AYThU+EPG9UmeYF81CnHzY5FD7eQvhGJQmh/HVDzAsMF4S0bUSrSYNvHtVZXBCsLt8hVxqrjMMjXr22vR1zqObkaOjwTrNwBTRsZ4TUQEFEUafCWCX4zRplAB55AUveflwtHF2p0soBpw17e4mZtIrT+HiXqUtr7srAgv6ZpJXcz/C3oJYa0TwEeqhf7MHs4w/KAWqytP5NwabxoczpE0Q8PuXTnGWe9+IZzGkcvd5WdwELkU49xjDEqMrfRwbLax/beTcBxZTY5XhxlfYRBkaZ7gV9OV8FwtB6oIEu9UzWrfkQF74+xYhn6TIjjeiPp8+6eA9POP+q4ymhyfJi+ml5lO1EGofT0x5OxtIF53jcpu5l/QRhkexTDs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199015)(921005)(66476007)(66946007)(66556008)(8676002)(4326008)(83380400001)(110136005)(478600001)(6666004)(6512007)(6506007)(2906002)(26005)(52116002)(41300700001)(316002)(38350700002)(38100700002)(86362001)(8936002)(6486002)(1076003)(107886003)(5660300002)(2616005)(7416002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/evpUTrKDHh7KoIZ4CV3yr6qurmIvgf/OnfvIY9Rc7itFPNNzdPsHKVi3aSP?=
 =?us-ascii?Q?NEEgX8VImroXLNeav5cGaquBpZGLQj0JRAk+27fL3LofzD04EiPaXLdYt/s2?=
 =?us-ascii?Q?Z+6rCCVd0Nnv6dNX7Rka1rDa5QrJeRdLY1pxxpcwgNodcqffyrmzQtoUh4YM?=
 =?us-ascii?Q?9+xkuOaGRdkKGwzfJe9DAjxgmK61M1WQ6RlgdFXBI75eWefoPenaA77ReTMQ?=
 =?us-ascii?Q?scnB13L32RisCsttg8RdqSeMDi1gaBEZ6k0ppHxDQYN0I4wCRt3QWXcCqbsd?=
 =?us-ascii?Q?8q8g/X49tCJCyCsOdLCQVYOvm9M4dXr6rLMHMs7hQvUrA4WRy7+rMKGjiQCb?=
 =?us-ascii?Q?n4VCX+UcWhTpKrlpKw8pdnLbc8rY2A16AZkcOXn8FZtBjN+zqQricqj2ghHY?=
 =?us-ascii?Q?rFYVsPXK/HwJ/SdMUw9cfW9+NZ0o4hQUaMqxbvbWvI2GoxCyn6epe9/waUz3?=
 =?us-ascii?Q?9T+xidCj/maHPlK4LqNeHfUPIRv814AB2usfM3XBCbLlq/yBA4mvC54hbIXk?=
 =?us-ascii?Q?MpcfEjImWAkNG28Mhp/JZGoh1keSZY8c1PNtHRtSbJoNXp8KYGMIhUfVMTdP?=
 =?us-ascii?Q?/cHER6zs5fMU2F2e1nCy4D+cfJARsUhgZCvGCleuGUInmifsUy3Ay5mqySZi?=
 =?us-ascii?Q?DvieZ4/PGmpySqoks4QnDWoW66naMtDsknr+apfkCGT4Onh5YvjYpCkl3RmM?=
 =?us-ascii?Q?drzvwISowWgW8XNk83W5IWTL8eIgalaeqc+Le0HTvPe9kAwU2Bqqt2H7biyP?=
 =?us-ascii?Q?/Tv+3d94mUAGVRqyTqOk6DCw6Nqu1dmboyPoSar+gsW63Jx/v7L0dKQuZluv?=
 =?us-ascii?Q?udXCaZMoiu6Fu+0n9ec7I+mOYazzjPKFWPwvwLBgrkPSNwLauaU+BHGgVwIF?=
 =?us-ascii?Q?ITfymPaubUAFIlx7hyD5uVsfnVCFZLHLPKcN2h4Wcxf36JEE1Du7L9QPoddT?=
 =?us-ascii?Q?huq1fBT0nTMMwRI8nuq2xmaK+IcPR7N1n8Q7Jr0L/7Ai+Yh9vXUnxtAL2kc2?=
 =?us-ascii?Q?Er4r2ogX0iwOG+pfmkqETJ+Zb1E2D3vLjkrTTFRoYBGaTM5szz9CFByqDUXg?=
 =?us-ascii?Q?HeZmY+qmidMvgID6I6IB7B/AknhcJzr20pfU15kWAw46bEVbqnVL3ygLn91O?=
 =?us-ascii?Q?nP02D2Z9xgk9OCNsMsw8x3dFO6ufhmx1Ab5UUtJkkKnNokEZu8wIzw7YroUX?=
 =?us-ascii?Q?IHS6ogAboqjkZG0GFRPOBljIBPRlAmbXrWkzUD4XCiVUU4OfP4oRP4E7b1+t?=
 =?us-ascii?Q?Fg6hyn3JMvNit+LCn50rKCm6mGFrJ1kFOiv0nkGahD3dkCwQ+jUXkhHX3CG5?=
 =?us-ascii?Q?AQ/287MniVrQ2funGWtq70DKu6IF0HstnEUFl155ChAB9T0X5eeaM5V5ttfN?=
 =?us-ascii?Q?SOIdU6x9Z3w+dydjl5aeslYAtru5VVJgtBb8Qb7B3WeM6J23s4n9jdGr9kcu?=
 =?us-ascii?Q?r5kEkIGDUL5/8/A0eBanhRtdwzMJAJezM8HCxWtY4Cm7C3NvnL2lAKOYPJFd?=
 =?us-ascii?Q?GDbneaMlY0sub6gfFs2rfG5uMrQ2T/C4nkjJL+xbAccSdRP90xm7G+d1fz7w?=
 =?us-ascii?Q?5baN05RELMYuUpW/MhPnVxIO53gFCBimGn5eEGOoS6lgrFhBXRovRPOQxBkP?=
 =?us-ascii?Q?rJavaA2qnT9ftmlxLFLHxEQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbbaaea-ff49-473b-5717-08daa1ff2706
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:07.4804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUZ39OEEXMO1CljaHOrHgtoOeXtOcDsTbj8B2KjmgbnnSpnZaUeuzK0LBdl38yRTSPtHEzxEQHgKZ3JnF/YMcte1qx9N8i8oU1sg0Axb2/k=
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

Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.

Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v9:
  + Fix issue when building htmldocs                      [Bagas]
  + Remove unnecessary channel info for VRD and DIMM event [Quan]
  + Update SPDX license info                               [Greg]
  + Update document to align with new changes in sysfs     [Quan]

Changes in v8:
  + Update to reflect single value per sysfs  [Quan]

Changes in v7:
  + None

Changes in v6:
  + First introduced in v6 [Quan]

 Documentation/misc-devices/index.rst        |   1 +
 Documentation/misc-devices/smpro-errmon.rst | 193 ++++++++++++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 Documentation/misc-devices/smpro-errmon.rst

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 756be15a49a4..b74b3b34a235 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -27,6 +27,7 @@ fit into other categories.
    max6875
    oxsemi-tornado
    pci-endpoint-test
+   smpro-errmon
    spear-pcie-gadget
    uacce
    xilinx_sdfec
diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/misc-devices/smpro-errmon.rst
new file mode 100644
index 000000000000..b17f30a6cafd
--- /dev/null
+++ b/Documentation/misc-devices/smpro-errmon.rst
@@ -0,0 +1,193 @@
+.. SPDX-License-Identifier: GPL-2.0-only
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
+* Core CE/UE error
+* Memory CE/UE error
+* PCIe CE/UE error
+* Other CE/UE error
+* Internal SMpro/PMpro error
+* VRD hot
+* VRD warn/fault
+* DIMM Hot
+
+The SMpro interface provides the registers to query the status of the SoC alerts/events
+and their data and export to userspace by this driver.
+
+The SoC alerts/events will be referenced as error below.
+
+Usage Notes
+-----------
+
+SMpro errmon driver creates the sysfs files for each error type.
+Example: ``error_core_ce`` to get Core CE error type.
+
+* If the error is absented, the sysfs file returns empty.
+* If the errors are presented, one each read to the sysfs, the oldest error will be returned and clear, the next read will be returned with the next error until all the errors are read out.
+
+For each host error type, SMpro keeps a latest max number of errors. All the oldest errors that were not read out will be dropped. In that case, the read to the corresponding overflow sysfs will return 1, otherwise, return 0.
+Example: ``overflow_core_ce`` to report the overflow status of Core CE error type.
+
+The format of the error is depended on the error type.
+
+1) For Core/Memory/PCIe/Other CE/UE error types::
+
+The return 48-byte in hex format in table below:
+
+    =======   =============   ===========   ==========================================
+    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
+    =======   =============   ===========   ==========================================
+    00        Error Type      1             See Table below for details
+    01        Subtype         1             See Table below for details
+    02        Instance        2             See Table below for details
+    04        Error status    4             See ARM RAS specification for details
+    08        Error Address   8             See ARM RAS specification for details
+    16        Error Misc 0    8             See ARM RAS specification for details
+    24        Error Misc 1    8             See ARM RAS specification for details
+    32        Error Misc 2    8             See ARM RAS specification for details
+    40        Error Misc 3    8             See ARM RAS specification for details
+    =======   =============   ===========   ==========================================
+
+Below table defines the value of Error types, Sub Types, Sub component and instance:
+
+    ============    ==========    =========   ===============  ====================================
+    Error Group     Error Type    Sub type    Sub component    Instance
+    ============    ==========    =========   ===============  ====================================
+    CPM (core)      0             0           Snoop-Logic      CPM #
+    CPM (core)      0             2           Armv8 Core 1     CPM #
+    MCU (mem)       1             1           ERR1             MCU # | SLOT << 11
+    MCU (mem)       1             2           ERR2             MCU # | SLOT << 11
+    MCU (mem)       1             3           ERR3             MCU #
+    MCU (mem)       1             4           ERR4             MCU #
+    MCU (mem)       1             5           ERR5             MCU #
+    MCU (mem)       1             6           ERR6             MCU #
+    MCU (mem)       1             7           Link Error       MCU #
+    Mesh (other)    2             0           Cross Point      X | (Y << 5) | NS <<11
+    Mesh (other)    2             1           Home Node(IO)    X | (Y << 5) | NS <<11
+    Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
+    Mesh (other)    2             4           CCIX Node        X | (Y << 5) | NS <<11
+    2P Link (other) 3             0           N/A              Altra 2P Link #
+    GIC (other)     5             0           ERR0             0
+    GIC (other)     5             1           ERR1             0
+    GIC (other)     5             2           ERR2             0
+    GIC (other)     5             3           ERR3             0
+    GIC (other)     5             4           ERR4             0
+    GIC (other)     5             5           ERR5             0
+    GIC (other)     5             6           ERR6             0
+    GIC (other)     5             7           ERR7             0
+    GIC (other)     5             8           ERR8             0
+    GIC (other)     5             9           ERR9             0
+    GIC (other)     5             10          ERR10            0
+    GIC (other)     5             11          ERR11            0
+    GIC (other)     5             12          ERR12            0
+    GIC (other)     5             13-21       ERR13            RC# + 1
+    SMMU (other)    6             TCU         100              RC #
+    SMMU (other)    6             TBU0        0                RC #
+    SMMU (other)    6             TBU1        1                RC #
+    SMMU (other)    6             TBU2        2                RC #
+    SMMU (other)    6             TBU3        3                RC #
+    SMMU (other)    6             TBU4        4                RC #
+    SMMU (other)    6             TBU5        5                RC #
+    SMMU (other)    6             TBU6        6                RC #
+    SMMU (other)    6             TBU7        7                RC #
+    SMMU (other)    6             TBU8        8                RC #
+    SMMU (other)    6             TBU9        9                RC #
+    PCIe AER (pcie) 7             Root        0                RC #
+    PCIe AER (pcie) 7             Device      1                RC #
+    PCIe RC (pcie)  8             RCA HB      0                RC #
+    PCIe RC (pcie)  8             RCB HB      1                RC #
+    PCIe RC (pcie)  8             RASDP       8                RC #
+    OCM (other)     9             ERR0        0                0
+    OCM (other)     9             ERR1        1                0
+    OCM (other)     9             ERR2        2                0
+    SMpro (other)   10            ERR0        0                0
+    SMpro (other)   10            ERR1        1                0
+    SMpro (other)   10            MPA_ERR     2                0
+    PMpro (other)   11            ERR0        0                0
+    PMpro (other)   11            ERR1        1                0
+    PMpro (other)   11            MPA_ERR     2                0
+    ============    ==========    =========   ===============  ====================================
+
+    For example:
+    # cat error_other_ue
+    880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
+
+2) For the Internal SMpro/PMpro error types::
+
+The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
+    <4-byte hex value of Error info><4-byte hex value of Error extensive data>
+
+The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
+    <4-byte hex value of Warning info>
+
+Reference to Altra SoC BMC Interface Specification for the details.
+
+3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
+
+The return string is 2-byte hex string value. Reference to section 5.7 GPI status register in Altra SoC BMC Interface Specification for the details.
+
+    Example:
+    #cat event_vrd_hot
+    0000
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
+    ========================  =================  ==================================================
+    Alert Type                Sysfs name         Description
+    ========================  =================  ==================================================
+    Core CE Error             error_core_ce      Trigger when Core has CE error
+    Core CE Error overflow    overflow_core_ce   Trigger when Core CE error overflow
+    Core UE Error             error_core_ue      Trigger when Core has UE error
+    Core UE Error overflow    overflow_core_ue   Trigger when Core UE error overflow
+    Memory CE Error           error_mem_ce       Trigger when Memory has CE error
+    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE error overflow
+    Memory UE Error           error_mem_ue       Trigger when Memory has UE error
+    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE error overflow
+    PCIe CE Error             error_pcie_ce      Trigger when any PCIe controller has CE error
+    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe controller CE error overflow
+    PCIe UE Error             error_pcie_ue      Trigger when any PCIe controller has UE error
+    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe controller UE error overflow
+    Other CE Error            error_other_ce     Trigger when any Others CE error
+    Other CE Error overflow   overflow_other_ce  Trigger when any Others CE error overflow
+    Other UE Error            error_other_ue     Trigger when any Others UE error
+    Other UE Error overflow   overflow_other_ue  Trigger when Others UE error overflow
+    SMpro Error               error_smpro        Trigger when system have SMpro error
+    SMpro Warning             warn_smpro         Trigger when system have SMpro warning
+    PMpro Error               error_pmpro        Trigger when system have PMpro error
+    PMpro Warning             warn_pmpro         Trigger when system have PMpro warning
+    ========================  =================  ==================================================
+
+Event Type:
+
+    ============================ ==========================
+    Event Type                   Sysfs name
+    ============================ ==========================
+    VRD HOT                      event_vrd_hot
+    VR Warn/Fault                event_vrd_warn_fault
+    DIMM Hot                     event_dimm_hot
+    ============================ ==========================
-- 
2.35.1

