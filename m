Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E66350D7F
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 06:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9qcf22vrz30BB
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 15:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FSY9bK6E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FSY9bK6E; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9qcM50scz2yYn;
 Thu,  1 Apr 2021 15:16:01 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id h7so635373qtx.3;
 Wed, 31 Mar 2021 21:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DnLOo/zKFvvfvZUcx+JWPM+sG45h5ZMlE6pfJth5bZA=;
 b=FSY9bK6EqVMbAvbJjmaAGvWT2YTq6+22I+ohI8uL+Jxqutw0a+tqk250xv6oUWfebr
 iFDBj2m6RXqdKKIZUF/n11GKeruzHnFE3MO6xrVts8a6ok9yoI1b4nQhrQDqOLBkXTsT
 tCrCGmieznBTNltFiXw3Tg+lgg7a57GYS1SkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DnLOo/zKFvvfvZUcx+JWPM+sG45h5ZMlE6pfJth5bZA=;
 b=Ks+p/2/d+MRv+NRa/XbMyA1N5FxZmB3ntZx6hhwNHP+mLtYv+ppeGOOwDDEH0mElsG
 v0ddT6iPbxCFqY45Mk+hg+6L8/2P0NtRWzOzn9XIMLPYC6Q9ZRk73Qby2+gAdZbC5nX1
 4DXbvNXnMVuBdj4yopnpdGjjTjMGvhqCTcXBCOSxVV0GYBD2r/rzhZryUuDcJBg9f6Il
 6xCkacqdNYqfudtKtNrc7AKH/jTLQ6bEonuLL4I+wZopBh+Hh7p9rcjUNiJc6GaTIOwx
 kYfOAPX+FpSzWHECiK30ubAwEcuwqlflVom6VtUcwUtwp4J9hd5OIocU4CSsWC3Qg/aD
 u+SQ==
X-Gm-Message-State: AOAM530FiZy/mG40B5wASHr6PFGnGanCFvskxP46taP/T8OFE8F18BzA
 WGab85sCUMCg5yOLPu/+pfwDq5CUMp9H1Rzcoso=
X-Google-Smtp-Source: ABdhPJypEX2gUYtGWHMsAT0fUIon/Gl9d1HFtws1V67C6FeeuxcqVZPapwQ22BWZprgSEoafxfPm3vIDhv8+xFHtLcQ=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr5684873qtr.176.1617250557473; 
 Wed, 31 Mar 2021 21:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-3-zev@bewilderbeest.net>
In-Reply-To: <20210401005702.28271-3-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Apr 2021 04:15:44 +0000
Message-ID: <CACPK8XdPVf1WMmo8C8RJtd-1cH5qV9odEDhDUHWRiMOk=dQNtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drivers/tty/serial/8250: add DT property for
 aspeed vuart sirq polarity
To: Zev Weiss <zev@bewilderbeest.net>, Jeremy Kerr <jk@ozlabs.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 1 Apr 2021 at 00:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This provides a simple boolean to use instead of the deprecated
> aspeed,sirq-polarity-sense property.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index c33e02cbde93..e5ef9f957f9a 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -482,6 +482,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>                 of_node_put(sirq_polarity_sense_args.np);
>         }
>
> +       if (of_property_read_bool(np, "aspeed,sirq-active-high"))
> +               aspeed_vuart_set_sirq_polarity(vuart, 1);

This assumes the default is always low, so we don't need a property to
set it to that state?

Would it make more sense to have the property describe if it's high or
low? (I'm happy for the answer to be "no", as we've gotten by for the
past few years without it).

This brings up another point. We already have the sysfs file for
setting the lpc address, from userspace. In OpenBMC land this can be
set with obmc-console-client (/etc/obmc-console.conf). Should we add
support to that application for setting the irq polarity too, and do
away with device tree descriptions?

> +
>         aspeed_vuart_set_enabled(vuart, true);
>         aspeed_vuart_set_host_tx_discard(vuart, true);
>         platform_set_drvdata(pdev, vuart);
> --
> 2.31.1
>
