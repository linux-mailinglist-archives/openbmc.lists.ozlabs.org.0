Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F8CB1E3
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 00:25:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46knct2SCkzDqc3
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 08:25:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kncF1zSGzDqYk
 for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2019 08:24:28 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x93MLsiE064937; Thu, 3 Oct 2019 18:24:21 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vdr8yjs57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 18:24:21 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x93MKObt010477;
 Thu, 3 Oct 2019 22:24:20 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2v9y57ftxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 22:24:20 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x93MOKm848562622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 22:24:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAEEF124053;
 Thu,  3 Oct 2019 22:24:19 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BC9D124055;
 Thu,  3 Oct 2019 22:24:19 +0000 (GMT)
Received: from wisp4.ibm.com (unknown [9.211.150.6])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 22:24:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] ARM: dts: Aspeed: Tacoma: Add gpio-key
 definitions
Date: Thu,  3 Oct 2019 17:24:14 -0500
Message-Id: <20191003222415.6938-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003222415.6938-1-eajames@linux.ibm.com>
References: <20191003222415.6938-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=908 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030182
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
Cc: andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add gpio-keys for various signals on Tacoma.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 52c4374ce0d9..ea6e666d0caa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/leds/leds-pca955x.h>
 
 / {
@@ -33,6 +34,65 @@
 			reg = <0xba000000 0x2000000>; /* 32M */
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		air-water {
+			label = "air-water";
+			gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Q, 7)>;
+		};
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(E, 3)>;
+		};
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 3)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio0 ASPEED_GPIO(E, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(E, 5)>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
+			linux,code = <4>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
+			linux,code = <5>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+	};
 };
 
 &fmc {
-- 
2.23.0

