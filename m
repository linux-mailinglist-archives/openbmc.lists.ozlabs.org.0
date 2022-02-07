Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516574AC336
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsqkH01CXz30Qq
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IEaMu7Gr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IEaMu7Gr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsqdc5Jbtz2xKK
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:22:44 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217Er0vY016619; 
 Mon, 7 Feb 2022 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3NefPa3LoAXb1StB76FFhWGXblz/95MEFoTmoVMQHJo=;
 b=IEaMu7Gr4CAABxtgU7BSWW3zcBbdGf8Igr3iJoyBXFGOS3mZUfo4o8yPJuBtJdMAsrFY
 ESQZiPx4+H8PioxSAAo6Q0D5+UytDB1rjGKpgDg/b+vON3BrKDTnvh0hVPYpLxPznJTs
 G7v3GVlbuSLHFCk0QGcGQFhL5Tf7HSxaqyI6ErRaplmenrvr+NlUu95K6J4JCpJANnEx
 XtwwUYqXjhcdKug+kzAwjAKMTK2FMTa4MtjQC9OoILENgRroqKMFgLuA9WApRiurC0b8
 QIuzav1VxQG4qHc/h+so8kkVe3Tqn0aYgEyD+qnGrVmzcbF5vW6+JFfsGGC4o7TGQSdU mg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e22kpyfxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:41 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217FDpcY017522;
 Mon, 7 Feb 2022 15:22:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3e1gvafc8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FMXIY19988866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:22:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6250DC6063;
 Mon,  7 Feb 2022 15:22:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E8C0C6065;
 Mon,  7 Feb 2022 15:22:33 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 15:22:33 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-oepnbmc v3 0/6] Add GPIO hog support
Date: Mon,  7 Feb 2022 09:22:26 -0600
Message-Id: <20220207152232.25745-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: azk1sU0IP5vYh_PVtUr73kxpzX3NGq2t
X-Proofpoint-ORIG-GUID: azk1sU0IP5vYh_PVtUr73kxpzX3NGq2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=819 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070097
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

This series adds support for GPIO hogging based on upstream patches.
I added additional support for hogging in the SPL, and enabled this
for the AST2600 rainier openbmc platform.

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
 drivers/gpio/gpio-uclass.c                 | 230 +++++++++++++++++++--
 include/asm-generic/gpio.h                 |  34 +++
 include/dm/uclass-id.h                     |   1 +
 test/dm/Makefile                           |   1 +
 test/dm/nop.c                              |  73 +++++++
 13 files changed, 444 insertions(+), 17 deletions(-)
 create mode 100644 test/dm/nop.c

-- 
2.27.0

