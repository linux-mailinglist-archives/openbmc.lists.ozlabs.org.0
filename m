Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D7707772
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 03:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMCCH5Fjnz3f4H
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 11:32:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JuzJPtjM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:704b::62d; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=JuzJPtjM;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMCBZ0Lmgz2xBF
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 11:32:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqAPyGpq+nB6D5Qn9nKLPR94GJkfAD6e+WWnRp9imXjZOQV8/N3NrcYpzUHoTdZhzPWej0SbkXL1lXVsuaomy7LQhKzxIV7EWxSY1rDYrsi7SSkyWduD80LiS44vTmZLSFYjwVwL4C5CtF8wOYu+P6awxN6HUrAedLFHBUGEgUr+/2KuthmO98Fy5UAq0XiQ1ogsLeNYYqIOgYkH4kTbqgLhkk5U3Bhx0bcf9thSpARlXWxmM6jyUflPTc00ODXF0Me8ILdf56N+Cp8GnZqd+evkM0ULjvJg5s8Wh17/Pxhr9J6HjX4ZPYLgRPBxk/3pIHiVwLDNtpWZLmGWh2N8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67d24pST0VDpNC7N27Rm1aUtBEWbOIoS5fPQvTz2DQw=;
 b=WI5R7ZVWBqehKpN9KP0ldeA1sDcnKRfBwytlb8IsH3TGUpNbE/IdRVAZFqQjOsGit3KeeYgZ1aziiGi7JpeBC4ZgIM35EPMQj/IDfxPfi3dv24f6KzsAFkiIrMbjEnXemIJ3RWH1uUYW0EmnqNuTMM4mG62IRsKx2g8tJ86zx1jy4loh0n+yTrNl78N/0Bz9OmjN7EHRv8mp/xxarxMxnFCvaf6QB3WztgbM3tnrGDkdgzxDM4FkoKYEnjLU7O6vPsnu+g7GwUNtHDPUbnjCrruX11fau4Oaf5ndcudjnKgvsyWHPwXTcqE1H/UKpjIPy/CrLEIdygNH/2pRGFaUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67d24pST0VDpNC7N27Rm1aUtBEWbOIoS5fPQvTz2DQw=;
 b=JuzJPtjM0YU6T5EAH0oggzBg+OQ0Ofnp+od50rP55WXuiWObuO/n5AD1Kn3IzD76xjhHI55mhfCG88daXcSSEbTCecN714svz9ixu044R6qgpWPoEQQkQhBn2T+mBhK4HwjxTsx/dCRqN2yJEDMC85i6qcwTQR4JPJbbODw9E6nXcCIuX2jnY+9z9P+nuBaFJq2kVDH7bmDcW3gv6MfzInidDwsXs8QBo2bwr65X4+h9g7EgZLEKdx/9p0YV/UEzUwednAmN+php1ogw99gljg7FdIeoiFSFkU4YHfeTihMWbR9NdPPLbg6r1JBadgFNuZpkcEUxroYubmoGC3c6Uw==
Received: from SL2P216CA0161.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b::20)
 by TYZPR04MB6278.apcprd04.prod.outlook.com (2603:1096:400:287::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 01:31:43 +0000
Received: from PSAAPC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:1b:cafe::1b) by SL2P216CA0161.outlook.office365.com
 (2603:1096:101:1b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Thu, 18 May 2023 01:31:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 PSAAPC01FT047.mail.protection.outlook.com (10.13.38.133) with Microsoft SMTP
 Server id 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 01:31:42
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: add Meta greatlakes board (AST2600)
Date: Thu, 18 May 2023 09:31:37 +0800
Message-Id: <20230518013138.46394-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221208040554.43012-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20221208040554.43012-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT047:EE_|TYZPR04MB6278:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6afba7e9-cea9-4bf3-a981-08db573fa2bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HZK1b375brELejUIJCsDaQkMqFM5fDtiJgq+w8ygPpYGpR58Cyg2SZsLIM4Pwj8hxYhfCtBgXttDfg+HAfUU6xAfoC47X7qY7gY2XJMPreyyn2r9xtJFwjRUbPWhu3eo0uTGeQpXOaYre6YgMgW2yKv4J9K8UKLXMyDl3nW4J/OFnQPeaf/YQ0WXUVCZt8c36fV2n9GdBu57pddr7FsCyQkrxPGman3WLrcq6Ot7kfyCk1ykX6JNwFuQJPUD3qph6Gyw/0+8WVNINwvGnCfnixef64MNTKF4T1c82lACEa3vjk+VTkj6x5BifLA5Ss9Ehu2IesxIIQqZdg441wrFCM2UIYbsqXFVwKiPL8vAgqFA5tnRxSlOAyCYqMz0oyV3uEBHtD7W7KqICYvPWhwfCOAX9YJyoZW0M68GvfQNyZA0jXnH3Gk7A3ldxarpv6GuiPkK4IXDINtLn0PQeItOG8sSS9KoAQv7YNnj/V5wEiszH4BvMlf2II+EL4HHHXXivKEwKGw5pHSp3Pn7/KRT13syvtsRj3ZORMyVSuIMj9TAEzPM9vnJYt7Vknyg8QP3FCkXkqHwnIGbJhgHSnmwGUBjercsAFIuvZEx0yP+4C91wuINrcDyYZByyA6XXUCqRrTKhU7crYAOOYeF/rueB8cl4tG+fxh/8M6N/QqJHm7MxAFstD8oC4Fzel7LhWlRw0dAr1c5tOFcwVDBikkEnQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(346002)(396003)(39850400004)(376002)(136003)(451199021)(36840700001)(46966006)(336012)(86362001)(36756003)(9316004)(40480700001)(82310400005)(8676002)(5660300002)(26005)(6512007)(6506007)(8936002)(956004)(2616005)(1076003)(316002)(186003)(54906003)(70206006)(70586007)(36736006)(478600001)(6916009)(4326008)(41300700001)(36860700001)(6666004)(82740400003)(6486002)(356005)(81166007)(83380400001)(47076005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 01:31:42.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afba7e9-cea9-4bf3-a981-08db573fa2bc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	PSAAPC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6278
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
Cc: Albert Aribaud <albert.u.boot@aribaud.net>, Zev Weiss <zev@bewilderbeest.net>, Eddie James <eajames@linux.ibm.com>, u-boot@lists.denx.de, Joel Stanley <joel@jms.id.au>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

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

