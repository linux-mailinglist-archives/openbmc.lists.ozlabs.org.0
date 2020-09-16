Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99026C330
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 15:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs0yH0VDMzDqKj
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 23:17:43 +1000 (AEST)
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
 header.s=google header.b=aOjRMHCW; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs0vn0nzqzDqWY
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 23:15:32 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id gr14so10347380ejb.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRMx2QCwn5J/0i/9dBFngMRBPtGNscayn9tnZ8FVVFA=;
 b=aOjRMHCWqaqetdVLoUYuPlq5bRuzANX9B9dYMATnSb6zxf1X2ynUB/pM+Jcu/wIGFJ
 CETwdhBeykYZYFurNTuKFqKoPiTebzRARzBs3zLDY0Mywtjd8ftxHEo34U+GLb/I4Uhk
 f9bYiM6j36GU/kbtBa9PYsxJpCM+Q4uVZOB4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRMx2QCwn5J/0i/9dBFngMRBPtGNscayn9tnZ8FVVFA=;
 b=fvLAFoW8b3Le38p5+jmHUjORHzk0WMprEiNy8Og9YC8RhDckCBk6/u4UdOhZv/uHRJ
 zHBaTrGVZe8oYQ56EkqYYExQbRKXqKWxgIb+vsw0B3A8sVpykvyXdBLaZspXAZn+wZ3M
 w5pVemm6D3Q+QHLsF8LaVaALaKvE3F6FThnoOJwporqzcZvlJCdrRZfpEqeEBAYTMnD+
 7e3eSBCh59GzhuXI0JG6luJjeHlzVw4Sf1tJX7I9l6sUtsghA2sSKcvbMkUH/wAC77AH
 rR5/aUrUahUVqLoX2phSW1zRNk28t1CLu8nLrSQT1Ly7K35wPAcV/aOdEOQVMNshi4Gf
 O3xQ==
X-Gm-Message-State: AOAM530B92NfKLt9lhZmRjmeTWe2YJxTlVjMdELPZRw8WuAxN7nAPw1C
 arReMFGryzRu7Rz28xbjvSLHDf6QXsw18zyIbMw=
X-Google-Smtp-Source: ABdhPJwi2H60iamWSa4O+4BL2u/KxUFqRG+Fw+HbvWBjnoKrJkZiredljzBkenv3Dmr1y6tI6FfmOewXLd5CP/Y2Nks=
X-Received: by 2002:a17:906:e918:: with SMTP id
 ju24mr24683358ejb.442.1600262124914; 
 Wed, 16 Sep 2020 06:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200916125554.195749-1-tmaimon77@gmail.com>
 <20200916125554.195749-2-tmaimon77@gmail.com>
In-Reply-To: <20200916125554.195749-2-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Sep 2020 13:15:12 +0000
Message-ID: <CACPK8Xfr8KQkKAtxC4FaWk-HKkSvgBnkrpF6yMBT0qxY16zmWQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] arm: dts: modify NPCM7xx device tree clock
 parameter
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

On Wed, 16 Sep 2020 at 12:56, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Modify NPCM7xx device tree clock parameter to clock constants that
> define at include/dt-bindings/clock/nuvoton,npcm7xx-clock.h file.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 ++++++++++---------
>  arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  6 +++---
>  2 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index d2d0761295a4..16a28c5c4131 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -3,6 +3,7 @@
>  // Copyright 2018 Google, Inc.
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
>
>  / {
>         #address-cells = <1>;
> @@ -80,7 +81,7 @@
>                         interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
>                         cache-unified;
>                         cache-level = <2>;
> -                       clocks = <&clk 10>;
> +                       clocks = <&clk NPCM7XX_CLK_AXI>;
>                         arm,shared-override;
>                 };
>
> @@ -120,7 +121,7 @@
>                                 compatible = "nuvoton,npcm750-timer";
>                                 interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg = <0x8000 0x50>;
> -                               clocks = <&clk 5>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
>                         watchdog0: watchdog@801C {
> @@ -128,7 +129,7 @@
>                                 interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg = <0x801C 0x4>;
>                                 status = "disabled";
> -                               clocks = <&clk 5>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
>                         watchdog1: watchdog@901C {
> @@ -136,7 +137,7 @@
>                                 interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg = <0x901C 0x4>;
>                                 status = "disabled";
> -                               clocks = <&clk 5>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
>                         watchdog2: watchdog@a01C {
> @@ -144,13 +145,13 @@
>                                 interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg = <0xa01C 0x4>;
>                                 status = "disabled";
> -                               clocks = <&clk 5>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
>                         serial0: serial@1000 {
>                                 compatible = "nuvoton,npcm750-uart";
>                                 reg = <0x1000 0x1000>;
> -                               clocks = <&clk 6>;
> +                               clocks = <&clk NPCM7XX_CLK_UART>;
>                                 interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg-shift = <2>;
>                                 status = "disabled";
> @@ -159,7 +160,7 @@
>                         serial1: serial@2000 {
>                                 compatible = "nuvoton,npcm750-uart";
>                                 reg = <0x2000 0x1000>;
> -                               clocks = <&clk 6>;
> +                               clocks = <&clk NPCM7XX_CLK_UART>;
>                                 interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg-shift = <2>;
>                                 status = "disabled";
> @@ -168,7 +169,7 @@
>                         serial2: serial@3000 {
>                                 compatible = "nuvoton,npcm750-uart";
>                                 reg = <0x3000 0x1000>;
> -                               clocks = <&clk 6>;
> +                               clocks = <&clk NPCM7XX_CLK_UART>;
>                                 interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg-shift = <2>;
>                                 status = "disabled";
> @@ -177,7 +178,7 @@
>                         serial3: serial@4000 {
>                                 compatible = "nuvoton,npcm750-uart";
>                                 reg = <0x4000 0x1000>;
> -                               clocks = <&clk 6>;
> +                               clocks = <&clk NPCM7XX_CLK_UART>;
>                                 interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>                                 reg-shift = <2>;
>                                 status = "disabled";
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> index 6ac340533587..a37bb2294b8f 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-npcm750.dtsi
> @@ -17,7 +17,7 @@
>                 cpu@0 {
>                         device_type = "cpu";
>                         compatible = "arm,cortex-a9";
> -                       clocks = <&clk 0>;
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
>                         clock-names = "clk_cpu";
>                         reg = <0>;
>                         next-level-cache = <&l2>;
> @@ -26,7 +26,7 @@
>                 cpu@1 {
>                         device_type = "cpu";
>                         compatible = "arm,cortex-a9";
> -                       clocks = <&clk 0>;
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
>                         clock-names = "clk_cpu";
>                         reg = <1>;
>                         next-level-cache = <&l2>;
> @@ -38,7 +38,7 @@
>                         reg = <0x3fe600 0x20>;
>                         interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
>                                                   IRQ_TYPE_LEVEL_HIGH)>;
> -                       clocks = <&clk 5>;
> +                       clocks = <&clk NPCM7XX_CLK_AHB>;
>                 };
>         };
>  };
> --
> 2.22.0
>
