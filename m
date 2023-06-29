Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361C74269A
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 14:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHyV3mgMz3cGK
	for <lists+openbmc@lfdr.de>; Thu, 29 Jun 2023 22:37:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHrH0wPlz3c3f
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 22:31:40 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 35TCVVoZ009265
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2023 15:31:31 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 29 Jun
 2023 15:31:30 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Thu, 29 Jun
 2023 20:31:28 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Thu, 29 Jun 2023 20:31:28 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id EACC064741; Thu, 29 Jun 2023 15:31:27 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.1 v1 2/2] arm64: dts: nuvoton: Enable nodes NPCM845 EVB DTS
Date: Thu, 29 Jun 2023 15:31:24 +0300
Message-ID: <20230629123124.227478-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230629123124.227478-1-tmaimon77@gmail.com>
References: <20230629123124.227478-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable the following nodes and device in NPCM845 EVB DTS:
    - EHCI
    - OHCI
    - PCIe
    - SGPIO
    - eMMC
    - FIU
    - PSPI
    - PECI
    - JTAG Master
    - KCS
    - BPC
    - RNG
    - ADC
    - PWM and FAN
    - I3C
    - I2C
    - Pin configuration
    - GMAC
    - MC

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 568 ++++++++++++++++++
 .../nuvoton/nuvoton-npcm845-pincfg-evb.dtsi   |  79 +++
 2 files changed, 647 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-pincfg-evb.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index a5ab2bc0f835..9336cd2c94c1 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "nuvoton-npcm845.dtsi"
+#include "nuvoton-npcm845-pincfg-evb.dtsi"
 
 / {
 	model = "Nuvoton npcm845 Development Board (Device Tree)";
@@ -10,6 +11,52 @@ / {
 
 	aliases {
 		serial0 = &serial0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
+		fiu3 = &fiu1;
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
+		i2c16 = &i2c16;
+		i2c17 = &i2c17;
+		i2c18 = &i2c18;
+		i2c19 = &i2c19;
+		i2c20 = &i2c20;
+		i2c21 = &i2c21;
+		i2c22 = &i2c22;
+		i2c23 = &i2c23;
+		i2c24 = &i2c24;
+		i2c25 = &i2c25;
+		i2c26 = &i2c26;
+		spi1 = &spi_gpio;
 	};
 
 	chosen {
@@ -19,12 +66,533 @@ chosen {
 	memory {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-sck = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 15 GPIO_ACTIVE_LOW>;
+
+		eeprom@0 {
+			compatible = "atmel,at25";
+			spi-max-frequency = <5000000>;
+			size = <0x10000>;
+			pagesize = <128>;
+			reg = <0>;
+			address-width = <16>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		heartbeat {
+			label = "heartbeat";
+			gpios = <&gpio3 2 GPIO_ACTIVE_HIGH>; /* gpio98 */
+		};
+		identify {
+			label = "identify";
+			gpios = <&gpio1 29 GPIO_ACTIVE_HIGH>; /* gpio61 */
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
+	tip_sram: sram@fffce000 {
+		compatible = "mmio-sram";
+		reg = <0 0xfffce000 0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0xfffce000 0x1000>;
+		ch0_shm: ch_shm@0 {
+			reg = <0 0x1000>;
+		};
+	};
+};
+
+&tmps {
+	status = "okay";
+};
+
+
+&sgpio2 {
+	status = "okay";
+	gpio-line-names =
+		"POWER_OUT","RESET_OUT","","","","","","NMI_OUT",
+		"g_led","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","PS_PWROK","POST_COMPLETE","POWER_BUTTON","RESET_BUTTON","NMI_BUTTON","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","",
+		"","","","","","","","";
 };
 
 &serial0 {
 	status = "okay";
 };
 
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
+			bbuboot1@0 {
+				label = "bb-uboot-1";
+				reg = <0x0000000 0x80000>;
+				read-only;
+				};
+			bbuboot2@80000 {
+				label = "bb-uboot-2";
+				reg = <0x0080000 0x80000>;
+				read-only;
+				};
+			envparam@100000 {
+				label = "env-param";
+				reg = <0x0100000 0x40000>;
+				read-only;
+				};
+			spare@140000 {
+				label = "spare";
+				reg = <0x0140000 0xC0000>;
+				};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x0200000 0x400000>;
+				};
+			rootfs@600000 {
+				label = "rootfs";
+				reg = <0x0600000 0x700000>;
+				};
+			spare1@D00000 {
+				label = "spare1";
+				reg = <0x0D00000 0x200000>;
+				};
+			spare2@F00000 {
+				label = "spare2";
+				reg = <0x0F00000 0x200000>;
+				};
+			spare3@1100000 {
+				label = "spare3";
+				reg = <0x1100000 0x200000>;
+				};
+			spare4@1300000 {
+				label = "spare4";
+				reg = <0x1300000 0x0>;
+			};
+		};
+	};
+};
+
+&fiu1 {
+	/*pinctrl-0 = <&spi1_pins>, <&spi1quad_pins>;*/
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions@A0000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			system1@0 {
+				label = "spi1-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	status = "okay";
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions@A0000000 {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			system1@0 {
+				label = "spi3-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiux {
+	spix-mode;
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
+&ohci1 {
+        status = "okay";
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&pcie {
+	/* used for e1000e PCI -> AXI window opening */
+	dma-ranges = <0x02000000 0 0x00000000 0x0 0x00000000 0 0x40000000>;
+	npcm-pci-ep-rst = <&gpio3 24 1>;
+	status = "okay";
+};
+
+&lpc_kcs {
+	kcs1: kcs1@0 {
+		status = "okay";
+	};
+
+	kcs2: kcs2@0 {
+		status = "okay";
+	};
+
+	kcs3: kcs3@0 {
+		status = "okay";
+	};
+};
+
+&lpc_host {
+	lpc_bpc: lpc_bpc@40 {
+		monitor-ports = <0x80>;
+		status = "okay";
+	};
+};
+
+&peci {
+	cmd-timeout-ms = <1000>;
+	npcm,pull-down = <0>;
+	npcm,host-neg-bit-rate = <15>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+	intel-peci-dimmtemp@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+		status = "okay";
+	};
+};
+
+&jtm1 {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
+
+&pwm_fan {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		&pwm2_pins &pwm3_pins
+		&pwm4_pins &pwm5_pins
+		&pwm6_pins &pwm7_pins
+		&fanin0_pins &fanin1_pins
+		&fanin2_pins &fanin3_pins
+		&fanin4_pins &fanin5_pins
+		&fanin6_pins &fanin7_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fan@0 {
+		reg = <0x00>;
+		fan-tach-ch = /bits/ 8 <0x00 0x01>;
+		cooling-levels = <127 255>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = /bits/ 8 <0x02 0x03>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = /bits/ 8 <0x04 0x05>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = /bits/ 8 <0x06 0x07>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = /bits/ 8 <0x08 0x09>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+	fan@7 {
+		reg = <0x07>;
+		fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
+		cooling-levels = /bits/ 8 <127 255>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+};
+
+&i2c1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <0x10>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@11 {
+		compatible = "ipmb-dev";
+		reg = <0x11>;
+		i2c-protocol;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	tmp100@48 {
+		compatible = "tmp100";
+		reg = <0x48>;
+		status = "okay";
+	};
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&i2c16 {
+	status = "okay";
+};
+
+&i2c17 {
+	status = "okay";
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&i2c19 {
+	status = "okay";
+};
+
+&i2c20 {
+	status = "okay";
+};
+
+&i2c21 {
+	status = "okay";
+};
+
+&i2c22 {
+	status = "okay";
+};
+
+&i2c23 {
+	status = "okay";
+};
+
+&i2c24 {
+	status = "okay";
+};
+
+&i2c25 {
+	status = "okay";
+};
+
+&i2c26 {
+	status = "okay";
+};
+
+&i3c0 {
+	status = "okay";
+	i3c-scl-hz = <12500000>;
+	i2c-scl-hz = <400000>;
+	use-dma;
+};
+
+&i3c1 {
+	status = "okay";
+	i3c-scl-hz = <12500000>;
+	i2c-scl-hz = <400000>;
+};
+
+&mc {
+	status = "okay";
+};
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>,
+		<&gpio2 15 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&gmac2 {
+	pinctrl-names = "default";
+	snps,ps-speed = <100>;
+	pinctrl-0 = <&r1_pins
+			&r1oen_pins>;
+	status = "okay";
+	use-ncsi;
+};
+
+&gmac3 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r2_pins
+			&r2oen_pins>;
+	phy-handle = <&phy1>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+			&jtag2_pins
+			&lpc_pins
+			&spix_pins
+			&pin4_slew
+			&pin5_slew
+			&pin6_slew
+			&pin7_slew
+			&pin108_slew
+			&pin109_slew
+			&pin240_slew
+			&pin241_slew
+			&pin242_slew
+			&pin243_slew>;
+};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-pincfg-evb.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-pincfg-evb.dtsi
new file mode 100644
index 000000000000..fb3fce8437db
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-pincfg-evb.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		pin4_slew: pin4_slew {
+			pins = "GPIO4/IOX2_DI/SMB1D_SDA";
+			slew-rate = <1>;
+		};
+		pin5_slew: pin5_slew {
+			pins = "GPIO5/IOX2_LD/SMB1D_SCL";
+			slew-rate = <1>;
+		};
+		pin6_slew: pin6_slew {
+			pins = "GPIO6/IOX2_CK/SMB2D_SDA";
+			slew-rate = <1>;
+		};
+		pin7_slew: pin7_slew {
+			pins = "GPIO7/IOX2_D0/SMB2D_SCL";
+			slew-rate = <1>;
+		};
+		pin33_slew: pin33-slew {
+			pins = "GPIO33/I3C4_SCL";
+			slew-rate = <1>;
+		};
+		pin34_slew: pin34-slew {
+			pins = "GPIO34/I3C4_SDA";
+			slew-rate = <1>;
+		};
+		pin106_slew: pin106-slew {
+			pins = "GPIO106/I3C5_SCL";
+			slew-rate = <1>;
+		};
+		pin107_slew: pin107-slew {
+			pins = "GPIO107/I3C5_SDA";
+			slew-rate = <1>;
+		};
+		pin108_slew: pin108-slew {
+			pins = "GPIO108/SG1_MDC";
+			slew-rate = <1>;
+		};
+		pin109_slew: pin109-slew {
+			pins = "GPIO109/SG1_MDIO";
+			slew-rate = <1>;
+		};
+		pin240_slew: pin240-slew {
+			pins = "GPIO240/I3C0_SCL";
+			slew-rate = <1>;
+		};
+		pin241_slew: pin241-slew {
+			pins = "GPIO241/I3C0_SDA";
+			slew-rate = <1>;
+		};
+		pin242_slew: pin242-slew {
+			pins = "GPIO242/I3C1_SCL";
+			slew-rate = <1>;
+		};
+		pin243_slew: pin243-slew {
+			pins = "GPIO243/I3C1_SDA";
+			slew-rate = <1>;
+		};
+		pin244_slew: pin244-slew {
+			pins = "GPIO244/I3C2_SCL";
+			slew-rate = <1>;
+		};
+		pin245_slew: pin245-slew {
+			pins = "GPIO245/I3C2_SDA";
+			slew-rate = <1>;
+		};
+		pin246_slew: pin246-slew {
+			pins = "GPIO246/I3C3_SCL";
+			slew-rate = <1>;
+		};
+		pin247_slew: pin247-slew {
+			pins = "GPIO247/I3C3_SDA";
+			slew-rate = <1>;
+		};
+	};
+};
-- 
2.33.0

