Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 917EC5267E6
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FTg3qw5z3c9r
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:08:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AtJGuu4l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AtJGuu4l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSW1FW0z3bxZ
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:22 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DFoRsa029622;
 Fri, 13 May 2022 17:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aFN6cwNaH5R4CXoswCIc1hBS7/80I2zcuogTYRlxiHY=;
 b=AtJGuu4lClIOuqDwlwTnoMpCbYMbKp18XLlHjxg8H2EZTJf9zC3xV1O8OHrbtCvaoulx
 c3Xzmf/mtYEUmDFgLomIvvTFGtd+h4tFkbkgYxrhjuvZQulrtt1iqCpmGZW6KUc7KMOK
 1GBqLI6bakboTfaJ7Tbw+h4R5/kJjubLINNjGGmPkSBWzbwbn6cfR9nwqkHJDCq18g1O
 Aexdqjex8EpJO0CCHOVLB7QUueXXvPmJuXmcA3LmAnCQKNhgvQ/hoNn9YiMTdDRS8Bmr
 yBzRtAjob403UvQgNnLU8RE38cOZVd65n7oOIbE13Dy7uUXQmxHfjNUg++c325puV6l8 Ng== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1tay1e60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:18 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGiDHU008239;
 Fri, 13 May 2022 17:07:17 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3fwgdaxhqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7GJx32768298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38F8AAC065;
 Fri, 13 May 2022 17:07:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C517DAC059;
 Fri, 13 May 2022 17:07:15 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 0/9] ast2600: Add I2C TPMv2
 driver
Date: Fri, 13 May 2022 12:07:06 -0500
Message-Id: <20220513170715.43475-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ewh0cdRFVRNLlRY82Jp2rikCFLfaV0iG
X-Proofpoint-GUID: Ewh0cdRFVRNLlRY82Jp2rikCFLfaV0iG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=399 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series backports the addition of a TPM TIS core driver from
mainline u-boot. Then, add an I2C driver to talk to the NPCT75X
chip using the TPM TIS core.
Add the TPM to the Rainier/Everest devicetree.
Also, add new board code for IBM's systems that need to "poison"
the TPM during u-boot initialization.

I tested this on Everest hardware and verified in Linux that the TPM PCR0
was extended. I also tested with the TPM at the wrong bus address to
verify that the code can handle a missing TPM, and I saw no errors.

Changes since v1:
 - Use upstream core for I2C tpm driver. I initially couldn't get the
   core driver to work at all, but found a small bug in the ordering
   of operations in the core init. I also needed to force the locality
   to 0, like in the Linux NPCT75X driver.
 - Use new board init code for IBM's systems that need the TPM poisoning

Eddie James (5):
  tpm: core: Set timeouts before requesting locality
  i2c: ast_i2c: Remove SCL direct drive mode
  tpm: add support for TPMv2.x I2C chips
  arm: dts: ast2600-rainier: Add NPCT75X TPM
  board: ast2600-ibm: Add AST2600 BMC based POWER10+ servers

Heinrich Schuchardt (1):
  tis: fix tpm_tis_remove()

Ilias Apalodimas (1):
  tpm2: Introduce TIS tpm core

Johannes Holland (1):
  tpm: add #ifndef to fix redeclaration build errors

Simon Glass (1):
  tpm: Add more TPM2 definitions

 arch/arm/dts/ast2600-rainier.dts     |  12 +-
 arch/arm/mach-aspeed/ast2600/Kconfig |   7 +
 board/aspeed/ast2600_ibm/Kconfig     |  13 +
 board/aspeed/ast2600_ibm/Makefile    |   1 +
 board/aspeed/ast2600_ibm/ibm.c       |  46 +++
 configs/ast2600_ibm_defconfig        | 137 ++++++++
 drivers/i2c/ast_i2c.c                |   2 +-
 drivers/tpm/Kconfig                  |   9 +
 drivers/tpm/Makefile                 |   1 +
 drivers/tpm/tpm2_tis_core.c          | 470 +++++++++++++++++++++++++++
 drivers/tpm/tpm2_tis_i2c.c           | 171 ++++++++++
 drivers/tpm/tpm_tis.h                | 138 ++++++++
 include/tpm-v2.h                     |  32 ++
 13 files changed, 1033 insertions(+), 6 deletions(-)
 create mode 100644 board/aspeed/ast2600_ibm/Kconfig
 create mode 100644 board/aspeed/ast2600_ibm/Makefile
 create mode 100644 board/aspeed/ast2600_ibm/ibm.c
 create mode 100644 configs/ast2600_ibm_defconfig
 create mode 100644 drivers/tpm/tpm2_tis_core.c
 create mode 100644 drivers/tpm/tpm2_tis_i2c.c

-- 
2.27.0

