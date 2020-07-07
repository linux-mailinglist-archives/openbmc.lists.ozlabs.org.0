Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F24217850
	for <lists+openbmc@lfdr.de>; Tue,  7 Jul 2020 21:52:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Y4Z4lRHzDqwV
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 05:52:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Y3V677tzDqLK
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 05:51:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067JWrNR116703; Tue, 7 Jul 2020 15:51:24 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 324faqcx50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 15:51:24 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 067JiJ97005524;
 Tue, 7 Jul 2020 19:51:24 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 324qfuubxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 19:51:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 067JpNtL49676582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 19:51:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9287CAC05F;
 Tue,  7 Jul 2020 19:51:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A2C3AC05E;
 Tue,  7 Jul 2020 19:51:23 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jul 2020 19:51:23 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] config: ast2600 openbmc: Move
 environment to eMMC
Date: Tue,  7 Jul 2020 14:51:20 -0500
Message-Id: <1594151480-35541-1-git-send-email-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_13:2020-07-07,
 2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070131
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

The ast2600_openbmc_spl_defconfig is intended to run on eMMC
instead of NOR. Move the environment to eMMC and configure
it as a redundant environment. The location is the first
partition of the User Data area (mmcblk0p1).

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/ast2600_openbmc_spl_defconfig | 10 ++--------
 include/configs/evb_ast2600a1_spl.h   |  6 ++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
index c2e3393..f47abbc 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -15,7 +15,7 @@ CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x10000
-CONFIG_ENV_OFFSET=0xE0000
+CONFIG_ENV_OFFSET=0x0
 CONFIG_SPL=y
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
@@ -69,13 +69,7 @@ CONFIG_CMD_FS_GENERIC=y
 CONFIG_CMD_MTDPARTS=y
 CONFIG_EFI_PARTITION=y
 CONFIG_SPL_OF_CONTROL=y
-CONFIG_ENV_IS_IN_SPI_FLASH=y
-CONFIG_USE_ENV_SPI_BUS=y
-CONFIG_ENV_SPI_BUS=0
-CONFIG_USE_ENV_SPI_CS=y
-CONFIG_ENV_SPI_CS=0
-CONFIG_USE_ENV_SPI_MAX_HZ=y
-CONFIG_ENV_SPI_MAX_HZ=100000000
+CONFIG_ENV_IS_IN_MMC=y
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_REGMAP=y
diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index faefbc9..7351207 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -36,4 +36,10 @@
 #define CONFIG_SPL_BSS_START_ADDR	0x90000000
 #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
 
+/* MMC */
+#ifdef CONFIG_ENV_IS_IN_MMC
+#define CONFIG_SYS_MMC_ENV_DEV		0
+#define CONFIG_ENV_OFFSET_REDUND	0x10000
+#endif
+
 #endif	/* __CONFIG_H */
-- 
1.8.3.1

