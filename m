Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9486EBD1
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 23:24:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2DZIEMSj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmjLf5HkPz3vcc
	for <lists+openbmc@lfdr.de>; Sat,  2 Mar 2024 09:24:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2DZIEMSj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::618; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmjKw4DyXz3brL;
	Sat,  2 Mar 2024 09:23:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqetMl6oCr26vfhs0lz+YhNQ1VJfN5E2AWSv+L4FLnUHhvG+98D1Y4zYfZWD0QD/jnyZe34hVAQntQwE5XjfAO9DZVZPQiacPCTC2lv+SvmUbVRJhsWbXq6Wq1OiVzq45hQbphhP323pcwbksUIi93q2xuK1eHn/o7vBBvkvTLy3kkQB6Be7XPZXfiphIcZv1BlnzLZRlLWrz3wbHugmuCe0zh5B5C6nUok/1gsj3Wcb7ZwhAAB7IDbSkYLXUWDZCyvW2kf0o59+GWwpA63dCJU4VtN0HExAuCqNUt0awyOJSKr9qriXY1ITsulNlHumzoP/q5l7fcz735AFsljLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL4dEJAlIwDlPYlI9vmoWjrrkKiS5cF0OL/agpmraM8=;
 b=d/ugIZRhMmw432ymwIj4QA7y+6a+NU4r+dqdBTd2caYA+3sK+CcEvUSBtq3xUbmU7qe34IP23N057UfDAXYtH6B3BNuqcCQuO5lp7I6ttpfHP4WNRwiHUxgr8kg8dvvP0n9dOmBcZvse7+N5biTV6QAUR22rA5tTY0oOr7r3CR8N7lQTbN3GHY46YLjEXepaieECHjqc1RsikRmAOECEgpPfm1Y43hpVtZdaZDd0kMvOZjQt6jWSOHhml0qTkCbzfBHbEi9UOjVEnH25irkezWJnQKDDdXZ+5U82vg0nCl3+PphxifQmT50CxeQw66sZfsJsjoTRwgfP51yt3aGd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=jms.id.au smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL4dEJAlIwDlPYlI9vmoWjrrkKiS5cF0OL/agpmraM8=;
 b=2DZIEMSjh9zG2NhtAABOsW3XsmEpMWHSZ7hVpsyawwO7WzNZEM3AZHYZAG1lp5BJU2P5TWD28JSOHAfQ+Ynt6M8HaAdRkulzwqn8jgW3UnseMvPXuWTPS96szBZ158cnjc0zmTzrxSr/8uMXf+xb5MmZ8My6q9U0B1AbV1AIIe8=
Received: from CY5P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::36) by
 SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.36; Fri, 1 Mar 2024 22:23:23 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::e) by CY5P221CA0030.outlook.office365.com
 (2603:10b6:930:b::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.34 via Frontend
 Transport; Fri, 1 Mar 2024 22:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 1 Mar 2024 22:23:22 +0000
Received: from BMCDEV-TH3.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 1 Mar
 2024 16:23:21 -0600
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<robh+dt@kernel.org>
Subject: [PATCH v2 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx Platform
Date: Fri, 1 Mar 2024 16:22:57 -0600
Message-ID: <20240301222257.3309541-1-supreeth.venkatesh@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SJ2PR12MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1db55a-2123-4c51-2687-08dc3a3e34c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	J1B2IjjjbE2bpoQwbYV1+ZmVsVjjunF8+Zr9TIXTBVQtMtO/LPOiyOh82n3BJgagzZ1IlCK9pdsUlXD5tVf87Zz1FdVmGuh8WfFaP7VVE/SLSR6bvUDEsKgSWyiI20JVMT60gDrl+tmEW8HmfAn2o/zTEMo2BiNU2jS9gvcsPB2NKvCTsz3qYbRnM5Z640NTN8gVh/yLZKmc0xq5oi956aeUc/f5qaAf8FH9Iosa3Wk9S01aaDBaW6p9QWa3Z073fV2hmqyv7xkhZLafuyJ3Jy0FqIPt87Aj1E/DescSQ1PT8h1PaEQsJi8IxJrn3+OJ8cf/YqGL4uPX9Y3U0uy1k6J2LXJQx02OX4MizvKYLz0ECMzI5pKbDZbXEfe8td3t3UwD5DfJvCzy5COWXeZZyP/dlBtamkuGnpBA4Y4kT1lrI/ETxOvzWAqlB1uqqEQ3J6HhOAe5DXA5wZGCA+NEkvXsUNMIt3h1FqIml5eQ68/8jQis829qpZsK/oc6A3fe8Yd72amP3XBg+v0nd88C6wWCsI3ZE+EYrcThLaAixCtZH5Cosg7xkxo85l4rvSNde15iGJS6wXuurV227/L2t2NGi11fj9LL4bZgbU+MfPchOZX0Fh8hhwdunFOkZcMWFtJGSzIj4cnNCSN4kbRbQ7ymxNuJEtstc1FhwoYQOV9PJr6PGn+6mWpPu+Hf2TVySFD20P1w0TzBzu56/c8M38i5Qr9HGvzEY69+OIvxcocvG6lK6Owunq+NBNj0pg3f
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 22:23:22.6589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1db55a-2123-4c51-2687-08dc3a3e34c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139
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
Cc: supreeth.venkatesh@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial device tree and makefile updates for
AMD Onyx platform.

AMD Onyx platform is an AMD customer reference board with an Aspeed
ast2600 BMC manufactured by AMD.
It describes I2C devices, UARTs, MAC, FMC, etc.
present on AMD Onyx platform.

Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
---
Changes since v1:
* Incorporate review comments
* Update commit message
* Remove vmalloc and earlyprintk
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index fb9cc95f1b60..2b27d377aae2 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2600-evb.dtb \
 	aspeed-bmc-amd-daytonax.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
+	aspeed-bmc-amd-onyx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
new file mode 100644
index 000000000000..1831b8d18db2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2021 - 2024 AMD Inc.
+// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "AMD Onyx BMC";
+	compatible = "amd,onyx-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart1;
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+};
+
+&mdio0 {
+	status = "okay";
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		status = "okay";
+		#include "openbmc-flash-layout-128.dtsi"
+	};
+};
+
+//Host Console
+&uart1 {
+	status = "okay";
+};
+
+//BMC Console
+&uart5 {
+	status = "okay";
+};
+
+&gpio0 {
+gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","MON_POST_COMPLETE","P0_PRESENT_L","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","ASSERT_WARM_RST_BTN_L","ASSERT_SOC_RST_BTN_L","","","","","",
+	/*I0-I7*/	"","","","","","","","P0_I3C_APML_ALERT_L",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","PSP_SOFT_FUSE_NOTIFY","ASSERT_BMC_READY",
+	/*O0-O7*/	"","","HDT_SEL","HDT_XTRIG5","HDT_XTRIG6","JTAG_TRST_N","","",
+	/*P0-P7*/	"MON_RST_BTN_L","ASSERT_RST_BTN_L","MON_PWR_BTN_L","ASSERT_PWR_BTN_L","HPM_FPGA_LOCKOUT","ASSERT_NMI_BTN_L","MON_PWR_GOOD","",
+	/*Q0-Q7*/	"","","HDT_DBREQ_L","","BIOS_SPD_MUX_CTRL_RELEASED_L","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","P0_DIMM_AF_ERROR","P0_DIMM_GL_ERROR",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","";
+};
--
2.34.1

