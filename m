Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F87922E0
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 15:15:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQDV/bzx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg5bb1tfNz3c5S
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 23:15:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQDV/bzx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg5Z10FQnz2ydW
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 23:14:16 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385D9A1R019518;
	Tue, 5 Sep 2023 13:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BMVnUrXWXh7AEL46rE/TYeYnqxf9UKa/a5oRuOu8ops=;
 b=sQDV/bzx/OrORQoLR7x1kO1EOYl/WsJ0iqMAXTi62bmzKwFLx/icsB5SFyqxkl5cP4H5
 ma1MjQLnuARq9BKv/aWoco25Sg+/8HOvkkOVlfp+KHpwjdV7WTDVCcJBumtnUkv0ca9g
 2XzrF2jVCEPVt1lH1ESgVSWkWXRuYsdl8M5NJagvIfCNvD4nCfC6JA9spBghMoq4xb43
 zWXN1A8TNPPfz5tVKir14drG1B2A+Qtj+C3utN0/zXAOS3FmytdtS8I+3n31fU/5AlWR
 Iv2Yq9/EVJWbOtp5Hz6sU7CG1BVQNK4pms+3t2GxkXLzTlWfIO5/+HouS3Aj+vXiQc5B 9Q== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sx4bfh3eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:13 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385CqjSN006622;
	Tue, 5 Sep 2023 13:14:13 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvkak09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385DE9hF51970532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 13:14:09 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7563F58052;
	Tue,  5 Sep 2023 13:14:09 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA8CE58056;
	Tue,  5 Sep 2023 13:14:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 13:14:08 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 5/5] ovl: Always reevaluate the file signature for IMA
Date: Tue,  5 Sep 2023 09:14:01 -0400
Message-ID: <20230905131401.82232-6-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905131401.82232-1-stefanb@linux.ibm.com>
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qnj3W4KnYkTXbWpN1MqhFSy9L53CBIUY
X-Proofpoint-GUID: Qnj3W4KnYkTXbWpN1MqhFSy9L53CBIUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050114
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>, Eric Snowberg <eric.snowberg@oracle.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eric Snowberg <eric.snowberg@oracle.com>

Commit db1d1e8b9867 ("IMA: use vfs_getattr_nosec to get the i_version")
partially closed an IMA integrity issue when directly modifying a file
on the lower filesystem.  If the overlay file is first opened by a user
and later the lower backing file is modified by root, but the extended
attribute is NOT updated, the signature validation succeeds with the old
original signature.

Update the super_block s_iflags to SB_I_IMA_UNVERIFIABLE_SIGNATURE to
force signature reevaluation on every file access until a fine grained
solution can be found.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 fs/overlayfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 51eec4a8e82b..08d3a1f34ac6 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -2155,7 +2155,7 @@ static int ovl_fill_super(struct super_block *sb, void *data, int silent)
 		ovl_trusted_xattr_handlers;
 	sb->s_fs_info = ofs;
 	sb->s_flags |= SB_POSIXACL;
-	sb->s_iflags |= SB_I_SKIP_SYNC;
+	sb->s_iflags |= SB_I_SKIP_SYNC | SB_I_IMA_UNVERIFIABLE_SIGNATURE;
 
 	err = -ENOMEM;
 	root_dentry = ovl_get_root(sb, upperpath.dentry, oe);
-- 
2.40.1

