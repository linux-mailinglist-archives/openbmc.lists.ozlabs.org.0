Return-Path: <openbmc+bounces-897-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221DC5C7A9
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 11:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7CZv3QkBz308j;
	Fri, 14 Nov 2025 21:11:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763115063;
	cv=none; b=EbYgDRNq+pFoYiWmlQwMLlV2TSX5SRCbLlZrgrogGK+JD3gsdnxFQxL6sAC2QzBSNWWcehDd8fp2cMTFswGlYQweHsExpJ9Ul9Zi8PFwu8vNPzlvbF85lfGXLr9zm8NnR7N8kHAxtM0ASXOZ/5tLui8m5wAUfte57c/Aq/MqpKLGtDhFM+IIUTiPEZDgpqvIL82vRc3KJQl/pfAwmUb84nUl//rWBKiW2KGAIGa3G248bl85B2Xqgy4Dk3VlqCkGYYwLFfcfj9lXUMZ362GU5Q9iEGVO6s+e1OKfP1K5aM6HOyeDXURN7dr1ke0X3vo923m+fLurWXtlCT7CHNg/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763115063; c=relaxed/relaxed;
	bh=PyikLWglI9X7tpxVtau6yVc+6UcVwQ7rv4E6hjD4g8o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lh6HMtUe/sbB7v1WLrP/hR4/VX5Vwofe6msfKABHKMlQPJzNLdPERUcO2lO1xpdK+noRV9bJeUTqJyl7SgggUPjqvXFsd/FN/2an49EPHFh1BZN3Aky6D5GFtexIdn0TEKw6Iy8+A+ph8jK8+wyWXFJwdkQMlDk79u7/HgLOqTrOhmCcX0ZZWCaReAEqoAtk+Dt4FqQc4E3RyBP017WYUfG4bbCr/N7lEiuIDJjgOaeTgX37DHjusgkIHD9d8DZsFkAv13QFRFl96lYJ6DEydr5HpR4KDAGjdrp/J8b9+xQE04X3DU9H7lddpTMISWAe5ztcxhA/MRVEXiopWp6MQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7CZt501Tz308Q;
	Fri, 14 Nov 2025 21:11:02 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:43 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:43 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 4/4] spi: aspeed: Add support for the AST2700 SPI controller
Date: Fri, 14 Nov 2025 18:10:42 +0800
Message-ID: <20251114101042.1520997-5-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
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

Extend the driver to support the AST2700 SPI controller. Compared to
AST2600, AST2700 has the following characteristics:
 - A 64-bit memory address space.
 - A 64KB address decoding unit.
 - Segment registers now use (start <= range < end) semantics,
   which differs slightly from (start <= range <= end) in AST2600.
 - Known issues related to address decoding range registers have been
   resolved, and the decoding range is now 1GB, which is sufficient.
   Therefore, the adjust_window callback is no longer required on AST2700
   for range adjustment and bug fixes.
 - The SPI clock divider method and timing calibration logic remain
   unchanged from AST2600.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index d1a8bdf6d540..db3e096f2eb0 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -985,6 +985,41 @@ static u32 aspeed_spi_segment_ast2600_reg(struct aspeed_spi *aspi,
 		((end - 1) & AST2600_SEG_ADDR_MASK);
 }
 
+/* The Segment Registers of the AST2700 use a 64KB unit. */
+#define AST2700_SEG_ADDR_MASK 0x7fff0000
+
+static phys_addr_t aspeed_spi_segment_ast2700_start(struct aspeed_spi *aspi,
+						    u32 reg)
+{
+	u64 start_offset = (reg << 16) & AST2700_SEG_ADDR_MASK;
+
+	if (!start_offset)
+		return aspi->ahb_base_phy;
+
+	return aspi->ahb_base_phy + start_offset;
+}
+
+static phys_addr_t aspeed_spi_segment_ast2700_end(struct aspeed_spi *aspi,
+						  u32 reg)
+{
+	u64 end_offset = reg & AST2700_SEG_ADDR_MASK;
+
+	if (!end_offset)
+		return aspi->ahb_base_phy;
+
+	return aspi->ahb_base_phy + end_offset;
+}
+
+static u32 aspeed_spi_segment_ast2700_reg(struct aspeed_spi *aspi,
+					  phys_addr_t start, phys_addr_t end)
+{
+	if (start == end)
+		return 0;
+
+	return (u32)(((start & AST2700_SEG_ADDR_MASK) >> 16) |
+		     (end & AST2700_SEG_ADDR_MASK));
+}
+
 /*
  * Read timing compensation sequences
  */
@@ -1511,6 +1546,40 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
+static const struct aspeed_spi_data ast2700_fmc_data = {
+	.max_cs	       = 3,
+	.hastype       = false,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
+	.we0	       = 16,
+	.ctl0	       = CE0_CTRL_REG,
+	.timing	       = CE0_TIMING_COMPENSATION_REG,
+	.hclk_mask     = 0xf0fff0ff,
+	.hdiv_max      = 2,
+	.min_window_size = 0x10000,
+	.get_clk_div   = aspeed_get_clk_div_ast2600,
+	.calibrate     = aspeed_spi_ast2600_calibrate,
+	.segment_start = aspeed_spi_segment_ast2700_start,
+	.segment_end   = aspeed_spi_segment_ast2700_end,
+	.segment_reg   = aspeed_spi_segment_ast2700_reg,
+};
+
+static const struct aspeed_spi_data ast2700_spi_data = {
+	.max_cs	       = 2,
+	.hastype       = false,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
+	.we0	       = 16,
+	.ctl0	       = CE0_CTRL_REG,
+	.timing	       = CE0_TIMING_COMPENSATION_REG,
+	.hclk_mask     = 0xf0fff0ff,
+	.hdiv_max      = 2,
+	.min_window_size = 0x10000,
+	.get_clk_div   = aspeed_get_clk_div_ast2600,
+	.calibrate     = aspeed_spi_ast2600_calibrate,
+	.segment_start = aspeed_spi_segment_ast2700_start,
+	.segment_end   = aspeed_spi_segment_ast2700_end,
+	.segment_reg   = aspeed_spi_segment_ast2700_reg,
+};
+
 static const struct of_device_id aspeed_spi_matches[] = {
 	{ .compatible = "aspeed,ast2400-fmc", .data = &ast2400_fmc_data },
 	{ .compatible = "aspeed,ast2400-spi", .data = &ast2400_spi_data },
@@ -1518,6 +1587,8 @@ static const struct of_device_id aspeed_spi_matches[] = {
 	{ .compatible = "aspeed,ast2500-spi", .data = &ast2500_spi_data },
 	{ .compatible = "aspeed,ast2600-fmc", .data = &ast2600_fmc_data },
 	{ .compatible = "aspeed,ast2600-spi", .data = &ast2600_spi_data },
+	{ .compatible = "aspeed,ast2700-fmc", .data = &ast2700_fmc_data },
+	{ .compatible = "aspeed,ast2700-spi", .data = &ast2700_spi_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_spi_matches);
-- 
2.34.1


