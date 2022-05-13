Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D965267E3
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FSx1M74z3c9J
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m/i/gEjP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m/i/gEjP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSV6vQxz3brM
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:22 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DGj458010461;
 Fri, 13 May 2022 17:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rMMkbUFZbN5xcO3ueOxyHYMX2CdHcTvubGkI2NbgXwA=;
 b=m/i/gEjPlnZAs/VvdQfNBrxF3TlwaeNq4w0CsFenmRg7wtzJWJEaJJbOlvrwor5wQ8Wp
 wyyEg+BlWmazYmeGdFbNSOl4KMUgZj9MhXIYUcoH+cB6PnxqwY/XXnPaw9kTqu3byOJ2
 YiOFKl91axCVtrWr///xH1JD0u2qTP0M336mMvK6bZLk0LX/qo6JmOU56kNnBd6ypsP2
 pkE7UydLrp3bXEPjAgfZuH2jMvIejQDlvjkHVB1kPrKBJrW3M4PNMuBfIRSpEbwRswWm
 BdSgxTrT85k72XnOo0SqmuvfyP50Dx6g52A3snYqIm45MTQoQ0nb71gYWUy4NA9/J9qY qg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1u4k8cfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGhQX2026228;
 Fri, 13 May 2022 17:07:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 3fwgda3qdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:18 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7GvG32768310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA2DAAC060;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EAE3AC05E;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/9] tpm: Add more TPM2
 definitions
Date: Fri, 13 May 2022 12:07:07 -0500
Message-Id: <20220513170715.43475-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N-82p9mAhiyZxHuWjzce5huK1yD4HOQa
X-Proofpoint-ORIG-GUID: N-82p9mAhiyZxHuWjzce5huK1yD4HOQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=779 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

From: Simon Glass <sjg@chromium.org>

Add definitions for access and status.

Need to drop the mixed case.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 include/tpm-v2.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/tpm-v2.h b/include/tpm-v2.h
index ae00803f6d..d53d2e4023 100644
--- a/include/tpm-v2.h
+++ b/include/tpm-v2.h
@@ -161,6 +161,37 @@ enum tpm_index_attrs {
 					TPMA_NV_AUTHWRITE | TPMA_NV_POLICYWRITE,
 };
 
+enum {
+	TPM_ACCESS_VALID		= 1 << 7,
+	TPM_ACCESS_ACTIVE_LOCALITY	= 1 << 5,
+	TPM_ACCESS_REQUEST_PENDING	= 1 << 2,
+	TPM_ACCESS_REQUEST_USE		= 1 << 1,
+	TPM_ACCESS_ESTABLISHMENT	= 1 << 0,
+};
+
+enum {
+	TPM_STS_FAMILY_SHIFT		= 26,
+	TPM_STS_FAMILY_MASK		= 0x3 << TPM_STS_FAMILY_SHIFT,
+	TPM_STS_FAMILY_TPM2		= 1 << TPM_STS_FAMILY_SHIFT,
+	TPM_STS_RESE_TESTABLISMENT_BIT	= 1 << 25,
+	TPM_STS_COMMAND_CANCEL		= 1 << 24,
+	TPM_STS_BURST_COUNT_SHIFT	= 8,
+	TPM_STS_BURST_COUNT_MASK	= 0xffff << TPM_STS_BURST_COUNT_SHIFT,
+	TPM_STS_VALID			= 1 << 7,
+	TPM_STS_COMMAND_READY		= 1 << 6,
+	TPM_STS_GO			= 1 << 5,
+	TPM_STS_DATA_AVAIL		= 1 << 4,
+	TPM_STS_DATA_EXPECT		= 1 << 3,
+	TPM_STS_SELF_TEST_DONE		= 1 << 2,
+	TPM_STS_RESPONSE_RETRY		= 1 << 1,
+};
+
+enum {
+	TPM_CMD_COUNT_OFFSET	= 2,
+	TPM_CMD_ORDINAL_OFFSET	= 6,
+	TPM_MAX_BUF_SIZE	= 1260,
+};
+
 /**
  * Issue a TPM2_Startup command.
  *
-- 
2.27.0

