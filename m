Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A402263B39
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 05:12:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn3pq73RvzDqZL
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 13:12:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=R1iAcVR7; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn3ny6xmszDqY7;
 Thu, 10 Sep 2020 13:11:49 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id q13so6500466ejo.9;
 Wed, 09 Sep 2020 20:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vnsPAvTYp81efO0ntlVmzSB6WJb7O61LqafGweeme7c=;
 b=R1iAcVR7DzqA6thGbq8lrg8QhJQZk01IfgZdHfto5SE22j435PzdXda9RLco7nODgP
 B2hIkdQ4WolOIB+1xpV7N4N1C6wA7Tks7tapKRLzjhL6xHp0LClELtq3VD3DE3ruqZFE
 u/mEDu9uIdeTJsIPyJk843xZMgDUb0VhaiFOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vnsPAvTYp81efO0ntlVmzSB6WJb7O61LqafGweeme7c=;
 b=ku3m0JGfJ+tiIjdOcyT5u1M0amqg1IhnLsf5JyNs794OM4p4QL/Zo0qOO9iXkVsbj0
 Qceqo3dNLUbY3VSYleLBYAoYAhSzmPzb+opnp8On5EqjYexAUgLXcmvRKZ0l1PP6pFZR
 eUaRL4PalrVsuiFTrlei5E02WP5N6FTnKCJssdawXsPwk5NPMFGCsR9Ho8TX0OpSs+VS
 IRMxmcGoJqTyFfmqLw9Z0LiYYjvBXru/aWMDCSXOIzaUGcw8oZqNlgbOxkLLof1HbCaV
 Ysj70Fun/UK/MXOqTDqEHWGQ4HktWUCbXtwJVg9XnrmDgZu84NHd6U8Cz3+NK3vEtNQ6
 gv7g==
X-Gm-Message-State: AOAM530CVDnAPUy0YDDYDr85ZfayWeE01lc2PTo8CgVU02bVjp2QSxmt
 NitxlsfNWGdni5ehqeP98SjG9BVRaIJGKBgyDdQ=
X-Google-Smtp-Source: ABdhPJyq/aCVocOva4+j0Z7QPbG7fpv24ElCqKXoy5FUY6VcQC3Hi3z9mllEA0TO3Xo1UEcHXilq4gpvr5jSZJbOqNc=
X-Received: by 2002:a17:906:b6d5:: with SMTP id
 ec21mr6412453ejb.396.1599707506614; 
 Wed, 09 Sep 2020 20:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025631.2996342-1-andrew@aj.id.au>
 <20200910025631.2996342-2-andrew@aj.id.au>
In-Reply-To: <20200910025631.2996342-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 03:11:33 +0000
Message-ID: <CACPK8XePJtLq7pJ3-dYL+Ac1Q2Z5sQQ=qc5gYNsGM2zkXPyFmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: aspeed: Format pinconf debug consistent
 with pinmux
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

On Thu, 10 Sep 2020 at 02:57, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> When displaying which pinconf register and field is being touched,
> format the field mask so that it's consistent with the way the pinmux
> portion formats the mask.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> In v2: Format val with %X as suggested by Joel

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 53f3f8aec695..2e0260c1a57c 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -539,9 +539,9 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 if (rc < 0)
>                         return rc;
>
> -               pr_debug("%s: Set SCU%02X[%lu]=%d for param %d(=%d) on pin %d\n",
> -                               __func__, pconf->reg, __ffs(pconf->mask),
> -                               pmap->val, param, arg, offset);
> +               pr_debug("%s: Set SCU%02X[0x%08X]=0x%X for param %d(=%d) on pin %d\n",
> +                               __func__, pconf->reg, pconf->mask,
> +                               val, param, arg, offset);
>         }
>
>         return 0;
> --
> 2.25.1
>
