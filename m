Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7A39D2DA8
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 19:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtCJw1v8cz3c7M
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 05:12:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732039963;
	cv=none; b=hqqXBwU0GsRWm7n6FAfFGRZRVOZjQd4EJLv3DaRdL2BHTnNpYbB2cJggpna5BQSC/BW4bU2INS22QTGxUrUyNPEXUUQ8NGlrEI+dYgyGxXvwpZl/3XKEaIko3pEw2JhU15lgwVkf6Bs8q5QLXcxKYRe+i5EF1o4id/fZTE6cOtjIzWSB97FRRVDA8e6XJtDZyOA5nDoBqu1J9tyTdyxVQyslEKZQ0jgi/BieXzUvagEjpAENV873zdN6/knmxREs6dT5hrIZ62uec/1BrD3aLDFDlFMKBVrzB444WF4G5TkoDHwKskTOGfxDnqLzla/mc2J/4rX+/GgzfWOzyIpH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732039963; c=relaxed/relaxed;
	bh=2EG0hlpseCEapMGEupQiC/A0S0mf9ZZv+NgMH6SqcII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDv/7kqp5szz/PI7yR5iCtomsk39l0dwY6xXEqV29KRXcPjY3icTl6+UlWNNGEh6xmfZiDmTVUEzUmk0diG54d0iPDiDL66ii27PsyAZuKY63AnONSx8Fr98ykMuIzjxMruXVA/EliyXSMrgy4wMWHAvx/9aKtU+oCjzckVLWyKKxG6sgWJH5LcP67M+pKthb/O0SHkbxuTSGFVn6zrChahGjyTqhZFH1xiOGhDR5fhs8rcJcYp8BjyNHG3XiOeFRD8qdVsVclmYVrhehV9e7xuNsfp03uWfk+so/9Wf7SRnSatxoTA4aJmsilnWah95X0OaA/zo1n7EdBuX26arCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RjyjfgPE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RjyjfgPE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtCJn6rM2z2xjN
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 05:12:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECAFE5C01B7;
	Tue, 19 Nov 2024 18:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736BAC4CECF;
	Tue, 19 Nov 2024 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732039959;
	bh=+wbYj1AcnlE6pU8bR4zENHUExkruGEtGXcEXeHgtAlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjyjfgPEAoxFatLZFmGR2PBmelIKrLaBAqYHegwKX+KelbP31+plkliWveQbHJHJx
	 h+r+tlCjkoQMjFwAFqAC5KTr3xyo7PhyGQe6j/LAEfrXAUdbrBTnL8x61RNogiclOh
	 0VCcpb/pnnxzSZSxOLxUrNTWV9Sk2zkMTRh0PkHCbv7u0keiWqQg6dPNheodVQn2N/
	 TwSUMUOnSK+k6YsMpFtNFPnlWNUC9HCmSYGxkNRvrAAiW4c7Dnc1qIVuQwOdFnIUOi
	 v0lRhl9MQsf8Rblk5Y+qsrLSaB41wL/L6foueUoHGNnd+4e3xJwXzXBts5U+VOQQ3z
	 hU+ZE9CjWVVQA==
Date: Tue, 19 Nov 2024 12:12:37 -0600
From: Rob Herring <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <20241119181237.GA1871579-robh@kernel.org>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-2-a0987203069@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2024 at 04:27:05PM +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> new file mode 100644
> index 000000000000..92cbbcc72f2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton DWMAC glue layer controller
> +
> +maintainers:
> +  - Joey Lu <yclu4@nuvoton.com>
> +
> +description:
> +  Nuvoton 10/100/1000Mbps Gigabit Ethernet MAC Controller is based on
> +  Synopsys DesignWare MAC (version 3.73a).
> +
> +# We need a select here so we don't match all nodes with 'snps,dwmac'

You mean snps,dwmac-3.70a?

> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - nuvoton,ma35d1-dwmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

oneOf is not correct. I think you wanted 'items'.

> +      - enum:
> +          - nuvoton,ma35d1-dwmac
> +      - const: snps,dwmac-3.70a

But you said above the h/w is 3.73a.

Really, I'd prefer to just drop this because it's not useful on its own. 
But the driver does check for snps,dwmac-3.70a. All those 
of_device_is_compatible() calls in the driver should really be replaced 
with static match data structs.

> +
> +  reg:
> +    description:
> +      Register range should be one of the GMAC interface.

Need to define how many entries and what they are if more than 1.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: MAC clock
> +      - description: PTP clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +
> +  nuvoton,sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to access syscon registers.
> +          - description: GMAC interface ID.
> +            enum:
> +              - 0
> +              - 1
> +    description:
> +      A phandle to the syscon with one argument that configures system registers
> +      for MA35D1's two GMACs. The argument specifies the GMAC interface ID.
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-txid
> +      - rgmii-rxid
> +
> +  phy-handle:
> +    $ref: /schemas/types.yaml#/definitions/phandle

The type is already defined. Drop.

> +    description:
> +      Specifies a reference to a node representing a PHY device.
> +
> +  tx-internal-delay-ps:
> +    enum: [0, 2000]
> +    default: 0
> +    description:
> +      RGMII TX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
> +
> +  rx-internal-delay-ps:
> +    enum: [0, 2000]
> +    default: 0
> +    description:
> +      RGMII RX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
> +
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - nuvoton,sys
> +  - resets
> +  - reset-names
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +    //Example 1

Not a useful comment.

> +    gmac0: ethernet@40120000 {

Drop unused labels.

> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x0 0x40120000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 0>;
> +        resets = <&sys MA35D1_RESET_GMAC0>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&eth_phy0>;
> +        mdio0: mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> +
> +  - |
> +    //Example 2
> +    gmac1: ethernet@40130000 {

Drop the example. It's almost the same as the first one.

> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x0 0x40130000 0x0 0x10000>;
> +        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
> +        clock-names = "stmmaceth", "ptp_ref";
> +
> +        nuvoton,sys = <&sys 1>;
> +        resets = <&sys MA35D1_RESET_GMAC1>;
> +        reset-names = "stmmaceth";
> +
> +        phy-mode = "rmii";
> +        phy-handle = <&eth_phy1>;
> +        mdio1: mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy1: ethernet-phy@1 {
> +                reg = <1>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..aecdb3d37b53 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -66,6 +66,7 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nuvoton,ma35d1-dwmac
>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
>          - qcom,sc8280xp-ethqos
> -- 
> 2.34.1
> 
