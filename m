Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F940CEFF
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 23:48:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8v3H1h3Tz2yWr
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 07:48:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PG2C1PoB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PG2C1PoB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8v2n1v1Gz2yJX
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 07:47:44 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FIwtQL026193;
 Wed, 15 Sep 2021 17:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KHSNye1Rglxjr55d8vOXR9qUgkBFxH4Z6Wq0aRv/nYU=;
 b=PG2C1PoBFFK9h1T2qq0UTWgFfnjFnggKaph5li1Ylf9ir0HtxtTh2H8XO3P+4FQBDZq3
 KspHFlc/f+poomF+CI4zE56KbvYg82+RkfYt97sHjKBTPj1YTznQ6b6RrtMc3cVqyrqw
 S3EddvYhy5B5JWup40FeslCANqbSJtOtRqAdDZ8ZeLDRBoFsoPkNbP+jVTrg6J0rGaQT
 /6kYms+NKX/GievwxD0VfuC9BhEoIpckmW1k+FlwLerhLvr24nyAmUZ3cBBfCOju0Knm
 i0vV9/Hnj/dIo9Zfvo6QTELVeBbGNt+0w/vc2eACKLY3GcxUUQIlDDWP5Ln0Km6Lhixc UQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b3pkbaxnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 17:47:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FLcTXP022750;
 Wed, 15 Sep 2021 21:47:40 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3b0m3am0w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 21:47:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FLldGK32047568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 21:47:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 606DBC6055;
 Wed, 15 Sep 2021 21:47:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CD41C6063;
 Wed, 15 Sep 2021 21:47:39 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.152.249])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 21:47:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 v2 0/4] ARM: dts: aspeed: p10 i2c, leds,
 and gpios
Date: Wed, 15 Sep 2021 16:47:34 -0500
Message-Id: <20210915214738.34382-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HQbQSYcS3gsXilSmseM6bXGIh42FyK2B
X-Proofpoint-ORIG-GUID: HQbQSYcS3gsXilSmseM6bXGIh42FyK2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=369 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150103
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here are various additions and fixes to the P10 BMC system device trees.

Changes since v1:
 - The eeprom and gpio patches
 - Add missing gpio expander at 0x60 on i2c-7

Eddie James (4):
  ARM: dts: aspeed: everest: Add I2C bus 15 muxes
  ARM: dts: aspeed: rainier: Add system LEDs
  ARM: dts: aspeed: rainier: Add eeprom on bus 12
  ARM: dts: aspeed: Rainier: Remove gpio hog for GPIOP7

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  158 +++
 .../boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts |    9 +
 .../boot/dts/aspeed-bmc-ibm-rainier-p1.dts    |    9 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 1205 ++++++++++++++++-
 4 files changed, 1363 insertions(+), 18 deletions(-)

-- 
2.27.0

