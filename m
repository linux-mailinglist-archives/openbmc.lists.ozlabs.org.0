Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAD22FCDA
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:18:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwjH55gxzDqmF
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:18:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KiIBbWcB; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwhL1Lt1zDqk7;
 Tue, 28 Jul 2020 09:17:51 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id g11so6987913ejr.0;
 Mon, 27 Jul 2020 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDnv2u+7TDzJf6n14HBXmnArxjJaJEHjEbe0bHhRUEs=;
 b=KiIBbWcBZhyW+O5o7G4YzliTSdzRlHO3ORbQkKF7vDXDh+RKwoKsVS45CuN6sDhcwi
 MS6gtQ4SbOeq5N0U5rZO71owLxneWs+NmllXn5j9Yxmf5YXLh/ug6/MQNw66FQv3ZTm0
 +ys2uAAqEIS/PjtOWviT2taNv9v6u0vORAEU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDnv2u+7TDzJf6n14HBXmnArxjJaJEHjEbe0bHhRUEs=;
 b=CN9DMd+TEcDBlIveNwHfqM59Pn8nYjeCqjexlkzQ4i7VPwdy0dNx3t7Om3DigCzHxL
 7LwtYL39/a617Fof1PxuDB9iDzBk8TQE9ftyPGhOjEhEkAdTA4Hoa1tACWELFSLuAt8o
 ys0qk4FDsTjDOsmv5cKkwr3cy18hsO/DsDI3f80QIcqgJasIt+W1/guUmWvAUQmYJhrI
 a/wnhWu/cuz5ia/HFgKEDuyX3ELhZgq5qHoOq+EOKZJr8jvsnZP3yXoRad0sgX6L315/
 +PNM2fhuRm2iqgB/+G+gtPmSnjc93FW1D153wGGDakuDjUrGQ0th5tDYL0fzpZBzyw40
 nHHw==
X-Gm-Message-State: AOAM530ndwWXqENQvtPuo26443NewOG6OITfH98nHWx66t2fRsR3ET8q
 OhEnqp24fM6fcyFtBPNCPtAedpv8xCYgoO+SP69zozDs
X-Google-Smtp-Source: ABdhPJxOcmWyKoA18jpAXsp32LtWuJw1BLE/bPSxZbhDgSL2NjTVUOG5rI+yrx1nsrMlE7eI1AugXL9kMzpILn9Lr7w=
X-Received: by 2002:a17:906:488:: with SMTP id
 f8mr13964940eja.215.1595891865841; 
 Mon, 27 Jul 2020 16:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200724192818.68068-1-supreeth.venkatesh@amd.com>
In-Reply-To: <20200724192818.68068-1-supreeth.venkatesh@amd.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Jul 2020 23:17:33 +0000
Message-ID: <CACPK8XcZCySQt_wVzkthciYWg_GfOY-7VAkFxu5TjuJRRMFRxQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ARM:dts:aspeed: Initial device tree for AMD
 EthanolX
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 at 19:28, Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
> Initial introduction of AMD EthanolX platform equipped with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> AMD EthanolX platform is an AMD customer reference board with an
> Aspeed ast2500 BMC manufactured by AMD.
> This adds AMD EthanolX device tree file including the flash layout
> used by EthanolX BMC machines.
>
> This also adds an entry of AMD EthanolX device tree file in Makefile.
>
> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>

Looks good! I've merged this to dt-for-5.9.

Cheers,

Joel

> ---
> Changes since v2:
> * Removed incorrect I2C0 and I2C1 Reg addresses
>
> Changes since v1:
> * Addressed review comment regarding SPDX License Identifier
> * Added I2c0 and I2c1 which cater to AMD's APML Interface
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 219 ++++++++++++++++++
>  2 files changed, 220 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d6dfdf73e66b..55ed881d2ebc 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1281,6 +1281,7 @@ dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-ast2500-evb.dtb \
>         aspeed-ast2600-evb.dtb \
> +       aspeed-bmc-amd-ethanolx.dtb \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> new file mode 100644
> index 000000000000..60ba86f3e5bc
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 AMD Inc.
> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AMD EthanolX BMC";
> +       compatible = "amd,ethanolx-bmc", "aspeed,ast2500";
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fault {
> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               #include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +                <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +};
> +
> +&uart1 {
> +       //Host Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                    &pinctrl_rxd1_default>;
> +};
> +
> +&uart5 {
> +       //BMC Console
> +       status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                    &pinctrl_adc1_default
> +                    &pinctrl_adc2_default
> +                    &pinctrl_adc3_default
> +                    &pinctrl_adc4_default>;
> +};
> +
> +//APML for P0
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +//APML for P1
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +// Thermal Sensors
> +&i2c7 {
> +       status = "okay";
> +
> +       lm75a@48 {
> +               compatible = "national,lm75a";
> +               reg = <0x48>;
> +       };
> +
> +       lm75a@49 {
> +               compatible = "national,lm75a";
> +               reg = <0x49>;
> +       };
> +
> +       lm75a@4a {
> +               compatible = "national,lm75a";
> +               reg = <0x4a>;
> +       };
> +
> +       lm75a@4b {
> +               compatible = "national,lm75a";
> +               reg = <0x4b>;
> +       };
> +
> +       lm75a@4c {
> +               compatible = "national,lm75a";
> +               reg = <0x4c>;
> +       };
> +
> +       lm75a@4d {
> +               compatible = "national,lm75a";
> +               reg = <0x4d>;
> +       };
> +
> +       lm75a@4e {
> +               compatible = "national,lm75a";
> +               reg = <0x4e>;
> +       };
> +
> +       lm75a@4f {
> +               compatible = "national,lm75a";
> +               reg = <0x4f>;
> +       };
> +};
> +
> +&kcs1 {
> +       status = "okay";
> +       kcs_addr = <0x60>;
> +};
> +
> +&kcs2 {
> +       status = "okay";
> +       kcs_addr = <0x62>;
> +};
> +
> +&kcs4 {
> +       status = "okay";
> +       kcs_addr = <0x97DE>;
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&lpc_ctrl {
> +       //Enable lpc clock
> +       status = "okay";
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default
> +       &pinctrl_pwm1_default
> +       &pinctrl_pwm2_default
> +       &pinctrl_pwm3_default
> +       &pinctrl_pwm4_default
> +       &pinctrl_pwm5_default
> +       &pinctrl_pwm6_default
> +       &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +};
> +
> +
> +
> --
> 2.17.1
>
