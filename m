Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA4E9EBF51
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7FPs2s9Xz3cB5
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 10:32:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733809687;
	cv=none; b=cTgfYat57TEo1sxsv1cQWt07z7evgsvcPaWlNKv7dkaCnBdpRqpaDpDeSpbN6t5UUnmuGPjSJl/jYJH+eYjdVvlXT8ZfanbconX2zMHg/o+yaGvxtrx5hLiq/Q2KsWPGHn21jMv+QvcfEBx3xjggraR4vKNzAz46ZNFq8FSwUufhVmn47/pLhvoHXhrEunOv+u4um9P6MNyX8y8A4gtXklkzx9U76FrHQBzqSwR8NYiuBAdAXcmXR8B2cIrp1quOitQ4WIkdgu8TMFWbJy2RJzDSC/hmww2rHUhKmi22WZ0Fj+NjTm2JdIQbqCXw01d3QPwzo0YPWumt/WVyPXPW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733809687; c=relaxed/relaxed;
	bh=4226V4dvsflUch3sPAntJSiBKK05yf29rkTyIJUYaiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T50p7UltyZ+OIWrIjECmZmWkTk1Uia03Oj0JVTVUqUFmsqMtjU5tz/bBPFCMrmuwbYsDiJCrbwuQqxynFYusbxK2hmXhUqvlV84gK+8m4ZNMp2ABzsUM2JmRze/bE+h437ngy5zsmGpMOgTFkkOmEGo7UIk0pndQvgpm+cqUHQDAWKP+nktnYOnrFove6/m1/oQiPwTDEj2APUMrevp2h1gABm0HOuZVS4y9DyHjdj/RHf4XmwaUH+GZtBG8qQldBgRg58AE1b9vloHMyQsy745AcO+L0PXitKxl/uLQJy2QiGdzTbAnrnQWFVdsblAvNgSCfrlY/fZJl8qBH1MAwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PLtg354I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PLtg354I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nny4qxMz2xWt
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 16:48:05 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9e8522445dso1032960866b.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 21:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733809682; x=1734414482; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4226V4dvsflUch3sPAntJSiBKK05yf29rkTyIJUYaiA=;
        b=PLtg354I3F8wBtloHQS/XpKz1IcWL+ROhxrc+8pa3SrTwPt5nQuFmItUb2Nbpye82t
         MN6i8uEgkWBLjG233wylbgL0AwxSM3VFNLq/r8on7tfbcPBfMMuT4i9PqNfQVXlJxJjc
         b4xQ85D/zUxE4rOd+pSrpflbLKckgppYwfrNRrEESgrm7nUK27+iMW0BZ40b/CsWJ53k
         IzoCZAtgqHQktQu95gngzC74ghIy/+DDlueKQZ1NjVH3Unuh2L3NQcd34hM34P9+rEz1
         F6EjKnQX3FWkC2ZWJEeuN1bedi77JsjzZ7i+h8WmgwRrBJ9wBNxXs1R0yVMgYnxCzc5c
         z09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733809682; x=1734414482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4226V4dvsflUch3sPAntJSiBKK05yf29rkTyIJUYaiA=;
        b=T2rUrDwAJ7KS/5FAadriVmmvv4sSj+F+2q1EDFjJv2aiL1HaZYW3ALEJ3d2ss3JH9J
         IHg93HUM8N0DFxyVkP+3HmMd3mr/wBwD7A7dEdrrJ08fxIe9FeoK9d3JaGxzKEnFCq+y
         kTzHEw+8UrbOk5uqA4HRbwbnkK1TsKCraJO+jrnY270CIIQD3eO4FZ0hwMY1YkTHj5VC
         lOtsDwv4Jf0U88ojnpct5ITaYuQirX91r9arguz6RuTjLFTbArSEt2Ro8WLkQVzsEZTm
         Jft+13ZTx/mdW4kkPb8kBf2eTngZgGgIc6RW8ZEPe+4quHnGIZXlLbW8i1EvkC2IurUQ
         mZZA==
X-Forwarded-Encrypted: i=1; AJvYcCVd4W9fV38KjwwZQkRn0cKZcfcC9S+Xd4bfJM0VCTjUTQ9hKNg3H/Zm5N24TF544QSL993Py0tM@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtUdN26n/ei8juMTuElS1qZWm52QKR2WINBa+id1K2VYhCP2xi
	bejw4ywlBk10rzET7lKOOcZcEhPBX2i6a1CeoGxtAsN7Aucc3CvUcVMsjmnxPNyMcEp67GmLSto
	hUQvlkP7ppVS6NltFByPlkBG/ehY=
X-Gm-Gg: ASbGncvI91elzT0d2ss2hHto2Vmw7DPl4m6d/BAomZyMzpPUgeph3Gp8CK+sijm6kDV
	MUgV1FqebWuiihq7OhTbUHaiSY4YfglF9rpk=
X-Google-Smtp-Source: AGHT+IFCOSybOJKaSFqqrUKS7MOG9TiOm1tfqYGtieeRYvY2auzWawwNhq6nCddmGluDJ7XdTOEY8uMx0vXqWO9xfAs=
X-Received: by 2002:a17:906:2189:b0:aa6:4eab:872d with SMTP id
 a640c23a62f3a-aa69cd5dca3mr280418766b.34.1733809681782; Mon, 09 Dec 2024
 21:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <20241208172236.18441e64@jic23-huawei>
 <CA+4Vgc+veFb6hCP4A7mPH_uiUCnmbsa=guWySRekYj660osQyg@mail.gmail.com>
In-Reply-To: <CA+4Vgc+veFb6hCP4A7mPH_uiUCnmbsa=guWySRekYj660osQyg@mail.gmail.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Tue, 10 Dec 2024 13:47:25 +0800
Message-ID: <CA+4VgcLDQrTcTFjr7MYGtMYpqhzm0gym=zzkt33JGRHFkCXGVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Jonathan Cameron <jic23@kernel.org>
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jonathan Cameron,

Sorry the above mail is not finished and just sent it.
I would explain why we can't use bulk read sequential bytes in our chips.

Yu-Hsian Yang <j2anfernee@gmail.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:38=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Dear Jonathan Cameron,
>
> Thanks for your comment.
>
> Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=889=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Tue,  3 Dec 2024 17:15:40 +0800
> > Eason Yang <j2anfernee@gmail.com> wrote:
> >
> > > Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> > >
> > > NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and u=
p to
> > > 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins =
for
> > > independent alarm signals, and the all threshold values could be set =
for
> > > system protection without any timing delay. It also supports reset in=
put
> > > RSTIN# to recover system from a fault condition.
> > >
> > > Currently, only single-edge mode conversion and threshold events supp=
ort.
> > >
> > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > Hi Eason,
> >
> > Given you have some good reviews already I only took a very quick glanc=
e
> > through.  A few things inline
> >
> > Jonathan
> >
> > > diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> > > new file mode 100644
> > > index 000000000000..b28b5f4d7d70
> > > --- /dev/null
> > > +++ b/drivers/iio/adc/nct720x.c
> >
> > > +
> > > +static int nct720x_write_event_value(struct iio_dev *indio_dev,
> > > +                                  const struct iio_chan_spec *chan,
> > > +                                  enum iio_event_type type,
> > > +                                  enum iio_event_direction dir,
> > > +                                  enum iio_event_info info,
> > > +                                  int val, int val2)
> > > +{
> > > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > > +     int index, err =3D 0;
> > > +     long v1, v2, volt;
> > > +
> > > +     index =3D nct720x_chan_to_index[chan->address];
> > > +     volt =3D (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING=
;
> > > +     v1 =3D volt >> 5;
> > > +     v2 =3D (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
> > > +
> > > +     if (chan->type !=3D IIO_VOLTAGE)
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     if (info =3D=3D IIO_EV_INFO_VALUE) {
> > > +             if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > > +                     guard(mutex)(&chip->access_lock);
> >
> > Might as well move this up one level as it is called in both legs.
> >
>
> I would remove guard(mutex) up one level.
>
> > > +                     err =3D regmap_write(chip->regmap, REG_VIN_LOW_=
LIMIT[index], v1);
> > > +                     if (err < 0)
> > > +                             dev_err(&indio_dev->dev, "Failed to wri=
te REG_VIN%d_LOW_LIMIT\n",
> > > +                                     index + 1);
> > > +
> > > +                     err =3D regmap_write(chip->regmap, REG_VIN_LOW_=
LIMIT_LSB[index], v2);
> > > +                     if (err < 0)
> > > +                             dev_err(&indio_dev->dev, "Failed to wri=
te REG_VIN%d_LOW_LIMIT_LSB\n",
> > > +                                     index + 1);
> > > +
> > > +             } else {
> > > +                     guard(mutex)(&chip->access_lock);
> > > +                     err =3D regmap_write(chip->regmap, REG_VIN_HIGH=
_LIMIT[index], v1);
> > > +                     if (err < 0)
> > > +                             dev_err(&indio_dev->dev, "Failed to wri=
te REG_VIN%d_HIGH_LIMIT\n",
> > > +                                     index + 1);
> > > +
> > > +                     err =3D regmap_write(chip->regmap, REG_VIN_HIGH=
_LIMIT_LSB[index], v2);
> > > +                     if (err < 0)
> > > +                             dev_err(&indio_dev->dev, "Failed to wri=
te REG_VIN%d_HIGH_LIMIT_LSB\n",
> > > +                                     index + 1);
> > > +             }
> > > +     }
> > > +     return err;
> > > +}
> >
> > > +
> > > +static const struct iio_info nct720x_info =3D {
> > > +     .read_raw =3D nct720x_read_raw,
> > > +     .read_event_config =3D nct720x_read_event_config,
> > > +     .write_event_config =3D nct720x_write_event_config,
> > > +     .read_event_value =3D nct720x_read_event_value,
> > > +     .write_event_value =3D nct720x_write_event_value,
> >
> > Given you are supporting with and without interrupts, should probably p=
ick between
> > versions of this that have the event config part and one that doesn't.
> >
>
> Sorry, could you give some examples for us to refer.
>
> > > +};
> > > +
> > > +static const struct nct720x_adc_model_data nct7201_model_data =3D {
> > > +     .model_name =3D "nct7201",
> > > +     .channels =3D nct7201_channels,
> > > +     .num_channels =3D ARRAY_SIZE(nct7201_channels),
> > > +     .vin_max =3D 8,
> > > +};
> > > +
> > > +static const struct nct720x_adc_model_data nct7202_model_data =3D {
> > > +     .model_name =3D "nct7202",
> > > +     .channels =3D nct7202_channels,
> > > +     .num_channels =3D ARRAY_SIZE(nct7202_channels),
> > > +     .vin_max =3D 12,
> > > +};
> > > +
> > > +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> > > +{
> > > +     u8 data[2];
> > > +     unsigned int value;
> > > +     int err;
> > > +
> > > +     err =3D regmap_write(chip->regmap, REG_CONFIGURATION, BIT_CONFI=
GURATION_RESET);
> > > +     if (err) {
> > > +             dev_err(&chip->client->dev, "Failed to write REG_CONFIG=
URATION\n");
> > > +             return err;
> > > +     }
> > > +
> > > +     /*
> > > +      * After about 25 msecs, the device should be ready and then
> > > +      * the Power Up bit will be set to 1. If not, wait for it.
> > > +      */
> > > +     mdelay(25);
> > > +     err  =3D regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
> > > +     if (err < 0)
> > > +             return err;
> > > +     if (!(value & BIT_PWR_UP))
> > > +             return err;
> > > +
> > > +     /* Enable Channel */
> > > +     err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1, REG_CH=
ANNEL_ENABLE_1_MASK);
> > > +     if (err) {
> > > +             dev_err(&chip->client->dev, "Failed to write REG_CHANNE=
L_ENABLE_1\n");
> > > +             return err;
> > > +     }
> > > +
> > > +     if (chip->vin_max =3D=3D 12) {
> > > +             err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2=
, REG_CHANNEL_ENABLE_2_MASK);
> > > +             if (err) {
> > > +                     dev_err(&chip->client->dev, "Failed to write RE=
G_CHANNEL_ENABLE_2\n");
> > > +                     return err;
> > > +             }
> > > +     }
> > > +
> > > +     guard(mutex)(&chip->access_lock);
> > > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value=
);
> > > +     if (err < 0)
> > > +             return err;
> > > +     data[0] =3D (u8)value;
> > > +
> > > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value=
);
> > > +     if (err < 0)
> > > +             return err;
> >
> > Here I think you can use a bulk read as the registers are next to each =
other.
> >
>
Generally, registers with 8 bits support Byte format, and registers
with more than 8 bits support Word format.
If transmission a Word command to a register that supports Byte
format, the second byte will get 0xFF.
Here, if we use regmap_bulk_read(), we would get first byte correct
and second byte is wrong 0xff.

I use i2ctransfer command to demo it.
root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r1
0xff
root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x14 r1
0x0f

root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r2
0xff 0xff
And if we read four bytes, you can see the first and third byte as we wante=
d.
root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r4
0xff 0xff 0x0f 0xff

so we can't use bulk read directly since it would get a second byte 0xff.
The safe method is to  use read byte twice.

>
> > > +     data[1] =3D (u8)value;
> > > +
> > > +     value =3D get_unaligned_le16(data);
> > > +     chip->vin_mask =3D value;
> > > +
> > > +     /* Start monitoring if needed */
> > > +     err =3D regmap_read(chip->regmap, REG_CONFIGURATION, &value);
> > > +     if (err < 0) {
> > > +             dev_err(&chip->client->dev, "Failed to read REG_CONFIGU=
RATION\n");
> > > +             return value;
> > > +     }
> > > +
> > > +     value |=3D BIT_CONFIGURATION_START;
> > > +     err =3D regmap_write(chip->regmap, REG_CONFIGURATION, value);
> > > +     if (err < 0) {
> > > +             dev_err(&chip->client->dev, "Failed to write REG_CONFIG=
URATION\n");
> > > +             return err;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
