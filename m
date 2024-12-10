Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D279EBF52
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7FPx2Rffz3g1n
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 10:32:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733810413;
	cv=none; b=lgU53SpycaNTxP6mih5MtQpltOPDkATw1ybfz47P6zgV34TJSwV6TCwiwnDxMzRob/X/enN48ca5JnkkQhtSBJBlhJzIAzxC2sPfn72zbs3JONqEJEy0p5H3hByW775K8+iT6bg3ShTNzBrGbDi0D0L9eXU0ijwYINrDj0Yt5vMjI7mVP5KIHIJtRjWHyDNz/cdJHQnAfldE8+GqEDSB7ICVpzRM53cGTNe8+9rIf8Lhst7irE3vOaGy+b84IYsf6FQzCOQeVUdhjkiKZxKyzPpzVP2NxJS2UcULvjAePEuLh6y1jQFGaiXkxyOe5/hWYiZEqNuEn1kovVZp22duKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733810413; c=relaxed/relaxed;
	bh=WHbfjlgRpKE4dLapuGcw54S0zICUfY0cv7/zCV0JyFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETfYFevBWgXfrlR3tGXkHvWAk1scDeYH2Wc4MDg5D32acbpTx8/NH7YVuhHnXOwy/ZMUW5yWALAK4z6S6aUOLdsxe7XBcu2iJ64Pdr4KI71P/tSPtqFV9N/4cOIagGEcdCAVA4w/uYEkVB1RYcsIaLS5vJcx8bFYZK2nU7/OKk7gxx6uB5EmOro5pggvo/2Chyjh6BvUcysnvzFAzqvI3EIETQaFJtuznBvU1oMvXF+DZ4r+8F7HnpBVkxJCM4RzY7gHiZaHnkWUd9WyT/3SGHXk+f+345ecLL7+ltHWwcAvJb1qrDxaC+p56IiJn0oczkcyj8/nAvsQuYSLwuoWEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RN3Ml1sp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RN3Ml1sp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6p3v74zkz2ykt
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 17:00:10 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa67af4dc60so337229966b.2
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 22:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733810407; x=1734415207; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHbfjlgRpKE4dLapuGcw54S0zICUfY0cv7/zCV0JyFQ=;
        b=RN3Ml1spaYKkE0uqRQ9FnJbJVhTzW17sVyp34XL6pECVhYl6hv3j3tp2/CN7HvZ8wu
         hJaAqpASsUJqXzXebTeCREk5or8WkI7lxN7WH5QLsywaaUy7OFICzvo5XjuDR676oF7c
         d4HEP9D4aNie3J9bC4dohYNxk/k0BBf+pXVyZ9Vw4WtDkcPFyO3OwXfsHrsIA5pDyNiL
         TCYkMIH4IlZuK4p6s4DZlk8wZUxvZ1CukOfj8VTVXmogXHxP3TsmAfaD/3fv1uSmc7ph
         F+o9MM9PpO1MVJILpStAqMuyDxmXyMDKkpO1E2Be+0t7kRidPSk9oQtD5pcxXkJE+GfB
         JOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733810407; x=1734415207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHbfjlgRpKE4dLapuGcw54S0zICUfY0cv7/zCV0JyFQ=;
        b=Ti3ZcJ50/iC/QJlLDzl5Sm/l5+xRkaJvdk6Oaf95ZSCLuflJzCjzn5A91UY5jyaB1q
         v1Z43OZqCwPheEGZkP9GLIzxdFIgVOYkL3qQmZl+OigrQgov7LN1VLaMc2o63Shd1ZoJ
         /MKXDWq/I4uCgczFssq71+k2STeJjl6aYc5/bSJmPUVqMxSXKRXmvYqkoSJCzziVlo/d
         1rKhRzXRMENZQfof8vuXtf5d8vKfxHqE5dSW9/QAA/3qlTY5dazV6p7WqdbyAi8lUGOq
         bkmBk+nn/XEmwDdu+DkFXXuL4QxwFLX2FInvcM6+W42af3S6gzORKYTBFQbyzVhfIqcZ
         YJXg==
X-Forwarded-Encrypted: i=1; AJvYcCW/r3U1h/dHU/I/j8y2NgSIHCVIeARU9UoUQTpZHZ6LT7WgDlVeVfq2tk8sBDn3aMrxETmbg+2z@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3JPE6/NmCe+GvejKxI76AJmeFBbjPUOBfNi/rYYaAwWc19EwH
	H1mmrAtIav2sf4gLDe8BThXAO6v4Z16DdZ/7OTQgl/mnTjbLw86WX0BIDinv+ur4LJlY1dAKulY
	WdX42bPA0bkzxlfRFlVTHuuk2Efk=
X-Gm-Gg: ASbGncs4loL//Akttsf3vEvIfQXXI/ZXwraEsghKg+3yCwh64BnxjQZcN7MzgBPSm0H
	mgPH7C8gfRbf7nf8733wOF35p3P6Y1AreuFk=
X-Google-Smtp-Source: AGHT+IFWw58hMimyh4Z7NYDAgrffb/Ls9djAuX/kCx7M+n51illwZCJy8tjDQ7j38hrrnuyyN4N1D5kcTq9R34TcjOM=
X-Received: by 2002:a17:907:9507:b0:aa6:9372:cac7 with SMTP id
 a640c23a62f3a-aa69372ce49mr382580066b.31.1733810406863; Mon, 09 Dec 2024
 22:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <b5b43427-d0d7-43d5-bf8a-02a966ac25d3@wanadoo.fr>
In-Reply-To: <b5b43427-d0d7-43d5-bf8a-02a966ac25d3@wanadoo.fr>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Tue, 10 Dec 2024 13:59:30 +0800
Message-ID: <CA+4VgcK3FDdnLA_Z_xgikKd6diq3Tcfh2uDahnsKzEE0LBU=Jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 11 Dec 2024 10:32:01 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Christophe JAILLET,

Thanks for your comment.

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2024=E5=B9=B41=
2=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=881:47=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Le 03/12/2024 =C3=A0 10:15, Eason Yang a =C3=A9crit :
> > Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> >
> > NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up =
to
> > 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins fo=
r
> > independent alarm signals, and the all threshold values could be set fo=
r
> > system protection without any timing delay. It also supports reset inpu=
t
> > RSTIN# to recover system from a fault condition.
> >
> > Currently, only single-edge mode conversion and threshold events suppor=
t.
> >
> > Signed-off-by: Eason Yang <j2anfernee-Re5JQEeQqe8AvxtiuMwx3w@public.gma=
ne.org>
> > ---
>
> ...
>
> > +static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] =3D {
> > +     0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,
> > +     0x50, 0x52, 0x54, 0x56,
> > +};
> > +static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] =3D {
> > +     0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F,
> > +     0x51, 0x53, 0x55, 0x57,
> > +};
> > +static u8 nct720x_chan_to_index[] =3D {
>
> const as well here?
>
> > +     0 /* Not used */, 0, 1, 2, 3, 4, 5, 6,
> > +     7, 8, 9, 10, 11,
> > +};
>

Yes, it should add const here,
Finally we would remove nct720x_chan_to_index tables.
We would just store this value in the address field.

> ...
>
> > +static int nct720x_read_raw(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +     u16 volt;
> > +     unsigned int value;
> > +     int err;
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     guard(mutex)(&chip->access_lock);
>
> The IIO_CHAN_INFO_SCALE case does not seem to need the lock. Would it
> make sense to move it only in the IIO_CHAN_INFO_RAW case?
>

Remove guard(mutex) here.

> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             err =3D regmap_read(chip->regmap16, REG_VIN[index], &valu=
e);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D (u16)value;
> > +             *val =3D volt >> 3;
> > +             return IIO_VAL_INT;
> > +     case IIO_CHAN_INFO_SCALE:
> > +             /* From the datasheet, we have to multiply by 0.0004995 *=
/
> > +             *val =3D 0;
> > +             *val2 =3D 499500;
> > +             return IIO_VAL_INT_PLUS_NANO;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
>
> ...
>
> > +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> > +                                   const struct iio_chan_spec *chan,
> > +                                   enum iio_event_type type,
> > +                                   enum iio_event_direction dir,
> > +                                   bool state)
> > +{
> > +     int err =3D 0;
>
> Harmless but useless initialisation.
>

We would remove unused err variables.
Since it is very rare for regmap_write() to fail so usually we don't
print an error message for these.

> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +     unsigned int mask;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
>
> ...
>
> > +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> > +{
> > +     u8 data[2];
> > +     unsigned int value;
> > +     int err;
> > +
> > +     err =3D regmap_write(chip->regmap, REG_CONFIGURATION, BIT_CONFIGU=
RATION_RESET);
> > +     if (err) {
> > +             dev_err(&chip->client->dev, "Failed to write REG_CONFIGUR=
ATION\n");
> > +             return err;
> > +     }
> > +
> > +     /*
> > +      * After about 25 msecs, the device should be ready and then
> > +      * the Power Up bit will be set to 1. If not, wait for it.
> > +      */
> > +     mdelay(25);
> > +     err  =3D regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
>
> double space after err.
>

Okay.

> > +     if (err < 0)
> > +             return err;
> > +     if (!(value & BIT_PWR_UP))
> > +             return err;
> > +
> > +     /* Enable Channel */
> > +     err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1, REG_CHAN=
NEL_ENABLE_1_MASK);
> > +     if (err) {
> > +             dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_=
ENABLE_1\n");
> > +             return err;
> > +     }
> > +
> > +     if (chip->vin_max =3D=3D 12) {
> > +             err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, =
REG_CHANNEL_ENABLE_2_MASK);
> > +             if (err) {
> > +                     dev_err(&chip->client->dev, "Failed to write REG_=
CHANNEL_ENABLE_2\n");
> > +                     return err;
> > +             }
> > +     }
> > +
> > +     guard(mutex)(&chip->access_lock);
> > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
>
> double space after err.
>

Okay.

> > +     if (err < 0)
> > +             return err;
> > +     data[0] =3D (u8)value;
> > +
> > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
>
> double space after err.
>

Okay.

> > +     if (err < 0)
> > +             return err;
> > +     data[1] =3D (u8)value;
> > +
> > +     value =3D get_unaligned_le16(data);
> > +     chip->vin_mask =3D value;
> > +
> > +     /* Start monitoring if needed */
>
> ...
>
> CJ
