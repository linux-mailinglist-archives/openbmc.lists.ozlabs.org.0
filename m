Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2F331A89
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 23:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYfQ2xhxz3cXY
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 09:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M8tgd9ew;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M8tgd9ew; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYw1HNgz3cK9
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:26 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MYa6J068149; Mon, 8 Mar 2021 17:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3PPwH3ECs6KQM/eb8xanIWTpaQtpaWFRUCco/JlaR0o=;
 b=M8tgd9ewvybaw2jLWLs2VlUmCngKv2OftfUp7EKt5ZMs2jaJJTD2usbr8OY8Eaqdodin
 bS4uRAVcUJIQ4hx+VLvFggAn+ktGb9VVDvHlSdPT+avis6rQiaZJ7rl4ChZHltqj87Vs
 mYiwSfS6rCmGgGsqk1HVdcsLTKOA+YDZtHtTq+gqdChiJyA4Uu7OezwRbYoogDsMBtfj
 wTQXaTSYfDu5MT6TBZpbQKo5X4FBacC2viQArp37IzbOAG3aFRd6M+jAEkzPoGaG2gM6
 I3XNZgZ6FAZvd0zhsvDa64loc5F/QVSyoEeScvmXBkCCYNewacZo04uf+4ONCJcY95iQ 4w== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375u8raw23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:24 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mqv2r023683;
 Mon, 8 Mar 2021 22:54:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3741c9egxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsM3j23593236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DFB6C605B;
 Mon,  8 Mar 2021 22:54:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2475C6057;
 Mon,  8 Mar 2021 22:54:21 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds that
 are off PCA9552
Date: Mon,  8 Mar 2021 16:53:50 -0600
Message-Id: <20210308225419.46530-7-eajames@linux.ibm.com>
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
 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
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

These LEDs are on the fans and are connected via a
pca9551 i2c expander

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 41 ++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 6684485a2db0..514a14d3f914 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -263,6 +263,47 @@ fan5-presence {
 			linux,code = <11>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		fan0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
+		};
+
+		fan1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
+		};
+
+		fan2 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
+		};
+
+		fan3 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
+		};
+
+		fan4 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
+		};
+
+		fan5 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 };
 
 &ehci1 {
-- 
2.27.0

