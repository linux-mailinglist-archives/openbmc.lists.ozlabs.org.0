Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A8A4EAA
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 06:36:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MHNB3XHSzDqdr
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 14:36:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="dN7IQbc7"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGsH2JxszDqj4;
 Mon,  2 Sep 2019 14:13:06 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id s14so11476064qkm.4;
 Sun, 01 Sep 2019 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEtrc1rdzh/Z7dC3mMEoNjpzKu9VEPrGxsmA4Ux5oa0=;
 b=dN7IQbc7odvWieIZ5FEdT/iecR2k9co0ZKCiVEoF2+XtJgJEdBx8dxIzOy3zhL02jM
 Ng4NLHSa7h/5wwE7q5SJd047yMm+wIvJm2pobbFMrlKBydk8kDSkH9Vuy1khb04sb0IG
 QvFDdo4L8E5TGP0OzMn69C3bccFG0s+t/Y2hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEtrc1rdzh/Z7dC3mMEoNjpzKu9VEPrGxsmA4Ux5oa0=;
 b=kqxiiwtYVg0oxWDBIdptQQZRpuZU/vTN3qAoUFQEhFTBSfhoRy7Z1u+QZ60yAi9TsT
 7/JY0p7gLXmH3pKFkfby6HNDBB8EG/uHF7GTpMkP8Ck2XD5F9x8ZqiXeCmVwwJk2/vHU
 JcSGcfiY20uyfvNdLLGqzuqKiiDWE7mY31LNi8MYajv7kmflL/uK/sCH0TvC3hKQTl2E
 AeJzp1RbzDGq3h8g0zN2XnSEr+m/DfZHC0i5MbWZ+vs7oZIn37xB22sCnUIZfK6mQ4Tu
 XVcCzkJPyyj0VggfBNWVzcDi8mhZMC8loyXldyPfreMMWWVqNjlhGoLp/h5MjF98T6lv
 WNhw==
X-Gm-Message-State: APjAAAXb7UHsnz4nQykgJg4X8kV6RE01az81C+5kyJA8nNnI9Os/rOGf
 lR29bPS+pli/UP606kxHmolyC1vmSipcU1GAg9c=
X-Google-Smtp-Source: APXvYqx0AbdqwDb0w0SXIQPBfCsiY91eO/PaLq21Y0/TBBmbdFC4DKJXXqARBT3GurZhBmBSWqMC8OS98b5LFv7L5rI=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr13799291qkb.171.1567397583086; 
 Sun, 01 Sep 2019 21:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190902035842.2747-1-andrew@aj.id.au>
 <20190902035842.2747-2-andrew@aj.id.au>
In-Reply-To: <20190902035842.2747-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 04:12:51 +0000
Message-ID: <CACPK8XfYgEUfaK6rtr+FdEq-Vau6d4wE2Rvfp6Q4G2-kjVLT0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mmc: sdhci-of-aspeed: Fix link failure for SPARC
To: Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kbuild test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-mmc@vger.kernel.org,
 adrian.hunter@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2 Sep 2019 at 03:58, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Resolves the following build error reported by the 0-day bot:
>
>     ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!
>
> SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Guard the
> callsite to maintain build coverage for the rest of the driver.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 38 ++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index d5acb5afc50f..96ca494752c5 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -224,10 +224,30 @@ static struct platform_driver aspeed_sdhci_driver = {
>         .remove         = aspeed_sdhci_remove,
>  };
>
> -static int aspeed_sdc_probe(struct platform_device *pdev)
> -
> +static int aspeed_sdc_create_sdhcis(struct platform_device *pdev)
>  {
> +#if defined(CONFIG_OF_ADDRESS)

This is going to be untested code forever, as no one will be running
on a chip with this hardware present but OF_ADDRESS disabled.

How about we make the driver depend on OF_ADDRESS instead?

Cheers,

Joel



>         struct device_node *parent, *child;
> +
> +       parent = pdev->dev.of_node;
> +
> +       for_each_available_child_of_node(parent, child) {
> +               struct platform_device *cpdev;
> +
> +               cpdev = of_platform_device_create(child, NULL, &pdev->dev);
> +               if (!cpdev) {
> +                       of_node_put(child);
> +                       return -ENODEV;
> +               }
> +       }
> +#endif
> +
> +       return 0;
> +}
> +
> +static int aspeed_sdc_probe(struct platform_device *pdev)
> +
> +{
>         struct aspeed_sdc *sdc;
>         int ret;
>
> @@ -256,17 +276,9 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>
>         dev_set_drvdata(&pdev->dev, sdc);
>
> -       parent = pdev->dev.of_node;
> -       for_each_available_child_of_node(parent, child) {
> -               struct platform_device *cpdev;
> -
> -               cpdev = of_platform_device_create(child, NULL, &pdev->dev);
> -               if (!cpdev) {
> -                       of_node_put(child);
> -                       ret = -ENODEV;
> -                       goto err_clk;
> -               }
> -       }
> +       ret = aspeed_sdc_create_sdhcis(pdev);
> +       if (ret)
> +               goto err_clk;
>
>         return 0;
>
> --
> 2.20.1
>
