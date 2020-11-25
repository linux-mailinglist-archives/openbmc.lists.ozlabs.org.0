Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D62C362C
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 02:17:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgjgH2TSSzDqZT
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 12:17:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IB7lsNBP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgjfH433JzDqWH
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 12:16:54 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP1CRPF137490; Tue, 24 Nov 2020 20:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OfSm/aYjjLERxibytk8x03BO6++LmDR2iXpOD/Q22+E=;
 b=IB7lsNBPSf4KkWD3Yf7bXRGLJZvESDrLVFT3/y/YBITpWqJG5cJOOExm6DI4GEKODBiv
 z3txDX+uKUeKBgYYcH9oVoKJMMN8Mh47q3nxSuOX7FdxZAaPBGJcJMxS4Z7YBf45NS0n
 d4mpLYCCZVKUglLMYhEkNK/hykDJ2A9CuQFSiA8IVtMd7vkMKF3dWBXQe2up07dPA1VT
 Rj/0WNiuLGvaFY32baLYgvx+RkplYns3ZNl8491FUNyUblNW3rotkBaWfyz+H163tHG3
 1xyBDI1mPv5zZHqn/MU0cl5LXJqz8KruCPvnuk+G7bsU/+yV8n4i/mvW6iLiuhfaRGJz 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351ddar2n5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 20:16:51 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AP1Cckr138124;
 Tue, 24 Nov 2020 20:16:50 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351ddar2mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 20:16:50 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP19jCD018711;
 Wed, 25 Nov 2020 01:16:49 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 34xth93n74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 01:16:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP1Gcer49086810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 01:16:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E86097805F;
 Wed, 25 Nov 2020 01:16:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 776107805C;
 Wed, 25 Nov 2020 01:16:47 +0000 (GMT)
Received: from MSBARTH-P50.lan (unknown [9.211.40.249])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 01:16:47 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: bjwyman@gmail.com, eajames@linux.ibm.com, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier: Add gpio-keys-polled
 for fans
Date: Tue, 24 Nov 2020 19:16:40 -0600
Message-Id: <20201125011640.2346086-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_11:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250003
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

Add a gpio-keys-polled section for the fan presence signals from the
PCA9552 on i2c bus 7.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 43 ++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4692c5e8f919..e83355b8e13a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -96,6 +96,49 @@ ps3-presence {
 		};
 	};
 
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
+			linux,code = <6>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
+			linux,code = <7>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
+			linux,code = <8>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
+			linux,code = <9>;
+		};
+
+		fan4-presence {
+			label = "fan4-presence";
+			gpios = <&pca0 10 GPIO_ACTIVE_LOW>;
+			linux,code = <10>;
+		};
+
+		fan5-presence {
+			label = "fan5-presence";
+			gpios = <&pca0 11 GPIO_ACTIVE_LOW>;
+			linux,code = <11>;
+		};
+	};
+
 	i2c2mux: i2cmux {
 		compatible = "i2c-mux-gpio";
 		#address-cells = <1>;
-- 
2.28.0

