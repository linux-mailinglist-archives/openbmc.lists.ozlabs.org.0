Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5D723597
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 05:09:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZwRm65mDz3dyf
	for <lists+openbmc@lfdr.de>; Tue,  6 Jun 2023 13:09:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwQmY5vV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwQmY5vV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZwRB4ktbz3c71
	for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2023 13:08:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3562tg6T023996
	for <openbmc@lists.ozlabs.org>; Tue, 6 Jun 2023 03:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PpDTi72iedp54n38Bi81sALHv44gd2k2oOz47hWwpW8=;
 b=TwQmY5vV96+iE+IJkYnBz/Ln/2kpH+9ZoqaEgRadb9NWuLKE5m+xd3D0QLwrMS5lTCjy
 GC5FRkqpeqdjQVqs+6tWnk6XQ2oy2iXvk6ccNCqAhwZD+X+0nzX3Z4CD5DNFcjjhnCQ4
 KvW7WGa8BqF21CkmtKnqHgQ2nPB91wM65jmXfvRjFFzTK3Af7ZLBlOEA0q7Flex2iPSG
 u2ilW10k9j7KBufLZTMx4ijA4+GKGUG+v/xC1ioxE35lFDnnvp3uZIC0gasqeuaUcVuS
 8c9q5e9U38y1sGC8ui+UUA14WuFbJ02W0sUi74vD7daQgTeg/bC4UV896DY50O2/+gWp cg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1veh885r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2023 03:08:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 355H7mQi028159
	for <openbmc@lists.ozlabs.org>; Tue, 6 Jun 2023 03:08:34 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qyxmx4cjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2023 03:08:34 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35638VlO3015380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 03:08:31 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F9985805F;
	Tue,  6 Jun 2023 03:08:31 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90B9E58045;
	Tue,  6 Jun 2023 03:08:30 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 03:08:30 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/1] OpenBMC-Linux: Fix for EVM signature verification
Date: Mon,  5 Jun 2023 23:08:14 -0400
Message-Id: <20230606030815.101280-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LPOfge08DDoWU6Oj5zumy_xgGVktuYy4
X-Proofpoint-GUID: LPOfge08DDoWU6Oj5zumy_xgGVktuYy4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-05_35,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=804 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: jmstanle@au1.ibm.com, andrewrj@au1.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Please apply the following patch to the dev-6.1 branch of the OpenBMC Linux
repo. The patch has been cherry-picked from the upstream Linux repo:

https://github.com/torvalds/linux/commit/c3d03e8e35e005e1a614e51bb59053eeb5857f76

I need this patch for proper EVM signature enforcement and will drop it from
my OpenBMC series of patches once the OpenBMC Linux build includes this patch.
I have been carrying this patch here lately:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/63909

Regards,
   Stefan


Roberto Sassu (1):
  KEYS: asymmetric: Copy sig and digest in public_key_verify_signature()

 crypto/asymmetric_keys/public_key.c | 38 ++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

-- 
2.37.3

