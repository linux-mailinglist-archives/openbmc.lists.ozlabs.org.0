Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7699799D4
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 03:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SK20dG9z3cB1
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 11:40:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726450801;
	cv=none; b=Sg6JBEDivAgBQZxFf5LR51ZDZvPYVsv+pGh3/enNXNOIYz+Ei2cNX0bI6VicCWElh1LaHEyqaJmIevVg78U/NnFn24wTjGzu++sBCEio5f7uFZlky/SH4u4d9zpDHiqTQbY1djeVgP5v1vx4TFaMwm6uUbE+RA7sp86mJm82Uxloycg+cNjFtrf4gNUOhhUNNsOyuwCYFGwl8Or+sZUn/q2CDUlQl/rRzSKmeJSi/CSSiWBQNRuQuLvOiVoOX8v1qtYk83VkOzAXiT2iBoU5Ui4//2cIugdClOYm0xo6dvFw4O/wNur6i+RqojvOhtBRDbFuYzalihU/6OZBLvwCVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726450801; c=relaxed/relaxed;
	bh=zLNskjMwpu/ATcCtySS+dITa6mUnk8ZJT8hndfBc9/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APRcGIZ35uaU9lTf01TWX01ag/fdICrWSpEagLB2D6lgsIETU3JLJd/L3J5eGdCx0WrM5Hho4xNmuty7bNkKPMm/evd2gUzHRUUfp6zHdJuNXF+EndnJT6FUSbba+Fr9nKBz8cjN+OtuHrJFkzBivNkboijknFSTWnGUDdZ4ChV3cdoTjw1Rf8UhZDbNA9fZZEnwmaDz49P82KgJLZGeAI9CAQDT57uIClchLBsfVf3sSHUiXjzcuYqHgDVZ4/S/aCkxksG9OInQix/ZtvvM5QXVz7kYauEw9AfxYh0cd41tmGTU8F/w3nTl8VUFE/o/sQbrfFSKvYGS6cubiUdhqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HdJBq/Ak; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HdJBq/Ak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SJx3YnDz2xb9
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 11:40:01 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so521673566b.1
        for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2024 18:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726450797; x=1727055597; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLNskjMwpu/ATcCtySS+dITa6mUnk8ZJT8hndfBc9/A=;
        b=HdJBq/AkgJ1i0uAssjAB5uAbEdWbRMp+mcJQtKfBdN/zAAt92c/aSvi9qY8u67I7jh
         4/RxF9ycs6xXbVqqDS5bE0omLwPYQc7RqQwgNYTRyTGrKW1MEt9k+rf3bqnfAY49DgEG
         hHZbaYjH/v2CHN3tOl1d8vhHE4Mg1XyLF6BOONwxl0wS8ZaWTO3cZLybrSGKNoAonnWM
         N24BouP+Ld3QGK513UYupyLdtzeSJxBjUAFHpXXh9uGum5LnWi1rblO/eXe8p0HqcqGa
         WUDdMn8OGHJMjt6tZwSMpUeqrxW/yFC0b7U4cEYFiBW/htUQ7k+FBHKYoBy+Psq6kUt7
         X5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726450797; x=1727055597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLNskjMwpu/ATcCtySS+dITa6mUnk8ZJT8hndfBc9/A=;
        b=QZGdvHKgDLw177SwLag2hl4stfWygLyngBo9Y0eQWFFWbJBDjQVKgEiBgm+GJS7KdK
         2GQlPUT3lDVo8B/RnoSxKlNhxQZcTrDZOosw3B4KlgzG72+PPczxkhnw/Vg5zBl00Ybz
         U36v6RFZrKh4bXZmk7biJe/sIG9nkI4JzFHW30XWBm1B1rn2libuRMoGip4tLPTzqai4
         ms8JNrkltzFR/3ylcjO7D4sWT1ubYuXZ9kGxLqFy03fpK5nAKFbIdrWjniOcXuVBozeJ
         7Nyxtn4gDGlAvoHm0tpf8KuCBFmdUrXrDO+jnnhrdxTpNmNi/IphTY0OcfiIclCwTcU4
         zcug==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3FyYiQl/95JMcyolsK4o8cN6A22utEmBGoncF3ZnSTcGnDBAe2ouN4dhv1srpy8hExAFCstq@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYjuVwfIrrqBTdBEBg7BY6lgDpZ1j7jFezD07UpkqRAr8CzF0D
	XeoDS34+RhNu/MpRt1G+C2dOu6heNAUUh1dFPOX2ZBC9l/UXpmsHek6QmswPwQQKpDWK+HjuPoo
	acs8nMpoO7Ijw1WDX4D4ynCwtKxQtMio=
X-Google-Smtp-Source: AGHT+IGP396YoxKMeuFdHaGR6hHKLwvsNnGLHkZuU+t/t9No92oGlJWDOM3jIUM0utCqdVA7eHiM9iRsmvytrTQmVYE=
X-Received: by 2002:a17:907:c7c4:b0:a7a:adac:57d5 with SMTP id
 a640c23a62f3a-a9029476004mr1376694166b.18.1726450796510; Sun, 15 Sep 2024
 18:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240913101445.16513-1-kfting@nuvoton.com> <20240913101445.16513-6-kfting@nuvoton.com>
 <ZuQWYabomv_xyYyj@smile.fi.intel.com>
In-Reply-To: <ZuQWYabomv_xyYyj@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:39:45 +0800
Message-ID: <CACD3sJbzMGQYchr_cW+caMcLqsmTB19ya3E_Wf=s2D6Y8QRqGg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] i2c: npcm: use i2c frequency table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Your comments will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:39=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:14:45PM +0800, warp5tw@gmail.com wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
> >
> > The original equations were tested on a variety of chips and base clock=
s.
> > Since we added devices that use higher frequencies of the module we
> > saw that there is a mismatch between the equation and the actual
> > results on the bus itself, measured on scope.
> >
> > Meanwhile, the equations were not accurate to begin with.
> > They are an approximation of the ideal value. The ideal value is
> > calculated per frequency of the core module.
> >
> > So instead of using the equations we did an optimization per module
> > frequency, verified on a device.
> >
> > Most of the work was focused on the rise time of the SCL and SDA,
> > which depends on external load of the bus and PU.
> >
> > Different PCB designs, or specifically to this case: the number
> > and type of targets on the bus, impact the required values for
> > the timing registers.
> >
> > Users can recalculate the numbers for each bus and get an even better
> > optimization, but our users chose not to.
> >
> > We manually picked values per frequency that match the entire valid
> > range of targets (from 1 to max number). Then we check against the
> > AMR described in SMB spec and make sure that none of the values
> > is exceeding.
> >
> > This process was led by the chip architect and included a lot of testin=
g.
>
> ...
>
> > +     {.core_clk =3D 100000000, .hldt =3D 0x2A, .dbcnt =3D 0x4, .sclfrq=
 =3D 0xFB, .scllt =3D 0x0,
> > +     .sclht  =3D 0x0, .fast_mode =3D false },
>
> It seems you have no leading space, while having trailing one. Also the s=
plit
> seems a bit illogical to me, I would rather do like
>
>         {
>                 .core_clk =3D 100000000, .hldt =3D 0x2A, .dbcnt =3D 0x4,
>                 .sclfrq =3D 0xFB, .scllt =3D 0x0, .sclht  =3D 0x0,
>                 .fast_mode =3D false,
>         },
>
> Yes, this takes more lines, but also more flexible to the updates in the
> future. Also mind the trailing comma at the last member assignment.
>
> ...
>
> > +     for (scl_table_cnt =3D 0 ; scl_table_cnt < table_size ; scl_table=
_cnt++)
>
> Extra spaces...
>
> > +             if (bus->apb_clk >=3D smb_timing[scl_table_cnt].core_clk)
> > +                     break;
>
> ...
>
> >       /* bits [8:7] are in I2CCTL3 reg */
> > -     iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) =
& 0x3),
> > +     iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[sc=
l_table_cnt].sclfrq >> 7)
> > +              & 0x3),
> >                bus->reg + NPCM_I2CCTL3);
>
> This has broken (illogical) indentation. Consider
>
>         iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt]=
.sclfrq >> 7) & 0x3) |
>                  fast_mode,
>                  bus->reg + NPCM_I2CCTL3);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
