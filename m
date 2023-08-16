Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA177DA39
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 08:08:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QVCtkMB8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQd4G3pf4z3cTQ
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 16:08:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=QVCtkMB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQd1R6PS5z2yVc;
	Wed, 16 Aug 2023 16:06:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeO+hTSUI/QB3bGNeswXHdhMpdhp1Hewpoc/1JZ2lRqX9dZmzKfICaLOAxaUYdMDhUWXUSWv73+DWiBgXecuP5t6obxKQny4ciV0hPu0XrT7thkfyhJg+MGccglQM4mxyMhm26meJL2qL2GpzxRMVRWvY/mMExHykcUc0MzkRpZ+xXeMK1Cp4RDLVnGY1Pm7TGQxrT2YGVCrd/OQXqLiO9vsiN03AYqUZalUVNNR9KZKZlWQs2WLs23gAdosWYQe51Plpln8q9BF0po05A//ywsVq9caTrytkGxLdQsiRnajRO5STRG8eieNHuAGIuFDAIUxnRQ+SZAQxcvcQti6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkhLnRn2t6fAPbL9ZsCxOtSIBibxuf8KgcZsrq0Vaig=;
 b=cfc/neRFVFkEfZy1Bdd8d2bsDOKlB5p6XRoS7TP6NuYA/VPdQm4uzjvAtiW+5EKi0GYEXuzsUuvyhn+kAJyzt5aN+1GJhOTyq3Mfmrr87MJFEADCb6abbvag3SGp2kedBIC0sBm6T6z3uieCM/lAG5i3ZVm98Mh0aaaZeiH0EZimicxxjCsbeUEccxqDCLQlPk9OwS9+7UwM0W4HjnP+QgKZFykjMgrPC3m0ZifSupck+92jsF3U5kGQDT0FHNy6KP5GNo+3jWn6HMudcdngaDLinLgoARZ4VY3UU3q5PTRddAxbJJ9kPy4oer6d/HP/yx1Yl2unGrIhiN6mxoLwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=wiwynn.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkhLnRn2t6fAPbL9ZsCxOtSIBibxuf8KgcZsrq0Vaig=;
 b=QVCtkMB85jtdkvhlxjxCKvCfMa6rHpt965R9TAFrN83G3VAJ02GNxy2WXnkB8b1+LHXg9FHTXzF3Syv9L5NcLfUIHS7tvi+01PCPWAxC82w511m+DdJQ/CG2FpI5+jzQo+Z8P0J5YEpigtNO2zD4Jx8uaNHd+HRRhLafKov4he/KguCL3JmwCM7gc2AcC2jzyZbCyGp0n42TObfuoQsxDg7dAbXk4/COxBQl1TWvXPLNIGlRD1p4201ZUoEr3zFG/lu/1gTRZztwnGtgO4Sb6RohfPOfy1PH7SISxTDSn6PtuPmTClS1udAdU1HWMD1Jt/MwTa/JLgxaum6o1cTGcA==
Received: from KL1PR02CA0001.apcprd02.prod.outlook.com (2603:1096:820:c::6) by
 TY2PR04MB4063.apcprd04.prod.outlook.com (2603:1096:404:8002::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:06:00 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:820:c:cafe::8f) by KL1PR02CA0001.outlook.office365.com
 (2603:1096:820:c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.15 via Frontend
 Transport; Wed, 16 Aug 2023 06:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 06:05:59
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: openbmc@lists.ozlabs.org,
	patrick@stwcx.xyz,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.1 v1 2/2] ARM: dts: aspeed: yosemite4: add Meta Yosemite 4 BMC
Date: Wed, 16 Aug 2023 14:05:47 +0800
Message-Id: <20230816060547.40489-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230816060547.40489-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|TY2PR04MB4063:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9f94ffd2-b2d6-405c-7911-08db9e1edd14
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xcd2DDGh/PSeX6NaPJm+fD4Y3NXkIr331UZjTkSCsqeN27/C1WQQqnkKiVWZla9LXy25Q+rZ8+EfJr1YZ1mLKLDYoQ6QvnffPHDJhj4GoZpwxIbt8NB26bJJxkjKuXX6WeNJD/sy0Gx8z8PamCA+pJeKfxvuws7n56bj0gtqida1+KbVl6agzVd6QZdjRQ/3s3vuPYpFXNhmeCCYmIqRcYGjoN+MDsrySuoopj/3tVYPAJYPgLIArZJgZUVmzZxKoswEh25SwgRzjwiJ3QHegX9HhKgH+UWij+s7jLiN4Kp2wqHIKUxXxqODYdbYG7nOqYM7cPYnRq0Mo4tqN/j+WPJGAO+F5VmIKaHz9BBF6ZkNlqhzheFsN2tTOdmPPs1auQttolbQdYGClqEQ3wTweETp85DIMSsTYQZJ3lpIkvUbAYQQ7WzM3V8GDkADeZXpM8JIGZBPlOhbbXnKL4D3GIDZtdjykdTA6ZgfGgaJmk0feGAhvB6GNfvq30XX9QlRkCkKl3nzcGrOn3N/SZKSM3Ai/ZHGoNC7s/JmIudntO3Fw2fsFmdu0ZSN0kMJGE8uEsJbqK/+P2xMeZgXGQqJvIbg47rl9y+LcLYR+VvkHt8UJiIP2SIxACWmZymMAMoFPtgyy1oiic0DJdkNLMB2fnqNWyftOXhe6d5FwBV9RzuADn/TOchDPMsFzLme9g5u79mPonEyLW1HELMsrP34MQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(396003)(39850400004)(346002)(136003)(1800799009)(82310400011)(451199024)(186009)(46966006)(36840700001)(6666004)(36736006)(70586007)(70206006)(6512007)(6486002)(6506007)(30864003)(2906002)(478600001)(1076003)(336012)(26005)(9316004)(110136005)(7416002)(5660300002)(2616005)(956004)(41300700001)(316002)(47076005)(36860700001)(8936002)(4326008)(82740400003)(8676002)(81166007)(356005)(36756003)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:05:59.5714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f94ffd2-b2d6-405c-7911-08db9e1edd14
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4063
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add linux device tree entry for Yosemite 4 devices connected to BMC.
The Yosemite 4 is a Meta multi-node server platform, based on AST2600 SoC.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../dts/aspeed-bmc-facebook-yosemite4.dts     | 624 ++++++++++++++++++
 2 files changed, 625 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6a897ff40ff0..9e1d7bf3cff6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1597,6 +1597,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-galaxy100.dtb \
 	aspeed-bmc-facebook-greatlakes.dtb \
 	aspeed-bmc-facebook-minipack.dtb \
+	aspeed-bmc-facebook-yosemite4.dtb \
 	aspeed-bmc-facebook-tiogapass.dtb \
 	aspeed-bmc-facebook-wedge40.dtb \
 	aspeed-bmc-facebook-wedge100.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts
new file mode 100644
index 000000000000..1ef3ff849ec1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemite4.dts
@@ -0,0 +1,624 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 Facebook Inc.
+
+/dts-v1/;
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Yosemite 4 BMC";
+	compatible = "facebook,yosemite4-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+		serial5 = &uart6;
+		serial6 = &uart7;
+		serial7 = &uart8;
+		serial8 = &uart9;
+	};
+
+	chosen {
+		stdout-path = "serial4:57600n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
+				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
+				<&adc1 0>, <&adc1 1>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&uart6 {
+	status = "okay";
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&uart8 {
+	status = "okay";
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+	aspeed,reset-type = "soc";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+	aspeed,ext-pulse-duration = <256>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	use-ncsi;
+	mlx,multi-host;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	use-ncsi;
+	mlx,multi-host;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc2";
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <50000000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	mctp-controller;
+	bus-frequency = <400000>;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	power-sensor@40 {
+		compatible = "adi,adm1278";
+		reg = <0x40>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	bus-frequency = <400000>;
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		idle-state = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+	bus-frequency = <400000>;
+	i2c-mux@71 {
+		compatible = "nxp,pca9544";
+		idle-state = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x71>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+	bus-frequency = <400000>;
+};
+
+&i2c11 {
+	status = "okay";
+	power-sensor@10 {
+		compatible = "adi, adm1272";
+		reg = <0x10>;
+	};
+
+	power-sensor@12 {
+		compatible = "adi, adm1272";
+		reg = <0x12>;
+	};
+
+	gpio@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9555";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9555";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	temperature-sensor@49 {
+		compatible = "ti,tmp75";
+		reg = <0x49>;
+	};
+
+	temperature-sensor@4a {
+		compatible = "ti,tmp75";
+		reg = <0x4a>;
+	};
+
+	temperature-sensor@4b {
+		compatible = "ti,tmp75";
+		reg = <0x4b>;
+	};
+
+	eeprom@54 {
+		compatible = "atmel,24c256";
+		reg = <0x54>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	bus-frequency = <400000>;
+
+	temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+
+	rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+	bus-frequency = <400000>;
+};
+
+&i2c14 {
+	status = "okay";
+	bus-frequency = <400000>;
+	adc@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <2>;
+	};
+
+	adc@35 {
+		compatible = "ti,adc128d818";
+		reg = <0x35>;
+		ti,mode = /bits/ 8 <2>;
+	};
+
+	adc@37 {
+		compatible = "ti,adc128d818";
+		reg = <0x37>;
+		ti,mode = /bits/ 8 <2>;
+	};
+
+	power-sensor@40 {
+		compatible = "ti,ina230";
+		reg = <0x40>;
+	};
+
+	power-sensor@41 {
+		compatible = "ti,ina230";
+		reg = <0x41>;
+	};
+
+	power-sensor@42 {
+		compatible = "ti,ina230";
+		reg = <0x42>;
+	};
+
+	power-sensor@43 {
+		compatible = "ti,ina230";
+		reg = <0x43>;
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina230";
+		reg = <0x44>;
+	};
+
+	temperature-sensor@4e {
+		compatible = "ti,tmp75";
+		reg = <0x4e>;
+	};
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9846";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		idle-state = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x71>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <2>;
+			};
+
+			pwm@20{
+				compatible = "max31790";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gpio@22{
+				compatible = "ti,tca6424";
+				reg = <0x22>;
+			};
+
+			pwm@23{
+				compatible = "max31790";
+				reg = <0x23>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			adc@33 {
+				compatible = "maxim,max11615";
+				reg = <0x33>;
+			};
+
+			eeprom@52 {
+				compatible = "atmel,24c128";
+				reg = <0x52>;
+			};
+
+			gpio@61 {
+				compatible = "nxp,pca9552";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <2>;
+			};
+
+			pwm@20{
+				compatible = "max31790";
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gpio@22{
+				compatible = "ti,tca6424";
+				reg = <0x22>;
+			};
+
+			pwm@23{
+				compatible = "max31790";
+				reg = <0x23>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			adc@33 {
+				compatible = "maxim,max11615";
+				reg = <0x33>;
+			};
+
+			eeprom@52 {
+				compatible = "atmel,24c128";
+				reg = <0x52>;
+			};
+
+			gpio@61 {
+				compatible = "nxp,pca9552";
+				reg = <0x61>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+
+	i2c-mux@73 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		idle-state = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x73>;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@35 {
+				compatible = "maxim,max11617";
+				reg = <0x35>;
+			};
+		};
+
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@35 {
+				compatible = "maxim,max11617";
+				reg = <0x35>;
+			};
+		};
+	};
+};
+
+&i2c15 {
+	status = "okay";
+	mctp-controller;
+	multi-master;
+	bus-frequency = <400000>;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9544";
+		idle-state = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x72>;
+	};
+};
+
+&adc0 {
+	ref_voltage = <2500>;
+	status = "okay";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+			&pinctrl_adc2_default &pinctrl_adc3_default
+			&pinctrl_adc4_default &pinctrl_adc5_default
+			&pinctrl_adc6_default &pinctrl_adc7_default>;
+};
+
+&adc1 {
+	ref_voltage = <2500>;
+	status = "okay";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+};
+
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
-- 
2.25.1

