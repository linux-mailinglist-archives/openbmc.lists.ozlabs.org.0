Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC31527B643
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 22:28:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Yy82xsCzDqQt
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 06:28:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WdcUNAKe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0YxG71BczDqMw
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 06:28:02 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SKPEfB193294; Mon, 28 Sep 2020 16:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NrB3Ez/A0uiWlEySsdJhTYgXhtVIiOAJJfLnW8BH2XA=;
 b=WdcUNAKefl8G6C3dG2nPWh7TK1gEQlAWKt4/sEi7/iO+usF/BurHNya2ArakY/ZPVpn1
 US+0FPNcdmoGMFL2wyX7DU7ePJWbs7wYp7tMaTK9KtaN0uiB4m5xQznmL+77d7h3Ls6g
 nKlCGSSibJQZkcWJXyjAwkJt9ZOR/DHmjH4f0tx/JbAOaX5JolcSc7ZQD1GcB1YEi7yj
 kqV7rrtAH5qrRKi+95MorKwnj3xbXfYU5QuOA6IGDm+iBcEyjInS0Uv9q8mOl0P5372i
 9ym+uyD9HmtDbZlwLj7Wi7YAMVM1KdeWp9Lp3AN0K5r0Akr4Wu8h79DAPuF2FCAUUNmh 3A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33upcq8v7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:27:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SKM2gj020429;
 Mon, 28 Sep 2020 20:27:57 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 33sw98unr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 20:27:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SKRulW50397634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 20:27:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8EB4B2065;
 Mon, 28 Sep 2020 20:27:56 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E69BB205F;
 Mon, 28 Sep 2020 20:27:56 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.158.203])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 20:27:56 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 0/3] Aspeed: Support eMMC boot
Date: Mon, 28 Sep 2020 15:27:50 -0500
Message-Id: <20200928202753.58351-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_20:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=13
 mlxlogscore=420 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009280148
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

Add support to boot from the eMMC on AST2600 systems. Include the necessary
devicetree entries for Tacoma and Rainier machines.

Eddie James (3):
  ARM: dts: Aspeed: Tacoma and Rainier: Add eMMC nodes and parameters
  arch: ARM: Aspeed: Add SPL eMMC partition boot support
  configs: Add AST2600 SPL eMMC configuration

 arch/arm/dts/ast2600-rainier.dts           |   8 ++
 arch/arm/dts/ast2600-tacoma.dts            |   8 ++
 arch/arm/mach-aspeed/Kconfig               |   7 ++
 arch/arm/mach-aspeed/ast2600/spl_boot.c    |   9 +-
 configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
 include/configs/aspeed-common.h            |   6 +
 6 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig

-- 
2.26.2

