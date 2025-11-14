Return-Path: <openbmc+bounces-896-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5EC5C7A0
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 11:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7CZt45r0z308H;
	Fri, 14 Nov 2025 21:11:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763115062;
	cv=none; b=ND5GfbWt/4iL8DnmifmTWq4oULiVcSPYPS0n5gYeWo09oclOSOPtbsJIKgYMFfdjuL7coycv3z2/5m1ZUZ2fIDNpx6MSAhggnOds69LRJrI3hzH0Raam9aooZXheSt44pgKBHUENwS53Osup8OmrdzAhW/hBcTm5uQSo8iOQwOcl/c3CFJ84kIhzVmL7kMdFoj4zpgm3n1cJvTk6nKBpRvFpI+Bo1W+kq6AYf0VwPXVYMP+c3SUGHYPf5ytKbmiTTo9qvgd/8a5vnQRiMT5szH7cg3sZfmD7RTtieZGkPw3WrRLtcnx0nqF9C8P+gkKP+ku0IgcseiGPiO7kobCRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763115062; c=relaxed/relaxed;
	bh=NJGTuzVpLNWbUpxhTQvl2uO7y+Gc/zlbpWZXgPByx+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVQzVCziHqcjpn/dBH+3/oIF8NNbm4d3Yfxy7M1BYhRJKghgyehTtOD60ghT97pVpFEsa0lSBg2j7n2HVhnJjINfJAdERPrWycJNceciy+tFIR+rdO/5IMk8pw8wswmYvViexco0R9xT7jSImwy11N7RBeVLQKf03Kd4Wu4gj7e/YDG0hZISBwXB85emRz+M2fjYRs124UXw66hKTQzzNm/vLKURRqojjdKjNV2UqIP75tdt6AZkl61E5lBOPBF3hRUyo1JpqwxUaT5Siq36q51Qe8umR4JcmsAOsrjj8mlsIxdA/MX0KBj49T17ctt3Upsux/JKcxwEhFj+4ZxDDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7CZs6Gg8z306N;
	Fri, 14 Nov 2025 21:11:01 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 3/4] spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit platforms
Date: Fri, 14 Nov 2025 18:10:41 +0800
Message-ID: <20251114101042.1520997-4-chin-ting_kuo@aspeedtech.com>
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

Update bus address types from u32 to phys_addr_t to support systems with
64-bit memory address space. This change ensures compatibility with
upcoming SoCs that extend the system bus beyond 32-bit, while maintaining
support for existing platforms.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 4163632fed8b..d1a8bdf6d540 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -82,9 +82,10 @@ struct aspeed_spi_data {
 	u32	hdiv_max;
 	u32	min_window_size;
 
-	u32 (*segment_start)(struct aspeed_spi *aspi, u32 reg);
-	u32 (*segment_end)(struct aspeed_spi *aspi, u32 reg);
-	u32 (*segment_reg)(struct aspeed_spi *aspi, u32 start, u32 end);
+	phys_addr_t (*segment_start)(struct aspeed_spi *aspi, u32 reg);
+	phys_addr_t (*segment_end)(struct aspeed_spi *aspi, u32 reg);
+	u32 (*segment_reg)(struct aspeed_spi *aspi, phys_addr_t start,
+			   phys_addr_t end);
 	int (*adjust_window)(struct aspeed_spi *aspi);
 	u32 (*get_clk_div)(struct aspeed_spi_chip *chip, u32 hz);
 	int (*calibrate)(struct aspeed_spi_chip *chip, u32 hdiv,
@@ -97,7 +98,7 @@ struct aspeed_spi {
 	const struct aspeed_spi_data	*data;
 
 	void __iomem		*regs;
-	u32			 ahb_base_phy;
+	phys_addr_t		 ahb_base_phy;
 	u32			 ahb_window_size;
 	u32			 num_cs;
 	struct device		*dev;
@@ -484,9 +485,9 @@ static int aspeed_spi_chip_set_default_window(struct aspeed_spi *aspi)
 	/* Assign the minimum window size to each CS */
 	for (cs = 0; cs < aspi->num_cs; cs++) {
 		aspi->chips[cs].ahb_window_size = aspi->data->min_window_size;
-		dev_dbg(aspi->dev, "CE%d default window [ 0x%.8x - 0x%.8x ]",
-			cs, aspi->ahb_base_phy + aspi->data->min_window_size * cs,
-			aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1);
+		dev_dbg(aspi->dev, "CE%d default window [ 0x%.9llx - 0x%.9llx ]",
+			cs, (u64)(aspi->ahb_base_phy + aspi->data->min_window_size * cs),
+			(u64)(aspi->ahb_base_phy + aspi->data->min_window_size * cs - 1));
 	}
 
 	/* Close unused CS */
@@ -930,17 +931,18 @@ static void aspeed_spi_remove(struct platform_device *pdev)
  * The address range is encoded with absolute addresses in the overall
  * mapping window.
  */
-static u32 aspeed_spi_segment_start(struct aspeed_spi *aspi, u32 reg)
+static phys_addr_t aspeed_spi_segment_start(struct aspeed_spi *aspi, u32 reg)
 {
 	return ((reg >> 16) & 0xFF) << 23;
 }
 
-static u32 aspeed_spi_segment_end(struct aspeed_spi *aspi, u32 reg)
+static phys_addr_t aspeed_spi_segment_end(struct aspeed_spi *aspi, u32 reg)
 {
 	return ((reg >> 24) & 0xFF) << 23;
 }
 
-static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi, u32 start, u32 end)
+static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi,
+				  phys_addr_t start, phys_addr_t end)
 {
 	return (((start >> 23) & 0xFF) << 16) | (((end >> 23) & 0xFF) << 24);
 }
@@ -952,16 +954,16 @@ static u32 aspeed_spi_segment_reg(struct aspeed_spi *aspi, u32 start, u32 end)
 
 #define AST2600_SEG_ADDR_MASK 0x0ff00000
 
-static u32 aspeed_spi_segment_ast2600_start(struct aspeed_spi *aspi,
-					    u32 reg)
+static phys_addr_t aspeed_spi_segment_ast2600_start(struct aspeed_spi *aspi,
+						    u32 reg)
 {
 	u32 start_offset = (reg << 16) & AST2600_SEG_ADDR_MASK;
 
 	return aspi->ahb_base_phy + start_offset;
 }
 
-static u32 aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
-					  u32 reg)
+static phys_addr_t aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
+						  u32 reg)
 {
 	u32 end_offset = reg & AST2600_SEG_ADDR_MASK;
 
@@ -973,7 +975,7 @@ static u32 aspeed_spi_segment_ast2600_end(struct aspeed_spi *aspi,
 }
 
 static u32 aspeed_spi_segment_ast2600_reg(struct aspeed_spi *aspi,
-					  u32 start, u32 end)
+					  phys_addr_t start, phys_addr_t end)
 {
 	/* disable zero size segments */
 	if (start == end)
-- 
2.34.1


