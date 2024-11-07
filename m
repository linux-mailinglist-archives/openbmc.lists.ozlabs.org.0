Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D69C11FF
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:51:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky3Z1Rgbz3dBm
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730940133;
	cv=none; b=BJIXkxk9fkcr0A7U8jrcV1Y8Mjst1Hsnv19Ql+h2jvCVD+7R6kvBLAz8NIqpN/bSuit+MYGv1CCs+9hSqALdCgBwSNun4PyG0gQ04ETE2hG5zSSBcLgyvS3/jK4d98mDM4cTzrepEH8k88HEbRDezZtuyVGbrBLKcsC/uege53CsvzNZ3b5qTMY+oatrLEk624B+YmfbmY84mYst2l31SybE0ykU0PCNI8BgY4Pe3vbrOY+Z4hyMYRTm7/URjPn5Y/WLc4dmi3CYNQzdNx8sBhWTszBFkuL2a9pYZWpSm+SJBlIIwqmwdCO3/NvM/322i9Wn1FUg+zmGmfx6mWNKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730940133; c=relaxed/relaxed;
	bh=66oG7Evm9+fKx2Sv7uu5FGZ2ExWy4GsOBS3MW/kR5U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2k1AjJRQS/FpRiytwCM61M/q2ukMhXdiful8bCtrNcoH29yN198f2YQae/suJp7ahBw9SBG260wcnOLoZUNL7CCQXIpm97aFrR4XMjy1XaNxlt1IVJ5r4yzFhonvSExI5XPs+yQdh0Jb8e1ohYjAqh9/4z05aUhxPT4w3Svjq3MoqA01nAFea0BSK8wNCijPB9z4jjw9dgrQtbTHJMChQdOOCiDb9VtRM/V16z60WsL/Kx0hzaOGm9+h+/n8kvwwgIjuPRDn7gwk96fPSVDis879xws2RGZsUqhPW/Cupp5muPsILIaTEczv1cjygYgA4reiDa678WJFcSbLLeMYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kUrzktuB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kUrzktuB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkNZC6qblz3bbn
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 11:42:10 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a850270e2so59888266b.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 16:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730940118; x=1731544918; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66oG7Evm9+fKx2Sv7uu5FGZ2ExWy4GsOBS3MW/kR5U0=;
        b=kUrzktuBDwu3km3Xlk50FkeRshJfyDqE5vG2JDSk4TQcSZ7FbQ180ge6T04CXKHSYK
         dfJXPURS1vYMVdZkeuCoDidtd4KtfSbR/0ui4gLItjCofSQGTCj1y6rbtLdW+UX0dBOc
         flsNZGvxiFh0LmSJsj01ehU+FGR+BJ/gh8mCoMpMcgRlqvFADg7Hq+skA/A1LpGyCd5H
         p4HRs18j/A3Svn6AHgqnydlGjnfEG4KdHJUtTB/NMA6flwntiSxFbYyae5598oYgF2Zu
         0wCopEcL7EYDHgAAS5WYZfaturwImACPqKOcQ9F3IhbmHAGnaJhvEIMOgNb/0t9Jb6eP
         yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730940118; x=1731544918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66oG7Evm9+fKx2Sv7uu5FGZ2ExWy4GsOBS3MW/kR5U0=;
        b=oGKXNjVfacqOjbm1jcN4a86YqFgS3gpOahj4FynhZg00+f7p+zfETe8iX0dBHQbfgO
         vGUomDC0vEnA7kZLae5X9BsMllCmvBmY9quJfdvzNPgnnTKjHpGOEhQT76Sbzao/PmFJ
         9sKtF9PIPGiw/Yv+V18dY7Q/tKBYwW2YdP7XcD4kIRTl0V3fJH1BzXXzkvCxKF1F/Rrl
         OOKOtO3vlQf1guvUu1oE63X3aUkIL8f5NNuC8Wn9Cjy+0VWsOkM5YscSy7Ck02mEC7CW
         vaCKTxgM8mkhIxV650rukzewLTVG9v9gCoC4rxVTGyqlweu+a4l1z8miZIOV6PTVmPvU
         Dhog==
X-Forwarded-Encrypted: i=1; AJvYcCUdUNluFj1wo4dOLJ/LiTbS0hD/LGyQIaKPCy2EGElQfUiJR4eaRGcecHpc51abgBswOqCClOfZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxyTFfXfzx7s5NSivXPPUxaIOf8615mkT5cFk44PrF/3WOYr4Wz
	Jxp9MN/snCdC8P+c/Ozc1jzLsNFi+q+w65DiQ68k0RL4D1fLGExN+in+yKhDBmCXdfl0SmcdB8m
	77sw1yTtLkmB6YD7mPG6wCui4fHAsVx2y8Oc=
X-Google-Smtp-Source: AGHT+IFcrzeVPHrPu3r5o/8SX2WmAgtljAMZ1fBMXVtmRh7kPMQ7Eay15HFqYWHFnPv0n8wziB8+N0K2wbH0aWKy27s=
X-Received: by 2002:a17:907:7ea9:b0:a9e:1fa0:d2f0 with SMTP id
 a640c23a62f3a-a9e6556fe06mr2153334266b.19.1730940118106; Wed, 06 Nov 2024
 16:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-3-j2anfernee@gmail.com>
 <fd4db31d-4e55-4f0e-a96d-d193c28fd784@kernel.org>
In-Reply-To: <fd4db31d-4e55-4f0e-a96d-d193c28fd784@kernel.org>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Thu, 7 Nov 2024 08:41:21 +0800
Message-ID: <CA+4VgcJSt-LUNtH6TMpk7om+PbO1aQvmt1WHi-cYMxa8p+Um5A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Krzysztof Kozlowski,

Thank you for your response.

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 06/11/2024 03:39, Eason Yang wrote:
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
>
> ...
>
> > +
> > +static int nct720x_probe(struct i2c_client *client)
> > +{
> > +     const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
> > +     struct nct720x_chip_info *chip;
> > +     struct iio_dev *indio_dev;
> > +     int ret;
> > +     u32 tmp;
> > +
> > +     indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*chip));
> > +     if (!indio_dev)
> > +             return -ENOMEM;
> > +     chip =3D iio_priv(indio_dev);
> > +
> > +     if (client->dev.of_node)
> > +             chip->type =3D (enum nct720x_chips)device_get_match_data(=
&client->dev);
> > +     else
> > +             chip->type =3D i2c_match_id(nct720x_id, client)->driver_d=
ata;
>
> I believe there is a I2C wrapper for above.
>

Got it.

> > +
> > +     chip->vin_max =3D (chip->type =3D=3D nct7201) ? NCT7201_VIN_MAX :=
 NCT7202_VIN_MAX;
> > +
> > +     ret =3D of_property_read_u32(client->dev.of_node, "read-vin-data-=
size", &tmp);
> > +     if (ret < 0) {
> > +             pr_err("read-vin-data-size property not found\n");
>
> Please use dev_xxx in your driver code.

Got it.

>
>
> Best regards,
> Krzysztof
>
