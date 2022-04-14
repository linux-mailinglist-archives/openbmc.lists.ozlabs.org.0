Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D635004ED
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 06:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf5Td41Mzz3bVd
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 14:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Gw+tPuP9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Gw+tPuP9; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kf5TC4v9Wz2xnB
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 14:05:03 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 545F4228;
 Wed, 13 Apr 2022 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1649909098;
 bh=oKXwg2mp91l9b1sKvOFXGmfwWhecCIMBQI0c1yRM/8U=;
 h=From:To:Cc:Subject:Date:From;
 b=Gw+tPuP9LKql1Gz+sWCCbomxwFI4JcPbt0r7pZaB2yLCGixoXeOR+X6JKu+1B1mjR
 0oY8Gq+PLEki4qOqSF2dPrMVQBpFr+Hcd/b54nx/CPJ4nj9Nx3f4KR7cYwEQiZG8XF
 0h3SkrZRL2jhrO5Xpxg75XbDak1FlJu4CIHRu94M=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: add
 CONFIG_ASPEED_ISOLATE_BMC
Date: Wed, 13 Apr 2022 21:04:48 -0700
Message-Id: <20220414040448.27100-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This provides the functionality of the OpenBMC df-isolate-bmc distro
feature flag, and is very directly derived from Andrew Jeffery's patch
in the OpenBMC tree for the v2016.07 u-boot branch.  The
implementation currently only supports ast2500, though ast2400 and
ast2600 support should be fairly simple extensions.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

This is meant more as something of an RFC to see if this seems like
approximately the right way of going about this (since as far as I can
see the existing df-isolate-bmc implementation only supports the old
2016 u-boot branch), but if it looks OK I suppose it could potentially
go in as-is.

 arch/arm/include/asm/arch-aspeed/platform.h   |  3 +
 .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
 arch/arm/mach-aspeed/Kconfig                  | 12 +++
 arch/arm/mach-aspeed/ast2500/board_common.c   | 75 +++++++++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index f016bdaba3e7..be7e9087a782 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -25,14 +25,17 @@
 #define ASPEED_FMC_CS0_BASE	0x20000000
 #elif defined(CONFIG_ASPEED_AST2500)
 #define ASPEED_MAC_COUNT	2
+#define ASPEED_MISC1_CTRL	0x1e6e202C
 #define ASPEED_HW_STRAP1	0x1e6e2070
 #define ASPEED_HW_STRAP2	0x1e6e20D0
 #define ASPEED_REVISION_ID	0x1e6e207C
 #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
 #define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction handshake register */
+#define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
 #define ASPEED_MAC_COUNT	2
 #define ASPEED_DRAM_BASE	0x80000000
 #define ASPEED_SRAM_BASE	0x1E720000
+#define ASPEED_LPC_CTRL		0x1e789000
 #define ASPEED_SRAM_SIZE	0x9000
 #define ASPEED_FMC_CS0_BASE	0x20000000
 #elif defined(CONFIG_ASPEED_AST2600)
diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 8fe4028e4ff0..2d54d915dfed 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -11,6 +11,7 @@
 #define SCU_HWSTRAP_VGAMEM_MASK		(3 << SCU_HWSTRAP_VGAMEM_SHIFT)
 #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
 #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
+#define SCU_HWSTRAP_LPC_DISABLE		(1 << 20)
 #define SCU_HWSTRAP_DDR4		(1 << 24)
 #define SCU_HWSTRAP_CLKIN_25MHZ		(1 << 23)
 
@@ -107,6 +108,13 @@
 #define SCU_CLKDUTY_RGMII2TXCK_SHIFT	16
 #define SCU_CLKDUTY_RGMII2TXCK_MASK	(0x7f << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
 
+#define SCU_PCIE_CONFIG_SET_VGA_MMIO	(1 << 1)
+#define SCU_PCIE_CONFIG_SET_BMC_EN	(1 << 8)
+#define SCU_PCIE_CONFIG_SET_BMC_MMIO	(1 << 9)
+#define SCU_PCIE_CONFIG_SET_BMC_DMA	(1 << 14)
+
+#define SCU_MISC_DEBUG_UART_DISABLE	(1 << 10)
+
 struct ast2500_clk_priv {
 	struct ast2500_scu *scu;
 };
diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 579a547df61e..2b51f87e0732 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -45,6 +45,18 @@ config ASPEED_AST2600
 	  which is enabled by support of LPC and eSPI peripherals.
 endchoice
 
+config ASPEED_ISOLATE_BMC
+	bool "Disable hardware features that provide unnecessary access to the BMC"
+	depends on ASPEED_AST2500
+	default n
+	help
+	  Aspeed BMC hardware provides a number of hardware features
+	  that, in their default configuration, allow access to BMC
+	  internals that may be undesirable in production systems for
+	  security reasons (iLPC2AHB, P2A, PCIe, debug UART, X-DMA,
+	  LPC2AHB).  This disables these features so as to provide
+	  stronger security isolation for the BMC.
+
 config ASPEED_PALLADIUM
 	bool "Aspeed palladium for simulation"
 	default n
diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c b/arch/arm/mach-aspeed/ast2500/board_common.c
index ce541e88fb8e..bd73fe1c1070 100644
--- a/arch/arm/mach-aspeed/ast2500/board_common.c
+++ b/arch/arm/mach-aspeed/ast2500/board_common.c
@@ -7,18 +7,93 @@
 #include <ram.h>
 #include <timer.h>
 #include <asm/io.h>
+#include <asm/arch/platform.h>
+#include <asm/arch/scu_ast2500.h>
+#include <asm/arch/sdram_ast2500.h>
 #include <asm/arch/timer.h>
 #include <linux/err.h>
 #include <dm/uclass.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
+#if CONFIG_ASPEED_ISOLATE_BMC
+#define AST_LPC_BASE 0x1e789000
+# define AST_LPC_HICR5 0x080
+#  define LPC_HICR5_ENFWH BIT(10)
+# define AST_LPC_HICRB 0x100
+#  define LPC_HICRB_ILPC2AHB BIT(6)
+
+#define AST_SDMC_BASE 0x1e6e0000
+# define AST_SDMC_PROTECT 0x00
+# define AST_SDMC_GFX_PROT 0x08
+#  define SDMC_GFX_PROT_VGA_CURSOR BIT(0)
+#  define SDMC_GFX_PROT_VGA_CG_READ BIT(1)
+#  define SDMC_GFX_PROT_VGA_ASCII_READ BIT(2)
+#  define SDMC_GFX_PROT_VGA_CRT BIT(3)
+#  define SDMC_GFX_PROT_PCIE BIT(16)
+#  define SDMC_GFX_PROT_XDMA BIT(17)
+
+static void isolate_bmc(void)
+{
+	bool sdmc_unlocked;
+	u32 val;
+
+	/* iLPC2AHB */
+	val = readl(ASPEED_HW_STRAP1);
+	val |= SCU_HWSTRAP_LPC_DISABLE;
+	writel(val, ASPEED_HW_STRAP1);
+
+	val = readl(AST_LPC_BASE + AST_LPC_HICRB);
+	val |= LPC_HICRB_ILPC2AHB;
+	writel(val, AST_LPC_BASE + AST_LPC_HICRB);
+
+	/* P2A, PCIe BMC */
+	val = readl(ASPEED_PCIE_CONFIG_SET);
+	val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
+	         | SCU_PCIE_CONFIG_SET_BMC_MMIO
+	         | SCU_PCIE_CONFIG_SET_BMC_EN
+	         | SCU_PCIE_CONFIG_SET_VGA_MMIO);
+	writel(val, ASPEED_PCIE_CONFIG_SET);
+
+	/* Debug UART */
+	val = readl(ASPEED_MISC1_CTRL);
+	val |= SCU_MISC_DEBUG_UART_DISABLE;
+	writel(val, ASPEED_MISC1_CTRL);
+
+	/* X-DMA */
+	sdmc_unlocked = readl(AST_SDMC_BASE + AST_SDMC_PROTECT);
+	if (!sdmc_unlocked)
+		writel(SDRAM_UNLOCK_KEY, AST_SDMC_BASE + AST_SDMC_PROTECT);
+
+	val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+	val |= (SDMC_GFX_PROT_VGA_CURSOR
+	        | SDMC_GFX_PROT_VGA_CG_READ
+	        | SDMC_GFX_PROT_VGA_ASCII_READ
+	        | SDMC_GFX_PROT_VGA_CRT
+	        | SDMC_GFX_PROT_PCIE
+	        | SDMC_GFX_PROT_XDMA);
+	writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
+
+	if (!sdmc_unlocked)
+		writel(~SDRAM_UNLOCK_KEY, AST_SDMC_BASE + AST_SDMC_PROTECT);
+
+	/* LPC2AHB */
+	val = readl(AST_LPC_BASE + AST_LPC_HICR5);
+	val &= ~LPC_HICR5_ENFWH;
+	writel(val, AST_LPC_BASE + AST_LPC_HICR5);
+}
+#endif
+
 __weak int board_init(void)
 {
 	struct udevice *dev;
 	int i;
 	int ret;
 
+#if CONFIG_ASPEED_ISOLATE_BMC
+	isolate_bmc();
+#endif
+
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 
 	/*
-- 
2.35.1

