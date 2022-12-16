Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CF653A0C
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 01:18:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcrW62ZhNz3bSp
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 11:18:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RWTymGrD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RWTymGrD;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYZQK45Xxz3bV1
	for <openbmc@lists.ozlabs.org>; Sat, 17 Dec 2022 03:32:39 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id 17so2888907pll.0
        for <openbmc@lists.ozlabs.org>; Fri, 16 Dec 2022 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iV9BbS6RWMweT0W8zAGX7wYorG3gzy2S1hj4Ey8T+vs=;
        b=RWTymGrD0XtL/BvNQgFPXX9yGledN5R+m+wWIMmYTAmphbm8f00xu4/3Ir9Zd7QLkm
         8xyBcM1BtBUkfBSheklYIzbquIgkWU7kTIBPfi5yz4VKIeHgjKccho0X5H5M1g/0m0Bq
         /0bbN+LxUk5DpaW2x3Cr0umxN/6UzWCE+VccYqe34GhLRTzKQ3UjZJ48QFj+aj1Luf91
         I461rNN/E6s7u6t/BBdtbawfjN/CS3F8YrFRNmcmH7RUjYx/PBG4HQnfFBP1udXczzM8
         e8rAvmnihJ3KdbvoJAFSapcOgFP4cwGKfAruXfHhCXHIiFI3sl7Q4BFBb6JHkmh9qxkQ
         L9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iV9BbS6RWMweT0W8zAGX7wYorG3gzy2S1hj4Ey8T+vs=;
        b=OsSdAxlvLUbgnZwle4QGUoaKcjP35aT/6crLvG+SOSLY/co5U2yVO8+IO6SpwBACRM
         xt57YjYu4dnN1E2TnW/AsNn7B8dbsIirlAmtYBw0V1BugJWu3V4lt5rp9AFrO09QDqAu
         t1R+PrFEojWBB3nHv1mo1AxNxlEszPmH06X0IJaHNOr2tPJWBGTP6GzSO7VYjvsxrfrb
         xVlOjqHxHJZH42ZafwWALgQDYsTC0Sj+rwLVUlF+eDjvn3CacXkgQZrmT3pii/Dpf91a
         Pb3+OXbkFAuYexxcTV/ghUQZHSEpIm9Yic2wc2wHqNbv7TGB6bWa5MODVymaUb0zgtQw
         aikA==
X-Gm-Message-State: ANoB5pnlY7SzRtSNWRUvhymK0VIIO2/j5otwlRtFBM/LaxbsRwY6rvR2
	HBadB701iGdxbhFO7bnBN5ZoiQaJJrI=
X-Google-Smtp-Source: AA0mqf42vr4B+eUFLSzU1YN64iChUjGCuhNs7OeBnWMv0Zyxg5TVUo3LiHB5fkiQlPXpFE0fUAU+Xg==
X-Received: by 2002:a05:6a20:28a0:b0:ad:58d4:2a7a with SMTP id q32-20020a056a2028a000b000ad58d42a7amr26401554pzf.22.1671208355079;
        Fri, 16 Dec 2022 08:32:35 -0800 (PST)
Received: from localhost.localdomain (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id g10-20020a63b14a000000b0046b2ebb0a52sm1673775pgp.17.2022.12.16.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 08:32:34 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot,v2019.04-aspeed-openbmc 1/1] ARM: Aspeed: add a config for FMC_WDT2 timer reload value
Date: Sat, 17 Dec 2022 00:30:23 +0800
Message-Id: <20221216163023.551569-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Dec 2022 11:16:45 +1100
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
Cc: Dan Zhang <zhdaniel@meta.com>, Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a config for FMC_WDT2 timer reload, and set timer reload value if
FMC_WDT2 is enabled.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/include/asm/arch-aspeed/platform.h |  2 ++
 arch/arm/mach-aspeed/ast2600/Kconfig        | 10 ++++++++++
 arch/arm/mach-aspeed/ast2600/scu_info.c     | 13 +++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index ca270d4be1..4c2b0866fb 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -44,6 +44,8 @@
 #define ASPEED_FMC_CS0_BASE	0x20000000
 #elif defined(CONFIG_ASPEED_AST2600)
 #define ASPEED_FMC_WDT2		0x1e620064
+#define ASPEED_FMC_WDT2_RELOAD	0x1e620068
+#define ASPEED_FMC_WDT2_RESTART	0x1e62006C
 #define ASPEED_SPI1_BOOT_CTRL	0x1e630064
 #define ASPEED_MULTI_CTRL10	0x1e6e2438
 #define ASPEED_HW_STRAP1	0x1e6e2500
diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index f5852afa77..4c141672a1 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -53,6 +53,16 @@ config TARGET_QUALCOMM_DC_SCM_V1
 
 endchoice
 
+config ASPEED_FMC_WDT2_TIMER_RELOAD
+	int "Aspeed FMC_WDT2 timer reload value"
+	depends on ASPEED_AST2600
+	range 0 8191
+	default 0
+	help
+	  Aspeed FMC_WDT2 timer reload value, the time unit is 0.1 second.
+	  if this value is 0, left original FMC_WDT2 timer reload register without
+	  change (Default 22 seconds), if it is > 0 then set timer with the value.
+
 source "board/aspeed/evb_ast2600/Kconfig"
 source "board/aspeed/fpga_ast2600/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/scu_info.c b/arch/arm/mach-aspeed/ast2600/scu_info.c
index a2277eec58..c18bc3923a 100644
--- a/arch/arm/mach-aspeed/ast2600/scu_info.c
+++ b/arch/arm/mach-aspeed/ast2600/scu_info.c
@@ -30,6 +30,9 @@ static struct soc_id soc_map_table[] = {
 	SOC_ID("AST2625-A3", 0x0503040305030403),
 };
 
+static u32 aspeed_fmc_wdt2_reload =
+	CONFIG_ASPEED_FMC_WDT2_TIMER_RELOAD & 0x1FFF;
+
 void aspeed_print_soc_id(void)
 {
 	int i;
@@ -302,6 +305,16 @@ void aspeed_print_2nd_wdt_mode(void)
 
 			printf("\n");
 		}
+
+		if (aspeed_fmc_wdt2_reload &&
+		    (readl(ASPEED_FMC_WDT2) & BIT(0))) {
+			writel(aspeed_fmc_wdt2_reload, ASPEED_FMC_WDT2_RELOAD);
+			writel(0x4755, ASPEED_FMC_WDT2_RESTART);
+			printf("Set FMC_WDT2 timer reload value to 0x%04X\n",
+			       aspeed_fmc_wdt2_reload);
+		} else {
+			printf("Keep FMC_WDT2 timer reload value as init\n");
+		}
 	}
 }
 
-- 
2.31.1

