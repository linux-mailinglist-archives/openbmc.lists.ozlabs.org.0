Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDC80E4A3
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 08:10:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq8rt0gxxz2xbC
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 18:10:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 532 seconds by postgrey-1.37 at boromir; Tue, 12 Dec 2023 18:10:02 AEDT
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq8rV4yfRz2xbC
	for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 18:10:00 +1100 (AEDT)
Received: from [192.168.0.4] (ip5f5aee94.dynamic.kabel-deutschland.de [95.90.238.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E627361E5FE04;
	Tue, 12 Dec 2023 08:00:34 +0100 (CET)
Message-ID: <72fe6f18-e3d7-4c74-9734-01a33dc8e100@molgen.mpg.de>
Date: Tue, 12 Dec 2023 08:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Content-Language: en-US
To: Jim Liu <jim.t90615@gmail.com>
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-2-jim.t90615@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231212065147.3475413-2-jim.t90615@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: andy@kernel.org, KWLIU@nuvoton.com, conor+dt@kernel.org, Rob Herring <robh@kernel.org>, linus.walleij@linaro.org, Jim Liu <JJLIU0@nuvoton.com>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jim,


Thank you for your patch.

Am 12.12.23 um 07:51 schrieb Jim Liu:
> Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver
> 
> Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

As you seem to be employed by Nuvoton, should your company/work email be 
listed somehow, and even be used for the author address?

> ---
> Changes for v9:
>     - no changed
> Changes for v8:
>     - no changed
> Changes for v7:
>     - no changed
> ---
>   .../bindings/gpio/nuvoton,sgpio.yaml          | 86 +++++++++++++++++++
>   1 file changed, 86 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> new file mode 100644
> index 000000000000..84e0dbcb066c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> @@ -0,0 +1,86 @@
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
> +description: |
> +  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
> +  Nuvoton NPCM7xx SGPIO module is combine serial to parallel IC (HC595)

s/is combine/combines a/

> +  and parallel to serial IC (HC165), and use APB3 clock to control it.

use*s*

> +  This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).

Only one space before the (.

> +  NPCM7xx/NPCM8xx have two sgpio module each module can support up

… modules. Each module …

> +  to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.

1.  Space after the comma.
2.  64 input pin*s

> +  GPIO pins have sequential, First half is gpo and second half is gpi.

have sequential ?.

> +  GPIO pins can be programmed to support the following options
> +  - Support interrupt option for each input port and various interrupt
> +    sensitivity option (level-high, level-low, edge-high, edge-low)

option*s*

> +  - ngpios is number of nuvoton,input-ngpios GPIO lines and nuvoton,output-ngpios GPIO lines.
> +    nuvoton,input-ngpios GPIO lines is only for gpi.

s/is/are/

> +    nuvoton,output-ngpios GPIO lines is only for gpo.

s/is/are/

It’d be great if you mentioned the datasheet name and revision in the 
description.

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
> +  nuvoton,input-ngpios:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The numbers of GPIO's exposed. GPIO lines is only for gpi.

s/is/are/

> +    minimum: 0
> +    maximum: 64
> +
> +  nuvoton,output-ngpios:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The numbers of GPIO's exposed. GPIO lines is only for gpo.

s/is/are/

> +    minimum: 0
> +    maximum: 64
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - nuvoton,input-ngpios
> +  - nuvoton,output-ngpios
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio8: gpio@101000 {
> +        compatible = "nuvoton,npcm750-sgpio";
> +        reg = <0x101000 0x200>;
> +        clocks = <&clk NPCM7XX_CLK_APB3>;
> +        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        nuvoton,input-ngpios = <64>;
> +        nuvoton,output-ngpios = <64>;
> +    };

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul Menzel
