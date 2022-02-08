Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8D4AD7C0
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLp72DWTz2xKK
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:46:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PmuyQwyI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PmuyQwyI; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtLnk6Hf0z2x9J
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 22:46:32 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id bs32so13459887qkb.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXdyNkAnPKLR6UVABnqjaDKBSYq/nyLCiMr65z98KNg=;
 b=PmuyQwyI4wcYVcky5b0Y8KAT8dUGDl37dlPNJ8NC1JW36h+XreU+ZawEIgcrV48m6n
 PlPnsHulhOfNT0E8jF03oCPAIMUjJ4WVoaV2Gn1u5ILv0c1dQzxhe2h4fZjhnTgW0VHw
 DpqE/dI3U8uf7m5eayz4/93WZJxh0a5KGApiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXdyNkAnPKLR6UVABnqjaDKBSYq/nyLCiMr65z98KNg=;
 b=OCDutfflUYLqWzPjbrktNkYCpkK5W0kI4ke0RQDf8k4v4dK1rxryEXUqgkIOoA7PnJ
 Qptvwu0Mr9OyUPUvsZIkotm3BKIipdkcHmJtyvO7YRcRvjSaMVv0h6CweDh+kb5fVp3I
 eeBZE3DfoaaKLqWxV4HaatyuyJiTDNVsqXYHqUgafBTZII+vu7VUcAfkpzmW2SziFuWr
 a4YfLsvttkNXBCoI1iSiD+f7gPPUN6K38yF01frzp/yk8wJvmIEennJ4mJrIM/k+5eXw
 hz8HfeWkeAjfYDV2RJbZs6l+mtsmK667GWqbmT8VC2eMKPqRnK8N/WoX5HmsUKhxsxLd
 pAFQ==
X-Gm-Message-State: AOAM5314uOdywZhPbgmf5nTsmthuxaKZMeJq/PX+jhgKFMUjy2BG9cHn
 f0K96YArh8LAbEG3IW5qCQnnPZV2LibrNi48yrQ=
X-Google-Smtp-Source: ABdhPJyUK+OpIe1AvrS9R4OMyRjhSDvIgPSUVPP/9wtngcdd0I5OlcPfhdulwOlfQzIqus8uojZ77d8yY3i/np17YVA=
X-Received: by 2002:a05:620a:d86:: with SMTP id
 q6mr2248429qkl.243.1644320789441; 
 Tue, 08 Feb 2022 03:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20220207160817.21102-1-potin.lai@quantatw.com>
In-Reply-To: <20220207160817.21102-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Feb 2022 11:46:17 +0000
Message-ID: <CACPK8XdO9aN7-+EJxfExi2pyKPeVU5N36cgK_ZvNeaTDoF9CSA@mail.gmail.com>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc v2 1/1] arm: dts: Aspeed: add
 Bletchley dts
To: Potin Lai <potin.lai@quantatw.com>
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
 Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 7 Feb 2022 at 16:08, Potin Lai <potin.lai@quantatw.com> wrote:
>
> Initial introduction of Bletchley equipped with
> Aspeed 2600 BMC SoC.
>
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
>
> ---
>
> change v1 -> v2:
> * sort Makefile alphabetically
> * add licence and copyright
> * update model name
> * remove the nodes not using (fsi, emmc, sdhci, ehci, pcie & display_port)
> ---
>  arch/arm/dts/Makefile              |   9 +-
>  arch/arm/dts/ast2600-bletchley.dts | 223 +++++++++++++++++++++++++++++
>  2 files changed, 228 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm/dts/ast2600-bletchley.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index df844065cd..ac93a89c07 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -677,15 +677,16 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2400-evb.dtb \
>         ast2500-evb.dtb \
> -       ast2600-evb.dtb \
> -       ast2600-ncsi.dtb \
>         ast2600a0-evb.dtb \
>         ast2600a1-evb.dtb \
> +       ast2600-bletchley.dtb \
> +       ast2600-evb.dtb \
>         ast2600-fpga.dtb \
> +       ast2600-intel.dtb \
> +       ast2600-ncsi.dtb \
>         ast2600-rainier.dtb \
>         ast2600-slt.dtb \
> -       ast2600-tacoma.dtb \
> -       ast2600-intel.dtb
> +       ast2600-tacoma.dtb
>
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>
> diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
> new file mode 100644
> index 0000000000..2417c95f00
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-bletchley.dts
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2022 Meta Platforms Inc.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +        model = "AST2600 Bletchley";
> +        compatible = "aspeed,ast2600-bletchley", "aspeed,ast2600";

Aspeed don't make this, do they?

Take a look at the other examples (or your device tree in the kernel,
which you should base this one on):

        model = "Facebook Bletchley BMC";
        compatible = "facebook,bletchley-bmc", "aspeed,ast2600"

I suggest ignoring the company rename to keep things simple, but I'll
leave that to you.

The rest looks good. Thanks!

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
