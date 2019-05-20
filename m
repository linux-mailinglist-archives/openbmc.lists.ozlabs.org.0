Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969D241ED
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2019 22:17:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4579Dz4sGZzDqLY
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 06:17:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4579DQ4H60zDqJT
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 06:17:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KK7Wf0021856
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 16:17:21 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sm0p7wda9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 May 2019 16:17:21 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 20 May 2019 21:17:20 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 21:17:18 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4KKHHW715008228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 20:17:17 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B4DBE059;
 Mon, 20 May 2019 20:17:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EEEFBE053;
 Mon, 20 May 2019 20:17:17 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 20:17:17 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, bjwyman@gmail.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add pca9539 devices
Date: Mon, 20 May 2019 15:17:15 -0500
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19052020-0004-0000-0000-000015112651
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011132; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01206179; UDB=6.00633347; IPR=6.00987139; 
 MB=3.00026974; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-20 20:17:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052020-0005-0000-0000-00008BBC6DCA
Message-Id: <1558383435-38811-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=848 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200126
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

Add the pca9539 devices to the Swift device tree.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 146 +++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index 9610637..270c923 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -732,6 +732,79 @@
 		compatible = "infineon,ir35221";
 		reg = <0x72>;
 	};
+
+	pca2: pca9539@74 {
+		compatible = "nxp,pca9539";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+		};
+	};
 };
 
 &i2c10 {
@@ -756,6 +829,79 @@
 		compatible = "infineon,ir35221";
 		reg = <0x72>;
 	};
+
+	pca3: pca9539@74 {
+		compatible = "nxp,pca9539";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+		};
+	};
 };
 
 &i2c11 {
-- 
1.8.3.1

