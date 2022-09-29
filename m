Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130265EF6A7
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 15:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZ6l6Yq7z3c2q
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 23:32:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZ5W3tjbz3046
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 23:31:39 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 28TDVTnG029498
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 16:31:29 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 29 Sep
 2022 16:31:29 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Thu, 29 Sep
 2022 21:31:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Sep 2022 21:31:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 0DAF163A20; Thu, 29 Sep 2022 16:31:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <olivia@selenic.com>, <herbert@gondor.apana.org.au>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/2] hwrng: npcm: Add NPCM8XX support
Date: Thu, 29 Sep 2022 16:31:11 +0300
Message-ID: <20220929133111.73897-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220929133111.73897-1-tmaimon77@gmail.com>
References: <20220929133111.73897-1-tmaimon77@gmail.com>
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
- Add data to handle architecture specific clock prescaler.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/npcm-rng.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 1ec5f267a656..5bf7f370f985 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -13,11 +13,13 @@
 #include <linux/delay.h>
 #include <linux/of_irq.h>
 #include <linux/pm_runtime.h>
+#include <linux/of_device.h>
 
 #define NPCM_RNGCS_REG		0x00	/* Control and status register */
 #define NPCM_RNGD_REG		0x04	/* Data register */
 #define NPCM_RNGMODE_REG	0x08	/* Mode register */
 
+#define NPCM_RNG_CLK_SET_62_5MHZ	BIT(2) /* 60-80 MHz */
 #define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
 #define NPCM_RNG_DATA_VALID	BIT(1)
 #define NPCM_RNG_ENABLE		BIT(0)
@@ -31,14 +33,14 @@
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
@@ -47,7 +49,7 @@ static void npcm_rng_cleanup(struct hwrng *rng)
 {
 	struct npcm_rng *priv = to_npcm_rng(rng);
 
-	writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
+	writel(priv->clkp, priv->base + NPCM_RNGCS_REG);
 }
 
 static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -110,6 +112,7 @@ static int npcm_rng_probe(struct platform_device *pdev)
 	priv->rng.read = npcm_rng_read;
 	priv->rng.priv = (unsigned long)&pdev->dev;
 	priv->rng.quality = 1000;
+	priv->clkp = (u32)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
 
@@ -162,7 +165,10 @@ static const struct dev_pm_ops npcm_rng_pm_ops = {
 };
 
 static const struct of_device_id rng_dt_id[] __maybe_unused = {
-	{ .compatible = "nuvoton,npcm750-rng",  },
+	{ .compatible = "nuvoton,npcm750-rng",
+		.data = (void *)NPCM_RNG_CLK_SET_25MHZ },
+	{ .compatible = "nuvoton,npcm845-rng",
+		.data = (void *)NPCM_RNG_CLK_SET_62_5MHZ },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rng_dt_id);
-- 
2.33.0

