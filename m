Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEA389561
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 20:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlhGW4h2Rz308N
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 04:29:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlhGC55y3z2xvG;
 Thu, 20 May 2021 04:28:49 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id b25so14053898oic.0;
 Wed, 19 May 2021 11:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3eV85aK6PAtwTIX7onsB2928ux3depQzquh9A03orMk=;
 b=qjZeI6q5EgkKoUYMfbEk39UGymrj0LkR5GSyPor/ICGROOxhssgMlLL0VsXqLmp3cK
 czBuCsPjgNQHD2QIrEd3HGTrF7/4/9+F6zC38L+0DR7hQ/YFheyZVaXzgHgs+akugpe8
 OQbkyt2Jr5MnQ/mXDn0W+faUvEKcjZpW4b3cY5fQjIVf6AE/WapxyG0TRUTAO9cRHXp1
 q8fQEhsIYsFckEM+eZphPrn+t8vWQn6TrUTCJQwpEztY1LHQlECAeySVq4CQ/vMz5dXk
 cCqbGUWumG6G9XoPLioOrs4NQC7VSyLwnVgDsiQ8hH4sS6KcfrBx4nxqm736UF+L9oA8
 H0NA==
X-Gm-Message-State: AOAM5307AbK2ylLB2pg8l04+WJP3CYZRi1l9tvglnMH4YzMg8X67jcHM
 yTZa3D7da8Pz6OknKRI5KA==
X-Google-Smtp-Source: ABdhPJwBSPco+BWcZhY6T7CWfaeY70LQtqLiuoeVpEkgzz95UJ9gpV21P2GnJSbEmmdBCqyKgN8wKA==
X-Received: by 2002:aca:da89:: with SMTP id r131mr388538oig.3.1621448926930;
 Wed, 19 May 2021 11:28:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f9sm108444otq.27.2021.05.19.11.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:28:46 -0700 (PDT)
Received: (nullmailer pid 3405153 invoked by uid 1000);
 Wed, 19 May 2021 18:28:45 -0000
Date: Wed, 19 May 2021 13:28:45 -0500
From: Rob Herring <robh@kernel.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed-i2c: Convert txt to yaml format
Message-ID: <20210519182845.GA3400858@robh.at.kernel.org>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com>
 <20210519080436.18975-4-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519080436.18975-4-jamin_lin@aspeedtech.com>
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
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
 troy_lee@aspeedtech.com, Brendan Higgins <brendanhiggins@google.com>,
 open list <linux-kernel@vger.kernel.org>, Rayn Chen <rayn_chen@aspeedtech.com>,
 steven_lee@aspeedtech.com, chiawei_wang@aspeedtech.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 04:04:29PM +0800, Jamin Lin wrote:
> Add global-reg node for AST2600. Document the properties for
> "aspeed,ast2600-i2c-global" compatible node.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 89 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ----------
>  2 files changed, 89 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> new file mode 100644
> index 000000000000..f469487935bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device Tree Bindings
> +
> +maintainers:
> +  - Rayn Chen <rayn_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-i2c-bus
> +      - aspeed,ast2500-i2c-bus
> +      - aspeed,ast2600-i2c-bus
> +      - aspeed,ast2600-i2c-global syscon

"aspeed,ast2600-i2c-global syscon" is not a valid compatible value.

What makes this a syscon?

> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#address-cells":
> +    const: 1
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    description: interrupt number
> +
> +  clocks:
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell

How many clocks? Needs maxItems or items.

> +
> +  reset:
> +    description: phandle to reset controller with the reset number in
> +      the second cell

How many?

> +
> +  bus-frequency:
> +    minimum: 10000
> +    maximum: 3400000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz when not
> +      specified
> +
> +  multi-master:
> +    maxItems: 1

multi-master is an array?

> +    description:
> +      states that there is another master active on this bus
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +    i2c_gr: i2c-global-regs@0 {
> +      compatible = "aspeed,ast2600-i2c-global", "syscon";
> +      reg = <0x0 0x20>;
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +    };
> +
> +    i2c0: i2c-bus@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      reg = <0x80 0x80>;
> +      compatible = "aspeed,ast2600-i2c-bus";
> +      clocks = <&syscon ASPEED_CLK_APB2>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-frequency = <100000>;
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> deleted file mode 100644
> index b47f6ccb196a..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -Device tree configuration for the I2C busses on the AST24XX, AST25XX, and AST26XX SoCs.
> -
> -Required Properties:
> -- #address-cells	: should be 1
> -- #size-cells		: should be 0
> -- reg			: address offset and range of bus
> -- compatible		: should be "aspeed,ast2400-i2c-bus"
> -			  or "aspeed,ast2500-i2c-bus"
> -			  or "aspeed,ast2600-i2c-bus"
> -- clocks		: root clock of bus, should reference the APB
> -			  clock in the second cell
> -- resets		: phandle to reset controller with the reset number in
> -			  the second cell
> -- interrupts		: interrupt number
> -
> -Optional Properties:
> -- bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
> -		  specified
> -- multi-master	: states that there is another master active on this bus.
> -
> -Example:
> -
> -i2c {
> -	compatible = "simple-bus";
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges = <0 0x1e78a000 0x1000>;
> -
> -	i2c_ic: interrupt-controller@0 {
> -		#interrupt-cells = <1>;
> -		compatible = "aspeed,ast2400-i2c-ic";
> -		reg = <0x0 0x40>;
> -		interrupts = <12>;
> -		interrupt-controller;
> -	};
> -
> -	i2c0: i2c-bus@40 {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		#interrupt-cells = <1>;
> -		reg = <0x40 0x40>;
> -		compatible = "aspeed,ast2400-i2c-bus";
> -		clocks = <&syscon ASPEED_CLK_APB>;
> -		resets = <&syscon ASPEED_RESET_I2C>;
> -		bus-frequency = <100000>;
> -		interrupts = <0>;
> -		interrupt-parent = <&i2c_ic>;
> -	};
> -};
> -- 
> 2.17.1
> 
