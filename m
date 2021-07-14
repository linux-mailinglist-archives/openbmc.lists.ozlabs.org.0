Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF173C8502
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 15:09:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPyWN4fPkz30Dv
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 23:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i7j0Oe3q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i7j0Oe3q; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPyW24Fq6z2yRS
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 23:08:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16ED3XPl025291
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 09:08:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VTEjA6WQhmrN+B1ek9r2aW0/FWw8spr4ogl1rkqDMi0=;
 b=i7j0Oe3qpTBIWc6fDul9UMqtNg75eJFipaZBE09Q4y9IGqqzHqWrk1AS4pP7QD6B0zP+
 P0UAX66w2E0YKvKvADLkkPM0UqyKAXZ61eyE9P7q5hkQJJgQY8/br/gxiSu5H+Wws+10
 RMM8WE3lF/bVxgPr4sSouCo7Gy56lHNECqVAsua9LyMGxWEJxq7thCA7VKicEoARCsHW
 K7i5WkgJDtGvc5dE69TX2bmKTtu0rje+vrG8NKfyFblRt8YwiPcsC/kD8mQxQ6jhRyBd
 7XoxrB/tNQ8lpTR6UpSx842XHlhhl/1RML5MOZPJUOPj4a9tADd34u5rMz9e7a4g7fTW +A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39stff2rn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 09:08:41 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16ED8XpX024622
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 13:08:40 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 39q36cx6jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 13:08:40 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16ED8dJj14745896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 13:08:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A3CA28068;
 Wed, 14 Jul 2021 13:08:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38D0A2806A;
 Wed, 14 Jul 2021 13:08:39 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.77.159.186])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 13:08:39 +0000 (GMT)
From: Ben Tyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs:designs:device-tree-gpio-naming] Add vrm-fault-standby
 pin name
Date: Wed, 14 Jul 2021 08:08:37 -0500
Message-Id: <20210714130837.3609-1-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RxjXHsXXbE9Up1jXq0JSBTHiZ0eRvXQN
X-Proofpoint-ORIG-GUID: RxjXHsXXbE9Up1jXq0JSBTHiZ0eRvXQN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_07:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140081
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ben Tyner <ben.tyner@ibm.com>

Pin vrm-fault-standby indicates that the voltage regulator for standby
voltage reported a fault condition.

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---
 designs/device-tree-gpio-naming.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/designs/device-tree-gpio-naming.md b/designs/device-tree-gpio-naming.md
index 98ddb03..b6489ca 100644
--- a/designs/device-tree-gpio-naming.md
+++ b/designs/device-tree-gpio-naming.md
@@ -114,6 +114,7 @@ These are special case and/or grandfathered in pin names.
 Defined:
 - cfam-reset
 - checkstop
+- vrm-fault-standby
 
 ## Alternatives Considered
 - Continue to hard code a config file per system type that has the
-- 
2.25.1

