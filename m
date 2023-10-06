Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07C7BBDD3
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:32:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Od3i+dAg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FqL1lzLz3vXk
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:32:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Od3i+dAg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2Fkd4y1Vz3ccQ
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:28:09 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HFXlq020397;
	Fri, 6 Oct 2023 17:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Gw7SapJbBnev5CVrafLrnLawyQHVga3X1Mb9OQ1LMbo=;
 b=Od3i+dAgDSRGK5GJdsRvV4/F2/GSRQT9iiyGIdZk999UVNmEodATowL1LOpSHRRwY2Mh
 qApUIVpYUXgOf+MB01uNlo7zELNNPtPGJuNfww3b2qy/GNO8DxX50akdh03ronZCBlMO
 +E8FBk5kdqc2Vu+3S5MONtrcrek8aHGa/aEHmqdaALjf2+E0b5iJIbn8Tfe6q+KFRJZu
 TPwETeWSKbVtQkt7nA+OjmBEJRvs+HeN1giuB5L1ZWxAaQG1BPd53DlcH63BTNS38G1O
 N/3Wqhxi7OMyXiLZ+k/y7aJ9KuqKoWLjiB6ELOmGDgA2NrPXFcR0omc31RgTOPxBmjei CA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjpftrd65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:28:04 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396Gw8dX005868;
	Fri, 6 Oct 2023 17:28:04 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0uasc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:28:04 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396HS0u524511136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 17:28:01 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97D6C58059;
	Fri,  6 Oct 2023 17:28:00 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5055958058;
	Fri,  6 Oct 2023 17:28:00 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.60.170])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 17:28:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 4/4] ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
Date: Fri,  6 Oct 2023 12:27:35 -0500
Message-Id: <20231006172735.420566-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231006172735.420566-1-eajames@linux.ibm.com>
References: <20231006172735.420566-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QNEf3b5r3BHjlAYO4d8nyCi-KBnaGik5
X-Proofpoint-GUID: QNEf3b5r3BHjlAYO4d8nyCi-KBnaGik5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=719 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060130
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

The fans in the 4U chassis do not have dual tachometers, so remove those
properties in the device tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
index 342546a3c0f5..24283cc3d486 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts
@@ -19,3 +19,27 @@ power-supply@6b {
 		reg = <0x6b>;
 	};
 };
+
+&fan0 {
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan1 {
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan2 {
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan3 {
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan4 {
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan5 {
+	/delete-property/ maxim,fan-dual-tach;
+};
-- 
2.39.3

