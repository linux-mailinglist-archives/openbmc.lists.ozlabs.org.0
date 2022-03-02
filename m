Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C54CAC77
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 18:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K81qc3w8Kz3bwT
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 04:50:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.53; helo=mail-oo1-f53.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K81qJ0R69z3bfR
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 04:50:18 +1100 (AEDT)
Received: by mail-oo1-f53.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so2745073oos.9
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 09:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iaHBmL19/aGsObKDNYAKvkBrYFk5c1tAvLVtd0VRmtM=;
 b=WZWfL7XBje9tBhnC/gMMzyGvUY+AH6nwz9tEFHIqjyK8B3JJ9zu/hIl/rxwDI7geoE
 PpdmreVI1/FiTZpcd4DZPm6M+vi7yg7k5gX9MvgAT61AoQM1A6WKOzkyvlZktf6GPUXZ
 x3ESGoatcShBKp8ogzFV0iGhOcMa+j6OdXvj3ohUYNDjwVG3QEEKQVbpv3BXsIEO5p92
 8gZW2AOn0H4vv2FD+dFzX5TCSydZJjDmuh2TRXzIBpbF2zvshkauqIcFcXfWYZ8d5s3E
 Cj/GW6SwGYURYTxQ+hR+1rHSBo6ivQxa+QICyZzszSrhcEDiJPA51hNifj1r+y/6Zt5q
 pfuw==
X-Gm-Message-State: AOAM532tSGL0HZq1OdSkRR/pgfrweRn7pr37dyuOp8q9kRg8W4lyXx6j
 awXtteVc8Ent+7sl6wKVMQ==
X-Google-Smtp-Source: ABdhPJzUSrz4rx3I2XeOi33guW/PnNOyNKyG6Hw6f5iggsUNXdmqsv4Cp2y6zU1f0m8KB9v/1tlNhw==
X-Received: by 2002:a4a:7601:0:b0:2e0:3c62:4787 with SMTP id
 t1-20020a4a7601000000b002e03c624787mr15642954ooc.11.1646243415969; 
 Wed, 02 Mar 2022 09:50:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l1-20020a4aa781000000b0031cf8e00738sm7916823oom.1.2022.03.02.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:50:15 -0800 (PST)
Received: (nullmailer pid 3953295 invoked by uid 1000);
 Wed, 02 Mar 2022 17:50:13 -0000
Date: Wed, 2 Mar 2022 11:50:13 -0600
From: Rob Herring <robh@kernel.org>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: edac: npcm-edac.yaml
Message-ID: <Yh+uVYzaXdfEaW7R@robh.at.kernel.org>
References: <20220302092434.16625-1-ctcchien@nuvoton.com>
 <20220302092434.16625-3-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302092434.16625-3-ctcchien@nuvoton.com>
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
 JJLIU0@nuvoton.com, Medad CChien <ctcchien@nuvoton.com>, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, YSCHU@nuvoton.com, bp@alien8.de,
 james.morse@arm.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 02, 2022 at 05:24:33PM +0800, Medad CChien wrote:
> Add the device tree bindings for the EDAC driver npcm-edac.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  .../devicetree/bindings/edac/npcm-edac.yaml   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/edac/npcm-edac.yaml b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
> new file mode 100644
> index 000000000000..936e9787ec80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm-edac.yaml

nuvoton,npcm-memory-controller.yaml

> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Memory Controller EDAC

Drop 'EDAC'

> +
> +maintainers:
> +  - Medad CChien <ctcchien@nuvoton.com>
> +
> +description: |
> +  The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
> +  correction check).
> +
> +  The memory controller supports single bit error correction, double bit
> +  error detection (in-line ECC in which a section (1/8th) of the
> +  memory device used to store data is used for ECC storage).
> +
> +  Note, the bootloader must configure ECC mode for the memory controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm8xx-memory-controller
> +      - nuvoton,npcm7xx-memory-controller

Don't use wildcards in compatible strings. Use specific SoC.

> +
> +  reg:
> +    maxItems: 1
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
> +            compatible = "nuvoton,npcm7xx-memory-controller";
> +            reg = <0x0 0xf0824000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> +
> -- 
> 2.17.1
> 
