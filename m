Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3994703AA
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 16:18:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9ZKl4swSz3c7w
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 02:18:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.176;
 helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9ZKV6Rblz2yMs
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 02:18:06 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id bk14so13639409oib.7
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 07:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yuPCekkOWDlJ1MkC1Zy+AvR5oDVDh4ZK69iNogA8Tfo=;
 b=3hkMjQqn5ywpYIX04hUiXvulrlsCUNhJYOFh91m2RzPybCg6Uvyy99dI8rNPV9JYoU
 ihUG7VkeBn2hWouHOmYIBnBjduykDDXFWrbZK91TYKuaiG9mKpalBRciLUraEikWXJzt
 BFsFYMDpKXHiPgXITFBG6N/PT1mdgCAVjtqsE2a3vFb9kk/10zY/tHI9PEawNGxqR6Pt
 FUPtSlhfEUvEV/ydAUqcX3aW+AHNJu9uUK7z2gqYAbWZCpwb9SV45zx0zVappEOZkraJ
 5x+UBvNE6mzArq40be0wkQA9ke1UQMsf2pCFhiqTgzvUF0HJ9KGgchHfcIM99O2Imjhq
 oNwQ==
X-Gm-Message-State: AOAM532s9dbvdqUQtppednZH4swC0rlelJJELPEjRdQ/9LoEk3switlM
 UlBxI6BkqnQ+h4BL2fM8Qg==
X-Google-Smtp-Source: ABdhPJwm2C55O4kr1vksBbBfjQryuN8MgvCMdjox/jFfSWOe880aTZkvbmYWPFdGBzfjuxv8rdNzRg==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr12619639oie.41.1639149483561; 
 Fri, 10 Dec 2021 07:18:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f20sm775565oiw.48.2021.12.10.07.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 07:18:02 -0800 (PST)
Received: (nullmailer pid 1368897 invoked by uid 1000);
 Fri, 10 Dec 2021 15:18:01 -0000
Date: Fri, 10 Dec 2021 09:18:01 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <YbNvqTUwi1jzff4D@robh.at.kernel.org>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207210823.1975632-5-j.neuschaefer@gmx.net>
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
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 10:08:19PM +0100, Jonathan Neuschäfer wrote:
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
> v2:
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
>  .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> new file mode 100644
> index 0000000000000..2b783597794d7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
> @@ -0,0 +1,190 @@
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
> +patternProperties:
> +  # There are three kinds of subnodes:
> +  # 1. a GPIO controller node for each GPIO bank
> +  # 2. a pinmux node configures pin muxing for a group of pins (e.g. rmii2)
> +  # 3. a pinconf node configures properties of a single pin
> +
> +  "^gpio@.*$":
> +    if:

Not necessary because you can't have a property with '@' in it.

> +      type: object
> +    then:
> +      description:
> +        Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 and 18
> +        GPIOs. Some GPIOs support interrupts.
> +
> +      allOf:
> +        - $ref: pinmux-node.yaml#
> +
> +      properties:
> +        reg:
> +          description: GPIO bank number (0-7)
> +
> +        gpio-controller: true
> +
> +        "#gpio-cells":
> +          const: 2
> +
> +        interrupt-controller: true
> +
> +        "#interrupt-cells":
> +          const: 2
> +
> +        interrupts:
> +          maxItems: 4

Need to define what each interrupt is.

> +
> +        nuvoton,interrupt-map:

Reusing 'interrupt-map' with a different definition bothers me... 

> +          description:
> +            This property defines which bits in the interrupt registers
> +            correspond to which GPIOs.
> +          $ref: /schemas/types.yaml#/definitions/uint32-array
> +          items:
> +            - description: First interrupt bit
> +            - description: Number of interrupt bits
> +            - description: First GPIO associated with an interrupt
> +
> +      required:
> +        - reg
> +        - gpio-controller
> +        - '#gpio-cells'
> +
> +  "^mux_.*$":

Use '-' rather than '_' and the '.*' is not necessary.

"^mux-"

> +    if:

Don't need this.

> +      type: object
> +    then:
> +      allOf:
> +        - $ref: pinmux-node.yaml#
> +      properties:
> +        groups:
> +          description:
> +            One or more groups of pins to mux to a certain function
> +          items:
> +            enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                    hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo,
> +                    clko, smi, uinc, gspi, mben, xcs2, xcs1, sdio, sspi, fi0,
> +                    fi1, fi2, fi3, fi4, fi5, fi6, fi7, fi8, fi9, fi10, fi11,
> +                    fi12, fi13, fi14, fi15, pwm0, pwm1, pwm2, pwm3, pwm4, pwm5,
> +                    pwm6, pwm7, hg0, hg1, hg2, hg3, hg4, hg5, hg6, hg7 ]
> +        function:
> +          description:
> +            The function that a group of pins is muxed to
> +          enum: [ smb3, smb4, smb5, scs1, scs2, scs3, smb0, smb1, smb2, bsp,
> +                  hsp1, hsp2, r1err, r1md, rmii2, r2err, r2md, kbcc, dvo0,
> +                  dvo1, dvo2, dvo3, dvo4, dvo5, dvo6, dvo7, clko, smi, uinc,
> +                  gspi, mben, xcs2, xcs1, sdio, sspi, fi0, fi1, fi2, fi3, fi4,
> +                  fi5, fi6, fi7, fi8, fi9, fi10, fi11, fi12, fi13, fi14, fi15,
> +                  pwm0, pwm1, pwm2, pwm3, pwm4, pwm5, pwm6, pwm7, hg0, hg1,
> +                  hg2, hg3, hg4, hg5, hg6, hg7, gpio ]
> +
> +      dependencies:
> +        groups: [ function ]
> +        function: [ groups ]
> +
> +      additionalProperties: false
> +
> +  "^cfg_.*$":
> +    if:

Same comments here

> +      type: object
> +    then:
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +      properties:
> +        pins:
> +          description:
> +            A list of pins to configure in certain ways, such as enabling
> +            debouncing
> +          items:
> +            enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, gpio7,
> +                    gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio14,
> +                    gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
> +                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gpio28,
> +                    gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> +                    gpio36, gpio37, gpio38, gpio39, gpio40, gpio41, gpio42,
> +                    gpio43, gpio44, gpio45, gpio46, gpio47, gpio48, gpio49,
> +                    gpio50, gpio51, gpio52, gpio53, gpio54, gpio55, gpio56,
> +                    gpio57, gpio58, gpio59, gpio60, gpio61, gpio62, gpio63,
> +                    gpio64, gpio65, gpio66, gpio67, gpio68, gpio69, gpio70,
> +                    gpio71, gpio72, gpio73, gpio74, gpio75, gpio76, gpio77,
> +                    gpio78, gpio79, gpio80, gpio81, gpio82, gpio83, gpio84,
> +                    gpio85, gpio86, gpio87, gpio88, gpio89, gpio90, gpio91,
> +                    gpio92, gpio93, gpio94, gpio95, gpio96, gpio97, gpio98,
> +                    gpio99, gpio100, gpio101, gpio102, gpio103, gpio104,
> +                    gpio105, gpio106, gpio107, gpio108, gpio109, gpio110,
> +                    gpio111, gpio112, gpio113, gpio114, gpio115, gpio116,
> +                    gpio117, gpio118, gpio119, gpio120, gpio121, gpio122,
> +                    gpio123, gpio124, gpio125, gpio126, gpio127 ]

pattern: '^gpio1?[0-9]{1,2}$'

Feel free to tweak it more to limit to 127 if you want.

> +
> +        input-debounce: true
> +
> +      additionalProperties: false
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
> +        interrupts = <2 IRQ_TYPE_LEVEL_HIGH
> +                      3 IRQ_TYPE_LEVEL_HIGH
> +                      4 IRQ_TYPE_LEVEL_HIGH>;
> +        nuvoton,interrupt-map = <0 16 0>;

Based on the example, you don't need this as it is 1:1.

> +      };
> +
> +      mux_rmii2 {
> +        groups = "rmii2";
> +        function = "rmii2";
> +      };
> +
> +      pinmux_uid: mux_uid {
> +        groups = "gspi", "sspi";
> +        function = "gpio";
> +      };
> +
> +      pinctrl_uid: cfg_uid {
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
