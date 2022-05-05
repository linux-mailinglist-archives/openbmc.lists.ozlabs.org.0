Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8D51CA94
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 22:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvQJr34vCz3bw7
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 06:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h1f2cF9Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h1f2cF9Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQJT32Hwz3brn
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 06:28:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245KDuN5028050;
 Thu, 5 May 2022 20:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=xZSMCqZoMqvM0T/KhwOnjTNq2yKQ0AoMEsDEUjK4FLQ=;
 b=h1f2cF9YIkOF0J5QZpfp/Y/dqrnJgrytAzZDxHNIAkHnxSamnbh6j39i7W2Vct45evl6
 GBsYogUX92INrGGar2E5Cou6ZqoDuh/HFGj3vgmqtlbCXNXeimcI8sPIGTDHACArf5bk
 iJSJ19R5Ig3oGEff8rC7n7qPvnRJ4hYJv5aEyhU/DPAP3Ptg5ZsQczNLSrwQ10tHsa3f
 3Nb5oUrE2w2ConmDjj4VNyAtbrYGYkdAsB9NsTWe7EyEyWI+52202qFluJPnTjP6OyVb
 vFbuLnIC//QWCyKYQuycSZDlpk55E3jcd8ZyofyB6afbcj9G2oWEE3iyoCn/cG2uWMRT nQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvne507yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:37 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245KMUqH000676;
 Thu, 5 May 2022 20:28:37 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3frvramw8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:36 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245KSZkb22741416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 20:28:35 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1118136053;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65A8A13605D;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.0.208])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 20:28:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/5] ast2600: Add I2C TPMv2
 driver
Date: Thu,  5 May 2022 15:28:24 -0500
Message-Id: <20220505202829.31466-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W6S9bfwCerZUme-pRdA55dSVKtZiz9nl
X-Proofpoint-GUID: W6S9bfwCerZUme-pRdA55dSVKtZiz9nl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_08,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=413 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050132
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

This series fixes the AST2XXX I2C driver to work with clock-stretching
devices and adds a TPMv2 driver for the NPCT75X device. Enable the TPM on
the Rainier system and add a board init function to write PCR0 of the TPM.

Eddie James (5):
  i2c: ast_i2c: Remove SCL direct drive mode
  tpm: Add I2C driver for TPMv2 devices
  arm: dts: ast2600-rainier: Add NPCT75X TPM
  configs: ast2600_openbmc_spl_emmc: Enable TPMv2 over I2C
  aspeed: Add board_late_init to write TPM

 arch/arm/dts/ast2600-rainier.dts           |  12 +-
 board/aspeed/evb_ast2600/evb_ast2600.c     |  34 ++
 configs/ast2600_openbmc_spl_emmc_defconfig |   3 +-
 drivers/i2c/ast_i2c.c                      |   2 +-
 drivers/tpm/Kconfig                        |   9 +
 drivers/tpm/Makefile                       |   1 +
 drivers/tpm/tpm2_tis_i2c.c                 | 593 +++++++++++++++++++++
 7 files changed, 647 insertions(+), 7 deletions(-)
 create mode 100644 drivers/tpm/tpm2_tis_i2c.c

-- 
2.27.0

