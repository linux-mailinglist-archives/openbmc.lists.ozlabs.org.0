Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0059664D706
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:11:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXk0s5VwCz2yN9
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:11:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NSdJn9Wv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=NSdJn9Wv;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRjTf2T7sz2xkD
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 14:30:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nndbOSiDf/5zd+mEBY4tdw3JPMOgFPWAIceg9CxHvN5zlXM3JIkSIamdGrQB85wV9jD31Lobn7kji/BGgnW18Zq54CceBbPllG7EDjd+enrB1E1eMTCeip0R07uaNqujuzkx68R7UnomLom2wVWfE9Dv3piQZWPlRmZTFfUim+DN6FMi529BzkMMcYZVgQgMGI+GgbfY67uPRzWx+UIm/eY9jM3Q8pyfr+gEF+ZNpKd+5ELK9wzpr0Ksrw2z3VMYnm0oSQipsrCqEkSn2eog0pydrMPaK+v3JZjtKJRxIijBl56durQ34dHIItxqcxVxnoGDg8hhYc1iJayxCXGxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxJuLwI0r9pdowZClSF1A/MpyZTQJpSTUtaSR4DRplQ=;
 b=PvBTh3lwvCydmpbRp3rAmHz93Ae/2L5DlM8v9SL3Gbpw7OJVOlDsjQvbm04ybZwpmcIV4u6d9ypicstwYw+Z/smS07JWe0byyZDRbxU1RDnp7mdjXB8KL1zu22gDwPwdtGkIOilYsbfUGTaSLaskVVHaBbFcdXA363+kBpZ7Y/d/59wryNI0DemTW1cd826KeuO+xJYccG3k+E0UCLxihQH/ULfwx7xHEtBBYo+FN50+bFhszSQpOmirihtBIRa+fJooPWK5CxTwiTF5YfQ2ADdp4Cvte4VHJHjxnt+OHk2y4fmOZ5yjWO4/SIECtKDjrPmfVWJXo/Dfpm60+YMShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxJuLwI0r9pdowZClSF1A/MpyZTQJpSTUtaSR4DRplQ=;
 b=NSdJn9WvEjERL/GNSMZZGVBAfnbzKQw0ysM8y9fOMJkGnzGJRkq4DpFrd+geunQQjbOPylXYq/MdEcXpJy+PaglRF78GBacqlSojYweCZ+VqurS+YHxBbc/TIcOFj29o7tn+ken8QmEhvbbxWcgSiUuFGGv8xe03mQpZaLnlqEY3lJ0y+ixdMzt//QEDU6uXxYXvdmHqRXq+ThAunJdbRcjCUXby6no3DWwZJvkszG97mbqWAJ6WJ8xN4PRwCOQcGw7SkmOcSoqCyqRPYYKKUr38+C2ZuI7KBJdI7KtILQzsR3Y6U/iXIj7HRTProdKoZsSEfqNhtcac6kr0+6yaFw==
Received: from SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) by
 KL1PR04MB6900.apcprd04.prod.outlook.com (2603:1096:820:d4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Wed, 7 Dec 2022 03:29:47 +0000
Received: from SG2APC01FT0049.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::60) by SG2PR06CA0184.outlook.office365.com
 (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 03:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2APC01FT0049.mail.protection.outlook.com (10.13.36.134) with Microsoft SMTP
 Server id 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 03:29:45
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH] ARM: dts: aspeed: add Meta greatlakes board (AST2600)
Date: Wed,  7 Dec 2022 11:28:37 +0800
Message-Id: <20221207032838.35715-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0049:EE_|KL1PR04MB6900:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f0cfb02b-e7da-44ee-10e5-08dad8034a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5ueAixUcR8bGDvlvMp97b9jdv6at3N7E/NRTcJ8DFMoH4YShrx/baWfIasbBmInIJekCVlF52m1bG/5PBoW6z/oHG4lY30syzBbYdECkLHG2ve+xDa+TXIa6bGyArrWRl0nv7by8sYUjBhQpgUhbVxkU1l24AyAdj6WBI7K2hT5hj7GSQoMXCBmsnylwY+iDZS7LXp9/JuM3yNeES2y5qiwOACkUzSJweD2EIzlkqSrofqT3fnJgYCfAv1Wmlwu+pLcByZ1tpkqjFEpmJ4tTDhhzRjTWh+NzjgFTVxOuIgrK2CxK487EmZFLaz67Dki7/K7ya0yHT9621uysNZSlNzZ3rEyT7StrZ/7I56QjO/5woAt01Du7uOpeb/IFATTbd5d6ncck1Y8n1EfyNuVKGdLRb0yKltjnrAGKop79UPejFmFWyaKW9wCelkcDLedEBRiP0CTKSqkozuDeBfoNNCIdjnQJrHG0aXJo2ukPw1N+Ap07LCe+/Fsq2XJEH3TynQ0q65b+ZE1Ic6M/W5wrskcaILtQRImSxWD5TGKumA3MFmIgawDhXbhIQhqMmiddRfJY35b33i+ip6JiFqXqp/8kZfy7Bb+qAn9GNx6qYYeRCclvjRwtbySSnxj+2u8KfAIy90cpzeGGd1I2TlETB1tuIcdrZhfJjjSmPnIZnCQ=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(8936002)(4326008)(7416002)(8676002)(2906002)(5660300002)(70206006)(70586007)(41300700001)(6486002)(478600001)(6506007)(26005)(6666004)(6512007)(356005)(956004)(40480700001)(81166007)(2616005)(36756003)(1076003)(336012)(54906003)(186003)(36906005)(86362001)(82740400003)(316002)(82310400005)(47076005)(83380400001)(9316004)(36736006)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 03:29:45.7608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cfb02b-e7da-44ee-10e5-08dad8034a1c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2APC01FT0049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6900
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, u-boot@lists.denx.de, George Hung <ghung.quanta@gmail.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Alan Kuo <Alan_Kuo@quantatw.com>, Graeme Gregory <quic_ggregory@quicinc.com>, Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for Meta Greatlakes BMC which is
equipped with Aspeed AST2600 BMC SoC.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
---
 arch/arm/dts/Makefile                 |   1 +
 arch/arm/dts/ast2600-greatlakes.dts   | 191 ++++++++++++++++++++++++++
 configs/ast2600_openbmc_spl_defconfig |   1 +
 3 files changed, 193 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-greatlakes.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..c9cb54cddd 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-evb.dtb \
 	ast2600-dcscm.dtb \
 	ast2600-fpga.dtb \
+	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
diff --git a/arch/arm/dts/ast2600-greatlakes.dts b/arch/arm/dts/ast2600-greatlakes.dts
new file mode 100644
index 0000000000..94caf295da
--- /dev/null
+++ b/arch/arm/dts/ast2600-greatlakes.dts
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Greatlakes BMC";
+	compatible = "facebook,greatlakes-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet3 = &mac3;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy3: ethernet-phy@3 {
+		reg = <0>;
+	};
+};
+
+&mac3 {
+	status = "okay";
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii4_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+};
+
+&gpio0 {
+	status = "okay";
+	line_148 {
+		gpio-hog;
+		gpios = <148 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc-slot1-isolated-enabled";
+	};
+	line_149 {
+		gpio-hog;
+		gpios = <149 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc-slot2-isolated-enabled";
+	};
+	line_150 {
+		gpio-hog;
+		gpios = <150 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc-slot3-isolated-enabled";
+	};
+	line_151 {
+		gpio-hog;
+		gpios = <151 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "bmc-slot4-isolated-enabled";
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1_default>;
+};
+
+&i2c1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2_default>;
+};
+
+&i2c2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3_default>;
+};
+
+&i2c3 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c4_default>;
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac1-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac2-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
index 95d7651b8e..efd683570f 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -100,6 +100,7 @@ CONFIG_ASPEED_ACRY=y
 CONFIG_DM_GPIO=y
 CONFIG_SPL_GPIO_HOG=y
 CONFIG_ASPEED_GPIO=y
+CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_ASPEED=y
 CONFIG_MISC=y
-- 
2.17.1

