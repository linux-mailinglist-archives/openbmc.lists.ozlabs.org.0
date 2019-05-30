Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1947301A6
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 20:16:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FG4h6YP5zDqX1
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 04:16:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jmBHsgMd"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FG456z9CzDqWp
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 04:16:21 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id i63so6651301ita.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 11:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kd1ITij3d0g3VVRB9/ylGWhNlnq6aZkpMURIVZOYu9w=;
 b=jmBHsgMdDY7Iy4knWq6tuBUQYaTQtK/4DAPoRUlLbIL5wYA76bN/nk0XbExZ+1c17G
 9+KtnP3yKHucnms5Se3EGEXiOk+7FR7nYGU39o67UVN5i5If49eEqF2z+R4pH+M23BWl
 plxSQHj9QoC1gyQp6UB5OBJQRvcJnt7Hwd800AbggTrQfwPaXLsYMVU52CmcDiJbEIzf
 U4/vX0DFSP4ikQevX8KGMl1vGNggI9lZo3p3VtpULWpDJZAS7twDWyZ4KkN9XW4rPI1u
 BR6F4qflow2zZpuO6+nxjHnkj+tSiQRmsn7OxpmqXMGmPGrjoFX7RQSBNredaPiGQlm6
 MaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kd1ITij3d0g3VVRB9/ylGWhNlnq6aZkpMURIVZOYu9w=;
 b=Jy3o3DSspxvhYM1OfO/lNPHGRAyi1hQEM9FRvZAg2Pti8ItMlUu7tk1pAyW+VdLkfO
 kN8MiiLmKx0KDacbJbRzV0K+6iKkhzWbx9zt/zoJ9eJIRqd1vQ66PxdGN88QTlwjdTr1
 bUdhgOYtlHyFNzIgWSRMxwUEthQnFARPVlKLJMcHs4nkiFoDn3ybElaAgUH8TAztgHwW
 B+j9Dt37hSaFlji1cvMhamcnI8CKffSCMKnvgwkzs2D+mICjKdAOgOMbTOGVI8JCgw84
 aHcs/BuJ/BpSns/BBNtrQPCwv8OaBd+xbd38UykiHgqY9yPnSwc9eb+iSuSMQGcErRbu
 PIIw==
X-Gm-Message-State: APjAAAXetmeA6+lTt48ncGsgMqgnKu354Hh/T1Ya2EV5t/8w/96RciqV
 zWscySozRbNnopORP3xvQVkHr7kf1RnPlShEeHEcvqpTbDI=
X-Google-Smtp-Source: APXvYqx7p64UxSFUJH5sC9UzcUiJ03xkpRlpOqmY3TKo2mI1rMFCa1/UOXITDBU6wU3ld+SN/MlsY+Iqm0lh3jOIbLE=
X-Received: by 2002:a24:3014:: with SMTP id q20mr4034673itq.4.1559240177170;
 Thu, 30 May 2019 11:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190516111200.13859-1-franhsutw@gmail.com>
In-Reply-To: <20190516111200.13859-1-franhsutw@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 30 May 2019 11:15:40 -0700
Message-ID: <CADKL2t7N1dLHCjnrWD61KsdD1CmQm3AK2HhxoXvcVAqVG7rE_g@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v4 1/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Fran,

This is looking good. Just a few small changes.

On Thu, May 16, 2019 at 4:14 AM Fran Hsu <franhsutw@gmail.com> wrote:
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
> Signed-off-by: Fran Hsu <franhsutw@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                |   3 +-
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 413 ++++++++++++++++++++++
>  2 files changed, 415 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 127616746486..f55eedcdfec9 100644
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
> index 000000000000..7cac83c6566b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -0,0 +1,413 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Quanta Computer lnc. Fran.Hsu@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-gsj-gpio.dtsi"

These include files don't exist yet. Make sure to order your patches
so that the kernel can build at each commit.

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

Please be consistent with newlines between blocks as it makes it easier to read.

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
> +
> +};
> --
> 2.21.0
>
