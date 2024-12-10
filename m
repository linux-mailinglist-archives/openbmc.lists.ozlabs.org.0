Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095B9EBF4E
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7FPn2zyTz3bxf
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 10:32:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733809142;
	cv=none; b=G+X/dWwUv3I5/XVRCcdPC8aqRQnvrEUuSVzcUC9Wm83pic8EdbwqOZJ8bDrldj+oNXVCEfVXTkIe+babxMDcd08p2MwRGFwx3BcLMut74fZH0ZfQOuUPNRFI3MW84aJGO9pvG5hztkblsUnsRH/UTJME8UNaVf4Rm35g+Qc5ND2/3YmgQVCdymEn16Nvuzw0NOCl+hM51JLFWjms+5hO+Iy7IoSCGXbkgomMwRY8JC2p7xcpdwGPLotdH6rwWNhmV2CxNuegVu5lUxPNqHOTDt9sTOLJbOLPkHNDmZ8HxSbdVrXDC5eluujbzH0gday6SbavWZXSQei7G3IqouEJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733809142; c=relaxed/relaxed;
	bh=u0Sd2Zpia9p4I/P5QdOCIki3q8PzF5alQXfg+WQOIIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLdFBnKwc7gxCwIEyCM8g9TX/1ra1PexGzfGG/AVxL5ZOjcPYvx8i2Uz5Qp9KIwc7iLs0ctYF9ywvb/zEfIPnkA2voFFeQrBJAZ5uhSd5NMReIldvTvDxoyTSOyJnBftlkZ304YfS/xWuzZ4DfzMSkQGXYbS1mEWUly3x87/RsCcBZbejSZL0mT3DwMZLhUv9FRGIPtonxhvXRsQ1PJT/ix2x81oVRDCKk3DAGOyCbtpBRz6uQuNMRrP2vNjfBkE7SYesVnTcr+LSOclBkfsLV4canrwsVSsJBJR1AqBxwwyAJBjoesmdu08d2fbXYJfvkF+slx9D+AjFjyEiE6Zyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kVvdNB7u; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kVvdNB7u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nbS6P15z2yWK
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 16:39:00 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so3684773a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 21:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733809137; x=1734413937; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Sd2Zpia9p4I/P5QdOCIki3q8PzF5alQXfg+WQOIIw=;
        b=kVvdNB7ud+RqUJfG5fGwDSQhzpxN68bf4pXn31MreC7YefwNoGvi6ouNrWD07suMd+
         Kty1bW14lNKyWhcp0aHdg8Xgbtf9ApVjJpCPcGuH4gkddplpP0LUjc+qW/AvPICAPXRb
         tiHIRO/ECWFlzvkxED6qn3dqL71VzAdLYPQcDZVMSja+dN2BwoAmtJxroPVnWT+xNlMC
         DM7wunhxVhx6NcxlbcX0amk3oRbmZBlH8FDfhNfgUczldtfq9KSqXb/YJoHLdG1mtpI6
         D/e8LKSCknrEGWC/NqPJu7z/LOc6amg6J0CVmrnAs+dIUqB5eVRblrCJDzksJYklLcFe
         mHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733809137; x=1734413937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0Sd2Zpia9p4I/P5QdOCIki3q8PzF5alQXfg+WQOIIw=;
        b=rZHQl5YFGTQT6nB0xe9kE6sgCwxib6Pz/mPPPHyaWJCt2+PdzaB/9Vy09vW8yz7bUV
         yFk/MI/IK6kk78jPL69N3OD/bOi0CHbV6nG+b36ZRqBKz2Ihs07yISOt2gVNEWtlVA9P
         MHDvbdv2BQnWI5NSfxUT/a5ocFDgGLXRM1PuQuBcY5IoYCnVKmvLyY5FCkdBYirL/0eZ
         Zp981Zv973WuLmzs5KMCFSryU+vFPPMSnwqvJ59bumWBfeaGfBbF6/17HAow90dAfl/z
         NJZH2d8SCOlVuIXX+VIrenaKxSegJKOcTJtiYku/A7fg1IaqwCAOj5P2NU58YuZ7pa6X
         v2pg==
X-Forwarded-Encrypted: i=1; AJvYcCWBLFB+dfF5fHRzLDTvAwkagNaK4wVEL57prlO2Ibp25EmcRph7htbNa4wOR3ohVcsyC9FaTdg8@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOXqFnpVQoVmXgL1Hf3OL29ZQNW6oK8ZgyW8rhP/t2yYR6wCVp
	L/kChRjVHYoV39hPeGeO22hRtZCIRMPaMvKQFtdf8HOm1EtBmjwMP3IXOyY3SkeoSxcmqGIHZ3F
	ZbbuiZgCObtx2tLMWNR1YjygPwRQ=
X-Gm-Gg: ASbGncvNuT2Zr+C4Wy9o3N5LWEmCAv0zRSklonkmKOUWrgpNbWWAnGMkq6CK0dLE4vj
	ltDC0XxQAEa3GzwyLF1en1rt3LiWbPqegSRs=
X-Google-Smtp-Source: AGHT+IFWbXXbBezRYu2d1fSrlQAyQx6qXKQ3cBECIyITs7BFiWP0aspN3Q/SDYVvcQ/SU/o5GUBIsTMaCpt6LiptpYg=
X-Received: by 2002:a17:906:2922:b0:aa6:8edf:bca5 with SMTP id
 a640c23a62f3a-aa69cd4639dmr307534666b.19.1733809137091; Mon, 09 Dec 2024
 21:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <20241208172236.18441e64@jic23-huawei>
In-Reply-To: <20241208172236.18441e64@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Tue, 10 Dec 2024 13:38:20 +0800
Message-ID: <CA+4Vgc+veFb6hCP4A7mPH_uiUCnmbsa=guWySRekYj660osQyg@mail.gmail.com>
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

Thanks for your comment.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=889=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue,  3 Dec 2024 17:15:40 +0800
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
> Given you have some good reviews already I only took a very quick glance
> through.  A few things inline
>
> Jonathan
>
> > diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> > new file mode 100644
> > index 000000000000..b28b5f4d7d70
> > --- /dev/null
> > +++ b/drivers/iio/adc/nct720x.c
>
> > +
> > +static int nct720x_write_event_value(struct iio_dev *indio_dev,
> > +                                  const struct iio_chan_spec *chan,
> > +                                  enum iio_event_type type,
> > +                                  enum iio_event_direction dir,
> > +                                  enum iio_event_info info,
> > +                                  int val, int val2)
> > +{
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +     int index, err =3D 0;
> > +     long v1, v2, volt;
> > +
> > +     index =3D nct720x_chan_to_index[chan->address];
> > +     volt =3D (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING;
> > +     v1 =3D volt >> 5;
> > +     v2 =3D (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info =3D=3D IIO_EV_INFO_VALUE) {
> > +             if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +                     guard(mutex)(&chip->access_lock);
>
> Might as well move this up one level as it is called in both legs.
>

I would remove guard(mutex) up one level.

> > +                     err =3D regmap_write(chip->regmap, REG_VIN_LOW_LI=
MIT[index], v1);
> > +                     if (err < 0)
> > +                             dev_err(&indio_dev->dev, "Failed to write=
 REG_VIN%d_LOW_LIMIT\n",
> > +                                     index + 1);
> > +
> > +                     err =3D regmap_write(chip->regmap, REG_VIN_LOW_LI=
MIT_LSB[index], v2);
> > +                     if (err < 0)
> > +                             dev_err(&indio_dev->dev, "Failed to write=
 REG_VIN%d_LOW_LIMIT_LSB\n",
> > +                                     index + 1);
> > +
> > +             } else {
> > +                     guard(mutex)(&chip->access_lock);
> > +                     err =3D regmap_write(chip->regmap, REG_VIN_HIGH_L=
IMIT[index], v1);
> > +                     if (err < 0)
> > +                             dev_err(&indio_dev->dev, "Failed to write=
 REG_VIN%d_HIGH_LIMIT\n",
> > +                                     index + 1);
> > +
> > +                     err =3D regmap_write(chip->regmap, REG_VIN_HIGH_L=
IMIT_LSB[index], v2);
> > +                     if (err < 0)
> > +                             dev_err(&indio_dev->dev, "Failed to write=
 REG_VIN%d_HIGH_LIMIT_LSB\n",
> > +                                     index + 1);
> > +             }
> > +     }
> > +     return err;
> > +}
>
> > +
> > +static const struct iio_info nct720x_info =3D {
> > +     .read_raw =3D nct720x_read_raw,
> > +     .read_event_config =3D nct720x_read_event_config,
> > +     .write_event_config =3D nct720x_write_event_config,
> > +     .read_event_value =3D nct720x_read_event_value,
> > +     .write_event_value =3D nct720x_write_event_value,
>
> Given you are supporting with and without interrupts, should probably pic=
k between
> versions of this that have the event config part and one that doesn't.
>

Sorry, could you give some examples for us to refer.

> > +};
> > +
> > +static const struct nct720x_adc_model_data nct7201_model_data =3D {
> > +     .model_name =3D "nct7201",
> > +     .channels =3D nct7201_channels,
> > +     .num_channels =3D ARRAY_SIZE(nct7201_channels),
> > +     .vin_max =3D 8,
> > +};
> > +
> > +static const struct nct720x_adc_model_data nct7202_model_data =3D {
> > +     .model_name =3D "nct7202",
> > +     .channels =3D nct7202_channels,
> > +     .num_channels =3D ARRAY_SIZE(nct7202_channels),
> > +     .vin_max =3D 12,
> > +};
> > +
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
> > +     if (err < 0)
> > +             return err;
> > +     data[0] =3D (u8)value;
> > +
> > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
> > +     if (err < 0)
> > +             return err;
>
> Here I think you can use a bulk read as the registers are next to each ot=
her.
>

Generally, registers with 8 bits support Byte format, and registers
with more than 8 bits support Word format.
If transmission a Word command to a register that supports Byte
format, the second byte will get 0xFF.
Here, if we use regmap_bulk_read(), we would get first byte correct
and second byte is wrong 0xff.
I use i2ctransfer to demo it.
root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x13 r1
0xff
root@evb-npcm845:~# i2ctransfer -f -y 5 w1@0x1d 0x14 r1
0x0f



> > +     data[1] =3D (u8)value;
> > +
> > +     value =3D get_unaligned_le16(data);
> > +     chip->vin_mask =3D value;
> > +
> > +     /* Start monitoring if needed */
> > +     err =3D regmap_read(chip->regmap, REG_CONFIGURATION, &value);
> > +     if (err < 0) {
> > +             dev_err(&chip->client->dev, "Failed to read REG_CONFIGURA=
TION\n");
> > +             return value;
> > +     }
> > +
> > +     value |=3D BIT_CONFIGURATION_START;
> > +     err =3D regmap_write(chip->regmap, REG_CONFIGURATION, value);
> > +     if (err < 0) {
> > +             dev_err(&chip->client->dev, "Failed to write REG_CONFIGUR=
ATION\n");
> > +             return err;
> > +     }
> > +
> > +     return 0;
> > +}
