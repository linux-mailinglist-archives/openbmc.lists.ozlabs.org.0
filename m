Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C433197247
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 03:55:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rFsf69HlzDqZW
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 12:55:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fP72sLfy; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rFrj2wkTzDqZ2
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:54:45 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id bu9so2149578qvb.13
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 18:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MxgBtxgZd+K9rMVhXYcHOGZQngX5YL2h9+n51n1a1Ag=;
 b=fP72sLfyebPIXsiK75v6pnAyXbYj+HViToKJCF8wY5PLe85V9TMgOFCisoJnIeiur9
 KUdqgJyrBiEKMsIu8LzwlgiraV9lR8Tde2uBMjgSZZ3XHPjvRVACQhRwcf6UtjIE2H+n
 1pXj3KKobkYvMiDdqBoQsiMQdkYxTzhZGShUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MxgBtxgZd+K9rMVhXYcHOGZQngX5YL2h9+n51n1a1Ag=;
 b=qOVDDte3llg0ycsg/wHBg3K05It6XWkAhqvqa3s8m8t5xiL5y7JwwDvIXtD5vSBlkc
 VcUU9RAu2wYks+6tbyzYC+CknjwK2ITpvZuTxUM7OuY2X4F0iKJOOnsGuGwnRfW8Bo8Q
 0a1Zu3+9Lp0f3B5ItIpG5YQMiBrWZjtfiSLHE2RwCPw0v6SZFzmTE1Ry8Con1fq+YEsm
 ZPDUS09f29DBCwYqnnelL3LbgbUH6M5WGltBw6EMWQXnVeNOyNi5L2TINMVL9ZpB+q9b
 P/9GNARWW6h7jXJOaeHuHAl1GSIAC1qV8YyNTS/3FiTSDWYdCRATvEJKi87kOiP0dfeH
 Z77w==
X-Gm-Message-State: ANhLgQ2CZlhrz2Q5ezF72a2SbjbiIaQqSAL9xo8Ymp3k9cJRnVt6sOCa
 RfZuCBeBu04l5K5yjKlXBMDlENbfD2xJOqr+pOVNKl1D5vc=
X-Google-Smtp-Source: ADFU+vtZKxbwEdrITMstt2cWrjYedLguZg14FJS4ivRTlEi8Ml6D3CATaRwJvPJ6INFW0I2aO8DgMwde586E5DEAgMk=
X-Received: by 2002:ad4:4388:: with SMTP id s8mr9807451qvr.2.1585533280633;
 Sun, 29 Mar 2020 18:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200330015142.132779-1-joel@jms.id.au>
 <20200330015142.132779-3-joel@jms.id.au>
In-Reply-To: <20200330015142.132779-3-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Mar 2020 01:54:29 +0000
Message-ID: <CACPK8XfksmQhoax5NLLxJuvD5OVzZyScQNiTXuC0gzjKG1UsHw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v2 2/2] fsi: aspeed: Support cabled FSI
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 30 Mar 2020 at 01:51, Joel Stanley <joel@jms.id.au> wrote:
>
> Some FSI development systems have internal FSI signals, and some have
> external cabled FSI. Software can detect which machine this is by
> reading a jumper GPIO, and also control which pins the signals are
> routed to through a mux GPIO.
>
> This attempts to find the GPIOs at probe time. If they are not present
> in the device tree the driver will not error and continue as before.
>
> The mux GPIO is owned by the FSI driver to ensure it is not modified at
> runtime. The routing jumper obtained as non-exclusive to allow other
> software to inspect it's state.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 47 +++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index f49742b310c2..374e158ccdc7 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -13,6 +13,7 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
> +#include <linux/gpio/consumer.h>
>
>  #include "fsi-master.h"
>
> @@ -419,6 +420,46 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
>         return 0;
>  }
>
> +static int tacoma_cabled_fsi_fixup(struct device *dev)
> +{
> +       struct gpio_desc *routing_gpio, *mux_gpio;
> +       int gpio;
> +
> +       /*
> +        * The routing GPIO is a jumper indicating we should mux for the
> +        * externally connected FSI cable.
> +        */
> +       routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
> +                       GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +       if (IS_ERR(routing_gpio))
> +               return PTR_ERR(routing_gpio);
> +       if (!routing_gpio)
> +               return 0;
> +
> +       mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_ASIS);
> +       if (IS_ERR(mux_gpio))
> +               return PTR_ERR(mux_gpio);
> +       if (!mux_gpio)
> +               return 0;
> +
> +       gpio = gpiod_get_value(routing_gpio);
> +       if (gpio < 0)
> +               return 0;

Pretend this says:

       gpio = gpiod_get_value(routing_gpio);
       if (gpio < 0)
               return gpio;

> +
> +       /* If the routing GPIO is high we should set the mux to low. */
> +       if (gpio) {
> +               gpiod_direction_output(mux_gpio, 0);
> +               dev_info(dev, "FSI configured for external cable\n");
> +       } else {
> +               gpiod_direction_output(mux_gpio, 1);
> +       }
> +
> +       devm_gpiod_put(dev, routing_gpio);
> +
> +       return 0;
> +}
> +
> +
>  static int fsi_master_aspeed_probe(struct platform_device *pdev)
>  {
>         struct fsi_master_aspeed *aspeed;
> @@ -426,6 +467,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>         int rc, links, reg;
>         __be32 raw;
>
> +       rc = tacoma_cabled_fsi_fixup(&pdev->dev);
> +       if (rc) {
> +               dev_err(&pdev->dev, "Tacoma FSI cable fixup failed\n");
> +               return rc;
> +       }
> +
>         aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
>         if (!aspeed)
>                 return -ENOMEM;
> --
> 2.25.1
>
