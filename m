Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948E540F13
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 21:01:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHfq14TKxz3bmX
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 05:01:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnGqPJ5Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnGqPJ5Q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHfpZ4NnMz3bkC
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 05:01:25 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 257IwPVc007526;
	Tue, 7 Jun 2022 19:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=t3X3b3cNquQdswstuyYVDp1i1gOr0PtK43LOc9aRdlw=;
 b=mnGqPJ5QyxdQ/sDRNTP81Zcd5nJjMLcSAgcjdRc0UVxJYWfJrgbvegoqWVEOn7pWn+oC
 Lp874PjuB+czx2zvvpkYUD6vmujCcX9gVIZl48xVYmfBh81qidVY7p7PfRGUSV68hiIr
 +azzT/brqweajYhPZ6HYrmvyBSKSFtSEoEpLyVjCeGdmbTkb2EHrnv5frRfIpTrL6i5b
 IvUZW7L6ppPIM1u4DxZDyjG9/G2ezEMDzJANEuGLtqEHiHT7x20xTEbrvPCW/EyH/df3
 fty4CSsnLxd/idHtuSel5ZVk8FS1mX/KXBVa7uiMOjoO+cVx6nTP0Zss4ke+STtzYMxR cQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjce3r1s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 19:01:21 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 257IoQQO023867;
	Tue, 7 Jun 2022 19:01:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02wdc.us.ibm.com with ESMTP id 3gfy19p61p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 19:01:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 257J1JxJ31719742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jun 2022 19:01:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 990486E052;
	Tue,  7 Jun 2022 19:01:19 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F8806E04E;
	Tue,  7 Jun 2022 19:01:19 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.160.188.159])
	by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jun 2022 19:01:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/2] hwmon: (occ) Delay hwmon registration until user request
Date: Tue,  7 Jun 2022 14:01:16 -0500
Message-Id: <20220607190118.5078-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uEGaUt4CdE9xvjAdoWBWmaljO-_Csk3L
X-Proofpoint-GUID: uEGaUt4CdE9xvjAdoWBWmaljO-_Csk3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_08,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=863 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070076
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These two patches have been accepted in linux-next.

Eddie James (2):
  hwmon: (occ) Delay hwmon registration until user request
  hwmon: (occ) Lock mutex in shutdown to prevent race with occ_active

 drivers/hwmon/occ/common.c | 105 ++++++++++++++++++++--------
 drivers/hwmon/occ/common.h |   5 +-
 drivers/hwmon/occ/p8_i2c.c |   2 +-
 drivers/hwmon/occ/p9_sbe.c |   2 +-
 drivers/hwmon/occ/sysfs.c  | 137 ++++++++++++++++++++++---------------
 5 files changed, 161 insertions(+), 90 deletions(-)

-- 
2.31.1

