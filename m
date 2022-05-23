Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E68AC53112A
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6JVS5kYGz3bNk
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 23:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Fl9IMAc4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=Fl9IMAc4; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6JTK5FVcz2ynh
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 23:44:05 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id wh22so28782290ejb.7
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 06:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6w24x/jiGMFEyBUcrL+XMSFXbfY0oraeVfFRhupD9rM=;
 b=Fl9IMAc4daMf3nQw6FU2cTYOCjFI1fwn3uoWC4v/X88UPmvLl/sPn2KprnINW31qhM
 NPUmJD3mVQ9YNuchTB/ihkYueopQIlPxtFw0yeq2vTRYQwcqpwjNwTM8wFQNsiEjohL/
 0up+9B4gquutL8RR/nzb9f7cRpWBCuO3RhHz32hMPlIQE/jNOLWXh0IF3NO61pdxatOT
 tDrGxdrFaP/hBDKnXx0QgYZDlBFGsw4kqL+5LfJ9XhI2Wsu4/Io0v5xEHNPHJC4R2B42
 HQbmt20Mz0mdIVJpC0gHy0m4BzsON1a0YmC/N4edXHUT1GGmykbLJmZJlig/mJx4+z1A
 zLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6w24x/jiGMFEyBUcrL+XMSFXbfY0oraeVfFRhupD9rM=;
 b=2y5BbiPshIzOJ6vpPtKZRjTWJRS9nWy3qNptIFAe16t9Fe65gRVrLsicza1RgR6ZkX
 /Uy3639mrPlVILjpWP7lPctoOBDQE0t4m83m4izItReqdW/PiHBgJsbrKxUr5TRI//m8
 hnBAC8JmxWn25/DYWUv8P+SMffa8Hgn3HvRH0iEbvwftqiG9WxW5pvnTXvb+adoDam4d
 zX/KszZnvNJ5GeJQQIDbqkWjjPpXP6bGO0gvErc9V+GrMskVvczcViixf7EWtfiZVv3b
 7AnpW1Ed5iMaM5WH0nZq0a6Q07nou0BWyXgjRqeey81kWdGOGCk7BCngX+V/UJglD1H6
 5Yug==
X-Gm-Message-State: AOAM531o0rE3E8G6YFjxDOJOb6DG+uAE4SKowikHeRarA6voPgnOYLsN
 I2+Cwy/U16Ac1BWJJ2UZUqnilg==
X-Google-Smtp-Source: ABdhPJx4UmCvuBDTHgFLFvJtxxIyvd7bGQEv6jHHPnjNCREtYKxEtP6ywwFxXOwz9TevaugSa/RZcA==
X-Received: by 2002:a17:907:a427:b0:6fe:c73e:591c with SMTP id
 sg39-20020a170907a42700b006fec73e591cmr7274974ejc.676.1653313440255; 
 Mon, 23 May 2022 06:44:00 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 v1-20020aa7d641000000b0042acd78014esm8146587edr.11.2022.05.23.06.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 06:43:59 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed: Add
 support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
Date: Mon, 23 May 2022 15:40:04 +0200
Message-Id: <20220523134004.469176-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220523134004.469176-1-patrick.rudolph@9elements.com>
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
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

Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing
platform code to route the debug uart to RDX1/TDX1.
This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig            | 5 +++++
 arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index edb5520aec..a38f070381 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART
 	  systems, but may be useful to enable for debugging during
 	  development.
 
+config ASPEED_DEBUG_UART_TO_UART1
+	bool "Route debug UART to UART1"
+	depends on ASPEED_AST2500
+	help
+	  Route debug UART to TXD1/RXD1 pins.
 endif
 
 config ASPEED_PALLADIUM
diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
index aef55c4a0a..a97ebebcca 100644
--- a/arch/arm/mach-aspeed/ast2500/platform.S
+++ b/arch/arm/mach-aspeed/ast2500/platform.S
@@ -795,7 +795,7 @@ wait_ddr_reset:
     /* end delay 10ms */
 
 /* Debug - UART console message */
-#ifdef CONFIG_DRAM_UART_TO_UART1
+#ifdef CONFIG_ASPEED_DEBUG_UART_TO_UART1
     ldr   r0, =0x1e78909c                        @ route UART5 to UART Port1, 2016.08.29
     ldr   r1, =0x10000004
     str   r1, [r0]
-- 
2.35.3

