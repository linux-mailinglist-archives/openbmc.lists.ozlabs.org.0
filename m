Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F5532900
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 13:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sSM1nmzz3cFW
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 21:30:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=b7ExDw/H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=b7ExDw/H; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6sCH339pz3fMy
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 21:18:50 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id c12so22581321eds.10
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 04:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVvw9Hingnsy4f3tWJXFubPE6bY/k8pa/VJoocedzqY=;
 b=b7ExDw/HUlnnIiORNl9UdDKt9K4f42mj+bI6XNOKhRqB2OPtFgVDwbmgyJTtMLwXvV
 /S+IwhPeuy1Y2YFE/dRVdet02QBu/WpqjGtO2FdxMn10IMFN3KG8WrTDMcEb4iz13CCm
 3O3L2K0rEIWwvUqoV3yVYgL4tG7UMzOyCGFjZUhGQWkvxIWj6CQ19xgUIjO3BM2GGn0L
 INhvIjeziSsdsp9dnrPZPXvMk45s7nXUEnCdhs6BHjzB4Pcs2kJQdd2YkEleNbXyM5vU
 CCgX/4ilru0jXk4XyP3qbt4vyUPAP9RC0X3gQQO8nwTMLOLNXaG3gSjNC9bO8C3+Cs4k
 T9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fVvw9Hingnsy4f3tWJXFubPE6bY/k8pa/VJoocedzqY=;
 b=yHJqDKkvq7c9oOLph4kOdRb/wb+2v6SQF/Ch8x0so9sC5aRmVpt57Zmt+TXSkG6Ogj
 A3EgrQpjo1q3dMpSsgVe6JwRcEAfT/wib9iCnz5FJBD8LAdu80pjzPJtUdtinmp2WBlw
 YC/kPe414bJbkF43chdWZNH4jMDNdbAEJCMt11/X1sZViwnEFAXoEahyRxdE0BcEONLk
 THcJFmMosiolZteNTaOuu3bOKJVNVnOy5i/UMpykGDt0pwTs33DFgn9Nw5wim02wnvzI
 iNTuazoFjavi4XTv1uAsdTMBXHkLgPi++JT7t64btqbKTqx+XsCwSx7vR81eFqSljn5h
 Bk9Q==
X-Gm-Message-State: AOAM532CgI/m3S7wTeUMND9HB4c0k2JntDKMKp6eq/uw9cNoFiVO1xQO
 0UlBX+a+gbACYKrnc8JnvWG6Qg==
X-Google-Smtp-Source: ABdhPJw3PL8ubPzLBcEMG4zIZk2oP03+UZ2D/vXb2Qy+Gc4VAOJFDf3SYoNvJNmu2xCLUji5RITsGA==
X-Received: by 2002:a05:6402:50c7:b0:42b:3a68:e1 with SMTP id
 h7-20020a05640250c700b0042b3a6800e1mr16988134edb.326.1653391127049; 
 Tue, 24 May 2022 04:18:47 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa7c254000000b0042ac4089dabsm9181607edo.17.2022.05.24.04.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 04:18:46 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v5 2/2] arm/mach-aspeed: Add
 support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
Date: Tue, 24 May 2022 13:18:41 +0200
Message-Id: <20220524111841.627400-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524111841.627400-1-patrick.rudolph@9elements.com>
References: <20220524111841.627400-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduce CONFIG_ASPEED_ROUTE_UART5_TO_UART1 and reuse existing
platform code to route UART5 to UART1.
This is required on IBM/Genesis3 as it uses UART5 as debug uart, but the
RXD1/TXD1 pins are connected instead of RXD5/TXD5.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig            | 6 ++++++
 arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index edb5520aec..50ea261dac 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -84,6 +84,12 @@ config ASPEED_ENABLE_DEBUG_UART
 
 endif
 
+config ASPEED_ROUTE_UART5_TO_UART1
+	bool "Route UART5 to UART1 pins"
+	depends on ASPEED_AST2500
+	help
+	  Route debug UART (UART5) to TXD1/RXD1 pins instead of TXD5/RXD5.
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
2.35.3

