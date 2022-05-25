Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B095341F4
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 19:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7cqf5Bc0z3blB
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 03:04:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OrGuMEFI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OrGuMEFI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7cnk4QLbz30BV
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 03:02:50 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PFpQNk017071;
 Wed, 25 May 2022 17:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YtAgAGzhr0FvL35U+r+Qt4ofbIkNzvqdTguHeWFKVZc=;
 b=OrGuMEFIQb9Ca6LArMB7il+I+2pve2WTL3fOmb1upFqv3T/WlZh5Mc2gxwp4r8lcwrsF
 wypfr2Q0xJIy9m67R1edzJaNHxHd0ewkWbDrqLnz1mZbBHP3FNZE9oAY56gL5aTlY8qH
 J3KLfpV0YTarWJe3Dt3afVXKYw0RktFQCsiW0wDOE2SpYxZBJxEnoOpsF8lePkFMkcwB
 fThu0ODtesASf4L3OfF2N8bkBwV9I0cEExlfqml9AYgIyR5gzvlaWAxTtdxH1lzGJlEI
 ICY+O9XD6ya7h7vjJnM4S1bqMvdWCyRs+NRr4xsmu+qoEgK2hOYpDha0Tnvfos7tshn4 kQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9pwkab4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 17:02:47 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PGb7nP030911;
 Wed, 25 May 2022 17:02:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3g93v8s5js-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 17:02:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PH2iUl28443120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 17:02:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D203F78066;
 Wed, 25 May 2022 17:02:44 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A5AC7805E;
 Wed, 25 May 2022 17:02:44 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.60.201])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 17:02:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 1/2] spi: fsi: Fix spurious timeout
Date: Wed, 25 May 2022 12:02:39 -0500
Message-Id: <20220525170240.33918-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220525170240.33918-1-eajames@linux.ibm.com>
References: <20220525170240.33918-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jVAsVkCooGSeGWVW7_PwL9RIze9PhpXt
X-Proofpoint-ORIG-GUID: jVAsVkCooGSeGWVW7_PwL9RIze9PhpXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_04,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250085
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

The driver may return a timeout error even if the status register
indicates that the transfer may proceed. Fix this by restructuring
the polling loop.

Fixes: b3b33a63865d ("spi: fsi: Implement a timeout for polling status")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/spi/spi-fsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
index d403a7a3021d..72ab066ce552 100644
--- a/drivers/spi/spi-fsi.c
+++ b/drivers/spi/spi-fsi.c
@@ -319,12 +319,12 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 
 			end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
 			do {
+				if (time_after(jiffies, end))
+					return -ETIMEDOUT;
+
 				rc = fsi_spi_status(ctx, &status, "TX");
 				if (rc)
 					return rc;
-
-				if (time_after(jiffies, end))
-					return -ETIMEDOUT;
 			} while (status & SPI_FSI_STATUS_TDR_FULL);
 
 			sent += nb;
@@ -337,12 +337,12 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
 		while (transfer->len > recv) {
 			end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
 			do {
+				if (time_after(jiffies, end))
+					return -ETIMEDOUT;
+
 				rc = fsi_spi_status(ctx, &status, "RX");
 				if (rc)
 					return rc;
-
-				if (time_after(jiffies, end))
-					return -ETIMEDOUT;
 			} while (!(status & SPI_FSI_STATUS_RDR_FULL));
 
 			rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
-- 
2.27.0

