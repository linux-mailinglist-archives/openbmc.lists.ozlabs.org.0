Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80E35D9AC
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJF72kTBz30F3
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:10:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H19YTf5A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H19YTf5A; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBx37kqz30Gp
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:25 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so10295529pjh.1
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=boc1vT3ORU/EtInOTGw8fm1GuWNY14JyYiHeWrjJR/0=;
 b=H19YTf5Aew5WVaBc/1I6fKFx5xXOQqQE0HCdVg8zC9+Z/W5Fj8wpHWjcwN+PYdm3iL
 xamEBEyhm5y8hhm870WAwixNfhSw8oGCnzaxoY+rd6+XIy/irwPTWQMeN1AYVGihW7Wh
 fGe99FltNx86N48j2Qywa0eGYkEuNx444nDcTr5GyeIcxysGcO7mzPHpgJuWxmMvb8yo
 zz3xGGqMG3bl6+wh52LQCKOPhSrwAxHvEIEkRb9/ADvCfiAjlgG7Xx2lpSh8CqbbBHtv
 A0x418kFTkW3r7wZFY6Jv528Ywu5W1hW59SE1l21ARVvQEARCqa7XxA9geR03NuUsHIo
 chOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=boc1vT3ORU/EtInOTGw8fm1GuWNY14JyYiHeWrjJR/0=;
 b=gabia4ecqFb9vfAqPJOrq8ZcgvZUf8Ra3vDvnhbgelJSin4RxepmvtIGlQyzORG6M6
 M/11YH7NhXXVjg3q5CvSULVYcQNX0eGpDeNb9EG49V+GgPNqXb6GVJsAkmxZ1P1deBoU
 E49HbFmvooCSPRCHJa4RjnhvhSpJ2kDCGbMpjYimkDei0NHruONygsTIdhJpXd8MwkWc
 0GddV7nLtr78afLekI6rHbjhbex8PEOFHnm1U4yEzNRMFbU+9FpiBXX9fU0X5q9LGWG8
 iZembRVreJoI4JhBI8CsbaT7x3Oq/0jesyJY16nC5fzU3PtYjujMFt3cfdpw+vaUv9UI
 qNmQ==
X-Gm-Message-State: AOAM533awcpsE1lGCD03T1dCOQjM4dXTEYWUV5l3QrGKwbNAJzOr7Djm
 bAMz1u8zphV0JktYGKcpSWJUw2ZDJqY=
X-Google-Smtp-Source: ABdhPJySoBKR3LvbGgxIkNgPp5xZtF3acSaZJ9a5Sm2FpmR1PcvDp5VJwyB5N2hMgn0TuTBN7jSEJA==
X-Received: by 2002:a17:90a:f40a:: with SMTP id
 ch10mr3451835pjb.62.1618301302733; 
 Tue, 13 Apr 2021 01:08:22 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 05/11] config: ast2600: Enable
 common eMMC SPL loader
Date: Tue, 13 Apr 2021 17:37:49 +0930
Message-Id: <20210413080755.73572-6-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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

Notabily the link address changes, as this is used as the load address
by the loader.

Given the Aspeed loaders are linking u-boot at 0x10000 but running it
from RAM, the u-boot relocation code must be fine with this setup.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 6daf6343478b..e59d3595ebf0 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -7,7 +7,7 @@ CONFIG_SYS_THUMB_BUILD=y
 # CONFIG_SPL_USE_ARCH_MEMSET is not set
 CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
-CONFIG_SYS_TEXT_BASE=0x10000
+CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_ASPEED_AST2600=y
 CONFIG_ASPEED_UBOOT_SPI_BASE=0x10000
 CONFIG_ASPEED_UBOOT_SPI_SIZE=0xd0000
@@ -47,11 +47,12 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_ARCH_EARLY_INIT_R=y
 CONFIG_BOARD_EARLY_INIT_F=y
-# CONFIG_SPL_RAW_IMAGE_SUPPORT is not set
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
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

