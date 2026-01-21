Return-Path: <openbmc+bounces-1261-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK12Bus0cGlzXAAAu9opvQ
	(envelope-from <openbmc+bounces-1261-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 03:07:39 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F04F819
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 03:07:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwndd5R5Sz2yDY;
	Wed, 21 Jan 2026 13:07:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768961253;
	cv=none; b=DWgf7DPHRNodnQQi/AQyTerh9gfTeLdcErIi1hbI62K15jHpg1gpdIe7mWzjxrPutmG9g5E55/rH/HirmxGljH1X97MN82dqqaKKfhaxxVToYhsjmcR2VQHWWImwNaUvOeckm8+HArcmYmX9RU2yS0voaCr55oTGMlb3xtjlR9atE8duWXhMH+w3Q53FCMePW3bNhCyG6ybRUCA5tyzYTWr1SDEW+i5vX9GseKIg8RBiAuBBvfqMzpqcQUg8sajSvnPRU8fPjdPnbuW01+EWXZGAieUVDOeWwiOojpIM8rf0hp7/hu5ReA2A38+elHxc338DFBkLXjs44VmsWAPQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768961253; c=relaxed/relaxed;
	bh=3MOD7NIE1cxfcxUvm///tnok4l0oY22zZakhR8di0WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRZIeYgCbbfmx7al0lZn7kgLb84I1g5MFEciF9ridKMYAvmuGYdYLD1juYwR1BC3iYclUDsZpYQi8HdeJxKMabULUJxwDB/4cqCcGfbCnlCAyztYZrtpZkloLVNYAbnJBwBjuSTWw+gU7W7VU++hhZOAgm+S0FUgZLX+Gkm8FAiv6SPWQ/rp9ek1Oxq7p12LdrHu52Cu+hfdwLd2BufzV9U1SBJRUpEldQzT0SwI6PPBvdSGcR1RVGVguRy1sUxxzZWZPvuUFfr+gDZ5fayIgmyT0e5/+qhIBEKi6Tzv8eaf5JZEA2xhf9mXzRAsSDFKsoDFO34VxOzT0pUPmkCPwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3ugkjBm; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3ugkjBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwndc3TSWz2xqD
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 13:07:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C6D2416EA;
	Wed, 21 Jan 2026 02:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC259C16AAE;
	Wed, 21 Jan 2026 02:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961249;
	bh=UhRa/hhK1GRwkMusaBuB1dhc0k3sK6FAZHAw1qd42mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3ugkjBmcHRyS3AoS57oEOFQ22Ym/OSCmv9lxyaQmg8ZUrms0j+6EdpH9SbEm4CVK
	 9yywF6QfgnX9d8ZtiCG+aQonvUFK5pxoVsh+w/0IkXBEXI54+er4iiHfYQinr6+Nyc
	 KxsPpCJL1MsrJ2zjL218ozcBKbz4a33CU7R77nUJxHZ4+o7s30fAlea1aWlwnEyeiO
	 ixjpdp7IYv3oZYOgae9T0j7K2tgyoLWAFBEOE0H66O+LfLEUq0ZepzznScuhYUQkoa
	 pLlDDhxXmVFE9wy3oTDeB989JWf6VQDFkze/W8vKJ3AVguGLBPNpfLzPeUQ5TjEPUX
	 LKG8HrpLIOZrA==
Date: Tue, 20 Jan 2026 20:07:28 -0600
From: Rob Herring <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <20260121020728.GA1671298-robh@kernel.org>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-2-a0987203069@gmail.com>
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
In-Reply-To: <20260119073342.3132502-2-a0987203069@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1261-lists,openbmc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[2.100.46.192:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,nuvoton.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: A21F04F819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 03:33:39PM +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml

This should not be executable.

Rob

> 
> diff --git a/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> new file mode 100755
> index 000000000000..8eaddfdc937c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> @@ -0,0 +1,126 @@
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
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,ma35d1-dwmac
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Register range should be one of the GMAC interface.
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
> +  tx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII TX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-txid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +  rx-internal-delay-ps:
> +    default: 0
> +    minimum: 0
> +    maximum: 2000
> +    description:
> +      RGMII RX path delay used only when PHY operates in RGMII mode with
> +      internal delay (phy-mode is 'rgmii-id' or 'rgmii-rxid') in pico-seconds.
> +      Allowed values are from 0 to 2000.
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - nuvoton,sys
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
> +    ethernet@40120000 {
> +        compatible = "nuvoton,ma35d1-dwmac";
> +        reg = <0x40120000 0x10000>;
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
> +        mdio {
> +            compatible = "snps,dwmac-mdio";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            eth_phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index dd3c72e8363e..10cb5e555750 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -69,6 +69,7 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nuvoton,ma35d1-dwmac
>          - nxp,s32g2-dwmac
>          - qcom,qcs404-ethqos
>          - qcom,sa8775p-ethqos
> -- 
> 2.43.0
> 

