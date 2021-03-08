Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1097331AB2
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYnv4vvfz3ccX
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YR5xNFdC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YR5xNFdC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYz6qXDz3cLY
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:31 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MXXjM041411; Mon, 8 Mar 2021 17:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p9kafIO/3cmapPokgVDUiPYyJjK/W9XLWIOcFPGBhwE=;
 b=YR5xNFdCEPTAxY4WnFhidZDXpGJ2fgpc0AChLSDvApCRNQ/c4aKijdtMovD+bNK5nPhG
 8smNJv66r3HoB1GiKmLc3wKeGd6RhpbXuhYBr1cMdEOc+vodW02pd8bAkCmRdMlFnGKQ
 C6ZHzAKALG06Fzw3kitPAhSKNgH598KTcstzKwS8oAtXz1LjuAduAZtyY4SzfIYG1E2o
 I8uaWSV8ZmT8T42m7ibjrEHYmwXBh0t3wE6rYoHA1cNHTN6Md4b3J4369vX6nRtIsNhY
 Sl96zSm6MWiMa8sZhbLHg5hkn/WWfXGWa8rYh09fRCoEcBDVz2hZmXvtNmvvzb0SMC6w Fg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375udptfrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:29 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MqoNm017971;
 Mon, 8 Mar 2021 22:54:29 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3741c96eua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsRiO28836164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DACF9C605B;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BA66C605A;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 26/35] fsi: scom: Handle FSI2PIB timeout
Date: Mon,  8 Mar 2021 16:54:10 -0600
Message-Id: <20210308225419.46530-27-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Joel Stanley <joel@jms.id.au>

When the scom engine indicates a FSI2PIB timeout we can recover by
writing any value to the the reset register.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-scom.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index b45bfab7b7f5..2356a80f7f04 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -38,6 +38,15 @@
 #define SCOM_STATUS_PIB_RESP_MASK	0x00007000
 #define SCOM_STATUS_PIB_RESP_SHIFT	12
 
+/* Values the SCOM_STATUS_PIB_RESP_MASK can take */
+#define SCOM_PIB_ERR_XSCOM_BLOCKED	0x00004000
+#define SCOM_PIB_ERR_CHIPLET_OFFLINE	0x00002000
+#define SCOM_PIB_ERR_PARTIAL_GOOD	0x00006000
+#define SCOM_PIB_ERR_INVALID_ADDR	0x00001000
+#define SCOM_PIB_ERR_CLOCK		0x00005000
+#define SCOM_PIB_ERR_HANDSHAKE		0x00003000
+#define SCOM_PIB_ERR_TIMEOUT		0x00007000
+
 #define SCOM_STATUS_ANY_ERR		(SCOM_STATUS_PROTECTION | \
 					 SCOM_STATUS_PARITY |	  \
 					 SCOM_STATUS_PIB_ABORT | \
@@ -250,6 +259,15 @@ static int handle_fsi2pib_status(struct scom_device *scom, uint32_t status)
 	/* Return -EBUSY on PIB abort to force a retry */
 	if (status & SCOM_STATUS_PIB_ABORT)
 		return -EBUSY;
+
+	if (status & SCOM_PIB_ERR_TIMEOUT) {
+		dev_dbg(&scom->dev, "PIB timeout, recovering\n");
+		fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG,
+				 &dummy, sizeof(uint32_t));
+		/* Return -EBUSY to force a retry */
+		return -EBUSY;
+	}
+
 	return 0;
 }
 
-- 
2.27.0

