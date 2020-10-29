Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD029E27E
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:15:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM8Dq0tn4zDqW3
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 13:15:55 +1100 (AEDT)
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
 header.s=pp1 header.b=hkLnXHOL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM8Cs52r0zDqKg
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 13:15:04 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T22Emr035060; Wed, 28 Oct 2020 22:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NvsvH1bjwazH7g2O1a5N/XZLPVLK/NWEgHg5aBfRCQo=;
 b=hkLnXHOL3BNm+N5Ia+rJmFTzaQHPSKjcnSbdslUhhhe+CM/dGU5DDLLPsvefRIdnLIJ/
 oWOjXFi17RmIHM9MsSnTd7qi2j/FKpb6PiAUXcVv3e9bkFccW+ghwMUrtKyIUlYlCN8u
 Jp5G1ha05zxuXJnUKsgk59pOKWwFNiW0TGz3/qfQG7brFeeBNttA7qnbjgX5DUfszpU+
 mbFubkPH46a0Y+bRSYyrttxztLWyyGsOOPS6qd4WNMk+dvLsbF14ZuIC+/Bvt8cQtEUJ
 ZL5VDH2MlLDhhek8DVuotnHTnEbPDg3hvvppZdgN0MDzWONQH2XnV4RMq6NWoNKv6vhF WA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34fa6pn0r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 22:15:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T2BRt6005085;
 Thu, 29 Oct 2020 02:15:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 34ff5faadb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 02:15:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T2ExJj49152336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 02:14:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF476A04F;
 Thu, 29 Oct 2020 02:14:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D011E6A047;
 Thu, 29 Oct 2020 02:14:58 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.85.168.238])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 02:14:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc v2 0/3] Aspeed: Support eMMC
 boot
Date: Wed, 28 Oct 2020 21:14:47 -0500
Message-Id: <20201029021450.12118-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=13 lowpriorityscore=0 mlxlogscore=596
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290007
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

Changes since v1:
 - Update commit messages and Kconfig descriptions. Also remove the
   unecessary SPI_SIZE config option

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

