Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 837392F0AA9
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 01:54:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDZwJ4w4SzDqW1
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 11:54:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Oqvs7c1b; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDZvK39XKzDqSV
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:53:15 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id 19so13388142qkm.8
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 16:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yz2PVN6AgL9F8n+LUy48tMzsfVu40zQm6rxYgi36wTo=;
 b=Oqvs7c1bkOKDCQaUx5UZye0QYwmCm9yw3pg79de9KH9Nv6WgJAmQd2hCcj/RouC0EQ
 M8tlXUbOMpGhBtZJLdlqhqdFSFE7C9d1BzCHaAlQgxWUQNzj35j0fmuPSCp6M2UWK+2h
 oWqHLhZ8Ln3hFZELe9w5H4R1ITiKcFsburgkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yz2PVN6AgL9F8n+LUy48tMzsfVu40zQm6rxYgi36wTo=;
 b=VHxtKR8mNLb38bBkGOicqSj0NAON75j8PdBcvozs19C/byjy019KcmTziisKwMimEs
 uLEnOQTFUSg1+IaXdFImR9G4UH51Zd8pbYOiaM4xFQ8eEw3D0zP5s/Aec4A1pxcGgnsq
 xpuOK/i459mVt5sx9pkAKtK80HsHdgpvx1P8iyR5ikpQiwbcxcl0ZB0VUQ2JPr2GxyqN
 9ROdSzzooCj7ZAZKqWfLGXa8TOJ5/ZMdr/7LoQeafzyx7a8b+PkEOy9K4k56sp+Iljoq
 eTR/wbrYIvZ/WfvumMRu9XW2KROY4Z4eKzAo0jIILbeJ2iXOW4DNK/YDaj8ApUJ8xcwn
 v3Rg==
X-Gm-Message-State: AOAM530swaxrDWgfTvCEIMUClMtg234L2AVkr/fCpbgILMjZDYbIURWR
 rkDb+pkNlrFoCG+nR2qrBsjb9jSmlbYue9N6f70=
X-Google-Smtp-Source: ABdhPJx8thy2hdNsZbPshLoxOL6GTSOKEylBGaxgv1Z2LuHnIDa7KBy0MBNk9vKaYgvLIc1pxsmM+BgHER6K8PvW/uQ=
X-Received: by 2002:a37:6790:: with SMTP id
 b138mr14136637qkc.465.1610326390747; 
 Sun, 10 Jan 2021 16:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-3-tmaimon77@gmail.com>
In-Reply-To: <20210105134508.225702-3-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 00:52:58 +0000
Message-ID: <CACPK8Xct-EWMPa7AKokgVYqqdX7fbTFXk0wdnD5nFyL43=rBUw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 02/11] iio: adc: add calibration support
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

On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add calibration to improve accuracy measurement when using
> internal referance voltage.

reference

>
> the calibration values taken from the FUSE module.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

I recommend taking a look at the proposed device tree changes before
we merge this one, so we don't have an incompatibility between future
code and device tree.

> ---
>  drivers/iio/adc/npcm_adc.c | 191 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 191 insertions(+)
>
> diff --git a/drivers/iio/adc/npcm_adc.c b/drivers/iio/adc/npcm_adc.c
> index 83bad2d5575d..02628b7eaca1 100644
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
> @@ -51,6 +53,40 @@ struct npcm_adc {
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
> +#define FUSE_READ_TIMEOUT      0xDEADBEEF
> +
>  #define NPCM_ADC_CHAN(ch) {                                    \
>         .type = IIO_VOLTAGE,                                    \
>         .indexed = 1,                                           \
> @@ -71,6 +107,133 @@ static const struct iio_chan_spec npcm_adc_iio_channels[] = {
>         NPCM_ADC_CHAN(7),
>  };
>
> +static int npcm750_fuse_wait_for_ready(struct regmap *fuse_regmap, u32 timeout)
> +{
> +       u32 time = timeout;
> +       u32 fstreg;
> +
> +       while (--time > 1) {
> +               regmap_read(fuse_regmap, NPCM7XX_FST, &fstreg);

regmap_read_poll_timeout

> +               if (fstreg & NPCM7XX_FST_RDY) {
> +                       regmap_write_bits(fuse_regmap, NPCM7XX_FST,
> +                                         NPCM7XX_FST_RDST, NPCM7XX_FST_RDST);
> +                       return 0;
> +               }
> +       }
> +
> +       /* try to clear the status in case it was set */
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FST, NPCM7XX_FST_RDST,
> +                         NPCM7XX_FST_RDST);
> +
> +       return -EINVAL;
> +}
> +
> +static void npcm750_fuse_read(struct regmap *fuse_regmap, u32 addr, u8 *data)
> +{
> +       u32 val;
> +
> +       npcm750_fuse_wait_for_ready(fuse_regmap, FUSE_READ_TIMEOUT);

This ignores the time out.

> +
> +       regmap_write_bits(fuse_regmap, NPCM7XX_FADDR,
> +                         NPCM7XX_FADDR_BYTEADDR_MASK, addr);
> +       regmap_read(fuse_regmap, NPCM7XX_FADDR, &val);
> +       regmap_write(fuse_regmap, NPCM7XX_FCTL, NPCM7XX_FCTL_RDST);
> +
> +       npcm750_fuse_wait_for_ready(fuse_regmap, FUSE_READ_TIMEOUT);

...as does this.

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
> +                                       struct npcm_adc *info)
> +{
> +       struct device_node *np = pdev->dev.of_node;
> +       struct regmap *fuse_regmap;
> +       ssize_t bytes_read = 0;
> +       u8 read_buf[8];
> +       u32 ADC_calib;
> +       u32 addr = FUSE_CALIB_ADDR;
> +
> +       if (of_device_is_compatible(np, "nuvoton,npcm750-adc")) {

This will always be true.

> +               fuse_regmap = syscon_regmap_lookup_by_compatible
> +                       ("nuvoton,npcm750-fuse");

If you use a phandle to the fuse node, you can have the one code base
support multiple families of chips. Use
syscon_regmap_lookup_by_phandle(np, "syscon")

and in your device tree:

                        adc: adc@c000 {
                                compatible = "nuvoton,npcm750-adc";
                                reg = <0xc000 0x8>;
                                interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
                                clocks = <&clk NPCM7XX_CLK_ADC>;
                                resets = <&rstc NPCM7XX_RESET_IPSRST1
NPCM7XX_RESET_ADC>;
                                syscon = <&fuse_syscon>;
                        };


> +               if (IS_ERR(fuse_regmap)) {
> +                       dev_warn(&pdev->dev, "Failed to find nuvoton,npcm750-fuse\n");
> +                       return PTR_ERR(fuse_regmap);
> +               }
> +
> +               while (bytes_read < FUSE_CALIB_SIZE) {
> +                       npcm750_fuse_read(fuse_regmap, addr,
> +                                         &read_buf[bytes_read]);
> +                       bytes_read++;
> +                       addr++;
> +               }
> +
> +               if (npcm750_read_nibble_parity(read_buf, (u8 *)&ADC_calib)) {
> +                       dev_warn(info->dev, "FUSE Clibration read failed\n");

calibration

> +                       return -EINVAL;
> +               }
> +
> +               info->R05 = ADC_calib & 0xFFFF;
> +               info->R15 = ADC_calib >> 16;
> +       }
> +
> +       return 0;
> +}
> +
>  static irqreturn_t npcm_adc_isr(int irq, void *data)
>  {
>         u32 regtemp;
> @@ -125,6 +288,29 @@ static int npcm_adc_read(struct npcm_adc *info, int *val, u8 channel)
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
> @@ -142,6 +328,10 @@ static int npcm_adc_read_raw(struct iio_dev *indio_dev,
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
> @@ -248,6 +438,7 @@ static int npcm_adc_probe(struct platform_device *pdev)
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
