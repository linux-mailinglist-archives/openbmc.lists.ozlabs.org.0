Return-Path: <openbmc+bounces-708-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A740BB0264
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:27:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCLC2500z3chg;
	Wed,  1 Oct 2025 21:26:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317987;
	cv=none; b=ABfQrR+z7mBqgqnHG1fndC6qH4/UiaNcL6vmzIbCW++Fib1+/4lRyZRX8K6bLaxHZ8JPc/kiApAh3aaZ/jjjsx7inaLIqhCXX/MrmESJ/ym1loHwqki5uvBd68dMIqyAJ5k+EF0/Q3jyfuKfBg/RKfqoMJNibVN7JyOFxv6smJV9dpE2+4qk9S1zOkgW5yNrxTYdZrcxcODijv56DWnC/+h2VPYtmcPNVe6U2MDSrYeICCGjJ6gJyCik5qMrnFZv8dtcXaBPUL2GyyXzzBz44g10z7Grt7fDLaW2Zpdem014KX8QyYfSg6ZL88Ub8oKDxByKbONjmN7ntOGAOrpVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317987; c=relaxed/relaxed;
	bh=wbtepTMouFcgc8P/is0yp+OoQjk6HymzcQb3fGB6Xow=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ft+6Bk2ZHOZBjGTCxqKg1VHyq0jttf/ZxSCJNf7fxF/BGbfD4kP3MqOnjNtF8n3K/uwx63jcAdd6QomJWM5Td/+lVnTJQDH7ijV4l/f0kib1o/iEGIjryPN5R221V18xhqewVSLXtStVkwrZ1Q8IYqhsu2uLiMGA7/cZ2npx0FT2kLcW75oiiLPThBGe01MnBHiIpOONY/AeQndqjgKyO2r3SO+Np51rz9Ztp8d0uq0qh/RJScbvkKuYRIdBusm8LcM8b4LqjVjVq8EDtrXqRWIrXEr76xSk7tvfCNjh3z8L6rMQ6TS1EJT0uj/41ev1cRa0l8jDFDE/OpHrC8fpgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCLB4HGTz3chS;
	Wed,  1 Oct 2025 21:26:26 +1000 (AEST)
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
Subject: [PATCH 4/6] spi: aspeed: Centralize address decoding region management
Date: Wed, 1 Oct 2025 19:26:03 +0800
Message-ID: <20251001112605.1130723-5-chin-ting_kuo@aspeedtech.com>
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

The original approach to handling address decoding overlaps was to trim
the next region directly. If the next CS's decoding range was fully
overlapped by the current one, it would be forcibly closed by trimming
its size to zero. This could lead expected behavior, especially on
the platform with multiple flashes layout.

To solve improper trimming problem, this patch collects the required
address decoding size at each stage, then, (re-)arragne address decoding
region to each CS centrally with knowing the total AHB decoding size.
If a segment register cannot be updated (e.g. due to bootloader write
protection), the original value is kept to avoid breaking access and
an error is reported if the total decoding size of all CS exceeds
the total AHB decoding size.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 156 +++++++++++++----------------------
 1 file changed, 58 insertions(+), 98 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 29fed8477958..83a47ac0711e 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -379,61 +379,59 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
 			      spi_get_chipselect(mem->spi, 0));
 }
 
-struct aspeed_spi_window {
-	u32 cs;
-	u32 offset;
-	u32 size;
-};
-
-static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
-				   struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS])
+static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 {
-	const struct aspeed_spi_data *data = aspi->data;
-	u32 reg_val;
+	struct device *dev = aspi->dev;
+	off_t offset = 0;
+	phys_addr_t start;
+	phys_addr_t end;
+	void __iomem *seg_reg_base = aspi->regs + CE0_SEGMENT_ADDR_REG;
+	void __iomem *seg_reg;
+	u32 seg_val_backup;
+	u32 seg_val;
 	u32 cs;
+	size_t window_size;
 
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
-		reg_val = readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
-		windows[cs].cs = cs;
-		windows[cs].size = data->segment_end(aspi, reg_val) -
-			data->segment_start(aspi, reg_val);
-		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
-		dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
-			 windows[cs].offset, windows[cs].size);
-	}
-}
+		seg_reg = seg_reg_base + cs * 4;
+		seg_val_backup = readl(seg_reg);
 
-static int aspeed_spi_set_window(struct aspeed_spi *aspi,
-				 const struct aspeed_spi_window *win)
-{
-	u32 start = aspi->ahb_base_phy + win->offset;
-	u32 end = start + win->size;
-	void __iomem *seg_reg = aspi->regs + CE0_SEGMENT_ADDR_REG + win->cs * 4;
-	u32 seg_val_backup = readl(seg_reg);
-	u32 seg_val = aspi->data->segment_reg(aspi, start, end);
+		start = aspi->ahb_base_phy + offset;
+		window_size = aspi->chips[cs].ahb_window_size;
+		end = start + window_size;
 
-	if (seg_val == seg_val_backup)
-		return 0;
+		seg_val = aspi->data->segment_reg(aspi, start, end);
+		writel(seg_val, seg_reg);
 
-	writel(seg_val, seg_reg);
+		/*
+		 * Restore initial value if something goes wrong or the segment
+		 * register is written protected.
+		 */
+		if (seg_val != readl(seg_reg)) {
+			dev_warn(dev, "CE%d expected window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
+				 cs, (u64)start, (u64)end - 1, window_size >> 20);
+			writel(seg_val_backup, seg_reg);
+			window_size = aspi->data->segment_end(aspi, seg_val_backup) -
+				      aspi->data->segment_start(aspi, seg_val_backup);
+			aspi->chips[cs].ahb_window_size = window_size;
+			end = start + window_size;
+		}
 
-	/*
-	 * Restore initial value if something goes wrong else we could
-	 * loose access to the chip.
-	 */
-	if (seg_val != readl(seg_reg)) {
-		dev_err(aspi->dev, "CE%d invalid window [ 0x%.8x - 0x%.8x ] %dMB",
-			win->cs, start, end - 1, win->size >> 20);
-		writel(seg_val_backup, seg_reg);
-		return -EIO;
+		if (window_size != 0)
+			dev_dbg(dev, "CE%d window [ 0x%.9llx - 0x%.9llx ] %zdMB\n",
+				cs, (u64)start, (u64)end - 1,  window_size >> 20);
+		else
+			dev_dbg(dev, "CE%d window closed\n", cs);
+
+		aspi->chips[cs].ahb_base = aspi->ahb_base + offset;
+		offset += window_size;
+		if (offset > aspi->ahb_window_size) {
+			dev_err(dev, "CE%d offset value 0x%llx is too large.\n",
+				cs, (u64)offset);
+			return -ENOSPC;
+		}
 	}
 
-	if (win->size)
-		dev_dbg(aspi->dev, "CE%d new window [ 0x%.8x - 0x%.8x ] %dMB",
-			win->cs, start, end - 1,  win->size >> 20);
-	else
-		dev_dbg(aspi->dev, "CE%d window closed", win->cs);
-
 	return 0;
 }
 
@@ -443,9 +441,7 @@ static const struct aspeed_spi_data ast2600_fmc_data;
 
 static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 {
-	int ret;
 	u32 cs;
-	struct aspeed_spi_window win;
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data) {
@@ -456,36 +452,17 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 
 	/* Assign the minimum window size to each CS */
 	for (cs = 0; cs < aspi->num_cs; cs++) {
-		if (cs == 0)
-			aspi->chips[cs].ahb_base = aspi->ahb_base;
-		else
-			aspi->chips[cs].ahb_base =
-				aspi->chips[cs - 1].ahb_base +
-				aspi->chips[cs - 1].ahb_window_size;
-
 		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
-
 		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
 			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
 			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
 	}
 
 	/* Close unused CS */
-	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
-		aspi->chips[cs].ahb_base = aspi->ahb_base;
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
 		aspi->chips[cs].ahb_window_size = 0;
-	}
-
-	for (cs = 0; cs < aspi->num_cs; cs++) {
-		win.cs = cs;
-		win.offset = aspi->chips[cs].ahb_base - aspi->ahb_base;
-		win.size = aspi->chips[cs].ahb_window_size;
-		ret = aspeed_spi_set_window(aspi, &win);
-		if (ret)
-			return ret;
-	}
 
-	return 0;
+	return aspeed_spi_set_window(aspi);
 }
 
 /*
@@ -498,8 +475,8 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
 	struct aspeed_spi *aspi = chip->aspi;
-	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
-	struct aspeed_spi_window *win = &windows[chip->cs];
+	u32 cs;
+	u32 total_window_size;
 	int ret;
 
 	/* No segment registers for the AST2400 SPI controller */
@@ -527,41 +504,24 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 			 chip->cs, size >> 20);
 	}
 
-	aspeed_spi_get_windows(aspi, windows);
-
 	/* Adjust this chip window */
-	win->offset += local_offset;
-	win->size = size;
+	aspi->chips[chip->cs].ahb_window_size = size;
 
-	if (win->offset + win->size > aspi->ahb_window_size) {
-		win->size = aspi->ahb_window_size - win->offset;
-		dev_warn(aspi->dev, "CE%d window resized to %dMB", chip->cs, win->size >> 20);
+	total_window_size = 0;
+	for (cs = 0; cs < aspi->data->max_cs; cs++)
+		total_window_size += aspi->chips[cs].ahb_window_size;
+
+	if (total_window_size > aspi->ahb_window_size) {
+		aspi->chips[chip->cs].ahb_window_size -= (total_window_size -
+							  aspi->ahb_window_size);
+		dev_warn(aspi->dev, "CE%d window resized to %zdMB",
+			 chip->cs, aspi->chips[chip->cs].ahb_window_size >> 20);
 	}
 
-	ret = aspeed_spi_set_window(aspi, win);
+	ret = aspeed_spi_set_window(aspi);
 	if (ret)
 		return ret;
 
-	/* Update chip mapping info */
-	chip->ahb_base = aspi->ahb_base + win->offset;
-	chip->ahb_window_size = win->size;
-
-	/*
-	 * Also adjust next chip window to make sure that it does not
-	 * overlap with the current window.
-	 */
-	if (chip->cs < aspi->data->max_cs - 1) {
-		struct aspeed_spi_window *next = &windows[chip->cs + 1];
-
-		/* Change offset and size to keep the same end address */
-		if ((next->offset + next->size) > (win->offset + win->size))
-			next->size = (next->offset + next->size) - (win->offset + win->size);
-		else
-			next->size = 0;
-		next->offset = win->offset + win->size;
-
-		aspeed_spi_set_window(aspi, next);
-	}
 	return 0;
 }
 
-- 
2.34.1


