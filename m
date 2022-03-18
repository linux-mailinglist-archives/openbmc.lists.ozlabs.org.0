Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29A4DD3E3
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 05:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKW4n6dSqz30Df
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 15:19:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=G4OMexrB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=G4OMexrB; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKW4M69nfz2ybK
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 15:19:30 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id f3so117113qvz.10
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6kcbzzb3Q18Foqg/UI/G6Q3eVQppXaI7cSO8s/lZSlw=;
 b=G4OMexrBtCk0ngOlF0XSIkaCzI6dYKXEDtEVfsDpieKqdAIIL98xZGbXHhExTahC9d
 /JrwnabA10kIh5TLOWfBfqJpB801TlZWAuNcm9109vskjprQviJy/C4ietPbFJJMe0K3
 AJd9hVeeqoPPwijrxfY/H+q1I5bYp5Zde8IMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6kcbzzb3Q18Foqg/UI/G6Q3eVQppXaI7cSO8s/lZSlw=;
 b=MBnVuBxaWcSTAq9BTBom5NgOuYgti3zWkXzbhoCG8oLqPQCUHUIb86R5RCulCh5yFn
 ZpxMxjqWI4/iwgkHih6QKfrO+g1eQO2WYTFlJXjGkLBV9+mcc8oBFQFA/OXCQmwLF1Ys
 Ks1U3FW8V0WUD7mNp0rgn098lkAxulBYexT+mAbHxKOmKpZdGVfL48pR5ETROAdSqkwp
 gjMVmnUDQNUSYfIbzcnfPc5HLN1NFKMbrK3pv85XyHbVsO2PkzDeZcSbrP8M9+Y4X3dw
 P1OLZK4Zg/lETQ/ZkNVMuIGKVyfzTdw7+hkkWfU8TAx0fSmpQq9p/CQdqv6LGZEqjMI5
 0Wvg==
X-Gm-Message-State: AOAM5302QEW5wi/RylR8Xhgx5o6YdVzjr4OEGP8AP3EjJGZj8brvH79k
 0Dpnt3XsJD3Bi4CEssk0pRL+lWn3RfN7WKOL/Zc=
X-Google-Smtp-Source: ABdhPJw4eEeIPZiev+YGiA8kFv/XcltV3scqoPQ5ehYGPDeRNHMLJIwI3WfRTdA15nBn/8+56KWImz4dtdFktXjRkb0=
X-Received: by 2002:a05:6214:d82:b0:440:efb8:cbb7 with SMTP id
 e2-20020a0562140d8200b00440efb8cbb7mr3995622qve.65.1647577167220; Thu, 17 Mar
 2022 21:19:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220317211426.38940-1-eajames@linux.ibm.com>
In-Reply-To: <20220317211426.38940-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 04:19:15 +0000
Message-ID: <CACPK8Xd42+NgTfS8ERagv-1GkAb8XiY8U71Q8Hz0wQ9dEUJekQ@mail.gmail.com>
Subject: Re: [PATCH] spi: fsi: Implement a timeout for polling status
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
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 at 21:14, Eddie James <eajames@linux.ibm.com> wrote:
>
> The data transfer routines must poll the status register to
> determine when more data can be shifted in or out. If the hardware
> gets into a bad state, these polling loops may never exit. Prevent
> this by returning an error if a timeout is exceeded.

This makes sense. We may even want to put this code in regardless.

However, I'm wondering why the code in fsi_spi_status didn't catch this.

> static int fsi_spi_status(struct fsi_spi *ctx, u64 *status, const char *dir)
> {
>        int rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS, status);

You mentioned the error condition is we get back 0xff. That means that
status will be 0xffff_ffff_ffff_ffff ?

Did you observe status being this value?

>        if (rc)
>                return rc;
>
>        if (*status & SPI_FSI_STATUS_ANY_ERROR) {

I think that we're checking against 0xffe0f000.

>                dev_err(ctx->dev, "%s error: %016llx\n", dir, *status);
>
>                rc = fsi_spi_reset(ctx);
>                if (rc)
>                        return rc;

Is the problem here? fsi_spi_reset writes to the clock config
registers, but doesn't read the status.

Obviously doing the writes causes a call to fsi_spi_check_status, but
that checks the FSI2SPI bridge, not the SPI master.

...but it doesn't matter, because we're either going to return an
error from the reset, or return EREMOTEIO, so there's no masking of
the error.

>
>                return -EREMOTEIO;
>        }
>
>        return 0;
> }


>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/spi/spi-fsi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index b6c7467f0b59..d403a7a3021d 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -25,6 +25,7 @@
>
>  #define SPI_FSI_BASE                   0x70000
>  #define SPI_FSI_INIT_TIMEOUT_MS                1000
> +#define SPI_FSI_STATUS_TIMEOUT_MS      100

Can you add a comment (or put something in the commit message) about
why you chose 100ms.

>  #define SPI_FSI_MAX_RX_SIZE            8
>  #define SPI_FSI_MAX_TX_SIZE            40
>
> @@ -299,6 +300,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>                                  struct spi_transfer *transfer)
>  {
>         int rc = 0;
> +       unsigned long end;
>         u64 status = 0ULL;
>
>         if (transfer->tx_buf) {
> @@ -315,10 +317,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>                         if (rc)
>                                 return rc;
>
> +                       end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
>                         do {
>                                 rc = fsi_spi_status(ctx, &status, "TX");
>                                 if (rc)
>                                         return rc;
> +
> +                               if (time_after(jiffies, end))
> +                                       return -ETIMEDOUT;
>                         } while (status & SPI_FSI_STATUS_TDR_FULL);
>
>                         sent += nb;
> @@ -329,10 +335,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>                 u8 *rx = transfer->rx_buf;
>
>                 while (transfer->len > recv) {
> +                       end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
>                         do {
>                                 rc = fsi_spi_status(ctx, &status, "RX");
>                                 if (rc)
>                                         return rc;
> +
> +                               if (time_after(jiffies, end))
> +                                       return -ETIMEDOUT;
>                         } while (!(status & SPI_FSI_STATUS_RDR_FULL));
>
>                         rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
> --
> 2.27.0
>
