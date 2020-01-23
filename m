Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF41463EA
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 09:52:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483GHV5W4lzDqX9
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 19:52:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.214;
 helo=mail1.bemta23.messagelabs.com; envelope-from=pengms1@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483GGN234qzDqTJ;
 Thu, 23 Jan 2020 19:51:23 +1100 (AEDT)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-c.us-east-1.aws.symcld.net id FD/76-04435-78E592E5;
 Thu, 23 Jan 2020 08:51:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsWSLveKVbc9TjP
 O4O1mNYtdlzksZux9wGwx/8g5VotNj6+xWjSvPsdscXnXHDaLpdcvMlmcannBYtG69wi7A6fH
 1fZd7B5r5q1h9FiwqdRj06pONo/NS+o9zs9YyOjxeZNcAHsUa2ZeUn5FAmvGkfPvGQt6EysOt
 U9nbGA87NPFyMUhJPCbUeLvhQvsEM5sRonTZzuZuxg5OdgE1CROzr7HCpIQEbjDKDF543VmEI
 dZoIFRYsrumUAOB4ewgKPEh72lIA0sAqoS/S9a2UBsXgEziRU7DrKC2BIC8hJbv31ihYgLSpy
 c+YQFxGYGijdvnc08gZF7FpLULCSpBYxMqxhNk4oy0zNKchMzc3QNDQx0DQ2NdE10jS30Eqt0
 k/VKi3VTE4tLdA31EsuL9Yorc5NzUvTyUks2MQIDNqWARW0H47Gvb/UOMUpyMCmJ8lq4asYJ8
 SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAtjgHKCRalpqdWpGXmAKMHJi3BwaMkwqsbC5TmLS5IzC
 3OTIdInWLU5Tj7b94iZiGWvPy8VClx3tPRQEUCIEUZpXlwI2CRfIlRVkqYl5GBgUGIpyC1KDe
 zBFX+FaM4B6OSMK8IyCqezLwSuE2vgI5gAjqiXEcN5IiSRISUVANT1xHvD718RjFpcidzJ1u/
 3fp3W1vQx/TKdWFbcxddzVhXx2u+rW7Ti+jDDzN3aEq72da2ivU+75kYtEy4Plyi+Zvf8tUan
 mvDv/7c/vynn+zrZ0X6/+8aKSpVvN+913FOyQ/vW9uk4uKDJpxz7JmyZTbrtAXbYsVt/DbxnX
 vVv029vvOAQO/J5W7iWevFrB7++qxgqZ9YEX/zquDDx5ecOPeZsG1+mZ/LXLHO57/6sdKNjDc
 s3/pxRu49z7piOvP3yMbb2p3LlHtjgl5cLDzz98gM+SB7ly7ux0sEJ3PPP33pgN9WrVsSDke1
 Fq97+fL6hQkvlAPVNVg12d1OfF5Yvvtvp8WTknsd2ibnwoUWKLEUZyQaajEXFScCAN6pqbBfA
 wAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-15.tower-406.messagelabs.com!1579769476!599421!1
X-Originating-IP: [103.30.234.5]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30447 invoked from network); 23 Jan 2020 08:51:19 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.5)
 by server-15.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jan 2020 08:51:19 -0000
Received: from lenovo.com (unknown [10.96.80.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 036C18131C3F878AAEBC;
 Thu, 23 Jan 2020 16:51:15 +0800 (CST)
Received: from hsbmc.10.240.0.10 (unknown [10.245.100.154])
 by Forcepoint Email with ESMTP id 9670CC6AB0DA431024F2;
 Thu, 23 Jan 2020 16:51:15 +0800 (CST)
From: Andrew Peng <pengms1@lenovo.com>
To: benjaminfair@google.com, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, andrew@aj.id.au, mark.rutland@arm.com,
 robh+dt@kernel.org
Subject: [PATCH v2] ARM: dts: aspeed: update Hr855xg2 device tree
Date: Thu, 23 Jan 2020 16:51:12 +0800
Message-Id: <20200123085112.8371-1-pengms1@lenovo.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Andrew Peng <pengms1@lenovo.com>, openbmc@lists.ozlabs.org,
 Harry Sung <hsung1@lenovo.com>, Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update i2c aliases.
Change flash_memory mapping address and size.
Add in a gpio-keys section.
Add in a peci0 section.
Update i2c0,i2c0 and i2c11 section.
Enable vhub, vuart, spi1 and spi2.
Remove gpio from gpio section since it controlled by user space.

Signed-off-by: Andrew Peng <pengms1@lenovo.com>
Signed-off-by: Derek Lin <dlin23@lenovo.com>
Signed-off-by: Harry Sung <hsung1@lenovo.com>
---
Changes in v2:
 - remove spidev@0 property.
 - remove espi-enabled property.
 - add a space for switch0_i2c5:i2c@5.
 - dropping CPUXX_VCCXX and VR pmbus relative property.

Changes in v1: initial version

 .../boot/dts/aspeed-bmc-lenovo-hr855xg2.dts   | 446 +++++++++++-------
 1 file changed, 270 insertions(+), 176 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
index 084c455ad4cb..5f39ad59812a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
@@ -15,14 +15,21 @@ / {
 	compatible = "lenovo,hr855xg2-bmc", "aspeed,ast2500";

 	aliases {
-		i2c14 = &i2c_riser1;
-		i2c15 = &i2c_riser2;
-		i2c16 = &i2c_riser3;
-		i2c17 = &i2c_M2;
-		i2c18 = &channel_0;
-		i2c19 = &channel_1;
-		i2c20 = &channel_2;
-		i2c21 = &channel_3;
+		i2c14 = &pcie_slot8;
+		i2c15 = &pcie_slot9;
+		i2c16 = &pcie_slot10;
+		i2c17 = &pcie_slot11;
+		i2c18 = &pcie_slot12;
+		i2c19 = &switch0_i2c5;
+		i2c22 = &switch1_i2c0;
+		i2c23 = &pcie_slot6;
+		i2c24 = &pcie_slot7;
+		i2c30 = &pcie_slot1;
+		i2c31 = &pcie_slot2;
+		i2c32 = &pcie_slot3;
+		i2c33 = &pcie_slot4;
+		i2c34 = &pcie_slot5;
+		i2c35 = &switch2_i2c5;
 	};

 	chosen {
@@ -40,9 +47,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;

-		flash_memory: region@98000000 {
+		flash_memory: region@9EFF0000 {
 			no-map;
-			reg = <0x98000000 0x00100000>; /* 1M */
+			reg = <0x9EFF0000 0x00010000>; /* 64K */
 		};

 		gfx_memory: framebuffer {
@@ -78,6 +85,82 @@ iio-hwmon-battery {
 		io-channels = <&adc 15>;
 	};

+	gpio-keys {
+		compatible = "gpio-keys";
+
+		id-button {
+			label = "id-button";
+			gpios = <&gpio ASPEED_GPIO(Y, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Y, 2)>;
+		};
+
+		pwr-button {
+			label = "pwr-button";
+			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(I, 1)>;
+		};
+
+		cpu-caterr {
+			label = "cpu-caterr";
+			gpios = <&gpio ASPEED_GPIO(G, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(G, 1)>;
+		};
+
+		int-fpga-bmc {
+			label = "int-fpga-bmc";
+			gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 5)>;
+		};
+
+		p12v-aux1-alert1-n {
+			label = "p12v-aux1-alert1-n";
+			gpios = <&gpio ASPEED_GPIO(AA, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(AA, 7)>;
+		};
+
+		p12v-aux2-alert1-n {
+			label = "p12v-aux2-alert1-n";
+			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 0)>;
+		};
+
+		p12v-aux3-alert1-n {
+			label = "p12v-aux3-alert1-n";
+			gpios = <&gpio ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(G, 5)>;
+		};
+
+		ddr-vr-bmc-alert-n {
+			label = "ddr-vr-bmc-alert-n";
+			gpios = <&gpio ASPEED_GPIO(L, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(L, 7)>;
+		};
+
+		cpu-vr-bmc-alert-n {
+			label = "cpu-vr-bmc-alert-n";
+			gpios = <&gpio ASPEED_GPIO(L, 6) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(L, 6)>;
+		};
+
+		riser1-vr-al-r {
+			label = "riser1-vr-al-r";
+			gpios = <&gpio ASPEED_GPIO(AB, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(AB, 1)>;
+		};
+
+		riser2-vr-al-r {
+			label = "riser2-vr-al-r";
+			gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 1)>;
+		};
+
+		riser3-vr-al-r {
+			label = "riser3-vr-al-r";
+			gpios = <&gpio ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(A, 1)>;
+		};
+	};
+
 };

 &fmc {
@@ -91,10 +174,13 @@ flash@0 {
 	};
 };

+&vhub {
+	status = "okay";
+};
+
 &lpc_ctrl {
 	status = "okay";
 	memory-region = <&flash_memory>;
-	flash = <&spi1>;
 };

 &lpc_snoop {
@@ -102,11 +188,32 @@ &lpc_snoop {
 	snoop-ports = <0x80>;
 };

-&uart1 {
+&spi1 {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <40000000>;
+	};
+};
+
+&spi2 {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd1_default
-			&pinctrl_rxd1_default>;
+	pinctrl-0 = <&pinctrl_spi2ck_default
+				&pinctrl_spi2cs0_default
+				&pinctrl_spi2miso_default
+				&pinctrl_spi2mosi_default>;
+
+		flash@0 {
+				compatible = "jedec,spi-nor";
+				m25p,fast-read;
+				label = "fpga";
+				reg = < 0 >;
+				spi-max-frequency = <50000000>;
+				status = "okay";
+		};
 };

 &uart2 {
@@ -123,12 +230,13 @@ &pinctrl_ndcd2_default
 			&pinctrl_nri2_default>;
 };

-&uart3 {
+&uart5 {
 	status = "okay";
 };

-&uart5 {
+&vuart {
 	status = "okay";
+	auto-flow-control;
 };

 &ibt {
@@ -172,37 +280,77 @@ &pinctrl_adc14_default
 			&pinctrl_adc15_default>;
 };

+&peci0 {
+	status = "okay";
+	peci-client@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+	};
+
+	peci-client@31 {
+		compatible = "intel,peci-client";
+		reg = <0x31>;
+	};
+
+	peci-client@32 {
+		compatible = "intel,peci-client";
+		reg = <0x32>;
+	};
+
+	peci-client@33 {
+		compatible = "intel,peci-client";
+		reg = <0x33>;
+	};
+};
+
 &i2c0 {
 	status = "okay";

-	i2c-switch@70 {
-		compatible = "nxp,pca9545";
-		reg = <0x70>;
+	i2c-switch@71 {
+		compatible = "nxp,pca9548";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		reg = <0x71>;

-		i2c_riser1: i2c@0 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0>;
+		pcie_slot8: i2c@0{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
 		};

-		i2c_riser2: i2c@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
+		pcie_slot9: i2c@1{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
 		};

-		i2c_riser3: i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
+		pcie_slot10: i2c@2{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
 		};

-		i2c_M2: i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
+		pcie_slot11: i2c@3{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+		};
+
+		pcie_slot12: i2c@4{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <4>;
+		};
+
+		switch0_i2c5: i2c@5{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <5>;
+				eeprom@54 {
+					compatible = "atmel,24c04";
+					pagesize = <16>;
+					reg = <0x54>;
+				};
 		};
 	};
 };
@@ -215,14 +363,45 @@ HotSwap@10 {
 		reg = <0x10>;
 	};

-	VR@45 {
-		compatible = "pmbus";
-		reg = <0x45>;
+	eeprom@54 {
+		compatible = "atmel,24c04";
+		pagesize = <16>;
+		reg = <0x54>;
 	};
 };

 &i2c2 {
 	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+
+		switch1_i2c0: i2c@0{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				eeprom@54 {
+					compatible = "atmel,24c04";
+					pagesize = <16>;
+					reg = <0x54>;
+				};
+		};
+
+		pcie_slot6: i2c@1{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+		};
+
+		pcie_slot7: i2c@2{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+		};
+	};
 };

 &i2c3 {
@@ -284,7 +463,7 @@ tmp75@4d {
 	eeprom@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
-		pagesize = <16>;
+		pagesize = <64>;
 	};
 };

@@ -306,6 +485,54 @@ &i2c10 {

 &i2c11 {
 	status = "okay";
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x71>;
+
+		pcie_slot1: i2c@0{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+		};
+
+		pcie_slot2: i2c@1{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+		};
+
+		pcie_slot3: i2c@2{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+		};
+
+		pcie_slot4: i2c@3{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+		};
+
+		pcie_slot5: i2c@4{
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <4>;
+		};
+
+		switch2_i2c5: i2c@5{
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			eeprom@54 {
+				compatible = "atmel,24c04";
+				pagesize = <16>;
+				reg = <0x54>;
+			};
+		};
+	};
 };

 &i2c13 {
@@ -425,20 +652,6 @@ fan@16 {

 &gpio {

-	pin_gpio_a1 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_LOW>;
-		output-high;
-		line-name = "BMC_EMMC_RST_N";
-	};
-
-	pin_gpio_a3 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
-		output-high;
-		line-name = "PCH_PWROK_BMC_FPGA";
-	};
-
 	pin_gpio_b5 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
@@ -453,27 +666,6 @@ pin_gpio_b7 {
 		line-name = "CPU_SM_WP";
 	};

-	pin_gpio_e0 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
-		input;
-		line-name = "PDB_PSU_SEL";
-	};
-
-	pin_gpio_e2 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(E, 2) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "LOCATOR_LED_N";
-	};
-
-	pin_gpio_e5 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(E, 5) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "FM_BMC_DBP_PRESENT_R1_N";
-	};
-
 	pin_gpio_e6 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(E, 6) GPIO_ACTIVE_HIGH>;
@@ -481,18 +673,11 @@ pin_gpio_e6 {
 		line-name = "BMC_ME_SECURITY_OVERRIDE_N";
 	};

-	pin_gpio_f0 {
+	pin_gpio_g7 {
 		gpio-hog;
-		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
+		gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "IRQ_BMC_PCH_NMI_R";
-	};
-
-	pin_gpio_f1 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
-		input;
-		line-name = "CPU2_PROCDIS_BMC_N";
+		line-name = "BMC_PCIE_I2C_MUX_RST_N";
 	};

 	pin_gpio_f2 {
@@ -516,34 +701,6 @@ pin_gpio_f4 {
 		line-name = "BMC_FORCE_NM_THROTTLE_N";
 	};

-	pin_gpio_f6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "FM_BMC_CPU_PWR_DEBUG_N";
-	};
-
-	pin_gpio_g7 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "BMC_PCIE_I2C_MUX_RST_N";
-	};
-
-	pin_gpio_h6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "FM_BMC_DBP_PRESENT_R2_N";
-	};
-
-	pin_gpio_i3 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "SPI_BMC_BIOS_WP_N";
-	};
-
 	pin_gpio_j1 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
@@ -565,20 +722,6 @@ pin_gpio_j3 {
 		line-name = "SPI_BMC_BIOS_HOLD_N";
 	};

-	pin_gpio_l0 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(L, 0) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "PDB_FAN_TACH_SEL";
-	};
-
-	pin_gpio_l1 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(L, 1) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "SYS_RESET_BMC_FPGA_N";
-	};
-
 	pin_gpio_l4 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
@@ -593,27 +736,6 @@ pin_gpio_l5 {
 		line-name = "FM_EFUSE_FAN_G2_EN";
 	};

-	pin_gpio_r6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(R, 6) GPIO_ACTIVE_HIGH>;
-		input;
-		line-name = "CPU3_PROCDIS_BMC_N";
-	};
-
-	pin_gpio_r7 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
-		input;
-		line-name = "CPU4_PROCDIS_BMC_N";
-	};
-
-	pin_gpio_s1 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(S, 1) GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "DBP_SYSPWROK_BMC";
-	};
-
 	pin_gpio_s2 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
@@ -621,13 +743,6 @@ pin_gpio_s2 {
 		line-name = "PCH_RST_RSMRST_N";
 	};

-	pin_gpio_s6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "BMC_HW_STRAP_5";
-	};
-
 	pin_gpio_z3 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
@@ -638,29 +753,8 @@ pin_gpio_z3 {
 	pin_gpio_aa0 {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "FW_PSU_ALERT_EN_N";
-	};
-
-	pin_gpio_aa4 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(AA, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "DBP_CPU_PREQ_N";
-	};
-
-	pin_gpio_ab3 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(AB, 3) GPIO_ACTIVE_HIGH>;
-		output-low;
-		line-name = "BMC_WDTRST";
-	};
-
-	pin_gpio_ac6 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(AC, 6) GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "ESPI_BMC_ALERT_N";
+		line-name = "FW_PSU_ALERT_EN_N";
 	};

 };
--
2.24.1

