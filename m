Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4062A3483
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 20:48:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ3P22x6XzDqVB
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 06:48:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DUM/ezws; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ3NC1V0jzDqSc
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 06:47:22 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2JaxmQ065516; Mon, 2 Nov 2020 14:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oA4OFxpmbkMaokIBFhI2hfOEofFHeovTwsGvVaVaThI=;
 b=DUM/ezwsKearAaAvTB9X+TPWoxYcIDQKfAZ8FH+rTkaSAmXF3tHQOfqxR0b6bWSN3EW2
 FnBi0eMhBKUdKNDtYDKZvZzf54LTtANmbTqIu5aqdrzwoEURHk//4bD9aZ1sKC1766PD
 qi7OblWQy1IeOcP2IbXbSeYNEipc358xrMsDDpk22rSoKWNcamGnJvVWr+UMMRtZf5qI
 bu0Hv0xkdfsoLcyckz6PX/Nh5m++MV5b0yxXeMdznooM8sE6NTT+CuG9tlwM0QY4kz/k
 DKPu5ywvgbaR6imlHaAiIAMeLzC90scrTAHI6pByybuJ/6sR5RadOMV/qM9VYl35ai3D bw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34hn6gedp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 14:47:17 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A2Jbhj8019710;
 Mon, 2 Nov 2020 19:47:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 34h0ehfduh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 19:47:16 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A2Jl7Gd59310344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Nov 2020 19:47:07 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C777136055;
 Mon,  2 Nov 2020 19:47:15 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FCE6136051;
 Mon,  2 Nov 2020 19:47:14 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.160.32.235])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 Nov 2020 19:47:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8] ARM: dts: Aspeed: Rainier: Mark FSI SPI
 controllers as restricted
Date: Mon,  2 Nov 2020 13:47:13 -0600
Message-Id: <20201102194713.14812-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_13:2020-11-02,
 2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 clxscore=1015
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=846 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020145
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

Some of the FSI-attached SPI controllers can't use the loop command
due to security requirements. Indicate this in the devicetree with
the restricted compatible string.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 676ae5602fb9..6b5d8ba81972 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -310,6 +310,7 @@ eeprom@0 {
 
 			cfam0_spi2: spi@40 {
 				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -326,6 +327,7 @@ eeprom@0 {
 
 			cfam0_spi3: spi@60 {
 				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -422,6 +424,7 @@ eeprom@0 {
 
 			cfam1_spi2: spi@40 {
 				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -438,6 +441,7 @@ eeprom@0 {
 
 			cfam1_spi3: spi@60 {
 				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -532,6 +536,7 @@ eeprom@0 {
 
 			cfam2_spi2: spi@40 {
 				reg = <0x40>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -548,6 +553,7 @@ eeprom@0 {
 
 			cfam2_spi3: spi@60 {
 				reg = <0x60>;
+				compatible = "ibm,fsi2spi-restricted";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-- 
2.26.2

