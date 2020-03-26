Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169819411D
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 15:18:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p6XT2wq7zDqwC
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 01:18:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p6Wb3DtlzDqQ5
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 01:17:29 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02QE3808040838; Thu, 26 Mar 2020 10:17:26 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2khrd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 10:17:26 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02QEAggv001356;
 Thu, 26 Mar 2020 14:17:25 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2ywawa4svh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 14:17:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02QEHNBD38535494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 14:17:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBBC0BE054;
 Thu, 26 Mar 2020 14:17:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82B0ABE04F;
 Thu, 26 Mar 2020 14:17:23 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.211.116.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 14:17:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] ARM: dts: Aspeed: AST2600: Remove FTTMR010 and
 set arch timer always-on
Date: Thu, 26 Mar 2020 09:17:21 -0500
Message-Id: <1585232241-8371-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_03:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=1 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=971 clxscore=1015 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260109
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

The FTTMR010 is not intended to be used in the AST2600. The arch timer
should be used, but Linux doesn't enable high-res timers without being
assured that the arch timer is always on, so set that property in the
devicetree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index a222871..f309f66 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -66,6 +66,7 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		clocks = <&syscon ASPEED_CLK_HPLL>;
 		arm,cpu-registers-not-fw-configured;
+		always-on;
 	};
 
 	ahb {
@@ -387,21 +388,6 @@
 				status = "disabled";
 			};
 
-			timer: timer@1e782000 {
-				compatible = "aspeed,ast2600-timer";
-				reg = <0x1e782000 0x90>;
-				interrupts-extended = <&gic  GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
-						<&gic  GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&syscon ASPEED_CLK_APB1>;
-				clock-names = "PCLK";
-                        };
-
 			uart1: serial@1e783000 {
 				compatible = "ns16550a";
 				reg = <0x1e783000 0x20>;
-- 
1.8.3.1

