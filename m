Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8635360770
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 12:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLbdG5QMFz30B2
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 20:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SyCpLMrB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SyCpLMrB; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLbcz3g8hz2xMW;
 Thu, 15 Apr 2021 20:46:57 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id r13so8081115pjf.2;
 Thu, 15 Apr 2021 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oV4yvPzBl+8JFQ4FMZmRE08ppy67MX2UmEYPl8EhO50=;
 b=SyCpLMrBzeb3fwLhDpa8qxrbb//VUgy89Xbxe2C1+tWhCS9enUHbulLBHkcU6OX0y6
 aHxwV87N38c/JoUPRfl6OhhKdhUVhou/52XznXoo8Bx5Tu22pxYcEqRVukZs1IfA2tDd
 lNgirBp+nJPByNqRfO3W2SBS7jyrvI42Y0qbt8PZUL0CXTRAX+Fx3snanIKBTDexZDsV
 JMY4U2CzQt/F7Xgchoi+hcCzI8t+w7vHQgYlQ3PdPAtg6af3Otr+yAA5x94ts4Y1VodI
 7d73jN58s11sK0a6XN+8Ktwxv3EtNqBChHGjI1PBxgR5BmasC3dTi9SFfUzyAvZE1dIV
 9Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oV4yvPzBl+8JFQ4FMZmRE08ppy67MX2UmEYPl8EhO50=;
 b=NjsGCQJ/46QXT7BWR4u/gjHNGTcvtGM1sV/Z9jC1lpUfUUhVQi90VcF/ITV9yxr8oP
 zqyGW0yQ249lfgAnbaNkypihFpCwBQIWKhXAxqe7fpemXGtIcoyWJDq4kWY077L9mmga
 zkqTb1Fw3XLYGMM8AqU5kpEi7ZJJhdYjTcoy8MJpxgZX/G6qTYMgWxMKAmUhv9z0iWB9
 qRk/LVe0GueGMSb0qtj6MCg/MBCMOR3F5GCgJmcFMVVlUiYoDCrz59CDCuGmIwOURaxG
 TNt0y3egyCwDrLy1o6sAf2dXwrmW8tSP7ycjmUvV2OaJaq/u4GnYoDT5AT0H6HV6CDM/
 tsFw==
X-Gm-Message-State: AOAM530mYpKIDNMX2inkqXbWOFm+VaQ6aHDAvz1leN8giHwm7wSt2qCn
 z97+ZOSIe+tRbRGtQXWbsAQMMe6EIuUjKYcdlLs=
X-Google-Smtp-Source: ABdhPJyJC4pTKN9cWqu158fTl9rbPrgh93CK4doD8LtZU92In9K69g4pbH9tiEeOcHlzTrh7Q8t7v8WNh6iO49fyHSo=
X-Received: by 2002:a17:902:264:b029:eb:3d3a:a09c with SMTP id
 91-20020a1709020264b02900eb3d3aa09cmr3246929plc.0.1618483613936; Thu, 15 Apr
 2021 03:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210412034712.16778-1-zev@bewilderbeest.net>
 <20210412034712.16778-4-zev@bewilderbeest.net>
In-Reply-To: <20210412034712.16778-4-zev@bewilderbeest.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Apr 2021 13:46:37 +0300
Message-ID: <CAHp75VfCKRn+ER4bKf+PLhXHT0yZeN4JDufxfROa4UMf=Bc6bQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] serial: 8250_aspeed_vuart: add aspeed,lpc-io-reg
 and aspeed,lpc-interrupts DT properties
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 7:05 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> These allow describing all the Aspeed VUART attributes currently
> available via sysfs.  aspeed,lpc-interrupts provides a replacement for
> the deprecated aspeed,sirq-polarity-sense property.

One nit-pick below.

In any case it's fine.

> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 51 ++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 8433f8dbb186..3c239d98747f 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -28,6 +28,10 @@
>  #define ASPEED_VUART_ADDRL             0x28
>  #define ASPEED_VUART_ADDRH             0x2c
>
> +#define ASPEED_VUART_DEFAULT_LPC_ADDR  0x3f8
> +#define ASPEED_VUART_DEFAULT_SIRQ      4
> +#define ASPEED_VUART_DEFAULT_SIRQ_POLARITY     IRQ_TYPE_LEVEL_LOW
> +
>  struct aspeed_vuart {
>         struct device           *dev;
>         void __iomem            *regs;
> @@ -386,6 +390,18 @@ static void aspeed_vuart_auto_configure_sirq_polarity(
>         aspeed_vuart_set_sirq_polarity(vuart, (value & reg_mask) == 0);
>  }
>
> +static int aspeed_vuart_map_irq_polarity(u32 dt)
> +{
> +       switch (dt) {
> +       case IRQ_TYPE_LEVEL_LOW:
> +               return 0;
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               return 1;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
>  static int aspeed_vuart_probe(struct platform_device *pdev)
>  {
>         struct of_phandle_args sirq_polarity_sense_args;
> @@ -393,8 +409,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>         struct aspeed_vuart *vuart;
>         struct device_node *np;
>         struct resource *res;
> -       u32 clk, prop;
> -       int rc;
> +       u32 clk, prop, sirq[2];
> +       int rc, sirq_polarity;
>
>         np = pdev->dev.of_node;
>
> @@ -501,6 +517,37 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>                 of_node_put(sirq_polarity_sense_args.np);
>         }
>
> +       rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
> +       if (rc < 0)
> +               prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
> +
> +       rc = aspeed_vuart_set_lpc_address(vuart, prop);
> +       if (rc < 0) {
> +               dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
> +               goto err_clk_disable;
> +       }
> +
> +       rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
> +       if (rc < 0) {
> +               sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
> +               sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
> +       }
> +
> +       rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
> +       if (rc < 0) {
> +               dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts property\n");
> +               goto err_clk_disable;
> +       }
> +
> +       sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
> +       if (sirq_polarity < 0) {
> +               dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts property\n");

> +               rc = sirq_polarity;
> +               goto err_clk_disable;
> +       }

Why not to use the same pattern as above, i.e.

       rc = aspeed_vuart_map_irq_polarity(sirq[1]);
       if (rc < 0) {
               dev_err(&pdev->dev, "invalid sirq polarity in
aspeed,lpc-interrupts property\n");
               goto err_clk_disable;
       }
       sirq_polarity = rc;

?

> +       aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
> +
>         aspeed_vuart_set_enabled(vuart, true);
>         aspeed_vuart_set_host_tx_discard(vuart, true);
>         platform_set_drvdata(pdev, vuart);


-- 
With Best Regards,
Andy Shevchenko
