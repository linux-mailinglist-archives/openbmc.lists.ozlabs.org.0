Return-Path: <openbmc+bounces-406-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3758B139DF
	for <lists+openbmc@lfdr.de>; Mon, 28 Jul 2025 13:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brGWN3llCz307K;
	Mon, 28 Jul 2025 21:30:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753702256;
	cv=none; b=Q8hQQeSx/CL6uFks5poe7BSITYBkcvqoSUduf7dt1iNyeRUpTedGLANqZVKNccLbT1UxKbj0VR5X9qreqLcsdmT3rNqBfEFjh2L7VxK5St4+K5l/XoPBsIa40h3E6yoOieGulbDgyGMwDbrAuF/ESmDSJGWyvNtg/fiZpJvQYItgohrYSystm3EE7UV6e8snbUTNxydhCO007ghlEGZwYrgp9zx/fpjq1VFaD8lGBz7Qwy5j4gH1V6pfh+V60KdkX2SBQ6aK5LSDjmbnb9+0YaXbJ1pbj4Dx4dZw51QdFOGbIeyiwi0FMSDFeTnuHbpj0K1Ksv/IqFI/5TTXHvAHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753702256; c=relaxed/relaxed;
	bh=nNtNrao6UVesGhYjMLNvpZlbMAwweAAO5D4RH4zwPlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxx3vsrhydOSXLNRUr4vd9Aq1WrDKdubLkdLNMagmWQgnuYPS/8D/rl8YYhiqn8Zggun01UtQFbKDzRjOsNZsCRiCOp7urjpnM1RztVhUBqoPVn9UdZGgmMOAZH7MLkxw8I5SjCZiGum4bhz1Th2YBvTMhAGWleIjIriDo94ezSjn7yJNmOvP6a+pbwRh7TuErf6+eebBhojDq1LdNgnn1vPplvRUWhzKZomRbWH2g7DHBcgzd030fixVE+voq985q3MIDgi+T4iq+vx1YcN+PAiIBGFA4pmf+kobfYqBAlYXKBR0YcEz3pJWpJ9Uh5noeM9XUQd2BWiljurBsCD1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X66+E26g; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X66+E26g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brGWM0wTCz2xRq
	for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 21:30:54 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e8e19112e8fso304825276.1
        for <openbmc@lists.ozlabs.org>; Mon, 28 Jul 2025 04:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753702250; x=1754307050; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nNtNrao6UVesGhYjMLNvpZlbMAwweAAO5D4RH4zwPlI=;
        b=X66+E26g1D9TzwbmYyYg9mStSkmRyhZTSsuafiDNOe+gmbV/d7/YlqtaO9Sm7Ojxso
         ncqSy0bdFRct+0uUI+w3SnDHifMB+F8GIaDl90FXb+LpRevWutXxal5mVr3lOKMptDou
         WwVwvSVn5uIkLOyF10Eg+q3VeeTtsPm2Ev4De3YmXbDUySl/320+l+JQK009+KbzLynM
         Sv46Z2uMSoUysLXJxD3RxZ8w+9QoU7TxdXt1JGNpndyehM7gBX+MEli2kpLe8ExjKsJQ
         ENVsAAnAni4LoE1VoJv5r5ng5loOKiEvKeBVcD04QGwIYt0oXr7jYTxGPCGzOYiFcHQC
         7nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753702250; x=1754307050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNtNrao6UVesGhYjMLNvpZlbMAwweAAO5D4RH4zwPlI=;
        b=mRWyv/xfRQuPCFqByEgE8bl1g35auKoIMPTqVUiFe4W0e7Upd/zCIcO2xlgJD15K70
         6KZCIOGz4Z8hMo6xuS4NZmKFe3Yp66A19GWSAxOmYqYwUm4nPBjFXqvtVReNv4JiCTu2
         XJikLpdZQPDTcXFDsqg8Q0w18pBSXbSCGakzP5jurG5vRm/P/hV+X0q6aGeV+gc88rIr
         ycpWa17FwQw8DGdG8xm7Xhev3j7N20RTxNJdpEGs0JKfrr5jFsXEt+/co+k1ku+l8m8e
         YMpRqb/ZQwCrcaSnUIVBxWqQYAvPhaRiqRH5NHpvnYOgB57T2gkvSjGnKSIec5Xjl39u
         ce/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5W8gnlsHSn12/a7Y2n4SItPlbZRRaXc18a0MajrLmpehQRQY2ZhBeNJ3a95c7NQr90WedJqzE@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeteaZKmETx3BwSZ3q30PiKOy4SuUQSUFewa92Dv1cH4B0lEcg
	u9aLH+GlmLqDZIXkD8PemPONwwoUXmpxl1JH6XSNRyn8l4BsUReR4ITQKaNiksgxak1wOGZFfIK
	wNhhsWOfBYptjI6NCG2S0wQgZvSHVrsI=
X-Gm-Gg: ASbGncsduWlcukDrHA/OCZr/kUU8rbysYDKJbD2HZidcHEcdM5t21U2DTaRcfYenkwP
	iHDc+w/Qcv0MsnPjDaKB4AzdIVwzwtVoejGl1Gc2qN0vgT/SxWHYWOhmPyC4DUU7yy8roD41iHU
	i9v4rBt+REBhAM/PMGh5CRPDyIrdD/B9goxKwpE/zlt5v6Dgv1zv0QRMLX3q25DPgvTlWVPcbEA
	BOlk2IAyFVIy02dMYk=
X-Google-Smtp-Source: AGHT+IFumFg2UZwvA+f5kl7EQMHXkNUZt/zwa/n9YKY+QhiLG1qhJTrDdz/0F0M5MYN/krBckT6OuIygxIbgPz/5mng=
X-Received: by 2002:a05:6902:c0f:b0:e8b:7064:b with SMTP id
 3f1490d57ef6-e8df1231b91mr11050441276.43.1753702250334; Mon, 28 Jul 2025
 04:30:50 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250717135336.3974758-1-tmaimon77@gmail.com> <20250717135336.3974758-2-tmaimon77@gmail.com>
 <db07c25c-4064-4330-8bdb-8a619b0b2915@linaro.org>
In-Reply-To: <db07c25c-4064-4330-8bdb-8a619b0b2915@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 28 Jul 2025 14:30:39 +0300
X-Gm-Features: Ac12FXynceWX6vHFauZXjIJ3-QNlcwbofxe7Djt0AreDMabbmJlyHL9RKrb110Q
Message-ID: <CAP6Zq1jDCfhOWj4JwORy22TDZRBr0fnuy5-=G4WO9DFRv7pTdQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: nuvoton: npcm845: Add peripheral nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof

Thanks for your comments

On Thu, 17 Jul 2025 at 17:05, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/07/2025 15:53, Tomer Maimon wrote:
> > Enable peripheral support for the Nuvoton NPCM845 SoC by adding device
> > nodes for Ethernet controllers, MMC controller, SPI controllers, USB
> > device controllers, random number generator, ADC, PWM-FAN controller,
> > and I2C controllers. Include pinmux configurations for relevant
> > peripherals to support hardware operation. Add an OP-TEE firmware node
> > for secure services.
> > This patch enhances functionality for NPCM845-based platforms.
>
> Drop this sentence, redundant and not in style (see submitting patches).
> >
> > Depends-on: ARM: dts: nuvoton: npcm845: Add pinctrl groups
Maybe it's an issue with our work mail server,
https://patchwork.ozlabs.org/project/openbmc/patch/20250706153551.2180052-1-tmaimon77@gmail.com/
I believe you didn't receive the patches below as well, since I didn't
see any comments. Am I correct?
https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-2-tmaimon77@gmail.com/
https://patchwork.ozlabs.org/project/openbmc/patch/20250706134207.2168184-3-tmaimon77@gmail.com/

>
> There is no such tag.
>
> Use changelog for this purpose or b4 dependencies.
>
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 695 ++++++++++++++++++
> >  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
> >  2 files changed, 702 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 5cd877e6c20a..3564e0e30791 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -4,6 +4,7 @@
> >  #include <dt-bindings/clock/nuvoton,npcm845-clk.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> >       #address-cells = <2>;
> > @@ -40,6 +41,11 @@ ppi_cluster0: interrupt-partition-0 {
> >               };
> >       };
> >
> > +     udc0_phy: usb-phy {
> > +             #phy-cells = <0>;
> > +             compatible = "usb-nop-xceiv";
>
> Please follow DTS coding style.
Do you mean the property order?
>
> > +     };
> > +
> >       ahb {
> >               #address-cells = <2>;
> >               #size-cells = <2>;
> > @@ -56,6 +62,259 @@ clk: rstc: reset-controller@f0801000 {
> >                       #clock-cells = <1>;
> >               };
> >
> > +             gmac1: eth@f0804000 {
>
> Please follow established naming for node names. I'll fix whatever old
> stuff you took it from.
>
>
> > +                     device_type = "network";
> > +                     compatible = "snps,dwmac";
>
> I don't think we want the generic one, even if it is allowed by bindings.
Do you mean to use "snps,dwmac-3.72a" and not "snps,dwmac"?
>
> Also... You CC-ed an address, which suggests you do not work on mainline
> kernel or you do not use get_maintainers.pl/b4/patman. Please rebase and
> always work on mainline or start using mentioned tools, so correct
> addresses will be used.
>
>
> > +                     reg = <0x0 0xf0804000 0x0 0x2000>;
>
>
> > +                     interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "macirq";
> > +                     clocks  = <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "stmmaceth";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&rg2_pins
> > +                                     &rg2mdio_pins>;
> > +                     status = "disabled";
> > +             };
>
>
> ...
>
> > +
> > +             mc: memory-controller@f0824000 {
> > +                     compatible = "nuvoton,npcm845-memory-controller";
> > +                     reg = <0x0 0xf0824000 0x0 0x1000>;
> > +                     interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
> > +
> > +             udc0:usb@f0830000 {
>
> DTS coding style...
>
> > +                     compatible = "nuvoton,npcm845-udc";
> > +                     reg = <0x0 0xf0830000 0x0 0x1000
> > +                            0x0 0xfffeb000 0x0 0x800>;
> > +                     interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&clk NPCM8XX_CLK_SU>;
> > +                     clock-names = "clk_usb_bridge";
> > +
> > +                     phys = <&udc0_phy>;
> > +                     phy_type = "utmi_wide";
> > +                     dr_mode = "peripheral";
> > +                     status = "disabled";
> > +             };
> > +
>
> ...
>
>
> Best regards,
> Krzysztof

Thanks,

Tomer

