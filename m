Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F564276144
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:45:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTCs2lSMzDqFH
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:44:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sg8szRsK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTC13l46zDqbs
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:44:12 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NJXf1T175465; Wed, 23 Sep 2020 15:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=i3Yi+Jivo6LZ89y6hGpgLZQdFNsjAMCAnlyOITmRJq4=;
 b=Sg8szRsKRHW1vvaTsXRVuNPD9Em7FGS16zRuXegRaMvkD5PsDctPQgOimP3O6to7wJay
 Mmaxb4F7xQnYwLG1G7aJHuU42VsQYrUBPqgRMF0C6pvFGZM/D/I7iODiHHrq5ZEI4KtC
 XdGKGSTlzjL1WCP5tVNMb4LALfnPqVJQ2yaDnfcJR1cIC0W8HI6VO1Ssopl0Njt+3wTV
 Pii0zS3KgJ+hA40lw1sZTQhU8/OFFiAhkFkudbB83RkAH8rr/sYMrq9zYprrklT7s+o9
 fWwonBG9O4ohL1bcocu/t197dGzZiSK8goLuXwdYYlE8Uu38DiwOAtw7vY++3G8vEQLQ iA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33r9rb50bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 15:44:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08NJgfSC015330;
 Wed, 23 Sep 2020 19:44:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 33n9m9uhd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 19:44:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08NJi7p953018892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 19:44:07 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0644F28060;
 Wed, 23 Sep 2020 19:44:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94ADB28058;
 Wed, 23 Sep 2020 19:44:06 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.70.72])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Sep 2020 19:44:06 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v2] ARM: dts: Aspeed: Rainier: Add 4U device-tree
Date: Wed, 23 Sep 2020 14:44:05 -0500
Message-Id: <20200923194405.28857-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_16:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=1 mlxlogscore=999 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230141
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
extra power supplies that are only present on the 4U system.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Don't rename the 2U dts
 - Include the 2U dts from the 4U and make the necessary changes

 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 47 +++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 14 +-----
 3 files changed, 50 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 56fd8c8a2ba9..8f59cb9a9b71 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1359,6 +1359,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yamp.dtb \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier-4u.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-lenovo-hr630.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
new file mode 100644
index 000000000000..e5d51b9c7a47
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier.dts"
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
+&fan_controller {
+	fan@0 {
+		compatible = "pmbus-fan";
+		reg = <0>;
+		tach-pulses = <4>;
+	};
+
+	fan@1 {
+		compatible = "pmbus-fan";
+		reg = <1>;
+		tach-pulses = <4>;
+	};
+
+	fan@2 {
+		compatible = "pmbus-fan";
+		reg = <2>;
+		tach-pulses = <4>;
+	};
+
+	fan@3 {
+		compatible = "pmbus-fan";
+		reg = <3>;
+		tach-pulses = <4>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index e6f422edf454..6b44340a9e8c 100644
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
@@ -769,7 +759,7 @@ tmp275@48 {
 		reg = <0x48>;
 	};
 
-	max31785@52 {
+	fan_controller: max31785@52 {
 		compatible = "maxim,max31785a";
 		reg = <0x52>;
 		#address-cells = <1>;
-- 
2.26.2

