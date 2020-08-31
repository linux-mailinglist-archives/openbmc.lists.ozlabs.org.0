Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854325817B
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:02:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKMV5l81zDqHh
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:02:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U9HIVeAX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKLV2BbLzDqJL
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:01:37 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VIWAlP190872; Mon, 31 Aug 2020 15:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hpOUCU7EUJbFrF4hZNNSET1+tpjhogajBbPDQjJ/7HE=;
 b=U9HIVeAX+ZX0i1hgkU8tUQmwst5moU3ctju23JvJKJaZIktNtu4NQ9UprhVLKzDaHSAt
 Fff71UNkzXLJAXpbtRFOAF+7bKlVgoI1YpPiTkLQSMTd8M7oDr9ogLDuXlx11fjPDOgV
 C9h4krn2/CMiUCQ0x98GHX2wO63l1sdpeI68M6icr0tv8KOSZcQopacoEisf0Ng432nG
 9zQBM5ObUuj/VXu/wACqA5yGcYBAHeMjml639jGd2+FzUnAOwlXKJbU28tG8ULvFqC6Y
 yKpnQsSASaYDRpAn7aXTkOV4R/SkXgIgbY+aQvbu/LZz2Kc63IjXE+r9q2jTTP6++KVQ JQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 338xeseuha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:01:33 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIvAE9027021;
 Mon, 31 Aug 2020 19:01:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 337en928mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:33 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1WZX44040522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE4C1AE062;
 Mon, 31 Aug 2020 19:01:32 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E512AE05F;
 Mon, 31 Aug 2020 19:01:32 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/5] AST2600: Boot from eMMC
Date: Mon, 31 Aug 2020 14:01:25 -0500
Message-Id: <20200831190130.47060-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_08:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 impostorscore=0 adultscore=0
 spamscore=2 suspectscore=13 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=160 mlxscore=2 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310108
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series includes the necessary fixes and features to boot SPL
and U-Boot from the eMMC chip for Tacoma and Rainier systems.

Eddie James (5):
  ARM: Aspeed: AST2600: Support booting from eMMC
  spl: mmc: Switch partition error to debug
  mmc: Add support for devicetree parameters for Aspeed controller
  ARM: dts: Aspeed: Tacoma and Rainier: Add eMMC nodes and parameters
  configs: AST2600 Openbmc: Update config for eMMC boot

 arch/arm/dts/ast2600-rainier.dts            |  8 +++
 arch/arm/dts/ast2600-tacoma.dts             |  8 +++
 arch/arm/include/asm/arch-aspeed/boot0.h    |  2 +-
 arch/arm/mach-aspeed/ast2600/board_common.c | 72 +++++++++++++++++++++
 arch/arm/mach-aspeed/ast2600/spl.c          |  9 +--
 common/spl/spl_mmc.c                        |  4 +-
 configs/ast2600_openbmc_spl_defconfig       |  7 +-
 drivers/mmc/aspeed_sdhci.c                  |  2 +
 drivers/mmc/aspeed_sdhci_ic.c               | 16 +++++
 drivers/mmc/sdhci.c                         |  8 +++
 include/configs/aspeed-common.h             |  3 +
 include/mmc.h                               |  1 +
 include/sdhci.h                             |  6 +-
 13 files changed, 132 insertions(+), 14 deletions(-)
 mode change 100755 => 100644 drivers/mmc/aspeed_sdhci.c

-- 
2.26.2

