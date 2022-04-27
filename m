Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B395113A7
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 10:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpBzs4tZDz3bdC
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 18:41:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YKm7kJ/p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=YKm7kJ/p; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpBzN3kClz2xrb;
 Wed, 27 Apr 2022 18:40:47 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id bz24so659776qtb.2;
 Wed, 27 Apr 2022 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eJlUeapMnOfpwREKcsIgJOrrITk3NWVTgwWNmTCLAtI=;
 b=YKm7kJ/pDW1wFFAcxodyXoQujQZSyGD/8GN/BvtSljfT6C1c2XrV7AwcrXA09AcFqo
 Ea7Fl3YdEJUPBUMqx8gZm2dXEXXRIQYkqFEEMwAvS8JYdIpkdsLouB2LBz/1M5uJCU31
 2YMbl72IGXQK+IPbklgyrJiWRt1vV6fytCa3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJlUeapMnOfpwREKcsIgJOrrITk3NWVTgwWNmTCLAtI=;
 b=uIa3cmA7irSNtaIKYJIJdTaZvChpdLphLpe0Z9Gj4urZGYtHyj/JBbRSRp4dDCf1/Q
 VFUBTivIqKgCU1R6CcRHKvuXXaz07rTt1w0BXNzaIN27TFGhxS6LVlA3bvSv5+MfGbVY
 G5b63htaj2rdfz2cm8+XhJgrElvfURGI4AADO1jFfs+Wf7jXkCbZe0qS5H3nr0Nk7zRz
 CHkqWRZpuvDh/nkzfc2Esil9RaCxzXRIZbXW8jtAR4nrWc+5/E7m9jF5RIcFF/NGUyYw
 m+aQXj2XKblQNn84k8ijzTmKAU+DjP9elSv9GLWL+WABB8Fx+Ep+se7dtqA1rwS4lwAg
 dLNg==
X-Gm-Message-State: AOAM5330qlnxG41DYyp+tEF3nZ5Qrp9/pyb6CBnBl+c8fLnIU84wHKdX
 daI5YYEUwNpQ0sTcj3sPhL92sK9C39/+SxliB2s=
X-Google-Smtp-Source: ABdhPJz7u6QFUIyAqmlAbptkQX27xNjPXzJqkvLo3DkCXNYQl3fmZULOd0r6Yd1z/5k3pa/vq43HUyHdFsZ0UC7iQfQ=
X-Received: by 2002:a05:622a:1456:b0:2f2:4ff:39a1 with SMTP id
 v22-20020a05622a145600b002f204ff39a1mr18285680qtx.164.1651048843300; Wed, 27
 Apr 2022 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220422192139.2592632-1-robh@kernel.org>
In-Reply-To: <20220422192139.2592632-1-robh@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Apr 2022 08:40:31 +0000
Message-ID: <CACPK8XcQNJNyzqdjMQuCP+z-L-A9mcMqs-HJJrh9MscasV+D=A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 22 Apr 2022 at 19:21, Rob Herring <robh@kernel.org> wrote:
>
> The additional nodes in the example referenced from the pinctrl node
> 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
> or not documented with a schema (aspeed,ast2500-gfx). There's no need to
> show these nodes as part of the pinctrl example, so just remove them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Nak.

This removes the information on how to use the bindings. Surely we
prefer to over document rather than under document?


> ---
>  .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 81 ++++---------------
>  1 file changed, 16 insertions(+), 65 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> index 7c25c8d51116..9db904a528ee 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
> @@ -76,73 +76,24 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> -    apb {
> -        compatible = "simple-bus";
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -        ranges;
> -
> -        syscon: scu@1e6e2000 {
> -            compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
> -            reg = <0x1e6e2000 0x1a8>;
> -            #clock-cells = <1>;
> -            #reset-cells = <1>;
> -
> -            pinctrl: pinctrl {
> -                compatible = "aspeed,ast2500-pinctrl";
> -                aspeed,external-nodes = <&gfx>, <&lhc>;
> -
> -                pinctrl_i2c3_default: i2c3_default {
> -                    function = "I2C3";
> -                    groups = "I2C3";
> -                };
> -
> -                pinctrl_gpioh0_unbiased_default: gpioh0 {
> -                    pins = "A18";
> -                    bias-disable;
> -                };
> +    scu@1e6e2000 {
> +        compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
> +        reg = <0x1e6e2000 0x1a8>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +
> +        pinctrl: pinctrl {
> +            compatible = "aspeed,ast2500-pinctrl";
> +            aspeed,external-nodes = <&gfx>, <&lhc>;
> +
> +            pinctrl_i2c3_default: i2c3_default {
> +                function = "I2C3";
> +                groups = "I2C3";
>              };
> -        };
> -
> -        gfx: display@1e6e6000 {
> -            compatible = "aspeed,ast2500-gfx", "syscon";
> -            reg = <0x1e6e6000 0x1000>;
> -            reg-io-width = <4>;
> -            clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
> -            resets = <&syscon ASPEED_RESET_CRT1>;
> -            interrupts = <0x19>;
> -            syscon = <&syscon>;
> -            memory-region = <&gfx_memory>;
> -        };
> -    };
> -
> -    lpc: lpc@1e789000 {
> -        compatible = "aspeed,ast2500-lpc", "simple-mfd";
> -        reg = <0x1e789000 0x1000>;
> -
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -        ranges = <0x0 0x1e789000 0x1000>;
> -
> -        lpc_host: lpc-host@80 {
> -            compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> -            reg = <0x80 0x1e0>;
> -            reg-io-width = <4>;
>
> -            #address-cells = <1>;
> -            #size-cells = <1>;
> -            ranges = <0x0 0x80 0x1e0>;
> -
> -            lhc: lhc@20 {
> -                   compatible = "aspeed,ast2500-lhc";
> -                   reg = <0x20 0x24>, <0x48 0x8>;
> +            pinctrl_gpioh0_unbiased_default: gpioh0 {
> +                pins = "A18";
> +                bias-disable;
>              };
>          };
>      };
> -
> -    gfx_memory: framebuffer {
> -        size = <0x01000000>;
> -        alignment = <0x01000000>;
> -        compatible = "shared-dma-pool";
> -        reusable;
> -    };
> --
> 2.32.0
>
