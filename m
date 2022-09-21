Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FB5BF59A
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXR0x3b2Cz3c23
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:54:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KxWsvtOe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KxWsvtOe;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXR0Y3Zqrz3bXZ
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:54:37 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id e5so4784080pfl.2
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=imripP+hAKAXbGb4Gv/JfQu/46jbnO3XCGnMOq7n0rY=;
        b=KxWsvtOe01cS65Gj49LqOvJqKhMluZziH8cKBswC27NvisW96PZhHSwH7rxS63Nldm
         JVLvXVRBZjATqR2M3BtBvlMucMC3HTSjGgaWioWhGtoof7AgX+8S1Dw7dOzW8rQdEBVs
         +I83txg5eRf1Edyw1DjfFB7fZcbgyogrme91E99Y8oQK4Xe/a85oViOtE55Sr5L+cAGD
         rZiN4TUYd0dJZGyZZFFwIDdQcbHuaq4TI0ftxwlYMv2xDH8b03Tj7/UQbB+In7Ruf18G
         tUl/+D6Oi9lev4q35CG/2xel5n/cFYq2VFalGIL7UnQ892GVHGlttT83nbx0+0fvO4yY
         1epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=imripP+hAKAXbGb4Gv/JfQu/46jbnO3XCGnMOq7n0rY=;
        b=Yuh22dmpdJBYHzHivsgzbw8/fQZxapM3DbVP0gTqiRlUBlyW/gfGYYkP+GGZ78gd+L
         bVriJFKuc7MYIc8tDppJGFhGWNeCRwcZPDnnYoy/vA961p6W+8DyksDg5ppJ9kVEyciT
         1aKkLFljA4wpziRohCC4v1iHym8lbA7yS54xF5OTcr+Ug688D/iNDXB1THeD/Uc37O/O
         xuFWc0udBtPCsR8Lr4oMCZKCWSn2DfT1FlcASq7PTscEP7r4gkwzgJM6I64pjkVnNbsp
         Ar4VlkEu2MHmxmVtceVxVDLZ7K/n6+G4plWtpr9ZRPoFPR03m0pEpDKBjBI+JuRGGHtc
         TdoA==
X-Gm-Message-State: ACrzQf1DFEnyC7YW/JENLmSuV5l7P2ZRw3/DUkt2PaPRXSDdS5JKqTnl
	vtHPwU7HD/YV1UmTw/5TDPR/6wexGjQ=
X-Google-Smtp-Source: AMsMyM7BprO1px6jxYqQ+Heh6NKj10oZQms3w7o7ir5bwnZUWAGvbfnyJ0l0H89mUmqEQZ+iqJiCHw==
X-Received: by 2002:a05:6a00:1493:b0:546:2856:6d08 with SMTP id v19-20020a056a00149300b0054628566d08mr27157789pfu.84.1663736074961;
        Tue, 20 Sep 2022 21:54:34 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902d2c800b00174d9bbeda4sm819918plc.197.2022.09.20.21.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 21:54:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/3] aspeed/sdram: Use device tree to configure ECC
Date: Wed, 21 Sep 2022 14:24:18 +0930
Message-Id: <20220921045420.2116037-2-joel@jms.id.au>
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
v2:
  Change property to be aspeed,ecc-size-mb
  Fix printing of size to use mb

 drivers/ram/aspeed/sdram_ast2500.c | 14 ++++++++++----
 drivers/ram/aspeed/sdram_ast2600.c | 14 ++++++++++----
 drivers/ram/aspeed/Kconfig         | 13 -------------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index 435e1a8cfc1d..9bf4906b5939 100644
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
+		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
+		ast2500_sdrammc_ecc_enable(priv, ecc_size);
+	}
 #endif
+
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
 	       | SDRAM_REQ_USB20_EHCI2
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

