Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB629D198
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 19:57:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLyW53N0bzDqVV
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 05:57:37 +1100 (AEDT)
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
 header.s=pp1 header.b=pEk8Sth0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLyVK2SllzDqSw
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 05:56:55 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SIWPCR159329; Wed, 28 Oct 2020 14:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qL9ODvD3vFT9q/pKzEWg7bjFb/ezeRWIcvenn4E9EvQ=;
 b=pEk8Sth0vc2L/2LJ952wEWvylMErIL6lefOMW0GjTw7sSuJzl4jEWZ8aRgjGZN/eelAx
 ZeMtQ82dTEPPFIdJUk/qRrbSZpA7Ija1SqUemhxicYucog0svRcaxm/w3B5VDGNSQfCY
 NSM7Y53B8KLCfK8hh9huJontMjyvIrPXuOOcsFffHdapyFe0N51Rsr3zToBv6Las7g03
 e4ZWwEfOF3cWDOFdSeaSbQeqEaknVSfclcTmvnQmY8I69p73iDokkr5HcA4V+jB3criL
 ZEAT1mGTEE3TdhI4SeqMsiqpAEBWYSh0L8mcEQMQ5xQqBxJRfdlIhePFT373/pBgtZ2K tw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34f97uc97q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 14:56:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SIgWeg001618;
 Wed, 28 Oct 2020 18:56:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34etf91bms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 18:56:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SIufSE44761444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 18:56:41 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16C72136053;
 Wed, 28 Oct 2020 18:56:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82630136051;
 Wed, 28 Oct 2020 18:56:48 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.85.188.130])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 18:56:48 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3] ARM: dts: Aspeed: Rainier: Add 4U device-tree
Date: Wed, 28 Oct 2020 13:56:47 -0500
Message-Id: <20201028185647.14565-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_08:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=1 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010280118
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

Add a device-tree for the Rainier 4U system. Change the model name
on the existing Rainier device-tree to 2U, and remove the two
extra power supplies that are only present on the 4U system. Also
add labels to the fan nodes for use in the 4U device-tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v2:
 - Just reference individual fan nodes rather than the whole fan
   controller

Changes since v1:
 - Don't rename the 2U dts
 - Include the 2U dts from the 4U and make the necessary Changes

 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 37 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 20 +++-------
 3 files changed, 43 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e4d3600e16d..9a2ab5e6e924 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
new file mode 100644
index 000000000000..9c35ac1d19a6
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2020 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier-4u.dts"
+
+/ {
+	model = "Rainier 4U";
+};
+
+&i2c3 {
+	power-supply@6a {
+		compatible = "ibm,cffps";
+		reg = <0x6a>;
+	};
+
+	power-supply@6b {
+		compatible = "ibm,cffps";
+		reg = <0x6b>;
+	};
+};
+
+&fan0 {
+	tach-pulses = <4>;
+};
+
+&fan1 {
+	tach-pulses = <4>;
+};
+
+&fan2 {
+	tach-pulses = <4>;
+};
+
+&fan3 {
+	tach-pulses = <4>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 183e1a4dcc65..676ae5602fb9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -8,7 +8,7 @@
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
-	model = "Rainier";
+	model = "Rainier 2U";
 	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
 
 	aliases {
@@ -646,16 +646,6 @@ power-supply@69 {
 		compatible = "ibm,cffps";
 		reg = <0x69>;
 	};
-
-	power-supply@6a {
-		compatible = "ibm,cffps";
-		reg = <0x6a>;
-	};
-
-	power-supply@6b {
-		compatible = "ibm,cffps";
-		reg = <0x6b>;
-	};
 };
 
 &i2c4 {
@@ -775,25 +765,25 @@ max31785@52 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		fan@0 {
+		fan0: fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
 			tach-pulses = <2>;
 		};
 
-		fan@1 {
+		fan1: fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
 			tach-pulses = <2>;
 		};
 
-		fan@2 {
+		fan2: fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
 			tach-pulses = <2>;
 		};
 
-		fan@3 {
+		fan3: fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
 			tach-pulses = <2>;
-- 
2.26.2

