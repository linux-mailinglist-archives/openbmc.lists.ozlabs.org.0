Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE25BF5A2
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:56:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXR2K18ldz3bXZ
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lKn2FwbF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lKn2FwbF;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXR0c4GfDz3bkG
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:54:40 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so4628744pjl.0
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=B6wrRand9OIMyssy8tjd8aIS1c0Kw08gD9pY1qUk3Bk=;
        b=lKn2FwbFOll/lXXMRuiqMfbcY4D8VU/fiwRQTqWx0aoNdqpAUIyisDrpzLWMS6PGJ8
         7UU1Tp+JEp/ZdVqTGGZskp+fsRZnHXYBhd0IBQOjb0Edi7DX5/evIYIePaCfclIE95A0
         jbqBD2xhsOiMD1leEncg4Ivt/jMNPrLMXJ4z2PLiHe97H/krg0cYfLe7ONJS+XOGUwVC
         w2ctYmzBk95p0bOaDeTY/SuKWnPaNanjnvyzRwLLlKWjnfyjUXPx3u7nu/dH+Dobwep/
         MYVNRaAMS0F2yaP5n33RWocluSBTo9RvRyQ+wvJeG3fkKCDSDQPiyAPkviBmg3zWJeBY
         7Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=B6wrRand9OIMyssy8tjd8aIS1c0Kw08gD9pY1qUk3Bk=;
        b=DQ66VNtOgEXWxd5JZXNrd1lBx6n8dzO41UGrQt4gYMMN4XxDAHVxvZTGfZas/MQB8i
         4lpi4fZFw7Ju8LfYOB5n4Xskcn1YLhCAuI2UJLo95fdbcfG2OfU2baX5rnxL8lqa2LoQ
         GqGl3Oco3BjSVrsXdXo84VZwi8fTSP6V8x8XRNPQUDCBbH1Z/CbXcGX7IlmSR+C0VpFJ
         ka23MF85Od18nyzhSuS+7Z0dDwmImGYlXdN56ukqRoaBx5sqqdT58Klw8JEiF6brkmxC
         FKkLaq7V9WW84xhs5YXeMMdg7+zx5/NgxEkKMHLKrrBsRsDEi8IgDnARQWCbNhkC+ao+
         li/w==
X-Gm-Message-State: ACrzQf0ha5CbQSaqdAAFBsc6a1tL5VGT4ZXQpjcJFsla8SE6ir8800xM
	Za3NRPO+pD8RpM+untOIA1xgLotRjtk=
X-Google-Smtp-Source: AMsMyM5QuidRt8uB/HFKkwzr4THMKASqrRAYdY+KnIL0lM4N0xjJVgzO5xnMd63/1J52mJK0Up4raw==
X-Received: by 2002:a17:90a:8688:b0:202:91d7:6a53 with SMTP id p8-20020a17090a868800b0020291d76a53mr7583785pjn.153.1663736077751;
        Tue, 20 Sep 2022 21:54:37 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b00174d9bbeda4sm819918plc.197.2022.09.20.21.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 21:54:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/3] ram/aspeed: Remove ECC config option
Date: Wed, 21 Sep 2022 14:24:19 +0930
Message-Id: <20220921045420.2116037-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921045420.2116037-1-joel@jms.id.au>
References: <20220921045420.2116037-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
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
index 9bf4906b5939..ffad4fb18c8e 100644
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
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
 		ast2500_sdrammc_ecc_enable(priv, ecc_size);
 	}
-#endif
 
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 2a4d6af57eb3..5f7b160faddf 100644
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
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
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

