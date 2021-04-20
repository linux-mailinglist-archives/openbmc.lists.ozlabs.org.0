Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E8365288
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 08:47:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZ4Z4rJjz2y8Q
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bo9mK3zu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bo9mK3zu; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZ3w1z0Pz2xZR
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 16:47:07 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id w6so10324800pfc.8
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 23:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zPBYdUh+yc6jzCWP/gbH9eOnpReRbdSzZoKGEmJrcyI=;
 b=bo9mK3zuSKMEM1JkwnE/IbnhaR0x2oMwtMmwfSqsgMlqTIvia0JTxCgKjEv7pFGaH2
 nqt4WDDMqtKbzVT11/KOTLCjntQ1UYZIMJ3FhH9GNnEjnzZIn75aXI637LSnbZPccVCF
 EeG+r2oSxzi2CV2RVcE8dVBcevTRkOXy/szbNevLaTyOYGp7HuDPiIT3sHtbLDMZJBMM
 gMV27Y4CZEKktfMg1NTnnWZA1HPFmQXgg7uoFaqo6P5UDbpDFOgzrSPWS370lqEJ9Is7
 8slhUrBuwgJpGuS0qPalpQPXyRoi+TIVXfjr4ATx9DexZYZzVTASYKo/xLEdhkX7nGcM
 T4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zPBYdUh+yc6jzCWP/gbH9eOnpReRbdSzZoKGEmJrcyI=;
 b=hGkvY2t0sxEFQ8gjFAwi8umThlXMDQkLo6aGfsjcvjSka+elma2ej8dwhNkJkWFGPj
 5UUgTqNLsY076zp4nFlE64SDmFvMV+HNP/Tmo7bGivRy6c5wFe9yfMV2XPu7TiyOnWIA
 ry7Adg+ICf92i4cqgaE+MOtXMOvqHMRFF2IEOyvdD9lXVRBHDGkwXYMHrFl0ip6hYH9x
 HhVPYpGK0lEGP+R7afp/Ddt5iAaaig7+zcaJ4qhe4SnWa2l4na4ORRAKskA+DbAqz4qv
 0urVUTIdB1AeQXMUeUPucIgttpiMMsuK/nIeSoep/NeSkJzhEk4ZpcJ+1LS8WigqQlbl
 KyqQ==
X-Gm-Message-State: AOAM533eUNp8mzjfOep9dSeM/ALou+4AdW5OjPpRStiXMEFyjA00Dpzh
 b+v/s7HLYhywUBHhN+pRq03oGk2lrfY=
X-Google-Smtp-Source: ABdhPJws0psiThzssVAlKJpXXw5Bp1TkcFPIACHRJuguO42p6hPRPa4gi7fzMJTFYN0INd5LdjCsVw==
X-Received: by 2002:a62:5ec7:0:b029:227:3253:3f62 with SMTP id
 s190-20020a625ec70000b029022732533f62mr23180993pfb.54.1618901224926; 
 Mon, 19 Apr 2021 23:47:04 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id d12sm582311pjj.50.2021.04.19.23.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 23:47:04 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 01/10] configs/ast2600: Make
 early malloc pool larger
Date: Tue, 20 Apr 2021 16:16:39 +0930
Message-Id: <20210420064648.994075-2-joel@jms.id.au>
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

The size of the early (pre-DRAM) SRAM heap in u-boot proper is extended
to 8KB.

Testing found that the DRAM driver would perform an allocation that
exceeded the limits, due to the probing of the HACE driver increasing
memory presssure. As SRAM is unused when u-boot proper is running, it
can all be allocated.

(In theory the entire 88KB of SRAM is free, but testing showed more than
60KB would break booting. Finding out why is TODO).

The SPL early heap is fixed to 0x800, the default before this change.
Testing shows that:

  SPL malloc() before relocation used 0x794 bytes (1 KB)

So 2KB should be enough.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 6daf6343478b..5a4d66da1cea 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -24,12 +24,13 @@ CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
 CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
-CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x10000
 CONFIG_ENV_OFFSET=0x5000
+CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
 CONFIG_SPL=y
 CONFIG_SPL_STACK_R_ADDR=0x90300000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
-- 
2.30.2

