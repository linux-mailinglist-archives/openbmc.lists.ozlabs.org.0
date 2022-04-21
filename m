Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D338B50EE79
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:06:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQHJ4ld3z3bdg
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=SJbSNW55;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=SJbSNW55; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW4742g8z2yXM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:32:05 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id g18so5567045wrb.10
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zJie1YFYE3Mccy8iAi63Mh8iqSeMAbpv/2v5mCK/yE=;
 b=SJbSNW55avaFRHQheyfy+yiOuNHe3HzA2jrURtXAR8Pw5gwHX3mCHRZSdfbMbaTjfu
 TQhsP617PBpgmJtFw3EDllIZqzfNkUV6UcWNgsCsp2aL5+0br+DOCQai2qXJcCadA4Yv
 a+6I23hztfYDUizEq5Tqt5Ziw9PxjIK83sLxCkjq+TajFiYl42fBSisbX2AJgVnc4OSx
 0P9JVW+xv5+ZjqczlvGrY22gLEd2t1xYkaChMipkKFsKNmRvBcCpe3BI/FfSt0oMUIKi
 fD/GeGwKg8Thl4e7M7J9cHOTsJBnWkdxaz+GdsUJWvIVHXkKrFVP4aDHzY3D/p7IwJvc
 /LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zJie1YFYE3Mccy8iAi63Mh8iqSeMAbpv/2v5mCK/yE=;
 b=AQmTvC5xJZyS+W1kirxKotGwqLrhiXJHwL0jURwY0YfwtBHEimDnUnDoegFvO9sAUa
 VDPeP4NQnBR6nBCyk5OdTtyt4K5rP9YaWfpP22S0tQldjI4f6TEh2SKsC7+MLOuUOp8Y
 fxTV1E8i4rZzLUentIXrmIGBwvG0wvrO3UqMKiWraZLlApZMf/rc6VAxOZnJBi/hrzK4
 W56nMRfOQU9Ck1q/IEL46fefS9HX1gML5CpIwiEO3uGtrmJUYSShZTNFRSyfYzWAJjoq
 ozJN1BlBF9ltaOl6MZOqomwLq1HsU+BuAqOr879ocUIArL9o+vp7TQhWMILvqP7Z4kE7
 kq7Q==
X-Gm-Message-State: AOAM530GVY3ec8tpTF9JCRjU2xOAL8l1o8kpvgd1CKn5Y/Kx6wio8O2G
 ZFqPzmhjNT7aAzij1HAt3bdwkg==
X-Google-Smtp-Source: ABdhPJw0+Zh4EtYsSTIBO53d8oFzVJZ1M5sEc4mnW+DPO6tquD41HiOFtvAs2TsxSlDf3QivkMKRhg==
X-Received: by 2002:a05:6000:1a86:b0:20a:a933:ba16 with SMTP id
 f6-20020a0560001a8600b0020aa933ba16mr8316569wry.583.1650529920363; 
 Thu, 21 Apr 2022 01:32:00 -0700 (PDT)
Received: from fedora.lab.9e.network
 (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1537238wmb.48.2022.04.21.01.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:32:00 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	zweiss@equinix.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/4] arm/mach-aspeed: Add
 support for CONFIG_DRAM_UART_TO_UART1
Date: Thu, 21 Apr 2022 10:31:49 +0200
Message-Id: <20220421083151.1887871-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
The platform code already uses this Kconfig symbol, but it always
evaluated to false.
This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
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
2.35.1

