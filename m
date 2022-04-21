Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10171509709
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 07:52:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkRXS68Z6z2ypD
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 15:52:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ulki7IDU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ulki7IDU; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkRX42fQmz2xBx
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 15:52:34 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id hu11so2973447qvb.7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9119zp2tzbHUAWW/8bNxhH9LYypAAc07zqBtj1rA8g=;
 b=Ulki7IDU6aVbd7qrdfhYj7MD4IwKF1Jel2bHy/qyXuTH5rIIdnQ8JZjTohTcS5xPxA
 lnycFTpMmwS3QMGGFJ83EQhQIpqh84W3MxU2pjXzZzKJ8TL4vbhWNRlZyPcKk78vaW7W
 zbv05aTSVfJpdEn5eoljXin/mnHR3I7K1v0Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9119zp2tzbHUAWW/8bNxhH9LYypAAc07zqBtj1rA8g=;
 b=TrmysdUe+7v+F76RuRk7Pf2YJNGK4ems+1lcMMDowXOTrwIIBJyVth5G+AY0kHiB6l
 qIhqUgbfGxPAzfxYIsPjI8MU6eDIOBFBpQM2g0xwkIGKkeI14HEXQ/oSswgGXMh7F6CZ
 VoZphEmgfwIV5LB1hPEB6fGFqgQBAi0W4AcJxC7mvrC7hyjiNVTbpVe0JZNqo/LYSAUG
 s/XRxWbzQfwQgHjPvkbzo068w0uu+ITphdaifDPT5u44qKNE1V5FO+aZeCe5FXaPs3fR
 mgMAGD3IIdXBnF3MVA6HSq8O9NVbpEdxrOgf+hhSVcOQjchUGqEjnOe2Jeyl4gyTWQrm
 F8Dg==
X-Gm-Message-State: AOAM53074rMjkZIMMRTknLG4qPoF1v+8NFlRl+Jl0YcdwUIiOpKjj6Q6
 pQtyFCj5IaFiXQFNaFsl6KZN3TWcZL+cjCWW3lU=
X-Google-Smtp-Source: ABdhPJzDpZhOWyHeXm6YA5zCgLUxTBMciCTuDZP9tlhnJpcv5jAB3vABjgeMMxg6DBaqs13iZcA8bQBHF6///f/ggJA=
X-Received: by 2002:ad4:53c5:0:b0:42d:7bb4:a8e8 with SMTP id
 k5-20020ad453c5000000b0042d7bb4a8e8mr17835269qvv.8.1650520350759; Wed, 20 Apr
 2022 22:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
In-Reply-To: <20220420102502.1791566-1-patrick.rudolph@9elements.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Apr 2022 05:52:18 +0000
Message-ID: <CACPK8XfuxFTrKiiuzKoQVvNWxv9zjEQd0EYAwE+jKOauzrgm8A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] arm/dts: Add Genesis3
 board
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: christian.walter@9elements.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 takken@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 Apr 2022 at 10:25, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Add IBM Genesis3 board and devicetree source file.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  arch/arm/dts/Makefile                |  1 +
>  arch/arm/dts/ibm-genesis3.dts        | 83 ++++++++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2500/Kconfig | 11 ++++
>  board/ibm/genesis3/Kconfig           | 13 +++++
>  board/ibm/genesis3/Makefile          |  1 +
>  board/ibm/genesis3/ibm_genesis3.c    |  5 ++
>  include/configs/ibm_genesis3.h       | 19 +++++++
>  7 files changed, 133 insertions(+)
>  create mode 100644 arch/arm/dts/ibm-genesis3.dts
>  create mode 100644 board/ibm/genesis3/Kconfig
>  create mode 100644 board/ibm/genesis3/Makefile
>  create mode 100644 board/ibm/genesis3/ibm_genesis3.c
>  create mode 100644 include/configs/ibm_genesis3.h
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index a79f885f54..fae23e6bc1 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2400-evb.dtb \
>         ast2500-evb.dtb \
> +       ibm-genesis3.dtb \
>         ast2600a0-evb.dtb \
>         ast2600a1-evb.dtb \
>         ast2600-bletchley.dtb \
> diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.dts
> new file mode 100644
> index 0000000000..ba610c9032
> --- /dev/null
> +++ b/arch/arm/dts/ibm-genesis3.dts
> @@ -0,0 +1,83 @@
> +/dts-v1/;
> +
> +#include "ast2500-u-boot.dtsi"
> +
> +/ {
> +        model = "IBM Genesis3";
> +        compatible = "ibm,genesis3", "aspeed,ast2500";
> +
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +       };
> +
> +       aliases {
> +               spi0 = &fmc;
> +               ethernet0 = &mac0;
> +               ethernet1 = &mac1;
> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt3 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +       timing-calibration-disabled;
> +       flash@0 {
> +               compatible = "spi-flash", "spansion,s25fl256l";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +
> +       flash@1 {
> +                compatible = "spi-flash", "spansion,s25fl256l";
> +                status = "okay";
> +                spi-max-frequency = <50000000>;
> +                spi-tx-bus-width = <2>;
> +                spi-rx-bus-width = <2>;
> +        };
> +};
> +
> diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
> index 4f992f442d..81c4fd0c2f 100644
> --- a/arch/arm/mach-aspeed/ast2500/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> @@ -15,8 +15,19 @@ config TARGET_EVB_AST2500
>           It has 512M of RAM, 32M of SPI flash, two Ethernet ports,
>           4 Serial ports, 4 USB ports, VGA port, PCIe, SD card slot,
>           20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
> +
> +config TARGET_IBM_GENESIS3
> +       bool "IBM-Genesis3"
> +       help
> +         IBM Genesis3 is an IBM evaluation board for Intel Xeon
> +         and AST2500 BMC. It has 512M of RAM, 32M of SPI flash,
> +         two Ethernet ports, 1 debug uart, 1 USB ports and 1 PCIe
> +         port connected to the PCH.
> +         It has support for JTAG, pinouts for 9 I2Cs and eSPI.

Given this is another aspeed system, would it make sense to group it
the same way we've grouped the existing boards under an "aspeed"
prefix? (The rainier system is an IBM system, FWIW).

The board file looks to be similar enough to the existing evb-ast2500.
Can you make a case for maintaining another one, or should we re-use
what's there like the other platforms have done?

> +
>  endchoice
>
>  source "board/aspeed/evb_ast2500/Kconfig"
> +source "board/ibm/genesis3/Kconfig"
>
>  endif
> diff --git a/board/ibm/genesis3/Kconfig b/board/ibm/genesis3/Kconfig
> new file mode 100644
> index 0000000000..09fe60262b
> --- /dev/null
> +++ b/board/ibm/genesis3/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_IBM_GENESIS3
> +
> +config SYS_BOARD
> +       default "genesis3"
> +
> +config SYS_VENDOR
> +       default "ibm"
> +
> +config SYS_CONFIG_NAME
> +       string "board configuration name"
> +       default "ibm_genesis3"
> +
> +endif
> diff --git a/board/ibm/genesis3/Makefile b/board/ibm/genesis3/Makefile
> new file mode 100644
> index 0000000000..2bb8917fab
> --- /dev/null
> +++ b/board/ibm/genesis3/Makefile
> @@ -0,0 +1 @@
> +obj-y += ibm_genesis3.o
> diff --git a/board/ibm/genesis3/ibm_genesis3.c b/board/ibm/genesis3/ibm_genesis3.c
> new file mode 100644
> index 0000000000..9de8531806
> --- /dev/null
> +++ b/board/ibm/genesis3/ibm_genesis3.c
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2022 9elements GmbH
> + */
> +#include <common.h>
> diff --git a/include/configs/ibm_genesis3.h b/include/configs/ibm_genesis3.h
> new file mode 100644
> index 0000000000..f40aeed8a9
> --- /dev/null
> +++ b/include/configs/ibm_genesis3.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2022 9elements GmbH.
> + */
> +
> +#ifndef __CONFIG_H
> +#define __CONFIG_H
> +
> +#include <configs/aspeed-common.h>
> +
> +#define CONFIG_SYS_MEMTEST_START       (CONFIG_SYS_SDRAM_BASE + 0x300000)
> +#define CONFIG_SYS_MEMTEST_END         (CONFIG_SYS_MEMTEST_START + 0x5000000)
> +
> +#define CONFIG_SYS_UBOOT_BASE          CONFIG_SYS_TEXT_BASE
> +
> +/* Memory Info */
> +#define CONFIG_SYS_LOAD_ADDR           0x83000000
> +
> +#endif /* __CONFIG_H */
> --
> 2.35.1
>
