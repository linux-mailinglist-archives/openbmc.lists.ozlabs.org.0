Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B5331A8A
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:58:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYfr0dc8z3cjm
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:58:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4EjBpMi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g4EjBpMi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYw1RhTz3cKP
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:26 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128Mc28H080087; Mon, 8 Mar 2021 17:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tpUYqazV3+Drywy60jwQAfVShmOD4D6/ziEHmOJ5Q78=;
 b=g4EjBpMi9+oAp5uKpiH8Sj90tS9jv7x5x+tBG8Vqbts2cCJPiwTKoDttd8x9sm8XD17N
 vIwrTIra7xyhsL+QAUqow5m1TkchzOy2CpLZFxIAo+ms1Bh+h40usNBFYEhacbRlKui9
 EiuboYzi1fl/Re98IjQtqhgETVGt9+5SfzFsACmNjqreRNrCttHhskeGzq4FDrPhwl7b
 KHTg7BE5dZG9OGIGvGi/q1l0207ALaohXm+p8hqAq+NLys2w4tbVIvahRrHxfP3w+9Bj
 LOsizU9KVDiAGzSnQ3NwEx+zZYG3+huA8uhut7iXLN4m6HIFW8SS4WK47C+yZ7EGmC5h 1Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37577ggg78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:24 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MrLpA005599;
 Mon, 8 Mar 2021 22:54:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3741c9ef9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsMgO29491506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94400C605A;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65CEAC6057;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 08/35] ARM: dts: aspeed: rainier: Add leds on
 optional DASD cards
Date: Mon,  8 Mar 2021 16:53:52 -0600
Message-Id: <20210308225419.46530-9-eajames@linux.ibm.com>
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
 lowpriorityscore=0
 mlxlogscore=962 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
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

These cards are not hot pluggable and must be installed
prior to boot. LEDs on these are controlled by PCA9552
i2c expander

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 425 +++++++++++++++++++
 1 file changed, 425 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 32b63112091c..c507e8da101e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -634,6 +634,161 @@ tpm-wilson {
 		};
 	};
 
+	leds-optional-dasd-pyramid0 {
+		compatible = "gpio-leds";
+
+		nvme0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme5 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme6 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme7 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca2 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-dasd-pyramid1 {
+		compatible = "gpio-leds";
+
+		nvme8 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme9 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme10 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme11 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme12 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme13 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme14 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme15 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds-optional-dasd-pyramid2 {
+		compatible = "gpio-leds";
+
+		nvme16 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 0 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme17 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 1 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme18 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 2 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme19 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 3 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme20 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 4 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme21 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 5 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme22 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 6 GPIO_ACTIVE_LOW>;
+		};
+
+		nvme23 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &ehci1 {
@@ -2269,6 +2424,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca2: pca9552@60 {
+		compatible = "nxp,pca9552";
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
 };
 
 &i2c14 {
@@ -2278,6 +2523,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca3: pca9552@60 {
+		compatible = "nxp,pca9552";
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
 };
 
 &i2c15 {
@@ -2287,6 +2622,96 @@ eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
+
+	pca4: pca9552@60 {
+		compatible = "nxp,pca9552";
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
 };
 
 &vuart1 {
-- 
2.27.0

