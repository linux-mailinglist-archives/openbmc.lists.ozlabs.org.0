Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D0340EB8C
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 22:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9T2D29k3z2yyQ
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 06:19:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.41; helo=mail-oo1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9T1t0ZDyz2yJZ;
 Fri, 17 Sep 2021 06:18:57 +1000 (AEST)
Received: by mail-oo1-f41.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso2459706ooq.8; 
 Thu, 16 Sep 2021 13:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ofqDCzJVJ7CG7oCu1wZMMmGlXuT7MezSEWFRzUjJBXM=;
 b=3SZF7Elx0lHx7E8I+YgddKzKcqceFFVMdjz2QC004Rwd+wzxnR1hZ9kjnAjqdfZbNF
 MG73ixL7G0qmz1trehdy95fZBEWnOUkpXgCBYrsYzuVocVTWC8AHz9jXYIHcOLKjzyx0
 fY/asSOCzwU4aPH7CiXFEoeTEE/BgAh8wkc1/4oaYZEh1ZB5CBvrowxehl68s1JQ6baf
 E0NTGNulXf0ZMcSjBHBDMhCwmgEHm5S+1skL6ZYT3U2PPp+3x0+qPHdhkwGcgXiSSCsE
 hdDsroBI+vrhlfWUV2VVMxbH9Qy7Tpgd1F+83H6zfVPy5Wx0kV4QDRQCLrJctk5i39Cc
 uYdA==
X-Gm-Message-State: AOAM5334JxKQ4BEXzeFL9Ih4eXlxXcj+Z6JHxcUTKPCkGKOBz8EG5gGN
 GdRnPqGJf7ejcGQj+LqvMw==
X-Google-Smtp-Source: ABdhPJwo9TXcC5oMk0jmObTfxCKEHKU6py7NTfYcL2KNnjSNHzC/7WpXjYyYx7EIeF4CtCmvg4x5Vw==
X-Received: by 2002:a4a:984b:: with SMTP id z11mr5915240ooi.76.1631823534247; 
 Thu, 16 Sep 2021 13:18:54 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id s8sm954281otd.76.2021.09.16.13.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 13:18:53 -0700 (PDT)
Received: (nullmailer pid 1429271 invoked by uid 1000);
 Thu, 16 Sep 2021 20:18:51 -0000
Date: Thu, 16 Sep 2021 15:18:51 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: aspeed: Add UART routing controller
Message-ID: <YUOmq4hLoP2ds18w@robh.at.kernel.org>
References: <20210916092515.10553-1-chiawei_wang@aspeedtech.com>
 <20210916092515.10553-3-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916092515.10553-3-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, yulei.sh@bytedance.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 16, 2021 at 05:25:13PM +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed UART routing controller.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  4 ++
>  .../bindings/soc/aspeed/uart-routing.yaml     | 70 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> index 54f080df5e2f..697331d840a0 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> @@ -142,6 +142,10 @@ patternProperties:
>        - interrupts
>        - snoop-ports
>  
> +  "^uart-routing@[0-9a-f]+$":
> +    $ref: /schemas/soc/aspeed/uart-routing.yaml#
> +    description: The UART routing control under LPC register space
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> new file mode 100644
> index 000000000000..534b2a9340ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2018 Google LLC
> +# # Copyright (c) 2021 Aspeed Technology Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/aspeed/uart-routing.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Aspeed UART Routing Controller
> +
> +maintainers:
> +  - Oskar Senft <osk@google.com>
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +
> +description:
> +  The Aspeed UART routing control allow to dynamically route the inputs for
> +  the built-in UARTS and physical serial I/O ports.
> +
> +  This allows, for example, to connect the output of UART to another UART.
> +  This can be used to enable Host <-> BMC communication via UARTs, e.g. to
> +  allow access to the Host's serial console.
> +
> +  This driver is for the BMC side. The sysfs files allow the BMC userspace
> +  which owns the system configuration policy, to configure how UARTs and
> +  physical serial I/O ports are routed.
> +
> +  Two types of files, uart* and io*, are presented in sysfs. The uart*
> +  configures the input signal of a UART controller whereas io* configures
> +  that of a physical serial port.
> +
> +  When read, each file shows the list of available options with currently
> +  selected option marked by brackets "[]". The list of available options
> +  depends on the selected file.
> +
> +  e.g.
> +  cat /sys/bus/platform/drivers/aspeed-uart-routing/*.uart_routing/uart1
> +  [io1] io2 io3 io4 uart2 uart3 uart4 io6
> +
> +  In this case, UART1 gets its input from IO1 (physical serial port 1).

This is about documenting the hardware, not an OS driver.

sysfs files have their own documentation.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2400-uart-routing
> +          - aspeed,ast2500-uart-routing
> +          - aspeed,ast2600-uart-routing
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    lpc: lpc@1e789000 {
> +        compatible = "aspeed,ast2600-lpc-v2", "simple-mfd", "syscon";
> +        reg = <0x1e789000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x1e789000 0x1000>;
> +
> +        uart_routing: uart-routing@98 {
> +            compatible = "aspeed,ast2600-uart-routing";
> +            reg = <0x98 0x8>;
> +        };
> +    };
> -- 
> 2.17.1
> 
> 
