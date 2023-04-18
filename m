Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB576E5A80
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 09:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0wcC1PW2z3fFq
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 17:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pX8C7KP1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=wangzq.jn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=pX8C7KP1;
	dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0wbb066Hz3ccs
	for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 17:31:53 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1a68f2345c5so10806125ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681803111; x=1684395111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCKV+7nDxv0Xa6tK1knBqgHRE5E/AFJnSRnlOsmuzpM=;
        b=pX8C7KP10fJm2KLDL+LUBestijtdjU6/ldyLAEyErm5LqN+v3R83yAv6Og6ASQuAXG
         f+ZD2PKl3WglrEdebQascVVk+noVYbAqioy5Cz5ftMhNtUVG6V1VQycmgFt1z8Q4q7/3
         LR3ruue4PRWFuAEYs6mb9psjq6dBD6Yh+g58ks5EsffjgbgDuDs3IW4kmyEQSPmPn7MZ
         OIBagibGXU0hnQBJNFcb5FclxIpitz9dY4vubrozVSqKt/8quXtDS+sLzaa7q9iyFbzY
         6OB/Kf+9QwDHpelLHrWFrERMY843vyy+PBBOymiAztv+ppr0JQaTmT+/b5qBNXtuYclI
         0bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803111; x=1684395111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCKV+7nDxv0Xa6tK1knBqgHRE5E/AFJnSRnlOsmuzpM=;
        b=fKDvcK20Zczca8pt1M21PgjxmYZLjHKndAFItbKM7BazC4awqxMEDUGaWlS+KjqW8F
         WsNq4fygajKmMcf3GVkM/jMjQi6V06nFNYqYbLUHcFNIVFG+lqziQcnq6FIE+C87M5ww
         i7ANvcyOd0IZoLF3oBzhWYa4qoi/ei4n39ydUwxUvPCXU3ytgRTsv++DMBO+6cLANInK
         A+8z9yhMYyb8oNHMsuc9Oi6WS8QJR7S80YEDEMYjrdwFvvAFABzXyZa9sI6r6ajzpkeb
         8hSbYEan5f80WhVUrES+f7viI1VEIgNbdAOuHuONSZSlPK5pvRgDrJ1Fgmv3xaspPAjv
         CNhg==
X-Gm-Message-State: AAQBX9c+BCzETm6S/nzYfInxS8l3RVY03ARGbhOc7CaB3iT/gDWOAXYP
	31MrIKTikfsXKrtcCpk+86lj+6IrnnfR7dEdN0Yn6MGCsUfz8ZXO
X-Google-Smtp-Source: AKy350YnxkTUjFYcP+0AQwBGh6rN1xSz1B6eDmeL7Ii1SOzt+cghLhNf3Wx/l+WfthCMkEnQXP8WJaoaUwAQY0xSTPY=
X-Received: by 2002:a17:903:2304:b0:1a6:b221:da96 with SMTP id
 d4-20020a170903230400b001a6b221da96mr460858plh.1.1681803110114; Tue, 18 Apr
 2023 00:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230418061715.124725-1-lintao1890@163.com>
In-Reply-To: <20230418061715.124725-1-lintao1890@163.com>
From: John Wang <wangzq.jn@gmail.com>
Date: Tue, 18 Apr 2023 15:31:38 +0800
Message-ID: <CAHwNHZVOF_V9MgMsD8=tVqRjYzU8C7ju4vTMRAoXznfcaCQ77Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] board: ast2600: Add
 Inspur SCM V1 board
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

<lintao1890@163.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8818=E6=97=A5=E5=91=A8=
=E4=BA=8C 14:17=E5=86=99=E9=81=93=EF=BC=9A
>
> From: LinTao <lintao.lc@inspur.com>
>
> AST2600-INSPUR is an Inspur SCM V1 board which is
> equipped with AST2600
>
> Signed-off-by: LinTao <lintao.lc@inspur.com>

Reviewed-by: John Wang <wangzhiqiang02@inspur.com>

> ---
> V1 -> V2:
>     - add a missing '\'
> ---
>  arch/arm/dts/Makefile                    |   3 +-
>  arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
>  board/aspeed/ast2600_inspur/Kconfig      |  13 ++
>  board/aspeed/ast2600_inspur/Makefile     |   1 +
>  board/aspeed/ast2600_inspur/inspur.c     |  22 +++
>  6 files changed, 236 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts
>  create mode 100644 board/aspeed/ast2600_inspur/Kconfig
>  create mode 100644 board/aspeed/ast2600_inspur/Makefile
>  create mode 100644 board/aspeed/ast2600_inspur/inspur.c
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..f62c16b4f1 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -695,7 +695,8 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb \
>         ast2600-intel.dtb \
> -       ast2600-tacoma.dtb
> +       ast2600-tacoma.dtb \
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
