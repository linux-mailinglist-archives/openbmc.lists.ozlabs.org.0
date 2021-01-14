Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03A2F62D8
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 15:16:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGmZP2yyvzDsfD
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 01:16:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.169;
 helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGmW70c81zDsdl;
 Fri, 15 Jan 2021 01:13:22 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id d203so6032975oia.0;
 Thu, 14 Jan 2021 06:13:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6h5oUPZ53wfO7f92HycjGe1n6yQ3GPM+QRp+J+bOXQU=;
 b=A+MLywBmxdlUV9m0NnXqFxrvKpXnTbmPbd5nGcgv1xpxI9JeaeNiWNy12KU0K4wnax
 uNMQy7PkRuVvasT5a2mrJRC6H5j4KqnxlqE7njjdzFK6lxGD7w5n4Ue1f5EkNhDKx9HI
 K5HOH/OWsnXx5cwqCtqo5KaTBaO74Sm9IApCOD06c9FdyygaA+QlzZS4+bhU3WF766h5
 dWZjw0hw/JpQEzoA/SUkO2mSabEkpiGPNI0RfzS7Pxo7vBGx+SQsFRJl8xhRXuXWzXJI
 b8EKviWbQ/OqNNRPVs/rl6NQc96xkP9R8ZbSRUrqht3gC+PMHNc6dJ/QwIyzOkcW5v4I
 pZTg==
X-Gm-Message-State: AOAM533zr8ILFKUilGeVbP3oQiZ12TVAFCPsyOXIsgc71oXuksyf04zl
 OEMU7ox239LsqhZBpy3qTA==
X-Google-Smtp-Source: ABdhPJxRzKOok/V/nC7yvIoQFv1kr5D7gm8HVf45a+LU/nY5SxSFQOxwkwYlL+jMqNwCCy9n20BtQw==
X-Received: by 2002:aca:c592:: with SMTP id v140mr2687412oif.10.1610633599393; 
 Thu, 14 Jan 2021 06:13:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n13sm1064351otk.58.2021.01.14.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:13:18 -0800 (PST)
Received: (nullmailer pid 2833114 invoked by uid 1000);
 Thu, 14 Jan 2021 14:13:17 -0000
Date: Thu, 14 Jan 2021 08:13:17 -0600
From: Rob Herring <robh@kernel.org>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Message-ID: <20210114141317.GA2823834@robh.at.kernel.org>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
 <20210113070850.1184506-2-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113070850.1184506-2-troy_lee@aspeedtech.com>
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, leetroy@gmail.com,
 Philipp Zabel <p.zabel@pengutronix.de>, chiawei_wang@aspeedtech.com,
 Guenter Roeck <linux@roeck-us.net>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 13, 2021 at 07:08:45AM +0000, Troy Lee wrote:
> We add binding for supporting a new AST2600 PWM/Fan hwmon driver.
> 
> Changes since v1:
> - dt binding with DT schema format
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  .../hwmon/aspeed,ast2600-pwm-tachometer.yaml  | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> new file mode 100644
> index 000000000000..b84076a4a338
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-pwm-tachometer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 PWM and Fan Tacho controller device driver
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support upto 16 PWM outputs. The ASPEED Fan Tacho
> +  controller can support upto 16 Fan tachometer inputs.
> +  There can be upto 16 fans supported. Each fan can have one PWM output and
> +  one Fan tach inputs.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-pwm-tachometer
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  reg:
> +    description:
> +      Address and length of the register set for the device.

No need for generic descriptions. That's every 'reg'.

What you need is how many entries and what each one is if more than 1. 
If only 1, then just 'maxItems: 1'

> +
> +  clocks:
> +    description:
> +      phandle to clock provider with the clock number in the second cell

Same here.

> +
> +  resets:
> +    description:
> +      phandle to reset controller with the reset number in the second cell

And here.

> +
> +patternProperties:
> +  "@[0-9]+$":

If every node is a fan and there are up to 16:

^fan@[0-9a-f]$

> +    type: object
> +    description:
> +      Under fan subnode there can upto 16 child nodes, with each child node
> +      representing a fan. There are 16 fans each fan can have one PWM port and one
> +      Fan tach inputs.
> +      For PWM port can be configured cooling-levels to create cooling device.
> +      Cooling device could be bound to a thermal zone for the thermal control.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 15
> +        description:
> +          This property identify the PWM control channel of this fan.
> +
> +      fan-tach-ch:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        minimum: 0
> +        maximum: 15
> +        description:
> +          This property identify the fan tach input channel.
> +
> +      pulses-per-revolution:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 2
> +        minimum: 1
> +        description:
> +          Specify tacho pulse per revolution of the fan.
> +
> +      cooling-levels:
> +        description:
> +          PWM duty cycle values in a range from 0 to 255
> +          which correspond to thermal cooling states.
> +
> +      aspeed,pwm-freq:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 25000
> +        minimum: 24
> +        maximum: 780000
> +        description:
> +          Specify the frequency of PWM.

Units? Use a unit suffix and then drop the $ref.

> +
> +      aspeed,inverse-pin:
> +        type: boolean
> +        description:
> +          Inverse PWM output signal.
> +
> +      aspeed,falling-point:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        default: 10
> +        minimum: 0
> +        maximum: 255

0-255 is already the range of uint8, so drop.

> +        description:
> +          Initialize the pulse width.
> +
> +    required:
> +      - fan-tach-ch
> +      - reg
> +
> +    additionalProperties: true
> +
> +required:
> + - compatible
> + - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm_tacho: pwm-tacho-controller@1e610000 {
> +        compatible = "aspeed,ast2600-pwm-tachometer";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x1e610000 0x100>;
> +
> +        fan@1 {
> +            reg = <0x00>;
> +            aspeed,pwm-freq = <25000>;
> +            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +            fan-tach-ch = /bits/ 8 <0x00>;
> +            pulses-per-revolution = <2>;
> +        };
> +
> +        fan@2 {
> +            reg = <0x01>;
> +            aspeed,pwm-freq = <25000>;
> +            cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +            fan-tach-ch = /bits/ 8 <0x01>;
> +            pulses-per-revolution = <2>;
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
