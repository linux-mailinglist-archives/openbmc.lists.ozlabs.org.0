Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E139B601
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 11:31:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxHb661pBz307m
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 19:31:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkwDxkW1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qkwDxkW1; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxHZq1Wxvz2yYP
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 19:31:28 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id w33so13107889lfu.7
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jun 2021 02:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WqJtAEUyp1Bxzc5hAO9Tv+8VBm2svR4HUjAof0o85e0=;
 b=qkwDxkW1kfmJwJ7ndr3HTnaDKSWLTjA6xKL8JMiX1eMOCXTTZGQ2m2TgMArQ4L4aXx
 uHsCtRSZH0GDtdg9QSVua6H+8pssQAPi1mIXM5IdlJQIbbp+X2PtZ/0NJw/GKmUKJUnn
 AgTD1opvfRSRWW7crbgeuj+mZEvYOP1GlPBNudcy8ToaiQIIjg3X+AIYg8FiMnqa1ClK
 SlYcnbfJnns9hZuETArk9zBRx98aTc1TVlv4iSS70t/HuBQrZ115S+5m6U7nQVauO00X
 U3+ZzTu/8Zlu0wgE1HWNZT0iqO1CrUcWA3ZCpG7qhK0xMEP4l1CnYrigYuNIil6dEGde
 NejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WqJtAEUyp1Bxzc5hAO9Tv+8VBm2svR4HUjAof0o85e0=;
 b=jFcndpAPDrDnQ7Up9y1HSAEyzRY2/eT8pwutQB3p9z44tdGzECVrllVxSf8S9iSpUW
 FQcOX3G0ZhnCJlkUNjXhCZmK2805Gy87kIrBu3dhv9W1D00PQU3iFOx1QCf9YnCvBpNK
 TeA2oLDWc02gQIbAreJdw3RHBt8+4EJRy2kJt1PniVWw3iWGmqEDWIshX2OiK4cB2s2y
 7wAK6aRvuB/0sBz9WMDYcyJ6Uqy9C3E1qDQPYch+1lmoCNTKr4tCm4POCbwnD1hK8OsK
 x0dB3tAJKbTf7iR8+As0kw5ZMGJYsh/2FjtL/7iYrXBF7b+jgDybBwjKlYnxxKwi53LY
 JQxQ==
X-Gm-Message-State: AOAM5336BQURKLqgDKSuaddZnCsg4Q1JdAixRPESXQU5N1YN0vRzV6dU
 KprAiElzZdovV5VajGg+dcFSIThh2qDLUEW22CCD2Q==
X-Google-Smtp-Source: ABdhPJwjZUEUDLRMcFr5fmvHzeRRlf27zfb0dhKyXB4D2fLxv43UZy+tITmNzSY/BfIouz9XXQhzAbVXMbqMYiWx1qI=
X-Received: by 2002:a05:6512:2105:: with SMTP id
 q5mr2110635lfr.649.1622799078510; 
 Fri, 04 Jun 2021 02:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-6-j.neuschaefer@gmx.net>
In-Reply-To: <20210602120329.2444672-6-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jun 2021 11:31:07 +0200
Message-ID: <CACRpkdb=8e=D9JdwxA+oPGj80WnsV86apuECBp1m-Edd+hKPFQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: nuvoton: Add driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan!

thanks for your patch!

On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> This driver is heavily based on the one for NPCM7xx, because the WPCM450
> is a predecessor of those SoCs.
>
> The biggest difference is in how the GPIO controller works. In the
> WPCM450, the GPIO registers are not organized in multiple banks, but
> rather placed continually into the same register block, and the driver
> reflects this.

This is unfortunate because now you can't use GPIO_GENERIC anymore.

> Some functionality implemented in the hardware was (for now) left unused
> in the driver, specifically blinking and pull-up/down.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

(...)

> +config PINCTRL_WPCM450
> +       bool "Pinctrl and GPIO driver for Nuvoton WPCM450"
> +       depends on (ARCH_WPCM450 || COMPILE_TEST) && OF
> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIO_GENERIC

You are not using GPIO_GENERIC

> +struct wpcm450_port {
> +       /* Range of GPIOs in this port */
> +       u8 base;
> +       u8 length;
> +
> +       /* Register offsets (0 =3D register doesn't exist in this port) *=
/
> +       u8 cfg0, cfg1, cfg2;
> +       u8 blink;
> +       u8 dataout, datain;
> +};

If you used to have "GPIO banks" and you now have
"GPIO ports" what is the difference? Why can't these ports
just be individula gpio_chip:s with their own device tree
nodes inside the pin controller node?

If you split it up then you can go back to using
GPIO_GENERIC with bgpio_init() again which is a
big win.

All you seem to be doing is setting consecutive
bits in a register by offset, which is what GPIO_GENERIC
is for, just that it assumes offset is always from zero.
If you split it into individual gpio_chips per register
then you get this nice separation and code reuse.

> +static const struct wpcm450_port *to_port(int offset)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(wpcm450_ports); i++)
> +               if (offset >=3D wpcm450_ports[i].base &&
> +                   offset - wpcm450_ports[i].base < wpcm450_ports[i].len=
gth)
> +                       return &wpcm450_ports[i];
> +       return NULL;
> +}

Then you would also get away from this awkward thing.

> +static u32 port_mask(const struct wpcm450_port *port, int offset)
> +{
> +       return BIT(offset - port->base);
> +}

And awkwardness like this.

Generally splitting up gpio_chips is a very good idea.

> +static int event_bitmask(int gpio)
> +{
> +       if (gpio >=3D 0 && gpio < 16)
> +               return BIT(gpio);
> +       if (gpio =3D=3D 24 || gpio =3D=3D 25)
> +               return BIT(gpio - 8);
> +       return -EINVAL;
> +}
> +
> +static int event_bitnum_to_gpio(int num)
> +{
> +       if (num >=3D 0 && num < 16)
> +               return num;
> +       if (num =3D=3D 16 || num =3D=3D 17)
> +               return num + 8;
> +       return -EINVAL;
> +}

This is also a sign that you have several gpio_chips in practice
and now you need all this awkwardness to get back to which
GPIO is which instead of handling it in a per-chip manner.

This can be done in different ways, the most radical is to have
the pin control driver spawn child devices for each GPIO
block/bank/port with its own driver, but it can also just register
the individual gpio_chips.

Yours,
Linus Walleij
