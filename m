Return-Path: <openbmc+bounces-707-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAAFBB0252
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:27:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCLB3My2z3cgQ;
	Wed,  1 Oct 2025 21:26:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317986;
	cv=none; b=cRB6vebtYVV6u749RZoUOY9+ZicgCpIG4JBIuAxw5wAbBAQ9vKgNtg67zvQ7hlpMbplfC+bVLF2GUiBqNSknmr3hSmIfaZA3dYTaEkiWDuDXe8CoIzWdRQvDKazSHh7fiThI2jgD8qYlpN/kLCwpfyElnXZCz2LKF6eNzX1yxT0N2RAeyvXX+h3HolcDdf3lbGFKxFAZ3PgDUi98KPkROqQLR4Zt8vpaILb/FWqAAUeVA+rhct0Tw5tRAw8pOpFkUVaGntdKSDRgiy6XTAOOIjZ1ToHsLN7PYWpZ1uErr8FOMS4rg5iweB17qtVIq7ZOtmf3tHWuoajZRgeYUQVHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317986; c=relaxed/relaxed;
	bh=cv/WURnAJN1Nm400cvxWdYTQ6sgENUuM4Ae2CPxVOmE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DQmnXOZ7RSGY2Vx8KYSKV/A4ImosCUn8wU6zYJLKy0gctiz7hJSGL8l7hYZ94+jA+uUnJCyCmYGeOvQlE2UZbZ0ktP94O8cOaS2deeR5XAGmRuZvTevrMeU8RcjwpsWzkzq1NUvq6JpmflD8DH0JmneG+0oSXbkW6qLEDVAibqsBsTcR5A9nfJQJ7EsB0GV0Ex4sy1/Z7z68TkAk83+/PeYcPKY6tFicfy7UqpsXJE9SBeInPFLZW7RDHrGP/Ypiq3fxf5ZptyYvowFppdTUk/9ATrfXdGe1yyevzdkcZhvBHFaHdW2GOEGNBC9NhSe+HxbmaaqH1tL22p+OqxU8SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCL948Khz3cgt;
	Wed,  1 Oct 2025 21:26:25 +1000 (AEST)
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
Subject: [PATCH 3/6] spi: aspeed: Force default address decoding range assignment for each CS
Date: Wed, 1 Oct 2025 19:26:02 +0800
Message-ID: <20251001112605.1130723-4-chin-ting_kuo@aspeedtech.com>
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

On some platforms, we cannot assume that the whole address decoding range
value is ready for each CS. Especially for chip selects other than CS0,
the address decoding range may not be properly configured before the kernel
stage, or the existing configuration may be unsuitable. This can lead to
SPI flash detection failures during driver probe.

To ensure reliable initialization, this patch forcibly assigns a default
address decoding range to each chip select based on a platform-specific
minimum window size. Unused chip selects are explicitly disabled to avoid
conflicts.

This change improves robustness across platforms with varying bootloader
behavior and ensures consistent SPI flash initialization.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 106 ++++++++++++++++++++++-------------
 1 file changed, 67 insertions(+), 39 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index d2d9e13e9bda..29fed8477958 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -78,6 +78,7 @@ struct aspeed_spi_data {
 	u32	timing;
 	u32	hclk_mask;
 	u32	hdiv_max;
+	u32	min_window_size;
 
 	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
@@ -96,6 +97,7 @@ struct aspeed_spi {
 	void __iomem		*ahb_base;
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
+	u32			 num_cs;
 	struct device		*dev;
 
 	struct clk		*clk;
@@ -401,35 +403,6 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 	}
 }
 
-/*
- * On the AST2600, some CE windows are closed by default at reset but
- * U-Boot should open all.
- */
-static int aspeed_spi_chip_set_default_window(struct aspeed_spi_chip *chip)
-{
-	struct aspeed_spi *aspi = chip->aspi;
-	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
-	struct aspeed_spi_window *win = &windows[chip->cs];
-
-	/* No segment registers for the AST2400 SPI controller */
-	if (aspi->data == &ast2400_spi_data) {
-		win->offset = 0;
-		win->size = aspi->ahb_window_size;
-	} else {
-		aspeed_spi_get_windows(aspi, windows);
-	}
-
-	chip->ahb_base = aspi->ahb_base + win->offset;
-	chip->ahb_window_size = win->size;
-
-	dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ] %dMB",
-		chip->cs, aspi->ahb_base_phy + win->offset,
-		aspi->ahb_base_phy + win->offset + win->size - 1,
-		win->size >> 20);
-
-	return chip->ahb_window_size ? 0 : -1;
-}
-
 static int aspeed_spi_set_window(struct aspeed_spi *aspi,
 				 const struct aspeed_spi_window *win)
 {
@@ -464,16 +437,63 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi,
 	return 0;
 }
 
+static const struct aspeed_spi_data ast2500_spi_data;
+static const struct aspeed_spi_data ast2600_spi_data;
+static const struct aspeed_spi_data ast2600_fmc_data;
+
+static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
+{
+	int ret;
+	u32 cs;
+	struct aspeed_spi_window win;
+
+	/* No segment registers for the AST2400 SPI controller */
+	if (aspi->data == &ast2400_spi_data) {
+		aspi->chips[0].ahb_base = aspi->ahb_base;
+		aspi->chips[0].ahb_window_size = aspi->ahb_window_size;
+		return 0;
+	}
+
+	/* Assign the minimum window size to each CS */
+	for (cs = 0; cs < aspi->num_cs; cs++) {
+		if (cs == 0)
+			aspi->chips[cs].ahb_base = aspi->ahb_base;
+		else
+			aspi->chips[cs].ahb_base =
+				aspi->chips[cs - 1].ahb_base +
+				aspi->chips[cs - 1].ahb_window_size;
+
+		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
+
+		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
+			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
+			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
+	}
+
+	/* Close unused CS */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
+		aspi->chips[cs].ahb_base = aspi->ahb_base;
+		aspi->chips[cs].ahb_window_size = 0;
+	}
+
+	for (cs = 0; cs < aspi->num_cs; cs++) {
+		win.cs = cs;
+		win.offset = aspi->chips[cs].ahb_base - aspi->ahb_base;
+		win.size = aspi->chips[cs].ahb_window_size;
+		ret = aspeed_spi_set_window(aspi, &win);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /*
  * Yet to be done when possible :
  * - Align mappings on flash size (we don't have the info)
  * - ioremap each window, not strictly necessary since the overall window
  *   is correct.
  */
-static const struct aspeed_spi_data ast2500_spi_data;
-static const struct aspeed_spi_data ast2600_spi_data;
-static const struct aspeed_spi_data ast2600_fmc_data;
-
 static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
@@ -678,11 +698,6 @@ static int aspeed_spi_setup(struct spi_device *spi)
 	if (data->hastype)
 		aspeed_spi_chip_set_type(aspi, cs, CONFIG_TYPE_SPI);
 
-	if (aspeed_spi_chip_set_default_window(chip) < 0) {
-		dev_warn(aspi->dev, "CE%d window invalid", cs);
-		return -EINVAL;
-	}
-
 	aspeed_spi_chip_enable(aspi, cs, true);
 
 	chip->ctl_val[ASPEED_SPI_BASE] = CTRL_CE_STOP_ACTIVE | CTRL_IO_MODE_USER;
@@ -763,9 +778,17 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	ctlr->mem_ops = &aspeed_spi_mem_ops;
 	ctlr->setup = aspeed_spi_setup;
 	ctlr->cleanup = aspeed_spi_cleanup;
-	ctlr->num_chipselect = data->max_cs;
+	ctlr->num_chipselect = of_get_available_child_count(dev->of_node);
 	ctlr->dev.of_node = dev->of_node;
 
+	aspi->num_cs = ctlr->num_chipselect;
+
+	ret = aspeed_spi_chip_set_default_window(aspi);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to set default window\n");
+		return ret;
+	}
+
 	ret = devm_spi_register_controller(dev, ctlr);
 	if (ret)
 		dev_err(&pdev->dev, "spi_register_controller failed\n");
@@ -1276,6 +1299,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.calibrate     = aspeed_spi_calibrate,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.segment_start = aspeed_spi_segment_start,
@@ -1304,6 +1328,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1319,6 +1344,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
+	.min_window_size = 0x800000,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1335,6 +1361,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
+	.min_window_size = 0x200000,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1351,6 +1378,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
+	.min_window_size = 0x200000,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
-- 
2.34.1


