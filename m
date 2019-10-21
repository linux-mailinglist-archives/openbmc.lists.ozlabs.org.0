Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 085AFDF64D
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 21:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xnMw1lq2zDqL5
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 06:51:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5197956ce2=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="AVb/ovoE"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xnKD11HpzDqJg
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 06:49:35 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9LJnMFR020315
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 12:49:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=NcbL8nY8z7Y/EYpmb1t/mRKcXOScOsowU76+bNY+y98=;
 b=AVb/ovoEWgU+jtRDJhfcnOWSJy36alT2HxQkIbmLR2IBwlb6ISRUx2vPRdaUp6qm9VOw
 9+psoQqf4GFmNtCCXW9RkhyxdhgRvJEMi4k/b3YcK9I4+8W/01gTdw5/+xtWUB9tW6QX
 yZ0a7tOtSt6Q9vY0Zlqt1JOvTekgbevmn4s= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vqwyygnh2-15
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2019 12:49:33 -0700
Received: from 2401:db00:2120:81ca:face:0:31:0 (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 12:49:20 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
 id 05D8364C3CB8; Mon, 21 Oct 2019 12:49:20 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm1794.vll1.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: vll1c12
Subject: [PATCH 3/4] ARM: dts: aspeed: minipack: include dtsi for common
 network BMC devices
Date: Mon, 21 Oct 2019 12:48:19 -0700
Message-ID: <20191021194820.293556-4-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021194820.293556-1-taoren@fb.com>
References: <20191021194820.293556-1-taoren@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_05:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210190
X-FB-Internal: deliver
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patch simplifies Minipack device tree by including dtsi to define
devices which are common to Facebook AST2500 Network BMC platforms.

Below is the summary of changes comparing with previous dts version:
  - enabling the second firmware flash.
  - updating firmware flashes' size from 32MB to 64MB.
  - enabling the emmc device in slot #1.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 .../boot/dts/aspeed-bmc-facebook-minipack.dts | 59 ++++++-------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
index c05478296446..ed1a77c76ce9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
@@ -2,7 +2,7 @@
 // Copyright (c) 2018 Facebook Inc.
 /dts-v1/;
 
-#include "aspeed-g5.dtsi"
+#include "facebook-netbmc-ast2500-common.dtsi"
 
 / {
 	model = "Facebook Minipack 100 BMC";
@@ -76,35 +76,36 @@
 		stdout-path = &uart1;
 		bootargs = "debug console=ttyS1,9600n8 root=/dev/ram rw";
 	};
-
-	memory@80000000 {
-		reg = <0x80000000 0x20000000>;
-	};
 };
 
-&wdt1 {
+&wdt2 {
 	status = "okay";
 	aspeed,reset-type = "system";
 };
 
-&wdt2 {
-	status = "okay";
-	aspeed,reset-type = "system";
+/*
+ * Both firmware flashes are 64MB on Minipack BMC.
+ */
+&fmc_flash0 {
+	partitions {
+		data0@1c00000 {
+			reg = <0x1c00000 0x2400000>;
+		};
+		flash0@0 {
+			reg = <0x0 0x4000000>;
+		};
+	};
 };
 
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "bmc";
-#include "facebook-bmc-flash-layout.dtsi"
+&fmc_flash1 {
+	partitions {
+		flash1@0 {
+			reg = <0x0 0x4000000>;
+		};
 	};
 };
 
 &uart1 {
-	status = "okay";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd1_default
 		     &pinctrl_rxd1_default
 		     &pinctrl_ncts1_default
@@ -120,13 +121,6 @@
 		     &pinctrl_rxd2_default>;
 };
 
-&uart3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd3_default
-		     &pinctrl_rxd3_default>;
-};
-
 &uart4 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -134,17 +128,6 @@
 		     &pinctrl_rxd4_default>;
 };
 
-&uart5 {
-	status = "okay";
-};
-
-&mac1 {
-	status = "okay";
-	no-hw-checksum;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
-};
-
 &i2c0 {
 	status = "okay";
 	bus-frequency = <400000>;
@@ -423,7 +406,3 @@
 &i2c13 {
 	status = "okay";
 };
-
-&vhub {
-	status = "okay";
-};
-- 
2.17.1

