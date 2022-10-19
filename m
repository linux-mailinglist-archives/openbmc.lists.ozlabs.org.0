Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D1D604A9F
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 17:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsvHN0b33z3c5v
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 02:08:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d9oMzzri;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d9oMzzri;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsvGn6620z2xZf
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 02:07:29 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JEpMn3011629;
	Wed, 19 Oct 2022 15:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=V56tFjXFIc1dVzs+9qo7IJ8XQdkj/txaTuOIFk6djuk=;
 b=d9oMzzriVWGyso1GF2F//b+WKm4IW3TWJJfr5OzrtFps3nCnSGdl7AMlWLbCGXu6myaw
 tt5s/nnTj/tQEIIW149E+q9Dm+m0LR5uVaOdS3f5zJpNGrinzgt9PvikYW2knwoeCIBR
 uMd24JG7JsKoZpgg2r9PbXRetSyFLC1eoSnR2SHHixdJMv4M29ya5OTfM4ae2rq/ARyQ
 hiOD8ASRVENWyKGlTO9/zZV/YrpPzstQ2eI7JF1lU45htxwwhOcQ6UD15Tg1g5evWQNh
 tJIvU22gYoepJ8tIl/sHBVIiL/kqp+EP5uLVb+/PT4ReeL6DPWoD13UnQJNNJOBaV5uS HA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kakc9gjxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JEomKf011695;
	Wed, 19 Oct 2022 15:07:22 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma01dal.us.ibm.com with ESMTP id 3k7mg9bcmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:22 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JF7NCL9634530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 15:07:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98A6258055;
	Wed, 19 Oct 2022 15:07:20 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1620D58066;
	Wed, 19 Oct 2022 15:07:20 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.7.147])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 15:07:19 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0 0/3] watchdog: aspeed: Add pre-timeout interrupt support
Date: Wed, 19 Oct 2022 10:07:11 -0500
Message-Id: <20221019150714.606390-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Wtq5FuHY_s2Q5Oax1_dpC0gbw60mMhsB
X-Proofpoint-GUID: Wtq5FuHY_s2Q5Oax1_dpC0gbw60mMhsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=764 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190081
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

Enable the watchdog pre-timeout interrupt if enabled in the device tree,
and setup the relevant device trees.

Eddie James (3):
  watchdog: aspeed: Add pre-timeout interrupt support
  ARM: dts: aspeed: Setup watchdog pre-timeout interrupt
  ARM: dts: aspeed: p10bmc: Set watchdog pre-timeout interrupt

 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts |  1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts |  1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  1 +
 arch/arm/boot/dts/aspeed-g5.dtsi             |  3 ++
 arch/arm/boot/dts/aspeed-g6.dtsi             |  4 ++
 drivers/watchdog/aspeed_wdt.c                | 54 +++++++++++++++++++-
 6 files changed, 62 insertions(+), 2 deletions(-)

-- 
2.31.1

