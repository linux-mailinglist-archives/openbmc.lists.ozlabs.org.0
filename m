Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71396A37C
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2024 18:00:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wyr1C4jrwz3c7q
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2024 01:59:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725379196;
	cv=none; b=kY5WVKdmBmmp+P5KkfSQ6FaM/pHUk7XoyrQfu3zq5MeEOd2GRbGEU3RXg+xHJBkJzOyuxm371ZBpVzye1kEg8kqosgAYve26beQfJ0FUr7Tyrujn98ehChRn3Jf714fDUYymUHDo5DeiAtK02fST8oCKXVoFitEQujLoRmgLDJJCA7gGk+3B64EuR46OiZa/IYPo6ltrELv4PpzH8LXfWKwstA8kEoEjxpeNl3+vxDqmhLD+zL/eFvV8SKyh4d8c6NiLe34G/hkioqR2q1+3X2Af2yiQBq9IEjUDmpe/WIdLc7/Os59Ge1v4Jdr4qNvl+K1GWm2xgFyCIAnvIg/MoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725379196; c=relaxed/relaxed;
	bh=YObX343rc2ZfeM1gQQp4Yw9bsw9NAFoEiVxyfkfxbnI=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=SqlICErYZpKm0ed093hsT073mA/oPO3LkSwOykzjbfOMr6yQE6z9hUNNp9d/PkbE29YmlmnIpOIHuUjmkyih88C3USQkxaqfikvFCcs9pOer1nudjzFNSfVsyCqG2VU1B/fBBbTQfy+7nyFOfxMJL14xzqRrlYiQXTnz5hot91Vy2j243aY4nasItAK5kc9Ofz2P1x6352fUrxugzRqbDWKvYRfPYd0GIpUzzY7pDAwcLpeafAIUP0mt/q9pziGdVWAZs0NVmIBlYwmAx4IkzJE0YQGXtOXegci3Kli5xw3LuP8YGV1Duh5klRi4+FVATlsk8c+/YKaVbHp4UJQt/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8tQpabt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8tQpabt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wyr181Sbhz2xYk
	for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2024 01:59:55 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483EGm9o003206
	for <openbmc@lists.ozlabs.org>; Tue, 3 Sep 2024 15:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=YObX343rc2ZfeM1gQQp4Yw9bsw
	9NAFoEiVxyfkfxbnI=; b=R8tQpabtSCZIET6FqZfpJwXDKOnnl1RgCC7aYMkSmu
	WG0TDXnSCmgeivseX15lcpncFDtLKsxw5Ki7UppzjHbpa+LKV4OU24M5c9ds6+kU
	hS9VMOL10qmlLcCX8IxJ2fNz5UUN+iuScZ1GnBJ2inq905ZV+gP8J+GK042t/jg6
	RXhCaB3xyFQm+mM7+pNV3tDTActZgKFLwLlpGpbpBTpMn18T2mJQKZ+e5h6dRAgL
	ThMkPH80u5MaH2c7esLEeJ/VJhq7d+FMaHMZOYz5k74/7E90egrXckw31bKssI8z
	FbAHMcsBf/OZyK59zc7gHKNN4NQ5eRHbQ971rBZWcyZw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41bskkxuds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2024 15:59:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 483CtZDL007995
	for <openbmc@lists.ozlabs.org>; Tue, 3 Sep 2024 15:59:52 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41cfqmu71f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2024 15:59:52 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 483FxpR138535690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Sep 2024 15:59:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CF6D5805D;
	Tue,  3 Sep 2024 15:59:51 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 150FF58052;
	Tue,  3 Sep 2024 15:59:51 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.11.70])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Sep 2024 15:59:51 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6] ARM: dts: aspeed: Fix Rainier and Blueridge GPIO LED names
Date: Tue,  3 Sep 2024 10:59:47 -0500
Message-ID: <20240903155947.425132-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oqOM7in6cPhCOE4PCFcE7RztwCXImA0m
X-Proofpoint-ORIG-GUID: oqOM7in6cPhCOE4PCFcE7RztwCXImA0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_03,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=549 clxscore=1011 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030127
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

Blueridge updated the LED names to include the "led-" prefix as
upstream required. Rainier should match for ease of application
design. In addition, the gpio line name needs to match.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts |  5 +++--
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts  | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
index a170b4b7c0fb7..63dceb8af82c2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dts
@@ -207,7 +207,8 @@ &gpio0 {
 	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","",
 			"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*H0-H7*/	"","led-bmc-ingraham0","led-rear-enc-id0","led-rear-enc-fault0","","","",
+			"",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -215,7 +216,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
-	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","",
 			"",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
index a98612c5a8c7f..d6bb9b03594c1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts
@@ -109,22 +109,22 @@ leds {
 		compatible = "gpio-leds";
 
 		/* BMC Card fault LED at the back */
-		bmc-ingraham0 {
+		led-bmc-ingraham0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
 		};
 
 		/* Enclosure ID LED at the back */
-		rear-enc-id0 {
+		led-rear-enc-id0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 		};
 
 		/* Enclosure fault LED at the back */
-		rear-enc-fault0 {
+		led-rear-enc-fault0 {
 			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
 		};
 
 		/* PCIE slot power LED */
-		pcieslot-power {
+		led-pcieslot-power {
 			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
 		};
 	};
@@ -203,7 +203,7 @@ &gpio0 {
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
+	/*H0-H7*/	"","led-bmc-ingraham0","led-rear-enc-id0","led-rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -211,7 +211,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
-	/*P0-P7*/	"","","","","pcieslot-power","","","",
+	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","regulator-standby-faulted","","","","","",
 	/*R0-R7*/	"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
-- 
2.43.0

