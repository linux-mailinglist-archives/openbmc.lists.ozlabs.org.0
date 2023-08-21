Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD1782F25
	for <lists+openbmc@lfdr.de>; Mon, 21 Aug 2023 19:10:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vge6KqFf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTzWJ29qNz3bV4
	for <lists+openbmc@lfdr.de>; Tue, 22 Aug 2023 03:10:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vge6KqFf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=a38r=eg=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTzVj6Nncz2ymM
	for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2023 03:09:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AFCB64002;
	Mon, 21 Aug 2023 17:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D7EC433C7;
	Mon, 21 Aug 2023 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692637783;
	bh=0EvABdbJ4Z1kB1jX+ziLiwThb3n8YOIfz/SX5RXeABk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vge6KqFftqBke0o1C5n4H2cW6VBEMbWNC40xHsm8PCygFV5LGjDHi4KDU99TfKJHm
	 SxR2zIm7B+3gPXBedVlGHl49b6wtsf/g1AbJJNlBFvBC/UYXk4BXEGij/195g8ZtTJ
	 0NX6M0IwPqbTPxW3G9Z0UyfQBfKA10hiYWrxknccQxkjDa32M34+DSbPeV5WM3z5jq
	 uNWnk29yQevNKwYeqIxt/b32ZM4R4vAlmEOG625DOQQikNExVY4zZHNk/vYS/JlRt8
	 YmLikXOcQolpBl5bkTi+3LzM1glGyq5O48E86Apsv12+6v4nHhVnwwYDtzrdhxAGWK
	 prV/QaRqv9o1Q==
Received: (nullmailer pid 1961401 invoked by uid 1000);
	Mon, 21 Aug 2023 17:09:41 -0000
Date: Mon, 21 Aug 2023 12:09:41 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH RESEND v5 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl
 and GPIO documentation
Message-ID: <20230821170941.GA1915730-robh@kernel.org>
References: <20230809185722.248787-1-tmaimon77@gmail.com>
 <20230809185722.248787-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809185722.248787-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 09, 2023 at 09:57:21PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> pinmux and GPIO controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 215 ++++++++++++++++++
>  1 file changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> new file mode 100644
> index 000000000000..8a12f5134450
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> @@ -0,0 +1,215 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/nuvoton,npcm845-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM845 Pin Controller and GPIO
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description:
> +  The Nuvoton BMC NPCM8XX Pin Controller multi-function routed through
> +  the multiplexing block, Each pin supports GPIO functionality (GPIOx)
> +  and multiple functions that directly connect the pin to different
> +  hardware blocks.
> +
> +properties:
> +  compatible:
> +    const: nuvoton,npcm845-pinctrl
> +
> +  ranges:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to access GCR registers.
> +
> +patternProperties:
> +  '^gpio@':
> +    type: object
> +
> +    description:
> +      Eight GPIO banks that each contain 32 GPIOs.
> +
> +    properties:
> +      gpio-controller: true
> +
> +      '#gpio-cells':
> +        const: 2
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - gpio-controller
> +      - '#gpio-cells'
> +      - reg
> +      - interrupts
> +      - gpio-ranges
> +
> +  '-mux$':
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      groups:
> +        description:
> +          One or more groups of pins to mux to a certain function
> +        items:
> +          enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> +                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
> +                  smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
> +                  smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
> +                  spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
> +                  spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
> +                  bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
> +                  r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
> +                  fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
> +                  fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
> +                  pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
> +                  ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
> +                  smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
> +                  sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
> +                  mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
> +                  scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
> +                  spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
> +                  smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
> +                  spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
> +                  hgpio5, hgpio6, hgpio7 ]
> +
> +      function:
> +        description:
> +          The function that a group of pins is muxed to
> +        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
> +                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
> +                smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
> +                smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
> +                spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
> +                spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
> +                bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
> +                r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
> +                fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
> +                fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
> +                pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
> +                ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
> +                smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
> +                sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
> +                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
> +                scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
> +                spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
> +                smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
> +                spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
> +                hgpio5, hgpio6, hgpio7 ]
> +
> +    dependencies:
> +      groups: [ function ]
> +      function: [ groups ]
> +
> +    additionalProperties: false
> +
> +  '^pin':
> +    $ref: pincfg-node.yaml#
> +
> +    properties:
> +      pins:
> +        description:
> +          A list of pins to configure in certain ways, such as enabling
> +          debouncing
> +
> +      bias-disable: true
> +
> +      bias-pull-up: true
> +
> +      bias-pull-down: true
> +
> +      input-enable: true
> +
> +      output-low: true
> +
> +      output-high: true
> +
> +      drive-push-pull: true
> +
> +      drive-open-drain: true
> +
> +      input-debounce:
> +        description:
> +          Debouncing periods in microseconds, one period per interrupt
> +          bank found in the controller
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 4
> +
> +      slew-rate:
> +        description: |
> +          0: Low rate
> +          1: High rate
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +
> +      drive-strength:
> +        enum: [ 0, 1, 2, 4, 8, 12 ]
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - ranges
> +  - '#address-cells'
> +  - '#size-cells'
> +  - nuvoton,sysgcr
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pinctrl: pinctrl@f0800260 {
> +        compatible = "nuvoton,npcm845-pinctrl";
> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        nuvoton,sysgcr = <&gcr>;
> +
> +        gpio0: gpio@f0010000 {

unit-address should be 0.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          reg = <0x0 0xB0>;
