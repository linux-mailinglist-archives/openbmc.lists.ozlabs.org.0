Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A31577DEA
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbGf43x4z2yh9
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ln62WRv3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ln62WRv3;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFY3qWVz2xKl
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:44 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id v7so10078341pfb.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3qawsMBQemG9z7CYKzOqPaywiUF1dm/lF9v4RvLZ34=;
        b=Ln62WRv3g/mGvTy8kyUDED3ZuIVC7HsjIBuSKV2UuuEOCmF9XpPYhMvT42aIrab+g6
         5mG0zEGaJ/+h7wAm2zb/F3foCV7oBL+cCDKywbGs+1x5iaap3Zi3lvFBj+0hRmfvnEpH
         HbgmHlpseUs4omSvcb/by6xJPBF+Z2xE81/XxiydhO31G0QoyFRvx8B/sYW4eTHm32ou
         wuEpoLjmrm16KqYYNHMEpD7orApDEgk1tHJr2AOplBdhtXwIIaF8HZKz5Hz2EkAF2e1T
         6qZ9/Au4wxfehInh5eRfadjMwLOFbBtc4BT1Lv/xVEn3xHEfwxuJpqz1wgsiOOdsspwo
         XIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=p3qawsMBQemG9z7CYKzOqPaywiUF1dm/lF9v4RvLZ34=;
        b=6/cCACr9IjgPD9um90NWArEqj0JiCJ2L9/U6Lw2faV25aLdqNXGnvn23xSS1Bln/C1
         KjxuBS27Z++0ZDCfxgIEfEVW/SnJTm/vMGG6zSbOzxS1gBWcxS43Ai4BJOy6wp24EiLG
         2+6gQ8d0vageengpeLHD3KT1v1LAo9b4lVqkEIFzjzDa13kHsSEmlwz4/mvGLX758fo6
         A2OKzsIBiPRfH6ioyffKNUgVOIJGjYuWW+QicVDGKz/oRW+XTIBgOHopIhvkSIfJ1bP+
         NeEIhNoH7bDpRJEOEcE3ZdvcwmNItpASXPdsM7+s2ESreIMmqyu1idbbbZtLyeE7U5nq
         Tm3g==
X-Gm-Message-State: AJIora8IcjmEf7DbzumrMR9RMd8p6XMi3BHoz/wUINcoJCdMFhVN0Cec
	uIyBSEOspCs5kIjOPesOy+gtJEtIVeg=
X-Google-Smtp-Source: AGRyM1s+9dhRpRcfJI+p1EfgwWJ6J+nmZDsOD5IVo6dQ5FtbimL7wUCJeF3IhPCBStVuvV4+oKUtUw==
X-Received: by 2002:a63:e20f:0:b0:41a:3744:ee8f with SMTP id q15-20020a63e20f000000b0041a3744ee8fmr843898pgh.443.1658134061702;
        Mon, 18 Jul 2022 01:47:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/5] config/openbmc: Enable SHA384
Date: Mon, 18 Jul 2022 18:17:24 +0930
Message-Id: <20220718084728.1140108-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718084728.1140108-1-joel@jms.id.au>
References: <20220718084728.1140108-1-joel@jms.id.au>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is now required by the otp command.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 8c2acb7e6efe..45c9fa162cd7 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -9,7 +9,6 @@ CONFIG_SPL_LDSCRIPT="arch/$(ARCH)/mach-aspeed/ast2600/u-boot-spl.lds"
 CONFIG_ARCH_ASPEED=y
 CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_ASPEED_AST2600=y
-# CONFIG_ASPEED_LOADERS is not set
 CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
@@ -134,4 +133,5 @@ CONFIG_WDT=y
 CONFIG_USE_TINY_PRINTF=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPM=y
+CONFIG_SHA384=y
 # CONFIG_EFI_LOADER is not set
-- 
2.35.1

