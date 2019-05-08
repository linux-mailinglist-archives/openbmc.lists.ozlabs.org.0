Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41A1804B
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 21:15:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zmPy3XSkzDqLK
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 05:15:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BGNMdxgM"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zmP46r7DzDqHW
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 05:14:16 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id q65so5944014itg.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JAceux3BwnBTuHaGghxZfJdD9o67KCJFlQWpb98wf7U=;
 b=BGNMdxgMAlkp/W5sE6aoAExnahUSWxa8iH6r88naGe5X0AGUI6N47KsmlUbLrlCvTy
 z3t2Rk0L7fZBdG33WJAHD3VhHUp/+hZBaHWSpy3G8x6mHBD+Mjvtc+YOguWR+XdWKibA
 ctjXt4CFE2iGgP70/yk248px6V81aBgvPzuG5AxPBJh96rwN5EmhXlI0azSoscBdF1ii
 tDraBxo5oGRL5UcHkfJ/uTGQ/gakMPPc0Afz51OmC5FVHlU/vxCV59+YXiFT+bLH6aE3
 LrNCpAfloue5qa7kgWMx6KRz76RD440p0NbafDVBerLapXiZkHT+1sCZ1AHxydB7njav
 qEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JAceux3BwnBTuHaGghxZfJdD9o67KCJFlQWpb98wf7U=;
 b=sktVN7zvvQtO4JGWwlfVaiE/3OwjbMAee2bL6vvZTzQfZ6Mq6qB+ua/oTDFv0GZxGm
 ICSyOGSXeAyh9Xns+UIpsKq/9BE/1SLCotIEiaCzqTFqH96B00OVIwlEN8ibCC3tGNrS
 +bxEi/riNOCFPsFSZsznZbjYbwV6UJTBcqOGfKXs2abpIPPrpqrV//nbZlpe23hzsaBf
 9Lkd958LwpOoeeW3G4idKoqWi9Czk+QUXpmTfzaW04sbIfQgLVAYqNW5zR+xHMNYipfU
 CcXne3kcJevM5ZEt8zu4tC6aEUdk9JJQQJ9jmVS7gr5l3zz0R82KxRTSYdC9YAbFGVvs
 M4fA==
X-Gm-Message-State: APjAAAUKO2QaKTox4exiQd8T23qv+Z86fSgm/QfQV6EzJXxVI7Mp10LC
 xtIPT9aO+VbQdYCAAAabnbOC4JO1LWR6UvbXjJ8dsd8X
X-Google-Smtp-Source: APXvYqxqGIFwjt6yF6BjIpqIlExhXGJ6+NNemXLkJAklvlwgvvNWegheijH8fC1iuljUbLjtHoWkufW8KYwxPKit9mk=
X-Received: by 2002:a24:65cd:: with SMTP id u196mr336780itb.74.1557342852443; 
 Wed, 08 May 2019 12:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190412140132.39764-1-fran.hsu@quantatw.com>
In-Reply-To: <20190412140132.39764-1-fran.hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 8 May 2019 12:13:36 -0700
Message-ID: <CADKL2t4mcw_oLb7D_TQx5DSBzfyfZGbf54g+oRwSCfAo+ANY9w@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 1/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 machine
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry for the delay on this.

On Fri, Apr 12, 2019 at 7:01 AM <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add a common device tree include file for NPCM730.
>
> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

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
