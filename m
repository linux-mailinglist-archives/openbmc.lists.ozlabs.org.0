Return-Path: <openbmc+bounces-829-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CFC17301
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 23:25:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx4h16trfz304x;
	Wed, 29 Oct 2025 09:25:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761659208;
	cv=none; b=HiERoQQ7rHQVIhdyIqQNnz/uUas9DMQ7Ezkaa4TV59r3LKBo5mjk/mXHrfVL2TtgJpX6PTjDbG8XGUmZy4VGiHC7dkn452WNy7WJvZ65OxrQ3VVOyuOtbKVnQvWkPWZsOAylMv5VuZsX/T5epBKU7OPGtEkufigBHvNAFP6Gpn9+jzE6MCwBi6QdBKF6otSOi+aIfhBC4eVIhsX/I4il9ASFKEjS8gNPO3cXka4qHawKPFdl5XKKnnW7VE1KLD3QA/aIdGcl83VIuzZ7kJZKuo+5CB3eZ2cTlpLceA6qw9USBwZcaj13cJxbSOU3P3VdrpHoE1QZKhdWDQdIZ8qiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761659208; c=relaxed/relaxed;
	bh=DzKeKz377bw+AjGXtS7hvPLMXs0p4OIhaxJNCl5JKj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HayD4X+STdhfAeckVXGLLQoijJey4WtdI0IN3BLjmug2xR4JmXSDuLBT11u4KqCiFg1zeoXKIG0x4QezYohyaILeBD8TUKPVeKwznbiN9Hw6l89yfD1L/jNbBc6T34Vzft2BAxLCHf4UzOEPPNxtIB5ObDRH7YOFpyt2YNl3w3X4biNOJk8fB5zs7kbu3j/bp0OfkVdiwNDaCiSwH2ghQG0IL3pHNWsnkHZShjMVuiRPToN68dCBqQ3FORbjzfdIxuwcVI0JxOKF/n6l65q3QwcuDWyqlZsT+n547f/s4sbBBHvolD/vbwX3JRY3r7gI5VWuxREy850CV8RjJhZkIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyngrGjL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HyngrGjL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cws9g5rC7z3dBZ;
	Wed, 29 Oct 2025 00:46:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4F5660398;
	Tue, 28 Oct 2025 13:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4601DC116C6;
	Tue, 28 Oct 2025 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659205;
	bh=gHTXG47ZT83HtioVGkOdOgeWLg99afniblJgeCrheGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HyngrGjLb54dCOStOExNIW8Y0NWfQzBXP7/lfZg2CrXY7+IMVLq42u0PG+z1cEhOL
	 M9rvJLEAEy7zeEAWnuV/unlMTMS3/MUsv0ix70sVbD2swTqZWjJ73oXB/FnRpo6ibM
	 5estbSa3g/FRLspY7MtCd9VANbOrV9/5esg2D/G+7NIUhmjdRsQO8xY/aVRcPYRGXb
	 X/UIMn6YkUr50ydC9753IDyWw8dnp67i7nUJy9ediQGszIl+HEj5mZ17iKfEPbiCQI
	 yV1LFP3RB+1kFvEmWfqvRVyp0cXJ70Zaz3/Whr5ecoe3Wqctp9aXbfY9yaLyAIIFK6
	 M+094b4nEUMzQ==
Date: Tue, 28 Oct 2025 08:46:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <20251028134644.GA1506590@bhelgaas>
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
In-Reply-To: <20251027095825.181161-3-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 05:58:18PM +0800, Jacky Chou wrote:
> ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> port to connect to PCIe device. And also have Mem, I/O access, legacy
> interrupt and MSI.

> +description:
> +  The ASPEED PCIe Root Complex controller provides PCI Express Root Complex
> +  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
> +  This controller enables connectivity to PCIe endpoint devices, supporting
> +  memory and I/O windows, MSI and legacy interrupts, and integration with
> +  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the PCIe Root
> +  Port device number is always 8.

s/legacy/INTx/

> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pcie
> +      - aspeed,ast2700-pcie
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +    description: IntX and MSI interrupt

s/IntX/INTx/

> +    pcie0: pcie@1e770000 {
> +      compatible = "aspeed,ast2600-pcie";
> +      device_type = "pci";
> +      reg = <0x1e770000 0x100>;
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +      bus-range = <0x00 0xff>;
> +
> +      ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
> +                0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
> +
> +      resets = <&syscon ASPEED_RESET_H2X>;
> +      reset-names = "h2x";
> +      pinctrl-0 = <&pinctrl_pcierc1_default>;
> +      pinctrl-names = "default";
> +
> +      #interrupt-cells = <1>;
> +      msi-controller;
> +
> +      aspeed,ahbc = <&ahbc>;
> +
> +      interrupt-map-mask = <0 0 0 7>;
> +      interrupt-map = <0 0 0 1 &pcie_intc0 0>,
> +                      <0 0 0 2 &pcie_intc0 1>,
> +                      <0 0 0 3 &pcie_intc0 2>,
> +                      <0 0 0 4 &pcie_intc0 3>;
> +      legacy-interrupt-controller {
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #interrupt-cells = <1>;
> +      };

IIUC, Rob says there's no need for a separate interrupt-controller
stanza and it can be directly in the host bridge [1].

I think that does make interrupt-map a little more verbose because the
parent unit address will use the host bridge #address-cells (3)
instead of the interrupt controller #address-cells (0), e.g., this
from [2]:

  pcie@10e40000 {
      compatible = "renesas,r9a08g045-pcie";
      #address-cells = <3>;
      #interrupt-cells = <1>;
      interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
                      <0 0 0 2 &pcie 0 0 0 1>, /* INTB */
                      <0 0 0 3 &pcie 0 0 0 2>, /* INTC */
                      <0 0 0 4 &pcie 0 0 0 3>; /* INTD */

[1] https://lore.kernel.org/linux-pci/20250509204905.GA4080349-robh@kernel.org/
[2] https://lore.kernel.org/linux-pci/20251007133657.390523-2-claudiu.beznea.uj@bp.renesas.com/

