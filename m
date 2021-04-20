Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAEF365293
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ7z0t1zz2ysr
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KQlTeyyy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KQlTeyyy; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ4M6s1jz2xgL
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:31 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 gq23-20020a17090b1057b0290151869af68bso203512pjb.4
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBYBQcP+Mz5YKgN0iq8e+y/DHRsLD0stgDg9UpZ3f5k=;
 b=KQlTeyyyHj5eK6grBATvFtCSkNFwmLMaFUOcUkOntv71Yy65S3xUkIPBuRHPkTGIii
 FhEnLfoNCy58kpVW/vMf0S6/ZKDEZFY4ATpJ7tqCzp9pwI60jlJuuKCUYaMtIccmQSqB
 LWSmimQnRZSrd44yzChEqT605v7Y2HRt3rEj/WM2s5eoyFOeJIdTuB9W7wMz861xg7Um
 +bpZqzJxX9kgibNCsdU4KwyyWGAm7jhZRAhBVtu2OjCZAADqG/P23I41yfa9LZ82u2mS
 qcYLsrJb8CHqbCyKAcsS9o1mftvuLWovVililyrIHyM8yO0C0hziimskzlsGhl/M19MN
 A+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xBYBQcP+Mz5YKgN0iq8e+y/DHRsLD0stgDg9UpZ3f5k=;
 b=P7vkUGcPgrMW0uFtzhE7wqhPEdXm2hkh1CVNPQyl1Kah9lfhLXjxgfHOf3Yp76QsU+
 C039FVlQSje6uQGoIkACrBaekh9egWwO6Hcx1KsWTxS900sr/nuWettv6ZdtUWcNVvrN
 7n/tLdmTqw+/KwHqlZlwLyTtJOYZYKZpnN4z+dPfC4BjnnoeLnveX0fm4S73yiwQjksu
 D1BFJYJ4dJa59RmKbdBext7XtPj+F4mtjnOfZqdztL1GwzfKQLcr4AkhIwN7xUCNDSLm
 PHktFOQ+l/nWap24GNgUmpNiBT51sbhgrj3aTOHRdX36M77BfwZAyh9IPGwTZQK7AgHY
 sMVQ==
X-Gm-Message-State: AOAM532ZAYuYfT8rfk+CJ5N/szSteCXWLGKreq+QIXSZJkpdVwxId9pu
 9b+0POLWpdlS0CbvDiSfbljcd7qFYIY=
X-Google-Smtp-Source: ABdhPJxlNxDkqqXuULn3fy0E/qjigaQPsKFY8Sr57oeHCdvrF9QcyZ5kygzg+YTQ5gpQP66B/mZ54w==
X-Received: by 2002:a17:90a:288:: with SMTP id
 w8mr3389241pja.163.1618901248884; 
 Mon, 19 Apr 2021 23:47:28 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 08/10] config: ast2600:
 Configure common MMC SPL loader
Date: Tue, 20 Apr 2021 16:16:46 +0930
Message-Id: <20210420064648.994075-9-joel@jms.id.au>
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

The SPL will load u-boot proper from sector 0x80 (128), which is 64KB
into the device.

The link address changes as this is used as the load address by the
loader. Given the Aspeed loaders are linking u-boot at 0x10000 but
running it from RAM, the u-boot relocation code must be fine with this
setup.

The custom Aspeed loaders are disabled, and so the related configuration
options are removed from the defconfig.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index ed0233379fe9..b9190c70baa5 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -7,20 +7,9 @@ CONFIG_SYS_THUMB_BUILD=y
 # CONFIG_SPL_USE_ARCH_MEMSET is not set
 CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
-CONFIG_SYS_TEXT_BASE=0x10000
+CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_ASPEED_AST2600=y
-CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
-CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
-CONFIG_ASPEED_UBOOT_MMC_BASE=0x80
-CONFIG_ASPEED_UBOOT_MMC_PART=1
-CONFIG_ASPEED_UBOOT_MMC_SIZE=0x680
-CONFIG_ASPEED_UBOOT_UART_SIZE=0xe0000
-CONFIG_ASPEED_UBOOT_DRAM_BASE=0x81000000
-CONFIG_ASPEED_KERNEL_FIT_SPI_BASE=0x20100000
-CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
-CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
-CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
-CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
+# CONFIG_ASPEED_LOADERS is not set
 CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
@@ -53,6 +42,8 @@ CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
+CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
 CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
-- 
2.30.2

