Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039AA587CF6
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 15:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxwZv60Zvz305Z
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 23:20:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxwXp2Bx2z2ywN
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 23:18:15 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 272DI4ia021466
	for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2022 16:18:04 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Aug
 2022 16:18:04 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 2 Aug 2022
 21:18:02 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 2 Aug 2022 21:18:01 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 3694663A22; Tue,  2 Aug 2022 16:18:00 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 5/5] char: hwrng: npcm: Add NPCM8XX support
Date: Tue, 2 Aug 2022 16:17:57 +0300
Message-ID: <20220802131757.234026-6-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220802131757.234026-1-tmaimon77@gmail.com>
References: <20220802131757.234026-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding RNG NPCM8XX support to the NPCM RNG driver.
RNG NPCM8XX uses a different clock prescaler.

As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Set clock prescaler according to the NPCM BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/npcm-rng.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 1ec5f267a656..3c7b632536fc 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -19,6 +19,7 @@
 #define NPCM_RNGMODE_REG	0x08	/* Mode register */
 
 #define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
+#define NPCM_RNG_CLK_SET_62_5MHZ	BIT(2) /* 60-80 MHz */
 #define NPCM_RNG_DATA_VALID	BIT(1)
 #define NPCM_RNG_ENABLE		BIT(0)
 #define NPCM_RNG_M1ROSEL	BIT(1)
@@ -31,14 +32,14 @@
 struct npcm_rng {
 	void __iomem *base;
 	struct hwrng rng;
+	u32 clkp;
 };
 
 static int npcm_rng_init(struct hwrng *rng)
 {
 	struct npcm_rng *priv = to_npcm_rng(rng);
 
-	writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
-	       priv->base + NPCM_RNGCS_REG);
+	writel(priv->clkp | NPCM_RNG_ENABLE, priv->base + NPCM_RNGCS_REG);
 
 	return 0;
 }
@@ -47,7 +48,7 @@ static void npcm_rng_cleanup(struct hwrng *rng)
 {
 	struct npcm_rng *priv = to_npcm_rng(rng);
 
-	writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
+	writel(priv->clkp, priv->base + NPCM_RNGCS_REG);
 }
 
 static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -102,6 +103,11 @@ static int npcm_rng_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "nuvoton,npcm750-rng"))
+		priv->clkp = NPCM_RNG_CLK_SET_25MHZ;
+	if (of_device_is_compatible(pdev->dev.of_node, "nuvoton,npcm845-rng"))
+		priv->clkp = NPCM_RNG_CLK_SET_62_5MHZ;
+
 #ifndef CONFIG_PM
 	priv->rng.init = npcm_rng_init;
 	priv->rng.cleanup = npcm_rng_cleanup;
@@ -163,6 +169,7 @@ static const struct dev_pm_ops npcm_rng_pm_ops = {
 
 static const struct of_device_id rng_dt_id[] __maybe_unused = {
 	{ .compatible = "nuvoton,npcm750-rng",  },
+	{ .compatible = "nuvoton,npcm845-rng",  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rng_dt_id);
-- 
2.33.0

