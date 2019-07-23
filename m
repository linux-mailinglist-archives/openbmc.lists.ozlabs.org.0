Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A46AF70E37
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 02:35:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45szzX5jc7zDqJ2
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 10:35:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="S+RGh1ib"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45szyT1gQczDqW4
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 10:34:56 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x6N0Yox1012845
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 17:34:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=upxpwa+NHml6Xp6NZf6ZnaOWMnszUj5BKBn+ik5Bpgw=;
 b=S+RGh1ibHWnPvF8X2OO46KMOxdDxVIR57ENJoeUxzyPNW5ekVJBbfhxHz6h+hjqy1tuy
 +1QDQaJVH2Jyk9XEyG1no4bzuXk+K1CNExGFqd19ouZQLEWB7oiqkvkGYB7+G+FqD+YX
 BIg7M1/MfPmGJOBpTRX1yHoqScVJxUppQ0A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2twjyn10ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 17:34:54 -0700
Received: from mx-out.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 22 Jul 2019 17:34:52 -0700
Received: by devvm4117.prn2.facebook.com (Postfix, from userid 167582)
 id E50481152F9BD; Mon, 22 Jul 2019 17:32:17 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Vijay Khemka <vijaykhemka@fb.com>
Smtp-Origin-Hostname: devvm4117.prn2.facebook.com
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Smtp-Origin-Cluster: prn2c23
Subject: [PATCH v2] ARM: dts: aspeed: tiogapass: Add VR devices
Date: Mon, 22 Jul 2019 17:32:16 -0700
Message-ID: <20190723003216.2910042-1-vijaykhemka@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230000
X-FB-Internal: deliver
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 vijaykhemka@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds voltage regulators Infineon pxe1610 devices to Facebook
tiogapass platform.

Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
---
In v2: Renamed vr to regulator and fixed some typo in commit message.

 .../dts/aspeed-bmc-facebook-tiogapass.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
index c4521eda787c..e722e9aef907 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
@@ -144,6 +144,42 @@
 &i2c5 {
 	status = "okay";
 	// CPU Voltage regulators
+	regulator@48 {
+		compatible = "infineon,pxe1610";
+		reg = <0x48>;
+	};
+	regulator@4a {
+		compatible = "infineon,pxe1610";
+		reg = <0x4a>;
+	};
+	regulator@50 {
+		compatible = "infineon,pxe1610";
+		reg = <0x50>;
+	};
+	regulator@52 {
+		compatible = "infineon,pxe1610";
+		reg = <0x52>;
+	};
+	regulator@58 {
+		compatible = "infineon,pxe1610";
+		reg = <0x58>;
+	};
+	regulator@5a {
+		compatible = "infineon,pxe1610";
+		reg = <0x5a>;
+	};
+	regulator@68 {
+		compatible = "infineon,pxe1610";
+		reg = <0x68>;
+	};
+	regulator@70 {
+		compatible = "infineon,pxe1610";
+		reg = <0x70>;
+	};
+	regulator@72 {
+		compatible = "infineon,pxe1610";
+		reg = <0x72>;
+	};
 };
 
 &i2c6 {
-- 
2.17.1

