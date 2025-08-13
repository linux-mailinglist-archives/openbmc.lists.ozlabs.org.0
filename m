Return-Path: <openbmc+bounces-439-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C92B257D7
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBJ0WjYz30VR;
	Thu, 14 Aug 2025 09:51:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.246
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755121609;
	cv=none; b=RkXqGF9kVqBTV2XhcZSbytCLQPxJ5oLjAd9G3hsil+uRmchXohb47NZ0NKkCEy92RV2qmC+StKuioVFjWyu550rLeJ62pGrSXcY0vgV6TJX5Q/0cNAVluwWg8XLIjoSpgiZqsbBlAplbNUXJ/NT5t4rNmHBxI8leUcZ16dqqfyRae7VkktAT4PGX8ahbp/5gO4M+OtbdZcvEBoe4s7L6W+GgRQSbeQbz4EYVPrd6Pg06E/b3kienhSKAdqRUUDKXI450GwZNjA+wRxALvEVdLNHoJda72RHhDpKuZFM5dQ9Np8R/9x85E+pz/PN9nFtvoW3YTaphOlsj6/ta7C/9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755121609; c=relaxed/relaxed;
	bh=Sy3YdWqFJNy5sq/10GkOJns1Ey6MZ1hFJo9OWJ642IY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=moQGbqbATuGXr4SbeDVI8Q5/ojYjGdzskkXm4TQukwzHboI2trTnI+L6iR824m29N+vqTkOdKWib98jgFasAmJHcnN2+pC5P728qQWqzFwaeSw5hdJvBH3idvQKApj6o1Brl0sks1dGb/bwq1xNxWylnNvD6v+EzgHtuMDQ/n3Yr8RPK18FJ4mgOfvPzknqhbbI4ueEfzYiGBMbDh7NLd4HArMr/GfGOiXnHt4TW8mZuKaKIRTs6KTAgnUuhbgZ7LEWlMaAP/7gIrKCOUT4+VT1fv7Lj7E5atQBT6GH1nk2WfG9GIt0fNXc0M0RLfWNs/FX2WSC6Sh2o865timk7Nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=U1HO0dmy; dkim-atps=neutral; spf=pass (client-ip=198.47.19.246; helo=fllvem-ot04.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=U1HO0dmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.246; helo=fllvem-ot04.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2MQc707jz2xK5
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 07:46:48 +1000 (AEST)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLffL42163419;
	Wed, 13 Aug 2025 16:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121301;
	bh=Sy3YdWqFJNy5sq/10GkOJns1Ey6MZ1hFJo9OWJ642IY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U1HO0dmyEYwzxhovy+KOhdLitTxaFYBnevJmW0unu5e72iliHDh44gU+PxiD6AuyQ
	 zBV59VfcqfKo+Df24XE33qB4PXEu2PC4SYUkxoj9ewn8o7kGo9c6M1AYghCp5TKRhC
	 Sdk4i0VY528fg8BKpzMyhc2IBjlP2j6yBrKSNplI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLffcm1253252
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:41 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNI2611079;
	Wed, 13 Aug 2025 16:41:40 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 3/6] reset: lpc18xx: Use devm_register_sys_off_handler()
Date: Wed, 13 Aug 2025 16:41:35 -0500
Message-ID: <20250813214138.477659-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Function register_restart_handler() is deprecated. Using this new API
removes our need to keep and manage a struct notifier_block and to
later unregister the handler.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/reset/reset-lpc18xx.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-lpc18xx.c b/drivers/reset/reset-lpc18xx.c
index e42b2f24a93da..8ac9f237e1ceb 100644
--- a/drivers/reset/reset-lpc18xx.c
+++ b/drivers/reset/reset-lpc18xx.c
@@ -31,7 +31,6 @@
 
 struct lpc18xx_rgu_data {
 	struct reset_controller_dev rcdev;
-	struct notifier_block restart_nb;
 	struct clk *clk_delay;
 	struct clk *clk_reg;
 	void __iomem *base;
@@ -41,11 +40,9 @@ struct lpc18xx_rgu_data {
 
 #define to_rgu_data(p) container_of(p, struct lpc18xx_rgu_data, rcdev)
 
-static int lpc18xx_rgu_restart(struct notifier_block *nb, unsigned long mode,
-			       void *cmd)
+static int lpc18xx_rgu_restart(struct sys_off_data *data)
 {
-	struct lpc18xx_rgu_data *rc = container_of(nb, struct lpc18xx_rgu_data,
-						   restart_nb);
+	struct lpc18xx_rgu_data *rc = data->cb_data;
 
 	writel(BIT(LPC18XX_RGU_CORE_RST), rc->base + LPC18XX_RGU_CTRL0);
 	mdelay(2000);
@@ -178,9 +175,8 @@ static int lpc18xx_rgu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "unable to register device\n");
 
-	rc->restart_nb.priority = 192,
-	rc->restart_nb.notifier_call = lpc18xx_rgu_restart,
-	ret = register_restart_handler(&rc->restart_nb);
+	ret = devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART, 192,
+					    lpc18xx_rgu_restart, rc);
 	if (ret)
 		dev_warn(&pdev->dev, "failed to register restart handler\n");
 
-- 
2.39.2


