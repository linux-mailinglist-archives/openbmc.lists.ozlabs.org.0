Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD199EBF4C
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7FPj27WSz3dC2
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 10:32:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733808503;
	cv=none; b=S0Fh8THLUbMDhsjX/Xr0qHIbhtMNu4A1hycOOlC3UQG5Q9Eu2LOQgOGBc6i9mJIOp8IfBLA/B+3NsHNQV+5MMFsRG2PDnxA6VwtgmbYBkoDJj2MsYO1vIvEKKn4llsmDwPB+xHq2I+mBonsPWEbyT2vJFfpHW1I/4i7TjIl/f9iJFGGlW2xGa2C8WZ6ERgMXW1QxEkzV1zlFMSaCdHG8lMCDkxzTsxBEpqrQ3yXmxX0Y7JltgoRXgsuKeCQhkyZin3GCG+r8hSSaZ0TmIJLq1SFG3nunLKWAz3+rsVwn0sGFIceLzEKPfyXpktPN/OH7n5KXPj/OKh5dA2yUw92hxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733808503; c=relaxed/relaxed;
	bh=iahb3Sc0n+N6aK3kht+20K6wy2Ru9xprYtQWnbXt+98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4DaBwhwkNddoC3BwnTHtudfqxz4h1+yUnjRRwJKPvDUHT5keXuh2CQhvKtrcLCnvozZvIietX3VkAGNSHvgNvnTSjPpYGF/Ih3qxr1zUgNipRKHm0LSp+pIpt4nAaeI0ynEB8lUeM38XxP6BVo/5obFjk87EeXMywprp07/damtr7JMy2bH3tIfnyuva1qeA9qzxg+Cpw/UjymdbyJYKjU9RFrTMyMPIjES512rYkn4vYrMz7ODUKOoJwrETJWNlxjX22ItUl6oRO2mbfh6oum3KbUIA/V5XpUUac+PHWOxrpOGuQugNsKR7QAsTTNbhNvKoay5A4TBG5vrpvQrww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0TJZN2g; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b0TJZN2g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nM93F8Tz2yQJ
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 16:28:20 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso732299866b.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 21:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733808497; x=1734413297; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iahb3Sc0n+N6aK3kht+20K6wy2Ru9xprYtQWnbXt+98=;
        b=b0TJZN2gEyQgwcEUE8K/Jf1fRUGQQAhsPXtqrvQqAa5Eh1U0nnUw1JGGlDKyXOsjqS
         GU3aiamikfM7LCR2vwC2sPxFLx9eck3d2RoKdCHnrRiLGcAho1ZgshvoSSNO6YGzpuP8
         iC/WDNyKAb0TCW1Rl3M+ETs4xa5uZjt/FZY5malYgzdzZhOqziOfOrY5gxmPPa1/YXO5
         TajXC6GLxmZeskbM+vG6ZmEdkMZWqURmLXaIZMfelW0+6mvBB1/a6xp7RpafDaT/N0Dt
         JocNuF1nK/slUgtAuujw2+NMAQerifqyB33CyDWSCIlG6Q94Q9Ddpcjh0NG1FJ+ibSmh
         IkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733808497; x=1734413297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iahb3Sc0n+N6aK3kht+20K6wy2Ru9xprYtQWnbXt+98=;
        b=d+b2KRCmJZ5fDyjfy/Elh6t8sdVi7GZ0+A4PX4l5PqZRLIVYfrNugQG79whXjYz8ij
         LaQ189b/HwzDp7u4gWCnqAglQ2ko7g2dois2ODaHZhUVPVW+3xfcNE9j9LKzQe8MFewg
         Cn39Bxpw6901GWoKXIgXk6fu6DWcCSGcG3bDqyjncjeMOlxjM1Ia/0UXjqiK+m9bRb9M
         JWYVkkaNOo6a0QG9ed/BH6BC2Fc/Sxx9OYduy0Yklpdst+BKZcCEATIM1oiTQG//e/Mh
         dgsqr5UU4KSgbBB1W5LASFwNsYCSWJ521lIXTGOaAReJWuwzdQ9swHG7BmxIo/e0hQtk
         JAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl26WAhFvKinw968l5HLv8frZvsNesoGKkpU5Q2Q6gIDEdNPVPWyW/5Gm5ZQfFeD97oYdqkQaf@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSsW3c3iICNuPSGPrPOFxsiunSq+plI9wLvREMr66xCCe+61wQ
	8/598qQTY3U2Sm+vh3jbYtr6gr7HmgGVHkPcYCbBoVVZ169oEjCwOoHTbIVHdhL72t+Dz5ey37d
	BxYC3d6sqyustzt3l8SbsqRVTNHs=
X-Gm-Gg: ASbGncs7TNM66c1/gjP36/bUvrIHCi7waTbO2yxxXMOphyEFgzXAjnfAEWtZa8gUN02
	sssMq/o8mA2poYkkD0l2t5yj4+XNm7Ag1f3s=
X-Google-Smtp-Source: AGHT+IEl8ns+cPO0dh6oNxLl3Hy89Vyof1Yn6p4dY5lR+i3YkD30mfiis7m7alp59zPhWqLBAQWw4dOz/Y4XLwVMzMI=
X-Received: by 2002:a17:906:18aa:b0:aa6:8096:2043 with SMTP id
 a640c23a62f3a-aa6809621a9mr587539966b.8.1733808496899; Mon, 09 Dec 2024
 21:28:16 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
 <a4cd4d74-93bc-4c63-a9ee-aa25957b96d9@baylibre.com>
In-Reply-To: <a4cd4d74-93bc-4c63-a9ee-aa25957b96d9@baylibre.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Tue, 10 Dec 2024 13:27:40 +0800
Message-ID: <CA+4VgcKjK9N+Y=q5iAz2nJOtcyyuBdkSPvggSd+5KQ49F=+ttg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: David Lechner <dlechner@baylibre.com>
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, andriy.shevchenko@linux.intel.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear David Lechner,

David Lechner <dlechner@baylibre.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=883:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 12/5/24 12:22 PM, David Lechner wrote:
> > On 12/3/24 3:15 AM, Eason Yang wrote:
>
>
> >> +static int nct720x_read_raw(struct iio_dev *indio_dev,
> >> +                        struct iio_chan_spec const *chan,
> >> +                        int *val, int *val2, long mask)
> >> +{
> >> +    int index =3D nct720x_chan_to_index[chan->address];
> >> +    u16 volt;
> >> +    unsigned int value;
> >> +    int err;
> >> +    struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> >> +
> >> +    if (chan->type !=3D IIO_VOLTAGE)
> >> +            return -EOPNOTSUPP;
> >> +
> >> +    guard(mutex)(&chip->access_lock);
> >> +    switch (mask) {
> >> +    case IIO_CHAN_INFO_RAW:
> >> +            err =3D regmap_read(chip->regmap16, REG_VIN[index], &valu=
e);
> >> +            if (err < 0)
> >> +                    return err;
> >> +            volt =3D (u16)value;
> >> +            *val =3D volt >> 3;
> >
> > It seems strange that this is 13 bits when the chips are 8 and 12 bit.
> >
> >> +            return IIO_VAL_INT;
> >> +    case IIO_CHAN_INFO_SCALE:
> >> +            /* From the datasheet, we have to multiply by 0.0004995 *=
/
> >
> > The scale is the same for both 8 bit and 12 bit chips?
> >
> >> +            *val =3D 0;
> >> +            *val2 =3D 499500;
> >> +            return IIO_VAL_INT_PLUS_NANO;
> >> +    default:
> >> +            return -EINVAL;
> >> +    }
> >> +}
> >> +
>
> Sorry, I got confused. The difference between the two chips is the
> number of channels, not the number of bits. Please ignore these two
> comments.

Yes, The difference between nct7201 and nct7202 is the vin numbers.
And VOLTAGE SENSE DATA FORMAT is
Voltage(V) =3D13bitCountValue * 0.0004995
