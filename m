Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A9600A46
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 11:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrWcg3S19z3drn
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 20:18:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWb15rf7z3cBS;
	Mon, 17 Oct 2022 20:16:45 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MrWb13WWgz4xGm;
	Mon, 17 Oct 2022 20:16:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrWZx343vz4wgv;
	Mon, 17 Oct 2022 20:16:41 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH linux v2 2/3] spi: aspeed: Handle custom decoding ranges
Date: Mon, 17 Oct 2022 11:16:23 +0200
Message-Id: <20221017091624.130227-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017091624.130227-1-clg@kaod.org>
References: <20221017091624.130227-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Naresh Solanki <naresh.solanki@9elements.com>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The "ranges" property predefines settings for the decoding ranges of
each CS. If found in the DT, the driver applies the settings at probe
time. The default behavior is to set the decoding range of each CS
using the flash device size when the spi slave is setup.

Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 65 +++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index b90571396a60..75e1d08bbd00 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -96,6 +96,7 @@ struct aspeed_spi {
 	u32			 ahb_base_phy;
 	u32			 ahb_window_size;
 	struct device		*dev;
+	bool                     fixed_windows;
 
 	struct clk		*clk;
 	u32			 clk_freq;
@@ -382,6 +383,7 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
 
 struct aspeed_spi_window {
 	u32 cs;
+	u32 reg;
 	u32 offset;
 	u32 size;
 };
@@ -396,6 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		reg_val = readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
 		windows[cs].cs = cs;
+		windows[cs].reg = reg_val;
 		windows[cs].size = data->segment_end(aspi, reg_val) -
 			data->segment_start(aspi, reg_val);
 		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
@@ -572,7 +575,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	if (op->data.dir != SPI_MEM_DATA_IN)
 		return -EOPNOTSUPP;
 
-	aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.length);
+	if (!aspi->fixed_windows)
+		aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.length);
 
 	if (desc->info.length > chip->ahb_window_size)
 		dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
@@ -712,6 +716,61 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
 		aspeed_spi_chip_enable(aspi, cs, enable);
 }
 
+static int aspeed_spi_chip_read_ranges(struct device_node *node, struct aspeed_spi *aspi)
+{
+	const char *range_prop = "ranges";
+	struct property *prop;
+	struct aspeed_spi_window ranges[ASPEED_SPI_MAX_NUM_CS];
+	int prop_size;
+	int count;
+	int ret;
+	int i;
+
+	prop = of_find_property(node, range_prop, &prop_size);
+	if (!prop)
+		return 0;
+
+	count = prop_size / sizeof(*ranges);
+	if (count > aspi->data->max_cs) {
+		dev_err(aspi->dev, "invalid '%s' property %d\n", range_prop, count);
+		return -EINVAL;
+	}
+
+	if (count < aspi->data->max_cs)
+		dev_dbg(aspi->dev, "'%s' property does not cover all CE\n",
+			range_prop);
+
+	ret = of_property_read_u32_array(node, range_prop, (u32 *)ranges, count * 4);
+	if (ret)
+		return ret;
+
+	dev_info(aspi->dev, "Using preset decoding ranges\n");
+	for (i = 0; i < count; i++) {
+		struct aspeed_spi_window *win = &ranges[i];
+
+		if (win->cs > aspi->data->max_cs) {
+			dev_err(aspi->dev, "CE%d range is invalid", win->cs);
+			return -EINVAL;
+		}
+
+		/* Trim top bit of the address to keep offset */
+		win->offset &= aspi->ahb_window_size - 1;
+
+		/* Minimal check */
+		if (win->offset + win->size > aspi->ahb_window_size) {
+			dev_warn(aspi->dev, "CE%d range is too large", win->cs);
+				return -EINVAL;
+		}
+
+		ret = aspeed_spi_set_window(aspi, win);
+		if (ret)
+			return ret;
+	}
+
+	aspi->fixed_windows = true;
+	return 0;
+}
+
 static int aspeed_spi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -767,6 +826,10 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = aspeed_spi_chip_read_ranges(dev->of_node, aspi);
+	if (ret)
+		return ret;
+
 	/* IRQ is for DMA, which the driver doesn't support yet */
 
 	ctlr->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | data->mode_bits;
-- 
2.37.3

