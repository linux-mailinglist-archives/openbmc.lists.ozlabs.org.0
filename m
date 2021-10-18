Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6D432A67
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 01:43:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYD3c2SpLz2ynj
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 10:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=aMKPYoU1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aMKPYoU1; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYD3B5kv5z2yKy
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:43:32 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id y11so16755873qtn.13
 for <openbmc@lists.ozlabs.org>; Mon, 18 Oct 2021 16:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/cjQkBW85iP1aEz63mBbvqyzcsDxmgdngHaXbh/DAUY=;
 b=aMKPYoU1sOZcv8NUfemzcps6Breg7MjUkvuB56gy+DUDcKJ6yDthxzwWZKJFCtyWwM
 37LAlV6B/wKNYOzKHFO2QrAVjM3CSXMGxOMhgS+r3uhiK3faGkKcKedp235l+poOMSbI
 +pV4I0esjlzlgVIJ1pfir0v97VEK4GYnBK0/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/cjQkBW85iP1aEz63mBbvqyzcsDxmgdngHaXbh/DAUY=;
 b=7zMfP5SIVsPVQt0eRUhfxOBO/T73+yOSq2MjFuuiQ+MBkVVpoxlJoYDmL77cqooPcG
 45QTKV05OgKwpu60+EvwBsn3J4ZKNR4DYg0D7gQSpcZ7ftiE2MGXa/g3PL312mSerUxm
 U3jCYbgmY1VdXoN9x/ahPlkeFkaE0G83TGEHRkKjjXGwTw5gd1d/W9Cc5vSPRInrUgn9
 vhH4MtKtwOChqaEQmMq9eFJ/Rrc7LEVvvXdgmUGF8v6TjmrrVnz7nUWts48k1wVuaMA8
 Dp5QJ+CJ14yNb7h9flP9uBnMU4iUaIJFjdntBcWCwpMgnM6emI4Pem5QPt4coNy67G/q
 Uk9A==
X-Gm-Message-State: AOAM5322AI7eN5JcKHQzeBjlyCr0qtVWZaO+tP4u039M+0tLC0zzMFbQ
 l73JuhjcTz0DYd7Tb+N+eQhAG195ycloNnvAbO7V+soZ
X-Google-Smtp-Source: ABdhPJyl1qnBIxmunFgjOjS6dWq6BTgAf/kfDxGJa5c6TOovqyUNAITzuF6TPTyL3kpqdPDZ0m0eoIXDMFy44h/cWmo=
X-Received: by 2002:ac8:1107:: with SMTP id c7mr32489140qtj.392.1634600609182; 
 Mon, 18 Oct 2021 16:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <3a7fed78df06416da20ec72f14111c97@inventec.com>
 <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
In-Reply-To: <e57d58c0b44b4a289c580e188f7d5580@inventec.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Oct 2021 23:43:17 +0000
Message-ID: <CACPK8XeZ9esWimkv+RbeP3xyohzcPiUkXFhDWqB6ANjJ0aBvHw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Adding Inventec Transformers BMC
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

On Mon, 18 Oct 2021 at 22:51, Lin.TommySC =E6=9E=97=E4=B8=96=E6=AC=BD TAO
<Lin.TommySC@inventec.com> wrote:
>
> Initial introduction of Inventec Transformers x86 family equipped with AS=
T2600 BMC SoC.
>
> Signed-off-by: Tommy Lin <Lin.TommySC@inventec.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks! I've applied this to the aspeed tree (but I've already sent my
pull request for v5.16) and to the openbmc tree.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-inventec-transformers.dts  | 457 ++++++++++++++++++
>  2 files changed, 458 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dt=
s
>
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
> index 000000000000..71e85694c3c7
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-inventec-transformers.dts
> @@ -0,0 +1,457 @@
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
> +               bootargs =3D "console=3DttyS4,115200n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3=
>, <&adc0 4>;
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
> +       pwm_tacho {
> +                       status =3D "okay";
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_tac=
h0_default
> +                                                       &pinctrl_pwm1_def=
ault &pinctrl_tach1_default
> +                                                       &pinctrl_pwm2_def=
ault &pinctrl_tach2_default
> +                                                       &pinctrl_pwm3_def=
ault &pinctrl_tach3_default
> +                                                       &pinctrl_pwm4_def=
ault &pinctrl_tach4_default
> +                                                       &pinctrl_pwm5_def=
ault &pinctrl_tach5_default
> +                                                       &pinctrl_pwm6_def=
ault &pinctrl_tach6_default
> +                                                       &pinctrl_pwm7_def=
ault &pinctrl_tach7_default
> +                                                                        =
                       &pinctrl_tach8_default
> +                                                                        =
                       &pinctrl_tach9_default
> +                                                                        =
                       &pinctrl_tach10_default
> +                                                                        =
                       &pinctrl_tach11_default
> +                                                                        =
                       &pinctrl_tach12_default
> +                                                                        =
                       &pinctrl_tach13_default
> +                                                                        =
                       &pinctrl_tach14_default
> +                                                                        =
                       &pinctrl_tach15_default>;
> +               fan@0 {
> +                       reg =3D <0x00>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x00>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@1 {
> +                       reg =3D <0x01>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x01>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@2 {
> +                       reg =3D <0x02>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x02>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@3 {
> +                       reg =3D <0x03>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x03>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@4 {
> +                       reg =3D <0x04>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x04>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@5 {
> +                       reg =3D <0x05>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x05>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@6 {
> +                       reg =3D <0x06>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x06>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@7 {
> +                       reg =3D <0x07>;
> +                       aspeed,target_pwm =3D <25000>;
> +                       cooling-levels =3D <125 151 177 203 229 255>;
> +                       aspeed,fan-tach-ch =3D <0x07>;
> +                       aspeed,min_rpm =3D <750000>;
> +               };
> +
> +               fan@8 {
> +                       reg =3D <0x08>;
> +                       aspeed,fan-tach-ch =3D <0x08>;
> +               };
> +
> +               fan@9 {
> +                       reg =3D <0x09>;
> +                       aspeed,fan-tach-ch =3D <0x09>;
> +               };
> +
> +               fan@10 {
> +                       reg =3D <0x0a>;
> +                       aspeed,fan-tach-ch =3D <0x0a>;
> +               };
> +
> +               fan@11 {
> +                       reg =3D <0x0b>;
> +                       aspeed,fan-tach-ch =3D <0x0b>;
> +               };
> +
> +               fan@12 {
> +                       reg =3D <0x0c>;
> +                       aspeed,fan-tach-ch =3D <0x0c>;
> +               };
> +
> +               fan@13 {
> +                       reg =3D <0x0d>;
> +                       aspeed,fan-tach-ch =3D <0x0d>;
> +               };
> +
> +               fan@14 {
> +                       reg =3D <0x0e>;
> +                       aspeed,fan-tach-ch =3D <0x0e>;
> +               };
> +
> +               fan@15 {
> +                       reg =3D <0x0f>;
> +                       aspeed,fan-tach-ch =3D <0x0f>;
> +               };
> +       };
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <1>;
> +       };
> +};
> +
> +&mac3 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy0>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii4_default>;
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +
> +       flash@1 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc2";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bios";
> +               spi-max-frequency =3D <33000000>;
> +               spi-tx-bus-width =3D <1>;
> +               spi-rx-bus-width =3D <1>;
> +       };
> +};
> +
> +&wdt1 {
> +       status =3D "okay";
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +};
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
> +       /*B0-B7*/   "presence-ps0","power-chassis-good","","","","","pres=
ence-ps1","",
> +       /*C0-C7*/   "","","","","","","","",
> +       /*D0-D7*/   "","","","","","","","",
> +       /*E0-E7*/   "","","","","","","","",
> +       /*F0-F7*/   "","","","","power-chassis-control","","","",
> +       /*G0-G7*/   "","","jtag-mux","","","","","",
> +       /*H0-H7*/   "","","","","reset-button","power-button","","",
> +       /*I0-I7*/   "","","","","","","","",
> +       /*J0-J7*/   "","","","","","","","",
> +       /*K0-K7*/   "","","","","","","","",
> +       /*L0-L7*/   "","","","","","","","",
> +       /*M0-M7*/   "","","","","","","","",
> +       /*N0-N7*/   "","","","","","","","",
> +       /*O0-O7*/   "","","","","","","","",
> +       /*P0-P7*/   "","","","tck-mux","","","","",
> +       /*Q0-Q7*/   "","","","","","","","",
> +       /*R0-R7*/   "","","","","","","","",
> +       /*S0-S7*/   "","","","","","","","",
> +       /*T0-T7*/   "","","","","","","","",
> +       /*U0-U7*/   "","nmi-button","","","","","","",
> +       /*V0-V7*/   "","","","","power-config-full-load","","","",
> +       /*W0-W7*/   "","","","","","","","",
> +       /*X0-X7*/   "","","","","","","","",
> +       /*Y0-Y7*/   "","","","","","","","",
> +       /*Z0-Z7*/   "","","","","","","","",
> +       /*AA0-AA7*/ "","","","","","","","",
> +       /*AB0-AB7*/ "","","","","","","","",
> +       /*AC0-AC7*/ "","","","","","","","";
> +};
> +
> +&lpc_snoop {
> +       status =3D "okay";
> +       snoop-ports =3D <0x80>;
> +};
> +
> +&emmc_controller {
> +       status =3D "okay";
> +};
> +
> +&emmc {
> +       status =3D "okay";
> +       non-removable;
> +       max-frequency =3D <52000000>;
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
