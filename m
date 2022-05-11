Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B467522D68
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 09:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kymmv6YYTz3drH
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 17:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q4UkOaes;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Q4UkOaes; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KymlD0p3jz3cHw
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 17:29:59 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id w4so1612835wrg.12
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FU82+y5KN4ZxmKkyH5RkenvSl1vzz+UllVsUOhHzyPo=;
 b=Q4UkOaes4QEVtHiX+l6mbKDNaJd3KFcsBvYlI0Id21iWJ0WirPQW0mBSvjqBI0SKl3
 F8n62ynnBW5TrO0WPCtYAA7j70wWm9iWOHR8C2eafpmnxEXGoi3Cmh+QPEfuHUBiDYgH
 PIE+Klk7kOmg5Luct9qLHo3N4FzigofhbG9cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FU82+y5KN4ZxmKkyH5RkenvSl1vzz+UllVsUOhHzyPo=;
 b=WPh55yWjTLeXs6qIzxTfGNSLcQHKblWqk02XfC8fFEAjMwQPXgY2bSNdsK7XZs4WeI
 qEBHVckaWX1hB7xHjj2XmtzKCR+Oz8JRxe6zOa3wywLmEVdlC0XrwWkm2F4xpsIIKYd7
 WqxFHqbg8BXMulDAKuIJBc1Y5BpaBpJPStFZHYOJ9xOPF/lGwmxcmvM/tGx3i2LYItX5
 vexXD3XYxmwKvADIB3CBnmyTQ2XmI6iGx+x4rDZiHhBnmodRl08tlX6tvRQroIxy5Qj5
 hPiKHuYX2jWv2jVYXSHnzLbKR1AEhu89+pH/wOUQrPKtBZz9IKpuPsXH2omlindInuwP
 Qpfg==
X-Gm-Message-State: AOAM530sh05HSWaSG+bnNwFgcD4MPriWwjloIkgCpiGVhLyAHh4g+oBc
 HlOOBBpNSWQryg97xdj7r1Ap5hmU8hD2Xx2OGVY=
X-Google-Smtp-Source: ABdhPJwDYcBWzqK9F7GS5oeREq/Yf8FzzSqBcWsuwdSCdu0iq+JCtUXU12hzu9S8GeG421vjO2AoXfRz9AVodXQEYyA=
X-Received: by 2002:a5d:6d04:0:b0:20c:52de:9ce4 with SMTP id
 e4-20020a5d6d04000000b0020c52de9ce4mr22910847wrq.572.1652254193208; Wed, 11
 May 2022 00:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
 <20220421083151.1887871-2-patrick.rudolph@9elements.com>
In-Reply-To: <20220421083151.1887871-2-patrick.rudolph@9elements.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 07:29:40 +0000
Message-ID: <CACPK8Xd8U3rH5g6N4QhKdv+spdy+zhb=iGK-pJ1pJNVK02RGvA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/4] arm/dts: Add
 Genesis3 board
To: Patrick Rudolph <patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 takken@us.ibm.com, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 Apr 2022 at 08:32, Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:
>
> Add devicetree source file. It uses the evb-ast2500 board files.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  arch/arm/dts/Makefile         |  1 +
>  arch/arm/dts/ibm-genesis3.dts | 83 +++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 arch/arm/dts/ibm-genesis3.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index a79f885f54..fae23e6bc1 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2400-evb.dtb \
>         ast2500-evb.dtb \
> +       ibm-genesis3.dtb \

The rest of the boards are named ast2x00-<machinename>.

Your dts would be ast2500-genesis3.dtb

Going back to the v1, I see that both Zev and I made the same comment.
If you have a reason to not do this, please say so.

>         ast2600a0-evb.dtb \
>         ast2600a1-evb.dtb \
>         ast2600-bletchley.dtb \
> diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.dts
> new file mode 100644
> index 0000000000..c808fd27c4
> --- /dev/null
> +++ b/arch/arm/dts/ibm-genesis3.dts
> @@ -0,0 +1,83 @@
> +/dts-v1/;

Add a copyright statement.



> +
> +#include "ast2500-u-boot.dtsi"
> +
> +/ {
> +       model = "IBM Genesis3";
> +       compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
> +
> +       memory {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +       };
> +
> +       aliases {
> +               spi0 = &fmc;
> +               ethernet0 = &mac0;
> +               ethernet1 = &mac1;
> +       };
> +};
> +
> +&uart5 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&sdrammc {
> +       clock-frequency = <400000000>;
> +};
> +
> +&wdt1 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt2 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&wdt3 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
> +};
> +
> +&fmc {
> +       status = "okay";
> +       timing-calibration-disabled;
> +       flash@0 {
> +               compatible = "spi-flash", "spansion,s25fl256l";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +
> +       flash@1 {
> +               compatible = "spi-flash", "spansion,s25fl256l";
> +               status = "okay";
> +               spi-max-frequency = <50000000>;
> +               spi-tx-bus-width = <2>;
> +               spi-rx-bus-width = <2>;
> +       };
> +};

This is an exact copy of the ast2500-evb up until this point.

Consider following Zev's example for the board he's adding, by
including the dts and overriding/disabling things as required.

> +
> --
> 2.35.1
>
