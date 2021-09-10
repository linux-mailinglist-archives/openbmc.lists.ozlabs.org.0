Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8C407228
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 21:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5mmx5HQlz2yg6
	for <lists+openbmc@lfdr.de>; Sat, 11 Sep 2021 05:54:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C8bSWO4W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C8bSWO4W; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5mmS6G8yz2yPS;
 Sat, 11 Sep 2021 05:54:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 18AJWodq026449; Fri, 10 Sep 2021 15:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/ByGxRxg9XuoL0ppwX2mQ5lVHpqrilpdM6mbmT+sKHY=;
 b=C8bSWO4WOIHHQnnWSrHuAG+oOrd2yRs6k/XzyvS8KGnz1XH0IWvniW9g9xlGdvZ3W66q
 5guqJJggq3y5+6oAUJKPmRyvIvk42YFkzpVbAXvOk0cH8L16pGFO+db1YoS1D5msLH4M
 If5GEWL06qo1acsONY4uMV62Q6ZGRc77VeaPDfC5yBvbp3SopyyxYWVKZkJVyLv3E6+3
 6cqBD8zVBtiT2hPhpfpTUPedFs93qE7+OvGs0Qr/5NjgwUUF3C2PMOZq63fiMsvLxen6
 Kor4h1238aBCGwjRo/2GzTqceQlhaIVUpoGfWpHmEgB+EfI2MT45ll8tGRSjzUt9DDiY lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b04s1v1ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 15:54:23 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18AJZjKJ036146;
 Fri, 10 Sep 2021 15:54:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b04s1v1k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 15:54:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18AJbcT1029277;
 Fri, 10 Sep 2021 19:54:22 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3axcnr4tsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 19:54:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18AJsKXH26542552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Sep 2021 19:54:20 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4FA26E058;
 Fri, 10 Sep 2021 19:54:20 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F266E052;
 Fri, 10 Sep 2021 19:54:20 +0000 (GMT)
Received: from fstone01p1.aus.stglabs.ibm.com (unknown [9.3.116.196])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 10 Sep 2021 19:54:20 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF gpio
Date: Fri, 10 Sep 2021 19:54:17 +0000
Message-Id: <20210910195417.2838841-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kvZMz66oaRi9U5CcGODnl8u1OycCKS2B
X-Proofpoint-ORIG-GUID: ZnPfP3ip2j1sZJG9L6_zv4t4URZ-xLFS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-10_07:2021-09-09,
 2021-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=975 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100112
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
Cc: spinler@us.ibm.com, derekh@us.ibm.com, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@us.ibm.com>, bjwyman@gmail.com, shawnmm@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

The N_MODE_VREF gpio is designed to be used to specify how many power
supplies the system should have (2 or 4).  If enough power supplies fail
so that the system no longer has redundancy (no longer n+1), the
hardware will signal to the Onboard Chip Controller that the system may
be oversubscribed, and performance may need to be reduced so the system
can maintain it's powered on state. This gpio is on a 9552, populate all
the gpios on that chip for completeness.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---

v2: Update commit message.

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103 +++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 6fd3ddf97a21..d5eea86dc260 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1502,6 +1502,109 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
+	pca_pres3: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"",
+			"APSS_RESET_N",
+			"", "", "", "",
+			"P10_DCM0_PRES",
+			"P10_DCM1_PRES",
+			"", "",
+			"N_MODE_CPU_N",
+			"",
+			"PRESENT_VRM_DCM0_N",
+			"PRESENT_VRM_DCM1_N",
+			"N_MODE_VREF",
+			"";
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
 	pca_pres2: pca9552@61 {
 		compatible = "nxp,pca9552";
 		reg = <0x61>;
-- 
2.25.1

