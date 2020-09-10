Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0408D263994
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 03:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn24R1x6XzDqZS
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 11:54:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NoNawaGq; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn22r57wrzDqZP;
 Thu, 10 Sep 2020 11:52:51 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id n13so4623163edo.10;
 Wed, 09 Sep 2020 18:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4wihOtUGmKvM6OV1xz49d7GF6s8tThElPC8COTjJhw=;
 b=NoNawaGqtXD5PPRDwAAu3FydxWGnfWzWyB7YxDfsBTacqM0bBAm9iioberpOzHVRkX
 jTlVeOAZYbWO6LryijXb9r+fRSkQpWcD5qHVHJD7o9UWxOmYSRlJo6jojXpp9A/vDsDl
 qqxsimwLjGd0pfnV++gPK5PtI/JIFAWP9CaBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4wihOtUGmKvM6OV1xz49d7GF6s8tThElPC8COTjJhw=;
 b=Fn4E7Yb+4fYj7us9em6Q4IsrfYxKDSFwGdim5JCr4b317L0V2H9dK2nhjn6jNCL7hE
 Dz9OwjAYbYZd93TTRE5FyGV3ejzTNi2THakWG38K0Fnao3oYmVLmlSw3xP4yIuLklXiz
 5+muGMqgtCxUeeBywMtnYdZMQAIdrVw2sb9yPBZP///1pLdVp2656j7qyOiMwXPi2H6b
 M7sSLDy/8/9YRUOVEmmlx+w/J8Jz4peav+9Op9YEP3f2bWIENm5B+SdF/xAmlqJN7Ojt
 7QWyHT43+JsDW/R2Bp5z+zaEZdTj5KI5Rzv8vQPWxSv2cNCQ4QKPkfvadlqjVMfKRskB
 oUgg==
X-Gm-Message-State: AOAM533GEla17xc1FA40Wqs8PTqlxvHRRsTYm0xhvuZKTWgmpBCGkMRL
 5TCssGSRa3XyFRHg3IZJFk9Ynk59R8O3mSFRcnc=
X-Google-Smtp-Source: ABdhPJx3tc6th2NQ3W5yI0UnQXkvVnc2gSxYPh/skJvLZlUli2agzUUaOAOxKvX4m89LXd0PAOcDIyBSHEkZWdpqMVo=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr7213014edv.232.1599702768129; 
 Wed, 09 Sep 2020 18:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au>
 <20200909114312.2863675-3-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 01:52:36 +0000
Message-ID: <CACPK8Xe0WqmyXOHdxw=OWbFEzHew7F2aBQ9B5EPRJfDhj=vhmw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: aspeed: Use the right pinconf mask
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
> The Aspeed pinconf data structures are split into 'conf' and 'map'
> types, where the 'conf' struct defines which register and bitfield to
> manipulate, while the 'map' struct defines what value to write to
> the register and bitfield.
>
> Both structs have a mask member, and the wrong mask was being used to
> tell the regmap which bits to update.
>
> A todo is to look at whether we can remove the mask from the 'map'
> struct.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Fixes: 5f52c853847f ("pinctrl: aspeed: Use masks to describe pinconf bitfields")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Owch.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index d8972911d505..e03ee78b2434 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -534,7 +534,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
>                 val = pmap->val << __ffs(pconf->mask);
>
>                 rc = regmap_update_bits(pdata->scu, pconf->reg,
> -                                       pmap->mask, val);
> +                                       pconf->mask, val);
>
>                 if (rc < 0)
>                         return rc;
> --
> 2.25.1
>
