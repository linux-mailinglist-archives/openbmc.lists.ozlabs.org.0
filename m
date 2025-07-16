Return-Path: <openbmc+bounces-357-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3324B07065
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 10:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhpwt3QZNz30T8;
	Wed, 16 Jul 2025 18:23:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752654222;
	cv=none; b=KXAr4xTqheVvEYdAytSgMy0bDK/5/Y6LezfzXmHE8SF4FPwff9N/s0SZ76NEww0LJgxXdd9pHmk+L9LW8QFUig9sR1B8DUVhhScpW8FwvghJBVLnvHY7+pSSQLmK1l3svQtidfjlFur3kcPVPDb4EeEGu0I99oYg2qAYPT4Du7UZ9gCtj2Jl1fCxcBTLGiafBEJUb19NezTkPTgfQkV+hPmuBX5UWVZ3BdOmKbQHWCHWCLZJSStn0+o3gKDECJAlywMw9cp6W1YUcXzAT7iDFcDTD2wl2ct1R2jRQo8fy+yM9k2jJXbsQIeH1Bm2bA842iuipo2mm9d5h/MPZ1aDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752654222; c=relaxed/relaxed;
	bh=zMqIeYsdByrg0V4XfdLCEiDMy3FizptbIRYnCCNLKvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaPheWv7wwa5esQU1tyC6ZdQWyoZTU9gSRll5L1oZF647H2Lr8R1hal53M0KH36gBO0Bd2NHyixpC1bYaz+uPAU5koVwbFEXJ1Juc18QxwFgs8CQ5VsUzKLB0/umMyHVUjNmpb9G3Z5GnE01h+EagJNJdKHHsB4/PsKZvdK/32cxMB+3cssfIDmWRwjMWjFm6u8p+OzE89eGg1IEyfL1N9wphzrKpMUoFe3HDAtx8gMaPw2X62MYFupEt1C7TBMdZRJ6/VG7ku240q7fEX6Uqqd4957BKFn4GZdTZruzT5S22frFnwQHOL+ZUZ4qCizu/di4nJ4sQ4G6yj+SJpTh5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OsuSqHmD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OsuSqHmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhpws3938z2xd6;
	Wed, 16 Jul 2025 18:23:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FCFD5C5674;
	Wed, 16 Jul 2025 08:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6F9C4CEF0;
	Wed, 16 Jul 2025 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654218;
	bh=cp2m1cQPpeNT2d53wsl0tGzY5ODL2sh/xGBe89ivRr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsuSqHmDg5QaUkjKR88pXkBRjXFiGTJmpqIR2xTr5Z9U1Ok9P/L5vM+a06yTG3toz
	 at3wk0tkzeoEdt0BukhNBUIqcbPqs732/P+an+XUDciRV3hHnaPzyNPpyHmN8OXYWc
	 BfRruYWHr+/kBdTkHGaGdfGb+meDtFsBpDNxR8r2f82JlPhK7gakGM2tsl+l0OjIcU
	 sPZL6T47LdaQ43C70ikZe6EPoBxS36V78shXEYhmf5W5W03iRjAkjgrj8TRd3Atm+c
	 WmPx1C5+9MA91F/pTTKGPiALFC+YTLSWiyrLEBh89IIL12Ks8wyLQ+BJCGLvU8rGQb
	 MpkLR0taXi9CA==
Date: Wed, 16 Jul 2025 10:23:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 02/10] dt-bindings: soc: aspeed: Add ASPEED PCIe PHY
 support
Message-ID: <20250716-innocent-satisfied-pug-9ecc15@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 11:43:12AM +0800, Jacky Chou wrote:
> This PHY is used by many modules. In our design, our
> PCIe has RC and EP funcitons. On the different function,
> each driver will use configure and get some information
> from the PHY interface to do somting that it wants to.
> Getting link status, setting syscon credits and so on.
> Therefore, define it as syscon for all modules.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/soc/aspeed/aspeed,pcie-phy.yaml  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml

Phys go to phy, not soc directory. Soc is not a dumping ground.

> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
> new file mode 100644
> index 000000000000..5fa585d63ca6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/aspeed/aspeed,pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED PCIe PHY
> +
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description:
> +  The ASPEED PCIe PHY provides the physical layer interface for PCIe
> +  controllers in the SoC. This node represents the register block for the PCIe
> +  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
> +  via syscon. It is used to configure and get the status of the PCIe PHY
> +  hardware, including power management, link training, and other PHY-specific
> +  operations.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,pcie-phy

No, see writing bindings.

> +      - const: syscon

It's not a syscon, but phy. I don't think you understood previous
feedback. Go back to v1. You just send something to pass the review
instead of reworking to make it correct.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@1e6ed200 {

wrong name, that's a phy

> +      compatible = "aspeed,pcie-phy", "syscon";
> +      reg = <0x1e6ed200 0x100>;

Incomplete

> +    };
> -- 
> 2.43.0
> 

