Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F20BECCA
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:46:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f6Sf67DvzDqjR
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:46:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IbLaQZ/w"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f6Rb33mjzDqnM
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:45:47 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id l3so1702879qtr.4
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHegrdEczMb2zSXXh5ocT3BBlu3SezdyVKz5pXB7NmI=;
 b=IbLaQZ/wBkg8ZtPGkoxAL4WIVihdaQe0UIrXEz1NTHQ4BPrhu0mRjWj2BfW8ykBCKs
 t+Q+GKsESHRqI3Hi6GGX0M7vh+TgEJ5liBu/5x8qB5FuZKLxEAAR9MmZmp2biSybwlK7
 CHtGdZFKa18TfdRC8Qo0H57ueQaIZZMXQURpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHegrdEczMb2zSXXh5ocT3BBlu3SezdyVKz5pXB7NmI=;
 b=rnCQ99wUCFkglt3KUbYvT0lMRLlXnkyPAA7EOY/4LqElx1rA0gmdxGMjyNmLUjzhkC
 zI+K8pK4MGTDBGJ1rQuZTcOBUlQ/0h3eVX64ifH3Sr/A0cwB2OhYDr6vek1r+BZbeXC7
 4GZrtxaLbB9rq6fHR55ezB88bkHhHm2ow0L8llQO7mX04iw8ccbzUzuqob6R5Dm4WI5S
 k0kskCbkzHCVnNfFA6deb5IN/t/JKUTQMWyYioedFm1JrOZMaMsdPgV1oDIH0IyPk0xy
 aEz++nsmKtono4bj95X31Nqfcy9TzfpaEV5qeQR6DlVAzSvV1XjxZuuOp01f/5CwATfU
 ZPPw==
X-Gm-Message-State: APjAAAW51/g/dvmGz/BYEoBdM4YmOYc4qXhBQXyT3O9R2syjQ1N6OyEC
 4cnWwGIc2d7RAJrpVQZOjZY2RK76eHxlFgR32abkbw==
X-Google-Smtp-Source: APXvYqyZUZ49D16pWvEOgHrzVKlClHgn0v8M0ppNIq/yZwQ19DI9W+HJtbszLGgERQBC6EEyD+wYSZWjH53QsmVjv6Q=
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr1569047qvx.16.1569483942894; 
 Thu, 26 Sep 2019 00:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190925153439.27475-1-andrew@aj.id.au>
 <20190925153439.27475-8-andrew@aj.id.au>
In-Reply-To: <20190925153439.27475-8-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:45:31 +0000
Message-ID: <CACPK8XdcedguQ-4z6dC2fMkQHvW9A+-FST7TY8N1-gG36=0uag@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 7/8] net: ftgmac100: Ungate RCLK for RMII
 on ASPEED MACs
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

On Wed, 25 Sep 2019 at 15:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The 50MHz RCLK has to be enabled before the RMII interface will function.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 35 +++++++++++++++++++-----
>  1 file changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 9b7af94a40bb..9ff791fb0449 100644
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
> @@ -1718,12 +1721,14 @@ static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
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
>
> +       clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
> +       if (IS_ERR(clk))
> +               return PTR_ERR(clk);
> +       priv->clk = clk;
>         clk_prepare_enable(priv->clk);
>
>         /* Aspeed specifies a 100MHz clock is required for up to
> @@ -1732,6 +1737,14 @@ static void ftgmac100_setup_clk(struct ftgmac100 *priv)
>          */
>         clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
>                         FTGMAC_100MHZ);
> +
> +       /* RCLK is for RMII, typically used for NCSI. Optional because its not
> +        * necessary if it's the 2400 MAC or the MAC is configured for RGMII
> +        */
> +       priv->rclk = devm_clk_get_optional(priv->dev, "RCLK");
> +       clk_prepare_enable(priv->rclk);
> +
> +       return 0;
>  }
>
>  static int ftgmac100_probe(struct platform_device *pdev)
> @@ -1853,8 +1866,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
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
> @@ -1886,8 +1902,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
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
> @@ -1909,6 +1928,8 @@ static int ftgmac100_remove(struct platform_device *pdev)
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
