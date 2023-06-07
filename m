Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F137267DF
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 19:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbw860wGFz3dxQ
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 03:59:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=62.142.5.84; helo=fgw23-7.mail.saunalahti.fi; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbw7m3YGHz3dsR
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2023 03:58:42 +1000 (AEST)
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c846300f-055c-11ee-b972-005056bdfda7;
	Wed, 07 Jun 2023 20:57:35 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Wed, 7 Jun 2023 20:57:34 +0300
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] pinctrl: npcm7xx: Add missing check for ioremap
Message-ID: <ZIDFDgcM07aPlzoB@surfacebook>
References: <20230607095829.1345-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607095829.1345-1-jiasheng@iscas.ac.cn>
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, openbmc@lists.ozlabs.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Wed, Jun 07, 2023 at 05:58:29PM +0800, Jiasheng Jiang kirjoitti:
> Add check for ioremap() and return the error if it fails in order to
> guarantee the success of ioremap().

This one is correct, otherwise the GPIO is not functional at all.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index 21e61c2a3798..843ffcd96877 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1884,6 +1884,8 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
>  		}
>  
>  		pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
> +		if (!pctrl->gpio_bank[id].base)
> +			return -EINVAL;
>  
>  		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
>  				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,

-- 
With Best Regards,
Andy Shevchenko


