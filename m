Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0835BAF0
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 09:39:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJgc94GcTz3049
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 17:39:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uQWrxcfV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e32;
 helo=mail-vs1-xe32.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uQWrxcfV; dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJgbw0RnBz3042
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 17:39:21 +1000 (AEST)
Received: by mail-vs1-xe32.google.com with SMTP id k124so6179918vsk.3
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ExoxKCgaqdCsDepfvxx4zot0Xxz7DmLhOne1aZN2lc=;
 b=uQWrxcfVq6tfFk45Dsu1M+8DO7/Y3gkFEqjkH08QcNmmKLD8MMRYdhz1uYrJfFXUR8
 Ag7+QypWcgC7ioD1+aBvgrup18mKd563yDSy5jIK7AZEwztzNDB7RlHt+virdnOASLe4
 zVXEBJxMmOwQfyhEhHuJQOmWK98iYJmSOV0kKNATYMEili8QMEamRMMEYXKTF5quQc2f
 kZOpdTyUEmV0sOAI+Ff7bKlti9lucQgPmGGVnBJi6bNubf0CnO7FF4ruawkLQIIXp6AZ
 MDjy24sd1F4eS+GzFpPuYxUCJqYNaC975P/rB38ekIY7Qy1WVBo/z8lVjIuvlywVPLgV
 Pu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ExoxKCgaqdCsDepfvxx4zot0Xxz7DmLhOne1aZN2lc=;
 b=n2XOnawalI6PkO9JSVh/TBsoCAnyyxmSfx2x/9G4/+8x+f4y3hA2FsfrJOV+1XhCl7
 ttVIAWM+CkW2f91q1eIHj6ywK2MLD5+S2hIUoOBEgA56E2Ubw4AVHX8ePJKJ/R69CmkR
 9PqGYmgqgZxcWdLEV/jkkWzlk7rNC0+Oa0YcNMMTWu+eR16Q3xtPkHKqFaAFWVUrFtjV
 0c4DCjbNQodljCOrccTUdPoa+hYeLmmlwhHmJ6nXNQuOLzdwAxnDOfV/E44JOqWGB9q1
 FlZIPoNFl1pO5sH4CHx/J5fuqxlKY0gEwOIBYJuJoUSFX1eH4eZ/Z0i9iEgPDIPSkkEc
 vowg==
X-Gm-Message-State: AOAM532AmUTMvQ2lDmmFm/zutUflF0O7PZtsNif+CX4RCsaUhnxkB6lb
 cSvJqg9QOu/Khi5vEXhmjwZWakH2D4DnfYPcQdASgA==
X-Google-Smtp-Source: ABdhPJy3atKJOCw7R/9czTlSfDsNIyt3sFse/HJpxmIRKKl4EAag4GD6AjYNfHVS688ENiFwU5SbPJxcoVpMTnEjNso=
X-Received: by 2002:a67:fe05:: with SMTP id l5mr18228581vsr.34.1618213156719; 
 Mon, 12 Apr 2021 00:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210408015218.20560-1-steven_lee@aspeedtech.com>
 <20210408015218.20560-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210408015218.20560-2-steven_lee@aspeedtech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Apr 2021 09:38:40 +0200
Message-ID: <CAPDyKFr=Gtwu4v22FBaax5EjRbXTNez1N2ZQxP=v0LKGFTCovw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: sdhci-of-aspeed: Add power-gpio
 and power-switch-gpio
To: Steven Lee <steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ryan_chen@aspeedtech.com,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 chin-ting_kuo@aspeedtech.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 at 03:52, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600-A2 EVB provides the reference design for enabling SD bus power
> and toggling SD bus signal voltage by GPIO pins.
> Add the definition and example for power-gpio and power-switch-gpio
> properties.
>
> In the reference design, GPIOV0 of AST2600-A2 EVB is connected to power
> load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is connected to
> a 1.8v and a 3.3v power load switch that providing signal voltage to
> SD1 bus.
> If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> disabled.
> If GPIOV1 is active high, 3.3v power load switch is enabled, SD1 signal
> voltage is 3.3v. Otherwise, 1.8v power load switch will be enabled, SD1
> signal voltage becomes 1.8v.
>
> AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and GPIOV3
> as power-switch-gpio.

Thanks for sharing the details, it certainly helps while reviewing.

>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..515a74614f3c 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -37,6 +37,14 @@ properties:
>    clocks:
>      maxItems: 1
>      description: The SD/SDIO controller clock gate
> +  power-gpio:
> +    description:
> +      The GPIO for enabling/disabling SD bus power.
> +    maxItems: 1
> +  power-switch-gpio:
> +    description:
> +      The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> +    maxItems: 1


>
>  patternProperties:
>    "^sdhci@[0-9a-f]+$":
> @@ -61,6 +69,14 @@ patternProperties:
>        sdhci,auto-cmd12:
>          type: boolean
>          description: Specifies that controller should use auto CMD12
> +      power-gpio:
> +        description:
> +          The GPIO for enabling/disabling SD bus power.
> +        maxItems: 1
> +      power-switch-gpio:
> +        description:
> +          The GPIO for toggling the signal voltage between 3.3v and 1.8v.
> +        maxItems: 1
>      required:

Please do not model these as GPIO pins like this. Instead, it's better
to model them as gpio regulators, since the mmc core manages them as
regulators.

We have a vmmc regulator (corresponding to vdd) and a vqmmc regulator
(corresponding the signal-voltage level). These are also described in
the common mmc DT bindings, see
Documentation/devicetree/bindings/mmc/mmc-controller.yaml.

>        - compatible
>        - reg
> @@ -80,6 +96,7 @@ required:
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/gpio/aspeed-gpio.h>
>      sdc@1e740000 {
>              compatible = "aspeed,ast2500-sd-controller";
>              reg = <0x1e740000 0x100>;
> @@ -94,6 +111,10 @@ examples:
>                      interrupts = <26>;
>                      sdhci,auto-cmd12;
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 0)
> +                                     GPIO_ACTIVE_HIGH>;
> +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 1)
> +                                     GPIO_ACTIVE_HIGH>;
>              };
>
>              sdhci1: sdhci@200 {
> @@ -102,5 +123,9 @@ examples:
>                      interrupts = <26>;
>                      sdhci,auto-cmd12;
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    power-gpio = <&gpio0 ASPEED_GPIO(V, 2)
> +                                     GPIO_ACTIVE_HIGH>;
> +                    power-switch-gpio = <&gpio0 ASPEED_GPIO(V, 3)
> +                                     GPIO_ACTIVE_HIGH>;
>              };
>      };

Kind regards
Uffe
