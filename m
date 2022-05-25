Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ED85341EC
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 19:03:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7cpx0Wp8z3blF
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 03:03:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EB27WjHj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EB27WjHj; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7cnk3Zbdz2xtp
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 03:02:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PFpEkj001934;
 Wed, 25 May 2022 17:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ivnDzru3W+L/H7gXDFZPc4sJzdfH57kHnvIccc2ZI4U=;
 b=EB27WjHjjZVE1Ky16Yfy2jFlIzwipsI4DDPZtWPvPDPZvl52Q5dSikWnSw9i8VbONpsF
 22WbTLuamiJ7kq4xcEf8z3lt4Pu+69ELkAysusN00dP6pvrOj7pF4Xc3RjyFDdpbaTCm
 HuCcjhiURMknoe6laJf19a3dP1183mnBbBjDpbYjbf7K+qAXLUYNHL42IZQXg8Cvns0D
 jg8NuayEFb/fFUB3m6SPBegjQXVbRM3l4V2lNo5E5ubVtoTdwiiflO7uWvvSsvPgYrwB
 RttZ1TJX9a/FtcH8J64RrzmsbVUnZLKHMJO04ZN6djjkrk8L8gEiM/QqpHS1f8oQEKTx 6g== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9nvpunc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 17:02:45 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PH24Gc016860;
 Wed, 25 May 2022 17:02:45 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3g93uth5rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 17:02:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PH2hn732702788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 17:02:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7D2378060;
 Wed, 25 May 2022 17:02:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54E647805E;
 Wed, 25 May 2022 17:02:43 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.60.201])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 17:02:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/2] spi: fsi: Fix spurious timeout
Date: Wed, 25 May 2022 12:02:38 -0500
Message-Id: <20220525170240.33918-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EdenUIxdQxS4SW9aSs8bPbTfr4rL8nS-
X-Proofpoint-ORIG-GUID: EdenUIxdQxS4SW9aSs8bPbTfr4rL8nS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_04,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=880
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2205250086
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver may return a timeout error even if the status register
indicates that the transfer may proceed. Fix this by restructuring
the polling loop.
Also include a patch to display the error return code when failing
to transfer one message, which would have been very helpful in
debugging this issue.

Eddie James (2):
  spi: fsi: Fix spurious timeout
  spi: core: Display return code when failing to transfer message

 drivers/spi/spi-fsi.c | 12 ++++++------
 drivers/spi/spi.c     |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.27.0

