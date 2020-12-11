Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F262D7C76
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 18:09:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csy1s6gzQzDqxZ
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 04:09:21 +1100 (AEDT)
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
 header.s=pp1 header.b=RPycuccO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsxzS5lWHzDqrW
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 04:07:16 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBH6IxL035978; Fri, 11 Dec 2020 12:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=9UUcQx+uhpC698X1AT4nBKX1kfttMBAmr1Kx+atVu0M=;
 b=RPycuccOSePIspsQ5DcaTN5z1VDu5JgaPcifLK1JbLtSxf77x3CHevB8078iCeS77dvf
 kx3//xG4qySwIWvL2i3u15KoJWlkDy8odT+eW5HOQ/Fuu8UncrSTH+Q+O+J6rc1oy0pk
 wWgSwC2UoaPnto3sRly1VgVE4SiFCQoIFpwYq0GDwNOqj5R3AebDBkE/e3spGon3fGZk
 Wm4yDNKEmWIlNOdn3pnXOwtHxDSBCJV/3yWpSyoBuMpbWqrs5xosKj2gJ95AmGhAArLG
 M7WdXv/ecBhjsf1yrsMg3rqRej3Loao73ko0t6uNcwLEM7lkyDJ27WYhUVxgwHmOA3/F 8w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35cappce18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 12:07:11 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBH36ux020892;
 Fri, 11 Dec 2020 17:07:11 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3581uadbm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 17:07:10 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBH79I124052090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 17:07:09 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3179C136053;
 Fri, 11 Dec 2020 17:07:09 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D035213605D;
 Fri, 11 Dec 2020 17:07:08 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.139.187])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 17:07:08 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] ARM: dts: Aspeed: Add Everest BMC machine
Date: Fri, 11 Dec 2020 11:07:04 -0600
Message-Id: <20201211170704.27640-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.18.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_03:2020-12-11,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=1 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110110
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

Add the Everest machine powered by an AST2600 chip. Copy the basic
configuration from Rainier.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                   |   1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 775 +++++++++++++++++++
 2 files changed, 776 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5fd12e8909d3..c13ac1bf7216 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-wedge100.dtb \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
+	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
new file mode 100644
index 000000000000..6bd876657bb8
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -0,0 +1,775 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2020 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+
+/ {
+	model = "Everest";
+	compatible = "ibm,everest-bmc", "aspeed,ast2600";
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
+		i2c300 = &cfam2_i2c0;
+		i2c301 = &cfam2_i2c1;
+		i2c310 = &cfam2_i2c10;
+		i2c311 = &cfam2_i2c11;
+		i2c312 = &cfam2_i2c12;
+		i2c313 = &cfam2_i2c13;
+		i2c314 = &cfam2_i2c14;
+		i2c315 = &cfam2_i2c15;
+		i2c402 = &cfam3_i2c2;
+		i2c403 = &cfam3_i2c3;
+		i2c410 = &cfam3_i2c10;
+		i2c411 = &cfam3_i2c11;
+		i2c414 = &cfam3_i2c14;
+		i2c415 = &cfam3_i2c15;
+		i2c416 = &cfam3_i2c16;
+		i2c417 = &cfam3_i2c17;
+
+		serial4 = &uart5;
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
+		spi40 = &cfam3_spi0;
+		spi41 = &cfam3_spi1;
+		spi42 = &cfam3_spi2;
+		spi43 = &cfam3_spi3;
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
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b8000000 {
+			no-map;
+			reg = <0xb8000000 0x04000000>; /* 64M */
+		};
+
+		/* 48MB region from the end of flash to start of vga memory */
+		ramoops@bc000000 {
+			compatible = "ramoops";
+			reg = <0xbc000000 0x180000>; /* 16 * (3 * 0x8000) */
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			pmsg-size = <0x8000>;
+			max-reason = <3>; /* KMSG_DUMP_EMERG */
+		};
+
+		/* VGA region is dictated by hardware strapping */
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>; /* 16M */
+		};
+	};
+};
+
+&ehci1 {
+	status = "okay";
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
+
+			cfam2_i2c0: i2c-bus@0 {
+				reg = <0>;	/* OM01 */
+			};
+
+			cfam2_i2c1: i2c-bus@1 {
+				reg = <1>;	/* OM23 */
+			};
+
+			cfam2_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam2_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam2_i2c12: i2c-bus@c {
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam2_i2c13: i2c-bus@d {
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam2_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam2_i2c15: i2c-bus@f {
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
+			cfam2_spi3: spi@60 {
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
+
+	cfam@3,0 {
+		reg = <3 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <3>;
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
+			cfam3_i2c2: i2c-bus@2 {
+				reg = <2>;	/* OM45 */
+			};
+
+			cfam3_i2c3: i2c-bus@3 {
+				reg = <3>;	/* OM67 */
+			};
+
+			cfam3_i2c10: i2c-bus@a {
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam3_i2c11: i2c-bus@b {
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam3_i2c14: i2c-bus@e {
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam3_i2c15: i2c-bus@f {
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam3_i2c16: i2c-bus@10 {
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam3_i2c17: i2c-bus@11 {
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
+			cfam3_spi0: spi@0 {
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
+			cfam3_spi1: spi@20 {
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
+			cfam3_spi2: spi@40 {
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
+			cfam3_spi3: spi@60 {
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
+			fsi_occ3: occ {
+				compatible = "ibm,p10-occ";
+			};
+		};
+
+		fsi_hub3: hub@3400 {
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
+&fsi_occ3 {
+	reg = <4>;
+};
+
+&ibt {
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
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
-- 
2.18.4

