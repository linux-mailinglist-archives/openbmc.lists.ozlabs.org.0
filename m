Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B249852B22D
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 08:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L32qr4QgLz3c7v
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 16:18:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=WsGeYJfM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=WsGeYJfM; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L32qQ2SWjz3bmT
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 16:18:25 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 137so1267213pgb.5
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 23:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aUOQzQyLSHKVQOfQejrKZ7S+QnrjtQ35FqsfQcAvXog=;
 b=WsGeYJfMcSxk4MYbJFe2TMgOQzdkL4z8XDiQDGcluOyGJa8J/YvBAc/vaA9YPkaZy3
 tbEaMb73C+bMB87ftWp+y81QWZMLI8Klz3MLGf2PIHC8eGZxz7oBscOqKsyD7orXuPgw
 ZbsuY9CBwSFOg0eLFK/1+b8pvMqeE/bYFjbmfOVg8IjbXna2qU6HjhqTWOhUilE3rAKy
 s7DQ9IbMdMHWEMMDUDkQFmxcQgIgbegid5YgCE0ipMC/HKvV4jICkygWtZ6iArt+K3Cr
 3T00j0lI8AOHUtAejyMLyAvUSb84eq24cNJqrOAPzu6gE4QPCMVO6sfNzV33X+5QcSEW
 dNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aUOQzQyLSHKVQOfQejrKZ7S+QnrjtQ35FqsfQcAvXog=;
 b=rXHV5bWtw12/dBA5EtlOUwqIrLYaWVACqZwHprdgmY+hnt/O0XgmJoyxeVgVBauCCc
 bWoUu0GGdzP7pa6p/IUuwpgawIUwqMMq+LcZVMWoetGGlc5aiOIdkx3kFXoKm16isNxc
 cNv+TnPD8U2aCNTYeRZRq3e3D/In0xUHuGM6/alwp2VqqpeHcs+NhtBxI0rw5lDMUwHQ
 G+GIUkCTG/thuM1eyMwGlv7Da/WMcmnCbtGsMnJwOtyMfV9jk0UItODZqsvYhp6+mjab
 wImfh8LTkTrAJNhDBxmwrysngDRimox6F7aj51b2qVcdht0SLhrGVNmpC6OSLBEmXxkS
 FNWQ==
X-Gm-Message-State: AOAM530jBZbmSo2ncWPUHY4473FOrlkza8ub9apD9kAen8V9pNQCn2M7
 ql4j+4AJP7A9kwhIQRQkSB2c6N38iofmhq8bxmZQ1A==
X-Google-Smtp-Source: ABdhPJxjiKwSU9gCwVfFIUmqgLbgZrBYEKGKkYGn+85rlJIdtYzmFtJMxk5NUCc7B7OTS4buwPcTZSWZLilb97hrmrQ=
X-Received: by 2002:a63:693:0:b0:3f5:ef4e:d359 with SMTP id
 141-20020a630693000000b003f5ef4ed359mr3001601pgg.540.1652854701461; Tue, 17
 May 2022 23:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220516005412.4844-1-chiawei_wang@aspeedtech.com>
 <20220516005412.4844-2-chiawei_wang@aspeedtech.com>
In-Reply-To: <20220516005412.4844-2-chiawei_wang@aspeedtech.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Wed, 18 May 2022 08:18:10 +0200
Message-ID: <CALNFmy1pM4ZQ0BLDwHykxDCpR=Dv3sVaYq5QLLA_w0L+mzq7iQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: aspeed: Add eSPI controller
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, a.kartashev@yadro.com, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au,
 jk@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org,
 dphadke@linux.microsoft.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 16, 2022 at 2:55 AM Chia-Wei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> Add dt-bindings for Aspeed eSPI controller
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml  | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
>
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> new file mode 100644
> index 000000000000..aa91ec8caf6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2021 Aspeed Technology Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/aspeed/espi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Aspeed eSPI Controller
> +
> +maintainers:
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +description:
> +  Aspeed eSPI controller implements a slave side eSPI endpoint device
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
> +      perif,memcyc-enable:
> +        type: boolean
> +        description: Enable memory cycle over eSPI peripheral channel
> +
> +      perif,memcyc-src-addr:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The Host side address to be decoded into the memory cycle over eSPI peripheral channel
> +
> +      perif,memcyc-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: The size of the memory region allocated for the memory cycle over eSPI peripheral channel
> +        minimum: 65536
> +
> +      perif,dma-mode:
> +        type: boolean
> +        description: Enable DMA support for eSPI peripheral channel
> +
> +      oob,dma-mode:
> +        type: boolean
> +        description: Enable DMA support for eSPI out-of-band channel
> +
> +      oob,dma-tx-desc-num:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 2
> +        maximum: 1023
> +        description: The number of TX descriptors available for eSPI OOB DMA engine
> +
> +      oob,dma-rx-desc-num:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 2
> +        maximum: 1023
> +        description: The number of RX descriptors available for eSPI OOB DMA engine
> +
> +      flash,dma-mode:
> +        type: boolean
> +        description: Enable DMA support for eSPI flash channel
> +
In my tests using this driver the FIFO mode didn't work, but the DMA
mode worked fine.
IMHO you should always use DMA mode to reduce CPU load and get rid of
this property.

> +      flash,safs-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 0, 1, 2 ]
> +        default: 0
> +        description: Slave-Attached-Sharing-Flash mode, 0->Mix, 1->SW, 2->HW
> +
On the AST2500 the HW mode is not supported, is it?

> +    dependencies:
> +      perif,memcyc-src-addr: [ "perif,memcyc-enable" ]
> +      perif,memcyc-size: [ "perif,memcyc-enable" ]
> +      oob,dma-tx-desc-num: [ "oob,dma-mode" ]
> +      oob,dma-rx-desc-num: [ "oob,dma-mode" ]
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - clocks
> +
> +  "^espi-mmbi@[0-9a-f]+$":
> +    type: object
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
> --
> 2.25.1
>

Regards,
Patrick
