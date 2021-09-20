Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBD4117D4
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 17:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCnxh4bb0z2yNp
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 01:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4JFyU22;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f4JFyU22; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCnvQ59pZz2yXW
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 01:06:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KEqO2B026257
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 11:06:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QWrdvdRP+LSmPzZwcUs+CYgKzSmURSDHxMEbaEplKdw=;
 b=f4JFyU22NtiZATBi/B/r2Xno4DaC8rJ1dpqBFbkI+MlhyoUrJQlI5TFTaLmLy5GoQP4P
 LE+ZF8qalZ79NLui9bNm0i6aTXj5kwx9B3SWeRcW4CfX2hd0HwCy0d8Q/xZsCgL+btjE
 BxOfv+4cRySS2ICfWkJIBfoaT49gTl+WEqVGHJbAqFYi3C7VAj2Fgp5xQUHukSk+/vE+
 l/nrrVhoenI/Df/sc2KLzUFMIO7tMAiS5Jbze9DC4yVBCbuqnVOUyYKMqqYAWBRkkCIs
 My/E5h09cOrPlNngPSdNegqVdJB0LL0Cgsp47aASAYPsQzRaYOavm8CKjyz6F9D0kltq gA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w78d5jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 11:06:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KF4j1Q007600
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 15:06:22 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3b57ra1np4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 15:06:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KF5ro53736338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 15:05:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F020D2806D;
 Mon, 20 Sep 2021 15:05:52 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF9FA28060;
 Mon, 20 Sep 2021 15:05:52 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.160.134.25])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 15:05:52 +0000 (GMT)
From: Ben Tyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 v2 0/3] v2 changes 
Date: Mon, 20 Sep 2021 10:05:46 -0500
Message-Id: <20210920150549.6431-1-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qFamFxFwu3saYtX23uSvmehj8rIL-0vZ
X-Proofpoint-ORIG-GUID: qFamFxFwu3saYtX23uSvmehj8rIL-0vZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=449 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200097
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
Cc: Ben Tyner <ben.tyner@ibm.com>, eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ben Tyner <ben.tyner@ibm.com>

patch 1/3 v2: vrm-fault-standby changed to regulator-standby-faulted
patch 2/3 v2: vrm-fault-standby changed to regulator-standby-faulted
patch 3/3 v2: same as v1

Ben Tyner (3):
  ARM: dts: rainier: Define name for gpio line Q2
  ARM: dts: everest: Define name for gpio line Q2
  ARM: dts: everest: Define name for gpio line B6

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++--
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

