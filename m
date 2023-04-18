Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0E6E58AF
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 07:41:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0t850kXbz3f6H
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 15:41:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NbyMOyWD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com; envelope-from=wangzq.jn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NbyMOyWD;
	dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0t7Y1zMKz3cDG
	for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 15:40:56 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-63b73203e0aso6060335b3a.1
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 22:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681796454; x=1684388454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caCrymdEuOahD2hsYaZJ5CMcN1vyJXb7Rf2EkmHRtL4=;
        b=NbyMOyWDSEWbPA6+8d5qrC/La7dSFyo+4d/ilE/dFz/GXmQDhvi09RU8uVfVzncL1m
         Vb3K9iK7kFS+5wkY5oKUI790TWQMloukOSwyQ/F6b6i9Sw7GtM15T0R10Bs0L9Z4czVi
         QObmtCkClFAO3OGVh/OX2dnIJGRcRpY5356bNaKFucAUW8Xq02ur1hpzk4N4ENI+rcBx
         zN3JxTfcymMHIB8oEhdTW8rhB2l1oCM+VJlvqviuVMcCLmqsD/5Jols7snbkwnAOpxXs
         UG9Uss6HFAcWy4g+huZ5nst50CyFRjTPskrNbWhmxu508O4yhc2z+lWMTcoWwImLp2jH
         kx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681796454; x=1684388454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caCrymdEuOahD2hsYaZJ5CMcN1vyJXb7Rf2EkmHRtL4=;
        b=MZV+TVF8R/RFC+gVIjtM/1IaSJ1ZEtq86j/84Sd1N6/E6t+oRFwLZK7P0Mw5eUNxvs
         x3U34k7s+dlsMXGylOPjBWgzx0UFe39EtWJdUSKtCO1tP6lmN8KYm3jdT3UpMPWFp/y9
         11hRBsflUl8iMyN7Jz4/k/JxmPmTm13g3avWCPwx6NC95yuFaXdbVCUYSYQnrTKyRcKm
         4Y0raAn9j7yrOK1PitVTG156v8vNUf+cKaRTFxhUKAwX7XV1xlUHsWt5jYHlkkZ/P28y
         VyvZ15vR31ltWpOg5YVgWkz8zWPu4xzrYj+/+xqLqu/EP74G12LYuuVniZz7qz3SE+/x
         YvaQ==
X-Gm-Message-State: AAQBX9cMI7Yx9/6BEIakCKsYcQhoUDNtCP4cjYXFszAHRc3N04h9i+of
	xuzEKjcrSxlboNRiJeX9kFpoND71NeFJehXTJy8TIAU1xHxJFALq
X-Google-Smtp-Source: AKy350aav7PlpCOkltOVNzDTVRrug2Ykz68jvjIrs4GvYiaw+S83zIQZmw/Xr+C4Zwu+DOYUaaJ7vjHlB8RkjymIx20=
X-Received: by 2002:a63:408:0:b0:51f:71a1:9 with SMTP id 8-20020a630408000000b0051f71a10009mr170535pge.0.1681796454468;
 Mon, 17 Apr 2023 22:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230329010006.2455193-1-lintao1890@163.com>
In-Reply-To: <20230329010006.2455193-1-lintao1890@163.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Tue, 18 Apr 2023 13:40:43 +0800
Message-ID: <CAHwNHZU+QygH42SXueuc=kKOg7Vcp3642nW9fZxi3oGB23KUZw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] board: ast2600: Add Inspur
 SCM V1 board
To: lintao1890@163.com
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
Cc: LinTao <lintao.lc@inspur.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<lintao1890@163.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8829=E6=97=A5=E5=91=A8=
=E4=B8=89 09:15=E5=86=99=E9=81=93=EF=BC=9A
>
> From: LinTao <lintao.lc@inspur.com>
>
> AST2600-INSPUR is an Inspur SCM V1 board which is
> equipped with AST2600
>
> Signed-off-by: LinTao <lintao.lc@inspur.com>
> ---
>  arch/arm/dts/Makefile                    |   1 +
>  arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
>  board/aspeed/ast2600_inspur/Kconfig      |  13 ++
>  board/aspeed/ast2600_inspur/Makefile     |   1 +
>  board/aspeed/ast2600_inspur/inspur.c     |  22 +++
>  6 files changed, 235 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts
>  create mode 100644 board/aspeed/ast2600_inspur/Kconfig
>  create mode 100644 board/aspeed/ast2600_inspur/Makefile
>  create mode 100644 board/aspeed/ast2600_inspur/inspur.c
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..5632b599da 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -696,6 +696,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         ast2600-tacoma.dtb \
>         ast2600-intel.dtb \
>         ast2600-tacoma.dtb

\ is missed, shoudle be "ast2600-tacoma.dtb \"

> +       ast2600-inspur-nf5280m7.dtb
>
>  dtb-$(CONFIG_ARCH_STI) +=3D stih410-b2260.dtb
>
> diff --git a/arch/arm/dts/ast2600-inspur-nf5280m7.dts b/arch/arm/dts/ast2=
600-inspur-nf5280m7.dts
> new file mode 100644
> index 0000000000..8210797868
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2023 Inspur Corp.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model =3D "Inspur SCM V1";
> +       compatible =3D "inspur,nf5280m7-bmc", "aspeed,ast2600";
> +
> +       memory {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x40000000>;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +       };
> +
> +       aliases {
> +               mmc0 =3D &emmc_slot0;
> +               mmc1 =3D &sdhci_slot0;
> +               mmc2 =3D &sdhci_slot1;
> +               spi0 =3D &fmc;
> +               spi1 =3D &spi1;
> +               spi2 =3D &spi2;
> +               ethernet1 =3D &mac1;
> +       };
> +
> +       cpus {
> +               cpu@0 {
> +                       clock-frequency =3D <1200000000>;
> +               };
> +               cpu@1 {
> +                       clock-frequency =3D <1200000000>;
> +               };
> +       };
> +};
> +
> +&gpio0 {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart2 {
> +       status =3D "okay";
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency =3D <400000000>;
> +};
> +
> +&mdio {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mdio2_default>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       ethphy0: ethernet-phy@0 {
> +               reg =3D <0>;
> +       };
> +
> +       ethphy1: ethernet-phy@1 {
> +               reg =3D <0>;
> +       };
> +
> +       ethphy2: ethernet-phy@2 {
> +               reg =3D <0>;
> +       };
> +
> +       ethphy3: ethernet-phy@3 {
> +               reg =3D <0>;
> +       };
> +};
> +
> +&mac1 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy1>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii2_default>;
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> +       flash@0 {
> +               status =3D "okay";
> +               spi-max-frequency =3D <40000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +       };
> +       flash@1 {
> +               status =3D "okay";
> +               spi-max-frequency =3D <40000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +       };
> +};
> +
> +&i2c1 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c2_default>;
> +};
> +
> +&i2c4 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c8_default>;
> +};
> +
> +&i2c8 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c9_default>;
> +};
> +
> +&i2c9 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c10_default>;
> +};
> +
> +&i2c12 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c13_default>;
> +};
> +
> +&i2c13 {
> +       status =3D "okay";
> +       multi-master;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c14_default>;
> +};
> +
> +&hace {
> +       u-boot,dm-pre-reloc;
> +       status =3D "okay";
> +};
> +
> +&acry {
> +       u-boot,dm-pre-reloc;
> +       status =3D "disabled";
> +};
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/=
ast2600/Kconfig
> index f5852afa77..db177399b9 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -51,6 +51,13 @@ config TARGET_QUALCOMM_DC_SCM_V1
>           QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
>           equipped with AST2600.
>
> +config TARGET_AST2600_INSPUR
> +       bool "AST2600-INSPUR"
> +       depends on ASPEED_AST2600
> +       help
> +         AST2600-INSPUR is an Inspur SCM V1 board which is
> +         equipped with AST2600.
> +
>  endchoice
>
>  source "board/aspeed/evb_ast2600/Kconfig"
> @@ -59,5 +66,6 @@ source "board/aspeed/slt_ast2600/Kconfig"
>  source "board/aspeed/ast2600_ibm/Kconfig"
>  source "board/aspeed/ast2600_intel/Kconfig"
>  source "board/qualcomm/dc-scm-v1/Kconfig"
> +source "board/aspeed/ast2600_inspur/Kconfig"
>
>  endif
> diff --git a/board/aspeed/ast2600_inspur/Kconfig b/board/aspeed/ast2600_i=
nspur/Kconfig
> new file mode 100644
> index 0000000000..ef11a01bcc
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_AST2600_INSPUR
> +
> +config SYS_BOARD
> +       default "ast2600_inspur"
> +
> +config SYS_VENDOR
> +       default "aspeed"
> +
> +config SYS_CONFIG_NAME
> +       string "board configuration name"
> +       default "ast2600_inspur"
> +
> +endif
> diff --git a/board/aspeed/ast2600_inspur/Makefile b/board/aspeed/ast2600_=
inspur/Makefile
> new file mode 100644
> index 0000000000..8af8692f3c
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/Makefile
> @@ -0,0 +1 @@
> +obj-y +=3D inspur.o
> diff --git a/board/aspeed/ast2600_inspur/inspur.c b/board/aspeed/ast2600_=
inspur/inspur.c
> new file mode 100644
> index 0000000000..044a7c17c1
> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/inspur.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2023 Inspur Corp.
> + */
> +
> +#include <common.h>
> +#include <asm/io.h>
> +
> +#define AST_GPIO_BASE          (0x1E780000)
> +#define AST_GPIOABCD_DRCTN     (AST_GPIO_BASE + 0x004)
> +
> +int board_late_init(void)
> +{
> +       u32 direction;
> +
> +       /* GPIOB[2] output*/
> +       direction =3D readl(AST_GPIOABCD_DRCTN);
> +       direction |=3D 0x700;
> +       writel(direction, AST_GPIOABCD_DRCTN);
> +
> +       return 0;
> +}
> --
> 2.34.1
>
