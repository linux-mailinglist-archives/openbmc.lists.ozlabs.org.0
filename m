Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 587392AFB60
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 23:30:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWfZ01YfJzDqvd
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 09:30:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DHTJyfVr; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWfYG3QsYzDqmh
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 09:29:37 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id n132so3487822qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 14:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Da7Z6W2BQsZbFLtA4I9gp+n/CVQ26EfvyGXw3EmmFlU=;
 b=DHTJyfVred+EMLX2Wb8MER8DwMa3kZ27ifvHgfIow+DU2CIyCMh03bbke0z499mY1q
 YGdLA/HJPwvTbwEUW9U95ifXcR5rxLLl3IBFQ5bLZ1iZR/h1MXHgO6ecHyLbR9JcguW8
 pc6L7XVDDVHchw1YzbCDLEdjv+/QH3KqStiUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Da7Z6W2BQsZbFLtA4I9gp+n/CVQ26EfvyGXw3EmmFlU=;
 b=Zb26jRHcniAnx8g8ko2SQx4kWu4xP44f0ZyzDInhB9Fsk4UqLbaCB2V8r2t414y3nc
 kyRcr5+cBT14C2BAe3B/m5TvQQ3kI7pgJVppi8mxYW8wYZjAiXrTmMZcFI4gtk6PK3va
 mFDevA1MiFGloKiBpFxzS7Yvs9lb/g0iJ/5MjqzeovJa6iHDPiy0PVsIBU7KYR60GTl1
 aMRrqzGowXKROvpVu2U2ClQydmU4jMYbRGEHpmFL3WneLBumlaBZkYTOAru+Tks7a2Nv
 aS0ZSa0+M3T+e0BZpDeTKsuxqKBL+Ad5Y+xUOskFi5z9vKOddyY2CfwDyOsbXua77OhH
 uDHw==
X-Gm-Message-State: AOAM530gk3sE8fDtnrtCY13RieWBnZ5QrC5jJwI3hVdsrwxA73mIKqa4
 EmHh9/mGhvihKqvcyfITRjSAgla7IWTCEhPbDmQ=
X-Google-Smtp-Source: ABdhPJw2AI+aFjccPcyYzSR4rYww5i/+ezVKSiPPMSlaRS8B9GVWvKzxW+yd7huvybCbUFELAdnXpsyqD+aEu8zMPDU=
X-Received: by 2002:ae9:e90d:: with SMTP id x13mr27843951qkf.66.1605133773188; 
 Wed, 11 Nov 2020 14:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20201110220550.31965-1-lancelot.kao@fii-usa.com>
In-Reply-To: <20201110220550.31965-1-lancelot.kao@fii-usa.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2020 22:29:20 +0000
Message-ID: <CACPK8Xf8=7dHS=gwHvdS37ZVq_rLJMmKseh-iAqG_BAk6b8tNg@mail.gmail.com>
Subject: Re: [PATCH v2 linux dev-5.8] Fii Kudo project device tree file
To: Lancelot Kao <lancelot.kao@fii-usa.com>
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
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 10 Nov 2020 at 22:06, Lancelot Kao <lancelot.kao@fii-usa.com> wrote:
>
> 1. Add Fii kudo project device tree dts and dtsi
> files to the upstream.

This is your commit message. Have a look at what others have done to
add their machine; it often looks something like this:

Add device tree for the Kuido BMC. Kuido is an x86 server platform
manufactured by Fii and is based on a Nuvoton NPCM730 SoC.

I've made up the details there obviously.

> 2. Remove the duplicate the full path and address
> of node.
> 3. modified syntax

These two items are a good changelog between your v1 and v2. The way
we do changes between revisions is to put them below a ---, at the
bottom of your commit message (below the Signed-off-by). For example:

>
> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
> Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>

---
v2:
 - Remove the duplicate the full path and address of node.
 - Modified syntax

> ---
>  .../boot/dts/nuvoton-npcm730-kudo-gpio.dtsi   | 288 ++++++++
>  arch/arm/boot/dts/nuvoton-npcm730-kudo.dts    | 631 ++++++++++++++++++
>  2 files changed, 919 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
> new file mode 100644
> index 000000000000..0dc888dac73b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Fii USA Inc. Brandon Ong <Brandon.Ong@fii-na.com>

Generally we have the copyright notice and rely on the git history to
know who authored the file. If you really want to have the author, put
it on the next line:

 // Copyright (c) 2020 Fii USA Inc.
 //Brandon Ong <Brandon.Ong@fii-na.com>

> +
> +/ {
> +       pinctrl: pinctrl@f0800000 {

Consider putting the pinctrl description in the kudo dts. Given it's
not a huge number of nodes, I think it would be fine to have them all
in the one file.

> +               gpio61oh_pins: gpio61oh-pins {
> +                       pins = "GPO61/nDTR1_BOUT1/STRAP6";
> +                       bias-disable;
> +                       output-high;
> +               };


> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> new file mode 100644
> index 000000000000..ab5cf1aea220
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> @@ -0,0 +1,631 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Fii USA Inc. Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-kudo-gpio.dtsi"
> +
> +/ {
> +       model = "Fii Kudo Board (Device Tree v00.01)";

Do you need to have the "Device Tree v00.01" in the model string?

> +       compatible = "nuvoton,npcm730";

Add the machine too:

 compatible = "fii,kudo", "nuvoton,npcm730"

> +
> +       aliases {
> +               ethernet0 = &emc0;
> +               ethernet1 = &gmac0;
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
> +               udc9 = &udc9;
> +               emmc0 = &sdhci0;
> +               vdma = &vdma;
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
> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               fiu0 = &fiu0;
> +               fiu1 = &fiu3;
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
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +       };
> +
> +       jtag_master {

This is a
> +               compatible = "nuvoton,npcm750-jtag-master";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               dev-num = <0>; /* /dev/jtag0 */
> +               mode = "pspi"; /* pspi or gpio */
> +
> +               pspi-controller = <2>; /* pspi2 */
> +               reg = <0xf0201000 0x1000>;
> +               interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&clk NPCM7XX_CLK_APB5>;
> +
> +               jtag-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>, /* TCK */
> +                               <&gpio0 18 GPIO_ACTIVE_HIGH>, /* TDI */
> +                               <&gpio0 17 GPIO_ACTIVE_HIGH>, /* TDO */
> +                               <&gpio0 16 GPIO_ACTIVE_HIGH>; /* TMS */
> +               status = "okay";

You don't need to include status=okay; it's enabled by default.

> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               heartbeat {
> +                       label = "heartbeat";
> +                       gpios = <&gpio0 14 1>;
> +               };
> +       };
> +};
> +
> +&gmac0 {
> +       phy-mode = "rgmii-id";
> +       snps,eee-force-disable;
> +       status = "okay";
> +};
> +
> +&emc0 {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&ohci1 {
> +       status = "okay";
> +};
> +
> +&udc9 {
> +       status = "okay";
> +};
> +
> +&aes {
> +       status = "okay";
> +};
> +
> +&sha {
> +       status = "okay";
> +};
> +
> +&fiu0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spi0cs1_pins>;
> +       status = "okay";
> +       spi-nor@0 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@80000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       bmc@0{
> +                               label = "bmc";
> +                               reg = <0x000000 0x2000000>;
> +                       };
> +                       u-boot@0 {
> +                               label = "u-boot";
> +                               reg = <0x0000000 0xf0000>;
> +                       };
> +                       image-descriptor@f0000 {
> +                               label = "image-descriptor";
> +                               reg = <0xf0000 0x10000>;
> +                       };
> +                       reserved-update@100000 {
> +                               label = "reserved-update";
> +                               reg = <0x100000 0x100000>;
> +                       };
> +                       kernel@200000 {
> +                               label = "kernel";
> +                               reg = <0x200000 0x500000>;
> +                       };
> +                       rofs@700000 {
> +                               label = "rofs";
> +                               reg = <0x700000 0x35f0000>;
> +                       };
> +                       rwfs@3cf0000 {
> +                               label = "rwfs";
> +                               reg = <0x3cf0000 0x300000>;
> +                       };
> +                       reserved-mailbox@3ff0000 {
> +                               label = "reserved-mailbox";
> +                               reg = <0x3ff0000 0x10000>;
> +                       };
> +               };
> +       };
> +       spi-nor@1 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <1>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@88000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       spare1@0 {
> +                               label = "spi0-cs1-spare1";
> +                               reg = <0x0 0x800000>;
> +                       };
> +                       spare2@800000 {
> +                               label = "spi0-cs1-spare2";
> +                               reg = <0x800000 0x0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&fiu3 {
> +       pinctrl-0 = <&spi3_pins>;
> +       status = "okay";
> +       spi-nor@0 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@A0000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       system1@0 {
> +                               label = "bios";
> +                               reg = <0x0 0x0>;
> +                       };
> +                       system2@800000 {
> +                               label = "spi3-system2";
> +                               reg = <0x800000 0x0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&sdhci0 {
> +       status = "okay";
> +};
> +
> +&vdma {
> +       status = "okay";
> +};
> +
> +&pcimbox {
> +       status = "okay";
> +};
> +
> +&vcd {
> +       status = "okay";
> +};
> +
> +&ece {
> +       status = "okay";
> +};
> +
> +&watchdog1 {
> +       status = "okay";
> +};
> +
> +&rng {
> +       status = "okay";
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> +
> +&adc {
> +       #io-channel-cells = <1>;
> +       status = "okay";
> +};
> +
> +&otp {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "disabled";

Remove this node if it's disabled.

> +};
> +
> +&i2c1 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;

The node already has the address and size cell information in it. No
need to re-describe it here.

> +       bus-frequency = <100000>;

The default frequency is 100000, so if you're not changing it there's
no need to describe it here.

> +       status = "okay";

Unnecessary status=okay.
> +
> +       i2c-switch@75 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x75>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       max31790@58 { // Fan

Put the comments on the line above the node.

> +                               compatible = "maxim,max31790";
> +                               reg = <0x58>;
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       max31790@58 { // Fan
> +                               compatible = "maxim,max31790";
> +                               reg = <0x58>;
> +                       };
> +               };
> +
> +               i2c-bus@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       lm75@5c { // INLET1_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@5 { // OUTLET1_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@6 { // OUTLET2_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@7 { // OUTLET3_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +       };
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c-bus@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       pmbus@74 { // STB-T
> +                               compatible = "pmbus";
> +                               reg = <0x74>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";

Unnecessary status=okay.

> +
> +       smpro@4f {
> +               compatible = "ampere,smpro";
> +               reg = <0x4f>;
> +       };
> +
> +       smpro@4e {
> +               compatible = "ampere,smpro";
> +               reg = <0x4e>;
> +       };
> +};
> +
> +&i2c3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c-bus@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       adm1266@40 { // ADC sensors
> +                               compatible = "adi,adm1266";
> +                               reg = <0x40>;
> +                       };
> +               };
> +
> +               i2c-bus@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       adm1266@41 { // ADC sensors
> +                               compatible = "adi,adm1266";
> +                               reg = <0x41>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c5 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";

All of these can just be:

&i2cN {
    status = "okay";
}

As the cell and bus-freq information is already in the dtsi.

> +};
> +
> +&i2c6 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       ssif-bmc@10 {
> +               compatible = "ssif-bmc";
> +               reg = <0x10>;
> +               status = "okay";
> +       };
> +};
> +
> +&i2c13 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c-bus@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       lm75@28 { // M2_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x28>;
> +                       };
> +               };
> +
> +               i2c-bus@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       lm75@29 { // BATT_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x29>;
> +                       };
> +               };
> +
> +               i2c-bus@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       lm75@28 { // NBM1_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x28>;
> +                       };
> +               };
> +               i2c-bus@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +
> +                       lm75@29 { // NBM2_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x29>;
> +                       };
> +               };
> +       };
> +};
> +
> +&spi0 {
> +       cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <
> +                       &gpio61oh_pins
> +                       &gpio62oh_pins
> +                       &gpio161ol_pins
> +                       &gpio163i_pins
> +                       &gpio167ol_pins
> +                       &gpio95i_pins
> +                       &gpio65ol_pins
> +                       &gpio66oh_pins
> +                       &gpio67oh_pins
> +                       &gpio68ol_pins
> +                       &gpio69i_pins
> +                       &gpio70ol_pins
> +                       &gpio71i_pins
> +                       &gpio72i_pins
> +                       &gpio73i_pins
> +                       &gpio74i_pins
> +                       &gpio75i_pins
> +                       &gpio76i_pins
> +                       &gpio77i_pins
> +                       &gpio78i_pins
> +                       &gpio79ol_pins
> +                       &gpio80oh_pins
> +                       &gpio81i_pins
> +                       &gpio82i_pins
> +                       &gpio83i_pins
> +                       &gpio144i_pins
> +                       &gpio145i_pins
> +                       &gpio146i_pins
> +                       &gpio147oh_pins
> +                       &gpio168ol_pins
> +                       &gpio169oh_pins
> +                       &gpio170ol_pins
> +                       &gpio218oh_pins
> +                       &gpio37i_pins
> +                       &gpio38i_pins
> +                       &gpio39i_pins
> +                       &gpio40i_pins
> +                       &gpio121i_pins
> +                       &gpio122i_pins
> +                       &gpio123i_pins
> +                       &gpio124i_pins
> +                       &gpio125i_pins
> +                       &gpio126i_pins
> +                       &gpio127i_pins
> +                       &gpio136i_pins
> +                       &gpio137oh_pins
> +                       &gpio138i_pins
> +                       &gpio139i_pins
> +                       &gpio140i_pins
> +                       &gpio141i_pins
> +                       &gpio190oh_pins
> +                       &gpio191oh_pins
> +                       &gpio195ol_pins
> +                       &gpio196ol_pins
> +                       &gpio199i_pins
> +                       &gpio202ol_pins
> +                       >;
> +};
> +
> +&gcr {
> +       serial_port_mux: mux-controller {
> +               compatible = "mmio-mux";
> +               #mux-control-cells = <1>;
> +
> +               mux-reg-masks = <0x38 0x07>;
> +               idle-states = <2>;
> +       };
> +};
> --
> 2.17.1
>
