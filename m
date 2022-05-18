Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D952BB99
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 15:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3DrG5Xz9z3c8t
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 23:49:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J+Iy6EGK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J+Iy6EGK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Dqr5Jz2z2yMj
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 23:49:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IDjLQA012886;
 Wed, 18 May 2022 13:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vtEb8qxXKKDVUgblNi3G40FgyEdMUEdNjTNqU7xIJ9g=;
 b=J+Iy6EGK2StBsP+P0YYe5WGzzr653oRSrcY/rdh3zk95a4e1tHrHawoNF8cO6J+xzR6X
 HjSDfgWyKcSPVSHX8+ityTgub7nPSBFFLXN+H4Mb1JT094EAcrunOg4xf9xSFku5Ha0b
 1tQz2msPC114ZNU3yvxQ48lQqeBdz75339a1saiVZdmlL1CRNHGV0YN6lmHBUX5AsvGA
 6P+BPBAAvCtM6uvJYdjfX+VECxVYuE2Rp5/5JotIHPlMY0REIi9so+zzB+mGp5r1NpF8
 7G1Ftz08sGDUq0Sa9Lr/lSUv76ws6Wj5yWEy4KPWT94kiiJTdGgA3gETNl25iCRy8WL/ Yg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g51y8g3c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 13:49:25 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IDn1V9005055;
 Wed, 18 May 2022 13:49:24 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3g242acuvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 13:49:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24IDnNh628770598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 13:49:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A4676E052;
 Wed, 18 May 2022 13:49:23 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A5F36E05B;
 Wed, 18 May 2022 13:49:23 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.6.139])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 13:49:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] fsi: occ: Prevent use after free
Date: Wed, 18 May 2022 08:49:22 -0500
Message-Id: <20220518134922.8833-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9kqZuxSc7F5b7RXxLQa5i6mFpFYNd73Y
X-Proofpoint-ORIG-GUID: 9kqZuxSc7F5b7RXxLQa5i6mFpFYNd73Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_05,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180079
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use get_device and put_device in the open and close functions to
make sure the device doesn't get freed while a file descriptor is
open.
Also, lock around the freeing of the device buffer and check the
buffer before using it in the submit function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/fsi/fsi-occ.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 3d04e8baecbb..8f7f602b909d 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -94,6 +94,7 @@ static int occ_open(struct inode *inode, struct file *file)
 	client->occ = occ;
 	mutex_init(&client->lock);
 	file->private_data = client;
+	get_device(occ->dev);
 
 	/* We allocate a 1-page buffer, make sure it all fits */
 	BUILD_BUG_ON((OCC_CMD_DATA_BYTES + 3) > PAGE_SIZE);
@@ -197,6 +198,7 @@ static int occ_release(struct inode *inode, struct file *file)
 {
 	struct occ_client *client = file->private_data;
 
+	put_device(client->occ->dev);
 	free_page((unsigned long)client->buffer);
 	kfree(client);
 
@@ -493,12 +495,19 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	for (i = 1; i < req_len - 2; ++i)
 		checksum += byte_request[i];
 
-	mutex_lock(&occ->occ_lock);
+	rc = mutex_lock_interruptible(&occ->occ_lock);
+	if (rc)
+		return rc;
 
 	occ->client_buffer = response;
 	occ->client_buffer_size = user_resp_len;
 	occ->client_response_size = 0;
 
+	if (!occ->buffer) {
+		rc = -ENOENT;
+		goto done;
+	}
+
 	/*
 	 * Get a sequence number and update the counter. Avoid a sequence
 	 * number of 0 which would pass the response check below even if the
@@ -674,10 +683,13 @@ static int occ_remove(struct platform_device *pdev)
 {
 	struct occ *occ = platform_get_drvdata(pdev);
 
-	kvfree(occ->buffer);
-
 	misc_deregister(&occ->mdev);
 
+	mutex_lock(&occ->occ_lock);
+	kvfree(occ->buffer);
+	occ->buffer = NULL;
+	mutex_unlock(&occ->occ_lock);
+
 	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
 
 	ida_simple_remove(&occ_ida, occ->idx);
-- 
2.27.0

