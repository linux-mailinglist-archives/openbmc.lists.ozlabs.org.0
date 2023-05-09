Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 964456FBECF
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 07:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFnCG2ssKz3fKF
	for <lists+openbmc@lfdr.de>; Tue,  9 May 2023 15:43:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Gz15a+us;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Gz15a+us;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFnBg6Xtvz3blV
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 15:43:21 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso9880921a12.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 May 2023 22:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1683610996; x=1686202996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejZaRz7nLcEBFVDwDsxUFGZkwts3LqyOQvk9j0Y1b+Y=;
        b=Gz15a+us+tTxdEl0TdOXO9lVEo93iu+JwSR0kvA/W6/aPIDfoFCDQ2qoItz/aGPFNk
         EWUTElpblDDuSiOIVB26Y3B7Huib7J7R7iFB0Lb8VDThWnkzGeGB6L3oBtIl+IH41QUX
         LY1q9BiVnwCxE6AYEWU5KUee1n3Sx90vDHhrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683610996; x=1686202996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejZaRz7nLcEBFVDwDsxUFGZkwts3LqyOQvk9j0Y1b+Y=;
        b=dws2F1PewXVywF7IV1/A63WUBgpA5kCxJ5GkWbvkxeXJyLRyZ9+f9VfUIirrTLtB42
         +VZm6pNEjNUMMqLq4VrQSck4cdAjPCdGgyINEuyUge1LR8QfSIpXsju9DGkJzz55G9l/
         3Dzo93YMAOyFLHVlNYUR4mE50uR8o5rUf/T3euALT48rY1VYkIQaTWdEJWZ14HYYehTJ
         3UXntJuyn8k/RQ2Jj9s5P19xYKPXJxGqxFtpliEWGtqiARfU+cuqmwJroqXzeubrhrzp
         whjm7LKsntJXjUzZ97pyKpSOP3w1MtGaDYXWNuHXyO9/BKjkSQljtzuebfxq+KkXuoxk
         f2aQ==
X-Gm-Message-State: AC+VfDzDWGoVkG6j0IW1LYl5tXloU/5/kEHHs4p2C7Pt76bGhuHxlFc9
	nMleKYm2saWWzEE9XYAVYD71KaLvc2DxlxXvQmjeYV7w+KM=
X-Google-Smtp-Source: ACHHUZ7ZMSWCto9rSNhqxlDbN5D5EH6bt/PBWUbdgxDd1PPRRCnx9ZVMti/d/YNePJtUABRh6oZyXU8go3cehVsK/Ic=
X-Received: by 2002:a17:907:6e10:b0:968:1e8:a754 with SMTP id
 sd16-20020a1709076e1000b0096801e8a754mr4040726ejc.72.1683610995854; Mon, 08
 May 2023 22:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230509001102.5886-1-ryans@supermicro.com.tw>
In-Reply-To: <20230509001102.5886-1-ryans@supermicro.com.tw>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 May 2023 05:43:02 +0000
Message-ID: <CACPK8XcNmfte8+tNxpi_Jr4YvnUHSLPe3PgBEvTYtF7Loqp5Dg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Supermicro X13dem system BMC devicetree
To: lesly895@gmail.com
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
Cc: andrew@aj.id.au, Ryan Sie <ryans@supermicro.com.tw>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 9 May 2023 at 00:11, <lesly895@gmail.com> wrote:
>
> From: Ryan Sie <ryans@supermicro.com.tw>
>
> Add a devicetree for the new X13dem system.

That is obvious. Some more details about the system would help for review.

>
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
> ---
>  .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 283 ++++++++++++++++++
>  1 file changed, 283 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> new file mode 100644
> index 000000000000..b5aac905e7ea
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2023 Supermicro Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model = "X13dem";

Convetion is to name the machine the model + BMC, so this would be "X13DEM BMC".

> +       compatible = "aspeed,ast2600";

Needs a compatible for the machine.

> +
> +       aliases {
> +               mmc0 = &emmc;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200n8 earlycon";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               /* LPC FW cycle bridge region requires natural alignment */
> +               flash_memory: region@b4000000 {
> +                       no-map;
> +                       reg = <0xb4000000 0x04000000>; /* 64M */

Are you sure you need this?

> +               };
> +
> +               /* VGA region is dictated by hardware strapping */
> +               vga_memory: region@bf000000 {
> +                       no-map;
> +                       compatible = "shared-dma-pool";
> +                       reg = <0xbf000000 0x01000000>;  /* 16M */

Are you sure you need this?

> +               };
> +       };
> +
> +       leds {
> +           compatible = "gpio-leds";
> +           powerfail {
> +                   gpios = <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
> +           };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +                       <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                       <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +                       <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +       };
> +};
> +
> +&adc0 {
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +               &pinctrl_adc2_default &pinctrl_adc3_default
> +               &pinctrl_adc4_default &pinctrl_adc5_default
> +               &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +               &pinctrl_adc10_default &pinctrl_adc11_default
> +               &pinctrl_adc12_default &pinctrl_adc13_default
> +               &pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&emmc_controller {
> +       status = "okay";
> +};
> +
> +&pinctrl_emmc_default {
> +       bias-disable;
> +};
> +
> +&emmc {
> +       status = "okay";
> +       clk-phase-mmc-hs200 = <180>, <180>;
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
> +               label = "spi1:0";
> +               spi-max-frequency = <25000000>;
> +       };
> +};
> +
> +&gpio0 {
> +       status = "okay";
> +       gpio-line-names =

Consult this document for common names:

 https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","","","","jpfr2","jpfr3",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "","","","","","","","",
> +       /*E0-E7*/       "","","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "","","","","","pwrfail-led","","",
> +       /*H0-H7*/       "smc-n","nmi-n","pwrbtn-n","rst-n","","","phy1-rst","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","speaker-bmc",
> +       /*P0-P7*/       "cpld-int","","","","","","","bmc-hbled-n",
> +       /*Q0-Q7*/       "","","","","","","","",
> +       /*R0-R7*/       "","","","","pwr-ctrl-4","","","",
> +       /*S0-S7*/       "","","wake-n","","pwrok-in","pcie-rst-in","","uid-sw-in",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","bios-cmp-in","smci-pch-out","","","","nmi-in","bmc-ready",
> +       /*Y0-Y7*/       "","bmc-hb-led","bmc-cpld-mux-sel","emmc-rst","","","sci-bmc-out","",
> +       /*Z0-Z7*/       "bmc-prg-n","pwer-ctrl-1","pwrbtn-in","","","","","";
> +};
> +
> +&gpio1 {
> +       status = "disabled";
> +};
> +
> +&sgpiom0 {
> +       status = "disabled";

If you're disabling it you can remove the names below.

> +       gpio-line-names =
> +       /* SGPIO output lines */
> +       /*OA0-OA7*/     "","","","","","","","",
> +       /*OB0-OB7*/     "","","","","","","","",
> +       /*OC0-OC7*/     "","","","","","","","",
> +       /*OD0-OD7*/     "","","","","","","","",
> +       /*OE0-OE7*/     "","","","","","","","",
> +       /*OF0-OF7*/     "","","","","","","","",
> +       /*OG0-OG7*/     "","","","","","","","",
> +       /*OH0-OH7*/     "","","","","","","","",
> +       /*OI0-OI7*/     "","","","","","","","",
> +       /*OJ0-OJ7*/     "","","","","","","","",
> +       /*DUMMY*/       "","","","","","","","",
> +       /*DUMMY*/       "","","","","","","","",
> +
> +       /* SGPIO input lines */
> +       /*IA0-IA7*/     "","","","","","","","",
> +       /*IB0-IB7*/     "","","","","","","","",
> +       /*IC0-IC7*/     "","","","","","","","",
> +       /*ID0-ID7*/     "","","","","","","","",
> +       /*IE0-IE7*/     "","","","","","","","",
> +       /*IF0-IF7*/     "","","","","","","","",
> +       /*IG0-IG7*/     "","","","","","","","",
> +       /*IH0-IH7*/     "","","","","","","","",
> +       /*II0-II7*/     "","","","","","","","",
> +       /*IJ0-IJ7*/     "","","","","","","","";
> +};
> +
> +&kcs3 {
> +       aspeed,lpc-io-reg = <0xca2>;
> +       status = "okay";
> +};
> +
> +&kcs4 {
> +       aspeed,lpc-io-reg = <0xca4>;
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&uart2 {
> +       status = "okay";
> +};
> +
> +&uart3 {
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       status = "okay";
> +};
> +
> +&uart_routing {
> +       status = "okay";
> +};
> +
> +&mdio0 {
> +       status = "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy0>;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii3_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
> +                       <&syscon ASPEED_CLK_MAC3RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +       use-ncsi;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "disabled";
> +};
> +
> +&i2c2 {
> +       multi-master;
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       bus-frequency = <400000>;
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +};
> +
> +&xdma {
> +       status = "okay";
> +       memory-region = <&vga_memory>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&rtc {
> +       status = "okay";
> +};
> +
> --
> 2.34.1
>
