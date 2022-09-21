Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8C5BF814
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVpt34ldz3btQ
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:46:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H1G4f2+D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H1G4f2+D;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVn74vXYz2xYn
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:44:59 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q3so5568258pjg.3
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date;
        bh=F3l6So7/MKejkIx6oF+akIW9V5AjxOtuSQePTXOMAh0=;
        b=H1G4f2+DoSRuLZLMDp+u7l6QRtnSMrCbBRw2U/7KuLsbaori2Sm+q/zZ5XaFq65n8B
         PLloOpQEHR5oCASyyrFwfWca5rcNZKojA/a5+fqGJhc31nR6UQSLk524BIxvastSC0Qy
         Wgix5EpOBnEGLLHeHfs2ytHei9xS40pU4RcXY7PeipkFFsuHS8y6nVs/atv28KkBsLSP
         Bk23Kj+v/DL+eOus1F9dGv0pOkRPZ3PHrLFfjfZhTJdRYv5uci6+tQBD3rhdm80kKN7Y
         XDX69QjhR4SelKjZjnLzn/mZA2E2i2h3H03MdYrL8oJFSFyu9LVZ0WRTbMPqvhyRWiwi
         5pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=F3l6So7/MKejkIx6oF+akIW9V5AjxOtuSQePTXOMAh0=;
        b=eMD/AfrAUdoykyXeevBpWIOqjXkWmUc8wNXU418cIv+kPcL8kXoKdRgwSZP74H6yu2
         dCyFLI5jdwwUd/SOBeeTlm2VDh+1hevKoju1kdTCQV3b7mCPnDuCJlRFNTES8tX6qdiy
         l927SOfw7RmVsyBbdXdz7X6f3MwUZR8Yiw0ZmxS49PVpGI8t2WB5PRsrZPmTqA6hjGNn
         0dX+Eby7DJzOEjwpsE5FH0FiwLTTJCoIgmgSyaF6PNArN5MKmb/orpTalk8XPvAs6vX+
         AiYlGvleshk4y9uLjPrNxuUK31b/WRr3lu44h6j2KM90exuGzlfBA8BZLGkJeyGyqjE3
         i8aA==
X-Gm-Message-State: ACrzQf0sV/Xc/NTxoTyibuEa8I4DsBsjiNgjped7Gd/8nh5Y2E8pjRNq
	ox8qZfYCB+Qz+tZKmxWX2nklwgf5XII=
X-Google-Smtp-Source: AMsMyM7dye7Mxe0UgZ+Ay+z0tnfg/1SRX2NMwvTH4Bq+7/NyrIaA/MiEWmcKyjN46YXg+sX/EcFVgw==
X-Received: by 2002:a17:902:f707:b0:178:77ca:a770 with SMTP id h7-20020a170902f70700b0017877caa770mr3510863plo.54.1663746296963;
        Wed, 21 Sep 2022 00:44:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090a121600b001f22647cb56sm1192339pja.27.2022.09.21.00.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:44:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/4] ram/aspeed: Remove ECC config option
Date: Wed, 21 Sep 2022 17:14:37 +0930
Message-Id: <20220921074439.2265651-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921074439.2265651-1-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Always build the code now that it is enabled by device tree.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/ram/aspeed/sdram_ast2500.c | 4 ----
 drivers/ram/aspeed/sdram_ast2600.c | 5 +----
 drivers/ram/aspeed/Kconfig         | 7 -------
 3 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index 79760975be44..c8eee32da698 100644
--- a/drivers/ram/aspeed/sdram_ast2500.c
+++ b/drivers/ram/aspeed/sdram_ast2500.c
@@ -278,7 +278,6 @@ static void ast2500_sdrammc_calc_size(struct dram_info *info)
 			 << SDRAM_CONF_CAP_SHIFT));
 }
 
-#ifdef CONFIG_ASPEED_ECC
 static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2500_sdrammc_regs *regs = info->regs;
@@ -313,7 +312,6 @@ static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 	writel(0x400, &regs->ecc_test_ctrl);
 	printf("ECC enable, ");
 }
-#endif
 
 static int ast2500_sdrammc_init_ddr4(struct udevice *dev)
 {
@@ -371,14 +369,12 @@ static int ast2500_sdrammc_init_ddr4(struct udevice *dev)
 
 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
 
-#ifdef CONFIG_ASPEED_ECC
 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
 		u32 ecc_size;
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
 		ast2500_sdrammc_ecc_enable(info, ecc_size);
 	}
-#endif
 
 	/* Enable all requests except video & display */
 	writel(SDRAM_REQ_USB20_EHCI1
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 2a4d6af57eb3..5f7b160faddf 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -859,7 +859,7 @@ static void ast2600_sdrammc_update_size(struct dram_info *info)
 
 	info->info.size = hw_size;
 }
-#ifdef CONFIG_ASPEED_ECC
+
 static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 {
 	struct ast2600_sdrammc_regs *regs = info->regs;
@@ -890,7 +890,6 @@ static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 	writel(BIT(31), &regs->intr_ctrl);
 	writel(0, &regs->intr_ctrl);
 }
-#endif
 
 static int ast2600_sdrammc_probe(struct udevice *dev)
 {
@@ -988,14 +987,12 @@ L_ast2600_sdramphy_train:
 	}
 #endif
 
-#ifdef CONFIG_ASPEED_ECC
 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
 		u32 ecc_size;
 
 		ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
 		ast2600_sdrammc_ecc_enable(priv, ecc_size);
 	}
-#endif
 
 	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
 	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
index 54c7769b5bbe..25238bf28d32 100644
--- a/drivers/ram/aspeed/Kconfig
+++ b/drivers/ram/aspeed/Kconfig
@@ -44,13 +44,6 @@ config ASPEED_BYPASS_SELFTEST
 	  Say Y here to bypass DRAM self test to speed up the boot time
 endif
 
-config ASPEED_ECC
-	bool "aspeed SDRAM error correcting code"
-	depends on DM && OF_CONTROL && ARCH_ASPEED
-	default n
-	help
-	  enable SDRAM ECC function
-
 choice
 	prompt "DDR4 PHY side ODT"
 	default ASPEED_DDR4_PHY_ODT40
-- 
2.35.1

