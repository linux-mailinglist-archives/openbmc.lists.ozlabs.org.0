Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 377203114E
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 17:29:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FpJZ5KFyzDqRh
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 01:29:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Vnr1sgNE"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FpJ20dvtzDqLr
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 01:28:33 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id g24so3231352iti.5
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 08:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoZb/tu5XzPaU0NBP710Y+OUmDaqkYwWyGTShOqW6sw=;
 b=Vnr1sgNEE5saiLbfy4tIILNfL5vHsYY865QRCyOD2E6M6SCUy4O+3nxRM9/AApAVOC
 pF9COAH8kyegU1O9U15sT5lbGh1DpczWAqHNK+xnzMlXRFQPoDaNXW3wzqV/3s1iXQHW
 yPdN7BZHtTMldKHy2Xl3DSf71xQUoA8+mnA5yVEuKWsCKRrSx5psNqeUwbzvEz9yOC6o
 ua76R6lRRVsFbPpY29G1j8H3dm2L3llicE3RyDlT8WMSBMnskSSPltAl5xN9luoFRtn9
 uTeyWX2VAn8hEebYLZOFJ+4wjDi9lYts6y5fviv/1jW/nHczI3SN5pXwDbzCvxPGmTqN
 Hu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoZb/tu5XzPaU0NBP710Y+OUmDaqkYwWyGTShOqW6sw=;
 b=pdtTiI4LFzJOL1p42JZNHYtdK5ZWImqUw13JuVLlxCdzyQzgMPBVn3BxabZk6cI6C/
 YrKHHOVhFc2AMHkDhLbOCV0hCqi7tnyDcHr5s4SiUrUx/0WAST6fGHfWu3yaoXME4K4o
 NFZrlBh4RgxLYEYyrh/GEzQPoecJc1YO88v/ObUJpyzZt9DVgPFrhH3v5ZAIaQQ+xnce
 JDHIk+dvg7C3groFWJZSPztLHEwKv+aR7BdRjvWEtmNBhTL2L6u0HxogBFSnz5hVKhfG
 lnxHNPgZfTaX4+/zVh+DOjNmin3YprhiSzqcxgHXZdsoQkDEzb224D4KlPvKlFyM7DmC
 8VLQ==
X-Gm-Message-State: APjAAAUG+T7NKREVEqZEmnIlY/j1Y59gYgQK5X3tVZ0Z0le2rjHcn7Vh
 Aivx7VBOGzoE06EGk4qhgf9Q+W6h2OC5sJUxXCGlRw==
X-Google-Smtp-Source: APXvYqwHtdtADLj/85ykiKUwze438huipW4EQbN6+6R83szAQUvG6M6WkIGCdxz/ztOBDeZCwa7L9asAnTkAlWCx03w=
X-Received: by 2002:a24:a943:: with SMTP id x3mr7786318iti.64.1559316510030;
 Fri, 31 May 2019 08:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
In-Reply-To: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 31 May 2019 08:27:54 -0700
Message-ID: <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
To: Fran Hsu <franhsutw@gmail.com>
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
 Fran Hsu <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Fran,

This looks great! I think it's ready to merge.

On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> wrote:
>
> Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> This file describes the common setting of NPCM730 soc.
>
> Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> new file mode 100644
> index 000000000..20e13489b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
> +// Copyright 2018 Google, Inc.
> +
> +#include "nuvoton-common-npcm7xx.dtsi"
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               enable-method = "nuvoton,npcm750-smp";
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <0>;
> +                       next-level-cache = <&l2>;
> +               };
> +
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a9";
> +                       clocks = <&clk NPCM7XX_CLK_CPU>;
> +                       clock-names = "clk_cpu";
> +                       reg = <1>;
> +                       next-level-cache = <&l2>;
> +               };
> +       };
> +
> +       soc {
> +               timer@3fe600 {
> +                       compatible = "arm,cortex-a9-twd-timer";
> +                       reg = <0x3fe600 0x20>;
> +                       interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
> +                                                 IRQ_TYPE_LEVEL_HIGH)>;
> +                       clocks = <&clk NPCM7XX_CLK_AHB>;
> +               };
> +       };
> +
> +       ahb {
> +               udc9:udc@f0839000 {
> +                       compatible = "nuvoton,npcm750-udc";
> +                       reg = <0xf0839000 0x1000
> +                              0xfffd0000 0x800>;
> +                       interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       clocks = <&clk NPCM7XX_CLK_SU>;
> +                       clock-names = "clk_usb_bridge";
> +               };
> +       };
> +};
> --
> 2.21.0
>
