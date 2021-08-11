Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF243E950C
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDnh1sN1z30GY
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:51:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CId1eGio;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CId1eGio; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbn63szz30Fp
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:45 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXS1D125968; Wed, 11 Aug 2021 11:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Enc4TbtTCF4INXFpyadcrGdrjJXRSCzQcwLadctClZg=;
 b=CId1eGiosJ3mG7FZDP+4WoG9hM2rYfnomxRE3ZpAeTgM+9IOrG55ncpGibXa2V0MCp26
 mxS24gTaoVsN0KGPPwu0VbX9/1c/Fbika5NEus3e71NPTdfNxyzcjHX8AdB5njenWtin
 BOX9p0NuTFnlElS0XXdW0PeFWetbG6iEPxiNRlkoACxIS0zxZgichtUUGkRLTjBskmtG
 hfMvpt/UvM9QTGCUl59HeDrb59wS+ElSq+bBftvBCVSCREPR3rsP2iUw6WFBZRgTlgTL
 xOsrQOZvQK12GOhnpUIaNp4TFq1R+rnpMPO+t+Q5PpO4ye0KqSms39MxEzI+oR43xFtd 8A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab9xb9rq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXhcV009640;
 Wed, 11 Aug 2021 15:42:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3a9htefr6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgcFS35586546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E2B96A04F;
 Wed, 11 Aug 2021 15:42:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D4E36A04D;
 Wed, 11 Aug 2021 15:42:38 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 14/14] fsi: sbefifo: Use interruptible mutex
 locking
Date: Wed, 11 Aug 2021 10:42:32 -0500
Message-Id: <20210811154232.12649-15-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gxjwsMzIayo2VppFVHKwRIwOdHNYOutx
X-Proofpoint-GUID: gxjwsMzIayo2VppFVHKwRIwOdHNYOutx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Some SBE operations have extremely large responses and can require
several minutes to process the response. During this time, the device
lock must be held. If another process attempts an operation, it will
wait for the mutex for longer than the kernel hung task watchdog
allows. Therefore, use the interruptible function to lock the mutex.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 8645a092af89..060a790989f9 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -740,7 +740,9 @@ int sbefifo_submit(struct device *dev, const __be32 *command, size_t cmd_len,
         iov_iter_kvec(&resp_iter, WRITE, &resp_iov, 1, rbytes);
 
 	/* Perform the command */
-	mutex_lock(&sbefifo->lock);
+	rc = mutex_lock_interruptible(&sbefifo->lock);
+	if (rc)
+		return rc;
 	rc = __sbefifo_submit(sbefifo, command, cmd_len, &resp_iter);
 	mutex_unlock(&sbefifo->lock);
 
@@ -820,7 +822,9 @@ static ssize_t sbefifo_user_read(struct file *file, char __user *buf,
 	iov_iter_init(&resp_iter, WRITE, &resp_iov, 1, len);
 
 	/* Perform the command */
-	mutex_lock(&sbefifo->lock);
+	rc = mutex_lock_interruptible(&sbefifo->lock);
+	if (rc)
+		goto bail;
 	rc = __sbefifo_submit(sbefifo, user->pending_cmd, cmd_len, &resp_iter);
 	mutex_unlock(&sbefifo->lock);
 	if (rc < 0)
@@ -875,7 +879,9 @@ static ssize_t sbefifo_user_write(struct file *file, const char __user *buf,
 		user->pending_len = 0;
 
 		/* Trigger reset request */
-		mutex_lock(&sbefifo->lock);
+		rc = mutex_lock_interruptible(&sbefifo->lock);
+		if (rc)
+			goto bail;
 		rc = sbefifo_request_reset(user->sbefifo);
 		mutex_unlock(&sbefifo->lock);
 		if (rc == 0)
-- 
2.27.0

