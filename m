Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37D9C1201
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky3k4dXLz3fsD
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730960061;
	cv=none; b=XnfBwTcoY1O18Njjjs7bkBxwrDCxMZ1HIByGSkrm1DTqdlEuAlOajUHpKVbO9ss9vUBoD4mIkbGAbA4WY/pA16LSMsSqFlykwtn0p98eFYx9qyXxjCZdwmPQZ2JcwqEd1ejAEvbSV5q+nFESIelPjHRi/FMG/c/faCRXDmJ6Jhi1oYEOuPn6cmdnwO1+8CvPggLMw0cVKDUxOPOSkWR6pVGqqPI4HD7d+naYq2QBvfPOKhN7GAD964oYBK2hGljm/p1ZdOXDnFPotz6EJlXfs5YWoQVaboX8iMVq5V1AH3HcXCXVh28zIPzeKl0UiWa2tuy3/L6pbb1xMP9+eXNOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730960061; c=relaxed/relaxed;
	bh=btVm5Mykpxn9NBVcKa7O3OZQLbsl76ixgLFuAuEyrk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fd0Pbr/6zlwK4YBb0E81LRFJBhU+8777sTaLDq8vsUELkTZt1Ta7phAjuGm2liA71xDODVMhmh8PZVvn5w6nsGahKJBfFmTYa/DUe2TH/Vs4cmUkssfwHIAlX70LL4uuAbMoRRFBDI62IYWh2bMEfStBtiIaAlol8v3CxqyEl57d3MzYT1+r8ajdF0JJLtdQXQuoiWN20W5hv53txWHGvMSvPAYv2VVuPStjOELK80VlagPrPmxcYMpaPDeUR5O1kFtpKNx2xRw7qeQ1LFOAQKdKnwBVKaXQCgHP6zoiG4Mm3zpK34hIP8KChH8BbEJMKtKRlpZMw0pB0len/eyBlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cKIqa1Ez; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=yesanishhere@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cKIqa1Ez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=yesanishhere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkWxR42H6z3bjG
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 17:14:19 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so5799271fa.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730960050; x=1731564850; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btVm5Mykpxn9NBVcKa7O3OZQLbsl76ixgLFuAuEyrk8=;
        b=cKIqa1EzI7J96W6RoPrt5yBRutvVHzODzPFwXHK53gfuzUQqoXGzynJdPbBYUa7CDS
         JBnyOo8NtiQsJ3t85rJpo0/OaZHWVKMwd8cp5IrbFxexVivSPuEi3/TcdrzMJcKRaoPd
         aWLU1GZUiJnKqJT/9UZVmTxX3dFKciaO3Ur2o93reB9qz/pH+gIHc/ptoz6+yQt9ONT3
         AnHIEQz1r3/9hV4s7zyS2ANc4NG3m0VxOCw9Dr17Akwh/ZRwWV6E8eoc2rrZ8cnHAUxQ
         jtU6y6QBd5OAgEDWYrgUSyXtFIOw7E4wB4AA2rVi1nSFpHyYLnzIr3iGfN7vox/A5C4C
         uVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730960050; x=1731564850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btVm5Mykpxn9NBVcKa7O3OZQLbsl76ixgLFuAuEyrk8=;
        b=XNXCxiwDcnQmweCRNGd2X9iMnroM9eP4zoWEuuft+/zLFD0+DMks2+lLIWHzpT29vu
         s1J5aYEjqiW0PftEq2YBbxAr+b+CF9wU7oJhXuo/LjahLnpzGsuIFFVDo+HRAHxtt3n+
         PFnZBd1hwdjVPxj+6ntr5miCqzYyyccf0afXDtgUGcVRfWIkcM/ddd+rxMAAn/bMqPgS
         0JJFBbu/VO1X2ei+SurwOUXWuuhgp8ZRI26mUcfXcDAezki4PiJlNAMjf+BjHmb/NhHC
         s34HJvJFYTCON4e0VSe/LGDsEl4JFEMb2mLNKEdOtt76o7yaLQk5w1floT6Q9K/22/TL
         Mb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt3ENBgRuRf5/M+SggFTBjo1rqoDpUTJJ4Ab830iwBe+m7t2JbLFBb+X8GdvGcDrL1NjbyKCjH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXMhma+Jg7SCJG8/wA59GvhKpkMZ/2say58xrhzUqpmzmA6JNX
	8q/+HX/vUtvVPlXj9deGvpn4fZqk2JWX0SPx/JMjwjTjU55MKNlAO80n2ddCsufuCkSZ+8wULTN
	HzJq5FV8C+0TtXXmp31Bq31xFv+g=
X-Google-Smtp-Source: AGHT+IHMI223X6qGCr8fmYduPHyJtjUsPQDeN7RLR3Tpayn0JUkD0DB6UQVKkMfMJEYKB8FM2KRLBNG5D9nNRDAA0+I=
X-Received: by 2002:a05:651c:b12:b0:2fb:441a:90d with SMTP id
 38308e7fff4ca-2fcbdfdb153mr208720571fa.21.1730960050050; Wed, 06 Nov 2024
 22:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-3-j2anfernee@gmail.com>
In-Reply-To: <20241106023916.440767-3-j2anfernee@gmail.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Wed, 6 Nov 2024 22:13:58 -0800
Message-ID: <CABCoZhB_FeELfFD-QrzX3Md7TOdhYu4CPKzQKC=Mv-RZawRgoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Eason Yang <j2anfernee@gmail.com>
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

On Tue, Nov 5, 2024 at 6:39=E2=80=AFPM Eason Yang <j2anfernee@gmail.com> wr=
ote:
>
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
>
> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
> independent alarm signals, and the all threshold values could be set for
> system protection without any timing delay. It also supports reset input
> RSTIN# to recover system from a fault condition.
>
> Currently, only single-edge mode conversion and threshold events support.
>
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/iio/adc/Kconfig   |   9 +
>  drivers/iio/adc/Makefile  |   1 +
>  drivers/iio/adc/nct720x.c | 617 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 628 insertions(+)
>  create mode 100644 drivers/iio/adc/nct720x.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68570c58e7aa..9940de0ddca2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2753,6 +2753,7 @@ F:        arch/arm/mach-npcm/
>  F:     arch/arm64/boot/dts/nuvoton/
>  F:     drivers/*/*/*npcm*
>  F:     drivers/*/*npcm*
> +F:     drivers/iio/adc/nct720x.c
>  F:     drivers/rtc/rtc-nct3018y.c
>  F:     include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>  F:     include/dt-bindings/clock/nuvoton,npcm845-clk.h
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 6c4e74420fd2..adbbf0ca6f57 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1008,6 +1008,15 @@ config NAU7802
>           To compile this driver as a module, choose M here: the
>           module will be called nau7802.
>
> +config NCT720X
> +       tristate "Nuvoton Instruments NCT7201 and NCT7202 Power Monitor"
> +       depends on I2C
> +       help
> +         If you say yes here you get support for the Nuvoton NCT7201 and
> +         NCT7202 Voltage Monitor.
> +         This driver can also be built as a module. If so, the module
> +         will be called nct720x.
> +
>  config NPCM_ADC
>         tristate "Nuvoton NPCM ADC driver"
>         depends on ARCH_NPCM || COMPILE_TEST
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 7b91cd98c0e0..f53318e5aa04 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_MESON_SARADC) +=3D meson_saradc.o
>  obj-$(CONFIG_MP2629_ADC) +=3D mp2629_adc.o
>  obj-$(CONFIG_MXS_LRADC_ADC) +=3D mxs-lradc-adc.o
>  obj-$(CONFIG_NAU7802) +=3D nau7802.o
> +obj-$(CONFIG_NCT720X) +=3D nct720x.o
>  obj-$(CONFIG_NPCM_ADC) +=3D npcm_adc.o
>  obj-$(CONFIG_PAC1921) +=3D pac1921.o
>  obj-$(CONFIG_PAC1934) +=3D pac1934.o
> diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> new file mode 100644
> index 000000000000..e589479fd06e
> --- /dev/null
> +++ b/drivers/iio/adc/nct720x.c
> @@ -0,0 +1,617 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> + *
> + * Copyright (c) 2022 Nuvoton Inc.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +
> +#define REG_CHIP_ID                    0xFD
> +#define NCT720X_ID                     0xD7
> +#define REG_VENDOR_ID                  0xFE
> +#define NUVOTON_ID                     0x50
> +#define REG_DEVICE_ID                  0xFF
> +#define NCT720X_DEVICE_ID              0x12
> +#define VIN_MAX                                12      /* Counted from 1=
 */
> +#define NCT7201_VIN_MAX                        8
> +#define NCT7202_VIN_MAX                        12
> +#define NCT720X_IN_SCALING             4995
> +
> +#define REG_INTERRUPT_STATUS_1         0x0C
> +#define REG_INTERRUPT_STATUS_2         0x0D
> +#define REG_VOLT_LOW_BYTE              0x0F
> +#define REG_CONFIGURATION              0x10
> +#define  CONFIGURATION_START           BIT(0)
> +#define  CONFIGURATION_ALERT_MSK       BIT(1)
> +#define  CONFIGURATION_CONV_RATE       BIT(2)
> +#define  CONFIGURATION_INIT            BIT(7)
> +
> +#define REG_ADVANCED_CONFIGURATION     0x11
> +#define  ADVANCED_CONF_MOD_ALERT       BIT(0)
> +#define  ADVANCED_CONF_MOD_STS         BIT(1)
> +#define  ADVANCED_CONF_FAULT_QUEUE     BIT(2)
> +#define  ADVANCED_CONF_EN_DEEP_SHUTDOWN        BIT(4)
> +#define  ADVANCED_CONF_EN_SMB_TIMEOUT  BIT(5)
> +#define  ADVANCED_CONF_MOD_RSTIN       BIT(7)
> +
> +#define REG_CHANNEL_INPUT_MODE         0x12
> +#define REG_CHANNEL_ENABLE_1           0x13
> +#define REG_CHANNEL_ENABLE_2           0x14
> +#define REG_INTERRUPT_MASK_1           0x15
> +#define REG_INTERRUPT_MASK_2           0x16
> +#define REG_BUSY_STATUS                        0x1E
> +#define REG_ONE_SHOT                   0x1F
> +#define REG_SMUS_ADDRESS               0xFC
> +
> +static const u8 REG_VIN[VIN_MAX] =3D { 0x00, 0x01, 0x02, 0x03, 0x04, 0x0=
5,
> +                                    0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B};
> +static const u8 REG_VIN_HIGH_LIMIT[VIN_MAX] =3D { 0x20, 0x22, 0x24, 0x26=
, 0x28, 0x2A,
> +                                               0x2C, 0x2E, 0x30, 0x32, 0=
x34, 0x36};
> +static const u8 REG_VIN_LOW_LIMIT[VIN_MAX] =3D { 0x21, 0x23, 0x25, 0x27,=
 0x29, 0x2B,
> +                                              0x2D, 0x2F, 0x31, 0x33, 0x=
35, 0x37};
> +static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] =3D { 0x40, 0x42, 0x44, =
0x46, 0x48, 0x4A,
> +                                                   0x4C, 0x4E, 0x50, 0x5=
2, 0x54, 0x56};
> +static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] =3D { 0x41, 0x43, 0x45, 0=
x47, 0x49, 0x4B,
> +                                                  0x4D, 0x4F, 0x51, 0x53=
, 0x55, 0x57};
> +static u8 nct720x_chan_to_index[] =3D {
> +       0,      /* Not used */
> +       0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
> +};
> +
> +
> +/* List of supported devices */
> +enum nct720x_chips {
> +       nct7201, nct7202
> +};
> +
> +struct nct720x_chip_info {
> +       struct i2c_client       *client;
> +       enum nct720x_chips      type;
> +       struct mutex            access_lock;    /* for multi-byte read an=
d write operations */
> +       int vin_max;                            /* number of VIN channels=
 */
> +       u32 vin_mask;
> +       bool use_read_byte_vin;
> +};
> +
> +static const struct iio_event_spec nct720x_events[] =3D {
> +       {
> +               .type =3D IIO_EV_TYPE_THRESH,
> +               .dir =3D IIO_EV_DIR_RISING,
> +               .mask_separate =3D BIT(IIO_EV_INFO_VALUE) |
> +                                BIT(IIO_EV_INFO_ENABLE),
> +       }, {
> +               .type =3D IIO_EV_TYPE_THRESH,
> +               .dir =3D IIO_EV_DIR_FALLING,
> +               .mask_separate =3D BIT(IIO_EV_INFO_VALUE) |
> +                                BIT(IIO_EV_INFO_ENABLE),
> +       },
> +};
> +
> +#define NCT720X_VOLTAGE_CHANNEL(chan, addr)                            \
> +       {                                                               \
> +               .type =3D IIO_VOLTAGE,                                   =
 \
> +               .indexed =3D 1,                                          =
 \
> +               .channel =3D chan,                                       =
 \
> +               .info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),    =
 \
> +               .address =3D addr,                                       =
 \
> +               .event_spec =3D nct720x_events,                          =
 \
> +               .num_event_specs =3D ARRAY_SIZE(nct720x_events),         =
 \
> +       }
> +
> +#define NCT720X_VOLTAGE_CHANNEL_DIFF(chan1, chan2, addr)               \
> +       {                                                               \
> +               .type =3D IIO_VOLTAGE,                                   =
 \
> +               .indexed =3D 1,                                          =
 \
> +               .channel =3D (chan1),                                    =
 \
> +               .channel2 =3D (chan2),                                   =
 \
> +               .differential =3D 1,                                     =
 \
> +               .info_mask_separate =3D BIT(IIO_CHAN_INFO_PROCESSED),    =
 \
> +               .address =3D addr,                                       =
 \
> +               .event_spec =3D nct720x_events,                          =
 \
> +               .num_event_specs =3D ARRAY_SIZE(nct720x_events),         =
 \
> +       }
> +
> +static const struct iio_chan_spec nct720x_channels[] =3D {
> +       NCT720X_VOLTAGE_CHANNEL(1, 1),
> +       NCT720X_VOLTAGE_CHANNEL(2, 2),
> +       NCT720X_VOLTAGE_CHANNEL(3, 3),
> +       NCT720X_VOLTAGE_CHANNEL(4, 4),
> +       NCT720X_VOLTAGE_CHANNEL(5, 5),
> +       NCT720X_VOLTAGE_CHANNEL(6, 6),
> +       NCT720X_VOLTAGE_CHANNEL(7, 7),
> +       NCT720X_VOLTAGE_CHANNEL(8, 8),
> +       NCT720X_VOLTAGE_CHANNEL(9, 9),
> +       NCT720X_VOLTAGE_CHANNEL(10, 10),
> +       NCT720X_VOLTAGE_CHANNEL(11, 11),
> +       NCT720X_VOLTAGE_CHANNEL(12, 12),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
> +       NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),
> +};
> +
> +/* Read 1-byte register. Returns unsigned byte data or -ERRNO on error. =
*/
> +static int nct720x_read_reg(struct nct720x_chip_info *chip, u8 reg)
> +{
> +       struct i2c_client *client =3D chip->client;
> +
> +       return i2c_smbus_read_byte_data(client, reg);
> +}
> +
> +/* Read 1-byte register. Returns unsigned word data or -ERRNO on error. =
*/
> +static int nct720x_read_word_swapped_reg(struct nct720x_chip_info *chip,=
 u8 reg)
> +{
> +       struct i2c_client *client =3D chip->client;
> +
> +       return i2c_smbus_read_word_swapped(client, reg);
> +}
> +
> +/*
> + * Read 2-byte register. Returns register in big-endian format or
> + * -ERRNO on error.
> + */
> +static int nct720x_read_reg16(struct nct720x_chip_info *chip, u8 reg)
> +{
> +       struct i2c_client *client =3D chip->client;
> +       int ret, low;
> +
> +       mutex_lock(&chip->access_lock);
> +       ret =3D i2c_smbus_read_byte_data(client, reg);
> +       if (ret >=3D 0) {
> +               low =3D ret;
> +               ret =3D i2c_smbus_read_byte_data(client, reg + 1);
> +               if (ret >=3D 0)
> +                       ret =3D low | (ret << 8);
> +       }
> +
> +       mutex_unlock(&chip->access_lock);
> +       return ret;
> +}
> +
> +/* Write 1-byte register. Returns 0 or -ERRNO on error. */
> +static int nct720x_write_reg(struct nct720x_chip_info *chip, u8 reg, u8 =
val)
> +{
> +       struct i2c_client *client =3D chip->client;
> +       int err;
> +
> +       err =3D i2c_smbus_write_byte_data(client, reg, val);
> +       /* wait for write command to be finished */
> +       mdelay(10);
> +
> +       return err;
> +}
> +
> +static int nct720x_read_raw(struct iio_dev *indio_dev,
> +                           struct iio_chan_spec const *chan,
> +                           int *val, int *val2, long mask)
> +{
> +       int index =3D nct720x_chan_to_index[chan->address];
> +       int v1, v2, volt, err;
> +       struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> +
> +       if (chan->type !=3D IIO_VOLTAGE)
> +               return -EOPNOTSUPP;
> +
> +       switch (mask) {
> +       case IIO_CHAN_INFO_PROCESSED:
> +               mutex_lock(&chip->access_lock);
> +               if (chip->use_read_byte_vin) {
> +                       /*
> +                        * MNTVIN Low Byte together with MNTVIN High Byte
> +                        * forms the 13-bit count value. If MNTVIN High
> +                        * Byte readout is read successively, the
> +                        * NCT7201/NCT7202 will latch the MNTVIN Low Byte
> +                        * for next read.
> +                        */
> +                       v1 =3D nct720x_read_reg(chip, REG_VIN[index]);
> +                       if (v1 < 0) {
> +                               err =3D v1;
> +                               goto abort;
> +                       }
> +
> +                       v2 =3D nct720x_read_reg(chip, REG_VOLT_LOW_BYTE);
> +                       if (v2 < 0) {
> +                               err =3D v2;
> +                               goto abort;
> +                       }
> +                       volt =3D (v1 << 8) | v2;  /* Convert back to 16-b=
it value */
> +               } else {
> +                       /* NCT7201/NCT7202 also supports read word-size d=
ata */
> +                       volt =3D nct720x_read_word_swapped_reg(chip, REG_=
VIN[index]);
> +               }
> +
> +               /* Voltage(V) =3D 13bitCountValue * 0.0004995 */
> +               volt =3D (volt >> 3) * NCT720X_IN_SCALING;
> +               *val =3D volt / 10000;
> +               mutex_unlock(&chip->access_lock);
> +               return IIO_VAL_INT;
> +       default:
> +               return -EINVAL;
> +       }
> +abort:
> +       mutex_unlock(&chip->access_lock);
> +       return err;
> +}
> +
> +static int nct720x_read_event_value(struct iio_dev *indio_dev,
> +                                   const struct iio_chan_spec *chan,
> +                                   enum iio_event_type type,
> +                                   enum iio_event_direction dir,
> +                                   enum iio_event_info info,
> +                                   int *val, int *val2)
> +{
> +       struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> +       int v1, v2, err;
> +       int volt =3D 0;
> +       int index =3D nct720x_chan_to_index[chan->address];
> +
> +       if (chan->type !=3D IIO_VOLTAGE)
> +               return -EOPNOTSUPP;
> +
> +       if (info =3D=3D IIO_EV_INFO_VALUE) {
> +               if (dir =3D=3D IIO_EV_DIR_FALLING) {
> +                       if (chip->use_read_byte_vin) {
> +                               /*
> +                                * Low limit VIN Low Byte together with L=
ow limit VIN High Byte
> +                                  forms the 13-bit count value
> +                                */
> +                               mutex_lock(&chip->access_lock);
> +                               v1 =3D nct720x_read_reg(chip, REG_VIN_LOW=
_LIMIT[index]);
> +                               if (v1 < 0) {
> +                                       err =3D v1;
> +                                       goto abort;
> +                               }
> +
> +                               v2 =3D nct720x_read_reg(chip, REG_VIN_LOW=
_LIMIT_LSB[index]);
> +                               if (v2 < 0) {
> +                                       err =3D v2;
> +                                       goto abort;
> +                               }
> +                               mutex_unlock(&chip->access_lock);
> +                               volt =3D (v1 << 8) | v2;  /* Convert back=
 to 16-bit value */
> +                       } else {
> +                               /* NCT7201/NCT7202 also supports read wor=
d-size data */
> +                               volt =3D nct720x_read_word_swapped_reg(ch=
ip,
> +                                       REG_VIN_LOW_LIMIT[index]);
> +                       }
> +               } else {
> +                       if (chip->use_read_byte_vin) {
> +                               /*
> +                                * High limit VIN Low Byte together with =
high limit VIN High Byte
> +                                * forms the 13-bit count value
> +                                */
> +                               mutex_lock(&chip->access_lock);
> +                               v1 =3D nct720x_read_reg(chip, REG_VIN_HIG=
H_LIMIT[index]);
> +                               if (v1 < 0) {
> +                                       err =3D v1;
> +                                       goto abort;
> +                               }
> +
> +                               v2 =3D nct720x_read_reg(chip, REG_VIN_HIG=
H_LIMIT_LSB[index]);
> +                               if (v2 < 0) {
> +                                       err =3D v2;
> +                                       goto abort;
> +                               }
> +                               mutex_unlock(&chip->access_lock);
> +                               volt =3D (v1 << 8) | v2;  /* Convert back=
 to 16-bit value */
> +                       } else {
> +                               /* NCT7201/NCT7202 also supports read wor=
d-size data */
> +                               volt =3D nct720x_read_word_swapped_reg(ch=
ip,
> +                                       REG_VIN_HIGH_LIMIT[index]);
> +                       }
> +               }
> +       }
> +       /* Voltage(V) =3D 13bitCountValue * 0.0004995 */
> +       volt =3D (volt >> 3) * NCT720X_IN_SCALING;
> +       *val =3D volt / 10000;
> +
> +       return IIO_VAL_INT;
> +abort:
> +       mutex_unlock(&chip->access_lock);
> +       return err;
> +}
> +
> +static int nct720x_write_event_value(struct iio_dev *indio_dev,
> +                                    const struct iio_chan_spec *chan,
> +                                    enum iio_event_type type,
> +                                    enum iio_event_direction dir,
> +                                    enum iio_event_info info,
> +                                    int val, int val2)
> +{
> +       struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> +       int index, err =3D 0;
> +       long v1, v2, volt;
> +
> +       index =3D nct720x_chan_to_index[chan->address];
> +       volt =3D (val * 10000) / NCT720X_IN_SCALING;
> +       v1 =3D volt >> 5;
> +       v2 =3D (volt & 0x1f) << 3;
> +
> +       if (chan->type !=3D IIO_VOLTAGE)
> +               return -EOPNOTSUPP;
> +
> +       if (info =3D=3D IIO_EV_INFO_VALUE) {
> +               if (dir =3D=3D IIO_EV_DIR_FALLING) {
> +                       mutex_lock(&chip->access_lock);
> +                       err =3D nct720x_write_reg(chip, REG_VIN_LOW_LIMIT=
[index], v1);
> +                       if (err < 0) {
> +                               pr_err("Failed to write REG_VIN%d_LOW_LIM=
IT\n", index + 1);
> +                               goto abort;
> +                       }
> +
> +                       err =3D nct720x_write_reg(chip, REG_VIN_LOW_LIMIT=
_LSB[index], v2);
> +                       if (err < 0) {
> +                               pr_err("Failed to write REG_VIN%d_LOW_LIM=
IT_LSB\n", index + 1);
> +                               goto abort;
> +                       }
> +               } else {
> +                       mutex_lock(&chip->access_lock);
> +                       err =3D nct720x_write_reg(chip, REG_VIN_HIGH_LIMI=
T[index], v1);
> +                       if (err < 0) {
> +                               pr_err("Failed to write REG_VIN%d_HIGH_LI=
MIT\n", index + 1);
> +                               goto abort;
> +                       }
> +
> +                       err =3D nct720x_write_reg(chip, REG_VIN_HIGH_LIMI=
T_LSB[index], v2);
> +                       if (err < 0) {
> +                               pr_err("Failed to write REG_VIN%d_HIGH_LI=
MIT_LSB\n", index + 1);
> +                               goto abort;
> +                       }
> +               }
> +       }
> +abort:
> +       mutex_unlock(&chip->access_lock);
> +       return err;
> +}
> +
> +static int nct720x_read_event_config(struct iio_dev *indio_dev,
> +                                    const struct iio_chan_spec *chan,
> +                                    enum iio_event_type type,
> +                                    enum iio_event_direction dir)
> +{
> +       struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> +       int index =3D nct720x_chan_to_index[chan->address];
> +
> +       if (chan->type !=3D IIO_VOLTAGE)
> +               return -EOPNOTSUPP;
> +
> +       return !!(chip->vin_mask & BIT(index));
> +}
> +
> +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> +                                     const struct iio_chan_spec *chan,
> +                                     enum iio_event_type type,
> +                                     enum iio_event_direction dir,
> +                                     int state)
> +{
> +       int err =3D 0;
> +       struct nct720x_chip_info *chip =3D iio_priv(indio_dev);
> +       int index =3D nct720x_chan_to_index[chan->address];
> +       unsigned int mask;
> +
> +       mask =3D BIT(index);

nitpick:
You can set the mask near to the place where it is used i.e.
just after below if statement and one added advantage will
be in case below "return -EOPNOTSUPP" gets executed,
you don't even have to set mask.

> +
> +       if (chan->type !=3D IIO_VOLTAGE)
> +               return -EOPNOTSUPP;
> +
> +       if (!state && (chip->vin_mask & mask))
> +               chip->vin_mask &=3D ~mask;
> +       else if (state && !(chip->vin_mask & mask))
> +               chip->vin_mask |=3D mask;
> +
> +       mutex_lock(&chip->access_lock);
> +
> +       err =3D nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, chip->vin_m=
ask & 0xff);
> +       if (err < 0) {
> +               pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
> +               goto abort;
> +       }
> +
> +       if (chip->type =3D=3D nct7202) {
> +               err =3D nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, chi=
p->vin_mask >> 8);
> +               if (err < 0) {
> +                       pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
> +                       goto abort;
> +               }
> +       }
> +abort:
> +       mutex_unlock(&chip->access_lock);
> +       return err;
> +}
> +
> +static int nct720x_detect(struct i2c_client *client,
> +                         struct i2c_board_info *info)
> +{
> +       struct i2c_adapter *adapter =3D client->adapter;
> +
> +       if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +                                    I2C_FUNC_SMBUS_WORD_DATA))
> +               return -ENODEV;
> +
> +       /* Determine the chip type. */
> +       if (i2c_smbus_read_byte_data(client, REG_VENDOR_ID) !=3D NUVOTON_=
ID ||
> +           i2c_smbus_read_byte_data(client, REG_CHIP_ID) !=3D NCT720X_ID=
 ||
> +           i2c_smbus_read_byte_data(client, REG_DEVICE_ID) !=3D NCT720X_=
DEVICE_ID)
> +               return -ENODEV;
> +
> +       strscpy(info->type, "nct720x", I2C_NAME_SIZE);
> +
> +       return 0;
> +}
> +
> +static const struct iio_info nct720x_info =3D {
> +       .read_raw =3D &nct720x_read_raw,
> +       .read_event_config =3D &nct720x_read_event_config,
> +       .write_event_config =3D &nct720x_write_event_config,
> +       .read_event_value =3D &nct720x_read_event_value,
> +       .write_event_value =3D &nct720x_write_event_value,
> +};
> +
> +static const struct i2c_device_id nct720x_id[];
> +
> +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> +{
> +       int value =3D 0;
> +       int err =3D 0;

Nit pick:
You don't need to initialize err and value.

> +
> +       /* Initial reset */
> +       err =3D nct720x_write_reg(chip, REG_CONFIGURATION, CONFIGURATION_=
INIT);
> +       if (err) {
> +               pr_err("Failed to write REG_CONFIGURATION\n");
> +               return err;
> +       }
> +
> +       /* Enable Channel */
> +       err =3D nct720x_write_reg(chip, REG_CHANNEL_ENABLE_1, 0xff);
> +       if (err) {
> +               pr_err("Failed to write REG_CHANNEL_ENABLE_1\n");
> +               return err;
> +       }
> +
> +       if (chip->type =3D=3D nct7202) {
> +               err =3D nct720x_write_reg(chip, REG_CHANNEL_ENABLE_2, 0xf=
);
> +               if (err) {
> +                       pr_err("Failed to write REG_CHANNEL_ENABLE_2\n");
> +                       return err;
> +               }
> +       }
> +
> +       value =3D nct720x_read_reg16(chip, REG_CHANNEL_ENABLE_1);
> +       if (value < 0)
> +               return value;
> +       chip->vin_mask =3D value;
> +
> +       /* Start monitoring if needed */
> +       value =3D nct720x_read_reg(chip, REG_CONFIGURATION);
> +       if (value < 0) {
> +               pr_err("Failed to read REG_CONFIGURATION\n");
> +               return value;
> +       }
> +
> +       value |=3D CONFIGURATION_START;
> +       err =3D nct720x_write_reg(chip, REG_CONFIGURATION, value);
> +       if (err < 0) {
> +               pr_err("Failed to write REG_CONFIGURATION\n");
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static int nct720x_probe(struct i2c_client *client)
> +{
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
> +       struct nct720x_chip_info *chip;
> +       struct iio_dev *indio_dev;
> +       int ret;
> +       u32 tmp;
> +
> +       indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*chip));
> +       if (!indio_dev)
> +               return -ENOMEM;
> +       chip =3D iio_priv(indio_dev);
> +
> +       if (client->dev.of_node)
> +               chip->type =3D (enum nct720x_chips)device_get_match_data(=
&client->dev);
> +       else
> +               chip->type =3D i2c_match_id(nct720x_id, client)->driver_d=
ata;
> +
> +       chip->vin_max =3D (chip->type =3D=3D nct7201) ? NCT7201_VIN_MAX :=
 NCT7202_VIN_MAX;
> +
> +       ret =3D of_property_read_u32(client->dev.of_node, "read-vin-data-=
size", &tmp);
> +       if (ret < 0) {
> +               pr_err("read-vin-data-size property not found\n");
> +               return ret;

nit: dev_err_probe

> +       }
> +
> +       if (tmp =3D=3D 8) {
> +               chip->use_read_byte_vin =3D true;
> +       } else if (tmp =3D=3D 16) {
> +               chip->use_read_byte_vin =3D false;
> +       } else {
> +               pr_err("invalid read-vin-data-size (%d)\n", tmp);
> +               return -EINVAL;

nit: dev_err_probe

> +       }
> +
> +       mutex_init(&chip->access_lock);
> +
> +       /* this is only used for device removal purposes */
> +       i2c_set_clientdata(client, indio_dev);
> +
> +       chip->client =3D client;
> +
> +       ret =3D nct720x_init_chip(chip);
> +       if (ret < 0)
> +               return ret;
> +
> +       indio_dev->name =3D id->name;
> +       indio_dev->channels =3D nct720x_channels;
> +       indio_dev->num_channels =3D ARRAY_SIZE(nct720x_channels);
> +       indio_dev->info =3D &nct720x_info;
> +       indio_dev->modes =3D INDIO_DIRECT_MODE;
> +
> +       iio_device_register(indio_dev);

devm_iio_device_register?

> +
> +       return 0;
> +}
> +
> +static void nct720x_remove(struct i2c_client *client)
> +{
> +       struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
> +
> +       iio_device_unregister(indio_dev);

wouldn't need if used devm_ version
> +}
> +
> +static const unsigned short nct720x_address_list[] =3D {
> +       0x1d, 0x1e, 0x35, 0x36, I2C_CLIENT_END
> +};
> +
> +static const struct i2c_device_id nct720x_id[] =3D {
> +       { "nct7201", nct7201 },
> +       { "nct7202", nct7202 },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(i2c, nct720x_id);
> +
> +static const struct of_device_id nct720x_of_match[] =3D {
> +       {
> +               .compatible =3D "nuvoton,nct7201",
> +               .data =3D (void *)nct7201
> +       },
> +       {
> +               .compatible =3D "nuvoton,nct7202",
> +               .data =3D (void *)nct7202
> +       },
> +       { },
> +};
> +
> +MODULE_DEVICE_TABLE(of, nct720x_of_match);
> +
> +static struct i2c_driver nct720x_driver =3D {
> +       .driver =3D {
> +               .name   =3D "nct720x",
> +               .of_match_table =3D nct720x_of_match,
> +       },
> +       .probe =3D nct720x_probe,
> +       .remove =3D nct720x_remove,
> +       .id_table =3D nct720x_id,
> +       .detect =3D nct720x_detect,
> +       .address_list =3D nct720x_address_list,
> +};
> +
> +module_i2c_driver(nct720x_driver);
> +
> +MODULE_AUTHOR("Eason Yang <YHYANG2@nuvoton.com>");
> +MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>
