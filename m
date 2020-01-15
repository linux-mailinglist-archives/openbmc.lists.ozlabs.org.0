Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A146D13CAB9
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 18:15:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yYqQ49KxzDqTg
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 04:15:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yYg95jV2zDqBc
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:08:04 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 00FGN4i7021584;
 Wed, 15 Jan 2020 18:23:04 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id C265E60328; Wed, 15 Jan 2020 18:23:04 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v1 4/4] spi: npcm-pspi: modify reset support
Date: Wed, 15 Jan 2020 18:23:01 +0200
Message-Id: <20200115162301.235926-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200115162301.235926-1-tmaimon77@gmail.com>
References: <20200115162301.235926-1-tmaimon77@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Modify NPCM perphiral SPI reset support from
direct register access to reset controller support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index eac7ba18b4b9..87cd0233c60b 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -12,6 +12,7 @@
 #include <linux/spi/spi.h>
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
+#include <linux/reset.h>
 
 #include <asm/unaligned.h>
 
@@ -20,7 +21,7 @@
 
 struct npcm_pspi {
 	struct completion xfer_done;
-	struct regmap *rst_regmap;
+	struct reset_control *reset;
 	struct spi_master *master;
 	unsigned int tx_bytes;
 	unsigned int rx_bytes;
@@ -59,12 +60,6 @@ struct npcm_pspi {
 #define NPCM_PSPI_MIN_CLK_DIVIDER	4
 #define NPCM_PSPI_DEFAULT_CLK		25000000
 
-/* reset register */
-#define NPCM7XX_IPSRST2_OFFSET	0x24
-
-#define NPCM7XX_PSPI1_RESET	BIT(22)
-#define NPCM7XX_PSPI2_RESET	BIT(23)
-
 static inline unsigned int bytes_per_word(unsigned int bits)
 {
 	return bits <= 8 ? 1 : 2;
@@ -293,9 +288,9 @@ static int npcm_pspi_unprepare_transfer_hardware(struct spi_master *master)
 
 static void npcm_pspi_reset_hw(struct npcm_pspi *priv)
 {
-	regmap_write(priv->rst_regmap, NPCM7XX_IPSRST2_OFFSET,
-		     NPCM7XX_PSPI1_RESET << priv->id);
-	regmap_write(priv->rst_regmap, NPCM7XX_IPSRST2_OFFSET, 0x0);
+	reset_control_assert(priv->reset);
+	udelay(5);
+	reset_control_deassert(priv->reset);
 }
 
 static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
@@ -359,10 +354,6 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	if (num_cs < 0)
 		return num_cs;
 
-	pdev->id = of_alias_get_id(np, "spi");
-	if (pdev->id < 0)
-		pdev->id = 0;
-
 	master = spi_alloc_master(&pdev->dev, sizeof(*priv));
 	if (!master)
 		return -ENOMEM;
@@ -372,7 +363,6 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	priv = spi_master_get_devdata(master);
 	priv->master = master;
 	priv->is_save_param = false;
-	priv->id = pdev->id;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
@@ -397,11 +387,10 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 		goto out_disable_clk;
 	}
 
-	priv->rst_regmap =
-		syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
-	if (IS_ERR(priv->rst_regmap)) {
-		dev_err(&pdev->dev, "failed to find nuvoton,npcm750-rst\n");
-		return PTR_ERR(priv->rst_regmap);
+	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->reset)) {
+		ret = PTR_ERR(priv->reset);
+		goto out_disable_clk;
 	}
 
 	/* reset SPI-HW block */
@@ -422,7 +411,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	master->min_speed_hz = DIV_ROUND_UP(clk_hz, NPCM_PSPI_MAX_CLK_DIVIDER);
 	master->mode_bits = SPI_CPHA | SPI_CPOL;
 	master->dev.of_node = pdev->dev.of_node;
-	master->bus_num = pdev->id;
+	master->bus_num = -1;
 	master->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
 	master->transfer_one = npcm_pspi_transfer_one;
 	master->prepare_transfer_hardware =
@@ -455,7 +444,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_disable_clk;
 
-	pr_info("NPCM Peripheral SPI %d probed\n", pdev->id);
+	pr_info("NPCM Peripheral SPI %d probed\n", master->bus_num);
 
 	return 0;
 
-- 
2.22.0

