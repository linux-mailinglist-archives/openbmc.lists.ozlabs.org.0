Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0963CFF1
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 08:53:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMWg71nPSz307T
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 18:53:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=JW56mYCv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=JW56mYCv;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMWdW6rGQz307T
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 18:52:31 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id bj12so39249369ejb.13
        for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 23:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=JW56mYCvEc5avs84l8qMlFHO0+VrmqnXRTObASsyPCoOT2lhaGIgPs+DHyAF9R4v8L
         c72KJK7FBKr1Gj0ph/GZ12V5WNfDSxAUVKO00rZzXlInyQ2PR77qMBSINea6EdD2mJbM
         GR3raQ9v8B9p5kFat7TysQK+qKSv0ZGdK8JgGRGxhOz+Kdhc73qbrWsqNZ+ed0QpRFlq
         Feqk7d3eRXwT4DDNVqnFNVoWGsAAaSq4owbF4xhHwYVHYszfRTOgQlNoLtG2loM64on/
         lhK0emcr9UMNmhVwArqxkRWkGO1Y0Ivlsd1yvdHi17sC8uBF66oCSU78BmfcBvxTCW3P
         846Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=6g2LZPmvlZcz2cOtoV7HrFdynWBbHkG09oNPPkogd8OH1UwxItUQ7mPAwtFD7oUnn7
         s+OiN3ReTlmz/bpjYvzWAOlnIPqAZ0hWrQKSc+pncVFJxsa/jQ/XkTZbI9TsOKO9MeqM
         qYIzBHIqcrdru9VOKxUMnYRhdsiteo8PtYR9BMOOWaIoCKR3Y9vO9GztTUUnW8ZkPIUw
         nSHorEurn0KUgBE4RYKchgp+UQLATtfkixZao/fW6/7b4AQYjkYoo1THE9f8I9r9hPhs
         ypT6FpwPnYsOogrx/tISP+5Pcx+K8nrLUKAe5mAoMz3v7x4viKspR9e8L/AjaBzzazBS
         9vMA==
X-Gm-Message-State: ANoB5pnUnRHrw07iUkp9d5963/6v+rAYfgzUVWZ2jqIGBjMAqKS0xci6
	yHItDGsd/NnqI7BHYcotsizRrw==
X-Google-Smtp-Source: AA0mqf5gXKkvZM7T/33X+PvrTuTbXBOn4Sn07RwvKwRnkgH+7zFE2ejqpx5GyAmEJmCgo9cTqDnAeg==
X-Received: by 2002:a17:906:1b46:b0:7be:e794:a406 with SMTP id p6-20020a1709061b4600b007bee794a406mr13785471ejg.503.1669794748057;
        Tue, 29 Nov 2022 23:52:28 -0800 (PST)
Received: from fedora.. (ip-094-114-233-057.um31.pools.vodafone-ip.de. [94.114.233.57])
        by smtp.gmail.com with ESMTPSA id s17-20020a05640217d100b004585eba4baesm313236edy.80.2022.11.29.23.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:52:27 -0800 (PST)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 2/2] arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
Date: Wed, 30 Nov 2022 08:52:22 +0100
Message-Id: <20221130075222.1238196-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130075222.1238196-1-patrick.rudolph@9elements.com>
References: <20221130075222.1238196-1-patrick.rudolph@9elements.com>
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
Cc: takken@us.ibm.com, andrew@aj.id.au, naresh.solanki@9elements.com, christian.walter@9elements.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
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

