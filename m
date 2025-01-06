Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4176FA032D9
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 23:43:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRq2w4nBjz3fTt
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 09:43:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736152470;
	cv=none; b=Wgf/lW1KC5R0F9HqFhV4jHV5vjdf50X5dqowhcc+/MuaNr8Yr0BJ1DfdMpgWLh/7IhCNM7/EseYOt76PBCnkQjOME03VfuthTTP1ReBt1maiyU33T7PfQSlxeoFMi489cQvRWdIAIiicRrW10a2loi2iZ9ec1dRROM7F4fEHnjjD7jKy1Biu0FfdvFod0bRLJK887JwlDDP9Nbm2EPTe1dVQsKtfC6aV4DMjml+eM2J9BlUSf3pRIHyQJJrfzkq2V6PYvCj5mZIXjexqtrEfrwLW3YoDpP/RnM9/HG9ftqf9pms/AMj3Lshd21tYmsRsR4M4D941SkCSw7Srtn4XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736152470; c=relaxed/relaxed;
	bh=n6Iqc+FrugHzndLCcnM8oV6bZ74gcy663YR8GYG/Rrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OT/geLjWn5kpFn3f0VmlupmWwRSjqJbolCUR1mcQY4090LJi+WGaSOPXTBENqGQ3XnhBmb+WeV6epmvRm32+6pKGTVBnmvvGD61pNJ7SQxZOhS+SMKu2neCWTRCc4a9gyggAyJOGQa0+zOvJ6+5zJNt0Bh83yx9uxRX0eQIfW7ae1hC4PqRqZBMr4TL8uHhRffzYCrRW+anNh1fHk6T0AsA/7BRrCEm15H3ioMzR9ygsF8/xuz2b6l20oMzw5O3QAbojd6RIP1AQMLW6U4lQAUv8ZFmHzgzNlZdj3+h6wGYcQreOakiONozt8UqWpXTdtSTmhIIfnZRU6IJ+YyGQ8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DN3m1i7O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DN3m1i7O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRSCS2WZhz3055
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2025 19:34:27 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaf60d85238so789326266b.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736152459; x=1736757259; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6Iqc+FrugHzndLCcnM8oV6bZ74gcy663YR8GYG/Rrs=;
        b=DN3m1i7OP/+BH1Zkfjc91vnu946e0Mzh9UzJ5F5U4Zs/+JlpEP0ChbwXn0rO97jfh5
         LtxUfEhQ2Avc5+xQkpPC8ZOOQ7ZfF0x00nrc68g2shFdntm6eAuzFma01ksQkDP83g0X
         FIwvI7sqDDY2RCeHJdps/Oew1shJ9Euw3nqgU+W3uO4wXBEpywpswNMr6bQWvGRKhQqg
         vf8nfP9zT3OXa1SW2bCjGGRQLNN3HXCxv1isl1mW2Sav+TfNttgnWGJRDmmGZ+O6rWDk
         qjVvxJpTnCoq8VE+NLw+aaO9sgrvcEwvXbClE7r+Mk7oW0QOq2dYobOTcrg6z/RlvCHX
         XPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152459; x=1736757259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6Iqc+FrugHzndLCcnM8oV6bZ74gcy663YR8GYG/Rrs=;
        b=xHBBSAmON8Y6PpF+4ryQw0b2zuR6HinqHcEjAjJS6XfcEHsWoeST5U4d8VPF83nn7f
         ymaiRa8kQDvf5FR6opu6Tt8zbp+vBdsDrTDuCDteB543nvFphb0dAZ6n9mOMNTsRMytP
         WQS0PSFuf807zWzWueEbNiGgrnmAEiwXGKUrRFrWZgG1tTluRQaYY6z0lfo1VD5/Jcjn
         lDrXEmCnWTrpEHvBVGsQSe9KvRYHCB+tTEgc2LG8xYYX8ufJRtrxOvUbSaABy5r4+JiX
         fpfr9NUJC9zSJhFqtQZwkgJI8S1Bo8K4JcFoMXUIaGyf/rGNJ1dZZpLpFayjT5NlHrfU
         Brlw==
X-Forwarded-Encrypted: i=1; AJvYcCWW8C781hsomfmzkAQ/Zsa1a+lszA7Pr3dhPwuLV6CpTZ/Z8LuHg9SCM/Jqwk6pnHM27eNky5so@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0MrE/y0l1igKzLJBWjwt6vvQODN/hPoTCyZ6mTa3Zr5Gve7i9
	u0GFcn5yAQYf+dRWi8kOjVTCVY6XZ82BojENjMPzwDiKeF6zVmMUqdMzb1VhWMrXULBHjAtpGcw
	789UPlizOMEBWq304WRhR7S9w0lU=
X-Gm-Gg: ASbGncv+4mkNchM2G4BAZ20uoOHgNAGP4ta/aKr/YryululekDFkfgFdi5Zh5XGlgXC
	PCpzUlBmvUm3yrTkEqKOAMKOKVWnBQGJXLw4gnw==
X-Google-Smtp-Source: AGHT+IGp7BEDxRfRuegbN8MbOX/1vnSMSGgv/2tSy7FbVW1HLiJ0B96htNX1pHjWCg+E/mOQyFe0YrTM0d3KOGVo8zM=
X-Received: by 2002:a17:907:6ea6:b0:aa6:8bb4:503b with SMTP id
 a640c23a62f3a-aac345f3545mr5881487266b.55.1736152459190; Mon, 06 Jan 2025
 00:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20241226055313.2841977-1-j2anfernee@gmail.com>
 <20241226055313.2841977-3-j2anfernee@gmail.com> <Z26aMVayh-EdYA8n@smile.fi.intel.com>
In-Reply-To: <Z26aMVayh-EdYA8n@smile.fi.intel.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 6 Jan 2025 16:33:42 +0800
Message-ID: <CA+4VgcK4apNKWXhWvViPU6JfyXu9ZTQ7-TBauTaYUHnp0j1s-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: adc: add Nuvoton NCT7201 ADC driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: tgamblin@baylibre.com, herve.codina@bootlin.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, nuno.sa@analog.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Andy,

Thanks for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
12=E6=9C=8827=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:14=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Thu, Dec 26, 2024 at 01:53:13PM +0800, Eason Yang wrote:
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
>
> ...
>
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             err =3D regmap_read(chip->regmap16, NCT7201_REG_VIN(chan-=
>address), &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D value;
>
> > +             *val =3D volt >> 3;
>
> I am not sure I understand this. If it's a shifted field, you rather
> should fix it by using FIELD_*() macros from bitfield.h, otherwise
> it's even more confusing.
>

+ #define NCT7201_REG_VIN_MASK                GENMASK(15, 3)

- *val =3D volt >> 3;
+ *val =3D FIELD_GET(NCT7201_REG_VIN_MASK, volt);

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
>
> ...
>
> > +     *val =3D volt >> 3;
>
> Ditto.
>
>
> ...
>
> > +     v1 =3D val >> 5;
> > +     v2 =3D FIELD_PREP(NCT7201_REG_VIN_LIMIT_LSB_MASK, val) << 3;
>
> Ditto.
>

The VIN reading supports Byte read (One Byte) and Word read (Two
Byte), the same as the VIN writing.
We don't need to separate 13-bit val into two bytes.
We can use 16-bit regmap to write val with right shift 3 bit to
replace write 8-bit regmap register twice.

> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info =3D=3D IIO_EV_INFO_VALUE) {
> > +             guard(mutex)(&chip->access_lock);
> > +             if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LI=
MIT(chan->address), v1);
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_LOW_LI=
MIT_LSB(chan->address), v2);
> > +             } else {
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_L=
IMIT(chan->address), v1);
> > +                     regmap_write(chip->regmap, NCT7201_REG_VIN_HIGH_L=
IMIT_LSB(chan->address), v2);
> > +             }

    if (dir =3D=3D IIO_EV_DIR_FALLING)
-         regmap_write(chip->regmap,
NCT7201_REG_VIN_LOW_LIMIT(chan->address), v1);
-         regmap_write(chip->regmap,
NCT7201_REG_VIN_LOW_LIMIT_LSB(chan->address), v2);
+        regmap_write(chip->regmap16,
NCT7201_REG_VIN_LOW_LIMIT(chan->address),
FIELD_PREP(NCT7201_REG_VIN_MASK, val));
    else
-         regmap_write(chip->regmap,
NCT7201_REG_VIN_HIGH_LIMIT(chan->address), v1);
-         regmap_write(chip->regmap,
NCT7201_REG_VIN_HIGH_LIMIT_LSB(chan->address), v2);
+        regmap_write(chip->regmap16,
NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
FIELD_PREP(NCT7201_REG_VIN_MASK, val));

>
> This needs a comment why regmap_bulk_write() can't be used.
>

We can't use regmap_bulk_write() since the chip limit.
regmap_bulk_write(chip->regmap, ..., ..., 2) ,
the first byte is well written, but the second byte don't changed.

> > +     }
>
> ...
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
> No error check?
>

As David Lechner mentioned,
Better would be `return dev_err_probe()`. But it is very rare for
regmap_write() to fail so usually we don't print an error message
for these.

So we would remove print an error message for all remap_write.

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
> > +
> > +     value =3D get_unaligned_le16(data);
> > +     chip->vin_mask =3D value;
> > +
> > +     /* Start monitoring if needed */
> > +     err =3D regmap_read(chip->regmap, NCT7201_REG_CONFIGURATION, &val=
ue);
> > +     if (err < 0) {
>
> > +             dev_err_probe(&chip->client->dev, -EIO, "Failed to read R=
EG_CONFIGURATION\n");
> > +             return value;
>
> You already used
>
>         return dev_err_probe(...);
>
> above, why here it's different? You want return something in addition to =
the
> error code? Why?
>

It should use
return dev_err_probe(&chip->client->dev, -EIO, "Failed to read
REG_CONFIGURATION\n");

> > +     }
> > +
> > +     value |=3D NCT7201_BIT_CONFIGURATION_START;
> > +     regmap_write(chip->regmap, NCT7201_REG_CONFIGURATION, value);
> > +
> > +     return 0;
> > +}
>
> ...
>
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
>
> I don't see how these configurations will prevent, e.g., debugfs to acces=
s
> 16-bit registers via 8-bit IO and vice versa.
>

Read VIN info can use word read or byte read, and other registers
should use byte read.

The design is that VIN info registers are used 16-bit debugfs to access and
other registers are used 8-bit debugfs to access.

We need to probe 8-bit regmap and 16-bit regmap,
but I have no idea how to prevent 8-bit IO to access 16-bit registers
and vice versa.

> --
> With Best Regards,
> Andy Shevchenko
>
>
