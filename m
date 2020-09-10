Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C62639C9
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 04:03:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn2HQ6syDzDqb9
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 12:03:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nBsz6061; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn2GC0K4bzDqPb;
 Thu, 10 Sep 2020 12:02:42 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id w1so4680310edr.3;
 Wed, 09 Sep 2020 19:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=142NeoCcx3wHhBUQEiqLvgYqCFhcu9mCRWA11xQEdVg=;
 b=nBsz6061VcS6cYSgt5yHM+R707WWE5ZZd412JS1mVQWo22/CqWZA4jbCYWRRKRySc5
 LstyfExbNbtK4mWp/VqaQIk0dnYfPY8Gyv2JmR7CDjI6X5l81dgMIb40FSENPz8VrftB
 erSBKmbxWGVQJ3/4S7wPVYfmwN/IPSDi5dyvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=142NeoCcx3wHhBUQEiqLvgYqCFhcu9mCRWA11xQEdVg=;
 b=qpjW9ATYquV9KYt8ih3S+AJaJwre626nrlfzNIj3hjgdeYBHL+NMW/cKGgi8fZXxHb
 ZmqIxaCQbP6HvFNfLFIRmVOYiDCOvVDY5OHRhuU8HiH1WKfb0sDpB1/xDrsK7vHW9aNE
 eg2fNA2VM7HhiZ0Wq5x9WLgSgj+0pRByBEHDTX/eozJE4gO1DIL1TjZEq/rOcSZc9Yvs
 9aJLoJsXArzChU05kHjYaNYYWbCafcwjzTPj14vTFDgQvhcEsc5ulmaccjf12APuMvt0
 hKdRaUXA7yH4hcdaVo9u1Exux6WfUa9tsHPitSbrFMimJQQ+lJXTlaYIChul0RITkYG6
 CSLw==
X-Gm-Message-State: AOAM533ArfcIWvTfFV0ReaQ94aRzuQDQmIsO09tTDg6OsHGgObBALvbB
 ayRrWpH280ajdOgHkoyC84ikddAGxKaDAgy5l54=
X-Google-Smtp-Source: ABdhPJyp05MBzEqBviRTff7yzhFYD8zxQ47BHJ7qdCVuj6D4R7LJpyBwxAt5/LL+KaXatY3R5CwSh2ltSkkRFgzQfeI=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr7240898edv.232.1599703358638; 
 Wed, 09 Sep 2020 19:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au>
 <20200909114312.2863675-4-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 02:02:26 +0000
Message-ID: <CACPK8Xd5rE_s680Y0wdktoP4RwDzACCaetUxBrbWSTGnwBMWVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO
 banks
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
Cc: johnny_huang@aspeedtech.com, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Sep 2020 at 11:43, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> These were skipped in the original patches adding pinconf support for
> the AST2600.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 7efe6dbe4398..34803a6c7664 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -19,6 +19,7 @@
>
>  #define SCU400         0x400 /* Multi-function Pin Control #1  */
>  #define SCU404         0x404 /* Multi-function Pin Control #2  */
> +#define SCU40C         0x40C /* Multi-function Pin Control #3  */
>  #define SCU410         0x410 /* Multi-function Pin Control #4  */
>  #define SCU414         0x414 /* Multi-function Pin Control #5  */
>  #define SCU418         0x418 /* Multi-function Pin Control #6  */
> @@ -2591,6 +2592,22 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
>         /* MAC4 */
>         { PIN_CONFIG_POWER_SOURCE,   { F24, B24 }, SCU458, BIT_MASK(5)},
>         { PIN_CONFIG_DRIVE_STRENGTH, { F24, B24 }, SCU458, GENMASK(3, 2)},
> +
> +       /* GPIO18E */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, Y1, Y4, SCU40C, 4),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   Y1, Y4, SCU40C, 4),
> +       /* GPIO18D */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, AB4, AC5, SCU40C, 3),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   AB4, AC5, SCU40C, 3),
> +       /* GPIO18C */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, E4, E1, SCU40C, 2),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   E4, E1, SCU40C, 2),
> +       /* GPIO18B */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, B2, D3, SCU40C, 1),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   B2, D3, SCU40C, 1),
> +       /* GPIO18A */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, C6, A2, SCU40C, 0),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   C6, A2, SCU40C, 0),
>  };
>
>  /**
> --
> 2.25.1
>
