Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8361A6AD
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 02:35:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N40SW3XY7z3cV8
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 12:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=f8FtSEp9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=f8FtSEp9;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N40Pp1039z3bjn;
	Sat,  5 Nov 2022 12:33:34 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5E3C59EF;
	Fri,  4 Nov 2022 18:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667612009;
	bh=xgj6+RyP3+fdYbeBqCZfgI9FNhKfXrZXMEXZaUMUS9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f8FtSEp9bwgnnilDdnQjG/XxFHKBdZR0grBzDTLwRRgO7PM4R1y8WrScqMtDqn435
	 gHpR5T1Ck5t37mtr5h5eGGrzCcJXnPSgQ341TbLVsJm5wuDt3KTwR29IR1ZSzK5Ggv
	 cgLii24noEoWXBYcF9wQir+maOW2UJyLSkjAOUow=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	soc@kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: Add Delta AHE-50DC BMC
Date: Fri,  4 Nov 2022 18:33:21 -0700
Message-Id: <20221105013321.2719-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221105013321.2719-1-zev@bewilderbeest.net>
References: <20221105013321.2719-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a 1U Open19 power shelf with six PSUs and 50 12VDC outputs via
LM25066 efuses.  It's managed by a pair of AST1250 BMCs in a redundant
active/active configuration using a PCA9541 on each I2C bus to
arbitrate access between the two.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts | 1094 +++++++++++++++++
 2 files changed, 1095 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6aa7dc4db2fc..8961fbb2c0bc 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1588,6 +1588,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
+	aspeed-bmc-delta-ahe50dc.dtb \
 	aspeed-bmc-facebook-bletchley.dtb \
 	aspeed-bmc-facebook-cloudripper.dtb \
 	aspeed-bmc-facebook-cmm.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts b/arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
new file mode 100644
index 000000000000..3f1b7eb724d1
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-delta-ahe50dc.dts
@@ -0,0 +1,1094 @@
+// SPDX-License-Identifier: GPL-2.0+
+/dts-v1/;
+
+#include "aspeed-g4.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/{
+	model = "Delta Power AHE-50DC";
+	compatible = "delta,ahe50dc-bmc", "aspeed,ast2400";
+
+	aliases {
+		serial4 = &uart5;
+
+		/*
+		 * pca9541-arbitrated logical i2c buses are numbered as the
+		 * corresponding physical bus plus 20
+		 */
+		i2c20 = &i2carb0;
+		i2c21 = &i2carb1;
+		i2c22 = &i2carb2;
+		i2c23 = &i2carb3;
+		i2c24 = &i2carb4;
+		i2c26 = &i2carb6;
+		i2c27 = &i2carb7;
+		i2c28 = &i2carb8;
+		i2c32 = &i2carb12;
+	};
+
+	chosen {
+		stdout-path = &uart3;
+		bootargs = "console=ttyS2,115200n8 earlycon";
+	};
+
+	memory@40000000 {
+		reg = <0x40000000 0x10000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		panic {
+			gpios = <&gpio ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "panic";
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
+			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>;
+	};
+
+	efuse01 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse01>;
+	};
+
+	efuse02 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse02>;
+	};
+
+	efuse03 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse03>;
+	};
+
+	efuse04 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse04>;
+	};
+
+	efuse05 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse05>;
+	};
+
+	efuse06 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse06>;
+	};
+
+	efuse07 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse07>;
+	};
+
+	efuse08 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse08>;
+	};
+
+	efuse09 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse09>;
+	};
+
+	efuse10 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse10>;
+	};
+
+	efuse11 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse11>;
+	};
+
+	efuse12 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse12>;
+	};
+
+	efuse13 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse13>;
+	};
+
+	efuse14 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse14>;
+	};
+
+	efuse15 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse15>;
+	};
+
+	efuse16 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse16>;
+	};
+
+	efuse17 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse17>;
+	};
+
+	efuse18 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse18>;
+	};
+
+	efuse19 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse19>;
+	};
+
+	efuse20 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse20>;
+	};
+
+	efuse21 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse21>;
+	};
+
+	efuse22 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse22>;
+	};
+
+	efuse23 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse23>;
+	};
+
+	efuse24 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse24>;
+	};
+
+	efuse25 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse25>;
+	};
+
+	efuse26 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse26>;
+	};
+
+	efuse27 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse27>;
+	};
+
+	efuse28 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse28>;
+	};
+
+	efuse29 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse29>;
+	};
+
+	efuse30 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse30>;
+	};
+
+	efuse31 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse31>;
+	};
+
+	efuse32 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse32>;
+	};
+
+	efuse33 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse33>;
+	};
+
+	efuse34 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse34>;
+	};
+
+	efuse35 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse35>;
+	};
+
+	efuse36 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse36>;
+	};
+
+	efuse37 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse37>;
+	};
+
+	efuse38 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse38>;
+	};
+
+	efuse39 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse39>;
+	};
+
+	efuse40 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse40>;
+	};
+
+	efuse41 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse41>;
+	};
+
+	efuse42 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse42>;
+	};
+
+	efuse43 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse43>;
+	};
+
+	efuse44 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse44>;
+	};
+
+	efuse45 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse45>;
+	};
+
+	efuse46 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse46>;
+	};
+
+	efuse47 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse47>;
+	};
+
+	efuse48 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse48>;
+	};
+
+	efuse49 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse49>;
+	};
+
+	efuse50 {
+		compatible = "regulator-output";
+		vout-supply = <&efuse50>;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "flash0";
+		spi-max-frequency = <50000000>; // 50 MHz
+#include "openbmc-flash-layout.dtsi"
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&mac1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c0 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@79 {
+		compatible = "nxp,pca9541";
+		reg = <0x79>;
+
+		i2carb0: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* lm25066 efuses @ 10-17, 40-47, 50-57 */
+			efuse@10 {
+				compatible = "lm25066";
+				reg = <0x10>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse03: vout0 {
+						regulator-name = "efuse03-reg";
+					};
+				};
+			};
+
+			efuse@11 {
+				compatible = "lm25066";
+				reg = <0x11>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse04: vout0 {
+						regulator-name = "efuse04-reg";
+					};
+				};
+			};
+
+			efuse@12 {
+				compatible = "lm25066";
+				reg = <0x12>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse01: vout0 {
+						regulator-name = "efuse01-reg";
+					};
+				};
+			};
+
+			efuse@13 {
+				compatible = "lm25066";
+				reg = <0x13>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse02: vout0 {
+						regulator-name = "efuse02-reg";
+					};
+				};
+			};
+
+			efuse@14 {
+				compatible = "lm25066";
+				reg = <0x14>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse13: vout0 {
+						regulator-name = "efuse13-reg";
+					};
+				};
+			};
+
+			efuse@15 {
+				compatible = "lm25066";
+				reg = <0x15>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse14: vout0 {
+						regulator-name = "efuse14-reg";
+					};
+				};
+			};
+
+			efuse@16 {
+				compatible = "lm25066";
+				reg = <0x16>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse15: vout0 {
+						regulator-name = "efuse15-reg";
+					};
+				};
+			};
+
+			efuse@17 {
+				compatible = "lm25066";
+				reg = <0x17>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse16: vout0 {
+						regulator-name = "efuse16-reg";
+					};
+				};
+			};
+
+			efuse@40 {
+				compatible = "lm25066";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse12: vout0 {
+						regulator-name = "efuse12-reg";
+					};
+				};
+			};
+
+			efuse@41 {
+				compatible = "lm25066";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse11: vout0 {
+						regulator-name = "efuse11-reg";
+					};
+				};
+			};
+
+			efuse@42 {
+				compatible = "lm25066";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse10: vout0 {
+						regulator-name = "efuse10-reg";
+					};
+				};
+			};
+
+			efuse@43 {
+				compatible = "lm25066";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse09: vout0 {
+						regulator-name = "efuse09-reg";
+					};
+				};
+			};
+
+			efuse@44 {
+				compatible = "lm25066";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse08: vout0 {
+						regulator-name = "efuse08-reg";
+					};
+				};
+			};
+
+			efuse@45 {
+				compatible = "lm25066";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse07: vout0 {
+						regulator-name = "efuse07-reg";
+					};
+				};
+			};
+
+			efuse@46 {
+				compatible = "lm25066";
+				reg = <0x46>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse05: vout0 {
+						regulator-name = "efuse05-reg";
+					};
+				};
+			};
+
+			efuse@47 {
+				compatible = "lm25066";
+				reg = <0x47>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse06: vout0 {
+						regulator-name = "efuse06-reg";
+					};
+				};
+			};
+
+			efuse@50 {
+				compatible = "lm25066";
+				reg = <0x50>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse17: vout0 {
+						regulator-name = "efuse17-reg";
+					};
+				};
+			};
+
+			efuse@51 {
+				compatible = "lm25066";
+				reg = <0x51>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse18: vout0 {
+						regulator-name = "efuse18-reg";
+					};
+				};
+			};
+
+			efuse@52 {
+				compatible = "lm25066";
+				reg = <0x52>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse20: vout0 {
+						regulator-name = "efuse20-reg";
+					};
+				};
+			};
+
+			efuse@53 {
+				compatible = "lm25066";
+				reg = <0x53>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse19: vout0 {
+						regulator-name = "efuse19-reg";
+					};
+				};
+			};
+
+			efuse@54 {
+				compatible = "lm25066";
+				reg = <0x54>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse22: vout0 {
+						regulator-name = "efuse22-reg";
+					};
+				};
+			};
+
+			efuse@55 {
+				compatible = "lm25066";
+				reg = <0x55>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse21: vout0 {
+						regulator-name = "efuse21-reg";
+					};
+				};
+			};
+
+			efuse@56 {
+				compatible = "lm25066";
+				reg = <0x56>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse24: vout0 {
+						regulator-name = "efuse24-reg";
+					};
+				};
+			};
+
+			efuse@57 {
+				compatible = "lm25066";
+				reg = <0x57>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse23: vout0 {
+						regulator-name = "efuse23-reg";
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@72 {
+		compatible = "nxp,pca9541";
+		reg = <0x72>;
+
+		i2carb1: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@73 {
+		compatible = "nxp,pca9541";
+		reg = <0x73>;
+
+		i2carb2: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@74 {
+		compatible = "nxp,pca9541";
+		reg = <0x74>;
+
+		i2carb3: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@7a {
+		compatible = "nxp,pca9541";
+		reg = <0x7a>;
+
+		i2carb4: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gpio@20 {
+				compatible = "nxp,pca9534";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			/* lm25066 efuses @ 10-17, 40-47, 50-57, 59, 5a */
+			efuse@10 {
+				compatible = "lm25066";
+				reg = <0x10>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse27: vout0 {
+						regulator-name = "efuse27-reg";
+					};
+				};
+			};
+
+			efuse@11 {
+				compatible = "lm25066";
+				reg = <0x11>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse28: vout0 {
+						regulator-name = "efuse28-reg";
+					};
+				};
+			};
+
+			efuse@12 {
+				compatible = "lm25066";
+				reg = <0x12>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse25: vout0 {
+						regulator-name = "efuse25-reg";
+					};
+				};
+			};
+
+			efuse@13 {
+				compatible = "lm25066";
+				reg = <0x13>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse26: vout0 {
+						regulator-name = "efuse26-reg";
+					};
+				};
+			};
+
+			efuse@14 {
+				compatible = "lm25066";
+				reg = <0x14>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse37: vout0 {
+						regulator-name = "efuse37-reg";
+					};
+				};
+			};
+
+			efuse@15 {
+				compatible = "lm25066";
+				reg = <0x15>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse38: vout0 {
+						regulator-name = "efuse38-reg";
+					};
+				};
+			};
+
+			efuse@16 {
+				compatible = "lm25066";
+				reg = <0x16>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse39: vout0 {
+						regulator-name = "efuse39-reg";
+					};
+				};
+			};
+
+			efuse@17 {
+				compatible = "lm25066";
+				reg = <0x17>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse40: vout0 {
+						regulator-name = "efuse40-reg";
+					};
+				};
+			};
+
+			efuse@40 {
+				compatible = "lm25066";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse36: vout0 {
+						regulator-name = "efuse36-reg";
+					};
+				};
+			};
+
+			efuse@41 {
+				compatible = "lm25066";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse35: vout0 {
+						regulator-name = "efuse35-reg";
+					};
+				};
+			};
+
+			efuse@42 {
+				compatible = "lm25066";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse34: vout0 {
+						regulator-name = "efuse34-reg";
+					};
+				};
+			};
+
+			efuse@43 {
+				compatible = "lm25066";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse33: vout0 {
+						regulator-name = "efuse33-reg";
+					};
+				};
+			};
+
+			efuse@44 {
+				compatible = "lm25066";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse32: vout0 {
+						regulator-name = "efuse32-reg";
+					};
+				};
+			};
+
+			efuse@45 {
+				compatible = "lm25066";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse31: vout0 {
+						regulator-name = "efuse31-reg";
+					};
+				};
+			};
+
+			efuse@46 {
+				compatible = "lm25066";
+				reg = <0x46>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse29: vout0 {
+						regulator-name = "efuse29-reg";
+					};
+				};
+			};
+
+			efuse@47 {
+				compatible = "lm25066";
+				reg = <0x47>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse30: vout0 {
+						regulator-name = "efuse30-reg";
+					};
+				};
+			};
+
+			efuse@50 {
+				compatible = "lm25066";
+				reg = <0x50>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse41: vout0 {
+						regulator-name = "efuse41-reg";
+					};
+				};
+			};
+
+			efuse@51 {
+				compatible = "lm25066";
+				reg = <0x51>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse42: vout0 {
+						regulator-name = "efuse42-reg";
+					};
+				};
+			};
+
+			efuse@52 {
+				compatible = "lm25066";
+				reg = <0x52>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse44: vout0 {
+						regulator-name = "efuse44-reg";
+					};
+				};
+			};
+
+			efuse@53 {
+				compatible = "lm25066";
+				reg = <0x53>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse43: vout0 {
+						regulator-name = "efuse43-reg";
+					};
+				};
+			};
+
+			efuse@54 {
+				compatible = "lm25066";
+				reg = <0x54>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse46: vout0 {
+						regulator-name = "efuse46-reg";
+					};
+				};
+			};
+
+			efuse@55 {
+				compatible = "lm25066";
+				reg = <0x55>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse45: vout0 {
+						regulator-name = "efuse45-reg";
+					};
+				};
+			};
+
+			efuse@56 {
+				compatible = "lm25066";
+				reg = <0x56>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse48: vout0 {
+						regulator-name = "efuse48-reg";
+					};
+				};
+			};
+
+			efuse@57 {
+				compatible = "lm25066";
+				reg = <0x57>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse47: vout0 {
+						regulator-name = "efuse47-reg";
+					};
+				};
+			};
+
+			efuse@59 {
+				compatible = "lm25066";
+				reg = <0x59>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse49: vout0 {
+						regulator-name = "efuse49-reg";
+					};
+				};
+			};
+
+			efuse@5a {
+				compatible = "lm25066";
+				reg = <0x5a>;
+				shunt-resistor-micro-ohms = <675>;
+				regulators {
+					efuse50: vout0 {
+						regulator-name = "efuse50-reg";
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@75 {
+		compatible = "nxp,pca9541";
+		reg = <0x75>;
+
+		i2carb6: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c7 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@76 {
+		compatible = "nxp,pca9541";
+		reg = <0x76>;
+
+		i2carb7: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&i2c8 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@7c {
+		compatible = "nxp,pca9541";
+		reg = <0x7c>;
+
+		i2carb8: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fancontrol@30 {
+				compatible = "delta,ahe50dc-fan";
+				reg = <0x30>;
+			};
+
+			/* Baseboard FRU eeprom */
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
+&i2c12 {
+	status = "okay";
+	bus-frequency = <200000>;
+
+	pca9541@71 {
+		compatible = "nxp,pca9541";
+		reg = <0x71>;
+
+		i2carb12: i2c-arb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&gpio {
+	status = "okay";
+	gpio-line-names =
+		/*  A */ "", "", "", "", "", "", "", "",
+		/*  B */ "", "", "", "", "", "", "", "",
+		/*  C */ "RESET_PEER_N", "HEARTBEAT_OUT", "", "", "", "", "", "",
+		/*  D */ "", "", "", "", "", "", "", "",
+		/*  E */ "DOOM_N", "", "", "", "", "LED_PWR_BLUE", "", "",
+		/*  F */ "", "", "", "", "", "", "", "",
+		/*  G */ "", "", "", "", "", "", "", "",
+		/*  H */ "", "", "", "", "", "", "", "",
+		/*  I */ "", "", "", "", "", "", "", "",
+		/*  J */ "", "", "BMC_ID", "", "", "", "", "",
+		/*  K */ "", "", "", "", "", "", "", "",
+		/*  L */ "", "", "", "", "", "", "", "",
+		/*  M */ "", "", "", "", "", "", "", "",
+		/*  N */ "", "", "", "", "", "", "", "",
+		/*  O */ "", "", "", "", "", "", "", "",
+		/*  P */ "LED_GREEN", "", "LED_RED", "", "", "", "", "",
+		/*  Q */ "", "", "", "", "", "", "", "",
+		/*  R */ "", "", "", "", "", "", "", "",
+		/*  S */ "", "", "", "", "", "", "", "",
+		/*  T */ "", "", "", "", "", "", "", "",
+		/*  U */ "", "", "", "", "", "", "", "",
+		/*  V */ "", "", "", "", "", "", "", "",
+		/*  W */ "", "", "", "", "", "", "", "",
+		/*  X */ "", "", "", "", "", "", "", "",
+		/*  Y */ "HEARTBEAT_IN", "BOARDREV0", "BOARDREV1", "",
+		/*  Z */ "", "", "", "", "", "", "", "",
+		/* AA */ "", "", "", "", "", "", "", "",
+		/* AB */ "", "", "", "";
+
+	/*
+	 * I don't rightly know what this GPIO really *is*, but setting it to
+	 * zero causes the fans to run at full speed, after which setting it
+	 * back to one causes a power output glitch, so install a hog to keep
+	 * it at one as a failsafe to ensure nothing accidentally touches it.
+	 */
+	doom-guardrail {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(E, 0) GPIO_ACTIVE_LOW>;
+		output-low;
+	};
+};
+
+&adc {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default
+		&pinctrl_adc1_default
+		&pinctrl_adc2_default
+		&pinctrl_adc3_default
+		&pinctrl_adc4_default
+		&pinctrl_adc5_default
+		&pinctrl_adc6_default
+		&pinctrl_adc7_default
+		&pinctrl_adc8_default
+		&pinctrl_adc9_default>;
+};
-- 
2.38.1

