Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AD136528E
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ6c2HhZz2yxm
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=G2+Xl90c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G2+Xl90c; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ492B59z2yxk
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:21 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id z16so25924054pga.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0z+7cXo/TpzSXP3kAMFJ2B3Hhn0SutehgT0Y6iTyw8=;
 b=G2+Xl90c7xaCSlE3oKcZlVnzTd6UM0F0FNYji9LWIoF/YZl7OMrXgQI6u3V1wzoJIK
 m0m2otXoI1Z/4TvcP8uVTbfcldtwPoRzWNdNC/fjfPqdlm5KeV0r6NQ/5tzgM6Mp2CBN
 ZDhdybsJ2c4FiPr68YY7ygQSdMv4HDAKo0Z/7T34NCbIloMIkMmgSQeMFm+6Tkfag5xQ
 fjecwO55HQPQF30P+l7I00rc4opvuTTOShjuHI1OF/uxsEOV8VO7563AFfadCC0IKmxR
 /dZkm6byNm4YcqtxBDoScVnzoOIkndAV/7TypVGy0GT6U26wu5LsxKeYtWIyJkIbFU3X
 x0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H0z+7cXo/TpzSXP3kAMFJ2B3Hhn0SutehgT0Y6iTyw8=;
 b=ZrzxmE2BWJAe0IEhecBIr2ChF6Gkmnxu7AA8ZQNQ8epzwfPTzCRgMhYla75Jfu3NSY
 /oYEAQag72a6NLupO60S7OAMaD3wwZTTAjMOza/Hvp8gapFFar6+gKucFsoXDcNR5UkN
 MNjY3aKOPxDYs/hVYA8+OvD0zGpaLpMPTNfEfY1eGmeJSi5WLO2zt3R2xxDXLiKzT2eK
 lsgkuWn0sXsvQ3g1+HAqa8HAj5CW5DamymayOStOJw5TZ87bahWMUB1pFPVYG2MgvYjs
 0Ws2+u2pvtvLjOvXhx8rvn4H7a2OR7WXZZdhQS2+UcVryCbA+m/k67+tMPi78PrwGjyA
 hmvw==
X-Gm-Message-State: AOAM533nioGTIFmn7YxQeST2jLa0P+8NFVFWvArCWVHcU8aABf6wIvDx
 VFa15CkFw+HsGdhzU2mPH7qN9LI6mZk=
X-Google-Smtp-Source: ABdhPJz1PTd2N2xk0yOEdM2HapuFXpf9igbz7AOn+aBb4QUkmmpbGqg0YMhd04M7CQrKQEl4DeoY5w==
X-Received: by 2002:a65:6184:: with SMTP id c4mr15390009pgv.200.1618901238186; 
 Mon, 19 Apr 2021 23:47:18 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 05/10] ast2600: spl: Remove
 SECBOOT BL2 kconfig option
Date: Tue, 20 Apr 2021 16:16:43 +0930
Message-Id: <20210420064648.994075-6-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

THis option was added in "ast2600: Allow selection of SPL boot devices"
to allow disabling the secboot BL2 loaders. Instead of adding the new
symbol the patch could have used the existing ASPEED_SECURE_BOOT option.

Change to use the existing option.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ------------
 arch/arm/mach-aspeed/ast2600/spl_boot.c | 17 +++++++----------
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index 518f41b558d3..dd991e87c795 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -53,18 +53,6 @@ config TARGET_SLT_AST2600
 
 endchoice
 
-config ASPEED_SECBOOT_BL2
-	bool "ASPEED secure boot BL2 support"
-	depends on ASPEED_AST2600
-	help
-	  Enable ASPEED's "secboot" secure boot support for verifying
-	  the SPL's playload ("BL2").
-
-	  Enable this is if you're using secure boot support in the AST2600 (or similar)
-	  to verify your u-boot proper.
-
-	  Disable this is if you are using u-boot's vboot to verify u-boot.
-
 source "board/aspeed/evb_ast2600a0/Kconfig"
 source "board/aspeed/evb_ast2600a1/Kconfig"
 source "board/aspeed/ncsi_ast2600a0/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
index 06800940109e..517f3a767c82 100644
--- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
+++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
@@ -23,7 +23,7 @@ static int aspeed_spl_ram_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("RAM", 0, ASPEED_BOOT_DEVICE_RAM, aspeed_spl_ram_load_image);
 
-#if IS_ENABLED(ASPEED_SECBOOT_BL2)
+#if IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT)
 static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -42,9 +42,8 @@ static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
-#endif /* ASPEED_SECBOOT_BL2 */
+#endif /* IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT) */
 
-#if IS_ENABLED(CONFIG_SPL_MMC_SUPPORT)
 static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -104,7 +103,7 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("MMC", 0, ASPEED_BOOT_DEVICE_MMC, aspeed_spl_mmc_load_image);
 
-#if IS_ENABLED(ASPEED_SECBOOT_BL2)
+#if IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT)
 static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -165,8 +164,7 @@ static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("MMC with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_MMC, aspeed_secboot_spl_mmc_load_image);
-#endif /* ASPEED_SECBOOT_BL2 */
-#endif
+#endif /* IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT) */
 
 #if IS_ENABLED(CONFIG_SPL_YMODEM_SUPPORT)
 static int getcymodem(void)
@@ -211,8 +209,7 @@ end_stream:
 }
 SPL_LOAD_IMAGE_METHOD("UART", 0, ASPEED_BOOT_DEVICE_UART, aspeed_spl_ymodem_load_image);
 
-
-#if IS_ENABLED(ASPEED_SECBOOT_BL2)
+#if IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT)
 static int aspeed_secboot_spl_ymodem_load_image(struct spl_image_info *spl_image,
 		struct spl_boot_device *bootdev)
 {
@@ -254,5 +251,5 @@ end_stream:
 	return ret;
 }
 SPL_LOAD_IMAGE_METHOD("UART with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_UART, aspeed_secboot_spl_ymodem_load_image);
-#endif /* ASPEED_SECBOOT_BL2 */
-#endif
+#endif /* IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT) */
+#endif /* IS_ENABLED(CONFIG_SPL_YMODEM_SUPPORT) */
-- 
2.30.2

