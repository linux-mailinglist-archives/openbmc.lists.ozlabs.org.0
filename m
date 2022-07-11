Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815FF570495
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 15:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQ8v2yY9z3c4k
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 23:44:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQ8513skz3byT
	for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 23:43:29 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26BDhNXn002859
	for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 16:43:23 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 11 Jul
 2022 16:43:22 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 11 Jul
 2022 21:43:20 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 11 Jul 2022 21:43:20 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 81BDA63A23; Mon, 11 Jul 2022 16:43:19 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <jic23@kernel.org>, <lars@metafoo.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <j.neuschaefer@gmx.net>,
        <zhengbin13@huawei.com>
Subject: [PATCH v1 2/2] iio: adc: npcm: Add NPCM8XX support
Date: Mon, 11 Jul 2022 16:43:11 +0300
Message-ID: <20220711134312.234268-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220711134312.234268-1-tmaimon77@gmail.com>
References: <20220711134312.234268-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding ADC NPCM8XX support to NPCM ADC driver.
ADC NPCM8XX uses a different resolution and voltage reference.

As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Add data to handle architecture-specific ADC parameters.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/iio/adc/npcm_adc.c | 39 ++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index f7bc0bb7f112..efacba256056 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -16,6 +16,12 @@
 #include <linux/uaccess.h>
 #include <linux/reset.h>
 
+struct npcm_adc_info {
+	u32 data_mask;
+	u32 internal_vref;
+	u32 res_bits;
+};
+
 struct npcm_adc {
 	bool int_status;
 	u32 adc_sample_hz;
@@ -34,6 +40,7 @@ struct npcm_adc {
 	 * has finished.
 	 */
 	struct mutex lock;
+	struct npcm_adc_info *data;
 };
 
 /* ADC registers */
@@ -52,13 +59,21 @@ struct npcm_adc {
 #define NPCM_ADCCON_CH(x)		((x) << 24)
 #define NPCM_ADCCON_DIV_SHIFT		1
 #define NPCM_ADCCON_DIV_MASK		GENMASK(8, 1)
-#define NPCM_ADC_DATA_MASK(x)		((x) & GENMASK(9, 0))
 
 #define NPCM_ADC_ENABLE		(NPCM_ADCCON_ADC_EN | NPCM_ADCCON_ADC_INT_EN)
 
 /* ADC General Definition */
-#define NPCM_RESOLUTION_BITS		10
-#define NPCM_INT_VREF_MV		2000
+static const struct npcm_adc_info npxm7xx_adc_info = {
+	.data_mask = GENMASK(9, 0),
+	.internal_vref = 2048,
+	.res_bits = 10,
+};
+
+static const struct npcm_adc_info npxm8xx_adc_info = {
+	.data_mask = GENMASK(11, 0),
+	.internal_vref = 1229,
+	.res_bits = 12,
+};
 
 #define NPCM_ADC_CHAN(ch) {					\
 	.type = IIO_VOLTAGE,					\
@@ -129,7 +144,8 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
 	if (ret < 0)
 		return ret;
 
-	*val = NPCM_ADC_DATA_MASK(ioread32(info->regs + NPCM_ADCDATA));
+	*val = ioread32(info->regs + NPCM_ADCDATA);
+	*val &= info->data->data_mask;
 
 	return 0;
 }
@@ -157,9 +173,9 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
 			vref_uv = regulator_get_voltage(info->vref);
 			*val = vref_uv / 1000;
 		} else {
-			*val = NPCM_INT_VREF_MV;
+			*val = info->data->internal_vref;
 		}
-		*val2 = NPCM_RESOLUTION_BITS;
+		*val2 = info->data->res_bits;
 		return IIO_VAL_FRACTIONAL_LOG2;
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		*val = info->adc_sample_hz;
@@ -176,7 +192,8 @@ static const struct iio_info npcm_adc_iio_info = {
 };
 
 static const struct of_device_id npcm_adc_match[] = {
-	{ .compatible = "nuvoton,npcm750-adc", },
+	{ .compatible = "nuvoton,npcm750-adc", .data = &npxm7xx_adc_info},
+	{ .compatible = "nuvoton,npcm845-adc", .data = &npxm8xx_adc_info},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, npcm_adc_match);
@@ -190,14 +207,20 @@ static int npcm_adc_probe(struct platform_device *pdev)
 	struct npcm_adc *info;
 	struct iio_dev *indio_dev;
 	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
 	if (!indio_dev)
 		return -ENOMEM;
 	info = iio_priv(indio_dev);
 
-	mutex_init(&info->lock);
+	match = of_match_node(npcm_adc_match, pdev->dev.of_node);
+	if (!match || !match->data) {
+		dev_err(dev, "Failed getting npcm_adc_data\n");
+		return -ENODEV;
+	}
 
+	info->data = (struct npcm_adc_info *)match->data;
 	info->dev = &pdev->dev;
 
 	info->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.33.0

