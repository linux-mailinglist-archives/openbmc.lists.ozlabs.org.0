Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3FE7BBDBE
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:29:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qLg7uVXz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FmB5gjRz3dwr
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:29:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qLg7uVXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2FkX3RyNz3cV4
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:28:04 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HFVmL020340;
	Fri, 6 Oct 2023 17:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bUySupIf1ysIUbgasg030TXoLPUwpM9OdZsPlvNVz7U=;
 b=qLg7uVXz1XtaYSdWuNZuG9VKGc1xn6HNR7qtApG+2ripDL/ofS8ohsQbhgfcAaeii2SO
 RZAtp+XJ/wCs0tYEEvigdvlRPSBaFOOIYRqO7eHW8heTQuKiwj8WELTOY2zfboScIwgP
 ufK8n/s89hDur0OXcckPqz30KB0DM0L4DE9Uxv1nYVNesOgEqiwzyR3R1d6kZJfsZr5n
 PY5xFagmCpFehfABUVMNr/5ToI7s3Qb3UQgzPDvbJkvurtPNV/58DP4m2p33A4lj86dI
 uACuOx6edOcQ4w1/5Muiyn8KHiBH7zLrNGkTEYWQhioAPAu6xqw2cNvwTIIgClVIqviX GQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjpftrd11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:27:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396GxgK4007512;
	Fri, 6 Oct 2023 17:27:56 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3teygn2c3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:27:56 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396HRt1v11338158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 17:27:55 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4FBE5805C;
	Fri,  6 Oct 2023 17:27:55 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D39F5805B;
	Fri,  6 Oct 2023 17:27:55 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.60.170])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 17:27:55 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 0/4] ARM: dts: aspeed: p10bmc: Add fan controller properties
Date: Fri,  6 Oct 2023 12:27:31 -0500
Message-Id: <20231006172735.420566-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2Ymv5fULHzo4gNxz-Ui0xd108BCMHp1O
X-Proofpoint-GUID: 2Ymv5fULHzo4gNxz-Ui0xd108BCMHp1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=566 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060130
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

Now that the max31785 driver can parse the relevant properties, update
the device trees with the necessary properties.

Eddie James (4):
  ARM: dts: aspeed: Rainier: Add fan controller properties
  ARM: dts: aspeed: Everest: Add fan controller properties
  ARM: dts: aspeed: Bonnell: Add fan controller properties
  ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties

 .../dts/aspeed/aspeed-bmc-ibm-bonnell.dts     | 14 +++++++
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 28 +++++++++++++
 .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++
 .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
 4 files changed, 108 insertions(+)

-- 
2.39.3

