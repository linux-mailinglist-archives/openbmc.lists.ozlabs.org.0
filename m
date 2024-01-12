Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DB82B92F
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 02:39:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=US844+rS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB42y1x1mz3dSM
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 12:39:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=US844+rS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::618; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB40b0ZBZz3cTT
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2024 12:37:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlohzVpgfNXZPRkJC4GDJmk25iAUkIU4Z7CcGbNKD+8EAVxWCdDbdgfa+nOgE3J7wDI/cYbv0mO/qeYeZuDHkFKM1etDkSFxcq9P9yDcER5z5eIn3uUjtCBuLLp2ueLWRoNfITjSAS3BUy0q0aFsyf3m7TaHvxrGmgjyXBw/Wih/pgY8D8ySuel4Z+nsaGiH5tIFYX9azCL7yF9Bjeaka2u14BH2Jhze9NmMJ/uuLDIl6l0rvzXxRz6qSNvx7E+jbiaNv/qUbum25OzjL98zWeTo6xXrmWFuy5MmPujAQC3iUz5aV18w0F7oyePdl77Av+34zE5PQsJ1TJA6Kdp4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55r7rRg3OFGKnF3ZbHh09PV2s+Dpp0rmZqmYn+KeSWc=;
 b=ABjLruMNsYzTF2ldwMki+S7HOMV+TOPe9kIWBd0pBqbDy0zmAGWsBXmWroqr2TCDDIKrxSo//0CmsNDujOD2aQWmgDPEaD/1PJ25/9f41D3z7YJiD+U2A70OSYLDqU156Y07z7x5C2Ydjy1pg7cYpO/WyYatrBPnQ/lgjpRxl87DvPiY4H/+q5UC9JOy6+0zftxLsxjrPhtsKLRgplN7gk5ZHMEbLPK8O/eHiJJIy7moQ3j8yySV5ZDrlX+SxeZPcdcI90V9gjTRKHcmxG//dXfN4VZEOxSV4/Lbdzw2FI2URPlkFC3L2IPfH2uhQNw4zl97GEerpK2t9c0ZoHqzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55r7rRg3OFGKnF3ZbHh09PV2s+Dpp0rmZqmYn+KeSWc=;
 b=US844+rSNlgiUt7zD6w31Cuonc9KMtt+rFJibK0joEHFj3C8/sJLhUV/6F6TSDCTaEa6jG2mB+i9Kuju6BBiYA9hgH2zhOHqXvofxQr1OjF5sSVxrNe2tYgWV6oXhgUEG8GKNbDl3StDi62u40M4WIjZup/L8IiwFx+HWYjJBMuboH+RQ3+cv3HYaRaY8xZcH7wS+uxDJeDr+/DZR7yKyQ5XrM873Pvci3eD/T2kpsyIcU5KE1y2uTVfO6WFWd58QiF5ajtd0n3kkDDHrxR7yfzXaJFOFNCoyqWjHP3KXQyFlm2Jg4SoQEeTNqvqD2ZnyRcACEWp8A/oaxUysW0OFQ==
Received: from SI2PR04CA0004.apcprd04.prod.outlook.com (2603:1096:4:197::22)
 by SEYPR04MB6941.apcprd04.prod.outlook.com (2603:1096:101:d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 01:37:08 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::5) by SI2PR04CA0004.outlook.office365.com
 (2603:1096:4:197::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 01:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server id 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 01:37:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 2/2] ARM64: dts: nuvoton: Add initial yosemitev4 device tree
Date: Fri, 12 Jan 2024 09:36:52 +0800
Message-Id: <20240112013654.1424451-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112013654.1424451-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240112013654.1424451-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|SEYPR04MB6941:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6481a677-fad7-4a5e-7724-08dc130efd98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nN75EPeaegWkqKhrKCiqEQuvhaVxge3wuMlXzeAV2SfpsSnUByTjfyeIACEgkV7LtXKJZND1df/gg0aYYeDAQaqdmwOY2tEsQNPwxEE84rMcmUwTdYILNEAwvXJk6Qk925sRdeYyW34DkCzZeNEq0D338YmRxwGL/7UckyRwPn1MTzCcf0HS/H1uMBZpNNhDr6f4zocr2wZD+0aNPb/bF2nIqzxfbsceYP4jSZi5znHpPSYSp/ynsknGYU/FZ3tzTT+FQAvlAIBR6zLpwX+fY8JhIs1UjFG60c3pcm9keJIDBf4rWHf7h6d5pI66CrkP7TxffMCfncyk2RavtVKWSyvMVcNrCEeUqqDyLGQtVCM8KK32uPUPvljgXcLzCeuWF+9WNkjj6o8EzJ1o/6qp+ASNK1t2a0nzV86IoKnhIZi2NYUJfDKAiq3OYCfxTHrcv8eZUwKdTGxjsAB3IDNJoS/8/XTbP8Szqf4wt6Hb1oBM0tIvri64oCJ5U282ojpB/dMQgFN4o5qKquGhAfQvbZRm/gmtWodSzlzvEES6ai/rxbhJQuxz+uMfNCCCOulUwME6ep1k2wZdgnpTxN5BMDE9+ldSVxRQoFLLGO/NkxeBSEA7q9l3DFUctJ3QAmyz7qQ52xdA/DozsDnt+n3QbMZ10nRDhDUn8iwnYXSladvLxbr+7WkcvISGPgAJ8GMjPeS3SHUXvT6h8PmiobejdYRQSJsiYPF9RZi8wRueZWY=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(921011)(9316004)(2616005)(356005)(82740400003)(7416002)(30864003)(5660300002)(36860700001)(4326008)(956004)(81166007)(2906002)(83380400001)(40480700001)(8936002)(8676002)(47076005)(26005)(1076003)(70586007)(70206006)(336012)(36736006)(110136005)(6486002)(54906003)(41300700001)(6512007)(316002)(36756003)(478600001)(6506007)(86362001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 01:37:08.2209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6481a677-fad7-4a5e-7724-08dc130efd98
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6941
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add linux device tree entry related to
Yosemite 4 specific devices connected to BMC SoC.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile          |    1 +
 .../dts/nuvoton/nuvoton-npcm845-yosemite4.dts | 1493 +++++++++++++++++
 2 files changed, 1494 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index 3bc9787801a5..2b3c03083dc0 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -2,3 +2,4 @@
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
+dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-yosemite4.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts
new file mode 100644
index 000000000000..f6a6a47b1397
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-yosemite4.dts
@@ -0,0 +1,1493 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 Facebook Inc.
+
+/dts-v1/;
+#include "nuvoton-npcm845.dtsi"
+#include "nuvoton-npcm845-pincfg-evb.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+
+/ {
+	model = "Facebook Yosemite 4 BMC";
+	compatible = "facebook,yosemite4-n-bmc", "nuvoton,npcm845";
+
+	aliases {
+		serial4 = &serial0;
+		serial0 = &serial1;
+		serial1 = &serial3;
+		serial2 = &serial4;
+		serial3 = &serial5;
+		serial5 = &cpld_serial0;
+		serial6 = &cpld_serial1;
+		serial7 = &cpld_serial2;
+		serial8 = &cpld_serial3;
+		fiu0 = &fiu0;
+
+		i2c16 = &imux16;
+		i2c17 = &imux17;
+		i2c18 = &imux18;
+		i2c19 = &imux19;
+		i2c20 = &imux20;
+		i2c21 = &imux21;
+		i2c22 = &imux22;
+		i2c23 = &imux23;
+		i2c24 = &imux24;
+		i2c25 = &imux25;
+		i2c26 = &imux26;
+		i2c27 = &imux27;
+		i2c28 = &imux28;
+		i2c29 = &imux29;
+		i2c30 = &imux30;
+		i2c31 = &imux31;
+		i2c32 = &imux32;
+		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
+	};
+
+	chosen {
+		stdout-path = &serial0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tip_reserved: tip@0x0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+		};
+	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-sck = <&gpio0 19 GPIO_ACTIVE_HIGH>; // GPIO19
+		gpio-mosi = <&gpio0 18 GPIO_ACTIVE_HIGH>; // GPIO18
+		gpio-miso = <&gpio0 17 GPIO_ACTIVE_HIGH>; // GPIO17
+		num-chipselects = <1>;
+		cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>; // GPIO203
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+
+	cpld_serial0: cpld_uart@f8000800 {
+		device_type = "serial";
+		compatible = "ns16450";
+		reg = <0x0 0xf8000800 0x0 0x200>;
+		reg-shift = <0>;
+		clocks = <&clk NPCM8XX_CLK_UART>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	cpld_serial1: cpld_uart@f8000a00 {
+		device_type = "serial";
+		compatible = "ns16450";
+		reg = <0x0 0xf8000a00 0x0 0x200>;
+		reg-shift = <0>;
+		clocks = <&clk NPCM8XX_CLK_UART>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	cpld_serial2: cpld_uart@f8000c00 {
+		device_type = "serial";
+		compatible = "ns16450";
+		reg = <0x0 0xf8000c00 0x0 0x200>;
+		reg-shift = <0>;
+		clocks = <&clk NPCM8XX_CLK_UART>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	cpld_serial3: cpld_uart@f8000e00 {
+		device_type = "serial";
+		compatible = "ns16450";
+		reg = <0x0 0xf8000e00 0x0 0x200>;
+		reg-shift = <0>;
+		clocks = <&clk NPCM8XX_CLK_UART>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&serial4 {
+	status = "okay";
+};
+
+&serial5 {
+	status = "okay";
+};
+
+&watchdog1 {
+	status = "okay";
+};
+
+&watchdog2 {
+	status = "okay";
+};
+
+&gmac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+			&r1oen_pins>;
+	use-ncsi;
+};
+
+&gmac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r2_pins
+			&r2oen_pins>;
+	use-ncsi;
+};
+
+&fiu0 {
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions@80000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bmc@0 {
+				label = "bmc";
+				reg = <0x00000000 0x08000000>;
+				};
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x00000000 0x003C0000>;
+				};
+			u-boot-env@3c0000 {
+				label = "u-boot-env";
+				reg = <0x003C0000 0x00040000>;
+				};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x00400000 0x00800000>;
+				};
+			rofs@c00000 {
+				label = "rofs";
+				reg = <0x00C00000 0x03000000>;
+				};
+			rwfs@3c00000 {
+				label = "rwfs";
+				reg = <0x3C00000 0x400000>;
+				};
+		};
+	};
+};
+
+&fiux {
+	spix-mode;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spix_pins>;
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
+&i3c1 {
+	reg = <0xfff11000 0x1000>,
+	      <0xf0851000 0x1000>,
+	      <0xf0800304 0x4>;
+	status = "okay";
+	i3c-scl-hz = <8000000>;
+	i2c-scl-hz = <400000>;
+	dma-mux = <8>;
+	use-dma;
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo = "1.2V";
+		cp1-ldo = "1.2V";
+		tp0145-ldo = "1.2V";
+		tp2367-ldo = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
+&i3c2 {
+	reg = <0xfff12000 0x1000>,
+	      <0xf0852000 0x1000>,
+	      <0xf0800308 0x4>;
+	status = "okay";
+	i3c-scl-hz = <8000000>;
+	i2c-scl-hz = <400000>;
+	dma-mux = <10>;
+	use-dma;
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo = "1.2V";
+		cp1-ldo = "1.2V";
+		tp0145-ldo = "1.2V";
+		tp2367-ldo = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
+
+		imux16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux18: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux19: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+	};
+};
+
+&i2c9 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x71>;
+
+		imux20: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux21: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux22: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+
+		imux23: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			gpio@49 {
+				compatible = "nxp,pca9537";
+				reg = <0x49>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@51 {
+				compatible = "atmel,24c128";
+				reg = <0x51>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c128";
+				reg = <0x54>;
+			};
+		};
+	};
+};
+
+&i2c10 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	i2c-mux@74 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x74>;
+
+		imux28: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9506";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@21 {
+				compatible = "nxp,pca9506";
+				reg = <0x21>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@22 {
+				compatible = "nxp,pca9506";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@23 {
+				compatible = "nxp,pca9506";
+				reg = <0x23>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			gpio@24 {
+				compatible = "nxp,pca9506";
+				reg = <0x24>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				gpio-line-names =
+				"","","","",
+				"NIC0_MAIN_PWR_EN","NIC1_MAIN_PWR_EN",
+				"NIC2_MAIN_PWR_EN","NIC3_MAIN_PWR_EN",
+				"","","","","","","","",
+				"","","","","","","","",
+				"","","","","","","","";
+			};
+		};
+
+		imux29: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	power-sensor@10 {
+		compatible = "adi,adm1272";
+		reg = <0x10>;
+	};
+
+	power-sensor@12 {
+		compatible = "adi,adm1272";
+		reg = <0x12>;
+	};
+
+	gpio_ext1: pca9555@20 {
+		compatible = "nxp,pca9555";
+		pinctrl-names = "default";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V_OCP_GPIO1","P48V_OCP_GPIO2",
+		"P48V_OCP_GPIO3","FAN_BOARD_0_REVISION_0_R",
+		"FAN_BOARD_0_REVISION_1_R","FAN_BOARD_1_REVISION_0_R",
+		"FAN_BOARD_1_REVISION_1_R","RST_MUX_R_N",
+		"RST_LED_CONTROL_FAN_BOARD_0_N","RST_LED_CONTROL_FAN_BOARD_1_N",
+		"RST_IOEXP_FAN_BOARD_0_N","RST_IOEXP_FAN_BOARD_1_N",
+		"PWRGD_LOAD_SWITCH_FAN_BOARD_0_R","PWRGD_LOAD_SWITCH_FAN_BOARD_1_R",
+		"","";
+	};
+
+	gpio_ext2: pca9555@21 {
+		compatible = "nxp,pca9555";
+		pinctrl-names = "default";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"DELTA_MODULE_TYPE","VSENSE_ERR_VDROP_R",
+		"EN_P48V_AUX_0","EN_P48V_AUX_1",
+		"MEDUSA_BOARD_REV_0","MEDUSA_BOARD_REV_1",
+		"MEDUSA_BOARD_REV_2","MEDUSA_BOARD_TYPE",
+		"HSC_OCP_SLOT_ODD_GPIO1","HSC_OCP_SLOT_ODD_GPIO2",
+		"HSC_OCP_SLOT_ODD_GPIO3","HSC_OCP_SLOT_EVEN_GPIO1",
+		"HSC_OCP_SLOT_EVEN_GPIO2","HSC_OCP_SLOT_EVEN_GPIO3",
+		"ADC_TYPE_0_R","ADC_TYPE_1_R";
+	};
+
+	gpio_ext3: pca9555@22 {
+		compatible = "nxp,pca9555";
+		pinctrl-names = "default";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD_TYPE_SLOT1","CARD_TYPE_SLOT2",
+		"CARD_TYPE_SLOT3","CARD_TYPE_SLOT4",
+		"CARD_TYPE_SLOT5","CARD_TYPE_SLOT6",
+		"CARD_TYPE_SLOT7","CARD_TYPE_SLOT8",
+		"OC_P48V_HSC_0_N","FLT_P48V_HSC_0_N",
+		"PWRGD_P12V_AUX_1","OC_P48V_HSC_1_N",
+		"FLT_P48V_HSC_1_N","PWRGD_P12V_AUX_1",
+		"MEDUSA_ADC_EFUSE_TYPE_R","P12V_HSC_TYPE";
+	};
+
+	gpio_ext4: pca9555@23 {
+		compatible = "nxp,pca9555";
+		pinctrl-names = "default";
+		gpio-controller;
+		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1_ALERT1_R_N","HSC2_ALERT1_R_N",
+		"HSC3_ALERT1_R_N","HSC4_ALERT1_R_N",
+		"HSC5_ALERT1_R_N","HSC6_ALERT1_R_N",
+		"HSC7_ALERT1_R_N","HSC8_ALERT1_R_N",
+		"HSC1_ALERT2_R_N","HSC2_ALERT2_R_N",
+		"HSC3_ALERT2_R_N","HSC4_ALERT2_R_N",
+		"HSC5_ALERT2_R_N","HSC6_ALERT2_R_N",
+		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
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
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
+	};
+
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
+	};
+
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
+
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adc@1d {
+		compatible = "ti,adc128d818";
+		reg = <0x1d>;
+		ti,mode = /bits/ 8 <1>;
+	};
+
+	adc@36 {
+		compatible = "ti,adc128d818";
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
+	};
+
+	adc@37 {
+		compatible = "ti,adc128d818";
+		reg = <0x37>;
+		ti,mode = /bits/ 8 <1>;
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
+	i2c-mux@74 {
+		compatible = "nxp,pca9546";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reg = <0x74>;
+
+		imux30: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			pwm@20{
+				compatible = "maxim,max31790";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+
+			gpio@22{
+				compatible = "ti,tca6424";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			pwm@2f{
+				compatible = "maxim,max31790";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
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
+		imux31: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			adc@1f {
+				compatible = "ti,adc128d818";
+				reg = <0x1f>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			pwm@20{
+				compatible = "maxim,max31790";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
+			};
+
+			gpio@22{
+				compatible = "ti,tca6424";
+				reg = <0x22>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			pwm@2f{
+				compatible = "maxim,max31790";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
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
+		i2c-mux-idle-disconnect;
+		reg = <0x73>;
+
+		imux32: i2c@0 {
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
+		imux33: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
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
+	clock-frequency = <400000>;
+	mctp-controller;
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-mux@72 {
+		compatible = "nxp,pca9544";
+		reg = <0x72>;
+
+		imux24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux26: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		imux27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			mctp-controller;
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+	};
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
+&sgpio1 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+			&jtag2_pins
+			&lpc_pins
+			&pin47
+			&pin4_slew
+			&pin5_slew
+			&pin6_slew
+			&pin7_slew
+			&pin242_slew
+			&pin243_slew
+			&pin244_slew
+			&pin245_slew
+			&bmcuart1_pins
+			&bu4_pins
+			&bu5_pins>;
+
+	gpio0: gpio@f0010000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"","","","","FM_BMC_RTCRST_R","PWRGD_P5V_USB_BMC",
+			"FLAG_P5V_USB_BMC_N","RST_USB_HUB_R_N",
+		"IRQ_BRIDGE_BMC_N","","","","RST_BMC_BRIDGE_R_N",
+			"EN_NIC0_POWER_BMC_R","EN_NIC1_POWER_BMC_R","PWRGD_SLOT6_STBY",
+		"","","","","","","","",
+		"RST_SMB_NIC2_R_N","PWRGD_SLOT5_STBY","","","","","","";
+	};
+
+	gpio1: gpio@f0011000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"","","","PRSNT_SB_SLOT2_BMC_N","PRSNT_SB_SLOT1_BMC_N",
+			"ALT_RTC_BMC_N","ALT_TEMP_BMC_N","PRSNT_OCP_DEBUG_BMC_N",
+		"PRSNT_TPM_BMC_N","","","","INT_SMB_BMC_SLOT1_4_BMC_N",
+			"PRSNT_SB_SLOT4_BMC_N","PWRGD_SLOT2_STBY","",
+		"","","","","","","PWRGD_SLOT3_STBY","PWRGD_SLOT4_STBY",
+		"","RST_PCIE_SLOT7_N","RST_PCIE_SLOT8_N","","",
+			"PWRGD_SLOT1_STBY","PRSNT_SB_SLOT3_BMC_N","";
+	};
+
+	gpio2: gpio@f0012000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"INT_SMB_BMC_SLOT5_8_BMC_N","AC_ON_OFF_BTN_CPLD_SLOT7_N",
+			"AC_ON_OFF_BTN_CPLD_SLOT8_N","FM_RESBTN_SLOT1_BMC_N",
+			"FM_RESBTN_SLOT2_BMC_N","FM_RESBTN_SLOT3_BMC_N",
+			"FM_RESBTN_SLOT4_BMC_N","FM_RESBTN_SLOT5_BMC_N",
+		"FM_RESBTN_SLOT6_BMC_N","FM_RESBTN_SLOT7_BMC_N",
+			"FM_RESBTN_SLOT8_BMC_N","FLT_HSC_SERVER_SLOT4_N",
+			"FLT_HSC_SERVER_SLOT5_N","FLT_HSC_SERVER_SLOT6_N",
+			"FLT_HSC_SERVER_SLOT7_N","FLT_HSC_SERVER_SLOT8_N",
+		"","","","PRSNT_SB_SLOT5_BMC_N","","","","",
+		"","","","RST_SMB_NIC1_R_N","PRSNT_NIC2_N","FM_NIC3_WAKE_N",
+			"AC_ON_OFF_BTN_CPLD_SLOT5_N","";
+	};
+
+	gpio3: gpio@f0013000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"RST_SMB_NIC3_R_N","","","","","","","",
+		"","","","","PWRGD_SLOT7_STBY","PWRGD_SLOT8_STBY",
+			"AC_ON_OFF_BTN_CPLD_SLOT4_N","AC_ON_OFF_BTN_CPLD_SLOT3_N",
+		"AC_ON_OFF_BTN_CPLD_SLOT2_N","AC_ON_OFF_BTN_CPLD_SLOT1_N","","","",
+			"","","",
+		"SEL_BMC_JTAG_MUX_R","PWRGD_SLOT5_STBY","SPI_LOCK_REQ_BMC_N",
+			"SPI_WP_DISABLE_STATUS_R_N","ALT_SMB_BMC_CPLD1_N",
+			"EN_P5V_USB_CPLD_R","RST_SMB_NIC0_R_N",
+			"INT_MEDUSA_IOEXP_TEMP_N";
+	};
+
+	gpio4: gpio@f0014000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"","","","","","","","",
+		"","","","","","","","",
+		"PRSNT_SB_SLOT6_BMC_N","PRSNT_SB_SLOT7_BMC_N",
+			"PRSNT_SB_SLOT8_BMC_N","FM_PWRBRK_NIC_BMC_R2",
+			"ALT_MEDUSA_ADC_N","ALT_SMB_BMC_CPLD2_N",
+			"ALT_MEDUSA_P12V_EFUSE_N","",
+		"RST_PCIE_SLOT2_N","RST_PCIE_SLOT1_N","RST_PCIE_SLOT3_N",
+			"RST_PCIE_SLOT6_N","FLT_HSC_SERVER_SLOT1_N",
+			"FLT_HSC_SERVER_SLOT2_N","INT_SPIDER_ADC_R_N","";
+	};
+
+	gpio5: gpio@f0015000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"","","RTS_BRIDGE_BMC_SLOT5_N","","","","","",
+		"","RTS_BRIDGE_BMC_SLOT6_N","RTS_BRIDGE_BMC_SLOT7_N","","","","",
+			"",
+		"","","","","","","","",
+		"","","","","FM_NIC1_WAKE_N","PRSNT_NIC1_N",
+			"RTS_BRIDGE_BMC_SLOT8_N","AC_ON_OFF_BTN_CPLD_SLOT6_N";
+	};
+
+	gpio6: gpio@f0016000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"FM_NIC0_WAKE_N","","EN_NIC3_POWER_BMC_R","","EN_NIC2_POWER_BMC_R",
+			"","FLT_HSC_SERVER_SLOT3_N","RST_PCIE_SLOT5_N",
+		"","","","","FM_BMC_READY_R2","ALT_SPIDER_TMP75_R_N",
+			"ALT_SPIDER_INA233_R_N","",
+		"FAST_PROCHOT_N","RST_PCIE_SLOT4_N","FM_NIC2_WAKE_N","",
+			"INT_FANBOARD1_IOEXP_N","INT_FANBOARD0_IOEXP_N","","",
+		"","","","","","","","";
+	};
+
+	gpio7: gpio@f0017000 {
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names =
+		"","","","","","BTN_BMC_R2_N","EN_P3V_BAT_SCALED_R","",
+		"","","","","","","","ALT_P12V_AUX_N",
+		"","","","","","","","",
+		"","","","","","","","";
+	};
+};
+
-- 
2.25.1

