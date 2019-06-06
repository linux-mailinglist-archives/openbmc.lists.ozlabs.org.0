Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5802369C5
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 04:06:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K8CF0WYVzDqcX
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 12:06:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="avdHYRAn"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K8Bj3cKvzDqcF
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 12:05:32 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id 14so973461qtf.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 19:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BhPd7ba7jKMVWKw8/eSF8i1qnaiPry3OysiOXTcyigE=;
 b=avdHYRAn79Tjf8BLOrgNVdkSN2aQaVuUA9oopWfjJB+aRi56cdDjeidBNegs0hDKkC
 7m4igHz7P4g+FSyrafljofwI81dRuR8nnQqyQytEXGGizimEfEB/LMoouYHmGLeQKfIC
 FTfY6gxjXngejxOw1UrJIacVcKYYeEZWxrH1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BhPd7ba7jKMVWKw8/eSF8i1qnaiPry3OysiOXTcyigE=;
 b=pW8PkNTnpcMB1gP/Esb0LvPbC5FuT6OE4/2zq9IkDGbGZSIm4x9omEnrYOQU8JzhdB
 R/9+UbGiEHaTsCOmDKW6nn56Dx8h2DR7rBK8aNN9DCSIgqJs7RIOdQ4YpD6YtgheAHlL
 ZsrArIivOMwH5WqnUCxf6T5GXWRAOEcTJb4xuvgCvMDigauuxQBAA6/YQ55caMRH7V86
 tuDZwoR/btOsrdGx0lWbh44m64aIqNyCLKAzaao5V8mtvRPh24hMMFDF+jE068BP7yqP
 GpYMqIYa6gR8BwIh5YamjuhVh6VQ+bYWAjvIEiDVrpJPQAAHDl6esz17MIzxsUSt96bG
 BqMA==
X-Gm-Message-State: APjAAAVmMrlp++pRx485GS01blqJ6ifTZZA0ZG9zF2WyA/+KwGZl4epd
 sjlP7VAA4vLtztPrexscbPKu3YUTo3+qwLM4El8=
X-Google-Smtp-Source: APXvYqz2an1PY6BMyAJ1dCSmGQ61Nf4AAXQGjTuY5sw1EUtj6Bqv9M5t9efprT5O2fADov9rvMV6MnquIT3xqRwnUd8=
X-Received: by 2002:aed:3e36:: with SMTP id l51mr37276966qtf.269.1559786728979; 
 Wed, 05 Jun 2019 19:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190605133625.991-1-Fran.Hsu@quantatw.com>
In-Reply-To: <20190605133625.991-1-Fran.Hsu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Jun 2019 02:05:17 +0000
Message-ID: <CACPK8Xf64=0SdFd9NSt+7F32fH4ndrezx2cHXQwjh0S70vaOYQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v6 1/4] ARM: dts: nuvoton: Add NPCM730 common
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
 Fran Hsu <Fran.Hsu@quantatw.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Fran,

On Wed, 5 Jun 2019 at 13:38, Fran Hsu <franhsutw@gmail.com> wrote:
>
> Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> This file describes the common setting of NPCM730 soc.

Please base your series on top of the dev-5.1 tree. The latest commit
as of today is a17b8ac585d7faa27799f425fa4326c7a1e7ae71.

Many of the changes in this series have already bee merged.

Cheers,

Joel

>
> Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 57 ++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> new file mode 100644
> index 000000000000..20e13489b993
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
