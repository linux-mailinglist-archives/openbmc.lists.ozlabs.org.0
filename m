Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE1D270258
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 18:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtKKq0Lb9zDqvv
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 02:39:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Cdnh35bz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtKC66LGbzDqtZ
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 02:33:21 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IGWYbe033058; Fri, 18 Sep 2020 12:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IJNi/CkaNcvTvtgdEIutFs3WFwyy+5Ud8p5WMVSOYy0=;
 b=Cdnh35bzCHhQH3SXPCg8VDT45pfpbts+EvxysfpITGstApoAoDEJB4MKkz9KdeEamfbS
 qjeQOwyOX7HUxeUvCHESODUHv+mcqtfj4wyGZM8uBK6+vjrtYtZc1muGitZ4dl4Liu3s
 oZUPVZAtxfJknnkd/khKAlq6N7c6DFsw0TspGDMkzohuOatrXsDUUe7lfDQ36N3zZssj
 kXrJ7I/BK1ITT2gX1jugo5MIx4mgy0LrxsfuQgCcn80ipzlaU1HrA14yNbzIqZK/7Ml9
 tMXgoAGuo5wppTWrx/WBuhSlwocoXia0wnYm5sKDYXBepdBwHmlUIJKxwolzjUiso1Me Ww== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33myfahx5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 12:33:18 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08IGWUNg016363;
 Fri, 18 Sep 2020 16:33:17 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 33k67cded8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 16:33:17 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08IGXGZl49480010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 16:33:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56549124052;
 Fri, 18 Sep 2020 16:33:16 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C08D9124054;
 Fri, 18 Sep 2020 16:33:15 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.67.87])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 16:33:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] ARM: dts: Aspeed: Rainier: Rename 2U and add 4U
Date: Fri, 18 Sep 2020 11:33:12 -0500
Message-Id: <20200918163312.18834-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_15:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=1
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009180130
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

Split the devicetree into 2U and 4U. Rainier 2U has only two PSUs,
so remove the extras. Also change the fan details for the 4U,
which has different fans.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                    |    3 +-
 .../arm/boot/dts/aspeed-bmc-ibm-rainier2u.dts | 1237 +++++++++++++++++
 ...inier.dts => aspeed-bmc-ibm-rainier4u.dts} |   10 +-
 3 files changed, 1244 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier2u.dts
 rename arch/arm/boot/dts/{aspeed-bmc-ibm-rainier.dts => aspeed-bmc-ibm-rainier4u.dts} (99%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 56fd8c8a2ba9..8a8e23d34224 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1358,7 +1358,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-wedge100.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
-	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier2u.dtb \
+	aspeed-bmc-ibm-rainier4u.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier2u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier2u.dts
new file mode 100644
index 000000000000..d374be24980e
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier2u.dts
@@ -0,0 +1,1237 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "Rainier 2U";
+	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+		i2c16 = &i2c2mux0;
+		i2c17 = &i2c2mux1;
+		i2c18 = &i2c2mux2;
+		i2c19 = &i2c2mux3;
+
+		spi10 = &cfam0_spi0;
+		spi11 = &cfam0_spi1;
+		spi12 = &cfam0_spi2;
+		spi13 = &cfam0_spi3;
+		spi20 = &cfam1_spi0;
+		spi21 = &cfam1_spi1;
+		spi22 = &cfam1_spi2;
+		spi23 = &cfam1_spi3;
+		spi30 = &cfam2_spi0;
+		spi31 = &cfam2_spi1;
+		spi32 = &cfam2_spi2;
+		spi33 = &cfam2_spi3;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+		bootargs = "console=ttyS4,115200n8";
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
+		flash_memory: region@B8000000 {
+			no-map;
+			reg = <0xB8000000 0x04000000>; /* 64M */
+		};
+
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 0)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 1)>;
+		};
+
+		ps2-presence {
+			label = "ps2-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 2)>;
+		};
+
+		ps3-presence {
+			label = "ps3-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 3)>;
+		};
+	};
+
+	i2c2mux: i2cmux {
+		compatible = "i2c-mux-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		i2c-parent = <&i2c2>;
+		mux-gpios = <&gpio0 ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>,
+			    <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+
+		i2c2mux0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c2mux1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c2mux2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c2mux3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* BMC Card fault LED at the back */
+		bmc-ingraham0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure ID LED at the back */
+		rear-enc-id0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure fault LED at the back */
+		rear-enc-fault0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		/* PCIE slot power LED */
+		pcieslot-power {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		/* System ID LED that is at front on Op Panel */
+		front-sys-id0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_oppanel 0 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System Attention Indicator ID LED that is at front on Op Panel */
+		front-check-log0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_oppanel 1 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure Fault LED that is at front on Op Panel */
+		front-enc-fault1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_oppanel 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System PowerOn LED that is at front on Op Panel */
+		front-sys-pwron0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","checkstop","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"","","","","","","","",
+	/*E0-E7*/	"","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","usb-power","","","","",
+	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*Q0-Q7*/	"cfam-reset","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
+				"","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+
+	pin_mclr_vpp {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
+		output-high;
+		line-name = "mclr_vpp";
+	};
+
+	i2c3_mux_oe_n {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
+		output-high;
+		line-name = "I2C3_MUX_OE_N";
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
+};
+
+&fsim0 {
+	status = "okay";
+
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	/*
+	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
+	 * active high.
+	 */
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
+                };
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
+
+			no-scan-on-init;
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
+                };
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
+
+	cfam@2,0 {
+		reg = <2 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <2>;
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
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam2_spi0: spi@0 {
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
+			cfam2_spi1: spi@20 {
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
+			cfam2_spi2: spi@40 {
+				reg = <0x40>;
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
+			cfam2_spi3: spi@60 {
+				reg = <0x60>;
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
+			fsi_occ2: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub2: hub@3400 {
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
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
+&fsi_occ2 {
+	reg = <3>;
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
+	tca9554@40 {
+		compatible = "ti,tca9554";
+		reg = <0x40>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		smbus0 {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "smbus0";
+		};
+	};
+
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
+	power-supply@68 {
+		compatible = "ibm,cffps";
+		reg = <0x68>;
+	};
+
+	power-supply@69 {
+		compatible = "ibm,cffps";
+		reg = <0x69>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
+	};
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
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
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
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
+};
+
+&i2c6 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
+	};
+
+	tmp275@4b {
+		compatible = "ti,tmp275";
+		reg = <0x4b>;
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
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+
+	eeprom@53 {
+		compatible = "atmel,24c64";
+		reg = <0x53>;
+	};
+};
+
+&i2c7 {
+	multi-master;
+	status = "okay";
+
+	si7021-a20@20 {
+		compatible = "silabs,si7020";
+		reg = <0x20>;
+	};
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
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
+		};
+
+		fan@1 {
+			compatible = "pmbus-fan";
+			reg = <1>;
+			tach-pulses = <2>;
+		};
+
+		fan@2 {
+			compatible = "pmbus-fan";
+			reg = <2>;
+			tach-pulses = <2>;
+		};
+
+		fan@3 {
+			compatible = "pmbus-fan";
+			reg = <3>;
+			tach-pulses = <2>;
+		};
+	};
+
+	pca0: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
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
+	pca_oppanel: pca9551@60 {
+		compatible = "nxp,pca9551";
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
+};
+
+&i2c8 {
+	status = "okay";
+
+	ucd90320@11 {
+		compatible = "ti,ucd90320";
+		reg = <0x11>;
+	};
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
+	tmp275@4a {
+		compatible = "ti,tmp275";
+		reg = <0x4a>;
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
+	pca1: pca9552@61 {
+		compatible = "nxp,pca9552";
+		reg = <0x61>;
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+};
+
+&i2c9 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+
+	tmp423a@4c {
+		compatible = "ti,tmp423";
+		reg = <0x4c>;
+	};
+
+	tmp423b@4d {
+		compatible = "ti,tmp423";
+		reg = <0x4d>;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c128";
+		reg = <0x50>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+
+	tmp275@48 {
+		compatible = "ti,tmp275";
+		reg = <0x48>;
+	};
+
+	tmp275@49 {
+		compatible = "ti,tmp275";
+		reg = <0x49>;
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
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+};
+
+&i2c15 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
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
+&kcs4 {
+	compatible = "openbmc,mctp-lpc";
+	status = "okay";
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
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-128.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <100000000>;
+	};
+};
+
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier4u.dts
similarity index 99%
rename from arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
rename to arch/arm/boot/dts/aspeed-bmc-ibm-rainier4u.dts
index e6f422edf454..50c0dcbdea62 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier4u.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
-	model = "Rainier";
+	model = "Rainier 4U";
 	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
 
 	aliases {
@@ -778,25 +778,25 @@ max31785@52 {
 		fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
 		};
 
 		fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
 		};
 
 		fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
 		};
 
 		fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
 		};
 	};
 
-- 
2.26.2

