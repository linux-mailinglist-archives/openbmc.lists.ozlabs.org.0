Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2259150942
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 16:11:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BB9Q3fFlzDqMC
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 02:11:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BB8J41RPzDqKw
 for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2020 02:10:02 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 013F9JW7001610;
 Mon, 3 Feb 2020 17:09:19 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id BB3D46032F; Mon,  3 Feb 2020 17:09:19 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
 robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v2 2/2] iio: adc: modify NPCM reset support
Date: Mon,  3 Feb 2020 17:09:17 +0200
Message-Id: <20200203150917.176391-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200203150917.176391-1-tmaimon77@gmail.com>
References: <20200203150917.176391-1-tmaimon77@gmail.com>
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Modify NPCM ADC reset support from
direct register access to reset controller support.

please make sure to modify NPCM adc device tree
parameters as described at nuvoton,npcm-adc.txt
document for using this change.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/iio/adc/npcm_adc.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index a6170a37ebe8..83bad2d5575d 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
+#include <linux/reset.h>
 
 struct npcm_adc {
 	bool int_status;
@@ -23,13 +24,9 @@ struct npcm_adc {
 	struct clk *adc_clk;
 	wait_queue_head_t wq;
 	struct regulator *vref;
-	struct regmap *rst_regmap;
+	struct reset_control *reset;
 };
 
-/* NPCM7xx reset module */
-#define NPCM7XX_IPSRST1_OFFSET		0x020
-#define NPCM7XX_IPSRST1_ADC_RST		BIT(27)
-
 /* ADC registers */
 #define NPCM_ADCCON	 0x00
 #define NPCM_ADCDATA	 0x04
@@ -106,13 +103,11 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
 					       msecs_to_jiffies(10));
 	if (ret == 0) {
 		regtemp = ioread32(info->regs + NPCM_ADCCON);
-		if ((regtemp & NPCM_ADCCON_ADC_CONV) && info->rst_regmap) {
+		if (regtemp & NPCM_ADCCON_ADC_CONV) {
 			/* if conversion failed - reset ADC module */
-			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
-				     NPCM7XX_IPSRST1_ADC_RST);
+			reset_control_assert(info->reset);
 			msleep(100);
-			regmap_write(info->rst_regmap, NPCM7XX_IPSRST1_OFFSET,
-				     0x0);
+			reset_control_deassert(info->reset);
 			msleep(100);
 
 			/* Enable ADC and start conversion module */
@@ -186,7 +181,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	struct npcm_adc *info;
 	struct iio_dev *indio_dev;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = pdev->dev.of_node;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
 	if (!indio_dev)
@@ -199,6 +193,10 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
+	info->reset = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(info->reset))
+		return PTR_ERR(info->reset);
+
 	info->adc_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(info->adc_clk)) {
 		dev_warn(&pdev->dev, "ADC clock failed: can't read clk\n");
@@ -211,16 +209,6 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	div = div >> NPCM_ADCCON_DIV_SHIFT;
 	info->adc_sample_hz = clk_get_rate(info->adc_clk) / ((div + 1) * 2);
 
-	if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {
-		info->rst_regmap = syscon_regmap_lookup_by_compatible
-			("nuvoton,npcm750-rst");
-		if (IS_ERR(info->rst_regmap)) {
-			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-rst\n");
-			ret = PTR_ERR(info->rst_regmap);
-			goto err_disable_clk;
-		}
-	}
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
 		ret = -EINVAL;
-- 
2.22.0

