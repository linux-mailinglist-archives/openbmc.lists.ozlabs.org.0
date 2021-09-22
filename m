Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ABE413F75
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 04:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDj1Y17gdz2ybD
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 12:29:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IKB4CEEH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IKB4CEEH; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDj192BJPz2yKK
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 12:29:32 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id x9so1422613qtv.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a1Q9YQcheMbOWTEKgUtMYpUR6qg6fuWrjSyj7iSKQZY=;
 b=IKB4CEEHEE1bBBZ/tY9pbmDtLgK5BW2zvHK5RP87QvByhcLV63zXAjtRqalyVRdr9l
 EVGurdEFg4D1q90WrqB22reOOOLJkawrAiUdli1UQT2dYgqf4nDSjacil5Hqv2xpMdZA
 u71zpXTsvK9ViC+QHzNRbL5qsFp+bSmitxzNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a1Q9YQcheMbOWTEKgUtMYpUR6qg6fuWrjSyj7iSKQZY=;
 b=uydISYU0WOO3FeA0RGAzT9hkaht32CkcZGu+D175G2m1jp8ky5v5hpf+O53SG02g0K
 lm+nP7zdjwC+URadapIzWmhS7MReZj9Q0pnAPzG+yFMhyVPm+0stiJbORfTe95jstSO6
 AcGvBfB20+Ri8Kzzc8bFC+sd6kRb5o6AfQ2cYghZ4D/WTq9UEgJUua3+b/uVi0ovjGj1
 aM2rpwZR/1yzFJ+zNnxkSTnrq12NZa0TBlV2+lUgZ61bhb3drNiKbe39b/0Nh77oO/l+
 y78NRLVNswjI+UQVUbIRBMrX4VBCWtDawdCx8YxfQof/cmwdCq9ckopcITUalBQ/ZJ3o
 gyYg==
X-Gm-Message-State: AOAM530WDUB0DSH9MwM4mxaSOFx8yeC8F3Cmmnbl8riEvGMm4meWUAaO
 tFGRq2boil3wHwH/8jT/9ANT9WJjpnSb/FE7lG8=
X-Google-Smtp-Source: ABdhPJwIkuDYr4nrXfLmbi7IX2CLgwvbV0OZUg/j2RPKYOyPi1or67tzzyKnKJ3C4TalL/bFNlXELiQroF25bD1nH7k=
X-Received: by 2002:ac8:5690:: with SMTP id h16mr25122112qta.25.1632277769012; 
 Tue, 21 Sep 2021 19:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210916210045.31769-1-eajames@linux.ibm.com>
In-Reply-To: <20210916210045.31769-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Sep 2021 02:29:17 +0000
Message-ID: <CACPK8XdN0JViQvdh-xbe9tkTsiy-fAZsWTgtoTVFHPWF-5MKcA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] ARM: dts: aspeed: Add ADC for AST2600 and
 enable for Rainier and Everest
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
Cc: Thomas.Ippolito@ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 16 Sept 2021 at 21:00, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the ADC nodes to the AST2600 devicetree. Enable ADC1 for Rainier and
> Everest systems and add an iio-hwmon node for the 7th channel to report
> the battery voltage.
>
> Tested on Rainier:
> ~# cat /sys/class/hwmon/hwmon11/in1_input
> 1347
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied, thanks.


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 15 +++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 15 +++++++++++++++
>  arch/arm/boot/dts/aspeed-g6.dtsi             | 20 ++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 91242983a7b2..4682c005440d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -243,6 +243,21 @@ led-pcieslot-power {
>                         gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc1 7>;
> +       };
> +};
> +
> +&adc1 {
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +                                &pinctrl_adc10_default &pinctrl_adc11_default
> +                                &pinctrl_adc12_default &pinctrl_adc13_default
> +                                &pinctrl_adc14_default &pinctrl_adc15_default>;
>  };
>
>  &gpio0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 665c61ab6710..3e8d34a8729e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -218,6 +218,21 @@ fan5-presence {
>                         linux,code = <11>;
>                 };
>         };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc1 7>;
> +       };
> +};
> +
> +&adc1 {
> +       status = "okay";
> +       aspeed,int-vref-microvolt = <2500000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> +               &pinctrl_adc10_default &pinctrl_adc11_default
> +               &pinctrl_adc12_default &pinctrl_adc13_default
> +               &pinctrl_adc14_default &pinctrl_adc15_default>;
>  };
>
>  &ehci1 {
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index f96607b7b4e2..02e54fb13815 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -364,6 +364,26 @@ xdma: xdma@1e6e7000 {
>                                 status = "disabled";
>                         };
>
> +                       adc0: adc@1e6e9000 {
> +                               compatible = "aspeed,ast2600-adc0";
> +                               reg = <0x1e6e9000 0x100>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               resets = <&syscon ASPEED_RESET_ADC>;
> +                               interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +                               #io-channel-cells = <1>;
> +                               status = "disabled";
> +                       };
> +
> +                       adc1: adc@1e6e9100 {
> +                               compatible = "aspeed,ast2600-adc1";
> +                               reg = <0x1e6e9100 0x100>;
> +                               clocks = <&syscon ASPEED_CLK_APB2>;
> +                               resets = <&syscon ASPEED_RESET_ADC>;
> +                               interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +                               #io-channel-cells = <1>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio0: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> --
> 2.27.0
>
