Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95513D16D7
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 21:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVQ2y3zcmz3bfX
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 05:03:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQ8hnUpD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iQ8hnUpD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVQ266QQcz2yXb;
 Thu, 22 Jul 2021 05:02:38 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LIWpFZ063690; Wed, 21 Jul 2021 15:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2hN3d3xDAYrSdCJbS2shpsHU44G77Y04mHM5Qdk+2Ao=;
 b=iQ8hnUpDwtWlNm4Yns+zf/Lxhn5cUYeO1Pz2ykJaDtXlS9augoSSvrHHwykjexxuDqGq
 LWjZRK7tAEftNPP164rT0ctZ1U81IIBXoZfa+Che8dazpZTKUEN2eFQdiPeC9kRq3nEA
 RGuF5qKo0P6a/k5FUll8HuaAdCQEGOuxKRju93Sf7vkanK13L4xWTUjDCCqmii8ZjblY
 uhhcf30UlVdvvMhSbbqu7XQuKfgbE8gRlv6rrXV635KolwX/zSRdpHSe+QOBmP9wcd/B
 TpUouyFPxNF9lrfZoLQdCOFhgXQh9vD5RFEhlsIwa/tjn8pBqfR+IT/K8ugoMjSf5/k3 ZQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xr29abpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 15:02:34 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LIvXW6001302;
 Wed, 21 Jul 2021 19:02:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 39vqdvp49c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 19:02:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LJ2Wds37224758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:02:32 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890DE28071;
 Wed, 21 Jul 2021 19:02:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85AA428059;
 Wed, 21 Jul 2021 19:02:31 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.68.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 19:02:31 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v2 0/3] OCC: fsi and hwmon: Set sequence number in submit
 interface
Date: Wed, 21 Jul 2021 14:02:28 -0500
Message-Id: <20210721190231.117185-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PzCBHHEsz8FoP8aMWG4Qrve3ptomBbzY
X-Proofpoint-ORIG-GUID: PzCBHHEsz8FoP8aMWG4Qrve3ptomBbzY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_10:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=997
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210109
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Conflicting sequence numbers have resulted in users of the OCC interface
getting the wrong response. For example, both the hwmon driver and an
application might send a transfer near the same time with the same sequence
number, and then one or both will get an incorrect respnse, but cannot tell
because the sequence number looks correct.
Perform the sequence numbering in the submit interface to make sure each
transfer has a unique sequence number. This also requires that the submit
interface perform the checksum calculation for the command. Adjust the hwmon
driver accordingly too.

Changes since v1:
 - fix 0day warnings and errors.

Eddie James (3):
  fsi: occ: Force sequence numbering per OCC
  hwmon: (occ) Remove sequence numbering and checksum calculation
  fsi: occ: Add dynamic debug to dump command and response

 drivers/fsi/fsi-occ.c      | 99 +++++++++++++++++++++++++++++++-------
 drivers/hwmon/occ/common.c | 30 +++++-------
 drivers/hwmon/occ/common.h |  3 +-
 drivers/hwmon/occ/p8_i2c.c | 15 +++---
 drivers/hwmon/occ/p9_sbe.c |  4 +-
 5 files changed, 106 insertions(+), 45 deletions(-)

-- 
2.27.0

