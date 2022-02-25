Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454264C4F42
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 21:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K51463B7vz3cGq
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 07:05:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.49; helo=mail-oo1-f49.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K513q0LMdz30DX
 for <openbmc@lists.ozlabs.org>; Sat, 26 Feb 2022 07:05:42 +1100 (AEDT)
Received: by mail-oo1-f49.google.com with SMTP id
 i6-20020a4ac506000000b0031c5ac6c078so7817876ooq.6
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 12:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pt2v58DVMNtnJGowbH5EvHKVW32wfgY0vO3q80Iq09k=;
 b=HmONk49hnzEiOebd56sRNtFZth1oUynJUwqar2lmwW/0jAY6yN+EfgjmRPNszxLe7Q
 XkMV0vxYjpC3QPlPXTd1FwpyH7L2cjIsHE855Sw436moMV+ai9ZuPyCB19O45JKlsbsq
 H3qGDdaChtejU2Uyjuphij/k3K6OjFGYNl81jVVOKgbQGHvxhrE4oM7LVnjj8YUldRhX
 aa8BpKxvuwi3yDYpqJjGKN0UXy+RA1TEwca0oQ2XBUFymjF4LiLngr6Q7n0H15tN2Upe
 EJBAOpe/ZUKdkrnGESSa8r8Yoe0JnG3Qtq5AIpDkKI4swDRS4ZvAW4U071mygw9fo0+J
 +K4g==
X-Gm-Message-State: AOAM530dV5zIaRoJkmwwjq1s/juHhH34NvZABQaNwWgTblOJ4RZq2GyH
 uejiBsisAfjLTKOg456Ymg==
X-Google-Smtp-Source: ABdhPJxzyw7Udfv93wJdvGYw+MZTCJWRad+6vfmdFDmh3pGrt6GAHmmrW577IEiWdVkLZmqZp1fFlg==
X-Received: by 2002:a05:6870:c6a2:b0:d1:60cf:2d66 with SMTP id
 cv34-20020a056870c6a200b000d160cf2d66mr2137886oab.54.1645819539381; 
 Fri, 25 Feb 2022 12:05:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05680811d000b002d72ec3a921sm1906781oiv.21.2022.02.25.12.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 12:05:38 -0800 (PST)
Received: (nullmailer pid 1344550 invoked by uid 1000);
 Fri, 25 Feb 2022 20:05:36 -0000
Date: Fri, 25 Feb 2022 14:05:36 -0600
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: edac: npcm-edac.yaml
Message-ID: <Yhk2kF1G74ndY60b@robh.at.kernel.org>
References: <20220224074729.5206-1-ctcchien@nuvoton.com>
 <20220224074729.5206-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224074729.5206-3-ctcchien@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, YSCHU@nuvoton.com, bp@alien8.de,
 Medad CChien <ctcchien@nuvoton.com>, james.morse@arm.com, mchehab@kernel.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 03:47:28PM +0800, Medad CChien wrote:
> Add the device tree bindings for the EDAC driver npcm-edac.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../devicetree/bindings/edac/npcm-edac.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/edac/npcm-edac.yaml b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
> new file mode 100644
> index 000000000000..228ace1025dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Memory Controller EDAC
> +
> +maintainers:
> +  - Medad CChien <ctcchien@nuvoton.com>
> +
> +description: |
> +  EDAC node is defined to describe on-chip error detection and correction for
> +  Nuvoton NPCM Memory Controller.

The h/w unit is the memory controller. Describe that in your binding. 
EDAC is a Linuxism.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm8xx-edac
> +      - nuvoton,npcm7xx-edac

The h/w manual calls this block 'edac'?

> +
> +  reg:
> +    maxItems: 1
> +

> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

You don't need these 2. You don't have a child node with an address.

> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: uncorrectable error interrupt
> +      - description: correctable error interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: ue
> +      - const: ce
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    ahb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        mc: memory-controller@f0824000 {
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            reg = <0x0 0xf0824000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +            compatible = "nuvoton,npcm7xx-edac";
> +        };
> +    };
> +
> -- 
> 2.17.1
> 
> 
