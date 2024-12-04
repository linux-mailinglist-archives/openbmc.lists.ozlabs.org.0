Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC49E4776
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:07:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3WpX02yrz3ft4
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733282463;
	cv=none; b=LeJpRdiVEIhqzbKdWRE0lJpQ6Ihqmt7Dn6waFuUBoHOocwHGgncAAM6d+h+Q9r9XZqLCvQ8dH3c8aaQ8FxkI/Qcj8OEJUJGdWTXMT7EMjfyrBRXqBfP26QOjIUMxwYfLJa4NCdVUOjw1rokxpo1Xtny674kEipo0PAQojFjQnfVGIT+f1ySu4aceCQUpnfOjzRTj2vP09EsMAZnr9ZAIiD3awaUII+AsT7K5C0yHCt5Ryef1YWFjIOKvxMMDt3xZXOL95gmVBRq7z+QYkxG4zca1BJppSTe5EtkhIsmaeeqPc+4oscync9WQF+R8eoIt3qepUsv5U+OXSuXpL3IW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733282463; c=relaxed/relaxed;
	bh=y04cA3TO1YirE/koG9dsISeizBY/CnfgH65djkwX2Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xkj2wKgCbBvO/DXTjbnF9dpNKBONk58TiGGCWc5hJtUenUGeY73S5qsVs6+W8N1gBGbAqUnDvZlN/+LeiENRBn4cvbr2lNQ1IeE7LEk6x1qwll5NCBWbPoe02MWP33D1aqblA/W2W9NoNYh7oYMgWdqTwhDDi/HqKkbsk/i/+4O/WCxDrqng2WXOpowOz1HsKhnyWMskHFFdxs0egGGXlpX80Cod5q517PZHmuV+J7R3WGFetU5mWD8oZGQ8OmD7Dh+rs9D6yThBcpfPhcbIpK9PjtRpM1kCg24K15+hSsm+FN4bOTaF4e1/wJ/cTgxZsldtIsAT1qv4f01g5hrNMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvxIACtf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvxIACtf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y32q20VQpz30QJ
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 14:21:00 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9ec267b879so1038482466b.2
        for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2024 19:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733282457; x=1733887257; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y04cA3TO1YirE/koG9dsISeizBY/CnfgH65djkwX2Bk=;
        b=WvxIACtfzz3fFbP8keTmmn3CT1zaIbDmhOX9YH5fC+AP3LSMLJWr6LLgJ7sRlJHSoV
         iJrGgygP2BzeQkGcItFmGBce6XOl11CYCRy+mBR5ZTVSNmuwntz/LinbirPQYpa4zJad
         mdPLv6vIpOp6IX82gTg0ebdyypaRCaLcA5Tu7n9Yiw/2BBAPaSdFZ6wf9Qogjtr+LXsx
         acAu82XsIzNGFH30Wj37Y2D5NJihotq2jWmr09l1obGBPr4mze8zEGNzMnWT7v/TodUa
         Cs3qJ0mkW4AKzWJMBael/APjnZ31eCNozQdqbUdg+MeYoarekMyGZWspoNymjfGDHq00
         qJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282457; x=1733887257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y04cA3TO1YirE/koG9dsISeizBY/CnfgH65djkwX2Bk=;
        b=h48uzs4cgLNYx/Q4a1OZn7H04zOi0ebn891UBxseSxn98rnhZpxxlx4s+yuEW/IZhJ
         7qBLuqd3nwZUUGTnsD1gBEz7k9c5zyiccMnWN6UybzZcLFR1H1QeLHHycFGn3zu4v6jg
         PLUdEG2CDgw+sj3VJ7HU469tsm3RXfHnRhX3OrcdoC1bt77oopOzp96q79MAT9m0iOFj
         TYXWwG5dPhVLwsU95T5/qfFseLfgYUfRujSO5qNqldFRsFnX0ZBLymomFfzSIyYPbntY
         yLZg2VFq2HFha5MzO0g1daFryZeKOWmOgWFVnTtHUIvW4JjUkE82yjcrax1sdmPPEhPQ
         oYXw==
X-Forwarded-Encrypted: i=1; AJvYcCWehiYJcerEgyQ/tQgUgr87YmqyRWLTe3Q/FmEL35HHKJylQTkOVw/Zb0C6RwjLtsNBrxjyRNtR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLZzC+z+QB45rFZzW6IOjcpEAocivwkJNYjBAz2Eu/+808HIHc
	836wt3FmvTy6p9IyhStUdiDglOXHxVe/NrJ8W8WAh4747CpTaoVM+hrR7VUwxvd83cnKo/SN3lD
	Il0X+nyDgQgIFHliiQaYgvmShVb4=
X-Gm-Gg: ASbGncv0FMMhnThR618I7uP3+ZLz/Qi9LeW0PCVdmwALuwonOeg1E8ChdH0RdgpEROC
	JD2ppwcEYwxj1L78W4KaT2npB9ivhFrw=
X-Google-Smtp-Source: AGHT+IGwe/oix06krX2fuoZe1ERy+q9naY8xqOUcm7s53LomcongR2PQFcGeSdVl85Uok60HVU/VrIr7KREYgLQOuhE=
X-Received: by 2002:a17:906:32ce:b0:aa5:1d68:1ec8 with SMTP id
 a640c23a62f3a-aa5f7cce55cmr446672366b.7.1733282457090; Tue, 03 Dec 2024
 19:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <Z08MkR40fjfW3MXZ@smile.fi.intel.com>
In-Reply-To: <Z08MkR40fjfW3MXZ@smile.fi.intel.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 4 Dec 2024 11:20:20 +0800
Message-ID: <CA+4VgcJW=9rtuqr3VZbfA8QxgYAR+KvfAHdf_0xv4XLQtVVQJw@mail.gmail.com>
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

Thank you for your comment.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
12=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:50=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Dec 03, 2024 at 05:15:40PM +0800, Eason Yang wrote:
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
> Please, get rid of explicit castings where the are not needed or implied,=
 like
>
>         u16 foo;
>         ...
>         foo =3D (u16)bar;
>
> you have a lot of this in the code.
>

We would  get rid of explicit castings in all codes.

> Second, why do you need two regmaps? How debugfs is supposed to work on t=
he
> registers that are 16-bit if you access them via 8-bit regmap and vice ve=
rsa?
>
> Can't you simply use bulk reads/writes when it makes sense and drop 16-bi=
t
> regmap completely?
>
>

Read VIN info can use word read or byte read, and other registers
should use byte read.

For a reviewer's comment,
If the i2c controller allows word read
then the right thing is to always use it.


> --
> With Best Regards,
> Andy Shevchenko
>
>
