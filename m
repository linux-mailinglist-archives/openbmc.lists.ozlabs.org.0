Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4386842384D
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 08:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPQ160mW2z2xtf
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 17:44:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kKVhwp0h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f35;
 helo=mail-qv1-xf35.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kKVhwp0h; dkim-atps=neutral
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPQ0j6htzz2xt9
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 17:44:19 +1100 (AEDT)
Received: by mail-qv1-xf35.google.com with SMTP id cv2so1249002qvb.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Oct 2021 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vp0VMYCyu34/pVqCJ8anIDxqwTfANfRnKKzZc1jtOaE=;
 b=kKVhwp0hUtX93PSdJLNwANn5RW5ZCbb1soGeGDTA32qOm+a+U1ULIVIdwBB6rQUQBm
 3CWeo6XNvMAKUM5cd53DVUslka80xy3uib6gy/+vzFIlVVArEENP0jbNDOWFkXS4f67h
 lVH2aDwOpJ0A/DhLwZgejs16kMtxmhigy9qSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vp0VMYCyu34/pVqCJ8anIDxqwTfANfRnKKzZc1jtOaE=;
 b=tHiijmBdW7viLU8Gr4xLV/Dok9B5n7VlBTRMMiAt1oz1joSGAoDRw5oWpQEWhMmok3
 am15DqTflbTh7GRZFgyDu3r5WE9ekrzj/zq+hgxrnLuf+Bw9ajq/ZPg+yE/zhjMmCJKO
 qhBT7b/EkpzlK/u4xm8bVFZORMxOnG0tq1Gj/x+PnXStjprjkAAcpsCZJbbZORNG1uJ4
 Ct8jb0RAM662L0TvmV5t6lvpGIQDtFDb4+kD9ibZdrzpSQPAe/SWA4tr9nrDCYYv7RL1
 U991Xg/sXu9mI/kNBqX8g3xwwNkSOYW3a2K4/WYiRFDkHgpN1AcvVjyhO5iglGiBCrIW
 uQrw==
X-Gm-Message-State: AOAM530Byr6eLpf4ND1uyhlPdiEiqoFHbcb8ntLjnFSxMa4BjJPFMhdr
 psOfEoztVe/5+yvVDalRsHEQnlMJmG9eg+2+1JWoSPTXSyU=
X-Google-Smtp-Source: ABdhPJwS47SdKM8u4JzvmMxEVDRFRof4PY8z7VeaBKhR8yvO16xuh8/a5xzipPC80aV+3iVqYonttH+tBKVVcG+fgL4=
X-Received: by 2002:a0c:f683:: with SMTP id p3mr3362595qvn.17.1633502655242;
 Tue, 05 Oct 2021 23:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <368f464087a749deaf32653eb96756d1@inventec.com>
 <35a427ea453a46d795900b6609c5ecfb@inventec.com>
In-Reply-To: <35a427ea453a46d795900b6609c5ecfb@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Oct 2021 06:44:03 +0000
Message-ID: <CACPK8Xc4gcVgMRtSrfwmcKAjoPt6qtWBM90T=0HT=HVfTrO_sA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Inventec Transformers BMC
To: =?UTF-8?B?TGluLlRvbW15U0Mg5p6X5LiW5qy9IFRBTw==?= <Lin.TommySC@inventec.com>
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 Aug 2021 at 05:45, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> Initial introduction of Inventec Transformers family equipped with Aspeed=
 2600 BMC SoC.

I assume this is an x86 server? Mentioning details like this is useful
for review, but is not required.

>
> Signed-off-by: Lin.TommySC <lin.tommysc@inventec.com>

Ensure your author name is set correctly:

git config --global user.anime "Lin Tommy SC" (or whatever spelling
makes sense).

> ---
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-inventec-transformers.dts  | 486 ++++++++++++++++++
>  3 files changed, 489 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt=
s
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 355b81148b85..28c068ed0a75 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -507,6 +507,8 @@ patternProperties:
>      description: Inter Control Group
>    "^invensense,.*":
>      description: InvenSense Inc.
> +  "^inventec,.*":
> +    description: Inventec Corporation

Please send this change in a separate patch.

>    "^inversepath,.*":
>      description: Inverse Path
>    "^iom,.*":
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 48d48c85de9e..930b8ba6c3c5 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1407,6 +1407,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-bmc-inspur-fp5280g2.dtb \
>         aspeed-bmc-inspur-nf5280m6.dtb \
> +       aspeed-bmc-inventec-transformers.dtb \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-lenovo-hr855xg2.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts b/arc=
h/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
> new file mode 100644
> index 000000000000..4ff28d1439cd
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
> @@ -0,0 +1,486 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2021 Inventec Corp.
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include "aspeed-g6-pinctrl.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "TRANSFORMERS BMC";
> +       compatible =3D "inventec,transformer-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3Dtty0 console=3DttyS4,115200n8 roo=
t=3D/dev/ram rw init=3D/linuxrc";

Are you sure this is correct? The console options are ok, but the
others are often not required.

> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               gfx_memory: framebuffer {

Does your machine run code on the BMC to output to the display without
the host? That is what this is for.

> +                       size =3D <0x01000000>;
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: video {
> +                       size =3D <0x04000000>;
> +                       alignment =3D <0x01000000>;
> +                       compatible =3D "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               ssp_memory: ssp_memory {

What is ssp, out of interest?

> +                       size =3D <0x00200000>;
> +                       alignment =3D <0x00100000>;
> +                       compatible =3D "shared-dma-pool";
> +                       no-map;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";

This doesn't make sense without an io-channels property.

> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               // UID led
> +               uid {
> +                       label =3D "UID_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_L=
OW>;
> +               };
> +
> +               // Heart beat led
> +               heartbeat {
> +                       label =3D "HB_LED";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +               };
> +       };
> +

> +&i2c0 {
> +       status =3D "okay";
> +
> +       //Set bmc' slave address;
> +       bmc_slave@10 {
> +               compatible =3D "ipmb-dev";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c2 {
> +       status =3D "okay";
> +};
> +
> +&i2c3 {
> +       // FRU AT24C512C-SSHM-T
> +       status =3D "okay";
> +       eeprom@50 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x50>;
> +               pagesize =3D <128>;
> +       };
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +
> +       tmp75@49 {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x49>;
> +       };
> +
> +       tmp75@4f {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x4f>;
> +       };
> +
> +       tmp468@48 {
> +               compatible =3D "ti,tmp468";
> +               reg =3D <0x48>;
> +       };
> +};
> +
> +&i2c7 {
> +       status =3D "okay";
> +       adm1278@40 {
> +               compatible =3D "adi,adm1278";
> +               reg =3D <0x40>;
> +       };
> +};
> +
> +
> +&i2c8 {
> +       // FRU AT24C512C-SSHM-T
> +       status =3D "okay";
> +
> +       eeprom@51 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x51>;
> +               pagesize =3D <128>;
> +       };
> +
> +       eeprom@53 {
> +               compatible =3D "atmel,24c512";
> +               reg =3D <0x53>;
> +               pagesize =3D <128>;
> +       };
> +};
> +
> +&i2c9 {
> +       // M.2
> +       status =3D "okay";
> +};
> +
> +&i2c10 {
> +       // I2C EXPANDER
> +       status =3D "okay";
> +
> +       i2c-switch@71 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x71>;
> +       };
> +
> +       i2c-switch@73 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x73>;
> +       };
> +};
> +
> +&i2c11 {
> +       // I2C EXPANDER
> +       status =3D "okay";
> +
> +       i2c-switch@70 {
> +               compatible =3D "nxp,pca9544";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x70>;
> +
> +               pcie_eeprom_riser1: i2c@0 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <0>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +
> +               pcie_eeprom_riser2: i2c@1 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <1>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +
> +               pcie_eeprom_riser3: i2c@2 {
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       reg =3D <2>;
> +
> +                       eeprom@55 {
> +                               compatible =3D "atmel,24c512";
> +                               reg =3D <0x55>;
> +                               pagesize =3D <128>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c12 {
> +       status =3D "okay";
> +
> +       psu0:psu0@58 {
> +               compatible =3D "pmbus";
> +               reg =3D <0x58>;
> +       };
> +};
> +
> +&gpio0 {
> +       status =3D "okay";
> +       gpio-line-names =3D
> +       /*A0-A7*/   "","","","","","","","",
> +       /*B0-B7*/   "I2C_HSC_ALERT","BMC_READY","","","","","PSU1_ALERT",=
"",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*F0-F7*/   "","","","","RST_BMC_SGPIO","","","",
> +       /*G0-G7*/   "","","JTAG_MUX_SEL","","","","","",
> +       /*H0-H7*/   "","","","","RESET_OUT","POWER_OUT","","",
> +       /*I0-I7*/   "","","","","","","NMI_OUT","",
> +       /*J0-J7*/   "","","","","","","","",
> +       /*K0-K7*/   "","","","","","","","",
> +       /*L0-L7*/   "","","","","","","","",
> +       /*M0-M7*/   "","","","","","","","",
> +       /*N0-N7*/   "","","","","","","","",
> +       /*O0-O7*/   "","","","","","","","",
> +       /*P0-P7*/   "","","","TCK_MUX_SEL","BMC_ASD_JTAG_EN","","PREQ_N",=
"",
> +       /*Q0-Q7*/   "","","","","","","","",
> +       /*R0-R7*/   "","","","","","","","",
> +       /*S0-S7*/   "","","","","","","PCH_THERMTRIP","",
> +       /*T0-T7*/   "","","","","","","","",
> +       /*U0-U7*/   "","NMI_BUTTON","","","","","","",
> +       /*V0-V7*/   "","","","","PS_PWROK","","","PRDY_N",
> +       /*W0-W7*/   "","","","","","","","",
> +       /*X0-X7*/   "","","","CPLD_CATERR","","","","",
> +       /*Y0-Y7*/   "","","","","","","","",
> +       /*Z0-Z7*/   "","","","","","","","",
> +       /*AA0-AA7*/ "","","","","","","","",
> +       /*AB0-AB7*/ "","","","","","","","",
> +       /*AC0-AC7*/ "","","","","","","","";

Is this machine going to run openbmc?

If yes, please review this document and ensure your naming follows the
recommendations:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming=
.md


> +};
> +
> +&lpc_snoop {
> +       status =3D "okay";
> +       snoop-ports =3D <0x80>;
> +};
> +
> +&emmc_controller {
> +       status =3D "okay";
> +       timing-phase =3D <0x700FF>;

This is not the correct style for the upstream driver, please see the bindi=
ngs:

Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
Documentation/devicetree/bindings/mmc/mmc-controller.yaml

I find them hard to understand, so you may want to compare to other
machines in the tree:

arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts

&emmc {
        status =3D "okay";
        clk-phase-mmc-hs200 =3D <180>, <180>;
};


> +};
> +
> +&emmc {
> +       status =3D "okay";
> +
> +       non-removable;
> +       max-frequency =3D <52000000>;
> +       sdhci-drive-type =3D /bits/ 8 <3>;
> +       bus-width =3D <8>;
> +};
> +
> +&vhub {
> +       status =3D "okay";
> +       aspeed,vhub-downstream-ports =3D <7>;
> +       aspeed,vhub-generic-endpoints =3D <21>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_usb2ad_default>;
> +};
> +
> +&rtc {
> +       status =3D "okay";
> +};
> --
> 2.33.0
>
