Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD835338221
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRCd65y1z3cTJ
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:15:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cxTAlxnQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cxTAlxnQ; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRCL4rG8z2xZl
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:14:54 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id m7so2577349qtq.11
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PcF/WVQtO6/6jajKf2dXEVtcdGW+2qfphz1BlfBgrmo=;
 b=cxTAlxnQeBhihtrM+bTD4qPYFDyme2dQuUwkihODanGCaIMRXg2/meOws4nLgvmm+u
 QZyecLiC4y7htWmefiCjJftZE50zpBnrBq+Rl0YhDDVs79w2xbPx5NZP3GyY9buzGe/D
 sT6yPqguNZ+u8IMhbyujPvz7zWHT3/vYNwpA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PcF/WVQtO6/6jajKf2dXEVtcdGW+2qfphz1BlfBgrmo=;
 b=oll9NrZrlNhwG2PdvRHaAAjsTMyySLJHFHtPxpjLyQZ6kp4PwaQhHUGdsYRIqGp2fT
 0FzK8UpKusdDTdeUlzg5wSPlULfkELma027z7rS5oWMtZOu3kBmuO+9JExR/pcueEqTO
 AmeeuXkS9UgPcOikN7SXfJZuyb/lt6ZW1iLPbNXLTNzVsdbyO0hc74hBJuflKyUdyATA
 lkSZ1CdR8QLtKmkTtizA0BoVCZG0XyY/G4DI7LIcDNfa+S9jsZXgBQ/Xa5IUIOpjGHqS
 pnnQitQrehm5mtFyERdZ+pH+DbDN6VcroeEg5QtnUuMFMdzQdJVZZLISUte3i4t8qykb
 REFA==
X-Gm-Message-State: AOAM530rIll+kbNcm5KtNxxhPcxoP/HM9SSYl2w52ngIykMMiMPAUXgB
 humj8dc5vf5OeLFOufKx7CcylmQfUXm1z+Q9T6UAnG6Fwb0=
X-Google-Smtp-Source: ABdhPJxMYcM6hg97WbrcpjUs1wHHxreWvjJQ+EFZO4Z2Ku8NnnbWnyOworpmMGM06WS3Xa2zgqQfcOhOFHfBuPq07Bs=
X-Received: by 2002:a05:622a:143:: with SMTP id
 v3mr9709975qtw.363.1615508091011; 
 Thu, 11 Mar 2021 16:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-11-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-11-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:14:38 +0000
Message-ID: <CACPK8XeWyjhtZG35rSw1+D7vexK6PBfTYFJOA6EaYJCfxMYGJQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 10/35] ARM: dts: aspeed: rainier: Add
 presence GPIOs
To: Eddie James <eajames@linux.ibm.com>, Alpana Kumari <alpankum@in.ibm.com>
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
> From: Alpana Kumari <alpankum@in.ibm.com>
>
> This commit adds presence detect GPIO chips
> for various FRUs on Rainier.
>
> Signed-off-by: Alpana Kumari <alpankum@in.ibm.com>

Eddie, you need to add your s-o-b when submitting someone else's
patches. You should also cc the author in this case.

Some comments below.

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 169 ++++++++++++++++++-
>  1 file changed, 160 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 3a9183bae259..5ee87d749ce8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1535,20 +1535,64 @@ eeprom@51 {
>                 reg = <0x51>;
>         };
>
> -       tca9554@40 {
> +       tca_pres1: tca9554@20{

The label is unused, do you need to add it?

Is the address change intentional? You didn't mention it in the commit message.

>                 compatible = "ti,tca9554";
> -               reg = <0x40>;
> +               reg = <0x20>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               smbus0 {
> -                       gpio-hog;
> -                       gpios = <4 GPIO_ACTIVE_HIGH>;
> -                       output-high;
> -                       line-name = "smbus0";
> +               gpio-line-names = "",
> +                       "RUSSEL_FW_I2C_ENABLE_N",
> +                       "RUSSEL_OPPANEL_PRESENCE_N",
> +                       "BLYTH_OPPANEL_PRESENCE_N",
> +                       "CPU_TPM_CARD_PRESENT_N",
> +                       "DASD_BP2_PRESENT_N",
> +                       "DASD_BP1_PRESENT_N",
> +                       "DASD_BP0_PRESENT_N";
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
>                 };
> -       };
>
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
>  &i2c1 {
> @@ -1571,6 +1615,104 @@ power-supply@69 {
>                 compatible = "ibm,cffps";
>                 reg = <0x69>;
>         };
> +
> +       pca_pres1: pca9552@61 {
> +               compatible = "nxp,pca9552";
> +               reg = <0x61>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio-line-names =
> +                       "SLOT0_PRSNT_EN_RSVD", "SLOT1_PRSNT_EN_RSVD",
> +                       "SLOT2_PRSNT_EN_RSVD", "SLOT3_PRSNT_EN_RSVD",
> +                       "SLOT4_PRSNT_EN_RSVD", "SLOT0_EXPANDER_PRSNT_N",
> +                       "SLOT1_EXPANDER_PRSNT_N", "SLOT2_EXPANDER_PRSNT_N",
> +                       "SLOT3_EXPANDER_PRSNT_N", "SLOT4_EXPANDER_PRSNT_N",
> +                       "", "", "", "", "", "";
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
>  &i2c4 {
> @@ -2474,7 +2616,7 @@ eeprom@51 {
>                 reg = <0x51>;
>         };
>
> -       pca1: pca9552@61 {
> +       pca_pres3: pca9552@61 {
>                 compatible = "nxp,pca9552";
>                 reg = <0x61>;
>                 #address-cells = <1>;
> @@ -2482,6 +2624,15 @@ pca1: pca9552@61 {
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> +               gpio-line-names =
> +                       "SLOT6_PRSNT_EN_RSVD", "SLOT7_PRSNT_EN_RSVD",
> +                       "SLOT8_PRSNT_EN_RSVD", "SLOT9_PRSNT_EN_RSVD",
> +                       "SLOT10_PRSNT_EN_RSVD", "SLOT11_PRSNT_EN_RSVD",
> +                       "SLOT6_EXPANDER_PRSNT_N", "SLOT7_EXPANDER_PRSNT_N",
> +                       "SLOT8_EXPANDER_PRSNT_N", "SLOT9_EXPANDER_PRSNT_N",
> +                       "SLOT10_EXPANDER_PRSNT_N", "SLOT11_EXPANDER_PRSNT_N",
> +                       "", "", "", "";
> +
>                 gpio@0 {
>                         reg = <0>;
>                         type = <PCA955X_TYPE_GPIO>;
> --
> 2.27.0
>
