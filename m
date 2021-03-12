Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47A6338217
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:11:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR6y4rRQz30Gj
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:11:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=H9cKhcms;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=H9cKhcms; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR6l0M3Pz2xZv
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:10:54 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id s7so22652157qkg.4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsGRjE5ey8UCBlzQadow26uf5u+EwYBWHFWm9HpAOwA=;
 b=H9cKhcmsh0U362x+zVj4L5l4+d2KAGfMAE5BEOYAT8uY/R9YLhsYkDWb4sXONLDZPP
 xjZqpBGrZy2fXegIGb+fvmzgUYSvfHVVSJ6Zl2mhfQ5BAgmED9jNEjw21+egKLUdSMqx
 fFtdIRwpLchYOslZocgaEmj0pCOoXUI09keP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsGRjE5ey8UCBlzQadow26uf5u+EwYBWHFWm9HpAOwA=;
 b=rhGay+I0ucGFsay6YscZDwlMnTIIQFBPUqh3US41WCuVOtq+NF8lKInE8Ss2JIM2g9
 nLsQXae39D74KmxjIdDDu7TzEbvSRwpWYgDRk87DIaW9yW/B1lSxhHvKqp5hBvzlnmW5
 6sIw2JWoGyknOazxh2fVs0H5lcqjqmc/3g0q0IGadCo33c+kF04mniAmjIHuFA/EJoPY
 AsnXtTYPHoCJIGakNvjChRe93OPl2AGLWWZCtP3+2TX7N4NcSvpOUeQTALUY2RvRey7u
 DNI0wHvdRE6vPkQ4eq76GGoYrwK+tAPjQX8fS+w7if5IkpJTikl0Y94QzYIwypl4s4zv
 xF2g==
X-Gm-Message-State: AOAM5304IryPD40FetSBNSVYmhEKa5DvHBAF5SWLyfGxvhM+d4d/+nDw
 78wnBRfvkTUQN0wmXtDbnAuGfQZ905JoQg6/JW43q1pK/9bmPg==
X-Google-Smtp-Source: ABdhPJzTKLX1Wqa1tYNg3o82uVLmGhrON+3YPBsI+pOV0BL12PiS1CDAlxBE9hTvSB/Bzua612qPZ7rAkE5cL+ChWeg=
X-Received: by 2002:a37:a147:: with SMTP id k68mr10346868qke.66.1615507851641; 
 Thu, 11 Mar 2021 16:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-9-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-9-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:10:39 +0000
Message-ID: <CACPK8XeaJ5P=5dAC_yziWETTOLsbSp65d+3D+rU2v86oFeOyRg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 08/35] ARM: dts: aspeed: rainier: Add leds
 on optional DASD cards
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

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>
> These cards are not hot pluggable and must be installed
> prior to boot. LEDs on these are controlled by PCA9552
> i2c expander

Again, use the PCA952x driver correctly.

>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 425 +++++++++++++++++++
>  1 file changed, 425 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 32b63112091c..c507e8da101e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -634,6 +634,161 @@ tpm-wilson {
>                 };
>         };
>
> +       leds-optional-dasd-pyramid0 {
> +               compatible = "gpio-leds";
> +
> +               nvme0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme6 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme7 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca2 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-dasd-pyramid1 {
> +               compatible = "gpio-leds";
> +
> +               nvme8 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme9 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme10 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme11 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme12 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme13 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme14 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme15 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca3 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-dasd-pyramid2 {
> +               compatible = "gpio-leds";
> +
> +               nvme16 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme17 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme18 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme19 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme20 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme21 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme22 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               nvme23 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -2269,6 +2424,96 @@ eeprom@50 {
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca2: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
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
>  };
>
>  &i2c14 {
> @@ -2278,6 +2523,96 @@ eeprom@50 {
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca3: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
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
>  };
>
>  &i2c15 {
> @@ -2287,6 +2622,96 @@ eeprom@50 {
>                 compatible = "atmel,24c64";
>                 reg = <0x50>;
>         };
> +
> +       pca4: pca9552@60 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
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
>  };
>
>  &vuart1 {
> --
> 2.27.0
>
