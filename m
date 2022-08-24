Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F859F3C8
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 08:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCGzj6ssXz3bdk
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 16:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=cG40jDJC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=cG40jDJC;
	dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCGzL5ts0z2xk5
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 16:54:05 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id s11so20785316edd.13
        for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=cG40jDJCVgLRijn5p9g47OlwgEQ5QTBJfR2eiXHiWf3JjTW7vOrWHRmXjg+7W+duHD
         CmMtT0W+IhNUybCY0x4vzK0cKlvrG/rFPx3L6MderRRzbZUbS7gKmGdfhmYbOK2ZZkS5
         WbGVX5hxqkNvMUdCd/JHok37RsKQp1nLDefxIzzO8y7te8gMt9MUIbBNEDd43QUnIl/z
         NiLnvPCcE36omHXiLv3SXWDeRpD7hmJdeMybPuXmOOSnsoXNTeyBtNolMor3SzEju81Q
         MRsBWRVqOv/wzTzARTSZ/jRweDDrwdkk6iIkkeKd6Wwq4U+3HmBwuOy6mg8Fd5JpfUhp
         qVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=IYdWl4z0agDGXJQrtPjdAI1WivbnpHe5hlDZdVo8fu8=;
        b=qmyTWlbxxsJ7UTqg8eFwZ405s/SJ5dnXiA6lNRkxniHqg6cGAfK2ld9nV0h8iuWpKj
         hg+vn8v7GN5f4hf7BwPz0heoSJkLI2s95k2odhv1sbRhbwP8IDw7c11XaHXIwUaPdA5f
         5o094CEd8aCf/NGaPt8D03VMrfBY7nNJh1JGeiFToeuwhdOr10157DQ8T196nr7Txfp0
         bRDVtPe4TIxjURRM6oyTYqH1d39zfDiVUTrfRpuP+TA2/A8jXAId9SBBc7Zke3nrAdIs
         PymVMQ+I6NMgbUFb04tPC709iODHohgnP8J5M6xtuO84sIOjqAqgQkruJAdDN5UthTmz
         0QNA==
X-Gm-Message-State: ACgBeo0uPngnXAIc2h26LYKXquG1gkm4Oq/Hp7/udXclSkvdgoP3Sjl0
	thXb2+iwBcdA+WEtC1deIwMby3AQs+QgE55W
X-Google-Smtp-Source: AA6agR61gCcQYZ3Nz58gKscCaOUooMPy2TnqPRC9qU4UTruPksJPxlhuvXyNBTV0pQicgqylWIdEVA==
X-Received: by 2002:a05:6402:1ccb:b0:446:4346:8597 with SMTP id ds11-20020a0564021ccb00b0044643468597mr6476139edb.177.1661324040565;
        Tue, 23 Aug 2022 23:54:00 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id n26-20020a5099da000000b0043bbf79b3ebsm2644475edb.54.2022.08.23.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:54:00 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v6 2/2] arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
Date: Wed, 24 Aug 2022 08:53:13 +0200
Message-Id: <20220824065313.1636548-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824065313.1636548-1-patrick.rudolph@9elements.com>
References: <20220824065313.1636548-1-patrick.rudolph@9elements.com>
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

