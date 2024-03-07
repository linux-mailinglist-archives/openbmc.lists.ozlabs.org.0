Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3FA875B03
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:19:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jaoTyT4k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQHg0k19z3btl
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:19:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jaoTyT4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqrSP2ghTz3bWH
	for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2024 11:55:16 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7c7f3f66d17so18519039f.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2024 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709772913; x=1710377713; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAHe8fDY3ZMByPdDsZ8n5wvnpHMA8C8o1UVgw8bB+io=;
        b=jaoTyT4kRzurneMK0XjgMwCAaZlH+knpVQbYEnx4b8oOAaEQ0mEJG5wOwoVjLTnQmD
         aY2sHqc4V6b6upAScYdRHAvOvKA9nTxTRthyS7tX1+nn1ZYmkbpANZPOwP4aaVMEFysK
         fOWT94lupEiqnFvZtzOpliapRXTJjqZH4UjD7xvcRHKrpm8/b/474qSWdqyCDhtHJLBm
         6zO7ZUoN77fAS0nVYsafRdU81gvMSE8khfAilQd10E/r71EzSFP+hc+SFSsn3LmuO/QL
         Ox8RAaCWepes74lmfooCLJ7JAdnWFqdNl+i6mCVTazw2wMWjylMOIg3ETcv/2CjAX4jK
         2p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709772913; x=1710377713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAHe8fDY3ZMByPdDsZ8n5wvnpHMA8C8o1UVgw8bB+io=;
        b=ctzuOtbfOmLU1s1q5BNIXYMyiJZyCG0DblNOK6xrFVNHl3NEt6Pj6d56HO3IXVWDGz
         VImX0nrQq0t5TrpnBOZpeWpkJpHxg8oyLfHaJ6NB62K6wH+9yr5BhfgJikJWllIi8ba4
         IuiESpcD7xAykUpbub6cYmjeTnJtnLZlI+GZKwryuahOYC+SM0IvFTOpHEdcxxvjXnL+
         Z3vty+RfzBpJCx+qdM+sYKuEPdt4E8thJmWgnqsiL6mtkh0Fbz10BR2xNN38n7fCr70w
         yUoonCvVmyF5yDM/iPb+42sMrKgFwIvSBuLn4WoG78vFSlwG+w+X7b8IzISB/aX34fAt
         mAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXxHET8HyS/OjjZT5rUTVqIzhCJKxkP38yD1wkAbz0aC0gzxmGPxYFYwNCkQhNchsDYHxbOHxdONkNPHbRuq1DSmKY1YPR4O/E=
X-Gm-Message-State: AOJu0Yx5SD1uGjL2vzlEfPIDVkuE85q0Gd9HA3mnGQxGjmHGpBb4eMeL
	4voGtiDyq38fVT1T81C3Ju2pi0b6RhVx7CxnXQ19DY8n0Kkcx+vjLLk6wBIfpGFPQrkXBtBYy2p
	X7NHzEuqn5lPrn6x2zniLNefsqCk=
X-Google-Smtp-Source: AGHT+IFhRcePuXr51fFOSJaO94Wyf7r3N6D4M8eoRd5tYx5wU1KSS9KCQz44ejZldzzZ4tJBuaPrZ9hUwosOQqedQwg=
X-Received: by 2002:a92:c24e:0:b0:365:c1fc:dc07 with SMTP id
 k14-20020a92c24e000000b00365c1fcdc07mr19874608ilo.0.1709772913357; Wed, 06
 Mar 2024 16:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de>
In-Reply-To: <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 7 Mar 2024 08:55:01 +0800
Message-ID: <CALz278YmJTFBj57nm6fbfLjcJcjiDg=ToOeb+mSSwSgRNTJkew@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Mar 2024 10:18:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Wed, Feb 28, 2024 at 3:57=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Ban,
>
>
> Thank you for your patch. Some minor things from my side.
>
>
> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>
> Please reference the datasheet.
>
> Could you please give a high level description of the driver design?
>
> I=E2=80=99d also add a verb (in imperative mood) to the commit message su=
mmary,
> so it=E2=80=99s a statement:
>
> Add driver for I2C chip Nuvoton NCT7363Y

ok, I'll add some reviews to describe this chip for pwm and fan in v5.

>
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> > ---
> >   Documentation/hwmon/index.rst   |   1 +
> >   Documentation/hwmon/nct7363.rst |  33 +++
> >   MAINTAINERS                     |   2 +
> >   drivers/hwmon/Kconfig           |  11 +
> >   drivers/hwmon/Makefile          |   1 +
> >   drivers/hwmon/nct7363.c         | 412 +++++++++++++++++++++++++++++++=
+
> >   6 files changed, 460 insertions(+)
> >   create mode 100644 Documentation/hwmon/nct7363.rst
> >   create mode 100644 drivers/hwmon/nct7363.c
> >
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index c7ed1f73ac06..302f954b45be 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -165,6 +165,7 @@ Hardware Monitoring Kernel Drivers
> >      mp5990
> >      nct6683
> >      nct6775
> > +   nct7363
> >      nct7802
> >      nct7904
> >      npcm750-pwm-fan
> > diff --git a/Documentation/hwmon/nct7363.rst b/Documentation/hwmon/nct7=
363.rst
> > new file mode 100644
> > index 000000000000..89699c95aa4b
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
> > +The NCT7363Y is a Fan controller which provides up to 16 independent
>
> fan controller

ok, fix in v5

>
> > +FAN input monitors, and up to 16 independent PWM output with SMBus int=
erface.
>
> output*s*

ok, fix in v5

>
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +Currently, the driver supports the following features:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +fanX_input           provide current fan rotation value in RPM
> > +
> > +pwmX                 get or set PWM fan control value.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> In the diff view this does not align with the =E2=80=9Choles=E2=80=9D.

ok, fix in v5

>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7b1efefed7c4..7ca66b713e30 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15089,6 +15089,8 @@ M:    Ban Feng <kcfeng0@nuvoton.com>
> >   L:  linux-hwmon@vger.kernel.org
> >   S:  Maintained
> >   F:  Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> > +F:   Documentation/hwmon/nct7363.rst
> > +F:   drivers/hwmon/nct7363.c
> >
> >   NETDEVSIM
> >   M:  Jakub Kicinski <kuba@kernel.org>
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index a608264da87d..a297b5409b04 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1616,6 +1616,17 @@ config SENSORS_NCT6775_I2C
> >         This driver can also be built as a module. If so, the module
> >         will be called nct6775-i2c.
> >
> > +config SENSORS_NCT7363
> > +     tristate "Nuvoton NCT7363Y"
> > +     depends on I2C
> > +     select REGMAP_I2C
> > +     help
> > +       If you say yes here you get support for the Nuvoton NCT7363Y,
>
> The comma is not needed.

ok, fix in v5

>
> > +       hardware monitoring chip.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called nct7363.
> > +
> >   config SENSORS_NCT7802
> >       tristate "Nuvoton NCT7802Y"
> >       depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 47be39af5c03..d5e7531204df 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -167,6 +167,7 @@ obj-$(CONFIG_SENSORS_NCT6775_CORE) +=3D nct6775-cor=
e.o
> >   nct6775-objs                        :=3D nct6775-platform.o
> >   obj-$(CONFIG_SENSORS_NCT6775)       +=3D nct6775.o
> >   obj-$(CONFIG_SENSORS_NCT6775_I2C) +=3D nct6775-i2c.o
> > +obj-$(CONFIG_SENSORS_NCT7363)        +=3D nct7363.o
> >   obj-$(CONFIG_SENSORS_NCT7802)       +=3D nct7802.o
> >   obj-$(CONFIG_SENSORS_NCT7904)       +=3D nct7904.o
> >   obj-$(CONFIG_SENSORS_NPCM7XX)       +=3D npcm750-pwm-fan.o
> > diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
> > new file mode 100644
> > index 000000000000..c79d3ca4f111
> > --- /dev/null
> > +++ b/drivers/hwmon/nct7363.c
> > @@ -0,0 +1,412 @@
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
> > +#define NCT7363_REG_GPIO_0_3         0x20
> > +#define NCT7363_REG_GPIO_4_7         0x21
> > +#define NCT7363_REG_GPIO_10_13               0x22
> > +#define NCT7363_REG_GPIO_14_17               0x23
> > +#define NCT7363_REG_PWMEN_0_7                0x38
> > +#define NCT7363_REG_PWMEN_8_15               0x39
> > +#define NCT7363_REG_FANINEN_0_7              0x41
> > +#define NCT7363_REG_FANINEN_8_15     0x42
> > +#define NCT7363_REG_FANINX_HVAL(x)   (0x48 + ((x) * 2))
> > +#define NCT7363_REG_FANINX_LVAL(x)   (0x49 + ((x) * 2))
> > +#define NCT7363_REG_FSCPXDUTY(x)     (0x90 + ((x) * 2))
> > +
> > +#define PWM_SEL(x)                   (BIT(0) << (((x) % 4) * 2))
> > +#define FANIN_SEL(x)                 (BIT(1) << (((x) % 4) * 2))
> > +
> > +#define NCT7363_FANINX_LVAL_MASK     GENMASK(4, 0)
> > +#define NCT7363_FANIN_MASK           GENMASK(12, 0)
> > +
> > +#define NCT7363_PWM_COUNT            16
> > +
> > +static inline unsigned long FAN_FROM_REG(u16 val)
> > +{
> > +     /* In case fan is stopped or divide by 0 */
> > +     if (val =3D=3D NCT7363_FANIN_MASK || val =3D=3D 0)
>
> The comment seems redundant. Maybe also apply the mask to `val` and
> check the result.
>
> > +             return  0;
> > +
> > +     return (1350000UL / val);
>
> Why does the mask not to be applied to `val`?
>

The combination of the fan count value is given by FANINx_HVAL 8-bit
register (fan count value[12:5]) and FANINx_LVAL 8-bit register (fan
count value[4:0], [7:5] is reserved and the default value is 0).
Therefore, I don't apply NCT7363_FANIN_MASK to val. And there are two
values we need to consider, 0x0000 and 0xff1f. 0x0000 means FANINx
monitoring is disabled, and 0xff1f means FANINx monitoring is enabled
but doesn't connect to the fan.

> > +}
> > +
> > +static const struct of_device_id nct7363_of_match[] =3D {
> > +     { .compatible =3D "nuvoton,nct7363" },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, nct7363_of_match);
> > +
> > +struct nct7363_data {
> > +     struct regmap           *regmap;
> > +     struct mutex            lock; /* protect register access */
> > +
> > +     u16                     fanin_mask;
> > +     u16                     pwm_mask;
> > +};
> > +
> > +static int nct7363_read_fan(struct device *dev, u32 attr, int channel,
> > +                         long *val)
> > +{
> > +     struct nct7363_data *data =3D dev_get_drvdata(dev);
> > +     unsigned int hi, lo;
> > +     u16 cnt, rpm;
> > +     int ret =3D 0;
> > +
> > +     switch (attr) {
> > +     case hwmon_fan_input:
> > +             /*
> > +              * High-byte register should be read first to latch
> > +              * synchronous low-byte value
> > +              */
> > +             ret =3D regmap_read(data->regmap,
> > +                               NCT7363_REG_FANINX_HVAL(channel), &hi);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regmap_read(data->regmap,
> > +                     NCT7363_REG_FANINX_LVAL(channel), &lo);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             cnt =3D (hi << 5) | (lo & NCT7363_FANINX_LVAL_MASK);
> > +             rpm =3D FAN_FROM_REG(cnt);
> > +             *val =3D (long)rpm;
>
> Could `FAN_FROM_REG()` return long, so the cast here is not needed?

ok, fix in v5

>
> > +             return 0;
> > +     default:
> > +             return -EOPNOTSUPP;
> > +     }
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
> > +     u16 ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_pwm_input:
> > +             ret =3D regmap_read(data->regmap,
> > +                               NCT7363_REG_FSCPXDUTY(channel), &regval=
);
>
>      int regmap_read(struct regmap *map, unsigned int reg, unsigned int
> val);
>
> So `ret` should be `int`?

ok, fix in v5

Thanks,
Ban

>
>
> Kind regards,
>
> Paul
>
>
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
> > +             mutex_lock(&data->lock);
> > +             ret =3D regmap_write(data->regmap,
> > +                                NCT7363_REG_FSCPXDUTY(channel), val);
> > +             mutex_unlock(&data->lock);
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
> > +     u8 i, gpio0_3 =3D 0, gpio4_7 =3D 0, gpio10_13 =3D 0, gpio14_17 =
=3D 0;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < NCT7363_PWM_COUNT; i++) {
> > +             if (i < 4) {
> > +                     if (data->pwm_mask & BIT(i))
> > +                             gpio0_3 |=3D PWM_SEL(i);
> > +                     if (data->fanin_mask & BIT(i))
> > +                             gpio10_13 |=3D FANIN_SEL(i);
> > +             } else if (i < 8) {
> > +                     if (data->pwm_mask & BIT(i))
> > +                             gpio4_7 |=3D PWM_SEL(i);
> > +                     if (data->fanin_mask & BIT(i))
> > +                             gpio14_17 |=3D FANIN_SEL(i);
> > +             } else if (i < 12) {
> > +                     if (data->pwm_mask & BIT(i))
> > +                             gpio10_13 |=3D PWM_SEL(i);
> > +                     if (data->fanin_mask & BIT(i))
> > +                             gpio0_3 |=3D FANIN_SEL(i);
> > +             } else {
> > +                     if (data->pwm_mask & BIT(i))
> > +                             gpio14_17 |=3D PWM_SEL(i);
> > +                     if (data->fanin_mask & BIT(i))
> > +                             gpio4_7 |=3D FANIN_SEL(i);
> > +             }
> > +     }
> > +
> > +     /* Pin Function Configuration */
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_0_3, gpio0_3)=
;
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_4_7, gpio4_7)=
;
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_10_13, gpio10=
_13);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_GPIO_14_17, gpio14=
_17);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* PWM and FANIN Monitoring Enable */
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_PWMEN_0_7,
> > +                        data->pwm_mask & 0xff);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_PWMEN_8_15,
> > +                        (data->pwm_mask >> 8) & 0xff);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_FANINEN_0_7,
> > +                        data->fanin_mask & 0xff);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D regmap_write(data->regmap, NCT7363_REG_FANINEN_8_15,
> > +                        (data->fanin_mask >> 8) & 0xff);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int nct7363_present_pwm_fanin(struct device *dev,
> > +                                  struct device_node *child,
> > +                                  struct nct7363_data *data)
> > +{
> > +     struct of_phandle_args args;
> > +     int ret, fanin_cnt;
> > +     u8 *fanin_ch;
> > +     u8 ch, index;
> > +
> > +     ret =3D of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
> > +                                      0, &args);
> > +     if (ret)
> > +             return ret;
> > +
> > +     data->pwm_mask |=3D BIT(args.args[0]);
> > +
> > +     fanin_cnt =3D of_property_count_u8_elems(child, "tach-ch");
> > +     if (fanin_cnt < 1)
> > +             return -EINVAL;
> > +
> > +     fanin_ch =3D devm_kcalloc(dev, fanin_cnt, sizeof(*fanin_ch), GFP_=
KERNEL);
> > +     if (!fanin_ch)
> > +             return -ENOMEM;
> > +
> > +     ret =3D of_property_read_u8_array(child, "tach-ch", fanin_ch, fan=
in_cnt);
> > +     if (ret)
> > +             return ret;
> > +
> > +     for (ch =3D 0; ch < fanin_cnt; ch++) {
> > +             index =3D fanin_ch[ch];
> > +             data->fanin_mask |=3D BIT(index);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct regmap_config nct7363_regmap_config =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
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
> > +};
> > +
> > +module_i2c_driver(nct7363_driver);
> > +
> > +MODULE_AUTHOR("CW Ho <cwho@nuvoton.com>");
> > +MODULE_AUTHOR("Ban Feng <kcfeng0@nuvoton.com>");
> > +MODULE_DESCRIPTION("NCT7363 Hardware Monitoring Driver");
> > +MODULE_LICENSE("GPL");
