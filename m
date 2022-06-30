Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577A5618BA
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 13:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYbDg2fdpz3cCD
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 21:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LTJmdE9v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LTJmdE9v;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYbCY6mXdz2ywV
	for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 21:07:53 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id o25so5832678ejm.3
        for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2022 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fBcSY9myBFHPgiV/0ycJxXRtG8C6bf0DFuBhPwKhmes=;
        b=LTJmdE9v1nM/kpr2sVsdEuOwP7Y+uIaaEZfeUHuniPoOkKkGmnM2M81uCQCOMlbgaw
         6IDFsWT2N0E4L/bK7VKUg49Y/H7HSL1KTfmsqRdCDFnhzDi8q/WR1cFvGCKbIlcZ0Iuf
         f3t40QT1VqdU5jHoz+09wZRTSfq/12pC8LrA6FK0S9HoKWNv9PE8X93bN+bTofI00IEG
         NZBIHpeK9DHkbVpHPwNQR8N4d//j1FDMbwTLHIDiWetEOHySsK7CxVpDoF0LWMSuL+ZX
         31CTA2aHu36/JgYqZqyPa9Ajmf9ivhoPkThiYK+g2f22dptOzUk5JWx+5jt6EorGneCd
         YIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fBcSY9myBFHPgiV/0ycJxXRtG8C6bf0DFuBhPwKhmes=;
        b=yRejyNfVDnHiNJyAdQ70Zj1pVzMD0+Fqf/vI+qVb4i2V8rL+se5VF+qZj4hYNy3PZK
         GY72e1PfDbwGbdDSz2pdXDZNCBVAHYddBkJud2z84ibMAngTCbyXdSCgiEaduUIWTjyG
         PONzgehasPtnkPQ2OQ7FCRIlaaxyb917VNlyUDGfy3MnBVAW/5Wzj3tFwpTlQ+Ma0LRs
         PuFIR/Sn1mTn064NaEb4JJeZuvh5CZhk5RxsuPS09Q4vuQBjgwqHhAe905UsL7q/Lyno
         crJrtdQXs7qDPD+51EofbemOR1tuJ7e1sdSpjRL5JEYd2eMCG4Fsn0JVLOBFc8sESvFV
         uq5g==
X-Gm-Message-State: AJIora+8iyErQypir6hP6fbn4QRRTE0S8uX7g9V1HeHgZ+TmluSvKbGf
	29yNerpG7GA5E5N4A4UmRkIqBA==
X-Google-Smtp-Source: AGRyM1vj3cLHdhx519CcQTAlBZG78YUCxAeYecoWpUCvHZ/s0HbcD7Jnl94QBKzMaiNQanksPmIRlA==
X-Received: by 2002:a17:906:4482:b0:70a:19e3:d18a with SMTP id y2-20020a170906448200b0070a19e3d18amr8337312ejo.510.1656587270659;
        Thu, 30 Jun 2022 04:07:50 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id j20-20020a056402239400b00439645915a4sm174594eda.49.2022.06.30.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 04:07:50 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 2/2] arm/mach-aspeed: Add support for CONFIG_ASPEED_ROUTE_UART5_TO_UART1
Date: Thu, 30 Jun 2022 13:07:45 +0200
Message-Id: <20220630110745.345705-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630110745.345705-1-patrick.rudolph@9elements.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduce CONFIG_ASPEED_ROUTE_UART5_TO_UART1 and reuse existing
platform code to route UART5 to UART1.
This is required on IBM/Genesis3 as it uses UART5 as debug uart, but the
RXD1/TXD1 pins are connected instead of RXD5/TXD5.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
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

