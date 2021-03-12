Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918433821F
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:11:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR7j4Kqrz3cVP
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=guJMTsPG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=guJMTsPG; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR763RZRz3d6P
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:11:14 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id x10so22650573qkm.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39dRx1f8zvzcHLxH4/smv6fmd9L2Vgnz+uiBvs0dh+4=;
 b=guJMTsPGQjcQHYlwruR0dc/8ITHka7htE0Xxa+7Z+akMdXJOtMi1V0W6arFuz+8Aa9
 9wbBvxnaNw8Et/+3HbUmfyL4NfPj1EPJyrKHELU5Ip6EgpqRZJm37Tu9E8/neBkE8wFH
 wfNuNMD6IOD2dOx78DQIsoL19VDc9tXD8cy9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39dRx1f8zvzcHLxH4/smv6fmd9L2Vgnz+uiBvs0dh+4=;
 b=OjF4TH3ABSJZ3vV37ii3k1i0bVl61YzT0Gu5aGQOU40aLvDM+hCsMs6a3oMq9jfM2K
 PAl17OicYo+e5D0xLMkiGmT3yY2rKQDg8oqfIZoMnfQwZOuXZzHCpJEH92pOQ6zKKtGt
 V7UpfzVkwS3thXm5C0b2trF8WVtZQ1UyzkHySyybhJo60Va3l4HsNukUt1FsWj26waij
 95x/gr5BYlY4tfw68znkJRHr6QdT9/yQ2C4c9gwyh3WJbCg7f5akbPkk6ehX41L0DlMB
 K2pvD+R7cGId8mkG9ACj7M7uPTzKqxoQbtZjdDxoFFhfkZgly1NA65IOyXFCU037UsDK
 hZRA==
X-Gm-Message-State: AOAM533dQGDSjJPXRyCbGgnLan9og3qhc0Yc22Z07EbYvZtSrUPgYZKx
 /F6U0yjwB8V84iShw8od73y0RLPUBoVUN+T9mMg=
X-Google-Smtp-Source: ABdhPJxIh5JQ2Rwfj4hwf8ZVk9i1gyETiHCyKSlGOGsRJbdryc0xx2NRz+cf+BnjXbWbKlYVVdTYu77QNpaQb3BEVHU=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr10365048qkj.465.1615507872324; 
 Thu, 11 Mar 2021 16:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-10-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-10-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:11:00 +0000
Message-ID: <CACPK8XfFMupzmk09PWwFfnEPrnOqFpjNFDor_ar=qL+NpeTeOg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 09/35] ARM: dts: aspeed: rainier: Add leds
 that are on optional PCI cable cards
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
> These are LEDs on the cable cards that plug into PCIE slots.
> The LEDs are controlled by pca9552 i2c expander

Again, use the PCA955x driver.

>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 264 +++++++++++++++++++
>  1 file changed, 264 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index c507e8da101e..3a9183bae259 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -789,6 +789,70 @@ nvme23 {
>                         gpios = <&pca4 7 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       leds-optional-cablecard0 {
> +               compatible = "gpio-leds";
> +
> +               cablecard0-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca5 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard0-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca5 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard3 {
> +               compatible = "gpio-leds";
> +
> +               cablecard3-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca6 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard3-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca6 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard4 {
> +               compatible = "gpio-leds";
> +
> +               cablecard4-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca7 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard4-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca7 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       leds-optional-cablecard10 {
> +               compatible = "gpio-leds";
> +
> +               cablecard10-cxp-top {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca8 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               cablecard10-cxp-bot {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca8 1 GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };
>
>  &ehci1 {
> @@ -1541,6 +1605,56 @@ eeprom@52 {
>                 compatible = "atmel,24c64";
>                 reg = <0x52>;
>         };
> +
> +       pca5: pca9551@60 {
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
>  };
>
>  &i2c5 {
> @@ -1565,6 +1679,106 @@ eeprom@51 {
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +
> +       pca6: pca9551@60 {
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
> +       pca7: pca9551@61 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x61>;
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
>  };
>
>  &i2c6 {
> @@ -2411,6 +2625,56 @@ eeprom@51 {
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +
> +       pca8: pca9551@60 {
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
>  };
>
>  &i2c12 {
> --
> 2.27.0
>
