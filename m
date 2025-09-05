Return-Path: <openbmc+bounces-600-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9957CB45115
	for <lists+openbmc@lfdr.de>; Fri,  5 Sep 2025 10:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ8MD2ZcFz3bkT;
	Fri,  5 Sep 2025 18:16:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757060200;
	cv=none; b=gJ2V6hM4a+YpW43KjkHFGS5kX+S4pxGVJK5Fz7hiny0I+H/u0ilOYgN1+RKw10mS03uekjvimnI7oYldek7xdDyVwjdicN2xRHswiOh1hCMPI6sk52lobTGSwuFQ2/ro10CoH6ewrpfbSseD1fyYNw99x9tjN3vVfZ/m8h2iuAxk0XDdO59xl3mY3x8YPvrsKTGpH0jpu6hF1Oezo8byh30YB+lvymbWonpvTJIn125WnkCjnYHuwFazNfsHea/Jx608vSKhmR+4KFD71j2kSKRxvy6heFU+SxzPjryZHXaqpNUot6qTkVZ1wZ6glB2GNXOHbH82/neUCR5gOVgsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757060200; c=relaxed/relaxed;
	bh=MR0mGwVaP63tprA30EW/NWo/9dDiP1xCdBvs4/l8hWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0P1FxotLRvUj8J9EQYhgkjA/MDt8DNdoaUfYnkl/KzqO6190aT/+9i9xfJiGJl8V2cOun2fzqpSsY7OfqpP3Sx+EkThsoyLpxwktufEdbrcoVPLqzoV705mY9DMEOyUWZZdwiOKnkWC9vrwigzI8uxOLHqY1bFCbHFcI5TInYD94Ky1p8IY1as1Bxo9brdewLkU/j0VAQCwyrPYYdv0zeDQ6/JreV1gaow9e3EEqIRXz1Z6xzmBza7BWoVyvcDbT984yRnIbQjTYrQz5U9UZCzFd9iCRAFyiPw9yIj/rnATUJNBdekzHEVMdpGEWZJc5ktgnl+NbYT1MOPX0h802w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8bJ3+yk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D8bJ3+yk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ8MC3wR3z3bh6;
	Fri,  5 Sep 2025 18:16:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88FCE4020F;
	Fri,  5 Sep 2025 08:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA29C4CEF1;
	Fri,  5 Sep 2025 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060197;
	bh=0+i54Si2cMI9nBtLp8I1HNyZ8djprDv/KS3WoyWPmOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8bJ3+ykwQH5VksbMEcM5VcdAdKja9Ie/6gP3kW3ShfMCYvV54eoW/lUuryOeqoZ5
	 WzObbEp5u6lQOLzmhqRwMlvOQcINIQdnrJDQmcSFacwlirQv6BzJuq2Mms9r1iR20L
	 qaOpx7kRJksiamSajB5X73CLtcajkWyOC/Fnd7U2Yb1bFWMiDFLX+lWZcNThiWpck3
	 dncnKrdemaBMYWDMdcotIGiqEnIBapC/m/MC+4BYHe+OPvKn34IlVTXj5aPuWDXz4u
	 1P1TlUMQidi+x2eKCTNhqgGY5w9BLDKRBjEsE3kq6yQz1FaoHlQ0pxIIkUjdV438xB
	 Dzsg9mNvLZfQQ==
Date: Fri, 5 Sep 2025 10:16:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Message-ID: <20250905-monumental-camouflaged-butterfly-01faed@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-3-billy_tsai@aspeedtech.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-3-billy_tsai@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 06:33:59PM +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> The ASPEED AST2700 SoC contains two separate pin controllers, each
> managed by a distinct System Control Unit (SCU).
> Because these two controllers have different register maps, control
> different sets of pins, support different pin configuration options, and
> implement different multi-function switch logic, they are not compatible.
> Therefore, two separate device tree bindings,'aspeed,ast2700-soc0-pinctrl'
> and 'aspeed,ast2700-soc1-pinctrl', are introduced.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 115 +++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 435 ++++++++++++++++++
>  2 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..0fee62259250
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |

Drop |

> +  Bindings for the ASPEED AST2700 SoC0 Pin Controller.

You should explain here hardware, not say what bindings are (we know
what bindings are) or copy title, either.

> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl
> +
> +additionalProperties:

You should restrict nodes with pattern to common suffix or prefix, e.g.
group, state, pins. See other pinctrl bindings for examples.


> +  $ref: pinmux-node.yaml#
> +  additionalProperties: false
> +
> +  properties:
> +    function:
> +      enum:
> +        - EMMC
> +        - VGADDC
> +        - USB3A
> +        - USB2A
> +        - USB3B
> +        - USB2B
> +        - JTAG0
> +        - PCIERC
> +
> +    groups:
> +      enum:
> +        - EMMCG1
> +        - EMMCG4
> +        - EMMCG8
> +        - EMMCWPN
> +        - EMMCCDN
> +        - VGADDC
> +        - USB3AXHD
> +        - USB3AXHPD
> +        - USB3AXH
> +        - USB3AXHP
> +        - USB3AXH2B
> +        - USB3AXHP2B
> +        - USB2AXHD1
> +        - USB2AXHPD1
> +        - USB2AD1
> +        - USB2AXH
> +        - USB2AXHP
> +        - USB2AXH2B
> +        - USB2AXHP2B
> +        - USB2AHPD0
> +        - USB2AD0
> +        - USB2AH
> +        - USB2AHP
> +        - USB3BXHD
> +        - USB3BXHPD
> +        - USB3BXH
> +        - USB3BXHP
> +        - USB3BXH2A
> +        - USB3BXHP2A
> +        - USB2BXHD1
> +        - USB2BXHPD1
> +        - USB2BD1
> +        - USB2BXH
> +        - USB2BXHP
> +        - USB2BXH2A
> +        - USB2BXHP2A
> +        - USB2BHPD0
> +        - USB2BD0
> +        - USB2BH
> +        - USB2BHP
> +        - JTAGM0
> +        - PSP
> +        - SSP
> +        - TSP
> +        - DDR
> +        - USB3A
> +        - USB3B
> +        - PCIEA
> +        - PCIEB
> +        - PCIERC0PERST
> +        - PCIERC1PERST
> +
> +    pins:
> +      $ref: /schemas/types.yaml#/definitions/string-array
> +    drive-strength:
> +      minimum: 0
> +      maximum: 15
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pinctrl0: pinctrl{

DTS coding style - missing space.

Unused label.

And you did not implement Rob's comment.


Best regards,
Krzysztof


