Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0D586D40
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 16:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLdL2rdzz2y2B
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 00:50:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLcZ16bTz2yZc
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 00:49:32 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271EnLGv024208
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 17:49:22 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 17:49:21 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 1 Aug 2022
 22:49:19 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 22:49:19 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 68CBA62EFF; Mon,  1 Aug 2022 17:49:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 2/7] iio: adc: npcm: Add NPCM8XX support
Date: Mon, 1 Aug 2022 17:49:09 +0300
Message-ID: <20220801144914.126075-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801144914.126075-1-tmaimon77@gmail.com>
References: <20220801144914.126075-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding ADC NPCM8XX support to NPCM ADC driver.
ADC NPCM8XX uses a different resolution and voltage reference.

As part of adding NPCM8XX support:
- Add NPCM8XX specific compatible string.
- Add data to handle architecture-specific ADC parameters.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/iio/adc/npcm_adc.c | 147 ++++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 60 deletions(-)

diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
index 62c1ef40b519..d1828e6f630c 100644
--- a/drivers/iio/adc/npcm_adc.c
+++ b/drivers/iio/adc/npcm_adc.c
@@ -16,6 +16,16 @@
 #include <linux/uaccess.h>
 #include <linux/reset.h>
 
+struct npcm_adc_info {
+	u32 data_mask;
+	u32 internal_vref;
+	u32 res_bits;
+	u32 min_val;
+	u32 max_val;
+	u32 const_r1;
+	u32 const_r2;
+};
+
 struct npcm_adc {
 	u32 R05;
 	u32 R15;
@@ -36,6 +46,7 @@ struct npcm_adc {
 	 * has finished.
 	 */
 	struct mutex lock;
+	const struct npcm_adc_info *data;
 };
 
 /* ADC registers */
@@ -54,49 +65,59 @@ struct npcm_adc {
 #define NPCM_ADCCON_CH(x)		((x) << 24)
 #define NPCM_ADCCON_DIV_SHIFT		1
 #define NPCM_ADCCON_DIV_MASK		GENMASK(8, 1)
-#define NPCM_ADC_DATA_MASK(x)		((x) & GENMASK(9, 0))
 
 #define NPCM_ADC_ENABLE		(NPCM_ADCCON_ADC_EN | NPCM_ADCCON_ADC_INT_EN)
 
-/* ADC General Definition */
-#define NPCM_RESOLUTION_BITS		10
-#define NPCM_INT_VREF_MV		2000
-
 /* FUSE registers */
-#define NPCM7XX_FST		0x00
-#define NPCM7XX_FADDR		0x04
-#define NPCM7XX_FDATA		0x08
-#define NPCM7XX_FCFG		0x0C
-#define NPCM7XX_FCTL		0x14
+#define NPCM_FUSE_FST		0x00
+#define NPCM_FUSE_FADDR		0x04
+#define NPCM_FUSE_FDATA		0x08
+#define NPCM_FUSE_FCFG		0x0C
+#define NPCM_FUSE_FCTL		0x14
 
 /* FST Register Bits */
-#define NPCM7XX_FST_RDY		BIT(0)
-#define NPCM7XX_FST_RDST	BIT(1)
+#define NPCM_FUSE_FST_RDY	BIT(0)
+#define NPCM_FUSE_FST_RDST	BIT(1)
 
 /* FADDR Register Bits */
-#define NPCM7XX_FADDR_BYTEADDR		BIT(0)
-#define NPCM7XX_FADDR_BYTEADDR_MASK	GENMASK(9, 0)
+#define NPCM_FUSE_FADDR_BYTEADDR	BIT(0)
+#define NPCM_FUSE_FADDR_BYTEADDR_MASK	GENMASK(9, 0)
 
 /* FADDR Register Bits */
-#define NPCM7XX_FDATA_DATA		BIT(0)
-#define NPCM7XX_FDATA_CLEAN_VALUE	BIT(1)
-#define NPCM7XX_FDATA_DATA_MASK		GENMASK(7, 0)
+#define NPCM_FUSE_FDATA_DATA		BIT(0)
+#define NPCM_FUSE_FDATA_CLEAN_VALUE	BIT(1)
+#define NPCM_FUSE_FDATA_DATA_MASK	GENMASK(7, 0)
 
 /* FCTL Register Bits */
-#define NPCM7XX_FCTL_RDST		BIT(1)
+#define NPCM_FUSE_FCTL_RDST		BIT(1)
 
 /* ADC Calibration Definition */
-#define NPCM_INT_1500MV		768
-#define NPCM_INT_1000MV		512
-#define NPCM_ADC_MIN_VAL	0
-#define NPCM_ADC_MAX_VAL	1023
-
 #define FUSE_CALIB_ADDR		24
 #define FUSE_CALIB_SIZE		8
 #define DATA_CALIB_SIZE		4
 #define FUSE_READ_SLEEP		500
 #define FUSE_READ_TIMEOUT	1000000
 
+static const struct npcm_adc_info npxm7xx_adc_info = {
+	.data_mask = GENMASK(9, 0), 
+	.internal_vref = 2048,
+	.res_bits = 10,
+	.min_val = 0,
+	.max_val = 1023,
+	.const_r1 = 512,
+	.const_r2 = 768
+};
+
+static const struct npcm_adc_info npxm8xx_adc_info = {
+	.data_mask = GENMASK(11, 0), 
+	.internal_vref = 1229,
+	.res_bits = 12,
+	.min_val = 0,
+	.max_val = 4095,
+	.const_r1 = 1024,
+	.const_r2 = 3072
+};
+
 #define NPCM_ADC_CHAN(ch) {					\
 	.type = IIO_VOLTAGE,					\
 	.indexed = 1,						\
@@ -117,36 +138,36 @@ static const struct iio_chan_spec npcm_adc_iio_channels[] = {
 	NPCM_ADC_CHAN(7),
 };
 
-static void npcm750_fuse_read(struct regmap *fuse_regmap, u32 addr, u8 *data)
+static void npcm_fuse_read(struct regmap *fuse_regmap, u32 addr, u8 *data)
 {
 	u32 val;
 	u32 fstreg;
 
-	regmap_read_poll_timeout(fuse_regmap, NPCM7XX_FST, fstreg,
-				 fstreg & NPCM7XX_FST_RDY, FUSE_READ_SLEEP,
+	regmap_read_poll_timeout(fuse_regmap, NPCM_FUSE_FST, fstreg,
+				 fstreg & NPCM_FUSE_FST_RDY, FUSE_READ_SLEEP,
 				 FUSE_READ_TIMEOUT);
-	regmap_write_bits(fuse_regmap, NPCM7XX_FST,
-			  NPCM7XX_FST_RDST, NPCM7XX_FST_RDST);
+	regmap_write_bits(fuse_regmap, NPCM_FUSE_FST,
+			  NPCM_FUSE_FST_RDST, NPCM_FUSE_FST_RDST);
 
-	regmap_write_bits(fuse_regmap, NPCM7XX_FADDR,
-			  NPCM7XX_FADDR_BYTEADDR_MASK, addr);
-	regmap_read(fuse_regmap, NPCM7XX_FADDR, &val);
-	regmap_write(fuse_regmap, NPCM7XX_FCTL, NPCM7XX_FCTL_RDST);
+	regmap_write_bits(fuse_regmap, NPCM_FUSE_FADDR,
+			  NPCM_FUSE_FADDR_BYTEADDR_MASK, addr);
+	regmap_read(fuse_regmap, NPCM_FUSE_FADDR, &val);
+	regmap_write(fuse_regmap, NPCM_FUSE_FCTL, NPCM_FUSE_FCTL_RDST);
 
-	regmap_read_poll_timeout(fuse_regmap, NPCM7XX_FST, fstreg,
-				 fstreg & NPCM7XX_FST_RDY, FUSE_READ_SLEEP,
+	regmap_read_poll_timeout(fuse_regmap, NPCM_FUSE_FST, fstreg,
+				 fstreg & NPCM_FUSE_FST_RDY, FUSE_READ_SLEEP,
 				 FUSE_READ_TIMEOUT);
-	regmap_write_bits(fuse_regmap, NPCM7XX_FST,
-			  NPCM7XX_FST_RDST, NPCM7XX_FST_RDST);
+	regmap_write_bits(fuse_regmap, NPCM_FUSE_FST,
+			  NPCM_FUSE_FST_RDST, NPCM_FUSE_FST_RDST);
 
-	regmap_read(fuse_regmap, NPCM7XX_FDATA, &val);
+	regmap_read(fuse_regmap, NPCM_FUSE_FDATA, &val);
 	*data = (u8)val;
 
-	regmap_write_bits(fuse_regmap, NPCM7XX_FDATA, NPCM7XX_FDATA_DATA_MASK,
-			  NPCM7XX_FDATA_CLEAN_VALUE);
+	regmap_write_bits(fuse_regmap, NPCM_FUSE_FDATA, NPCM_FUSE_FDATA_DATA_MASK,
+			  NPCM_FUSE_FDATA_CLEAN_VALUE);
 }
 
-static int npcm750_ECC_to_nibble(u8 ECC, u8 nibble)
+static int npcm_ECC_to_nibble(u8 ECC, u8 nibble)
 {
 	u8 nibble_b0 = (nibble >> 0) & BIT(0);
 	u8 nibble_b1 = (nibble >> 1) & BIT(0);
@@ -163,7 +184,7 @@ static int npcm750_ECC_to_nibble(u8 ECC, u8 nibble)
 	return 0;
 }
 
-static int npcm750_ECC_to_byte(u16 ECC, u8 *Byte)
+static int npcm_ECC_to_byte(u16 ECC, u8 *Byte)
 {
 	u8 nibble_L, nibble_H;
 	u8 ECC_L, ECC_H;
@@ -173,8 +194,8 @@ static int npcm750_ECC_to_byte(u16 ECC, u8 *Byte)
 	ECC_L = ECC >> 0;
 	nibble_L = ECC_L & 0x0F;
 
-	if (npcm750_ECC_to_nibble(ECC_H, nibble_H) != 0 ||
-	    npcm750_ECC_to_nibble(ECC_L, nibble_L) != 0)
+	if (npcm_ECC_to_nibble(ECC_H, nibble_H) != 0 ||
+	    npcm_ECC_to_nibble(ECC_L, nibble_L) != 0)
 		return -EINVAL;
 
 	*Byte = nibble_H << 4 | nibble_L << 0;
@@ -182,21 +203,21 @@ static int npcm750_ECC_to_byte(u16 ECC, u8 *Byte)
 	return 0;
 }
 
-static int npcm750_read_nibble_parity(u8 *block_ECC, u8 *ADC_calib)
+static int npcm_read_nibble_parity(u8 *block_ECC, u8 *ADC_calib)
 {
 	int i;
 	u16 ECC;
 
 	for (i = 0; i < DATA_CALIB_SIZE; i++) {
 		memcpy(&ECC, block_ECC + (i * 2), 2);
-		if (npcm750_ECC_to_byte(ECC, &ADC_calib[i]) != 0)
+		if (npcm_ECC_to_byte(ECC, &ADC_calib[i]) != 0)
 			return -EINVAL;
 	}
 
 	return 0;
 }
 
-static int npcm750_fuse_calibration_read(struct platform_device *pdev,
+static int npcm_fuse_calibration_read(struct platform_device *pdev,
 					 struct npcm_adc *info)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -213,13 +234,13 @@ static int npcm750_fuse_calibration_read(struct platform_device *pdev,
 	}
 
 	while (bytes_read < FUSE_CALIB_SIZE) {
-		npcm750_fuse_read(fuse_regmap, addr,
+		npcm_fuse_read(fuse_regmap, addr,
 				  &read_buf[bytes_read]);
 		bytes_read++;
 		addr++;
 	}
 
-	if (npcm750_read_nibble_parity(read_buf, (u8 *)&ADC_calib)) {
+	if (npcm_read_nibble_parity(read_buf, (u8 *)&ADC_calib)) {
 		dev_warn(info->dev, "FUSE Calibration read failed\n");
 		return -EINVAL;
 	}
@@ -279,7 +300,8 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
 	if (ret < 0)
 		return ret;
 
-	*val = NPCM_ADC_DATA_MASK(ioread32(info->regs + NPCM_ADCDATA));
+	*val = ioread32(info->regs + NPCM_ADCDATA);
+	*val &= info->data->data_mask;
 
 	return 0;
 }
@@ -289,22 +311,22 @@ static void npcm_adc_calibration(int *val, struct npcm_adc *info)
 	int mul_val;
 	int offset_val;
 
-	mul_val = NPCM_INT_1000MV * (*val - info->R15);
+	mul_val = info->data->const_r1 * (*val - info->R15);
 	if (mul_val < 0) {
 		mul_val = mul_val * -1;
 		offset_val = DIV_ROUND_CLOSEST(mul_val,
 					       (info->R15 - info->R05));
-		*val = NPCM_INT_1500MV - offset_val;
+		*val = info->data->const_r2 - offset_val;
 	} else {
 		offset_val = DIV_ROUND_CLOSEST(mul_val,
 					       (info->R15 - info->R05));
-		*val = NPCM_INT_1500MV + offset_val;
+		*val = info->data->const_r2 + offset_val;
 	}
 
-	if (*val < NPCM_ADC_MIN_VAL)
-		*val = NPCM_ADC_MIN_VAL;
-	if (*val > NPCM_ADC_MAX_VAL)
-		*val = NPCM_ADC_MAX_VAL;
+	if (*val < info->data->min_val)
+		*val = info->data->min_val;
+	if (*val > info->data->max_val)
+		*val = info->data->max_val;
 }
 
 static int npcm_adc_read_raw(struct iio_dev *indio_dev,
@@ -334,9 +356,9 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
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
@@ -353,7 +375,8 @@ static const struct iio_info npcm_adc_iio_info = {
 };
 
 static const struct of_device_id npcm_adc_match[] = {
-	{ .compatible = "nuvoton,npcm750-adc", },
+	{ .compatible = "nuvoton,npcm750-adc", .data = &npxm7xx_adc_info},
+	{ .compatible = "nuvoton,npcm845-adc", .data = &npxm8xx_adc_info},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, npcm_adc_match);
@@ -373,6 +396,10 @@ static int npcm_adc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	info = iio_priv(indio_dev);
 
+	info->data = device_get_match_data(dev);
+	if (!info->data)
+		return -EINVAL;
+
 	mutex_init(&info->lock);
 
 	info->dev = &pdev->dev;
@@ -436,7 +463,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
 			  info->regs + NPCM_ADCCON);
 	}
 
-	npcm750_fuse_calibration_read(pdev, info);
+	npcm_fuse_calibration_read(pdev, info);
 	init_waitqueue_head(&info->wq);
 
 	reg_con = ioread32(info->regs + NPCM_ADCCON);
-- 
2.33.0

