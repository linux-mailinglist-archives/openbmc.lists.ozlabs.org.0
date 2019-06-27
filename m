Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5157A0D
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 05:34:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z59D6szszDqfG
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 13:34:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CIH3DEPi"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z58h5NpFzDqF3;
 Thu, 27 Jun 2019 13:33:40 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id m14so524818qka.10;
 Wed, 26 Jun 2019 20:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2KVsZBY5LFFo4gY6VFlLWm4C7+0s80NQB68c0PwknKs=;
 b=CIH3DEPisvLbPTZi3wGI1i0TO6B3EfYZ4CM7za6PasawEQwEPzSBOS2EYItAnRotMN
 nOB68MyZj2/cOYouVjFwjG2GMNoScQjVrcU9FtqqisfIN3GYQi/GI6j2w7t0LZspAEZY
 OxPlsgmasoWbTm8XsFglyvqYvmDiZcPezKJzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2KVsZBY5LFFo4gY6VFlLWm4C7+0s80NQB68c0PwknKs=;
 b=uTbiNTGqRwpANUf0tGOtoUE15mFFz7ZYp5MyoBPuf5Dk4SrOffJNCeayNJjeh0mnYS
 DwNzK+n0r5PP6p4dhnSK6/qTMg4wvPY0LubwzZ15l3FRgPMlnbEUCUT0HZZQo0P8ADRc
 NOEIdIXtJcmxLp975sQ3Cu8ElKM1C1uz3OuuuSySiR22KAXrBF0St974zyTPuiIzMOGJ
 +qMDiAvfrANoRyZ+3tOmw3gfZFbzFkBPh5f3KeobsZAlHLopCClQJrgXheiStksqL/Kj
 CV87SNFXHrBg+WMcVsk8y0rTaH7ujmr9jz/o5neJ1heBPi+oOd73rIa5UeHItUUlyvoA
 mUhw==
X-Gm-Message-State: APjAAAX/Bvc/a1l2FFpCTwPjuBtJor7FIDpuOXl8B3iRaxT4ocJHKerD
 SoVxoDju8+XjBYYmHNgn/WD7l0BrYO2MQRjyq8aGFZpQ
X-Google-Smtp-Source: APXvYqwXbb3SH4AresCUU4pzniix+MHNP2zt84LdWlLd+3IFX0N+wQdttTRFErJ2Y5pcpv3VABkcH8J/i1o8Fv56cF4=
X-Received: by 2002:a05:620a:1113:: with SMTP id
 o19mr1389916qkk.330.1561606418450; 
 Wed, 26 Jun 2019 20:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190626071430.28556-1-andrew@aj.id.au>
 <20190626071430.28556-7-andrew@aj.id.au>
In-Reply-To: <20190626071430.28556-7-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 27 Jun 2019 03:33:26 +0000
Message-ID: <CACPK8Xf2xvQAm8sad-xTt_yNO0-ed+PG8mVDujS8EsXzZw4J0A@mail.gmail.com>
Subject: Re: [PATCH 6/8] pinctrl: aspeed: Clarify comment about strapping W1C
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 26 Jun 2019 at 07:16, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Writes of 1 to SCU7C clear set bits in SCU70, the hardware strapping
> register. The information was correct if you squinted while reading, but
> hopefully switching the order of the registers as listed conveys it
> better.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 4c775b8ffdc4..b510bb475851 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -209,7 +209,7 @@ static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
>                 if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
>                         continue;
>
> -               /* On AST2500, Set bits in SCU7C are cleared from SCU70 */
> +               /* On AST2500, Set bits in SCU70 are cleared from SCU7C */
>                 if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
>                         unsigned int rev_id;
>
> --
> 2.20.1
>
