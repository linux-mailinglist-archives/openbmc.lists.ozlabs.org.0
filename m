Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C938227A751
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 08:18:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0C4q1md5zDqVF
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 16:18:19 +1000 (AEST)
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
 header.s=google header.b=LGn8ICS8; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0C440bbkzDqST
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:17:39 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id q13so6820876ejo.9
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmIsrL21BptfR5lJ33xzvPrHdSqSoSVQqC25q5Isc/M=;
 b=LGn8ICS8ctZzhVfqCQip2GCoVki9orhRbfsAdo9BI2+KhMOTAsFwf4QfbuqbLNoP/o
 LdqZ3mQxwtcvePufLvvrBmkYpiBTza7FFI4udnd+jVqq+0R/aVEcEgtjpNfLci/mqone
 HzqoIEFSyAUFxalwc+xfs/90u1N2rVybxNk8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmIsrL21BptfR5lJ33xzvPrHdSqSoSVQqC25q5Isc/M=;
 b=HzhkzObqXmXucFD6gSw6gUocDWUASk7GKzcxwNXyaLZC76NpHsD11skjeR5v8IOK0m
 OEvmXmqaKZ8YtYU8uX2CCxPhaCBahpd+QQqfBNOsgWjjWkRZZiEeSd5mAx5CsBdtaGkg
 Nn9ok794o8QIKxxRyAXqG2g2RMGLn/rwRdAssXagfcu4zD4hIdRF+iy9CpkBla0+2XKM
 y8X5CG7TeS0lRRmFYDShGR2NdbvklKGq327a9UZU+zzHY/QtmVht5mCNF1CiONJmeumY
 o8KKzYJ4pnO/HUeWneNsysg39NNFCteMidP23tzlHj+/kLBpFelQRVD2zculzY00NORL
 doyQ==
X-Gm-Message-State: AOAM531Ov05IcTR8AEimQ3SbXx43egoOKAWv/9CoqvlFLkR6isYVaGX7
 hmCb2svehnVF/dBvTgRyQnvlocwxhsk1zgwbU5M=
X-Google-Smtp-Source: ABdhPJyjw9nB8TsNlSWIyVYCkMy3y2oX+ivBLxQmxtsNIz2AymSLafeF8rCGnldJSE3Wj8V7dt+C9F2CGT3qrm9tFUA=
X-Received: by 2002:a17:906:7d0d:: with SMTP id
 u13mr184055ejo.448.1601273856198; 
 Sun, 27 Sep 2020 23:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200923164730.176881-1-tmaimon77@gmail.com>
 <20200923164730.176881-2-tmaimon77@gmail.com>
In-Reply-To: <20200923164730.176881-2-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:17:21 +0000
Message-ID: <CACPK8Xc8dnYFATxj11oJnM_nWvUuQ71J_eyU9L+=O+ss_34gbw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] arm: dts: modify NPCM7xx device tree clock
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

On Wed, 23 Sep 2020 at 16:48, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Modify NPCM7xx device tree clock parameter to clock constants that
> define at include/dt-bindings/clock/nuvoton,npcm7xx-clock.h file.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Tomer, for next time: when sending new versions of a patch series you
can add the reviewed-by lines to patches that you have not changed.
This one is a good case of that. It saves the reviewer having to go
look at it again.

Cheers,

Joel

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
