Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D8306881
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:19:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1LJ07nszDqMr
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:19:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ubq+F+dO; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1G41xMfzDr4M
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:15:40 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id jx18so2930130pjb.5
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 16:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gZ56LZHqiWJBgyVH2pBnk15oUCJAzMTqjxEWSJOmNo=;
 b=Ubq+F+dOFn3cF8KRwnUWp+rRsxJPyWknGNbuCsuYJeyP6kNCjAWF8KLvmfB6mkOHgL
 HVRtEqJ8snCWgfyBZo8BH7OIkBRzYS6vjWnljKqNKXrrq3/iG9oMvpcANZvpfneZmD5U
 DTiTHnC/YK6gnreVYeXM8bcqazgn4T1xVMaFp8byqvrt4XD1aTKa0Me5ErpZgj5uzOp+
 vBQ9muj7s8oHtsbsbEZP999Rch4Hmzqlk4D74CUew9oP3Gsf1eGPoBph9QGSL+3pW2JZ
 YN3yl4H+aagM09rpoU3X0JHVinPd3Zlapz+XyzpYs11AuHVXIreGuUz4ZHIGmTQ60F6n
 lPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2gZ56LZHqiWJBgyVH2pBnk15oUCJAzMTqjxEWSJOmNo=;
 b=n0qc7tQsKNx3AF4UcBtvGESBoW5WUkt8zU1I3P2d7xDrZADZt9bxY4z8RmrPFnvAdV
 566+yanVIrBgYrRYosM+xyC0xq/CBbO2NgUbaA0C6v+FH+4Qz19YZNqjQ3zg8HFk8kN3
 KS9yjXsVEIX4dTJpvS1hgBk8J7BEMih4euS9nGRVUOJF7Cu6L2X5XH08bPGLmS/9Jgdd
 753KY4CkCZzDFUTmh4UD9mOZRdFQK8UFUH96cHT86JUGB/qFICcpNOwwSE4x6GSWcJmQ
 DmgCDD/GASQHLsC3ky8e04leL2pqXROCsFKsSGliV30wGN4GnrkU50PJ0BtC2Nea62d0
 yxOw==
X-Gm-Message-State: AOAM5315DT3OdCqIg0jKzbvrRM7y8+5U4+f0RgnMKyIZOG1tC882my7b
 q8Fr4qKL2Mb78e4oUtEhJcM=
X-Google-Smtp-Source: ABdhPJy5WUPDmaFb8ZnF287el9cK1l/k+i1GuMspEx64iL9AHIWR7MxuXGGBbWmz4DceIyq4ic87yQ==
X-Received: by 2002:a17:90a:df84:: with SMTP id
 p4mr8208729pjv.81.1611792936889; 
 Wed, 27 Jan 2021 16:15:36 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x19sm3529239pff.192.2021.01.27.16.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:15:35 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/4] config: ast2600: Reduce
 SPL image size
Date: Thu, 28 Jan 2021 10:45:18 +1030
Message-Id: <20210128001521.266883-3-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128001521.266883-1-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
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
payload size once we enable FIT signature verification in the SPL.

We still build with thumb, as this is selected SYS_THUMB_BUILD (ie, the
SPL defaults to thumb if u-boot proper is built with thumb).

The not using the arch memcpy/memset changes save 668 bytes. The tiny
memset saves 52 bytes. (Anyone who wants to test the runtime impact of
these changes should do so!)

The DOS_PARTITION change saves 229 bytes.

In total, this set of options reduces the binary size by 1105 bytes
with GCC 10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v3:
 - Drop unnecessary TPL banner change
 - Clarify thumb build
 - Add data on size impact of each change
 - Add DOS_PARTITION change to this patch
 - Move FIT_TINY to a different patch; with the reordering of patches
   FIT verification is not yet turned on when applying this patch
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 68d18652c980..26e8790cef87 100644
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
@@ -80,6 +81,7 @@ CONFIG_CMD_EXT4_WRITE=y
 CONFIG_CMD_FAT=y
 CONFIG_CMD_FS_GENERIC=y
 CONFIG_CMD_MTDPARTS=y
+# CONFIG_SPL_DOS_PARTITION is not set
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_ENV_IS_IN_MMC=y
@@ -125,6 +127,7 @@ CONFIG_DM_SPI=y
 CONFIG_SYSRESET=y
 CONFIG_WDT=y
 CONFIG_USE_TINY_PRINTF=y
+CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPM=y
 CONFIG_SPL_TPM=y
 # CONFIG_EFI_LOADER is not set
-- 
2.29.2

