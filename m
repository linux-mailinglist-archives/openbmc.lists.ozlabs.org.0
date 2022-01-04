Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BB484A7F
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 23:12:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT6LH39kdz305X
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 09:12:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.178;
 helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT6L20WSdz2xBV
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 09:12:25 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id v6so61425042oib.13
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 14:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Zxat3RxZ2kL6hVjxEg9Pud3VyF3p+RYKJBac3eG1N4Y=;
 b=N5yiNtBdYy8TVW4EDJrycLwZE+wBATEG3b69l6FimWbHa6925LXmrASOkmG0c7Za5q
 A/Z4WW97qBL5Ejer0iTzs0tMtW2Y8eZhNhFQ0AXNvWewrtTAyZCPteTrAfcAkfP2ja6c
 kzhKs99tDobwQk+OOVLM3Qmro/H+yDLUG2NrO5cMExTgqIvxylsmnzSLTK+ziOcsHKVQ
 p2jljVI7bbg+7PfXdc2/mWfkoI+akUATzMc3PBP74SP5u0uFdnIhtmv8bEvL0avQ1kxo
 Vx8BRbA4FZUxBtyAES1wOshNmKHIoHDxJ/sMSvZ7O/sRaCM+cX7hzmPSAzTTeZzYEGCI
 u1Hw==
X-Gm-Message-State: AOAM533hZ1bS2dA2ZyeqlA0CkzLBu5Tjo+ILkzy1T4+WJOEFNba2k6TP
 XGQJzchEiNwWOqzxuv5Y9w==
X-Google-Smtp-Source: ABdhPJzKklA8L9Ga3Uu5ApL9Su61SC8+C1UDzKMN6qYRyq2KiheeDRYnHu8/n6rnH31NuYcAyKwz+Q==
X-Received: by 2002:aca:902:: with SMTP id 2mr319380oij.79.1641334343260;
 Tue, 04 Jan 2022 14:12:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h14sm7631620otr.4.2022.01.04.14.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:12:22 -0800 (PST)
Received: (nullmailer pid 1534010 invoked by uid 1000);
 Tue, 04 Jan 2022 22:12:21 -0000
Date: Tue, 4 Jan 2022 16:12:21 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v3 4/9] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <YdTGRY+n9XY522jg@robh.at.kernel.org>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
 <20211224200935.93817-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224200935.93817-5-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 24, 2021 at 09:09:30PM +0100, Jonathan Neuschäfer wrote:
> This binding is heavily based on the one for NPCM7xx, because the
> hardware is similar. There are some notable differences, however:
> 
> - The addresses of GPIO banks are not physical addresses but simple
>   indices (0 to 7), because the GPIO registers are not laid out in
>   convenient blocks.
> - Pinmux settings can explicitly specify that the GPIO mode is used.
> 
> Certain pins support blink patterns in hardware. This is currently not
> modelled in the DT binding.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> 
> ---
> v3:
> - Make changes suggested by Rob Herring
> - Fix lint errors
> - Simplify child node patterns
> - Remove if/type=object/then trick
> - Reduce interrupts.maxItems to 3: 4 aren't necessary
> - Replace list of gpio0/1/2/etc. with pattern
> - Remove nuvoton,interrupt-map again, to simplify the binding
> - Make tuples clearer
> 
> v2:
> - https://lore.kernel.org/lkml/20211207210823.1975632-5-j.neuschaefer@gmx.net/
> - Move GPIO into subnodes
> - Improve use of quotes
> - Remove unnecessary minItems/maxItems lines
> - Remove "phandle: true"
> - Use separate prefixes for pinmux and pincfg nodes
> - Add nuvoton,interrupt-map property
> - Make it possible to set pinmux to GPIO explicitly
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-5-j.neuschaefer@gmx.net/
> ---
>  .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> new file mode 100644
> index 0000000000000..2d15737b5815e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nuvoton,wpcm450-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton WPCM450 pin control and GPIO
> +
> +maintainers:
> +  - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> +
> +properties:
> +  compatible:
> +    const: nuvoton,wpcm450-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  # There are three kinds of subnodes:
> +  # 1. a GPIO controller node for each GPIO bank
> +  # 2. a pinmux node configures pin muxing for a group of pins (e.g. rmii2)
> +  # 3. a pinconf node configures properties of a single pin
> +
> +  "^gpio":

'^gpio@[0-7]$'

> +    type: object
> +
> +    description:
> +      Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 and 18
> +      GPIOs. Some GPIOs support interrupts.
> +
> +    properties:
> +      reg:
> +        description: GPIO bank number (0-7)

reg:
  minimum: 0
  maximum: 7

But there's not an actual register address range you could use instead?

> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +
> +      interrupts:
> +        maxItems: 3
> +        description:
> +          The interrupts associated with this GPIO bank
> +
> +    required:
> +      - reg
> +      - gpio-controller
> +      - '#gpio-cells'
> +
> +  "^mux-":
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      groups:
> +        description:
> +          One or more groups of pins to mux to a certain function
> +        items:
> +          enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                  hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo,
> +                  clko, smi, uinc, gspi, mben, xcs2, xcs1, sdio, sspi, fi0,
> +                  fi1, fi2, fi3, fi4, fi5, fi6, fi7, fi8, fi9, fi10, fi11,
> +                  fi12, fi13, fi14, fi15, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
> +                  pwm6, pwm7, hg0, hg1, hg2, hg3, hg4, hg5, hg6, hg7 ]
> +      function:
> +        description:
> +          The function that a group of pins is muxed to
> +        enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo0,
> +                dvo1, dvo2, dvo3, dvo4, dvo5, dvo6, dvo7, clko, smi, uinc,
> +                gspi, mben, xcs2, xcs1, sdio, sspi, fi0, fi1, fi2, fi3, fi4,
> +                fi5, fi6, fi7, fi8, fi9, fi10, fi11, fi12, fi13, fi14, fi15,
> +                pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, hg0, hg1,
> +                hg2, hg3, hg4, hg5, hg6, hg7, gpio ]
> +
> +    dependencies:
> +      groups: [ function ]
> +      function: [ groups ]
> +
> +    additionalProperties: false
> +
> +  "^cfg-":
> +    $ref: pincfg-node.yaml#
> +
> +    properties:
> +      pins:
> +        description:
> +          A list of pins to configure in certain ways, such as enabling
> +          debouncing
> +        items:
> +          pattern: "^gpio1?[0-9]{1,2}$"
> +
> +      input-debounce: true
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    pinctrl: pinctrl@b8003000 {
> +      compatible = "nuvoton,wpcm450-pinctrl";
> +      reg = <0xb8003000 0x1000>;
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      gpio0: gpio@0 {
> +        reg = <0>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        interrupts = <2 IRQ_TYPE_LEVEL_HIGH>,
> +                     <3 IRQ_TYPE_LEVEL_HIGH>,
> +                     <4 IRQ_TYPE_LEVEL_HIGH>;
> +      };
> +
> +      mux-rmii2 {
> +        groups = "rmii2";
> +        function = "rmii2";
> +      };
> +
> +      pinmux_uid: mux-uid {
> +        groups = "gspi", "sspi";
> +        function = "gpio";
> +      };
> +
> +      pinctrl_uid: cfg-uid {
> +        pins = "gpio14";
> +        input-debounce = <1>;
> +      };
> +    };
> +
> +    gpio-keys {
> +      compatible = "gpio-keys";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
> +
> +      uid {
> +        label = "UID";
> +        linux,code = <102>;
> +        gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> --
> 2.30.2
> 
> 
