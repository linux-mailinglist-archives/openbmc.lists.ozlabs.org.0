Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E2F6BF37E
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 22:06:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdc9s4Bx0z3f4L
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 08:06:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.49; helo=mail-io1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pdc9S13Mqz3bWj;
	Sat, 18 Mar 2023 08:05:47 +1100 (AEDT)
Received: by mail-io1-f49.google.com with SMTP id k17so2881370iob.1;
        Fri, 17 Mar 2023 14:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679087145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NecYJUuy8uaK/tVQe/yH+/ckF6yra+2Pis8jiBooqI=;
        b=Z8ad8l6pBbOvvGi1/dkereMXk/EFA70FMBPj05lOwpUi8x3mLE5Krb3AEwl4j+3K63
         /K6J2ExBVcpro//vAbJuyZsKtqhNnpbXFEct7qybW934fJGc3jI1kHT6u9/2Z7DDVkSs
         6NJVKuL7QAUkzeL7VyvGiNcn0LZJ7cEuhjwUCIlj2B/IIClHActx9ec6zIx9G/MCLUPd
         F8C/LcoG9Ij3viJkH4koGJOMu/Eo05TyEQAT0CTheFwz6BSc2YjlA87hgzxZoGAPmoMI
         oFtdZbJkSyNXorv9HR5J8/d1tlZKA0lCvFNaTPw/5uaZxSsTJufsnim9UDbhIot/RjmM
         /+zg==
X-Gm-Message-State: AO0yUKWsuRi8xkOAczkhWFQrzPKwSod71oEWMBEeoWkKfKEFKdmoxUGZ
	OLNhKk8yDRwJ770GyQb4NQ==
X-Google-Smtp-Source: AK7set8xIMQuQwJ6PDoZs6XtPl1fgkJczzCoyKvb4BiewQRvHyAeYv7nOvtmHPPFiuOhaMQjb5HJ4w==
X-Received: by 2002:a6b:e216:0:b0:753:121f:72a7 with SMTP id z22-20020a6be216000000b00753121f72a7mr23373ioc.8.1679087145050;
        Fri, 17 Mar 2023 14:05:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id cs6-20020a056638470600b003e9e5e1aacasm1005332jab.143.2023.03.17.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:05:44 -0700 (PDT)
Received: (nullmailer pid 2804141 invoked by uid 1000);
	Fri, 17 Mar 2023 21:05:42 -0000
Date: Fri, 17 Mar 2023 16:05:42 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: dmaengine: Add AST2600 UDMA bindings
Message-ID: <20230317210542.GB2790192-robh@kernel.org>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
 <20230314021817.30446-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314021817.30446-3-chiawei_wang@aspeedtech.com>
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
Cc: pmenzel@molgen.mpg.de, linux-serial@vger.kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org, ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 10:18:14AM +0800, Chia-Wei Wang wrote:
> Add the dmaengine bindings for the UART DMA engine of Aspeed AST2600 SoC.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../bindings/dma/aspeed,ast2600-udma.yaml     | 56 +++++++++++++++++++
>  include/dt-bindings/dma/ast2600-udma.h        | 40 +++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
>  create mode 100644 include/dt-bindings/dma/ast2600-udma.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml b/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
> new file mode 100644
> index 000000000000..f92e06ac9f39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/aspeed,ast2600-udma.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/aspeed,ast2600-udma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aspeed AST2600 UART DMA controller
> +
> +maintainers:
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +
> +description: |

Don't need '|'

> +  The Aspeed AST2600 UDMA controller provides direct memory access capabilities
> +  for the NS16550A-compatible UART devices inside AST2600 SoCs. UDMA supports 28
> +  DMA channels and each UART device has its dedicated pair of TX and RX channels.
> +
> +allOf:
> +  - $ref: "dma-controller.yaml#"

Drop quotes

> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-udma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#dma-cells":
> +    const: 1
> +
> +  dma-channels:
> +    maximum: 28
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#dma-cells"
> +  - dma-channels
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    udma: dma-controller@1e79e000 {

Drop unused label.

> +        compatible = "aspeed,ast2600-udma";
> +        reg = <0x1e79e000 0x1000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +        dma-channels = <28>;
> +        #dma-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/dma/ast2600-udma.h b/include/dt-bindings/dma/ast2600-udma.h
> new file mode 100644
> index 000000000000..0b92035b94f1
> --- /dev/null
> +++ b/include/dt-bindings/dma/ast2600-udma.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Headers should be dual licensed.

However, similar to interrupts, we don't normally do defines for DMA 
request numbers. It's only when we make up the numbering (e.g. clock 
ids).

Rob
