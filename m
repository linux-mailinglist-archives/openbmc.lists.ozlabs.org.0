Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C98232811
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:28:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH8qG2bh4zDqkk
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:28:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CTsrgu9p; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8pW0dmqzDqgd
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:27:30 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id df16so2289108edb.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=giAGrDuTL+PDNlSvwpBhdm4SgtcbIA/3G584tVZ3RMI=;
 b=CTsrgu9plNUIJMsa4JLaQS1qn6VeEUiLKNJ7g8WD1JncE+tWy+F0Y0C1B+mCc51v9d
 QE3EGgtPA3vMwc2OklCjEBcgLzJj0HyzuHi3ogy7naa3QeZaocDZBZ+VbVazf2QIGiWA
 0XHBrey7LF32db5huTvv/xHQlK7kJUKUexfMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=giAGrDuTL+PDNlSvwpBhdm4SgtcbIA/3G584tVZ3RMI=;
 b=fHb1bMCglAtCQjhbFhdvMsb+DfnfnQyX7MHfkDkOOJoNXV/gDamUujBeo81x371gbT
 uWZOWwIYyclfRnIBXFIJJZmZJLIzKec+kXOOax6tUg9UIF7cYgmbuHUDVxatJQ8o9M1H
 I0pFpuGmTd3IUKenxOZUXC3ech1mqKDG4ZEK8cQpgFsTnZuuASgX2KiHW+dgz/XeZBLq
 8vai9V72J+kirRjyJvYPp+HNNgsO+xeguVPPIYK/BKaRw6Z0Ipun/GKfib4AVb7cgDNJ
 gPhYtRbUWzsK1Y0nFOlDk8d/NclUKFcSGTAEwkGUrCpKWHW419DZSYp3kw3h69F3fwHb
 M1Cg==
X-Gm-Message-State: AOAM533kwSSb0pIQIPJcoZ36rgEnXORQ0XtuqDL5VBZmy9xO/DO3eygO
 7WhLXukL1jsybgKju/gwR8+t6o98FuIDiRB9vNE=
X-Google-Smtp-Source: ABdhPJwd7c+ZF03VImgwD8ZAZEuTjo1vBjBV+dVIGJGXo6P/d13dWsP+1SnmH5BMeCs5RCcm/Tq50V2Wd2ldF/7GZAc=
X-Received: by 2002:a50:d4cc:: with SMTP id e12mr123174edj.143.1596065246504; 
 Wed, 29 Jul 2020 16:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-4-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:27:14 +0000
Message-ID: <CACPK8Xe5QO+Giz6_WgDvhpQfNcM48gadnOsg-q0YKSj3q8em=Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 3/6] spi: fsi: Fix use of the bneq+
 sequencer instruction
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> All of the switches in N2_count_control in the counter configuration are
> required to make the branch if not equal and increment command work.
> Set them when using bneq+.
>
> A side effect of this mode requires a dummy write to TDR when both
> transmitting and receiving otherwise the controller won't start shifting
> receive data.
>
> It is likely not possible to avoid TDR underrun errors in this mode and
> they are harmless, so do not check for them.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Fixes: bbb6b2f9865b ("spi: Add FSI-attached SPI controller driver")
Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/spi/spi-fsi.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index 559d0ff981f3..c31a852b6a3e 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -29,6 +29,10 @@
>  #define SPI_FSI_ERROR                  0x0
>  #define SPI_FSI_COUNTER_CFG            0x1
>  #define  SPI_FSI_COUNTER_CFG_LOOPS(x)   (((u64)(x) & 0xffULL) << 32)
> +#define  SPI_FSI_COUNTER_CFG_N2_RX      BIT_ULL(8)
> +#define  SPI_FSI_COUNTER_CFG_N2_TX      BIT_ULL(9)
> +#define  SPI_FSI_COUNTER_CFG_N2_IMPLICIT BIT_ULL(10)
> +#define  SPI_FSI_COUNTER_CFG_N2_RELOAD  BIT_ULL(11)
>  #define SPI_FSI_CFG1                   0x2
>  #define SPI_FSI_CLOCK_CFG              0x3
>  #define  SPI_FSI_CLOCK_CFG_MM_ENABLE    BIT_ULL(32)
> @@ -61,7 +65,7 @@
>  #define  SPI_FSI_STATUS_RDR_OVERRUN     BIT_ULL(62)
>  #define  SPI_FSI_STATUS_RDR_FULL        BIT_ULL(63)
>  #define  SPI_FSI_STATUS_ANY_ERROR       \
> -       (SPI_FSI_STATUS_ERROR | SPI_FSI_STATUS_TDR_UNDERRUN | \
> +       (SPI_FSI_STATUS_ERROR | \
>          SPI_FSI_STATUS_TDR_OVERRUN | SPI_FSI_STATUS_RDR_UNDERRUN | \
>          SPI_FSI_STATUS_RDR_OVERRUN)
>  #define SPI_FSI_PORT_CTRL              0x9
> @@ -238,6 +242,7 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>         int rc;
>         u8 len = min(transfer->len, 8U);
>         u8 rem = transfer->len % len;
> +       u64 cfg = 0ULL;
>
>         loops = transfer->len / len;
>
> @@ -258,8 +263,14 @@ static int fsi_spi_sequence_transfer(struct fsi_spi *ctx,
>         if (loops > 1) {
>                 fsi_spi_sequence_add(seq, SPI_FSI_SEQUENCE_BRANCH(idx));
>
> -               rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG,
> -                                      SPI_FSI_COUNTER_CFG_LOOPS(loops - 1));
> +               cfg = SPI_FSI_COUNTER_CFG_LOOPS(loops - 1);
> +               if (transfer->rx_buf)
> +                       cfg |= SPI_FSI_COUNTER_CFG_N2_RX |
> +                               SPI_FSI_COUNTER_CFG_N2_TX |
> +                               SPI_FSI_COUNTER_CFG_N2_IMPLICIT |
> +                               SPI_FSI_COUNTER_CFG_N2_RELOAD;
> +
> +               rc = fsi_spi_write_reg(ctx, SPI_FSI_COUNTER_CFG, cfg);
>                 if (rc)
>                         return rc;
>         }
> @@ -275,6 +286,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>  {
>         int rc = 0;
>         u64 status = 0ULL;
> +       u64 cfg = 0ULL;
>
>         if (transfer->tx_buf) {
>                 int nb;
> @@ -312,6 +324,16 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>                 u64 in = 0ULL;
>                 u8 *rx = transfer->rx_buf;
>
> +               rc = fsi_spi_read_reg(ctx, SPI_FSI_COUNTER_CFG, &cfg);
> +               if (rc)
> +                       return rc;
> +
> +               if (cfg & SPI_FSI_COUNTER_CFG_N2_IMPLICIT) {
> +                       rc = fsi_spi_write_reg(ctx, SPI_FSI_DATA_TX, 0);
> +                       if (rc)
> +                               return rc;
> +               }
> +
>                 while (transfer->len > recv) {
>                         do {
>                                 rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS,
> --
> 2.24.0
>
