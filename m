Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D97622A87D1
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:14:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRvqz29MbzDr4N
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 07:14:23 +1100 (AEDT)
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
 header.s=pp1 header.b=JvjzAE8t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRvkN5ZMczDqpB
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 07:09:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5K6qmc062764; Thu, 5 Nov 2020 15:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0qfsrBIcYKc7Yjnf9/pW9LH41c6gFMnHru//QmW3GYI=;
 b=JvjzAE8t8l8/iLr0ciubH8T+Tn11hd9djr1zY7zvqjs5vsS1zOrriHwIqx2Fz+2Xpd9z
 DeD6sVE/XEn7V9Xisstc5pFyyBg4KJtM5MUzKaMbCeolJymsStlfLBif1K6ckiuvHq8Y
 VFtLWxxFRlNXPEzBvhPcriuR3t8GcWZ4Fd3Ji8rkW2ByRcbwvT6rZY82GiePaV4sqa+D
 RKqZcQlPoD4mZ53DQCSckR+h79dI4/q6AOdfe1EMgo9NzO3psh2tccP4paTzBUywLd0I
 dW7idAwQMz+F4hxtNiTNcim46wDIHf89j5VPlnoiLKnNw4tH5XnNb5VkcGiGz4qP9Y65 ag== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m5ftrqva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 15:09:28 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5K2kEW007330;
 Thu, 5 Nov 2020 20:09:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 34h09nj0c2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 20:09:26 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5K9H8s61211110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 20:09:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8653F136055;
 Thu,  5 Nov 2020 20:09:25 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC824136053;
 Thu,  5 Nov 2020 20:09:24 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.160.108.47])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 20:09:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/3] arch: ARM: Aspeed: Add
 SPL eMMC partition boot support
Date: Thu,  5 Nov 2020 14:09:19 -0600
Message-Id: <20201105200920.51226-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201105200920.51226-1-eajames@linux.ibm.com>
References: <20201105200920.51226-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_14:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=13 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxlogscore=943 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050125
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

