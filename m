Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5C5363D5
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 16:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8mxC63bQz3bms
	for <lists+openbmc@lfdr.de>; Sat, 28 May 2022 00:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGN2AgoS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGN2AgoS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8mwm4Dbmz2yMf
	for <openbmc@lists.ozlabs.org>; Sat, 28 May 2022 00:12:55 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RDs9Bd020185;
	Fri, 27 May 2022 14:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6HrtQ45z1cFcPqi9Rjna8RaSeMsX7uuNi7RbT0mnzT8=;
 b=HGN2AgoSURCKyFbX/zc2SX8ZYJHp2Oyym++4vDV7bkOmq3F5yX8cdwLghquxuRJeqF1W
 J1ehyh/dXkBUs8098vFn1/3WyltVAAclBe8Y6/3Ul7ip8wTlDWsce4C5EjXqy6KB4T6k
 fNVu4WlP4tVPsSw83RBGqiXNKNrX0eL+9xr98nQwbPA9S8JhvlWdpJ3TjPMRqoCzYU2c
 +rCnadVe89GNdUUDrrpaUV4S/Ix8tvpkW44plwxfJ8hVRCkmpsl+x4mT/rcvX2jO1b54
 /Pz5kk/xkbo46YctdV40RumWWJzgyAkl3ydunAtEc3zunWVZ03O5Uq7BFwG/t/kLpKnx OQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gayxe0csk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 14:12:51 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RE9SNG000364;
	Fri, 27 May 2022 14:12:50 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma02wdc.us.ibm.com with ESMTP id 3gagpkw2qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 14:12:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RECnXT37093864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 14:12:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 477426A047;
	Fri, 27 May 2022 14:12:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1199B6A04F;
	Fri, 27 May 2022 14:12:49 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.47.118])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 27 May 2022 14:12:48 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] arm: dts: ast2600: Add I2C pinctrl
Date: Fri, 27 May 2022 09:12:46 -0500
Message-Id: <20220527141246.21704-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zklwhdDSjlsYnEw27KOjUnCttejuOaAb
X-Proofpoint-GUID: zklwhdDSjlsYnEw27KOjUnCttejuOaAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_04,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=746 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270067
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

Set the pinctrl groups for each I2C bus. These are essential to
I2C operating correctly.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index 5c14a4a453..a383979ae7 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -803,6 +803,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c1_default>;
 		status = "disabled";
 	};
 
@@ -816,6 +818,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c2_default>;
 		status = "disabled";
 	};
 
@@ -829,6 +833,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c3_default>;
 	};
 
 	i2c3: i2c@200 {
@@ -841,6 +847,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c4_default>;
 	};
 
 	i2c4: i2c@280 {
@@ -853,6 +861,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c5_default>;
 	};
 
 	i2c5: i2c@300 {
@@ -865,6 +875,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c6_default>;
 	};
 
 	i2c6: i2c@380 {
@@ -877,6 +889,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c7_default>;
 	};
 
 	i2c7: i2c@400 {
@@ -889,6 +903,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c8_default>;
 	};
 
 	i2c8: i2c@480 {
@@ -901,6 +917,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c9_default>;
 	};
 
 	i2c9: i2c@500 {
@@ -913,6 +931,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c10_default>;
 		status = "disabled";
 	};
 
@@ -926,6 +946,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c11_default>;
 		status = "disabled";
 	};
 
@@ -939,6 +961,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c12_default>;
 		status = "disabled";
 	};
 
@@ -952,6 +976,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c13_default>;
 		status = "disabled";
 	};
 
@@ -965,6 +991,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c14_default>;
 		status = "disabled";
 	};
 
@@ -978,6 +1006,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c15_default>;
 		status = "disabled";
 	};
 
@@ -991,6 +1021,8 @@
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2c16_default>;
 		status = "disabled";
 	};
 
@@ -1218,6 +1250,7 @@
 		function = "I2C1";
 		groups = "I2C1";
 	};
+
 	pinctrl_i2c2_default: i2c2_default {
 		function = "I2C2";
 		groups = "I2C2";
-- 
2.27.0

