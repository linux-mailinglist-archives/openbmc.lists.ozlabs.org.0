Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D929E283
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:18:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM8Hq3zjzzDqZH
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 13:18:31 +1100 (AEDT)
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
 header.s=pp1 header.b=Ew1v6eV2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM8Cz0Ck3zDqLW
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 13:15:10 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T25b9u115340; Wed, 28 Oct 2020 22:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0qfsrBIcYKc7Yjnf9/pW9LH41c6gFMnHru//QmW3GYI=;
 b=Ew1v6eV2lKafrX7q+RzjlSe6KmR04xAPzgazNRfQQ7dHyFXoTsQ7ZT9o1yFt08IXOnkn
 9aCfZhnP6H52ZVIS7RJELOhAF9p1S7usPufWmrhS4joMkCPhLCyZKKiEL/TNmCtYs0b1
 JPg+739Mpp/aXcMqJPsZ7YeVgIScB3Os4nXn2dkgotE+3uB08hOZfuu9PkDNayrCxcL4
 J6XkjOgfFOYm90h6pJIISL4VslmHjslk+27D2SMLnAufQKVCv2Uudr7E+Vop4eBXL9bQ
 xbS1Idk99dR/frzrN2JFE5Ry/tnkTNUpZjaeYU4nGUwt5YTS7bWFo/uq0TYJEvGmhL7A sg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ew3jw0rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 22:15:08 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T2Ba44022906;
 Thu, 29 Oct 2020 02:15:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 34cbw9cypn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 02:15:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T2F6gV43844088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 02:15:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250D46A054;
 Thu, 29 Oct 2020 02:15:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A24516A047;
 Thu, 29 Oct 2020 02:15:05 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.85.168.238])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 02:15:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc v2 2/3] arch: ARM: Aspeed: Add
 SPL eMMC partition boot support
Date: Wed, 28 Oct 2020 21:14:49 -0500
Message-Id: <20201029021450.12118-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029021450.12118-1-eajames@linux.ibm.com>
References: <20201029021450.12118-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=944 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=13 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290007
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

Support loading U-Boot from a specific partition on the eMMC
device. Add a config option to specify the partition number in
the eMMC device (not the user data partition) where the U-Boot
image is located.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig            | 8 ++++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c | 9 ++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 06f14f4f55..44d392a706 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -90,6 +90,14 @@ config ASPEED_UBOOT_MMC_BASE
 	  The base block number of the U-Boot
 	  image in the eMMC device
 
+config ASPEED_UBOOT_MMC_PART
+	int "U-Boot eMMC partition"
+	default 0
+	help
+	  The partition number of the U-Boot
+	  image in the eMMC device. This is not
+          the user data partition number.
+
 config ASPEED_UBOOT_MMC_SIZE
 	hex "U-Boot eMMC size in blocks"
 	default 0x0
diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
index b08c49d204..58a22f646e 100644
--- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
+++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
@@ -46,8 +46,8 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
 	int err;
+	int part = CONFIG_ASPEED_UBOOT_MMC_PART;
 	u32 count;
-
 	struct mmc *mmc = NULL;
 	struct udevice *dev;
 	struct blk_desc *bd;
@@ -78,6 +78,13 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 
 	bd = mmc_get_blk_desc(mmc);
 
+	if (part) {
+		if (CONFIG_IS_ENABLED(MMC_TINY))
+			err = mmc_switch_part(mmc, part);
+		else
+			err = blk_dselect_hwpart(bd, part);
+	}
+
 	count = blk_dread(bd, CONFIG_ASPEED_UBOOT_MMC_BASE, CONFIG_ASPEED_UBOOT_MMC_SIZE,
 			(void *)CONFIG_ASPEED_UBOOT_DRAM_BASE);
 	if (count != CONFIG_ASPEED_UBOOT_MMC_SIZE) {
-- 
2.26.2

