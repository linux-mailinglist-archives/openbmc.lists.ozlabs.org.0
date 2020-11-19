Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F12B9ACC
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 19:41:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcT6N3q5kzDqpG
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 05:41:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C6mhW7KC; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcT5J5tsMzDqnR
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 05:40:31 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id l12so6305053ilo.1
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvBOcBzyg+eaLhpr35x3ip38QjdZlKmVc5mM+8taPHE=;
 b=C6mhW7KCNFK2+hF2yTFbwgR4Hb2BSiSkENk1iQgAHCifiyZwkapsVC6SULC6UZ5/5Q
 MuxYOBRSLZ2fOcfQyIMgYaJXGn+LgYjGrkIaQNPr6qyDRYr4ITWlcE0SLbBGZbhJXwwS
 hWzTlYMWnMHUTXTprJASQTlPO6Pf0h6kpIYdVbDvAqCepDAl3g2S5TVAIoPWPB6wQcLw
 QhD3yYh6J0USuXo7o3gIYzhPHFpc22mK0CNSwTGssQ405lzyGfS31oq5WZxKiTjJoc70
 02FuPV42opH7PSClyZSKhr+0bPC71r0TnddDkAKLNpk0xZvUhGR0PGCH13Q7WQBC6aJU
 AHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvBOcBzyg+eaLhpr35x3ip38QjdZlKmVc5mM+8taPHE=;
 b=KU7niIP6U88jhVj+1R1t6NdY2Mn6C+mq6run1LAQnHO3YtgW6f+2EbAeoigjGhg0fU
 vWrFx1atjq2qxsCt1bVEpcx9G8HpqIeN3dk+VXdLXm2pwxgZD9ypzAMCcmqTHYU0DdbU
 HErFbCedVDJ7E693nzha6SXOXSPDiUDEBA0nU+nnF85IimuCuRl3kSZzRrb4Xy6pUGPF
 6gXrQ+D/CxQgMUooYCMEvH3xIuTe+tLEXplsrgAuj5DhLKqJJwv6BdlaKrlPJYVnXKWZ
 Kev1vWJ0RK39upKIceY2hyxsmrROVgZfozqjntd8XB7L0TucdTIwcUoeo7ZN1+FPWsY5
 tRVQ==
X-Gm-Message-State: AOAM5316NJ6ObZmour6+C6jucpMVofwcvHVEkPsauTFZB//ZKLw08egy
 X2EACNGQPjKSMQ3alhOvI9ndViqWk+Fs2OD5VlKSEA==
X-Google-Smtp-Source: ABdhPJyxBFnoi5YnxmRXEWi3RyOT8zK9WD++uul35NAXdT0Y4CBYSq0+BgknePDAlzmhd8jRWTJRg0Pw5651ggprPVM=
X-Received: by 2002:a05:6e02:1348:: with SMTP id
 k8mr20739743ilr.154.1605811227390; 
 Thu, 19 Nov 2020 10:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20201119080002.100342-1-tmaimon77@gmail.com>
In-Reply-To: <20201119080002.100342-1-tmaimon77@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 19 Nov 2020 10:39:48 -0800
Message-ID: <CADKL2t45q907QGpq9rqjnGgMx=43Gz4RRGbyRLZUozYD0kt-DQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, avifishman70@gmail.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org, arm@kernel.org,
 olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 19 Nov 2020 at 00:00, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Nuvoton NPCM730 SoC device tree.
>
> The Nuvoton NPCN730 SoC is a part of the
> Nuvoton NPCM7xx SoCs family.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730.dtsi | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> new file mode 100644
> index 000000000000..86ec12ec2b50
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Nuvoton Technology
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
> +};
> --
> 2.22.0
>
