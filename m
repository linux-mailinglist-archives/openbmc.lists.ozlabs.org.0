Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C82432AA
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 05:19:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRsHN0KK1zDqYY
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 13:19:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AqkqPgIW; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRsGY1hwFzDqYK
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 13:18:27 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id p24so4523007ejf.13
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B6eGTMAJCDtoLZ/vaK5GwhCVHfvA5r0OsLeUYHc7Yn0=;
 b=AqkqPgIWZ33vKbShmg9DwdI7g0qm8nWujW5YipCfCF7LwEqCZ5jNNX98Os/g+pqFho
 T5EuaXEhHUJtvr09oOVRTeynOEieamkCfJzUPfhoyMVp8wzhhsyyWAWeN4WzaGGYNmqU
 5b1YZ1reuLeSMypivZn4wiTDiGTHVF+X7ZSx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B6eGTMAJCDtoLZ/vaK5GwhCVHfvA5r0OsLeUYHc7Yn0=;
 b=Pepve7yq99LjsRBP6jh6glWpkH3PQVyfocMQowf7PZtjQrXd1dgWF6vKzthAfHlXW0
 lft0c9QUiDpysqS1LBdbgg2Fb1NUlBlreU+FA3kLGFroEGnOw1CZsFoq0KNck2D+KwWh
 ubJYiSVVPrQySOB1tthMaETBh2tAAtmA8C59G8WeXvXdHojw3S8DW4hD8vNhhrn0v7u6
 xyw5ukTkVoejTAUoNFfHKWZzNE0KoK+Na+0/TMGXBrDokx87Yny0iEnxtcG3XTWwKFPU
 3bX+tCn6A0Pw8jbO5A4kJ3TP3DY6ZampO79xCz4syRytD14uHUCLSxiL3RWJR/LVwrT+
 S48g==
X-Gm-Message-State: AOAM533+egowgkNjenVbOpyS87UC1G3xz1kTy1g5YayzrdVt3wDK3Sev
 wfUj4sRSWf1tInFOrIAGeKwovzQZYVf2C2U9TIqSNmi1
X-Google-Smtp-Source: ABdhPJyEfWlVB64fqlZO190lvzv173FTsjhCWLMwVl+0NMKK75PE5D7uMKURt2nmN/pja6GWn7WtY8u9kY+R/ojwlXo=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr2777476ejd.266.1597288703540; 
 Wed, 12 Aug 2020 20:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596022264-8856-1-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1596022264-8856-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2020 03:18:11 +0000
Message-ID: <CACPK8XeetP+u1fTjJs8eHOXHDqZMJeZm8iVgB02g9BhKD2i-3w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 1/2] rainier: Add leds that are off 9551 on
 Operator Panel
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Andrew Geissler <geissonator@yahoo.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, vishwa@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 at 11:31, <vishwa@linux.vnet.ibm.com> wrote:
>
> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>
> These are LEDs that are controlled by 9551
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 37e4123..9b28a30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -120,6 +120,38 @@
>                         reg = <3>;
>                 };
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               /* System ID LED that is at front on Op Panel */
> +               front-sys-id0 {

The naming here will need to follow whatever we decide in the first patch.

> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System Attention Indicator ID LED that is at front on Op Panel */
> +               front-check-log0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure Fault LED that is at front on Op Panel */
> +               front-enc-fault1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System PowerOn LED that is at front on Op Panel */
> +               front-sys-pwron0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -816,6 +848,56 @@
>                 };
>         };
>
> +       pca1: pca9551@60 {

I noticed we start to accumulate a lot of pcaX nodes. They will need
to be unique per-device tree, so we will need to pick a unique
identifier.

How about the part number the schematic? (ie U32 or whatever)


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
> 1.8.3.1
>
