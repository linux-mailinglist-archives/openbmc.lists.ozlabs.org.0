Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8762C59C
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 17:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8PK6Nq6z2xZV
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 03:57:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qGOxSEXI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qGOxSEXI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8Nj3RgWz2xHK
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 03:57:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGGg81T031561;
	Wed, 16 Nov 2022 16:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8Q9E6irN2B4WXYxW5wFJTk2a3PgqV6A327y3TstbExc=;
 b=qGOxSEXIzqVkhV6v1dYoW+oxh64pVZ7XVmUpmP89Eajxzxrj82pLfHH9ayYPvyZKTKZv
 nu705r5eDpFRcHxOKv5PnLeoAyaz8gmHGIgR6C7cltCIgge8xFVL0D3oRlJsXQ4dUFYb
 yO6Kt36xAd92YUSOz+roeBqO1IsaioCSyIhSqskyxq5qPcFMz48WGjRB6PzYAVD/lNf1
 55GygORfE5czznvWQcaIdLdAtrpPpeyBtaNr0LEH58F1EgzY39OM8o4Wp7uTfU1fsNte
 uvLg1uhsytwFTflbJefqL/sYkBPRLIttHVtUjuSf2zsQV6uUSOFNBk2kdiLyjIrEhhYz +w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw3m50ay7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 16:57:19 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGGofH4025874;
	Wed, 16 Nov 2022 16:57:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma04wdc.us.ibm.com with ESMTP id 3kt349uqr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 16:57:18 +0000
Received: from smtpav01.wdc07v.mail.ibm.com ([9.208.128.113])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGGvHi157409868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 16:57:17 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD57358059;
	Wed, 16 Nov 2022 16:57:16 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 219535805B;
	Wed, 16 Nov 2022 16:57:16 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.114.76])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 16:57:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0] arm: dts: aspeed: ibm-power9-dual: Update OCC nodes
Date: Wed, 16 Nov 2022 10:57:14 -0600
Message-Id: <20221116165714.2349545-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j-62ySv8FXfj1lS4us9PyrqASwKkZDYD
X-Proofpoint-ORIG-GUID: j-62ySv8FXfj1lS4us9PyrqASwKkZDYD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160115
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set the ibm,no-poll-on-init property for the OCCs.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/ibm-power9-dual.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/ibm-power9-dual.dtsi b/arch/arm/boot/dts/ibm-power9-dual.dtsi
index a0fa65b44b0f..916041e6e00c 100644
--- a/arch/arm/boot/dts/ibm-power9-dual.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-dual.dtsi
@@ -86,8 +86,13 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ0: occ@1 {
+			fsi_occ0: occ {
 				compatible = "ibm,p9-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p9-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -187,8 +192,13 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ1: occ@2 {
+			fsi_occ1: occ {
 				compatible = "ibm,p9-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p9-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -203,15 +213,6 @@ fsi_hub1: hub@3400 {
 	};
 };
 
-/* Legacy OCC numbering (to get rid of when userspace is fixed) */
-&fsi_occ0 {
-	reg = <1>;
-};
-
-&fsi_occ1 {
-	reg = <2>;
-};
-
 / {
 	aliases {
 		i2c100 = &cfam0_i2c0;
-- 
2.31.1

