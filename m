Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1D3E9503
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:49:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDlm4VJlz30JK
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:49:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CW9EBnvY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CW9EBnvY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl6j5Lz2xZm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXoBl138596; Wed, 11 Aug 2021 11:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=53TBEWT/mQwBk2uww1/BxlNcoIz7eCzZltUlyjKYAPo=;
 b=CW9EBnvYW020DtdCiz9enflH7eL8fVPCfdahUlQfiSg/AD2VSMelgQXFt13TXMdG3nN7
 0uQdBnbidqF332raSv7I3dmIdqkSq0+jnpafV1NFudQUT4hjn9U9ddHzHUxOUHjfw+6v
 JVeIbhHfeY4Tfm3DHMn8W4kJ/sDj1jfUEHGQOBvgWFZ6EDaHQp+0wGhvSy/mY1GUcQU7
 8XOytUcn5nyNdo32p27x25WWNgJsFznFFObx6M/OCGGIj/tzw7jve+BUdcVUxLqx0vKb
 FXXyNighfFDs7pFir/egqqeo07cMV9N4Gb5UE1kkEd8EWP+3jKGGu/m+bXnnQbfHHFVs vg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3accuf0aa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXdaD024680;
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3a9htdenvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgbCj28901666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:37 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6BBF6A04F;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7358D6A04D;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 12/14] fsi: sbefifo: Increase command timeouts
 to 30 seconds
Date: Wed, 11 Aug 2021 10:42:30 -0500
Message-Id: <20210811154232.12649-13-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4LnwlF7bPDSVqtw9OY7JbfS-kJdw0JIw
X-Proofpoint-ORIG-GUID: 4LnwlF7bPDSVqtw9OY7JbfS-kJdw0JIw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Different commands (with different sizes) require different timeouts,
the longest of which can be up to 30 seconds. Adjust the command
timeout accordingly.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 84cb965bfed5..8645a092af89 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -102,12 +102,12 @@ enum sbe_state
 #define sbefifo_eot_set(sts)	(((sts) & SBEFIFO_STS_EOT_MASK) >> SBEFIFO_STS_EOT_SHIFT)
 
 /* Reset request timeout in ms */
-#define SBEFIFO_RESET_TIMEOUT		10000
+#define SBEFIFO_RESET_TIMEOUT		30000
 
 /* Timeouts for commands in ms */
-#define SBEFIFO_TIMEOUT_START_CMD	10000
+#define SBEFIFO_TIMEOUT_START_CMD	30000
 #define SBEFIFO_TIMEOUT_IN_CMD		1000
-#define SBEFIFO_TIMEOUT_START_RSP	10000
+#define SBEFIFO_TIMEOUT_START_RSP	30000
 #define SBEFIFO_TIMEOUT_IN_RSP		1000
 
 /* Other constants */
-- 
2.27.0

