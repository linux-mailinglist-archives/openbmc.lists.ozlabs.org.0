Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202034ACC88
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 00:14:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt26H58M4z3bV6
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:14:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mTO2hFNa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mTO2hFNa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt2551zRyz2ynt
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 10:13:44 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217LGEL7003263; 
 Mon, 7 Feb 2022 23:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QvtM4nBF5iLjL0zcSke35DA3H+Wzim/SwRoImdrP2ZA=;
 b=mTO2hFNajVDumBqk4bbzubs+2WTCSFD7u/QYLhqqjxJZhhsa83ouNgln8ZRXthcYd7Dk
 X0Qh3ZWUrBb3xARKwNlXlHY/FsbLao0+nPwlOqX2DtioT/PKA5DtxtYKLcTxg0AEOW5i
 zp9bdwCVplMuCKoNBtBRzeVWySwoTxzTED54uD568SVd9nLTZ1hsbxhoxyEhJQmnEvOe
 Edvb1rHmBIKWXZ9yisgpNJaCuzDyXEIhqgKG7A+TbEn2DytHcaDLtNch1UY5ve38FVG0
 HyZh8QAXe005RNm8QenO5ifWvej/afQQ4fsBP5wEwx6c1zbHg1rW/rfpQOKzPw5zNWWj 4w== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e355ak9aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217NBf2U003704;
 Mon, 7 Feb 2022 23:13:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3e1gva0ndr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217NDaa923068974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 23:13:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32132AE063;
 Mon,  7 Feb 2022 23:13:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76361AE060;
 Mon,  7 Feb 2022 23:13:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 23:13:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 0/6] Add GPIO hog support
Date: Mon,  7 Feb 2022 17:13:28 -0600
Message-Id: <20220207231334.59845-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ynd263kjxId3mFwD-KvoV99D2Bhd5yIh
X-Proofpoint-ORIG-GUID: ynd263kjxId3mFwD-KvoV99D2Bhd5yIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=670 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070126
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for GPIO hogging based on upstream patches.
I added additional support for hogging in the SPL, and enabled this
for the AST2600 rainier openbmc platform.

Changes since v3:
 - Update SPL hog support patch with Simon's suggestions today.

Changes since v2:
 - Sorry for the spam; I missed a change in the SPL patch from pulling
   my changes back from upstream.

Changes since v1:
 - Add some tags to cherry-picked commits
 - Make changes from upstream review for the SPL hogging patch

Eddie James (3):
  gpio: Enable hogging support in SPL
  Add GPIO hogging support for AST2600 openbmc config
  ast2600: Add GPIO controller and hog TPM reset pin

Heiko Schocher (2):
  gpio: add gpio-hog support
  gpio: fixes for gpio-hog support

Jean-Jacques Hiblot (1):
  dm: Add a No-op uclass

 arch/arm/dts/ast2600-rainier.dts           |  11 +
 arch/sandbox/dts/test.dts                  |  12 ++
 common/board_r.c                           |   6 +
 common/spl/spl.c                           |   4 +
 configs/ast2600_openbmc_spl_emmc_defconfig |   4 +-
 doc/device-tree-bindings/gpio/gpio.txt     |  60 ++++++
 drivers/core/uclass.c                      |   5 +
 drivers/gpio/Kconfig                       |  20 ++
 drivers/gpio/gpio-uclass.c                 | 228 +++++++++++++++++++--
 include/asm-generic/gpio.h                 |  34 +++
 include/dm/uclass-id.h                     |   1 +
 test/dm/Makefile                           |   1 +
 test/dm/nop.c                              |  73 +++++++
 13 files changed, 442 insertions(+), 17 deletions(-)
 create mode 100644 test/dm/nop.c

-- 
2.27.0

