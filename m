Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EA59671A
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 04:01:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6rpk4k1Hz3c4x
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 12:01:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LSH1spz8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LSH1spz8;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6rnR0Py4z3bmD
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 12:00:10 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id q19so10892481pfg.8
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc;
        bh=1JrxaPp3DKk/5NL5SCCV7rBSTP3WrH6vWQ1NFrTM8Lk=;
        b=LSH1spz8NDQ0IR1Ed/JhQ0gJIXMSwRdAIvKVlERXtpYe6/5Hygd1ro6+qSUonlHxo8
         9WjGH2L9F/O1Oni496ehoylKqsm3M4izoQF/2MohzDyMXlnXMrC3Xepb0NFsRTAHYPgR
         zMhq3lagLE3R3uLDisyFumurq2Bb2msQohz+3y+BCSl9CnbdK4kfjUolz7MU2jz232Ok
         9jLQkgbD3g0wO8NDzCf9dwwObVLs/ibJ1Vy44pdcIO1GPAU15kug3M0NMw6LEMq6M90o
         OPwTwsF31geadPwRO1e28PbLcS3EOQoLj0f0bOH4EZK9gYJlGOhO1SaYed6pVT2/z2Vg
         OMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc;
        bh=1JrxaPp3DKk/5NL5SCCV7rBSTP3WrH6vWQ1NFrTM8Lk=;
        b=hs0YfrUNbA90w7HxOcosWRmo2Khx03UuSsRBNT8scw0SmJ+DIMgY3E05a+NnxIHq4P
         zcVtYek7F0a+AzFegfvu3c3cS5oyaxqq9scs8Dqvavyo7RFtInWXlZcIjjXeoI0sCNp2
         lOAfQJ+7FdWDzaIv3ynNkxH25fYt9iJAPHvu2pAuv79u7RrHmZZk56WRGBdIe2KKXTSN
         0FRt6WVpa+PtYuFDpbZBCxsxfCjy1+wq/QxjLPxCX3m0gzylH7lQn3J6Vbo5Iqdn7Ccp
         ZKn2SJGGyyUK0uiI550aMaf5ZbnwXrRWSTEaU7b1RQrrLWbO4eIN1DP1O4X0t1HdY8gu
         6bQw==
X-Gm-Message-State: ACgBeo3nEOYvtY4XDBLf7bYsqvS6i6VBJnX3wQNog70ejxKvfUrivwZt
	SSQcUYrVH/EJIGF6iV0+/hCTFyAQuXg=
X-Google-Smtp-Source: AA6agR5uYR6JbuoDPSRVBcO48k37hUuEwCpNToZo7RM9yvrT+UJtHizB3pNK1DUZihjuA60m1O4CvQ==
X-Received: by 2002:aa7:8317:0:b0:52d:640e:322e with SMTP id bk23-20020aa78317000000b0052d640e322emr23436516pfb.4.1660701608127;
        Tue, 16 Aug 2022 19:00:08 -0700 (PDT)
Received: from voyager.thelocal (2403-5808-8af8--7926-51ea-3ff2-71dd.ip6.aussiebb.net. [2403:5808:8af8:0:7926:51ea:3ff2:71dd])
        by smtp.gmail.com with ESMTPSA id d16-20020a17090a02d000b001f10c959aa2sm212675pjd.42.2022.08.16.19.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 19:00:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Dylan Hung <dylan_hung@aspeedtech.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use device tree to configure ECC
Date: Wed, 17 Aug 2022 11:59:48 +1000
Message-Id: <20220817015949.16946-2-joel@jms.id.au>
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

Instead of configuring ECC based on the build config, use a device tree
property to selectively enable ECC at runtime.

There are two properties:

  aspeed,ecc-enabled;
  aspeed,ecc-size = "512";

The enabled property is a boolean that enables ECC if it is present.

The size is the number of MB that should be covered by ECC. Setting it
to zero, or omitting it, defaults the ECC size to "auto detect".

  edac: sdram@1e6e0000 {
    compatible = "aspeed,ast2600-sdram-edac";
    reg = <0x1e6e0000 0x174>;
    interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
    aspeed,ecc-enabled;
    aspeed,ecc-size = "512";
  };

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/ram/aspeed/sdram_ast2500.c | 14 ++++++++++----
 drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
 drivers/ram/aspeed/Kconfig         | 13 -------------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index 435e1a8cfc1d..ca3b54295bf0 100644
--- a/drivers/ram/aspeed/sdram_ast2500.c
+++ b/drivers/ram/aspeed/sdram_ast2500.c
@@ -279,16 +279,16 @@ static void ast2500_sdrammc_calc_size(struct dram_info *info)
 }
 
 #ifdef CONFIG_ASPEED_ECC
-static void ast2500_sdrammc_ecc_enable(struct dram_info *info)
+static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2500_sdrammc_regs *regs = info->regs;
 	size_t conf_size;
 	u32 reg;
 	
-	conf_size = CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
+	conf_size = conf_size_mb * SDRAM_SIZE_1MB;
 	if (conf_size > info->info.size) {
 		printf("warning: ECC configured %dMB but actual size is %dMB\n",
-		       CONFIG_ASPEED_ECC_SIZE,
+		       conf_size_mb,
 		       info->info.size / SDRAM_SIZE_1MB);
 		conf_size = info->info.size;
 	} else if (conf_size == 0) {
@@ -371,8 +371,14 @@ static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
 
 #ifdef CONFIG_ASPEED_ECC
-	ast2500_sdrammc_ecc_enable(info);
+	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
+		u32 ecc_size;
+
+		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
+		ast2500_sdrammc_ecc_enable(priv, ecc_size);
+	}
 #endif
+
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
 	       | SDRAM_REQ_USB20_EHCI2
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 5118b14f8708..6287c45365dd 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -860,16 +860,16 @@ static void ast2600_sdrammc_update_size(struct dram_info *info)
 	info->info.size = hw_size;
 }
 #ifdef CONFIG_ASPEED_ECC
-static void ast2600_sdrammc_ecc_enable(struct dram_info *info)
+static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2600_sdrammc_regs *regs = info->regs;
 	size_t conf_size;
 	u32 reg;
 
-	conf_size = CONFIG_ASPEED_ECC_SIZE * SDRAM_SIZE_1MB;
+	conf_size = conf_size_mb * SDRAM_SIZE_1MB;
 	if (conf_size > info->info.size) {
 		printf("warning: ECC configured %dMB but actual size is %dMB\n",
-		       CONFIG_ASPEED_ECC_SIZE,
+		       conf_size,
 		       info->info.size / SDRAM_SIZE_1MB);
 		conf_size = info->info.size;
 	} else if (conf_size == 0) {
@@ -989,8 +989,14 @@ L_ast2600_sdramphy_train:
 #endif
 
 #ifdef CONFIG_ASPEED_ECC
-	ast2600_sdrammc_ecc_enable(priv);
+	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
+		u32 ecc_size;
+
+		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size", 0);
+		ast2600_sdrammc_ecc_enable(priv, ecc_size);
+	}
 #endif
+
 	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
 	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
 	ast2600_sdrammc_lock(priv);
diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
index 924e82b19430..54c7769b5bbe 100644
--- a/drivers/ram/aspeed/Kconfig
+++ b/drivers/ram/aspeed/Kconfig
@@ -51,19 +51,6 @@ config ASPEED_ECC
 	help
 	  enable SDRAM ECC function
 
-if ASPEED_ECC
-config ASPEED_ECC_SIZE
-	int "ECC size: 0=driver auto-caluated"
-	depends on ASPEED_ECC
-	default 0
-	help
-	  SDRAM size with the error correcting code enabled. The unit is 
-	  in Megabytes.  Noted that only the 8/9 of the configured size 
-	  can be used by the system.  The remaining 1/9 will be used by 
-	  the ECC engine.  If the size is set to 0, the sdram driver will 
-	  calculate the SDRAM size and set the whole range be ECC enabled.
-endif
-
 choice
 	prompt "DDR4 PHY side ODT"
 	default ASPEED_DDR4_PHY_ODT40
-- 
2.35.1

