Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A760E338205
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR0n4wHJz3cZB
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=F7o0HWRg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=F7o0HWRg; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR0b1GSwz30HN
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:05:35 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id l132so22648974qke.7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BEI/7L8ukUZG7G+ZPL3kGVH8s5NxSZKZzR2poKl8z9Q=;
 b=F7o0HWRg4cy6oVq0UD9x8cgzdcUluQtWcrEfx3PilPAB+o9fQahk30AmNHvGNYArhc
 MwU9GSGe0Ydboloj3V7U551cyp1DLgcMMkUlndmQ+YcXnIHMoINfW5pbsFeay0eeRt7j
 Z7MfnciTsKE8t7ty8dLpedgIRGVl7f45lWPUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BEI/7L8ukUZG7G+ZPL3kGVH8s5NxSZKZzR2poKl8z9Q=;
 b=btzdao2Jct/5CmkSiBh2gIJKigwD2Omo3pvyVRedMYhxyoIGyN2QEofimufCIc2w3p
 r6KfVv8V8VNRFr0wl7eTBJT+SmkWyYS7ai9T8KcdLZzUk1AC/dM3SgKOqySXytYiXp/i
 90ZX61FdYV2v7PHu7Gc+Qvi98gmSEPyF4L4pV93JEsrrhr/6hZQdr71H8pcrBWafC53C
 x7Z9RW5bP4A9y1oj62PqSLx9fxXTka3hqhTQzZiD3UZIYkalWIIIV7/TJDQ+T6tJq3Tm
 Ydm7aDfZmeMvK1iJI2S3C1erPx7tB7dx3pI3pUNZzVsoxY66jEtidAzcpEDc1sH4YMvt
 BMkA==
X-Gm-Message-State: AOAM532BkBoy9rYRwN1ve/btHAZmvKxeezpljQe2YDh03OJ9n81On4iF
 5eoyIoid4IVsU3U8f6bA48Ih5yc/rNkWHbRexFo=
X-Google-Smtp-Source: ABdhPJz7sIumiDeHIXhUvGSX9ZfVBboViz2juA+xksnUuz6CmnkYQI8+IFU8VDB+xXEYyG5FUczIHEbB11DXPeqxbCs=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr10341570qkj.465.1615507532315; 
 Thu, 11 Mar 2021 16:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-2-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:05:20 +0000
Message-ID: <CACPK8XcHaisZb0SNd1WC1kJhev93Q8ZrX09p3iumAYo0HO+RfA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 01/35] ARM: dts: aspeed: rainier: Add
 Operator Panel LEDs
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
> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>
> These LEDs are on the op-panel and are connected via a pca9551 i2c
> LED expander.
>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 0e1e76421d9d..fdeac6d0d8d3 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -131,6 +131,38 @@ i2c2mux3: i2c@3 {
>                         reg = <3>;
>                 };
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               /* System ID LED that is at front on Op Panel */
> +               front-sys-id0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System Attention Indicator ID LED that is at front on Op Panel */
> +               front-check-log0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure Fault LED that is at front on Op Panel */
> +               front-enc-fault1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System PowerOn LED that is at front on Op Panel */
> +               front-sys-pwron0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca_oppanel 3 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -848,6 +880,56 @@ ibm-panel@62 {
>                 reg = <(0x62 | I2C_OWN_SLAVE_ADDRESS)>;
>         };
>
> +       pca_oppanel: pca9551@60 {
> +               compatible = "nxp,pca9551";
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

Why do we enable all 8 lines as GPIOs if we're only using the first four?

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
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 2.27.0
>
