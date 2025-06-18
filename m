Return-Path: <openbmc+bounces-245-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05615ADEC86
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 14:35:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMjqw1Nxcz2xS2;
	Wed, 18 Jun 2025 22:35:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750250108;
	cv=none; b=MBe5R36I0eBwznO1vhA5YxoLn2Cy/R465TtJWX19402nD7TAFxtlqjLP8sKDwSKYUx5rMFiOFu0KzCl+R7VKfVtvjKcI4FeqzPW1KcAMZowAuYOejoWpsVs9npSvR9vI+qfEarZXgEbTDFU00YxoZyAH6u6DeRB6KHVWYZqdrdkyfXqrtk1zA/Hs3R5BioaopDGIdiS4inhn/LvMfdKaFwmD8nD253/bv7vj/CwZFoEXmWYb3UKIER5iNM97pD43CE2SWVhMDvpbO3YyCx39AgfsO8kTYNduH9UPjBp387pefj+Ckd1cGYJIUqM/TfDAgV4mP3fPVWyXOlDY2OXX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750250108; c=relaxed/relaxed;
	bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvXZkYK+pDX9PU0pwikLWV1FQP5ZNW9CwVMkegNk+9j+GNNQ7E+iXt6J+scYIf35kj6e23MVpqO6x2LLQODxE2sG4ppiMeUw3VkjcSCCctF1Bq6G8G1K/pPXUmAzaYB27MtI2c+jI/EShwp5jSRr5MEKwNFR/BbElJI4nMH4zEO6c1e8jAH1Gt3y8HrUmwQV4SQEfxS/18qyvnyRuOzreRje986bJmeoSP6P92aHXSKWV9BA2EqOR+Lo6he490GkjqlaN6Y7azCMbkrs3fpLudNBAebrb1iFtlY6x0LUz0NjRzaXOrk3zGzreWxoQ003oEyz9+nZ3zB2qOyujQwIIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=0ON/NnzE; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=0ON/NnzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMjqt0K5Mz2xPc
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 22:35:04 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54b10594812so7094874e87.1
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jun 2025 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750250097; x=1750854897; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=0ON/NnzEcZqcBoMHBFsmBczyxvkEcCXo8w9YhJNlotZkKhSiHYYd0rdW7qr+IeUFSL
         Id5l24sgPFweZnBZwdcotlan6uz6M3nKqDxI7BEyo8zzz6b/Bqs8wyxTm8ATy9hJvL2h
         ygAkA6jFY0pfPDW/zIE7R9LZLCrjjKl9lmC/xbAUMwJDkrGUZHM/6golauQm+F9dPBOA
         loCfQRc9Ms9mpnrYfM3UJglIsABHNhFPUtD3HpnNedslrIfZj30sJfafCcfneZ26WIAi
         ExpqzZlTYsiEC8vp56gQUHxsb0RFj6fb4j3+25eKQ/7nbbgQ0w2vKseZiKt8U7xj7K+l
         bwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250097; x=1750854897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NCFXvXRzTnNTsIn79B1ObpiC19qiQmFuZrgGsmP12M=;
        b=GsNoi8lWPO7FKlD8Lk4AHv0HOT+it+hcNppvE+ek58CHBXMg10zJ1QeItic4bt+vwY
         +NDoEbIMgTaeYMTHog2iypsN7YcQS/0x0dsEnLngosnOgKfW1QSA4Hna1MO38p10C1vR
         V66g+PWcEw3z7c3cSsUh5NWFrMKt5WegXyy5tUomXM4c3+oPqVppOBlJ/EM0L9MiPIe8
         ZJexQ6RVWtvpatM65GYuDrqbzrPFv30QWGcsS68fOVWmrIaTC/2KCe31k3UJAElD0n44
         wnTUUQDIE5LF7Y50BjW/ei3mqz39tpdbDmAYTo0taTzsmcNtGC5UiT+Wwh0QKs/aHYNc
         ujzA==
X-Forwarded-Encrypted: i=1; AJvYcCVMBSPOKFbTeUSX8NrESY7OT5ZKZMyBaA7eltMU0f8yaMWBBnCYhpoVMGoZLmDeegpWr4z9f1Lk@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuIX1uZZDPsp/fV1YIpOlkk4VucX6jtLLzv8WcTO0BPbmhQ+OP
	v+qDZ0GrjFGGr0zTp9eodQFb/3jOUcgjgr7QpXpKV6/1WmLimm2LbEhotXg0EmrSTOQxi6yxOvK
	4YW5GBl3IhWyoBFtDXMAQQNDQqsftY0b0bMam2veboA==
X-Gm-Gg: ASbGncvwV718QEQXO+Ot0d3YkTaXvBvrLjYxmmkdlC6UoOHJHvhR6HiJmDqL4gGYdu0
	bycQ1GTO7ebNrQV2/rGOByBphU0ZTY8Cow+UQXdBUStwt6t6QWGWTdGRQ31NYyODhBeSvSD3iGA
	B5Kd0LdImH4+maJa05qM6+Kcqfb+a++x77ft9jkwa363CkNMGaHP0zHVkC1uYm6R9W8am0Ru/0W
	w==
X-Google-Smtp-Source: AGHT+IEcY0ia8sTwoRAYv0yUxmwNgwPhm8wtdrftfa4ddrwo+GTxfk9hINsrO5aUlvjYzopy0PhTBONSdU1zFixC2QI=
X-Received: by 2002:a05:6512:4005:b0:553:a30b:ee0a with SMTP id
 2adb3069b0e04-553b6e8c9bamr5355914e87.24.1750250096692; Wed, 18 Jun 2025
 05:34:56 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
In-Reply-To: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:34:43 +0200
X-Gm-Features: AX0GCFtJGsl5fi6e6i6LCEjO1TuJe6n2Li_qY-Pi8nS955_BMUgd9yxByrvzkO8
Message-ID: <CAMRc=Mf==gzqXEUMd3D_-XYG7Bg7dSMLgjg3sq5-GoB1BUGchA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++----------=
--------
> >  1 file changed, 33 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> > index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494=
054b1e009f16eee7f 100644
> > --- a/drivers/gpio/gpio-mmio.c
> > +++ b/drivers/gpio/gpio-mmio.c
> > @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip=
 *gc, unsigned long *mask,
> >       return 0;
> >  }
> >
> > -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, in=
t val)
> > +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> >  {
> > +     return 0;
> >  }
> >
> > -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> > +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
> >       gc->write_reg(gc->reg_dat, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gp=
io,
> > -                              int val)
> > +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpi=
o,
> > +                             int val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >
> > @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip =
*gc, unsigned int gpio,
> >               gc->write_reg(gc->reg_set, mask);
> >       else
> >               gc->write_reg(gc->reg_clr, mask);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int=
 val)
> > +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int =
val)
> >  {
> >       unsigned long mask =3D bgpio_line2mask(gc, gpio);
> >       unsigned long flags;
> > @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, uns=
igned int gpio, int val)
> >       gc->write_reg(gc->reg_set, gc->bgpio_data);
> >
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> > +
> > +     return 0;
> >  }
> >
> >  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> > @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct =
gpio_chip *gc,
> >       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> >  }
> >
> > -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *ma=
sk,
> > +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mas=
k,
> >                              unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long=
 *mask,
> > -                                unsigned long *bits)
> > +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long =
*mask,
> > +                               unsigned long *bits)
> >  {
> >       bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> > +
> > +     return 0;
> >  }
> >
> > -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > -                                       unsigned long *mask,
> > -                                       unsigned long *bits)
> > +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> > +                                      unsigned long *mask,
> > +                                      unsigned long *bits)
> >  {
> >       unsigned long set_mask, clear_mask;
> >
> > @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gp=
io_chip *gc,
> >               gc->write_reg(gc->reg_set, set_mask);
> >       if (clear_mask)
> >               gc->write_reg(gc->reg_clr, clear_mask);
> > +
> > +     return 0;
> >  }
> >
> >  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, b=
ool dir_out)
> > @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
> >       if (set && clr) {
> >               gc->reg_set =3D set;
> >               gc->reg_clr =3D clr;
> > -             gc->set =3D bgpio_set_with_clear;
> > -             gc->set_multiple =3D bgpio_set_multiple_with_clear;
> > +             gc->set_rv =3D bgpio_set_with_clear;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_with_clear;
> >       } else if (set && !clr) {
> >               gc->reg_set =3D set;
> > -             gc->set =3D bgpio_set_set;
> > -             gc->set_multiple =3D bgpio_set_multiple_set;
> > +             gc->set_rv =3D bgpio_set_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple_set;
> >       } else if (flags & BGPIOF_NO_OUTPUT) {
> > -             gc->set =3D bgpio_set_none;
> > -             gc->set_multiple =3D NULL;
> > +             gc->set_rv =3D bgpio_set_none;
> > +             gc->set_multiple_rv =3D NULL;
> >       } else {
> > -             gc->set =3D bgpio_set;
> > -             gc->set_multiple =3D bgpio_set_multiple;
> > +             gc->set_rv =3D bgpio_set;
> > +             gc->set_multiple_rv =3D bgpio_set_multiple;
> >       }
> >
> >       if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> > @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device =
*dev,
> >       }
> >
> >       gc->bgpio_data =3D gc->read_reg(gc->reg_dat);
> > -     if (gc->set =3D=3D bgpio_set_set &&
> > +     if (gc->set_rv =3D=3D bgpio_set_set &&
> >                       !(flags & BGPIOF_UNREADABLE_REG_SET))
> >               gc->bgpio_data =3D gc->read_reg(gc->reg_set);
> >
> >
> > --
> > 2.48.1
> >
>
> Isn't this missing to convert gc->set() to gc-set_rv() in several
> places?
>
> Without the attached diff I get a null pointer reference on e.g. the
> spacemit k1 driver.
>

Ah, yes, sorry for this and thanks for the catch. I will send a follow-up.

Bartosz

