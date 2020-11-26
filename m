Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1AC2C51A3
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 10:53:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChY3m6vCmzDqxX
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 20:53:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hjFNlGqm; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChY2r1CCSzDr8H;
 Thu, 26 Nov 2020 20:52:35 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id d9so1053829qke.8;
 Thu, 26 Nov 2020 01:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhAJwHP75hsl97cC7IiYuLFHgheKFMaUCjy83jp4Xo8=;
 b=hjFNlGqmmrZOvOqgtSKCMkq23TreyWsww2nNG6qSTyjbNybNlEzTAIULz8iEfDfZFr
 1xEj/PepyV12Gz0KFPN13cFk0aRhKPB0kOrbkbcVx4J3o2u4zKyizzGeJUK4hfKF1EuE
 HTgCJ0cpMkiWXjqau3GJ4YaU6OWpnBkl9cMq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhAJwHP75hsl97cC7IiYuLFHgheKFMaUCjy83jp4Xo8=;
 b=fXc3VIB8JJi8+iayUWKOzY52dNEqY19miXnUJR2LvWFuEr6caqHra/I5TBGsdBgrJV
 OXtTeX4UPpnIQ9bonPG03MAz18Z/zgjXCDxEe0qWYJNA4yWcQuMztjD5cbJaquA7+z7N
 zXQ74Dk1NhUG9t9QrHCEhXkPXei4FoFWgiDAN+xjXuGNE3wNOzg0CzCrPaSWf5Nw/mgB
 bWN/z5IPOvIUheeYikCDZro8oO0K8dPQHHmAVFW5EwhflfcAFX0nQXUQ4V7cxMbbe+bw
 NhrwUbSNVbPyZFGe5Jhh+KHMeXZOgAIkrWon6CJVWIIfdT+F9S4SWcW9Ao04bP7KZHDm
 ueVQ==
X-Gm-Message-State: AOAM532eTsmhKJumic+Z+phSIRpb2kS+PZWY0IZwqbdjcIagCXFQdQS3
 YClbGJkHGyEyQC4/qat8diG3lb1GkLlgV1nKhR8=
X-Google-Smtp-Source: ABdhPJxBkPAme7JvzEXh0g2dZnoiqdHBTGf5YeQLBNz4RkIbTThw92RlwtAreusQavSct1HU26j3F0mgO8JuE1QS9RU=
X-Received: by 2002:a37:6805:: with SMTP id d5mr2390243qkc.66.1606384350546;
 Thu, 26 Nov 2020 01:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20201126063337.489927-1-andrew@aj.id.au>
In-Reply-To: <20201126063337.489927-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Nov 2020 09:52:18 +0000
Message-ID: <CACPK8XeWH0269EGg6=CRSrsk0U5tQNJkmgNP=FKuRPpbE-vpeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix GPIO requests on pass-through banks
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
Cc: Sasha Levin <sashal@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Nov 2020 at 06:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Commit 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> fixes access to GPIO banks T and U on the AST2600.

...but caused a regression when muxing GPIOs.


> Fixes: 6726fbff19bf ("pinctrl: aspeed: Fix GPI only function problem.")
> Cc: Billy Tsai <billy_tsai@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I didn't read all of the text, but the code change looks good. This
should go to stable as the offending commit was also added to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Tested-by: Joel Stanley <joel@jms.id.au>
Cc: stable@vger.kernel.org


> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 74 +++++++++++++++++++++++--
>  drivers/pinctrl/aspeed/pinmux-aspeed.h  |  7 ++-
>  2 files changed, 72 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 1d603732903f..9c44ef11b567 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -286,14 +286,76 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
>  static bool aspeed_expr_is_gpio(const struct aspeed_sig_expr *expr)
>  {
>         /*
> -        * The signal type is GPIO if the signal name has "GPI" as a prefix.
> -        * strncmp (rather than strcmp) is used to implement the prefix
> -        * requirement.
> +        * We need to differentiate between GPIO and non-GPIO signals to
> +        * implement the gpio_request_enable() interface. For better or worse
> +        * the ASPEED pinctrl driver uses the expression names to determine
> +        * whether an expression will mux a pin for GPIO.
>          *
> -        * expr->signal might look like "GPIOB1" in the GPIO case.
> -        * expr->signal might look like "GPIT0" in the GPI case.
> +        * Generally we have the following - A GPIO such as B1 has:
> +        *
> +        *    - expr->signal set to "GPIOB1"
> +        *    - expr->function set to "GPIOB1"
> +        *
> +        * Using this fact we can determine whether the provided expression is
> +        * a GPIO expression by testing the signal name for the string prefix
> +        * "GPIO".
> +        *
> +        * However, some GPIOs are input-only, and the ASPEED datasheets name
> +        * them differently. An input-only GPIO such as T0 has:
> +        *
> +        *    - expr->signal set to "GPIT0"
> +        *    - expr->function set to "GPIT0"
> +        *
> +        * It's tempting to generalise the prefix test from "GPIO" to "GPI" to
> +        * account for both GPIOs and GPIs, but in doing so we run aground on
> +        * another feature:
> +        *
> +        * Some pins in the ASPEED BMC SoCs have a "pass-through" GPIO
> +        * function where the input state of one pin is replicated as the
> +        * output state of another (as if they were shorted together - a mux
> +        * configuration that is typically enabled by hardware strapping).
> +        * This feature allows the BMC to pass e.g. power button state through
> +        * to the host while the BMC is yet to boot, but take control of the
> +        * button state once the BMC has booted by muxing each pin as a
> +        * separate, pin-specific GPIO.
> +        *
> +        * Conceptually this pass-through mode is a form of GPIO and is named
> +        * as such in the datasheets, e.g. "GPID0". This naming similarity
> +        * trips us up with the simple GPI-prefixed-signal-name scheme
> +        * discussed above, as the pass-through configuration is not what we
> +        * want when muxing a pin as GPIO for the GPIO subsystem.
> +        *
> +        * On e.g. the AST2400, a pass-through function "GPID0" is grouped on
> +        * balls A18 and D16, where we have:
> +        *
> +        *    For ball A18:
> +        *    - expr->signal set to "GPID0IN"
> +        *    - expr->function set to "GPID0"
> +        *
> +        *    For ball D16:
> +        *    - expr->signal set to "GPID0OUT"
> +        *    - expr->function set to "GPID0"
> +        *
> +        * By contrast, the pin-specific GPIO expressions for the same pins are
> +        * as follows:
> +        *
> +        *    For ball A18:
> +        *    - expr->signal looks like "GPIOD0"
> +        *    - expr->function looks like "GPIOD0"
> +        *
> +        *    For ball D16:
> +        *    - expr->signal looks like "GPIOD1"
> +        *    - expr->function looks like "GPIOD1"
> +        *
> +        * Testing both the signal _and_ function names gives us the means
> +        * differentiate the pass-through GPIO pinmux configuration from the
> +        * pin-specific configuration that the GPIO subsystem is after: An
> +        * expression is a pin-specific (non-pass-through) GPIO configuration
> +        * if the signal prefix is "GPI" and the signal name matches the
> +        * function name.
>          */
> -       return strncmp(expr->signal, "GPI", 3) == 0;
> +       return !strncmp(expr->signal, "GPI", 3) &&
> +                       !strcmp(expr->signal, expr->function);
>  }
>
>  static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> index f86739e800c3..dba5875ff276 100644
> --- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
> +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
> @@ -452,10 +452,11 @@ struct aspeed_sig_desc {
>   * evaluation of the descriptors.
>   *
>   * @signal: The signal name for the priority level on the pin. If the signal
> - *          type is GPIO, then the signal name must begin with the string
> - *          "GPIO", e.g. GPIOA0, GPIOT4 etc.
> + *          type is GPIO, then the signal name must begin with the
> + *          prefix "GPI", e.g. GPIOA0, GPIT0 etc.
>   * @function: The name of the function the signal participates in for the
> - *            associated expression
> + *            associated expression. For pin-specific GPIO, the function
> + *            name must match the signal name.
>   * @ndescs: The number of signal descriptors in the expression
>   * @descs: Pointer to an array of signal descriptors that comprise the
>   *         function expression
> --
> 2.27.0
>
