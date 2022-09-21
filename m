Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47ED5BF5FC
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 07:54:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXSK62CXLz3bxp
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 15:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hhb3dj/Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hhb3dj/Q;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXSJg6v5Zz3bXZ
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 15:53:38 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso4676709pjm.5
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 22:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=Jb7OILrssOGw0ETatT8wezXVLBvEHqeF2bIXSMiubWQ=;
        b=Hhb3dj/QeuveQFaUD+BxwBwJtqVsVqIPN8aU4JNjA6D679v0yM7ZEM79MMAbO0B0mP
         7R3JlWLM+73ooAgwtN/RGP50ZvHTjlnhFWVrX06NiuWnbvvKUT10yJlaBnbBRjzk3lre
         EsySuQRCGUSKg/oinqP2TmKcWa82JS7NjazXu1jI08YpB2kT1FN/RsNSIgJOsvh77ajS
         jwm+sQvjgkSUDHtj0kqv1xAuj29sUNsrLsVs/bWXF1UIVWw61hjavk8BMGxn3pEfM6Ti
         eWr49IkBMWehXp9kmxAkuqPLoqS5S1UVYrN3Q1D3OwcIcICtnBuk7BZE3vA62Egu9RSd
         Vqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=Jb7OILrssOGw0ETatT8wezXVLBvEHqeF2bIXSMiubWQ=;
        b=InEmWecyAz3ElQrzZtr0i2cyb/+JWvsH8dD/kifaeQdHLXpWQR+FLmjTQRftgFEfVn
         n+mW2zXJTjxQtxgFMJ+Q7Fz1L2BtZEklFoVL9/3+uo60NOwgZQmO5G2mk25kRL5AxB8r
         2wKYw523uQMYMx9Z3hX6D15dH9UzImzsDi2K6XlK+1CLCnRxc+3DThLsQDUuGQJMbetn
         EP89hsGd7JUZfnDnivzSEMiXaccrH+6aBX4rVgiIomqJTjfBug7boVlFFE1zeY8MYF4x
         oLZWaJs1YQO7XmIUZGtIw2y11ewKdvfV/H1ovJIyaObEHbsbJ8yK9gYTnoVbBphdaGZB
         vIRQ==
X-Gm-Message-State: ACrzQf0RZgplxki4/lPtTucBEHHqJFItQHBKOyUi/t+C5sn48diuhj4P
	Du0bS7TLMTSGkFE+VAyZDvI2RvoYoFA=
X-Google-Smtp-Source: AMsMyM7yPhu0nl5OoFfGcfZKdXFJZuUer7m1g075AwISto2Itlfgs7IysfWdWDZl/sQ2tCAAm1l71Q==
X-Received: by 2002:a17:902:e54b:b0:178:75b9:f1e9 with SMTP id n11-20020a170902e54b00b0017875b9f1e9mr3152530plf.104.1663739615472;
        Tue, 20 Sep 2022 22:53:35 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902e88500b00172f4835f60sm948479plg.189.2022.09.20.22.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 22:53:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ram/aspeed: Re-init ECC if requested but not enabled
Date: Wed, 21 Sep 2022 15:23:18 +0930
Message-Id: <20220921055318.2136384-1-joel@jms.id.au>
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
This is untested on hardware, but attempts to solve a problem when
upgrading firmware to enable ECC.

Aspeed, is it okay to re-init DRAM like this?

 drivers/ram/aspeed/sdram_ast2600.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/ram/aspeed/sdram_ast2600.c b/drivers/ram/aspeed/sdram_ast2600.c
index 5f7b160faddf..d5a9875e4fde 100644
--- a/drivers/ram/aspeed/sdram_ast2600.c
+++ b/drivers/ram/aspeed/sdram_ast2600.c
@@ -891,6 +891,27 @@ static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32 conf_size_mb)
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
@@ -913,8 +934,7 @@ static int ast2600_sdrammc_probe(struct udevice *dev)
 		return PTR_ERR(priv->scu);
 	}
 
-	reg = readl(priv->scu + AST_SCU_HANDSHAKE);
-	if (reg & SCU_SDRAM_INIT_READY_MASK) {
+	if (ast2600_sdrammc_init_required(dev)) {
 		printf("already initialized, ");
 		setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
 		ast2600_sdrammc_update_size(priv);
-- 
2.35.1

