Return-Path: <openbmc+bounces-579-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C7B4260F
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j254zNz2yr8;
	Thu,  4 Sep 2025 01:58:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915110;
	cv=none; b=j89WTSqjI15XsxLKsUIiC0JfqMd9mvA5YfY+qOhG+Dvbq1VPGBEJfZnx+0mrPotXmAOqfFD8usjaWVdIrrhsmgRIkIJVJnVldc/gh5u+P5rf2XfvsbihD1qkxN5cY4ii/KxUqdoJ9CoxJOE3Para8WB5q77vI+lV3NemGDVmkBcWKgq2m1dHhVThe3gO0zrp7BEWE5Wn3p1YCyRYG6P5hmmGSQlbM1mfm35d8ol7bF7sdeXvT0ZoCGFG6Bnopno5ps4c3S53HQ+01OuuIj+qRDNur5KknGmU80ErtodbK8fDDjLWbPqNhA6CSa3bN79IqogAzE5Y3nK5ES76/P9HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915110; c=relaxed/relaxed;
	bh=Pt6XIygZuaW5iUPnSNRLhn2By9jv1R2g29a3PfyyCkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Js8WpguHjkDC7IlarGXR1YvaK3YVgkZ1GDCgyrS1UPln20Dn/gGK9Horvva59CDUcbGye07DBto4f7y1K49lPwverJkouVPojsFo23Z5HD/2OPH4O16+uvWo8reseMkdMTE/110NsL2ZtJGt1bns8RlsxxfNzQgSNAmV4XOKkUNfA65pnx2hvKE7nCKEfCuQ2OLn/C0Jr7aWP74RM1ZeDTaCQIYOt1+PgfKKg4mwur+xRHG2DiHckqMe0jQDmatMu5FYAO6CaMQSjaIt1ronnvbEB05BzmesHFhBxRW4ADAw6tfbsQrpwOC76dv+7CouBcfDNXsr/x0CLSgaOz9O+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FUTWhT8E; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FUTWhT8E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j14VC0z2xgp
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:29 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583CYaUx023002;
	Wed, 3 Sep 2025 15:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Pt6XIygZuaW5iUPnSNRLhn2By9jv1R2g29a3PfyyC
	kQ=; b=FUTWhT8EJqIQ9+ZsMXFqyTxjWh3XIxsh+FP7aSzU5oQbWdvQkDD9I3ica
	A4XWh3JHEIMJr5jCq0g8RENg8sb6CYUqjvtJb4aUrEJU2P44zjOLOnfdf6LbzEWW
	79ewExDWKcyPLFFuVFVPZL6KWGZERVNkAOAL+0PaMbpbOJN6QgI0Hv3rxD55ZKJa
	bpHOtqOSAdqgcJZC1wbTjqtxcyAF1SGYA6YfAumn0HS72CALg5ggbkqRv22ao67T
	uOgpc9/QLVFLh/FS8AF8smQu4pIorW6rkHZ9n0kCQoKY+Lo2MM0K7gYaYCwPzjqC
	y4BBq4qzQp18KSvNi7bSW9EM6Qi5w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48uswddahf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583CBmnh014038;
	Wed, 3 Sep 2025 15:58:14 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3fw9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:14 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwCDI55378414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:13 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E04C45804E;
	Wed,  3 Sep 2025 15:58:12 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A5CC5803F;
	Wed,  3 Sep 2025 15:58:12 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:12 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH linux dev-6.12 v2 0/6] Port linux fixes from dev-6.6
Date: Wed,  3 Sep 2025 10:58:02 -0500
Message-ID: <20250903155810.2839634-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=PeP/hjhd c=1 sm=1 tr=0 ts=68b86596 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=TE8Eiz4wc1mXMh57oLIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfXwnFXJmce9FnN
 W96rgInH1tGdaiUDTKol/Zvu/HiFtlz0tka+I1hrpkmRFi3Tkgp15YXpYKRT3IXviW9EkkO+Mf/
 pBIVDbSpsp/kUNOZImCWHxPyYcde4H05RDuHU+0wewB53i8gaOLu53aCYvBJWFAf3BdvaTinOPX
 0OmCWGsEfPpKaS/1XW6iQ7570r0MFb07DTvEiwekJHX3eWQ0BRzfehgt/Scy/+cJh/bHZwPupfA
 65JAuBSEF9/UGwhA3dQzNpIi4o8AHfx3XvWHEVDU23f3mqePyBTwRX3JokRrtEasX6Wdyzc7Ueu
 F006tlmHOVHAS4RdiXR9MMPPxotWNlSwXxBE5X77hLe8qvDU0+//ziP5lAZGm25vv75Kz2+aWxt
 CqevUaeH
X-Proofpoint-GUID: WpjdBf9IsOTdcNbqKAr-unzIypEvLwRR
X-Proofpoint-ORIG-GUID: WpjdBf9IsOTdcNbqKAr-unzIypEvLwRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patchset forward port fixes from dev-6.6 to dev-6.12 branch.
The conflicts were seen only in one patch listed below.
- soc: aspeed: Add XDMA Engine Driver

V2:
---
I have incorporated review comments by Andrew.
- Fixed errors generated by "-Werror" in aspeed-xdma.c
- Fixed checkpatch errors in the trace events (xdma.h)

Eddie James (6):
  soc: aspeed: Add XDMA Engine Driver
  soc: aspeed: xdma: Add user interface
  soc: aspeed: xdma: Add reset ioctl
  soc: aspeed: xdma: Add trace events
  i2c: core: Add mux root adapter operations
  iio: si7020: Lock root adapter to wait for reset

 MAINTAINERS                      |    2 +
 drivers/i2c/i2c-core-base.c      |   38 +
 drivers/i2c/i2c-mux.c            |   50 ++
 drivers/iio/humidity/si7020.c    |   16 +-
 drivers/soc/aspeed/Kconfig       |   11 +
 drivers/soc/aspeed/Makefile      |    1 +
 drivers/soc/aspeed/aspeed-xdma.c | 1225 ++++++++++++++++++++++++++++++
 include/linux/i2c.h              |   42 +
 include/trace/events/xdma.h      |  126 +++
 include/uapi/linux/aspeed-xdma.h |   42 +
 10 files changed, 1551 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-xdma.c
 create mode 100644 include/trace/events/xdma.h
 create mode 100644 include/uapi/linux/aspeed-xdma.h

-- 
2.48.1


