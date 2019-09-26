Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4DBECC5
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:44:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f6Q057N6zDqlJ
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:44:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b3LQpx3i"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f6PQ5RnYzDqjR
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:43:54 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id u22so937326qkk.11
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1+WRjzLmZXkUcrtaUp2dfVZ/xtZKUhapEMf2FdkMfaM=;
 b=b3LQpx3iFiwKLRCzLwRTzDB1AKD1/rk8dbghWL/S3MXX17+0TgKyzM8Vqe8QwnuwOO
 plDS1u6y35+tWpH5Log2+lHy0Gnyh6lbkJB0lHKiAtc9Vo+UkoMkz2PkkQ/XSK/LQLa1
 5coKobioff+RfQjguqkNjo64n/IC35q/cuAjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+WRjzLmZXkUcrtaUp2dfVZ/xtZKUhapEMf2FdkMfaM=;
 b=qO+63u6/TLTae/kPw+gxsvBgbJTWSMQeUyV8mOhuXFwNCk2QYCL5OZPbHJVcpB7gXb
 fWXoZxk0iY8Im4tjbh8W0gD10KulYG4bQ/K95TtO5ZpNouRYH6lvyDcxZ0A2KnXSrK93
 REqmb0CFGWPr30NZQamEsSCP+sIdJ/jY59EjCirLzSIhVOv8WrF6v4kbm8z9Gn7CN9q7
 CgB1Srqq91EywN+GXiQYj8soNDviUNJhVy5dVzQj1C2MTFCBfRPla/JbQkqSvZ/xq3CV
 wpM/bEqjuyWrQobnvL274YvOTj3gPloGOoNDHTLfAKIiH2+6ll2v5gx9rstjDrMraNt4
 MFng==
X-Gm-Message-State: APjAAAU6gvQBgf6PfiswHahISuk1WoxNjtXHXsn8PY1Cdl50f4QzNP53
 Hqgcq6BAuBKNDMRRHsuXd9bt4FchKTMPesmjzTaGb9ZJ
X-Google-Smtp-Source: APXvYqxWkzE3WxCrLoPbUEFv7tudpKHRTHgec9eh4E+jQelVC09lnRnrKy6VqGlwWsa4j7+3ka/fdV2gXMIjHpyTqA8=
X-Received: by 2002:a37:4f4c:: with SMTP id d73mr1901443qkb.171.1569483829819; 
 Thu, 26 Sep 2019 00:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190925153439.27475-1-andrew@aj.id.au>
 <20190925153439.27475-5-andrew@aj.id.au>
In-Reply-To: <20190925153439.27475-5-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:43:37 +0000
Message-ID: <CACPK8XfSsSBWmXUbvK0zd5_sWMremUx9nQVkG5=6rX_xJ3BTBQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 4/8] clk: ast2600: Add RMII RCLK gates
 for all four MACs
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
> RCLK is a fixed 50MHz clock derived from HPLL/HCLK that is described by a
> single gate for each MAC.

Nice. Can you send this upstream, asking Stephen if he will include it
5.4 as it fixes networking?

Perhaps something like this to clarify the commit message:

RCLK is a fixed 50MHz clock derived from HPLL (MAC1/2)  or HCLK
(MAC3/4) that is enabled by a
single gate for each MAC.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/clk/clk-ast2600.c | 47 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 1c1bb39bb04e..63558d5e9f36 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -15,7 +15,7 @@
>
>  #include "clk-aspeed.h"
>
> -#define ASPEED_G6_NUM_CLKS             67
> +#define ASPEED_G6_NUM_CLKS             71
>
>  #define ASPEED_G6_SILICON_REV          0x004
>
> @@ -40,6 +40,9 @@
>
>  #define ASPEED_G6_STRAP1               0x500
>
> +#define ASPEED_MAC12_CLK_DLY           0x340
> +#define ASPEED_MAC34_CLK_DLY           0x350
> +
>  /* Globally visible clocks */
>  static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
>
> @@ -485,6 +488,11 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_SDIO] = hw;
>
> +       /* MAC1/2 RMII 50MHz RCLK */
> +       hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0, 50000000);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
>         /* MAC1/2 AHB bus clock divider */
>         hw = clk_hw_register_divider_table(dev, "mac12", "hpll", 0,
>                         scu_g6_base + ASPEED_G6_CLK_SELECTION1, 16, 3, 0,
> @@ -494,6 +502,27 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC12] = hw;
>
> +       /* RMII1 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
> +
> +       /* RMII2 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac2rclk", "mac12rclk", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 30, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
> +
> +       /* MAC1/2 RMII 50MHz RCLK */
> +       hw = clk_hw_register_fixed_rate(dev, "mac34rclk", "hclk", 0, 50000000);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
>         /* MAC3/4 AHB bus clock divider */
>         hw = clk_hw_register_divider_table(dev, "mac34", "hpll", 0,
>                         scu_g6_base + 0x310, 24, 3, 0,
> @@ -503,6 +532,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC34] = hw;
>
> +       /* RMII3 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac3rclk", "mac34rclk", 0,
> +                       scu_g6_base + ASPEED_MAC34_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC3RCLK] = hw;
> +
> +       /* RMII4 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "mac4rclk", "mac34rclk", 0,
> +                       scu_g6_base + ASPEED_MAC34_CLK_DLY, 30, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC4RCLK] = hw;
> +
>         /* LPC Host (LHCLK) clock divider */
>         hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
>                         scu_g6_base + ASPEED_G6_CLK_SELECTION1, 20, 3, 0,
> --
> 2.20.1
>
