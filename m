Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9CB50EE83
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:08:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQKQ4z02z2yZf
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:08:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=V4v6MKWt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=V4v6MKWt; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW6q3lYQz2xt3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:34:27 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id s17so4178733plg.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VsuyU6nSVEn6saQ85jhhiz/tALxTbVghCiMM/dWmjQA=;
 b=V4v6MKWtw/I4NmoJpvk3IxXFGTi4b8XhsGfhXiSRrloIIM0i19ksnAnC50opLUG6M2
 i/dVqUyXhmXNwPlvqtQI3btdlBmfXBU0O8rD71IglEI7B4syA31xP2faXgwK+HF9R+Oa
 8URKSZo+N4+cOMPZQbLPi0FrQ9qq705w5aJ16NWFN3TexarNCpn9QGnAEjK/XHmwHbue
 yn6c1Y6fgynDANnF4UNyvCQ/OerxRnLOZ6Z6JjvS/S07vl9AD64ERrMSU+D00YIefpB7
 nqCCzGP6ijddKSXqCBwL6c61CMNs1doqNx4pQPRhaCaubBoOHRj4mNDplUUpe5w1InBO
 K15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VsuyU6nSVEn6saQ85jhhiz/tALxTbVghCiMM/dWmjQA=;
 b=2u6yBpmlK+xkrwP2bezZIyIzID+Jjryy+fnQ8Cgn13h+yLh9vEcOjnwH9iryTDW3kl
 Sn41nCWP8pGy4Oq3kXOVyuDHqubmf8JU4GFByL2PSEgi4TQvEeSLIwQqAL0AG66aTq7G
 bRGPgJ/EIy3tcPOmKRBMMi4IcU2Q3BMv66BiA12U+IFTRq8LI7wfsByYeVYWM7xBzO94
 kTUNDbukuKt9bCDmDZB6EsrzmscITffxEfHU9zDMkgKflJakxt8DUDsktM6rPLUkxtEb
 QECCGf23EjlA4x+E8RS8t9RGMC6MOBQtvpiyOVlsJtuO/E2VtQn4hPEi84uZIC9AxfGN
 8LOw==
X-Gm-Message-State: AOAM531OmGdFzhu0cjco7BW3Ezh//d/knsaeXvVMQlsDRuGq2gn4CH1X
 JW00LdT9EoqXn1e6zFddWYLJuQBffHQMk9e0CC0ioQ==
X-Google-Smtp-Source: ABdhPJy+9xUpIQmRtKANf+SIMqUV4bLIgz5mCEPMvViD/KP/K84TyNDK5TIYhw1pc/EbN+xN/gqpHGMVnaBQoKs5VQo=
X-Received: by 2002:a17:90a:c504:b0:1bf:6d9f:65a6 with SMTP id
 k4-20020a17090ac50400b001bf6d9f65a6mr9062226pjt.204.1650530064283; Thu, 21
 Apr 2022 01:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
 <CACPK8XfuxFTrKiiuzKoQVvNWxv9zjEQd0EYAwE+jKOauzrgm8A@mail.gmail.com>
In-Reply-To: <CACPK8XfuxFTrKiiuzKoQVvNWxv9zjEQd0EYAwE+jKOauzrgm8A@mail.gmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Thu, 21 Apr 2022 10:34:13 +0200
Message-ID: <CALNFmy2FTUP2f3J2twjra3sgEfuy3wQd9vZ0RKPYfqyRrCHYPg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] arm/dts: Add Genesis3
 board
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
Cc: Christian Walter <christian.walter@9elements.com>, openbmc@lists.ozlabs.org,
 Todd Takken <takken@us.ibm.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,
Thanks for the feedback. I fixed the DTS issues and dropped the mainboard s=
tub.

Regards,
Patrick Rudolph
B.Sc. Electrical Engineering
System Firmware Developer

9elements GmbH, Kortumstra=C3=9Fe 19-21, 44787 Bochum, Germany
Email: patrick.rudolph@9elements.com
Phone:  +49 234 68 94 188

Sitz der Gesellschaft: Bochum
Handelsregister: Amtsgericht Bochum, HRB 17519
Gesch=C3=A4ftsf=C3=BChrung: Sebastian Deutsch, Eray Basar

Datenschutzhinweise nach Art. 13 DSGVO


On Thu, Apr 21, 2022 at 7:52 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 20 Apr 2022 at 10:25, Patrick Rudolph
> <patrick.rudolph@9elements.com> wrote:
> >
> > Add IBM Genesis3 board and devicetree source file.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > ---
> >  arch/arm/dts/Makefile                |  1 +
> >  arch/arm/dts/ibm-genesis3.dts        | 83 ++++++++++++++++++++++++++++
> >  arch/arm/mach-aspeed/ast2500/Kconfig | 11 ++++
> >  board/ibm/genesis3/Kconfig           | 13 +++++
> >  board/ibm/genesis3/Makefile          |  1 +
> >  board/ibm/genesis3/ibm_genesis3.c    |  5 ++
> >  include/configs/ibm_genesis3.h       | 19 +++++++
> >  7 files changed, 133 insertions(+)
> >  create mode 100644 arch/arm/dts/ibm-genesis3.dts
> >  create mode 100644 board/ibm/genesis3/Kconfig
> >  create mode 100644 board/ibm/genesis3/Makefile
> >  create mode 100644 board/ibm/genesis3/ibm_genesis3.c
> >  create mode 100644 include/configs/ibm_genesis3.h
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index a79f885f54..fae23e6bc1 100755
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
> >  dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >         ast2400-evb.dtb \
> >         ast2500-evb.dtb \
> > +       ibm-genesis3.dtb \
> >         ast2600a0-evb.dtb \
> >         ast2600a1-evb.dtb \
> >         ast2600-bletchley.dtb \
> > diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.=
dts
> > new file mode 100644
> > index 0000000000..ba610c9032
> > --- /dev/null
> > +++ b/arch/arm/dts/ibm-genesis3.dts
> > @@ -0,0 +1,83 @@
> > +/dts-v1/;
> > +
> > +#include "ast2500-u-boot.dtsi"
> > +
> > +/ {
> > +        model =3D "IBM Genesis3";
> > +        compatible =3D "ibm,genesis3", "aspeed,ast2500";
> > +
> > +       memory {
> > +               device_type =3D "memory";
> > +               reg =3D <0x80000000 0x20000000>;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path =3D &uart5;
> > +       };
> > +
> > +       aliases {
> > +               spi0 =3D &fmc;
> > +               ethernet0 =3D &mac0;
> > +               ethernet1 =3D &mac1;
> > +       };
> > +};
> > +
> > +&uart5 {
> > +       u-boot,dm-pre-reloc;
> > +       status =3D "okay";
> > +};
> > +
> > +&sdrammc {
> > +       clock-frequency =3D <400000000>;
> > +};
> > +
> > +&wdt1 {
> > +       u-boot,dm-pre-reloc;
> > +       status =3D "okay";
> > +};
> > +
> > +&wdt2 {
> > +       u-boot,dm-pre-reloc;
> > +       status =3D "okay";
> > +};
> > +
> > +&wdt3 {
> > +       u-boot,dm-pre-reloc;
> > +       status =3D "okay";
> > +};
> > +
> > +&mac0 {
> > +       status =3D "okay";
> > +       phy-mode =3D "rgmii";
> > +
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_mac1link_default &pinctrl_mdio1_default=
>;
> > +};
> > +
> > +&mac1 {
> > +       status =3D "okay";
> > +       phy-mode =3D "rgmii";
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&pinctrl_mac2link_default &pinctrl_mdio2_default=
>;
> > +};
> > +
> > +&fmc {
> > +       status =3D "okay";
> > +       timing-calibration-disabled;
> > +       flash@0 {
> > +               compatible =3D "spi-flash", "spansion,s25fl256l";
> > +               status =3D "okay";
> > +               spi-max-frequency =3D <50000000>;
> > +               spi-tx-bus-width =3D <2>;
> > +               spi-rx-bus-width =3D <2>;
> > +       };
> > +
> > +       flash@1 {
> > +                compatible =3D "spi-flash", "spansion,s25fl256l";
> > +                status =3D "okay";
> > +                spi-max-frequency =3D <50000000>;
> > +                spi-tx-bus-width =3D <2>;
> > +                spi-rx-bus-width =3D <2>;
> > +        };
> > +};
> > +
> > diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspee=
d/ast2500/Kconfig
> > index 4f992f442d..81c4fd0c2f 100644
> > --- a/arch/arm/mach-aspeed/ast2500/Kconfig
> > +++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> > @@ -15,8 +15,19 @@ config TARGET_EVB_AST2500
> >           It has 512M of RAM, 32M of SPI flash, two Ethernet ports,
> >           4 Serial ports, 4 USB ports, VGA port, PCIe, SD card slot,
> >           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
> > +
> > +config TARGET_IBM_GENESIS3
> > +       bool "IBM-Genesis3"
> > +       help
> > +         IBM Genesis3 is an IBM evaluation board for Intel Xeon
> > +         and AST2500 BMC. It has 512M of RAM, 32M of SPI flash,
> > +         two Ethernet ports, 1 debug uart, 1 USB ports and 1 PCIe
> > +         port connected to the PCH.
> > +         It has support for JTAG, pinouts for 9 I2Cs and eSPI.
>
> Given this is another aspeed system, would it make sense to group it
> the same way we've grouped the existing boards under an "aspeed"
> prefix? (The rainier system is an IBM system, FWIW).
>
> The board file looks to be similar enough to the existing evb-ast2500.
> Can you make a case for maintaining another one, or should we re-use
> what's there like the other platforms have done?
>
> > +
> >  endchoice
> >
> >  source "board/aspeed/evb_ast2500/Kconfig"
> > +source "board/ibm/genesis3/Kconfig"
> >
> >  endif
> > diff --git a/board/ibm/genesis3/Kconfig b/board/ibm/genesis3/Kconfig
> > new file mode 100644
> > index 0000000000..09fe60262b
> > --- /dev/null
> > +++ b/board/ibm/genesis3/Kconfig
> > @@ -0,0 +1,13 @@
> > +if TARGET_IBM_GENESIS3
> > +
> > +config SYS_BOARD
> > +       default "genesis3"
> > +
> > +config SYS_VENDOR
> > +       default "ibm"
> > +
> > +config SYS_CONFIG_NAME
> > +       string "board configuration name"
> > +       default "ibm_genesis3"
> > +
> > +endif
> > diff --git a/board/ibm/genesis3/Makefile b/board/ibm/genesis3/Makefile
> > new file mode 100644
> > index 0000000000..2bb8917fab
> > --- /dev/null
> > +++ b/board/ibm/genesis3/Makefile
> > @@ -0,0 +1 @@
> > +obj-y +=3D ibm_genesis3.o
> > diff --git a/board/ibm/genesis3/ibm_genesis3.c b/board/ibm/genesis3/ibm=
_genesis3.c
> > new file mode 100644
> > index 0000000000..9de8531806
> > --- /dev/null
> > +++ b/board/ibm/genesis3/ibm_genesis3.c
> > @@ -0,0 +1,5 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (c) 2022 9elements GmbH
> > + */
> > +#include <common.h>
> > diff --git a/include/configs/ibm_genesis3.h b/include/configs/ibm_genes=
is3.h
> > new file mode 100644
> > index 0000000000..f40aeed8a9
> > --- /dev/null
> > +++ b/include/configs/ibm_genesis3.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2022 9elements GmbH.
> > + */
> > +
> > +#ifndef __CONFIG_H
> > +#define __CONFIG_H
> > +
> > +#include <configs/aspeed-common.h>
> > +
> > +#define CONFIG_SYS_MEMTEST_START       (CONFIG_SYS_SDRAM_BASE + 0x3000=
00)
> > +#define CONFIG_SYS_MEMTEST_END         (CONFIG_SYS_MEMTEST_START + 0x5=
000000)
> > +
> > +#define CONFIG_SYS_UBOOT_BASE          CONFIG_SYS_TEXT_BASE
> > +
> > +/* Memory Info */
> > +#define CONFIG_SYS_LOAD_ADDR           0x83000000
> > +
> > +#endif /* __CONFIG_H */
> > --
> > 2.35.1
> >
