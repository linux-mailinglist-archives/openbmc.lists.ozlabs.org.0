Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A9275DDC
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 18:50:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxPLk6HsMzDqW7
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 02:50:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxPHv6s2lzDqW2
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 02:48:11 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08NGliYV021313;
 Wed, 23 Sep 2020 19:47:44 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 1933C639D6; Wed, 23 Sep 2020 19:47:44 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v7 5/5] arm: dts: add new device nodes to NPCM750 device tree
 EVB
Date: Wed, 23 Sep 2020 19:47:30 +0300
Message-Id: <20200923164730.176881-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200923164730.176881-1-tmaimon77@gmail.com>
References: <20200923164730.176881-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the following new device nodes to
NPCM750 evolution board device tree:

        - NPCM7xx Pin controller and GPIO
        - NPCM7xx PWM and FAN.
        - NPCM7xx EHCI USB.
        - NPCM7xx KCS.
        - NPCM Reset.
        - NPCM Peripheral SPI.
        - NPCM FIU SPI.
        - NPCM HWRNG.
        - NPCM I2C.
        - STMicro STMMAC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 405 +++++++++++++++++-
 .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++++++
 2 files changed, 546 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 15f744f1beea..1623a18ac29b 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -4,36 +4,409 @@
 
 /dts-v1/;
 #include "nuvoton-npcm750.dtsi"
+#include "dt-bindings/gpio/gpio.h"
+#include "nuvoton-npcm750-pincfg-evb.dtsi"
 
 / {
 	model = "Nuvoton npcm750 Development Board (Device Tree)";
 	compatible = "nuvoton,npcm750";
 
+	aliases {
+		ethernet2 = &gmac0;
+		ethernet3 = &gmac1;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
+	};
+
 	chosen {
 		stdout-path = &serial3;
 	};
 
 	memory {
-		reg = <0 0x40000000>;
+		device_type = "memory";
+		reg = <0x0 0x20000000>;
 	};
-};
 
-&watchdog1 {
-	status = "okay";
-};
+	ahb {
+		gmac0: eth@f0802000 {
+			phy-mode = "rgmii-id";
+			status = "okay";
+		};
 
-&serial0 {
-	status = "okay";
-};
+		gmac1: eth@f0804000 {
+			phy-mode = "rgmii-id";
+			status = "okay";
+		};
 
-&serial1 {
-	status = "okay";
-};
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
 
-&serial2 {
-	status = "okay";
-};
+		fiu0: spi@fb000000 {
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				spi-rx-bus-width = <2>;
+				reg = <0>;
+				spi-max-frequency = <5000000>;
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bbuboot1@0 {
+						label = "bb-uboot-1";
+						reg = <0x0000000 0x80000>;
+						read-only;
+						};
+					bbuboot2@80000 {
+						label = "bb-uboot-2";
+						reg = <0x0080000 0x80000>;
+						read-only;
+						};
+					envparam@100000 {
+						label = "env-param";
+						reg = <0x0100000 0x40000>;
+						read-only;
+						};
+					spare@140000 {
+						label = "spare";
+						reg = <0x0140000 0xC0000>;
+						};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x400000>;
+						};
+					rootfs@600000 {
+						label = "rootfs";
+						reg = <0x0600000 0x700000>;
+						};
+					spare1@D00000 {
+						label = "spare1";
+						reg = <0x0D00000 0x200000>;
+						};
+					spare2@0F00000 {
+						label = "spare2";
+						reg = <0x0F00000 0x200000>;
+						};
+					spare3@1100000 {
+						label = "spare3";
+						reg = <0x1100000 0x200000>;
+						};
+					spare4@1300000 {
+						label = "spare4";
+						reg = <0x1300000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: spi@c0000000 {
+			pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				spi-rx-bus-width = <2>;
+				reg = <0>;
+				spi-max-frequency = <5000000>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "spi3-system1";
+						reg = <0x0 0x0>;
+					};
+				};
+			};
+		};
+
+		fiux: spi@fb001000 {
+			spix-mode;
+		};
+
+		apb {
+
+			watchdog1: watchdog@901C {
+				status = "okay";
+			};
+
+			rng: rng@b000 {
+				status = "okay";
+			};
+
+			serial0: serial@1000 {
+				status = "okay";
+			};
+
+			serial1: serial@2000 {
+				status = "okay";
+			};
+
+			serial2: serial@3000 {
+				status = "okay";
+			};
+
+			serial3: serial@4000 {
+				status = "okay";
+			};
+
+			adc: adc@c000 {
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			lpc_kcs: lpc_kcs@7000 {
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
 
-&serial3 {
-	status = "okay";
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			/* lm75 on SVB */
+			i2c0: i2c@80000 {
+				clock-frequency = <100000>;
+				status = "okay";
+				lm75@48 {
+					compatible = "lm75";
+					reg = <0x48>;
+					status = "okay";
+				};
+			};
+
+			/* lm75 on EB */
+			i2c1: i2c@81000 {
+				clock-frequency = <100000>;
+				status = "okay";
+				lm75@48 {
+					compatible = "lm75";
+					reg = <0x48>;
+					status = "okay";
+				};
+			};
+
+			/* tmp100 on EB */
+			i2c2: i2c@82000 {
+				clock-frequency = <100000>;
+				status = "okay";
+				tmp100@48 {
+					compatible = "tmp100";
+					reg = <0x48>;
+					status = "okay";
+				};
+			};
+
+			i2c3: i2c@83000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c5: i2c@85000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			/* tmp100 on SVB */
+			i2c6: i2c@86000 {
+				clock-frequency = <100000>;
+				status = "okay";
+				tmp100@48 {
+					compatible = "tmp100";
+					reg = <0x48>;
+					status = "okay";
+				};
+			};
+
+			i2c7: i2c@87000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c8: i2c@88000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c9: i2c@89000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c10: i2c@8a000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c11: i2c@8b000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c14: i2c@8e000 {
+				clock-frequency = <100000>;
+				status = "okay";
+			};
+
+			pwm_fan:pwm-fan-controller@103000 {
+				status = "okay";
+				fan@0 {
+					reg = <0x00>;
+					fan-tach-ch = /bits/ 8 <0x00 0x01>;
+					cooling-levels = <127 255>;
+				};
+				fan@1 {
+					reg = <0x01>;
+					fan-tach-ch = /bits/ 8 <0x02 0x03>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@2 {
+					reg = <0x02>;
+					fan-tach-ch = /bits/ 8 <0x04 0x05>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@3 {
+					reg = <0x03>;
+					fan-tach-ch = /bits/ 8 <0x06 0x07>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@4 {
+					reg = <0x04>;
+					fan-tach-ch = /bits/ 8 <0x08 0x09>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@5 {
+					reg = <0x05>;
+					fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@6 {
+					reg = <0x06>;
+					fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+				fan@7 {
+					reg = <0x07>;
+					fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
+					cooling-levels = /bits/ 8 <127 255>;
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+				Flash@0 {
+					compatible = "winbond,w25q128",
+					"jedec,spi-nor";
+					reg = <0x0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spi-max-frequency = <5000000>;
+					partition@0 {
+						label = "spi0_spare1";
+						reg = <0x0000000 0x800000>;
+					};
+					partition@1 {
+						label = "spi0_spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+
+			spi1: spi@201000 {
+				cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+				status = "okay";
+				Flash@0 {
+					compatible = "winbond,w25q128fw",
+					"jedec,spi-nor";
+					reg = <0x0>;
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spi-max-frequency = <5000000>;
+					partition@0 {
+						label = "spi1_spare1";
+						reg = <0x0000000 0x800000>;
+					};
+					partition@1 {
+						label = "spi1_spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+	};
+
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <	&iox1_pins
+				&pin8_input
+				&pin9_output_high
+				&pin10_input
+				&pin11_output_high
+				&pin16_input
+				&pin24_output_high
+				&pin25_output_low
+				&pin32_output_high
+				&jtag2_pins
+				&pin61_output_high
+				&pin62_output_high
+				&pin63_output_high
+				&lpc_pins
+				&pin160_input
+				&pin162_input
+				&pin168_input
+				&pin169_input
+				&pin170_input
+				&pin187_output_high
+				&pin190_input
+				&pin191_output_high
+				&pin192_output_high
+				&pin197_output_low
+				&ddc_pins
+				&pin218_input
+				&pin219_output_low
+				&pin220_output_low
+				&pin221_output_high
+				&pin222_input
+				&pin223_output_low
+				&spix_pins
+				&pin228_output_low
+				&pin231_output_high
+				&pin255_input>;
+	};
 };
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
new file mode 100644
index 000000000000..edb4190826e6
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		pin8_input: pin8-input {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			input-enable;
+		};
+		pin9_output_high: pin9-output-high {
+			pins = "GPIO9/LKGPO2";
+			bias-disable;
+			output-high;
+		};
+		pin10_input: pin10-input {
+			pins = "GPIO10/IOXHLD";
+			bias-disable;
+			input-enable;
+		};
+		pin11_output_high: pin11-output-high {
+			pins = "GPIO11/IOXHCK";
+			bias-disable;
+			output-high;
+		};
+		pin16_input: pin16-input {
+			pins = "GPIO16/LKGPO0";
+			bias-disable;
+			input-enable;
+		};
+		pin24_output_high: pin24-output-high {
+			pins = "GPIO24/IOXHDO";
+			bias-disable;
+			output-high;
+		};
+		pin25_output_low: pin25-output-low {
+			pins = "GPIO25/IOXHDI";
+			bias-disable;
+			output-low;
+		};
+		pin32_output_high: pin32-output-high {
+			pins = "GPIO32/nSPI0CS1";
+			bias-disable;
+			output-high;
+		};
+		pin61_output_high: pin61-output-high {
+			pins = "GPO61/nDTR1_BOUT1/STRAP6";
+			bias-disable;
+			output-high;
+		};
+		pin62_output_high: pin62-output-high {
+			pins = "GPO62/nRTST1/STRAP5";
+			bias-disable;
+			output-high;
+		};
+		pin63_output_high: pin63-output-high {
+			pins = "GPO63/TXD1/STRAP4";
+			bias-disable;
+			output-high;
+		};
+		pin160_input: pin160-input {
+			pins = "GPIO160/CLKOUT/RNGOSCOUT";
+			bias-disable;
+			input-enable;
+		};
+		pin162_input: pin162-input {
+			pins = "GPIO162/SERIRQ";
+			bias-disable;
+			input-enable;
+		};
+		pin168_input: pin168-input {
+			pins = "GPIO168/nCLKRUN/nESPIALERT";
+			bias-disable;
+			input-enable;
+		};
+		pin169_input: pin169-input {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			input-enable;
+		};
+		pin170_input: pin170-input {
+			pins = "GPIO170/nSMI";
+			bias-disable;
+			input-enable;
+		};
+		pin187_output_high: pin187-output-high {
+			pins = "GPIO187/nSPI3CS1";
+			bias-disable;
+			output-high;
+		};
+		pin190_input: pin190-input {
+			pins = "GPIO190/nPRD_SMI";
+			bias-disable;
+			input-enable;
+		};
+		pin191_output_high: pin191-output-high {
+			pins = "GPIO191";
+			bias-disable;
+			output-high;
+		};
+		pin192_output_high: pin192-output-high {
+			pins = "GPIO192";
+			bias-disable;
+			output-high;
+		};
+		pin197_output_low: pin197-output-low {
+			pins = "GPIO197/SMB0DEN";
+			bias-disable;
+			output-low;
+		};
+		pin218_input: pin218-input {
+			pins = "GPIO218/nWDO1";
+			bias-disable;
+			input-enable;
+		};
+		pin219_output_low: pin219-output-low {
+			pins = "GPIO219/nWDO2";
+			bias-disable;
+			output-low;
+		};
+		pin220_output_low: pin220-output-low {
+			pins = "GPIO220/SMB12SCL";
+			bias-disable;
+			output-low;
+		};
+		pin221_output_high: pin221-output-high {
+			pins = "GPIO221/SMB12SDA";
+			bias-disable;
+			output-high;
+		};
+		pin222_input: pin222-input {
+			pins = "GPIO222/SMB13SCL";
+			bias-disable;
+			input-enable;
+		};
+		pin223_output_low: pin223-output-low {
+			pins = "GPIO223/SMB13SDA";
+			bias-disable;
+			output-low;
+		};
+		pin228_output_low: pin228-output-low {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			output-low;
+		};
+		pin231_output_high: pin231-output-high {
+			pins = "GPIO230/SPIXD3";
+			bias-disable;
+			output-high;
+		};
+		pin255_input: pin255-input {
+			pins = "GPI255/DACOSEL";
+			bias-disable;
+			input-enable;
+		};
+	};
+};
-- 
2.22.0

