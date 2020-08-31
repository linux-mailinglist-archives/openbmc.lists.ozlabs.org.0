Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39293258195
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:09:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKWR4SvPzDqWS
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:09:23 +1000 (AEST)
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
 header.s=pp1 header.b=elI2hbdk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKMG3RBnzDqD3
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:02:18 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VJ2DkH030343; Mon, 31 Aug 2020 15:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BfUYZMFrJJoPaQ12IDIWfWGljIwXA/+7Sb2gbje+Kaw=;
 b=elI2hbdkS8PofMGas6i4tL2eMItIU/JLyWKVuaLWvZ+ey3JW1RsWjTByzcBjWxiGWgrY
 S5SoxfJa02Um5Cvu1EV0n1T5VBq+q7EnHxISOg9nVpnOz0vnk2P3qvQmpweetkJhxP3N
 qNpWYA++w5Uri6T3q7cmeqVuB0NlOPdsMImRPDIFWN6R1nnzQakQcLkYGNYID/g/gE62
 nC54fCS2gaxJmJ8EU7tjUYEaFbTkUejlf/luUv6jWIuLysp8LfVSqiI+sF+NuxNSn2me
 B8VaYMYpp4Hs7F4tt3lnE8C//y3JTpzd1IGiItSYr0Rosm6doTTeVn4FN025u+cVTpXM uQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3395d62gke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:02:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIvKcM026772;
 Mon, 31 Aug 2020 19:01:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 337en96ryh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1brI49283338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A3FCAE05F;
 Mon, 31 Aug 2020 19:01:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8967CAE05C;
 Mon, 31 Aug 2020 19:01:36 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/5] ARM: Aspeed: AST2600:
 Support booting from eMMC
Date: Mon, 31 Aug 2020 14:01:26 -0500
Message-Id: <20200831190130.47060-2-eajames@linux.ibm.com>
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
 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=949
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=13 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310110
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

Fix a number of things in the platform code for the AST2600 to
support booting the SPL from eMMC and then loading U-Boot from
eMMC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/include/asm/arch-aspeed/boot0.h    |  2 +-
 arch/arm/mach-aspeed/ast2600/board_common.c | 72 +++++++++++++++++++++
 arch/arm/mach-aspeed/ast2600/spl.c          |  9 +--
 include/configs/aspeed-common.h             |  3 +
 4 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/boot0.h b/arch/arm/include/asm/arch-aspeed/boot0.h
index ecd1e927c7..7fd5208773 100644
--- a/arch/arm/include/asm/arch-aspeed/boot0.h
+++ b/arch/arm/include/asm/arch-aspeed/boot0.h
@@ -13,7 +13,7 @@ _start:
 #ifdef CONFIG_SPL_BUILD
 	.word	0x0	/* Key location */
 	.word	0x0	/* start address of image */
-	.word	0X0	/* image size */
+	.word	0Xfc00	/* image size 63KB */
 	.word	0x0	/* signature address */
 	.word	0x0	/* header revision ID low */
 	.word	0x0	/* header revision ID high */
diff --git a/arch/arm/mach-aspeed/ast2600/board_common.c b/arch/arm/mach-aspeed/ast2600/board_common.c
index 449c7d0a23..a6ca8d33f8 100644
--- a/arch/arm/mach-aspeed/ast2600/board_common.c
+++ b/arch/arm/mach-aspeed/ast2600/board_common.c
@@ -8,6 +8,7 @@
 #include <timer.h>
 #include <asm/io.h>
 #include <asm/arch/timer.h>
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <dm/uclass.h>
 
@@ -110,3 +111,74 @@ int arch_early_init_r(void)
 	return 0;
 }
 
+union ast2600_pll_reg {
+	unsigned int w;
+	struct {
+		unsigned int m : 13;		/* bit[12:0]	*/
+		unsigned int n : 6;		/* bit[18:13]	*/
+		unsigned int p : 4;		/* bit[22:19]	*/
+		unsigned int off : 1;		/* bit[23]	*/
+		unsigned int bypass : 1;	/* bit[24]	*/
+		unsigned int reset : 1;		/* bit[25]	*/
+		unsigned int reserved : 6;	/* bit[31:26]	*/
+	} b;
+};
+
+void aspeed_mmc_init(void)
+{
+	u32 reset_bit;
+	u32 clkstop_bit;
+	u32 clkin = 25000000;
+	u32 pll_reg = 0;
+	u32 enableclk_bit;
+	u32 rate = 0;
+	u32 div = 0;
+	u32 i = 0;
+	u32 mult;
+	u32 clk_sel = readl(0x1e6e2300);
+
+	/* check whether boot from eMMC is enabled */
+	if ((readl(0x1e6e2500) & 0x4) == 0)
+		return;
+
+	/* disable eMMC boot controller engine */
+	*(volatile int *)0x1e6f500C &= ~0x90000000;
+	/* set pinctrl for eMMC */
+	*(volatile int *)0x1e6e2400 |= 0xff000000;
+
+	/* clock setting for eMMC */
+	enableclk_bit = BIT(15);
+
+	reset_bit = BIT(16);
+	clkstop_bit = BIT(27);
+	writel(reset_bit, 0x1e6e2040);
+	udelay(100);
+	writel(clkstop_bit, 0x1e6e2084);
+	mdelay(10);
+	writel(reset_bit, 0x1e6e2044);
+
+	pll_reg = readl(0x1e6e2220);
+	if (pll_reg & BIT(24)) {
+		/* Pass through mode */
+		mult = div = 1;
+	} else {
+		/* F = 25Mhz * [(M + 2) / (n + 1)] / (p + 1) */
+		union ast2600_pll_reg reg;
+		reg.w = pll_reg;
+		mult = (reg.b.m + 1) / (reg.b.n + 1);
+		div = (reg.b.p + 1);
+	}
+	rate = ((clkin * mult)/div);
+
+	for(i = 0; i < 8; i++) {
+		div = (i + 1) * 2;
+		if ((rate / div) <= 200000000)
+			break;
+	}
+
+	clk_sel &= ~(0x7 << 12);
+	clk_sel |= (i << 12) | BIT(11);
+	writel(clk_sel, 0x1e6e2300);
+
+	setbits_le32(0x1e6e2300, enableclk_bit);
+}
diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 27796b7385..1a248724ee 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -18,6 +18,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #define AST_BOOTMODE_UART	2
 
 u32 aspeed_bootmode(void);
+void aspeed_mmc_init(void);
 
 void board_init_f(ulong dummy)
 {
@@ -26,6 +27,7 @@ void board_init_f(ulong dummy)
 	timer_init();
 	preloader_console_init();
 	dram_init();
+	aspeed_mmc_init();
 #endif
 }
 
@@ -68,13 +70,6 @@ void __noreturn jump_to_image_no_args(struct spl_image_info *spl_image)
 }
 #endif
 
-#ifdef CONFIG_SPL_MMC_SUPPORT
-u32 spl_boot_mode(const u32 boot_device)
-{
-	return MMCSD_MODE_RAW;
-}
-#endif
-
 #ifdef CONFIG_SPL_OS_BOOT
 int spl_start_uboot(void)
 {
diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
index cdbffc97a2..7901bc2aff 100644
--- a/include/configs/aspeed-common.h
+++ b/include/configs/aspeed-common.h
@@ -11,6 +11,8 @@
 
 #include <asm/arch/platform.h>
 
+#define CONFIG_SUPPORT_EMMC_BOOT
+
 #define CONFIG_BOOTFILE		"all.bin"
 
 #define CONFIG_GATEWAYIP	192.168.0.1
@@ -40,6 +42,7 @@
 
 #define CONFIG_SYS_BOOTMAPSZ		(256 * 1024 * 1024)
 #define CONFIG_SYS_MALLOC_LEN		(32 << 20)
+#define CONFIG_SYS_MONITOR_LEN		0xD0000
 
 /*
  * BOOTP options
-- 
2.26.2

