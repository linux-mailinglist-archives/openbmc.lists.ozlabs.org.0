Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCA27A7C6
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 08:43:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0Cf84zTVzDqGv
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 16:43:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AAFsbuxp; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0CdJ327HzDqCk
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:42:57 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id j2so53015eds.9
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bUVhzoE1YhpTIQzZCdaXmbRNSb3545QE4RjdGCCy06k=;
 b=AAFsbuxpkDNDAqu/WeCL0tQy+8NBBoIN7gw/D4Kgcbdj8ZNBZCLyngCSXRt/clqmpv
 L93TgbLezkr09UAkhSdrndbmMaTjeDkxKBFy3kg8o9kb3hs/BMDJFsaptRlOVnL5U1/e
 B26Dvq0vEM2qRo/O+I4aqXEWbpeXF5KL9TXSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bUVhzoE1YhpTIQzZCdaXmbRNSb3545QE4RjdGCCy06k=;
 b=J7mBD4yu3ws8V5OpEW3v+YZXt/lfXI7ma/VNgnIKZviQ6pnxyRMqRdbqQuwhTE5ngf
 ewGPAWQ/SpsmNdVSbRCZlvAi9TVIpH9QnZ50gvB84tBwLFvIFA8M4iKzN5hGZI0IkDHx
 sdG4/49Pbkjqfg6GJ+IjXVwNkJmoD3DRn1m0/srP2LT59d3ocNJHl+Xv1SFjpnwhlfCp
 SouYhYJPYBbYTu8GxlrCuhuKhiMFFObRFBViZ+/diJG2ZXIx7vH/G0XZLJYxRrgs0gUM
 6bR5M0/yo5UxAiBdfU15SxomC4hPGO9Q/oZN/leONAq95OgFf5cDJJ9HMt5qALkuInIf
 br1g==
X-Gm-Message-State: AOAM530JoDjxzFNRu00Zwym0wLZpSkVl38p+TFGczpzLTmIfMtJgXaDG
 m80kpG7vSHD/+2DRwfxvSAxRZmFi1zNbxsZM20nCBC65
X-Google-Smtp-Source: ABdhPJyFKeKAko6ux8E5BAU46tjSEAJKh9qX/fMsNyp+E0vMZiaExN5OEUXXkYnVrwK6wlW5pGYymSDZZfd/aJ7mWdo=
X-Received: by 2002:aa7:ca4f:: with SMTP id j15mr115062edt.233.1601275375032; 
 Sun, 27 Sep 2020 23:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200923164730.176881-1-tmaimon77@gmail.com>
 <20200923164730.176881-6-tmaimon77@gmail.com>
In-Reply-To: <20200923164730.176881-6-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:42:42 +0000
Message-ID: <CACPK8Xc1s7Q6b-m3nCVh6mfukv6Pih331=vpnMTQDLO09mHVWQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] arm: dts: add new device nodes to NPCM750 device
 tree EVB
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 23 Sep 2020 at 16:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add the following new device nodes to
> NPCM750 evolution board device tree:
>
>         - NPCM7xx Pin controller and GPIO
>         - NPCM7xx PWM and FAN.
>         - NPCM7xx EHCI USB.
>         - NPCM7xx KCS.
>         - NPCM Reset.
>         - NPCM Peripheral SPI.
>         - NPCM FIU SPI.
>         - NPCM HWRNG.
>         - NPCM I2C.
>         - STMicro STMMAC.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 405 +++++++++++++++++-
>  .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++++++
>  2 files changed, 546 insertions(+), 16 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index 15f744f1beea..1623a18ac29b 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -4,36 +4,409 @@
>
>  /dts-v1/;
>  #include "nuvoton-npcm750.dtsi"
> +#include "dt-bindings/gpio/gpio.h"
> +#include "nuvoton-npcm750-pincfg-evb.dtsi"
>
>  / {
>         model = "Nuvoton npcm750 Development Board (Device Tree)";
>         compatible = "nuvoton,npcm750";
>
> +       aliases {
> +               ethernet2 = &gmac0;
> +               ethernet3 = &gmac1;
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
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
> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               fiu0 = &fiu0;
> +               fiu1 = &fiu3;
> +               fiu2 = &fiux;
> +       };
> +
>         chosen {
>                 stdout-path = &serial3;
>         };
>
>         memory {
> -               reg = <0 0x40000000>;
> +               device_type = "memory";
> +               reg = <0x0 0x20000000>;
>         };
> -};
>
> -&watchdog1 {
> -       status = "okay";
> -};
> +       ahb {
> +               gmac0: eth@f0802000 {
> +                       phy-mode = "rgmii-id";
> +                       status = "okay";
> +               };

While this will work it is less error prone to refer to the existing
node by it's phandle.

&gmac0 {
     phy-mode = "rgmii-id";
     status = "okay";
}


>
> -&serial0 {
> -       status = "okay";
> -};
> +               gmac1: eth@f0804000 {
> +                       phy-mode = "rgmii-id";
> +                       status = "okay";
> +               };

As with gmac0.

>
> -&serial1 {
> -       status = "okay";
> -};
> +               ehci1: usb@f0806000 {
> +                       status = "okay";
> +               };

As above:

&ehci1 {
   status = "okay";
}

>
> -&serial2 {
> -       status = "okay";
> -};
> +               fiu0: spi@fb000000 {

&fiu0 {
  status = "okay"
   spi-nor@1 {
...

And as I read down, the entire device tree needs to be fixed.

> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               spi-rx-bus-width = <2>;
> +                               reg = <0>;
> +                               spi-max-frequency = <5000000>;
> +                               partitions@80000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       bbuboot1@0 {
> +                                               label = "bb-uboot-1";
> +                                               reg = <0x0000000 0x80000>;
> +                                               read-only;
> +                                               };
> +                                       bbuboot2@80000 {
> +                                               label = "bb-uboot-2";
> +                                               reg = <0x0080000 0x80000>;
> +                                               read-only;
> +                                               };
> +                                       envparam@100000 {
> +                                               label = "env-param";
> +                                               reg = <0x0100000 0x40000>;
> +                                               read-only;
> +                                               };
> +                                       spare@140000 {
> +                                               label = "spare";
> +                                               reg = <0x0140000 0xC0000>;
> +                                               };
> +                                       kernel@200000 {
> +                                               label = "kernel";
> +                                               reg = <0x0200000 0x400000>;
> +                                               };
> +                                       rootfs@600000 {
> +                                               label = "rootfs";
> +                                               reg = <0x0600000 0x700000>;
> +                                               };
> +                                       spare1@D00000 {
> +                                               label = "spare1";
> +                                               reg = <0x0D00000 0x200000>;
> +                                               };
> +                                       spare2@0F00000 {
> +                                               label = "spare2";
> +                                               reg = <0x0F00000 0x200000>;
> +                                               };
> +                                       spare3@1100000 {
> +                                               label = "spare3";
> +                                               reg = <0x1100000 0x200000>;
> +                                               };
> +                                       spare4@1300000 {
> +                                               label = "spare4";
> +                                               reg = <0x1300000 0x0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               fiu3: spi@c0000000 {
> +                       pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               spi-rx-bus-width = <2>;
> +                               reg = <0>;
> +                               spi-max-frequency = <5000000>;
> +                               partitions@A0000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       system1@0 {
> +                                               label = "spi3-system1";
> +                                               reg = <0x0 0x0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               fiux: spi@fb001000 {
> +                       spix-mode;
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
> +
> +                       otp:otp@189000 {
> +                               status = "okay";
> +                       };
> +
> +                       lpc_kcs: lpc_kcs@7000 {
> +                               kcs1: kcs1@0 {
> +                                       status = "okay";
> +                               };
>
> -&serial3 {
> -       status = "okay";
> +                               kcs2: kcs2@0 {
> +                                       status = "okay";
> +                               };
> +
> +                               kcs3: kcs3@0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       /* lm75 on SVB */
> +                       i2c0: i2c@80000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@48 {
> +                                       compatible = "lm75";
> +                                       reg = <0x48>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       /* lm75 on EB */
> +                       i2c1: i2c@81000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                               lm75@48 {
> +                                       compatible = "lm75";
> +                                       reg = <0x48>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       /* tmp100 on EB */
> +                       i2c2: i2c@82000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                               tmp100@48 {
> +                                       compatible = "tmp100";
> +                                       reg = <0x48>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c3: i2c@83000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c5: i2c@85000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       /* tmp100 on SVB */
> +                       i2c6: i2c@86000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                               tmp100@48 {
> +                                       compatible = "tmp100";
> +                                       reg = <0x48>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       i2c7: i2c@87000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c8: i2c@88000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c9: i2c@89000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c10: i2c@8a000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c11: i2c@8b000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       i2c14: i2c@8e000 {
> +                               clock-frequency = <100000>;
> +                               status = "okay";
> +                       };
> +
> +                       pwm_fan:pwm-fan-controller@103000 {
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
> +                               fan@3 {
> +                                       reg = <0x03>;
> +                                       fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@4 {
> +                                       reg = <0x04>;
> +                                       fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@5 {
> +                                       reg = <0x05>;
> +                                       fan-tach-ch = /bits/ 8 <0x0A 0x0B>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@6 {
> +                                       reg = <0x06>;
> +                                       fan-tach-ch = /bits/ 8 <0x0C 0x0D>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                               fan@7 {
> +                                       reg = <0x07>;
> +                                       fan-tach-ch = /bits/ 8 <0x0E 0x0F>;
> +                                       cooling-levels = /bits/ 8 <127 255>;
> +                               };
> +                       };
> +
> +                       spi0: spi@200000 {
> +                               cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> +                               status = "okay";
> +                               Flash@0 {
> +                                       compatible = "winbond,w25q128",
> +                                       "jedec,spi-nor";
> +                                       reg = <0x0>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       spi-max-frequency = <5000000>;
> +                                       partition@0 {
> +                                               label = "spi0_spare1";
> +                                               reg = <0x0000000 0x800000>;
> +                                       };
> +                                       partition@1 {
> +                                               label = "spi0_spare2";
> +                                               reg = <0x800000 0x0>;
> +                                       };
> +                               };
> +                       };
> +
> +                       spi1: spi@201000 {
> +                               cs-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
> +                               status = "okay";
> +                               Flash@0 {
> +                                       compatible = "winbond,w25q128fw",
> +                                       "jedec,spi-nor";
> +                                       reg = <0x0>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       spi-max-frequency = <5000000>;
> +                                       partition@0 {
> +                                               label = "spi1_spare1";
> +                                               reg = <0x0000000 0x800000>;
> +                                       };
> +                                       partition@1 {
> +                                               label = "spi1_spare2";
> +                                               reg = <0x800000 0x0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       pinctrl: pinctrl@f0800000 {

&pinctrl {

> +               pinctrl-names = "default";
> +               pinctrl-0 = <   &iox1_pins
> +                               &pin8_input
> +                               &pin9_output_high
> +                               &pin10_input
> +                               &pin11_output_high
> +                               &pin16_input
> +                               &pin24_output_high
> +                               &pin25_output_low
> +                               &pin32_output_high
> +                               &jtag2_pins
> +                               &pin61_output_high
> +                               &pin62_output_high
> +                               &pin63_output_high
> +                               &lpc_pins
> +                               &pin160_input
> +                               &pin162_input
> +                               &pin168_input
> +                               &pin169_input
> +                               &pin170_input
> +                               &pin187_output_high
> +                               &pin190_input
> +                               &pin191_output_high
> +                               &pin192_output_high
> +                               &pin197_output_low
> +                               &ddc_pins
> +                               &pin218_input
> +                               &pin219_output_low
> +                               &pin220_output_low
> +                               &pin221_output_high
> +                               &pin222_input
> +                               &pin223_output_low
> +                               &spix_pins
> +                               &pin228_output_low
> +                               &pin231_output_high
> +                               &pin255_input>;
> +       };
>  };
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
> new file mode 100644
> index 000000000000..edb4190826e6
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com

Drop your email address; it's in the git history if someone needs to look it up.

> +
> +/ {
> +       pinctrl: pinctrl@f0800000 {
> +               pin8_input: pin8-input {
> +                       pins = "GPIO8/LKGPO1";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin9_output_high: pin9-output-high {
> +                       pins = "GPIO9/LKGPO2";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin10_input: pin10-input {
> +                       pins = "GPIO10/IOXHLD";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin11_output_high: pin11-output-high {
> +                       pins = "GPIO11/IOXHCK";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin16_input: pin16-input {
> +                       pins = "GPIO16/LKGPO0";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin24_output_high: pin24-output-high {
> +                       pins = "GPIO24/IOXHDO";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin25_output_low: pin25-output-low {
> +                       pins = "GPIO25/IOXHDI";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin32_output_high: pin32-output-high {
> +                       pins = "GPIO32/nSPI0CS1";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin61_output_high: pin61-output-high {
> +                       pins = "GPO61/nDTR1_BOUT1/STRAP6";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin62_output_high: pin62-output-high {
> +                       pins = "GPO62/nRTST1/STRAP5";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin63_output_high: pin63-output-high {
> +                       pins = "GPO63/TXD1/STRAP4";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin160_input: pin160-input {
> +                       pins = "GPIO160/CLKOUT/RNGOSCOUT";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin162_input: pin162-input {
> +                       pins = "GPIO162/SERIRQ";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin168_input: pin168-input {
> +                       pins = "GPIO168/nCLKRUN/nESPIALERT";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin169_input: pin169-input {
> +                       pins = "GPIO169/nSCIPME";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin170_input: pin170-input {
> +                       pins = "GPIO170/nSMI";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin187_output_high: pin187-output-high {
> +                       pins = "GPIO187/nSPI3CS1";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin190_input: pin190-input {
> +                       pins = "GPIO190/nPRD_SMI";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin191_output_high: pin191-output-high {
> +                       pins = "GPIO191";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin192_output_high: pin192-output-high {
> +                       pins = "GPIO192";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin197_output_low: pin197-output-low {
> +                       pins = "GPIO197/SMB0DEN";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin218_input: pin218-input {
> +                       pins = "GPIO218/nWDO1";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin219_output_low: pin219-output-low {
> +                       pins = "GPIO219/nWDO2";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin220_output_low: pin220-output-low {
> +                       pins = "GPIO220/SMB12SCL";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin221_output_high: pin221-output-high {
> +                       pins = "GPIO221/SMB12SDA";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin222_input: pin222-input {
> +                       pins = "GPIO222/SMB13SCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               pin223_output_low: pin223-output-low {
> +                       pins = "GPIO223/SMB13SDA";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin228_output_low: pin228-output-low {
> +                       pins = "GPIO228/nSPIXCS1";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               pin231_output_high: pin231-output-high {
> +                       pins = "GPIO230/SPIXD3";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               pin255_input: pin255-input {
> +                       pins = "GPI255/DACOSEL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +       };
> +};
> --
> 2.22.0
>
