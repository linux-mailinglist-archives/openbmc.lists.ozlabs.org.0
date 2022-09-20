Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA295BE2B3
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 12:09:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWy2Q5SR9z3bkZ
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 20:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bEmP3bCr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=bEmP3bCr;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWy1M1F6Mz30LJ
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 20:08:38 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id go34so4952926ejc.2
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=bEmP3bCrJqY4ij1H9nfhkh7dFRhMx0nyXId0d4nOIiZX8kHFknaxQ0D6a3a2RDlSVc
         HQ2cXmFIdgwQMUTJuG/sJi1JIqB1sJXYambfe17uFCAuulYYvM4Zrxg2RkoVwSt2Q4Hy
         peZ/4q9Ae98pWZRdMZTuGMt4/xfJOGgJK9J3ukUn+8eeKAc4wg+1UWeoJMtotY7XMbnS
         UaEWH1j5FEupNROcb40PkJIQMYvC+8YlreAWqGD/mvb0IbHVZm01XzjeD8BMMB2n6td4
         G4c+HYrXkXfObrDoboNBLBdQkRZkYFAU/U++JG0VYd+3oSb4op29yp5HQpMMraFc6/iK
         USPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=FlH1ObOfrPPUYRlY9EQTVhJxsPGMNgSe3HmOIY2/bfeYLGnXc5T6br5Tkl3Z+Gtgx6
         rJFZIARly08iZw6VON1K63/H6mqLn2EMTFIfmd+vm1137tlBVHBGiyrMIFvBlyNRmPjm
         AXueDx5X8HtMPsZtKDDy8CEePc/D5kF1bcWtPPpwmVGcu1TLlHXaX4mmUHDS7RDXww1L
         3mjQJJEM+bfdz4aPRNxYGZWJuPt0YFXWh2110YGT81SAkR0N/vGueGsZNLC5EhFwr3gz
         5S7nWsDhJBauPSgBhMu0NiDjSPWdtHPzqCw2ZKo2eguyl5vbYW55mglYDLWCwG0UT7H4
         yJLA==
X-Gm-Message-State: ACrzQf1tBtxhNGZu4rO6HTyzf52jaxE34IIGcKjCJtVzADgbDX0tCPBr
	06eg96Ha0E/CbbOaVewyq5BZpA==
X-Google-Smtp-Source: AMsMyM6cCU/ooxYwD7WAENpkcgqJ20uS8Gd2R3KfILezkeONiadrsr0127m+AoGHPvZ75E9OLZ0z4Q==
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id be8-20020a1709070a4800b0077c51b05aebmr16724651ejc.61.1663668514747;
        Tue, 20 Sep 2022 03:08:34 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-094-114-232-236.um31.pools.vodafone-ip.de. [94.114.232.236])
        by smtp.gmail.com with ESMTPSA id fi19-20020a056402551300b004545287d464sm993475edb.14.2022.09.20.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:08:34 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 2/2] arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
Date: Tue, 20 Sep 2022 12:08:19 +0200
Message-Id: <20220920100819.1198148-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920100819.1198148-1-patrick.rudolph@9elements.com>
References: <20220920100819.1198148-1-patrick.rudolph@9elements.com>
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
Cc: andrew@aj.id.au, christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduce CONFIG_ASPEED_ROUTE_UART5_TO_UART1 and reuse existing
platform code to route UART5 to UART1 pins.
This is required on IBM/Genesis3 as only UART5 can be used as early
debug console, but the RXD1/TXD1 pins are connected instead of RXD5/TXD5.
This does not affect the "debug UART" function on RXD{1,5}.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/mach-aspeed/Kconfig            | 7 +++++++
 arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 687adcb308..660b5a240e 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -84,6 +84,13 @@ config ASPEED_ENABLE_DEBUG_UART
 
 endif
 
+config ASPEED_ROUTE_UART5_TO_UART1
+	bool "Route UART5 console to UART1 pins"
+	depends on ASPEED_AST2500
+	help
+	  Route UART5 console to TXD1/RXD1 pins instead of TXD5/RXD5 pins.
+	  Does not affect the debug uart functionality.
+
 config ASPEED_PALLADIUM
 	bool "Aspeed palladium for simulation"
 	default n
diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
index aef55c4a0a..fd013e4e6f 100644
--- a/arch/arm/mach-aspeed/ast2500/platform.S
+++ b/arch/arm/mach-aspeed/ast2500/platform.S
@@ -795,7 +795,7 @@ wait_ddr_reset:
     /* end delay 10ms */
 
 /* Debug - UART console message */
-#ifdef CONFIG_DRAM_UART_TO_UART1
+#ifdef CONFIG_ASPEED_ROUTE_UART5_TO_UART1
     ldr   r0, =0x1e78909c                        @ route UART5 to UART Port1, 2016.08.29
     ldr   r1, =0x10000004
     str   r1, [r0]
-- 
2.37.1

