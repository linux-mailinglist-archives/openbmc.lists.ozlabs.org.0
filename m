Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6D25818B
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:07:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKSn2fQHzDqTY
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:07:05 +1000 (AEST)
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
 header.s=pp1 header.b=V/hup+3b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKLg2TNTzDqVN
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:01:47 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VIhPUU153719; Mon, 31 Aug 2020 15:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pcuxCNFkmHKEer+QJavdi9s+gtQ7/gRphTaiCiheaaE=;
 b=V/hup+3bW7woIepVAHIuuLDB+yf68QzL8brXB04BaGD074/rcVc5iu782ef6nzymQubr
 IgJmcM72RD56t97fBPrXXB3zk5mpXVuy7krHGE3jPkKL6S1Sn4sWtejFgsPw+IhzyibH
 DL41K17M5K5GmzH75pLBw8dTktqJ5YzDYoDTUnjwqApyX9fpq0/mLaZlhZT2VLENth3L
 L3zH8J/3TTcDM9RZz8gp9NOy+v2VcE6NkiB9xkB/wb21JFZKMFjwFIG3jRaeLXm16bJo
 Pib2omyCziHRkGf/C52ORsPGz5PU3Ykgz/PEssW7uARepkb5vYhLCNFPH2GpiX5tIHyU 6w== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3396qv8dvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:01:44 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIuooj007808;
 Mon, 31 Aug 2020 19:01:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 337en9a6mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1hnd16122390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3799CAE05F;
 Mon, 31 Aug 2020 19:01:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B89B6AE05C;
 Mon, 31 Aug 2020 19:01:42 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 5/5] configs: AST2600 Openbmc:
 Update config for eMMC boot
Date: Mon, 31 Aug 2020 14:01:30 -0500
Message-Id: <20200831190130.47060-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831190130.47060-1-eajames@linux.ibm.com>
References: <20200831190130.47060-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_09:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=543 phishscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 suspectscore=15 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310110
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

Set some additional parameters to boot eMMC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 configs/ast2600_openbmc_spl_defconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
index c2e3393708..86e3ea289d 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -3,9 +3,10 @@ CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_POSITION_INDEPENDENT=y
 CONFIG_SPL_SYS_THUMB_BUILD=y
+CONFIG_ENABLE_ARM_SOC_BOOT0_HOOK=y
 CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
-CONFIG_SYS_TEXT_BASE=0x10000
+CONFIG_SYS_TEXT_BASE=0x8b000000
 CONFIG_ASPEED_AST2600=y
 CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
@@ -33,8 +34,9 @@ CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_ARCH_EARLY_INIT_R=y
 CONFIG_SPL_SEPARATE_BSS=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
-CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x0
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=1
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
@@ -80,6 +82,7 @@ CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_REGMAP=y
 CONFIG_SYSCON=y
+CONFIG_SPL_OF_TRANSLATE=y
 CONFIG_CLK=y
 CONFIG_SPL_CLK=y
 CONFIG_DM_GPIO=y
-- 
2.26.2

