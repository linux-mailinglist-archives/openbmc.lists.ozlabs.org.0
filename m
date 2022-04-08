Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EABD4F93E3
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 13:23:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZbVP0J9Tz2yh9
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 21:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OLcF3ugv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OLcF3ugv; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZbTz44s6z2x9G
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 21:23:34 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id i27so16654147ejd.9
 for <openbmc@lists.ozlabs.org>; Fri, 08 Apr 2022 04:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cRoyXCmCEfHW6FbxD2a5gAxg2fHOPCI7K6xvLP7LBlY=;
 b=OLcF3ugvB6AlRI055J9tJP1EjOYQdBpBT+XkuD7zndoJU11AGacmBG0mk67F36A7sV
 /hFA2veApJ1HXhiYh86006TKDvYD4t+E2QlFKC9lCt7JnwjqYOKX1AeY57SseQhW8FA2
 h/vVYNGtyuU++PyL6Mpo8/tsqUQx845T+UDGFMZifewrDlXr1ltR6c2pYS4KjTGVRnny
 GqRV2E7BWxjpx8Y9KBKYV7zPxSRxGXZTcrfQADOJzyfKbY/Z2dIxNA+E54a+1qOhTQUp
 F1dCghAsXSy1BL3OswS8qj7zWCPpRIBqHp5HhU/cnibFj0k7iK6cwSXitz9skmpzPL3m
 KMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRoyXCmCEfHW6FbxD2a5gAxg2fHOPCI7K6xvLP7LBlY=;
 b=vGWHI9ndRtEcBG7bE8lde1S5ZgHztpIynlJQnfZF0VikqOUqX52lHdUUuMCL1IVmMY
 lzzwA6TgJTSHaUQXFtxS415CGorgRLFCqfXL4ic7+g25X9OrCj4BvQzQKDaMUHDoFM8W
 3NIlUzMPIOEuxxEokq1UDadoEwhnJDfX6Cz9rP2zPgU2kG+OSFrKTmq7r0wcfwd9IzmJ
 NBOCGUnsmZ847Oxg1yJnT0JxEskh03GVfdn//jTrARO/+B72VZovB4XsrfKYF3Hmb6nl
 iSVA0overhpqCY26mbsKMNY6IQ8TmBhvBfC5IK1Jidd4L+Rz9H4k4oaLgz2mGc6eU+2q
 8Ikg==
X-Gm-Message-State: AOAM531fLGcDVG1Od3m6X/r4QTPChF6ND1dXY1pS/+BnUL3KJdmdo0qg
 wGED6L1ChGAKthUiivAJfWSwUvuFAtdgs5Ci0ys=
X-Google-Smtp-Source: ABdhPJykQNqDc7FaAjGw5x9RJlN7Ipzg84vVW8ik/7vJMM2bSnf0UwzV3g7qHKQy7+iLJ6yUnwC5p+UHpZTxxck2Pfw=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr17927638ejc.636.1649417010579; Fri, 08
 Apr 2022 04:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220407183941.36555-1-eajames@linux.ibm.com>
 <20220407183941.36555-3-eajames@linux.ibm.com>
In-Reply-To: <20220407183941.36555-3-eajames@linux.ibm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Apr 2022 14:19:15 +0300
Message-ID: <CAHp75VfcmhGitd6_6mDVG6_eE02sX2B3_iqZxeiX3iFDkmPShg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] leds: pca955x: Add HW blink support
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

On Thu, Apr 7, 2022 at 10:43 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> Support blinking using the PCA955x chip. Use PWM0 for blinking
> instead of LED_HALF brightness. Since there is only one frequency
> and brightness register for any blinking LED, track the blink state
> of each LED and only support one HW blinking frequency. If another
> frequency is requested, fallback to software blinking.

...

> +#define PCA955X_BLINK_DEFAULT  1000

What's the unit of this number?

...

>   * Write to frequency prescaler register, used to program the
> - * period of the PWM output.  period = (PSCx + 1) / 38
> + * period of the PWM output.  period = (PSCx + 1) / <38 or 44, chip dependent>

Using <> in  formulas a bit confusing, what about

 * period of the PWM output.  period = (PSCx + 1) / coeff
 * where for ... chips coeff = 38, for ... chips coeff = 44.

?

...

> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
> +                       __func__, n, ret);

Can be indented better. But I would rather see regmap, where this kind
of debugging is for free and already present in the regmap core/.

...

> +static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
> +{
> +       p *= (unsigned long)pca955x->chipdef->blink_div;

Why casting?

> +       p /= 1000;

Does this 1000 have a meaning? (see units.h and other headers with
time / frequency multiplier definitions).

> +       p -= 1;

> +       return (u8)p;

Redundant casting.

> +}

> +static unsigned long pca955x_psc_to_period(struct pca955x *pca955x, u8 psc)
> +{
> +       unsigned long p = (unsigned long)psc;
> +
> +       p += 1;
> +       p *= 1000;
> +       p /= (unsigned long)pca955x->chipdef->blink_div;
> +
> +       return p;

Similar questions here.

> +}

...

> +       if (!p) {

Why not use a positive conditional?

> +               p = pca955x->active_blink ? pca955x->blink_period :
> +                       PCA955X_BLINK_DEFAULT;
> +       } else {
> +               if (*delay_on != *delay_off) {
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +
> +               if (p < pca955x_psc_to_period(pca955x, 0) ||
> +                   p > pca955x_psc_to_period(pca955x, 0xff)) {
> +                       ret = -EINVAL;
> +                       goto out;
> +               }
> +       }

...

> +       if (!keep_psc0) {

Ditto.

> +               psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
> +               err = pca955x_write_psc(pca955x, 0, psc0);
> +       } else {
> +               err = pca955x_read_psc(pca955x, 0, &psc0);
>         }

-- 
With Best Regards,
Andy Shevchenko
