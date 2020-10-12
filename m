Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1DA28AD10
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 06:36:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8m8f38hBzDqjT
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:36:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SOWUjFcC; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8m7g4h1ZzDqWk;
 Mon, 12 Oct 2020 15:35:25 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id cv1so7864941qvb.2;
 Sun, 11 Oct 2020 21:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nGaRgY5KXDnDzgTPGxT6g3wAgRB6O4Efwdc4BkmUcUQ=;
 b=SOWUjFcCQQ64YMoS0aewIWeR2JZr4N4UPekS7iGiL3qAfsUMJ4/CkpEiG+L1PmUcdy
 0JknrUGXjVlQEGtpGwfJ+mL4W1w1sPyNaf9bo/oEwcTLRZ8fUId82aPbBnrpuUFSAW3y
 JR57zS7q5TJXMyJXE1U2e1e/AxudPhhcjIAbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGaRgY5KXDnDzgTPGxT6g3wAgRB6O4Efwdc4BkmUcUQ=;
 b=DNdOwiXqIrge7OGTdpfP3bMeyoR1zaarYlLn1JKjrM/nPmsVuGnvUdnOySfQMdoVXc
 tb4c7gaQEidUtGKo8Dapb7zOAbbh0wEhsSAzcW0Pns7/SDbxFlFnsEfxcWjR3kok62q+
 XSK9dFQVHaN4RbYBYDNivsed6TfZ4fLS46ILSJ9rM7/Ea5OCjD15uQdfHHxUVCerxwJA
 24TCCo7drsxmLghSTWtFayC052zz7ke29MUP5JPrx0wMvMBdSH6pu3HMqnyOWE07Mdie
 UxpIQ9k2GHU+Ln07T40rL/pk3lIiXpUq4DYRh202DyZgooiSQpzXgUInIzgtzDsgknGP
 WCTQ==
X-Gm-Message-State: AOAM530u26CBulrLWFujCww0AbOZbSg6lFiQeHLc6qwrF+Gweckh1obv
 9M57vecswHkgDJrHbXAVMt9W868ft7T/WTHV4YE=
X-Google-Smtp-Source: ABdhPJz7CL/VjmDDY37z1JG7gnOXApbbOdETG7sUFAFSF3cJkzGsH4f/RHqySKhCjPt72g6ojvIXvmBDeknLFRJYh3I=
X-Received: by 2002:a0c:e308:: with SMTP id s8mr3269819qvl.10.1602477321232;
 Sun, 11 Oct 2020 21:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-3-billy_tsai@aspeedtech.com>
In-Reply-To: <20201012033150.21056-3-billy_tsai@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Oct 2020 04:35:09 +0000
Message-ID: <CACPK8XdYvSmwdAkBzAO3kC8_PYa3CtPkNb0VxcOhmb2UYz5zDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Arm: dts: aspeed-g6: Add sgpio node
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 12 Oct 2020 at 03:32, Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
> This patch is used to add sgpiom and sgpios nodes and add compatiable
> string for sgpiom.

You also need to add sgpios documentation to the bindings docs.

Whenever you add new device tree bindings to the kernel tree you
should add documentation for them.

When preparing patches for submission, use scripts/checkpatch.pl to
check for common issues. It will warn you if you are adding strings
that are not documented.

Cheers,

Joel

>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |  8 +--
>  arch/arm/boot/dts/aspeed-g6.dtsi              | 52 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> index d4d83916c09d..815d9b5167a5 100644
> --- a/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> +++ b/Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> @@ -1,8 +1,10 @@
>  Aspeed SGPIO controller Device Tree Bindings
>  --------------------------------------------
>
> -This SGPIO controller is for ASPEED AST2500 SoC, it supports up to 80 full
> -featured Serial GPIOs. Each of the Serial GPIO pins can be programmed to
> +This SGPIO controller is for ASPEED AST2500/AST2600 SoC, it supports 2 master.
> +One is up to 128 SGPIO input ports and 128 output ports concurrently(after AST2600A1)
> +and Second one is up to 80.
> +Each of the Serial GPIO pins can be programmed to
>  support the following options:
>  - Support interrupt option for each input port and various interrupt
>    sensitivity option (level-high, level-low, edge-high, edge-low)
> @@ -14,7 +16,7 @@ support the following options:
>  Required properties:
>
>  - compatible : Should be one of
> -  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
> +  "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio", "aspeed,ast2600-sgpiom"

I think we should add sgpiom strings for the ast2500 (and ast2400?)
too, as this is how they should have been named in the first place:

>  - compatible : Should be one of
>    "aspeed,ast2400-sgpio", "aspeed,ast2500-sgpio"
>   "aspeed,ast2400-sgpiom", "aspeed,ast2500-sgpiom", "aspeed,ast2600-sgpiom"


>  - #gpio-cells : Should be 2, see gpio.txt
>  - reg : Address and length of the register set for the device
>  - gpio-controller : Marks the device node as a GPIO controller
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index ad19dce038ea..cb053a996e87 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -366,6 +366,58 @@
>                                 #interrupt-cells = <2>;
>                         };
>
> +                       sgpiom0: sgpiom@1e780500 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpiom";
> +                               reg = <0x1e780500 0x100>;
> +                               interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +                               ngpios = <128>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               interrupt-controller;
> +                               bus-frequency = <12000000>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_sgpm1_default>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpiom1: sgpiom@1e780600 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpiom";
> +                               reg = <0x1e780600 0x100>;
> +                               interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +                               ngpios = <80>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               interrupt-controller;
> +                               bus-frequency = <12000000>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&pinctrl_sgpm2_default>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpios0: sgpios@1e780700 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpios";
> +                               reg = <0x1e780700 0x40>;
> +                               interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               status = "disabled";
> +                       };
> +
> +                       sgpios1: sgpios@1e780740 {
> +                               #gpio-cells = <2>;
> +                               gpio-controller;
> +                               compatible = "aspeed,ast2600-sgpios";
> +                               reg = <0x1e780740 0x40>;
> +                               interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio1: gpio@1e780800 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> --
> 2.17.1
>
