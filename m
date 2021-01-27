Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D25305412
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 08:11:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZX453MxzDqjV
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:11:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JvSWD1ug; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZJq6lD7zDqhn
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 18:01:31 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id n25so970591pgb.0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 23:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jreDLzgd7gUidibyy+C5l+ykWlyHdQlGuJy6wGt5bns=;
 b=JvSWD1ugow3OXhsjp9kxpKUX1WUt+3cKFINCXd8PXoxrBo7fcMkQ5oo/orraZj4Kkk
 9ts7aWTcp0YDm9wtEthMnDqecNuBXzi3hN7rtibMV4xwlVMR/7W3dmlOMvG73o2Kp94E
 TlicQf/TyGsg5C8iX6ZGKxO6HiFMMyK0G4jCtxAeQz2KdlhUfm4DYJRNDXF0kDr0KAk1
 aWuwoe+/IcLwDvPs90dUcn37+5bERC4eEI7waIOCiq1EaWWErHKUpPj/GM+DXcKuG9dk
 bOADTfY4uidBwj3uBDcdIPL8c5i6jA4hAoyzTLQuswWfYvKMZlSzs7a+ymwkpvuHzSEN
 vBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jreDLzgd7gUidibyy+C5l+ykWlyHdQlGuJy6wGt5bns=;
 b=TWYtY+jjSZvGXGzBPgcu19ziOwFE0FS12+5O3pwCJYARHhqFi9B1WM48mxltTLBEU/
 3iXQqeMdtXQxI874tJC9+KEIUtIPcXD7obqTPWLeJ30y2bzFy38Ak5PRIHh/uzgunZ25
 wFvzLwuGrnLz1YgSQCaJ+JT2LpgV9offVlzQzlpEvK1Gk9X0QJ0gQgoq3uAEIxAv+YmO
 JMy5KPs3yo+LlY0Sl8+epl+cjc8fxw46Y/LenKzNrlK0FXqgzTap/XbGj+exmUhXncI0
 Qp4sm5+E7HmnP9t1quwRvIjyn+DLghjKGE1v7xstr5jFJbAKnYjhchhe6SUcZNdj65Ny
 hmGQ==
X-Gm-Message-State: AOAM5337jpQvypyQMVsBceQam2CpGdrULxDFZ0X1xI+OF7XBqjcYgptO
 TZMczjGKoyNU3Ac9xGS88aM=
X-Google-Smtp-Source: ABdhPJxcylQCWzBmvwofKwT6gvP2mksbqIWEVW9N0PUck/j98BgCyHPPBDCHUhhuUlKu56kZOc8oUA==
X-Received: by 2002:aa7:94a2:0:b029:1b8:eba7:773e with SMTP id
 a2-20020aa794a20000b02901b8eba7773emr9343336pfl.51.1611730888732; 
 Tue, 26 Jan 2021 23:01:28 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id i1sm1258315pfb.54.2021.01.26.23.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:01:27 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 6/6] config: ast2600: Reduce
 SPL image size
Date: Wed, 27 Jan 2021 17:30:54 +1030
Message-Id: <20210127070054.81719-7-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127070054.81719-1-joel@jms.id.au>
References: <20210127070054.81719-1-joel@jms.id.au>
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

This modifies some features of the SPL to ensure it fits in the 64KB
payload size.

This set of options reduceds the binary size by 4760 bytes with GCC 10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index c55a70c5c1c9..345225131075 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -2,8 +2,9 @@ CONFIG_ARM=y
 CONFIG_SYS_CONFIG_NAME="evb_ast2600a1_spl"
 CONFIG_SYS_DCACHE_OFF=y
 CONFIG_POSITION_INDEPENDENT=y
-CONFIG_SPL_SYS_THUMB_BUILD=y
 CONFIG_SYS_THUMB_BUILD=y
+# CONFIG_SPL_USE_ARCH_MEMCPY is not set
+# CONFIG_SPL_USE_ARCH_MEMSET is not set
 CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x10000
@@ -51,6 +52,8 @@ CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
 CONFIG_SPL_STACK_R=y
 CONFIG_SPL_SEPARATE_BSS=y
+# CONFIG_TPL_BANNER_PRINT is not set
+CONFIG_SPL_FIT_IMAGE_TINY=y
 CONFIG_SPL_DM_RESET=y
 CONFIG_SPL_RAM_SUPPORT=y
 CONFIG_SPL_RAM_DEVICE=y
@@ -130,6 +133,7 @@ CONFIG_SYSRESET=y
 CONFIG_WDT=y
 CONFIG_USE_TINY_PRINTF=y
 # CONFIG_REGEX is not set
+CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPM=y
 CONFIG_SPL_TPM=y
 # CONFIG_EFI_LOADER is not set
-- 
2.29.2

