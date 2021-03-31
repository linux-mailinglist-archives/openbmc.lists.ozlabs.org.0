Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 197E634FA4D
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:33:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9J2d0zYNz3bwM
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:33:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Dj8z9o0w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dj8z9o0w; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9J2P2W3tz2yYf
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:33:16 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id g15so18467873qkl.4
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dEQceVJ/J58vBmGjjhTRoBDAaleFf/l36qwF56qx5yU=;
 b=Dj8z9o0wqWMuVGtv/uAHbUaVcytOWBMxP4R1Tbiu/iPqObDIjCfaURDygM3YRbsFkC
 CQFDPdiVUpDQ4ptSS6mJSt4J7uMCLwJEhuseP82Q/Tbj12ku6y0EOlLsHoDV6UuM3uVa
 nluN8YGdTZbQeSEKGA5vigTJteKyxF4NFBauw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEQceVJ/J58vBmGjjhTRoBDAaleFf/l36qwF56qx5yU=;
 b=Nz7C2yKEC0GWRsqfzjlw8NnmWO/FTXDl9iaJsaK7j4YpCphQy/6hBAr+IoRcA8Z5Ha
 PcqH/K3hVjPymlX5BXieMZihx1iC8eHo/YzW0rb/fHgJxkrwp7hVaIRMptbygHMGgYXx
 PbMicXW/A/iRTVFL42CSFg/X11+EGfcCPJQxgopNvKfixy14PCYBLBbiTJA6MashXjhh
 NogMHdM5v4Ytr0Tx2ZDVuY26E+QnMO7G3mZ7KLjLgHNwxn5OkHkdivtEK+aGKyjKqIb2
 7rF3T3lGoMhmjD26+JPB68MKnHkGK/U8PrNZGLJ3tG5xfkN5CqzjknoUXN8fbVRznQ0V
 pFdw==
X-Gm-Message-State: AOAM532Zs4plUwXWh051Svmr7LN5+vfOe9iTyyXVEJ2H+c3vmkrjY6zh
 8Y5xpcSEjMzBKKPHmoBl7bWt+nTZ/+91xI+mSFg=
X-Google-Smtp-Source: ABdhPJzz10TWaXDuElrMA2liOjSf0UUuBezp+KUaw2D7auKahuaHhdIbe6SOzFcL+gggWgX8PqeEU9Rrb4LanWVcwdY=
X-Received: by 2002:a37:a147:: with SMTP id k68mr1940282qke.66.1617175994642; 
 Wed, 31 Mar 2021 00:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210330071336.18370-1-george.hung@quantatw.com>
In-Reply-To: <20210330071336.18370-1-george.hung@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:33:02 +0000
Message-ID: <CACPK8Xd6Y_-uWDMWe=Y==PcJ4f7dOR6hvQbQ=FLLKX6Ugzu6EQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.10 v5] ARM: dts: nuvoton: Add Quanta GBS BMC Device
 Tree
To: George Hung <ghung.quanta@gmail.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, brandonkim@google.com,
 Avi Fishman <Avi.Fishman@nuvoton.com>, Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Mar 2021 at 07:22, George Hung <ghung.quanta@gmail.com> wrote:
>
> Add the device tree for the Quanta GBS BMC and it's
> based on NPCM730 SoC
>
> Signed-off-by: George Hung <george.hung@quantatw.com>

Thanks for the patch. I'll apply it as-is, but if you have time to
send a follow up to fix the suggestions below.

Reviewed-by: Joel Stanley <joel@jms.id.au>


> +&i2c1 {
> +       clock-frequency = <100000>;
> +       status = "okay";
> +
> +       pca9535_ifdet: pca9535-ifdet@24 {

I think this should be:

    pca9535_ifdet: pca9535@24 {

The node name is the generic thing, and the phandle is the unique name
you use to refer to it. Same for all the pca9535 nodes.


> +               compatible = "nxp,pca9535";
> +               reg = <0x24>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };
> +

> +&pinctrl {
> +       pinctrl-names = "default";
> +
> +       gpio0: gpio@f0010000 {

These were missed in converting to phandle; you can pull them out to
the top level and do

&gpio0 {
 ...
}

> +               /* POWER_OUT=gpio07, RESET_OUT=gpio06, PS_PWROK=gpio13 */
> +               gpio-line-names =
> +               /*0-31*/
> +               "","","","","","","RESET_OUT","POWER_OUT",
> +               "","","","","","PS_PWROK","","",
> +               "","","","","","","","",
> +               "","","","","","","","";
> +       };

> diff --git a/arch/arm/boot/dts/nuvoton-npcm730.dtsi b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> index 20e13489b993..03bb8ab8cd6c 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-npcm730.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
>  // Copyright 2018 Google, Inc.
> +// Copyright (c) 2020 Quanta Computer Inc. George.Hung@quantatw.com
>
>  #include "nuvoton-common-npcm7xx.dtsi"
>
> @@ -44,10 +45,50 @@
>         };
>
>         ahb {
> -               udc9:udc@f0839000 {
> +               udc5: udc@f0835000 {
> +                       compatible = "nuvoton,npcm750-udc";
> +                       reg = <0xf0835000 0x1000
> +                              0xfffd2800 0x800>;
> +                       interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       clocks = <&clk NPCM7XX_CLK_SU>;
> +                       clock-names = "clk_usb_bridge";
> +               };

> +               udc8: udc@f0838000 {
> +                       compatible = "nuvoton,npcm750-udc";
> +                       reg = <0xf0838000 0x1000
> +                              0xfffd4000 0x800>;
> +                       interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +                       status = "disabled";
> +                       clocks = <&clk NPCM7XX_CLK_SU>;
> +                       clock-names = "clk_usb_bridge";
> +               };
> +
> +               udc9: udc@f0839000 {
>                         compatible = "nuvoton,npcm750-udc";
>                         reg = <0xf0839000 0x1000
> -                              0xfffd0000 0x800>;
> +                              0xfffd4800 0x800>;

I assume this is correcting a mistake?

Cheers,

Joel
