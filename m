Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBE2D744E
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 11:56:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csnlt5s9VzDqv9
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 21:56:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=H6Qt7rRq; dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csnkd1PyCzDqkq;
 Fri, 11 Dec 2020 21:55:36 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id s6so3957755qvn.6;
 Fri, 11 Dec 2020 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QdoHrrkUrH8spW9hsEUvaf3pNxGmQYKrvERe+V2jfHg=;
 b=H6Qt7rRq8Fac2RnPo2pkZ1qhIcBIxMjQwW5Npu+JAavqN3A3YZtPNIl+OKFz1WjBSt
 7+08A1Zl7oNG/REpAOqWpIIjwmRgbZOdSr623jO38G7Db/iCQzcq922mO6yaugojE+wG
 bM00Smh0iZ5ZTdxY/Oif228zNpjFuhYTfkO7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QdoHrrkUrH8spW9hsEUvaf3pNxGmQYKrvERe+V2jfHg=;
 b=FxZbtiS3leSzK7QhyDiMNZZ6CCQyUuNP2QiRUCGYQbt3ZIqlBAckuqtrdyoELFrRq5
 RDxmHMWdU8czo+lP/QzClND9sUj/9pN2Y61QGDmUQ17a6XVdSceHVJMQee40MkVLkdxn
 284xhoVqCXwMr4AEBq9D/QLWfu2jP+V4gmb0e3bemC9sXfumrH3HtPDIHtF9V1UBlbX4
 bo35RoTxCogUFLtSPhblOielZFlNrfWyHd84m0EIkFY6ZhV1S8CuT48I0Yf+o06wFxMo
 e5z+SUIYRl00zKqx/P/44ijIihON9c60CbVAgHt3DeQ3J5qifNu7Qaz5g2IDxGfWFHCc
 BvUQ==
X-Gm-Message-State: AOAM532GSMgJCDqcnGaA9mt4VB2qzffTAGhRaZavrJeo2AD13Upnm58R
 nYwCIPAbo8z9PNcXUuQLee2aUEkLc+zmmPOlSJA=
X-Google-Smtp-Source: ABdhPJzZwGieUQ4L65aIz5AhrZ471LVCKHRMGZT2IlzX+vcQSL+UVzLS7K96G6okZZjsaSYt7Tj+OqqmRqZCEsS2UTw=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr15146718qvd.16.1607684132584; 
 Fri, 11 Dec 2020 02:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20201211031741.23711-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20201211031741.23711-1-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 11 Dec 2020 10:55:21 +0000
Message-ID: <CACPK8XdDn7GfGKAwZnoZrFc5wZW4p=xMuLmCcHvEyyNJZ8rGvw@mail.gmail.com>
Subject: Re: [PATCH] driver: aspeed: g6: Fix PWMG0 pinctrl setting
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Dec 2020 at 03:18, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> The SCU offset for signal PWM8 in group PWM8G0 is wrong, fix it from
> SCU414 to SCU4B4.
> Besides that, When PWM8~15 of PWMG0 set it needs to clear SCU414 bits at
> the same time.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 26 ++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 34803a6c7664..6e61f045936f 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -346,50 +346,58 @@ FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
>  FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
>
>  #define D22 40
> -SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
> -SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU414, 8));
> +SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8))

Is this missing a semicolon?

> +SIG_EXPR_LIST_DECL_SEMG(D22, PWM8, PWM8G0, PWM8, SIG_DESC_SET(SCU4B4, 8),
> +                       SIG_DESC_CLEAR(SCU414, 8));
