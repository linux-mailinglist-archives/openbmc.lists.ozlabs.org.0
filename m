Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB5E331A8F
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:59:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYh65cjNz3dMC
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:59:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ss+uD98J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ss+uD98J; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYw5GXPz30Qw
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:27 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MXlNc173175; Mon, 8 Mar 2021 17:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GOVt+pRUNw/AXqj6KIJXzYFtHqTQ7R1NgghuSC0S2+0=;
 b=ss+uD98JI3vTgBEvwQ/EZLS4sAmgv9QhUDFKuMaOyCn4Po69CdXA+ez5ho6ZEY8MOwtU
 tVg8X/K8QSqoGGxO2ZvyseUj/nUo4poGb1Ae+uCRGSKIitPgpYXr824jIHRg2XUzn1E3
 L1lKjNxiLfch32TJbJxIlnvzByS45cO4hDSuRpx9xjkDz2kmTm3hRQ+td43u9s8E0RNY
 Y2QVxzPxFCbnyRuCf0c8JXSiclb0S3E2jaiZ8C4VYGwtD+2yAdNfFLSt7GkHP6RyKJVN
 teFtAVBR+qWXLjP1l1tXRS80LsZwvmTdRNuN+9HjBtTj64dxhwtNui0BZ6LrgzCjAKnE jg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375urk1tfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mqr6Z018106;
 Mon, 8 Mar 2021 22:54:24 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3741c96etv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:24 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsM2j34013532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:23 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5304C605D;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6368C6057;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 09/35] ARM: dts: aspeed: rainier: Add leds that
 are on optional PCI cable cards
Date: Mon,  8 Mar 2021 16:53:53 -0600
Message-Id: <20210308225419.46530-10-eajames@linux.ibm.com>
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
 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080118
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

These are LEDs on the cable cards that plug into PCIE slots.
The LEDs are controlled by pca9552 i2c expander

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 264 +++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index c507e8da101e..3a9183bae259 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -789,6 +789,70 @@ nvme23 {
 			gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	leds-optional-cablecard0 {
+		compatible = "gpio-leds";
+
+		cablecard0-cxp-top {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca5 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cablecard0-cxp-bot {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca5 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-cablecard3 {
+		compatible = "gpio-leds";
+
+		cablecard3-cxp-top {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca6 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cablecard3-cxp-bot {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca6 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-cablecard4 {
+		compatible = "gpio-leds";
+
+		cablecard4-cxp-top {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca7 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cablecard4-cxp-bot {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca7 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-cablecard10 {
+		compatible = "gpio-leds";
+
+		cablecard10-cxp-top {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca8 0 GPIO_ACTIVE_LOW>;
+		};
+
+		cablecard10-cxp-bot {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca8 1 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &ehci1 {
@@ -1541,6 +1605,56 @@ eeprom@52 {
 		compatible = "atmel,24c64";
 		reg = <0x52>;
 	};
+
+	pca5: pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
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
+	};
 };
 
 &i2c5 {
@@ -1565,6 +1679,106 @@ eeprom@51 {
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	pca6: pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
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
+	};
+
+	pca7: pca9551@61 {
+		compatible = "nxp,pca9551";
+		reg = <0x61>;
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
+	};
 };
 
 &i2c6 {
@@ -2411,6 +2625,56 @@ eeprom@51 {
 		compatible = "atmel,24c64";
 		reg = <0x51>;
 	};
+
+	pca8: pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
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
+	};
 };
 
 &i2c12 {
-- 
2.27.0

