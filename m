Return-Path: <openbmc+bounces-294-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9AAE8FD7
	for <lists+openbmc@lfdr.de>; Wed, 25 Jun 2025 23:05:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSDq32nSNz30BG;
	Thu, 26 Jun 2025 07:05:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750885503;
	cv=none; b=kli0NBPnh2gY0E0vbqgm6UJwI8FlVR3ELxWKq/Hu8OvQ7qPzVu4P9hyqBSqBDztl5b9gX48O5XTOyO1xFm9H06DqzLS2r1cx0kaD5WZnd5px7TYfTazWJbfin7DxotnEAXcqo4XARq4fVcpHVXUD/dfjggzRufcMiK+/Fn5jgYat6WWwjUD2YkmH78BxzdxkMCLY5n92vLx5ECHSbNwaDUq8VLnmCaoHJ2FpZ2CNVpV5E8xrNPmeWzeEU3itVq13x6VW9J4gOktNbQ5pdDntQwmqE4UNywvevO7UMg52xxMHGvMYwC132S0V+Qz3/O2cVP9svkOmsaVxrjjRN0fDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750885503; c=relaxed/relaxed;
	bh=xVaMRohSFRgmSbPZ4apQogUHqXg6LrB2kywGldJUPUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cg7jCI6+VtFMk6dTTtoR2WU1fZ9j1oW+NphDhkuXAMZCEScp5tTxYRqU35eHM67NwEiDXC818sCTsQrl2vgSZ6BAFps2lC1axri6/cHJjN4QI/rRgeJDqjQ0+jgtU0KvDzYcI5FUWTuuRRAASBwDyp8NiKgGaGIpPXEWEq4OBYluyA2KKjP+HvQwv3FGtDdzoIAg0zcJSUK3GIz9stH8N8zIkWEhhKnZSsdLMIujF4Z1e44qMuuTOIOmpfDcfPiHNUF89hy/ussccYkWklMwhXNrZxgiuOUoIOO7x/GX/mlc+jsANCIOgFDuRYb1Eot5B+e1yvloqlctmRcH4SFONQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcsXt6oS; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fcsXt6oS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSDq20h5Gz307q;
	Thu, 26 Jun 2025 07:05:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 648325C5D32;
	Wed, 25 Jun 2025 21:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDAFC4CEEA;
	Wed, 25 Jun 2025 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750885497;
	bh=TwGs9xcqNKKZwXveR38XoItJjJjoTUCut41NngfDuik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcsXt6oS90PgQatLapdwcdjg5ia5EOeRBAAxyHyXaqEq509DGgKqAH4YB16oiKVbi
	 gCHFaQ6danRokdU3VaXQHaDBpqN/4H24MIIog8UlfyAJYxnzu99ooq2/0+YXRDMXjk
	 a9h+XgpAz6LVGHwkYUTGPmFSqAw6Rfoq3exAjLjg2aU6Zz53xULEhZAIRc0t8jhoT9
	 keXTLpmUQpCKAziaUZLLNRHIFLP9x6Qp6neDgp5c2sLkHaPj7K9hMh7DOMSGfE1WEI
	 Dn4XES7ca5/ZSM6IXyhhIwbx4CwW+gZ1caGsKqpyzW1G/Hnkz0ubIxFbpmYQvQhnkv
	 O3QPMeeYOd9Og==
Date: Wed, 25 Jun 2025 16:04:56 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	elbadrym@google.com, romlem@google.com, anhphan@google.com,
	wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 3/7] dt-bindings: pci: Add document for ASPEED PCIe RC
Message-ID: <20250625210456.GA2177479-robh@kernel.org>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250613033001.3153637-4-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 11:29:57AM +0800, Jacky Chou wrote:
> Add device tree binding documentation for the ASPEED PCIe Root Complex
> controller. This binding describes the required and optional properties
> for configuring the PCIe RC node, including support for syscon phandles,
> MSI, clocks, resets, and interrupt mapping. The schema enforces strict
> property validation and provides a comprehensive example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pci/aspeed-pcie.yaml  | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> new file mode 100644
> index 000000000000..5b50a9e2d472
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/aspeed-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED PCIe Root Complex Controller
> +
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description: |
> +  Device tree binding for the ASPEED PCIe Root Complex controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-pcie
> +      - aspeed,ast2700-pcie
> +
> +  device_type:
> +    const: pci
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interrupts:
> +    description: IntX and MSI interrupt
> +
> +  resets:
> +    items:
> +      - description: Module reset
> +      - description: PCIe PERST
> +
> +  reset-names:
> +    items:
> +      - const: h2x
> +      - const: perst
> +
> +  msi-parent: true
> +
> +  msi_address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: MSI address

What's this for?

> +
> +  aspeed,ahbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED AHBC syscon.
> +
> +  aspeed,pciecfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED PCIe configuration syscon.
> +
> +  aspeed,pciephy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to ASPEED PCIe PHY syscon.

Use the phy binding and make the phy control a separate driver.

Rob

