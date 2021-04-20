Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9436528F
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:49:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ715RS1z2yyK
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hgrY0LkT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hgrY0LkT; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ4F0F2Dz2ydJ
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:24 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id t22so25973405pgu.0
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUYhJ0dP2fVizwGn7orcs4l30NG8G/bynp4X8mzTMTQ=;
 b=hgrY0LkT2kkJ7ZbsG/BEycZJrbSiaDYKzONvynM4Btpc9XtBXpfwYxG3rKZy0siksw
 Lk/gPHPwwJFoYl02/j9p40Yw0d0HV+lJmTiT6vNk22t1+NC5qKii9yKEbENhJmMoo7no
 hP8gdMhlX9zbjqp6RiyA6VhNMV8S4L7Tr8XK8oSQPqNVArGFm8ybzchJ18AJ+yaYr4oI
 USYLo9JPg3lzccmnxNo09kpD/sZT0xYPTS9Gseh+MkXbyIuswro9cFj/tbDVlg7UjxaU
 skls2iRPfer8wN/4Ew8Tp73bOzDreEdpiHO5L+um+x1As0x22zemOgvFDdXoBoF1amWy
 wmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sUYhJ0dP2fVizwGn7orcs4l30NG8G/bynp4X8mzTMTQ=;
 b=dN76r8G8OfZRSjqoP97us2wplr+5RjAUXodMawaBUnS/8DMrhKmQPXgjWN9zoZEPcx
 jEEhc23eohRThQJz+p5kV9aIwak6xpZgrlVGHm3ltugw88TmJbfX60caTfCzS3A47R0X
 RZ5sSZXXfYhH95lVjVMwwwx5gwmGel004ndQiKUemgSx3YLLoJijWhSGb5utKhvy9SHf
 HszvwLOKsXUK7ekFnD+OznLwtptajZvO2FFjY+1gLmoIJNJCqeyOxaD8fq91+aahg5ne
 Mxnxejkc7v49ZYVdj5c4hvF5sPj9XYLFjMXRWmsIli3MzrBVoXj3l7iEA0YDcSgApLGj
 88QA==
X-Gm-Message-State: AOAM531AZrrLmam5S3Rb56aQaqL94xbqfNuy+XsHqGC9VrrvrCyxG6oc
 leoAg0GBd51AixYNK7oBnVw6LdhmX1Y=
X-Google-Smtp-Source: ABdhPJyRaQvSKZIoVm9nKLrkAkh/BPDxVUrDgHJ7FUFRLzfwoYMSlQDJfxCFwHjPwiTLvRU4BFh6yA==
X-Received: by 2002:a62:3086:0:b029:248:16e0:7c6 with SMTP id
 w128-20020a6230860000b029024816e007c6mr23969960pfw.19.1618901242058; 
 Mon, 19 Apr 2021 23:47:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 06/10] ast2600: spl: Add
 ASPEED_LOADERS option
Date: Tue, 20 Apr 2021 16:16:44 +0930
Message-Id: <20210420064648.994075-7-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420064648.994075-1-joel@jms.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This places the ASPEED loaders behind configuration option that can be
disabled to instead use the common code. This option is enabled by
default so existing configurations do not need to change.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/Kconfig          | 15 +++++++++++++++
 arch/arm/mach-aspeed/ast2600/Makefile |  6 ++++--
 arch/arm/mach-aspeed/ast2600/spl.c    |  2 ++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index 44d392a70610..bccb63a99e54 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -54,6 +54,19 @@ config ASPEED_PALLADIUM
 	  This is mainly for internal verification and investigation
 	  on HW design. If not sure, say N.
 
+config ASPEED_LOADERS
+       bool "ASPEED custom loaders"
+       depends on SPL
+       default y
+       help
+        Enable the custom payload loading methods used by ASPEED. This is requited to
+        use ASPEED's proprietary secure boot feature.
+
+        Disable this is if you are using u-boot's common loader functionally
+        to eg. load u-boot as a FIT and use vboot.
+
+if ASPEED_LOADERS
+
 config ASPEED_SECURE_BOOT
 	bool "Support Aspeed secure boot feature"
 	depends on SPL && ASPEED_AST2600
@@ -154,6 +167,8 @@ config ASPEED_KERNEL_FIT_DRAM_BASE
 	  The DRAM address where the Kernel FIT image
 	  will be loaded if XIP is not supported
 
+endif
+
 source "arch/arm/mach-aspeed/ast2400/Kconfig"
 source "arch/arm/mach-aspeed/ast2500/Kconfig"
 source "arch/arm/mach-aspeed/ast2600/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/Makefile b/arch/arm/mach-aspeed/ast2600/Makefile
index 0abac4c233e4..d07e8c737cfe 100644
--- a/arch/arm/mach-aspeed/ast2600/Makefile
+++ b/arch/arm/mach-aspeed/ast2600/Makefile
@@ -1,2 +1,4 @@
-obj-y   += platform.o board_common.o scu_info.o utils.o cache.o crypto.o aspeed_verify.o
-obj-$(CONFIG_SPL_BUILD) += spl.o spl_boot.o
+obj-y   += platform.o board_common.o scu_info.o utils.o cache.o
+obj-$(CONFIG_ASPEED_SECURE_BOOT) += crypto.o aspeed_verify.o
+obj-$(CONFIG_ASPEED_LOADERS) += spl_boot.o
+obj-$(CONFIG_SPL_BUILD) += spl.o
diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index e1eef121d5c6..40eabca683c2 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -47,6 +47,7 @@ void spl_board_init(void)
 
 u32 spl_boot_device(void)
 {
+#if IS_ENABLED(CONFIG_ASPEED_LOADERS)
 	switch (aspeed_bootmode()) {
 	case AST_BOOTMODE_EMMC:
 		return (IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT))?
@@ -60,6 +61,7 @@ u32 spl_boot_device(void)
 	default:
 		break;
 	}
+#endif
 
 	return BOOT_DEVICE_NONE;
 }
-- 
2.30.2

