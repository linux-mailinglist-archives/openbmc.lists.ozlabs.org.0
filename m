Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1385267EB
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FWC6Z6nz3cBq
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:09:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuVZ0pa0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KuVZ0pa0; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSW3pQYz3brM
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DGxxXM006495;
 Fri, 13 May 2022 17:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fVOPjE+hCDVQiGALTMiRBxDLCwjBMeLkcryYmBu04K8=;
 b=KuVZ0pa0kfEY5a61XQzVpwscHzVJyOmtO2LyETgnEIjsfWU2s8/ckEHoFavAaHJ7/p65
 K1Ivh2HXaXjWIrgoRO9e/0U20klCy9mKds/qa7DGtZiypG+er8/diItVCBieYFsLyAp6
 rXnXujP/a5i6s/2IaOpx/Jn2KL3zXpXku4bZOWaH4hr9prFYQ2lD3wxbYI+OWZQnnY6I
 WhTAT5NV/9UhNu5i+P8CPq/FFe76A29WsynNVFH+LdOYph4Z0q+/ZCcQ5Bfd+QNirTob
 ZkMpTkY8vN1W3XWY1C0o8LBWc8bZHExQN8MVLlueVtpbPvO6OLIL9iKIjuG7BjbTpeEa Fw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1ubkg51d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:19 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DH7J59029817;
 Fri, 13 May 2022 17:07:19 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3fwgdbeh63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7Hgj43974918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:17 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 704CDAC062;
 Fri, 13 May 2022 17:07:17 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFC88AC05E;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/9] tpm: add #ifndef to fix
 redeclaration build errors
Date: Fri, 13 May 2022 12:07:08 -0500
Message-Id: <20220513170715.43475-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dbAv0VyhBEdqD24w3FU_lA-KTZJ0QKfO
X-Proofpoint-ORIG-GUID: dbAv0VyhBEdqD24w3FU_lA-KTZJ0QKfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=672 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Johannes Holland <johannes.holland@infineon.com>

tpm_tis_spi.c directly includes tpm_tis.h and tpm-v2.h which both
define the same enums (see e.g. TPM_ACCESS_VALID). Add an #ifndef to
prevent redeclaration errors.

Signed-off-by: Johannes Holland <johannes.holland@infineon.com>
---
 drivers/tpm/tpm_tis.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tpm/tpm_tis.h b/drivers/tpm/tpm_tis.h
index 947585f8e3..2a160fe05c 100644
--- a/drivers/tpm/tpm_tis.h
+++ b/drivers/tpm/tpm_tis.h
@@ -104,6 +104,7 @@ struct tpm_cmd_t {
 /* Max number of iterations after i2c NAK */
 #define MAX_COUNT		3
 
+#ifndef __TPM_V2_H
 /*
  * Max number of iterations after i2c NAK for 'long' commands
  *
@@ -127,5 +128,6 @@ enum tis_status {
 	TPM_STS_DATA_AVAIL		= 0x10,
 	TPM_STS_DATA_EXPECT		= 0x08,
 };
+#endif
 
 #endif
-- 
2.27.0

