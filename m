Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDF24B5E01
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKTj41nmz3bWR
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b9+XvHYO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b9+XvHYO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKTF717wz2ywb
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:01:05 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EMAQmh003764; 
 Mon, 14 Feb 2022 23:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=inQ7ERtewt1fTYCyG4tNrmkbS9COvMX3pRhHsOkVZg4=;
 b=b9+XvHYO8ogV/AGh4QqVM2F+2vkJZSr54/uchepnjJVuzLngsCRkVrF1R30CNeofwgAn
 Seu5/vphaZWweOb6nFpIvAaw4knNqIqi3Et6HmSPf4jlyNPTaN/55bQZDhK7t83YJEVi
 jIxLPta1W+n1oBDT/yJ+4JkcbYI+9dEUgxXzEN33gNI6/bD4IUkUYjPjBbZapWNelNrS
 sfifl3IAgsYpMXV3L6tbWmig/+A0CvkfEDvAybhFGhfkiylANh/Jz50HVi5oUMGYE8/P
 kf4H/LDs+51bN9OW4gu1upqwNsp8se6oS1VEhidKkcXkLHYAil852Va6v0AM+wFijXkD uA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e6ycr6mqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EMw3gg016402;
 Mon, 14 Feb 2022 23:01:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3e64hab6hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 23:01:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EN0x6934472236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 23:00:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E5E21120AF;
 Mon, 14 Feb 2022 23:00:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7D4D11209D;
 Mon, 14 Feb 2022 23:00:58 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.10.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 23:00:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/4] hwmon: (occ) Add various poll response
 data in sysfs
Date: Mon, 14 Feb 2022 17:00:49 -0600
Message-Id: <20220214230053.38449-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iCSb4IjoHct-NgFWxSv44hlsTJwv6jpr
X-Proofpoint-GUID: iCSb4IjoHct-NgFWxSv44hlsTJwv6jpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_07,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=576 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140131
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
Cc: baileysh@us.ibm.com, Eddie James <eajames@linux.ibm.com>, cjcain@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

BMC control applications need to check various additional bits in the
extended status in the poll response, as well as the OCC mode and IPS
status bytes. Export all those through sysfs. In addition, add the "soft"
minimum power cap attribute through hwmon.

Eddie James (4):
  hwmon: (occ) Add sysfs entry for IPS (Idle Power Saver) status
  hwmon: (occ) Add sysfs entry for OCC mode
  hwmon: (occ) Add sysfs entries for additional extended status bits
  hwmon: (occ) Add soft minimum power cap attribute

 drivers/hwmon/occ/common.c | 19 +++++++++++++---
 drivers/hwmon/occ/common.h |  2 ++
 drivers/hwmon/occ/sysfs.c  | 46 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)

-- 
2.27.0

