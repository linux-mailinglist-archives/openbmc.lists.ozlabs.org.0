Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6606520C70
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 05:50:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky3wM5QJCz3cfb
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 13:50:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky3vZ0skRz2yJF;
 Tue, 10 May 2022 13:49:44 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24A3a11u015463;
 Tue, 10 May 2022 11:36:01 +0800 (GMT-8)
 (envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 10 May
 2022 11:49:14 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>, <clg@kaod.org>
Subject: [PATCH v2 1/1] spi: aspeed: Update SPI clock frequency config rule
Date: Tue, 10 May 2022 11:49:08 +0800
Message-ID: <20220510034908.1855049-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510034908.1855049-1-chin-ting_kuo@aspeedtech.com>
References: <20220510034908.1855049-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24A3a11u015463
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of using the slowest one, the maximum clock frequency
configured in the device tree should be kept when no timing
calibration process is executed.
Besides, an extra callback function is added in order to calculate
clock frequency configuration for different ASPEED platforms.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
v2: Merge aspeed_spi_hclk_masks[] into aspeed_spi_hclk_divs[].

 drivers/spi/spi-aspeed-smc.c | 167 ++++++++++++++++++++++++++++++-----
 1 file changed, 145 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 496f3e1e9079..23e7a6ac53b4 100644
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
@@ -952,12 +953,10 @@ static bool aspeed_spi_check_calib_data(const u8 *test_buf, u32 size)
 	return cnt >= 64;
 }
 
+/* HCLK/1 ..	HCLK/16 */
 static const u32 aspeed_spi_hclk_divs[] = {
-	0xf, /* HCLK */
-	0x7, /* HCLK/2 */
-	0xe, /* HCLK/3 */
-	0x6, /* HCLK/4 */
-	0xd, /* HCLK/5 */
+	15, 7, 14, 6, 13, 5, 12, 4,
+	11, 3, 10, 2, 9,  1, 8,  0
 };
 
 #define ASPEED_SPI_HCLK_DIV(i) \
@@ -972,7 +971,10 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
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
@@ -992,8 +994,8 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 
 	memcpy_fromio(golden_buf, chip->ahb_base, CALIBRATE_BUF_SIZE);
 	if (!aspeed_spi_check_calib_data(golden_buf, CALIBRATE_BUF_SIZE)) {
-		dev_info(aspi->dev, "Calibration area too uniform, using low speed");
-		goto no_calib;
+		dev_info(aspi->dev, "Calibration area too uniform, using default freq");
+		goto end_calib;
 	}
 
 #if defined(VERBOSE_DEBUG)
@@ -1002,8 +1004,8 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
 #endif
 
 	/* Now we iterate the HCLK dividers until we find our breaking point */
-	for (i = ARRAY_SIZE(aspeed_spi_hclk_divs); i > data->hdiv_max - 1; i--) {
-		u32 tv, freq;
+	for (i = 5; i > data->hdiv_max - 1; i--) {
+		u32 tv;
 
 		freq = ahb_freq / i;
 		if (freq > max_freq)
@@ -1015,27 +1017,142 @@ static int aspeed_spi_do_calibration(struct aspeed_spi_chip *chip)
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
+end_calib:
+	if (best_freq == 0)
+		best_freq = max_freq;
+
+	clk_conf = data->clk_config(chip, best_freq);
+	/* Record the freq */
+	for (i = 0; i < ASPEED_SPI_MAX; i++)
+		chip->ctl_val[i] = (chip->ctl_val[i] & data->hclk_mask) | clk_conf;
 
-no_calib:
 	writel(chip->ctl_val[ASPEED_SPI_READ], chip->ctl);
 	kfree(test_buf);
 	return 0;
 }
 
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
+	for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_divs); i++) {
+		if (ahb_freq / (i + 1) <= max_hz) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found)
+		hclk_div = aspeed_spi_hclk_divs[i] << 8;
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "h_div: %d (mask %x)\n",
+			i + 1, aspeed_spi_hclk_divs[i]);
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
+	for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_divs); i++) {
+		if (ahb_freq / (i + 1) <= max_hz) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		hclk_div = aspeed_spi_hclk_divs[i] << 8;
+	} else {
+		/* If FMC10[13] is set, an extra div_4 can be introduced. */
+		for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_divs); i++) {
+			if (ahb_freq / ((i + 1) * 4) <= max_hz) {
+				found = true;
+				break;
+			}
+		}
+
+		if (found)
+			hclk_div = BIT(13) | (aspeed_spi_hclk_divs[i] << 8);
+	}
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "h_div: %d (mask %x)\n",
+			i + 1, aspeed_spi_hclk_divs[i]);
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
+		for (i = 0; i < ARRAY_SIZE(aspeed_spi_hclk_divs); i++) {
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
+			hclk_div = ((j << 24) | aspeed_spi_hclk_divs[i] << 8);
+			break;
+		}
+	}
+
+	dev_dbg(aspi->dev, "found: %s, hclk: %d, max_clk: %d\n",
+		found ? "yes" : "no", ahb_freq, max_hz);
+
+	if (found) {
+		dev_dbg(aspi->dev, "base_clk: %d, h_div: %d (mask %x)\n",
+			j, i + 1, aspeed_spi_hclk_divs[i]);
+	}
+
+	return hclk_div;
+}
+
 #define TIMING_DELAY_DI		BIT(3)
 #define TIMING_DELAY_HCYCLE_MAX	5
 #define TIMING_REG_AST2600(chip)				\
@@ -1110,6 +1227,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2400_clk_config,
 };
 
 static const struct aspeed_spi_data ast2400_spi_data = {
@@ -1122,6 +1240,7 @@ static const struct aspeed_spi_data ast2400_spi_data = {
 	.hdiv_max      = 1,
 	.calibrate     = aspeed_spi_calibrate,
 	/* No segment registers */
+	.clk_config    = aspeed_spi_ast2400_clk_config,
 };
 
 static const struct aspeed_spi_data ast2500_fmc_data = {
@@ -1136,6 +1255,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2500_clk_config,
 };
 
 static const struct aspeed_spi_data ast2500_spi_data = {
@@ -1150,6 +1270,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.clk_config    = aspeed_spi_ast2500_clk_config,
 };
 
 static const struct aspeed_spi_data ast2600_fmc_data = {
@@ -1165,6 +1286,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.clk_config    = aspeed_spi_ast2600_clk_config,
 };
 
 static const struct aspeed_spi_data ast2600_spi_data = {
@@ -1180,6 +1302,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.clk_config    = aspeed_spi_ast2600_clk_config,
 };
 
 static const struct of_device_id aspeed_spi_matches[] = {
-- 
2.25.1

