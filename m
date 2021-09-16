Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE4D40DCBC
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 16:32:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9KKf5xnpz2yQH
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 00:32:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.181;
 helo=mail-il1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9KKK46Tyz2yHM;
 Fri, 17 Sep 2021 00:31:48 +1000 (AEST)
Received: by mail-il1-f181.google.com with SMTP id a20so6794366ilq.7;
 Thu, 16 Sep 2021 07:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fAacrA6W73TmTJowVU/M8C9ofZVBuSlLkQTY41xYT6U=;
 b=vPQT7bm8M9tCxPHvxoGc4zJJfOX+3JD4bRV1JCyzJ+ns6llQBHI0cSpiz0MD4gFpqR
 dPrze71R0PRxZNtnHH1FdMDQhoq5+8FRwCqF62i4sEejV2/gcigMQ7kE3H/9Sy4g7vTY
 WViSQcb31ZRkj7Bbqo8Qvl8VC2gNJFub7NoRX/SlMfm1iMbcKJoWsZ5QPVpa8ZlS2fI1
 73D/uw2EmEH/8zVCbKPpLgPgXMAzZwTEhwv+IDy1UL1lFA6oIL8MQONjHrzBLWeDWNll
 TbF/aLjPtpfIUQMpSQpKfVCRuaqTuIZjmedrTxJ9ueoaMHkDfXPjFg4hGG1XK/92LAAk
 1wWw==
X-Gm-Message-State: AOAM5334ELO4dYRPEbmK6uo0UwrYCywqjes0SO/tIsqdo5RZ80YcewbU
 qvdJOBAFYFUF2v3nR/t8DQ==
X-Google-Smtp-Source: ABdhPJxv+5expow/nn+OkFIv10yDu52fxIFCNm7rj0izG4tFaocYL3e71M8U5rP0NItOjB9IH3YDcA==
X-Received: by 2002:a05:6e02:1d8b:: with SMTP id
 h11mr3938952ila.94.1631802706225; 
 Thu, 16 Sep 2021 07:31:46 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id e10sm1735496ili.53.2021.09.16.07.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 07:31:45 -0700 (PDT)
Received: (nullmailer pid 1307845 invoked by uid 1000);
 Thu, 16 Sep 2021 14:31:44 -0000
Date: Thu, 16 Sep 2021 09:31:44 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Message-ID: <YUNVUAF4Keij2OUA@robh.at.kernel.org>
References: <20210916092515.10553-1-chiawei_wang@aspeedtech.com>
 <20210916092515.10553-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916092515.10553-2-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 16, 2021 at 05:25:12PM +0800, Chia-Wei Wang wrote:
> Convert the bindings of Aspeed LPC from text file into YAML schema.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 187 ++++++++++++++++++
>  2 files changed, 187 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> deleted file mode 100644
> index 936aa108eab4..000000000000
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ /dev/null
> @@ -1,157 +0,0 @@
> -======================================================================
> -Device tree bindings for the Aspeed Low Pin Count (LPC) Bus Controller
> -======================================================================
> -
> -The LPC bus is a means to bridge a host CPU to a number of low-bandwidth
> -peripheral devices, replacing the use of the ISA bus in the age of PCI[0]. The
> -primary use case of the Aspeed LPC controller is as a slave on the bus
> -(typically in a Baseboard Management Controller SoC), but under certain
> -conditions it can also take the role of bus master.
> -
> -The LPC controller is represented as a multi-function device to account for the
> -mix of functionality, which includes, but is not limited to:
> -
> -* An IPMI Block Transfer[2] Controller
> -
> -* An LPC Host Controller: Manages LPC functions such as host vs slave mode, the
> -  physical properties of some LPC pins, configuration of serial IRQs, and
> -  APB-to-LPC bridging amonst other functions.
> -
> -* An LPC Host Interface Controller: Manages functions exposed to the host such
> -  as LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> -  management and bus snoop configuration.
> -
> -* A set of SuperIO[3] scratch registers: Enables implementation of e.g. custom
> -  hardware management protocols for handover between the host and baseboard
> -  management controller.
> -
> -Additionally the state of the LPC controller influences the pinmux
> -configuration, therefore the host portion of the controller is exposed as a
> -syscon as a means to arbitrate access.
> -
> -[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> -[1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2168.pdf?key=7c88837454702128622bee53acbda8f4
> -[2] https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> -[3] https://en.wikipedia.org/wiki/Super_I/O
> -
> -Required properties
> -===================
> -
> -- compatible:	One of:
> -		"aspeed,ast2400-lpc-v2", "simple-mfd", "syscon"
> -		"aspeed,ast2500-lpc-v2", "simple-mfd", "syscon"
> -		"aspeed,ast2600-lpc-v2", "simple-mfd", "syscon"
> -
> -- reg:		contains the physical address and length values of the Aspeed
> -                LPC memory region.
> -
> -- #address-cells: <1>
> -- #size-cells:	<1>
> -- ranges:	Maps 0 to the physical address and length of the LPC memory
> -                region
> -
> -Example:
> -
> -lpc: lpc@1e789000 {
> -	compatible = "aspeed,ast2500-lpc-v2", "simple-mfd", "syscon";
> -	reg = <0x1e789000 0x1000>;
> -
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges = <0x0 0x1e789000 0x1000>;
> -
> -	lpc_snoop: lpc-snoop@0 {
> -		compatible = "aspeed,ast2600-lpc-snoop";
> -		reg = <0x0 0x80>;
> -		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> -		snoop-ports = <0x80>;
> -	};
> -};
> -
> -
> -LPC Host Interface Controller
> --------------------
> -
> -The LPC Host Interface Controller manages functions exposed to the host such as
> -LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> -management and bus snoop configuration.
> -
> -Required properties:
> -
> -- compatible:	One of:
> -		"aspeed,ast2400-lpc-ctrl";
> -		"aspeed,ast2500-lpc-ctrl";
> -		"aspeed,ast2600-lpc-ctrl";
> -
> -- reg:		contains offset/length values of the host interface controller
> -		memory regions
> -
> -- clocks:	contains a phandle to the syscon node describing the clocks.
> -		There should then be one cell representing the clock to use
> -
> -Optional properties:
> -
> -- memory-region: A phandle to a reserved_memory region to be used for the LPC
> -		to AHB mapping
> -
> -- flash:	A phandle to the SPI flash controller containing the flash to
> -		be exposed over the LPC to AHB mapping
> -
> -Example:
> -
> -lpc_ctrl: lpc-ctrl@80 {
> -	compatible = "aspeed,ast2500-lpc-ctrl";
> -	reg = <0x80 0x80>;
> -	clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> -	memory-region = <&flash_memory>;
> -	flash = <&spi>;
> -};
> -
> -LPC Host Controller
> --------------------
> -
> -The Aspeed LPC Host Controller configures the Low Pin Count (LPC) bus behaviour
> -between the host and the baseboard management controller. The registers exist
> -in the "host" portion of the Aspeed LPC controller, which must be the parent of
> -the LPC host controller node.
> -
> -Required properties:
> -
> -- compatible:	One of:
> -		"aspeed,ast2400-lhc";
> -		"aspeed,ast2500-lhc";
> -		"aspeed,ast2600-lhc";
> -
> -- reg:		contains offset/length values of the LHC memory regions. In the
> -		AST2400 and AST2500 there are two regions.
> -
> -Example:
> -
> -lhc: lhc@a0 {
> -	compatible = "aspeed,ast2500-lhc";
> -	reg = <0xa0 0x24 0xc8 0x8>;
> -};
> -
> -LPC reset control
> ------------------
> -
> -The UARTs present in the ASPEED SoC can have their resets tied to the reset
> -state of the LPC bus. Some systems may chose to modify this configuration.
> -
> -Required properties:
> -
> - - compatible:		One of:
> -			"aspeed,ast2600-lpc-reset";
> -			"aspeed,ast2500-lpc-reset";
> -			"aspeed,ast2400-lpc-reset";
> -
> - - reg:			offset and length of the IP in the LHC memory region
> - - #reset-controller	indicates the number of reset cells expected
> -
> -Example:
> -
> -lpc_reset: reset-controller@98 {
> -        compatible = "aspeed,ast2500-lpc-reset";
> -        reg = <0x98 0x4>;
> -        #reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> new file mode 100644
> index 000000000000..54f080df5e2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2021 Aspeed Tehchnology Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed Low Pin Count (LPC) Bus Controller
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +
> +description:
> +  The LPC bus is a means to bridge a host CPU to a number of low-bandwidth
> +  peripheral devices, replacing the use of the ISA bus in the age of PCI[0]. The
> +  primary use case of the Aspeed LPC controller is as a slave on the bus
> +  (typically in a Baseboard Management Controller SoC), but under certain
> +  conditions it can also take the role of bus master.
> +
> +  The LPC controller is represented as a multi-function device to account for the
> +  mix of functionality, which includes, but is not limited to
> +
> +  * An IPMI Block Transfer[2] Controller
> +
> +  * An LPC Host Interface Controller manages functions exposed to the host such
> +    as LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> +    management and bus snoop configuration.
> +
> +  * A set of SuperIO[3] scratch registers enableing implementation of e.g. custom
> +    hardware management protocols for handover between the host and baseboard
> +    management controller.
> +
> +  Additionally the state of the LPC controller influences the pinmux
> +  configuration, therefore the host portion of the controller is exposed as a
> +  syscon as a means to arbitrate access.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2400-lpc-v2
> +          - aspeed,ast2500-lpc-v2
> +          - aspeed,ast2600-lpc-v2
> +      - const: simple-mfd
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^lpc-ctrl@[0-9a-f]+$":
> +    type: object
> +
> +    description:
> +      The LPC Host Interface Controller manages functions exposed to the host such as
> +      LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART management
> +      and bus snoop configuration.
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - aspeed,ast2400-lpc-ctrl
> +              - aspeed,ast2500-lpc-ctrl
> +              - aspeed,ast2600-lpc-ctrl
> +
> +      reg:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      memory-region:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description: A reserved_memory region to be used for the LPC to AHB mapping
> +
> +      flash:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description: The SPI flash controller containing the flash to be exposed over the LPC to AHB mapping
> +
> +    required:
> +      - compatible
> +      - clocks
> +
> +  "^reset-controller@[0-9a-f]+$":
> +    type: object
> +
> +    description:
> +      The UARTs present in the ASPEED SoC can have their resets tied to the reset
> +      state of the LPC bus. Some systems may chose to modify this configuration
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - aspeed,ast2400-lpc-reset
> +              - aspeed,ast2500-lpc-reset
> +              - aspeed,ast2600-lpc-reset
> +
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +
> +  "^lpc-snoop@[0-9a-f]+$":
> +    type: object
> +
> +    description:
> +      The LPC snoop interface allows the BMC to listen on and record the data
> +      bytes written by the Host to the targeted LPC I/O pots.
> +
> +    properties:
> +      comptabile:

I guess I have to point out *every* instance of your typo?

Run 'make dt_binding_check' and find these problems before you send this 
out.

Rob
