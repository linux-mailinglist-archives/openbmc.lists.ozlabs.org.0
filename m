Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A165BF828
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 09:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXVsT3hRfz3bln
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 17:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X4mZx5N0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X4mZx5N0;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXVq64Zs6z3blw
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 17:46:42 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id go6so5594566pjb.2
        for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=lV1fVRHu0HqI/3tI+2g4EFtvFPQM3dnekCoT05lcPYs=;
        b=X4mZx5N02KbMIIk9TCBrgvH0UXWqJ4eTj5bYe6oj7TPtSsCwNLzltbH5D4rWYAI+qo
         bGd5ZusnUjh6WMKqFk0m2VnGSmFRlFzRWdVHNhi8MZ7gfGIpCETmTpqBRXIKxPv3WXWs
         2n8r4Cs8qNn+xS/okuJ8IXr/JrfkHcL0mGCfKfM3XkavbCMZneSNacNv/drF+Wq/B6ho
         kl9yGgPiiT+EsCtxRQclmfV6VsxMJrYj5rYab7sUKdic/lnbj8GbmOLMl4c+eOKJSySg
         hdORgz3Svo1ki92vgOcgjDeZRSJfhE100XHDYfMRVJt/o8sleAWZVZ5w6Hp2ZbFqydcS
         cF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=lV1fVRHu0HqI/3tI+2g4EFtvFPQM3dnekCoT05lcPYs=;
        b=kd0Pkqa2Z0DS37g07MMyqWLwLF47j4BzvTdMrSoESWhHuJNBexMGfvO2qrWNlrePlW
         mmZAPbK+xdu5L1gGlBEPOPmh7N9AW/6PNWZvHCHMQwhnDKngori/M7c9KoYUpvUzuMvs
         3rViJ1YHO4reOy/yNeweTNtviPsCG+jMeQtv44TNnV8GKTd8hzot2QkYnPu5eCC2miog
         vrlc6iQGt+yS66ba6BvJIpE2N/1ONvx7xBYfP3MnyO9cVRHD3vVFe//QlxXtWK+Z8qwv
         IjI1XHSGbzbbCg6n7DdPfFVC3TLRkXIz/6+07XSP0Rm/u6864D59F70W3dNFFaQnXCls
         731g==
X-Gm-Message-State: ACrzQf3FPY+sXIJilLu9epDzVPZxueqVHSWy35spk4c2197uaV885HWI
	PPKHAc4Qpixb0oEdCR8hAxep1NW36kk=
X-Google-Smtp-Source: AMsMyM4I1UjGMyar0Vc+hEm+LY0iPFutEUvBtrWIUWZAewTCH1vwDM79E73AynNqRRD3fKE/Y+rJpA==
X-Received: by 2002:a17:902:c951:b0:176:d421:7502 with SMTP id i17-20020a170902c95100b00176d4217502mr3460732pla.72.1663746399161;
        Wed, 21 Sep 2022 00:46:39 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a4d0700b001fb3522d53asm1161567pjg.34.2022.09.21.00.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:46:38 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] ram/aspeed: Re-init ECC if requested but not enabled
Date: Wed, 21 Sep 2022 17:16:29 +0930
Message-Id: <20220921074629.2265812-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If a machine has a new u-boot installed that enables ECC, but it has not
had a power cycle since being updated, the DDR will not re-initalise and
ECC will stay disabled.

Similarly for the reverse case, where ECC was enabled but a new u-boot
disables it.

Detect if ECC has been requested by the firmware and check against the
hardware state. If it does not match, and the DDR has already been
initialised, proceed as if the DDR has not been set up.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Add ast2500 too
 Fix logic for if (required) test
---
 drivers/ram/aspeed/sdram_ast2500.c | 23 ++++++++++++++++++++++-
 drivers/ram/aspeed/sdram_ast2600.c | 27 +++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2500.c b/drivers/ram/aspeed/sdram_ast2500.c
index c8eee32da698..f89dd78487e9 100644
--- a/drivers/ram/aspeed/sdram_ast2500.c
+++ b/drivers/ram/aspeed/sdram_ast2500.c
@@ -409,6 +409,27 @@ static void ast2500_sdrammc_lock(struct dram_info *info)
 		;
 }
 
+static bool ast2500_sdrammc_init_required(struct udevice *dev)
+{
+	struct dram_info *priv = dev_get_priv(dev);
+	struct ast2500_sdrammc_regs *regs = priv->regs;
+	bool ecc_requested;
+	bool ecc_enabled;
+	bool dram_ready;
+
+	ecc_requested = dev_read_bool(dev, "aspeed,ecc-enabled");
+	ecc_enabled = readl(&regs->config) & SDRAM_CONF_ECC_EN;
+	dram_ready  = readl(&priv->scu->vga_handshake[0]) & BIT(6);
+
+	if (!dram_ready)
+		return true;
+
+	if (ecc_requested != ecc_enabled)
+		return true;
+
+	return false;
+}
+
 static int ast2500_sdrammc_probe(struct udevice *dev)
 {
 	struct dram_info *priv = (struct dram_info *)dev_get_priv(dev);
@@ -437,7 +458,7 @@ static int ast2500_sdrammc_probe(struct udevice *dev)
 		return PTR_ERR(priv->scu);
 	}
 
-	if (readl(&priv->scu->vga_handshake[0]) & (0x1 << 6)) {
+	if (!ast2500_sdrammc_init_required(dev)) {
 		ast2500_sdrammc_update_size(priv);
 
 		if (!(readl(&priv->regs->config) & SDRAM_CONF_CACHE_EN)) {
diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 5f7b160faddf..66b5dd1fe6a9 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -891,6 +891,30 @@ static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
 	writel(0, &regs->intr_ctrl);
 }
 
+static bool ast2600_sdrammc_init_required(struct udevice *dev)
+{
+	struct dram_info *priv = dev_get_priv(dev);
+	struct ast2600_sdrammc_regs *regs = priv->regs;
+	bool ecc_requested;
+	bool ecc_enabled;
+	bool dram_ready;
+
+	ecc_requested = dev_read_bool(dev, "aspeed,ecc-enabled");
+	ecc_enabled = readl(&regs->config) & SDRAM_CONF_ECC_SETUP;
+	dram_ready  = readl(priv->scu + AST_SCU_HANDSHAKE) & SCU_SDRAM_INIT_READY_MASK;
+
+	debug("ECC: requested %d enabled %d dram ready %d\n",
+			ecc_requested, ecc_enabled, dram_ready);
+
+	if (!dram_ready)
+		return true;
+
+	if (ecc_requested != ecc_enabled)
+		return true;
+
+	return false;
+}
+
 static int ast2600_sdrammc_probe(struct udevice *dev)
 {
 	struct dram_info *priv = (struct dram_info *)dev_get_priv(dev);
@@ -913,8 +937,7 @@ static int ast2600_sdrammc_probe(struct udevice *dev)
 		return PTR_ERR(priv->scu);
 	}
 
-	reg = readl(priv->scu + AST_SCU_HANDSHAKE);
-	if (reg & SCU_SDRAM_INIT_READY_MASK) {
+	if (!ast2600_sdrammc_init_required(dev)) {
 		printf("already initialized, ");
 		setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
 		ast2600_sdrammc_update_size(priv);
-- 
2.35.1

