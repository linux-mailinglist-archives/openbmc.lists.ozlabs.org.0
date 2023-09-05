Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE77922E8
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 15:18:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJR3dtTK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg5fh0Npkz3c89
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 23:18:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJR3dtTK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg5Z34SgWz3bw4
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 23:14:19 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385DBv91024354;
	Tue, 5 Sep 2023 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pIIz20sGobZtS4WceCp7DOJcT7iTAbQJTGQDWpfeH3c=;
 b=dJR3dtTKL4Ti5B/UYkF2a/tTIS8o77JFNROkg7ZJmEHXcCqUHXqmF2BoJs6J41fn5boL
 DtTvfH0JRsHhb6VUHRIJ1+RbOb4+c74k5HKVR8KuT7lEslaniHBJZmgxDpKMx8ClDDHH
 0GQPnUfcZKrmysSpasGzi3YyONMdl6FyEeiRtHsygHUWR+H6kOP4vhNv8JrtQKuqKda6
 7K3Ge3yJhpfX93cDZtUfOcNOvxYl7D+/4tZzTOZJPN0rL63hR6vQJQPhTIVNEm9BQtcg
 U/uMjUBmDZsBn0x5Fhg0Qk9yBQrslDvuOssDxgg6hcoMSgjdUwffboIr4zPgSlKpNPON yA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sx50j826h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385B26Dr012261;
	Tue, 5 Sep 2023 13:14:08 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkjtbth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:08 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385DE6WH61538574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 13:14:06 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37F025805F;
	Tue,  5 Sep 2023 13:14:06 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CBCF58060;
	Tue,  5 Sep 2023 13:14:05 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 13:14:05 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 1/5] fs: uninline inode_query_iversion
Date: Tue,  5 Sep 2023 09:13:57 -0400
Message-ID: <20230905131401.82232-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905131401.82232-1-stefanb@linux.ibm.com>
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FeWvxETs55FlLRYUx1vcYEmOwsEXQU3P
X-Proofpoint-GUID: FeWvxETs55FlLRYUx1vcYEmOwsEXQU3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=572
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1011 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, NeilBrown <neilb@suse.de>, Jeff Layton <jlayton@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jeff Layton <jlayton@kernel.org>

Reviewed-by: NeilBrown <neilb@suse.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/libfs.c               | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/iversion.h | 38 ++------------------------------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index aada4e7c8713..17ecc47696e1 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1582,3 +1582,39 @@ bool inode_maybe_inc_iversion(struct inode *inode, bool force)
 	return true;
 }
 EXPORT_SYMBOL(inode_maybe_inc_iversion);
+
+/**
+ * inode_query_iversion - read i_version for later use
+ * @inode: inode from which i_version should be read
+ *
+ * Read the inode i_version counter. This should be used by callers that wish
+ * to store the returned i_version for later comparison. This will guarantee
+ * that a later query of the i_version will result in a different value if
+ * anything has changed.
+ *
+ * In this implementation, we fetch the current value, set the QUERIED flag and
+ * then try to swap it into place with a cmpxchg, if it wasn't already set. If
+ * that fails, we try again with the newly fetched value from the cmpxchg.
+ */
+u64 inode_query_iversion(struct inode *inode)
+{
+	u64 cur, new;
+
+	cur = inode_peek_iversion_raw(inode);
+	do {
+		/* If flag is already set, then no need to swap */
+		if (cur & I_VERSION_QUERIED) {
+			/*
+			 * This barrier (and the implicit barrier in the
+			 * cmpxchg below) pairs with the barrier in
+			 * inode_maybe_inc_iversion().
+			 */
+			smp_mb();
+			break;
+		}
+
+		new = cur | I_VERSION_QUERIED;
+	} while (!atomic64_try_cmpxchg(&inode->i_version, &cur, new));
+	return cur >> I_VERSION_QUERIED_SHIFT;
+}
+EXPORT_SYMBOL(inode_query_iversion);
diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index e27bd4f55d84..6755d8b4f20b 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -234,42 +234,6 @@ inode_peek_iversion(const struct inode *inode)
 	return inode_peek_iversion_raw(inode) >> I_VERSION_QUERIED_SHIFT;
 }
 
-/**
- * inode_query_iversion - read i_version for later use
- * @inode: inode from which i_version should be read
- *
- * Read the inode i_version counter. This should be used by callers that wish
- * to store the returned i_version for later comparison. This will guarantee
- * that a later query of the i_version will result in a different value if
- * anything has changed.
- *
- * In this implementation, we fetch the current value, set the QUERIED flag and
- * then try to swap it into place with a cmpxchg, if it wasn't already set. If
- * that fails, we try again with the newly fetched value from the cmpxchg.
- */
-static inline u64
-inode_query_iversion(struct inode *inode)
-{
-	u64 cur, new;
-
-	cur = inode_peek_iversion_raw(inode);
-	do {
-		/* If flag is already set, then no need to swap */
-		if (cur & I_VERSION_QUERIED) {
-			/*
-			 * This barrier (and the implicit barrier in the
-			 * cmpxchg below) pairs with the barrier in
-			 * inode_maybe_inc_iversion().
-			 */
-			smp_mb();
-			break;
-		}
-
-		new = cur | I_VERSION_QUERIED;
-	} while (!atomic64_try_cmpxchg(&inode->i_version, &cur, new));
-	return cur >> I_VERSION_QUERIED_SHIFT;
-}
-
 /*
  * For filesystems without any sort of change attribute, the best we can
  * do is fake one up from the ctime:
@@ -283,6 +247,8 @@ static inline u64 time_to_chattr(struct timespec64 *t)
 	return chattr;
 }
 
+u64 inode_query_iversion(struct inode *inode);
+
 /**
  * inode_eq_iversion_raw - check whether the raw i_version counter has changed
  * @inode: inode to check
-- 
2.40.1

