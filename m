Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 910B599FB86
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 00:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSpx94Zgrz3dHL
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 09:41:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728960584;
	cv=none; b=cesoD0eNxQnTRJyhmPjvbL8vSZDzX9XWmgtFoK1c+DLs93GhElzKvUm+0q3VD3iNMkNNEs5Uimu5lj6G8ZSgE3onl5kUSfpJ/VhoqIFJ7HCoXYZ70xts+3D+kxspsM3CaH6bAy5tPKpmfQZTPYlHK08D6XlETo1kbSO+PuRhI3yiNUTExVPAJV9cdJLGG5ZC5AwbLd3yhu1NRzjRgH8LxEeaWX+eB6glUnRQ+05iV4PeQxWKMIAAc2L4u1nt4IRu+VwN60OFpaE5XQqlw/OlHhxgTn3avCWjqVLoZcKK1jVxzxLNlMSlvIVyk4eM8XKwYVoqT6emLbd0XsZpe7cXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728960584; c=relaxed/relaxed;
	bh=O6QpddloaBSUmjobzza4mWr5JMsand8nw+B+0gMZgz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOgDLRmubaq5XUwAECnmBawZbBQzB79Ejq/ocl7Rr1b+vcPxp3HVGKWZAxbKkkBE5ZHawJAWV0Uk5VUmRMep+Z2RMyLlW7AY/Rzo+HNqP1V8t/oyRUgajacliCpAPLTc78DgIrRoqZKFi7V2M6v5rWqnvYqCO85KUBem8hAlYtzyrVehjOxOl9inm5J8kI4TABqOggI7IVsdNgtinynJIKcPzeHAtaHjIEwE4x/5RZsTMsTc8yw0dWmAQiHeD+fp4B2taua8wF1u8xCIDs1dixRi7IwKZXHEO8D6oVsWhrDAGyUv5kIAcv/mX/zobpfgy/JPIp481JOuBlfnyJLTdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=deXMtxKq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=deXMtxKq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSJTx1x4Fz3c54
	for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2024 13:49:40 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6cbf340fccaso27242576d6.1
        for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2024 19:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728960578; x=1729565378; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6QpddloaBSUmjobzza4mWr5JMsand8nw+B+0gMZgz4=;
        b=deXMtxKqqAR231IMNT/p+KMSkkWk9jVeg79AzUUhEw+ZNAqzj0dzT/5mN90aaUSd//
         vE8vT3HGN72Y6JYsAT9tl1g12b1vw2TVrAnxcFukXdRXjCs53/knU4TPbyxGPXcMVqwN
         34d2nSxIAmWHc256d4Te0+YuMivAaAREQTuMe7k5H+V420ixMk5wJWH0bqWLbIFLb+zw
         xgPrhI1GGkJ87KX4k4ncwrAVPQK20RnfvaArCb0mwYl3XSE1JRhMIZOHvaZwYcj4yvj4
         pLD6HHZWMLXE36RiTiFWmYevhmWEp24PK4UgGVJFk8GFfzu3obvBD2AszAS0N9z/w7Zs
         3UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728960578; x=1729565378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6QpddloaBSUmjobzza4mWr5JMsand8nw+B+0gMZgz4=;
        b=VI0jPg3w75XlyqSJEX5rniOQRShPo6CxauLGp0gePqV2pYlVDDIXCBiozFoJHzBkFP
         axTYjz5O4BMOiqiMSnZWJbWbJ2jeVH+lC74wq55J/gMdDaPb65uZOSuhfmdIdmG67jms
         YrEhAEJf9EO62E+bDC9Oj6KeWaevY0SieKyDI2kjN2YrsiMPZ7/CwN8Z1C8ZtqtXR2a1
         /0Dh5qHGhoZiXKW4zfR7BC7QDqY5KAekSdzGuev2ugmAxMrSEPnvZQgev96oguejibYf
         m0rBuC2+r0Kh0KeMDQWiucwuAZ1yj5a2CIilkmSoT+PEpr/R31cZEaJNFBpZGcgKwkNM
         G0gA==
X-Forwarded-Encrypted: i=1; AJvYcCXa+6V+iN3smUbNqZlJwjfkBnLnGTBg5/aBEgRI5xd7eQZvruFZo8sRgHgk+j5UAdH+3m/ZH/rS@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywo5ew6mCG6cP6V4KE2aXLhAEFI1rGIvfBQFVv5UwYv3kF+Y/cg
	AiklT+IbgJ0GgfDElQBmiiviRYBQQWEcGB9u4Ap38HN7UtlAtwsBLlwpS9g5VJVVFK/LdUSxxDd
	k7gtvY3KY1vEPx70xg0XoRcdODjI=
X-Google-Smtp-Source: AGHT+IEcKBHtofFY3sXmSdV/IfeR4HDDhH6DC0cwnILrlnbfKKHc2mXD8uyRieb2RIlyqcgM6Q4ecFlNbayoe0kXSrM=
X-Received: by 2002:ad4:4ea7:0:b0:6cb:c9cf:cd40 with SMTP id
 6a1803df08f44-6cbe522c325mr313981486d6.8.1728960577579; Mon, 14 Oct 2024
 19:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com> <20240322081158.4106326-3-kcfeng0@nuvoton.com>
 <dee8d81d-590e-4ae5-9771-9e1848b8ffe9@roeck-us.net>
In-Reply-To: <dee8d81d-590e-4ae5-9771-9e1848b8ffe9@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Tue, 15 Oct 2024 10:49:26 +0800
Message-ID: <CALz278YCpDYd6Lyj0qdAS9xv0_HYfz7y3a3L7WW4+9A65nS7zQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 16 Oct 2024 09:41:27 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

On Thu, Jun 20, 2024 at 10:23=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Fri, Mar 22, 2024 at 04:11:58PM +0800, baneric926@gmail.com wrote:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > The NCT7363Y is a fan controller which provides up to 16
> > independent FAN input monitors. It can report each FAN input count
> > values. The NCT7363Y also provides up to 16 independent PWM
> > outputs. Each PWM can output specific PWM signal by manual mode to
> > control the FAN duty outside.
> >
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>
> Sorry for the late reply. This got somehow lost in my queue.
>
> > ---
> >  Documentation/hwmon/index.rst   |   1 +
> >  Documentation/hwmon/nct7363.rst |  33 +++
> >  MAINTAINERS                     |   2 +
> >  drivers/hwmon/Kconfig           |  11 +
> >  drivers/hwmon/Makefile          |   1 +
> >  drivers/hwmon/nct7363.c         | 396 ++++++++++++++++++++++++++++++++
> >  6 files changed, 444 insertions(+)
> >  create mode 100644 Documentation/hwmon/nct7363.rst
> >  create mode 100644 drivers/hwmon/nct7363.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index 1ca7a4fe1f8f..0874f2f754f4 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -170,6 +170,7 @@ Hardware Monitoring Kernel Drivers
> >     mpq8785
> >     nct6683
> >     nct6775
> > +   nct7363
> >     nct7802
> >     nct7904
> >     npcm750-pwm-fan
> > diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7=
363.rst
> > new file mode 100644
> > index 000000000000..1a6abce3a433
> > --- /dev/null
> > +++ b/Documentation/hwmon/nct7363.rst
> > @@ -0,0 +1,33 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Kernel driver nct7363
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chip:
> > +
> > +  * Nuvoton NCT7363Y
> > +
> > +    Prefix: nct7363
> > +
> > +    Addresses: I2C 0x20, 0x21, 0x22, 0x23
> > +
> > +Author: Ban Feng <kcfeng0@nuvoton.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +The NCT7363Y is a fan controller which provides up to 16 independent
> > +FAN input monitors, and up to 16 independent PWM outputs with SMBus in=
terface.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +Currently, the driver supports the following features:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +fanX_input  provide current fan rotation value in RPM
> > +
> > +pwmX        get or set PWM fan control value.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2705e44ffc0c..c016a0bed476 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15221,6 +15221,8 @@ M:    Ban Feng <kcfeng0@nuvoton.com>
> >  L:   linux-hwmon@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> > +F:   Documentation/hwmon/nct7363.rst
> > +F:   drivers/hwmon/nct7363.c
> >
> >  NETDEVSIM
> >  M:   Jakub Kicinski <kuba@kernel.org>
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 83945397b6eb..4ff19ea11001 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1658,6 +1658,17 @@ config SENSORS_NCT6775_I2C
> >         This driver can also be built as a module. If so, the module
> >         will be called nct6775-i2c.
> >
> > +config SENSORS_NCT7363
> > +     tristate "Nuvoton NCT7363Y"
> > +     depends on I2C
> > +     select REGMAP_I2C
> > +     help
> > +       If you say yes here you get support for the Nuvoton NCT7363Y
> > +       hardware monitoring chip.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called nct7363.
> > +
> >  config SENSORS_NCT7802
> >       tristate "Nuvoton NCT7802Y"
> >       depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 5c31808f6378..cf7be22b916a 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -171,6 +171,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-cor=
e.o
> >  nct6775-objs                 :=3D nct6775-platform.o
> >  obj-$(CONFIG_SENSORS_NCT6775)        +=3D nct6775.o
> >  obj-$(CONFIG_SENSORS_NCT6775_I2C) +=3D nct6775-i2c.o
> > +obj-$(CONFIG_SENSORS_NCT7363)        +=3D nct7363.o
> >  obj-$(CONFIG_SENSORS_NCT7802)        +=3D nct7802.o
> >  obj-$(CONFIG_SENSORS_NCT7904)        +=3D nct7904.o
> >  obj-$(CONFIG_SENSORS_NPCM7XX)        +=3D npcm750-pwm-fan.o
> > diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
> > new file mode 100644
> > index 000000000000..858296f5d5b3
> > --- /dev/null
> > +++ b/drivers/hwmon/nct7363.c
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2023 Nuvoton Technology corporation.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +
> > +#define NCT7363_REG_FUNC_CFG_BASE(x) (0x20 + (x))
> > +#define NCT7363_REG_PWMEN_BASE(x)    (0x38 + (x))
> > +#define NCT7363_REG_FANINEN_BASE(x)  (0x41 + (x))
> > +#define NCT7363_REG_FANINX_HVAL(x)   (0x48 + ((x) * 2))
> > +#define NCT7363_REG_FANINX_LVAL(x)   (0x49 + ((x) * 2))
> > +#define NCT7363_REG_FSCPXDUTY(x)     (0x90 + ((x) * 2))
> > +
> > +#define PWM_SEL(x)                   (BIT(0) << ((x) * 2))
> > +#define FANIN_SEL(x)                 (BIT(1) << ((x < 8) ? \
> > +                                      (((x) + 8) * 2) : \
> > +                                      (((x) % 8) * 2)))
> > +#define VALUE_TO_REG(x, y)           (((x) >> ((y) * 8)) & 0xFF)
> > +
> > +#define NCT7363_FANINX_LVAL_MASK     GENMASK(4, 0)
> > +#define NCT7363_FANIN_MASK           GENMASK(12, 0)
> > +
> > +#define NCT7363_PWM_COUNT            16
> > +
> > +static inline unsigned int FAN_FROM_REG(u16 val)
>
> Please use lower case for functions, even if inline.

ok, I'll fix it in v6.

>
> > +{
> > +     if (val =3D=3D NCT7363_FANIN_MASK || val =3D=3D 0)
> > +             return 0;
> > +
> > +     return (1350000UL / val);
> > +}
> > +
> > +enum chips { nct7363, nct7362 };
> > +
>
> Those enums are not actually used. Are they needed ?

This added is for nct7362, in case we need to add the difference between th=
em.

>
> > +static const struct i2c_device_id nct7363_id[] =3D {
> > +     { "nct7363", nct7363 },
> > +     { "nct7362", nct7362 },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, nct7363_id);
> > +
> > +static const struct of_device_id nct7363_of_match[] =3D {
> > +     { .compatible =3D "nuvoton,nct7363", .data =3D (void *)nct7363 },
> > +     { .compatible =3D "nuvoton,nct7362", .data =3D (void *)nct7362 },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, nct7363_of_match);
> > +
> > +struct nct7363_data {
> > +     struct regmap           *regmap;
> > +     struct mutex            lock;           /* protect register acces=
s */
> > +
> > +     u16                     fanin_mask;
> > +     u16                     pwm_mask;
> > +};
> > +
> > +static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct7363_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int hi, lo, rpm;
> > +     int ret =3D 0;
> > +     u16 cnt;
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_input:
> > +             /*
> > +              * High-byte register should be read first to latch
> > +              * synchronous low-byte value
> > +              */
> > +             mutex_lock(&data->lock);
> > +             ret =3D regmap_read(data->regmap,
> > +                               NCT7363_REG_FANINX_HVAL(channel), &hi);
> > +             if (ret)
> > +                     goto out;
> > +
> > +             ret =3D regmap_read(data->regmap,
> > +                               NCT7363_REG_FANINX_LVAL(channel), &lo);
>
> Please consider using regmap_read_bulk() to avoid the locks.

ok, I'll fix it in v6.

>
> > +             if (ret)
> > +                     goto out;
> > +             mutex_unlock(&data->lock);
> > +
> > +             cnt =3D (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
> > +             rpm =3D FAN_FROM_REG(cnt);
> > +             *val =3D (long)rpm;
>
> rpm and the typecast are unnecessary. Just use
>                 *val =3D fan_from_reg(cnt);

ok, I'll fix it in v6.

>
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +
> > +out:
> > +     mutex_unlock(&data->lock);
> > +     return ret;
> > +}
> > +
> > +static umode_t nct7363_fan_is_visible(const void *_data, u32 attr, int=
 channel)
> > +{
> > +     const struct nct7363_data *data =3D _data;
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_input:
> > +             if (data->fanin_mask & BIT(channel))
> > +                     return 0444;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct7363_read_pwm(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct7363_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int regval;
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             ret =3D regmap_read(data->regmap,
> > +                               NCT7363_REG_FSCPXDUTY(channel), &regval=
);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             *val =3D (long)regval;
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static int nct7363_write_pwm(struct device *dev, u32 attr, int channel=
,
> > +                          long val)
> > +{
> > +     struct nct7363_data *data =3D dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             if (val < 0 || val > 255)
> > +                     return -EINVAL;
> > +
> > +             ret =3D regmap_write(data->regmap,
> > +                                NCT7363_REG_FSCPXDUTY(channel), val);
> > +
> > +             return ret;
> > +
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static umode_t nct7363_pwm_is_visible(const void *_data, u32 attr, int=
 channel)
> > +{
> > +     const struct nct7363_data *data =3D _data;
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             if (data->pwm_mask & BIT(channel))
> > +                     return 0644;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct7363_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +                     u32 attr, int channel, long *val)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             return nct7363_read_fan(dev, attr, channel, val);
> > +     case hwmon_pwm:
> > +             return nct7363_read_pwm(dev, attr, channel, val);
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static int nct7363_write(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +                      u32 attr, int channel, long val)
> > +{
> > +     switch (type) {
> > +     case hwmon_pwm:
> > +             return nct7363_write_pwm(dev, attr, channel, val);
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
> > +}
> > +
> > +static umode_t nct7363_is_visible(const void *data,
> > +                               enum hwmon_sensor_types type,
> > +                               u32 attr, int channel)
> > +{
> > +     switch (type) {
> > +     case hwmon_fan:
> > +             return nct7363_fan_is_visible(data, attr, channel);
> > +     case hwmon_pwm:
> > +             return nct7363_pwm_is_visible(data, attr, channel);
> > +     default:
> > +             return 0;
> > +     }
> > +}
> > +
> > +static const struct hwmon_channel_info *nct7363_info[] =3D {
> > +     HWMON_CHANNEL_INFO(fan,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT,
> > +                        HWMON_F_INPUT),
>
> Other potential attributes:
>
> - enable (register 0x41, 0x42, and possibly 0x40)
> - alarm (register 0x34, 0x35)
> - min (register 0x6c, 0x6d)

ok, I'll consider min and alarm in v6.

>
> > +     HWMON_CHANNEL_INFO(pwm,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT,
> > +                        HWMON_PWM_INPUT),
>
> Other potential attributes:
>
> - enable (register 0x38)
> - freq (register 0x91, ...)
>
> All those could be added later, of course, but I would suggest to at leas=
t
> add the fan speed low limit and alarm attributes.

ok, I'll consider min and alarm in v6.

>
> > +     NULL
> > +};
> > +
> > +static const struct hwmon_ops nct7363_hwmon_ops =3D {
> > +     .is_visible =3D nct7363_is_visible,
> > +     .read =3D nct7363_read,
> > +     .write =3D nct7363_write,
> > +};
> > +
> > +static const struct hwmon_chip_info nct7363_chip_info =3D {
> > +     .ops =3D &nct7363_hwmon_ops,
> > +     .info =3D nct7363_info,
> > +};
> > +
> > +static int nct7363_init_chip(struct nct7363_data *data)
> > +{
> > +     u32 func_config =3D 0;
> > +     int i, ret;
> > +
> > +     /* Pin Function Configuration */
> > +     for (i =3D 0; i < NCT7363_PWM_COUNT; i++) {
> > +             if (data->pwm_mask & BIT(i))
> > +                     func_config |=3D PWM_SEL(i);
> > +             if (data->fanin_mask & BIT(i))
> > +                     func_config |=3D FANIN_SEL(i);
> > +     }
> > +
> > +     for (i =3D 0; i < 4; i++) {
> > +             ret =3D regmap_write(data->regmap, NCT7363_REG_FUNC_CFG_B=
ASE(i),
> > +                                VALUE_TO_REG(func_config, i));
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     /* PWM and FANIN Monitoring Enable */
> > +     for (i =3D 0; i < 2; i++) {
> > +             ret =3D regmap_write(data->regmap, NCT7363_REG_PWMEN_BASE=
(i),
> > +                                VALUE_TO_REG(data->pwm_mask, i));
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D regmap_write(data->regmap, NCT7363_REG_FANINEN_BA=
SE(i),
> > +                                VALUE_TO_REG(data->fanin_mask, i));
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct7363_present_pwm_fanin(struct device *dev,
> > +                                  struct device_node *child,
> > +                                  struct nct7363_data *data)
> > +{
> > +     u8 fanin_ch[NCT7363_PWM_COUNT];
> > +     struct of_phandle_args args;
> > +     int ret, fanin_cnt;
> > +     u8 ch, index;
> > +
> > +     ret =3D of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
> > +                                      0, &args);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (args.args[0] >=3D NCT7363_PWM_COUNT)
> > +             return -EINVAL;
> > +     data->pwm_mask |=3D BIT(args.args[0]);
> > +
> > +     fanin_cnt =3D of_property_count_u8_elems(child, "tach-ch");
> > +     if (fanin_cnt < 1 || fanin_cnt > NCT7363_PWM_COUNT)
> > +             return -EINVAL;
> > +
> > +     ret =3D of_property_read_u8_array(child, "tach-ch", fanin_ch, fan=
in_cnt);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (ch =3D 0; ch < fanin_cnt; ch++) {
> > +             index =3D fanin_ch[ch];
> > +             if (index >=3D NCT7363_PWM_COUNT)
> > +                     return -EINVAL;
> > +             data->fanin_mask |=3D BIT(index);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct regmap_config nct7363_regmap_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
>
> Your call to make, but this doesn't use regmap caching capabilities which
> might be really useful here. Most of the registers (all but the count and
> status registers, plus the gpio input registers if/when gpio support is
> added) are not volatile and could be cached.

ok, I'll add it in v6.

>
> > +};
> > +
> > +static int nct7363_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct device_node *child;
> > +     struct nct7363_data *data;
> > +     struct device *hwmon_dev;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     data->regmap =3D devm_regmap_init_i2c(client, &nct7363_regmap_con=
fig);
> > +     if (IS_ERR(data->regmap))
> > +             return PTR_ERR(data->regmap);
> > +
> > +     mutex_init(&data->lock);
> > +
> > +     for_each_child_of_node(dev->of_node, child) {
> > +             ret =3D nct7363_present_pwm_fanin(dev, child, data);
> > +             if (ret) {
> > +                     of_node_put(child);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     /* Initialize the chip */
> > +     ret =3D nct7363_init_chip(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     hwmon_dev =3D
> > +             devm_hwmon_device_register_with_info(dev, client->name, d=
ata,
> > +                                                  &nct7363_chip_info, =
NULL);
> > +     return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static struct i2c_driver nct7363_driver =3D {
> > +     .class =3D I2C_CLASS_HWMON,
> > +     .driver =3D {
> > +             .name =3D "nct7363",
> > +             .of_match_table =3D nct7363_of_match,
> > +     },
> > +     .probe =3D nct7363_probe,
> > +     .id_table =3D nct7363_id,
> > +};
> > +
> > +module_i2c_driver(nct7363_driver);
> > +
> > +MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
> > +MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
> > +MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
> > +MODULE_LICENSE("GPL");
