Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94197192E12
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 17:20:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nYHp3pdnzDqJX
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 03:20:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nYGw36tgzDqHv
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 03:19:35 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02PG47RW009002; Wed, 25 Mar 2020 12:19:32 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywbtj5yen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 12:19:32 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02PGG5EU006538;
 Wed, 25 Mar 2020 16:19:31 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw2b8cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 16:19:31 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02PGJU5849611060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 16:19:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C805BAC05F;
 Wed, 25 Mar 2020 16:19:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D02AC059;
 Wed, 25 Mar 2020 16:19:30 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.163.69.144])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 16:19:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] ARM: dts: Aspeed: Add witherspoon-128 machine
Date: Wed, 25 Mar 2020 11:19:28 -0500
Message-Id: <1585153168-21066-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_08:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxlogscore=856 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250124
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

Create a witherspoon machine with 128MB flash chips.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                         |  1 +
 .../boot/dts/aspeed-bmc-opp-witherspoon-128.dts    | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index fcd607f..d6dfdf7 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1303,6 +1303,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-tacoma.dtb \
 	aspeed-bmc-opp-vesnin.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
+	aspeed-bmc-opp-witherspoon-128.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
 	aspeed-bmc-quanta-q71l.dtb
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
new file mode 100644
index 0000000..1ba673a
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-opp-witherspoon.dts"
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <100000000>;
+
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x7F80000>;
+				label = "obmc-ubi";
+			};
+		};
+	};
+
+	flash@1 {
+		status = "okay";
+		label = "alt-bmc";
+		m25p,fast-read;
+		spi-max-frequency = <100000000>;
+
+		partitions {
+			#address-cells = < 1 >;
+			#size-cells = < 1 >;
+			compatible = "fixed-partitions";
+			u-boot@0 {
+				reg = < 0 0x60000 >;
+				label = "alt-u-boot";
+			};
+			u-boot-env@60000 {
+				reg = < 0x60000 0x20000 >;
+				label = "alt-u-boot-env";
+			};
+			obmc-ubi@80000 {
+				reg = < 0x80000 0x7F80000>;
+				label = "alt-obmc-ubi";
+			};
+		};
+	};
+};
-- 
1.8.3.1

