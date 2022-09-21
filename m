Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9285BF809
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVnS4bFyz3blj
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:45:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nqmPsSfq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nqmPsSfq;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVn522Mlz2xYn
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:44:56 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id w2so5164568pfb.0
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=xiRxefpHLOsBJxDhaDGIZk8zjmUdAK3HNTS9pF++zcs=;
        b=nqmPsSfqkQ2EY0FA1FtVP2zlJ/aC93AsEAd/z3euEQYzm4MWmMOGIn+nxjaxm2Z3cU
         c5S3/3HnwZRLQ05FT7owHV1fWc8oXZiYdxhUhfoxEGbcrmTOY16iGmoE2vvj93zXhw+G
         E2eRyIqUbB64jKB8c2ibhh5fcJoNkaUVbv9S442NiZbisV136te8UhJCwAYW5288Rk0j
         /q+ugrZu+o5uF8ew23WSo+b3q0k+C3UH9/sEgb89CTnn6cb7NVbYSdwYSSc3oKMO/7Ts
         CR3ytxs7ooW3bGPzXcfiWcxl7/3e6G9TWch9F5ugv+uXGKz3Qi7kCLT7kqF1Wj/3aG+J
         vu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=xiRxefpHLOsBJxDhaDGIZk8zjmUdAK3HNTS9pF++zcs=;
        b=UiR4+8wKlHt95E4eGzyO7tp4QoKbNJOfWaRK3PCko62z1Hbs28JFY3b5+6i3/3G/7a
         I52oL3B3vK+5e4uD5wH28TGHE+d4rL7A25lkIbY/H9UtBkRzcAV1m+3gfCsL6iRyPY/J
         VeC81YEqBPFbolkiLnH/Z6oJpwaxCL8caUTk+A9qncdTIlcPXayaAeW4SGuk96A3Qyvd
         IhgJOQwuVgKceiMv3Fum8hsMa5h+pSofH0a5ax/UVUomsvVAsFjf7gEkabfVTJZm2a5q
         DmDxV88BAzGjnabeQOQz3+y6OWF4928IbulIaugh91IpRvHdipZBAdOcCNCy4YIChwJb
         X2Qg==
X-Gm-Message-State: ACrzQf2RagLGt3trs7RzxdClVidzdo0LyFnC77jSbXZc6cpgl0I9z+GQ
	PO2cHZgWcKiK2K4rRnkWPVKOwhSc45M=
X-Google-Smtp-Source: AMsMyM4mAgso95q6+8xSv24m7pQTZGwckmsNqdNNa/qDlualZmQBl0WRj+x6IrQd/iu5Bpno4dnxKw==
X-Received: by 2002:a05:6a00:8c8:b0:52c:887d:fa25 with SMTP id s8-20020a056a0008c800b0052c887dfa25mr27316426pfu.86.1663746294054;
        Wed, 21 Sep 2022 00:44:54 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090a121600b001f22647cb56sm1192339pja.27.2022.09.21.00.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:44:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/4] ram/aspeed: Use device tree to configure ECC
Date: Wed, 21 Sep 2022 17:14:36 +0930
Message-Id: <20220921074439.2265651-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921074439.2265651-1-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
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

Instead of configuring ECC based on the build config, use a device tree
property to selectively enable ECC at runtime.

There are two properties:

  aspeed,ecc-enabled;
  aspeed,ecc-size-mb = "512";

The enabled property is a boolean that enables ECC if it is present.

The size is the number of MB that should be covered by ECC. Setting it
to zero, or omitting it, defaults the ECC size to "auto detect".

  edac: sdram@1e6e0000 {
    compatible = "aspeed,ast2600-sdram-edac";
    reg = <0x1e6e0000 0x174>;
    interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
    aspeed,ecc-enabled;
    aspeed,ecc-size-mb = "512";
  };

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
  Fix types for ast2500 case
v2:
  Change property to be aspeed,ecc-size-mb
  Fix printing of size to use mb
---
 drivers/ram/aspeed/sdram_ast2500.c | 19 +++++++++++++------
 drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
 drivers/ram/aspeed/Kconfig         | 13 -------------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index 435e1a8cfc1d..79760975be44 100644
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
@@ -315,8 +315,9 @@ static void ast2500_sdrammc_ecc_enable(struct dram_info *info)
 }
 #endif
 
-static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
+static int ast2500_sdrammc_init_ddr4(struct udevice *dev)
 {
+	struct dram_info *info = dev_get_priv(dev);
 	int i;
 	const u32 power_control = SDRAM_PCR_CKE_EN
 	    | (1 << SDRAM_PCR_CKE_DELAY_SHIFT)
@@ -371,8 +372,14 @@ static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
 
 #ifdef CONFIG_ASPEED_ECC
-	ast2500_sdrammc_ecc_enable(info);
+	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
+		u32 ecc_size;
+
+		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
+		ast2500_sdrammc_ecc_enable(info, ecc_size);
+	}
 #endif
+
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
 	       | SDRAM_REQ_USB20_EHCI2
@@ -477,7 +484,7 @@ static int ast2500_sdrammc_probe(struct udevice *dev)
 
 	ast2500_sdrammc_init_phy(priv->phy);
 	if (readl(&priv->scu->hwstrap) & SCU_HWSTRAP_DDR4) {
-		ast2500_sdrammc_init_ddr4(priv);
+		ast2500_sdrammc_init_ddr4(dev);
 	} else {
 		debug("Unsupported DRAM3\n");
 		return -EINVAL;
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 5118b14f8708..2a4d6af57eb3 100644
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
+		       conf_size_mb,
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
+		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
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

