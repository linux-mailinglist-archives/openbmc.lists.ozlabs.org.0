Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCEC885B49
	for <lists+openbmc@lfdr.de>; Thu, 21 Mar 2024 16:00:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXNOOuPZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0pYH1gTRz3dfM
	for <lists+openbmc@lfdr.de>; Fri, 22 Mar 2024 02:00:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXNOOuPZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0pXk4H6Mz3bX3
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 02:00:05 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42LE10cl022660;
	Thu, 21 Mar 2024 15:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XCucPZQ8Q8+Hj5nEsbs5BqZJl7nPP8/p2jTEv2LdBwA=;
 b=JXNOOuPZKGG1otn1gL06AxBwC9H5M0ghtf71jP/rHKoNnWktETi2QjxucK55bqrJc7p9
 fyOIXVWocTf4fUZto3oIVMZQb8lQjwnieI6Gix2joSUJDnt1kY0ICKfttHVxo0p9qUmG
 UVTViDznrvQMdwg7IGNoyxN9ZhXiLjRZQxSQnqXw3Dw30y/LhhqIQtETKkyUdhn0Kon0
 dCEivY62EqOss4S8sSJyUKpwkvP805cDfe+UuWXxYvB1b9SyMsB4NMKpC3aT4u4Hklzg
 xWePBjy6RnlhSmKv0yUfd5pYupR+RrN1CVyPkvFFCKjL+kNAosxlb5UM0M9VB1Zl4CF3 2w== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x0nmyr9gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 14:59:59 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42LENOrt017203;
	Thu, 21 Mar 2024 14:59:58 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wwnrtp42f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 14:59:58 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42LExtff28181074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Mar 2024 14:59:57 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74F9A58065;
	Thu, 21 Mar 2024 14:59:55 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A0D458043;
	Thu, 21 Mar 2024 14:59:55 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.39])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 Mar 2024 14:59:55 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6] ARM: dts: Aspeed: Bonnell: Fix NVMe LED labels
Date: Thu, 21 Mar 2024 09:59:52 -0500
Message-Id: <20240321145952.190544-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q6KhO0JagNVhxMejoBG1RIIXnChs2Mjg
X-Proofpoint-ORIG-GUID: Q6KhO0JagNVhxMejoBG1RIIXnChs2Mjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_10,2024-03-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=672 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403210107
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

The PCA chip for the NVMe LEDs is wired up backwards, so correct
the device tree labels.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
index 29d68d7e876f..edcdf138da90 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
@@ -502,7 +502,7 @@ pca9551@60 {
 		#gpio-cells = <2>;
 
 		led@0 {
-			label = "nvme0";
+			label = "nvme3";
 			reg = <0>;
 			retain-state-shutdown;
 			default-state = "keep";
@@ -510,7 +510,7 @@ led@0 {
 		};
 
 		led@1 {
-			label = "nvme1";
+			label = "nvme2";
 			reg = <1>;
 			retain-state-shutdown;
 			default-state = "keep";
@@ -518,7 +518,7 @@ led@1 {
 		};
 
 		led@2 {
-			label = "nvme2";
+			label = "nvme1";
 			reg = <2>;
 			retain-state-shutdown;
 			default-state = "keep";
@@ -526,7 +526,7 @@ led@2 {
 		};
 
 		led@3 {
-			label = "nvme3";
+			label = "nvme0";
 			reg = <3>;
 			retain-state-shutdown;
 			default-state = "keep";
-- 
2.39.3

