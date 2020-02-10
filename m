Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D61156DB8
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 03:50:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48G9Pp6p96zDqR0
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 13:50:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WOEeBQJ0; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48G9MN1hcSzDqR0;
 Mon, 10 Feb 2020 13:48:32 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id w25so5170506qki.3;
 Sun, 09 Feb 2020 18:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KhNOBWw692sW7TLm9JHYqZ1FYMPS0CnqLtLM69UIajg=;
 b=WOEeBQJ0t4o7kDPXaLRu2aiMGXa9fWpVN/m5JJSOjmwXl7Q2FdrY09xHs+kchDgXNs
 CkiFINK0K96swqWpkyUXYEeNGIfRuDlGs9agaZPvrJrN/8ArqvluPjUd5mGk8PP/BZde
 hmwlVX4z4biZzsRlWmJEelEq+bmi9W6kRHULM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KhNOBWw692sW7TLm9JHYqZ1FYMPS0CnqLtLM69UIajg=;
 b=s5S9B3S4kkoZSHSe2VeX2hhCS7gGRNnrL9lhQK+6bKkDV9DxDOUpycvlWLXd1wYHB9
 wHyztU+Pr+oROhswhTUcGkP2qbrhVA1HFBp7C7Tk4s24jD2NGw+yXbYEmK7g8c3jHKVP
 6jdExWiqCD39PUgHkuHUiTfXhw1ljsHZ+pZRxDAMVPX3D4zkXbIjAjKYwpadzQxkagA/
 2Z3cnzw4YZRcm/MnWt7jIUtV5VOn4vVXxuYYOp5ZYI9VYHTPtSQ85Nv3fi4JtFNBfB6h
 ST2aPtmK6kF68Jeu4/koT8Bdz9Bp6Z/KeqG6bubhVBFISBJ9g/SXgo7uDXMAcv3yitJA
 RtQQ==
X-Gm-Message-State: APjAAAWtFpsxiCqnC+QhCnHoJB4kT5ImEWCPvWynikXFXp45ea38EGKu
 tqbbvkNs9Q2uX0el8ReDyZuhVOr/6/VEqrN3Q1I=
X-Google-Smtp-Source: APXvYqwi4wpb+TDqKMc2Iotgad5SAilC7344vZRaKVrhKX1IL3F/3MiUz7/wpQomKlkUZEydEsGijhtRhBVNloF/UGs=
X-Received: by 2002:a37:9dc8:: with SMTP id g191mr8766106qke.171.1581302908581; 
 Sun, 09 Feb 2020 18:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
 <20200131222157.20849-3-rentao.bupt@gmail.com>
In-Reply-To: <20200131222157.20849-3-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 02:48:17 +0000
Message-ID: <CACPK8XcmUYhnePr1AG2M9P-oGvOM=zCM+r44jWUzPYGxUEGOGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: gadget: aspeed: add ast2600 vhub support
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 31 Jan 2020 at 22:22, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add AST2600 support in aspeed-vhub driver. There are 3 major differences
> between AST2500 and AST2600 vhub:
>   - AST2600 supports 7 downstream ports while AST2500 supports 5.
>   - AST2600 supports 21 generic endpoints while AST2500 supports 15.
>   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
>     AST2600.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
>  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> index 83ba8a2eb6af..605500b19cf3 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> @@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
>         depends on ARCH_ASPEED || COMPILE_TEST
>         depends on USB_LIBCOMPOSITE
>         help
> -         USB peripheral controller for the Aspeed AST2500 family
> -         SoCs supporting the "vHub" functionality and USB2.0
> +         USB peripheral controller for the Aspeed AST2400, AST2500 and
> +         AST2600 family SoCs supporting the "vHub" functionality and USB2.0
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index 94081cc04113..c827bf420278 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -42,6 +42,11 @@ static const struct ast_vhub_config ast2400_config = {
>         .max_epns = 15,
>  };
>
> +static const struct ast_vhub_config ast2600_config = {
> +       .max_ports = 7,
> +       .max_epns = 21,
> +};
> +
>  static const struct of_device_id ast_vhub_dt_ids[] = {
>         {
>                 .compatible = "aspeed,ast2400-usb-vhub",
> @@ -51,6 +56,10 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
>                 .compatible = "aspeed,ast2500-usb-vhub",
>                 .data = &ast2400_config,
>         },
> +       {
> +               .compatible = "aspeed,ast2600-usb-vhub",
> +               .data = &ast2600_config,
> +       },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> --
> 2.17.1
>
