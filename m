Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21B436DBE
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 00:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2kY4bvxz2ywK
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 09:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Vtd52Bom;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Vtd52Bom; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2k81510z2yKK
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 09:50:07 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id h20so2837953qko.13
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 15:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUuEpGWs6D3yDRcrKh92rrIhvE4t3roVaKCkzyL2oK8=;
 b=Vtd52BomWhcsmEdmnSGmWfHvv5YASGKmML89sxOChkKu3JMtKXMRv2GlNYJ0kqadwn
 HMeN8KcdndrMQ+JSf8j6j3LtVahr7hyORpco2Jr6L0B4ioeR6Tl0+UY60Wn3S//gvUdb
 PQ/5o4lR3wM2xPAq94oWUPyYm+kFVHyxlTESg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUuEpGWs6D3yDRcrKh92rrIhvE4t3roVaKCkzyL2oK8=;
 b=ipzxkD1w6FRdDJJoXBx2vqmipS0Ua4eRAkXSyx0WhF7ZDPdxuuZ6NZ7jKwp5gBxTn2
 JBBrGK5Rf3G8QuzhWO6aRc5pcoWBK4I+NMlmOeRVurH+TLvVvjJoWlFXZWGUOTJ8FfCh
 JctFNptYcNeI7XzPxE6dSIuVshTXPyg1sAT05sXeo1gB5uRjloHvu0WfG5ZnoKlrkjVf
 78XMRk29P3hRBX9CuVL3ucPBMD5gR7ELYkX99hAkEmA5mz3dY1Na04TRiEWptjqUjilh
 EavLFodPs81P4fLbxxShJdF2Qhxb3/bjJ86dzwjSh3bcTFeYa1dtAg+88sPxqKci6hPW
 hxJw==
X-Gm-Message-State: AOAM5335KHPKkDeUM4b87pX/ICEV9ojeRDEOfHPoxZBS25N6vvnKqvy2
 UlipYZaVZZ9cGCBWAQcLNrN8Oe18v1Ib9osU/nKTZJ7k
X-Google-Smtp-Source: ABdhPJynHCfwUkqtYhe1GO4EpF3+TD7E7r6zp2zf1aFiN74MwOhh1Sl9IWwiKv7fAAuEyPzypc6bE09ukYa41IXtmgI=
X-Received: by 2002:a37:68c4:: with SMTP id d187mr6859976qkc.36.1634856602626; 
 Thu, 21 Oct 2021 15:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211021161034.16428-1-eajames@linux.ibm.com>
In-Reply-To: <20211021161034.16428-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 22:49:50 +0000
Message-ID: <CACPK8Xf9NwdpSUUsRzkH0TZ=BhY1m0Veknoh2G0g88sKAB=+Qg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.14] spi: fsi: Print status on error
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

On Thu, 21 Oct 2021 at 16:10, Eddie James <eajames@linux.ibm.com> wrote:
>
> Print the SPI engine status register when an error is detected. This
> will aid tremendously in debugging failed transactions.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/20211004195149.29759-1-eajames@linux.ibm.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/spi/spi-fsi.c | 48 ++++++++++++++++++++++++-------------------

Thanks, applied.


>  1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index 829770b8ec74..9be18db03722 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -234,6 +234,26 @@ static int fsi_spi_reset(struct fsi_spi *ctx)
>         return fsi_spi_write_reg(ctx, SPI_FSI_STATUS, 0ULL);
>  }
>
> +static int fsi_spi_status(struct fsi_spi *ctx, u64 *status, const char *dir)
> +{
> +       int rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS, status);
> +
> +       if (rc)
> +               return rc;
> +
> +       if (*status & SPI_FSI_STATUS_ANY_ERROR) {
> +               dev_err(ctx->dev, "%s error: %08llx\n", dir, *status);
> +
> +               rc = fsi_spi_reset(ctx);
> +               if (rc)
> +                       return rc;
> +
> +               return -EREMOTEIO;
> +       }
> +
> +       return 0;
> +}
> +
>  static void fsi_spi_sequence_add(struct fsi_spi_sequence *seq, u8 val)
>  {
>         /*
> @@ -273,18 +293,9 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>                                 return rc;
>
>                         do {
> -                               rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
> -                                                     &status);
> +                               rc = fsi_spi_status(ctx, &status, "TX");
>                                 if (rc)
>                                         return rc;
> -
> -                               if (status & SPI_FSI_STATUS_ANY_ERROR) {
> -                                       rc = fsi_spi_reset(ctx);
> -                                       if (rc)
> -                                               return rc;
> -
> -                                       return -EREMOTEIO;
> -                               }
>                         } while (status & SPI_FSI_STATUS_TDR_FULL);
>
>                         sent += nb;
> @@ -296,18 +307,9 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>
>                 while (transfer->len > recv) {
>                         do {
> -                               rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
> -                                                     &status);
> +                               rc = fsi_spi_status(ctx, &status, "RX");
>                                 if (rc)
>                                         return rc;
> -
> -                               if (status & SPI_FSI_STATUS_ANY_ERROR) {
> -                                       rc = fsi_spi_reset(ctx);
> -                                       if (rc)
> -                                               return rc;
> -
> -                                       return -EREMOTEIO;
> -                               }
>                         } while (!(status & SPI_FSI_STATUS_RDR_FULL));
>
>                         rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
> @@ -348,8 +350,12 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
>                 if (status & (SPI_FSI_STATUS_ANY_ERROR |
>                               SPI_FSI_STATUS_TDR_FULL |
>                               SPI_FSI_STATUS_RDR_FULL)) {
> -                       if (reset)
> +                       if (reset) {
> +                               dev_err(ctx->dev,
> +                                       "Initialization error: %08llx\n",
> +                                       status);
>                                 return -EIO;
> +                       }
>
>                         rc = fsi_spi_reset(ctx);
>                         if (rc)
> --
> 2.27.0
>
