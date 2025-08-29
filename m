Return-Path: <openbmc+bounces-536-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522AB3BD70
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 16:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD0rS6jKmz2yrX;
	Sat, 30 Aug 2025 00:24:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756477448;
	cv=none; b=PRiHhKNGKiGrFd3kolq30IKtQhte38PB/hpqFnayN46qO1Lsy0+eE7TWUlBiMJ2pzaq/RdimLPuedGUFlMHTN9GfXRRpQCGaEUuTWGT4/f1164mv9fgMVfTgMq/KxfaBMGUwhbJsx3idyAMiQjTbxuBysuGKjG5XUMdXjIhD4Ito9Y/OoTEqw5nArZ20YvHvZxmDi+EjggOZPD8U5F0Y1cx9p68zaMoXQkgPvCM1bLzO8xox6UVJJx47bFz8N3wBD86B0JaYhqN2OwKKH5TIxHoSe3DYgG7sy3j5JuN7WBrV9leqrukklwPVdKdEU9jpITQbKcb+WRlL49dbxItsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756477448; c=relaxed/relaxed;
	bh=mDMR8zABmPJrNIY+WAePSW29oKifUJkqimPBLh6QbRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4wSvRKwjwRVm85S6ofERVU2jXG56RA6MNY2SbvMZmiuLdoqyuur2ncJC76t6N7i+1Og0u2lbsj42ayKGIiiq9SJt1GFmmsl+P4bOtYXn3YiKAg/wzFDWbn39//MN/SHy4a94P5PPAOkPy6COslHWzHkS1ZmDlq+dtJmaBSNyUrCVgTsXGBQNbdFS+m+nWSM4Nzi5iVNc+c4ZHVy9pbq7c42OHQODWIB3pOkMlB7PWITztmbtGp9Nn/Xc2VuS/oHGlEpzM94HkCI5wUTK1Z6M6k5qGeFesa+0eeGP7oXf+HvXQteQqFKWnsnFTHm1TFa/gXssdXo7c1vmarlIQP6sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aeLxV0NO; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aeLxV0NO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD0rR5Xysz2xd6;
	Sat, 30 Aug 2025 00:24:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33AEF43509;
	Fri, 29 Aug 2025 14:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A36DC4CEF0;
	Fri, 29 Aug 2025 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477445;
	bh=gOKw0W5oVOEmVuxyK8bmvoBLFrTievczhzQ6Rvn5Fv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aeLxV0NO8jzpg8NNUvMp61oW9jjB95tvO+6ad46kGE9CQZSZ6vOm5SNLviKNLNHMP
	 xJaWGH1VVoSMNbFI8ZiEAsFd3RRIOI5oqxA1UuDSEaL4/VqsdDsgCf2EiEytkPweDY
	 Xi9zd12NIMkQ54cHIloOnN0MmMdDH0U52QCHkTONLvYKLELQwbYcifFH6NmIVjA0Kl
	 eWGl+y0KLIVH07gAo8T5sx6bZxcmWWGTtQvo6Pa1x0Ekf7aRjJMkKL7SpwOUjL1R+q
	 iVt+pyguH+DOhwiRjoJQ9ISIlk6eDQ2/OrsndYvuBAR/vGemQTEtlNwg5WLg1Te90l
	 h94xxgHWiuFYQ==
Date: Fri, 29 Aug 2025 09:24:03 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, linus.walleij@linaro.org,
	brgl@bgdev.pl, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Message-ID: <20250829142403.GA619692-robh@kernel.org>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
 <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
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
In-Reply-To: <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 29, 2025 at 03:30:28PM +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.

Please explain why you have defined 2 pin controllers and why they 
aren't compatible with each other.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 135 ++++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 452 ++++++++++++++++++
>  2 files changed, 587 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> new file mode 100644
> index 000000000000..8abdc2fe1d8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC0 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |+

What's the '+' for?

> +  The pin controller node should be the child of a syscon node with the
> +  required property:
> +
> +  - compatible: Should be one of the following:
> +                "aspeed,ast2700-scu0", "syscon", "simple-mfd"

This should be a schema in the aspeed,ast2700-scu0 binding, not a 
free-form text description.

> +
> +  Refer to the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml

That does not cover 'simple-mfd' cases.

> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc0-pinctrl
> +
> +additionalProperties:
> +  $ref: pinmux-node.yaml#
> +  additionalProperties: false
> +
> +  properties:
> +    function:
> +      enum:
> +        - EMMC
> +        - VGADDC
> +        - USB3A
> +        - USB2A
> +        - USB3B
> +        - USB2B
> +        - JTAG0
> +        - PCIERC
> +
> +    groups:
> +      enum:
> +        - EMMCG1
> +        - EMMCG4
> +        - EMMCG8
> +        - EMMCWPN
> +        - EMMCCDN
> +        - VGADDC
> +        - USB3AXHD
> +        - USB3AXHPD
> +        - USB3AXH
> +        - USB3AXHP
> +        - USB3AXH2B
> +        - USB3AXHP2B
> +        - USB2AXHD1
> +        - USB2AXHPD1
> +        - USB2AD1
> +        - USB2AXH
> +        - USB2AXHP
> +        - USB2AXH2B
> +        - USB2AXHP2B
> +        - USB2AHPD0
> +        - USB2AD0
> +        - USB2AH
> +        - USB2AHP
> +        - USB3BXHD
> +        - USB3BXHPD
> +        - USB3BXH
> +        - USB3BXHP
> +        - USB3BXH2A
> +        - USB3BXHP2A
> +        - USB2BXHD1
> +        - USB2BXHPD1
> +        - USB2BD1
> +        - USB2BXH
> +        - USB2BXHP
> +        - USB2BXH2A
> +        - USB2BXHP2A
> +        - USB2BHPD0
> +        - USB2BD0
> +        - USB2BH
> +        - USB2BHP
> +        - JTAGM0
> +        - PSP
> +        - SSP
> +        - TSP
> +        - DDR
> +        - USB3A
> +        - USB3B
> +        - PCIEA
> +        - PCIEB
> +        - PCIERC0PERST
> +        - PCIERC1PERST
> +
> +    pins: true

You need to define the type as string or uint32 is possible.

> +    drive-strength:
> +      minimum: 0
> +      maximum: 15
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +     / {
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +          syscon0: syscon@12c02000 {
> +              compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";

Drop the example here and put a complete example in the schema for the 
syscon.

> +              reg = <0x0 0x12c02000 0x0 0x1000>;
> +              ranges = <0x0 0x0 0 0x12c02000 0 0x1000>;
> +              #address-cells = <2>;
> +              #size-cells = <2>;
> +              #clock-cells = <1>;
> +              #reset-cells = <1>;
> +
> +              pinctrl0: pinctrl{
> +                  compatible = "aspeed,ast2700-soc0-pinctrl";
> +
> +                  pinctrl_emmc_default: emmc-default {
> +                      function = "EMMC";
> +                      groups = "EMMCG1";
> +                  };
> +
> +                  pinctrl_emmcclk_driving: emmcclk-driving {
> +                      pins = "AC14";
> +                      drive-strength = <2>;
> +                  };
> +              };
> +          };
> +        };
> diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> new file mode 100644
> index 000000000000..1ee71c6290a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> @@ -0,0 +1,452 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2700 SoC1 Pin Controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |+
> +  The pin controller node should be the child of a syscon node with the
> +  required property:
> +
> +  - compatible: Should be one of the following:
> +                "aspeed,ast2700-scu1", "syscon", "simple-mfd"
> +
> +  Refer to the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-soc1-pinctrl
> +
> +additionalProperties:
> +  $ref: pinmux-node.yaml#
> +  additionalProperties: false
> +
> +  properties:
> +    function:
> +      enum:
> +        - ADC0
> +        - ADC1
> +        - ADC2
> +        - ADC3
> +        - ADC4
> +        - ADC5
> +        - ADC6
> +        - ADC7
> +        - ADC8
> +        - ADC9
> +        - ADC10
> +        - ADC11
> +        - ADC12
> +        - ADC13
> +        - ADC14
> +        - ADC15
> +        - CANBUS
> +        - DDR
> +        - ESPI0
> +        - ESPI1
> +        - FSI0
> +        - FSI1
> +        - FSI2
> +        - FSI3
> +        - FWQSPI
> +        - I2C0
> +        - I2C1
> +        - I2C2
> +        - I2C3
> +        - I2C4
> +        - I2C5
> +        - I2C6
> +        - I2C7
> +        - I2C8
> +        - I2C9
> +        - I2C10
> +        - I2C11
> +        - I2C12
> +        - I2C13
> +        - I2C14
> +        - I2C15
> +        - I3C0
> +        - I3C1
> +        - I3C2
> +        - I3C3
> +        - I3C4
> +        - I3C5
> +        - I3C6
> +        - I3C7
> +        - I3C8
> +        - I3C9
> +        - I3C10
> +        - I3C11
> +        - I3C12
> +        - I3C13
> +        - I3C14
> +        - I3C15
> +        - JTAGM0
> +        - JTAGM1
> +        - LPC0
> +        - LPC1
> +        - LTPI_PS_I2C0
> +        - LTPI_PS_I2C1
> +        - LTPI_PS_I2C2
> +        - LTPI_PS_I2C3
> +        - MDIO0
> +        - MDIO1
> +        - MDIO2
> +        - NCTS5
> +        - NDCD5
> +        - NDSR5
> +        - NRI5
> +        - PCIERC
> +        - PWM0
> +        - PWM1
> +        - PWM2
> +        - PWM3
> +        - PWM4
> +        - PWM5
> +        - PWM6
> +        - PWM7
> +        - PWM8
> +        - PWM9
> +        - PWM10
> +        - PWM11
> +        - PWM12
> +        - PWM13
> +        - PWM14
> +        - PWM15
> +        - QSPI0
> +        - QSPI1
> +        - QSPI2
> +        - RGMII0
> +        - RGMII1
> +        - RMII0
> +        - RMII0RCLKO
> +        - RMII1
> +        - RMII1RCLKO
> +        - SALT0
> +        - SALT1
> +        - SALT2
> +        - SALT3
> +        - SALT4
> +        - SALT5
> +        - SALT6
> +        - SALT7
> +        - SALT8
> +        - SALT9
> +        - SALT10
> +        - SALT11
> +        - SALT12
> +        - SALT13
> +        - SALT14
> +        - SALT15
> +        - SD
> +        - SGMII
> +        - SGPM0
> +        - SGPM1
> +        - SGPS
> +        - SPI0
> +        - SPI0CS1
> +        - SPI1
> +        - SPI1CS1
> +        - SPI2
> +        - SPI2CS1
> +        - SSP
> +        - TACH0
> +        - TACH1
> +        - TACH2
> +        - TACH3
> +        - TACH4
> +        - TACH5
> +        - TACH6
> +        - TACH7
> +        - TACH8
> +        - TACH9
> +        - TACH10
> +        - TACH11
> +        - TACH12
> +        - TACH13
> +        - TACH14
> +        - TACH15
> +        - THRU0
> +        - THRU1
> +        - THRU2
> +        - THRU3
> +        - TSP
> +        - UART0
> +        - UART1
> +        - UART2
> +        - UART3
> +        - UART5
> +        - UART6
> +        - UART7
> +        - UART8
> +        - UART9
> +        - UART10
> +        - UART11
> +        - USB2C
> +        - USB2D
> +        - VPI
> +
> +    groups:
> +      enum:
> +        - ADC0
> +        - ADC1
> +        - ADC2
> +        - ADC3
> +        - ADC4
> +        - ADC5
> +        - ADC6
> +        - ADC7
> +        - ADC8
> +        - ADC9
> +        - ADC10
> +        - ADC11
> +        - ADC12
> +        - ADC13
> +        - ADC14
> +        - ADC15
> +        - CANBUS
> +        - DI2C0
> +        - DI2C1
> +        - DI2C2
> +        - DI2C3
> +        - DI2C8
> +        - DI2C9
> +        - DI2C10
> +        - DI2C11
> +        - DI2C12
> +        - DI2C13
> +        - DI2C14
> +        - DI2C15
> +        - DSGPM0
> +        - ESPI0
> +        - ESPI1
> +        - FSI0
> +        - FSI1
> +        - FSI2
> +        - FSI3
> +        - FWQSPI
> +        - HVI3C0
> +        - HVI3C1
> +        - HVI3C2
> +        - HVI3C3
> +        - HVI3C12
> +        - HVI3C13
> +        - HVI3C14
> +        - HVI3C15
> +        - I2C0
> +        - I2C1
> +        - I2C2
> +        - I2C3
> +        - I2C4
> +        - I2C5
> +        - I2C6
> +        - I2C7
> +        - I2C8
> +        - I2C9
> +        - I2C10
> +        - I2C11
> +        - I2C12
> +        - I2C13
> +        - I2C14
> +        - I2C15
> +        - I3C4
> +        - I3C5
> +        - I3C6
> +        - I3C7
> +        - I3C8
> +        - I3C9
> +        - I3C10
> +        - I3C11
> +        - JTAGM1
> +        - LPC0
> +        - LPC1
> +        - LTPI_PS_I2C0
> +        - LTPI_PS_I2C1
> +        - LTPI_PS_I2C2
> +        - LTPI_PS_I2C3
> +        - MDIO0
> +        - MDIO1
> +        - MDIO2
> +        - NCTS0
> +        - NCTS1
> +        - NCTS5
> +        - NCTS6
> +        - NDCD0
> +        - NDCD1
> +        - NDCD5
> +        - NDCD6
> +        - NDSR0
> +        - NDSR1
> +        - NDSR5
> +        - NDSR6
> +        - NDTR0
> +        - NDTR1
> +        - NDTR5
> +        - NDTR6
> +        - NRI0
> +        - NRI1
> +        - NRI5
> +        - NRI6
> +        - NRTS0
> +        - NRTS1
> +        - NRTS5
> +        - NRTS6
> +        - PE2SGRSTN
> +        - PWM0
> +        - PWM1
> +        - PWM2
> +        - PWM3
> +        - PWM4
> +        - PWM5
> +        - PWM6
> +        - PWM7
> +        - PWM8
> +        - PWM9
> +        - PWM10
> +        - PWM11
> +        - PWM12
> +        - PWM13
> +        - PWM14
> +        - PWM15
> +        - QSPI0
> +        - QSPI1
> +        - QSPI2
> +        - RGMII0
> +        - RGMII1
> +        - RMII0
> +        - RMII0RCLKO
> +        - RMII1
> +        - RMII1RCLKO
> +        - RXD0
> +        - RXD1
> +        - RXD2
> +        - RXD3
> +        - RXD5
> +        - RXD6
> +        - RXD7
> +        - RXD8
> +        - RXD9
> +        - RXD10
> +        - RXD11
> +        - SALT0
> +        - SALT1
> +        - SALT2
> +        - SALT3
> +        - SALT4
> +        - SALT5
> +        - SALT6
> +        - SALT7
> +        - SALT8
> +        - SALT9
> +        - SALT10
> +        - SALT11
> +        - SALT12
> +        - SALT13
> +        - SALT14
> +        - SALT15
> +        - SD
> +        - SGMII
> +        - SGPM0
> +        - SGPM1
> +        - SGPS
> +        - SPI0
> +        - SPI0CS1
> +        - SPI1
> +        - SPI1CS1
> +        - SPI2
> +        - SPI2CS1
> +        - TACH0
> +        - TACH1
> +        - TACH2
> +        - TACH3
> +        - TACH4
> +        - TACH5
> +        - TACH6
> +        - TACH7
> +        - TACH8
> +        - TACH9
> +        - TACH10
> +        - TACH11
> +        - TACH12
> +        - TACH13
> +        - TACH14
> +        - TACH15
> +        - THRU0
> +        - THRU1
> +        - THRU2
> +        - THRU3
> +        - TXD0
> +        - TXD1
> +        - TXD2
> +        - TXD3
> +        - TXD5
> +        - TXD6
> +        - TXD7
> +        - TXD8
> +        - TXD9
> +        - TXD10
> +        - TXD11
> +        - USB2CD
> +        - USB2CH
> +        - USB2CU
> +        - USB2CUD
> +        - USB2DD
> +        - USB2DH
> +        - VPI
> +
> +    pins: true
> +    bias-disable: true
> +    bias-pull-up: true
> +    bias-pull-down: true
> +    drive-strength:
> +      minimum: 0
> +      maximum: 3
> +    power-source:
> +      enum: [1800, 3300]
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +     / {
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +          syscon1: syscon@14c02000 {
> +              compatible = "aspeed,ast2700-scu1", "syscon", "simple-mfd";
> +              reg = <0x0 0x14c02000 0x0 0x1000>;
> +              ranges = <0x0 0x0 0x0 0x14c02000 0x0 0x1000>;
> +              #address-cells = <2>;
> +              #size-cells = <2>;
> +              #clock-cells = <1>;
> +              #reset-cells = <1>;
> +
> +              pinctrl1: pinctrl {
> +                  compatible = "aspeed,ast2700-soc1-pinctrl";
> +
> +                  pinctrl_hvi3c0_default: hvi3c0-default {
> +                      function = "I3C0";
> +                      groups = "HVI3C0";
> +                  };
> +
> +                  pinctrl_i3c0_3_hv_voltage: i3chv-voltage {
> +                      pins = "U25";
> +                      power-source = <1800>;
> +                  };
> +
> +                  pinctrl_i3c0_driving: i3c0-driving {
> +                      pins = "U25", "U26";
> +                      drive-strength = <2>;
> +                  };
> +              };
> +          };
> +      };
> -- 
> 2.25.1
> 

