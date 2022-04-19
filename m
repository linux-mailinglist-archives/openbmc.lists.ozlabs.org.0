Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65925507D43
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 01:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjgP51s0Lz3bWx
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 09:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=TwHfPIcv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=TwHfPIcv; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjgNf0yyDz2xnM
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 09:43:29 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3A4724F3;
 Tue, 19 Apr 2022 16:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650411805;
 bh=5F6uTB8t+4cf7uKMDUI+sQzmMrOZGydG1mr8G+QBbms=;
 h=From:To:Cc:Subject:Date:From;
 b=TwHfPIcvfv8F1l8jQsc3mEDUc45xlPSrPy4KFvHZtqB0JgvbhCbt/cR6K6DykTWkb
 svBwiyzHHMw4t/yXeZsSqNa6Q6MUweVvMcsAc4FF13sufUjdJbt21wmN53awEovn3D
 smYHWbCub4z165n44fSTQrOe1AE0Dm6x3b7psrBk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable backdoor
 interfaces
Date: Tue, 19 Apr 2022 16:42:02 -0700
Message-Id: <20220419234202.8895-1-zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Lei Yu <yulei.sh@bytedance.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>,
 Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On ast2400 and ast2500 we now disable the various hardware backdoor
interfaces as is done on ast2600.  Two Kconfig options can selectively
re-enable some of these interfaces: CONFIG_ASPEED_ENABLE_SUPERIO
leaves the ast2x00 built-in Super I/O device enabled, as it is
required for some systems, and CONFIG_ASPEED_ENABLE_DEBUG_UART leaves
the hardware debug UART enabled, since it provides a relatively high
ratio of utility to security risk during development.

This patch is based on a patch by Andrew Jeffery for an older u-boot
branch in the OpenBMC tree for the df-isolate-bmc distro feature flag.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Tested on ast2500 and (hostless, BMC-only) ast2400.

Ryan, are you OK with having an option (off by default) to leave the
debug UART enabled as in this version of the patch?

Ian, if you could test this out with CONFIG_ASPEED_ENABLE_SUPERIO=y on
one of your systems and confirm that that setting works as intended
that would be great.

Changes since v2 [1]:
 - made most of the changes unconditional/unconfigurable, but added
   Kconfig options to leave Super I/O and debug UART enabled

Changes since v1 [0]:
 - extended to cover ast2400
 - inverted sense of Kconfig option, default (n) is now secure mode
 - renamed some register/bit macros more appropriately

[0] https://lore.kernel.org/openbmc/20220414040448.27100-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/20220414224004.29703-1-zev@bewilderbeest.net/

 arch/arm/include/asm/arch-aspeed/platform.h   |  7 ++
 .../arm/include/asm/arch-aspeed/scu_ast2400.h |  7 ++
 .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
 arch/arm/mach-aspeed/Kconfig                  | 22 ++++++
 arch/arm/mach-aspeed/ast2400/board_common.c   | 66 +++++++++++++++++
 arch/arm/mach-aspeed/ast2500/board_common.c   | 73 +++++++++++++++++++
 6 files changed, 183 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index f016bdaba3e7..f05747642f38 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -15,24 +15,31 @@
 /*********************************************************************************/
 #if defined(CONFIG_ASPEED_AST2400)
 #define ASPEED_MAC_COUNT	2
+#define ASPEED_SDRAM_CTRL	0x1e6e0000
 #define ASPEED_HW_STRAP1	0x1e6e2070
 #define ASPEED_REVISION_ID	0x1e6e207C
 #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
 #define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction handshake register */
+#define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
 #define ASPEED_DRAM_BASE	0x40000000
 #define ASPEED_SRAM_BASE	0x1E720000
+#define ASPEED_LPC_CTRL		0x1e789000
 #define ASPEED_SRAM_SIZE	0x8000
 #define ASPEED_FMC_CS0_BASE	0x20000000
 #elif defined(CONFIG_ASPEED_AST2500)
 #define ASPEED_MAC_COUNT	2
+#define ASPEED_SDRAM_CTRL	0x1e6e0000
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
diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
index 9c5d96ae84b9..55875fd8312f 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
@@ -8,6 +8,7 @@
 #define SCU_HWSTRAP_VGAMEM_MASK		(3 << SCU_HWSTRAP_VGAMEM_SHIFT)
 #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
 #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
+#define SCU_HWSTRAP_LPC_SIO_DEC_DIS	(1 << 20)
 #define SCU_HWSTRAP_DDR4		(1 << 24)
 #define SCU_HWSTRAP_CLKIN_25MHZ		(1 << 23)
 
@@ -104,6 +105,12 @@
 #define SCU_CLKDUTY_RGMII2TXCK_SHIFT	16
 #define SCU_CLKDUTY_RGMII2TXCK_MASK	(0x7f << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
 
+#define SCU_PCIE_CONFIG_SET_VGA_MMIO	(1 << 1)
+#define SCU_PCIE_CONFIG_SET_BMC_EN	(1 << 8)
+#define SCU_PCIE_CONFIG_SET_BMC_MMIO	(1 << 9)
+#define SCU_PCIE_CONFIG_SET_BMC_DMA	(1 << 14)
+
+
 struct ast2400_clk_priv {
 	struct ast2400_scu *scu;
 };
diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
index 8fe4028e4ff0..06dc998afaa8 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
@@ -11,6 +11,7 @@
 #define SCU_HWSTRAP_VGAMEM_MASK		(3 << SCU_HWSTRAP_VGAMEM_SHIFT)
 #define SCU_HWSTRAP_MAC1_RGMII		(1 << 6)
 #define SCU_HWSTRAP_MAC2_RGMII		(1 << 7)
+#define SCU_HWSTRAP_LPC_SIO_DEC_DIS	(1 << 20)
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
index 579a547df61e..fc565e0da830 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -45,6 +45,28 @@ config ASPEED_AST2600
 	  which is enabled by support of LPC and eSPI peripherals.
 endchoice
 
+config ASPEED_ENABLE_SUPERIO
+	bool "Enable built-in AST2x00 Super I/O hardware"
+	depends on ASPEED_AST2400 || ASPEED_AST2500
+	help
+	  The Aspeed AST2400 and AST2500 include a built-in Super I/O
+	  device that is normally disabled; say Y here to enable it.
+	  Note that this has security implications: it grants the host
+	  read access to the BMC's entire address space.  This should
+	  thus be left disabled unless required by a specific system.
+
+config ASPEED_ENABLE_DEBUG_UART
+	bool "Enable AST2500 hardware debug UART"
+	depends on ASPEED_AST2500
+	help
+	  The Aspeed AST2500 include a hardware-supported, UART-based
+	  debug interface that is normally disabled; say Y here to
+	  enable it.  Note that this has security implications: the
+	  debug UART provide read/write access to the BMC's entire
+	  address space.  This should thus be left disabled on
+	  production systems, but may be useful to enable for
+	  debugging during development.
+
 config ASPEED_PALLADIUM
 	bool "Aspeed palladium for simulation"
 	default n
diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c b/arch/arm/mach-aspeed/ast2400/board_common.c
index 3829b069342e..7134105232cb 100644
--- a/arch/arm/mach-aspeed/ast2400/board_common.c
+++ b/arch/arm/mach-aspeed/ast2400/board_common.c
@@ -4,14 +4,80 @@
 #include <ram.h>
 #include <timer.h>
 #include <asm/io.h>
+#include <asm/arch/platform.h>
+#include <asm/arch/scu_ast2400.h>
 #include <asm/arch/timer.h>
 #include <linux/err.h>
 #include <dm/uclass.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
+#define AST_LPC_HICR5 0x080
+# define LPC_HICR5_ENFWH BIT(10)
+#define AST_LPC_HICRB 0x100
+# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
+
+#define AST_SDMC_PROTECT 0x00
+# define SDRAM_UNLOCK_KEY 0xfc600309
+#define AST_SDMC_GFX_PROT 0x08
+# define SDMC_GFX_PROT_VGA_CURSOR BIT(0)
+# define SDMC_GFX_PROT_VGA_CG_READ BIT(1)
+# define SDMC_GFX_PROT_VGA_ASCII_READ BIT(2)
+# define SDMC_GFX_PROT_VGA_CRT BIT(3)
+# define SDMC_GFX_PROT_PCIE BIT(16)
+# define SDMC_GFX_PROT_XDMA BIT(17)
+
+static void isolate_bmc(void)
+{
+	bool sdmc_unlocked;
+	u32 val;
+
+	/* iLPC2AHB */
+#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
+	val = readl(ASPEED_HW_STRAP1);
+	val |= SCU_HWSTRAP_LPC_SIO_DEC_DIS;
+	writel(val, ASPEED_HW_STRAP1);
+#endif
+
+	val = readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
+	val |= LPC_HICRB_SIO_ILPC2AHB_DIS;
+	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
+
+	/* P2A, PCIe BMC */
+	val = readl(ASPEED_PCIE_CONFIG_SET);
+	val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
+	         | SCU_PCIE_CONFIG_SET_BMC_MMIO
+	         | SCU_PCIE_CONFIG_SET_BMC_EN
+	         | SCU_PCIE_CONFIG_SET_VGA_MMIO);
+	writel(val, ASPEED_PCIE_CONFIG_SET);
+
+	/* X-DMA */
+	sdmc_unlocked = readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+	if (!sdmc_unlocked)
+		writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+
+	val = readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
+	val |= (SDMC_GFX_PROT_VGA_CURSOR
+	        | SDMC_GFX_PROT_VGA_CG_READ
+	        | SDMC_GFX_PROT_VGA_ASCII_READ
+	        | SDMC_GFX_PROT_VGA_CRT
+	        | SDMC_GFX_PROT_PCIE
+	        | SDMC_GFX_PROT_XDMA);
+	writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
+
+	if (!sdmc_unlocked)
+		writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+
+	/* LPC2AHB */
+	val = readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
+	val &= ~LPC_HICR5_ENFWH;
+	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5);
+}
+
 __weak int board_init(void)
 {
+	isolate_bmc();
+
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 
 	return 0;
diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c b/arch/arm/mach-aspeed/ast2500/board_common.c
index ce541e88fb8e..c63fe466eb4b 100644
--- a/arch/arm/mach-aspeed/ast2500/board_common.c
+++ b/arch/arm/mach-aspeed/ast2500/board_common.c
@@ -7,18 +7,91 @@
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
 
+#define AST_LPC_HICR5 0x080
+# define LPC_HICR5_ENFWH BIT(10)
+#define AST_LPC_HICRB 0x100
+# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
+
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
+#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
+	val = readl(ASPEED_HW_STRAP1);
+	val |= SCU_HWSTRAP_LPC_SIO_DEC_DIS;
+	writel(val, ASPEED_HW_STRAP1);
+#endif
+
+	val = readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
+	val |= LPC_HICRB_SIO_ILPC2AHB_DIS;
+	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
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
+#if !defined(CONFIG_ASPEED_ENABLE_DEBUG_UART)
+	val = readl(ASPEED_MISC1_CTRL);
+	val |= SCU_MISC_DEBUG_UART_DISABLE;
+	writel(val, ASPEED_MISC1_CTRL);
+#endif
+
+	/* X-DMA */
+	sdmc_unlocked = readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+	if (!sdmc_unlocked)
+		writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+
+	val = readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
+	val |= (SDMC_GFX_PROT_VGA_CURSOR
+	        | SDMC_GFX_PROT_VGA_CG_READ
+	        | SDMC_GFX_PROT_VGA_ASCII_READ
+	        | SDMC_GFX_PROT_VGA_CRT
+	        | SDMC_GFX_PROT_PCIE
+	        | SDMC_GFX_PROT_XDMA);
+	writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
+
+	if (!sdmc_unlocked)
+		writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
+
+	/* LPC2AHB */
+	val = readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
+	val &= ~LPC_HICR5_ENFWH;
+	writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5);
+}
+
 __weak int board_init(void)
 {
 	struct udevice *dev;
 	int i;
 	int ret;
 
+	isolate_bmc();
+
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 
 	/*
-- 
2.35.1

