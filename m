Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D67922E2
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 15:16:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lXZF5JNx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg5cd2kZJz3bd6
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 23:16:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lXZF5JNx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg5Z16Hc6z2ydW
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 23:14:17 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385D7tgu004612;
	Tue, 5 Sep 2023 13:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/uAA1JfRqFcAWlxWK8BquGNYcbIdhNmKtdFPosFLgHI=;
 b=lXZF5JNxzgyFdvBikrZdcSSNzKUNrc3hgKKLlDmgISNWHsx+0DZIwZ06LybFnHWU/Xys
 L8utvTtoRWO44ky5IGAVxIyzJ0E7j2hZghG4eIpH6I1vLpMGQ6z2m8wH/sBcvLu2VHHz
 VQjTfKVlCMc2ycmIDA1sYU3aeTBUo5ERaNgZtcS2y/LWiU/rDIKxgxE9Xcp/dKtL1nqM
 75tvlUfPy8++zy4CRdaqQQbW1mB4O8XaWNNIODNWSwF4R7xIAPbORiH4+h5GdvZT05JC
 /Hg8m5tNBL7gvJl9DR2bW1gPBJ/WoNdhrLlWmjGNyJpROQOxKWr2klxYrIiFRrg32y4r DQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sx3sn24ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385BPCdT011154;
	Tue, 5 Sep 2023 13:14:09 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svj31j6se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 13:14:09 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385DE7rR20578680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 13:14:07 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2778058060;
	Tue,  5 Sep 2023 13:14:07 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B82A58045;
	Tue,  5 Sep 2023 13:14:06 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 13:14:06 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 2/5] fs: clarify when the i_version counter must be updated
Date: Tue,  5 Sep 2023 09:13:58 -0400
Message-ID: <20230905131401.82232-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905131401.82232-1-stefanb@linux.ibm.com>
References: <20230905131401.82232-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y5aIRFvfL7ZHocLqYKlgyjGKJuGxSTOU
X-Proofpoint-GUID: Y5aIRFvfL7ZHocLqYKlgyjGKJuGxSTOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 mlxlogscore=715 phishscore=0 impostorscore=0 clxscore=1011
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Christian Brauner <brauner@kernel.org>, Colin Walters <walters@verbum.org>, NeilBrown <neilb@suse.de>, Dave Chinner <david@fromorbit.com>, Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trondmy@hammerspace.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jeff Layton <jlayton@kernel.org>

The i_version field in the kernel has had different semantics over
the decades, but NFSv4 has certain expectations. Update the comments
in iversion.h to describe when the i_version must change.

Cc: Colin Walters <walters@verbum.org>
Cc: NeilBrown <neilb@suse.de>
Cc: Trond Myklebust <trondmy@hammerspace.com>
Cc: Dave Chinner <david@fromorbit.com>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 include/linux/iversion.h | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/linux/iversion.h b/include/linux/iversion.h
index 6755d8b4f20b..f174ff1b59ee 100644
--- a/include/linux/iversion.h
+++ b/include/linux/iversion.h
@@ -9,8 +9,26 @@
  * ---------------------------
  * The change attribute (i_version) is mandated by NFSv4 and is mostly for
  * knfsd, but is also used for other purposes (e.g. IMA). The i_version must
- * appear different to observers if there was a change to the inode's data or
- * metadata since it was last queried.
+ * appear larger to observers if there was an explicit change to the inode's
+ * data or metadata since it was last queried.
+ *
+ * An explicit change is one that would ordinarily result in a change to the
+ * inode status change time (aka ctime). i_version must appear to change, even
+ * if the ctime does not (since the whole point is to avoid missing updates due
+ * to timestamp granularity). If POSIX or other relevant spec mandates that the
+ * ctime must change due to an operation, then the i_version counter must be
+ * incremented as well.
+ *
+ * Making the i_version update completely atomic with the operation itself would
+ * be prohibitively expensive. Traditionally the kernel has updated the times on
+ * directories after an operation that changes its contents. For regular files,
+ * the ctime is usually updated before the data is copied into the cache for a
+ * write. This means that there is a window of time when an observer can
+ * associate a new timestamp with old file contents. Since the purpose of the
+ * i_version is to allow for better cache coherency, the i_version must always
+ * be updated after the results of the operation are visible. Updating it before
+ * and after a change is also permitted. (Note that no filesystems currently do
+ * this. Fixing that is a work-in-progress).
  *
  * Observers see the i_version as a 64-bit number that never decreases. If it
  * remains the same since it was last checked, then nothing has changed in the
-- 
2.40.1

