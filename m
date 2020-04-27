Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 312091B966A
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 07:10:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Xsj6w0SzDqRf
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:10:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mt29Q6IT; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Xs22mMSzDqQG
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 15:09:56 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id a7so6945020pju.2
 for <openbmc@lists.ozlabs.org>; Sun, 26 Apr 2020 22:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UAnTxwK0HI0mPUJTalT0u1vzVr23dS1IFtFEjd64BvI=;
 b=mt29Q6ITCYSjow0auMShlAV8Hsm13LAThiFZ39FU86oTHURa1t3D9Wf5mFuy4ChkSp
 ZnmlWeXknzXTj1fbQ46XaSWoF4euVzbUhOS4I0MTsAneQaBORVVpTlpZ5ybzGQJ89Iwr
 7MxQfLdsCmLTGvlRfty7rGvDAVRi5cFAk/nL3H9Lg4i8tm7csl6MdiXWuDLcK6ivMbQ6
 Whv7g7XxweXTopyMzRZ6k+j9Y7XqC91er+N9BKgTtyHEMFCkLbcPHfqgAjwfErupKAGA
 tFjqFmuwlrJZc46AwI6NeIpadA929ydTyFTp3RHmtE0LW03GrkaoMy65SRJWJ+1pXomw
 Jmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UAnTxwK0HI0mPUJTalT0u1vzVr23dS1IFtFEjd64BvI=;
 b=n5eKXRcgzBLbdO7Qnaw+7/1qaffMe1nOME0Or2fz1MFFe5x7O4qdJnx85h09JABfYQ
 TYH3vfBjb4l3LauANhBsg7Ld2A6r6DhJEf7FhLf45+cqW+vSOtDa3ruQ7e6p27slAJN9
 XWEc3CboCIwZhMTcKsAfIJpLCw+cH9xqqJBrdLlH6lrQlBrgBIyXW7TvE/T1LsyY6miz
 nXqqmzu112X68oLGfjYgmtUqVP/UMaFI6QBnkEKTn+igxHFMMSpnrMqIh0YxJoT8j9GP
 CA0PLYa2mzf0Tk3xJkjpHpdUMgT7Z/0rRr8rY9ZtvGWy6lCL9wpkKFkYpoKmLdoIxD4Y
 LjLA==
X-Gm-Message-State: AGi0PuZDGBYvbqNGEQlvH0HnjuvmBab2Gv7J4Rf4wCpe8DeNRizCE/rQ
 6YT9ipGIrEnPUW6R1AerMHk=
X-Google-Smtp-Source: APiQypKhKskdXYe+AULGOBdCmR+xLWn/7FDN7ruOx/zrsuvIAjrnWSWx56SpO+ZV3mRzGixhSMP3XQ==
X-Received: by 2002:a17:90a:d504:: with SMTP id
 t4mr21821125pju.123.1587964194644; 
 Sun, 26 Apr 2020 22:09:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id c2sm11395639pfp.118.2020.04.26.22.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 22:09:54 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ast2600: ram: Enable
 device tree based DDR config
Date: Mon, 27 Apr 2020 14:39:43 +0930
Message-Id: <20200427050944.2177237-2-joel@jms.id.au>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200427050944.2177237-1-joel@jms.id.au>
References: <20200427050944.2177237-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver supports specification of the M-PLL via the device tree, and
partially supported using this to configure the SDRAM rate used for
memory training.

This patch finishes the job and exposes the setting through Kconfig.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/ram/aspeed/Kconfig         |  7 +++++
 drivers/ram/aspeed/sdram_ast2600.c | 47 ++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
index 38bbe128da71..0d30cd6941fe 100644
--- a/drivers/ram/aspeed/Kconfig
+++ b/drivers/ram/aspeed/Kconfig
@@ -1,7 +1,14 @@
 if RAM || SPL_RAM
 
+config AST2600_SDRAMMC_MANUAL_CLK
+	bool "AST2600 SDRAM manual clock rate selection"
+	help
+	 In order to speed up DRAM init time, write pre-defined values to
+	 registers directly. This skips devce tree based detection.
+
 choice
 	prompt "DDR4 target data rate"
+	depends on AST2600_SDRAMMC_MANUAL_CLK
 	default ASPEED_DDR4_1600
 
 config ASPEED_DDR4_400
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 3c120f2eb5e5..72032a3d695e 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -19,10 +19,6 @@
 #include <dt-bindings/clock/ast2600-clock.h>
 #include "sdram_phy_ast2600.h"
 
-/* in order to speed up DRAM init time, write pre-defined values to registers
- * directly */
-#define AST2600_SDRAMMC_MANUAL_CLK
-
 /* register offset */
 #define AST_SCU_FPGA_STATUS	0x004
 #define AST_SCU_HANDSHAKE	0x100
@@ -58,6 +54,7 @@
 #define SCU_MPLL_FREQ_100M		0x0078003F
 #define SCU_MPLL_EXT_100M		0x0000001F
 /* MPLL configuration */
+#if defined(CONFIG_AST2600_SDRAMMC_MANUAL_CLK)
 #if defined(CONFIG_ASPEED_DDR4_1600)
 #define SCU_MPLL_FREQ_CFG		SCU_MPLL_FREQ_400M
 #define SCU_MPLL_EXT_CFG		SCU_MPLL_EXT_400M
@@ -73,6 +70,7 @@
 #else
 #error "undefined DDR4 target rate\n"
 #endif
+#endif
 
 /* AC timing and SDRAM mode registers */
 #if defined(CONFIG_FPGA_ASPEED) || defined(CONFIG_ASPEED_PALLADIUM)
@@ -102,6 +100,7 @@
 #endif /* end of "#if defined(CONFIG_FPGA_ASPEED) ||                           \
 	  defined(CONFIG_ASPEED_PALLADIUM)" */
 
+#if defined(CONFIG_AST2600_SDRAMMC_MANUAL_CLK)
 #if defined(CONFIG_FPGA_ASPEED) || defined(CONFIG_ASPEED_PALLADIUM)
 #define DDR4_TRFC			DDR4_TRFC_FPGA
 #else
@@ -123,6 +122,7 @@
 #endif	/* end of "#if (SCU_MPLL_FREQ_CFG == SCU_MPLL_FREQ_400M)" */
 #endif  /* end of "#if defined(CONFIG_FPGA_ASPEED) ||                          \
 	   defined(CONFIG_ASPEED_PALLADIUM)" */
+#endif /* end of "if defined(CONFIG_AST2600_SDRAMMC_MANUAL_CLK)" */
 
 /* supported SDRAM size */
 #define SDRAM_SIZE_1KB		(1024U)
@@ -160,6 +160,8 @@ struct dram_info {
 	void __iomem *phy_setting;
 	void __iomem *phy_status;
 	ulong clock_rate;
+	ulong ddr4_trfc;
+	ulong phy_train_trfc;
 };
 
 static void ast2600_sdramphy_kick_training(struct dram_info *info)
@@ -235,7 +237,7 @@ static void ast2600_sdramphy_init(u32 *p_tbl, struct dram_info *info)
         }
 
 	data = readl(info->phy_setting + 0x84) & ~GENMASK(16, 0);
-	data |= DDR4_PHY_TRAIN_TRFC;
+	data |= info->phy_train_trfc;
 	writel(data, info->phy_setting + 0x84);
 #endif        
 }
@@ -622,7 +624,6 @@ static void ast2600_sdrammc_calc_size(struct dram_info *info)
 	const int write_test_offset = 0x100000;
 	u32 test_pattern = 0xdeadbeef;
 	u32 cap_param = SDRAM_CONF_CAP_2048M;
-	u32 refresh_timing_param = DDR4_TRFC;
 	const u32 write_addr_base = CONFIG_SYS_SDRAM_BASE + write_test_offset;
 
 	for (ram_size = SDRAM_MAX_SIZE; ram_size > SDRAM_MIN_SIZE;
@@ -642,13 +643,13 @@ static void ast2600_sdrammc_calc_size(struct dram_info *info)
 			break;
 
 		--cap_param;
-		refresh_timing_param >>= 8;
+		info->ddr4_trfc >>= 8;
 		test_pattern = (test_pattern >> 4) | (test_pattern << 28);
 	}
 
 	clrsetbits_le32(&info->regs->ac_timing[1],
 			(SDRAM_AC_TRFC_MASK << SDRAM_AC_TRFC_SHIFT),
-			((refresh_timing_param & SDRAM_AC_TRFC_MASK)
+			((info->ddr4_trfc & SDRAM_AC_TRFC_MASK)
 			 << SDRAM_AC_TRFC_SHIFT));
 
 	info->info.base = CONFIG_SYS_SDRAM_BASE;
@@ -842,6 +843,34 @@ static int ast2600_sdrammc_probe(struct udevice *dev)
 		return PTR_ERR(priv->scu);
 	}
 
+#if defined(AST2600_SDRAMMC_MANUAL_CLK)
+	priv->ddr4_trfc = DDR4_TRFC;
+	priv->phy_train_trfc = DDR4_PHY_TRAIN_TRFC;
+#else
+	if (!priv->clock_rate) {
+		debug("clock rate not defined\n");
+		return -ENODEV;
+	}
+	switch (priv->clock_rate) {
+	case 400000000: /* 1600 */
+		priv->ddr4_trfc = DDR4_TRFC_1600;
+		priv->phy_train_trfc = 0xc30;
+		break;
+	case 333000000: /* 1333 */
+		priv->ddr4_trfc = DDR4_TRFC_1333;
+		priv->phy_train_trfc = 0xa25;
+		break;
+	case 200000000: /* 800 */
+		priv->ddr4_trfc = DDR4_TRFC_800;
+		priv->phy_train_trfc = 0x618;
+		break;
+	case 100000000: /* 400 */
+		priv->ddr4_trfc = DDR4_TRFC_400;
+		priv->phy_train_trfc = 0x30c;
+		break;
+	}
+#endif
+
 	if (readl(priv->scu + AST_SCU_HANDSHAKE) & SCU_SDRAM_INIT_READY_MASK) {
 		printf("already initialized, ");
 		ast2600_sdrammc_calc_size(priv);
@@ -851,7 +880,7 @@ static int ast2600_sdrammc_probe(struct udevice *dev)
 		return 0;
 	}
 
-#ifdef AST2600_SDRAMMC_MANUAL_CLK
+#if defined(CONFIG_AST2600_SDRAMMC_MANUAL_CLK)
 	reg = readl(priv->scu + AST_SCU_MPLL);
 	reg &= ~(BIT(24) | GENMASK(22, 0));
 	reg |= (BIT(25) | BIT(23) | SCU_MPLL_FREQ_CFG);
-- 
2.26.1

