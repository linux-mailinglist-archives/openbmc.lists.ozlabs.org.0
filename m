Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9A498BFA
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjKWk1727z3bTT
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 06:18:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VTZqBZCe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VTZqBZCe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjKSH1XBzz2xtp
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 06:15:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OIkdJj026105; 
 Mon, 24 Jan 2022 19:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=68Bm+X8NzD9jAxsNxxLNLNM54K+4dwdAI91zSDI0u9o=;
 b=VTZqBZCeijTt/0HTqG9mn/Wp/jntg3yL9KSe8RK2aApM8ZJTVE5w5FsXNlPgx0g+nb60
 wKbRRXWfpQWPhBosmDiVNBk29y460brI0+CFvpD+8mRK6ypWcPvZ6nuw69o0tsFguQ86
 TQXq9F7lUE0UuQZtetVKxPXvVL7lv5oWVbMa5ZD8Gr3Y++8xouzC054T34u6eXtQrHyE
 sjLcg4ewUPap5qsY2Cp4QVOBPuvrUYIdGgjk9HkmQEx1wPQXuMo9gyT62URoB3FiCTQ+
 7fYOT8BIsecBhMpXsO4c5GVAygBVtA4YHcAixno7UWDCvE3F6CXpk+/rDW5A+yAO+i1Y MQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt1pj8mgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:06 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ79GB021984;
 Mon, 24 Jan 2022 19:15:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3dr9j9p6qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OJF4pS18481538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 19:15:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94C40C605B;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A5C5C6069;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.14.245])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 0/6] Add GPIO hog support
Date: Mon, 24 Jan 2022 13:14:57 -0600
Message-Id: <20220124191503.88452-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 48NnBiy5d_2X6XBlNnphKMIS2Oquixwz
X-Proofpoint-ORIG-GUID: 48NnBiy5d_2X6XBlNnphKMIS2Oquixwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=816 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240125
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
for the AST2600 "rainier" openbmc platform.

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
 common/spl/spl.c                           |   7 +
 configs/ast2600_openbmc_spl_emmc_defconfig |   4 +-
 doc/device-tree-bindings/gpio/gpio.txt     |  60 ++++++
 drivers/core/uclass.c                      |   5 +
 drivers/gpio/Kconfig                       |  20 ++
 drivers/gpio/gpio-uclass.c                 | 230 +++++++++++++++++++--
 include/asm-generic/gpio.h                 |  34 +++
 include/dm/uclass-id.h                     |   1 +
 test/dm/Makefile                           |   1 +
 test/dm/nop.c                              |  73 +++++++
 13 files changed, 447 insertions(+), 17 deletions(-)
 create mode 100644 test/dm/nop.c

-- 
2.27.0

