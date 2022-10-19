Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFA8604AB0
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 17:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsvKT2DV4z3dqc
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 02:09:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FtaHmES4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FtaHmES4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsvGr1sMsz2xZf
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 02:07:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JEnZS2001407;
	Wed, 19 Oct 2022 15:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=REXZvZNCTktC9Id0OHL9pszGELOcaHftl75DRGmanrQ=;
 b=FtaHmES42ty58facINIdRHG500lhWhFOSWZwJ6jOPxc0vmFc3Gx9MG90PRHCS3E5QOB/
 zwi7FgDVjzpH3zeUDglKxTJKEVBm2Liya9DMxgs8BnIAzpMZcx04G9V8jIq8WTUwntqD
 1AKwSwftD1OlgcfNOHK8W5OkKv392aujO9sd8ZIjuoebqdGrkz7BMsPnwkUHtNIvht5v
 1GrfYF6iYtEx+JNKUocKqhmdchzzuhWoOnBMOQg/yEh5FU/4krjJSeFmQoO4s20j2OYv
 w5L8imFZnl0kMBtk7eNt4/T9rKSIzePRPjFQSGeM71fza8ITdzSSyjRsqvzDK4JAK1jT Dw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kakbegnuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:26 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JEoDbr008521;
	Wed, 19 Oct 2022 15:07:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma05wdc.us.ibm.com with ESMTP id 3k7mg9xn1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:26 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JF7QjI18219416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 15:07:26 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C18EB5805D;
	Wed, 19 Oct 2022 15:07:24 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52E8158043;
	Wed, 19 Oct 2022 15:07:24 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.7.147])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 15:07:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0 2/3] ARM: dts: aspeed: Setup watchdog pre-timeout interrupt
Date: Wed, 19 Oct 2022 10:07:13 -0500
Message-Id: <20221019150714.606390-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221019150714.606390-1-eajames@linux.ibm.com>
References: <20221019150714.606390-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vgZ7hz3prXwwDY8FG4xfs604bKHpLmWv
X-Proofpoint-ORIG-GUID: vgZ7hz3prXwwDY8FG4xfs604bKHpLmWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=905 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190081
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

Specify the interrupt lines for the base SOCs that support it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 3 +++
 arch/arm/boot/dts/aspeed-g6.dtsi | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index c89092c3905b..2ed19bb5710a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -402,18 +402,21 @@ wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785000 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 			};
 
 			wdt2: watchdog@1e785020 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785020 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 			};
 
 			wdt3: watchdog@1e785040 {
 				compatible = "aspeed,ast2500-wdt";
 				reg = <0x1e785040 0x20>;
 				clocks = <&syscon ASPEED_CLK_APB>;
+				interrupts = <27>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 1387a763a6a5..a9a53724f2af 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -531,23 +531,27 @@ uart5: serial@1e784000 {
 
 			wdt1: watchdog@1e785000 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785000 0x40>;
 			};
 
 			wdt2: watchdog@1e785040 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785040 0x40>;
 				status = "disabled";
 			};
 
 			wdt3: watchdog@1e785080 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e785080 0x40>;
 				status = "disabled";
 			};
 
 			wdt4: watchdog@1e7850c0 {
 				compatible = "aspeed,ast2600-wdt";
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x1e7850C0 0x40>;
 				status = "disabled";
 			};
-- 
2.31.1

