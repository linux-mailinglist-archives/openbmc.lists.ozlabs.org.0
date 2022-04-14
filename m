Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30496500B19
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 12:29:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfG0j1hxvz2yhD
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 20:29:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfFzz43XKz2xVY;
 Thu, 14 Apr 2022 20:28:47 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23EAGooQ068168;
 Thu, 14 Apr 2022 18:16:51 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Apr
 2022 18:28:36 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH 1/1] spi: aspeed: Update SPI clock frequency configuration
Date: Thu, 14 Apr 2022 18:28:29 +0800
Message-ID: <20220414102829.3892843-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414102829.3892843-1-chin-ting_kuo@aspeedtech.com>
References: <20220414102829.3892843-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23EAGooQ068168
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
Cc: chin-ting_kuo@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of using the slowest one, the maximum clock
frequency configured in the device tree should be kept
when no timing calibration process is executed.
Besides, an extra callback function is added in order
to calculate clock frequency configuration for
different ASPEED platforms.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 166 +++++++++++++++++++++++++++++++----
 1 file changed, 149 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 227797e13997..728163d0045d 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -3,7 +3,7 @@
  * ASPEED FMC/SPI Memory Controller Driver
  *
  * Copyright (c) 2015-2022, IBM Corporation.
- * Copyright (c) 2020, ASPEED Corporation.
+ * Copyright (c) 2020-2022, ASPEED Corporation.
  */
 
 #include <linux/clk.h>
@@ -84,6 +84,7 @@ struct aspeed_spi_data {
 	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
 	int (*calibrate)(struct aspeed_spi_chip *chip, u32 hdiv,
 			 const u8 *golden_buf, u8 *test_buf);
+	u32 (*clk_config)(struct aspeed_spi_chip *chip, u32 max_hz);
 };
 
 #define ASPEED_SPI_MAX_NUM_CS	5
@@ -959,7 +960,10 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 	u32 ctl_val;
 	u8 *golden_buf = NULL;
 	u8 *test_buf = NULL;
-	int i, rc, best_div = -1;
+	int i, rc;
+	u32 best_freq = 0;
+	u32 freq;
+	u32 clk_conf;
 
 	dev_dbg(aspi->dev, "calculate timing compensation - AHB freq: %d MHz",
 		ahb_freq / 1000000);
@@ -980,7 +984,7 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
 	if (!aspeed_spi_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
 		dev_info(aspi->dev, "Calibration area too uniform, using low speed");
-		goto no_calib;
+		goto end_calib;
 	}
 
 #if defined(VERBOSE_DEBUG)
@@ -990,7 +994,7 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 
 	/* Now we iterate the HCLK dividers until we find our breaking point */
 	for (i = ARRAY_SIZE(aspeed_spi_hclk_divs); i > data->hdiv_max - 1; i--) {
-		u32 tv, freq;
+		u32 tv;
 
 		freq = ahb_freq / i;
 		if (freq > max_freq)
@@ -1002,27 +1006,149 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 		dev_dbg(aspi->dev, "Trying HCLK/%d [%08x] ...", i, tv);
 		rc = data->calibrate(chip, i, golden_buf, test_buf);
 		if (rc == 0)
-			best_div = i;
+			best_freq = freq;
 	}
 
 	/* Nothing found ? */
-	if (best_div < 0) {
-		dev_warn(aspi->dev, "No good frequency, using dumb slow");
-	} else {
-		dev_dbg(aspi->dev, "Found good read timings at HCLK/%d", best_div);
+	if (best_freq == 0)
+		dev_warn(aspi->dev, "Use the default timing setting");
+	else
+		dev_dbg(aspi->dev, "Found good read timings at HCLK/%d", i);
 
-		/* Record the freq */
-		for (i = 0; i < ASPEED_SPI_MAX; i++)
-			chip->ctl_val[i] = (chip->ctl_val[i] & data->hclk_mask) |
-				ASPEED_SPI_HCLK_DIV(best_div);
-	}
 
-no_calib:
+end_calib:
+	if (best_freq == 0)
+		best_freq = max_freq;
+
+	clk_conf = data->clk_config(chip, best_freq);
+	/* Record the freq */
+	for (i = 0; i < ASPEED_SPI_MAX; i++)
+		chip->ctl_val[i] = (chip->ctl_val[i] & data->hclk_mask) | clk_conf;
+
 	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
 	kfree(test_buf);
 	return 0;
 }
 
+/* HCLK/1 ..	HCLK/16 */
+static const u32 aspeed_spi_hclk_masks[] = {
+	15, 7, 14, 6, 13, 5, 12, 4,
+	11, 3, 10, 2, 9,  1, 8,  0
+};
+
+static u32 aspeed_spi_ast2400_clk_config(struct aspeed_spi_chip *chip,
+					 u32 max_hz)
+{
+	struct aspeed_spi *aspi = chip->aspi;
+	u32 ahb_freq = aspi->clk_freq;
+	u32 hclk_div = 0; /* default value */
+	u32 i;
+	bool found = false;
+
+	/* FMC/SPIR10[11:8] */
+	for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_masks); i++) {
+		if (ahb_freq / (i + 1) <= max_hz) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found)
+		hclk_div = aspeed_spi_hclk_masks[i] << 8;
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "h_div: %d (mask %x)\n",
+			i + 1, aspeed_spi_hclk_masks[i]);
+	}
+
+	return hclk_div;
+}
+
+static u32 aspeed_spi_ast2500_clk_config(struct aspeed_spi_chip *chip,
+					 u32 max_hz)
+{
+	struct aspeed_spi *aspi = chip->aspi;
+	u32 ahb_freq = aspi->clk_freq;
+	u32 hclk_div = 0; /* default value */
+	u32 i;
+	bool found = false;
+
+	/* FMC/SPIR10[11:8] */
+	for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_masks); i++) {
+		if (ahb_freq / (i + 1) <= max_hz) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		hclk_div = aspeed_spi_hclk_masks[i] << 8;
+	} else {
+		/* If FMC10[13] is set, an extra div_4 can be introduced. */
+		for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_masks); i++) {
+			if (ahb_freq / ((i + 1) * 4) <= max_hz) {
+				found = true;
+				break;
+			}
+		}
+
+		if (found)
+			hclk_div = BIT(13) | (aspeed_spi_hclk_masks[i] << 8);
+	}
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "h_div: %d (mask %x)\n",
+			i + 1, aspeed_spi_hclk_masks[i]);
+	}
+
+	return hclk_div;
+}
+
+static u32 aspeed_spi_ast2600_clk_config(struct aspeed_spi_chip *chip,
+					 u32 max_hz)
+{
+	struct aspeed_spi *aspi = chip->aspi;
+	u32 ahb_freq = aspi->clk_freq;
+	u32 hclk_div = 0x400; /* default value */
+	u32 i, j;
+	bool found = false;
+
+	/* FMC/SPIR10[27:24] */
+	for (j = 0; j < 0xf; j++) {
+		/* FMC/SPIR10[11:8] */
+		for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_masks); i++) {
+			if (i == 0 && j == 0)
+				continue;
+
+			if (ahb_freq / (i + 1 + (j * 16)) <= max_hz) {
+				found = true;
+				break;
+			}
+		}
+
+		if (found) {
+			hclk_div = ((j << 24) | aspeed_spi_hclk_masks[i] << 8);
+			break;
+		}
+	}
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "base_clk: %d, h_div: %d (mask %x)\n",
+			j, i + 1, aspeed_spi_hclk_masks[i]);
+	}
+
+	return hclk_div;
+}
+
 #define TIMING_DELAY_DI		BIT(3)
 #define TIMING_DELAY_HCYCLE_MAX	5
 #define TIMING_REG_AST2600(chip)				\
@@ -1097,6 +1223,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2400_clk_config,
 };
 
 static const struct aspeed_spi_data ast2400_spi_data = {
@@ -1109,6 +1236,7 @@ static const struct aspeed_spi_data ast2400_spi_data = {
 	.hdiv_max      = 1,
 	.calibrate     = aspeed_spi_calibrate,
 	/* No segment registers */
+	.clk_config    = aspeed_spi_ast2400_clk_config,
 };
 
 static const struct aspeed_spi_data ast2500_fmc_data = {
@@ -1117,12 +1245,13 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
-	.hclk_mask     = 0xfffff0ff,
+	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2500_clk_config,
 };
 
 static const struct aspeed_spi_data ast2500_spi_data = {
@@ -1131,12 +1260,13 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
-	.hclk_mask     = 0xfffff0ff,
+	.hclk_mask     = 0xffffd0ff,
 	.hdiv_max      = 1,
 	.calibrate     = aspeed_spi_calibrate,
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2500_clk_config,
 };
 
 static const struct aspeed_spi_data ast2600_fmc_data = {
@@ -1152,6 +1282,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.clk_config    = aspeed_spi_ast2600_clk_config,
 };
 
 static const struct aspeed_spi_data ast2600_spi_data = {
@@ -1167,6 +1298,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.clk_config    = aspeed_spi_ast2600_clk_config,
 };
 
 static const struct of_device_id aspeed_spi_matches[] = {
-- 
2.25.1

