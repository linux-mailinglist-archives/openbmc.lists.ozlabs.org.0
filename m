Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E394D5E61
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFLCF13pxz30Dy
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 20:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=R9QK3LtH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=R9QK3LtH; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFLBp4Wr2z2y6K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 20:25:37 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8995A3F62D
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646990733;
 bh=D1XtJyL/qqPN2xLVrq6WSrUWrKPZ0qDx4WjygrxcxL4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=R9QK3LtHzp5UlaeI+G5RAqm8G7PXbanCWk1n2X5Yww5JKIjtS3gqFaufAIqo0Lh0g
 FG2vYcPDUY7Uqy4xi169gIBcFlkPtpABWjI5nL7/g4WRZBcS2Ln2/NkHggmoG9DaRw
 cDOFX5atDyPIySbzd22OLvtSoa7OKlXQm0Hmd7YSNiDzzspnnibYV5EP7VQ2ICa9fC
 JuzyiET6q46ECPBLtEgaRRP5aH9IZnYnGHSRtjQ039N9dUlv01Subisb/hpXs5YYgs
 Rvca/WmdGSYTrslmfY3yanEtQ4LB5+ZZw0+TF8VuPtsbpagIwAPvR3AVfUzaoI430J
 L45UIoHmxn3+Q==
Received: by mail-ed1-f69.google.com with SMTP id
 z19-20020a50cd13000000b0041693869e9aso4352117edi.14
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 01:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D1XtJyL/qqPN2xLVrq6WSrUWrKPZ0qDx4WjygrxcxL4=;
 b=E3yzTLStipb9gePtTV38T3fZGSPiAoeRNXTNITYUUK39ZE24Cl7FivcemFr5SMxSob
 ES5QYZOcIhZQovhWK8xbalNb5er6olFp6DJChrr2N0uGssYDJeJBUvSDs+xzVBJUBH82
 cS1BhZU+xcu7RDKAEBEjc6IPNLwHVaZK1+XwPELg/Y8i83LWLrVUEUf6xEei+7mAFZry
 JU/QjV5tuLPxa5U84UmlZzdjTfROufEl/K01gtQapfIKbhvISGaPivcgFID67hhTPCGN
 Uifmftlng2ls484FXeo6Ms30ctBy4mE+dEbs7plz+0KCgrlb+c2XgePsZnKmrKL06437
 Dkhw==
X-Gm-Message-State: AOAM531mkoIiAOgEJRvFCyHERIfK7DpjgFVBpHvsyLVLXi/eoG9x1LP7
 gvPj1okTdlvUIFUnPX9/3shS7RLNeThO3EcKqeSUb+9CneuFTHtYnq6b+MaCWWhaGaiJc+RDZhI
 bESYOAL0BNrWvHKOWUc/o06A40CFxukySQEKK
X-Received: by 2002:aa7:c54b:0:b0:415:c714:7a1f with SMTP id
 s11-20020aa7c54b000000b00415c7147a1fmr7914988edr.385.1646990733009; 
 Fri, 11 Mar 2022 01:25:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHiW2gWM85UR5m9XbGbjsYu5M4yHXr5ZVuoNQ8b/CLVDoNmQC144ImvZc/fVRESprMrS3lzg==
X-Received: by 2002:aa7:c54b:0:b0:415:c714:7a1f with SMTP id
 s11-20020aa7c54b000000b00415c7147a1fmr7914962edr.385.1646990732722; 
 Fri, 11 Mar 2022 01:25:32 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056402510d00b00416ca731b5fsm986108edd.9.2022.03.11.01.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:25:31 -0800 (PST)
Message-ID: <49b19cf0-a4aa-69c3-a609-422a8b3f9798@canonical.com>
Date: Fri, 11 Mar 2022 10:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/3] dt-bindings: support Nuvoton sgpio
Content-Language: en-US
To: jimliu2 <jim.t90615@gmail.com>, JJLIU0@nuvoton.com, KWLIU@nuvoton.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 CTCCHIEN@nuvoton.com
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
 <20220311060936.10663-3-JJLIU0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311060936.10663-3-JJLIU0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/03/2022 07:09, jimliu2 wrote:
> Add nuvoton sgpio yaml in dt-bindings

Missing full stop.

Subject: missing prefix. Check git log history.

> 
> Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
> ---
>  .../bindings/gpio/nuvoton,sgpio.yaml          | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> new file mode 100644
> index 000000000000..8766e1fa4528
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton SGPIO controller
> +
> +maintainers:
> +  - Jim LIU <JJLIU0@nuvoton.com>
> +
> +description:
> +  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC,
> +  NPCM7xx/NPCM8xx have two sgpio module each module can support up
> +  to 64 output pins,and up to 64 input pin.
> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)
> +  - Directly connected to APB bus and its shift clock is from APB bus clock
> +    divided by a programmable value.
> +  - ngpios is number of nin_gpios GPIO lines and nout_gpios GPIO lines.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-sgpio
> +      - nuvoton,npcm845-sgpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  nin_gpios: true
> +
> +  nout_gpios: true

Both do not look like proper property. No description, no vendor prefix,
no type, wrong value (true).

> +
> +  bus-frequency: true

Why a GPIO controller needs this legacy bus-frequency property? Which
bus frequency is it? Internal? APB? If APB, use assigned-clocks.

> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - nin_gpios
> +  - nout_gpios
> +  - clocks
> +  - bus-frequency
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    sgpio1: sgpio@101000 {

Generic node name, so "gpio".

> +        compatible = "nuvoton,npcm750-sgpio";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +        reg = <0x101000 0x200>;

reg goes after compatible.

> +        clocks = <&clk NPCM7XX_CLK_APB3>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&iox1_pins>;
> +        nin_gpios = <64>;
> +        nout_gpios = <64>;
> +        bus-frequency = <16000000>;
> +    };


Best regards,
Krzysztof
