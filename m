Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9C944E0E
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 16:30:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qqoMTc0G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZWbb2k2Rz3dSX
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 00:30:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qqoMTc0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZWb30NPdz30Wc
	for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2024 00:30:22 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471CKLfT007827;
	Thu, 1 Aug 2024 14:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=N146UpkL8tM5pCioUEur+h796Y
	+HDpCro+NzQJFeLQ4=; b=qqoMTc0G2GilO25Um3cB5pD+nbHf60J9CYIqlftmXS
	19pmYcZ1pfXn5qU5SKmzc01eqnLLr7S6DOTQBOUAyMCcv4QcMapRPCdaVp5TmW8K
	7lUQNgzeirqEUeRjXqTJ8zu0q6sY/1YTlyvu8r20AT63fjSKDfIDOw2OHTDNiCcV
	oFSHD6Y6wDoXLB1VbVrAXENwEATeSog2dMtjG818RLAxU7Sm6+gNRenAJ0rfnl7A
	NQFCvJRMkJOLJKNqDm0fNV/WYIyRI8S8j8Xp3BUYAJaXPBnSlTQNHB8L7OP4xrli
	7pNP2FekI0gyoeDsaSIZvCNWEA1NsDZrZf4/Qz9ygiRg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40r3tpsaba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:30:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 471BnKv9018969;
	Thu, 1 Aug 2024 14:30:11 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nc7q27w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:30:11 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 471EU86r18416230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2024 14:30:10 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 007C758077;
	Thu,  1 Aug 2024 14:30:08 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 860A858067;
	Thu,  1 Aug 2024 14:30:07 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Aug 2024 14:30:07 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v2 0/1] ARM: dts: aspeed: system1: IBM System1
Date: Thu,  1 Aug 2024 09:30:01 -0500
Message-ID: <20240801143004.993503-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ec2DY66G4_E9z22mrX17dXwIiG-mWjsA
X-Proofpoint-ORIG-GUID: Ec2DY66G4_E9z22mrX17dXwIiG-mWjsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_12,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=713 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408010093
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
Cc: Ninad Palsule <ninad@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Please review the version 2 of the patch.

This patch only applies to openbmc/linux. The max31785 pmbus driver
changes are not available in the upstream yet. I will try to send those
changes upstream along with documentation changes.

v2:
--
  - Removed the extra whitespace

Ninad Palsule (1):
  ARM: dts: aspeed: system1: IBM System1 BMC update

 .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)

-- 
2.43.0

