Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D146DBF1
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:19:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8RnD5C9pz308b
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:19:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K+4We87c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K+4We87c; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RlM0QDfz2xfN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:18:06 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8Ivdx4032647; 
 Wed, 8 Dec 2021 19:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Fwp3x6s9pPmqQ7W5SX+4nTnmtbBd/Cf1DPcop0XyF6M=;
 b=K+4We87cJKpx5uNHON0Ho//O5xQGumB0N1wroVG1HWpiAZvJWkgpoMwETRzsoDCeB0wx
 DcSdHgZFK56UMFI016OKbu1rlErpC2hZibOptwKoIXOK/C3SQUmmwGrSbQ2LrkCqs8S/
 BPOWR4/K1F5AkCUpZ5r9y3cQBiIJ2T7Z/D1o4mrj5NWl7qQzMngxJJQeynEog3+4GSMn
 iXaTf26zpW31mx9eCU7D5lYRB/+djeqza07TNF19OQz7tPzjQ28EatifNcwNCGichjV2
 MYGsZNAkNsjZTi/v9WyhnLFMCwTI7aEG+pEXtFLKKLLEcaJOyw/a/pv8Rb7lur5Q3jBK Eg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu2engccj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:03 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDrdv028972;
 Wed, 8 Dec 2021 19:18:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3cqyyb8thx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JI1YO46530896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 19:18:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3F12B2066;
 Wed,  8 Dec 2021 19:18:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C1C9B2068;
 Wed,  8 Dec 2021 19:18:01 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.84.65])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 19:18:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 2/7] tpm: tpm_tis: Rewrite
 "tpm_tis_req_canceled()"
Date: Wed,  8 Dec 2021 13:17:53 -0600
Message-Id: <20211208191758.20517-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211208191758.20517-1-eajames@linux.ibm.com>
References: <20211208191758.20517-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o53KCpQruB09xeX9mnBMxqo5TI6RkZ4j
X-Proofpoint-GUID: o53KCpQruB09xeX9mnBMxqo5TI6RkZ4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080108
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

From: Amir Mizinski <amirmizi6@gmail.com>

tpm_tis_req_canceled() function is used to check if the caller requested
to abort the current operation. It was found that in some cases
tpm_tis_req_canceled() wrongly returned true.
Since a cancel request sets the TPM_STS.commandReady field to TRUE, the
tpm_tis_req_canceled() function should check only the TPM_STS.commandReady
field value.
The case for TPM_VID_WINBOND is wrong and was therefore removed.

Also, the default comparison is wrong. Only cmdReady bit needs to be
compared instead of the full lower status register byte.

Signed-off-by: Amir Mizinski <amirmizi6@gmail.com>
---
 drivers/char/tpm/tpm_tis_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index adb086b6df7c..7d6d07625600 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -662,13 +662,10 @@ static bool tpm_tis_req_canceled(struct tpm_chip *chip, u8 status)
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
 
 	switch (priv->manufacturer_id) {
-	case TPM_VID_WINBOND:
-		return ((status == TPM_STS_VALID) ||
-			(status == (TPM_STS_VALID | TPM_STS_COMMAND_READY)));
 	case TPM_VID_STM:
 		return (status == (TPM_STS_VALID | TPM_STS_COMMAND_READY));
 	default:
-		return (status == TPM_STS_COMMAND_READY);
+		return (status & TPM_STS_COMMAND_READY) == TPM_STS_COMMAND_READY;
 	}
 }
 
-- 
2.27.0

