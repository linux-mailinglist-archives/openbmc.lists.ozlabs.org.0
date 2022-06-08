Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601C542179
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHyG76tF8z3blR
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LwcksZe3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LwcksZe3;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHyFk031Qz2yL6
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:37:29 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id q15so18887448wrc.11
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Vjf7Ut96ecp+qFL+Igjj3N94InOpPESdu4w/M3rar/o=;
        b=LwcksZe3kqPWO6zui+NoeDUABhLXBaTZPQ4jQ2QoLiObpNetlSDiROaOtHwKvM8r9t
         aC7j5M/nhHJp+YG+7hsKZKrwwpy7MdZPDsOduYsCuDiT6pOluUilWKV+1Ei4u5RlxeCe
         moiDAY1hloPHmeuZ+dWmhO2zfBL4Qn2aUahfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Vjf7Ut96ecp+qFL+Igjj3N94InOpPESdu4w/M3rar/o=;
        b=D59zyQH72lfHFbHVCxsYgdg8ergfbMG6JjqW8vQvVsldlrQGNyKlPqDzYcOkiQHUgJ
         V4PGPXMIvErWZJlINHPJ/+908jpj9d2YU4KvWewZ9jkC2/CV70LeuTHJzXh6zHFJELv3
         k7lP1dc307/MO3TQYnikRuATm4qw6spPEGDScIK/uVFDrTJdP3eeBLCmxaYemYj4Ik/u
         4fwCplHEP8am+FkBu67QnlUiMYQT4Ek1ruRVQDNcjgpjX/R/xrR/L2O6aIqSrplUoNSi
         Ewkm3HqnMtMYajpcwtPv0mzOSZCvPq6HDJYn3jsb/qROyS6JYInyjbKQ0koIoiibURzD
         j3Bw==
X-Gm-Message-State: AOAM533mavkWPq1usmZXYG5LeB2zTP8Yaj/KHpXCFcdwrFxjNI80VV8L
	olj3R8MeOHkyiFLNRy7hw2IL4weOIRRqOX7nBIj6CybW
X-Google-Smtp-Source: ABdhPJwNVgd7bd4uXjwVaDLaq71+ltRj3s9gDVY/0ToNgrxXHVGcfPu8ZST+bpsDF0Y+TiR8Qq8ZvSnqnP4tyzdnuLE=
X-Received: by 2002:a5d:5686:0:b0:217:7da8:8c5a with SMTP id
 f6-20020a5d5686000000b002177da88c5amr17041341wrv.3.1654670245112; Tue, 07 Jun
 2022 23:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062803.366909-1-clg@kaod.org>
In-Reply-To: <20220608062803.366909-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 06:37:13 +0000
Message-ID: <CACPK8XcN6q7o5F+VZ_jpHxjn3kwZN_QsTpF+q4sX75oKO261iw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add a palmetto board (AST2400)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Palmettos were the first OpenPOWER systems built by Tyan with the
> product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
> processor and an Aspeed AST2400 SoC.

Good idea.

>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/arm/dts/Makefile              |   1 +
>  arch/arm/dts/ast2400-palmetto.dts  | 102 +++++++++++++++++++++++++++++
>  configs/ast2400-palmetto_defconfig |  74 +++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 arch/arm/dts/ast2400-palmetto.dts
>  create mode 100644 configs/ast2400-palmetto_defconfig
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 3515100c65ce..4faf29d747bd 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
>
>  dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         ast2400-evb.dtb \
> +       ast2400-palmetto.dtb \
>         ast2400-ahe-50dc.dtb \
>         ast2500-evb.dtb \
>         ast2600a0-evb.dtb \
> diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-pal=
metto.dts
> new file mode 100644
> index 000000000000..a512f602d2f1
> --- /dev/null
> +++ b/arch/arm/dts/ast2400-palmetto.dts
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2400-u-boot.dtsi"
> +
> +/ {
> +       model =3D "Palmetto BMC";
> +       compatible =3D "tyan,palmetto-bmc", "aspeed,ast2400";
> +
> +       memory@40000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x40000000 0x10000000>;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +       };
> +
> +       aliases {
> +               spi0 =3D &fmc;
> +               spi1 =3D &spi1;
> +               ethernet0 =3D &mac0;
> +               ethernet1 =3D &mac1;

They only had one ethernet connection.

> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency =3D <200000000>;
> +};
> +
> +&wdt1 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&wdt2 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&mac0 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
> +};
> +
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               compatible =3D "spi-flash", "sst,w25q256";

You just removed all of these :)

> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +
> +       flash@1 {
> +                compatible =3D "spi-flash", "sst,w25q256";
> +                status =3D "okay";
> +                spi-max-frequency =3D <50000000>;
> +                spi-tx-bus-width =3D <2>;
> +                spi-rx-bus-width =3D <2>;
> +        };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       flash@0 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_spi1_default>;
> +               compatible =3D "spi-flash", "sst,w25q256";

They only have one flash on each controller iirc.


> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +       flash@1 {
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_spi1_default &pinctrl_spi1cs1_def=
ault>;
> +               compatible =3D "spi-flash", "sst,w25q256";
> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> diff --git a/configs/ast2400-palmetto_defconfig b/configs/ast2400-palmett=
o_defconfig
> new file mode 100644
> index 000000000000..8802323b4db8
> --- /dev/null
> +++ b/configs/ast2400-palmetto_defconfig

Do we need a separate defconfig from the one for the evb? If not, can
we adjust the evb defconfig to suit?

Hopefully we can just build it with DEVICE_TREE=3Dast2400-palmetto and
an existing defconfig.

> @@ -0,0 +1,74 @@
> +CONFIG_ARM=3Dy
> +CONFIG_ARCH_ASPEED=3Dy
> +CONFIG_SYS_TEXT_BASE=3D0x0
> +CONFIG_ASPEED_AST2400=3Dy
> +CONFIG_SYS_MALLOC_F_LEN=3D0x800
> +CONFIG_ENV_SIZE=3D0x10000
> +CONFIG_ENV_OFFSET=3D0xF0000
> +CONFIG_NR_DRAM_BANKS=3D1
> +CONFIG_FIT=3Dy
> +CONFIG_USE_BOOTARGS=3Dy
> +CONFIG_BOOTARGS=3D"console=3DttyS4,115200n8 root=3D/dev/ram rw"
> +CONFIG_USE_BOOTCOMMAND=3Dy
> +CONFIG_BOOTCOMMAND=3D"bootm 20080000"
> +CONFIG_PRE_CONSOLE_BUFFER=3Dy
> +CONFIG_PRE_CON_BUF_ADDR=3D0x1e720000
> +CONFIG_SYS_CONSOLE_ENV_OVERWRITE=3Dy
> +CONFIG_HUSH_PARSER=3Dy
> +# CONFIG_AUTO_COMPLETE is not set
> +CONFIG_SYS_PROMPT=3D"ast# "
> +CONFIG_CMD_MEMTEST=3Dy
> +CONFIG_SYS_ALT_MEMTEST=3Dy
> +CONFIG_CMD_CLK=3Dy
> +CONFIG_CMD_GPIO=3Dy
> +CONFIG_CMD_I2C=3Dy
> +CONFIG_CMD_MMC=3Dy
> +CONFIG_CMD_SF=3Dy
> +CONFIG_CMD_DHCP=3Dy
> +CONFIG_CMD_MII=3Dy
> +CONFIG_CMD_PING=3Dy
> +CONFIG_DEFAULT_DEVICE_TREE=3D"ast2400-palmetto"
> +CONFIG_ENV_IS_IN_SPI_FLASH=3Dy
> +CONFIG_USE_ENV_SPI_BUS=3Dy
> +CONFIG_ENV_SPI_BUS=3D0
> +CONFIG_USE_ENV_SPI_CS=3Dy
> +CONFIG_ENV_SPI_CS=3D0
> +CONFIG_USE_ENV_SPI_MAX_HZ=3Dy
> +CONFIG_ENV_SPI_MAX_HZ=3D100000000
> +CONFIG_NET_RANDOM_ETHADDR=3Dy
> +CONFIG_REGMAP=3Dy
> +CONFIG_CLK=3Dy
> +CONFIG_DM_GPIO=3Dy
> +CONFIG_ASPEED_GPIO=3Dy
> +CONFIG_DM_I2C=3Dy
> +CONFIG_SYS_I2C_ASPEED=3Dy
> +CONFIG_MISC=3Dy
> +CONFIG_DM_MMC=3Dy
> +# CONFIG_MMC_HW_PARTITIONING is not set
> +CONFIG_MMC_SDHCI=3Dy
> +CONFIG_MMC_SDHCI_ASPEED=3Dy
> +CONFIG_DM_SPI_FLASH=3Dy
> +CONFIG_SPI_FLASH=3Dy
> +CONFIG_SPI_FLASH_GIGADEVICE=3Dy
> +CONFIG_SPI_FLASH_MACRONIX=3Dy
> +CONFIG_SPI_FLASH_SPANSION=3Dy
> +CONFIG_SPI_FLASH_STMICRO=3Dy
> +CONFIG_SPI_FLASH_WINBOND=3Dy
> +CONFIG_PHY_REALTEK=3Dy
> +CONFIG_PHY_NCSI=3Dy
> +CONFIG_DM_ETH=3Dy
> +CONFIG_PHY_GIGE=3Dy
> +CONFIG_FTGMAC100=3Dy
> +CONFIG_PHY=3Dy
> +CONFIG_PINCTRL=3Dy
> +CONFIG_RAM=3Dy
> +CONFIG_DM_SERIAL=3Dy
> +CONFIG_SYS_NS16550=3Dy
> +CONFIG_SPI=3Dy
> +CONFIG_DM_SPI=3Dy
> +CONFIG_SYSRESET=3Dy
> +CONFIG_TIMER=3Dy
> +CONFIG_WDT=3Dy
> +CONFIG_DM_RESET=3Dy
> +# CONFIG_CMD_BOOTEFI is not set
> +# CONFIG_EFI_LOADER is not set
> --
> 2.35.3
>
