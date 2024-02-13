Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA9853E98
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 23:28:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JGYwGyrX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZGFc4Ry9z3dWC
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 09:28:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JGYwGyrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZGDw0CqYz3brZ;
	Wed, 14 Feb 2024 09:28:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53BE8614CD;
	Tue, 13 Feb 2024 22:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C7C433C7;
	Tue, 13 Feb 2024 22:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707863291;
	bh=oFFuZOUNHSicGqYZMLonLDDYLy/GpUY8EBDB1WTG0es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGYwGyrXK0nZVTCamXE68PrmsELblm6cb8mI3mbXPZc25oIOSYbHIWJoHI51r7Vn3
	 TsCNlOmBf2Hr9SQCZzeHfyBJlackDsH7UzciNBg0CANB3tAk7ds4Ue0VTyOQHCUbKK
	 jhNqA0EcAEftZD4goOrxFg6NJU/4a79BHiGCcTvWTdY4YBjVst8sfWyS3RibS3sCIO
	 gmfkzc/KkApqmTn1NKZF6W8R2y9dds7mKR+skzNlXlIOfAjwrVrg25PApvx5eLsEdo
	 Dtufo9gsq9TAGe/CpwxVRE3DV0DhYTTwFC4SphIJPic5hhMp4gJRLyqaS7TxOL3ZOt
	 VlqZKTej1QzQg==
Date: Tue, 13 Feb 2024 16:28:08 -0600
From: Rob Herring <robh@kernel.org>
To: Manojkiran Eda <manojkiran.eda@gmail.com>
Subject: Re: [PATCH] Add eSPI device driver (flash channel)
Message-ID: <20240213222808.GA2490812-robh@kernel.org>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, zev@bewilderbeest.net, Ryan Chen <ryan_chen@aspeedtech.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Richard Weinberger <richard@nod.at>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, jk@codeconstruct.com.au, openbmc@lists.ozlabs.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 08:06:08PM +0530, Manojkiran Eda wrote:
> This patch adds the driver support for the eSPI controller of
> Aspeed 5/6th generation SoCs. This controller is a slave device
> communicating with a master over Enhanced Serial Peripheral
> Interface (eSPI).
> 
> eSPI supports 4 channels, namely peripheral, virtual wire,
> out-of-band, and flash, and operates at max frequency of 66MHz.
> 
> But at the moment, this patch set only supports the flash channel.

You're not going to need binding changes to add support for those, 
right?

> 
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> ---
> Hello everyone,
> 
> I'm presenting a revised version of the eSPI device driver patch series found at the following link:
> 
> https://lore.kernel.org/openbmc/20220516005412.4844-1-chiawei_wang@aspeedtech.com/ 
> 
> This update addresses the issues identified during the review process.
> 
> While the previous patch series attempted to incorporate support for all four different channels of eSPI,
> this new series focuses on upstreaming the flash channel initially, ensuring that all review comments are
> duly addressed, before progressing further.
> 
> Results:
> 
> Successfully conducted a flash update via eSPI.
> 
> Note:
> 
> This marks my inaugural endeavor in contributing code to the kernel subsystem. I kindly request reviewers
> to incorporate as many details as possible in the review comments.

Please start with submitting-patches.rst and the DT specific version of 
that.

> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml       | 125 ++++++

This should be a separate patch. checkpatch.pl will tell you this and 
other things.

Filename should match compatible.

>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |  16 +-

This is another patch.

>  drivers/mtd/mtdcore.c                              |   2 +-

Yet another patch. But really, this one will be rejected most likely 
unless you can justify why it is needed.

>  drivers/soc/aspeed/Kconfig                         |  10 +
>  drivers/soc/aspeed/Makefile                        |   3 +
>  drivers/soc/aspeed/aspeed-espi-ctrl.c              | 197 +++++++++
>  drivers/soc/aspeed/aspeed-espi-ctrl.h              | 169 ++++++++
>  drivers/soc/aspeed/aspeed-espi-flash.c             | 466 +++++++++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-flash.h             |  45 ++
>  include/uapi/linux/espi/aspeed-espi-ioc.h          | 103 +++++

Your own interface to userspace is probably not going to be accepted 
either.

>  10 files changed, 1134 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> new file mode 100644
> index 000000000000..6521a351d18d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2021 Aspeed Technology Inc.

It's 2024 now.

> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/aspeed/espi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Aspeed eSPI Controller
> +
> +maintainers:
> +  - Manojkiran Eda <manojkiran.eda@gmail.com>
> +  - Patrick Rudolph <patrick.rudolph@9elements.com>
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +description:
> +  Aspeed eSPI controller implements a slave side eSPI endpoint device

s/slave/device/

> +  supporting the four eSPI channels, namely peripheral, virtual wire,
> +  out-of-band, and flash.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2500-espi
> +          - aspeed,ast2600-espi
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
> +  "^espi-ctrl@[0-9a-f]+$":
> +    type: object

Is this really a separate sub-block? As in could it be reused somewhere 
else or in a different combination of blocks?

> +
> +    description: Control of the four basic eSPI channels
> +
> +    properties:
> +      compatible:
> +        items:
> +          - enum:
> +              - aspeed,ast2500-espi-ctrl
> +              - aspeed,ast2600-espi-ctrl
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clocks:
> +        maxItems: 1
> +
> +      flash,dma-mode:
> +        type: boolean
> +        description: Enable DMA support for eSPI flash channel
> +
> +      flash,safs-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1, 2 ]
> +        default: 0
> +        description: Slave-Attached-Sharing-Flash mode, 0->Mix, 1->SW, 2->HW
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - clocks
> +
> +  "^espi-mmbi@[0-9a-f]+$":
> +    type: object

Is this really a separate sub-block?

> +
> +    description: Control of the PCH-BMC data exchange over eSPI peripheral memory cycle
> +
> +    properties:
> +      compatible:
> +        const: aspeed,ast2600-espi-mmbi
> +
> +      interrupts:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - interrupts
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
> +    espi: espi@1e6ee000 {
> +        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
> +        reg = <0x1e6ee000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e6ee000 0x1000>;
> +
> +        espi_ctrl: espi-ctrl@0 {
> +            compatible = "aspeed,ast2600-espi-ctrl";
> +            reg = <0x0 0x800>;
> +            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
> +        };
> +
> +        espi_mmbi: espi-mmbi@800 {
> +            compatible = "aspeed,ast2600-espi-mmbi";
> +            reg = <0x800 0x50>;
> +            interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index c4d1faade8be..08d7a2689086 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -453,7 +453,21 @@ video: video@1e700000 {
>  				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
> -
> +			espi: espi@1e6ee000 {
> +				compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
> +				reg = <0x1e6ee000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0x1e6ee000 0x1000>;
> +				espi_ctrl: espi-ctrl@0 {
> +						compatible = "aspeed,ast2600-espi-ctrl";
> +						reg = <0x0 0x800>,<0x0 0x4000000>;
> +						reg-names = "espi_ctrl","espi_flash";
> +						interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +						clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
> +						status = "disabled";
> +						};

Wrong indentation.

> +			};
>  			gpio0: gpio@1e780000 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
