Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 062E59EBF49
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 00:32:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7FPc62Prz3c9q
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2024 10:32:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733808090;
	cv=none; b=NmFcjY8tyiYnX8TZThh/HKlaWcDJGSkCSceOtLG8HeJeJCttD3CT5P4+wOIGkprXjkdG7PP6BL1YawUBJv9deO50TkAwhn77ZA4DWZgDuRuMu25Trq1wVcrze6gj8BlA/af6HyNHRfJHpDkfMdXp6ItZnwu8pp7V/HJGUDcFqDihwRAUOX3JRx7zZmxCvHXkOIgTCg1kvJtvxOJMldprcdkz36S0toCudgvaWJrKGXF/omSgEASIoF/xGeW45xlHpW0Ah1FrFjoAEaRFVuBXrbd1nyvFhRmlhrc1U69W4mKjgA1niIi9DHyV/ggSPKjfy9Td4+PrSYXz/rYLJt15Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733808090; c=relaxed/relaxed;
	bh=26AjCyBijtYGL+rgXWvm4txqEMbI2th+f36+A8OD2Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e/Tk8tbSVdOQMvUwXGzlKpf8Wok0muotJ6W8awqfciKwe5IToARsqjLZ003cIJdZh7IE8/ItU5JUb/u1p+i706vnFz1sSl5ZkO1s72l4Bg0DObie4BtzH6Dq15mscFX0xTGuCBYkAgwZZ1foSFbX9Vhcp95r2EPmyTtb9BSRRjW+e5om/gxYLn9KPTjK//caCvUQgv+IujpOwpqKJfYXN952JxbBAyt0+i5mQmTbUIOAQ/Ioc5KYZ4Yxei/D9zpK7ZH6oraNNJEhltJvUfK3ybP9lhyWnN7IaKJBBQ28YlOP1A9ZtIvmkINeDJUcSMcNxslgxpp+hJfVDydrcSW5tQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HPXJlWd9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HPXJlWd9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6nCC4ppMz2yjV
	for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2024 16:21:27 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so5523585a12.0
        for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2024 21:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733808082; x=1734412882; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26AjCyBijtYGL+rgXWvm4txqEMbI2th+f36+A8OD2Y0=;
        b=HPXJlWd9RIDgqci1g2m10W3dGafAe710skRofeao8tJ+C2/CN7rtMw8n1FHntU67B2
         SL7B54XpUPSlYUXpbvj/UG/HPKhmN8mCAvo/69M3CSIuABq2UUkLzYt6MM/JGwQxuCY8
         GTscWTYvFp8fAJoQbBRXKoPTOAmgm8ih08R8JmkAPHk5o/MvdWdg0m2cFWmd8dsIBnMG
         tVS+r7lSmyZPlzcXLlazvbKN+46aETh5fYkagWQ/kj0Wq8XD/o4rZEzz5kogbRuHenu0
         nSuvje9TOzy5sOVAn34wDBAB9qA8+/jlvzKrBToQ1U8GQ7IpnGohaq/Yc7f0TvQ2tV6W
         9A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733808082; x=1734412882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26AjCyBijtYGL+rgXWvm4txqEMbI2th+f36+A8OD2Y0=;
        b=GbMXrnH9IjdlMi9qPWBTomrPilWUx4a9AhfKXo8QTEWR3Pwdh0ZnnJMY/OPwxQcf0b
         I2CWmSYZrJhRGy23Ypc04wGzH//GXenP0+95y9HoexxVqEI5kUy6qY8jy6My1j3rTZgi
         2qzYw/h5eKEPNUBgSMHtjqUI8Vvgvq3CUwstspaeM4/g92TNn1lcnvwjwXQqEGZshzPO
         qQQ6IKT/JJKW9Cn2zrwWiMal4RgfzDKgVnpL5qmyu82EZPaXBpywXeNIIkv0Ks7uK9IO
         Yj6T4CH/C1QRS9TSMQHWjB4RdoZxfrJ+3aKgcSvmDxbIb6IyzAeBw5u4RO+cgV/uDlGh
         JWLw==
X-Forwarded-Encrypted: i=1; AJvYcCWVfd27KT7rxqjEwGVF0VRBuwr9v26aDA9GFmZ2VRmObGc4hPtB70xjh4P9JDhCV7umxaCAdRdi@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfDdmHqfsOTxPdtwDL/i+gawfE2lQcmk+2vZB12p6pHJUYKh3j
	CgSxRIuw/TvKMuveqMWI8lphquzghV04/ceDUSKeHLbHnVK4ClfrpqjLC+cjCa6hDsNkwYQjyEi
	a+U81ChHt3geVKVLjoSf6i9XAB9w=
X-Gm-Gg: ASbGnctetYrfulgjjO6xfbETdTc8DrlTCwZjTkDvnvM3wdLzIt8+P5uomrhttO07UeB
	VNutZXL9CNw6SSmC8MGjsYrKqcAbICcER7G0=
X-Google-Smtp-Source: AGHT+IHIi/pm9NbWPoMuEGQ09KkSJrVdriB4qlBLqg1CtcSOgCnpj+CbjAaA1subuTLpztibypUEDaqMWoLXH0dcxig=
X-Received: by 2002:a17:906:32d2:b0:aa6:7091:1e91 with SMTP id
 a640c23a62f3a-aa69cd29766mr320372766b.11.1733808081958; Mon, 09 Dec 2024
 21:21:21 -0800 (PST)
MIME-Version: 1.0
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com> <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
In-Reply-To: <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Tue, 10 Dec 2024 13:20:45 +0800
Message-ID: <CA+4VgcJdJWK99wMPN6h-Xjzs+dYbuAEeXDCTNEG88ugwWh8v_Q@mail.gmail.com>
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

Thanks for your comment.

David Lechner <dlechner@baylibre.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=882:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 12/3/24 3:15 AM, Eason Yang wrote:
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
> In the code, there are channels set up for differential inputs. Should we
> remove these until conversion and event support for them is added?
>

Okay, I would remove differential inputs until conversions are finished.

> >
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >  MAINTAINERS               |   1 +
> >  drivers/iio/adc/Kconfig   |  10 +
> >  drivers/iio/adc/Makefile  |   1 +
> >  drivers/iio/adc/nct720x.c | 533 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 545 insertions(+)
> >  create mode 100644 drivers/iio/adc/nct720x.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bea10a846475..573b12f0cd4d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2799,6 +2799,7 @@ F:      arch/arm/mach-npcm/
> >  F:   arch/arm64/boot/dts/nuvoton/
> >  F:   drivers/*/*/*npcm*
> >  F:   drivers/*/*npcm*
> > +F:   drivers/iio/adc/nct720x.c
> >  F:   drivers/rtc/rtc-nct3018y.c
> >  F:   include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> >  F:   include/dt-bindings/clock/nuvoton,npcm845-clk.h
> > diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> > index 849c90203071..6eed518efa1c 100644
> > --- a/drivers/iio/adc/Kconfig
> > +++ b/drivers/iio/adc/Kconfig
> > @@ -1048,6 +1048,16 @@ config NAU7802
> >         To compile this driver as a module, choose M here: the
> >         module will be called nau7802.
> >
> > +config NCT720X
> > +     tristate "Nuvoton Instruments NCT7201 and NCT7202 Power Monitor"
> > +     depends on I2C
> > +     select REGMAP_I2C
> > +     help
> > +       If you say yes here you get support for the Nuvoton NCT7201 and
> > +       NCT7202 Voltage Monitor.
> > +       This driver can also be built as a module. If so, the module
> > +       will be called nct720x.
>
> Don't put "x" in the name, just call it nct7201. We always try to avoid
> using "x" in the IIO subsystem because too often it causes problems in
> the future.
>

Understand it, we would use nct7201 to replace nct720x for all parts.

> > +
> >  config NPCM_ADC
> >       tristate "Nuvoton NPCM ADC driver"
> >       depends on ARCH_NPCM || COMPILE_TEST
> > diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> > index ee19afba62b7..89f5b5d1a567 100644
> > --- a/drivers/iio/adc/Makefile
> > +++ b/drivers/iio/adc/Makefile
> > @@ -94,6 +94,7 @@ obj-$(CONFIG_MESON_SARADC) +=3D meson_saradc.o
> >  obj-$(CONFIG_MP2629_ADC) +=3D mp2629_adc.o
> >  obj-$(CONFIG_MXS_LRADC_ADC) +=3D mxs-lradc-adc.o
> >  obj-$(CONFIG_NAU7802) +=3D nau7802.o
> > +obj-$(CONFIG_NCT720X) +=3D nct720x.o
> >  obj-$(CONFIG_NPCM_ADC) +=3D npcm_adc.o
> >  obj-$(CONFIG_PAC1921) +=3D pac1921.o
> >  obj-$(CONFIG_PAC1934) +=3D pac1934.o
> > diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> > new file mode 100644
> > index 000000000000..b28b5f4d7d70
> > --- /dev/null
> > +++ b/drivers/iio/adc/nct720x.c
> > @@ -0,0 +1,533 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> > + *
> > + * Copyright (c) 2024 Nuvoton Inc.
>
> If there are datasheets available, it would be helpful to link to them he=
re.
>

We would check the chip vendor.

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
> > +#include <linux/iio/sysfs.h>
>
> Unused header.
>
- #include <linux/iio/sysfs.h>

> > +
> > +#define VIN_MAX                                      12      /* Counte=
d from 1 */
> > +#define NCT720X_IN_SCALING                   4995
> > +#define NCT720X_IN_SCALING_FACTOR            10000
> > +
> > +#define REG_INTERRUPT_STATUS_1                       0x0C
> > +#define REG_INTERRUPT_STATUS_2                       0x0D
> > +#define REG_VOLT_LOW_BYTE                    0x0F
> > +#define REG_CONFIGURATION                    0x10
> > +#define  BIT_CONFIGURATION_START             BIT(0)
> > +#define  BIT_CONFIGURATION_ALERT_MSK         BIT(1)
> > +#define  BIT_CONFIGURATION_CONV_RATE         BIT(2)
> > +#define  BIT_CONFIGURATION_RESET             BIT(7)
> > +
> > +#define REG_ADVANCED_CONFIGURATION           0x11
> > +#define  BIT_ADVANCED_CONF_MOD_ALERT         BIT(0)
> > +#define  BIT_ADVANCED_CONF_MOD_STS           BIT(1)
> > +#define  BIT_ADVANCED_CONF_FAULT_QUEUE               BIT(2)
> > +#define  BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN  BIT(4)
> > +#define  BIT_ADVANCED_CONF_EN_SMB_TIMEOUT    BIT(5)
> > +#define  BIT_ADVANCED_CONF_MOD_RSTIN         BIT(7)
> > +
> > +#define REG_CHANNEL_INPUT_MODE                       0x12
> > +#define REG_CHANNEL_ENABLE_1                 0x13
> > +#define  REG_CHANNEL_ENABLE_1_MASK           GENMASK(7, 0)
> > +#define REG_CHANNEL_ENABLE_2                 0x14
> > +#define  REG_CHANNEL_ENABLE_2_MASK           GENMASK(3, 0)
> > +#define REG_INTERRUPT_MASK_1                 0x15
> > +#define REG_INTERRUPT_MASK_2                 0x16
> > +#define REG_BUSY_STATUS                              0x1E
> > +#define  BIT_BUSY                            BIT(0)
> > +#define  BIT_PWR_UP                          BIT(1)
> > +#define REG_ONE_SHOT                         0x1F
> > +#define REG_SMUS_ADDRESS                     0xFC
> > +#define REG_VIN_LIMIT_LSB_MASK                       GENMASK(4, 0)
> > +
> > +static const u8 REG_VIN[VIN_MAX] =3D {
>
> Usually ALL_CAPS is reserved for macros and static const data is
> lower_snake_case. Plus, prefer to always add the driver name as
> a namespace to help avoid conflics with more generic names.
>
> Example:
>
> static const u8 nct7201_reg_vin[NCT7201_VIN_MAX] =3D {
>
> Or (even better IMHO) just turn these into macros and avoid
> the tables:
>
> #define NCT7201_REG_VIN(i) (i)
> #define NCT7201_REG_VIN_HIGH_LIMIT(i) (0x20 + (i) * 2)
> #define NCT7201_REG_VIN_LOW_LIMIT(i) (0x21 + (i) * 2)
>

Add prefix NCT7201_ in above all above define and use macros to avoid
the tables, like below
#define NCT7201_REG_VIN(i) (i)
#define NCT7201_REG_VIN_HIGH_LIMIT(i) (0x20 + (i) * 2)
#define NCT7201_REG_VIN_LOW_LIMIT(i) (0x21 + (i) * 2)
#define NCT7201_REG_VIN_HIGH_LIMIT_LSB(i) (0x40 + (i) * 2)
#define NCT7201_REG_VIN_LOW_LIMIT_LSB(i) (0x41 + (i) * 2)

> > +     0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, /* 0 -7 */
> > +     0x08, 0x09, 0x0A, 0x0B,                         /* 8 - 11 */
> > +};
> > +static const u8 REG_VIN_HIGH_LIMIT[VIN_MAX] =3D {
> > +     0x20, 0x22, 0x24, 0x26, 0x28, 0x2A, 0x2C, 0x2E,
> > +     0x30, 0x32, 0x34, 0x36,
> > +};
> > +static const u8 REG_VIN_LOW_LIMIT[VIN_MAX] =3D {
> > +     0x21, 0x23, 0x25, 0x27, 0x29, 0x2B, 0x2D, 0x2F,
> > +     0x31, 0x33, 0x35, 0x37,
> > +};
> > +static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] =3D {
> > +     0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,
> > +     0x50, 0x52, 0x54, 0x56,
> > +};
> > +static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] =3D {
> > +     0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F,
> > +     0x51, 0x53, 0x55, 0x57,
> > +};
> > +static u8 nct720x_chan_to_index[] =3D {
>
> Should be const. Although, even better, just store this value in
> the address field, then we don't need the translation table.
>
> Right now, the address is always the same as the channel, so it
> is redundant anyway.
>

Remove nct720x_chan_to_index tables.

> > +     0 /* Not used */, 0, 1, 2, 3, 4, 5, 6,
> > +     7, 8, 9, 10, 11,
> > +};
> > +
> > +struct nct720x_chip_info {
> > +     struct i2c_client *client;
> > +     struct mutex access_lock;       /* for multi-byte read and write =
operations */
> > +     struct regmap *regmap;
> > +     struct regmap *regmap16;
> > +     int vin_max;                    /* number of VIN channels */
>
> We could rename this to num_vin_channels, then we wouldn't need
> a comment to explain it.
>

Okay, rename vin_max to num_vin_channels

> > +     u32 vin_mask;
> > +};
> > +
> > +struct nct720x_adc_model_data {
> > +     const char *model_name;
> > +     const struct iio_chan_spec *channels;
> > +     const int num_channels;
> > +     int vin_max;
> > +};

Rename vin_max to num_vin_channels

> > +
> > +static const struct iio_event_spec nct720x_events[] =3D {
> > +     {
> > +             .type =3D IIO_EV_TYPE_THRESH,
> > +             .dir =3D IIO_EV_DIR_RISING,
> > +             .mask_separate =3D BIT(IIO_EV_INFO_VALUE) |
> > +                              BIT(IIO_EV_INFO_ENABLE),
> > +     }, {
> > +             .type =3D IIO_EV_TYPE_THRESH,
> > +             .dir =3D IIO_EV_DIR_FALLING,
> > +             .mask_separate =3D BIT(IIO_EV_INFO_VALUE) |
> > +                              BIT(IIO_EV_INFO_ENABLE),
> > +     },
> > +};
> > +
> > +#define NCT720X_VOLTAGE_CHANNEL(chan, addr)                          \
> > +     {                                                               \
> > +             .type =3D IIO_VOLTAGE,                                   =
 \
> > +             .indexed =3D 1,                                          =
 \
> > +             .channel =3D chan,                                       =
 \
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),          =
 \
> > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),  =
 \
> > +             .address =3D addr,                                       =
 \
> > +             .event_spec =3D nct720x_events,                          =
 \
> > +             .num_event_specs =3D ARRAY_SIZE(nct720x_events),         =
 \
> > +     }
> > +
> > +#define NCT720X_VOLTAGE_CHANNEL_DIFF(chan1, chan2, addr)             \
> > +     {                                                               \
> > +             .type =3D IIO_VOLTAGE,                                   =
 \
> > +             .indexed =3D 1,                                          =
 \
> > +             .channel =3D (chan1),                                    =
 \
> > +             .channel2 =3D (chan2),                                   =
 \
> > +             .differential =3D 1,                                     =
 \
> > +             .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),          =
 \
> > +             .info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),  =
 \
> > +             .address =3D addr,                                       =
 \
> > +             .event_spec =3D nct720x_events,                          =
 \
> > +             .num_event_specs =3D ARRAY_SIZE(nct720x_events),         =
 \
> > +     }
> > +
> > +static const struct iio_chan_spec nct7201_channels[] =3D {
> > +     NCT720X_VOLTAGE_CHANNEL(1, 1),
> > +     NCT720X_VOLTAGE_CHANNEL(2, 2),
> > +     NCT720X_VOLTAGE_CHANNEL(3, 3),
> > +     NCT720X_VOLTAGE_CHANNEL(4, 4),
> > +     NCT720X_VOLTAGE_CHANNEL(5, 5),
> > +     NCT720X_VOLTAGE_CHANNEL(6, 6),
> > +     NCT720X_VOLTAGE_CHANNEL(7, 7),
> > +     NCT720X_VOLTAGE_CHANNEL(8, 8),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> > +};

Remove differential inputs.
-     NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),

> > +
> > +static const struct iio_chan_spec nct7202_channels[] =3D {
> > +     NCT720X_VOLTAGE_CHANNEL(1, 1),
> > +     NCT720X_VOLTAGE_CHANNEL(2, 2),
> > +     NCT720X_VOLTAGE_CHANNEL(3, 3),
> > +     NCT720X_VOLTAGE_CHANNEL(4, 4),
> > +     NCT720X_VOLTAGE_CHANNEL(5, 5),
> > +     NCT720X_VOLTAGE_CHANNEL(6, 6),
> > +     NCT720X_VOLTAGE_CHANNEL(7, 7),
> > +     NCT720X_VOLTAGE_CHANNEL(8, 8),
> > +     NCT720X_VOLTAGE_CHANNEL(9, 9),
> > +     NCT720X_VOLTAGE_CHANNEL(10, 10),
> > +     NCT720X_VOLTAGE_CHANNEL(11, 11),
> > +     NCT720X_VOLTAGE_CHANNEL(12, 12),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
> > +     NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),
> > +};

Remove differential inputs.
-     NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
-     NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),

> > +static int nct720x_read_raw(struct iio_dev *indio_dev,
> > +                         struct iio_chan_spec const *chan,
> > +                         int *val, int *val2, long mask)
> > +{
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +     u16 volt;
> > +     unsigned int value;
> > +     int err;
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     guard(mutex)(&chip->access_lock);
> > +     switch (mask) {
> > +     case IIO_CHAN_INFO_RAW:
> > +             err =3D regmap_read(chip->regmap16, REG_VIN[index], &valu=
e);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D (u16)value;
> > +             *val =3D volt >> 3;
>
> It seems strange that this is 13 bits when the chips are 8 and 12 bit.
>
> > +             return IIO_VAL_INT;
> > +     case IIO_CHAN_INFO_SCALE:
> > +             /* From the datasheet, we have to multiply by 0.0004995 *=
/
>
> The scale is the same for both 8 bit and 12 bit chips?
>
> > +             *val =3D 0;
> > +             *val2 =3D 499500;
> > +             return IIO_VAL_INT_PLUS_NANO;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static int nct720x_read_event_value(struct iio_dev *indio_dev,
> > +                                 const struct iio_chan_spec *chan,
> > +                                 enum iio_event_type type,
> > +                                 enum iio_event_direction dir,
> > +                                 enum iio_event_info info,
> > +                                 int *val, int *val2)
> > +{
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +     u16 volt;
> > +     unsigned int value;
> > +     int tmp, err;
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info !=3D IIO_EV_INFO_VALUE)
> > +             return -EINVAL;
>
> Do we need guard(mutex)(&chip->access_lock); here?
>

No, if read word, we don't need mutex here.

> > +
> > +     if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +             err =3D regmap_read(chip->regmap16, REG_VIN_LOW_LIMIT[ind=
ex], &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D (u16)value;
> > +     } else {
> > +             err =3D regmap_read(chip->regmap16, REG_VIN_HIGH_LIMIT[in=
dex], &value);
> > +             if (err < 0)
> > +                     return err;
> > +             volt =3D (u16)value;
> > +     }
> > +
> > +     /* Voltage(V) =3D 13bitCountValue * 0.0004995 */
> > +     tmp =3D (volt >> 3) * NCT720X_IN_SCALING;
> > +     *val =3D tmp / NCT720X_IN_SCALING_FACTOR;
>
> I'm pretty sure event threshold values need to be in raw units to match
> the `in_voltageY_raw` attributes, so the scaling factor would not be
> applied here.
>

-  /* Voltage(V) =3D 13bitCountValue * 0.0004995 */
- tmp =3D (volt >> 3) * NCT720X_IN_SCALING;
- val =3D tmp / NCT720X_IN_SCALING_FACTOR;
+ *val =3D volt >> 3;

> > +
> > +     return IIO_VAL_INT;
> > +}
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
>
> Same applies here.
>

- long v1, v2, volt;
+ long v1, v2;
- volt =3D (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING;

> > +     v1 =3D volt >> 5;
> > +     v2 =3D (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
>
> Looks like FIELD_PREP() could be used here.
>

- v1 =3D volt >> 5;
- v2 =3D (volt & REG_VIN_LIMIT_LSB_MASK) << 3;
+ v1 =3D val >> 5;
+ v2 =3D FIELD_PREP(NCT7201_REG_VIN_LIMIT_LSB_MASK, val) << 3;

> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     if (info =3D=3D IIO_EV_INFO_VALUE) {
> > +             if (dir =3D=3D IIO_EV_DIR_FALLING) {
> > +                     guard(mutex)(&chip->access_lock);
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
> > +
> > +static int nct720x_read_event_config(struct iio_dev *indio_dev,
> > +                                  const struct iio_chan_spec *chan,
> > +                                  enum iio_event_type type,
> > +                                  enum iio_event_direction dir)
> > +{
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     return !!(chip->vin_mask & BIT(index));
> > +}
> > +
> > +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> > +                                   const struct iio_chan_spec *chan,
> > +                                   enum iio_event_type type,
> > +                                   enum iio_event_direction dir,
> > +                                   bool state)
> > +{
> > +     int err =3D 0;
> > +     struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> > +     int index =3D nct720x_chan_to_index[chan->address];
> > +     unsigned int mask;
> > +
> > +     if (chan->type !=3D IIO_VOLTAGE)
> > +             return -EOPNOTSUPP;
> > +
> > +     mask =3D BIT(index);
> > +
> > +     if (!state && (chip->vin_mask & mask))
> > +             chip->vin_mask &=3D ~mask;
> > +     else if (state && !(chip->vin_mask & mask))
> > +             chip->vin_mask |=3D mask;
> > +
> > +     guard(mutex)(&chip->access_lock);
> > +
> > +     err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1,
> > +                        chip->vin_mask & REG_CHANNEL_ENABLE_1_MASK);
> > +     if (err < 0)
> > +             dev_err(&indio_dev->dev, "Failed to write REG_CHANNEL_ENA=
BLE_1\n");
> > +
> > +     if (chip->vin_max =3D=3D 12) {
> > +             err =3D regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, =
chip->vin_mask >> 8);
> > +             if (err < 0)
> > +                     dev_err(&indio_dev->dev, "Failed to write REG_CHA=
NNEL_ENABLE_2\n");
> > +     }
> > +     return err;
> > +}
> > +
> > +static const struct iio_info nct720x_info =3D {
> > +     .read_raw =3D nct720x_read_raw,
> > +     .read_event_config =3D nct720x_read_event_config,
> > +     .write_event_config =3D nct720x_write_event_config,
> > +     .read_event_value =3D nct720x_read_event_value,
> > +     .write_event_value =3D nct720x_write_event_value,
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
>
> Better would be `return dev_err_probe()`. But it is very rare for
> regmap_write() to fail so usually we don't print an error message
> for these.
>

We would remove print an error message for all remap_write failed.

> > +     }
> > +
> > +     /*
> > +      * After about 25 msecs, the device should be ready and then
> > +      * the Power Up bit will be set to 1. If not, wait for it.
>
> I don't see anything that looks like waiting after checking the power
> up bit.
>

Since 25 msecs is simulated by HW in the lab for all registers can be acces=
sed.
Then we would check one register if it is ready to access,

> > +      */
> > +     mdelay(25);
> > +     err  =3D regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
> > +     if (err < 0)
> > +             return err;
> > +     if (!(value & BIT_PWR_UP))
> > +             return err;
>
> Won't this return 0? It seems like it should be returning an error code.
>
> Better would be something like:
>
>                 return dev_err_probe(dev, -EIO, "failed to power up after=
 reset\n");
>

Thanks for your comment.
- return err;
+ return dev_err_probe(&chip->client->dev, -EIO, "failed to power up
after reset\n");

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
>
> Why guard here and not before other regmap access in this function?
>
> Since this is only called during probe, we probably don't need the guard.
>

Okay.

> > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
> > +     if (err < 0)
> > +             return err;
> > +     data[0] =3D (u8)value;
> > +
> > +     err  =3D regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
> > +     if (err < 0)
> > +             return err;
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
> > +
> > +static const struct regmap_config nct720x_regmap8_config =3D {
> > +     .name =3D "vin-data-read-byte",
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +     .max_register =3D 0xff,
> > +     .cache_type =3D REGCACHE_NONE,
> > +};
> > +
> > +static const struct regmap_config nct720x_regmap16_config =3D {
> > +     .name =3D "vin-data-read-word",
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 16,
> > +     .max_register =3D 0xff,
> > +     .cache_type =3D REGCACHE_NONE,
>
> REGCACHE_NONE is the default, so can be omitted.
>

Remove it.

> > +};
> > +
> > +static int nct720x_probe(struct i2c_client *client)
> > +{
> > +     const struct nct720x_adc_model_data *model_data;
> > +     struct nct720x_chip_info *chip;
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
> > +     chip->regmap =3D devm_regmap_init_i2c(client, &nct720x_regmap8_co=
nfig);
> > +     if (IS_ERR(chip->regmap))
> > +             return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> > +                     "Failed to init regmap\n");
> > +
> > +     chip->regmap16 =3D devm_regmap_init_i2c(client, &nct720x_regmap16=
_config);
> > +     if (IS_ERR(chip->regmap16))
> > +             return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16=
),
> > +                     "Failed to init regmap16\n");
> > +
> > +     chip->vin_max =3D model_data->vin_max;
> > +
> > +     ret =3D devm_mutex_init(&client->dev, &chip->access_lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     chip->client =3D client;
> > +
> > +     ret =3D nct720x_init_chip(chip);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     indio_dev->name =3D model_data->model_name;
> > +     indio_dev->channels =3D model_data->channels;
> > +     indio_dev->num_channels =3D model_data->num_channels;
> > +     indio_dev->info =3D &nct720x_info;
> > +     indio_dev->modes =3D INDIO_DIRECT_MODE;
> > +
> > +     return devm_iio_device_register(&client->dev, indio_dev);
> > +}
> > +
> > +static const struct i2c_device_id nct720x_id[] =3D {
> > +     { "nct7201", (kernel_ulong_t)&nct7201_model_data },
> > +     { "nct7202", (kernel_ulong_t)&nct7202_model_data },
>
> To be consistent with [1], please add .name =3D and .driver_data =3D in t=
his table.
>
> [1]: https://lore.kernel.org/linux-iio/20241204150036.1695824-2-u.kleine-=
koenig@baylibre.com/
>

- { "nct7201", (kernel_ulong_t)&nct7201_model_data },
- { "nct7202", (kernel_ulong_t)&nct7202_model_data },
+ { .name =3D "nct7201", .driver_data =3D (kernel_ulong_t)&nct7201_model_da=
ta },
+ { .name =3D "nct7202", .driver_data =3D (kernel_ulong_t)&nct7202_model_da=
ta },

> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, nct720x_id);
> > +
> > +static const struct of_device_id nct720x_of_match[] =3D {
> > +     {
> > +             .compatible =3D "nuvoton,nct7201",
> > +             .data =3D &nct7201_model_data,
> > +     },
> > +     {
> > +             .compatible =3D "nuvoton,nct7202",
> > +             .data =3D &nct7202_model_data,
> > +     },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, nct720x_of_match);
> > +
> > +static struct i2c_driver nct720x_driver =3D {
> > +     .driver =3D {
> > +             .name   =3D "nct720x",
> > +             .of_match_table =3D nct720x_of_match,
> > +     },
> > +     .probe =3D nct720x_probe,
> > +     .id_table =3D nct720x_id,
> > +};
> > +module_i2c_driver(nct720x_driver);
> > +
> > +MODULE_AUTHOR("Eason Yang <j2anfernee@gmail.com>");
> > +MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
> > +MODULE_LICENSE("GPL");
>
