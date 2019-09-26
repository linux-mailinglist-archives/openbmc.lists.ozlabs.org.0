Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF8BECC7
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 09:45:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f6RL1kVbzDqkT
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 17:45:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b4Gk/MWu"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f6Qg3LfkzDq6l
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 17:44:59 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id u22so1624147qtq.13
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BetX564FvNrD8mD0rrWYdFMWJfLRfzaodGrZB0UjDEg=;
 b=b4Gk/MWu53qeWb+AtC7KmmjzLq9iZB9qi2AWnCjJpg69ckVOcR+pfVJlnF4AL/elw+
 BNe1erw9trZhydIP+Rwqk7oMA+xeTA+LAKGFLZJVS4fI7kHiQobRah9O3m+u/1785JAE
 X1ygrqrztccCfdi8QTjwpgSjrY7X4XeZHEGeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BetX564FvNrD8mD0rrWYdFMWJfLRfzaodGrZB0UjDEg=;
 b=mKMs/9LpUf52amip6Q9H8LI2w6UgV+66cAij4OIxDrgbLD3FIUvG7w5kc7WM9B1yve
 ZGZN8BI9lthjvhjlAPI0cdk5mNHdJsMWrSYPA5VuF9fYiVnoYIDMRviqtsYz2J8flYwF
 SbZChoIFQbrc9Wye44Apyba3Afq7DAuJUxNg4SSFGbPNaueThqx5wEesZo70ZXJJVfmG
 KyJZOAiM/dzLmzIOm9y3xftw/n5TwQR7PeCSLFcjZivZitZvwZSgjZJ1onpDF2plelHe
 zrozgHzltdaJxJATtrw3vN52Vs/KFOGnHGHI29S1SFtNityLdH+rki8884amvOBNG2rA
 UB/g==
X-Gm-Message-State: APjAAAV9UKjuu7k5AlPpZaQUXRit0X3yVsQpiHipFly0d0yiCxQy5c/t
 HfQND5nVe6xzTMDtVbdYgW5wUav16v7YIjfoumo=
X-Google-Smtp-Source: APXvYqymtQXhXAcOKnwmpgNe4MIQ5+Gg2lYecnFDBFdOmjIyZ2gOzK3kkIA1gXpbiwr4+epfQdd84k+2TWPXCehT1oM=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr2496876qtd.255.1569483896316; 
 Thu, 26 Sep 2019 00:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190925153439.27475-1-andrew@aj.id.au>
 <20190925153439.27475-4-andrew@aj.id.au>
In-Reply-To: <20190925153439.27475-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 07:44:44 +0000
Message-ID: <CACPK8XeNUcYJYTHcpVBE=tsrS_dOFJ9FQgxvspweBqTOwvmWmA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 v2 3/8] clk: aspeed: Add RMII RCLK gates for
 both AST2500 MACs
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
> RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> single gate for each MAC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/clk/clk-aspeed.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index abf06fb6453e..9bd5155598d6 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -14,7 +14,7 @@
>
>  #include "clk-aspeed.h"
>
> -#define ASPEED_NUM_CLKS                36
> +#define ASPEED_NUM_CLKS                38
>
>  #define ASPEED_RESET2_OFFSET   32
>
> @@ -28,6 +28,7 @@
>  #define  AST2400_HPLL_BYPASS_EN        BIT(17)
>  #define ASPEED_MISC_CTRL       0x2c
>  #define  UART_DIV13_EN         BIT(12)
> +#define ASPEED_MAC_CLK_DLY     0x48
>  #define ASPEED_STRAP           0x70
>  #define  CLKIN_25MHZ_EN                BIT(23)
>  #define  AST2400_CLK_SOURCE_SEL        BIT(18)
> @@ -462,6 +463,30 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_clk_data->hws[ASPEED_CLK_MAC] = hw;
>
> +       if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-scu")) {
> +               /* RMII 50MHz RCLK */
> +               hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0,
> +                                               50000000);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +
> +               /* RMII1 50MHz (RCLK) output enable */
> +               hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
> +                               scu_base + ASPEED_MAC_CLK_DLY, 29, 0,
> +                               &aspeed_clk_lock);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +               aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
> +
> +               /* RMII2 50MHz (RCLK) output enable */
> +               hw = clk_hw_register_gate(dev, "mac2rclk", "mac12rclk", 0,
> +                               scu_base + ASPEED_MAC_CLK_DLY, 30, 0,
> +                               &aspeed_clk_lock);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +               aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
> +       }
> +
>         /* LPC Host (LHCLK) clock divider */
>         hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
>                         scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
> --
> 2.20.1
>
