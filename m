Return-Path: <openbmc+bounces-1256-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOfgKBOhb2kLCAAAu9opvQ
	(envelope-from <openbmc+bounces-1256-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDAD4637C
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRVl1GqXz3c1J;
	Tue, 20 Jan 2026 23:30:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768912223;
	cv=none; b=a7CRhAi1R2FRTNzC4ZjGU7e+PbybF2sKhoAtniA5gNK87+qbBDfEWLeoHx0Br5gBOwlIsUuatTLGO1hoeZVT313f7wlDxXvrOaqc+VuiHeYOujct0UDHh1amOr3ZISjUI1YlrQyKOgDSAyBC1ppI7RsBMjfWYqQb3r5waryaYnsXmJCoyW0M8aWPHtelWvF7qKKNlra1aQnRxS2CQXPQOxka4YnqRZ1nX26n5v0r+7IvlBkaJz6rcKuWo0VVaaED0DsJN7BxT80xrDcfdiJsyFcrljnu9cQcAdFN/fNa6e9t4TjiB58KfGQXyu7ubDEsjjfKCJavPEScAQT86mb5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768912223; c=relaxed/relaxed;
	bh=x4U/KqrlkovWrEFeaTiGkh/Luq0q6dmHQVuEhJlPhds=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CS9NJkQ4st6Wf3xzsUZL3yC8LoaSFgybLdr8miPEJQ5NzJp4z+JuUARzqc/h50R3gDMdImecQcdO1KuQ4eMS9nroSvVxO3AzyXdB+/O0iW2DRB+WBXMfk1PPQeJsnCbO8dUJEEPxIBciX3Z4ztWMdjXCaaKSoiKovGIwc1K9QMycA8J05mr1/32PuoJga9MdA0KN6VZ9PkwXFB94UWeQIbE0vi2bXzdg5BXieL/l4fI0EvmMuG7UX4Yk73qUmQ5FDCS9Z/ugqYAWDgg0vyBciWfhyFTgaAnu1wW4KYlsv83exktubTYNhyIJAK6AzaWa63Z0L1N76appWwjl882R3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRVk3W8pz3bt7;
	Tue, 20 Jan 2026 23:30:22 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 20:30:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 20:30:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <boris.brezillon@bootlin.com>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
	<pmenzel@molgen.mpg.de>
Subject: [PATCH v3 2/2] spi: aspeed: Add support for non-spi-mem devices
Date: Tue, 20 Jan 2026 20:30:05 +0800
Message-ID: <20260120123005.1392071-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
References: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
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
X-Spamd-Result: default: False [1.50 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chin-ting_kuo@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1256-lists,openbmc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0BDAD4637C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The ASPEED FMC/SPI controller may be shared by spi-mem devices and
other SPI peripherals that do not use the spi-mem framework.

The driver currently assumes spi-mem semantics for all devices,
while the controller also supports direct user mode access commonly
used by non-spi-mem devices. This mismatch can result in incorrect
behavior when different types of devices share the same controller.

Therefore, a user mode based path for non-spi-mem devices is added
by implementing the transfer_one() callback and wiring up
prepare_message() and unprepare_message() so controller state is
initialized and restored for user mode transfers. This allows
non-spi-mem devices to operate correctly alongside spi-mem devices
on a shared controller.

This patch has been tested on:
- AST2700 EVB + Infineon and ST SPI TPM device.
- AST2x00 EVB + spidev_test utility and the output waveforms are
  verified with logic analyzer.
- AST2x00 EVB + SPI NOR flash read/write regression.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 134 +++++++++++++++++++++++++++++++++--
 1 file changed, 128 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index db3e096f2eb0..3949f94b6667 100644
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
@@ -843,6 +850,110 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
 		aspeed_spi_chip_enable(aspi, cs, enable);
 }
 
+static int aspeed_spi_user_prepare_msg(struct spi_controller *ctlr,
+				       struct spi_message *msg)
+{
+	struct aspeed_spi *aspi =
+		(struct aspeed_spi *)spi_controller_get_devdata(ctlr);
+	const struct aspeed_spi_data *data = aspi->data;
+	struct spi_device *spi = msg->spi;
+	u32 cs = spi_get_chipselect(spi, 0);
+	struct aspeed_spi_chip *chip = &aspi->chips[cs];
+	u32 ctrl_val;
+	u32 clk_div = data->get_clk_div(chip, spi->max_speed_hz);
+
+	ctrl_val = chip->ctl_val[ASPEED_SPI_BASE];
+	ctrl_val &= ~CTRL_IO_MODE_MASK & data->hclk_mask;
+	ctrl_val |= clk_div;
+	chip->ctl_val[ASPEED_SPI_BASE] = ctrl_val;
+
+	if (aspi->cs_change == 0)
+		aspeed_spi_start_user(chip);
+
+	return 0;
+}
+
+static int aspeed_spi_user_unprepare_msg(struct spi_controller *ctlr,
+					 struct spi_message *msg)
+{
+	struct aspeed_spi *aspi =
+		(struct aspeed_spi *)spi_controller_get_devdata(ctlr);
+	struct spi_device *spi = msg->spi;
+	u32 cs = spi_get_chipselect(spi, 0);
+	struct aspeed_spi_chip *chip = &aspi->chips[cs];
+
+	if (aspi->cs_change == 0)
+		aspeed_spi_stop_user(chip);
+
+	return 0;
+}
+
+static void aspeed_spi_user_transfer_tx(struct aspeed_spi *aspi,
+					struct spi_device *spi,
+					const u8 *tx_buf, u8 *rx_buf,
+					void *dst, u32 len)
+{
+	const struct aspeed_spi_data *data = aspi->data;
+	bool full_duplex_transfer = data->full_duplex && tx_buf == rx_buf;
+	u32 i;
+
+	if (full_duplex_transfer &&
+	    !!(spi->mode & (SPI_TX_DUAL | SPI_TX_QUAD |
+			    SPI_RX_DUAL | SPI_RX_QUAD))) {
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
+				    struct spi_device *spi,
+				    struct spi_transfer *xfer)
+{
+	struct aspeed_spi *aspi =
+		(struct aspeed_spi *)spi_controller_get_devdata(ctlr);
+	u32 cs = spi_get_chipselect(spi, 0);
+	struct aspeed_spi_chip *chip = &aspi->chips[cs];
+	void __iomem *ahb_base = aspi->chips[cs].ahb_base;
+	const u8 *tx_buf = xfer->tx_buf;
+	u8 *rx_buf = xfer->rx_buf;
+
+	dev_dbg(aspi->dev,
+		"[cs%d] xfer: width %d, len %u, tx %p, rx %p\n",
+		cs, xfer->bits_per_word, xfer->len,
+		tx_buf, rx_buf);
+
+	if (tx_buf) {
+		if (spi->mode & SPI_TX_DUAL)
+			aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
+		else if (spi->mode & SPI_TX_QUAD)
+			aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
+
+		aspeed_spi_user_transfer_tx(aspi, spi, tx_buf, rx_buf,
+					    (void *)ahb_base, xfer->len);
+	}
+
+	if (rx_buf && rx_buf != tx_buf) {
+		if (spi->mode & SPI_RX_DUAL)
+			aspeed_spi_set_io_mode(chip, CTRL_IO_DUAL_DATA);
+		else if (spi->mode & SPI_RX_QUAD)
+			aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
+
+		ioread8_rep(ahb_base, rx_buf, xfer->len);
+	}
+
+	xfer->error = 0;
+	aspi->cs_change = xfer->cs_change;
+
+	return 0;
+}
+
 static int aspeed_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -899,6 +1010,9 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	ctlr->cleanup = aspeed_spi_cleanup;
 	ctlr->num_chipselect = of_get_available_child_count(dev->of_node);
 	ctlr->dev.of_node = dev->of_node;
+	ctlr->prepare_message = aspeed_spi_user_prepare_msg;
+	ctlr->unprepare_message = aspeed_spi_user_unprepare_msg;
+	ctlr->transfer_one = aspeed_spi_user_transfer;
 
 	aspi->num_cs = ctlr->num_chipselect;
 
@@ -1455,6 +1569,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.calibrate     = aspeed_spi_calibrate,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.segment_start = aspeed_spi_segment_start,
@@ -1471,6 +1586,7 @@ static const struct aspeed_spi_data ast2400_spi_data = {
 	.timing	       = 0x14,
 	.hclk_mask     = 0xfffff0ff,
 	.hdiv_max      = 1,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2400,
 	.calibrate     = aspeed_spi_calibrate,
 	/* No segment registers */
@@ -1485,6 +1601,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1502,6 +1619,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.min_window_size = 0x800000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2500,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
@@ -1520,6 +1638,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x200000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1538,6 +1657,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x200000,
+	.full_duplex   = false,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2600_start,
@@ -1556,6 +1676,7 @@ static const struct aspeed_spi_data ast2700_fmc_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x10000,
+	.full_duplex   = true,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2700_start,
@@ -1573,6 +1694,7 @@ static const struct aspeed_spi_data ast2700_spi_data = {
 	.hclk_mask     = 0xf0fff0ff,
 	.hdiv_max      = 2,
 	.min_window_size = 0x10000,
+	.full_duplex   = true,
 	.get_clk_div   = aspeed_get_clk_div_ast2600,
 	.calibrate     = aspeed_spi_ast2600_calibrate,
 	.segment_start = aspeed_spi_segment_ast2700_start,
-- 
2.34.1


