Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BFE59671F
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 04:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6rqR56b9z3blw
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 12:01:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=npJiDpfZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=npJiDpfZ;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6rnT1SBdz3c17
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 12:00:12 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id e8-20020a17090a280800b001f2fef7886eso555135pjd.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc;
        bh=mf/j1Dkyh/kfCXhTqeZGjuMJ/hBdLCd+I9LlkUMOkDU=;
        b=npJiDpfZMM8FU/CUX2RO9Wm/Q5skFhDFrdaW1XnwjHPPucgXF7Uxf2dxJzN6gwyjUO
         IHGutlZPSnaZGC3x1Uf5gPp/DSRb5JmYSw+mHeI7w75bY58wlpAUXVEl2Vcobq5T13aJ
         D3xqFN3RCsZA8BJOdxUPFtkxkUYdZChoHIuTla8UzgZ1aOK0+0ZsyJzErQFxjSpE4vGv
         B7lgZElC6Gon0CdWd6TuVukOxTLhnLiLt8Rgn6voRUjJFIMfsO0UYb536J+AjGBfST4s
         3NuJagvJ2887HG1NROXJwgoIMFcRprDE+5QTQHd9+nq5soKDjyN4IHg8UeLQ25HfJcge
         KTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc;
        bh=mf/j1Dkyh/kfCXhTqeZGjuMJ/hBdLCd+I9LlkUMOkDU=;
        b=MDREFxFljz5FaEUxoI1mMnJ1wM3bUDnjdRhk5yuFcLGXesyik0hbTPCTDP97TK3rox
         ufHS31qqcQ9oETP2+2XhpzjrnbZV8pQrkxPll8rdHQQWUTFe/Etc3gpBk9Gtzv7iadxF
         WiQuNO3BojG9B4w/BfGEImzNKYHTsJ8sdqwpheP8JpSl+MdUfVgMTsDKlczbuTgnYelY
         5wuh7ywaLFfAxe4uKQM2qyLJPmODE+nRxiUMcSadng3iTwIlK3AKdzx8qiIsNirpUmZB
         U9sTuQPfCMJ4/NPUNjmQg2EetrD+dySHBxR+qFMRLtSlerrHdZWxSKmU4DIYbgjpcnuF
         Py8Q==
X-Gm-Message-State: ACgBeo0GYhGFrvgex9Ke9bxU8XsfhAJgm3+IL+gDVlMNt9i0zMREcX+g
	0/zeKrizXBAXtpIvLvQL4ZI=
X-Google-Smtp-Source: AA6agR5fTbK1u1YL78Ip+bsCkOD9vZpICX1P/yX75NuSDaetBWpg3yiUuzoIq5c6WgxwcdDY51JALQ==
X-Received: by 2002:a17:90a:4a01:b0:1fa:a153:7b5a with SMTP id e1-20020a17090a4a0100b001faa1537b5amr1488773pjh.72.1660701610593;
        Tue, 16 Aug 2022 19:00:10 -0700 (PDT)
Received: from voyager.thelocal (2403-5808-8af8--7926-51ea-3ff2-71dd.ip6.aussiebb.net. [2403:5808:8af8:0:7926:51ea:3ff2:71dd])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090a02d000b001f10c959aa2sm212675pjd.42.2022.08.16.19.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 19:00:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ram/aspeed: Remove ECC config option
Date: Wed, 17 Aug 2022 11:59:49 +1000
Message-Id: <20220817015949.16946-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817015949.16946-1-joel@jms.id.au>
References: <20220817015949.16946-1-joel@jms.id.au>
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

Always build the code now that it is enabled by device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/ram/aspeed/sdram_ast2500.c | 4 ----
 drivers/ram/aspeed/sdram_ast2600.c | 5 +----
 drivers/ram/aspeed/Kconfig         | 7 -------
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index ca3b54295bf0..f76054d80b68 100644
--- a/drivers/ram/aspeed/sdram_ast2500.c
+++ b/drivers/ram/aspeed/sdram_ast2500.c
@@ -278,7 +278,6 @@ static void ast2500_sdrammc_calc_size(struct dram_info *info)
 			 << SDRAM_CONF_CAP_SHIFT));
 }
 
-#ifdef CONFIG_ASPEED_ECC
 static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2500_sdrammc_regs *regs = info->regs;
@@ -313,7 +312,6 @@ static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 	writel(0x400, &regs->ecc_test_ctrl);
 	printf("ECC enable, ");
 }
-#endif
 
 static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
 {
@@ -370,14 +368,12 @@ static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
 
 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
 
-#ifdef CONFIG_ASPEED_ECC
 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
 		u32 ecc_size;
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
 		ast2500_sdrammc_ecc_enable(priv, ecc_size);
 	}
-#endif
 
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 6287c45365dd..7f599ff24d69 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -859,7 +859,7 @@ static void ast2600_sdrammc_update_size(struct dram_info *info)
 
 	info->info.size = hw_size;
 }
-#ifdef CONFIG_ASPEED_ECC
+
 static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2600_sdrammc_regs *regs = info->regs;
@@ -890,7 +890,6 @@ static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 	writel(BIT(31), &regs->intr_ctrl);
 	writel(0, &regs->intr_ctrl);
 }
-#endif
 
 static int ast2600_sdrammc_probe(struct udevice *dev)
 {
@@ -988,14 +987,12 @@ L_ast2600_sdramphy_train:
 	}
 #endif
 
-#ifdef CONFIG_ASPEED_ECC
 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
 		u32 ecc_size;
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
 		ast2600_sdrammc_ecc_enable(priv, ecc_size);
 	}
-#endif
 
 	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
 	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
index 54c7769b5bbe..25238bf28d32 100644
--- a/drivers/ram/aspeed/Kconfig
+++ b/drivers/ram/aspeed/Kconfig
@@ -44,13 +44,6 @@ config ASPEED_BYPASS_SELFTEST
 	  Say Y here to bypass DRAM self test to speed up the boot time
 endif
 
-config ASPEED_ECC
-	bool "aspeed SDRAM error correcting code"
-	depends on DM && OF_CONTROL && ARCH_ASPEED
-	default n
-	help
-	  enable SDRAM ECC function
-
 choice
 	prompt "DDR4 PHY side ODT"
 	default ASPEED_DDR4_PHY_ODT40
-- 
2.35.1

