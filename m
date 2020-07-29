Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3A123281F
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:34:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH8y23G1BzDqsx
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:34:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Fh7oRvey; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8xG2mj0zDq5b
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:33:21 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id c15so8972686edj.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vxksTu/LTm4e9zJXc7bnbKVHB+LCMg3kvhD47XDmJ/4=;
 b=Fh7oRveyGoMddOM5W/9BUn6t5pszRkhUxNXy4Goqzc4W6v9guwnkxhJSLNnrY84oY4
 q4ALOdDCfDsqLJEGDdzgtwLqH94jiiVzCF8mF5k3b/Gi3D5T/wgO1iSPi22oWALx+OSu
 lrmHdR21GqxUbAf2BgtyfUfu6cI1wnYjX5mLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vxksTu/LTm4e9zJXc7bnbKVHB+LCMg3kvhD47XDmJ/4=;
 b=c2ghGPGH52/Qo0wFGCuLhWdUy1PeNjhbLrJoCIGvVaxtUd3IGXv+CemKRVGPaoNQv8
 QFKA6A84TV/OH5wNMplnFm7AwrVs8EJy/2iU7UHDsBJfT1EwukjZozlkYHA1POJMHD83
 XbJnxDoxJj459O09ywnRsKfsrnaAGlBW11EOA8wBPOdu9+0rXEdWXoG6yAhLz+M3MDoe
 aFSc9qUgMN0GSTZGJjROdBzHuD0kAu9MxDq2auCkZLNY3c/hgKojuKhteYvvEr3qLkIv
 UMtSl6pZ8PcDpOylRq/5hd5XB668mWV2k8DHlm8qi0iC55Nb5mhCyzJ+vRJDX+zotto3
 EKfw==
X-Gm-Message-State: AOAM533fZPg1zCyNQK3TsmlGMK9AGrW63QF3M2mI30TxQ1ZfsO8+u/Hn
 VKSMd4N7EQxHS5CAMeHu9wz9TDyHwK8WB9BuXd4IjjFoNBA=
X-Google-Smtp-Source: ABdhPJy+Fbs6wAsFQhYrpQ5CYKtziZoGCvYjxyq6wWTd2ih7AJtRHdNtHepErhPAkMv48Z2KK/+tFEGVlIL/HPLlb9U=
X-Received: by 2002:aa7:cd07:: with SMTP id b7mr175829edw.172.1596065599029;
 Wed, 29 Jul 2020 16:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-6-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-6-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:33:06 +0000
Message-ID: <CACPK8XcHpKyW_WyMikiMOBr5LBguOx+H1yfq6+TNBzPL-jqBfA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 5/6] spi: fsi: Implement restricted size for
 certain controllers
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> Some of the FSI-attached SPI controllers cannot use the loop command in
> programming the sequencer due to security requirements. Add a boolean
> devicetree property that describes this condition and restrict the
> size for these controllers. Also, add more transfers directly in the
> sequence up to the length of the sequence register.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Fixes: bbb6b2f9865b ("spi: Add FSI-attached SPI controller driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-fsi.c | 65 +++++++++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index c31a852b6a3e..53cfa201e187 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -24,7 +24,8 @@
>
>  #define SPI_FSI_BASE                   0x70000
>  #define SPI_FSI_INIT_TIMEOUT_MS                1000
> -#define SPI_FSI_MAX_TRANSFER_SIZE      2048
> +#define SPI_FSI_MAX_XFR_SIZE           2048
> +#define SPI_FSI_MAX_XFR_SIZE_RESTRICTED        32
>
>  #define SPI_FSI_ERROR                  0x0
>  #define SPI_FSI_COUNTER_CFG            0x1
> @@ -74,6 +75,8 @@ struct fsi_spi {
>         struct device *dev;     /* SPI controller device */
>         struct fsi_device *fsi; /* FSI2SPI CFAM engine device */
>         u32 base;
> +       size_t max_xfr_size;
> +       bool restricted;
>  };
>
>  struct fsi_spi_sequence {
> @@ -209,8 +212,12 @@ static int fsi_spi_reset(struct fsi_spi *ctx)
>         if (rc)
>                 return rc;
>
> -       return fsi_spi_write_reg(ctx, SPI_FSI_CLOCK_CFG,
> -                                SPI_FSI_CLOCK_CFG_RESET2);
> +       rc = fsi_spi_write_reg(ctx, SPI_FSI_CLOCK_CFG,
> +                              SPI_FSI_CLOCK_CFG_RESET2);
> +       if (rc)
> +               return rc;
> +
> +       return fsi_spi_write_reg(ctx, SPI_FSI_STATUS, 0ULL);
>  }
>
>  static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
> @@ -218,8 +225,8 @@ static int fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
>         /*
>          * Add the next byte of instruction to the 8-byte sequence register.
>          * Then decrement the counter so that the next instruction will go in
> -        * the right place. Return the number of "slots" left in the sequence
> -        * register.
> +        * the right place. Return the index of the slot we just filled in the
> +        * sequence register.
>          */
>         seq->data |= (u64)val << seq->bit;
>         seq->bit -= 8;
> @@ -237,9 +244,11 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>                                      struct fsi_spi_sequence *seq,
>                                      struct spi_transfer *transfer)
>  {
> +       bool docfg = false;
>         int loops;
>         int idx;
>         int rc;
> +       u8 val = 0;
>         u8 len = min(transfer->len, 8U);
>         u8 rem = transfer->len % len;
>         u64 cfg = 0ULL;
> @@ -247,22 +256,42 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>         loops = transfer->len / len;
>
>         if (transfer->tx_buf) {
> -               idx = fsi_spi_sequence_add(seq,
> -                                          SPI_FSI_SEQUENCE_SHIFT_OUT(len));
> +               val = SPI_FSI_SEQUENCE_SHIFT_OUT(len);
> +               idx = fsi_spi_sequence_add(seq, val);
> +
>                 if (rem)
>                         rem = SPI_FSI_SEQUENCE_SHIFT_OUT(rem);
>         } else if (transfer->rx_buf) {
> -               idx = fsi_spi_sequence_add(seq,
> -                                          SPI_FSI_SEQUENCE_SHIFT_IN(len));
> +               val = SPI_FSI_SEQUENCE_SHIFT_IN(len);
> +               idx = fsi_spi_sequence_add(seq, val);
> +
>                 if (rem)
>                         rem = SPI_FSI_SEQUENCE_SHIFT_IN(rem);
>         } else {
>                 return -EINVAL;
>         }
>
> +       if (ctx->restricted) {
> +               const int eidx = rem ? 5 : 6;
> +
> +               while (loops > 1 && idx <= eidx) {
> +                       idx = fsi_spi_sequence_add(seq, val);
> +                       loops--;
> +                       docfg = true;
> +               }
> +
> +               if (loops > 1) {
> +                       dev_warn(ctx->dev, "No sequencer slots; aborting.\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
>         if (loops > 1) {
>                 fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
> +               docfg = true;
> +       }
>
> +       if (docfg) {
>                 cfg = SPI_FSI_COUNTER_CFG_LOOPS(loops - 1);
>                 if (transfer->rx_buf)
>                         cfg |= SPI_FSI_COUNTER_CFG_N2_RX |
> @@ -273,6 +302,8 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>                 rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, cfg);
>                 if (rc)
>                         return rc;
> +       } else {
> +               fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, 0ULL);
>         }
>
>         if (rem)
> @@ -429,7 +460,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
>
>                 /* Sequencer must do shift out (tx) first. */
>                 if (!transfer->tx_buf ||
> -                   transfer->len > SPI_FSI_MAX_TRANSFER_SIZE) {
> +                   transfer->len > (ctx->max_xfr_size + 8)) {
>                         rc = -EINVAL;
>                         goto error;
>                 }
> @@ -453,7 +484,7 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
>
>                         /* Sequencer can only do shift in (rx) after tx. */
>                         if (next->rx_buf) {
> -                               if (next->len > SPI_FSI_MAX_TRANSFER_SIZE) {
> +                               if (next->len > ctx->max_xfr_size) {
>                                         rc = -EINVAL;
>                                         goto error;
>                                 }
> @@ -498,7 +529,9 @@ static int fsi_spi_transfer_one_message(struct spi_controller *ctlr,
>
>  static size_t fsi_spi_max_transfer_size(struct spi_device *spi)
>  {
> -       return SPI_FSI_MAX_TRANSFER_SIZE;
> +       struct fsi_spi *ctx = spi_controller_get_devdata(spi->controller);
> +
> +       return ctx->max_xfr_size;
>  }
>
>  static int fsi_spi_probe(struct device *dev)
> @@ -546,6 +579,14 @@ static int fsi_spi_probe(struct device *dev)
>                 ctx->fsi = fsi;
>                 ctx->base = base + SPI_FSI_BASE;
>
> +               if (of_property_read_bool(np, "fsi2spi,restricted")) {
> +                       ctx->restricted = true;
> +                       ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE_RESTRICTED;
> +               } else {
> +                       ctx->restricted = false;
> +                       ctx->max_xfr_size = SPI_FSI_MAX_XFR_SIZE;
> +               }
> +
>                 rc = devm_spi_register_controller(dev, ctlr);
>                 if (rc)
>                         spi_controller_put(ctlr);
> --
> 2.24.0
>
