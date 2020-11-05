Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DE2A87C6
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:13:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRvpV73KdzDqlP
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 07:13:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VdeImvQz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRvkM45RxzDqnT
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 07:09:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5K6nHj087235; Thu, 5 Nov 2020 15:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ypuVaVHb7w5Z/IAgn0ew8b7qQ2m4mdeHFrRPN9ezq5M=;
 b=VdeImvQzPwf1qkkBTEzCBJboyvHVmJZnmCg/ab/ITL5rhibY0+GoF38pSIgfDbprRRyr
 k8gp5p6Jq8eOViiuIoSL6iHTezp2Mfa6ESJkO8wNojBLJiSMrL9UhEtNIGneuMSdNBU0
 B1Gd878ae7hbBBK9KF/9vo7XRiJ/WlATLs/jgYYgQa80WXfXVb0wbCRLLLKQHOVqU50S
 XPWXHFwaeXYq/LjkJcexzymhFCvTy8LG8mBueW65X6/3m44SUW2YRpicRCbZ/a1+KPO9
 iQTLQNjTe914lATqze8COTWB6VAxG1wrE2MZjBHEmMHZ0tR3SLmdtfNd5pg+hfA92yKz Zg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m903yykm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 15:09:25 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5K1qsw015122;
 Thu, 5 Nov 2020 20:09:25 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 34h0ej9wf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 20:09:25 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5K9ImS1049122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 20:09:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B176B136061;
 Thu,  5 Nov 2020 20:09:23 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 195AC136051;
 Thu,  5 Nov 2020 20:09:22 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.160.108.47])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 20:09:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/3] Aspeed: Support eMMC
 boot
Date: Thu,  5 Nov 2020 14:09:17 -0600
Message-Id: <20201105200920.51226-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_14:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=573 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=13
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050129
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

Changes since v2:
 - Add back correct SPI_SIZE so that systems can boot from NOR as well.

Changes since v1:
 - Update commit messages and Kconfig descriptions.

Eddie James (3):
  ARM: dts: Aspeed: Tacoma and Rainier: Add eMMC nodes and parameters
  arch: ARM: Aspeed: Add SPL eMMC partition boot support
  configs: Add AST2600 SPL eMMC configuration

 arch/arm/dts/ast2600-rainier.dts           |   8 ++
 arch/arm/dts/ast2600-tacoma.dts            |   8 ++
 arch/arm/mach-aspeed/Kconfig               |   8 ++
 arch/arm/mach-aspeed/ast2600/spl_boot.c    |   9 +-
 configs/ast2600_openbmc_spl_emmc_defconfig | 130 +++++++++++++++++++++
 include/configs/aspeed-common.h            |   6 +
 6 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 configs/ast2600_openbmc_spl_emmc_defconfig

-- 
2.26.2

