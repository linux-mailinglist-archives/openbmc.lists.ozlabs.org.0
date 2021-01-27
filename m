Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A03053E8
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:06:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZQD1wLdzDqx9
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e95W1EfD; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJd4Jq1zDqh2
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:21 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id e9so765047pjj.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eqJXMrIPoHTWewbIVaWKvd4jSZAuGf0QJFLWnTo9MTs=;
 b=e95W1EfDl3/S8/7WkfRAM4GDZHrp6z/oPyxHHRFFZbQIYPH48LziuwbFr9WQt5I6Bw
 SKAgvZkSBICqnwQALTp2YulD0WCUjGHnms8bvuhEqpdKKye44vA7Qj5LE0kuEVPBqb4T
 9XJzgXLl4gcAbNTKF9tWpfFbTh2TKirZwH0pjaWCvsuAIWVlsxkvtLXltX0vzrNYPsdc
 OTU9bF9nkfNEO3xxHLhWthmCftz3DfLgxIwvdwaGqICT7T+zuJCBTc7hFpRvYjdgcruC
 GpQljd/rOdVHgTSB3x/++38OmCt8YsevTAb5kwNKGOxrrf6vedzFVYGtxTh1s8BjNL7J
 9Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eqJXMrIPoHTWewbIVaWKvd4jSZAuGf0QJFLWnTo9MTs=;
 b=ViVgOAc44AbM6L9sFKjXJBGK0Pnau4wvTLXuVN2+SdZ5fv2IyC+8CoYVeamkdnfve8
 4Zex4vVm5vqQKWOySGkRwJW24+pDSFukMYB2E6CgWbBG15cZ3twKsYYuHbRv4OqG/mBT
 1y0ajKlySvt2ToDKHV+xtuMFBZXCfDHmO7E50d3zc1m+xCYyxpzFhiw8avE49KS/EQea
 XovnaQHMhdR8iJCP7zhFZ/4B8L+xqLzELdQRvBeV7mzC+6sLmXBNrSKXKqwvajsuyYpi
 uziehl72FlQQh3xpOv80P5AaVtbYuo3/xBvuX6zIOjJ+WC7oEZLC3X2v+wcG7Upmjxe0
 kG0g==
X-Gm-Message-State: AOAM530Dmooh/hSMPlMEWMrpagPLmCGL08AbcrPK5EchvdGO/9uoPYff
 NHqvpdDWDVMR7rCTCZ1rXn8=
X-Google-Smtp-Source: ABdhPJxY5frjbL1nMnLS/ABr/bRJiv1LcuI8Sc558eIvUjigfTYWfhGqd51/ugQ4ruolhB6/cgwV3Q==
X-Received: by 2002:a17:90a:a394:: with SMTP id
 x20mr4020293pjp.24.1611730878726; 
 Tue, 26 Jan 2021 23:01:18 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:17 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/6] ast2600: Allow
 selection of SPL boot devices
Date: Wed, 27 Jan 2021 17:30:51 +1030
Message-Id: <20210127070054.81719-4-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
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

The AST2600 SPL can boot from a number of sources, with or without the
AST2600 secure boot feature. It may be desirable to disable some of
these, so put them behind the defines for the drivers that are used.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ++++++++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index dd991e87c795..518f41b558d3 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -53,6 +53,18 @@ config TARGET_SLT_AST2600
 
 endchoice
 
+config ASPEED_SECBOOT_BL2
+	bool "ASPEED secure boot BL2 support"
+	depends on ASPEED_AST2600
+	help
+	  Enable ASPEED's "secboot" secure boot support for verifying
+	  the SPL's playload ("BL2").
+
+	  Enable this is if you're using secure boot support in the AST2600 (or similar)
+	  to verify your u-boot proper.
+
+	  Disable this is if you are using u-boot's vboot to verify u-boot.
+
 source "board/aspeed/evb_ast2600a0/Kconfig"
 source "board/aspeed/evb_ast2600a1/Kconfig"
 source "board/aspeed/ncsi_ast2600a0/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
index 58a22f646e08..98cf72bf440d 100644
--- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
+++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
@@ -42,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
 
+#if IS_ENABLED(CONFIG_SPL_MMC_SUPPORT)
 static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -101,6 +102,7 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("MMC", 0, ASPEED_BOOT_DEVICE_MMC, aspeed_spl_mmc_load_image);
 
+#if IS_ENABLED(ASPEED_SECBOOT_BL2)
 static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -161,7 +163,10 @@ static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("MMC with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_MMC, aspeed_secboot_spl_mmc_load_image);
+#endif /* ASPEED_SECBOOT_BL2 */
+#endif
 
+#if IS_ENABLED(CONFIG_SPL_YMODEM_SUPPORT)
 static int getcymodem(void)
 {
 	if (tstc())
@@ -204,6 +209,8 @@ end_stream:
 }
 SPL_LOAD_IMAGE_METHOD("UART", 0, ASPEED_BOOT_DEVICE_UART, aspeed_spl_ymodem_load_image);
 
+
+#if IS_ENABLED(ASPEED_SECBOOT_BL2)
 static int aspeed_secboot_spl_ymodem_load_image(struct spl_image_info *spl_image,
 		struct spl_boot_device *bootdev)
 {
@@ -245,3 +252,5 @@ end_stream:
 	return ret;
 }
 SPL_LOAD_IMAGE_METHOD("UART with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_UART, aspeed_secboot_spl_ymodem_load_image);
+#endif /* ASPEED_SECBOOT_BL2 */
+#endif
-- 
2.29.2

