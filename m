Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1136A9464
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 23:02:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nx9V1vxJzDqMw
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 07:02:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NwYl5fclzDqKS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 06:35:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84KWcO2167016; Wed, 4 Sep 2019 16:35:15 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uth14q80j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 16:35:15 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x84KUcPZ013084;
 Wed, 4 Sep 2019 20:35:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 2us9fn5f54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 20:35:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84KZE8J40632704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 20:35:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27833AC05B;
 Wed,  4 Sep 2019 20:35:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1845AC059;
 Wed,  4 Sep 2019 20:35:13 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  4 Sep 2019 20:35:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 1/2] ARM: dts: Aspeed: Add I2C busses to AST2600
 and Tacoma
Date: Wed,  4 Sep 2019 15:35:10 -0500
Message-Id: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040204
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add all the I2C busses to the AST2600 dtsi. Set the busses status to
"okay" and add all the devices present on the Tacoma card to the
busses.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 384 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi            | 272 ++++++++++++++++++++
 2 files changed, 656 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 0a38bc0..408af00 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "aspeed-g6.dtsi"
+#include <dt-bindings/leds/leds-pca955x.h>
 
 / {
 	model = "Tacoma";
@@ -37,3 +38,386 @@
 &fsim0 {
 	status = "okay";
 };
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+
+	bmp: bmp280@77 {
+		compatible = "bosch,bmp280";
+		reg = <0x77>;
+		#io-channel-cells = <1>;
+	};
+
+	max31785@52 {
+		compatible = "maxim,max31785a";
+		reg = <0x52>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan@0 {
+			compatible = "pmbus-fan";
+			reg = <0>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@2 {
+			compatible = "pmbus-fan";
+			reg = <2>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@3 {
+			compatible = "pmbus-fan";
+			reg = <3>;
+			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+	};
+
+	dps: dps310@76 {
+		compatible = "infineon,dps310";
+		reg = <0x76>;
+		#io-channel-cells = <0>;
+	};
+
+	pca0: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	power-supply@68 {
+		compatible = "ibm,cffps1";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps1";
+		reg = <0x69>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	ir35221@70 {
+		compatible = "infineon,ir35221";
+		reg = <0x70>;
+	};
+
+	ir35221@71 {
+		compatible = "infineon,ir35221";
+		reg = <0x71>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	ir35221@70 {
+		compatible = "infineon,ir35221";
+		reg = <0x70>;
+	};
+
+	ir35221@71 {
+		compatible = "infineon,ir35221";
+		reg = <0x71>;
+	};
+};
+
+&i2c6 {
+	status = "okay";
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
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+
+	pca9552: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
+			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
+			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
+			"GPU4_TH_OVERT_N_BUFF",	"GPU5_TH_OVERT_N_BUFF",
+			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
+			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
+			"GPU4_PWR_GOOD_BUFF", "GPU5_PWR_GOOD_BUFF",
+			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>;
+	};
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
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 12569e5..0a8e08a 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -12,6 +12,22 @@
 	interrupt-parent = <&gic>;
 
 	aliases {
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
 		serial4 = &uart5;
 	};
 
@@ -255,6 +271,262 @@
 				};
 			};
 
+			i2c0: i2c-bus@1e78a80 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a080 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c1_default>;
+				status = "disabled";
+			};
+
+			i2c1: i2c-bus@1e78a100 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a100 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c2_default>;
+				status = "disabled";
+			};
+
+			i2c2: i2c-bus@1e78a180 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a180 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c3_default>;
+				status = "disabled";
+			};
+
+			i2c3: i2c-bus@1e78a200 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a200 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c4_default>;
+				status = "disabled";
+			};
+
+			i2c4: i2c-bus@1e78a280 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a280 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c5_default>;
+				status = "disabled";
+			};
+
+			i2c5: i2c-bus@1e78a300 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a300 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c6_default>;
+				status = "disabled";
+			};
+
+			i2c6: i2c-bus@380 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a380 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c7_default>;
+				status = "disabled";
+			};
+
+			i2c7: i2c-bus@1e78a400 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a400 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c8_default>;
+				status = "disabled";
+			};
+
+			i2c8: i2c-bus@1e78a480 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a480 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c9_default>;
+				status = "disabled";
+			};
+
+			i2c9: i2c-bus@1e78a500 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a500 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c10_default>;
+				status = "disabled";
+			};
+
+			i2c10: i2c-bus@1e78a580 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a580 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c11_default>;
+				status = "disabled";
+			};
+
+			i2c11: i2c-bus@1e78a600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a600 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c12_default>;
+				status = "disabled";
+			};
+
+			i2c12: i2c-bus@1e78a680 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a680 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c13_default>;
+				status = "disabled";
+			};
+
+			i2c13: i2c-bus@1e78a700 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a700 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c14_default>;
+				status = "disabled";
+			};
+
+			i2c14: i2c-bus@1e78a780 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a780 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c15_default>;
+				status = "disabled";
+			};
+
+			i2c15: i2c-bus@1e78a800 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#interrupt-cells = <1>;
+
+				reg = <0x1e78a800 0x80>;
+				compatible = "aspeed,ast2600-i2c-bus";
+				clocks = <&syscon ASPEED_CLK_APB1>;
+				resets = <&syscon ASPEED_RESET_I2C>;
+				bus-frequency = <100000>;
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c16_default>;
+				status = "disabled";
+			};
+
 			fsim0: fsi@1e79b000 {
 				compatible = "aspeed,ast2600-fsi-master", "fsi-master";
 				reg = <0x1e79b000 0x94>;
-- 
1.8.3.1

