Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061A4C80F5
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 03:22:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K71HX3gR5z3bqg
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 13:22:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ahf0Th75;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ahf0Th75; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K71H75Vjmz2xDM
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 13:22:25 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id j78so11973616qke.2
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 18:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TOAIkvlHLQvqigzH00HxB+hKLPTTZmdKOhpg1QcsomM=;
 b=ahf0Th75563G85zyD7WxlMoXSuPk6m9axcIxmI5HcqmdubWWvbGKberBNqzQaDpxTK
 K8j5/NZMp0DKp3KWtqFfMoVbC6GWmu5CLE9BNXX9vJ09YBiP/x5vGk9C16xHD128m3cV
 0ksnw+mveXnkpvcNnlbCFvMyTo2a+O20nxzHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOAIkvlHLQvqigzH00HxB+hKLPTTZmdKOhpg1QcsomM=;
 b=hCcJ80m9B97M+b+fK+1KvCe5mww6HEmVBqn7kKSeo2VWtyaBaWPyitZBuDNze5/2BN
 zNdhuHckCyOnLWj9GjbzEt6c7rMLgctXzSNrHgLj3/NcBpFQsDeiW3oktflPnrcSJNAf
 T+SfPMpuW3uGEYWwq2yTZZ8CtXjmixyBkB998kGMlORKHD+Rn6cYfGRcaLieKrzQH0CN
 9yl/KAEkBrXOle4W79VKbJkvbtLUH7lUw8D0ETeRSxrYF0tEABQTdm2JsO3v4+wWDjVm
 7glNzGS+FCcaCLgFcM4XNP0wUq6tJryTKbx1tIJl+prVeTlD3URsvq0ayCNjBllnmOaE
 IlUA==
X-Gm-Message-State: AOAM5333KTKgjAg7OnGBG/M08bbeEXhNyN9tNEG1nhXX2es5iP4YRgPd
 2d8iSWEjCO0oLWF4W5igiFyVEc+iXShbQE5GGco=
X-Google-Smtp-Source: ABdhPJwCW2DS+2cNL9AhIZH6IEZIC9nNiZIJzGNTbnm0n4xx1Y9km6/2tT21LdI3gHES0gNJqKfSzc/Zny1y3LOngdw=
X-Received: by 2002:ae9:e841:0:b0:508:1f6e:f020 with SMTP id
 a62-20020ae9e841000000b005081f6ef020mr12560256qkg.243.1646101343117; Mon, 28
 Feb 2022 18:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20220301011135.14066-1-george.hung@quantatw.com>
In-Reply-To: <20220301011135.14066-1-george.hung@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Mar 2022 02:22:10 +0000
Message-ID: <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
To: George Hung <ghung.quanta@gmail.com>
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <p.k.lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 1 Mar 2022 at 01:23, George Hung <ghung.quanta@gmail.com> wrote:
>
> Add build support for Quanta S6Q board equipped with
> AST2600 BMC SoC

Hi George,

Which configuration (defconfig) do you run your system with?

How different is this configuration from other platforms present in the tree?

I ask as I wonder if we can get away with some common configs in
u-boot, without requiring every platform add their own dts.

>
> Signed-off-by: George Hung <george.hung@quantatw.com>
> ---
>  arch/arm/dts/Makefile        |   1 +
>  arch/arm/dts/ast2600-s6q.dts | 218 +++++++++++++++++++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-s6q.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index e5a73697c5..a79f885f54 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-ncsi.dtb \
>         ast2600-pfr.dtb \
>         ast2600-rainier.dtb \
> +       ast2600-s6q.dtb \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb
>
> diff --git a/arch/arm/dts/ast2600-s6q.dts b/arch/arm/dts/ast2600-s6q.dts
> new file mode 100644
> index 0000000000..52b620d3b4
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-s6q.dts
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2022 Quanta Corp.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model = "Quanta S6Q BMC";
> +       compatible = "quanta,s6q-bmc", "aspeed,ast2600";
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
> +               spi0 = &fmc;
> +               spi2 = &spi2;
> +               ethernet0 = &mac2;
> +               ethernet1 = &mac3;
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
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt3 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&mdio {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mdio3_default>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       ethphy2: ethernet-phy@2 {
> +               reg = <0>;
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy2>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&mac3 {
> +       status = "okay";
> +       phy-mode = "rmii";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii4_default>;
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
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c1_default>;
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c2_default>;
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3_default>;
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c4_default>;
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c8_default>;
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c9_default>;
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c10_default>;
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c12_default>;
> +};
> +
> +&i2c14 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c15_default>;
> +};
> +
> +&i2c15 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c16_default>;
> +};
> +
> +&display_port {
> +       status = "okay";
> +};
> +
> +&scu {
> +       mac2-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +       mac3-clk-delay = <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> +
> +&hace {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&acry {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> --
> 2.32.0
>
