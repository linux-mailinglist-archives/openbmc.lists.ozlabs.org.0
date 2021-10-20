Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B378E43559B
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZPY62GZ8z2xY8
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:55:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=caaVHRy9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=caaVHRy9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZPWF077Fz2xfM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:53:28 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KLlrPo014622; 
 Wed, 20 Oct 2021 17:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AdoduJBeesZwSRL2n0RV3AFYRWMfXYjQLkUAJihMP1s=;
 b=caaVHRy9MnE/ia49+B5Ae9Ahftmui9QPDnxAPYdA4WZZRKP3DGIz9vkqLzrxgCy38eab
 Qxi3poF08ILu7SPsYa+6y0t5HIUbd8Q19eiTCTfoDQo7KqlJIgP6G5LVxzVpys/OjE+K
 HCrxSQbILKges3GPXmWdob469eyHSkS7MEjqPUNAYYnZuqVUrojlVGOV5NWtBgvjsHVh
 tkTl25YASH+9jXGjmiLkKDu8ZykRkiKpe2qY+q6G7OCQS0QyFMPa47a+vt9p4tVW6/E5
 D/PxXHgejb66bCkAsPCii1/doDFWEaEW0SH0ZudBd+X2bO5t8vKSX4YO4hxFKNQbiPPJ cw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3btubf81vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:53:25 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KLm0i1001430;
 Wed, 20 Oct 2021 21:53:25 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3bqpcby1ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 21:53:25 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KLrOlM42008890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 21:53:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FEB9124055;
 Wed, 20 Oct 2021 21:53:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DEB4124053;
 Wed, 20 Oct 2021 21:53:24 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.77.138])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 21:53:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14 3/5] ARM: dts: aspeed: everest: Add I2C switch
 on bus 8
Date: Wed, 20 Oct 2021 16:53:19 -0500
Message-Id: <20211020215321.33960-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020215321.33960-1-eajames@linux.ibm.com>
References: <20211020215321.33960-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OI1aWCWGumIUg8KhvtrrT2mk3Pn-xQBK
X-Proofpoint-ORIG-GUID: OI1aWCWGumIUg8KhvtrrT2mk3Pn-xQBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200123
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

The switch controls two busses containing some VRMs.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index f2089af17bb5..59e187f3cba3 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -108,6 +108,8 @@ aliases {
 		i2c44 = &i2c15mux2chn1;
 		i2c45 = &i2c15mux2chn2;
 		i2c46 = &i2c15mux2chn3;
+		i2c47 = &i2c8mux0chn0;
+		i2c48 = &i2c8mux0chn1;
 
 		serial4 = &uart5;
 
@@ -1782,6 +1784,27 @@ eeprom@50 {
 		compatible = "atmel,24c128";
 		reg = <0x50>;
 	};
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+		i2c-mux-idle-disconnect;
+
+		i2c8mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c8mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
 };
 
 &i2c9 {
-- 
2.27.0

