Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 648982D5FE3
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 16:38:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJ393THFzDqj1
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 02:38:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hs49l3Mb; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsG9q5V1czDqSt;
 Fri, 11 Dec 2020 01:13:49 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id g18so4353446pgk.1;
 Thu, 10 Dec 2020 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Hb7CAOESndOw0qmRw9ewVrZoBtsOHUQtrWnjHs0d1U=;
 b=hs49l3MbegHnzNrh0GBjhULW6ig/YFYqX2EM+6DzwB+fRgW9ILpGbafrJWdjTyYMGx
 bg5fZABvSnlI26rFJy5pxWeVo1syaM3lTLnySC+vNijzgwJofGFA4jF8GbP5lw/3bolx
 5MhNjpMMyGnxypq8jozD4tCdXpzAlJfrNhzeBSvLByOHyyXW0qcPmyn2crxwuFCW1NsE
 0Y0LSTXpJzVV+Js+XxpS2wWocBaPoNyqwnIaHiLPRmTujhAnWChx87vID4du1gZxQ4lT
 IO1MhWxII0hyNuc2ufbgv59WCjVSJinhDKlHuXizxWjqOrMl69sU847jQTfSRlqFqumA
 +2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Hb7CAOESndOw0qmRw9ewVrZoBtsOHUQtrWnjHs0d1U=;
 b=EJJo1XJU1lObpWt43KoQk+tsZ8HpN9MJ3JVW3zJ5JY2tuL0nlUFRlBGrm5V6E2dS59
 5wxBfW5CHAK6dhctc/W5dSleVmcH1UafDfIBBc+6Nzp/kRoxTHg1Z7TaqjhPZJ78t1IQ
 dj3QfkJhp2jXri1SB4zCRN1zqADnil7ZdTX5WcSOvY8Qe6x1QN9T/db4MmTn69TFujZe
 8f88CBBNqVYHhi7nlt0WblzkK7umrD41IGKP5hJHgZwWyNQjxjEvEKhO0mkxLGBN4XDm
 cJ0q7d56Y7YamfNIr/oWUelcVzh2aL+ps7sGYo7Mmyeft8HLhRJxdoJO7dEJtpSWeJyM
 6fGw==
X-Gm-Message-State: AOAM531tfSPN6PiHqFlpOtrbiYb+ZlrzX9+tajGcs3OKPqS5lhCokOhk
 mHgmRpO//7kiK7nNfvR0N0t7IasJnxh2k+JqnyQ=
X-Google-Smtp-Source: ABdhPJyFNZ9FhSEOIbEkRgpnz977Ot0cuwbUMyrsnC9vlZUdQdfjd+91orjutqMRcuYPE8Fvn6lnet0Z/prPzhCJx2I=
X-Received: by 2002:a17:90a:c592:: with SMTP id
 l18mr7847600pjt.228.1607609625632; 
 Thu, 10 Dec 2020 06:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210065013.29348-1-troy_lee@aspeedtech.com>
In-Reply-To: <20201210065013.29348-1-troy_lee@aspeedtech.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 10 Dec 2020 16:14:33 +0200
Message-ID: <CAHp75VcMuHiUFgSas26DA-Bh1gGA_G5FT+9cetK=En9Q_oMZtg@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
To: Troy Lee <troy_lee@aspeedtech.com>
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
Cc: chiawei_wang@aspeedtech.com, ryan_chen@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, leetroy@gmail.com,
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 10, 2020 at 9:36 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> GPIO pins can be used as IRQ indicators. When they do,
> those pins should be flaged with locks to avoid kernel

flagged

> warning message.

...

> @@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)

> +       rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
> +       if (rc) {
> +               dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
> +                       d->hwirq);
> +               return rc;
> +       }

It's a copy'n'paste of generic code. Why do you need it in an unusual
place, i.e. ->irq_set_type() IIUC?
Can you elaborate about an issue, because this seems to be a hack?

-- 
With Best Regards,
Andy Shevchenko
