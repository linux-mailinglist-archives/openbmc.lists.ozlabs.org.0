Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178088292D0
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 04:37:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kCaEGGcM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8tlS4tfBz3bZN
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 14:37:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kCaEGGcM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=supreeth.venkatesh@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8tkl4FHGz30fm;
	Wed, 10 Jan 2024 14:36:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBZV8J4PQWS5pwGLvUefhqbPb1RWBfDxlr6ZJSxxeAZukkbdsvsB3YteE3PFmidH5yVxeHx/LmYAbXCBzxLh4tji8y6xg1jBNQGmCA7chEdcL45BZppbaTqgQT4WmYwk0FBYyTUs9w+fhXk1cXTqXd+mVnxa1fGChJkTnmxxuMbbUj3mdIJ197KDfiKd4dqcUTfQ30IeK2Nh8lITkouA7J0qT5xYUl7MV1dbHCQqKcOD2FfhGbudDU6jyPl1traps8m2oHPOPAmA21pdtoYRyt5BFaXw9mXCXzxALrBpaDiOkIiPm+zqolztQTTM6atDZfD/zVGWCR6YFSZUCzAMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVk2yMJOhPcCnt14t6HVc9NiSyloWmEKGkCzLOTgEMs=;
 b=JrioeC7tF4UJm5E9BAnyMQxuiRWu5IZvTdxhcZdgZKhGw+BPFVN2CSlRKofTqMlks2zvWR2lXSzt4EPkn5nfX933GxRWy5PGhdC0mwRYjtYhjBT5STFhqI7fSsrhOLD0172AhrN8tO0HTEHTtyj6lrBQYZeeqUjPoeO+uyfG1VHYJ9atiHpBYqN9PuG/+gHk3CXUO/AhyY0wW5XRlALg1bboPLi64vx4xedTNWrY8CV/apu0ns8G0NKpeD2v7xeshRU/B+RAC0cU7qros2eowduEeGxPqQWnrVfolHQppghu5ZPvrDHflSKt+e3WbuHo8n7O/sztA/iuUmN0snI0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=jms.id.au smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVk2yMJOhPcCnt14t6HVc9NiSyloWmEKGkCzLOTgEMs=;
 b=kCaEGGcMDdvVP+f8lPX1817oRdK7HkUwZ2kU6DW2faVIE3GjVtQ7716bvnH4wSVVHtC9ZPVC9vuq78tLZ+jmB2gYecRh38gnMo9AALqFQYQInlLM2LNldb/4u1pMz5MqSeFC9Tu/q4ylZe40Fku96uMukV/0c9RsQhQnymTR2r4=
Received: from MW3PR06CA0019.namprd06.prod.outlook.com (2603:10b6:303:2a::24)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 03:36:05 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::9e) by MW3PR06CA0019.outlook.office365.com
 (2603:10b6:303:2a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Wed, 10 Jan 2024 03:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 03:36:05 +0000
Received: from BMCDEV-TH3.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 21:36:04 -0600
From: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
To: <joel@jms.id.au>, <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<robh+dt@kernel.org>
Subject: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx Platform
Date: Tue, 9 Jan 2024 21:35:43 -0600
Message-ID: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 441f3d2f-5ba6-4237-21a6-08dc118d46ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7R3XIU4j9APp/3biogsosMeewQnIrOzsWUxlM0UilR7A7OPh0Iieev7VgXZ3sRaR99eNb/SLpMGoNVybzsClSEKu3FISOHy2gJaRMhBo/sr2BrrYigjPJ4+zW8M762p5/omRI8IZjYCamoDgRYV1ZRV5PVcwURQSfmFCURqB/IruuwNtLSpMZAcBkxP9uzaaHCDXgz7BUzs5v1uHAddPVgopb2WVI7DD1d68Iy6wIZLvZkVjpmJvCtZwCgIP8vhfv7Gfnl/pu/PkjYIsRylTuXre0Cx4DjK33AVxvoCBhtuqZ8vlybGddOyD9voH23pebLd8zWgVG+p4kUzLe5qB/9v4KtcGZR3OjSQUCvxqBHKwe3lJSphW72+tZzx4vVTiR1f1YxW6h0Apnu28dJF5VGWizgG3a/iiFWj02EuNnz+e7ANohW0giSvDQecN7bMddbxnOPq0i++Y78/Wmo975t+K6QA38RX9SD9joA6y7cWaZrY9OyS8L9ntcKWXs8rzppl+xyp+KFl4erxLTtizefPoNNLeoSTS5dz6gmCeINA/yrDYDIYGHTZwyuN7IR4HBFbSiHm0vmbbxpBKOt3AzE3AglyuuikCRrwYzAGtIkam88JLKDFof/Njdrc8ff11ahk7SkDPxmIJi012x0yoWUlI5GcWQ92DvGVtCiRW2VzSk8C71x8B7QcdafDL8XESydI3v+zKupL3jqFqMoEA5JnyDWKBTLMyiuT4g7o2E8pMCB/R2oQ6PxfnKuwXAWf7Xkgav+RcC960PH3tUuIrjVj7GRhQ95zyXE/CmQ49dAE=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(2906002)(5660300002)(41300700001)(478600001)(40460700003)(83380400001)(40480700001)(16526019)(426003)(1076003)(26005)(2616005)(336012)(36860700001)(47076005)(7696005)(6666004)(86362001)(81166007)(356005)(44832011)(8936002)(8676002)(4326008)(36756003)(82740400003)(70206006)(70586007)(110136005)(316002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 03:36:05.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441f3d2f-5ba6-4237-21a6-08dc118d46ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092
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

This patch adds initial device tree and makefile updates for
AMD Onyx platform.

AMD Onyx platform is an AMD customer reference board with an Aspeed
ast2600 BMC manufactured by AMD.
It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
present on AMD Onyx platform.

Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
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
index 000000000000..a7056cd29553
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
@@ -0,0 +1,98 @@
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
+       model = "AMD Onyx BMC";
+       compatible = "amd,onyx-bmc", "aspeed,ast2600";
+
+       aliases {
+               serial0 = &uart1;
+               serial4 = &uart5;
+      };
+
+       chosen {
+               stdout-path = &uart5;
+               bootargs = "console=ttyS4,115200 earlyprintk vmalloc=512MB";
+       };
+
+       memory@80000000 {
+               device_type = "memory";
+               reg = <0x80000000 0x80000000>;
+       };
+
+};
+
+&mdio0 {
+       status = "okay";
+
+       ethphy0: ethernet-phy@0 {
+               compatible = "ethernet-phy-ieee802.3-c22";
+               reg = <0>;
+       };
+};
+
+&mac3 {
+       status = "okay";
+       phy-mode = "rgmii";
+       phy-handle = <&ethphy0>;
+
+       pinctrl-names = "default";
+       pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+
+
+&fmc {
+       status = "okay";
+       flash@0 {
+               compatible = "jedec,spi-nor";
+               status = "okay";
+               #include "openbmc-flash-layout-128.dtsi"
+       };
+};
+
+//Host Console
+&uart1 {
+       status = "okay";
+};
+
+//BMC Console
+&uart5 {
+       status = "okay";
+};
+
+&gpio0 {
+        gpio-line-names =
+        /*A0-A7*/       "","","","","","","","",
+        /*B0-B7*/       "","","","","MON_POST_COMPLETE","P0_PRESENT_L","","",
+        /*C0-C7*/       "","","","","","","","",
+        /*D0-D7*/       "","","","","","","","",
+        /*E0-E7*/       "","","","","","","","",
+        /*F0-F7*/       "","","","","","","","",
+        /*G0-G7*/       "","","","","","","","",
+        /*H0-H7*/       "","ASSERT_WARM_RST_BTN_L","ASSERT_SOC_RST_BTN_L","","","","","",
+        /*I0-I7*/       "","","","","","","","P0_I3C_APML_ALERT_L",
+        /*J0-J7*/       "","","","","","","","",
+        /*K0-K7*/       "","","","","","","","",
+        /*L0-L7*/       "","","","","","","","",
+        /*M0-M7*/       "","","","","","","","",
+        /*N0-N7*/       "","","","","","","PSP_SOFT_FUSE_NOTIFY","ASSERT_BMC_READY",
+        /*O0-O7*/       "","","HDT_SEL","HDT_XTRIG5","HDT_XTRIG6","JTAG_TRST_N","","",
+        /*P0-P7*/       "MON_RST_BTN_L","ASSERT_RST_BTN_L","MON_PWR_BTN_L","ASSERT_PWR_BTN_L","HPM_FPGA_LOCKOUT","ASSERT_NMI_BTN_L","MON_PWR_GOOD","",
+        /*Q0-Q7*/       "","","HDT_DBREQ_L","","BIOS_SPD_MUX_CTRL_RELEASED_L","","","",
+        /*R0-R7*/       "","","","","","","","",
+        /*S0-S7*/       "","","","","","","P0_DIMM_AF_ERROR","P0_DIMM_GL_ERROR",
+        /*T0-T7*/       "","","","","","","","",
+        /*U0-U7*/       "","","","","","","","",
+        /*V0-V7*/       "","","","","","","","",
+        /*W0-W7*/       "","","","","","","","",
+        /*X0-X7*/       "","","","","","","","",
+        /*Y0-Y7*/       "","","","","","","","",
+        /*Z0-Z7*/       "","","","","","","","";
+};
-- 
2.34.1

