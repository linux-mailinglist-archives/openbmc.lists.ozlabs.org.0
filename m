Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A419E476E
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:07:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3WpJ2jKJz3cC5
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733277040;
	cv=none; b=LoD4aljb9vFQ3KjPkMHeZHQBD6jbAmck0sOMR3XTYT+Nmz90EMocaCXdfqan1y4wpDy7uVguEluyGKCMEdwZfdJCwOSrbAcza91/pWQ127JHnw+AAW4apIgnet2XDM/pZ29RpDEubYVJ9On1dWa35Hw3ee/A57XBFD7hWA3hl0IQG5HJCTILa2xXLKg/J2GSXq+u/AFysVMb94PHF5xpTwu8NblEAp9izsQO1S2SP9+iwH1Tj2GmsqYsLMrCTRgNodSzvePctlRNojZ72kl9uk6tfDbluSjOwZ7TMv0Zh5arFmGuptf2amHg5FLHD4Dy/BLiGQSy1evrooR3+O/C+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733277040; c=relaxed/relaxed;
	bh=lN201ByzpfUAhxwhR4UdOa7zJC44kIZT0kSYye3sxJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jao0FGw2oIWcbRga89crGMw30vHLVxMZkC1PcPJlrfU1sqYX064cS2x/97HEoLJxJ0S4KnkqZDI8Cp4B+fwWUkSLQ5Km/acwLO2I+OIhyC66C3Urvqng5QHel1YAEe2ysdla3Azfs1HNBem5kVJXYEqWih2aW8s/ony/jb3H7BM9p6dEUnIl3/QbU971rme+VyOPm3dDQ90FjDjFwU5LLE46skJjfzvUCikA4Nrzz58D/H0IYQvr/U93eI5EeCsqvmZUxX3JGe4mwKmXeAdVBf0dhkl7lyJgFLRTGwVyNw1c7TRbgZGs/2cg/Lc+soHHAf16X2U5LgRTj/VvCU1GBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RvuPaKYE; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RvuPaKYE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y30pj5VWHz2xdg
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 12:50:36 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4349cc45219so56061505e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 17:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733277030; x=1733881830; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lN201ByzpfUAhxwhR4UdOa7zJC44kIZT0kSYye3sxJk=;
        b=RvuPaKYEgRjYsrq0MS1ULMAH1koBxV34750WxKuDTNklJj8wZis1MgkGjomQ0tEkbP
         +ZdHTAEcSY4GH4qS29s2yk0C3k5aq88xa76YtLSDUYQGAPIh028UOWADkLrQdBMjdsAm
         B6efVXp3Tg9B/DnRuQL92onYaF4feDqkxBcZKCMLQWFYzvpYVgshqGFGLarDH7zmN1QS
         i/wsCO2bxq+xZuPXjPfKJYZThBQ6/Ot4bS0t0CVT3qptsd46pFwUiayknWKbaPX8/zxi
         mApU69V69GYcc03IENOtjwuRjvD8KESTNRFj2yyt8xwtzsLdS6jF+s5ao66XG+i+aIxT
         IqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733277030; x=1733881830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lN201ByzpfUAhxwhR4UdOa7zJC44kIZT0kSYye3sxJk=;
        b=VTpWkd/weiPKV9EIhmDUknUXyeN3TmOUBXFpD73+DZuQCoKK50A6DJSfQiTYKWtBbQ
         bPx9U6eHD5iJTkfRF8ZOXhjk78JtSddvBBhiwQt03OMDgcvKts1BAtX5I2pHSpvU3YKJ
         FMa4+dY8ExmJVpFUToQ3znpsYBPAfSpDvFs804K84n0nKA1CzNRs4u7Edeiu9nM4AHdO
         leIZUuFiHHuEyV//bGu0cNk70glIZkAHpmzGcT5t7n6shS/2IpEtWxaGQ35jti2c7bj4
         o2yVzMkcBxRhnj0QEgLkMkq1vRcwJp5GpWmxDZsv+igAWGrm510IIhToXtOb8mejFeCp
         JJlA==
X-Forwarded-Encrypted: i=1; AJvYcCWkIQvStLiGe8wn+/GIm3jP3IBA6wsuBcLZ2K0iguYKj5/DP4ZRNiAKIYA5Xa6JrtVSzFhyLl4+@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzIzDbnCe/8470dhQFypVNzgX5iyLPdg6X5Dakvv7bBSfRjW6zd
	rbtLSkzFYncuBWgpDiX1l4ByoHH01oI/Z1Ed8habFWIbSAvrvxIL7NxLyrAkrkeDR+dXpSALxkO
	GwQ+pOLDFYn7ckDXCLAJXRuYPRY0=
X-Gm-Gg: ASbGncslo2vVwjoxQl6YTeGIlPAiikDEXH2UzWXhHyKLycKM7L0Ewu09RG+W0XZm5kn
	gWsRqaJCq42DkGVqpxZnQEGTraESr3sk=
X-Google-Smtp-Source: AGHT+IHt9Rwm6Nd4suIuWugkJHbvZnTpYJfiKM9I4W2YblEGY0ueUGw7HgR+ojWzcmeKMRQIpKOnzXiSEBUQLBxHqpA=
X-Received: by 2002:a5d:64e4:0:b0:385:f47b:1508 with SMTP id
 ffacd0b85a97d-385fd3f35efmr4593054f8f.35.1733277030274; Tue, 03 Dec 2024
 17:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-3-j2anfernee@gmail.com>
 <fd4db31d-4e55-4f0e-a96d-d193c28fd784@kernel.org> <CA+4VgcJSt-LUNtH6TMpk7om+PbO1aQvmt1WHi-cYMxa8p+Um5A@mail.gmail.com>
 <20241109134538.6f09971d@jic23-huawei>
In-Reply-To: <20241109134538.6f09971d@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 4 Dec 2024 09:49:53 +0800
Message-ID: <CA+4VgcKaL+B1yDG+X7HLGam5T5njgccp9ebCnQJwiv3V5w07ow@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 05 Dec 2024 09:07:01 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thank you for your comment.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=889:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 7 Nov 2024 08:41:21 +0800
> Yu-Hsian Yang <j2anfernee@gmail.com> wrote:
>
> > Dear Krzysztof Kozlowski,
> >
> > Thank you for your response.
> >
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=
=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > >
> > > On 06/11/2024 03:39, Eason Yang wrote:
> > > > Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC drive=
r
> > > >
> > > > NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and=
 up to
> > > > 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pin=
s for
> > > > independent alarm signals, and the all threshold values could be se=
t for
> > > > system protection without any timing delay. It also supports reset =
input
> > > > RSTIN# to recover system from a fault condition.
> > > >
> > > > Currently, only single-edge mode conversion and threshold events su=
pport.
> > > >
> > > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > >
> > > ...
> > >
> > > > +
> > > > +static int nct720x_probe(struct i2c_client *client)
> > > > +{
> > > > +     const struct i2c_device_id *id =3D i2c_client_get_device_id(c=
lient);
> > > > +     struct nct720x_chip_info *chip;
> > > > +     struct iio_dev *indio_dev;
> > > > +     int ret;
> > > > +     u32 tmp;
> > > > +
> > > > +     indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*chi=
p));
> > > > +     if (!indio_dev)
> > > > +             return -ENOMEM;
> > > > +     chip =3D iio_priv(indio_dev);
> > > > +
> > > > +     if (client->dev.of_node)
> > > > +             chip->type =3D (enum nct720x_chips)device_get_match_d=
ata(&client->dev);
> > > > +     else
> > > > +             chip->type =3D i2c_match_id(nct720x_id, client)->driv=
er_data;
> > >
> > > I believe there is a I2C wrapper for above.
> > >
> >
> > Got it.
>
> Don't pass an enum value as data.  Pass a pointer to a structure that des=
cribes the particular
> variant.  The 0 value which tends to end up in enums is an error for devi=
ce_get_match_data.
>

I would pass a pointer to the data structure not id to describe the
particular variant.
I would rewrite the code as below,

static const struct nct720x_adc_model_data nct7201_model_data =3D {
.model_name =3D "nct7201",
.channels =3D nct7201_channels,
.num_channels =3D ARRAY_SIZE(nct7201_channels),
.vin_max =3D 8,
};

static const struct nct720x_adc_model_data nct7202_model_data =3D {
.model_name =3D "nct7202",
.channels =3D nct7202_channels,
.num_channels =3D ARRAY_SIZE(nct7202_channels),
.vin_max =3D 12,
};

static const struct i2c_device_id nct720x_id[] =3D {
{ "nct7201", (kernel_ulong_t)&nct7201_model_data },
{ "nct7202", (kernel_ulong_t)&nct7202_model_data },
{ }
};
MODULE_DEVICE_TABLE(i2c, nct720x_id);

static const struct of_device_id nct720x_of_match[] =3D {
{
.compatible =3D "nuvoton,nct7201",
.data =3D &nct7201_model_data,
},
{
.compatible =3D "nuvoton,nct7202",
.data =3D &nct7202_model_data,
},
{ }
};
MODULE_DEVICE_TABLE(of, nct720x_of_match);

> >
> > > > +
> > > > +     chip->vin_max =3D (chip->type =3D=3D nct7201) ? NCT7201_VIN_M=
AX : NCT7202_VIN_MAX;
> > > > +
> > > > +     ret =3D of_property_read_u32(client->dev.of_node, "read-vin-d=
ata-size", &tmp);
> > > > +     if (ret < 0) {
> > > > +             pr_err("read-vin-data-size property not found\n");
> > >
> > > Please use dev_xxx in your driver code.
> >
> > Got it.
> >
> > >
> > >
> > > Best regards,
> > > Krzysztof
> > >
>
