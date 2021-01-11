Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61A2F0AAF
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 02:05:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDb9M2bqxzDqVT
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 12:05:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=D0nYNIqw; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDb8T1fPBzDqPM
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 12:04:40 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id 186so13449062qkj.3
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 17:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxYM56IGkN8R0V+RHEKaLqJwV+t0vYQKL7eDdufyl6s=;
 b=D0nYNIqw/NEy7ngLa+VuSP1KkXJ4mukpET+tE86f2ghIgDow8/FifDgPzRqEH++ZUK
 0ndgZaL2qe3x5FE4+1UdE2BARpIT97FJeO/nS4NNJg9oCmb89VmAQiASwOC709rPReOs
 eAoq8zYzIxhlEruyJa/A8+8SW99pdiPWTu1iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxYM56IGkN8R0V+RHEKaLqJwV+t0vYQKL7eDdufyl6s=;
 b=QJVeEYRduSwOoo3PHy2aHPQmnPIZe/yBFXLbSsrM6YtethQB5nbPc6CknGuT404nhL
 LtRsIrVlBEEnH9DbWF8UiTAJgaYNkirA+6L0BLDsEvqUfao6n12s0SXA2u8dThuGe6Pr
 5PZL7IivIOhENFxoUo/VSGxeKV45jwTXLbvypFfU9BzQBxZ/C9F21tQYDboEr4i9EQUX
 emDDgczrSjBRn9Yt4+zISiNgrNzZTWpBMwmIgsA9DTFuVK7pqMFeLCAtfCIpRD0ZFyN/
 PCh8Q4Ayi2xoy3p9faOmuP+xjZo7d4xMeHsd4KaWXCev7u3aZ85hCepfFrnNTW0v7ecp
 QlhQ==
X-Gm-Message-State: AOAM533xjynE/new4J2W67Ogkb4yqM5MLqGF+Hh1xd9eK8bZdn1zdHWj
 Sv05vkYGlGVGTd5sPqTmYMTzVvmGey6nle0bkbc=
X-Google-Smtp-Source: ABdhPJwnjc2S4gpi25mpE+52DXd4+Xgh7R0lEDVdZJFu6tAfwWo375JOfAQNRYOqwGEYqR/hYdH/HjhpN+d0C+Pew/o=
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr14005066qkm.66.1610327078803; 
 Sun, 10 Jan 2021 17:04:38 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-10-tmaimon77@gmail.com>
In-Reply-To: <20210105134508.225702-10-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 01:04:27 +0000
Message-ID: <CACPK8Xero9SneESq6c0HUkZcg0Eg-OJtZMKM2TDtvL_hx+UrwQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 09/11] spi: npcm-pspi: Add full duplex
 support
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
> Modify the IRQ handler in the NPCM PSPI
> driver to support SPI full duplex communication.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/spi/spi-npcm-pspi.c | 75 +++++++++++++++----------------------
>  1 file changed, 30 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
> index 87cd0233c60b..92fae0b23eb1 100644
> --- a/drivers/spi/spi-npcm-pspi.c
> +++ b/drivers/spi/spi-npcm-pspi.c
> @@ -197,22 +197,22 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
>  static void npcm_pspi_send(struct npcm_pspi *priv)
>  {
>         int wsize;
> -       u16 val;
> +       u16 val = 0;
>
>         wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
>         priv->tx_bytes -= wsize;
>
> -       if (!priv->tx_buf)
> -               return;

It looks like you're removing this check and instead doing it inside
each case. That seems like a waste, why not leave the single check in?

> -
>         switch (wsize) {
>         case 1:
> -               val = *priv->tx_buf++;
> +               if (priv->tx_buf)
> +                       val = *priv->tx_buf++;
>                 iowrite8(val, NPCM_PSPI_DATA + priv->base);
>                 break;
>         case 2:
> -               val = *priv->tx_buf++;
> -               val = *priv->tx_buf++ | (val << 8);
> +               if (priv->tx_buf) {
> +                       val = *priv->tx_buf++;
> +                       val = *priv->tx_buf++ | (val << 8);
> +               }
>                 iowrite16(val, NPCM_PSPI_DATA + priv->base);
>                 break;
>         default:
> @@ -224,22 +224,24 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
>  static void npcm_pspi_recv(struct npcm_pspi *priv)
>  {
>         int rsize;
> -       u16 val;
> +       u16 val_16;
> +       u8  val_8;
>
>         rsize = min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
>         priv->rx_bytes -= rsize;
>
> -       if (!priv->rx_buf)
> -               return;
> -
>         switch (rsize) {
>         case 1:
> -               *priv->rx_buf++ = ioread8(priv->base + NPCM_PSPI_DATA);
> +               val_8 = ioread8(priv->base + NPCM_PSPI_DATA);
> +               if (priv->rx_buf)
> +                       *priv->rx_buf++ = val_8;
>                 break;
>         case 2:
> -               val = ioread16(priv->base + NPCM_PSPI_DATA);
> -               *priv->rx_buf++ = (val >> 8);
> -               *priv->rx_buf++ = val & 0xff;
> +               val_16 = ioread16(priv->base + NPCM_PSPI_DATA);
> +               if (priv->rx_buf) {
> +                       *priv->rx_buf++ = (val_16 >> 8);
> +                       *priv->rx_buf++ = val_16 & 0xff;
> +               }
>                 break;
>         default:
>                 WARN_ON_ONCE(1);
> @@ -298,43 +300,26 @@ static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
>         struct npcm_pspi *priv = dev_id;
>         u8 stat;
>
> -       stat = ioread8(priv->base + NPCM_PSPI_STAT);
> -
>         if (!priv->tx_buf && !priv->rx_buf)
>                 return IRQ_NONE;
>
> -       if (priv->tx_buf) {
> -               if (stat & NPCM_PSPI_STAT_RBF) {
> -                       ioread8(NPCM_PSPI_DATA + priv->base);
> -                       if (priv->tx_bytes == 0) {
> -                               npcm_pspi_disable(priv);
> -                               complete(&priv->xfer_done);
> -                               return IRQ_HANDLED;
> -                       }
> -               }
> -
> -               if ((stat & NPCM_PSPI_STAT_BSY) == 0)
> -                       if (priv->tx_bytes)
> -                               npcm_pspi_send(priv);
> +       if (priv->tx_bytes == 0 && priv->rx_bytes == 0) {
> +               npcm_pspi_disable(priv);
> +               complete(&priv->xfer_done);
> +               return IRQ_HANDLED;
>         }
>
> -       if (priv->rx_buf) {
> -               if (stat & NPCM_PSPI_STAT_RBF) {
> -                       if (!priv->rx_bytes)
> -                               return IRQ_NONE;
> -
> -                       npcm_pspi_recv(priv);
> +       stat = ioread8(priv->base + NPCM_PSPI_STAT);
>
> -                       if (!priv->rx_bytes) {
> -                               npcm_pspi_disable(priv);
> -                               complete(&priv->xfer_done);
> -                               return IRQ_HANDLED;
> -                       }
> -               }
> +       /*
> +        * first we do the read since if we do the write we previous read might
> +        * be lost (indeed low chances)
> +        */
> +       if ((stat & NPCM_PSPI_STAT_RBF) && priv->rx_bytes)
> +               npcm_pspi_recv(priv);
>
> -               if (((stat & NPCM_PSPI_STAT_BSY) == 0) && !priv->tx_buf)
> -                       iowrite8(0x0, NPCM_PSPI_DATA + priv->base);
> -       }
> +       if (((stat & NPCM_PSPI_STAT_BSY) == 0) && priv->tx_bytes)
> +               npcm_pspi_send(priv);
>
>         return IRQ_HANDLED;
>  }
> --
> 2.22.0
>
