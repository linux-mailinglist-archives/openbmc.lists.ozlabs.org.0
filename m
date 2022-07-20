Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC157BF1C
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 22:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp6RN383Sz3c9Z
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 06:16:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+HjUiwy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+HjUiwy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp6Qt4P1nz3bmT
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 06:16:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KJhlMl002298;
	Wed, 20 Jul 2022 20:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7Jk2TSAxkhrCDesHeqVo4fpQeCQWOm8tBrqTvGT4XdQ=;
 b=f+HjUiwyOFkPl0ql+Nk2tTB8uprundBx6qAKAx0Vkmcc4gtEcl6fDGok+4G5MHopy+sk
 bVMgdyyGmuJq5wKnw6UOWM8Oklog7HWe5W+b0k6wHLJ8niD0QLssfHyiSzzvI0jZC6h/
 d0vNd/dlgFhvIqNFnAcWCkHk+yLF08pFbh0lIJPTssrnPUXa+J4JVMmV/1yDjg6OZCfu
 DGLdX6nRbwHLQItcTZQwHYfjTUn4BF96c4SNmeg5G1yP3BZ7XwXt9EGTwWoUHj2RHTjo
 lVKDtnCXRUyJdvshzVXxuF8Xpb0sUVbM3XJqqj2UUZQu8OaRit4tRwFncj9weItu5PQg 5g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3her430q1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 20:16:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26KK5VDg029963;
	Wed, 20 Jul 2022 20:16:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma03wdc.us.ibm.com with ESMTP id 3hbmy9bps2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 20:16:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26KKG0Ox10879606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Jul 2022 20:16:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EFCE124053;
	Wed, 20 Jul 2022 20:16:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB951124052;
	Wed, 20 Jul 2022 20:15:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.160.104.49])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed, 20 Jul 2022 20:15:59 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 2/2] hwmon (occ): Fix response length in checksum retry
Date: Wed, 20 Jul 2022 15:15:58 -0500
Message-Id: <20220720201558.11337-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220720201558.11337-1-eajames@linux.ibm.com>
References: <20220720201558.11337-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2mEkfNl0ZdiYRRZifxcfFQEiir8fcD2z
X-Proofpoint-GUID: 2mEkfNl0ZdiYRRZifxcfFQEiir8fcD2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200080
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

Retrying for checksum failure doesn't work since the response length
gets zeroed out in the submit function. Fix this by resetting the
response length to its original value before the retry.

Fixes: fe6200e9c8be ("hwmon (occ): Retry for checksum failure")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/p9_sbe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
index ad2fcc31db78..037046c3921d 100644
--- a/drivers/hwmon/occ/p9_sbe.c
+++ b/drivers/hwmon/occ/p9_sbe.c
@@ -82,6 +82,7 @@ static bool p9_sbe_occ_save_ffdc(struct p9_sbe_occ *ctx, const void *resp,
 static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
 			       void *resp, size_t resp_len)
 {
+	size_t original_resp_len = resp_len;
 	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
 	int rc, i;
 
@@ -98,6 +99,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
 		}
 		if (rc != -EBADE)
 			return rc;
+		resp_len = original_resp_len;
 	}
 
 	switch (((struct occ_response *)resp)->return_status) {
-- 
2.31.1

