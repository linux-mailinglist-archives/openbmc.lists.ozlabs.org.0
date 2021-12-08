Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02A46DBEE
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8Rlk0cVjz2xB8
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ztq/GktJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ztq/GktJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8RlL2kQlz2xfN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:18:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8IQrLI000929; 
 Wed, 8 Dec 2021 19:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=pPZaEGPFhL3aHvIWmJjqWre4KaVz6YHVe0QjA7OGyno=;
 b=Ztq/GktJ+WMM4IdyogfG/156tpdH938z73O76wuCqKBKw1d4YuFXGOpzJBH0iMlqgT5Z
 Y/S1Afsh85HS1Wku+XKhvAIQUPJm2+OYdGKcIWqUIf1wnOPnj2IKe2CerPTuSv0+Ex7q
 6+gFhxY0+xygkH8bcu+bnCqoSoE8uZGjHVEDNxcEbAqtTi4Tn+9EET5KVYKbFo0WkuQV
 Y8Qlv77H90wqvIVTk5sDhnRSn4EuenMnb1/JQbC2BDY1+pkrA1Irs2bNuLpMaud05Exf
 sGI0U7ylOzg2nnH3WAhz6kMS/oYTLOCwdQvpz5HHFz3coULPvM3Amay+FUmh77Hte/Y2 OA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu1gp9mrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:02 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDsV6003125;
 Wed, 8 Dec 2021 19:18:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3cqyycv5f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 19:18:01 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JI0Mi45679058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 19:18:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECE13B2070;
 Wed,  8 Dec 2021 19:17:59 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60E1FB206C;
 Wed,  8 Dec 2021 19:17:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.84.65])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 19:17:59 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 0/7] Add tpm i2c ptp driver
Date: Wed,  8 Dec 2021 13:17:51 -0600
Message-Id: <20211208191758.20517-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9aYHTja98IZUjae190U-CWUyjHE2q6y8
X-Proofpoint-ORIG-GUID: 9aYHTja98IZUjae190U-CWUyjHE2q6y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=787 phishscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080108
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

This is the latest (v19) series that's been sent upstream. There is need
for it on OpenBMC systems now and it's working well, so I'm sending it for
inclusion in dev-5.15.
I also added the TPM to the two P10 IBM systems devicetrees.

Amir Mizinski (5):
  tpm_tis: Fix expected bit handling
  tpm: tpm_tis: Rewrite "tpm_tis_req_canceled()"
  tpm: tpm_tis: Verify TPM_STS register is valid after locality request
  tpm: tpm_tis: Add tpm_tis_i2c driver
  tpm: Add YAML schema for TPM TIS I2C options

Eddie James (2):
  ARM: dts: aspeed: Rainier: Add TPM device
  ARM: dts: aspeed: Everest: Add TPM device

 .../bindings/security/tpm/tpm-tis-i2c.yaml    |  52 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |   5 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   5 +
 drivers/char/tpm/Kconfig                      |  12 +
 drivers/char/tpm/Makefile                     |   1 +
 drivers/char/tpm/tpm_tis_core.c               |  72 +++--
 drivers/char/tpm/tpm_tis_i2c.c                | 263 ++++++++++++++++++
 7 files changed, 371 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/security/tpm/tpm-tis-i2c.yaml
 create mode 100644 drivers/char/tpm/tpm_tis_i2c.c

-- 
2.27.0

