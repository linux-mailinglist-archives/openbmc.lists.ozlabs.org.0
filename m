Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FC35E38A
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:12:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKVxy36brz3bqB
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 02:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=HPb/Bd4u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wltu.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a;
 helo=mail-yb1-xb4a.google.com;
 envelope-from=3-cj1yaqkb2aujrsemmejc.amkmncl9kajgqrq.mxj89q.mpe@flex--wltu.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HPb/Bd4u; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKVxm1RVrz2xZJ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 02:12:44 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id p75so10648092ybc.8
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=XLtshCzLBWOmw0RxKnytaabWiPezrDLRe7ordfhtI04=;
 b=HPb/Bd4uUcAC9pW9wZD3HYLMJsvs7zCtrFCJCTrWJrU8Xs26GE+SglBEgTOmpUWEPI
 5unK2s9CLKuSUMNNJ9dNNbvyso+VqdZ5YRMWmpGLlK/Qj2p4+JzYCwbT0kP7IZK4N71l
 J98+e9tkx4Z2ihBKCgjBkU+IopxH9OIFi9UzB1ogQu/NY+1AkhASn7IijQmMKaUfgb6Y
 +9vZorYS3zR5bQuRi4Ro3owNaKfMNPNA1dKvaQs2G44yw6STLP8ONP7/xh/r6wmHInYY
 NuZYAjiittK1H6JRDsDwUR129sxkDa8+17+HtB1ntTmy4PklEi8zrGbOGrz+Y443cIuh
 Zs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=XLtshCzLBWOmw0RxKnytaabWiPezrDLRe7ordfhtI04=;
 b=hYuQnt9bLynqJyleSPGuQhtN749hZcn8G4h3EpnmMCsYh04DdOlfkPGW3t2TQUS3Rl
 7kkLtcwBEWlrngZ82sJ+/hxIwiZKSO+ECsl23LRFfp2eoSJ0EgiaQhwI8+tKZWI9YMi0
 Wh4c9+ZzqQYIsIeSFoxPd72MPmFWmkp6ivDmq3+/K/1qaZ4IXA8+w4xvYwT5wpAYTZVT
 rxrz7o2qHUAaP6euMEIVDdFRHT9KP21X43oH7a3fyarqgJtBgCVHxyM7BkNKMDl3IHt9
 8mJmwsFqfloowdlKwrkYN6FkCGQT9ryeIvkIOjN2fyQFd97SSI5L8y+ouf1UP6231pWp
 4SpQ==
X-Gm-Message-State: AOAM533lhMubr8NyKHl36yfWGWASxdD2dokFIpWl8f4zbQZv3tarLDuF
 UBEoPv+r2jAfxtX0Ory98Nufp1LJFt1mCFhTawpJJkC1bXodVdKjWoDGPUPFKlN12tnkaST9H0i
 bPB53z4w9FtvH+ddMT7UcSM76tAqxtYGqHqJ0haydb3Xg/JT2T/K893CIWUc=
X-Google-Smtp-Source: ABdhPJzFIpuAqYIl4s/acDaN5UqqvGh6HbZb+zDoKgMYIFKw75GAvXWzLaj7AyXQnfwNvnliKmo5ZRnw
X-Received: from wltu.svl.corp.google.com ([2620:15c:2c5:3:dc07:df1f:1158:224])
 (user=wltu job=sendgmr) by 2002:a25:dc51:: with SMTP id
 y78mr16336802ybe.364.1618330361198; 
 Tue, 13 Apr 2021 09:12:41 -0700 (PDT)
Date: Tue, 13 Apr 2021 09:12:38 -0700
Message-Id: <20210413161238.2816187-1-wltu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH] board: ast-g4: Enable SGPIO in SCU
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

Add option to enable register for SGPIO in SCU
for ast-g4.

Signed-off-by: Willy Tu <wltu@google.com>
---
 board/aspeed/ast-g4/Kconfig  |  4 ++++
 board/aspeed/ast-g4/ast-g4.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/board/aspeed/ast-g4/Kconfig b/board/aspeed/ast-g4/Kconfig
index 2bec9a733a..e78030ae34 100644
--- a/board/aspeed/ast-g4/Kconfig
+++ b/board/aspeed/ast-g4/Kconfig
@@ -19,4 +19,8 @@ config SYS_CONFIG_NAME
 	default "ast-g4-phy" if ASPEED_NET_PHY
 	default "ast-g4-ncsi" if ASPEED_NET_NCSI

+config ENABLE_SGPIO
+    tristate "Enable SGPIO in SCU"
+	default n
+
 endif
diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-g4.c
index 656495307b..e2463d4524 100644
--- a/board/aspeed/ast-g4/ast-g4.c
+++ b/board/aspeed/ast-g4/ast-g4.c
@@ -22,6 +22,19 @@ int board_init(void)
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
 	gd->flags = 0;
+
+#ifdef CONFIG_ENABLE_SGPIO
+	/* Unlock SCU */
+	writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
+
+	/* Enable SGPIO Master */
+	u32 reg = readl(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
+	reg |= (SCU_FUN_PIN_SGPMI |
+			SCU_FUN_PIN_SGPMO |
+			SCU_FUN_PIN_SGPMLD |
+			SCU_FUN_PIN_SGPMCK);
+	writel(reg, AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL2);
+#endif
 	return 0;
 }

--
2.31.1.295.g9ea45b61b8-goog

