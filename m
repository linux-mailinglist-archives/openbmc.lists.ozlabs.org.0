Return-Path: <openbmc+bounces-709-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171EBB0273
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCLD0g23z3chS;
	Wed,  1 Oct 2025 21:26:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317988;
	cv=none; b=Pihh7orE/tFggFfu4tqeY8rGQwQ/SvUsdUoVHEPsf/WxoHU5OjnIdnWi6Uv5pdzHtQLbCVy+FVAlZIDdHfiX42EZ5vZkEHFncwJat5yGa3wh288gEidzmzBUCZgWnqTUvs66+RAAmAIO/vwDjpuGapRZKDYWvVfbMwxZl3UToa6qlMowUQvYZEBCo+IKD4ZdFbeY76J2yMxiYLAezdOoUClDzhZYaFvZjnRdJAl8JOZyxBiVV1ubqJI8rPfvypUBzZB5UOUrctXHh4e7eQXPdrhszeu0xFHH55d566w5C6hvLKhs8ZEfJDngdH6i8pgwxkHTNhEnyforbScXSfc6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317988; c=relaxed/relaxed;
	bh=YR1Mod+NFveRRpWwy/fSpGz8PTuzMYsp+0BiZ5cmWtQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+i1Oa0Yz4NiVwnvjECfU0BhUdL4DfXsUEaaXzdQPPIOFHQLMQhIkQl4Lha37M9fLkGmSW6+HBNAu/tmVluVaAXqUa3qzYJX50nMF6Tx5ZTcKiu62DMMtbNuhEd+GSgQsCwNap+plOEL/LEJM5aZF9nyJpdcSGoVojL9c4Yq9WDtCeJEc3J6oOw+VkjLeVLymKcB/dcNPQIGPOX9xo7WIkzZQBcw6rXJZAq09yQIG1TuUCu4f4/TrOAPb6xcihWt/2hL7XwgfXNAhQdxk8osxYl8CI6msi6WOLvsgnLNkkUHChW8rLadGVAWSgygcAOZom974Svr3AdELEKRsI7t4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCLC2x5pz3cht;
	Wed,  1 Oct 2025 21:26:27 +1000 (AEST)
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
Subject: [PATCH 5/6] spi: aspeed: Add per-platform adjust_window callback for decoding range
Date: Wed, 1 Oct 2025 19:26:04 +0800
Message-ID: <20251001112605.1130723-6-chin-ting_kuo@aspeedtech.com>
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

Different ASPEED SoCs have specific limitations on SPI address decoding,
such as total range size, minimum window size per CS, and alignment
requirements. The original adjustment logic only handles simple cases
and could fail in more complex setups found in advanced board designs,
e.g., small flash on CS0 and large flash on CS1, or when the total physical
flash size exceeds the decoding range supported by the SPI controller.

This patch introduces a per-platform adjust_window callback to handle
these constraints properly. Each platform defines its own logic to
adjust decoding ranges, trim excess size, and ensure alignment.

If trimming is required, the affected CS will fall back to user mode
access to ensure the entire flash remains accessible from the MTD layer.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 202 +++++++++++++++++++++++++++++------
 1 file changed, 168 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 83a47ac0711e..4f6ae48dd904 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -67,6 +67,7 @@ struct aspeed_spi_chip {
 	u32			 ahb_window_size;
 	u32			 ctl_val[ASPEED_SPI_MAX];
 	u32			 clk_freq;
+	bool			 force_user_mode;
 };
 
 struct aspeed_spi_data {
@@ -83,6 +84,7 @@ struct aspeed_spi_data {
 	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
 	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
+	int (*adjust_window)(struct aspeed_spi *aspi);
 	u32 (*get_clk_div)(struct aspeed_spi_chip *chip, u32 hz);
 	int (*calibrate)(struct aspeed_spi_chip *chip, u32 hdiv,
 			 const u8 *golden_buf, u8 *test_buf);
@@ -462,9 +464,166 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
 		aspi->chips[cs].ahb_window_size = 0;
 
+	if (aspi->data->adjust_window)
+		aspi->data->adjust_window(aspi);
+
 	return aspeed_spi_set_window(aspi);
 }
 
+/*
+ * As the flash size grows up, we need to trim some decoding
+ * size if needed for the sake of conforming the maximum
+ * decoding size. We trim the decoding size from the rear CS
+ * to avoid affecting the default boot up sequence, usually,
+ * from CS0. Notice, if a CS decoding size is trimmed,
+ * command mode may not work perfectly on that CS, but it only
+ * affect performance and the debug function.
+ */
+static int aspeed_spi_trim_window_size(struct aspeed_spi *aspi)
+{
+	struct aspeed_spi_chip *chips = aspi->chips;
+	size_t total_sz;
+	int cs = aspi->data->max_cs - 1;
+	u32 i;
+	bool trimmed = false;
+
+	do {
+		total_sz = 0;
+		for (i = 0; i < aspi->data->max_cs; i++)
+			total_sz += chips[i].ahb_window_size;
+
+		if (cs < 0)
+			return -ENOMEM;
+
+		if (chips[cs].ahb_window_size <= aspi->data->min_window_size) {
+			cs--;
+			continue;
+		}
+
+		if (total_sz > aspi->ahb_window_size) {
+			chips[cs].ahb_window_size -=
+				aspi->data->min_window_size;
+			total_sz -= aspi->data->min_window_size;
+			/*
+			 * If the ahb window size is ever trimmed, only user
+			 * mode can be adopted to access the whole flash.
+			 */
+			chips[cs].force_user_mode = true;
+			trimmed = true;
+		}
+	} while (total_sz > aspi->ahb_window_size);
+
+	if (trimmed) {
+		dev_warn(aspi->dev, "Window size after triming:\n");
+		for (cs = 0; cs < aspi->data->max_cs; cs++) {
+			dev_warn(aspi->dev, "CE%d: 0x%08x\n",
+				 cs, chips[cs].ahb_window_size);
+		}
+	}
+
+	return 0;
+}
+
+static int aspeed_adjust_window_ast2400(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Close unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
+		chips[cs].ahb_window_size = 0;
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * For AST2500, the minimum address decoding size for each CS
+ * is 8MB. This address decoding size is mandatory for each
+ * CS no matter whether it will be used. This is a HW limitation.
+ */
+static int aspeed_adjust_window_ast2500(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs, i;
+	u32 cum_size, rem_size;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Assign min_window_sz to unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++) {
+		if (chips[cs].ahb_window_size < aspi->data->min_window_size)
+			chips[cs].ahb_window_size =
+				aspi->data->min_window_size;
+	}
+
+	/*
+	 * If command mode or normal mode is used by dirmap read, the start
+	 * address of a window should be multiple of its related flash size.
+	 * Namely, the total windows size from flash 0 to flash N should
+	 * be multiple of the size of flash (N + 1).
+	 */
+	for (cs = aspi->num_cs - 1; cs >= 0; cs--) {
+		cum_size = 0;
+		for (i = 0; i < cs; i++)
+			cum_size += chips[i].ahb_window_size;
+
+		rem_size = cum_size % chips[cs].ahb_window_size;
+		if (chips[cs].ahb_window_size != 0 && rem_size != 0)
+			chips[0].ahb_window_size +=
+				chips[cs].ahb_window_size - rem_size;
+	}
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	/* The total window size of AST2500 SPI1 CS0 and CS1 must be 128MB */
+	if (aspi->data == &ast2500_spi_data)
+		chips[1].ahb_window_size =
+			0x08000000 - chips[0].ahb_window_size;
+
+	return 0;
+}
+
+static int aspeed_adjust_window_ast2600(struct aspeed_spi *aspi)
+{
+	int ret;
+	int cs, i;
+	u32 cum_size, rem_size;
+	struct aspeed_spi_chip *chips = aspi->chips;
+
+	/* Close unused CS. */
+	for (cs = aspi->num_cs; cs < aspi->data->max_cs; cs++)
+		chips[cs].ahb_window_size = 0;
+
+	/*
+	 * If command mode or normal mode is used by dirmap read, the start
+	 * address of a window should be multiple of its related flash size.
+	 * Namely, the total windows size from flash 0 to flash N should
+	 * be multiple of the size of flash (N + 1).
+	 */
+	for (cs = aspi->num_cs - 1; cs >= 0; cs--) {
+		cum_size = 0;
+		for (i = 0; i < cs; i++)
+			cum_size += chips[i].ahb_window_size;
+
+		rem_size = cum_size % chips[cs].ahb_window_size;
+		if (chips[cs].ahb_window_size != 0 && rem_size != 0)
+			chips[0].ahb_window_size +=
+				chips[cs].ahb_window_size - rem_size;
+	}
+
+	ret = aspeed_spi_trim_window_size(aspi);
+	if (ret != 0)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Yet to be done when possible :
  * - Align mappings on flash size (we don't have the info)
@@ -475,48 +634,18 @@ static int aspeed_spi_chip_adjust_window(struct aspeed_spi_chip *chip,
 					 u32 local_offset, u32 size)
 {
 	struct aspeed_spi *aspi = chip->aspi;
-	u32 cs;
-	u32 total_window_size;
 	int ret;
 
 	/* No segment registers for the AST2400 SPI controller */
 	if (aspi->data == &ast2400_spi_data)
 		return 0;
 
-	/*
-	 * Due to an HW issue on the AST2500 SPI controller, the CE0
-	 * window size should be smaller than the maximum 128MB.
-	 */
-	if (aspi->data == &ast2500_spi_data && chip->cs == 0 && size == SZ_128M) {
-		size = 120 << 20;
-		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2500 HW quirk)",
-			 chip->cs, size >> 20);
-	}
-
-	/*
-	 * The decoding size of AST2600 SPI controller should set at
-	 * least 2MB.
-	 */
-	if ((aspi->data == &ast2600_spi_data || aspi->data == &ast2600_fmc_data) &&
-	    size < SZ_2M) {
-		size = SZ_2M;
-		dev_info(aspi->dev, "CE%d window resized to %dMB (AST2600 Decoding)",
-			 chip->cs, size >> 20);
-	}
-
 	/* Adjust this chip window */
 	aspi->chips[chip->cs].ahb_window_size = size;
 
-	total_window_size = 0;
-	for (cs = 0; cs < aspi->data->max_cs; cs++)
-		total_window_size += aspi->chips[cs].ahb_window_size;
-
-	if (total_window_size > aspi->ahb_window_size) {
-		aspi->chips[chip->cs].ahb_window_size -= (total_window_size -
-							  aspi->ahb_window_size);
-		dev_warn(aspi->dev, "CE%d window resized to %zdMB",
-			 chip->cs, aspi->chips[chip->cs].ahb_window_size >> 20);
-	}
+	/* Adjust the overall windows size regarding each platform */
+	if (aspi->data->adjust_window)
+		aspi->data->adjust_window(aspi);
 
 	ret = aspeed_spi_set_window(aspi);
 	if (ret)
@@ -600,7 +729,7 @@ static ssize_t aspeed_spi_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	struct aspeed_spi_chip *chip = &aspi->chips[spi_get_chipselect(desc->mem->spi, 0)];
 
 	/* Switch to USER command mode if mapping window is too small */
-	if (chip->ahb_window_size < offset + len) {
+	if (chip->ahb_window_size < offset + len || chip->force_user_mode) {
 		int ret;
 
 		ret = aspeed_spi_read_user(chip, &desc->info.op_tmpl, offset, len, buf);
@@ -1265,6 +1394,7 @@ static const struct aspeed_spi_data ast2400_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2400,
 };
 
 static const struct aspeed_spi_data ast2400_spi_data = {
@@ -1294,6 +1424,7 @@ static const struct aspeed_spi_data ast2500_fmc_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2500,
 };
 
 static const struct aspeed_spi_data ast2500_spi_data = {
@@ -1310,6 +1441,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 	.segment_start = aspeed_spi_segment_start,
 	.segment_end   = aspeed_spi_segment_end,
 	.segment_reg   = aspeed_spi_segment_reg,
+	.adjust_window = aspeed_adjust_window_ast2500,
 };
 
 static const struct aspeed_spi_data ast2600_fmc_data = {
@@ -1327,6 +1459,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
 static const struct aspeed_spi_data ast2600_spi_data = {
@@ -1344,6 +1477,7 @@ static const struct aspeed_spi_data ast2600_spi_data = {
 	.segment_start = aspeed_spi_segment_ast2600_start,
 	.segment_end   = aspeed_spi_segment_ast2600_end,
 	.segment_reg   = aspeed_spi_segment_ast2600_reg,
+	.adjust_window = aspeed_adjust_window_ast2600,
 };
 
 static const struct of_device_id aspeed_spi_matches[] = {
-- 
2.34.1


