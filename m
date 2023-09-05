Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D37922DC
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 15:14:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQpkEkJw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg5ZY4x5qz3c3s
	for <lists+openbmc@lfdr.de>; Tue,  5 Sep 2023 23:14:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQpkEkJw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg5Yw6RV1z2ydW
	for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2023 23:14:12 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 385D8tDE021664
	for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2023 13:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PsXAT+kFzEXMgaJ5jdS4H2HhpJz8uhd9bmZ1qJ14xOQ=;
 b=sQpkEkJwxMK5a82+wLkEVvCvSeRqZRZtB8z5dwUCxWuavXDEsa5CVK7goZ/BCpjGf8gT
 QhFbRFSdxjVK3xl+dhxfBLEanH3eOk6mvdNfoEdALNeAgdzND5o35oRQvki5h3nBBXP9
 KACwBnu6vybsGNKW9vCzT7oB2HCCUQzpwxBEguqExyeLr3lUpf/PGyhtf5AStfZmH5dB
 5xGjJzSrmv+HsxXLyfYkGn36NorVWqGv2ukKUzbunfQaJuOL9GgCgShBQdwyBDAyBH5E
 oIZ3cxKPq6wfs3G+LUDQuVmA35H85MRvTK7Admx6S84xXKSuwLCKPpDg9X6Yd6MQaOLv yw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sx44vhjsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2023 13:14:08 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 385BjFgO021478
	for <openbmc@lists.ozlabs.org>; Tue, 5 Sep 2023 13:14:08 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfryaxvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2023 13:14:08 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 385DE51Z39584078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Sep 2023 13:14:05 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 695175805F;
	Tue,  5 Sep 2023 13:14:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF54958054;
	Tue,  5 Sep 2023 13:14:04 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Sep 2023 13:14:04 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1 0/5] Backports to support OpenBMC with IMA
Date: Tue,  5 Sep 2023 09:13:56 -0400
Message-ID: <20230905131401.82232-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0O8W-3ZJ0_aeo-d1x-0lnpX2krlfan-r
X-Proofpoint-GUID: 0O8W-3ZJ0_aeo-d1x-0lnpX2krlfan-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=994 clxscore=1011 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309050114
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series of patches are backports from recent extensions to core Linux
filesystem code (support for STATX_CHANGE_COOKIE) and subsequent fixes
to IMA and overlayfs so that IMA can be used by OpenBMC configured with
overlayfs. Overlayfs is for example used by the p10bmc build.

The patches in this series have been cherry-picked from upstream Linux
using the following commands:

git cherry-pick 131f4fd2c25a # 3 consecutive patches of longer series
git cherry-pick a3bb710383cb
git cherry-pick a1175d6b1bda
git cherry-pick db1d1e8b9867 # IMA: use vfs_getattr_nosec ...
git cherry-pick 18b44bc5a672 # ovl: Always reevaluate ...

Regards,
   Stefan

Eric Snowberg (1):
  ovl: Always reevaluate the file signature for IMA

Jeff Layton (4):
  fs: uninline inode_query_iversion
  fs: clarify when the i_version counter must be updated
  vfs: plumb i_version handling into struct kstat
  IMA: use vfs_getattr_nosec to get the i_version

 fs/libfs.c                        | 36 +++++++++++++++++++
 fs/overlayfs/super.c              |  2 +-
 fs/stat.c                         | 17 +++++++--
 include/linux/iversion.h          | 60 ++++++++++++-------------------
 include/linux/stat.h              |  9 +++++
 security/integrity/ima/ima_api.c  |  9 +++--
 security/integrity/ima/ima_main.c | 12 ++++---
 7 files changed, 97 insertions(+), 48 deletions(-)

-- 
2.40.1

