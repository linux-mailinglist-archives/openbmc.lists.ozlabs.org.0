Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E656598DE7
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 22:25:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7xFj6XJhz3cdR
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 06:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iSmgBuST;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iSmgBuST;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7xFD2JQwz3c0g
	for <openbmc@lists.ozlabs.org>; Fri, 19 Aug 2022 06:24:31 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IJwANb018597;
	Thu, 18 Aug 2022 20:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=R1E4Cb829QfJGOcM7H2YQ1ckKLbBlQlCu//dIPFJAYE=;
 b=iSmgBuST9mPB2326Z3Yfs8lvDxJocE6PuYQmC79LMgkTh5TopNXfEVZmnNDfLF1CJWd4
 a1Jt5EDN2bx8PL8GqHU31JsbtJm6KNtUAdsTj9iBCosT+KOs5pZJTiY+QicFSmHepm9J
 8OEuS6eIcat7tINqtUkCB9mfeWYzPjeGvQERB+2RIfrsrwJtfIdc84Kda3Ei91yKS/XH
 wZoTd457LNff8rbbRJckoX01hGtjWTG4wbQEiuG876aw63/mmAMJwIV8V3Wo+8L9+4dD
 ddf6X799A0ZTzOdS5s6jB8WzKMVZCsVXtvqvpWpmOLpurAVsZqKtulrbuKjrShgfktmJ tg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1v230pch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 20:24:27 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IKKWKg004557;
	Thu, 18 Aug 2022 20:24:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma01wdc.us.ibm.com with ESMTP id 3hx3k9rvyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 20:24:26 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27IKOPDI48234758
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Aug 2022 20:24:25 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 827736E04E;
	Thu, 18 Aug 2022 20:24:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5AE96E050;
	Thu, 18 Aug 2022 20:24:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.49.13])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 18 Aug 2022 20:24:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v2] ARM: dts: aspeed: Add IBM Bonnell system BMC devicetree
Date: Thu, 18 Aug 2022 15:24:22 -0500
Message-Id: <20220818202422.741275-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -9ogClRhpgolnIBN40_tFsEAgaPavooK
X-Proofpoint-GUID: -9ogClRhpgolnIBN40_tFsEAgaPavooK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180073
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
Cc: wrightj@linux.ibm.com, Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a devicetree for the new Bonnell system.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Add UCD90160 on I2C bus 2

 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 909 +++++++++++++++++++
 2 files changed, 910 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 134cdcdec271..2a0a5e53c2f3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1477,6 +1477,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-wedge400.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
+	aspeed-bmc-ibm-bonnell.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-ibm-rainier-1s4u.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
new file mode 100644
index 000000000000..c2e15e780cfa
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -0,0 +1,909 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2022 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "Bonnell";
+	compatible = "ibm,bonnell-bmc", "aspeed,ast2600";
+
+	aliases {
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c115 = &cfam0_i2c15;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c214 = &cfam1_i2c14;
+		i2c215 = &cfam1_i2c15;
+		i2c216 = &cfam1_i2c16;
+		i2c217 = &cfam1_i2c17;
+
+		serial4 = &uart5;
+		i2c16 = &i2c11mux0chn0;
+		i2c17 = &i2c11mux0chn1;
+		i2c18 = &i2c11mux0chn2;
+		i2c19 = &i2c11mux0chn3;
+
+		spi10 = &cfam0_spi0;
+		spi11 = &cfam0_spi1;
+		spi12 = &cfam0_spi2;
+		spi13 = &cfam0_spi3;
+		spi20 = &cfam1_spi0;
+		spi21 = &cfam1_spi1;
+		spi22 = &cfam1_spi2;
+		spi23 = &cfam1_spi3;
+
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8 earlycon";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		flash_memory: region@b8000000 {
+			no-map;
+			reg = <0xb8000000 0x04000000>; /* 64M */
+		};
+
+		ramoops@bc000000 {
+			compatible = "ramoops";
+			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x8000>;
+			pmsg-size = <0x8000>;
+			max-reason = <3>; /* KMSG_DUMP_EMERG */
+		};
+
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0 {
+			gpios = <&gpio0 ASPEED_GPIO(G, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		fan1 {
+			gpios = <&gpio0 ASPEED_GPIO(G, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-enc-id0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		rear-enc-fault0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&gpio0 ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&gpio0 ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc1 7>;
+	};
+};
+
+&adc1 {
+	status = "okay";
+	aspeed,int-vref-microvolt = <2500000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+		&pinctrl_adc10_default &pinctrl_adc11_default
+		&pinctrl_adc12_default &pinctrl_adc13_default
+		&pinctrl_adc14_default &pinctrl_adc15_default>;
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&uhci {
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+		/*A0-A7*/	"","","","","","","","",
+		/*B0-B7*/	"","","","","","","checkstop","",
+		/*C0-C7*/	"","","","","","","","",
+		/*D0-D7*/	"","","","","","","","",
+		/*E0-E7*/	"","","","","","","","",
+		/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","","",
+		/*G0-G7*/	"fan0","fan1","","","","","","",
+		/*H0-H7*/	"","","rear-enc-id0","rear-enc-fault0","","","","",
+		/*I0-I7*/	"","","","","","","bmc-secure-boot","",
+		/*J0-J7*/	"","","","","","","","",
+		/*K0-K7*/	"","","","","","","","",
+		/*L0-L7*/	"","","","","","","","",
+		/*M0-M7*/	"","","","","","","","",
+		/*N0-N7*/	"","","","","","","","",
+		/*O0-O7*/	"","","","usb-power","","","","",
+		/*P0-P7*/	"","","","","","","","",
+		/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
+		/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
+		/*S0-S7*/	"presence-ps0","presence-ps1","","","power-ffs-sync-history","","","",
+		/*T0-T7*/	"","","","","","","","",
+		/*U0-U7*/	"","","","","","","","",
+		/*V0-V7*/	"","","","","","","","",
+		/*W0-W7*/	"","","","","","","","",
+		/*X0-X7*/	"","","","","","","","",
+		/*Y0-Y7*/	"","","","","","","","",
+		/*Z0-Z7*/	"","","","","","","","";
+
+	usb_power {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
+		output-high;
+	};
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&pinctrl_emmc_default {
+	bias-disable;
+};
+
+&emmc {
+	status = "okay";
+	clk-phase-mmc-hs200 = <180>, <180>;
+};
+
+&fsim0 {
+	status = "okay";
+
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OMI01 */
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OMI23 */
+			};
+
+			cfam0_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam0_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam0_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam0_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam0_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam0_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ0: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub0: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@1,0 {
+		reg = <1 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <1>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OMI45 */
+			};
+
+			cfam1_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OMI67 */
+			};
+
+			cfam1_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam1_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam1_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam1_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam1_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam1_i2c17: i2c-bus@11 {
+				reg = <17>;	/* OP6B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi2: spi@40 {
+				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi3: spi@60 {
+				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ1: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub1: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+&ibt {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	tca9554@20 {
+		compatible = "ti,tca9554";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "",
+			"RUSSEL_FW_I2C_ENABLE_N",
+			"RUSSEL_OPPANEL_PRESENCE_N",
+			"BLYTH_OPPANEL_PRESENCE_N",
+			"CPU_TPM_CARD_PRESENT_N",
+			"",
+			"",
+			"DASD_BP_PRESENT_N";
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	ucd90160@64 {
+		compatible = "ti,ucd90160";
+		reg = <0x64>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	power-supply@58 {
+		compatible = "ibm,cffps";
+		reg = <0x58>;
+	};
+
+	power-supply@59 {
+		compatible = "ibm,cffps";
+		reg = <0x59>;
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
+};
+
+&i2c7 {
+	multi-master;
+	status = "okay";
+
+	si7021-a20@40 {
+		compatible = "silabs,si7020";
+		reg = <0x40>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	max31785@52 {
+		compatible = "maxim,max31785a";
+		reg = <0x52>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fan0: fan@0 {
+			compatible = "pmbus-fan";
+			reg = <0>;
+			tach-pulses = <2>;
+		};
+
+		fan1: fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+		};
+	};
+
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "front-sys-id0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "front-check-log0";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "front-enc-fault1";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "front-sys-pwron0";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
+
+	ibm-panel@62 {
+		compatible = "ibm,op-panel";
+		reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	dps: dps310@76 {
+		compatible = "infineon,dps310";
+		reg = <0x76>;
+		#io-channel-cells = <0>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	rtc@32 {
+		compatible = "epson,rx8900";
+		reg = <0x32>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "",
+			"APSS_RESET_N",
+			"",
+			"N_MODE_CPU_N",
+			"",
+			"",
+			"P10_DCM_PRESENT",
+			"";
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
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
+	tca9554@20 {
+		compatible = "ti,tca9554";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names = "BOOT_RCVRY_TWI",
+			"BOOT_RCVRY_UART",
+			"",
+			"",
+			"",
+			"",
+			"",
+			"PE_SWITCH_RSTB_N";
+	};
+
+	tmp435@4c {
+		compatible = "ti,tmp435";
+		reg = <0x4c>;
+	};
+
+	pca9849@75 {
+		compatible = "nxp,pca849";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c11mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c11mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c11mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c11mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c12 {
+	status = "okay";
+
+	tpm@2e {
+		compatible = "nuvoton,npct75x";
+		reg = <0x2e>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c13 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		led@0 {
+			label = "nvme0";
+			reg = <0>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@1 {
+			label = "nvme1";
+			reg = <1>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@2 {
+			label = "nvme2";
+			reg = <2>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+
+		led@3 {
+			label = "nvme3";
+			reg = <3>;
+			retain-state-shutdown;
+			default-state = "keep";
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
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
+&vuart1 {
+	status = "okay";
+};
+
+&vuart2 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
+		 <&syscon ASPEED_CLK_MAC4RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.31.1

