Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5F088BC00
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 09:11:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nSYmoBPD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3jDc1ylZz3dS4
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 19:11:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nSYmoBPD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3jD16FQYz3cCb
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 19:10:40 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a470d7f77eeso656323466b.3
        for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711440636; x=1712045436; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+WnMi/tQvJVw+PkC+MT75+pD+MW/jTUSE36/wh7EC4U=;
        b=nSYmoBPDuakaS5OOA3MFgqyL+kO2bGbyjtMihtf2eW/fj1JL6zPP3gMtEMhU/8M1y/
         EX9iIYk3o9O+zveF92lpkuPpeD/WDgETt3fBKNYQNmOnsMbgxPkFsZ8GigiWFG9P9vQH
         GtfyKHLtq7ufhZn57honA7cdsd2CsioT4VtouC8lm7YZO0gsCFEeLJR/0e/1Zo2TebsG
         1pL4tjKufKpxL+pFE+xIObzBdS8MlJMjOJDHuNLkvYQoM5Oi5qalgAbgiclozNjuNrmZ
         dz2LgaLjSWA5HPgf/2qAw4M258JN7bRLXWO7sBBB76nhvAzo6yOIEfjyToLEXt59WmBM
         Y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711440636; x=1712045436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WnMi/tQvJVw+PkC+MT75+pD+MW/jTUSE36/wh7EC4U=;
        b=M9nJEhihXV230LUnY7wUZrx1/TYEZol47Ar9Ydl9NPY2mkscgyirvYIKa7b+p43JIz
         rE+Uu7QQpO80sM/9hPaNU+rZlA8+FMm/G5wtxXliJDO122fGzOnz9R4qc8MiE6URglIl
         v6jz9TKyYiqnpkIPWGk9UZ2jIj9bkTmKlX8r7x+fh+YNzDBEiyRIXEaGfEMPfWes0wuv
         uGt6VDJc/SIWTgyru6u5kaKXh7tNtnY7EdcUd+bkQeNhVx00xZkAh2Gaurqw8XafgXlF
         8XIV33tRqZngsWdCkvYFELInO7z/+uZv2N8umtEoCL5CtGlu3ifcg823UFkTD6TVu47k
         6HZg==
X-Forwarded-Encrypted: i=1; AJvYcCUz9JA6qwU4bJwc3Al09PtvX6Kr+B1YkgYcG0ok+TVAtyIbXWEakvjQz9AwUTocL7zs+MLjsZKg/r/5VFK0KgELrU2vwOW5KPs=
X-Gm-Message-State: AOJu0Yx1DdWNXgH+kyG9OLBI3sr/gEdC+y9qHffYbSETmEQeaHnISSJX
	g0JA2lRvBBI2egLTgBRTXiPzeIGuNtE8Npe19d3FqAW77atsxDymWXYBRWfgicO4tZaWacX8/nM
	gM9K4WtMlAAllPf3nduJHDJ24ptw=
X-Google-Smtp-Source: AGHT+IF/ALm2O2o7HzNV6U+x3n049cfLYh7ZH/Ub314zWupwbOpi0tbPGJyakJjV6Dv6jTIJb6yn50IYmTcTLFEs6Js=
X-Received: by 2002:a17:906:240c:b0:a46:bd1d:d9c9 with SMTP id
 z12-20020a170906240c00b00a46bd1dd9c9mr6729647eja.31.1711440635950; Tue, 26
 Mar 2024 01:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240130085652.198010-1-Kelly_Hung@asus.com> <20240130085652.198010-2-Kelly_Hung@asus.com>
 <3edf1a47-9f73-4e99-98ea-182248102346@linaro.org>
In-Reply-To: <3edf1a47-9f73-4e99-98ea-182248102346@linaro.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 26 Mar 2024 16:10:23 +0800
Message-ID: <CAK=2BxtwG9BDkCovw_EOYE88M09z5=QA6MSSEBPtL6+aRrbZzw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000028fede06148bd3f8"
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
Cc: =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <Allenyy_Hsu@asus.com>, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000028fede06148bd3f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Krzysztof,
I use my Gmail account and response inline.
Thank you.

Best Regards
Kelly

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2024=E5=B9=
=B41=E6=9C=8830=E6=97=A5 =E9=80=B1=E4=BA=8C
=E4=B8=8B=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=BC=9A

> On 30/01/2024 09:56, Kelly Hung wrote:
> > From: kelly1732000 <Kelly_Hung@asus.com>
> >
> > This initial device-tree provides the necessary configuration for
> > basic BMC functionality and work on ASUS X4TF production.
> >
> > Signed-off-by: kelly1732000 <Kelly_Hung@asus.com>
> > ---
> >  .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 828 ++++++++++++++++++
> >  1 file changed, 828 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>
> It's impossible to test this file. You miss Makefile.
>
> I added the Makfile and re-sent the v5 patch on February 29, 2024.


> >
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> > new file mode 100644
> > index 000000000000..723bbb33137f
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
> > @@ -0,0 +1,828 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright 2023 ASUS Corp.
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +#include <dt-bindings/i2c/i2c.h>
> > +
> > +
> > +/ {
> > +     model =3D "ASUS-X4TF";
> > +     compatible =3D "asus,x4tf", "aspeed,ast2600";
> > +
> > +     chosen {
> > +             stdout-path =3D &uart5;
> > +             bootargs =3D "console=3DttyS4,115200n8 earlycon";
>
> earlycon is a debugging feature, not mainline. Also, move console to
> stdout-path, so entire bootargs can be dropped.
>
> I removed the bootargs and modified the stdouut-path and re-sent the v5
patch on Februarty 29, 2024.


> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x40000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <1>;
> > +             ranges;
> > +
> > +             gfx_memory: framebuffer {
> > +                     size =3D <0x01000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +
> > +             video_engine_memory: video {
> > +                     size =3D <0x04000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +
> > +             rvas_memory: rvas {
> > +                     size =3D <0x04000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +
> > +             bmc_dev_memory: bmc_dev_memory {
>
> No underscores in node names. This applies everywhere.
>
> I removed the bmc_dev_memory and  re-sent the v5 patch.

>
> > +                     size =3D <0x00100000>;
> > +                     alignment =3D <0x00100000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     no-map;
> > +             };
> > +
> > +             pci_msi_memory: pci_msi_memory {
> > +                     no-map;
> > +                     reg =3D <0x9e770000 0x100>;
> > +                     compatible =3D "shared-dma-pool";
> > +             };
> > +             /* 1GB memory */
> > +             vga_memory: region@bf000000 {
> > +                     no-map;
> > +                     compatible =3D "shared-dma-pool";
> > +                     reg =3D <0xbf000000 0x01000000>;  /* 16M */
> > +             };
> > +             ssp_memory: ssp_memory {
> > +                     size =3D <0x02000000>;
> > +                     alignment =3D <0x01000000>;
> > +                     compatible =3D "shared-dma-pool";
> > +                     no-map;
> > +             };
> > +     };
> > +
> > +     vcc_sdhci0: regulator-vcc-sdhci0 {
> > +             compatible =3D "regulator-fixed";
> > +             status =3D "disabled";
>
> Why? It makes it entirely pointless.
>

I removed the vcc_sdhci0 and re-send the v5 pathch.

>
> > +             regulator-name =3D "SDHCI0 Vcc";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     vccq_sdhci0: regulator-vccq-sdhci0 {
> > +             compatible =3D "regulator-gpio";
> > +             status =3D "disabled";
>
> Pointless node.
>
> I removed the vccq_sdhci0 and re-send the v5 patch.


> > +             regulator-name =3D "SDHCI0 VccQ";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
> > +             gpios-states =3D <1>;
> > +             states =3D <3300000 1>,
> > +                      <1800000 0>;
> > +     };
> > +
> > +     vcc_sdhci1: regulator-vcc-sdhci1 {
> > +             compatible =3D "regulator-fixed";
> > +             status =3D "disabled";
>
> Pointless node.
>
> I removed the vcc_sdhci1 and re-send the v5 patch.

>
> > +             regulator-name =3D "SDHCI1 Vcc";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +
> > +     vccq_sdhci1: regulator-vccq-sdhci1 {
> > +             compatible =3D "regulator-gpio";
> > +             status =3D "disabled";
>
> Pointless node.
>

I removed the vccq_sdhci1 and re-send the v5 patch.


> > +             regulator-name =3D "SDHCI1 VccQ";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
> > +             gpios-states =3D <1>;
> > +             states =3D <3300000 1>,
> > +                      <1800000 0>;
> > +     };
>
> Missing blank line.
>

For the blank line issue, I've corrected them all and re-sent the v5 patch.


> > +     iio-hwmon {
> > +             compatible =3D "iio-hwmon";
> > +             io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3=
>,
> > +                             <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7=
>,
> > +                             <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3=
>,
> > +                             <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7=
>;
> > +     };
> > +> +  video-engine@1e700000 {
>
> Wrong placement. Also tools would tell you that.
>

I removed the video-engine.

>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> > +             compatible =3D "aspeed,ast2600-video-engine";
> > +             reg =3D <0x1e700000 0x20000>;
> > +             clocks =3D <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon
> ASPEED_CLK_GATE_ECLK>;
> > +             clock-names =3D "vclk", "eclk";
> > +             interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > +             memory-region =3D <&video_engine_memory>;
> > +             //resets =3D <&syscon ASPEED_RESET_VIDEO>;
>
> Dead code.
>
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             heartbeat {
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>

I've used the dts schema to check our dts.

>
> > +                     gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> > +                     linux,default-trigger =3D "heartbeat";
> > +             };
> > +             uid_led {
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> > +                     gpios =3D <&gpio0 ASPEED_GPIO(P, 1) (GPIO_ACTIVE_=
LOW
> | GPIO_OPEN_DRAIN)>;
> > +                     default-state =3D "off";
> > +             };
>
> Missing blank line, everywhere.
>

For the blank line issue, I've corrected them all and re-sent the v5 patch.


>
> > +             status_Y {
> > +                     gpios =3D <&gpio1 ASPEED_GPIO(B, 1) GPIO_ACTIVE_L=
OW>;
> > +                     default-state =3D "off";
> > +             };
> > +             sys_boot_status {
> > +                     gpios =3D <&gpio1 ASPEED_GPIO(B, 0) GPIO_ACTIVE_L=
OW>;
> > +                     default-state =3D "off";
> > +             };
> > +     };
> > +     spigpio {
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> I've used the dts schema to check our dts.


>
> > +             status =3D "okay";
>
> Why?
>
> > +             compatible =3D "spi-gpio";
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>=
;
> > +             mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH=
>;
> > +             miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH=
>;
> > +             num-chipselects =3D <1>;
> > +             cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
> > +     };
> > +
>
> Redundant blank line.
>

For the blank line issue, I've corrected them all and re-sent the v5 patch.


>
> > +};
> > +
> > +&adc0 {
> > +     vref =3D <2500>;
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> > +             &pinctrl_adc2_default &pinctrl_adc3_default
> > +             &pinctrl_adc4_default &pinctrl_adc5_default
> > +             &pinctrl_adc6_default &pinctrl_adc7_default>;
> > +};
> > +
> > +&adc1 {
> > +     vref =3D <2500>;
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default
> > +             &pinctrl_adc10_default &pinctrl_adc11_default
> > +             &pinctrl_adc12_default &pinctrl_adc13_default
> > +             &pinctrl_adc14_default &pinctrl_adc15_default>;
> > +};
> > +
> > +&peci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&lpc_snoop {
> > +     snoop-ports =3D <0x80>;
> > +     status =3D "okay";
> > +};
> > +
> > +
>
> Redundant blank line. Clean this code before sending upstream from such
> trivialities.
>
For the blank line issue, I've corrected them all and re-sent the v5 patch.


>
> > +&mdio0 {
> > +     status =3D "disabled";
> > +};
> > +
> > +
> > +&mdio1 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&mdio2 {
> > +     status =3D "okay";
> > +
> > +     ethphy2: ethernet-phy@0 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0>;
> > +     };
> > +};
> > +
> > +&mdio3 {
> > +     status =3D "okay";
> > +
> > +     ethphy3: ethernet-phy@0 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <0>;
> > +     };
> > +};
> > +
> > +&mac0 {
> > +     status =3D "disabled";
> > +};
> > +
> > +&mac1 {
> > +     status =3D "disabled";
> > +};
> > +
> > +//for X4TF
> > +&mac2 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rmii";
> > +     #phy-handle =3D <&ethphy2>;
> > +     use-ncsi;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rmii3_default>;
> > +};
> > +
> > +
>
> Ditto
>
> For the blank line issue, I've corrected them all and re-sent the v5
patch.


> > +&mac3 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rmii";
> > +     #phy-handle =3D <&ethphy3>;
> > +     use-ncsi;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rmii4_default>;
> > +};
> > +
> > +
>
> Ditto
>

For the blank line issue, I've corrected them all and re-sent the v5 patch.


>
> > +&syscon {
> > +     uart-clock-high-speed;
>
> That's a syscon property?
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
>
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
>
> > +     status =3D "okay";
> > +};
> > +
> > +&rtc {
> > +     status =3D "disabled";
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +     flash@0 {
> > +             status =3D "okay";
>
> Drop. Everywhere where it is not needed.
>
> I have corrected the related flash configuration and re-send the v5 patch=
.

>
> > +             m25p,fast-read;
> > +             label =3D "bmc-spi";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-bus-width =3D <1>;
> > +             partitions {
> > +                     compatible =3D "fixed-partitions";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     bmc@0 {
> > +                             label =3D "bmc";
> > +                             reg =3D <0x0 0x4000000>;
> > +                     };
> > +                     u-boot@0 {
> > +                             label =3D "u-boot";
> > +                             reg =3D <0x0 0x200000>;
> > +                     };
> > +                     u-boot-env@1f0000 {
> > +                             label =3D "u-boot-env";
> > +                             reg =3D <0x1f0000 0x10000>;
> > +                     };
> > +                     kernel@200000 {
> > +                             label =3D "kernel";
> > +                             reg =3D <0x200000 0xc00000>;
> > +                     };
> > +                     rofs@a00000 {
> > +                             label =3D "rofs";
> > +                             reg =3D <0xa00000 0x2a00000>;
> > +                     };
> > +                     rwfs@2a00000 {
> > +                             label =3D "rwfs";
> > +                             reg =3D <0x2a00000 0x43f0000>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&spi1 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_spi1_default>;
> > +
> > +     flash@0 {
> > +             status =3D "okay";
> > +             w25q256,fast-read;
> > +             label =3D "bios-spi";
> > +             spi-max-frequency =3D <50000000>;
> > +             partitions {
> > +                     compatible =3D "fixed-partitions";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     biosfullimg@0 {
> > +                             reg =3D <0x0 0x2000000>; //  32768 *1024 =
=3D
> 0x2000000, 32 MB
> > +                             label =3D "biosfullimg";
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&i2c4 {
> > +     status =3D "okay";
> > +     tmp75@48 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
>
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>
> I've used the dts schema to check our dts.


>
>
> > +             compatible =3D "ti,tmp75";
> > +             reg =3D <0x48>;
> > +     };
> > +     tmp75@49 {
>
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
>
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>
>
I've used the dts schema to check our dts.


> I am going to skip the rest. Please fix all the trivialities and test
> your patches with tools.
>
> Best regards,
> Krzysztof
>
>

--00000000000028fede06148bd3f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
>Hi, Krzysztof,</div><div>I use my Gmail account=C2=A0and response=C2=A0inl=
ine.</div><div>Thank you.</div><div><br></div><div>Best Regards</div><div>K=
elly</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@linaro.or=
g">krzysztof.kozlowski@linaro.org</a>&gt; =E6=96=BC 2024=E5=B9=B41=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:39=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30/01/=
2024 09:56, Kelly Hung wrote:<br>
&gt; From: kelly1732000 &lt;<a href=3D"mailto:Kelly_Hung@asus.com" target=
=3D"_blank">Kelly_Hung@asus.com</a>&gt;<br>
&gt; <br>
&gt; This initial device-tree provides the necessary configuration for<br>
&gt; basic BMC functionality and work on ASUS X4TF production.<br>
&gt; <br>
&gt; Signed-off-by: kelly1732000 &lt;<a href=3D"mailto:Kelly_Hung@asus.com"=
 target=3D"_blank">Kelly_Hung@asus.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts=C2=A0 | 828 +++++++=
+++++++++++<br>
&gt;=C2=A0 1 file changed, 828 insertions(+)<br>
&gt;=C2=A0 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf=
.dts<br>
<br>
It&#39;s impossible to test this file. You miss Makefile.<br>
<br></blockquote><div>I added the=C2=A0Makfile and re-sent the v5 patch on =
February 29, 2024.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; <br>
&gt; diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/=
arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..723bbb33137f<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts<br>
&gt; @@ -0,0 +1,828 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt; +// Copyright 2023 ASUS Corp.<br>
&gt; +/dts-v1/;<br>
&gt; +<br>
&gt; +#include &quot;aspeed-g6.dtsi&quot;<br>
&gt; +#include &lt;dt-bindings/gpio/aspeed-gpio.h&gt;<br>
&gt; +#include &lt;dt-bindings/i2c/i2c.h&gt;<br>
&gt; +<br>
&gt; +<br>
&gt; +/ {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0model =3D &quot;ASUS-X4TF&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;asus,x4tf&quot;, &quot;aspee=
d,ast2600&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D &amp;=
uart5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;co=
nsole=3DttyS4,115200n8 earlycon&quot;;<br>
<br>
earlycon is a debugging feature, not mainline. Also, move console to<br>
stdout-path, so entire bootargs can be dropped.<br>
<br></blockquote><div>I removed the bootargs and modified the stdouut-path =
and re-sent the v5 patch on Februarty 29, 2024.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memory@80000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &quot=
;memory&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x8000000=
0 0x40000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reserved-memory {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &l=
t;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;1=
&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfx_memory: framebuff=
er {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0size =3D &lt;0x01000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0alignment =3D &lt;0x01000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reusable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0video_engine_memory: =
video {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0size =3D &lt;0x04000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0alignment =3D &lt;0x01000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reusable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rvas_memory: rvas {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0size =3D &lt;0x04000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0alignment =3D &lt;0x01000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reusable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmc_dev_memory: bmc_d=
ev_memory {<br>
<br>
No underscores in node names. This applies everywhere.<br>
<br></blockquote><div>I removed the bmc_dev_memory and=C2=A0 re-sent the v5=
 patch.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0size =3D &lt;0x00100000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0alignment =3D &lt;0x00100000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0no-map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pci_msi_memory: pci_m=
si_memory {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0no-map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x9e770000 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1GB memory */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vga_memory: region@bf=
000000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0no-map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0xbf000000 0x01000000&gt;;=C2=A0 /* 16M */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssp_memory: ssp_memor=
y {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0size =3D &lt;0x02000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0alignment =3D &lt;0x01000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;shared-dma-pool&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0no-map;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vcc_sdhci0: regulator-vcc-sdhci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-fixed&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
<br>
Why? It makes it entirely pointless.<br></blockquote><div><br></div><div>I =
removed the vcc_sdhci0 and re-send the v5 pathch.=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;SDHCI0 Vcc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D &lt;&amp;gp=
io0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable-active-high;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vccq_sdhci0: regulator-vccq-sdhci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
<br>
Pointless node.<br>
<br></blockquote><div>I removed the vccq_sdhci0 and re-send the v5 patch.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;SDHCI0 VccQ&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;1800000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D &lt;&amp;gp=
io0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios-states =3D &lt;=
1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0states =3D &lt;330000=
0 1&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &lt;1800000 0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vcc_sdhci1: regulator-vcc-sdhci1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-fixed&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
<br>
Pointless node.<br>
<br></blockquote><div>I removed the vcc_sdhci1=C2=A0and re-send the v5 patc=
h.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;SDHCI1 Vcc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D &lt;&amp;gp=
io0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable-active-high;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vccq_sdhci1: regulator-vccq-sdhci1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
regulator-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;disa=
bled&quot;;<br>
<br>
Pointless node.<br></blockquote><div><br></div><div>I removed the vccq_sdhc=
i1=C2=A0and re-send the v5 patch.=C2=A0=C2=A0</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D &q=
uot;SDHCI1 VccQ&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvo=
lt =3D &lt;1800000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvo=
lt =3D &lt;3300000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios =3D &lt;&amp;gp=
io0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpios-states =3D &lt;=
1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0states =3D &lt;330000=
0 1&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &lt;1800000 0&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<br>
Missing blank line.<br></blockquote><div><br></div><div>For the blank line =
issue, I&#39;ve corrected them all and re-sent the v5 patch.=C2=A0</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iio-hwmon {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
iio-hwmon&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0io-channels =3D &lt;&=
amp;adc0 0&gt;, &lt;&amp;adc0 1&gt;, &lt;&amp;adc0 2&gt;, &lt;&amp;adc0 3&g=
t;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;adc0 4&gt;, &lt;&amp;adc0 5&gt;=
, &lt;&amp;adc0 6&gt;, &lt;&amp;adc0 7&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;adc1 0&gt;, &lt;&amp;adc1 1&gt;=
, &lt;&amp;adc1 2&gt;, &lt;&amp;adc1 3&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;&amp;adc1 4&gt;, &lt;&amp;adc1 5&gt;=
, &lt;&amp;adc1 6&gt;, &lt;&amp;adc1 7&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +&gt; +=C2=A0 video-engine@1e700000 {<br>
<br>
Wrong placement. Also tools would tell you that.<br></blockquote><div><br><=
/div><div>I removed the video-engine.=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
It does not look like you tested the DTS against bindings. Please run<br>
`make dtbs_check W=3D1` (see<br>
Documentation/devicetree/bindings/writing-schema.rst or<br>
<a href=3D"https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/</a><br>
for instructions).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
aspeed,ast2600-video-engine&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e70000=
0 0x20000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;s=
yscon ASPEED_CLK_GATE_VCLK&gt;, &lt;&amp;syscon ASPEED_CLK_GATE_ECLK&gt;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-names =3D &quot=
;vclk&quot;, &quot;eclk&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 7 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory-region =3D &lt=
;&amp;video_engine_memory&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//resets =3D &lt;&amp=
;syscon ASPEED_RESET_VIDEO&gt;;<br>
<br>
Dead code.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0leds {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
gpio-leds&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0heartbeat {<br>
<br>
It does not look like you tested the DTS against bindings. Please run<br>
`make dtbs_check W=3D1` (see<br>
Documentation/devicetree/bindings/writing-schema.rst or<br>
<a href=3D"https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/</a><br>
for instructions).<br></blockquote><div><br></div><div>I&#39;ve used the dt=
s schema to check our dts.=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux,default-trigger =3D &quot;heartbeat&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uid_led {<br>
<br>
It does not look like you tested the DTS against bindings. Please run<br>
`make dtbs_check W=3D1` (see<br>
Documentation/devicetree/bindings/writing-schema.rst or<br>
<a href=3D"https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/</a><br>
for instructions).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;gpio0 ASPEED_GPIO(P, 1) (GPIO_ACTIVE_LOW | GPIO_O=
PEN_DRAIN)&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;off&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
Missing blank line, everywhere.<br></blockquote><div><br></div><div>For the=
 blank line issue, I&#39;ve corrected them all and re-sent the v5 patch.=C2=
=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status_Y {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;gpio1 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;off&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_boot_status {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gpios =3D &lt;&amp;gpio1 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0default-state =3D &quot;off&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spigpio {<br>
<br>
It does not look like you tested the DTS against bindings. Please run<br>
`make dtbs_check W=3D1` (see<br>
Documentation/devicetree/bindings/writing-schema.rst or<br>
<a href=3D"https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/</a><br>
for instructions).<br>
<br></blockquote><div>I&#39;ve used the dts schema to check our dts.=C2=A0<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
<br>
Why?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
spi-gpio&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &l=
t;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0=
&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sck-gpios =3D &lt;&am=
p;gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mosi-gpios =3D &lt;&a=
mp;gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0miso-gpios =3D &lt;&a=
mp;gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num-chipselects =3D &=
lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cs-gpios =3D &lt;&amp=
;gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
<br>
Redundant blank line.<br></blockquote><div><br></div><div>For the blank lin=
e issue, I&#39;ve corrected them all and re-sent the v5 patch.=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vref =3D &lt;2500&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_adc0_default &amp;=
pinctrl_adc1_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc2_def=
ault &amp;pinctrl_adc3_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc4_def=
ault &amp;pinctrl_adc5_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc6_def=
ault &amp;pinctrl_adc7_default&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;adc1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0vref =3D &lt;2500&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_adc8_default &amp;=
pinctrl_adc9_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc10_de=
fault &amp;pinctrl_adc11_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc12_de=
fault &amp;pinctrl_adc13_default<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;pinctrl_adc14_de=
fault &amp;pinctrl_adc15_default&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;peci0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;lpc_snoop {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snoop-ports =3D &lt;0x80&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
<br>
Redundant blank line. Clean this code before sending upstream from such<br>
trivialities.<br></blockquote><div>For the blank line issue, I&#39;ve corre=
cted them all and re-sent the v5 patch.=C2=A0</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +&amp;mdio0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +&amp;mdio1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mdio2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ethphy2: ethernet-phy@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
ethernet-phy-ieee802.3-c22&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mdio3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ethphy3: ethernet-phy@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
ethernet-phy-ieee802.3-c22&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mac0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;mac1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +//for X4TF<br>
&gt; +&amp;mac2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rmii&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#phy-handle =3D &lt;&amp;ethphy2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0use-ncsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_rmii3_default&gt;;=
<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
<br>
Ditto<br>
<br></blockquote><div>For the blank line issue, I&#39;ve corrected them all=
 and re-sent the v5 patch.=C2=A0</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; +&amp;mac3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rmii&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#phy-handle =3D &lt;&amp;ethphy3&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0use-ncsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_rmii4_default&gt;;=
<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
<br>
Ditto<br></blockquote><div><br></div><div>For the blank line issue, I&#39;v=
e corrected them all and re-sent the v5 patch.=C2=A0</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +&amp;syscon {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uart-clock-high-speed;<br>
<br>
That&#39;s a syscon property?<br>
<br>
It does not look like you tested the DTS against bindings. Please run<br>
`make dtbs_check W=3D1` (see<br>
Documentation/devicetree/bindings/writing-schema.rst or<br>
<a href=3D"https://www.linaro.org/blog/tips-and-tricks-for-validating-devic=
etree-sources-with-the-devicetree-schema/" rel=3D"noreferrer" target=3D"_bl=
ank">https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-=
sources-with-the-devicetree-schema/</a><br>
for instructions).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;rtc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;fmc {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
<br>
Drop. Everywhere where it is not needed.<br>
<br></blockquote><div>I have corrected the related flash configuration and =
re-send the v5 patch.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0m25p,fast-read;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;bmc-s=
pi&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D=
 &lt;50000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-bus-width =3D &lt=
;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partitions {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;fixed-partitions&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#size-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bmc@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;bmc&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x4000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u-boot@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;u-boot&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x200000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0u-boot-env@1f0000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;u-boot-env&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1f0000 0x10000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kernel@200000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;kernel&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x200000 0xc00000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rofs@a00000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rofs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xa00000 0x2a00000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rwfs@2a00000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rwfs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x2a00000 0x43f0000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;spi1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-names =3D &quot;default&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D &lt;&amp;pinctrl_spi1_default&gt;;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flash@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w25q256,fast-read;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;bios-=
spi&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spi-max-frequency =3D=
 &lt;50000000&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partitions {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;fixed-partitions&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#address-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0#size-cells =3D &lt;1&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0biosfullimg@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x2000000&gt;; //=C2=A0 =
32768 *1024 =3D 0x2000000, 32 MB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;biosfullimg&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c3 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;i2c4 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp75@48 {<br>
<br>
Node names should be generic. See also an explanation and list of<br>
examples (not exhaustive) in DT specification:<br>
<a href=3D"https://devicetree-specification.readthedocs.io/en/latest/chapte=
r2-devicetree-basics.html#generic-names-recommendation" rel=3D"noreferrer" =
target=3D"_blank">https://devicetree-specification.readthedocs.io/en/latest=
/chapter2-devicetree-basics.html#generic-names-recommendation</a><br>
<br></blockquote><div>I&#39;ve used the dts schema to check our dts.=C2=A0<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
ti,tmp75&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x48&gt;;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tmp75@49 {<br>
<br>
Node names should be generic. See also an explanation and list of<br>
examples (not exhaustive) in DT specification:<br>
<a href=3D"https://devicetree-specification.readthedocs.io/en/latest/chapte=
r2-devicetree-basics.html#generic-names-recommendation" rel=3D"noreferrer" =
target=3D"_blank">https://devicetree-specification.readthedocs.io/en/latest=
/chapter2-devicetree-basics.html#generic-names-recommendation</a><br>
<br></blockquote><div><br></div><div>I&#39;ve used the dts schema to check =
our dts.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
I am going to skip the rest. Please fix all the trivialities and test<br>
your patches with tools.<br>
<br>
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div></div></div></div></div></div></div></div></div></=
div></div></div></div>

--00000000000028fede06148bd3f8--
