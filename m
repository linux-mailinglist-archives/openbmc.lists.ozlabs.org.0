Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77A435597
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 23:53:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZPWd0yDhz2yHM
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:53:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MwVV4xuX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MwVV4xuX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZPWD1KD8z2xfM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 08:53:27 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KLTHuS032250; 
 Wed, 20 Oct 2021 17:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=4h2WhmSBM0OtQR3jKtxWR0Mc3iBFqgfy4vjG9tsMmWg=;
 b=MwVV4xuXIdyDx/Y68tABlcanauH9sTDhjiI5xXlipKxmhqPhscqGlCK8oDf9hxKTigzc
 eb6DH/P86zvAQftJQsXo5tR6hHlBaqDu9qWH1OFUZj5jnH7LiW/zlwGCj3zHKpYrX8m3
 grMErA0oaKSzeM37Afq/rpdp6OJjraXrOZexlWeIQuN1Ti2SvxE8ghsfqTfhyzfBReWv
 117zMzcsaQ/7bRTH5qajyjwiw3Of8tDfMYvbrFwpEuNM8xVw8b2SWiluyRYWf9Fmjilx
 wzxRq3vxUcUAWbhymAKA81F0Fc4CilV/SSwQ6AKqM1h+FhsMK5fJe5ds5rFFCXba+jyM 3w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btrq0k86q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 17:53:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KLm4j6004061;
 Wed, 20 Oct 2021 21:53:23 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3bt4ssgj57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 21:53:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KLrMmq54395262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 21:53:22 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C412C124053;
 Wed, 20 Oct 2021 21:53:22 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62427124054;
 Wed, 20 Oct 2021 21:53:22 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.77.138])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 21:53:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.14 0/5] ARM: dts: aspeed: Rainier and Everest
 devicetree updates
Date: Wed, 20 Oct 2021 16:53:16 -0500
Message-Id: <20211020215321.33960-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sr8uBk7hJLVTn_Uii02TvEmZN8CnZijf
X-Proofpoint-GUID: sr8uBk7hJLVTn_Uii02TvEmZN8CnZijf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_06,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=440 spamscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200123
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a number of additions, fixes, and cleanups for the Rainier and
Everest systems.

Eddie James (5):
  ARM: dts: aspeed: Fix ADC iio-hwmon battery node name
  ARM: dts: aspeed: rainier and everest: Remove PCA gpio specification
  ARM: dts: aspeed: everest: Add I2C switch on bus 8
  ARM: dts: aspeed: everest: Add IBM Operation Panel I2C device
  ARM: dts: aspeed: everest: Fix bus 15 muxed eeproms

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 719 ++-----------------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 517 +------------
 2 files changed, 52 insertions(+), 1184 deletions(-)

-- 
2.27.0

