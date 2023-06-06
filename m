Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FD172359B
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 05:10:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZwSm5CDdz3f07
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 13:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aw573kDu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aw573kDu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZwRM4Gb6z3f0P
	for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2023 13:08:47 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3562GsUm028022;
	Tue, 6 Jun 2023 03:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=9wghKrnvpG4esy/1e+NGLL00NxVRt9GUyQX9qLZY5HI=;
 b=aw573kDuYsrrZk+EjoEe+iWiDHKqzvY1boCC/luuGweDOe9yVpthlDvpqxWtEI4zSxkZ
 +AeC/jRYgvjmI9pLtpbWTziIO85eQXuNtyeko/SF4NvjZgo22edEmh7Jh/+ARgmFlsIU
 d82cEamzDIrcB0Iqb7RryrYhVNr6Cuguq95nm2kZGYX/JuRYz2II4kk+j5kA5j8U/0T+
 NndSBoYmznqh7Pa1G68YUBn2jMrdzvaQ1TAYKrmHlSCUDKAKkFJhO2DtzAcmcy1nGQpQ
 mimTyOH34zSQ8ZuIZ+iesdXPR3pCOz/aKsorL03MbPkmuS/hdp8/QJ/UgeaqucICf+0Q cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1uvks1b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 03:08:36 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3562qFqX029467;
	Tue, 6 Jun 2023 03:08:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1uvks1av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 03:08:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3560s4LB026536;
	Tue, 6 Jun 2023 03:08:35 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qyxfs4u60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 03:08:35 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35638W2V8258244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 03:08:32 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0444558052;
	Tue,  6 Jun 2023 03:08:32 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FE0558050;
	Tue,  6 Jun 2023 03:08:31 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 03:08:31 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/1] KEYS: asymmetric: Copy sig and digest in public_key_verify_signature()
Date: Mon,  5 Jun 2023 23:08:15 -0400
Message-Id: <20230606030815.101280-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230606030815.101280-1-stefanb@linux.ibm.com>
References: <20230606030815.101280-1-stefanb@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6U5kILcJhuM2ifG1K-GdhukSsRdFOQkj
X-Proofpoint-ORIG-GUID: AaxVggCjwnwdRIY-8mtfZrnVY8ozRz3k
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-05_35,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060026
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Eric Biggers <ebiggers@google.com>, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Roberto Sassu <roberto.sassu@huawei.com>

Commit ac4e97abce9b8 ("scatterlist: sg_set_buf() argument must be in linear
mapping") checks that both the signature and the digest reside in the
linear mapping area.

However, more recently commit ba14a194a434c ("fork: Add generic vmalloced
stack support") made it possible to move the stack in the vmalloc area,
which is not contiguous, and thus not suitable for sg_set_buf() which needs
adjacent pages.

Always make a copy of the signature and digest in the same buffer used to
store the key and its parameters, and pass them to sg_init_one(). Prefer it
to conditionally doing the copy if necessary, to keep the code simple. The
buffer allocated with kmalloc() is in the linear mapping area.

Cc: stable@vger.kernel.org # 4.9.x
Fixes: ba14a194a434 ("fork: Add generic vmalloced stack support")
Link: https://lore.kernel.org/linux-integrity/Y4pIpxbjBdajymBJ@sol.localdomain/
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/public_key.c | 38 ++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index eca5671ad3f2..50c933f86b21 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -380,9 +380,10 @@ int public_key_verify_signature(const struct public_key *pkey,
 	struct crypto_wait cwait;
 	struct crypto_akcipher *tfm;
 	struct akcipher_request *req;
-	struct scatterlist src_sg[2];
+	struct scatterlist src_sg;
 	char alg_name[CRYPTO_MAX_ALG_NAME];
-	char *key, *ptr;
+	char *buf, *ptr;
+	size_t buf_len;
 	int ret;
 
 	pr_devel("==>%s()\n", __func__);
@@ -420,34 +421,37 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (!req)
 		goto error_free_tfm;
 
-	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
-		      GFP_KERNEL);
-	if (!key)
+	buf_len = max_t(size_t, pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
+			sig->s_size + sig->digest_size);
+
+	buf = kmalloc(buf_len, GFP_KERNEL);
+	if (!buf)
 		goto error_free_req;
 
-	memcpy(key, pkey->key, pkey->keylen);
-	ptr = key + pkey->keylen;
+	memcpy(buf, pkey->key, pkey->keylen);
+	ptr = buf + pkey->keylen;
 	ptr = pkey_pack_u32(ptr, pkey->algo);
 	ptr = pkey_pack_u32(ptr, pkey->paramlen);
 	memcpy(ptr, pkey->params, pkey->paramlen);
 
 	if (pkey->key_is_private)
-		ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
+		ret = crypto_akcipher_set_priv_key(tfm, buf, pkey->keylen);
 	else
-		ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
+		ret = crypto_akcipher_set_pub_key(tfm, buf, pkey->keylen);
 	if (ret)
-		goto error_free_key;
+		goto error_free_buf;
 
 	if (strcmp(pkey->pkey_algo, "sm2") == 0 && sig->data_size) {
 		ret = cert_sig_digest_update(sig, tfm);
 		if (ret)
-			goto error_free_key;
+			goto error_free_buf;
 	}
 
-	sg_init_table(src_sg, 2);
-	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
-	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
-	akcipher_request_set_crypt(req, src_sg, NULL, sig->s_size,
+	memcpy(buf, sig->s, sig->s_size);
+	memcpy(buf + sig->s_size, sig->digest, sig->digest_size);
+
+	sg_init_one(&src_sg, buf, sig->s_size + sig->digest_size);
+	akcipher_request_set_crypt(req, &src_sg, NULL, sig->s_size,
 				   sig->digest_size);
 	crypto_init_wait(&cwait);
 	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
@@ -455,8 +459,8 @@ int public_key_verify_signature(const struct public_key *pkey,
 				      crypto_req_done, &cwait);
 	ret = crypto_wait_req(crypto_akcipher_verify(req), &cwait);
 
-error_free_key:
-	kfree(key);
+error_free_buf:
+	kfree(buf);
 error_free_req:
 	akcipher_request_free(req);
 error_free_tfm:
-- 
2.37.3

