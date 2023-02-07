Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789FD68CE12
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 05:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qYg21gYz3bTc
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 15:15:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N7yOeKRk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N7yOeKRk;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9qY10ykYz2yNy
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 15:15:15 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id ud5so40078952ejc.4
        for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2023 20:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPehyIvW2C1qL4uXhq9wDyg+XcnX3JTJtY2HWvt1p/w=;
        b=N7yOeKRkqT11JIEWKyoiUEbfvgP1OW/FSSq/8dGiJOa72DYRWN0pHrkr4MJSSOeoZk
         g1fRZoqny510xutjwQrC3TXiuT1GZU5C/znQtMsNvwMrgs8+MOyCKcMMpb9on8/h1fkl
         JRK6WZAMQA34sJX4na+WpIZsxLkSZKHE16VoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPehyIvW2C1qL4uXhq9wDyg+XcnX3JTJtY2HWvt1p/w=;
        b=WpCgCZ0c6LU21ooUMARpy6V/0ZYmI8ghdRXEWVevk2E+WWmXEo13u2mTAnsKYpLABg
         IQAuRoQ3kkHpt7PWb0yvBA+02ODpn7Vpzv2A1Bdyamuyf8+Nd3j4x6/h54mKYZ/HPflK
         6HGRcNDUcihNX1d91EV73pdUnNQeBYx83VvsSsyimzENKV4yaGwrq+rqIyyp8NhwO5az
         C+QLkZxrVj04oQAoo3KuRvAUQ9Q0h8W9DDI+nVceuO1tXMBltA6lKlbATLrZrSNLOtQq
         lCWjDGrk6FgCrZhPqodT/l2/ezbDMSRt52CnmviOCkWnqU+WZXf226iXMIb5wl6+/ES9
         X/Zw==
X-Gm-Message-State: AO0yUKXu5AIMpDdMi06WGDlmJ+mkCiTKj3TmXfDLx5qzAtc86avygkVj
	jzlBQGrK60oaLZGBR6TANXPpTB07B8h2+o9Hz+E=
X-Google-Smtp-Source: AK7set+ae8WQzdhfyOaScLUakIGyNK1T8zU7DoFPfUAImQLxVoso9b9OPlABdgxf9aXl7i7zi6IgPyHs+SHvQuEEXPE=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr495154ejz.201.1675743310971; Mon, 06 Feb
 2023 20:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20230202085458.6786-1-ryans@supermicro.com.tw>
In-Reply-To: <20230202085458.6786-1-ryans@supermicro.com.tw>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 04:14:58 +0000
Message-ID: <CACPK8XdE0sRmt4x54YJVJO2wDT5cm2AkRfGBoyn+h9P668K5mg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add Supermicro X13DEM (AST2600) BMC
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
Cc: andrew@aj.id.au, Ryan Sie <ryans@supermicro.com.tw>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 Feb 2023 at 08:55, <lesly895@gmail.com> wrote:
>
> From: Ryan Sie <ryans@supermicro.com.tw>
>
> Add initial version of device tree for Supermicro X13DEM (AST2600) BMC.
> X13DEM is Supermicro's next generation Hyper platform with an AST2600 BMC.
>
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>

A good start, thanks. Can you also cc the linux-arm-kernel list for
future versions?

> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-supermicro-x13dem.dts | 398 ++++++++++++++++++
>  2 files changed, 399 insertions(+)
>  create mode 100664 arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 2ee9c043218b..3b89006fa008 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1623,6 +1623,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-quanta-q71l.dtb \
>         aspeed-bmc-quanta-s6q.dtb \
>         aspeed-bmc-supermicro-x11spi.dtb \
> +       aspeed-bmc-supermicro-x13dem.dtb \
>         aspeed-bmc-inventec-transformers.dtb \
>         aspeed-bmc-tyan-s7106.dtb \
>         aspeed-bmc-tyan-s8036.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> new file mode 100664
> index 000000000000..7c0771904544
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-supermicro-x13dem.dts
> @@ -0,0 +1,398 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2023 Supermicro Corp.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model = "AST2600 BMC";
> +       compatible = "aspeed,ast2600";

Update both of thsese to have your board name. See other boards for what to do.

> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
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
> +               video_engine_memory: video {
> +                       size = <0x04000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +               gfx_memory: framebuffer {

are you sure you need this?

> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +
> +       };
> +
> +       leds {
> +           compatible = "gpio-leds";
> +           powerfail {
> +               default-state = "off";
> +               gpios = <&gpio0 ASPEED_GPIO(G, 5) GPIO_ACTIVE_LOW>;
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
> +
> +       aliases {
> +               mmc0 = &emmc;
> +       };
> +
> +};
> +
> +&emmc_controller {
> +       status = "okay";
> +};
> +
> +&emmc {
> +       status = "okay";
> +
> +       non-removable;
> +       max-frequency = <100000000>;
> +       sdhci-drive-type = /bits/ 8 <3>;
> +       bus-width = <4>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               label = "bmc";
> +               spi-max-frequency = <25000000>;
> +               spi-tx-bus-width = <1>;
> +               m25p,fast-read;
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       u-boot@0 {
> +                               reg = <0x0 0x100000>;
> +                               label = "u-boot";
> +                       };
> +                       u-boot-env@3f0000 {
> +                               reg = <0x3f0000 0x10000>;
> +                               label = "u-boot-env";
> +                       };
> +                       u-boot-env-redund@7f0000 {
> +                               reg = <0x7f0000 0x10000>;
> +                               label = "u-boot-env-redund";

We don't normally have a separate partition here, although this is
something you can do.

Are you using openbmc on this board?

> +                       };
> +               };
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               label = "spi1:0";
> +               spi-max-frequency = <25000000>;
> +               spi-bus-width = <1>;
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       all-bios@0 {
> +                               label = "all_part_bios";
> +                               reg = <0x000000000 0x02000000>;

These numbers look suspicious. Too many 0s?

> +                       };
> +               };
> +       };
> +
> +};
> +
> +&spi2 {
> +       status = "disabled";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default &pinctrl_spi2cs2_default
> +                               &pinctrl_qspi2_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "spi2:0";
> +               spi-max-frequency = <100000000>;
> +               spi-bus-width = <2>;
> +               m25p,fast-read;
> +       };
> +};
> +
> +&adc0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> +               &pinctrl_adc2_default &pinctrl_adc3_default
> +               &pinctrl_adc4_default &pinctrl_adc5_default
> +               &pinctrl_adc6_default &pinctrl_adc7_default>;
> +};
> +
> +&adc1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +               &pinctrl_adc10_default &pinctrl_adc11_default
> +               &pinctrl_adc12_default &pinctrl_adc13_default
> +               &pinctrl_adc14_default &pinctrl_adc15_default>;
> +};
> +
> +&gpio0 {
> +       status = "okay";
> +       gpio-line-names =
> +               /*A0-A7*/       "","","","","","","","",
> +               /*B0-B7*/       "","","","","","","","",
> +               /*C0-C7*/       "","","","","","","","",
> +               /*D0-D7*/       "","","","","","","","",
> +               /*E0-E7*/       "","","","","","","","",
> +               /*F0-F7*/       "","","","","","","","",
> +               /*G0-G7*/       "","","","","","","","",
> +               /*H0-H7*/       "","NMI_N","PWRBTN_N","RST_N","","","","",

If you're using openbmc, consider the generic names for common GPIOs.

> +               /*I0-I7*/       "","","","","","","","",
> +               /*J0-J7*/       "","","","","","","","",
> +               /*K0-K7*/       "","","","","","","","",
> +               /*L0-L7*/       "","","","","","","","",
> +               /*M0-M7*/       "","","","","","","","",
> +               /*N0-N7*/       "","","","","","","","",
> +               /*O0-O7*/       "","","","","","","","",
> +               /*P0-P7*/       "","","","","","","","",
> +               /*Q0-Q7*/       "","","","","","","","",
> +               /*R0-R7*/       "","","","","","","","",
> +               /*S0-S7*/       "","","","","PWROK_IN","","","",
> +               /*T0-T7*/       "","","","","","","","",
> +               /*U0-U7*/       "","","","","","","","",
> +               /*V0-V7*/       "","","","","","","","",
> +               /*W0-W7*/       "","","","","","","","",
> +               /*X0-X7*/       "","BIOS_CMP_IN","","","","","","",
> +               /*Y0-Y7*/       "","","","","","","","",
> +               /*Z0-Z7*/       "","","PWRBTN_IN","","","","","";
> +};
> +
> +&gpio1 {
> +       status = "disabled";
> +};
> +
> +&sgpiom0 {
> +       status = "disabled";
> +       gpio-line-names =
> +               /* SGPIO output lines */
> +               /*OA0-OA7*/     "","","","","","","","",
> +               /*OB0-OB7*/     "","","","","","","","",
> +               /*OC0-OC7*/     "","","","","","","","",
> +               /*OD0-OD7*/     "","","","","","","","",
> +               /*OE0-OE7*/     "","","","","","","","",
> +               /*OF0-OF7*/     "","","","","","","","",
> +               /*OG0-OG7*/     "","","","","","","","",
> +               /*OH0-OH7*/     "","","","","","","","",
> +               /*OI0-OI7*/     "","","","","","","","",
> +               /*OJ0-OJ7*/     "","","","","","","","",
> +               /*DUMMY*/       "","","","","","","","",
> +               /*DUMMY*/       "","","","","","","","",
> +
> +               /* SGPIO input lines */
> +               /*IA0-IA7*/     "","","","","","","","",
> +               /*IB0-IB7*/     "","","","","","","","",
> +               /*IC0-IC7*/     "","","","","","","","",
> +               /*ID0-ID7*/     "","","","","","","","",
> +               /*IE0-IE7*/     "","","","","","","","",
> +               /*IF0-IF7*/     "","","","","","","","",
> +               /*IG0-IG7*/     "","","","","","","","",
> +               /*IH0-IH7*/     "","","","","","","","",
> +               /*II0-II7*/     "","","","","","","","",
> +               /*IJ0-IJ7*/     "","","","","","","","";
> +};
> +
> +&kcs3 {
> +       aspeed,lpc-io-reg = <0xCA2>;
> +       status = "okay";
> +};
> +
> +&kcs4 {
> +       aspeed,lpc-io-reg = <0xCA4>;
> +       status = "okay";
> +};
> +
> +&lpc_snoop {
> +       snoop-ports = <0x80>;
> +       status = "okay";
> +};
> +
> +&uart1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                       &pinctrl_rxd1_default
> +                       &pinctrl_nrts1_default
> +                       &pinctrl_ndtr1_default
> +                       &pinctrl_ndsr1_default
> +                       &pinctrl_ncts1_default
> +                       &pinctrl_ndcd1_default
> +                       &pinctrl_nri1_default>;
> +};
> +
> +&uart2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                       &pinctrl_rxd2_default
> +                       &pinctrl_nrts2_default
> +                       &pinctrl_ndtr2_default
> +                       &pinctrl_ndsr2_default
> +                       &pinctrl_ncts2_default
> +                       &pinctrl_ndcd2_default
> +                       &pinctrl_nri2_default>;
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
> +&uart5 {
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
> +&mdio1 {
> +       status = "disabled";

You can omit this if it's disabled. But it seems you use it below?

> +
> +       ethphy1: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac1 {
> +       status = "disabled";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default>;
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy1>;
> +};
> +
> +&mdio2 {
> +       status = "disabled";
> +
> +       ethphy2: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii3_default>;
> +       use-ncsi;
> +};
> +
> +&mdio3 {
> +       status = "disabled";
> +
> +       ethphy3: ethernet-phy@0 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0>;
> +       };
> +};
> +
> +&mac3 {
> +       status = "disabled";
> +       pinctrl-names = "default";
> +       phy-handle = <&ethphy3>;
> +       phy-mode = "rgmii";
> +
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
> +&video {
> +       status = "okay";
> +       memory-region = <&video_engine_memory>;
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&rtc {
> +       status = "okay";
> +};
> --
> 2.25.1
>
