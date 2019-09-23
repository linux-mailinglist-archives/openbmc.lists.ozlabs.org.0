Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79801BAD59
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:58:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBsW0WLjzDqM1
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:58:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="f8oegcyX"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBrz6kVzzDqKD
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 14:57:37 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id x5so15653538qtr.7
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fD5V+vH7HfhL3VdB5rkAbAtoY2aDrmr/AjcDZrKVOIQ=;
 b=f8oegcyXWbhBcA5my4S1XLW92W9ihJjjeKV9ivY7SNQ6HqTJ0+z1tD4L/8qBembPpG
 3LtRp7jWNTnyiRot8Gl+JLPXA/DaXnEvIsdtxhIcn76e080nUuiLicfeV88i9FXKDssr
 zBJkplBKBWBbLxN62OcbxP9I+gwi7Z9pLTzQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fD5V+vH7HfhL3VdB5rkAbAtoY2aDrmr/AjcDZrKVOIQ=;
 b=p34KGk2vuPvm5ayWbDkZe/SjNlbqiXdpOnM1vH8bQGXhXT9TJgk0ogAn6qWQNrQCW9
 sPKdbyQqY9pEEgX7FJM88UA/2cnHuV9EZnIIh4XrT9TmDFOg68lOnQAoMsHjWAXa8CDi
 qZiLI5YCmMP9KlOcgu9EnOM2lEVtr9Q6hoCNop0kEeNrL4wjWArkF5SaFijxNJk3E4m8
 eRc/X4FaOmvA6KfdAx9RrTozYvNwqIMVzCLqJPrtBd7TWZEn6Q7nkbStfAbmZoMxG6SV
 FDgwkjMNxq6I4C+1rB6E9aVF5sr95a3Vwcp1+jBPdAo+cTlQykucuZktTlFbEccuV+nh
 T3BA==
X-Gm-Message-State: APjAAAULpW/+0O6voyXET/BjrdjbL/BWshPw+R6Cm4Z0FZbbEvk/1NlD
 D2Zw39iV6I8y/z+uCGxgdEWZX/NNgDmRPxkhvXk=
X-Google-Smtp-Source: APXvYqzkpo5EtFqieJIZgqjxShXKii1xH0rB3kHmoel3s+OX1Lrx9sx1Cg1OvPsH/UwXiS5+q10rLDJiPCGtz+8QSzw=
X-Received: by 2002:a0c:b49a:: with SMTP id c26mr23069890qve.105.1569214653727; 
 Sun, 22 Sep 2019 21:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-6-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-6-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 04:57:22 +0000
Message-ID: <CACPK8XfBgGo3cg1dkY=QApEpoG8j10dZn8q2g12m7HR_M=nLyA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 5/6] net: ftgmac100: Ungate RCLK for RMII on
 AST2600
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The 50MHz RMII RCLK has to be enabled before the interface will function.

"... when in NCSI or RMII mode"?

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-By: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 43 ++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 9b7af94a40bb..21a58aad1a19 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -90,6 +90,9 @@ struct ftgmac100 {
>         struct mii_bus *mii_bus;
>         struct clk *clk;
>
> +       /* 2600 RMII clock gate */
> +       struct clk *rclk;
> +
>         /* Link management */
>         int cur_speed;
>         int cur_duplex;
> @@ -1718,11 +1721,27 @@ static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
>                    nd->link_up ? "up" : "down");
>  }
>
> -static void ftgmac100_setup_clk(struct ftgmac100 *priv)
> +static int ftgmac100_setup_clk(struct ftgmac100 *priv)
>  {
> -       priv->clk = devm_clk_get(priv->dev, NULL);
> -       if (IS_ERR(priv->clk))
> -               return;
> +       struct clk *clk;
> +       bool is_ast2600;
> +
> +       is_ast2600 = of_device_is_compatible(priv->dev->of_node,
> +                                            "aspeed,ast2600-mac");
> +
> +       clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +       priv->clk = clk;
> +
> +       clk = devm_clk_get_optional(priv->dev, "RCLK");
> +       if (!clk && is_ast2600 && priv->use_ncsi) {
> +               dev_err(priv->dev, "Cannot ungate RCLK");
> +               return -EINVAL;
> +       }
> +
> +       priv->rclk = clk;
> +       clk_prepare_enable(priv->rclk);
>
>         clk_prepare_enable(priv->clk);
>
> @@ -1732,6 +1751,8 @@ static void ftgmac100_setup_clk(struct ftgmac100 *priv)
>          */
>         clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
>                         FTGMAC_100MHZ);
> +
> +       return 0;
>  }
>
>  static int ftgmac100_probe(struct platform_device *pdev)
> @@ -1853,8 +1874,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                         goto err_setup_mdio;
>         }
>
> -       if (priv->is_aspeed)
> -               ftgmac100_setup_clk(priv);
> +       if (priv->is_aspeed) {
> +               err = ftgmac100_setup_clk(priv);
> +               if (err)
> +                       goto err_ncsi_dev;
> +       }
>
>         /* Default ring sizes */
>         priv->rx_q_entries = priv->new_rx_q_entries = DEF_RX_QUEUE_ENTRIES;
> @@ -1886,8 +1910,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
>
>         return 0;
>
> -err_ncsi_dev:
>  err_register_netdev:
> +       if (priv->rclk)
> +               clk_disable_unprepare(priv->rclk);
> +       clk_disable_unprepare(priv->clk);
> +err_ncsi_dev:
>         ftgmac100_destroy_mdio(netdev);
>  err_setup_mdio:
>         iounmap(priv->base);
> @@ -1909,6 +1936,8 @@ static int ftgmac100_remove(struct platform_device *pdev)
>
>         unregister_netdev(netdev);
>
> +       if (priv->rclk)
> +               clk_disable_unprepare(priv->rclk);
>         clk_disable_unprepare(priv->clk);
>
>         /* There's a small chance the reset task will have been re-queued,
> --
> 2.20.1
>
