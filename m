Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD352D702
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3tYB4hXGz30RP
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 01:09:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=TPh4rUjk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::633;
 helo=mail-ej1-x633.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=TPh4rUjk; dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3tWQ65yvz2yyS
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 01:07:28 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id m20so10514963ejj.10
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYu785KFLkTYukc/eWijs94Lv5ingDis9elKLBjheWA=;
 b=TPh4rUjkSZBRYx0ahIQ5E4G79jcMFMU9oDwkSXdPVfBAfGj9AcnSrYP4L5SEQiBEAg
 oJIzH/X5JZ+isOgzi1EJb5wfrbpIKEK8fVDZZgvCPbZrZ4HdX14sLxbYVETxh40cIiYP
 VkiEfcSlzvrnLcWj6WzsYUvqwKXCaUahEICs32eonx7ge20V2nOBtKFLkjBSobnDt6Jf
 gC4IhSZ9gGgFC34h8K66KIFVXz7L49mFfNiiimGYdrfxsRB4n+NU7ki/4PExBP3p70cr
 aRxPdYhDLfRb+0uh1cxLrQgJRDRYirOwvFT3j6eooIcpJlw73WOfLfj8p4U35grI59QW
 SERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WYu785KFLkTYukc/eWijs94Lv5ingDis9elKLBjheWA=;
 b=GB/mbZB5RfZE0+OKaIFbYCEyv6PK/N86O2KiGMsHhX0i9LnTVGUjQJcN5ELlTt+7hg
 zFrY92jhW+DPVMaEn0zsLv+6yDup2rhsuT4AFKWfrY5xxZ6ydAdmCMWjBpJeqIHBY9iR
 iRoHDEr3ORKhp1++5p8fu1XICh/s5Gf6YkPvf3w2G86+GVplO99IeBt9GfffvK6cSO5L
 vQQb6DUkzag3r9BUZH8mvM7HPZsH9xXCEUtw73WF79IldLdE4fKXEZnIlOua64XwRzuC
 k742aBQwaO8GA6gx8BiUfPBYL90cFx/86Eg0pEsKC7E6nI4t+Exd82XgveN+i8iYZ4UC
 u0Iw==
X-Gm-Message-State: AOAM531ilb6liS2s4b4Fknyf+Mg7UN9Eu5Mm5YKqKHXuxysufGwTrXzI
 U9E+7lMVdDrEiYerw9PTlLI74w==
X-Google-Smtp-Source: ABdhPJwE+e8FUHtSvUCP7Zu4OqgrEgAGHexuwIAOUh+0bmcojq+IDh8li2U72AXdeVHYcbtHtPyJTw==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr4696248ejd.567.1652972843927; 
 Thu, 19 May 2022 08:07:23 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a056402124300b0042617ba63d5sm2962263edw.95.2022.05.19.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 08:07:23 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/3] arm/mach-aspeed: Add
 support for CONFIG_DRAM_UART_TO_UART1
Date: Thu, 19 May 2022 17:07:18 +0200
Message-Id: <20220519150719.22338-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220519150719.22338-1-patrick.rudolph@9elements.com>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
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

Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
The platform code already uses this Kconfig symbol, but it always
evaluated to false.
This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2500/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
index 4f992f442d..e7ff00cdba 100644
--- a/arch/arm/mach-aspeed/ast2500/Kconfig
+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
@@ -17,6 +17,12 @@ config TARGET_EVB_AST2500
 	  20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
 endchoice
 
+config DRAM_UART_TO_UART1
+	bool
+	prompt "Route debug UART to UART1"
+	help
+	  Route debug UART to TXD1/RXD1 pins.
+
 source "board/aspeed/evb_ast2500/Kconfig"
 
 endif
-- 
2.35.3

