Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E673F3E94F3
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDhj65Lbz2yMM
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RkzDLZU/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RkzDLZU/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl5LM2z3019
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXsZM129624; Wed, 11 Aug 2021 11:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tIYGwOK6E+mXomBYPpgU181WmUHwpEpY6zk4OMV+ffs=;
 b=RkzDLZU/IlL/wQG1Qgvvw1zq3Tq+G3O5bQhOWAmeQZygI552cfLm3b2JmZ7ANR7iHPCl
 2jztRbYDgmZEriVcLh4ZYs29tSj9U6/fsO0VueTbfBq5msqOCVTl8iQFvzBCatCFQ9+t
 JFbXs12cnXEKjvZ6QG7Oo2JV3h1aZsJ51K3JEn/CQHdT2w06OlZ9T7ybP02JYByQOQES
 CCmW6ljvh6j5aAfLwwSeGMO0nhvuhqih1ZbR1g5uZnu6VlpvKH3M6hPs932hiRoD29Zl
 KAKgdi2bXT1T/HJoV+8ixz2jZP9kWJSMM2rYZ3y+YOKRMQiNmdJBivVfRDioQZfpPdMR Jw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acgpms63w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXh2G009639;
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3a9htefr5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgbkg19399126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6400C6A057;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 323E36A04D;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 11/14] ARM: dts: aspeed: Add Rainier 2U and 4U
 device trees for pass 1 hardware
Date: Wed, 11 Aug 2021 10:42:29 -0500
Message-Id: <20210811154232.12649-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2XGbGil5jgx-aQtE2dqCVvJg_Q72arPw
X-Proofpoint-ORIG-GUID: 2XGbGil5jgx-aQtE2dqCVvJg_Q72arPw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110104
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

The original BMC card must be supported in the device tree, so add
new pass 1 device trees for the two relevant Rainier systems.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/Makefile                    |  2 +
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts | 94 +++++++++++++++++++
 .../boot/dts/aspeed-bmc-ibm-rainier-p1.dts    | 94 +++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 48d48c85de9e..36b4798e7cd4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1402,8 +1402,10 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-facebook-yosemitev2.dtb \
 	aspeed-bmc-ibm-everest.dtb \
 	aspeed-bmc-ibm-rainier.dtb \
+	aspeed-bmc-ibm-rainier-p1.dtb \
 	aspeed-bmc-ibm-rainier-1s4u.dtb \
 	aspeed-bmc-ibm-rainier-4u.dtb \
+	aspeed-bmc-ibm-rainier-4u-p1.dtb \
 	aspeed-bmc-intel-s2600wf.dtb \
 	aspeed-bmc-inspur-fp5280g2.dtb \
 	aspeed-bmc-inspur-nf5280m6.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
new file mode 100644
index 000000000000..e35a3efd9d22
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier-4u.dts"
+
+/ {
+	model = "Rainier 4U Pass 1";
+
+	aliases {
+		/delete-property/ i2c20;
+		/delete-property/ i2c21;
+		/delete-property/ i2c22;
+		/delete-property/ i2c23;
+		/delete-property/ i2c24;
+		/delete-property/ i2c25;
+		/delete-property/ i2c26;
+		/delete-property/ i2c27;
+		/delete-property/ i2c28;
+		/delete-property/ i2c29;
+		/delete-property/ i2c30;
+	};
+};
+
+&i2c4 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+};
+
+&i2c5 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c6 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+
+	eeprom@53 {
+		compatible = "atmel,24c64";
+		reg = <0x53>;
+	};
+};
+
+&i2c11 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
new file mode 100644
index 000000000000..b3c923f1838b
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2021 IBM Corp.
+/dts-v1/;
+
+#include "aspeed-bmc-ibm-rainier.dts"
+
+/ {
+	model = "Rainier 2U Pass 1";
+
+	aliases {
+		/delete-property/ i2c20;
+		/delete-property/ i2c21;
+		/delete-property/ i2c22;
+		/delete-property/ i2c23;
+		/delete-property/ i2c24;
+		/delete-property/ i2c25;
+		/delete-property/ i2c26;
+		/delete-property/ i2c27;
+		/delete-property/ i2c28;
+		/delete-property/ i2c29;
+		/delete-property/ i2c30;
+	};
+};
+
+&i2c4 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+};
+
+&i2c5 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
+
+&i2c6 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c64";
+		reg = <0x52>;
+	};
+
+	eeprom@53 {
+		compatible = "atmel,24c64";
+		reg = <0x53>;
+	};
+};
+
+&i2c11 {
+	/delete-node/ pca9546@70;
+
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+	};
+
+	eeprom@51 {
+		compatible = "atmel,24c64";
+		reg = <0x51>;
+	};
+};
-- 
2.27.0

