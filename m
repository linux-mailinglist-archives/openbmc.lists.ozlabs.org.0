Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82294338212
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR6L3qPQz3d5V
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:10:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ODyeb8zs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ODyeb8zs; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR613DFlz3cc3
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:10:16 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id x9so2576909qto.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=seOvGMKeCGmcXGfDXXMmMQUJY8fxBKI/wKtMpSxggh0=;
 b=ODyeb8zs5CHxbr1UnqGo4pTZ0O8boSAEi/FYeu59/xmEh7oXYtDU7cRPB/c+evHoID
 0yy2f5TvX4XJ67JByhG3bV+MYUXSEtxTid99tNE6stmaWdkSqdrnIG01YKNUl7XkkgL4
 +FVCk/dA2gbz1bmILnsZXgRoqnz7JiG4gGQbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=seOvGMKeCGmcXGfDXXMmMQUJY8fxBKI/wKtMpSxggh0=;
 b=WRqyPRM8x2u5MLPEN5ZNZ3r6XOwaXmXYzGR1UnVQ2dgs9yv+8oMV8jIO+oBzKM7VRN
 8Eon73DZFrSYHIAFIodUESXwdzj0dGEjYpb3BU1dQiFrpYakh4Jega+u9ci1tNxcI6Kx
 PGoPg1TnAC0ZZUEH9uUjd3ajEKXzR2CqUNQ39qaL63bESeqPRKPq54FBKoa4mCWfTtas
 IuwsBleCbEevuwCzN57Dl/W9EXZ5vwoadC+RM7zoo0rJ4C3gFvPgMkz78Ui37sWiyTU0
 XIwk7g7qYEGQBK1iPeluwKhBYw7L5SOhWbTHtU/n9IMTJItFgdizkMPRXBIv2ZtFp0CE
 vc2g==
X-Gm-Message-State: AOAM531/SYnm/sDzyHo3j1BiKMNdyCQQ02vqudFi+2/uWa2jpOeCzh7w
 UAgNWf2E6J2xkoUUHqi+p5Zf6uQgKlQopznF2Nw=
X-Google-Smtp-Source: ABdhPJwW9Lo98aSc0IdH9mGuCm8qoSUzccDDeeT5tkartBZlWH2EO+MX5QheMmP1BRyW6SyGWtjRb9NvpaS5JS7RgFA=
X-Received: by 2002:ac8:7153:: with SMTP id h19mr10117341qtp.176.1615507814035; 
 Thu, 11 Mar 2021 16:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-8-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-8-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:10:02 +0000
Message-ID: <CACPK8XcMSGXSg3MYkYcXUamcDJmoDs0r7tZD8xRKgYzp1bWWVQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 07/35] ARM: dts: aspeed: rainier: Add leds
 that are off pic16f882
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
> There are many LEDs that are connected to PIC16F882.
> PIC has the software implementation of pca9552

Similar to the other PCA change, this change doesn't make sense.
Configure the pca955x driver to drive the LEDs as LEDs.

>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 690 +++++++++++++++++++
>  1 file changed, 690 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 514a14d3f914..32b63112091c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -302,6 +302,336 @@ fan5 {
>                         default-state = "keep";
>                         gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
>                 };
> +
> +               ddimm0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm6 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm7 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 7 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm8 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 8 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm9 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 9 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm10 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 10 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm11 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 11 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm12 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 12 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm13 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 13 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm14 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 14 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm15 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic1 15 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm16 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm17 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm18 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm19 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm20 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm21 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm22 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm23 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 7 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm24 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 8 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm25 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 9 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm26 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 10 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm27 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 11 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm28 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 12 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm29 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 13 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm30 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 14 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               ddimm31 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic2 15 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cpu1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cpu1-vrm0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               lcd-russel {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic3 8 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               planar {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cpu0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               dasd-pyramid0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               dasd-pyramid1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               dasd-pyramid2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cpu0-vrm0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 6 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               rtc-battery {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 7 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               base-blyth {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 8 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot6 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 9 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot7 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 10 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot8 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 11 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot9 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 12 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot10 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 13 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               pcieslot11 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 14 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               tpm-wilson {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pic4 15 GPIO_ACTIVE_LOW>;
> +               };
>         };
>
>  };
> @@ -1365,6 +1695,366 @@ gpio@7 {
>                 };
>         };
>
> +       pic1: pca9952@32 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x32>;
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
> +
> +       pic2: pca9552@31 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x31>;
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
> +
> +       pic3: pca9552@30 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x30>;
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
> +
> +       pic4: pca9552@33 {
> +               compatible = "ibm,pca9552";
> +               reg = <0x33>;
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
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.27.0
>
