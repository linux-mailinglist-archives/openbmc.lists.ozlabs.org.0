Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E231BAD61
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:01:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBws6vG4zDqLM
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:01:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Yh5c0yDf"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBtN4qhFzDqLF
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 14:58:52 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id y144so14005578qkb.7
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuPVA4YNUgdfVSz2wP8la6nheq6ek02FsCGDFsnMW2Q=;
 b=Yh5c0yDfwXy8AOPub4Uu/d1+e2vxgtJJ1X4Zkhv/AFFRGuSEB11/Cd8P5p3yiyOb1d
 hdMJgQ9TcGfrmmgyFKUhk4LNJZ5hPuTJTabXvOOW9XBrEBg5f5a5NIYeKoku0Reqko71
 IfI+BcY1uLJ9w9gAVViHDnm2Amj+nfvN5xCwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuPVA4YNUgdfVSz2wP8la6nheq6ek02FsCGDFsnMW2Q=;
 b=O0eVun/4rrJ08LeeFqWznsqNqF1DtFgArvaYiVneExSKTCWkRXUuBeuMHBEN1e0yBB
 Q6h1GOiAjmEYSKsaGq0s5o9RgcfI04r2agn5iue1O+h6aGvHyo3RDHL+9NHAWyuERFZ4
 Yc+9gRt5aGRqv8WxO52YKHARoHo9FlXzsvQej0NtoP/EVAo5GUWfoPfV8PJbviCO2gMN
 VM5ny7K70H8gNee+k5UQ1CS2Ods4+oKodMykOssACzhfgXmpQHn9Rt7dFfV1rBDaVZKR
 TWk0Vj6XzM6uD8Jhd7LGsBb+v8aP6yO+BXnP9OMpybv49M6AjwFIQrEYGsriNxh46IWs
 LncQ==
X-Gm-Message-State: APjAAAX2LGqrgWZvljs32Gaw0fYSbIvgi/ll0EJyNTyDpYiE5nEI0blz
 cX1UGzSuhrYsNdPm0Jc+eSGtxiejoA1GfHnddwFn4A==
X-Google-Smtp-Source: APXvYqyb5ARsfZ/a8yqN4bNUlVC8BIINrBdGp78z6JXTrznssGUAUHIrgcgxLpIjG4n+WiQChd1ku/ERSV9vRgBqUvk=
X-Received: by 2002:a37:4a54:: with SMTP id x81mr15414547qka.292.1569214730035; 
 Sun, 22 Sep 2019 21:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-5-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-5-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 04:58:38 +0000
Message-ID: <CACPK8XccXtSrcavpXBERE4cHRQmJzbSa5g61cM+6n_nGTb51bQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 4/6] clk: ast2600: Add RMII RCLK gates for
 all four MACs
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
> RCLK is a fixed 50MHz clock derived from HPLL that is described by a
> single gate for each MAC.

This is true for the AST2500 as well (SCU48). For completeness, can we
have a patch that enables that?

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/clk/clk-ast2600.c | 37 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 1c1bb39bb04e..45531495391c 100644
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
> @@ -494,6 +497,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC12] = hw;
>
> +       /* RMII1 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "rmii1_rclk", "hpll", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);

We know that this is a 50MHz clock that comes from HPLL. We could
describe that in the driver by creating a RCLK and then these four
gates hang off of that parent.

This would only be for completeness and correctness, it doesn't bring
any added functionality to the system.




> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
> +
> +       /* RMII2 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "rmii2_rclk", "hpll", 0,
> +                       scu_g6_base + ASPEED_MAC12_CLK_DLY, 30, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
> +
>         /* MAC3/4 AHB bus clock divider */
>         hw = clk_hw_register_divider_table(dev, "mac34", "hpll", 0,
>                         scu_g6_base + 0x310, 24, 3, 0,
> @@ -503,6 +522,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
>                 return PTR_ERR(hw);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_MAC34] = hw;
>
> +       /* RMII3 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "rmii3_rclk", "hpll", 0,
> +                       scu_g6_base + ASPEED_MAC34_CLK_DLY, 29, 0,
> +                       &aspeed_g6_clk_lock);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC3RCLK] = hw;
> +
> +       /* RMII4 50MHz (RCLK) output enable */
> +       hw = clk_hw_register_gate(dev, "rmii4_rclk", "hpll", 0,
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
