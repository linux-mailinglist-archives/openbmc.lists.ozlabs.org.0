Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7376DFF2C
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 21:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxYHD3mpBz3fFG
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 05:51:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NFQgi7a6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NFQgi7a6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxYGb1Jh8z3bjj
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 05:50:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33CJBpYL028413;
	Wed, 12 Apr 2023 19:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0v8BOHrSg70QTRUw36jJiwU0ZQlldi+YF8Yx1a4qhS0=;
 b=NFQgi7a6ANnpC77O7FBAlpFg5FBhlnUxmKW69VNC1NzzgbZNnt4NbM4sAGxOqIPhnVkN
 oOuiP+pqv2tP4ciya4S/eR5YZvClH8BExC41GPt76nE8zRq9DuKiWwuU2p3urR+9VrKq
 2cS2GADVorWT1PGXabviMsEVbAyY1WAJpTgpAo39yOm6O2YMdSai+se00ASSQHVVicOt
 LiKvN37d+C9hGn5MREByAUOhk71z+fU8xaFqz0qROFB/GetYbXObd5u5+Qu5lbRQUPT+
 SD4vw740j/trttcW64w1VBeqakGa4IiYghrhA82ZrXD0974fZ5K4rCXVoaY7ytPQqhSc EQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3px2k798pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 19:50:24 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33CGd8cC028262;
	Wed, 12 Apr 2023 19:50:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pu0fr7wp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 19:50:22 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33CJoL0Z32440876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Apr 2023 19:50:21 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E48F15804B;
	Wed, 12 Apr 2023 19:50:20 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E840C58067;
	Wed, 12 Apr 2023 19:50:19 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.16.129])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Apr 2023 19:50:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 v2] ARM: dts: aspeed: p10bmc: Reorganize FSI tree and add I2C responders (#209)
Date: Wed, 12 Apr 2023 14:50:17 -0500
Message-Id: <20230412195017.2836161-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qpvGC2lkMv6mGYWXvMZewTkcZ_skTpO7
X-Proofpoint-GUID: qpvGC2lkMv6mGYWXvMZewTkcZ_skTpO7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_10,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=986
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120169
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since three systems have at least some of the FSI tree in common,
reorganize the FSI tree into include files. In addition, add the I2C
responders and associated engines to Everest.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts |  364 +---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1683 ++++++++++--------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  678 +------
 arch/arm/boot/dts/ibm-power10-dual.dtsi      |  380 ++++
 arch/arm/boot/dts/ibm-power10-quad.dtsi      | 1305 ++++++++++++++
 5 files changed, 2705 insertions(+), 1705 deletions(-)
 create mode 100644 arch/arm/boot/dts/ibm-power10-dual.dtsi
 create mode 100644 arch/arm/boot/dts/ibm-power10-quad.dtsi

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 79516dc21c01..d51d0a5881a4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -12,38 +12,11 @@ / {
 	compatible = "ibm,bonnell-bmc", "aspeed,ast2600";
 
 	aliases {
-		i2c100 = &cfam0_i2c0;
-		i2c101 = &cfam0_i2c1;
-		i2c110 = &cfam0_i2c10;
-		i2c111 = &cfam0_i2c11;
-		i2c112 = &cfam0_i2c12;
-		i2c113 = &cfam0_i2c13;
-		i2c114 = &cfam0_i2c14;
-		i2c115 = &cfam0_i2c15;
-		i2c202 = &cfam1_i2c2;
-		i2c203 = &cfam1_i2c3;
-		i2c210 = &cfam1_i2c10;
-		i2c211 = &cfam1_i2c11;
-		i2c214 = &cfam1_i2c14;
-		i2c215 = &cfam1_i2c15;
-		i2c216 = &cfam1_i2c16;
-		i2c217 = &cfam1_i2c17;
-
 		serial4 = &uart5;
 		i2c16 = &i2c11mux0chn0;
 		i2c17 = &i2c11mux0chn1;
 		i2c18 = &i2c11mux0chn2;
 		i2c19 = &i2c11mux0chn3;
-
-		spi10 = &cfam0_spi0;
-		spi11 = &cfam0_spi1;
-		spi12 = &cfam0_spi2;
-		spi13 = &cfam0_spi3;
-		spi20 = &cfam1_spi0;
-		spi21 = &cfam1_spi1;
-		spi22 = &cfam1_spi2;
-		spi23 = &cfam1_spi3;
-
 	};
 
 	chosen {
@@ -197,313 +170,6 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
-&fsim0 {
-	status = "okay";
-
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam@0,0 {
-		reg = <0 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <0>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OMI01 */
-			};
-
-			cfam0_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OMI23 */
-			};
-
-			cfam0_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam0_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam0_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam0_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam0_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam0_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ0: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub0: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-		};
-	};
-};
-
-&fsi_hub0 {
-	cfam@1,0 {
-		reg = <1 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <1>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OMI45 */
-			};
-
-			cfam1_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OMI67 */
-			};
-
-			cfam1_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam1_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam1_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam1_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam1_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam1_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ1: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub1: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-};
-
 &ibt {
 	status = "okay";
 };
@@ -913,3 +579,33 @@ &kcs3 {
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
+
+#include "ibm-power10-dual.dtsi"
+
+&cfam0_i2c10 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c11 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c12 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c13 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index c6f8f20914d1..bbf17be7fd8b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -12,38 +12,6 @@ / {
 	compatible = "ibm,everest-bmc", "aspeed,ast2600";
 
 	aliases {
-		i2c100 = &cfam0_i2c0;
-		i2c101 = &cfam0_i2c1;
-		i2c110 = &cfam0_i2c10;
-		i2c111 = &cfam0_i2c11;
-		i2c112 = &cfam0_i2c12;
-		i2c113 = &cfam0_i2c13;
-		i2c114 = &cfam0_i2c14;
-		i2c115 = &cfam0_i2c15;
-		i2c202 = &cfam1_i2c2;
-		i2c203 = &cfam1_i2c3;
-		i2c210 = &cfam1_i2c10;
-		i2c211 = &cfam1_i2c11;
-		i2c214 = &cfam1_i2c14;
-		i2c215 = &cfam1_i2c15;
-		i2c216 = &cfam1_i2c16;
-		i2c217 = &cfam1_i2c17;
-		i2c300 = &cfam2_i2c0;
-		i2c301 = &cfam2_i2c1;
-		i2c310 = &cfam2_i2c10;
-		i2c311 = &cfam2_i2c11;
-		i2c312 = &cfam2_i2c12;
-		i2c313 = &cfam2_i2c13;
-		i2c314 = &cfam2_i2c14;
-		i2c315 = &cfam2_i2c15;
-		i2c402 = &cfam3_i2c2;
-		i2c403 = &cfam3_i2c3;
-		i2c410 = &cfam3_i2c10;
-		i2c411 = &cfam3_i2c11;
-		i2c414 = &cfam3_i2c14;
-		i2c415 = &cfam3_i2c15;
-		i2c416 = &cfam3_i2c16;
-		i2c417 = &cfam3_i2c17;
 		i2c500 = &cfam4_i2c0;
 		i2c501 = &cfam4_i2c1;
 		i2c510 = &cfam4_i2c10;
@@ -113,22 +81,72 @@ aliases {
 
 		serial4 = &uart5;
 
-		spi10 = &cfam0_spi0;
-		spi11 = &cfam0_spi1;
-		spi12 = &cfam0_spi2;
-		spi13 = &cfam0_spi3;
-		spi20 = &cfam1_spi0;
-		spi21 = &cfam1_spi1;
-		spi22 = &cfam1_spi2;
-		spi23 = &cfam1_spi3;
-		spi30 = &cfam2_spi0;
-		spi31 = &cfam2_spi1;
-		spi32 = &cfam2_spi2;
-		spi33 = &cfam2_spi3;
-		spi40 = &cfam3_spi0;
-		spi41 = &cfam3_spi1;
-		spi42 = &cfam3_spi2;
-		spi43 = &cfam3_spi3;
+		sbefifo500 = &sbefifo500;
+		sbefifo501 = &sbefifo501;
+		sbefifo510 = &sbefifo510;
+		sbefifo511 = &sbefifo511;
+		sbefifo512 = &sbefifo512;
+		sbefifo513 = &sbefifo513;
+		sbefifo514 = &sbefifo514;
+		sbefifo515 = &sbefifo515;
+		sbefifo602 = &sbefifo602;
+		sbefifo603 = &sbefifo603;
+		sbefifo610 = &sbefifo610;
+		sbefifo611 = &sbefifo611;
+		sbefifo614 = &sbefifo614;
+		sbefifo615 = &sbefifo615;
+		sbefifo616 = &sbefifo616;
+		sbefifo617 = &sbefifo617;
+		sbefifo700 = &sbefifo700;
+		sbefifo701 = &sbefifo701;
+		sbefifo710 = &sbefifo710;
+		sbefifo711 = &sbefifo711;
+		sbefifo712 = &sbefifo712;
+		sbefifo713 = &sbefifo713;
+		sbefifo714 = &sbefifo714;
+		sbefifo715 = &sbefifo715;
+		sbefifo802 = &sbefifo802;
+		sbefifo803 = &sbefifo803;
+		sbefifo810 = &sbefifo810;
+		sbefifo811 = &sbefifo811;
+		sbefifo814 = &sbefifo814;
+		sbefifo815 = &sbefifo815;
+		sbefifo816 = &sbefifo816;
+		sbefifo817 = &sbefifo817;
+
+		scom500 = &scom500;
+		scom501 = &scom501;
+		scom510 = &scom510;
+		scom511 = &scom511;
+		scom512 = &scom512;
+		scom513 = &scom513;
+		scom514 = &scom514;
+		scom515 = &scom515;
+		scom602 = &scom602;
+		scom603 = &scom603;
+		scom610 = &scom610;
+		scom611 = &scom611;
+		scom614 = &scom614;
+		scom615 = &scom615;
+		scom616 = &scom616;
+		scom617 = &scom617;
+		scom700 = &scom700;
+		scom701 = &scom701;
+		scom710 = &scom710;
+		scom711 = &scom711;
+		scom712 = &scom712;
+		scom713 = &scom713;
+		scom714 = &scom714;
+		scom715 = &scom715;
+		scom802 = &scom802;
+		scom803 = &scom803;
+		scom810 = &scom810;
+		scom811 = &scom811;
+		scom814 = &scom814;
+		scom815 = &scom815;
+		scom816 = &scom816;
+		scom817 = &scom817;
+
 		spi50 = &cfam4_spi0;
 		spi51 = &cfam4_spi1;
 		spi52 = &cfam4_spi2;
@@ -2413,172 +2431,85 @@ &emmc {
 	clk-phase-mmc-hs200 = <210>, <228>;
 };
 
-&fsim0 {
+&ibt {
 	status = "okay";
+};
 
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	/*
-	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
-	 * active high.
-	 */
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam@0,0 {	/* DCM0_C0 */
-		reg = <0 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <0>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OMI01 */
-			};
-
-			cfam0_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OMI23 */
-			};
-
-			cfam0_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam0_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam0_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam0_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam0_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam0_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+&uart2 {
+	status = "okay";
+};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
+&vuart1 {
+	status = "okay";
+};
 
-			cfam0_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
+&vuart2 {
+	status = "okay";
+};
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
 
-			cfam0_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
+		 <&syscon ASPEED_CLK_MAC4RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+&wdt2 {
+	status = "okay";
+};
 
-			fsi_occ0: occ {
-				compatible = "ibm,p10-occ";
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
 
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
 
-		fsi_hub0: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-		};
-	};
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
 
+#include "ibm-power10-quad.dtsi"
+
 &fsi_hub0 {
-	cfam@1,0 { /* DCM0_C1 */
-		reg = <1 0>;
+	cfam@4,0 { /* DCM2_C0 */
+		reg = <4 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <1>;
+		chip-id = <4>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2591,185 +2522,260 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam1_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OMI45 */
-			};
+			cfam4_i2c0: i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;	/* OM01 */
 
-			cfam1_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OMI67 */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam1_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam1_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
+						scom500: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam1_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
+						sbefifo500: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
+			cfam4_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;	/* OM23 */
 
-			cfam1_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam1_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+						scom501: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam1_spi0: spi@0 {
-				reg = <0x0>;
+						sbefifo501: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam4_i2c10: i2c-bus@a {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom510: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo510: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam1_spi1: spi@20 {
-				reg = <0x20>;
+			cfam4_i2c11: i2c-bus@b {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom511: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo511: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam1_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam4_i2c12: i2c-bus@c {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <12>;	/* OP4A */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom512: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo512: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam1_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam4_i2c13: i2c-bus@d {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <13>;	/* OP4B */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+						scom513: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			fsi_occ1: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
+						sbefifo513: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
-		};
 
-		fsi_hub1: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@2,0 { /* DCM1_C0 */
-		reg = <2 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <2>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
+			cfam4_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
 
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam2_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam2_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
+						scom514: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam2_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
+						sbefifo514: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
+			cfam4_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
 
-			cfam2_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam2_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam2_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
+						scom515: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam2_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
+						sbefifo515: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -2779,7 +2785,7 @@ fsi2spi@1c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam2_spi0: spi@0 {
+			cfam4_spi0: spi@0 {
 				reg = <0x0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2795,7 +2801,7 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi1: spi@20 {
+			cfam4_spi1: spi@20 {
 				reg = <0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2811,9 +2817,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi2: spi@40 {
+			cfam4_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2828,9 +2834,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi3: spi@60 {
+			cfam4_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2852,7 +2858,7 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ2: occ {
+			fsi_occ4: occ {
 				compatible = "ibm,p10-occ";
 
 				occ-hwmon {
@@ -2862,7 +2868,7 @@ occ-hwmon {
 			};
 		};
 
-		fsi_hub2: hub@3400 {
+		fsi_hub4: hub@3400 {
 			compatible = "fsi-master-hub";
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
@@ -2872,11 +2878,11 @@ fsi_hub2: hub@3400 {
 		};
 	};
 
-	cfam@3,0 { /* DCM1_C1 */
-		reg = <3 0>;
+	cfam@5,0 { /* DCM2_C1 */
+		reg = <5 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <3>;
+		chip-id = <5>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2889,334 +2895,260 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam3_i2c2: i2c-bus@2 {
+			cfam5_i2c2: i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <2>;	/* OM45 */
-			};
-
-			cfam3_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam3_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam3_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam3_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam3_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam3_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
 
-			cfam3_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam3_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+						scom602: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo602: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam3_spi1: spi@20 {
-				reg = <0x20>;
+			cfam5_i2c3: i2c-bus@3 {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <3>;	/* OM67 */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam3_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+						scom603: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo603: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam3_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam5_i2c10: i2c-bus@a {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			fsi_occ3: occ {
-				compatible = "ibm,p10-occ";
+						scom610: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
+						sbefifo610: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
-		};
-
-		fsi_hub3: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@4,0 { /* DCM2_C0 */
-		reg = <4 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <4>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam4_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
-
-			cfam4_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
 
-			cfam4_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam4_i2c11: i2c-bus@b {
+			cfam5_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
-			};
 
-			cfam4_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam4_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam4_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam4_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
+						scom611: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam4_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo611: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam4_spi1: spi@20 {
-				reg = <0x20>;
+			cfam5_i2c14: i2c-bus@e {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam4_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+						scom614: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo614: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam4_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam5_i2c15: i2c-bus@f {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			fsi_occ4: occ {
-				compatible = "ibm,p10-occ";
+						scom615: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
+						sbefifo615: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
-		};
-
-		fsi_hub4: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
 
-			no-scan-on-init;
-		};
-	};
+			cfam5_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
 
-	cfam@5,0 { /* DCM2_C1 */
-		reg = <5 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <5>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+						scom616: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam5_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OM45 */
-			};
-
-			cfam5_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam5_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
+						sbefifo616: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam5_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
+			cfam5_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <17>;	/* OP6B */
 
-			cfam5_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam5_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam5_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
+						scom617: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam5_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
+						sbefifo617: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -3260,7 +3192,7 @@ eeprom@0 {
 
 			cfam5_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3277,7 +3209,7 @@ eeprom@0 {
 
 			cfam5_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3337,35 +3269,259 @@ i2c@1800 {
 			#size-cells = <0>;
 
 			cfam6_i2c0: i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0>;	/* OM01 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom700: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo700: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <1>;	/* OM23 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom701: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo701: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom710: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo710: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom711: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo711: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <12>;	/* OP4A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom712: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo712: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <13>;	/* OP4B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom713: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo713: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom714: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo714: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam6_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom715: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo715: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -3409,7 +3565,7 @@ eeprom@0 {
 
 			cfam6_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3426,7 +3582,7 @@ eeprom@0 {
 
 			cfam6_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3486,35 +3642,259 @@ i2c@1800 {
 			#size-cells = <0>;
 
 			cfam7_i2c2: i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <2>;	/* OM45 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom802: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo802: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <3>;	/* OM67 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom803: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo803: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom810: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo810: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom811: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo811: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom814: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo814: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom815: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo815: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <16>;	/* OP6A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom816: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo816: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
 			cfam7_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <17>;	/* OP6B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom817: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo817: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -3558,7 +3938,7 @@ eeprom@0 {
 
 			cfam7_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3575,7 +3955,7 @@ eeprom@0 {
 
 			cfam7_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible =  "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3619,22 +3999,6 @@ fsi_hub7: hub@3400 {
 };
 
 /* Legacy OCC numbering (to get rid of when userspace is fixed) */
-&fsi_occ0 {
-	reg = <1>;
-};
-
-&fsi_occ1 {
-	reg = <2>;
-};
-
-&fsi_occ2 {
-	reg = <3>;
-};
-
-&fsi_occ3 {
-	reg = <4>;
-};
-
 &fsi_occ4 {
 	reg = <5>;
 };
@@ -3650,74 +4014,3 @@ &fsi_occ6 {
 &fsi_occ7 {
 	reg = <8>;
 };
-
-&ibt {
-	status = "okay";
-};
-
-&uart2 {
-	status = "okay";
-};
-
-&vuart1 {
-	status = "okay";
-};
-
-&vuart2 {
-	status = "okay";
-};
-
-&lpc_ctrl {
-	status = "okay";
-	memory-region = <&flash_memory>;
-};
-
-&mac2 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii3_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
-		 <&syscon ASPEED_CLK_MAC3RCLK>;
-	clock-names = "MACCLK", "RCLK";
-	use-ncsi;
-};
-
-&mac3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii4_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
-		 <&syscon ASPEED_CLK_MAC4RCLK>;
-	clock-names = "MACCLK", "RCLK";
-	use-ncsi;
-};
-
-&wdt1 {
-	aspeed,reset-type = "none";
-	aspeed,external-signal;
-	aspeed,ext-push-pull;
-	aspeed,ext-active-high;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdtrst1_default>;
-};
-
-&wdt2 {
-	status = "okay";
-};
-
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
-&kcs2 {
-	status = "okay";
-	aspeed,lpc-io-reg = <0xca8 0xcac>;
-};
-
-&kcs3 {
-	status = "okay";
-	aspeed,lpc-io-reg = <0xca2>;
-	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 7162e65b8115..8bd86390e14b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -12,39 +12,6 @@ / {
 	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
 
 	aliases {
-		i2c100 = &cfam0_i2c0;
-		i2c101 = &cfam0_i2c1;
-		i2c110 = &cfam0_i2c10;
-		i2c111 = &cfam0_i2c11;
-		i2c112 = &cfam0_i2c12;
-		i2c113 = &cfam0_i2c13;
-		i2c114 = &cfam0_i2c14;
-		i2c115 = &cfam0_i2c15;
-		i2c202 = &cfam1_i2c2;
-		i2c203 = &cfam1_i2c3;
-		i2c210 = &cfam1_i2c10;
-		i2c211 = &cfam1_i2c11;
-		i2c214 = &cfam1_i2c14;
-		i2c215 = &cfam1_i2c15;
-		i2c216 = &cfam1_i2c16;
-		i2c217 = &cfam1_i2c17;
-		i2c300 = &cfam2_i2c0;
-		i2c301 = &cfam2_i2c1;
-		i2c310 = &cfam2_i2c10;
-		i2c311 = &cfam2_i2c11;
-		i2c312 = &cfam2_i2c12;
-		i2c313 = &cfam2_i2c13;
-		i2c314 = &cfam2_i2c14;
-		i2c315 = &cfam2_i2c15;
-		i2c402 = &cfam3_i2c2;
-		i2c403 = &cfam3_i2c3;
-		i2c410 = &cfam3_i2c10;
-		i2c411 = &cfam3_i2c11;
-		i2c414 = &cfam3_i2c14;
-		i2c415 = &cfam3_i2c15;
-		i2c416 = &cfam3_i2c16;
-		i2c417 = &cfam3_i2c17;
-
 		serial4 = &uart5;
 		i2c16 = &i2c2mux0;
 		i2c17 = &i2c2mux1;
@@ -61,23 +28,6 @@ aliases {
 		i2c28 = &i2c6mux0chn3;
 		i2c29 = &i2c11mux0chn0;
 		i2c30 = &i2c11mux0chn1;
-
-		spi10 = &cfam0_spi0;
-		spi11 = &cfam0_spi1;
-		spi12 = &cfam0_spi2;
-		spi13 = &cfam0_spi3;
-		spi20 = &cfam1_spi0;
-		spi21 = &cfam1_spi1;
-		spi22 = &cfam1_spi2;
-		spi23 = &cfam1_spi3;
-		spi30 = &cfam2_spi0;
-		spi31 = &cfam2_spi1;
-		spi32 = &cfam2_spi2;
-		spi33 = &cfam2_spi3;
-		spi40 = &cfam3_spi0;
-		spi41 = &cfam3_spi1;
-		spi42 = &cfam3_spi2;
-		spi43 = &cfam3_spi3;
 	};
 
 	chosen {
@@ -301,632 +251,6 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
-&fsim0 {
-	status = "okay";
-
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	/*
-	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
-	 * active high.
-	 */
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam@0,0 {
-		reg = <0 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <0>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OMI01 */
-			};
-
-			cfam0_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OMI23 */
-			};
-
-			cfam0_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam0_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam0_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam0_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam0_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam0_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-                };
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ0: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub0: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-		};
-	};
-};
-
-&fsi_hub0 {
-	cfam@1,0 {
-		reg = <1 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <1>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OMI45 */
-			};
-
-			cfam1_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OMI67 */
-			};
-
-			cfam1_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam1_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam1_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam1_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam1_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam1_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-                };
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ1: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub1: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@2,0 {
-		reg = <2 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <2>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam2_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
-
-			cfam2_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
-
-			cfam2_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam2_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam2_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam2_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam2_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam2_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam2_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam2_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam2_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam2_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ2: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub2: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@3,0 {
-		reg = <3 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <3>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam3_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OM45 */
-			};
-
-			cfam3_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam3_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam3_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam3_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam3_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam3_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam3_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam3_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam3_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam3_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam3_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ3: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub3: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-};
-
-/* Legacy OCC numbering (to get rid of when userspace is fixed) */
-&fsi_occ0 {
-	reg = <1>;
-};
-
-&fsi_occ1 {
-	reg = <2>;
-};
-
-&fsi_occ2 {
-	reg = <3>;
-};
-
-&fsi_occ3 {
-	reg = <4>;
-};
-
 &ibt {
 	status = "okay";
 };
@@ -2418,3 +1742,5 @@ &kcs3 {
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
+
+#include "ibm-power10-quad.dtsi"
diff --git a/arch/arm/boot/dts/ibm-power10-dual.dtsi b/arch/arm/boot/dts/ibm-power10-dual.dtsi
new file mode 100644
index 000000000000..cc466910bb52
--- /dev/null
+++ b/arch/arm/boot/dts/ibm-power10-dual.dtsi
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 IBM Corp.
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;	/* OMI01 */
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;	/* OMI23 */
+			};
+
+			cfam0_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam0_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam0_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam0_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam0_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam0_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+				compatible =  "ibm,fsi2spi";
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
+				compatible =  "ibm,fsi2spi";
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
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;	/* OMI45 */
+			};
+
+			cfam1_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;	/* OMI67 */
+			};
+
+			cfam1_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam1_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam1_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam1_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam1_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam1_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+				compatible =  "ibm,fsi2spi";
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
+				compatible =  "ibm,fsi2spi";
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
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
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
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
+/ {
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
+		spi10 = &cfam0_spi0;
+		spi11 = &cfam0_spi1;
+		spi12 = &cfam0_spi2;
+		spi13 = &cfam0_spi3;
+		spi20 = &cfam1_spi0;
+		spi21 = &cfam1_spi1;
+		spi22 = &cfam1_spi2;
+		spi23 = &cfam1_spi3;
+	};
+};
diff --git a/arch/arm/boot/dts/ibm-power10-quad.dtsi b/arch/arm/boot/dts/ibm-power10-quad.dtsi
new file mode 100644
index 000000000000..57494c744b5d
--- /dev/null
+++ b/arch/arm/boot/dts/ibm-power10-quad.dtsi
@@ -0,0 +1,1305 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 IBM Corp.
+
+#include "ibm-power10-dual.dtsi"
+
+&cfam0_i2c0 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom100: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo100: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c1 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom101: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo101: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c10 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom110: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo110: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c11 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom111: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo111: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c12 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom112: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo112: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c13 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom113: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo113: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c14 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom114: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo114: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c15 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom115: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo115: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c2 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom202: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo202: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c3 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom203: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo203: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c10 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom210: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo210: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c11 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom211: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo211: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c14 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom214: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo214: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c15 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom215: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo215: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c16 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom216: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo216: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c17 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom217: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo217: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&fsi_hub0 {
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;	/* OM01 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom300: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo300: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;	/* OM23 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom301: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo301: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom310: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo310: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom311: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo311: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <12>;	/* OP4A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom312: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo312: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <13>;	/* OP4B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom313: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo313: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom314: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo314: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom315: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo315: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
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
+				compatible =  "ibm,fsi2spi";
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
+				compatible =  "ibm,fsi2spi";
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
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;	/* OM45 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom402: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo402: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;	/* OM67 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom403: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo403: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom410: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo410: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom411: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo411: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom414: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo414: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom415: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo415: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom416: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo416: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <17>;	/* OP6B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom417: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo417: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
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
+				compatible =  "ibm,fsi2spi";
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
+				compatible =  "ibm,fsi2spi";
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
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
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
+&fsi_occ2 {
+	reg = <3>;
+};
+
+&fsi_occ3 {
+	reg = <4>;
+};
+
+/ {
+	aliases {
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
+		sbefifo100 = &sbefifo100;
+		sbefifo101 = &sbefifo101;
+		sbefifo110 = &sbefifo110;
+		sbefifo111 = &sbefifo111;
+		sbefifo112 = &sbefifo112;
+		sbefifo113 = &sbefifo113;
+		sbefifo114 = &sbefifo114;
+		sbefifo115 = &sbefifo115;
+		sbefifo202 = &sbefifo202;
+		sbefifo203 = &sbefifo203;
+		sbefifo210 = &sbefifo210;
+		sbefifo211 = &sbefifo211;
+		sbefifo214 = &sbefifo214;
+		sbefifo215 = &sbefifo215;
+		sbefifo216 = &sbefifo216;
+		sbefifo217 = &sbefifo217;
+		sbefifo300 = &sbefifo300;
+		sbefifo301 = &sbefifo301;
+		sbefifo310 = &sbefifo310;
+		sbefifo311 = &sbefifo311;
+		sbefifo312 = &sbefifo312;
+		sbefifo313 = &sbefifo313;
+		sbefifo314 = &sbefifo314;
+		sbefifo315 = &sbefifo315;
+		sbefifo402 = &sbefifo402;
+		sbefifo403 = &sbefifo403;
+		sbefifo410 = &sbefifo410;
+		sbefifo411 = &sbefifo411;
+		sbefifo414 = &sbefifo414;
+		sbefifo415 = &sbefifo415;
+		sbefifo416 = &sbefifo416;
+		sbefifo417 = &sbefifo417;
+
+		scom100 = &scom100;
+		scom101 = &scom101;
+		scom110 = &scom110;
+		scom111 = &scom111;
+		scom112 = &scom112;
+		scom113 = &scom113;
+		scom114 = &scom114;
+		scom115 = &scom115;
+		scom202 = &scom202;
+		scom203 = &scom203;
+		scom210 = &scom210;
+		scom211 = &scom211;
+		scom214 = &scom214;
+		scom215 = &scom215;
+		scom216 = &scom216;
+		scom217 = &scom217;
+		scom300 = &scom300;
+		scom301 = &scom301;
+		scom310 = &scom310;
+		scom311 = &scom311;
+		scom312 = &scom312;
+		scom313 = &scom313;
+		scom314 = &scom314;
+		scom315 = &scom315;
+		scom402 = &scom402;
+		scom403 = &scom403;
+		scom410 = &scom410;
+		scom411 = &scom411;
+		scom414 = &scom414;
+		scom415 = &scom415;
+		scom416 = &scom416;
+		scom417 = &scom417;
+
+		spi30 = &cfam2_spi0;
+		spi31 = &cfam2_spi1;
+		spi32 = &cfam2_spi2;
+		spi33 = &cfam2_spi3;
+		spi40 = &cfam3_spi0;
+		spi41 = &cfam3_spi1;
+		spi42 = &cfam3_spi2;
+		spi43 = &cfam3_spi3;
+	};
+};
-- 
2.31.1

