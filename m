Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAD27A753
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 08:19:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0C5z1PpSzDqTC
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 16:19:19 +1000 (AEST)
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
 header.s=google header.b=WAQw2Jxd; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0C4S3mvHzDqVH
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 16:18:00 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id j11so6889391ejk.0
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 23:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=og/xKIlcnbQwfKfayjLu22fVEXxaNG/oUzExQ/XzAww=;
 b=WAQw2JxdpDxNCsx53zvA/3X0U++fqTbH9QXQn7Yt5HYkaUnc9AtPnWJlVatu8i/dg1
 HUxqUqF5NCaH+N4eVnQx36+Q2/SxFt19BupS6BpGajSgr6p3w834ktVrtSTneumMDqS1
 qK1A4h+KGEw5245Dv9CnwMHdo0f+plBx3oQwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=og/xKIlcnbQwfKfayjLu22fVEXxaNG/oUzExQ/XzAww=;
 b=A2BS6hk7LDEdm2FRo12lntc/Pp5y3S2Sls08R+l4GYWcEXMxp2GahSUX4a8mjdB96a
 Cufm7Fk45d9F8ZEQivwh6Uj9C5Mm1hLNbQpcByshS5jIMBfeOhIgOwj+255WarlKa7rX
 eYrhOTv8MmAaMY0aLnI1YtAPY03PPlwyuuFbYBkvCqRyCaEoTck08lMzyYZl73eIX/Ca
 6uBLa/VSZlZ8Fp3i9KE9TlDTRE873SDI1wU6z5wzMUM/tKDZIIdRKwBqM+seCQnrgE5U
 AOFsaXrxCL0A5Vyk99YNAxvx6qkk2hh+VjTJvlRQ/P5djZTPE29kkPpU1FjphOQo9MvQ
 qPMg==
X-Gm-Message-State: AOAM533c3vwZfRlmtKwxuaaqDwkg6mhmGuMI8o4i+gcLgZ6EO+4QTStb
 iz0gnBObNpT9fkwcMVVzSldLoZ++ZlloOgF0xjI=
X-Google-Smtp-Source: ABdhPJzsfZ9UNUyavQU1xUwjCp963U/zra5wh2Va6Jp9paYI+FUdpMAihGhZNiWAoH+ndHELSr6+0tK/s0lybXrQf0E=
X-Received: by 2002:a17:906:4cd6:: with SMTP id
 q22mr158265ejt.139.1601273877792; 
 Sun, 27 Sep 2020 23:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200923164730.176881-1-tmaimon77@gmail.com>
 <20200923164730.176881-3-tmaimon77@gmail.com>
In-Reply-To: <20200923164730.176881-3-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Sep 2020 06:17:45 +0000
Message-ID: <CACPK8XfLn_AA3HJZ8kFadbdN0gn9i-eGoGXoHQ8C_Lu4CU1aYw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] arm: dts: modify NPCM7xx device tree timer
 register size
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
> Modify NPCM7xx device tree timer register size
> from 0x50 to 0x1C to control only the timer registers
> and not other hw modules.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 16a28c5c4131..72e364054e72 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -120,7 +120,7 @@
>                         timer0: timer@8000 {
>                                 compatible = "nuvoton,npcm750-timer";
>                                 interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> -                               reg = <0x8000 0x50>;
> +                               reg = <0x8000 0x1C>;
>                                 clocks = <&clk NPCM7XX_CLK_TIMER>;
>                         };
>
> --
> 2.22.0
>
