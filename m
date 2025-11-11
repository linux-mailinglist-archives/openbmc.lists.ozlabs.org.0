Return-Path: <openbmc+bounces-866-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185AC4C338
	for <lists+openbmc@lfdr.de>; Tue, 11 Nov 2025 08:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5JlM73vGz3fQv;
	Tue, 11 Nov 2025 18:56:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762847807;
	cv=none; b=nl8a6ddSc0TIpdxe2FvJvRmnFvy172q7UGKrb7akPzgMYNAZ51nDO3TQKWFHE6iZa9xwPPqzk40BUP93u3NVcLxXb8g8CdyHuJx/VVGHbLFt9ySm8D+EbKmly38RWV3JYiX/owKWb4i85W9vP/FplGnipBQIE3nrpez+wY4K4o0Z0xpFEYJlpX1cpGWWBk/MrQ/eEIMCI4c1jJDiD34YI8FY/Y86QbJ1zk50sE461PeyxzFlEKdhubQuaVNbbDC+kNx4VK/Tr7iU6aju+I3RAy+2wCj+kXEbtSMyaXGcW9+jXA+pgRudU5Y+0iXWwSUQRQ/U0O4Qi+s4J+CBZ5NHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762847807; c=relaxed/relaxed;
	bh=xeAsxYNqNSvdctebhieV4wnGz2Z7c+tA2gyGTo90+0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgoJhlpCY+UyLBLJpJ2auxqWFTHcz/o250i54OjnR1VOLeknGaZhM8UenaH1pvsM29a9iouh/dOzzDy3AYiRsGm1IRpdwaqQp30yYZK98CaPK1BihkuEiaL619h+HR4eoyZZxnc4Q+4RgGzFjEnKMSETaCGewJUu6m9Ew8sjXAQxHOlbYiQOEpNHEo3+3jsdYrw76I77BgxREpE526o8XkJnwooxAC5Syp6uZ0L3jpPf5W1TuyNwJeddFAvRK33oYL6u5MzUN6VS2ZzuJTzZx5kR02meDkCrosO9wAWAyQXnCVMw+b24tN+7qekqTCDIeiz+tA3YdBFWdVdNM8jONg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=evobaaN3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=evobaaN3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5JlL4xN0z3fDq
	for <openbmc@lists.ozlabs.org>; Tue, 11 Nov 2025 18:56:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4045661903;
	Tue, 11 Nov 2025 07:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80079C116B1;
	Tue, 11 Nov 2025 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847803;
	bh=oF1keJKwYhxvaP6NJqrA6M6U0gmqXpD9wpQKVAj8/Ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evobaaN3/pr/xTyRkmYEEXDtrMENl8k/Br+y8LvTdXX0jV4r9Od10ACdXFboqHx4F
	 73a0zmoeV7nnlzpvy04lDwNf9Iha4eNANDeIt3N8MJidzY5ZjvvVJyrdkx+D5HD1pW
	 4dN+wwkJhfjNAaHFPtLdysLATbpyT80cIKZtq1RlZvc0PiTVYlXCiGEOo3aFkqUXwH
	 YLqENrDxNSRslZ50kGGTpPlt3ABavQF/f7oWFL/76qtWsyl1eMUa5iS9Fh8xz/Y6rD
	 BbU0ixMvr8vNo4SCDWW2oVfoG5RtaWJ0mYrNfqDa/5RWGVG3P1Ru7vSphlHVlu5CyT
	 NrcFQ4uIKcVFg==
Date: Tue, 11 Nov 2025 08:56:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	broonie@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: spi: Convert nuvoton,npcm-pspi to DT
 schema
Message-ID: <20251111-bouncy-mahogany-skylark-c4ba1d@kuoka>
References: <20251110081457.1008316-1-tmaimon77@gmail.com>
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
In-Reply-To: <20251110081457.1008316-1-tmaimon77@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 10:14:57AM +0200, Tomer Maimon wrote:
> Convert the Nuvoton NPCM PSPI binding to DT schema format.
> Remove the clock-name property since it is not used.

clock-name or clock-names? I clearly see the clock-names used in DTS, so
your commit msg is not correct.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/spi/nuvoton,npcm-pspi.txt        | 36 ----------
>  .../bindings/spi/nuvoton,npcm-pspi.yaml       | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> deleted file mode 100644
> index a4e72e52af59..000000000000
> --- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Nuvoton NPCM Peripheral Serial Peripheral Interface(PSPI) controller driver
> -
> -Nuvoton NPCM7xx SOC support two PSPI channels.
> -
> -Required properties:
> - - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.
> -				"nuvoton,npcm845-pspi" for Arbel NPCM8XX.
> - - #address-cells : should be 1. see spi-bus.txt
> - - #size-cells : should be 0. see spi-bus.txt
> - - specifies physical base address and size of the register.
> - - interrupts : contain PSPI interrupt.
> - - clocks : phandle of PSPI reference clock.
> - - clock-names: Should be "clk_apb5".
> - - pinctrl-names : a pinctrl state named "default" must be defined.
> - - pinctrl-0 : phandle referencing pin configuration of the device.
> - - resets : phandle to the reset control for this device.
> - - cs-gpios: Specifies the gpio pins to be used for chipselects.
> -            See: Documentation/devicetree/bindings/spi/spi-bus.txt
> -
> -Optional properties:
> -- clock-frequency : Input clock frequency to the PSPI block in Hz.
> -		    Default is 25000000 Hz.

You dropped this property. Every change done in the conversion needs to
be documented in the commit msg with explanation WHY.

> -
> -spi0: spi@f0200000 {
> -	compatible = "nuvoton,npcm750-pspi";
> -	reg = <0xf0200000 0x1000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pspi1_pins>;
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&clk NPCM7XX_CLK_APB5>;
> -	clock-names = "clk_apb5";
> -	resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>
> -	cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> -};
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
> new file mode 100644
> index 000000000000..65ad40292408
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/nuvoton,npcm-pspi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Peripheral SPI (PSPI) Controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +description:
> +  Nuvoton NPCM Peripheral Serial Peripheral Interface (PSPI) controller.
> +  Nuvoton NPCM7xx SOC supports two PSPI channels.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-pspi # Poleg NPCM7XX
> +      - nuvoton,npcm845-pspi # Arbel NPCM8XX
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: PSPI reference clock.
> +
> +  resets:
> +    maxItems: 1
> +    description: PSPI module reset.

Drop description.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
> +    spi0: spi@f0200000 {
> +        compatible = "nuvoton,npcm750-pspi";
> +        reg = <0xf0200000 0x1000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pspi1_pins>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clk NPCM7XX_CLK_APB5>;
> +        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_PSPI1>;
> +        cs-gpios = <&gpio6 11 0x1>;

Use proper GPIO defines for flags.

Best regards,
Krzysztof


