Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C038F71553A
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 08:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVhc24L1Gz3f7L
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 16:01:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VayffOSl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VayffOSl;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVhbK2QpPz3bT1
	for <openbmc@lists.ozlabs.org>; Tue, 30 May 2023 16:01:00 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9741caaf9d4so60650566b.0
        for <openbmc@lists.ozlabs.org>; Mon, 29 May 2023 23:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1685426456; x=1688018456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niMZXnObeYMy+wLEUFOPduEs49NIVIUgvFwNPvCJ3I8=;
        b=VayffOSlh1iUUiKcHHHvUEUaZ921MmR1KPOclbqN70fdB7GNDLPyXBNH98Zyma0+mE
         HZgza5Bs97RJlWif2IAxp5a+ovJIwVFjYxrXZuFBAgAcwJx7aujmi1RsjrW+bWarTd2H
         /QB5Eo7pXx0DvPeUdVvEntnViV4pRQCtgHE5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685426456; x=1688018456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niMZXnObeYMy+wLEUFOPduEs49NIVIUgvFwNPvCJ3I8=;
        b=ckiuHb2DOj58P26NiO9S0+yMoQGItOL0RpUk/BkK0UV0ntCR5euFbzLdGfCddtP5ny
         LEa+6qBgHJxn3CXjj6Ia9bpN52qUtCZldU/7+Brk800W8ZE2gC+CLGNC0Nwmsp3KjGEB
         aeaQLNdNzCFQqR1U/k+NAEVJSkJRPQcflaW7DRPr/1FtAkIboLR0sZ39uXeZO34mOiAf
         eYpENtn/VROhFCItGQuftxfbZMcllkJ5tjQPLL3p50J9LPF2ceRSPY6NgXSHFo4SkEdr
         aXx3wvKRRn+wxEEhzdJ5vXspJsWYCRdosKGp1200g0Uqjwy5ToidYEIpp7mv9tlOUJVQ
         Zu9w==
X-Gm-Message-State: AC+VfDxWOqS2xbgLWoK8w+KhXjORiBXz8roqHSz0XKCw38c8tshh8wDX
	OeRz8xMQm3LiEDVBarTwSEq+W0r2Q89TOe6FH/5e080o
X-Google-Smtp-Source: ACHHUZ4zyjgJlUW1Ii0TenaTBzp1RaPHzrnLbPREdSH820jOeDzP5WWy1Jn0Wx3ch1+siRZfmAZe34xHuGNWk/bYbtQ=
X-Received: by 2002:a17:907:2d14:b0:974:1f0e:ec2d with SMTP id
 gs20-20020a1709072d1400b009741f0eec2dmr1010087ejc.15.1685426455952; Mon, 29
 May 2023 23:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230530030320.548408-1-lintao1890@163.com>
In-Reply-To: <20230530030320.548408-1-lintao1890@163.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 May 2023 06:00:43 +0000
Message-ID: <CACPK8XekG1Fic2U-mvsLnT7y+==0AQMe3SPVTX-nsEnRUtZ_zQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v5] board: ast2600: Add
 Inspur SCM V1 board
To: lintao1890@163.com
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
Cc: LinTao <lintao.lc@inspur.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 May 2023 at 03:03, <lintao1890@163.com> wrote:
>
> From: LinTao <lintao.lc@inspur.com>
>
> AST2600-INSPUR is an Inspur SCM V1 board which is
> equipped with AST2600
>
> Signed-off-by: LinTao <lintao.lc@inspur.com>
> ---
> V1 -> V2:
>     - add a missing '\'
> ---
> V2 -> V3:
>     - use gpio subsystem
> ---
> V3 -> V4:
>     - fix style problems
> ---
> V4 -> V5:
>     - turn on SCM LED1
> ---
>  arch/arm/dts/Makefile                    |   3 +-
>  arch/arm/dts/ast2600-inspur-nf5280m7.dts | 190 +++++++++++++++++++++++
>  arch/arm/mach-aspeed/ast2600/Kconfig     |   8 +
>  board/aspeed/ast2600_inspur/Kconfig      |  13 ++
>  board/aspeed/ast2600_inspur/Makefile     |   1 +
>  board/aspeed/ast2600_inspur/inspur.c     |  18 +++
>  6 files changed, 232 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/dts/ast2600-inspur-nf5280m7.dts
>  create mode 100644 board/aspeed/ast2600_inspur/Kconfig
>  create mode 100644 board/aspeed/ast2600_inspur/Makefile
>  create mode 100644 board/aspeed/ast2600_inspur/inspur.c
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 6c34b83336..f62c16b4f1 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -695,7 +695,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2600-slt.dtb \
>         ast2600-tacoma.dtb \
>         ast2600-intel.dtb \
> -       ast2600-tacoma.dtb
> +       ast2600-tacoma.dtb \
> +       ast2600-inspur-nf5280m7.dtb
>
>  dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
>
> diff --git a/arch/arm/dts/ast2600-inspur-nf5280m7.dts b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
> new file mode 100644
> index 0000000000..8210797868
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-inspur-nf5280m7.dts
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright 2023 Inspur Corp.
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model = "Inspur SCM V1";
> +       compatible = "inspur,nf5280m7-bmc", "aspeed,ast2600";
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
> +               ethernet1 = &mac1;
> +       };
> +
> +       cpus {
> +               cpu@0 {
> +                       clock-frequency = <1200000000>;
> +               };
> +               cpu@1 {
> +                       clock-frequency = <1200000000>;
> +               };
> +       };
> +};
> +
> +&gpio0 {
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
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +
> +&mdio {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mdio2_default>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       ethphy0: ethernet-phy@0 {
> +               reg = <0>;
> +       };
> +
> +       ethphy1: ethernet-phy@1 {
> +               reg = <0>;
> +       };
> +
> +       ethphy2: ethernet-phy@2 {
> +               reg = <0>;
> +       };
> +
> +       ethphy3: ethernet-phy@3 {
> +               reg = <0>;
> +       };
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       phy-handle = <&ethphy1>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_fmcquad_default>;
> +       flash@0 {
> +               status = "okay";
> +               spi-max-frequency = <40000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +       flash@1 {
> +               status = "okay";
> +               spi-max-frequency = <40000000>;
> +               spi-tx-bus-width = <4>;
> +               spi-rx-bus-width = <4>;
> +       };
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c2_default>;

You shouldn't need to add the pinctrl nodes, as they're present in ast2600.dtsi.

> +};
> +
> +&i2c4 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c5_default>;
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c6_default>;
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c7_default>;
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c8_default>;
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c9_default>;
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c10_default>;
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c13_default>;
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +       multi-master;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c14_default>;
> +};
> +
> +&hace {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&acry {
> +       u-boot,dm-pre-reloc;
> +       status = "disabled";
> +};


> --- /dev/null
> +++ b/board/aspeed/ast2600_inspur/inspur.c

 +int board_late_init(void)
> +{
> +       /* Turn on SCM LED1 */
> +       gpio_request(ASPEED_GPIO(B, 2), "");
> +       gpio_direction_output(ASPEED_GPIO(B, 2), GPIO_ACTIVE_LOW);

Are you able to do this with a gpio hog in the device tree?

If so, we would prefer that approach as it avoids adding another
platform to the source tree.

Cheers,

Joel
