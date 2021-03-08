Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF4331AAE
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:03:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYmC0nZCz3dPW
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:03:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c8hWB/5O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c8hWB/5O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYy476Lz3cPv
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:30 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MZPca076048; Mon, 8 Mar 2021 17:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XoB6J7yaqoeMXtFuCEethGVBaVljmrD8qr4synPvTn4=;
 b=c8hWB/5OREhVracIvx/UdJYtmGsezi3gZx2YXFTrSs0C2hrddQ/txVCi4idqInVCjvnQ
 sLauqtUxogzubib7vU/2FSctXd7u5a76pWgt+RA8sTvdnw8PH+bn/if6Okn4fgWrHnDb
 NXqV4CK6NxjfSuszhtzEsWBms/uIgDdTzM1BgBXcviPJxS1LfBDetCtFQmdALLqlzfgD
 VDxyvrqwDYBYD8kleslBV3jaVJS0lDqez6sgxjZpieqlzEN2sU+H3VLWpRZW27giOv1K
 W8IkhL966Eznm8Nj2UnieoPoBoqtSUy2HqikCtPBPRh4lLq2bdfPc811u362Ml/8qlUd rA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udq2cc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:28 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MkgfM027653;
 Mon, 8 Mar 2021 22:54:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3741c89xsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsQLh28443010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB65C605A;
 Mon,  8 Mar 2021 22:54:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D33ADC6057;
 Mon,  8 Mar 2021 22:54:25 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 20/35] ARM: dts: Aspeed: Everest: Add pca9552
 fan presence
Date: Mon,  8 Mar 2021 16:54:04 -0600
Message-Id: <20210308225419.46530-21-eajames@linux.ibm.com>
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
 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=934 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Matthew Barth <msbarth@us.ibm.com>

Add the pca9552 at address 0x61 on i2c14 behind mux0 channel 3 with the
4 GPIO fan presence inputs.

Signed-off-by: Matthew Barth <msbarth@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 128 +++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index de2606b416e6..d7f23b74dd4b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -171,6 +171,37 @@ vga_memory: region@bf000000 {
 			reg = <0xbf000000 0x01000000>; /* 16M */
 		};
 	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <1000>;
+
+		fan0-presence {
+			label = "fan0-presence";
+			gpios = <&pca0 15 GPIO_ACTIVE_LOW>;
+			linux,code = <15>;
+		};
+
+		fan1-presence {
+			label = "fan1-presence";
+			gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
+			linux,code = <14>;
+		};
+
+		fan2-presence {
+			label = "fan2-presence";
+			gpios = <&pca0 13 GPIO_ACTIVE_LOW>;
+			linux,code = <13>;
+		};
+
+		fan3-presence {
+			label = "fan3-presence";
+			gpios = <&pca0 12 GPIO_ACTIVE_LOW>;
+			linux,code = <12>;
+		};
+	};
 };
 
 &i2c0 {
@@ -567,6 +598,103 @@ fan@3 {
 					maxim,fan-fault-pin-mon;
 				};
 			};
+
+			pca0: pca9552@61 {
+				compatible = "nxp,pca9552";
+				reg = <0x61>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"","","","",
+					"","","","",
+					"","","","",
+					"presence-fan3",
+					"presence-fan2",
+					"presence-fan1",
+					"presence-fan0";
+
+				gpio@0 {
+					reg = <0>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@1 {
+					reg = <1>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@2 {
+					reg = <2>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@3 {
+					reg = <3>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@4 {
+					reg = <4>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@5 {
+					reg = <5>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@6 {
+					reg = <6>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@7 {
+					reg = <7>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@8 {
+					reg = <8>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@9 {
+					reg = <9>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@10 {
+					reg = <10>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@11 {
+					reg = <11>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@12 {
+					reg = <12>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@13 {
+					reg = <13>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@14 {
+					reg = <14>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+
+				gpio@15 {
+					reg = <15>;
+					type = <PCA955X_TYPE_GPIO>;
+				};
+			};
 		};
 	};
 
-- 
2.27.0

