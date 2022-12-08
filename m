Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 735B9646814
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 05:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSLFT2YTZz3bgH
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 15:06:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SKLDY6P3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::628; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SKLDY6P3;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSLDs4ZXXz3bTh
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 15:06:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BE341s+6XbtyA8FxgxPtWGBtiPxKBBqcF3eWioJ+vidp6Sd5Ce29Mcq2bZEA+NjbB/eJW+E4P7GJ+PLTkHWrRdkK8nboCCd6O/lTmTCyzPOHkp32miHVYFyDt5vA5m1FOVK0pcxyxEh1/Qwefp18/irsoxZF1BplKfAlMNeJl7VPN19Rm0tyORdJWnRjqtVhKx8uBhnbkinZdlDGg5PnV74s+sJFwFlJ/IpqO47TpAJ7LAUo+KXfbqAHg6c7crbswJRR6ReCwcVHqXudTXscWhvWmnb0XVkQzM7/c4Pmlb/VzPYPH6ezJ656YkVENVh2060C7zot+xmh6FLUr/3fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxJuLwI0r9pdowZClSF1A/MpyZTQJpSTUtaSR4DRplQ=;
 b=DPZmmhJ8lhht7zy31LRyRYaerX6et/sMHtekn+O8AnW1a5iIILy8p4crUMlRiU2gu3DfQQ51etrmqn3UTh7p3pyQ9Gu2zrJ0M+r/gAoUFWG99ye7pbzMuAY8YH2GsbFQC9aG2w+w/XVhhlGfXd37TBO8WJdnfdnhNWj2DrBNvMgTiJYqKcyT4RLnVxyrb/cGmh4SxMnWYJ8iahQuvGrXyNGZ+pehTxBCWq/LBzcgzA8xUu0kjwhZPI5K5zQALYqNoqJI4b+8Kb67cYLAOFEK3OL34Sz9K8qtRkH6HzG/JonZWC/NKj5f7bmzqVnktdGdK4lrZPCM1qY9tBY1DdramA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxJuLwI0r9pdowZClSF1A/MpyZTQJpSTUtaSR4DRplQ=;
 b=SKLDY6P34oUoWitm6xFdsQhIZ6EHM0+gY2QBMTRS2gzeBCocO0rDaUBHnQRg16p+sVVRuaVRXVRksfjUGBQWJcB+61o5I7CUs16+G08fV7thZV2lHn5gCncTXKTV6qCdqXkxJvZNQk5vfWXlZxBjDCBn6j4SjdwCW0q+QwEFK7ZiJFNfaY1JQjGs+tD0nIMID4taVn3+fhCPSAlOyKgUQiCHRpJLvH23kPKiAOW2x1zkW4qOSvfp6KW3JczoHEsWUecMWAayAZD5k6s9SXHkPkmoggZe0YQ53G5SB8SqmdbfU9Omy8w22cI8bCMykS9KKNlcZQTy2CkYMh4qm6sOZQ==
Received: from TYCP286CA0068.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31a::8)
 by SI2PR04MB6115.apcprd04.prod.outlook.com (2603:1096:4:1fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 04:05:59 +0000
Received: from TYZAPC01FT040.eop-APC01.prod.protection.outlook.com
 (2603:1096:400:31a:cafe::6a) by TYCP286CA0068.outlook.office365.com
 (2603:1096:400:31a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Thu, 8 Dec 2022 04:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT040.mail.protection.outlook.com (10.118.152.126) with Microsoft
 SMTP Server id 15.20.5901.16 via Frontend Transport; Thu, 8 Dec 2022 04:05:57
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [u-boot,v2019.04-aspeed-openbmc] ARM: dts: aspeed: add Meta greatlakes board (AST2600)
Date: Thu,  8 Dec 2022 12:05:52 +0800
Message-Id: <20221208040554.43012-1-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT040:EE_|SI2PR04MB6115:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd652b6e-3225-432e-9dc1-08dad8d18293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Z6R8ETpR20rLsiIBgr3A+Lv+RzrmvZStLHk5fktt6f2aawi4rsYGtgXHdcNS4VNSsdBj3pkhiN59w1NdHXZ/dbxGgTCE7eupvNjSDk9FrrvfEsPuW2Z8vCZfqhUMexy+d5aBdMt79YgwmdzFlXQs9CQYyUmyiUX9CqaxNjrl7Arj0CIqL2jdAu9DpSgy1sxtDjWefWtQoyG0oJWBPph4yE2NjceL5Eq439Sno5j6fVINnV+UkqI8dHB59F95zQ1uKI3exMe/Qit9Z0KK/s7N6OrleDJvtxxR3UXGnv7RkPaBqBCLj8x4v+M+MPyNqsQd80DQJkSrm4IurpiL3ka6vWk8hsnrWi4boAwiBD2Vyc/ofF8+kf2UoCs3pnljSxRZPmTM0vZoMBzoAr/R94X7+V08SGMDk40okECjZd0XFeF42T5qNWzpTZDO/nzkGZXBtkE3pcNcasFMk+AOzG6kb1R1aHCMRYP6eG96/BJbS9/0+7l+G7BE9qYOf/VOLRI9s0xMDxPnfOL5Dzbxipc3N+QBgQ7kBlbEsY2pBGQTGVDGj/zxRZbBng076OGGKQ5eL/hhHWkcmF6aHpCp22P9y/oFj4qUyKUKv32XXEwK9gLa/sqDhSOnuGeeDoCGstttUjqI8SgahHl0m8SiG8Sxj98ylZLDWwpmlF1BNFtWd7E=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(9316004)(82740400003)(6666004)(82310400005)(6486002)(6512007)(356005)(81166007)(86362001)(6506007)(26005)(54906003)(8936002)(47076005)(2906002)(36736006)(36906005)(316002)(41300700001)(186003)(36756003)(336012)(70206006)(2616005)(478600001)(4326008)(8676002)(956004)(70586007)(1076003)(7416002)(40480700001)(83380400001)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 04:05:57.0887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd652b6e-3225-432e-9dc1-08dad8d18293
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT040.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6115
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, u-boot@lists.denx.de, Potin Lai <potin.lai@quantatw.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, George Hung <ghung.quanta@gmail.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Alan Kuo <Alan_Kuo@quantatw.com>, Graeme Gregory <quic_ggregory@quicinc.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
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

