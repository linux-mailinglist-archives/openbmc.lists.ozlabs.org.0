Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F393A845328
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 09:53:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QXUvPgmA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQXkQ6N7zz3cTS
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 19:53:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QXUvPgmA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=liuxiwei1013@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQXjB3ck3z3cPt
	for <openbmc@lists.ozlabs.org>; Thu,  1 Feb 2024 19:52:30 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cf33b909e8so17177591fa.0
        for <openbmc@lists.ozlabs.org>; Thu, 01 Feb 2024 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706777546; x=1707382346; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT2amiUv+cBINmQzWLqhwNeQe628YtiFpZuQYErYkCQ=;
        b=QXUvPgmACPBwIOZ7co2GhErgLU6wqJ5i2CKbAi95Yhx7H135b4YgmeM98Hvhpehy7w
         /Ps7uepYjsVKTJ6bBAXgDsztoCOvzllhYBai2tJVSSlv7RLZ4xHGpzZSb35jkJOix3CT
         Kalh0thVsFc4KKuPlcZp9TDgC7OZGc4RKSmGWvRF3utGj9pmbd9GAvqC4SbrHVXqoz9G
         3xViehGPP+ffvssOb2wP48PWM9wDGkqJVjhVR+qchVxzWifdINMpzMADm5xQkAVemOnE
         GkdqmOAxFsw38L780IUmpBABBcQzmti3W9Bkzx7QXIySp/Eq3WIRL2harmK1C8ULnzbi
         ey7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706777546; x=1707382346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT2amiUv+cBINmQzWLqhwNeQe628YtiFpZuQYErYkCQ=;
        b=HESshilq3nC244GjA5UNfAagcbzAW+MkEMSc/VTgfiyp3XF8gLjEvVL6JINzF1ipcW
         Aa8/9cIHF5q4GCBejeYiCEFE/vY05OjMIxw8RM7cEvB6NcrAZDT4zOuX+mFMeCQ/MzEV
         QLruh3wMgamB6yHkF14GKdls7QFlf+Bh8sFQ6lG4Owo3y4dWSNKZkIOrPlzLqsd7KRg7
         In+NxW5pDs6eHkBlSNnAf4grFyB1sbUjon6Evtna9bzlif+gn5RYIgK00Yz99f5P8BvC
         s+qZY5/UkKzPGPEE+0z1jGNZc7RfxxXh9U5N9jLH81PFWtYAfMKgO8R5eyojDpBe+Hfu
         gadg==
X-Gm-Message-State: AOJu0YwGtTNKHdfcVnA/D26g431KXcXwv0O41Q9jOUNT9dlCKpmHofMa
	pV3+Zom0/wMkC7SbMi+ea96MT47pgNN5RPFVwf3XuYyiHkoGR5v+EckIAv5zw1h3dx/XVN0bpBj
	y6XCSWK7ADublRuBTCdfMGastHMI=
X-Google-Smtp-Source: AGHT+IHj59PUe62BzGnHf818MdlIy6BSN37iLPwKsDBbQJGHWQZbFd68bDyP+ir1MoegpOHC68B2/9VrMkGNrIiPNrM=
X-Received: by 2002:a2e:b052:0:b0:2cf:30c3:ef09 with SMTP id
 d18-20020a2eb052000000b002cf30c3ef09mr1285705ljl.21.1706777545488; Thu, 01
 Feb 2024 00:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20240201082519.192861-1-liuxiwei@ieisystem.com> <bdb25a54-11c8-4925-9169-cb1a2ac18d93@molgen.mpg.de>
In-Reply-To: <bdb25a54-11c8-4925-9169-cb1a2ac18d93@molgen.mpg.de>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 1 Feb 2024 16:52:14 +0800
Message-ID: <CANFuQ7A08DZgmUavUQea_-ymQMeQ7hP9y9=e4BpBfM0u5PkEUQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: iio: pressure: dps310: Fix failure to read
 negative numbers
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 1, 2024 at 4:32=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>
> Dear George,
>
>
> Thank you for your patch.
>
>
> Am 01.02.24 um 09:25 schrieb George Liu:
> > The dps310 chip driver fails to read the temperature when the
> > temperature reaches below zero.
>
> Stating, how you fixed this would also be nice.
>
> How did you test this?

Updated.

>
> > Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> > ---
> >   drivers/iio/pressure/dps310.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps31=
0.c
> > index 1ff091b2f764..fcbfdc5e85b7 100644
> > --- a/drivers/iio/pressure/dps310.c
> > +++ b/drivers/iio/pressure/dps310.c
> > @@ -730,7 +730,7 @@ static int dps310_read_pressure(struct dps310_data =
*data, int *val, int *val2,
> >       }
> >   }
> >
> > -static int dps310_calculate_temp(struct dps310_data *data)
> > +static int dps310_calculate_temp(struct dps310_data *data, int *val)
> >   {
> >       s64 c0;
> >       s64 t;
> > @@ -746,7 +746,9 @@ static int dps310_calculate_temp(struct dps310_data=
 *data)
> >       t =3D c0 + ((s64)data->temp_raw * (s64)data->c1);
> >
> >       /* Convert to milliCelsius and scale the temperature */
> > -     return (int)div_s64(t * 1000LL, kt);
> > +     *val =3D (int)div_s64(t * 1000LL, kt);
> > +
> > +     return 0;
> >   }
>
> This works, because `dps310_get_temp_k` returns the temperature in
> Kelvin which cannot be negative?

dps310_get_temp_k is correct, the problem is
`return (int)div_s64(t * 1000LL, kt);`

If it reaches below 0 degrees, a negative number will definitely be
returned here.
Then in the dps310_read_temp method, `val` will not be assigned a
value, but rc will be returned directly;

>
>      static int dps310_get_temp_k(struct dps310_data *data)
>      {
>              int rc =3D dps310_get_temp_precision(data);
>
>              if (rc < 0)
>                      return rc;
>
>              return scale_factors[ilog2(rc)];
>      }
>
>
> Kind regards,
>
> Paul
>
> >   static int dps310_read_temp(struct dps310_data *data, int *val, int *=
val2,
> > @@ -768,11 +770,10 @@ static int dps310_read_temp(struct dps310_data *d=
ata, int *val, int *val2,
> >               if (rc)
> >                       return rc;
> >
> > -             rc =3D dps310_calculate_temp(data);
> > +             rc =3D dps310_calculate_temp(data, val);
> >               if (rc < 0)
> >                       return rc;
> >
> > -             *val =3D rc;
> >               return IIO_VAL_INT;
> >
> >       case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
