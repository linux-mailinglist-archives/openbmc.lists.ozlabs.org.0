Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D176672E8E
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 03:00:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny5Rj1nWcz3c6F
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 13:00:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HzF+mlaT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HzF+mlaT;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny4Xf4SzWz2xbK
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2023 12:19:14 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id dw9so842368pjb.5
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 17:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=utDmIRrPc8hFS/vmhm4HETIQODzF0nB4y0uHITxsM4w=;
        b=HzF+mlaT/u/72Ild3byzLwjKSXIYnHG3gcZJDaMqXU6F5pXQs5tjM0mdafwRqbLT5j
         FgQ+1uWinFFfy5MuJIIPCv9mpui3FmjHgUfuw1q2hk7HU9LizzIE0wAN8OvyvrF3SMPD
         UFkeF9xc4q8NrYGhsDPSFVfz0XsCEEdVZvMoemkzSx8wyycUI+09ph3n6tg+yx0yLboN
         r1bt+T6Xc2z94InjkvZcN5IuF2diLArN6LGTjWHppKrMSgE48Ak2+8gvMNX+sK1JlHIm
         XhaW4F5umiYRPQOqmrhzrSvu5PBgV2R2h0qlfhQmu7vruTDjjqdAINrGUI8d7d/X5rdS
         T9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=utDmIRrPc8hFS/vmhm4HETIQODzF0nB4y0uHITxsM4w=;
        b=FL3FOWXNZ36YwR7y4sBoPxQUN59FyJ/1YHweQAxUnvArpq6ev3dhqFxABLamHeRdxx
         xaQOhJBYxawX+B0jSz83jbipIKFPfwOq0nTxp6hPf7dt+EkRUSgc2pxIg8plCPiCA+dY
         YKV9PMQeloN5bEWqA1/76bkYWDMZdMZYVAS6wHodeVshR3v+MjZUKhj1mFM296cBUdqj
         aPjW4/QEwLDIbFX9ICXlL7sYQoLiC9nDCV0NOBOJ6/7tiJanxW4Tt7z5hdenSzOm975e
         JiHdZw3M1iJ+P5sPlgw0euz3YzKLJjQyDQIXrUsdo/fDpLa8Su2EMr2jvU1rWS36rLBu
         QykQ==
X-Gm-Message-State: AFqh2krequLg9tchci5IjFNknmRNXx1NAJtAaZBkNGK3vv6ok0nku+rb
	RpGO9YCydtPuvIxVRKXVxXUIB7viMTs=
X-Google-Smtp-Source: AMrXdXvxe02QzFA4HzPiw+sCX6ICvqMEwbBe50WClBIwIr5RJPwKMDp2o1w/Yee8LaAOC8ENTkRvXA==
X-Received: by 2002:a17:902:a5c6:b0:193:33d4:d509 with SMTP id t6-20020a170902a5c600b0019333d4d509mr31169989plq.30.1674091151496;
        Wed, 18 Jan 2023 17:19:11 -0800 (PST)
Received: from localhost.localdomain (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902900300b00189393ab02csm6270210plp.99.2023.01.18.17.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 17:19:10 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [RESEND PATCH u-boot,v2019.04-aspeed-openbmc 1/1] ARM: Aspeed: add a config for FMC_WDT2 timer reload value
Date: Thu, 19 Jan 2023 09:16:58 +0800
Message-Id: <20230119011658.457158-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Jan 2023 12:59:32 +1100
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
Cc: Dan Zhang <dz4list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a config for FMC_WDT2 timer reload, and set timer reload value if
FMC_WDT2 is enabled.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
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

