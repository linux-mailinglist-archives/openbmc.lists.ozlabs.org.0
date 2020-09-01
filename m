Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9F25881E
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:25:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgcWT5TzkzDqG8
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:25:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Pc4Y93tQ; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgcT20HnKzDqDY
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:23:16 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id p9so1204ejf.6
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OB92DQOVcUK7fQ/qIAdPQ+SmzMKuJpFA7+xr0Mh9mk0=;
 b=Pc4Y93tQGJER1t574kVzuPmF13SerTcLz5yVqr2nKhvY9rjmkRirZjwGlUwTTx/Ni4
 XLah8z3t0kDN1zVJx+vkWI972V7E8GZkHe1OYDDzOP9gTP0MfCIuaghKhCNAS6JeFy8O
 kRq/iaN9mDrovRP0wzSOMDBZ3qjjgUBMTQXmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OB92DQOVcUK7fQ/qIAdPQ+SmzMKuJpFA7+xr0Mh9mk0=;
 b=oEHz+CgL1VTElWgthb8iCVcCTkxRbQQl0I30zMgI0fEcp3uf7KG2Nt5gJLXPj6OPM9
 ubbYaKrQ/mdvWgIJU5aKw/SnWvSeIZDqWZdEb0VXgV+rkBD1vOpBXOSuhCRcVV5qc8D7
 NKm1EiXG2AOdGnpNrbLlmvvR9PsL1+o4umMhBE1uEmhqNHmJIQyGJd5IaifIns03FNzh
 z/C0defAxr8lFajdHDLxjolnphwRObP4Lz4u/jOQMa8q3/rgYWJF5g4l7U0wigQQLzDD
 TiaE344N42OtE+/sdlgOhHBxCUcWjQXNV74KFMF/OicjD0wbrTw+2pQ6iGWypVpw2fOw
 n3yw==
X-Gm-Message-State: AOAM532KhUqoSZ2QG5RGFVMh0EpeHukG5OdjhKQD8Wls6b63EXihvgdb
 1/7Xls0w74S6V6J6HLgDS9lefhpt5IIceWlhk4s=
X-Google-Smtp-Source: ABdhPJwgQyqDynpV3mM7D8C8wedD2fyhAyI9ReWtqMzT/qfrBFoeIS3In8iRL90PclupA+bu5v1b8722BC7xPpYCxDo=
X-Received: by 2002:a17:906:2542:: with SMTP id
 j2mr141781ejb.442.1598941393742; 
 Mon, 31 Aug 2020 23:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200901061731.12694-1-Jet.Le@ibm.com>
In-Reply-To: <20200901061731.12694-1-Jet.Le@ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:23:01 +0000
Message-ID: <CACPK8XfPHNns35z9Jx9jw7jgB=AeD29mMyfyupaN3x99GxdeRw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2] ARM: dts: aspeed: rainier: Add I2C buses
 for NVMe use
To: Jet Li <Jet.Le@ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jet Li <Jet.Li@ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Tue, 1 Sep 2020 at 06:19, Jet Li <Jet.Le@ibm.com> wrote:
>
> From: Jet Li <Jet.Li@ibm.com>
>
> Adding pca9552 exposes the presence detect lines for the cards and
> tca9554 exposes the presence details for the cards.

This patch is already in dev-5.8 as a3ce4e380958571814bbf3e237e6496d5b35153b.

Cheers,

Joel

>
> Signed-off-by: Jet Li <Jet.Li@ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 105 +++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index d20cdf3c..e803133 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -300,6 +300,21 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +
> +       tca9554@40 {
> +               compatible = "ti,tca9554";
> +               reg = <0x40>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               smbus0 {
> +                       gpio-hog;
> +                       gpios = <4 GPIO_ACTIVE_HIGH>;
> +                       output-high;
> +                       line-name = "smbus0";
> +               };
> +       };
> +
>  };
>
>  &i2c1 {
> @@ -614,6 +629,96 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +
> +       pca1: pca9552@61 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@8 {
> +                       reg = <8>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@9 {
> +                       reg = <9>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@10 {
> +                       reg = <10>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@11 {
> +                       reg = <11>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@12 {
> +                       reg = <12>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@13 {
> +                       reg = <13>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@14 {
> +                       reg = <14>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@15 {
> +                       reg = <15>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>  };
>
>  &i2c9 {
> --
> 2.7.4
>
