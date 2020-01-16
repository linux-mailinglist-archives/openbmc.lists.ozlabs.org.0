Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858B13DF32
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 16:50:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z7tl2R7mzDqc9
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 02:50:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z7qg5M3bzDqbr
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 02:47:20 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GFf67U006756; Thu, 16 Jan 2020 10:47:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xjmynmpc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 10:47:16 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00GFf460006670;
 Thu, 16 Jan 2020 10:47:16 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xjmynmpbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 10:47:16 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00GFhnKb008355;
 Thu, 16 Jan 2020 15:47:16 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2xhjdv9h7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 15:47:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GFlC0N37159396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 15:47:12 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C9CC78069;
 Thu, 16 Jan 2020 15:47:12 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D64F078067;
 Thu, 16 Jan 2020 15:47:11 +0000 (GMT)
Received: from MSBARTH-P50.rch.stglabs.ibm.com (unknown [9.10.99.26])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 15:47:11 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Shawn McCarney <shawnmm@us.ibm.com>, Brandon Wyman <bjwyman@gmail.com>
Subject: [PATCH linux dev-5.4] ARM: dts: rainier: Remove regulators
Date: Thu, 16 Jan 2020 09:46:38 -0600
Message-Id: <20200116154638.1865820-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_05:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160130
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

Regulators will be dynamically configured and monitored from userspace.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 60 --------------------
 1 file changed, 60 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4d8b3cc5f291..c63cefce636d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -468,21 +468,6 @@
 &i2c9 {
 	status = "okay";
 
-	ir35221@42 {
-		compatible = "infineon,ir35221";
-		reg = <0x42>;
-	};
-
-	ir35221@43 {
-		compatible = "infineon,ir35221";
-		reg = <0x43>;
-	};
-
-	ir35221@44 {
-		compatible = "infineon,ir35221";
-		reg = <0x44>;
-	};
-
 	tmp423a@4c {
 		compatible = "ti,tmp423";
 		reg = <0x4c>;
@@ -493,21 +478,6 @@
 		reg = <0x4d>;
 	};
 
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	ir35221@73 {
-		compatible = "infineon,ir35221";
-		reg = <0x73>;
-	};
-
-	ir35221@74 {
-		compatible = "infineon,ir35221";
-		reg = <0x74>;
-	};
-
 	eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
@@ -517,21 +487,6 @@
 &i2c10 {
 	status = "okay";
 
-	ir35221@42 {
-		compatible = "infineon,ir35221";
-		reg = <0x42>;
-	};
-
-	ir35221@43 {
-		compatible = "infineon,ir35221";
-		reg = <0x43>;
-	};
-
-	ir35221@44 {
-		compatible = "infineon,ir35221";
-		reg = <0x44>;
-	};
-
 	tmp423a@4c {
 		compatible = "ti,tmp423";
 		reg = <0x4c>;
@@ -542,21 +497,6 @@
 		reg = <0x4d>;
 	};
 
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	ir35221@73 {
-		compatible = "infineon,ir35221";
-		reg = <0x73>;
-	};
-
-	ir35221@74 {
-		compatible = "infineon,ir35221";
-		reg = <0x74>;
-	};
-
 	eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
-- 
2.24.1

