Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621B3115A
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 17:31:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FpMH6lVVzDqbD
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 01:31:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QTIFCj2f"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FpKT3RgMzDqTg
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 01:29:48 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id u25so8476667iot.13
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xbxX575smMNuFbGxumG5ixmzReQEC1FREBE49hNG/NA=;
 b=QTIFCj2fZH+XElpPXUj5lebwzkHbETAEyyj5zEwx4MQd1TUtYRvtAybggdVtXpsU6q
 Ad/FNURCTJAr91KI8clocqijn/aoAXCnyIagiwsunqYVXH52XplCfYP/sCTtYSJDKxav
 LMTFE9QVY3gHPVEDCxhT7eURmbDZgzcmjOrJ4U3mV35bu5fqacj5722MKfUfeygM2vor
 HsSyKQZjLqPgDhoqKUnoW1he5C9YqWLU1MgJS/FZjVJGwvLpuWZgzD6kKbbSvs9639du
 pQF/502XH5p+BOrt36cTJpYUEjVSma84lt0pNYehR3HV1CrFWRKLLvh6o/nhNrJvV4e2
 O4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xbxX575smMNuFbGxumG5ixmzReQEC1FREBE49hNG/NA=;
 b=blvbDzXrk7THon+M8WYgkgqkB/NwztoJqMZWPY/m1wPO7EIFpa9lrShEleIYgrZGoC
 gFMy1F56TwGiEKf+8mWyEs5cGkw32dogez/rw5xfXd0LWMqp45W2E/PficQt5EsthjA9
 3ZTsHraXwmJvRTKk0ARhSrCKhVW7Ejl07mmhP46O/Lme8jT+hEwcxohLK8cyPUae3skn
 4a9n45h+vhHv6fBTLP65TAuy9piPOloa2P6lptxFAcQBEfWsGdWufmf9lA83Lej+rNrk
 yisDhYfviVHbO9I4Jh3mJBYwSeQdJpHfrP71DZuSCy2lfjWzwYHQKGxtXVxGVr8jY308
 1BSg==
X-Gm-Message-State: APjAAAXqfyDVyf6ILF0RFletCahl+ms9KS9dS/RPUufwLOV5eVmGwMbQ
 AOAgFBf2n9M4ykvMc/sFYdwIKxfdsVa56HmgbeEV5A==
X-Google-Smtp-Source: APXvYqzATyZ/Dhk100tkkiuPTNlTs4sLY7zCO0i/cbTVhmbTsEu0TYxlDTm3KQrvz7GycrkcMd1foMyZbslnRMCRafM=
X-Received: by 2002:a6b:b654:: with SMTP id g81mr597168iof.34.1559316585247;
 Fri, 31 May 2019 08:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <20190531132440.37572-3-Fran.Hsu@quantatw.com>
In-Reply-To: <20190531132440.37572-3-Fran.Hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 31 May 2019 08:29:09 -0700
Message-ID: <CADKL2t6JxOK1-ZsAyvy+6iV1pKMk6c+HwBkKo2A+0DO-BQCy=g@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 3/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 Device Tree.
To: Fran Hsu <franhsutw@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Fran Hsu <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> wrote:
>
> Quanta GSJ BMC uses the Nuvoton NPCM730 soc.
> Commit the Quanta GSJ device tree for Arm dts.
> Also adds an entry of Quanta GSJ device tree file in Makefile.
> This is the part-1 of nuvoton-npcm730-gsj.dts.
>
> Including features:
> 1. Image partitions
> 2. pwm fan controller
> 3. usb device
> 4. serial port
> 5. fiu
>
> Tested:
>   Build Quanta GSJ image and load on the GSJ BMC module.
>   Ensure that BMC boots to console successful.
>
> Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  arch/arm/boot/dts/Makefile                |   3 +-
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 418 ++++++++++++++++++++++
>  2 files changed, 420 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 834cce80d..339672805 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -321,7 +321,8 @@ dtb-$(CONFIG_ARCH_LPC32XX) += \
>         lpc3250-ea3250.dtb \
>         lpc3250-phy3250.dtb
>  dtb-$(CONFIG_ARCH_NPCM7XX) += \
> -       nuvoton-npcm750-evb.dtb
> +       nuvoton-npcm750-evb.dtb \
> +       nuvoton-npcm730-gsj.dtb
>  dtb-$(CONFIG_MACH_MESON6) += \
>         meson6-atv1200.dtb
>  dtb-$(CONFIG_MACH_MESON8) += \
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> new file mode 100644
> index 000000000..8f4ca6084
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-gsj-gpio.dtsi"
> +/ {
> +       model = "Quanta GSJ Board (Device Tree v11)";
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
> +                               partitions@80000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       bmc@0{
> +                                               label = "bmc";
> +                                               reg = <0x000000 0x2000000>;
> +                                       };
> +                                       u-boot@0 {
> +                                               label = "u-boot";
> +                                               reg = <0x0000000 0x80000>;
> +                                               read-only;
> +                                       };
> +                                       u-boot-env@100000{
> +                                               label = "u-boot-env";
> +                                               reg = <0x00100000 0x40000>;
> +                                       };
> +                                       kernel@200000 {
> +                                               label = "kernel";
> +                                               reg = <0x0200000 0x600000>;
> +                                       };
> +                                       rofs@800000 {
> +                                               label = "rofs";
> +                                               reg = <0x800000 0x1400000>;
> +                                       };
> +                                       rwfs@1c00000 {
> +                                               label = "rwfs";
> +                                               reg = <0x1c00000 0x300000>;
> +                                       };
> +                                       reserved@1f00000 {
> +                                               label = "reserved";
> +                                               reg = <0x1f00000 0x100000>;
> +                                       };
> +                               };
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
> +
> +                       i2c5: i2c@85000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               bus-frequency = <100000>;
> +                               status = "disabled";
> +                       };
> +
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
> +                               ucd90160@6b {
> +                                       compatible = "ti,ucd90160";
> +                                       reg = <0x6b>;
> +                               };
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
> +
> +                               fan@0 {
> +                                       reg = <0x00>;
> +                                       fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +                                       cooling-levels = <127 255>;
> +                               };
> +
> +                               fan@1 {
> +                                       reg = <0x01>;
> +                                       fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +
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
> +};
> --
> 2.21.0
>
