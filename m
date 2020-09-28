Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C827A7B3
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 08:38:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0CXY2q5KzDqLl
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 16:38:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Eupq+Ell; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0CWl43gYzDqBx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:38:11 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id r7so6860945ejs.11
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7U/X75rmIhwif4TLgWVYSAGklF004XaYwIHxKwiWxOs=;
 b=Eupq+Ellszm3vdHHuR4ttLWR42/Npnc1oBbsh2xUCNMnmvCdnqhGCe4RkuVNntZWK+
 FV9QsKhwpEXNW11+bTG5ewYNHsvNy/T2Vs7P6abir7UfyZ5DP2gufanFXsfRO/SOHvp8
 8js2iX8dN+SbbvHpMTBuvwYyU4tG8b96pV+Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7U/X75rmIhwif4TLgWVYSAGklF004XaYwIHxKwiWxOs=;
 b=ae3MjgLAzukNomFKLLQLtdzxFqCrAekaaNgl65GQcQAshk+s1PqHHucYOrEZKExHtY
 nTwNpdg3Y6kq6RauuTR4LXl+k5YDluRd2D9zPdXGLefgX5ZbOzvhvlsdSPkeS/cItocK
 qmXZpbZUAGIXBslmJVIB+5XvEb1I+Vb2NwA/pa085y1i9tr75/3KFV9dubfvigynJYJl
 g+RrFk0l3atvsx6wVw0TGi4ddXMNz93hnqvH4AisuTTRwRTnqvQKk7JqxE6Mt55rHL9e
 olOVKy5+2oS8uH8FnhM1BzEPReDujeRvXxvczrsdWoHo7GRawbIv3BEK/JBUtX0cP1qj
 Z8Gw==
X-Gm-Message-State: AOAM532x8AGmhFJ9nQnbTDapnrYmzRE5FLFNkCmTCq4cnYMGuzIs4tEK
 NlJ8TpFZhBemqCz62UPOqvcf9et3vTklLFtAQDs=
X-Google-Smtp-Source: ABdhPJwKvppbK81Xbgrhk2k9WtLm9V2F80fGkvHe7yS6mto65+xCZDYS1Pq7Bna3rOLZx5RMI6CFcR8tpEqwgJPL5YM=
X-Received: by 2002:a17:906:4cd6:: with SMTP id
 q22mr215192ejt.139.1601275088129; 
 Sun, 27 Sep 2020 23:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200923164730.176881-1-tmaimon77@gmail.com>
 <20200923164730.176881-5-tmaimon77@gmail.com>
In-Reply-To: <20200923164730.176881-5-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:37:55 +0000
Message-ID: <CACPK8XeAUe0iWHv4tAjobxrwjx=LRawmtW4u=q9nFgbjc1c+cg@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] arm: dts: add new device nodes to NPCM7XX device
 tree
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 23 Sep 2020 at 16:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add the following new device nodes to NPCM7XX:
>
>         - NPCM7xx PWM and FAN.
>         - NPCM7xx EHCI USB.
>         - NPCM7xx KCS.
>         - NPCM Reset.
>         - NPCM Peripheral SPI.
>         - NPCM FIU SPI.
>         - NPCM HWRNG.
>         - NPCM I2C.
>         - STMicro STMMAC.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 382 +++++++++++++++++-
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  18 +
>  2 files changed, 394 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 5df77a617e77..4a69a9f31668 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -4,6 +4,7 @@
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +#include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
>
>  / {
>         #address-cells = <1>;
> @@ -64,12 +65,6 @@
>                 interrupt-parent = <&gic>;
>                 ranges = <0x0 0xf0000000 0x00900000>;
>
> -               gcr: gcr@800000 {
> -                       compatible = "nuvoton,npcm750-gcr", "syscon",
> -                               "simple-mfd";
> -                       reg = <0x800000 0x1000>;
> -               };
> -
>                 scu: scu@3fe000 {
>                         compatible = "arm,cortex-a9-scu";
>                         reg = <0x3fe000 0x1000>;
> @@ -92,6 +87,16 @@
>                         reg = <0x3ff000 0x1000>,
>                                 <0x3fe100 0x100>;
>                 };
> +
> +               gcr: gcr@800000 {
> +                       compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> +                       reg = <0x800000 0x1000>;
> +               };
> +
> +               rst: rst@801000 {
> +                       compatible = "nuvoton,npcm750-rst", "syscon", "simple-mfd";
> +                       reg = <0x801000 0x6C>;
> +               };
>         };
>
>         ahb {
> @@ -101,6 +106,12 @@
>                 interrupt-parent = <&gic>;
>                 ranges;
>
> +               rstc: rstc@f0801000 {
> +                       compatible = "nuvoton,npcm750-reset";
> +                       reg = <0xf0801000 0x70>;
> +                       #reset-cells = <2>;
> +               };
> +
>                 clk: clock-controller@f0801000 {
>                         compatible = "nuvoton,npcm750-clk", "syscon";
>                         #clock-cells = <1>;
> @@ -110,6 +121,63 @@
>                         clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
>                 };
>
> +               gmac0: eth@f0802000 {
> +                       device_type = "network";
> +                       compatible = "snps,dwmac";
> +                       reg = <0xf0802000 0x2000>;
> +                       interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq";
> +                       ethernet = <0>;
> +                       clocks  = <&clk_rg1refck>, <&clk NPCM7XX_CLK_AHB>;
> +                       clock-names = "stmmaceth", "clk_gmac";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&rg1_pins
> +                                       &rg1mdio_pins>;
> +                       status = "disabled";
> +               };
> +
> +               ehci1: usb@f0806000 {
> +                       compatible = "nuvoton,npcm750-ehci";
> +                       reg = <0xf0806000 0x1000>;
> +                       interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +               };
> +
> +               fiu0: spi@fb000000 {
> +                       compatible = "nuvoton,npcm750-fiu";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0xfb000000 0x1000>;
> +                       reg-names = "control", "memory";
> +                       clocks = <&clk NPCM7XX_CLK_SPI0>;
> +                       clock-names = "clk_spi0";
> +                       status = "disabled";
> +               };
> +
> +               fiu3: spi@c0000000 {
> +                       compatible = "nuvoton,npcm750-fiu";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0xc0000000 0x1000>;
> +                       reg-names = "control", "memory";
> +                       clocks = <&clk NPCM7XX_CLK_SPI3>;
> +                       clock-names = "clk_spi3";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi3_pins>;
> +                       status = "disabled";
> +               };
> +
> +               fiux: spi@fb001000 {
> +                       compatible = "nuvoton,npcm750-fiu";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0xfb001000 0x1000>;
> +                       reg-names = "control", "memory";
> +                       clocks = <&clk NPCM7XX_CLK_SPIX>;
> +                       clock-names = "clk_spix";
> +                       status = "disabled";
> +               };
> +
>                 apb {
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> @@ -117,6 +185,68 @@
>                         interrupt-parent = <&gic>;
>                         ranges = <0x0 0xf0000000 0x00300000>;
>
> +                       lpc_kcs: lpc_kcs@7000 {
> +                               compatible = "nuvoton,npcm750-lpc-kcs", "simple-mfd", "syscon";
> +                               reg = <0x7000 0x40>;
> +                               reg-io-width = <1>;
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0x0 0x7000 0x40>;
> +
> +                               kcs1: kcs1@0 {
> +                                       compatible = "nuvoton,npcm750-kcs-bmc";
> +                                       reg = <0x0 0x40>;
> +                                       interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                                       kcs_chan = <1>;
> +                                       status = "disabled";
> +                               };
> +
> +                               kcs2: kcs2@0 {
> +                                       compatible = "nuvoton,npcm750-kcs-bmc";
> +                                       reg = <0x0 0x40>;
> +                                       interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                                       kcs_chan = <2>;
> +                                       status = "disabled";
> +                               };
> +
> +                               kcs3: kcs3@0 {
> +                                       compatible = "nuvoton,npcm750-kcs-bmc";
> +                                       reg = <0x0 0x40>;
> +                                       interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                                       kcs_chan = <3>;
> +                                       status = "disabled";
> +                               };
> +                       };
> +
> +                       spi0: spi@200000 {
> +                               compatible = "nuvoton,npcm750-pspi";
> +                               reg = <0x200000 0x1000>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pspi1_pins>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk NPCM7XX_CLK_APB5>;
> +                               clock-names = "clk_apb5";
> +                               resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
> +                               status = "disabled";
> +                       };
> +
> +                       spi1: spi@201000 {
> +                               compatible = "nuvoton,npcm750-pspi";
> +                               reg = <0x201000 0x1000>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pspi2_pins>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk NPCM7XX_CLK_APB5>;
> +                               clock-names = "clk_apb5";
> +                               resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI2>;
> +                               status = "disabled";
> +                       };
> +
>                         timer0: timer@8000 {
>                                 compatible = "nuvoton,npcm750-timer";
>                                 interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> @@ -183,6 +313,246 @@
>                                 reg-shift = <2>;
>                                 status = "disabled";
>                         };
> +
> +                       rng: rng@b000 {
> +                               compatible = "nuvoton,npcm750-rng";
> +                               reg = <0xb000 0x8>;
> +                               status = "disabled";
> +                       };
> +
> +                       adc: adc@c000 {
> +                               compatible = "nuvoton,npcm750-adc";
> +                               reg = <0xc000 0x8>;
> +                               interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk NPCM7XX_CLK_ADC>;
> +                               resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
> +                               status = "disabled";
> +                       };
> +
> +                       pwm_fan: pwm-fan-controller@103000 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "nuvoton,npcm750-pwm-fan";
> +                               reg = <0x103000 0x2000>, <0x180000 0x8000>;
> +                               reg-names = "pwm", "fan";
> +                               clocks = <&clk NPCM7XX_CLK_APB3>,
> +                                       <&clk NPCM7XX_CLK_APB4>;
> +                               clock-names = "pwm","fan";
> +                               interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +                                               <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pwm0_pins &pwm1_pins
> +                                               &pwm2_pins &pwm3_pins
> +                                               &pwm4_pins &pwm5_pins
> +                                               &pwm6_pins &pwm7_pins
> +                                               &fanin0_pins &fanin1_pins
> +                                               &fanin2_pins &fanin3_pins
> +                                               &fanin4_pins &fanin5_pins
> +                                               &fanin6_pins &fanin7_pins
> +                                               &fanin8_pins &fanin9_pins
> +                                               &fanin10_pins &fanin11_pins
> +                                               &fanin12_pins &fanin13_pins
> +                                               &fanin14_pins &fanin15_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c0: i2c@80000 {
> +                               reg = <0x80000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb0_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c1: i2c@81000 {
> +                               reg = <0x81000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb1_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c2: i2c@82000 {
> +                               reg = <0x82000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb2_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c3: i2c@83000 {
> +                               reg = <0x83000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb3_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c4: i2c@84000 {
> +                               reg = <0x84000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb4_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c5: i2c@85000 {
> +                               reg = <0x85000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb5_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c6: i2c@86000 {
> +                               reg = <0x86000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb6_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c7: i2c@87000 {
> +                               reg = <0x87000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb7_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c8: i2c@88000 {
> +                               reg = <0x88000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb8_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c9: i2c@89000 {
> +                               reg = <0x89000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb9_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c10: i2c@8a000 {
> +                               reg = <0x8a000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb10_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c11: i2c@8b000 {
> +                               reg = <0x8b000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb11_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c12: i2c@8c000 {
> +                               reg = <0x8c000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb12_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c13: i2c@8d000 {
> +                               reg = <0x8d000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb13_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c14: i2c@8e000 {
> +                               reg = <0x8e000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb14_pins>;
> +                               status = "disabled";
> +                       };
> +
> +                       i2c15: i2c@8f000 {
> +                               reg = <0x8f000 0x1000>;
> +                               compatible = "nuvoton,npcm750-i2c";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               clocks = <&clk NPCM7XX_CLK_APB2>;
> +                               interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&smb15_pins>;
> +                               status = "disabled";
> +                       };
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> index a37bb2294b8f..13eee0fe5642 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -32,6 +32,7 @@
>                         next-level-cache = <&l2>;
>                 };
>         };
> +
>         soc {
>                 timer@3fe600 {
>                         compatible = "arm,cortex-a9-twd-timer";
> @@ -41,4 +42,21 @@
>                         clocks = <&clk NPCM7XX_CLK_AHB>;
>                 };
>         };
> +
> +       ahb {
> +               gmac1: eth@f0804000 {
> +                       device_type = "network";
> +                       compatible = "snps,dwmac";
> +                       reg = <0xf0804000 0x2000>;
> +                       interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "macirq";
> +                       ethernet = <1>;
> +                       clocks  = <&clk_rg2refck>, <&clk NPCM7XX_CLK_AHB>;
> +                       clock-names = "stmmaceth", "clk_gmac";
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&rg2_pins
> +                                       &rg2mdio_pins>;
> +                       status = "disabled";
> +               };
> +       };
>  };
> --
> 2.22.0
>
