Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7113D19C
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 02:39:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yn0j52CBzDqSm
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 12:39:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eLFvuZsy; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ymzv1JLdzDqJs;
 Thu, 16 Jan 2020 12:38:18 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id x129so17677393qke.8;
 Wed, 15 Jan 2020 17:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fru5OiodLrKKngSwZ1rXnYTcEIToyQn7zBfis7QmWk=;
 b=eLFvuZsyTiRfK7UV4g57mGstNkFvCjCnxduScp0C7DmHg8+IwAh/uXtGCI29EKebne
 fW9BzLh3/yLSiMPYrCkLGzZpSvWgU6YjtlUL8Bb7V6Dx1R96ECCvlqpek3XmKqOl03Mw
 +nVOKn3pe9vKfZLSCrw4vL2kS5/Zx5kWaMk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fru5OiodLrKKngSwZ1rXnYTcEIToyQn7zBfis7QmWk=;
 b=axC7qvMp+smg54hlk4pX/2aVjmt3TRr5V5c0F2G5bWuHdBDr+GoviNCv+RCkIKG9r1
 WLa54u9j1BWGl4GA2I25rgxlVf3lZkQaPvAHH+mm9m4kAGvzhU1HC21/TFshEtCkljnl
 RaHoe7E2dJDZqcJSc3HNhoZZ5J6kJnFotWkEQ3b66XPX2ssrixMqajq+DYLex0u5VY+S
 O0HkhYfb6rmSDYJbTvGCQVLfri6M28pP1sb9wjT29/+cPmzo2EAbqEn3AosPpTCGoJWO
 8EW5k5nEghyOKq1YsGzoZw8pXGHkcOzSnRXN4b0XJKaPsh08Sus0QUUOogVKmwaRtqAy
 fYvQ==
X-Gm-Message-State: APjAAAUkT04dMh85TSD7qiL18GG+GiCocjUMl+G7LMh4Kg/MSWgIuqZ+
 d3rIqHolfa2GPovMAxKEC1K+dHVbl2gkfOBUsMo=
X-Google-Smtp-Source: APXvYqwTAo+CmTUw+bJLllvdDSV6lyyIY62kprsec+Zi9ebDT80z5kEIrhWfU2baF0O9XaijPpjm3ylEz71Wg5G94fk=
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr30843053qku.414.1579138694765; 
 Wed, 15 Jan 2020 17:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
 <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jan 2020 01:38:02 +0000
Message-ID: <CACPK8Xez9XQPQCsUU1Fu_POTJ3dh3tGJvK=otJdMYv40aZLqsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jan 2020 at 21:25, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds critical clock setting logic that applies
> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
> device tree.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/clk/clk-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
> index 411ff5fb2c07..d22eeb574ede 100644
> --- a/drivers/clk/clk-aspeed.c
> +++ b/drivers/clk/clk-aspeed.c
> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>
>         for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>                 const struct aspeed_gate_data *gd = &aspeed_gates[i];
> +               unsigned long flags = gd->flags;
>                 u32 gate_flags;
>
> +               of_clk_detect_critical(pdev->dev.of_node, i, &flags);

This makes sense to me.

> +
>                 /* Special case: the USB port 1 clock (bit 14) is always
>                  * working the opposite way from the other ones.
>                  */
> @@ -550,7 +553,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>                 hw = aspeed_clk_hw_register_gate(dev,
>                                 gd->name,
>                                 gd->parent_name,
> -                               gd->flags,
> +                               flags,

For completeness should we make this

 flags | gd->flags

>                                 map,
>                                 gd->clock_idx,
>                                 gd->reset_idx,
> --
> 2.17.1
>
