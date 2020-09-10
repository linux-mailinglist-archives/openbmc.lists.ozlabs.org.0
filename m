Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B7C263992
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 03:53:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn2354hFPzDqbm
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 11:53:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eY/LjwZi; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn22H3hPzzDqZD;
 Thu, 10 Sep 2020 11:52:23 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id e23so6350376eja.3;
 Wed, 09 Sep 2020 18:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANFj5tNe+lX75IxFcz7eloVwZ6bcS0GGRGo9xs5qe80=;
 b=eY/LjwZiqAFgu2Bw+bKjgsL4dHaWSO+afec/4IFa+vrNiuMztpznLUltZ/Wl9vUCja
 1acXY3/TubX6dHKDPPvCbx8YITTKM9cJ8pwLe8grJkSE70P7HJiHb2lFt5NBgjipFLen
 sOF+sNTAqF3DuLyHiT1ZKbMlgEOwcHgvWqh68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANFj5tNe+lX75IxFcz7eloVwZ6bcS0GGRGo9xs5qe80=;
 b=r5zdnfs/nKlSK7onP+44b50sgNRLVl9Zk9K6opZOJvImX6A6KpqK4sifeM3jdgYU8U
 Xbzxj3kU4vhSy9xllGaMgIB9wNgFsXkCwjfDibTiNR4kryoBBnqucr6N8F+ySBwUjkG9
 7usLFjnt4mqr5qdQQg4ZunI/M3a/4itZ80eU3aH8twI2+KLiG+xVmPI/R2VQJSvsIvcq
 0FjAi3l8FLi2Ejnhfh7uVWpKwwk4tNPlAHLgmFQ7HK4J/+uySuXlDXVjvqhptlBuMtC0
 0X9bak2m9/gZYDpdjx3BcMG12iC4AgTL0vxMcNCvg865wKTlsJYJTM0ti7KUzM0+HGIA
 r7lQ==
X-Gm-Message-State: AOAM533CaGCqp5Nu2OwGR1pL0FDXTVe5ZJALeG//U5uSYcSgCiiFS5ox
 hgnbyNO6g5BSrdkQAcBJqHTbsvy098vzcEBUHNg=
X-Google-Smtp-Source: ABdhPJymYXgKXZhXuS4fxzTpM1mvEDSS4tHQKzZ/RE+4BnTasu7Ht25VWClSxo4tpoAl7IAuWPBMYKW8xN97aQwJFMk=
X-Received: by 2002:a17:906:7cc6:: with SMTP id
 h6mr6478279ejp.266.1599702736442; 
 Wed, 09 Sep 2020 18:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au>
 <20200909114312.2863675-2-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 01:52:04 +0000
Message-ID: <CACPK8XeOf1H2Cdo434DsAjDNGrohip_MZTSMMOh1nhspz2y7dA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: aspeed: Format pinconf debug consistent with
 pinmux
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
> When displaying which pinconf register and field is being touched, format the
> field mask so that it's consistent with the way the pinmux portion
> formats the mask.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 53f3f8aec695..d8972911d505 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 if (rc < 0)
>                         return rc;
>
> -               pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
> -                               __func__, pconf->reg, __ffs(pconf->mask),
> -                               pmap->val, param, arg, offset);
> +               pr_debug("%s: Set SCU%02X[0x%08X]=%d for param %d(=%d) on pin %d\n",


The pr_debug in pinmux-aspeed.c prints val as 0x%X. Did you want to do
that here?

> +                               __func__, pconf->reg, pconf->mask,
> +                               val, param, arg, offset);
>         }
>
>         return 0;
> --
> 2.25.1
>
