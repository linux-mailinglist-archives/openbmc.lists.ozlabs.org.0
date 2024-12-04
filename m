Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D609E477E
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:08:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Wpq5w8cz3cmK
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733303166;
	cv=none; b=e+KLT/BArRoWpnMWY3WilblWbmsFQe9DOSsFjjBpMjKH9jK/4WmMQ5jWRXOGmqwdtvWYzwlkusf8ZlnomdcCEdKZCDXrEkdiCIqOOyBVR7d4ZM0IdwYsY5N8eGYmNnsIQ7GpKZk5EQs5pVEprOZoHGau5YbOoswvSPOXPxOCCKlIQesegB4n+ZG1xMld/lcqpbULRVtQl474uG5b6H8aQ5uUcctod3Rk0k3fzn/XYM0Fuz5p8U813HJ879Z0TbiG1r2P+QaEH1rch9RIKrL8fp31Bxv17QFs2BdK+eKkYgf5W9F/iFzs7V3ahPJKG5sS5CUSj0BvvV/cyui3KPeKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733303166; c=relaxed/relaxed;
	bh=vKIZAwdN5uQfrZX7GrkPjbxXNa5LNSs5e9h8CEtHsXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W60+M742vt9nd4dGcbIB8tDzOZ2eaVqpM8+G9+4o0kqc4ycHAQM5xfBXtpKPvOlFaz10Q9pbt57uwaRUN8HY+UGvsFWnypKbi9HuO2A1DL+o4H4vQezMmWGWV2MtECXx2VjKpOmhgxd5eBJlSvBGyce1ZtJPLVN1YdNemyQ7uZrzMmSXMwXJDksnDV6Y2kKKS6GO2wGfvb3ETnhdTnq+4JETRsW6QFqVZfmTAqaczgm6VG+4fQ4fJRYRQo3IXfLzKVW1uzAyAUzlwZk6FEDknab0CnQqUpx3DMYyRGvXRocILkeaZxdjHFdSROhTpbzVQ/36duaeZ3rKXRnxGtYlAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bn/kYxSF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bn/kYxSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3BT50jMVz30Vv
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 20:06:00 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa530a94c0eso1037286666b.2
        for <openbmc@lists.ozlabs.org>; Wed, 04 Dec 2024 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733303156; x=1733907956; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKIZAwdN5uQfrZX7GrkPjbxXNa5LNSs5e9h8CEtHsXU=;
        b=Bn/kYxSFe6psWmqldZNfBtooaA3FTMF3q01uIe6VWowbtpSivnUFnnAN3f1OHZIorm
         UH5HvIX3RsG3CHRhwunizBwEJdNQlgjFVXovj1iHI/lzy5+gGtkk/ZxDCcPsaIBacWBa
         BNsPcTFJgJ0DFwOuXTr+c+YRajPJ7eqQ6QS8HF7iu1eyjJMOqDn0GskJVpiUorcKmTIE
         fwHp2N4xu019orbjPl2/vyzu2a5FtXRI3UULmwhmhAWQLaqRgfQpHtPKDVOs6PufDPro
         UNRLyTMP0F3M2hIjax3ga+5vHwZiyw9LUPuk7bdPv/poBfASNOWSGDoank3xr8gYM25J
         2NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733303156; x=1733907956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKIZAwdN5uQfrZX7GrkPjbxXNa5LNSs5e9h8CEtHsXU=;
        b=nRFctU062Vlv1jYKZZcvXgPOK8vQmwQbSFDh+YziR+3WSR/xqIoneSnY8c+0U0fgvE
         OxWRB/49g8aDlaTLyLuB1MiqycjCv2JMtjUO/EOM6md6MlTj4t6dridcJG2+xCZ7hLYj
         2V5+B0BOVb4Ly1xBo4Ne2pqe4ygQcyJsL8ee4BVqeUH8rh4ZiV7yMibFyMIjQLdMSad/
         /ZAkrd6szdHRsGkRChUEcaAfcvI5UhDt4o7qFsNxANtNL2H27E2GDMfV+xwY75KOK9Ix
         B5faW5BShsDtjgJpBCykWFk1lGX8ako+K1mAU8wXxam37EGhlOhgdwp0K8sS5eT/iWR5
         Vb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXgvii5XMr99dwWddXzKpS6AQV+iSSneWHCOHuWS7314ZfnSormskx1u5Q3M3FYYxMkNetT7hhb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWO13tbwUNs7WyNhM44IO1s/JDNDesNRx4sM4CO3BSFtOt1clh
	ZHtovrlUBdHkEcUvowhvBdxw5igjXh4izcfc0QPBnksEtmw9wH1UkmZWd6dRikSa0dPxJMd/1f7
	UQQ9awuv5F9a1Vsl1E1RKFSA19YU=
X-Gm-Gg: ASbGnct+N/NXHUlR6qnQQ8ekCY341gnuzXaGP1nk+6NekIN1bvmwGZs7LI6gdMoLYX9
	mV7amBRs/Nrrep3WWnF+2p9rdpkmGXqc=
X-Google-Smtp-Source: AGHT+IG92f6axlzlrszI/yRsXKJ4lU2dyIgsaTErHrtiOWk15Vs+xYPsOPL+ONRvJUq/p+b46vmXcpUdxRklN1c9fPI=
X-Received: by 2002:a17:906:3183:b0:aa5:9303:1b96 with SMTP id
 a640c23a62f3a-aa5f7f11565mr419433766b.50.1733303156206; Wed, 04 Dec 2024
 01:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <Z08MkR40fjfW3MXZ@smile.fi.intel.com>
 <CA+4VgcJW=9rtuqr3VZbfA8QxgYAR+KvfAHdf_0xv4XLQtVVQJw@mail.gmail.com> <Z0_aNIrNvLxqcRHv@smile.fi.intel.com>
In-Reply-To: <Z0_aNIrNvLxqcRHv@smile.fi.intel.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 4 Dec 2024 17:05:19 +0800
Message-ID: <CA+4Vgc+HUwbHUWHdCoLVgm7aSMdqOGQZZawU8L8z7hMFop_VxQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Andy Shevchenko,

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
12=E6=9C=884=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:27=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Wed, Dec 04, 2024 at 11:20:20AM +0800, Yu-Hsian Yang wrote:
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B412=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:50=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > On Tue, Dec 03, 2024 at 05:15:40PM +0800, Eason Yang wrote:
>
> ...
>
> > > Second, why do you need two regmaps? How debugfs is supposed to work =
on the
> > > registers that are 16-bit if you access them via 8-bit regmap and vic=
e versa?
> > >
> > > Can't you simply use bulk reads/writes when it makes sense and drop 1=
6-bit
> > > regmap completely?
> >
> > Read VIN info can use word read or byte read, and other registers
> > should use byte read.
> >
> > For a reviewer's comment, If the i2c controller allows word read then t=
he
> > right thing is to always use it.
>
> But how does this differ to bulk read of two sequential 8-bit offsets?
> And if there is a difference, shouldn't this be addressed on regmap level=
 for
> all? Like testing for the supported flags and access registers based on t=
he
> controller capability and user request.
>

We would explain why we use two regmaps.
In the beginning, we declare a property read-vin-data-size for user to
select byte read or word read.
After discuss with reviewers, we don't need this property.
So I get rid of this property and take word read vin data first.
We can't use regmap_bulk_read since the vin data is not sequential.

For Nuvoton NCT7201/NCT7202 chip,
Take an example as to Vin1:
The VIN reading supports Byte read (One Byte) and Word read (Two Byte)

For Byte read:
First read Index 00h to get VIN1 MSB, then read Index 0Fh Bit 3~7 to
get VIN1 LSB.
Index 0Fh is a shared LSB for all VINs.

For Word read:
Read Index 00h and get 2 Byte (VIN1 MSB and VIN1 LSB).

> --
> With Best Regards,
> Andy Shevchenko
>
>
