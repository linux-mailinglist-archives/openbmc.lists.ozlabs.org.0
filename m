Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004ED2C5F08
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 04:36:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj0fQ6X1DzDrRH
	for <lists+openbmc@lfdr.de>; Fri, 27 Nov 2020 14:36:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VOCZuelb; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj0dY0NXdzDrK0
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2020 14:35:44 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id m65so2448480qte.11
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 19:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0OZtue9TWBvLStqCvRYGGmzmX2pOQMeTappprVdEUpE=;
 b=VOCZuelbcuvaF8LJM8ut8q4EuWykOicHsv3Wq6B3N9Vi7xNNr1ovgOltgo/6RHYxr/
 YNyH82sf1FyfMjF277H64O+T18Z/WId9mqzfMWM2BLdC9d6bNUVzj1Ndg0FpGRLx9LBN
 L/cKbJXEzVTWpwARxhmdQkTII3+4pgyRD58hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0OZtue9TWBvLStqCvRYGGmzmX2pOQMeTappprVdEUpE=;
 b=cEeVWgw+DIjaW770UvOeaHnrXl29BE0egxG0flb7St18g+eOyc2aXLNY6fb9IRiWDB
 5iUR4c8CCT1xuDcoExSPcCCf0UxfzA3/T0L3z3vhTbHmRL1hSH/Bq0px4D+jEo9nbXYs
 RMj4R0J3tPh+SVHGFm47yTQI8LzcCXXbdiSPjg5zOQheVjSqBNDzItYyaqhSzNYVu8Kq
 98uFQEb/MMWv/8dfYXEBz4zDhRpp1lBPRDezc8U76HANGb0ZqOT2CfVkWawkDfWZg451
 u04PPbxm++osmQM2v7rGCAagEO4m90PHWxpbtMOq+NufiGk1DQrLykvR+sp/2enNbfv0
 vePw==
X-Gm-Message-State: AOAM530onmRgEGsdyJCzpHUOOXNjRxHLDjXjv9t3DFHu/9aXhg5GlGk8
 7jRiX0K5WWTlb/JqsA0mbelRE4NSCnPqU+gTfRM=
X-Google-Smtp-Source: ABdhPJyO0Y5/Zsw0quKzdt8hvFrBib3yVg/QFJlAk44+l6+pJuBh0jKTrLlXKasbr/q5X5vMnZFK9P/4+apPt+YGQjA=
X-Received: by 2002:aed:33a3:: with SMTP id v32mr6220186qtd.263.1606448140081; 
 Thu, 26 Nov 2020 19:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20201127024158.1486-1-quan@os.amperecomputing.com>
 <20201127024158.1486-3-quan@os.amperecomputing.com>
In-Reply-To: <20201127024158.1486-3-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Nov 2020 03:35:26 +0000
Message-ID: <CACPK8Xfp4hv4nWrBNDRS=fxSrpMOfSJPGM3Z8fYawZNPRYf-3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jade BMC
To: Quan Nguyen <quan@os.amperecomputing.com>
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
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 27 Nov 2020 at 02:42, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> The Mt. Jade BMC is an ASPEED AST2500-based BMC for the Mt. Jade
> hardware reference platform with Ampere's Altra Processor Family.

Hello Quan,

This patch looks good. Some minor comments below.

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 568 ++++++++++++++++++
>  2 files changed, 569 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 9537b2e5aad6..6d4ae66f8cf7 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1394,6 +1394,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-ast2500-evb.dtb \
>         aspeed-ast2600-evb.dtb \
>         aspeed-bmc-amd-ethanolx.dtb \
> +       aspeed-bmc-ampere-mtjade.dtb \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> new file mode 100644
> index 000000000000..c89ab60bff74
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Ampere Mt. Jade BMC";
> +       compatible = "ampere,mtjade-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>; /* 16M */
> +               };
> +
> +               flash_memory: region@98000000 {

This is used by the aspeed-lpc-ctrl driver to map some of the BMC's
memory space into the LPC address space, allowing complicated host <->
bmc data exchange. Normally this is only used by the PowerPC
platforms.

> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };
> +
> +               gfx_memory: framebuffer {

Are you sure your system uses this? This is for the BMC's internal
graphic device, not the PCIe attached graphic device. It only does
something if you have added code to your BMC that displays something.

Most platforms only use the PCIe device.

> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               video_engine_memory: jpegbuffer {
> +                       size = <0x02000000>;    /* 32M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fault {
> +                       gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_HIGH>;
> +               };
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(Q, 6) GPIO_ACTIVE_HIGH>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               shutdown_ack {
> +                       label = "SHUTDOWN_ACK";
> +                       gpios = <&gpio ASPEED_GPIO(G, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(G, 2)>;
> +               };
> +
> +               reboot_ack {
> +                       label = "REBOOT_ACK";
> +                       gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 3)>;
> +               };
> +
> +               S0_overtemp {
> +                       label = "S0_OVERTEMP";
> +                       gpios = <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(G, 3)>;
> +               };
> +
> +               S0_hightemp {
> +                       label = "S0_HIGHTEMP";
> +                       gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 0)>;
> +               };
> +
> +               S0_cpu_fault {
> +                       label = "S0_CPU_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(J, 1)>;
> +               };
> +
> +               S1_overtemp {
> +                       label = "S1_OVERTEMP";
> +                       gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(Z, 6)>;
> +               };
> +
> +               S1_hightemp {
> +                       label = "S1_HIGHTEMP";
> +                       gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(AB, 0)>;
> +               };
> +
> +               S1_cpu_fault {
> +                       label = "S1_CPU_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(Z, 1)>;
> +               };
> +
> +               id_button {
> +                       label = "ID_BUTTON";
> +                       gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(Q, 5)>;
> +               };
> +
> +       };
> +
> +       gpioA0mux: mux-controller {
> +               compatible = "gpio-mux";
> +               #mux-control-cells = <0>;
> +               mux-gpios = <&gpio ASPEED_GPIO(A, 0) GPIO_ACTIVE_LOW>;
> +       };
> +
> +       adc0mux: adc0mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 0>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc1mux: adc1mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 1>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc2mux: adc2mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 2>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc3mux: adc3mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 3>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc4mux: adc4mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 4>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc5mux: adc5mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 5>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc6mux: adc6mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 6>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc7mux: adc7mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 7>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc8mux: adc8mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 8>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc9mux: adc9mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 9>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc10mux: adc10mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 10>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc11mux: adc11mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 11>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc12mux: adc12mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 12>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       adc13mux: adc13mux {
> +               compatible = "io-channel-mux";
> +               io-channels = <&adc 13>;
> +               #io-channel-cells = <1>;
> +               io-channel-names = "parent";
> +               mux-controls = <&gpioA0mux>;
> +               channels = "s0", "s1";
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0mux 0>, <&adc0mux 1>,
> +                       <&adc1mux 0>, <&adc1mux 1>,
> +                       <&adc2mux 0>, <&adc2mux 1>,
> +                       <&adc3mux 0>, <&adc3mux 1>,
> +                       <&adc4mux 0>, <&adc4mux 1>,
> +                       <&adc5mux 0>, <&adc5mux 1>,
> +                       <&adc6mux 0>, <&adc6mux 1>,
> +                       <&adc7mux 0>, <&adc7mux 1>,
> +                       <&adc8mux 0>, <&adc8mux 1>,
> +                       <&adc9mux 0>, <&adc9mux 1>,
> +                       <&adc10mux 0>, <&adc10mux 1>,
> +                       <&adc11mux 0>, <&adc11mux 1>,
> +                       <&adc12mux 0>, <&adc12mux 1>,
> +                       <&adc13mux 0>, <&adc13mux 1>;
> +       };
> +
> +       iio-hwmon-adc14 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 14>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 15>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               /* spi-max-frequency = <50000000>; */
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +               /* spi-max-frequency = <100000000>; */
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                        &pinctrl_rxd1_default
> +                        &pinctrl_ncts1_default
> +                        &pinctrl_nrts1_default>;
> +};
> +
> +&uart2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                        &pinctrl_rxd2_default>;
> +};
> +
> +&uart3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default
> +                        &pinctrl_rxd3_default>;
> +};
> +
> +&uart4 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd4_default
> +                        &pinctrl_rxd4_default>;
> +};
> +
> +/* The BMC's uart */
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "disabled";

This is disabled by default, if you don't use it then omit this line.

> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       eeprom@50 {
> +               compatible = "microchip,24c64", "atmel,24c64";
> +               reg = <0x50>;
> +               pagesize = <32>;
> +       };
> +
> +       inlet_mem2: tmp175@28 {
> +               compatible = "ti,tmp175";
> +               reg = <0x28>;
> +       };
> +
> +       inlet_cpu: tmp175@29 {
> +               compatible = "ti,tmp175";
> +               reg = <0x29>;
> +       };
> +
> +       inlet_mem1: tmp175@2a {
> +               compatible = "ti,tmp175";
> +               reg = <0x2a>;
> +       };
> +
> +       outlet_cpu: tmp175@2b {
> +               compatible = "ti,tmp175";
> +               reg = <0x2b>;
> +       };
> +
> +       outlet1: tmp175@2c {
> +               compatible = "ti,tmp175";
> +               reg = <0x2c>;
> +       };
> +
> +       outlet2: tmp175@2d {
> +               compatible = "ti,tmp175";
> +               reg = <0x2d>;
> +       };
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       rtc@51 {
> +               compatible = "nxp,pcf85063a";
> +               reg = <0x51>;
> +       };
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       psu@58 {
> +               compatible = "pmbus";
> +               reg = <0x58>;
> +       };
> +
> +       psu@59 {
> +               compatible = "pmbus";
> +               reg = <0x59>;
> +       };
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
> +&pinctrl {
> +       aspeed,external-nodes = <&gfx &lhc>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm2_default &pinctrl_pwm3_default
> +                       &pinctrl_pwm4_default &pinctrl_pwm5_default
> +                       &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> +       };
> +
> +       fan@8 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
> +       };
> +
> +       fan@9 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
> +       };
> +
> +       fan@10 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
> +       };
> +
> +       fan@11 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0f>;
> +       };
> +
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> +
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio {
> +       gpio-line-names =
> +       /*A0-A7*/       "","","","S0_BMC_SPECIAL_BOOT","","","","",
> +       /*B0-B7*/       "BMC_SELECT_EEPROM","","","",
> +                       "POWER_BUTTON","","","",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "","","BMC_SYS_PSON_L","S0_DDR_SAVE","PGOOD",
> +                       "S1_DDR_SAVE","","",
> +       /*G0-G7*/       "S0_FW_BOOT_OK","SHD_REQ_L","","S0_OVERTEMP_L","","",
> +                       "","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","S1_BMC_SPECIAL_BOOT","","","","","",
> +       /*J0-J7*/       "S0_HIGHTEMP_L","S0_FAULT_L","S0_SCP_AUTH_FAIL_L","",
> +                       "","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","BMC_SYSRESET_L","SPI_AUTH_FAIL_L","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
> +       /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","","","RESET_BUTTON","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/       "S0_BMC_PLIMIT","S1_FAULT_L","S1_FW_BOOT_OK","","",
> +                       "S1_SCP_AUTH_FAIL_L","S1_OVERTEMP_L","",
> +       /*AA0-AA7*/     "","","","","","","","",
> +       /*AB0-AB7*/     "S1_HIGHTEMP_L","S1_BMC_PLIMIT","S0_BMC_DDR_ADDR",
> +                       "S1_BMC_DDR_ADR","","","","",
> +       /*AC0-AC7*/     "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
> +                       "BMC_OCP_PG";
> +};
> +

Remove the blank line from the end.


> --
> 2.28.0
>
