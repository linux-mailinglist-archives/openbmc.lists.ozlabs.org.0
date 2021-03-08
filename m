Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA97331A77
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYbd615Qz3cbD
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:55:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l8fJlsf3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l8fJlsf3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYv3tKWz30Qn
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:26 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MY7XO148510; Mon, 8 Mar 2021 17:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jPLUSyxeNljAwDuHnZ6lQBTUOMZkGuxkcCPgkz7I1HQ=;
 b=l8fJlsf3L0X1few1gg1QdQj8DfI3byy7Ivm5tAJGl+hklUuIDR6ZbB9s9f5YXw/5oceD
 3S4YlxqzHvMJ5f4N3akqSgK1gVLz69CHTW3hipcn4cHxbmGmXBY34BpT0Mb4/A//Qhdy
 U75YAkIC7n8wbLr2srYUtAaZs3EoIxRRk8n6SOe6Thb0+7g29kfk96BVomg/SSBLq4vq
 ZSM3S6RhlgGKCGyTTLAgfrSoW+6dtlAF1i19IoePmMbJal+iEKmd0VsfKo1xNq4INOPJ
 0+ozTUSNpqiFaPylqB/Y1tihEJD+GBJpTPhQdO/kyhKmjwvaw9dKvdhExuMMpWMqoDzH Pw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 375uw8sn6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:23 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mpcwx025292;
 Mon, 8 Mar 2021 22:54:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3741c91xkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsMMw23593238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 546E8C605A;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21565C6057;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 07/35] ARM: dts: aspeed: rainier: Add leds that
 are off pic16f882
Date: Mon,  8 Mar 2021 16:53:51 -0600
Message-Id: <20210308225419.46530-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=738
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>

There are many LEDs that are connected to PIC16F882.
PIC has the software implementation of pca9552

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 690 +++++++++++++++++++
 1 file changed, 690 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 514a14d3f914..32b63112091c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -302,6 +302,336 @@ fan5 {
 			default-state = "keep";
 			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
 		};
+
+		ddimm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 2 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm5 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 5 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 7 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 8 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 9 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 10 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 11 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm12 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 12 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm13 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 13 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm14 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 14 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm15 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic1 15 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm16 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm17 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 1 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm18 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 2 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm19 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm20 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm21 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 5 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm22 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 6 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm23 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 7 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm24 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 8 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm25 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 9 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm26 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 10 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm27 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 11 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm28 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 12 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm29 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 13 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm30 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 14 GPIO_ACTIVE_LOW>;
+		};
+
+		ddimm31 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic2 15 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 2 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 3 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 4 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 5 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu1-vrm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 6 GPIO_ACTIVE_LOW>;
+		};
+
+		lcd-russel {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic3 8 GPIO_ACTIVE_LOW>;
+		};
+
+		planar {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 1 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 3 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 4 GPIO_ACTIVE_LOW>;
+		};
+
+		dasd-pyramid2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 5 GPIO_ACTIVE_LOW>;
+		};
+
+		cpu0-vrm0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 6 GPIO_ACTIVE_LOW>;
+		};
+
+		rtc-battery {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 7 GPIO_ACTIVE_LOW>;
+		};
+
+		base-blyth {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 8 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 9 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 10 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 11 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 12 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 13 GPIO_ACTIVE_LOW>;
+		};
+
+		pcieslot11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 14 GPIO_ACTIVE_LOW>;
+		};
+
+		tpm-wilson {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pic4 15 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 };
@@ -1365,6 +1695,366 @@ gpio@7 {
 		};
 	};
 
+	pic1: pca9952@32 {
+		compatible = "ibm,pca9552";
+		reg = <0x32>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pic2: pca9552@31 {
+		compatible = "ibm,pca9552";
+		reg = <0x31>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pic3: pca9552@30 {
+		compatible = "ibm,pca9552";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
+	pic4: pca9552@33 {
+		compatible = "ibm,pca9552";
+		reg = <0x33>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@8 {
+			reg = <8>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@9 {
+			reg = <9>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@10 {
+			reg = <10>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@11 {
+			reg = <11>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@12 {
+			reg = <12>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@13 {
+			reg = <13>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@14 {
+			reg = <14>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@15 {
+			reg = <15>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
-- 
2.27.0

