Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E1414A54
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 15:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDzLh6pTYz2yp0
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 23:15:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q4sfo0oO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q4sfo0oO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDzLB4d2rz2yHf;
 Wed, 22 Sep 2021 23:15:14 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5058660FA0;
 Wed, 22 Sep 2021 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632316510;
 bh=fvgA8XINho8vGBBk9z1aRVPxssLDZgs/yX8lhx2dLi8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=q4sfo0oOfWPG1JNeV43hK1ssVTp5mmuKOHAuR6RpCwPGCOoH/uKvDjIpsxWMDgDt9
 /ILV1cpv3M6ztAMwYn2qR60FJ2mPucIzhSA9pVpuRavgmev/OHgvfLkno8DvEpdiK4
 qbbRTHVWSj0NQ2zw5Er4LNqqGM9e8wcH211otJify8HRLq+eq5+RtyK2uqg7nFFW6O
 vTA1ov7VvVFAz3FlU2L9CoYqMlz5yRNpYOWuC+0dV33MfUm6PxBshRBUsA+Ssms0tP
 S1Mohi2R61nJLOpPX59xn9i/BpGCPU9WOLrscpG6xX5JIyR0BUweev6CWMumpXpMiY
 kDGZ7fbpmlnuA==
Received: by mail-ed1-f41.google.com with SMTP id g8so9704493edt.7;
 Wed, 22 Sep 2021 06:15:10 -0700 (PDT)
X-Gm-Message-State: AOAM5337h8xVL5JQMqZBxu5iqqnKiW3ulWITC4Xf3WVo18DVi5e/myNq
 QkG8W38cFvnCd5cEmRt8BSnl6nPsPBgB2HHb2g==
X-Google-Smtp-Source: ABdhPJwdaKILi3zd33J2b62f/WwpWQQoXc2IYi7vZkPZb+WlR+hIWBW3Ih8Ifo+f201UknRAu99cm4yQZugpg4ZHc1I=
X-Received: by 2002:a05:6402:b23:: with SMTP id
 bo3mr42719931edb.145.1632316501345; 
 Wed, 22 Sep 2021 06:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210922073241.14119-1-chiawei_wang@aspeedtech.com>
 <20210922073241.14119-2-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210922073241.14119-2-chiawei_wang@aspeedtech.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 Sep 2021 08:14:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLDztZpw9wWfCCKn8rBZxKcsh_idc903kEUDAuh_31OQw@mail.gmail.com>
Message-ID: <CAL_JsqLDztZpw9wWfCCKn8rBZxKcsh_idc903kEUDAuh_31OQw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 yulei.sh@bytedance.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 2:32 AM Chia-Wei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> Convert the bindings of Aspeed LPC from text file into YAML schema.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 157 ---------------
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   | 187 ++++++++++++++++++
>  2 files changed, 187 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

This has lots of warnings with 'make dtbs_check':

/builds/robherring/linux-dt-review/arch/arm/boot/dts/aspeed-ast2500-evb.dt.yaml:
lpc@1e789000: 'ibt@140', 'kcs@114', 'kcs@24', 'kcs@28', 'kcs@2c',
'lhc@a0', 'reg-io-width' do not match any of the regexes:
'^lpc-ctrl@[0-9a-f]+$', '^lpc-snoop@[0-9a-f]+$',
'^reset-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

Is 'reg-io-width' valid?

You can quiet all the child nodes with:

additionalProperties:
  type: object

(They will still warn about undocumented compatibles, so we don't lose
any todo list).


> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> new file mode 100644
> index 000000000000..9c66795a1fb6
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

You need '|' to preserve paragraphs.

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

Already has a type. Needs how many entries (maxItems: 1).

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
> +      compatible:
> +        items:
> +          - enum:
> +              - aspeed,ast2400-lpc-snoop
> +              - aspeed,ast2500-lpc-snoop
> +              - aspeed,ast2600-lpc-snoop
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      snoop-ports:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: The LPC I/O ports to snoop
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - snoop-ports
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    lpc: lpc@1e789000 {
> +        compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
> +        reg = <0x1e789000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e789000 0x1000>;
> +
> +        lpc_ctrl: lpc-ctrl@80 {
> +            compatible = "aspeed,ast2600-lpc-ctrl";
> +            reg = <0x80 0x80>;
> +            clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
> +            memory-region = <&flash_memory>;
> +            flash = <&spi>;
> +        };
> +
> +        lpc_reset: reset-controller@98 {
> +            compatible = "aspeed,ast2600-lpc-reset";
> +            reg = <0x98 0x4>;
> +            #reset-cells = <1>;
> +        };
> +
> +        lpc_snoop: lpc-snoop@90 {
> +            compatible = "aspeed,ast2600-lpc-snoop";
> +            reg = <0x90 0x8>;
> +            interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +            snoop-ports = <0x80>;
> +        };
> +    };
> --
> 2.17.1
>
