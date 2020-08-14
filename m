Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E156F2449DD
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 14:41:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSjjJ54kBzDqmF
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 22:41:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G6dzUeUf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSjdp6nPjzDqlX
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 22:38:06 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07ECVHLd172444; Fri, 14 Aug 2020 08:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=HxHnUYrTdz42H1KNUAI+vd5GFXN3/CJIkZk5errjmzA=;
 b=G6dzUeUfIFg1c2frqQNcvfLm4qPMVcwTEvS4COosCO8s2Xq+MZWL1guw8NZbHssf6YWs
 FuB050Mpv4iT3H/ONx2pPMYh+t5MB66cqovmoXX9vqXDSk/6dmuFJgJJJgk6AHlEsFcJ
 x3AyjU7T8fUg2H4b+1cBQiHLD44aJXvUd0KkiHMx+LaGXfm00v9b22T8U5aivVq6cKK/
 WkHvLFfsNno7ovbqbMRnuQ79f75hbHjkVhrS9L4iyE/lG2rtHKWHMmKHKmgIJURdoJTh
 ac4ykic/BrMd13TjUAv/+IZcrmidbFAYXl5FwEHXcbBAqjgdmwPXZ93mOcBlYBha+dvI xw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32w4bae7k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 08:38:03 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07ECKM3R022305;
 Fri, 14 Aug 2020 12:38:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 32skpa6hmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 12:38:03 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07ECc2Yh53477634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 12:38:02 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E502B2065;
 Fri, 14 Aug 2020 12:38:02 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45F1AB2064;
 Fri, 14 Aug 2020 12:38:02 +0000 (GMT)
Received: from gfw170.aus.stglabs.ibm.com (unknown [9.3.62.224])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 12:38:02 +0000 (GMT)
Received: by gfw170.aus.stglabs.ibm.com (Postfix, from userid 298080)
 id E75A6354; Fri, 14 Aug 2020 07:38:01 -0500 (CDT)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 v2 2/2] ARM: dts: aspeed: rainier: Add directly
 controlled LEDs
Date: Fri, 14 Aug 2020 07:38:00 -0500
Message-Id: <1597408680-16209-1-git-send-email-vishwa@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_07:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 mlxscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=799
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140093
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
Cc: openbmc@lists.ozlabs.org, Vishwanatha Subbanna <vishwa@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.ibm.com>

These are the LEDs that have direct GPIO connection from ASPEED

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index d27b601..4992cf8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -124,6 +124,26 @@
 	leds {
 		compatible = "gpio-leds";
 
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
 		/* System ID LED that is at front on Op Panel */
 		front-sys-id0 {
 			retain-state-shutdown;
@@ -167,7 +187,7 @@
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","","","","","","","",
+	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
@@ -175,7 +195,7 @@
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
-- 
1.8.3.1

