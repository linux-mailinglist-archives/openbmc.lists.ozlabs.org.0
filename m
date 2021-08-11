Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1213E9508
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDmv64pbz2ysv
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=glRG4aUS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=glRG4aUS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbn6K0gz30Fx
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFZILB130843; Wed, 11 Aug 2021 11:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QMCCSihUCfllwmAV9at115NHLCUuVXha83H+BogcawY=;
 b=glRG4aUSRhXlVuDpdZWJ3j0zECxp0eaWhZCeI07SH9dOV5VosWyw3lOj7Y+d6PAzcqjW
 yPLUBxYFkjjtkWB4AHTi8dtWiqgsE/B04oIQXPCKrylIb90cCuwNuMRhkNwupP30v2VP
 iNmJOAMBKFASB91dRbbpZJHNrWfqFNhaj28RsZBz5IK7AEUWyAFAxumGLh9Dz9r5Rw11
 /UA6/TPAPmYgYwiZ9CaUgfpu85zOmam71kM5NEo6Kc6mo5lUffGBaEbcvAsdd1cA4SJ4
 LuvP1w6ZsbXuCRLglGezn8QnQQcBCmDXH57+jIfzbYZM9UyD1KhW49h5ndyJXMIIgd8b vA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abrr5x5mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXdcN024692;
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3a9htdenv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgbQ327853146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 222696A063;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA2CC6A04F;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 10/14] ARM: dts: aspeed: Rainier 4U: Delete fan
 dual-tach properties
Date: Wed, 11 Aug 2021 10:42:28 -0500
Message-Id: <20210811154232.12649-11-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6RySAvZ-ZDC4Of2i3i-usRkUGbAkJq1Z
X-Proofpoint-GUID: 6RySAvZ-ZDC4Of2i3i-usRkUGbAkJq1Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=913 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110104
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The fans in the 4U chassis do not have dual tachometers, so remove those
properties in the device tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
index 342546a3c0f5..24283cc3d486 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
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
2.27.0

