Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EC50EE7E
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:08:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQJj3GQ1z3bcZ
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=OYXCmZ8Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=OYXCmZ8Q; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW474Zk9z2yfZ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:32:05 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id bv16so5556646wrb.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TWInpsgl+zDOaBmU4dAZ43C+RuUPMNTPMstYhmXWau8=;
 b=OYXCmZ8Q1eTe/2svYErlS68EWVkjPvs13FXfnSshmHDnfDKa2tV6EahEkvkXv+Bojv
 AyCw6g7ZaZrSrV9lN/CdOviyqfGlJ4oF10O/9QZLQHct/K6z+KHbzWBeuBWGJvSWETSY
 yLbEMkSYerNu8uumyp7OtlWZ9+AAvsptazoe6gXBEO8SqOa35rBT5noOa371rg4LNnNU
 Z0GBElAM0q0VXv6OnXsmd8DFVDGgR2U9pMh4nKMG3MDnF4dGBZUSJjRWvWCqUUGpOJUE
 KKEtlWIqsNBEZGSJD5rFlNhQhVvyKbF7cowFPCC3sm7YBt45yvzIKGv4G1tf+T0IV4l4
 u/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TWInpsgl+zDOaBmU4dAZ43C+RuUPMNTPMstYhmXWau8=;
 b=e+8gHK2eY88JDqFv+G+RAQT+CRnD9j5y+3+b65rJR5coG8DlwNXNRNAZzO+1rBU84r
 jKrUpcnYThhJr89j72jb1Bjx5N9t1AZsTY+QdBxDZil0ved2COCSLC5ZZYMu8Rc3rj6R
 TnyVrdF7S/cRHkG/d+26+67uVQ2KUOc7FMYEXd9STOb+Q4Pwj8F9pZoMx5SUK1DOC6Pc
 x5s5ZkKBCoaOp7T6GcMOY0aIBWIdKZHqK58Or+LXLJ9yFCdBnagewcndjcrV2rg4K5yo
 arOki8Bu1xIJ+DNMvhJWN5b7Wv3rKeZQjxQkzlwKkfCJ31xX41cgze1xziPLYGLGXsw6
 2UQw==
X-Gm-Message-State: AOAM5307b3juMouokZT2SEuAkB9oRQG+C8chn9oMXOiHARGZFAnwRjYG
 BPsTqUtDc/qzgVxn0Xh5AzCUUHCrrArVfg==
X-Google-Smtp-Source: ABdhPJyiJnRJCKO0xK2NiLtqHYaKqINHMLcGXnQ89PVyN6NtoG0cKHzH0MFLpiUJydizIJTZISh78g==
X-Received: by 2002:adf:f046:0:b0:207:a457:5e52 with SMTP id
 t6-20020adff046000000b00207a4575e52mr18314108wro.708.1650529921278; 
 Thu, 21 Apr 2022 01:32:01 -0700 (PDT)
Received: from fedora.lab.9e.network
 (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1537238wmb.48.2022.04.21.01.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:32:00 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	zweiss@equinix.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/4] arm/mach-aspeed: Allow
 to disable WDT2
Date: Thu, 21 Apr 2022 10:31:50 +0200
Message-Id: <20220421083151.1887871-4-patrick.rudolph@9elements.com>
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

The IBM Genesis3 supports booting from second flash using WDT2, but
there's no working code to poke the WDT2 and it takes too long for the
kernel to load to poke the watchdog.

As it's an evaluation platform disable this feature for now.
Unselecting this Kconfig disables the WDT2 in early platform code and
prevents 2nd firmware from being launched during normal boot.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/mach-aspeed/ast2500/Kconfig    | 10 ++++++++++
 arch/arm/mach-aspeed/ast2500/platform.S |  6 ++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
index e7ff00cdba..1882d6186e 100644
--- a/arch/arm/mach-aspeed/ast2500/Kconfig
+++ b/arch/arm/mach-aspeed/ast2500/Kconfig
@@ -23,6 +23,16 @@ config DRAM_UART_TO_UART1
 	help
 	  Route debug UART to TXD1/RXD1 pins.
 
+config FIRMWARE_2ND_BOOT
+	bool
+	default y
+	prompt "Keep WDT2 running to support the firmware 2nd boot"
+	help
+	  Saying yes here let the WDT2 running (if configured by
+	  hw straps) and allows the platform to boot from 2nd
+	  SPI flash if WDT2 isn't poked withing 22 seconds.
+	  Saying no disables the WDT2 in early platform initialisation.
+
 source "board/aspeed/evb_ast2500/Kconfig"
 
 endif
diff --git a/arch/arm/mach-aspeed/ast2500/platform.S b/arch/arm/mach-aspeed/ast2500/platform.S
index aef55c4a0a..a3961bc4f8 100644
--- a/arch/arm/mach-aspeed/ast2500/platform.S
+++ b/arch/arm/mach-aspeed/ast2500/platform.S
@@ -95,7 +95,7 @@
  *    CONFIG_DDR3_8GSTACK         // DDR3 8Gbit Stack die
  *    CONFIG_DDR4_4GX8            // DDR4 4Gbit X8 dual part
  * 5. Firmware 2nd boot flash
- *    CONFIG_FIRMWARE_2ND_BOOT (Removed)
+ *    CONFIG_FIRMWARE_2ND_BOOT
  * 6. Enable DRAM extended temperature range mode
  *    CONFIG_DRAM_EXT_TEMP
  * 7. Select WDT_Full mode for power up initial reset
@@ -642,13 +642,11 @@ bypass_USB_init:
 /******************************************************************************
  Disable WDT2 for 2nd boot function
  ******************************************************************************/
-/*
-#ifndef CONFIG_FIRMWARE_2ND_BOOT
+#if !defined(CONFIG_FIRMWARE_2ND_BOOT)
     ldr   r0, =0x1e78502c
     mov   r1, #0
     str   r1, [r0]
 #endif
-*/
 /******************************************************************************
  Disable WDT3 for SPI Address mode (3 or 4 bytes) detection function
  ******************************************************************************/
-- 
2.35.1

