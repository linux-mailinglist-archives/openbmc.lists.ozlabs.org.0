Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04DE35E388
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:12:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKVx95j0vz3bqL
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 02:12:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=XGtpWeKj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wltu.bounces.google.com (client-ip=2607:f8b0:4864:20::849;
 helo=mail-qt1-x849.google.com;
 envelope-from=3ysj1yaqkbzejyghtbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--wltu.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XGtpWeKj; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKVww0mb4z2xYf
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 02:11:57 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id h26so1556168qtm.13
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pnTFg4THf7OdTA0/F0jNo8f8zSwPemkgmtp23YNdsVk=;
 b=XGtpWeKjFnyVZ75sntZuCnujqeg9VMSgNwlXCGqDYNdV1FC4jy5B9OY62yQicAEaY0
 d6AMKuUtPcuTjQd1vNOCPIdsY5eElVXMnCDD3f6vmjQdpBISVnUE14FTHMICVMi+JFn6
 dPGbcFWmKun878laaOCkNN0O/3ehqPRNp9C8199sH5ZQ2NJcASBds4gEOqDwekKzhHHP
 5CqcN2bpom9EsjE+GvueEbYcvhtqZ+N5OnNwYyautpw+I59QDk0Srqa+7QspZPftGR3l
 fJtS5FDAcwJPGODcs1rIE+UxIMCwBDjGMXH11sKJk+BdJQ/cMp4Jfi7nDTPTR06kgQdV
 iDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pnTFg4THf7OdTA0/F0jNo8f8zSwPemkgmtp23YNdsVk=;
 b=e1amGvPkrdpAjZw4oqoXaK9OW/eQpkKAnoNPNHxdfNP4Tgxb3CjsZuT8zdTJ4Iq/nf
 oHIDWFKk3bHG6mtK9etJcTtwAY8evetxM4vSBP4dJ7ckfZ9bGy9+L7yrIrSfPB5DXVKH
 kdqf+u6hw5iwtMH7irWiQ/t8Rwa4HQdUbcghYkAuxfGeMcE/WT8DLtjugeOfdKQ/a/2h
 l9iOm6mXcLhhs8SZMDPFVTq9LMnithbQRFzz6slP7XFXGsRe4JeD6kPo7RQnitan0Yyi
 988NPo437hQtO2dS/0FwCeTW9MqfJbUZqp0Th80hkvZnzDODm/sLY7hVbvrxspbG5Ofr
 42WA==
X-Gm-Message-State: AOAM532sEoyc6NBLWtoErN1hvDQlQjGuNE0ymhTkgYCSPLeu6usODXrD
 3cAWMZ4crly0SuJGVIV1TzUpM1MDM4L85S8ltFizVs3OyFm9172Vc1dvpbvWfmaXpwTfDY3Tecz
 /3buvHl+QLYEKQzWhIxBRpO0ZXsIDOjkAt4ggSlFMnsRkEVf/mX4Es1BSMWk=
X-Google-Smtp-Source: ABdhPJyf0jOI9bOj+yv2oseOQa/Bqf8MCxuC7aTzHqtyJL0AX86m7lc93BALheHGoNNhOElU8fZhqrRG
X-Received: from wltu.svl.corp.google.com ([2620:15c:2c5:3:dc07:df1f:1158:224])
 (user=wltu job=sendgmr) by 2002:a05:6214:2503:: with SMTP id
 gf3mr8140125qvb.61.1618330314061; Tue, 13 Apr 2021 09:11:54 -0700 (PDT)
Date: Tue, 13 Apr 2021 09:11:50 -0700
Message-Id: <20210413161150.2815450-1-wltu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH] board: ast2400: Enable SGPIO in SCU
From: Willy Tu <wltu@google.com>
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Willy Tu <wltu@google.com>, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add option to enable register for SGPIO in SCU.

Included new function register values for ast2400
SCU and enable the SGPIO function in board init.

Signed-off-by: Willy Tu <wltu@google.com>
---
 arch/arm/include/asm/arch-aspeed/scu_ast2400.h |  4 ++++
 arch/arm/mach-aspeed/ast2400/Kconfig           |  4 ++++
 arch/arm/mach-aspeed/ast2400/board_common.c    | 15 +++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
index 9c5d96ae84..17eaaf3e9d 100644
--- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
+++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
@@ -75,6 +75,10 @@
 #define SCU_PIN_FUN_SCL2		(1 << 14)
 #define SCU_PIN_FUN_SDA1		(1 << 13)
 #define SCU_PIN_FUN_SDA2		(1 << 15)
+#define SCU_PIN_FUN_SGPMCK		(0x1 << 8)
+#define SCU_PIN_FUN_SGPMLD		(0x1 << 9)
+#define SCU_PIN_FUN_SGPMO		(0x1 << 10)
+#define SCU_PIN_FUN_SGPMI		(0x1 << 11)
 
 #define SCU_D2PLL_EXT1_OFF		(1 << 0)
 #define SCU_D2PLL_EXT1_BYPASS		(1 << 1)
diff --git a/arch/arm/mach-aspeed/ast2400/Kconfig b/arch/arm/mach-aspeed/ast2400/Kconfig
index f76276860c..c4e88b5140 100644
--- a/arch/arm/mach-aspeed/ast2400/Kconfig
+++ b/arch/arm/mach-aspeed/ast2400/Kconfig
@@ -17,6 +17,10 @@ config TARGET_EVB_AST2400
 	  20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
 endchoice
 
+config ENABLE_SGPIO
+    tristate "Enable SGPIO in SCU"
+	default n
+
 source "board/aspeed/evb_ast2400/Kconfig"
 
 endif
diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c b/arch/arm/mach-aspeed/ast2400/board_common.c
index 3829b06934..eca2ef03e5 100644
--- a/arch/arm/mach-aspeed/ast2400/board_common.c
+++ b/arch/arm/mach-aspeed/ast2400/board_common.c
@@ -14,6 +14,21 @@ __weak int board_init(void)
 {
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 
+#ifdef CONFIG_ENABLE_SGPIO
+#define SCU_BASE 0x1e6e2000
+#define SCU_FUN_PIN_CTRL2 0x84 /* Multi-function Pin Control#2*/
+	/* Unlock SCU */
+	writel(SCU_UNLOCK_VALUE, SCU_BASE);
+
+	/* Enable SGPIO Master */
+	u32 reg = readl(SCU_BASE + SCU_FUN_PIN_CTRL2);
+
+	reg |= (SCU_PIN_FUN_SGPMI  |
+			SCU_PIN_FUN_SGPMO  |
+			SCU_PIN_FUN_SGPMLD |
+			SCU_PIN_FUN_SGPMCK);
+	writel(reg, SCU_BASE + SCU_FUN_PIN_CTRL2);
+#endif
 	return 0;
 }
 
-- 
2.31.1.295.g9ea45b61b8-goog

