Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 465DF52E526
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 08:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4HFh1ZB2z3bkL
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 16:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pyCvAW1x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pyCvAW1x; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4HFD5SGGz300x
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 16:41:34 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id p12so7026619pfn.0
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6QEmIrYY5IdX5D85mBQD00w2HlEaxQf+jQrRuaCMVaY=;
 b=pyCvAW1xKB4MT0fWkkdhfT2sSKM7+iz7Rl2NhhCKM5oqt1cluHd07VX0H1Q+EwDOfu
 rrz1+PLCwwtZvjhF54FeOAd0Ot/WpQnpFmPInyKNWOAvdMe+7UbrlI6gtC2Q5uNvxmce
 93t89XTIhOq5ShBscCR3xnCcrSaKjYr7w0V4scLqgG6zc05fYgWlK52dkQ4nmpGynjdJ
 hiEqtJihlqdRFDZRYrHzApI2FniSsyymC1nYJTam9StUFDTvG2tvtmbN/23dio/ffa/N
 JA1cxWYJAJFPAbPgxnIr6G/hF9SwJvBGgsBm6o6K6aX/5l1J5efiVTykquoZJOBEtlmL
 1FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6QEmIrYY5IdX5D85mBQD00w2HlEaxQf+jQrRuaCMVaY=;
 b=35BKVAS6Waw02XZTNP6fb+v9L6qBmTYyKzVaqvyzO5KunTpU6oNq9LE9rfNx6u6prQ
 hfxO7eGUzMNWUtvSmkGlerlDdEmWKUozKtEGiY2zMjKa98qDjJuS7G606apK0jlMN1OT
 PilVpZTf6wqwFkbqOGL/nUTmSYkk5YQMmJ1ssZYOmezM0JYchP4xkn0542EWREIptQL4
 8yBpeycBloe4EuEM3+iD9zkXUFXqNbOVrow0BrJqJjl/ZrBw0WCHdIn+ixC/bTYqP0h2
 JvAbp4H7K/UiGWaWlO08z54Y2MistTXsgI8kcxlBEgh4NwuwZJF47TMrc5bD8YESZbog
 Qbow==
X-Gm-Message-State: AOAM5307th8S7V7nSyQQs+aoohy+E9X6GzlK/ofViqBFXplbTr2xxMw9
 KBhxRYBxqDsHDoBi+MHDEGOXt8cQys0=
X-Google-Smtp-Source: ABdhPJzOLOIXWXfxT/0hfCOAotaStebL2leTn3yPIN8KEoEoH046Zfb3AMDkveijcXvYge0i070onQ==
X-Received: by 2002:aa7:9217:0:b0:518:367d:fa85 with SMTP id
 23-20020aa79217000000b00518367dfa85mr8401060pfo.9.1653028889466; 
 Thu, 19 May 2022 23:41:29 -0700 (PDT)
Received: from voyager.base64.com.au (ip14.cor1.adl1.base64.com.au.
 [203.0.153.14]) by smtp.gmail.com with ESMTPSA id
 w22-20020a1709026f1600b0016189ed82c4sm4823234plk.79.2022.05.19.23.41.27
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 23:41:28 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] configs: ast2600: Remove
 redundant target option
Date: Fri, 20 May 2022 16:11:22 +0930
Message-Id: <20220520064122.692019-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

All the defconfigs have CONFIG_TARGET_EVB_AST2600A1 which hasn't existed
in the tree for some time. The boards still work as the default is
TARGET_EVB_AST2600 (which doesn't appear in the defconfig as it's the
default).

Clean up the defconfigs by removing this option.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_defconfig    | 1 -
 configs/evb-ast2600-cot_defconfig        | 1 -
 configs/evb-ast2600-ecc_defconfig        | 1 -
 configs/evb-ast2600a1-cot_defconfig      | 1 -
 configs/evb-ast2600a1-ecc_defconfig      | 1 -
 configs/evb-ast2600a1-emmc-cot_defconfig | 1 -
 configs/evb-ast2600a1-emmc_defconfig     | 1 -
 7 files changed, 7 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
index 98aa3f160e74..ff2fff538a35 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -19,7 +19,6 @@ CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
 CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
 CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
 CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
diff --git a/configs/evb-ast2600-cot_defconfig b/configs/evb-ast2600-cot_defconfig
index f739593659e6..b656e528c855 100644
--- a/configs/evb-ast2600-cot_defconfig
+++ b/configs/evb-ast2600-cot_defconfig
@@ -17,7 +17,6 @@ CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
 CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
 CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
 CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
diff --git a/configs/evb-ast2600-ecc_defconfig b/configs/evb-ast2600-ecc_defconfig
index 26f705c5e685..c637bac65472 100644
--- a/configs/evb-ast2600-ecc_defconfig
+++ b/configs/evb-ast2600-ecc_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_ASPEED_AST2600=y
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
 CONFIG_ENV_SIZE=0x10000
 CONFIG_ENV_OFFSET=0xE0000
diff --git a/configs/evb-ast2600a1-cot_defconfig b/configs/evb-ast2600a1-cot_defconfig
index f739593659e6..b656e528c855 100644
--- a/configs/evb-ast2600a1-cot_defconfig
+++ b/configs/evb-ast2600a1-cot_defconfig
@@ -17,7 +17,6 @@ CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
 CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
 CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
 CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
diff --git a/configs/evb-ast2600a1-ecc_defconfig b/configs/evb-ast2600a1-ecc_defconfig
index 26f705c5e685..c637bac65472 100644
--- a/configs/evb-ast2600a1-ecc_defconfig
+++ b/configs/evb-ast2600a1-ecc_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYS_DCACHE_OFF=y
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x0
 CONFIG_ASPEED_AST2600=y
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
 CONFIG_ENV_SIZE=0x10000
 CONFIG_ENV_OFFSET=0xE0000
diff --git a/configs/evb-ast2600a1-emmc-cot_defconfig b/configs/evb-ast2600a1-emmc-cot_defconfig
index f7f56fc30668..68ac56cf170c 100644
--- a/configs/evb-ast2600a1-emmc-cot_defconfig
+++ b/configs/evb-ast2600a1-emmc-cot_defconfig
@@ -17,7 +17,6 @@ CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
 CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
 CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
 CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
diff --git a/configs/evb-ast2600a1-emmc_defconfig b/configs/evb-ast2600a1-emmc_defconfig
index 8dff76761ea0..ce3bd5e07dba 100644
--- a/configs/evb-ast2600a1-emmc_defconfig
+++ b/configs/evb-ast2600a1-emmc_defconfig
@@ -18,7 +18,6 @@ CONFIG_ASPEED_KERNEL_FIT_SPI_SIZE=0x1000000
 CONFIG_ASPEED_KERNEL_FIT_MMC_BASE=0x800
 CONFIG_ASPEED_KERNEL_FIT_MMC_SIZE=0x8000
 CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
-CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x800
-- 
2.35.1

