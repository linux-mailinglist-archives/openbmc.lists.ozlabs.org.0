Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F04A40D3B1
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 09:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H97lp3CWcz2yV4
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 17:20:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=muqd23pb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=muqd23pb; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H97lQ2701z2xv8
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 17:20:17 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d11so4743079qtw.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQugZtHY57Xih1uDcepGYG47/R81kT9kEkJFqJs/DiU=;
 b=muqd23pbPB1mGEq38d05Z0dO1wXR80IelZVxe+gM/VAAfqxToJrhb+ZL2cpsFCXNAs
 rsYBh6rmQA92FqAIHFrtuhQNVeX1blPu3J9jHnLMm63abx3+FVTTj3rjJAxc3WbnO3Uc
 kSTgXps1+tFs9ndSrLy3CH/KL5zSSFjpR4Tao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQugZtHY57Xih1uDcepGYG47/R81kT9kEkJFqJs/DiU=;
 b=3L3/IQb2wVeLRYCwawDpvf6bkAlq5uZ4wIXMEhENdJvKYMXdLC3sFSmlDUG6nHLTFn
 zAyk8MqIbgX65DqqsUfYTPr74uPm9sKc4O0/aghcPpydqnNCQ4Kuv6CQXzI6MifXaPzo
 qcyFRjaElmR0sIjlVjZLy9RFRZAvUS2IOs+ahWmta5Jyo3uPhMt7FIl05vs+KHb2WGSv
 rRHAlN2gbriZwE7cBXZ7/I09tLOZZ2uVPrfcvkwI6+zfrw6V+PZqJLmLsCAn5twR1fdM
 yzVCSP1KV85LyuDNWS1AFM2CnJykx/VFiWiLMGURsRm6TaqrbGlIRBqVtGZcMMplIDhn
 4iEg==
X-Gm-Message-State: AOAM5323ztBaEVQS2X2mqZnrzsKZ5dsagH7JkxcKX9dzdEq5+l3wAtL7
 jK+WGH9ZgZNB3+qwPFi9oHGYbYAU+zBwm8peaiw=
X-Google-Smtp-Source: ABdhPJxu6yopXtgWe5Dsb7gRVz1zGhWvodkbLA+tBygp1ew5Gmisj2z/AyRnH012fYFGpFx3bFkxVkBR8R6E1whFWcY=
X-Received: by 2002:ac8:7315:: with SMTP id x21mr3646635qto.392.1631776813600; 
 Thu, 16 Sep 2021 00:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210915214738.34382-1-eajames@linux.ibm.com>
 <20210915214738.34382-5-eajames@linux.ibm.com>
In-Reply-To: <20210915214738.34382-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 16 Sep 2021 07:20:01 +0000
Message-ID: <CACPK8XcKeySOjYwiwpHiqGWcnjYhs5HxBYYqTyqTF-H_2mpTaw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 v2 4/4] ARM: dts: aspeed: Rainier: Remove
 gpio hog for GPIOP7
To: Eddie James <eajames@linux.ibm.com>
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

On Wed, 15 Sept 2021 at 21:47, Eddie James <eajames@linux.ibm.com> wrote:
>
> Only the pass 1 Ingraham board (Rainier system) had a micro-controller
> wired to GPIOP7 on ball Y23. Pass 2 boards have this ball wired to the
> heartbeat LED, so remove the hog and add it to the pass 1 devicetrees.

We can obviously remove it from the device tree we have, which is for
the pass2, but we can't add it to pass1 as we don't have them in the
tree.

I recommend submitting them to the openbmc tree (but not mainline, as
they're pass1), and we can maintain them in there.

Cheers,

Joel

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts | 9 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts    | 9 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 7 -------
>  3 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
> index e35a3efd9d22..b7ec83848750 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
> @@ -22,6 +22,15 @@ aliases {
>         };
>  };
>
> +&gpio0 {
> +       pin_mclr_vpp {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
> +               output-high;
> +               line-name = "mclr_vpp";
> +       };
> +};
> +
>  &i2c4 {
>         /delete-node/ pca9546@70;
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
> index b3c923f1838b..d650dbebe5d2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
> @@ -22,6 +22,15 @@ aliases {
>         };
>  };
>
> +&gpio0 {
> +       pin_mclr_vpp {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
> +               output-high;
> +               line-name = "mclr_vpp";
> +       };
> +};
> +
>  &i2c4 {
>         /delete-node/ pca9546@70;
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 2b6bb20dfd82..9250d9465407 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -254,13 +254,6 @@ &gpio0 {
>         /*Y0-Y7*/       "","","","","","","","",
>         /*Z0-Z7*/       "","","","","","","","";
>
> -       pin_mclr_vpp {
> -               gpio-hog;
> -               gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
> -               output-high;
> -               line-name = "mclr_vpp";
> -       };
> -
>         i2c3_mux_oe_n {
>                 gpio-hog;
>                 gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
> --
> 2.27.0
>
