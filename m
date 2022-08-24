Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8F59F066
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 02:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC6qj0CFZz3bfH
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 10:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kUqxJzNV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kUqxJzNV;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC6qF4K8Yz2xJT;
	Wed, 24 Aug 2022 10:46:31 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id o3so354590wrv.6;
        Tue, 23 Aug 2022 17:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XGaQkMUxyNcihNRKJRLiIaRtaN1b1CuxNyHRTtmolkM=;
        b=kUqxJzNVKYfqKUDMRKI8VVAC+gyu48N1ltCtB3CEPciKXABCOLq7ugr6gCvnI48uO9
         D6imX3IQ/sPcslARwJzPrzLjYxUboqjS0W0TxJQE9YGSr5u5TbLtX3G0kHF1n+k52XaS
         axHOVIzGKc9NqQAyjQQ2NyDBGOvqtxdFaySWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XGaQkMUxyNcihNRKJRLiIaRtaN1b1CuxNyHRTtmolkM=;
        b=k4AZPHdAeirbBp7JQL7huHwTkL7zUyDzopayCR1XZ1zdI7Dn/9dAGiUpPZ5opNEfdD
         C74g2BgGTZTzSHYwgSoBSsqC7nsrZFdz2Mo/df0arDac4FspTMCwkmJdgsu70M1kggUR
         074LE3tFyVfBcw9k5rx95QfQfOpaIh8ExMC1XdnZ2l7RoPPw5/6YZrAZ4yKLCxyEH4Xd
         /b04S+yA1KaiS0B2TPVc8LpxQCHJrUIvpxKTutQ3QW3c3pEQAXbP9aUlnmPlgWBTpmIL
         +/sJZq9+rxy52y7kGPkz2LScOujQ9+I0FVQ/Y4jFdyr1OURVqSShPSvm6+1U/BkmHQ+a
         NvEQ==
X-Gm-Message-State: ACgBeo3+VaxXMXbbI84iff4ZbPcCxKLnLSGeksRttwb5VYNwz1fXYrBI
	OCdhMrFw3/u0dx0d4pt09bYSuzdoKGFCXoSCEWU=
X-Google-Smtp-Source: AA6agR7fuYY9EZSN0oIP//lfh/BqtJq0jICtYK+RauIjd9N8/v0xxKlLpD1fH0FuztD8gB30kSvbc30iqADMMDyJiMU=
X-Received: by 2002:a05:6000:1c0c:b0:225:569c:dd2c with SMTP id
 ba12-20020a0560001c0c00b00225569cdd2cmr7029200wrb.628.1661301985880; Tue, 23
 Aug 2022 17:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Aug 2022 00:46:13 +0000
Message-ID: <CACPK8XfeocBz6phbYyuHHMmZhisw5kGr3QpkdWv3LocvAN=WsA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: aspeed_wdt: Reorder output signal register configuration
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Aug 2022 at 09:49, Chin-Ting Kuo
<chin-ting_kuo@aspeedtech.com> wrote:
>
> If the output driving type is push-pull mode, the output
> polarity should be selected in advance. Otherwise, an unexpected
> value will be output at the moment of changing to push-pull mode.
> Thus, output polarity, WDT18[31], must be configured before
> changing driving type, WDT18[30].
>
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Thanks Chin-Ting.

Fixes: 012c04601f9d ("watchdog: aspeed: Support configuration of
external signal properties")
Reviewed-by: Joel Stanley <joel@jms.id.au>

I wonder if any of these machines hit the bug:

$ git grep -l aspeed,ext-push-pull arch/arm/boot/dts/
arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts


> ---
>  drivers/watchdog/aspeed_wdt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 436571b6fc79..a03e4ff812a2 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -325,18 +325,18 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>                 u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>
>                 reg &= config->ext_pulse_width_mask;
> -               if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> -                       reg |= WDT_PUSH_PULL_MAGIC;
> +               if (of_property_read_bool(np, "aspeed,ext-active-high"))
> +                       reg |= WDT_ACTIVE_HIGH_MAGIC;
>                 else
> -                       reg |= WDT_OPEN_DRAIN_MAGIC;
> +                       reg |= WDT_ACTIVE_LOW_MAGIC;
>
>                 writel(reg, wdt->base + WDT_RESET_WIDTH);
>
>                 reg &= config->ext_pulse_width_mask;
> -               if (of_property_read_bool(np, "aspeed,ext-active-high"))
> -                       reg |= WDT_ACTIVE_HIGH_MAGIC;
> +               if (of_property_read_bool(np, "aspeed,ext-push-pull"))
> +                       reg |= WDT_PUSH_PULL_MAGIC;
>                 else
> -                       reg |= WDT_ACTIVE_LOW_MAGIC;
> +                       reg |= WDT_OPEN_DRAIN_MAGIC;
>
>                 writel(reg, wdt->base + WDT_RESET_WIDTH);
>         }
> --
> 2.25.1
>
