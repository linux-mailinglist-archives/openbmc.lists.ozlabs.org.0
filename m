Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369027B64D
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 22:31:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Z0w3p3rzDqQt
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 06:31:12 +1000 (AEST)
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
 header.s=pp1 header.b=iEH5g5V4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0YxK2t0dzDqMw
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 06:28:04 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SKP4jc075528; Mon, 28 Sep 2020 16:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/f16gvLRu20J38dfpQnC2cYgj93F/7pFIR4xBrNFseM=;
 b=iEH5g5V40jImlfJC4XF/njWF+kV7qIBgd+S0t6+rexE/LOv6C+qiL1IRqA4RkPc1Fhfm
 8fvUfBoQx3jzJjNLXTXW3yfkGpruUexuzMCQm65cPDRM21Y9ByTGjLxT/yBqcqafJbfY
 O3/7pjbWftvpi7rkkaP9hS+kLDg/djzfIoKVLGLUKUaJtGyETPtfcAWcprp2eh2kpcqS
 LCUTwivwOfWf1GdNwLV25hgQG13x7OWV4waXMt4nkUOASNMiSD5O7MmdzxeCFC7oOpfl
 0Z32EVrJK5UvKAoizvzRRXL1tJoXv4hVhlmQXy8mXqkTzbnXlAB7s+MM1LHdnv2U9SEh 5A== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33unww9hg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:28:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SKMGKt022965;
 Mon, 28 Sep 2020 20:28:00 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 33sw98x4f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 20:28:00 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SKS0Nb49086842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 20:28:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280F7B2065;
 Mon, 28 Sep 2020 20:28:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADA8DB2064;
 Mon, 28 Sep 2020 20:27:59 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.158.203])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 20:27:59 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 2/3] arch: ARM: Aspeed: Add SPL
 eMMC partition boot support
Date: Mon, 28 Sep 2020 15:27:52 -0500
Message-Id: <20200928202753.58351-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928202753.58351-1-eajames@linux.ibm.com>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_20:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=844
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=13
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280148
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
device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/mach-aspeed/Kconfig            | 7 +++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c | 9 ++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 06f14f4f55..0e3bb841d0 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -90,6 +90,13 @@ config ASPEED_UBOOT_MMC_BASE
 	  The base block number of the U-Boot
 	  image in the eMMC device
 
+config ASPEED_UBOOT_MMC_PART
+	int "U-Boot eMMC partition"
+	default 0
+	help
+	  The partition number of the U-Boot
+	  image in the eMMC device
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

