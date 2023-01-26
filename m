Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13C67D82C
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 23:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2vxz3SDvz3fFN
	for <lists+openbmc@lfdr.de>; Fri, 27 Jan 2023 09:09:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hn7PVgES;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hn7PVgES;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2vxL1CyPz3fCg
	for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2023 09:08:53 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QKaDSs021740;
	Thu, 26 Jan 2023 22:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=iK6JXmtOphUTug/ZOvz4mjdHuy+kbI7evC0z/bdWsZo=;
 b=hn7PVgESlo117Aok0+jtWWN5+QKtL8CLFRonqAN/nEjEeDqkZzxFYyP73r+cfMZN+Jh2
 Wo6sq0omiXXNiTC3LNLLAlvUr8FXfsc/eTz+clwFwTrlfITZJk6Sh+K02YNGcoYnWRTm
 6NTwR/zqzQ+8DFwrV3dx9x4IQoRYznmODo1YnzR2QBoks7fLYap3TVXgQUaCWh1OBIuc
 m6W2vfX+yieBHcxxlTMYz68iSurguKKEsTowOakTj7KyBV3PMqB5NQTO84m52MKm92oX
 aqtb1+K4660n+sGhEWvk30Js8+ocO1TtSLG8cPtQNkvhvOcdH/B9EhhaWh5gHEcZXoBf 1Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc0db24gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:08:47 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30QL09VS004817;
	Thu, 26 Jan 2023 22:08:46 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p8fbb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:08:46 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30QM8iLe3539458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 22:08:45 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCBBF5805C;
	Thu, 26 Jan 2023 22:08:44 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 425E358054;
	Thu, 26 Jan 2023 22:08:44 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.3.213])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jan 2023 22:08:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0] arm: dts: aspeed: p10bmc: Enable UART2
Date: Thu, 26 Jan 2023 16:08:42 -0600
Message-Id: <20230126220842.885965-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gnOwBr73RZVfRFlLus-geIoAeS3NpEJ9
X-Proofpoint-GUID: gnOwBr73RZVfRFlLus-geIoAeS3NpEJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=678 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260207
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

The APSS can be accessed over the second uart on these systems.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index e2a9a18bda57..867160821863 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -855,6 +855,10 @@ &i2c15 {
 	status = "okay";
 };
 
+&uart2 {
+	status = okay;
+};
+
 &vuart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1448ea895be4..89612b789c82 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -3649,6 +3649,10 @@ &ibt {
 	status = "okay";
 };
 
+&uart2 {
+	status = okay;
+};
+
 &vuart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 20ef958698ec..4e4035aae09e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -2352,6 +2352,10 @@ led@7 {
 	};
 };
 
+&uart2 {
+	status = okay;
+};
+
 &vuart1 {
 	status = "okay";
 };
-- 
2.31.1

