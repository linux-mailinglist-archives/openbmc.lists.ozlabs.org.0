Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92D5095F4
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 06:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkPcZ0bM8z3bWY
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 14:26:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=eQtE6J+4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=eQtE6J+4; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjxdN081Fz2xrx
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 20:25:26 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id s18so2651276ejr.0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62+tWCildg4BskGCnt3B+Ku+s+o6jqcrZuRdSsLGv0k=;
 b=eQtE6J+43VoSTx/nRq3npH35slnWWovfVTy9Jm6YqomDnVMKf3oxySWqwfgbi0IfPr
 SOgMMANfNoJqTnvcHS8qpm6QMqWp+Kl84c2Mc9nMZTrpIIoymVYckf06GFWLja474tIO
 qqz43w8LgsSakO/bexYsN20R0qWMpbUJ9UYEkqTfepkPLeqpHUHrlMzxSMYf0Ix5lIh/
 tUXhX917bZ7DvyCXlMqAnJ6C0TV9O6fYMBd/Y9iNkXNCHrzx1kPVVSFZhbg7RNkQBXPk
 UV7LXZxaHu1oypNqyWYaErd+BVPDvShgZBJxC1yWrMWHZnvaJPIf7KG2DUjgRl4Bi4KZ
 0rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62+tWCildg4BskGCnt3B+Ku+s+o6jqcrZuRdSsLGv0k=;
 b=Q/0uu3qmTi2upxjqmHF9jNoXRTyoMMZA7hhY3gSTPhePtpTZUi6BPzBnZzUAXtrMLJ
 H6ruo14VXR54ogCV2Xfjhguj/dhn9A7uXENuV5gmpl0QKMjstcnk96I0a4raQQTA5x1u
 9PGRvUV+y6a2uBd7ciu0gp+96yEwl1liTUCpiWu7yHbs440+UXYiOVf3EUaO7lazVTxQ
 Z9dGiMZTSWpUj3YBReP61CB3/vSzt8g127AhQZRacsZkYsWJxKJHDc24ReiFyYWl5V15
 ghM2g5iH+XNHu65ZvI+poQ4AfD0uEWT/YrtA7Dq1bewZEZY5/mCSOb2/Ok3L5ZKqv/Yt
 GemQ==
X-Gm-Message-State: AOAM532adRQoiW5KVslc7/NyNjgfre1CbWfqkXRD1LjN1PEqW6nO9+zO
 Wo5qYXZthcNlLinotg0XZaKR5w==
X-Google-Smtp-Source: ABdhPJxmeKubQx038ONHv9RU+HQUuYGeO59xIhMZw4pT3fZIT4jMyJ5/Dan9jgBkjSadBaaFfxnKAA==
X-Received: by 2002:a17:907:720d:b0:6e8:9f19:7520 with SMTP id
 dr13-20020a170907720d00b006e89f197520mr17715412ejc.552.1650450323516; 
 Wed, 20 Apr 2022 03:25:23 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-005-146-070-114.um05.pools.vodafone-ip.de. [5.146.70.114])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a056402020c00b00422e7556951sm7431346edv.87.2022.04.20.03.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 03:25:23 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] arm/mach-aspeed: Allow to
 disable WDT2
Date: Wed, 20 Apr 2022 12:25:01 +0200
Message-Id: <20220420102502.1791566-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 14:24:52 +1000
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There's no working code to poke the WDT2 and it takes too long for the
kernel to load to poke the watchdog. Selecting this Kconfig disables
the WDT2 and prevents 2nd firmware from being launched during normal boot.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/mach-aspeed/ast2500/Kconfig    | 6 ++++++
 arch/arm/mach-aspeed/ast2500/platform.S | 6 ++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
index 232117b43c..a9d880e557 100644
--- a/arch/arm/mach-aspeed/ast2500/Kconfig
+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
@@ -33,6 +33,12 @@ config DRAM_UART_TO_UART1
 	help
 	  Route debug UART to TXD1/RXD1 pins.
 
+config FIRMWARE_DISABLE_2ND_BOOT
+	bool
+	prompt "Do not disable WDT2 for 2nd boot function"
+	help
+	  Do not disable WDT2 for 2nd boot function.
+
 source "board/aspeed/evb_ast2500/Kconfig"
 source "board/ibm/genesis3/Kconfig"
 
diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
index aef55c4a0a..3eb9ee9419 100644
--- a/arch/arm/mach-aspeed/ast2500/platform.S
+++ b/arch/arm/mach-aspeed/ast2500/platform.S
@@ -95,7 +95,7 @@
  *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
  *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
  * 5. Firmware 2nd boot flash
- *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
+ *    CONFIG_FIRMWARE_DISABLE_2ND_BOOT
  * 6. Enable DRAM extended temperature range mode
  *    CONFIG_DRAM_EXT_TEMP
  * 7. Select WDT_Full mode for power up initial reset
@@ -642,13 +642,11 @@ bypass_USB_init:
 /******************************************************************************
  Disable WDT2 for 2nd boot function
  ******************************************************************************/
-/*
-#ifndef CONFIG_FIRMWARE_2ND_BOOT
+#if CONFIG_FIRMWARE_DISABLE_2ND_BOOT
     ldr   r0, =0x1e78502c
     mov   r1, #0
     str   r1, [r0]
 #endif
-*/
 /******************************************************************************
  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
  ******************************************************************************/
-- 
2.35.1

