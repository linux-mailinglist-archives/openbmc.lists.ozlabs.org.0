Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323A4AB4AC
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsbmd6NTjz30Nj
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HU6RSr/W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=HU6RSr/W; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbmF3x7Lz30MQ
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:27:39 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id h9so911953qvm.0
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMyxEoeJ6yLz9gjOaUA3kY4Z5Iz7P1lMcQfxehs27Mk=;
 b=HU6RSr/Wu+9zJ0txOLVneJlnrzMfHAeprtMDPu370lsl8SeFJGq6iGKF6sFmFMK1HH
 xK+DfM+thHAbRlBs0zX96m63wdi4Fokg+yPGQo38oQrCIpYkTkYolf3i0zEKWgMs/qmr
 85/GC0uJg8pZySx+4kxdMx3JiN9+Zq4lGq6qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMyxEoeJ6yLz9gjOaUA3kY4Z5Iz7P1lMcQfxehs27Mk=;
 b=eAU4IghjddxhcEvoxI4GT+bWwPudXBdoBs/sPycbjdoyD0Qx8WUxeX11Nx4oZ3IUAi
 nfMUJGf85rIV/4epZnYPr/Sda8QaQXWBVkwiUMuHrS7AFFcNrjotoGjku0ATVwhJiZG2
 d4/jxiPj7u3Oj6HG9Zl+JkH5RA+LBQN+2jP1XJxFqjHMbcOTFUS1VnjVOCoFTCmMD4yE
 vygaVQacs4lUUB43M6k1N9h2cdKZWLDB1uYlEGuN+r0a1C3uhFdNe7ltwbhXw0NhCRv/
 Vhje336ptpX/PPLs+LLRjebYSqBSAaTOTTrPz7Lyl9/5wNLT0fNTDsGfr+a2WQnZGRQz
 ArEg==
X-Gm-Message-State: AOAM532zt2M4+IqCswZSJc8tLXnCCss8DYOI4WCZm5oA4dM5J/Z22orZ
 47Sisbt54WadTxq3AClUzmkinCIM4y+UDNaC0QI=
X-Google-Smtp-Source: ABdhPJwtM3hDAHc5/kPUZLEZOALBEoi8wP0Qk3V5xAXvX7W5Wa9SzkK88qCkqN4Py9tR83Ai8lR/ml3mYlR1cCdMVjk=
X-Received: by 2002:a05:6214:c29:: with SMTP id
 a9mr2091961qvd.130.1644215255885; 
 Sun, 06 Feb 2022 22:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207032641.17889-1-potin.lai@quantatw.com>
In-Reply-To: <20220207032641.17889-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Feb 2022 06:27:24 +0000
Message-ID: <CACPK8XejhbzYizs4pm_bZ0UBB+nW-2SWfjyQKVJB=gbF=qos7g@mail.gmail.com>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc 1/1] arm: dts: Aspeed: add
 Bletchley dts
To: Potin Lai <potin.lai@quantatw.com>, Jamin Lin <jamin_lin@aspeedtech.com>
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

On Mon, 7 Feb 2022 at 03:27, Potin Lai <potin.lai@quantatw.com> wrote:
>
> Initial introduction of Bletchley equipped with
> Aspeed 2600 BMC SoC.
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>

I'll ask Jamin and Patrick to review too, but I've noticed some small
things myself.

> ---
>  arch/arm/dts/Makefile              |   3 +-
>  arch/arm/dts/ast2600-bletchley.dts | 285 +++++++++++++++++++++++++++++
>  2 files changed, 287 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-bletchley.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index df844065cd..a172a9f8c6 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -685,7 +685,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-rainier.dtb \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb \
> -       ast2600-intel.dtb
> +       ast2600-intel.dtb \
> +       ast2600-bletchley.dtb

Lets sort alphabetically.

>
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>
> diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
> new file mode 100644
> index 0000000000..ec14898400
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-bletchley.dts
> @@ -0,0 +1,285 @@
> +/dts-v1/;

Add a licence and copyright line.
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +        model = "AST2600 EVB";
> +        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";

This is untrue. Put your machine name these two.


> +
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x40000000>;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +       };
> +
> +       aliases {
> +               mmc0 = &emmc_slot0;
> +               mmc1 = &sdhci_slot0;
> +               mmc2 = &sdhci_slot1;
> +               spi0 = &fmc;
> +               spi1 = &spi1;
> +               spi2 = &spi2;
> +               ethernet0 = &mac0;
> +               ethernet1 = &mac1;
> +               ethernet2 = &mac2;
> +               ethernet3 = &mac3;
> +       };
> +
> +       cpus {
> +               cpu@0 {
> +                       clock-frequency = <800000000>;
> +               };
> +               cpu@1 {
> +                       clock-frequency = <800000000>;
> +               };
> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +};
> +
> +&wdt3 {
> +       status = "okay";
> +};
> +
> +&mdio {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mdio4_default>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii3_default &pinctrl_mac3link_default>;
> +       fixed-link {
> +               speed = <1000>;
> +               full-duplex;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +       flash@0 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +
> +       flash@1 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +
> +       flash@2 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
> +                       &pinctrl_spi1cs1_default &pinctrl_spi1wp_default
> +                       &pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
> +
> +       flash@0 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +
> +       flash@1 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +};
> +
> +&spi2 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
> +                       &pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
> +
> +       flash@0 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +
> +       flash@1 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +
> +       flash@2 {
> +               compatible = "spi-flash", "sst,w25q256";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +};
> +
> +&emmc {
> +       u-boot,dm-pre-reloc;
> +       timing-phase = <0x700ff>;
> +};
> +
> +&emmc_slot0 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +       bus-width = <4>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_emmc_default>;
> +       sdhci-drive-type = <1>;
> +};
> +
> +&sdhci {
> +       timing-phase = <0xc6ffff>;
> +};
> +
> +&sdhci_slot0 {
> +       status = "okay";
> +       bus-width = <4>;
> +       pwr-gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
> +       pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sd1_default>;
> +       sdhci-drive-type = <1>;
> +};
> +
> +&sdhci_slot1 {
> +       status = "okay";
> +       bus-width = <4>;
> +       pwr-gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
> +       pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sd2_default>;
> +       sdhci-drive-type = <1>;
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c8_default>;
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c9_default>;
> +};
> +
> +&pcie_bridge1 {
> +       status = "okay";
> +};
> +
> +&h2x {
> +       status = "okay";
> +};
> +
> +#if 0
> +&fsim0 {
> +       status = "okay";
> +};
> +
> +&fsim1 {
> +       status = "okay";
> +};
> +#endif

If you don't use the fsi masters, remove these from your device tree.

> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&display_port {
> +       status = "okay";
> +};

Are you sure you're using all of the devices you're enabling?

> +
> +&scu {
> +       mac0-clk-delay = <0x10 0x0a
> +                         0x10 0x10
> +                         0x10 0x10>;
> +       mac1-clk-delay = <0x10 0x0a
> +                         0x10 0x10
> +                         0x10 0x10>;
> +       mac2-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +       mac3-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> +
> +&hace {
> +       status = "okay";
> +};
> --
> 2.17.1
>
