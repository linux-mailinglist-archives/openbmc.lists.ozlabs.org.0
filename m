Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0088A032DA
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 23:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRq301XgLz3fty
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 09:43:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736155955;
	cv=none; b=ULRDmVN0B/T5ponxBXd1gD/F10Y3JL7dJ4DrlytAvH390jLuUkiOmI1+oEpEFuFkma/nOpLJSpHFKyeYhFTJSvlm5tMs55Glv1G2t6WpI5KqcblbHgUwhxZZGZqKZZYICEjh4DMJDUCkBYZS05tWTMm5+VvUGiv5lQ9diyrNCRbrmxOrehrfjNY4/WXM8l4V3SdlzBI0gqnidxd8GgQsZPt2uDu6KWiAlKjlqH6eqDwOKd7p8KdE+k1H4Dt+9M485U/G8Os94QgS3rf9XwpZuLa4ymHR4cEwK3f3ds4QfnAVPLEG3T8iHDZqfYsGH8tqrQx8t1F4aLiZiNar6ISucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736155955; c=relaxed/relaxed;
	bh=FkorgIae98MH0Wo98cczURHUjhN8UFbBKY6DYTGXSzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxqjKxDuxDyZo7Tow+Ms1iFm+dyWjRXFe8rFVu5O4zFCxUj2W2jwXd6T5MJgPoN/IxKH4SU9e07KEx+Z/BpYOp/5xX4Sm2uy88duOcV/b/gZLAg9J71pd8PhHgVbH6npR6XnilaKQZa86QKSNHrM+6mPVPG3DNht+wuz6vFhwwQhbWYu05kxNjjvyvya4H/etnB5yUKBsEKWOapXxO1/s4e1mFGyOchy8/EulP15ufFZqBSK4yXC3zkiSC24LTokkBm/s56Hd09FvGBMsaolCV+C6NEwpb6KFtcFRrnYerdPFHq6dcouzvIDaI6woUkpflSFxDytNLd9Kqdj4w9IIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FZxuo5A9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FZxuo5A9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRTVV1GRLz2xJ8
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2025 20:32:32 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa68b513abcso2639107166b.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736155948; x=1736760748; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkorgIae98MH0Wo98cczURHUjhN8UFbBKY6DYTGXSzI=;
        b=FZxuo5A9V0KQxfzDjLoOpwlMfYnL+Yc1zNExJ6NNB3oW6HyxlLjZWxrWRzwhOVQKfK
         86eY4YqrgcYFffNL7PKzQAQwaWTwsmEa5Zs3lwG+1KM9evNcPbHYG/OIZIAwihteIy30
         K6S9d/mB5v9L9kPSAnGrYtlCAa63LLoR3t01RrhvJ37tuc3iE1tKLad1INAY3MnR95Z1
         srHGFg8eUiuBA4eMXnNKkhJz3+vgWCbTMOND2mZwzcHu5DVgmXpbwTJsGAHR0rdJb7XJ
         r5XOYJqi2CprLAuSHe2rKZydjglwpEGpCIEZyLLf3T8vW6AGPjtm0oDcjcUb8IUieVFT
         ulMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155948; x=1736760748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkorgIae98MH0Wo98cczURHUjhN8UFbBKY6DYTGXSzI=;
        b=J7bztGMphDyqVjFyw3fAtV2weV6sNrLa0lGQp9MVZ+9S399cSuPrFWYDfXSPaKQnGg
         +fBKZ0+792L6Zk2f80ngSqfC0vcGfG7UxbsjbzHKRLG2X+NbCVmDlzPSFQ9emaz9pR97
         8xEZCC7fuGkhWdjBbazJ6cQNDAb3bW8l5IvzPpZqZ5XeBjKYGmXUkOG+h1Qe8NeBYt/5
         ettSrbVVUmd4zfZSCKja34vvM33AtAoNozNM0DNzKY6ilBxZgNwPshG9hKNoxq55APka
         1JZjJwJzXyFLVK/I6fWt+9vjF/HxnRSQmFG0FRH9FZmQu+i2pnQe5lTgF3H6i5CuAxb5
         7/ew==
X-Forwarded-Encrypted: i=1; AJvYcCVve8GuoLzKBBVuDQFM0MyVQC7ambyfaB8rRrP361DyNLr7Zbr11NOLO7sbqZgHMmAx0q6Y+/Cx@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ//oTGaH51PU+/GxEYi5TsmpkdOWsH5mw8Ynj6zt8Hu7/jBjn
	PXTOiRiclbObj90xh9z9lzUxiOIGFLqZxBuVHxgEmbf2ikiDCVipxDFvGrvVxRiWT+9Ig/AcF4v
	pyRCgdyiUiBLpHNZjp9Neap+W0DE=
X-Gm-Gg: ASbGnctcTxpWxleNPEVE+RiTpuZaA8n5s1D7sgH9VZ0Nmm9OEhr+3EwwQfSrU+2+uLm
	lPkuLu/YfcR7pzXy7zh+R6dexX5PxzK2KFubTTA==
X-Google-Smtp-Source: AGHT+IFKHaCFlgCTzsFEnXDYUxW3e5R2VJeWtbbfDQMA1+PaVK9c4I08Ptv3RDKI3dtiiFiL8wXNhGLb54xNaKTIhhQ=
X-Received: by 2002:a17:907:c27:b0:aaf:ab71:67b6 with SMTP id
 a640c23a62f3a-aafab716801mr960090566b.31.1736155947710; Mon, 06 Jan 2025
 01:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
 <20241226055313.2841977-3-j2anfernee@gmail.com> <20241228133531.5e98357e@jic23-huawei>
In-Reply-To: <20241228133531.5e98357e@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 6 Jan 2025 17:31:51 +0800
Message-ID: <CA+4VgcKK1Hfz08paYjDCV=YL-C4bsWCNCRdH1Q8=4=hjEuYC9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: adc: add Nuvoton NCT7201 ADC driver
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 07 Jan 2025 09:43:11 +1100
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jonathan,

Thanks for your comments.

Some questions are replied in Andy's comments.

We use FIELD_GET and FIELD_PREP to handle bit shift operations.

About regmap_write case, we remove print an error message according to
David Lechner mentioned.
If check for errors are needed, we would recovery it.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8828=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=889:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 26 Dec 2024 13:53:13 +0800
> Eason Yang <j2anfernee@gmail.com> wrote:
>
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
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> Hi Eason,
>
> Various minor comments in addition to what Andy has
> posted already.
>
> Jonathan
>
> > diff --git a/drivers/iio/adc/nct7201.c b/drivers/iio/adc/nct7201.c
> > new file mode 100644
> > index 000000000000..9ad4d2919461
> > --- /dev/null
> > +++ b/drivers/iio/adc/nct7201.c
> > @@ -0,0 +1,449 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> > + *
> > + * Copyright (c) 2024 Nuvoton Inc.
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > +
> > +#include <linux/iio/events.h>
> > +#include <linux/iio/iio.h>
> > +
> > +#define NCT7201_VIN_MAX                                      12      /=
* Counted from 1 */
> > +#define NCT7201_IN_SCALING                           4995
> > +#define NCT7201_IN_SCALING_FACTOR                    10000
> > +
> > +#define NCT7201_REG_INTERRUPT_STATUS_1                       0x0C
> > +#define NCT7201_REG_INTERRUPT_STATUS_2                       0x0D
> > +#define NCT7201_REG_VOLT_LOW_BYTE                    0x0F
> > +#define NCT7201_REG_CONFIGURATION                    0x10
> > +#define  NCT7201_BIT_CONFIGURATION_START             BIT(0)
> > +#define  NCT7201_BIT_CONFIGURATION_ALERT_MSK         BIT(1)
> > +#define  NCT7201_BIT_CONFIGURATION_CONV_RATE         BIT(2)
> > +#define  NCT7201_BIT_CONFIGURATION_RESET             BIT(7)
> > +
> > +#define NCT7201_REG_ADVANCED_CONFIGURATION           0x11
> > +#define  NCT7201_BIT_ADVANCED_CONF_MOD_ALERT         BIT(0)
> > +#define  NCT7201_BIT_ADVANCED_CONF_MOD_STS           BIT(1)
> > +#define  NCT7201_BIT_ADVANCED_CONF_FAULT_QUEUE               BIT(2)
> > +#define  NCT7201_BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN  BIT(4)
> > +#define  NCT7201_BIT_ADVANCED_CONF_EN_SMB_TIMEOUT    BIT(5)
> > +#define  NCT7201_BIT_ADVANCED_CONF_MOD_RSTIN         BIT(7)
> > +
> > +#define NCT7201_REG_CHANNEL_INPUT_MODE                       0x12
> > +#define NCT7201_REG_CHANNEL_ENABLE_1                 0x13
> > +#define  NCT7201_REG_CHANNEL_ENABLE_1_MASK           GENMASK(7, 0)
> > +#define NCT7201_REG_CHANNEL_ENABLE_2                 0x14
> > +#define  NCT7201_REG_CHANNEL_ENABLE_2_MASK           GENMASK(3, 0)
>
> As below. I'd treat these two registers as one larger register.
>
> > +static int nct7201_read_raw(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     u16 volt;
> > +     unsigned int value;
> > +     int err;
> > +     struct nct7201_chip_info *chip =3D iio_priv(indio_dev);
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     guard(mutex)(&chip->access_lock);
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             err =3D regmap_read(chip->regmap16, NCT7201_REG_VIN(chan-=
>address), &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D value;
> > +             *val =3D volt >> 3;
>
> As below, likely a FIELD_GET() is appropriate here.
>
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
> > +
> > +static int nct7201_read_event_value(struct iio_dev *indio_dev,
> > +                                 const struct iio_chan_spec *chan,
> > +                                 enum iio_event_type type,
> > +                                 enum iio_event_direction dir,
> > +                                 enum iio_event_info info,
> > +                                 int *val, int *val2)
> > +{
> > +     struct nct7201_chip_info *chip =3D iio_priv(indio_dev);
> > +     u16 volt;
> > +     unsigned int value;
> > +     int err;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info !=3D IIO_EV_INFO_VALUE)
> > +             return -EINVAL;
> > +
> > +     if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +             err =3D regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_L=
IMIT(chan->address), &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D value;
> > +     } else {
> > +             err =3D regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_=
LIMIT(chan->address), &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D value;
> > +     }
> > +
> > +     *val =3D volt >> 3;
> As Andy pointed out, likely a FIELD_GET() makes sense here.
>
> > +
> > +     return IIO_VAL_INT;
> > +}
> > +
> > +static int nct7201_write_event_value(struct iio_dev *indio_dev,
> > +                                  const struct iio_chan_spec *chan,
> > +                                  enum iio_event_type type,
> > +                                  enum iio_event_direction dir,
> > +                                  enum iio_event_info info,
> > +                                  int val, int val2)
> > +{
> > +     struct nct7201_chip_info *chip =3D iio_priv(indio_dev);
> > +     long v1, v2;
> > +
> > +     v1 =3D val >> 5;
> > +     v2 =3D FIELD_PREP(NCT7201_REG_VIN_LIMIT_LSB_MASK, val) << 3;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info =3D=3D IIO_EV_INFO_VALUE) {
> I'd flip this to
>         if (info !=3D IIO_EV_INFO_VALUE)
>                 return -EOPNOTSUPP;
>
>         guard().
>
> > +             guard(mutex)(&chip->access_lock);
> > +             if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LI=
MIT(chan->address), v1);
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LI=
MIT_LSB(chan->address), v2);
>
> Check for errors.
>
> > +             } else {
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_L=
IMIT(chan->address), v1);
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_L=
IMIT_LSB(chan->address), v2);
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
>
> > +
> > +static int nct7201_write_event_config(struct iio_dev *indio_dev,
> > +                                   const struct iio_chan_spec *chan,
> > +                                   enum iio_event_type type,
> > +                                   enum iio_event_direction dir,
> > +                                   bool state)
> > +{
> > +     struct nct7201_chip_info *chip =3D iio_priv(indio_dev);
> > +     unsigned int mask;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     mask =3D BIT(chan->address);
> > +
> > +     if (!state && (chip->vin_mask & mask))
> > +             chip->vin_mask &=3D ~mask;
> > +     else if (state && !(chip->vin_mask & mask))
> > +             chip->vin_mask |=3D mask;
> > +
> > +     guard(mutex)(&chip->access_lock);
> > +     regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> > +                  chip->vin_mask & NCT7201_REG_CHANNEL_ENABLE_1_MASK);
> > +     if (chip->num_vin_channels =3D=3D 12)
> > +             regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2,
> > +                          chip->vin_mask & NCT7201_REG_CHANNEL_ENABLE_=
2_MASK);
>
> This feels odd.  Don't you need to shift that vin_mask to get rid of chan=
nels
> that are enabled via ENABLE_1?
>

We need to right shift 8 bit chip->vin_mask and write into ENABLE_2.
> > +     if (chip->num_vin_channels =3D=3D 12)
> > +             regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2,
-                          chip->vin_mask & NCT7201_REG_CHANNEL_ENABLE_2_MA=
SK);
+                         FIELD_GET(GENMASK(15, 8), chip->vin_mask) &
NCT7201_REG_CHANNEL_ENABLE_2_MASK);

> > +
> > +     return 0;
> > +}
>
> > +static int nct7201_init_chip(struct nct7201_chip_info *chip)
> > +{
> > +     u8 data[2];
> > +     unsigned int value;
> > +     int err;
> > +
> > +     regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION,
> > +                  NCT7201_BIT_CONFIGURATION_RESET);
>
> Add a comment on why you don't check return value (or do check it if appr=
opriate).
>
> > +
> > +     /*
> > +      * After about 25 msecs, the device should be ready and then
> > +      * the Power Up bit will be set to 1. If not, wait for it.
> > +      */
> > +     mdelay(25);
> > +     err =3D regmap_read(chip->regmap, NCT7201_REG_BUSY_STATUS, &value=
);
> > +     if (err < 0)
> > +             return err;
> > +     if (!(value & NCT7201_BIT_PWR_UP))
> > +             return dev_err_probe(&chip->client->dev, -EIO, "failed to=
 power up after reset\n");
> > +
> > +     /* Enable Channel */
> > +     guard(mutex)(&chip->access_lock);
> > +     regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
> > +                  NCT7201_REG_CHANNEL_ENABLE_1_MASK);
>
> Check return value.  This is over an I2C bus, not the most reliable of
> transports!
>
> Consider doing this differently and using a bulk write for the larger
> case.
>
>         if (chip->num_vin_channels <=3D 8)
>                 ret =3D regmap_write();
>         else
>                 ret =3D regmap_bulk_write();
>
> However as you read ENABLE_2 unconditionally below, can you instead just
> always use a bulk write here?
>

We can't use regmap_bulk_write() due to the chip's limit.
regmap_bulk_write(chip->regmap, ..., ..., 2) ,
the first byte is well written, but the second byte don't changed.


> > +     if (chip->num_vin_channels =3D=3D 12)
> > +             regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2,
> > +                          NCT7201_REG_CHANNEL_ENABLE_2_MASK);
> > +
> > +     err =3D regmap_read(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1, &=
value);
> > +     if (err < 0)
> > +             return err;
> > +     data[0] =3D value;
> > +
> > +     err =3D regmap_read(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_2, &=
value);
> > +     if (err < 0)
> > +             return err;
> > +     data[1] =3D value;
>
> Why does reading these back make sense?  Is there a reason the write
> above might not work if the I2C transfer is Acked?
>
> If this is part of discovery protocol for how many channels are there, th=
en
> add comments.
>

We remove read back enable registers, just assign data value after
regmap_write() successfully.
Like,
    err =3D regmap_write(chip->regmap, NCT7201_REG_CHANNEL_ENABLE_1,
             NCT7201_REG_CHANNEL_ENABLE_1_MASK);
    if (err) {
        dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_1\n=
");
        return err;
    }
    data[0] =3D NCT7201_REG_CHANNEL_ENABLE_1_MASK;

> > +
> > +     value =3D get_unaligned_le16(data);
> > +     chip->vin_mask =3D value;
> > +
> > +     /* Start monitoring if needed */
> > +     err =3D regmap_read(chip->regmap, NCT7201_REG_CONFIGURATION, &val=
ue);
> > +     if (err < 0) {
> > +             dev_err_probe(&chip->client->dev, -EIO, "Failed to read R=
EG_CONFIGURATION\n");
> > +             return value;
>
> Why return value if an error occurred?
>                 retuen dev_err_probe();
>
> > +     }
> > +
> > +     value |=3D NCT7201_BIT_CONFIGURATION_START;
> > +     regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION, value);
>
> regmap_set_bits()
>

-     value |=3D NCT7201_BIT_CONFIGURATION_START;
-     regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION, value);
+     regmap_set_bits(chip->regmap, NCT7201_REG_CONFIGURATION,
NCT7201_BIT_CONFIGURATION_START);

> > +
> > +     return 0;
> > +}
> > +
> > +static const struct regmap_config nct7201_regmap8_config =3D {
> > +     .name =3D "vin-data-read-byte",
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +     .max_register =3D 0xff,
> > +};
> > +
> > +static const struct regmap_config nct7201_regmap16_config =3D {
> > +     .name =3D "vin-data-read-word",
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 16,
> > +     .max_register =3D 0xff,
> > +};
> > +
> > +static int nct7201_probe(struct i2c_client *client)
> > +{
> > +     const struct nct7201_adc_model_data *model_data;
> > +     struct nct7201_chip_info *chip;
> > +     struct iio_dev *indio_dev;
> > +     int ret;
> > +
> > +     model_data =3D i2c_get_match_data(client);
> > +     if (!model_data)
> > +             return -EINVAL;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*chip));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +     chip =3D iio_priv(indio_dev);
> > +
> > +     chip->regmap =3D devm_regmap_init_i2c(client, &nct7201_regmap8_co=
nfig);
> > +     if (IS_ERR(chip->regmap))
> > +             return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> > +                     "Failed to init regmap\n");
> > +
> > +     chip->regmap16 =3D devm_regmap_init_i2c(client, &nct7201_regmap16=
_config);
> > +     if (IS_ERR(chip->regmap16))
> > +             return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16=
),
> > +                     "Failed to init regmap16\n");
> > +
> > +     chip->num_vin_channels =3D model_data->num_vin_channels;
> > +
> > +     ret =3D devm_mutex_init(&client->dev, &chip->access_lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     chip->client =3D client;
> > +
> > +     ret =3D nct7201_init_chip(chip);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     indio_dev->name =3D model_data->model_name;
> > +     indio_dev->channels =3D model_data->channels;
> > +     indio_dev->num_channels =3D model_data->num_channels;
> > +     if (client->irq)
> > +             indio_dev->info =3D &nct7201_info;
> > +     else
> > +             indio_dev->info =3D &nct7201_info_no_irq;
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +
> > +     return devm_iio_device_register(&client->dev, indio_dev);
> > +}
