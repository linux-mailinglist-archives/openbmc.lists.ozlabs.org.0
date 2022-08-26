Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC35A3025
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 21:45:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDr0X6Pcpz3bnV
	for <lists+openbmc@lfdr.de>; Sat, 27 Aug 2022 05:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kxodz/NU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kxodz/NU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDr0434D5z3bXD
	for <openbmc@lists.ozlabs.org>; Sat, 27 Aug 2022 05:45:07 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27QJPx8u024011;
	Fri, 26 Aug 2022 19:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ugh+Qf49gfpTnAbuCtkUGtmpi8sQWvu2NAeBUTn6NMU=;
 b=kxodz/NUUeA9xayESV7DIMtvNVFSiBxaCLagMStcfNCetzyExbvUTskFrO0Y78YmuQCk
 mHnaEnANvd4uKVRPgPyJO8cdLq1Zlz3WwcgKEDaAFaxmlHxMz5Zad5mvAyCAVNi/QEXP
 guPsffBktwhoQ5FyKiczXMjbrJFFBnLZecj9JuQ6ZHtsegxDrLo6+aEsAiiplKuPl7Dp
 vy9SeBLeyoGTkdiqSsoWoXfBWSfojJeBabcxMVw6vlTDkGcz8448Ru6jGYS3PJBjJyna
 kpQtTG8i2yxSCesH1ha94iMZOBH47w9KFU99Qn5jGT1LuHcAomnOxbqbJhftDX4h56g1 LA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j74ay12ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Aug 2022 19:45:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27QJKhAi005137;
	Fri, 26 Aug 2022 19:45:01 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma01dal.us.ibm.com with ESMTP id 3j2q8at125-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Aug 2022 19:45:01 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27QJj01n2032202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Aug 2022 19:45:00 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E42DD28058;
	Fri, 26 Aug 2022 19:44:59 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88DED28059;
	Fri, 26 Aug 2022 19:44:59 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.186.146])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 26 Aug 2022 19:44:59 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] ARM: dts: aspeed: Fix pca9849 compatible
Date: Fri, 26 Aug 2022 14:44:57 -0500
Message-Id: <20220826194457.164492-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cCE4QyogvItEpQOG9In0HrQyU2og4ZOR
X-Proofpoint-ORIG-GUID: cCE4QyogvItEpQOG9In0HrQyU2og4ZOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_10,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=868 lowpriorityscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260078
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

Missed a digit in the PCA9849 compatible string.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index c2e15e780cfa..6789c1ec286a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -739,7 +739,7 @@ tmp435@4c {
 	};
 
 	pca9849@75 {
-		compatible = "nxp,pca849";
+		compatible = "nxp,pca9849";
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.31.1

