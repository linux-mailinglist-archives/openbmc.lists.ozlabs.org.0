Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDA5E650F
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 16:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYHZJ5Jsxz3c61
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 00:23:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYHYW4CpRz2yZf
	for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2022 00:22:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 28MEMNhJ010620
	for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2022 17:22:23 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 22 Sep
 2022 17:22:23 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Thu, 22 Sep
 2022 22:22:21 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 22 Sep 2022 22:22:21 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 8489E637C4; Thu, 22 Sep 2022 17:22:20 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <olivia@selenic.com>, <herbert@gondor.apana.org.au>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 2/2] hwrng: npcm: Add NPCM8XX support
Date: Thu, 22 Sep 2022 17:22:16 +0300
Message-ID: <20220922142216.17581-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220922142216.17581-1-tmaimon77@gmail.com>
References: <20220922142216.17581-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding RNG NPCM8XX support to NPCM RNG driver.
RNG NPCM8XX uses a different clock prescaler.

As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Add NPCM8XX specific clock prescaler.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/npcm-rng.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 1ec5f267a656..705be9ccae31 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -18,10 +18,11 @@
 #define NPCM_RNGD_REG		0x04	/* Data register */
 #define NPCM_RNGMODE_REG	0x08	/* Mode register */
 
-#define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
-#define NPCM_RNG_DATA_VALID	BIT(1)
-#define NPCM_RNG_ENABLE		BIT(0)
-#define NPCM_RNG_M1ROSEL	BIT(1)
+#define NPCM_RNG_CLK_SET_25MHZ		GENMASK(4, 3) /* 20-25 MHz */
+#define NPCM_RNG_CLK_SET_62_5MHZ	BIT(2) /* 60-80 MHz */
+#define NPCM_RNG_DATA_VALID		BIT(1)
+#define NPCM_RNG_ENABLE			BIT(0)
+#define NPCM_RNG_M1ROSEL		BIT(1)
 
 #define NPCM_RNG_TIMEOUT_USEC	20000
 #define NPCM_RNG_POLL_USEC	1000
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

