Return-Path: <openbmc+bounces-1210-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B261D2527A
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 16:05:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsR9k1bZnz309N;
	Fri, 16 Jan 2026 02:05:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768489514;
	cv=none; b=D21sPotlcy8xxmCjEDssXalEwFlC29Xam2Ar+XdYtsfM1t/18+3XbVVT8Fx5ZNmVO8zVG2MrFPofqSdBy2jGHcW+sHbD06pqC9V3dCC+MHi9Sp6A7Za1j/aAZr5+L3ZuFCxHKgKg1w/Mghs33LRjxeijugqBLku5V1FLy9uooR5dDHYMFH56Pz2GiAweX1bJwe1xKrnnUrFHLTCHQNQiML2xS6EoGCB1eIIqEaOAtusm60X/szgmZNnrhau/lW8v+wIdea856yrXvq6voGo8oLN6W2Iwe84nG5bLJSUoINPrgyfXezHgxJ4Rnk/4PVwlelLBAhlFhxgRMrIWw1ALCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768489514; c=relaxed/relaxed;
	bh=0VWijppNr/zSR+EIsgO4g/b7G4Wg12Gw4zAMj2vjSHU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGCjm0VOlb2V+VPgpJUr7QCV2/R8Cz7zEP7SjWixHoFVJaU1NDT9JQ4dXH15pwoJMLSd1hAcER3SPBmYqqZne1KOnvTuLDVK6BGSMzBul0B5bk/qJAcrLuRxw7YE2PqYK3PLpgH81eySB+0iddjsllSOB80JFgd2nYEDSTL9NV0nZnUJegQ3tK/fYpfIqdKDpsMkyb4W/yp+5w1hQOjQS25+z9mQLjY3Ov7L/BfWEzzWDpVufYGXcRKOnR4sVCn7Jbtij/dWvQsp7FFT0E7C8myy1S9HDVo9Wswe/5AxlUdyvKfIUU3q5mQSoHVELbzFa/05cFjKzH89B4YlZEMypA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsR9j30mYz2xNg;
	Fri, 16 Jan 2026 02:05:13 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 Jan
 2026 23:04:55 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 Jan 2026 23:04:55 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <boris.brezillon@bootlin.com>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
Date: Thu, 15 Jan 2026 23:04:54 +0800
Message-ID: <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
References: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
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

The ASPEED FMC/SPI controller may be shared by spi-mem devices and
other SPI peripherals that do not use the spi-mem framework.

The driver currently assumes spi-mem semantics for all devices,
while the controller also supports direct user mode access commonly
used by non-spi-mem devices. This mismatch can result in incorrect
behavior when different types of devices share the same controller.

Update the driver to properly handle non-spi-mem devices, allowing
them to operate correctly in pure user mode alongside spi-mem
devices on a shared SPI controller.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 121 +++++++++++++++++++++++++++++++++--
 1 file changed, 115 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index db3e096f2eb0..93ad72634e42 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -48,6 +48,8 @@
 /* CEx Address Decoding Range Register */
 #define CE0_SEGMENT_ADDR_REG		0x30
 
+#define FULL_DUPLEX_RX_DATA		0x1e4
+
 /* CEx Read timing compensation register */
 #define CE0_TIMING_COMPENSATION_REG	0x94
 
@@ -81,6 +83,7 @@ struct aspeed_spi_data {
 	u32	hclk_mask;
 	u32	hdiv_max;
 	u32	min_window_size;
+	bool	full_duplex;
 
 	phys_addr_t (*segment_start)(struct aspeed_spi *aspi, u32 reg);
 	phys_addr_t (*segment_end)(struct aspeed_spi *aspi, u32 reg);
@@ -105,6 +108,7 @@ struct aspeed_spi {
 
 	struct clk		*clk;
 	u32			 clk_freq;
+	u8			 cs_change;
 
 	struct aspeed_spi_chip	 chips[ASPEED_SPI_MAX_NUM_CS];
 };
@@ -280,7 +284,8 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
 }
 
 /* support for 1-1-1, 1-1-2 or 1-1-4 */
-static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
+static bool aspeed_spi_supports_mem_op(struct spi_mem *mem,
+				       const struct spi_mem_op *op)
 {
 	if (op->cmd.buswidth > 1)
 		return false;
@@ -305,7 +310,8 @@ static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op
 
 static const struct aspeed_spi_data ast2400_spi_data;
 
-static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+static int do_aspeed_spi_exec_mem_op(struct spi_mem *mem,
+				     const struct spi_mem_op *op)
 {
 	struct aspeed_spi *aspi = spi_controller_get_devdata(mem->spi->controller);
 	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(mem->spi, 0)];
@@ -367,11 +373,12 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *o
 	return ret;
 }
 
-static int aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+static int aspeed_spi_exec_mem_op(struct spi_mem *mem,
+				  const struct spi_mem_op *op)
 {
 	int ret;
 
-	ret = do_aspeed_spi_exec_op(mem, op);
+	ret = do_aspeed_spi_exec_mem_op(mem, op);
 	if (ret)
 		dev_err(&mem->spi->dev, "operation failed: %d\n", ret);
 	return ret;
@@ -773,8 +780,8 @@ static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 }
 
 static const struct spi_controller_mem_ops aspeed_spi_mem_ops = {
-	.supports_op = aspeed_spi_supports_op,
-	.exec_op = aspeed_spi_exec_op,
+	.supports_op = aspeed_spi_supports_mem_op,
+	.exec_op = aspeed_spi_exec_mem_op,
 	.get_name = aspeed_spi_get_name,
 	.dirmap_create = aspeed_spi_dirmap_create,
 	.dirmap_read = aspeed_spi_dirmap_read,
@@ -843,6 +850,99 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
 		aspeed_spi_chip_enable(aspi, cs, enable);
 }
 
+static void aspeed_spi_user_transfer_tx(struct aspeed_spi *aspi,
+					struct spi_device *spidev,
+					const u8 *tx_buf, u8 *rx_buf,
+					void *dst, u32 len)
+{
+	const struct aspeed_spi_data *data = aspi->data;
+	bool full_duplex_transfer = data->full_duplex && tx_buf == rx_buf;
+	u32 i;
+
+	if (full_duplex_transfer &&
+	    !!(spidev->mode & (SPI_TX_DUAL | SPI_TX_QUAD |
+			       SPI_RX_DUAL | SPI_RX_QUAD))) {
+		dev_err(aspi->dev,
+			"full duplex is only supported for single IO mode\n");
+		return;
+	}
+
+	for (i = 0; i < len; i++) {
+		writeb(tx_buf[i], dst);
+		if (full_duplex_transfer)
+			rx_buf[i] = readb(aspi->regs + FULL_DUPLEX_RX_DATA);
+	}
+}
+
+static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
+				    struct spi_message *msg)
+{
+	struct aspeed_spi *aspi =
+		(struct aspeed_spi *)spi_controller_get_devdata(ctlr);
+	const struct aspeed_spi_data *data = aspi->data;
+	struct spi_device *spidev = msg->spi;
+	u32 cs = spi_get_chipselect(spidev, 0);
+	struct aspeed_spi_chip *chip = &aspi->chips[cs];
+	void __iomem *ahb_base = aspi->chips[cs].ahb_base;
+	u32 ctrl_val;
+	u32 clk_div = data->get_clk_div(chip, spidev->max_speed_hz);
+	struct spi_transfer *xfer;
+	const u8 *tx_buf;
+	u8 *rx_buf;
+	u32 i = 0;
+
+	ctrl_val = chip->ctl_val[ASPEED_SPI_BASE];
+	ctrl_val &= ~CTRL_IO_MODE_MASK & data->hclk_mask;
+	ctrl_val |= clk_div;
+	chip->ctl_val[ASPEED_SPI_BASE] = ctrl_val;
+
+	if (aspi->cs_change == 0)
+		aspeed_spi_start_user(chip);
+
+	dev_dbg(aspi->dev, "cs: %d\n", cs);
+	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
+		dev_dbg(aspi->dev,
+			"xfer[%d]: width %d, len %u, tx %p, rx %p\n",
+			i,
+			xfer->bits_per_word, xfer->len,
+			xfer->tx_buf, xfer->rx_buf);
+
+		tx_buf = xfer->tx_buf;
+		rx_buf = xfer->rx_buf;
+
+		if (tx_buf) {
+			if (spidev->mode & SPI_TX_DUAL)
+				aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
+			else if (spidev->mode & SPI_TX_QUAD)
+				aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
+
+			aspeed_spi_user_transfer_tx(aspi, spidev, tx_buf, rx_buf,
+						    (void *)ahb_base, xfer->len);
+		}
+
+		if (rx_buf && rx_buf != tx_buf) {
+			if (spidev->mode & SPI_RX_DUAL)
+				aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
+			else if (spidev->mode & SPI_RX_QUAD)
+				aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
+
+			ioread8_rep(ahb_base, rx_buf, xfer->len);
+		}
+
+		msg->actual_length += xfer->len;
+		aspi->cs_change = xfer->cs_change;
+		i++;
+	}
+
+	if (aspi->cs_change == 0)
+		aspeed_spi_stop_user(chip);
+
+	msg->status = 0;
+	spi_finalize_current_message(ctlr);
+
+	return 0;
+}
+
 static int aspeed_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -899,6 +999,7 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	ctlr->cleanup = aspeed_spi_cleanup;
 	ctlr->num_chipselect = of_get_available_child_count(dev->of_node);
 	ctlr->dev.of_node = dev->of_node;
+	ctlr->transfer_one_message = aspeed_spi_user_transfer;
 
 	aspi->num_cs = ctlr->num_chipselect;
 
@@ -1455,6 +1556,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.calibrate     = aspeed_spi_calibrate,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.segment_start = aspeed_spi_segment_start,
@@ -1471,6 +1573,7 @@ static const struct aspeed_spi_data ast2400_spi_data = {
 	.timing	       = 0x14,
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.calibrate     = aspeed_spi_calibrate,
 	/* No segment registers */
@@ -1485,6 +1588,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1502,6 +1606,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1520,6 +1625,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x200000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1538,6 +1644,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x200000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1556,6 +1663,7 @@ static const struct aspeed_spi_data ast2700_fmc_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x10000,
+	.full_duplex   = true,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2700_start,
@@ -1573,6 +1681,7 @@ static const struct aspeed_spi_data ast2700_spi_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x10000,
+	.full_duplex   = true,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2700_start,
-- 
2.34.1


