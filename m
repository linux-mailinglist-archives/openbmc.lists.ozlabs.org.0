Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF82F72D9
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 07:26:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHB6451dzzDq8g
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 17:26:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KXfMmJZl; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHB5D1ky9zDsWr
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 17:25:51 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id p14so10782095qke.6
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 22:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9svHIDFfkqg3vBL0PSY10zvtS0CBylZdPEzbtosMAtk=;
 b=KXfMmJZleZUiHZzU56m76sU6zrxCcfipLKNOEtTs4DEXjbILn2XEVadUmAzU5sJ8Se
 PE7gLD6R1vygxl7X66HmG2OZ7sJCLkPyUVhaJ6T6PFgVQ1ieEIE78648brUQUP+aZUSb
 wMI/vW1Luc4AGSGbC9oz3mree+FViKc+gfkEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9svHIDFfkqg3vBL0PSY10zvtS0CBylZdPEzbtosMAtk=;
 b=iCaC7TQXvKn+vL1gy2ESFgpCFVZks/VnRJmrUGuhxcPNpiqV/O5uTf2UI+Lo670Pku
 2FLamOArd2zTsMvXmi8JJ+2fFj7FWFN6V0AqhbOkennekBA/8sdrWB6agBOX8fb+D/Zt
 LMU7Kbr6ius/LM951LIyfvtcK8MXViGGgJhlrK2j08etTNhy2Osu/c67Hg3ohjtlGoWm
 GFeQrsvJE5B6wf4I+9ndw/8cvd0U4L4PvWTWGhBpeZ4/bi3USBvgPcBLePGxvgd0qo1q
 K+rn7Y0+YmkmnunQqScJwFqas0MyvMpuyAbN/NpqhqjKA34vGN5E8E/1Fth5JemfxR5x
 yLHA==
X-Gm-Message-State: AOAM530vBDdl1YXahoqFyqUkfYR7J3LO20MRtLcbnWDI6yr4KpCBspL9
 +DxRCNA38po073hSjgMwjIj/xxYXPFCxGcytPRE=
X-Google-Smtp-Source: ABdhPJw1R3GXtVgMFGECSShrUnkIys8caKbZE4iRDtQybAYiowc5HOFlCUcXUeR9vkdv7omCgJ4yG+D0NgBbqDC8Ouc=
X-Received: by 2002:a37:6790:: with SMTP id
 b138mr10749547qkc.465.1610691947850; 
 Thu, 14 Jan 2021 22:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20210113200010.71845-1-tmaimon77@gmail.com>
 <20210113200010.71845-4-tmaimon77@gmail.com>
In-Reply-To: <20210113200010.71845-4-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Jan 2021 06:25:35 +0000
Message-ID: <CACPK8Xc44fMUy9NKCYLi2eVU681p4A2F6r7F8OZPG+HmeYa69A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v3 03/12] iio: adc: add calibration support
 to npcm ADC
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jan 2021 at 20:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add calibration to improve accuracy measurement when using
> internal reference voltage.
>
> the calibration values taken from the FUSE module.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

When submitting this to mainline you should consider putting the fuse
reading code in it's own driver if it is to be used by other
components in your system.

> ---
>  drivers/iio/adc/npcm_adc.c | 178 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index 83bad2d5575d..081378b98fa9 100644
> --- a/drivers/iio/adc/npcm_adc.c
> +++ b/drivers/iio/adc/npcm_adc.c
> @@ -17,6 +17,8 @@
>  #include <linux/reset.h>
>
>  struct npcm_adc {
> +       u32 R05;
> +       u32 R15;
>         bool int_status;
>         u32 adc_sample_hz;
>         struct device *dev;
> @@ -51,6 +53,41 @@ struct npcm_adc {
>  #define NPCM_RESOLUTION_BITS           10
>  #define NPCM_INT_VREF_MV               2000
>
> +/* FUSE registers */
> +#define NPCM7XX_FST            0x00
> +#define NPCM7XX_FADDR          0x04
> +#define NPCM7XX_FDATA          0x08
> +#define NPCM7XX_FCFG           0x0C
> +#define NPCM7XX_FCTL           0x14
> +
> +/* FST Register Bits */
> +#define NPCM7XX_FST_RDY                BIT(0)
> +#define NPCM7XX_FST_RDST       BIT(1)
> +
> +/* FADDR Register Bits */
> +#define NPCM7XX_FADDR_BYTEADDR         BIT(0)
> +#define NPCM7XX_FADDR_BYTEADDR_MASK    GENMASK(9, 0)
> +
> +/* FADDR Register Bits */
> +#define NPCM7XX_FDATA_DATA             BIT(0)
> +#define NPCM7XX_FDATA_CLEAN_VALUE      BIT(1)
> +#define NPCM7XX_FDATA_DATA_MASK                GENMASK(7, 0)
> +
> +/* FCTL Register Bits */
> +#define NPCM7XX_FCTL_RDST              BIT(1)
> +
> +/* ADC Calibration Definition */
> +#define NPCM_INT_1500MV                768
> +#define NPCM_INT_1000MV                512
> +#define NPCM_ADC_MIN_VAL       0
> +#define NPCM_ADC_MAX_VAL       1023
> +
> +#define FUSE_CALIB_ADDR                24
> +#define FUSE_CALIB_SIZE                8
> +#define DATA_CALIB_SIZE                4
> +#define FUSE_READ_SLEEP                500
> +#define FUSE_READ_TIMEOUT      1000000
> +
>  #define NPCM_ADC_CHAN(ch) {                                    \
>         .type = IIO_VOLTAGE,                                    \
>         .indexed = 1,                                           \
> @@ -71,6 +108,119 @@ static const struct iio_chan_spec npcm_adc_iio_channels[] = {
>         NPCM_ADC_CHAN(7),
>  };
>
> +static void npcm750_fuse_read(struct regmap *fuse_regmap, u32 addr, u8 *data)
> +{
> +       u32 val;
> +       u32 fstreg;
> +
> +       regmap_read_poll_timeout(fuse_regmap, NPCM7XX_FST, fstreg,
> +                                fstreg & NPCM7XX_FST_RDY, FUSE_READ_SLEEP,
> +                                FUSE_READ_TIMEOUT);
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FST,
> +                         NPCM7XX_FST_RDST, NPCM7XX_FST_RDST);
> +
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FADDR,
> +                         NPCM7XX_FADDR_BYTEADDR_MASK, addr);
> +       regmap_read(fuse_regmap, NPCM7XX_FADDR, &val);
> +       regmap_write(fuse_regmap, NPCM7XX_FCTL, NPCM7XX_FCTL_RDST);
> +
> +       regmap_read_poll_timeout(fuse_regmap, NPCM7XX_FST, fstreg,
> +                                fstreg & NPCM7XX_FST_RDY, FUSE_READ_SLEEP,
> +                                FUSE_READ_TIMEOUT);
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FST,
> +                         NPCM7XX_FST_RDST, NPCM7XX_FST_RDST);
> +
> +       regmap_read(fuse_regmap, NPCM7XX_FDATA, &val);
> +       *data = (u8)val;
> +
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FDATA, NPCM7XX_FDATA_DATA_MASK,
> +                         NPCM7XX_FDATA_CLEAN_VALUE);
> +}
> +
> +static int npcm750_ECC_to_nibble(u8 ECC, u8 nibble)
> +{
> +       u8 nibble_b0 = (nibble >> 0) & BIT(0);
> +       u8 nibble_b1 = (nibble >> 1) & BIT(0);
> +       u8 nibble_b2 = (nibble >> 2) & BIT(0);
> +       u8 nibble_b3 = (nibble >> 3) & BIT(0);
> +       u8 tmp_ECC = nibble;
> +
> +       tmp_ECC |= (nibble_b0 ^ nibble_b1) << 4 | (nibble_b2 ^ nibble_b3) << 5 |
> +               (nibble_b0 ^ nibble_b2) << 6  | (nibble_b1 ^ nibble_b3) << 7;
> +
> +       if (tmp_ECC != ECC)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static int npcm750_ECC_to_byte(u16 ECC, u8 *Byte)
> +{
> +       u8 nibble_L, nibble_H;
> +       u8 ECC_L, ECC_H;
> +
> +       ECC_H = ECC >> 8;
> +       nibble_H = ECC_H & 0x0F;
> +       ECC_L = ECC >> 0;
> +       nibble_L = ECC_L & 0x0F;
> +
> +       if (npcm750_ECC_to_nibble(ECC_H, nibble_H) != 0 ||
> +           npcm750_ECC_to_nibble(ECC_L, nibble_L) != 0)
> +               return -EINVAL;
> +
> +       *Byte = nibble_H << 4 | nibble_L << 0;
> +
> +       return 0;
> +}
> +
> +static int npcm750_read_nibble_parity(u8 *block_ECC, u8 *ADC_calib)
> +{
> +       int i;
> +       u16 ECC;
> +
> +       for (i = 0; i < DATA_CALIB_SIZE; i++) {
> +               memcpy(&ECC, block_ECC + (i * 2), 2);
> +               if (npcm750_ECC_to_byte(ECC, &ADC_calib[i]) != 0)
> +                       return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int npcm750_fuse_calibration_read(struct platform_device *pdev,
> +                                        struct npcm_adc *info)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct regmap *fuse_regmap;
> +       ssize_t bytes_read = 0;
> +       u8 read_buf[8];
> +       u32 ADC_calib;
> +       u32 addr = FUSE_CALIB_ADDR;
> +
> +       fuse_regmap = syscon_regmap_lookup_by_phandle(np, "syscon");
> +       if (IS_ERR(fuse_regmap)) {
> +               dev_warn(&pdev->dev, "Failed to find syscon\n");
> +               return PTR_ERR(fuse_regmap);
> +       }
> +
> +       while (bytes_read < FUSE_CALIB_SIZE) {
> +               npcm750_fuse_read(fuse_regmap, addr,
> +                                 &read_buf[bytes_read]);
> +               bytes_read++;
> +               addr++;
> +       }
> +
> +       if (npcm750_read_nibble_parity(read_buf, (u8 *)&ADC_calib)) {
> +               dev_warn(info->dev, "FUSE Calibration read failed\n");
> +               return -EINVAL;
> +       }
> +
> +       info->R05 = ADC_calib & 0xFFFF;
> +       info->R15 = ADC_calib >> 16;
> +
> +       return 0;
> +}
> +
>  static irqreturn_t npcm_adc_isr(int irq, void *data)
>  {
>         u32 regtemp;
> @@ -125,6 +275,29 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
>         return 0;
>  }
>
> +static void npcm_adc_calibration(int *val, struct npcm_adc *info)
> +{
> +       int mul_val;
> +       int offset_val;
> +
> +       mul_val = NPCM_INT_1000MV * (*val - info->R15);
> +       if (mul_val < 0) {
> +               mul_val = mul_val * -1;
> +               offset_val = DIV_ROUND_CLOSEST(mul_val,
> +                                              (info->R15 - info->R05));
> +               *val = NPCM_INT_1500MV - offset_val;
> +       } else {
> +               offset_val = DIV_ROUND_CLOSEST(mul_val,
> +                                              (info->R15 - info->R05));
> +               *val = NPCM_INT_1500MV + offset_val;
> +       }
> +
> +       if (*val < NPCM_ADC_MIN_VAL)
> +               *val = NPCM_ADC_MIN_VAL;
> +       if (*val > NPCM_ADC_MAX_VAL)
> +               *val = NPCM_ADC_MAX_VAL;
> +}
> +
>  static int npcm_adc_read_raw(struct iio_dev *indio_dev,
>                              struct iio_chan_spec const *chan, int *val,
>                              int *val2, long mask)
> @@ -142,6 +315,10 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
>                         dev_err(info->dev, "NPCM ADC read failed\n");
>                         return ret;
>                 }
> +
> +               if ((info->R05 || info->R15) && IS_ERR(info->vref))
> +                       npcm_adc_calibration(val, info);
> +
>                 return IIO_VAL_INT;
>         case IIO_CHAN_INFO_SCALE:
>                 if (!IS_ERR(info->vref)) {
> @@ -248,6 +425,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
>                           info->regs + NPCM_ADCCON);
>         }
>
> +       npcm750_fuse_calibration_read(pdev, info);
>         init_waitqueue_head(&info->wq);
>
>         reg_con = ioread32(info->regs + NPCM_ADCCON);
> --
> 2.22.0
>
