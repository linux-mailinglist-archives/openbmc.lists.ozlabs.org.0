Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B14A032B
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 22:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlrhM1yKSz3bYw
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 08:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AXYeQNsq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AXYeQNsq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jlrgz0Ng5z2yN3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 08:49:02 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SLKwbd028643; 
 Fri, 28 Jan 2022 21:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cnBadB7VIRbP5PTnuyuWYbM/022/c+elAR7Bpjm/ucE=;
 b=AXYeQNsqbiYudfP0ScN0dnGxHYuS3fbSRGwyHp2U+cG5ACxrM5yFMLvsyjzQo3t0tYaf
 +hOb8TZiZNGUcRDr8rZ2LSOifaGyqokmMa/DiA2ZUlg40FIAz6PTewKJKdYpJrzzKrl3
 Vd5rkVnv/cIUOKfr4hbzwviXIVhjmGN1WatzGA+lGotvEE6pG2X02v7BLIcmAMdq3iyA
 9KHl2SdYQz6P7tOlrGenXZVcJB3k6gEnr+LtE0N1cL4NqIof7sDotCsM237YnP4KqTTv
 M9e+v5v7DM3PWxNhhwfkE8CPxnHhwYV2PDuqMqdJ0MfcxG1QCe2o558dJzidi+xhwDAc aQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvgqjag4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 21:48:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SLW4cI015885;
 Fri, 28 Jan 2022 21:48:58 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3dtbckc078-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 21:48:58 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SLmvaF29688152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 21:48:57 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 444E47805C;
 Fri, 28 Jan 2022 21:48:57 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF5D978066;
 Fri, 28 Jan 2022 21:48:56 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.120.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 21:48:56 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/3] Support PL2303 on AST2600
Date: Fri, 28 Jan 2022 15:48:49 -0600
Message-Id: <20220128214852.21551-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9GXmYUP0bpUqqQShUARlxsTvH1ME1qMz
X-Proofpoint-ORIG-GUID: 9GXmYUP0bpUqqQShUARlxsTvH1ME1qMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=592 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280123
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series provides support for the PL2303 serial-to-USB converter
on the AST2600-based systems, Everest and Rainier.

Eddie James (3):
  USB: serial: pl2303: Add IBM device IDs
  USB: uhci: Add ast2600 compatible
  arm: dts: Aspeed: Rainier and Everest: Enable UHCI

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 drivers/usb/host/uhci-platform.c             | 3 ++-
 drivers/usb/serial/pl2303.c                  | 1 +
 drivers/usb/serial/pl2303.h                  | 3 +++
 5 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.27.0

