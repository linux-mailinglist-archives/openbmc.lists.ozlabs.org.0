Return-Path: <openbmc+bounces-1361-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A2mNUn3jGk1wQAAu9opvQ
	(envelope-from <openbmc+bounces-1361-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 11 Feb 2026 22:40:25 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1031B127CDE
	for <lists+openbmc@lfdr.de>; Wed, 11 Feb 2026 22:40:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBBgB63Wtz2xHX;
	Thu, 12 Feb 2026 08:40:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770846022;
	cv=none; b=oMhc6kvJ81xl0Nk9Jj+vwWeQnIM99QsTXTIOy+p6pm49tkc+D094nvbQlwyh1uFu/CcBl1WhCFEVaFdtgK/OsHpCGPeNc7cG9DiLH1Wr1lM+ICNss/YA2vrzRfvlOe4cQ6OzLzvCEAWNsYvkHW9g0GXlsbcmpYUTSwk3qSqbOCB4Aq5hbOU0xzlJmA5gKYxHTzLBGGmqsjvnE4hS/ZCGEv5Px8tlHnmb0SaD0adBBJe1borlMpSDdLGnhmFKZZ9LlpcSXSwB5HzGcKPkgBrYiqxWnODcFPGRkqkSAu1J7rKxQKpp0tDWv/QDBhRg5jDgmCG9ks2OJbnvSay/CZXvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770846022; c=relaxed/relaxed;
	bh=vn8nDwWRbfU1p1x0vnuHpFag005m4ze8+NWmtLBToUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee6Z74h8Fohq42DahXhkZqXPdkwjK+jz7FgMFlTY3vTOEwfIYhjr7i36jXmPNwAHvlmwlC7vpaqfqgb3jMt8raLqPMcW7dfJuMc6PuUUgyaOx15DMaA0KMsJKTdOkXkkSrUWRTunlOloctS/v8jdvgvIgNKyyS1KDF1013B+gmJvmFJw8VD2pTNOM4usps6/XzOSppXFfvQUbvAo7Lw+uPwAJfK2l8lENYGjw2Tkcm49tISRVlBwPjcEBVOatQnpSCNnOvHQrywWWMlj0TDdVU/NUhCUcRjNEV9DA2x8bjRpoqXXHB3j4lbBf5dTyL/anLhUlTUBYQfOUVY18Mm1LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4lZwcRc; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4lZwcRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBBg93Hhrz2xGF
	for <openbmc@lists.ozlabs.org>; Thu, 12 Feb 2026 08:40:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9F3660051;
	Wed, 11 Feb 2026 21:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3969BC4CEF7;
	Wed, 11 Feb 2026 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770846018;
	bh=1ON6GaGmF0/TaofBjCmUtGuI5mGNnmlfjg25WlFka0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F4lZwcRcUBYW9l/AHoM9PNyTTcHFmOa8WygnosvJeEFr7KKXNim/zPeLJ0qTd+719
	 XWekh9fPI8kGwCddMISXJLRDBL+hUkoRB+mzwzLy7WYqJ9CJk7wYtmVfg9WsSxEOvC
	 1bKG8mcY0FJHPSChbkXYYBJtp4JHgNJSDoTYOaMJM6EkipECU5TcCqH8npxQvD6v17
	 03utrnXm7hThQLg24XREuALXP3MrMkKkTYC8TzDs+gYYk1VAWiUTDTYxu/cwjzC3B7
	 217aqVy5vYFMSM3c1DjAFloUj25HPzW0LQaMfqW/Ybrfj5fsMnu1W16ZJOMIThaMq5
	 +Ult7sVr31n8Q==
Date: Wed, 11 Feb 2026 15:40:17 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, linux@roeck-us.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <20260211214017.GA3930589-robh@kernel.org>
References: <20260210154117.1126857-1-tmaimon77@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210154117.1126857-1-tmaimon77@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1361-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:linux@roeck-us.net,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:openbmc@lists.ozlabs.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,roeck-us.net,kernel.org,google.com,lists.ozlabs.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[openbmc,dt];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.0:email,0.0.0.1:email,0.1.146.88:email]
X-Rspamd-Queue-Id: 1031B127CDE
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 05:41:17PM +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 ------------
>  .../bindings/hwmon/npcm750-pwm-fan.yaml       | 132 ++++++++++++++++++
>  2 files changed, 132 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml


> diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
> new file mode 100644
> index 000000000000..954ba7d38b93
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml

nuvoton,npcm750-pwm-fan.yaml for filename.

> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description: |

Don't need '|'.

> +  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
> +  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels and up
> +  to 16 tachometer inputs. It is used for fan speed control and monitoring.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-pwm-fan
> +      - nuvoton,npcm845-pwm-fan
> +
> +  reg:
> +    maxItems: 2
> +    description: Register addresses for PWM and Fan Tach units.
> +
> +  reg-names:
> +    items:
> +      - const: pwm
> +      - const: fan
> +
> +  clocks:
> +    maxItems: 2
> +    description: Clocks for the PWM and Fan Tach modules.
> +
> +  clock-names:
> +    items:
> +      - const: pwm
> +      - const: fan
> +
> +  interrupts:
> +    description: |
> +      Contains the Fan interrupts with flags for falling edge.
> +      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
> +      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).

Blank line between paragraphs. Or remove '|' and re-wrap at 80. Same 
problem elsewhere...

> +    minItems: 8
> +    maxItems: 12
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^fan@[0-9a-f]+$":
> +    type: object
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Specify the PWM output channel. Integer value in the range 0-7 for
> +          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.

items:
  items:
    maximum: 11

> +
> +      fan-tach-ch:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

This is defined as 8-bit.

> +        description: |
> +          The tach channel(s) used for the fan.
> +          Integer values in the range 0-15.

items:
  maximum: 15
 
> +
> +      cooling-levels:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

already has a type. Drop.

> +        description: |
> +          PWM duty cycle values in a range from 0 to 255 which
> +          correspond to thermal cooling states. This property enables
> +          thermal zone integration for automatic fan speed control
> +          based on temperature.

items:
  maximum: 255

> +
> +    required:
> +      - reg
> +      - fan-tach-ch
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    pwm_fan: pwm-fan@103000 {
> +        compatible = "nuvoton,npcm750-pwm-fan";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reg = <0x103000 0x2000>, <0x180000 0x8000>;
> +        reg-names = "pwm", "fan";
> +
> +        clocks = <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
> +        clock-names = "pwm", "fan";
> +
> +        interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pwm0_pins &fanin0_pins>;
> +
> +        fan@0 {
> +            reg = <0>;
> +            fan-tach-ch = <0 1>;
> +            cooling-levels = <64 128 192 255>;
> +        };
> +
> +        fan@1 {
> +            reg = <1>;
> +            fan-tach-ch = <2>;
> +        };
> +    };
> -- 
> 2.34.1
> 

