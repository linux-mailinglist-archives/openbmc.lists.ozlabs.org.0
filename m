Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B3FB2410
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 18:27:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VLdd4ltSzF5j4
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 02:27:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VLNW0y6yzF5ml
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 02:16:10 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DGEP8A007362; Fri, 13 Sep 2019 12:16:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0ck5cn3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 12:16:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8DGEeIr016932;
 Fri, 13 Sep 2019 16:15:59 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2uytdx29pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 16:15:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DGFvoj60293520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 16:15:57 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8E5136053;
 Fri, 13 Sep 2019 16:15:57 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35958136051;
 Fri, 13 Sep 2019 16:15:57 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.179.222])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 16:15:57 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C busses
Date: Fri, 13 Sep 2019 11:15:52 -0500
Message-Id: <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=853 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130163
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
Cc: andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add all the I2C busses to the AST2600 dtsi and set their required
properties.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 272 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 272 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index f3edcff..916503a 100644
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
 
@@ -281,6 +297,262 @@
 				};
 			};
 
+			i2c0: i2c-bus@1e78a080 {
+				#address-cells = <1>;
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+			i2c6: i2c-bus@1e78a380 {
+				#address-cells = <1>;
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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
+				#size-cells = <1>;
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

