Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 966A97922E6
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 15:17:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OX5lpHjJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg5df33myz3c9j
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 23:17:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OX5lpHjJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg5Z20cxsz3bd6
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 23:14:17 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385D7sP4004560;
	Tue, 5 Sep 2023 13:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=q/4Wu+pJ4J26a0y8cLVU4DEIomocjgKT0oRMWWmoROA=;
 b=OX5lpHjJjguA1miJiG1U8pFWrfGihEGlxney9EL3Lku3FnqqbUmL89ii3ACzlIOnDoRJ
 TsjswDIYoNXBQPQGu/vpIi5IdlgIhLtDrq8S8dsEYdpcYzbGBlTEI13FiAcLIIsQO6Kz
 cPWEbvhkOxuaBBGiZ/DDX0WLnpdv2/K/Yi3pTpKnLrwNA9+1HXm9FiPvrO8jUDk56BZ+
 zXoWu1QpCr8TvVjUQMVGP8TZ/a08Bry40rKDIIW6MXgzE9wdFO1P+cu5ob/RenlSfVDa
 r3qMZuXhU1N1NWCBx4V88ba7nTwzVbxCFdUiZ84jQircvvq0o0e5Dg525AjyxswMUWto rw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sx3sn24j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385CLnhq026809;
	Tue, 5 Sep 2023 13:14:12 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgcnar53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:12 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385DE8mY30081550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 13:14:08 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B890C58045;
	Tue,  5 Sep 2023 13:14:08 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1995258061;
	Tue,  5 Sep 2023 13:14:08 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 13:14:07 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 4/5] IMA: use vfs_getattr_nosec to get the i_version
Date: Tue,  5 Sep 2023 09:14:00 -0400
Message-ID: <20230905131401.82232-5-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905131401.82232-1-stefanb@linux.ibm.com>
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 66LKJk2eeEq0UCpYif5jLILS7V6xOvZi
X-Proofpoint-GUID: 66LKJk2eeEq0UCpYif5jLILS7V6xOvZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jeff Layton <jlayton@kernel.org>

IMA currently accesses the i_version out of the inode directly when it
does a measurement. This is fine for most simple filesystems, but can be
problematic with more complex setups (e.g. overlayfs).

Make IMA instead call vfs_getattr_nosec to get this info. This allows
the filesystem to determine whether and how to report the i_version, and
should allow IMA to work properly with a broader class of filesystems in
the future.

Reported-and-Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>
---
 security/integrity/ima/ima_api.c  |  9 ++++++---
 security/integrity/ima/ima_main.c | 12 ++++++++----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index 1e3a7a4f8833..8f40b113dd0c 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -13,7 +13,6 @@
 #include <linux/fs.h>
 #include <linux/xattr.h>
 #include <linux/evm.h>
-#include <linux/iversion.h>
 #include <linux/fsverity.h>
 
 #include "ima.h"
@@ -245,10 +244,11 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 	struct inode *inode = file_inode(file);
 	const char *filename = file->f_path.dentry->d_name.name;
 	struct ima_max_digest_data hash;
+	struct kstat stat;
 	int result = 0;
 	int length;
 	void *tmpbuf;
-	u64 i_version;
+	u64 i_version = 0;
 
 	/*
 	 * Always collect the modsig, because IMA might have already collected
@@ -267,7 +267,10 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 	 * to an initial measurement/appraisal/audit, but was modified to
 	 * assume the file changed.
 	 */
-	i_version = inode_query_iversion(inode);
+	result = vfs_getattr_nosec(&file->f_path, &stat, STATX_CHANGE_COOKIE,
+				   AT_STATX_SYNC_AS_STAT);
+	if (!result && (stat.result_mask & STATX_CHANGE_COOKIE))
+		i_version = stat.change_cookie;
 	hash.hdr.algo = algo;
 	hash.hdr.length = hash_digest_size[algo];
 
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index bc84a0ac25aa..59075d213a89 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -24,7 +24,6 @@
 #include <linux/slab.h>
 #include <linux/xattr.h>
 #include <linux/ima.h>
-#include <linux/iversion.h>
 #include <linux/fs.h>
 
 #include "ima.h"
@@ -163,11 +162,16 @@ static void ima_check_last_writer(struct integrity_iint_cache *iint,
 
 	mutex_lock(&iint->mutex);
 	if (atomic_read(&inode->i_writecount) == 1) {
+		struct kstat stat;
+
 		update = test_and_clear_bit(IMA_UPDATE_XATTR,
 					    &iint->atomic_flags);
-		if (!IS_I_VERSION(inode) ||
-		    !inode_eq_iversion(inode, iint->version) ||
-		    (iint->flags & IMA_NEW_FILE)) {
+		if ((iint->flags & IMA_NEW_FILE) ||
+		    vfs_getattr_nosec(&file->f_path, &stat,
+				      STATX_CHANGE_COOKIE,
+				      AT_STATX_SYNC_AS_STAT) ||
+		    !(stat.result_mask & STATX_CHANGE_COOKIE) ||
+		    stat.change_cookie != iint->version) {
 			iint->flags &= ~(IMA_DONE_MASK | IMA_NEW_FILE);
 			iint->measured_pcrs = 0;
 			if (update)
-- 
2.40.1

