Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B34944E8A
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 16:54:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eJi/cSmx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZX6r0gKpz3dRf
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 00:54:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eJi/cSmx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZX6K2DZTz30TZ
	for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2024 00:54:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7219B628A6;
	Thu,  1 Aug 2024 14:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A88C32786;
	Thu,  1 Aug 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524038;
	bh=TPgKn7GWBgu6nd6mkNKctAoxTw80xW2Kmt4GxkrZ80I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eJi/cSmxhuZnazLMYWmDWjf3Fufhmk1yg1NZSK5IRF0WKvLZ9GsXjJSKfg7mC/2Mv
	 M8Gum3EzF+ln9Y4tc8lqAmwgnQSpkGLsMCYgBvPJ9QBmKsVLSTzDRvt7HmZ0hMpEqH
	 Pv5/OE+y4nzFgyMRHU8fLhqhjlgP9r3Red2YaVQeXst6uwUM7/vGgjgDN/VZHD9JeD
	 DIbhhvFETcIouc4i0RC/xiVv/BS6BuVCPQi45hJP2LjJ/WifJJCvfwO6MrfCsNpmO7
	 DmYRG3BEdPfuxMINM9zK3pVJuzuKxgBUCN3OVRa/Pv908xfzb32YCeBlloRK2asTLJ
	 XH0jT27JII8wQ==
Message-ID: <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org>
Date: Thu, 1 Aug 2024 16:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
To: Stanley Chu <stanley.chuys@gmail.com>, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, linux-i3c@lists.infradead.org
References: <20240801071946.43266-1-yschu@nuvoton.com>
 <20240801071946.43266-2-yschu@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240801071946.43266-2-yschu@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, yschu@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cpchiang1@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 01/08/2024 09:19, Stanley Chu wrote:
> The npcm845 i3c devicetree binding follows the basic i3c bindings
> and add the properties for allowing to adjust the SDA/SCL timing
> to meet different requirements.
> 
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> ---
>  .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++++

Use compatible as filename. Anyway word "master" was dropped.

>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> new file mode 100644
> index 000000000000..a40b37b16872
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM845 I3C master

Use new terminology. Since 2021 there was a change... three years ago.

> +
> +maintainers:
> +  - Stanley Chu <yschu@nuvoton.com>
> +  - James Chiang <cpchiang1@nuvoton.com>
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,npcm845-i3c
> +
> +  reg:
> +    items:
> +      - description: I3C registers
> +      - description: GDMA registers
> +      - description: GDMA request control register
> +
> +  reg-names:
> +    items:
> +      - const: i3c
> +      - const: dma
> +      - const: dma_ctl
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: system clock
> +      - description: bus clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: fast_clk
> +
> +  resets:
> +    maxItems: 1
> +
> +  i3c-pp-scl-hi-period-ns:
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      If need to configure SCL with required duty cycle, specify the clock high/low period directly.
> +      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in push pull mode
> +      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are specified, the i3c pp frequency is
> +      decided by these two properties.

Wrap according to Linux Coding Style (and read coding style to figure
the proper wrapping...).

> +
> +  i3c-pp-scl-lo-period-ns:
> +    description: |
> +      The low period ns of the SCL clock cycle in push pull mode. i3c-pp-scl-lo-period-ns should not
> +      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3c-pp-scl-hi-period-ns + 150.

Everywhere: defaults, constraints.

> +
> +  i3c-pp-sda-rd-skew:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
> +      pull operation when transfers i3c private read.
> +    maximum: 7
> +    default: 0
> +
> +  i3c-pp-sda-wr-skew:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The number of MCLK clock periods to delay the SDA transition from the SCL clock edge at push
> +      pull operation when transfers i3c private write.
> +    maximum: 7
> +    default: 0
> +
> +  i3c-od-scl-hi-period-ns:
> +    description: |
> +      The i3c open drain frequency is 1MHz by default.
> +      If need to use different frequency, specify the clock high/low period directly.
> +      i3c-od-scl-hi-perios-ns specifies the high period ns of the SCL clock cycle in open drain mode.
> +      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are specified, the i3c od frequency is
> +      decided by these two properties.
> +      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-period-ns or i3c-od-scl-lo-period-ns.
> +
> +  i3c-od-scl-lo-period-ns:
> +    description: |
> +      The low period ns of the SCL clock cycle in open drain mode. i3c-od-scl-lo-period-ns should be
> +      multiple of i3c-pp-scl-hi-period-ns.
> +
> +  enable-hj:
> +    type: boolean
> +    description: |
> +      Enable SLVSTART interrupt for receiving hot-join request.

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +
> +  use-dma:
> +    type: boolean
> +    description: |
> +      Enable the i3c private transfers using DMA.

Why wouldn't you enable it always? Where are dma properties for this?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +
> +additionalProperties: true

Nope, it cannot be true. Look how other bindings are doing this. Why
implementing something entirely different?

> +
> +examples:
> +  - |
> +    i3c@fff10000 {
> +        compatible = "nuvoton,npcm845-i3c";
> +        clocks = <&clk 4>, <&clk 26>;
> +        clock-names = "pclk", "fast_clk";
> +        interrupts = <0 224 4>;
> +        reg = <0xfff10000 0x1000>,
> +              <0xf0850000 0x1000>,
> +              <0xf0800300 0x4>;

Order properties as in DTS coding style.

> +        reg-names = "i3c", "dma", "dma_ctl";
> +        resets = <&rstc 0x74 8>;
> +        #address-cells = <3>;
> +        #size-cells = <0>;

Make your bindings complete - you skipped many properties. Why defining
them if you are not using them and they do not have defaults?

> +    };

Best regards,
Krzysztof

