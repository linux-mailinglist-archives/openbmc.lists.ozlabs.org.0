Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C90388433
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 02:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlDzV6rDxz300C
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 10:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jDbIwZK9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jDbIwZK9; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlDzB35wMz2xvZ;
 Wed, 19 May 2021 10:59:16 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id y12so8946131qtx.11;
 Tue, 18 May 2021 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iA2EHGmILYF3Ml1IoKcFl7klA1jJMkJx+SQifRlFeBM=;
 b=jDbIwZK9bujZuoCmwjiZCtN3t0mgYNHbMStF+mg90h2xWnCH6z6HnUfyNuKPPsVDnb
 e1z3o3bUHhZT9BzFRs00wSV5QLLltabKEGKqIvrGBsoYzbgN0MojPWltj0DrF1KvMoGb
 YPrwqlbkl4q3mD42AKzyPDQhvTkPYhPielBj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iA2EHGmILYF3Ml1IoKcFl7klA1jJMkJx+SQifRlFeBM=;
 b=qy6Du9Hkkq1YD5m4Ao0YsutUQy4v5ZCPgJ90B1p5ofSynpRUnoWTIpuOfg8X3gsGCa
 2IQpP0tFtguqiGawG49ob0pabZS0PRnTVwRZoxPl+afCTQIxOlXQE8hiEwbMXyPoemlF
 tQ9Szmq3yfL7y/ohdR38mvANOGyTrqZxtYlXs4uAleorkn2Od6BBqQV7qQk/NYnMz5wm
 xCP4Tiu3lWtxtPYh5XTUyTpK5k1dNAnuKmyKl0IWMjkRUAKxccKWiGiqQ7vWDreGRv8V
 3zKhH90mlHrceTBdHqIYxepyH4nyPW6D/a+OGBKaX1ow2o/XR3i91ns+ecXv3XcNhx1r
 T7Og==
X-Gm-Message-State: AOAM5314zgypCzVhSmIy3paa8VQDBMNMASwpVNkorcuNNO7puOOqNTvL
 jaQz4eH+J7M3cxAxOBfN45WpjjTzcSzJS2UvVRY=
X-Google-Smtp-Source: ABdhPJxhcLKtuV5HoYZdC5QIYyfaUlbDWsTyG4InHF+kLqOE28o2g0f3FPeB2WalZeVgyPWCQKM+2IW+QfQ8WjUgOLY=
X-Received: by 2002:ac8:5459:: with SMTP id d25mr8202628qtq.385.1621385951143; 
 Tue, 18 May 2021 17:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-2-andrew@aj.id.au>
In-Reply-To: <20210519000704.3661773-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 May 2021 00:58:57 +0000
Message-ID: <CACPK8XdqeS+rE0Jz9SF+sSMUaxmg7vFtghhiZNbDpKRNbBZK=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 Jiri Slaby <jirislaby@kernel.org>, ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 19 May 2021 at 00:07, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
> LPC bus to the UART interface on the BMC's internal APB. As such there's
> no RS-232 signalling involved - the UART interfaces on each bus are
> directly connected as the producers and consumers of the one set of
> FIFOs.
>
> The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
> at 33MHz. The difference in clock speeds exposes a race in the VUART
> design where a Tx data burst on the APB interface can result in a byte
> lost on the LPC interface. The symptom is LSR[DR] remains clear on the
> LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
> remains clear on the APB interface as the host has not consumed the data
> the BMC has transmitted. In this state, the UART has stalled and no
> further data can be transmitted without manual intervention (e.g.
> resetting the FIFOs, resulting in loss of data).
>
> The recommended work-around is to insert a read cycle on the APB
> interface between writes to THR.
>
> Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/tty/serial/8250/8250.h              |  1 +
>  drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
>  drivers/tty/serial/8250/8250_port.c         | 10 ++++++++++
>  3 files changed, 12 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 52bb21205bb6..34aa2714f3c9 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -88,6 +88,7 @@ struct serial8250_config {
>  #define UART_BUG_NOMSR (1 << 2)        /* UART has buggy MSR status bits (Au1x00) */
>  #define UART_BUG_THRE  (1 << 3)        /* UART has buggy THRE reassertion */
>  #define UART_BUG_PARITY        (1 << 4)        /* UART mishandles parity if FIFO enabled */
> +#define UART_BUG_TXRACE        (1 << 5)        /* UART Tx fails to set remote DR */
>
>
>  #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index a28a394ba32a..4caab8714e2c 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>         port.port.status = UPSTAT_SYNC_FIFO;
>         port.port.dev = &pdev->dev;
>         port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
> +       port.bugs |= UART_BUG_TXRACE;

A future enhancement would be to have this depend on the ast2600
compatible string, so we don't enable the feature for ast2400/ast2500.

That would also mean adding a compatible string for the ast2600.

Cheers,

Joel
