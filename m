Return-Path: <openbmc+bounces-210-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88EAD991B
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB03FVDz30Pn;
	Sat, 14 Jun 2025 10:41:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749830104;
	cv=none; b=HJM+i09vj1VMgN+qa3tMJBFu+JMxPSEK01Zg2P9Q1FA8230fb4cQ0mD+2gSQg3V+NWBr/O+/9BlGPBUJY/ZOsW3oQJxjU8bGyX5oYaIhcCLfSu9i6iW2ca7OtIJXXO09nX4w3wxoWIL+7fPjjmQUUrySZww/BWn5CBEVJmmGvpSpvV+Siq7+it2ovMcg8hOzwWQf9V6yyRR39Syx0Awa6TDdfxbpBO+V7aWBmVSU4QDKnkScis15LaGqktdpnovS13OJULedEBtEDxYx3ZNGetd7gU59GyeaYzcfyGFxQ8qQNz+My62eKtBZqUlSfKgbifamNlzdf8n4WJUiJCD+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749830104; c=relaxed/relaxed;
	bh=dVpvvucvYqfu63JD/OuOOltdFqYGu1+iCXebSLkmw0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KNifS+k3rQi9rZvHVv7ThJb5N1QYPbTms7XlS5qN15jff4Lozk2w/2Mt5BudrGCxDS/nSYHMQi9cLiBaJtKNx2eeiBDIyWo9mUPeQ+cEaSsC3JhpV4XU+dPtTGanPBefp3PGa3N5Yl/AkmE+Rx9Q/aP5lVEQa1vhxzbGUmBCpIWpJqQKVsoQXUGgTHSVECsHqN5sOsbxl//JxoEVz44/8t7iJZAUfNzDeshu59d5kdoFjjSt+NLwT0syi1unPvHvkD9Ypixn7Yvt4Lug6hlKCUIGbbqhrPxwmPhQsYDwN9QG4lItCz2+6sVkw9dwlNelMCELuIk/CXM5pNcCAKqP/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gFPoa516; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gFPoa516;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJkVv135nz2xBb;
	Sat, 14 Jun 2025 01:55:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45683A5148E;
	Fri, 13 Jun 2025 15:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42EBC4CEED;
	Fri, 13 Jun 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830099;
	bh=txoIyDrG2vubdoOdTiTdmcJQb8y7qy5caM50Zd8G8to=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gFPoa516Ela1DPXpH0f6/CS5GkNUbZK3nAYpFk07eqEgd3MKAhYJpF0s0lR7On5mh
	 mTRs3hEkjNSmkoYXNNxat0V6bY1VSuL9RUaPNvJuo+3M4NxXHk18J9uIsBuF7BfZSP
	 LT2mpCyuW/nNNqy98L7h2qv/SXJaaEYTKmk9KlAx8hO5gtnc+f8HFC2H9FWk4DGBfW
	 6JdxNAw5ZVa4sVUYSYyFngUyMNeio0PIqep0t3E5XJuUwayNZIlc1Um9AsPD8fsgtD
	 LX9RVvGngHT5S7OMOIWzgnwkmg0oDRjT3tctQgL7cXq2tYr8yGsydjYdO2oCDGOE4x
	 7e6vKtWFkarMA==
Date: Fri, 13 Jun 2025 10:54:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Message-ID: <20250613155458.GA962010@bhelgaas>
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
In-Reply-To: <20250613033001.3153637-6-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 11:29:59AM +0800, Jacky Chou wrote:
> The AST2600 has one PCIe RC, and add the relative configure regmap.

> +			pcie0: pcie@1e7700c0 {
> +				compatible = "aspeed,ast2600-pcie";
> +				device_type = "pci";
> +				reg = <0x1e7700c0 0x40>;
> +				linux,pci-domain = <0>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +				bus-range = <0x80 0xff>;
> +
> +				ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> +					  0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
> +
> +				status = "disabled";
> +
> +				resets = <&syscon ASPEED_RESET_H2X>,
> +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> +				reset-names = "h2x", "perst";

PERST# is clearly a per-Root Port item since it's a signal on the PCIe
connector.  Can you separate this and any other per-Root Port things
into a Root Port stanza to leave open the possibility of future
hardware that supports multiple Root Ports in the RC?

> +				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_pcierc1_default>;
> +
> +				#interrupt-cells = <1>;
> +				msi-parent = <&pcie0>;
> +				msi-controller;
> +				msi_address = <0x1e77005c>;
> +
> +				aspeed,ahbc = <&ahbc>;
> +				aspeed,pciecfg = <&pcie_cfg>;
> +				aspeed,pciephy = <&pcie_phy1>;
> +
> +				interrupt-map-mask = <0 0 0 7>;
> +				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +						<0 0 0 2 &pcie_intc0 1>,
> +						<0 0 0 3 &pcie_intc0 2>,
> +						<0 0 0 4 &pcie_intc0 3>;
> +				pcie_intc0: interrupt-controller {
> +					interrupt-controller;
> +					#address-cells = <0>;
> +					#interrupt-cells = <1>;
> +				};
> +			};
> +
>  			gfx: display@1e6e6000 {
>  				compatible = "aspeed,ast2600-gfx", "syscon";
>  				reg = <0x1e6e6000 0x1000>;
> -- 
> 2.43.0
> 

