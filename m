Return-Path: <openbmc+bounces-710-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D24BB0282
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCLD5cZ9z3cjX;
	Wed,  1 Oct 2025 21:26:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317988;
	cv=none; b=TwCFtjy5dV8SP/lK+Re9krSQrint5ON3rFCFfq2N20MHUcd8Maj+0RwTos33NPlKRCwnE7gYDfYZrc7fNntHC5qgeuyqfLPuXQYZHKV88v71IEMq7o7FC1MgTarH6cmJ7ynvIrb6GhrGtjrnzldo4c2h5HWNQpS67nMwttk1MnJrvbiodMBiKdZgtQu5/fnVJ8/5KLv5d1bvbX5NdzCXiixwN5l9YiulnjHkKSOPtrXxwMx3XF0ktvCQP+ElCmcFVsb04F7v/GhSozeJqBWZaieMNL5WeQFhEyTUVgnc6bHX7I8/bn1wTWvkwkLW9D9/a6nG43EBiHhVl375US0ayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317988; c=relaxed/relaxed;
	bh=W2CBn8iy9Ks/WyNgBKbgxVeaugrKtVcmImy4dqYBWyk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XlD217lU7wUP6JWlWPZcKSkuV7hL1VoVYk0ZX8J92cO8wd2HevSqjnWqfdSm9lItsIveCEV6jJvSPZ4vQh8srGRwhS7iywhcVip7bLi1ApzBRnMkerHmaZ0YeV92t93iz3LKuxTmaFVPglyBuE6TeuujnUTOuLpn2oVv+KruE5ABP2YRbOS6Nf3qzCT5g/XZ//+TwFY2MkdFBV65bzIsWA3eqiLc8ST3rOZUib/WX8RavzzU98fUYyfIzz1k1dTXZ7moaUj0REQTHO1cTQdHP9oh5UGMxt/D8rtVTEr1l7w8O0jXveGVopAsQSPRehKi33p5cDU/PzPnpVbHwxomwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCLD1YxLz3cjG;
	Wed,  1 Oct 2025 21:26:28 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Oct
 2025 19:26:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Oct 2025 19:26:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 6/6] spi: aspeed: Only map necessary address window region
Date: Wed, 1 Oct 2025 19:26:05 +0800
Message-ID: <20251001112605.1130723-7-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
References: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
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
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Previously, the driver mapped the entire SPI address decoding region during
probe. On systems with small flash or limited memory, this could lead to
excessive memory usage or allocation failures.

This patch changes the strategy to initially map a small address window
for SPI flash device probing. After determining each chip select's flash
size, the driver unmaps the temporary region and remaps only the required
address window accordingly.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 39 +++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 4f6ae48dd904..0c3de371fd39 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -96,7 +97,6 @@ struct aspeed_spi {
 	const struct aspeed_spi_data	*data;
 
 	void __iomem		*regs;
-	void __iomem		*ahb_base;
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
 	u32			 num_cs;
@@ -394,6 +394,13 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 	u32 cs;
 	size_t window_size;
 
+	for (cs = 0; cs < aspi->data->max_cs; cs++) {
+		if (aspi->chips[cs].ahb_base) {
+			iounmap(aspi->chips[cs].ahb_base);
+			aspi->chips[cs].ahb_base = NULL;
+		}
+	}
+
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		seg_reg = seg_reg_base + cs * 4;
 		seg_val_backup = readl(seg_reg);
@@ -425,13 +432,29 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 		else
 			dev_dbg(dev, "CE%d window closed\n", cs);
 
-		aspi->chips[cs].ahb_base = aspi->ahb_base + offset;
 		offset += window_size;
 		if (offset > aspi->ahb_window_size) {
 			dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
 				cs, (u64)offset);
 			return -ENOSPC;
 		}
+
+		/*
+		 * No need to map the address deocding range when
+		 * - window size is 0.
+		 * - the CS is unused.
+		 */
+		if (window_size == 0 || cs >= aspi->num_cs)
+			continue;
+
+		aspi->chips[cs].ahb_base =
+			devm_ioremap(aspi->dev, start, window_size);
+		if (!aspi->chips[cs].ahb_base) {
+			dev_err(aspi->dev,
+				"Fail to remap window [0x%.9llx - 0x%.9llx]\n",
+				(u64)start, (u64)end - 1);
+			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -447,7 +470,9 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data) {
-		aspi->chips[0].ahb_base = aspi->ahb_base;
+		aspi->chips[0].ahb_base = devm_ioremap(aspi->dev,
+						       aspi->ahb_base_phy,
+						       aspi->ahb_window_size);
 		aspi->chips[0].ahb_window_size = aspi->ahb_window_size;
 		return 0;
 	}
@@ -839,10 +864,10 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	if (IS_ERR(aspi->regs))
 		return PTR_ERR(aspi->regs);
 
-	aspi->ahb_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
-	if (IS_ERR(aspi->ahb_base)) {
-		dev_err(dev, "missing AHB mapping window\n");
-		return PTR_ERR(aspi->ahb_base);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (IS_ERR(res)) {
+		dev_err(dev, "missing AHB memory\n");
+		return PTR_ERR(res);
 	}
 
 	aspi->ahb_window_size = resource_size(res);
-- 
2.34.1


