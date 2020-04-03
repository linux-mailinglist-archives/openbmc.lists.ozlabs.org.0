Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C429519EEF7
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 02:55:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXC23kv3zDqjT
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 10:55:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tzSz56M6zDrhN
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 23:16:59 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033C3oid036014; Fri, 3 Apr 2020 08:16:56 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303uj68q8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 08:16:55 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 033CCAK3027045;
 Fri, 3 Apr 2020 12:16:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 301x78520t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 12:16:55 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033CGseV52625760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 12:16:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A918112062;
 Fri,  3 Apr 2020 12:16:54 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB9F5112061;
 Fri,  3 Apr 2020 12:16:53 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 12:16:53 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Apr 2020 07:16:53 -0500
From: bentyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] Remove checkstop GPIO from gpio-keys definitions
Message-ID: <d51f1a31994d36b1dd98f1bd56260cc3@linux.vnet.ibm.com>
X-Sender: bentyner@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_07:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 impostorscore=0 adultscore=0 mlxlogscore=831 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030101
X-Mailman-Approved-At: Mon, 06 Apr 2020 10:53:32 +1000
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

 From: Ben Tyner <ben.tyner@ibm.com>

Attention handler will monitor the checkstop gpio via the character
device interface so it needs to not be defined.

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---

  arch/arm/boot/dts/Makefile                    |  1 +
  .../dts/aspeed-bmc-opp-witherspoon-128.dts    | 99 +++++++++++++++++++
  2 files changed, 100 insertions(+)
  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index fcd607ffe8d9..d6dfdf73e66b 100644
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
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts 
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
new file mode 100644
index 000000000000..701d58b7f0dc
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon-128.dts
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2019 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-opp-witherspoon.dts"
+
+/ {
+	gpio-keys {
+		/delete-node/ checkstop;
+	};
+};
+
+&gpio {
+	gpio-line-names =
+	/*A0-A7*/	"","cfam-reset","","","","","fsi-mux","",
+	/*B0-B7*/	"","","","","","air-water","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"fsi-enable","","","","","","","",
+	/*E0-E7*/	"fsi-data","","","","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"","","","","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
+		        "led-rear-id","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","presence-ps0",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","fsi-trans","","","power-button","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"fsi-clock","","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
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
2.20.1
