Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46AF707852
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 05:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMFPk5p22z3f6G
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 13:11:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A7pbBTk8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::620; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=A7pbBTk8;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMFP63xWbz3bsy
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 13:11:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geUHQOqz2fO+mRJIyXRioN7S+va0mtEsN08jvb9MHkc+L8MWupFI29O6bCyCBS3cylbVKwe34zOGwdilI/HTKAM9fhEpcIwhfbD2snOR90ZJTDCWUhEoxE5/9izQNmTTmpllC+eB4qV9vx1hPaU8Zzu21eyQPsvTmTgzoA85VkquCoCVGAz1gOzyAgQ0kv122JvpgtV8+lGW+4fyOO/nQEgWeBL9bJNzcaoK5dAcslOsVaAvmYe9+MtWZz+tIBuWWd/9N8xZtzl9UiaJeYaD3j0/WLLcQ6YhIwUZqfWOSza/zaSLN5aNrTzS44lrAmowMN0jiStVKr3c4U4Pk4SSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztPZ0RVVaj/hART9RC82io3+A0I6tg8crTsGI0/hFpQ=;
 b=TPrRx0SeZGIPucxcsyDEMhKUbPMJsmO9orn39cw4pijOwrH2AQi4TmQmbd0I0k3htYWlWQUHRd/kCs0lfx0nwLIBkdP5TWpplOhZd2Bh6HyzAUADeWFggBBBqXb2uSsWXqdBt9T0YW/gxNwSU4jgnld6nC5ejhMb9oBbGft5kQm20BEt3G5gBz3nqU0EbXboc4K+4bPyxORKlVmgfcXCh0WZ6kBOJQ4Qz21x6iLwiXO62FNVR+MkqKm0I+Nu9J3/1m7SuQy2k43+B3Tk15Kht0YX7M1ey5oSX6RW02vROs2RKX21+kf5qq9OjTbZYwTYChsZgWiTXWJSfsjp1uVqSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztPZ0RVVaj/hART9RC82io3+A0I6tg8crTsGI0/hFpQ=;
 b=A7pbBTk8ZE/EYxiN18jB3ptzNnzl9BsFOYBB3BIb3NlpKTK8Ci7fYdvgXkIONhxCGnJYIv/0U9z2v6ITOuAZ4MqtOTVXyGRFnsxdK/ffD7s8u7ySjSwu4eY+SGrPbVAEwnkysqUztdZRyOBlhhFZj+PEo7yVKNir0vgsE49/LHoMuZqnekFDbkxgUz4/QOP5eOM21xtOkWJXUudPBI/mzGWYsVYbtyUiXxM6wKEUZHNTJPdHyQjYDa7znJmx4fu5HP/XVILkTUnoi/+GJdlmuDXQY2ocKAEV5QTrco6tFxBkiljaUGpFxJDm8sSb31GToY3v8sdksNytkw95U5wnRA==
Received: from TY2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:404:42::23)
 by PSAPR04MB4151.apcprd04.prod.outlook.com (2603:1096:301:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Thu, 18 May
 2023 03:10:57 +0000
Received: from TYZAPC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:42:cafe::f) by TY2PR06CA0011.outlook.office365.com
 (2603:1096:404:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Thu, 18 May 2023 03:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 TYZAPC01FT055.mail.protection.outlook.com (10.118.152.83) with Microsoft SMTP
 Server id 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 03:10:56
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] [u-boot,v2023.05-aspeed-openbmc] ARM: dts: aspeed: add Meta greatlakes board (AST2600)
Date: Thu, 18 May 2023 11:10:52 +0800
Message-Id: <20230518031053.46830-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT055:EE_|PSAPR04MB4151:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e3f6e2a-fddd-48d2-334b-08db574d7f6f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	e1ZDvuXbYkWnIbsU+nhEkWqdFMrBIWMX27jY+UsdJydQBCWpr4jadHXLKh4r5cANP7BJ8HT9734ARRyaWZC7xXMQ7UV1djmlULyWNmutMSKrYBiJGNXQ8mWqXt06+BXgRzK3k4wYJLoEbLRDobSVuhJfzQpqtMI8BJ+eUnuniLjuhhd4gvAH5X+ED6n2Fub/PvR4AF6c8TmcFo1t0wwSTN021e2sHwEMEfq4VV5H+j5FZ3kwanqTeFmWCnub3jJWCAePs7XjhciGLUBdwU8RWdfkNaSh85PWQpNDEOJQdAPr/ISLkIxQGAm+IugktewzsieGT5+yICy3gerMeeImEFE1Vt7c1BwC323JGt6aEaWXXZpISXWSoAP2Axj68cY4VZMDRf++NNldIui2r9MHzA+0yBtnyn7P/x0Njp7P5ICrWyMeZBOvhYy20Q/3SgOTdD3qt9rYU4jpAr7Bl75bcy0R/j3vu7aQg1X51Bnf1SFNhqsedCD8NZJTt5X67nF52ZLkafEFHwCJ6d8kJlGAcvIzSWH6f5GCYGW84d8pGhZuOszdhfpij049ktXO+CkEJtApC1PB0AbPbND/lsSlx6x1OEvZCY1+VVXAOb6VYxox7VeeYdP2wtHGcfSeQRTnSQaAKUokH+KXVZ6hAQYLYUtaVJOF5+gnIElJAZhWihRwDL6R7d2/Mu0IkmdHoJ7gIq5izvewLmfK2zUWQYl7Mw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(346002)(136003)(376002)(39850400004)(396003)(451199021)(36840700001)(46966006)(36736006)(70206006)(70586007)(8936002)(6916009)(5660300002)(4326008)(8676002)(478600001)(2906002)(54906003)(6486002)(41300700001)(316002)(6666004)(1076003)(26005)(6506007)(82740400003)(186003)(6512007)(956004)(40480700001)(36860700001)(2616005)(336012)(36756003)(83380400001)(356005)(82310400005)(86362001)(81166007)(9316004)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 03:10:56.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3f6e2a-fddd-48d2-334b-08db574d7f6f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	TYZAPC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4151
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Zev Weiss <zev@bewilderbeest.net>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, u-boot@lists.denx.de, Joel Stanley <joel@jms.id.au>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial version of device tree for Meta Greatlakes BMC which is
equipped with Aspeed AST2600 BMC SoC.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/dts/Makefile                 |   1 +
 arch/arm/dts/ast2600-greatlakes.dts   | 205 ++++++++++++++++++++++++++
 configs/ast2600_openbmc_spl_defconfig |   1 +
 3 files changed, 207 insertions(+)
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
index 0000000000..59d6c7a087
--- /dev/null
+++ b/arch/arm/dts/ast2600-greatlakes.dts
@@ -0,0 +1,205 @@
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
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
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

