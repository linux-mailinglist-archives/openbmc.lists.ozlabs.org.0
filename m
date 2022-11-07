Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3E61F7E2
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 16:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5b7t2hM7z3cLX
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 02:42:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FUsn/m+z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FUsn/m+z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5b7F2Nqgz2yR9
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 02:41:28 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A7EwgKi027533;
	Mon, 7 Nov 2022 15:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XdOf7TAGNV9srqmnnQaP22Zn71KDByTV27xRYmqzlGA=;
 b=FUsn/m+zb33ERCJN5hEqjaNyeqF3QV70H7OOuXNsI85JYRGhUjsDrdPniFZY/QCkru50
 8QOWeVNGzUPdMZFJuN0j91bgI0PYgysFjF8AtBhj+pV7gqXB8d0PKWgRkViSfpcywUsG
 VEBpGixA+H7QPRIuQMH2JELAvOGTnCRsS0eiJAj3hBIDPRbOlZmmJ4G0Eq3tVoJiZ1I5
 BnIoxgJWW0eoRXhx4GjNRJPPgCcj31vS6fajHCaFGiJguI5R2A5EPoQE10xypDCFGKo7
 Qc2SuCPiJfNklqTnfunMGvRQdxN8xqSjFwMTMOPC+MyVfklcIcKKz7E4uacDW0yLoimj WA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp8bf9dg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 15:41:20 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A7FMt58023947;
	Mon, 7 Nov 2022 15:41:19 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma03dal.us.ibm.com with ESMTP id 3kngphvph8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 15:41:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A7FfIKs63963440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 15:41:18 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 220EE58058;
	Mon,  7 Nov 2022 15:41:18 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7761B5805A;
	Mon,  7 Nov 2022 15:41:17 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.65.228.202])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 15:41:17 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0] ARM: dts: aspeed: bonnell: Update incorrect eeprom address
Date: Mon,  7 Nov 2022 09:41:14 -0600
Message-Id: <20221107154114.13484-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2_3WVLSptUbT1gs9Mtwk4eW6st4Cp049
X-Proofpoint-ORIG-GUID: 2_3WVLSptUbT1gs9Mtwk4eW6st4Cp049
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_08,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=780 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070121
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

The eeprom on bus 8 was at the wrong i2c address.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 72b687f45ebf..e2a9a18bda57 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -683,9 +683,9 @@ tmp275@48 {
 		reg = <0x48>;
 	};
 
-	eeprom@51 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
-		reg = <0x51>;
+		reg = <0x50>;
 	};
 
 	pca9551@60 {
-- 
2.31.1

