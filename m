Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDF18060
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 21:19:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zmW36bStzDqKD
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 05:19:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="afMnKLKg"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zmV96v5yzDqHW
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 05:18:41 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id a17so9883915iot.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rAl9dYhbEwiOiwjse/FGidUPITMYIP+pu8AiglliE0=;
 b=afMnKLKgJO9HlPdfySlAvW0QXZ9Mgnv9FQjb/PEdGRXQry6sfaHtBIC7zg6bmOFI+T
 tD5KnJA5qIbSjwnfM1Z+C6rGZMvs4DbeOe2hpMNLGRCEHNBAeQLa7/MGHxYPhb5afsFU
 lFm+jetHCD4k2p+DsW66UMHeEJfZUiU8cqwBhrwpDVJInCfQ45U1Q7h2l3pjpk7VoTJB
 1HN09L9KZ6OAlyShMPOROzly23x3hGMqLMNHxZNz7Ebx2D4IyXmLAekdNHE6tkS5PDHY
 G49WHXZyLXrDcVeF5zUYA3h6yRUSmWMFFCxULR2oIDN8qwbRuaC10z/ck71gBOICAuR+
 HphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rAl9dYhbEwiOiwjse/FGidUPITMYIP+pu8AiglliE0=;
 b=pfoUH/iudcuQpSrufllJOhq9iCiE1SO7DmjNsIs3Ys4B/8auZAvXzMTj3M/xJjSfUN
 AJVDa5rEe9AyGOwnutGCM2DHeWIriiHK4hQfOJDdOEIjbp6+qTNIj5EIalGgVcNcfFN3
 B+K/sFrRZvfare5DQT6b2ngZy/PWP8HA6dMPa1ShPhUX8Bf8sZ9l3JaNYo7H1Nkafh4B
 F9hnnocjDyL05lCk42BzaT+z1TMW3J5P4cwNRtvyUOvgdJitSk4FB2O+BjGs9LQC4Hpp
 LniWvEw5mtijvfgs8oImYM+2OITrF6YJXNjQV7147AMDeqBI4CwMQOeCiBL/Ny7aEMn/
 ttyg==
X-Gm-Message-State: APjAAAUWWJJh1A/AYQe4orWSVFx88FsXypQlQPGcj/HpNAHzRg7aTTNK
 +w/TfEP8wjqMIl11S8NjFryVB2JMXyFKT4YfoJ+fLYmrfqE=
X-Google-Smtp-Source: APXvYqx6TQ1YlKYUr7Vtv9PSqys9AfQpYpK5dFs+rluWKEBV0RjBxzTbwGspfwLsaMkJoeyDiGx8g1+tP93hBKtC81E=
X-Received: by 2002:a5e:9415:: with SMTP id q21mr1612247ioj.174.1557343119180; 
 Wed, 08 May 2019 12:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190412140132.39764-1-fran.hsu@quantatw.com>
 <20190412140132.39764-4-fran.hsu@quantatw.com>
In-Reply-To: <20190412140132.39764-4-fran.hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 8 May 2019 12:18:03 -0700
Message-ID: <CADKL2t5GLZ7N6TaRRf-+AcufL9=mDj+qzRZbfqSzrkv1kRRYYg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 4/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 machine.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2019 at 7:01 AM <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add device tree for quanta-gsj BMC module.
> Tested: Build Quanta GSJ image and load on the GSJ BMC module.
> Ensure that BMC boots to console successful.
>
> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 573 ++++++++++++++++++++++
>  1 file changed, 573 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> new file mode 100644
> index 000000000000..cbbe928db86f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -0,0 +1,573 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-gsj-gpio.dtsi"
> +/ {
> +       model = "Quanta GSJ Board (Device Tree v9)";
> +       compatible = "nuvoton,npcm750";
> +
> +       aliases {
> +               ethernet0 = &emc0;
> +               ethernet1 = &gmac0;
> +               serial3 = &serial3;
> +               udc9 = &udc9;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +               i2c14 = &i2c14;
> +               i2c15 = &i2c15;
> +               fiu0 = &fiu0;
> +       };
> +
> +       chosen {
> +               stdout-path = &serial3;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       ahb {
> +               gmac0: eth@f0802000 {
> +                       phy-mode = "rgmii-id";
> +                       status = "okay";
> +               };
> +
> +               mc: memory-controller@f0824000 {
> +                       compatible = "nuvoton,npcm7xx-sdram-edac";
> +                       reg = <0xf0824000 0x1000>;
> +                       interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               emc0: eth@f0825000 {
> +                       phy-mode = "rmii";
> +                       use-ncsi;
> +                       status = "okay";
> +               };
> +
> +               ehci1: usb@f0806000 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: ohci@f0807000 {
> +                       status = "okay";
> +               };
> +
> +               udc9:udc@f0839000 {
> +                       status = "okay";
> +               };
> +
> +               aes:aes@f0858000 {
> +                       status = "okay";
> +               };
> +
> +               sha:sha@f085a000 {
> +                       status = "okay";
> +               };
> +
> +               fiu0: fiu@fb000000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi0cs1_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-rx-bus-width = <2>;
> +#include "nuvoton-npcm730-gsj-flash-layout.dtsi"
> +                       };
> +               };
> +
> +               pcimbox: pcimbox@f0848000 {
> +                       status = "okay";
> +               };
> +
> +               apb {
> +
> +                       watchdog1: watchdog@901C {
> +                               status = "okay";
> +                       };
> +
> +                       rng: rng@b000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial1: serial@2000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial2: serial@3000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial3: serial@4000 {
> +                               status = "okay";
> +                       };
> +
> +                       adc: adc@c000 {
> +                               status = "okay";
> +                       };
> +                       otp:otp@189000 {
> +                               status = "okay";
> +                       };
> +
> +                       i2c0: i2c@80000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c1: i2c@81000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c2: i2c@82000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c3: i2c@83000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c4: i2c@84000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@5c {
> +                                       compatible = "maxim,max31725";
> +                                       reg = <0x5c>;
> +                                       status = "okay";
> +                               };
> +                       };
> +                       i2c5: i2c@85000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +                       i2c6: i2c@86000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c7: i2c@87000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c8: i2c@88000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c9: i2c@89000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c10: i2c@8a000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                               eeprom@55 {
> +                                       compatible = "atmel,24c64";
> +                                       reg = <0x55>;
> +                               };
> +                       };
> +
> +                       i2c11: i2c@8b000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               /* P12V Quarter Brick DC/DC Power Module Q54SH12050 @60 */
> +                               power-brick@36 {
> +                                       compatible = "delta,dps800";
> +                                       reg = <0x36>;
> +                               };
> +
> +                               hotswap@15 {
> +                                       compatible = "ti,lm5066i";
> +                                       reg = <0x15>;
> +                               };
> +                       };
> +
> +                       i2c12: i2c@8c000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c13: i2c@8d000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               ipmb@40000010 {
> +                                       compatible = "slave-mqueue";
> +                                       reg = <0x40000010>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c14: i2c@8e000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               ipmb@40000012 {
> +                                       compatible = "slave-mqueue";
> +                                       reg = <0x40000012>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c15: i2c@8f000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "okay";
> +
> +                               i2c-switch@75 {
> +                                       compatible = "nxp,pca9548";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0x75>;
> +                                       i2c-mux-idle-disconnect;
> +
> +                                       i2c_u20: i2c@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +                                       };
> +
> +                                       i2c_u21: i2c@1 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <1>;
> +                                       };
> +
> +                                       i2c_u22: i2c@2 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <2>;
> +                                       };
> +
> +                                       i2c_u23: i2c@3 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <3>;
> +                                       };
> +
> +                                       i2c_u24: i2c@4 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <4>;
> +                                       };
> +
> +                                       i2c_u25: i2c@5 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <5>;
> +                                       };
> +
> +                                       i2c_u26: i2c@6 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <6>;
> +                                       };
> +
> +                                       i2c_u27: i2c@7 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <7>;
> +                                       };
> +                               };
> +                       };
> +
> +                       pwm_fan:pwm-fan-controller@103000 {
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
> +                                               &fanin0_pins &fanin1_pins
> +                                               &fanin2_pins &fanin3_pins
> +                                               &fanin4_pins &fanin5_pins>;
> +                               status = "okay";
> +                               fan@0 {
> +                                       reg = <0x00>;
> +                                       fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +                                       cooling-levels = <127 255>;
> +                               };
> +                               fan@1 {
> +                                       reg = <0x01>;
> +                                       fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@2 {
> +                                       reg = <0x02>;
> +                                       fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                       };
> +
> +               };
> +       };
> +
> +       pinctrl: pinctrl@f0800000 {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <
> +                               /* GPI pins*/
> +                               &gpio8_pins
> +                               &gpio9_pins
> +                               &gpio12_pins
> +                               &gpio13_pins
> +                               &gpio14_pins
> +                               &gpio60_pins
> +                               &gpio83_pins
> +                               &gpio91_pins
> +                               &gpio92_pins
> +                               &gpio95_pins
> +                               &gpio136_pins
> +                               &gpio137_pins
> +                               &gpio141_pins
> +                               &gpio144_pins
> +                               &gpio145_pins
> +                               &gpio146_pins
> +                               &gpio147_pins
> +                               &gpio148_pins
> +                               &gpio149_pins
> +                               &gpio150_pins
> +                               &gpio151_pins
> +                               &gpio152_pins
> +                               &gpio153_pins
> +                               &gpio154_pins
> +                               &gpio155_pins
> +                               &gpio156_pins
> +                               &gpio157_pins
> +                               &gpio158_pins
> +                               &gpio159_pins
> +                               &gpio161_pins
> +                               &gpio162_pins
> +                               &gpio163_pins
> +                               &gpio164_pins
> +                               &gpio165_pins
> +                               &gpio166_pins
> +                               &gpio167_pins
> +                               &gpio168_pins
> +                               &gpio169_pins
> +                               &gpio170_pins
> +                               &gpio177_pins
> +                               &gpio191_pins
> +                               &gpio192_pins
> +                               &gpio203_pins
> +                               /* GPO pins*/
> +                               &gpio0pp_pins
> +                               &gpio1pp_pins
> +                               &gpio2pp_pins
> +                               &gpio3pp_pins
> +                               &gpio4pp_pins
> +                               &gpio5pp_pins
> +                               &gpio6pp_pins
> +                               &gpio7pp_pins
> +                               &gpio10pp_pins
> +                               &gpio11pp_pins
> +                               &gpio15od_pins
> +                               &gpio17pp_pins
> +                               &gpio18pp_pins
> +                               &gpio19pp_pins
> +                               &gpio24pp_pins
> +                               &gpio25pp_pins
> +                               &gpio37od_pins
> +                               &gpio59pp_pins
> +                               &gpio72od_pins
> +                               &gpio73od_pins
> +                               &gpio74od_pins
> +                               &gpio75od_pins
> +                               &gpio76od_pins
> +                               &gpio77od_pins
> +                               &gpio78od_pins
> +                               &gpio79od_pins
> +                               &gpio84pp_pins
> +                               &gpio85pp_pins
> +                               &gpio86pp_pins
> +                               &gpio87pp_pins
> +                               &gpio88pp_pins
> +                               &gpio89pp_pins
> +                               &gpio90pp_pins
> +                               &gpio93pp_pins
> +                               &gpio94pp_pins
> +                               &gpio125pp_pins
> +                               &gpio126od_pins
> +                               &gpio127od_pins
> +                               &gpio142od_pins
> +                               &gpio143ol_pins
> +                               &gpio175od_pins
> +                               &gpio176od_pins
> +                               &gpio190od_pins
> +                               &gpio194pp_pins
> +                               &gpio195od_pins
> +                               &gpio196od_pins
> +                               &gpio197od_pins
> +                               &gpio198od_pins
> +                               &gpio199od_pins
> +                               &gpio200pp_pins
> +                               &gpio202od_pins
> +                               >;
> +       };
> +
> +
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-bmc-live {
> +                       gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +
> +               LED_U2_0_LOCATE {
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_LOCATE {
> +                       gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_LOCATE {
> +                       gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_LOCATE {
> +                       gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_LOCATE {
> +                       gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_LOCATE {
> +                       gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_BMC_TRAY_PWRGD {
> +                       gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_FAULT {
> +                       gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_LOCATE {
> +                       gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_LOCATE {
> +                       gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_0_FAULT {
> +                       gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_FAULT {
> +                       gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_FAULT {
> +                       gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_FAULT {
> +                       gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_FAULT {
> +                       gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_FAULT {
> +                       gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_FAULT {
> +                       gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +       };
> +};
> --
> 2.21.0
>
