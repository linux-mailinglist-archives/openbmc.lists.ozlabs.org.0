Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F754E0F4
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:43:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1zs07gMz3blm
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:43:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JrAksb+O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JrAksb+O;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1zT3V2Mz2ypY
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 22:42:44 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id u8so1701283wrm.13
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7H7kSSLrUBO0Kbii1OBTf3BMSg3ZQZlbSnVfglCnj+A=;
        b=JrAksb+OB6Y99AXgnWJLjx63xgQJwstzYZ4kBalrrv6H6N5dyMs2uWQp7hHpxVgMPb
         F8DoW6BEfuqsPg233O1m3yX9d0da6gy41mRrTwBaStFOh6/eFBBeiVTYV5OZx+FN9Q2s
         9cvFn/YxhCrY5VC2Ce9mBWo+5tkSV5yWWubuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7H7kSSLrUBO0Kbii1OBTf3BMSg3ZQZlbSnVfglCnj+A=;
        b=CAgYoT8TWqZ5v036IrUjwDllKSzNQjo0X5L42aefI4zew6zVk8fPkNBVJSdJ45iVKr
         njOwp8ESkOSluXIJ5nhxt3H3gx7GqTDQRyob7BNySvRqlvBvtrgbx7COinJ3X0/BpT/C
         6YCrjHLmKqNl6fgCvyv39jWCr1CL+zWAHiS4Ctd02n/LmurI2RBTcU7NJ4bfmHzbzAgo
         DDPlSd91zWiZW96BANnwBCVl3914a9oXaU17lwryRLZQ+naGNjQol+acU6TbYaQc9EQ3
         I/yXw6FmgAJhZPcajomCL17Bs2ys6yuz+FwnTCylBmRcoMEmq2ztPBPKGsP+I6y1iVhw
         5BEg==
X-Gm-Message-State: AJIora//i1AcwAvDb92Vos39YhTFvOr9yL+oT/6BhHuymJJWZqHLn8Nq
	f4yOK+gg3LTWU55Ndnc8mMI/AjtGDcEKGHMjG+Y=
X-Google-Smtp-Source: AGRyM1styG85ArfOx0QM5zufQm1s1v5ydXUFV+2aFfnFDYeCU25uwE45zsrQeSCpF+dAUuPb+PVqQjE9oFw1oYjpCoY=
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr4484697wrd.606.1655383360641; Thu, 16
 Jun 2022 05:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220608204351.1310956-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220608204351.1310956-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Jun 2022 12:42:28 +0000
Message-ID: <CACPK8XeQUR6Lz3av8K0fPptbQYNP3W4F09bTbw+bDrsEApd8Gg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 20:44, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> From: Graeme Gregory <quic_ggregory@quicinc.com>
>
> Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
> equipped with Aspeed AST2600 BMC SoC.
>
> Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Merged, thanks Jae.

> ---
> Changes in v4:
> * Fixed typo in Makefile dtb target.
>
> Changes in v3:
> * Dropped compatible string of flash memory - Joel / Cedric
> * Dropped I2C pinctrl settings - Joel
>
> Changes in v2:
> * Changed vendor name from Nuvia to Qualcomm.
>
>  arch/arm/dts/Makefile                   |   1 +
>  arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 172 ++++++++++++++++++++++++
>  2 files changed, 173 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 8f876a0aa0d7..35cdd0952d33 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-ncsi.dtb \
>         ast2600-p10bmc.dtb \
>         ast2600-pfr.dtb \
> +       ast2600-qcom-dc-scm-v1.dtb \
>         ast2600-s6q.dtb \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb
> diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> new file mode 100644
> index 000000000000..bbfb4c7e9e0d
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model = "Qualcomm DC-SCM V1 BMC";
> +       compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
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
> +               spi1 = &spi1;
> +               spi2 = &spi2;
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
> +
> +       ethphy3: ethernet-phy@1 {
> +               reg = <1>;
> +       };
> +};
> +
> +&mac2 {
> +       status = "okay";
> +       reg = <0x1e670000 0x180>, <0x1e650018 0x4>;
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy3>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii3_default>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fmcquad_default>;
> +
> +       flash@0 {
> +               status = "okay";
> +               spi-max-frequency = <133000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +
> +       flash@1 {
> +               status = "okay";
> +               spi-max-frequency = <133000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
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
> +               status = "okay";
> +               spi-max-frequency = <133000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +};
> +
> +&i2c4 {
> +       status = "okay";
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
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&i2c14 {
> +       status = "okay";
> +};
> +
> +&i2c15 {
> +       status = "okay";
> +};
> +
> +&scu {
> +       mac0-clk-delay = <0x1d 0x1c
> +                         0x10 0x17
> +                         0x10 0x17>;
> +       mac1-clk-delay = <0x1d 0x10
> +                         0x10 0x10
> +                         0x10 0x10>;
> +       mac2-clk-delay = <0x0a 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +       mac3-clk-delay = <0x0a 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> --
> 2.25.1
>
