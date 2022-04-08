Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 232D64F9399
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 13:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZbK015bKz3bYZ
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 21:15:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ebq/3CFz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ebq/3CFz; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZbJc5DT3z2yHp
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 21:15:26 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id r10so9675397eda.1
 for <openbmc@lists.ozlabs.org>; Fri, 08 Apr 2022 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aa7QZzIFVFDFbunq9XhVZaHXC3Qs6q5HoIqOfQS/Ym0=;
 b=Ebq/3CFzWxM8qOh59YVH2MLYRjSnNcFwOCUvzxHE9Tbiurl/HsdJniiD1qliVZEERU
 egaLCA4UmdSfDDN4EPXlUQ+PS23hRirNXWulOyJhJfUged92Dj3FhTk1J4IJz6ZUyLAu
 eyZiQgZ64kpqJK+yU6ddWURM04C7fRJ9zFadeHEtp96BCtlb+gQpFIysmzvQkmIKjs+S
 yHJ0SontZJT/j9Q1IYD+29wUihigkLmLLmjmhlkqmm/c7z9LVxxiiB3t8XGHCl/rpJOD
 76p5WnLAs7lPxHuxR0L12v31RA0rUoi9fnTewbklVrxk03jNZkTbX+2Wg/R9zcGYHzLt
 VpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aa7QZzIFVFDFbunq9XhVZaHXC3Qs6q5HoIqOfQS/Ym0=;
 b=e+e+p4n2Ir6NfRsGVund3W1rtkvdwSYOiaL+0DEy7o52QenH7Au6GjZLxxj78+fp3N
 Rv4uqKZLXWtkJh7Bk9Rmj7YWdMpXtNQmQNmuVMVtvDe0mbtNN/8UFxfchEgbOBFJDIUZ
 BWhe4hf+LKi5Z7vPKzki9Y2nSKGBC2noP7Xn+ONpg465Vu+E1dYHveeJF5pyAnGQ0uxv
 cMKvFxGbfigyMhJpxfIH79jIVqkbaiVi4bABqI3vyuzsHu9WjgEV38v38el9D+IiRYb/
 maLkqlO3Td2k3nEB7CqDwhfVdt+/22ePWPTMfrOh3VoojtVSt+Anl4QxaF/V72Rv2ijj
 Y5Kg==
X-Gm-Message-State: AOAM533SZZ2CiN24Qc44QRf4hI5lQvteJ4eMeP0E7ndeZIPvvIoraC4I
 mIHWoW6IpiPNJw32JVeYtxKcoqCX8A4901vZAaw=
X-Google-Smtp-Source: ABdhPJwTfsTBXB3ob+uJK79ZSJa5OgMnE+cTkAqMYO9XInOo/wP0oHo9pORKY6Cub50GFUTgpI9H5oRJ7wNnqKs1i0g=
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr19167579edm.122.1649416520116; Fri, 08
 Apr 2022 04:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220407183941.36555-1-eajames@linux.ibm.com>
 <20220407183941.36555-2-eajames@linux.ibm.com>
In-Reply-To: <20220407183941.36555-2-eajames@linux.ibm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Apr 2022 14:11:05 +0300
Message-ID: <CAHp75VedZdEYB-BjJTVaKJgPwQ9a1DhTp=MYsrh1Ve9Eyfnytw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] leds: pca955x: Clean up and optimize
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 7, 2022 at 10:42 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> Clean up the I2C access functions to avoid fetching the pca955x
> driver data again. Optimize the probe to do at most 4 reads and
> 4 writes of the LED selector regs, rather than 16 of each.

> Rename some functions and variables to be more consistent and
> descriptive.

Separate patch.

> +               dev_err(&pca955x->client->dev,
> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
> +                       ret);

This can be indented better.

I would add a temporary dev pointer variable and put this on one line.

 struct device *dev = &pca955x->client->dev;

               dev_err(dev, "%s: reg 0x%x, val 0x%x, err %d\n",
__func__, n, val, ret);

...

> +               dev_err(&pca955x->client->dev,
> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
> +                       ret);

Ditto.

...

> +               dev_err(&pca955x->client->dev,
> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
> +                       ret);

Ditto.

...

> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
>                         __func__, n, ret);

Ditto.

...

> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
>                         __func__, n, ret);

Ditto.

...

> +       struct pca955x_led *pca955x_led = container_of(led_cdev,
> +                                                      struct pca955x_led,
> +                                                      led_cdev);

Is it used once? If more than once, consider a helper for that as well.

-- 
With Best Regards,
Andy Shevchenko
