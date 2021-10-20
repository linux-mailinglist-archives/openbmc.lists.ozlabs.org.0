Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9343559E
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:57:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZPbQ0LJ7z305Z
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sb6kDsoD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sb6kDsoD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZPWG3HHVz2xtP
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:53:30 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KLr13c015193; 
 Wed, 20 Oct 2021 17:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fNhrVOHpdZtiinPdK952ArdCkUAKA9oE5+HVDWzK2mc=;
 b=sb6kDsoDrpgKFbePKNRVhbEuK824MYrcniJ2Fqx668BXCk27Mp3+l09hpst87gsuXSJ/
 xzyBNFWm4aSqtb2xPSJdbEqkb9cLluScm8c1noVx46FGtMTdLQ6BPWPnh9P7VhaH0J7d
 SFVjjZlNDfuvuwgQaQ9RUK1id+mm/Por8hrnL21QYutAzcOLhlc3DIYxGCOjPz6YiT0H
 +WV2mPLwJKuiO5VWHtlVW1irndhoYv+xrwvuAKd9gbLndlTlaAqc5XM/F74fnoxKja2K
 Ln+4DaA/UqkU3EMfLkJq/g6uiAOCIJzVFdjrJstFWSiAAlBkIgW6+oXxvLy7Kd55YGcu eQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btudwr074-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:53:27 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KLlX82022575;
 Wed, 20 Oct 2021 21:53:26 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3bqpccbta1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 21:53:26 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KLrPvs38338916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 21:53:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EF96124054;
 Wed, 20 Oct 2021 21:53:25 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39FF6124055;
 Wed, 20 Oct 2021 21:53:25 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.77.138])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 21:53:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14 5/5] ARM: dts: aspeed: everest: Fix bus 15
 muxed eeproms
Date: Wed, 20 Oct 2021 16:53:21 -0500
Message-Id: <20211020215321.33960-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020215321.33960-1-eajames@linux.ibm.com>
References: <20211020215321.33960-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uo043YhontzE4668ABAbWkFnXxKK70WU
X-Proofpoint-GUID: Uo043YhontzE4668ABAbWkFnXxKK70WU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=892 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110200123
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The eeproms on bus 15 muxes were at the wrong addresses.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 40 ++++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index cc4314141aa6..ceca16fe6fd9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2240,9 +2240,9 @@ i2c15mux0chn0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2251,9 +2251,9 @@ i2c15mux0chn1: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2262,9 +2262,9 @@ i2c15mux0chn2: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2273,9 +2273,9 @@ i2c15mux0chn3: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 	};
@@ -2292,9 +2292,9 @@ i2c15mux1chn0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2303,9 +2303,9 @@ i2c15mux1chn1: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2314,9 +2314,9 @@ i2c15mux1chn2: i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2325,9 +2325,9 @@ i2c15mux1chn3: i2c@3 {
 			#size-cells = <0>;
 			reg = <3>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 	};
@@ -2344,9 +2344,9 @@ i2c15mux2chn0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
@@ -2355,9 +2355,9 @@ i2c15mux2chn1: i2c@1 {
 			#size-cells = <0>;
 			reg = <1>;
 
-			eeprom@50 {
+			eeprom@53 {
 				compatible = "atmel,24c64";
-				reg = <0x50>;
+				reg = <0x53>;
 			};
 		};
 
-- 
2.27.0

