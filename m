Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21819634B74
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 01:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH1cq0YCjz3dvd
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 11:06:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.54; helo=mail-io1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH1cQ1Mpsz3000
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 11:05:56 +1100 (AEDT)
Received: by mail-io1-f54.google.com with SMTP id z3so12153482iof.3
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 16:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOAOA3l25FTlYWgHdX0NRqhyY9RcRAzmGvtq9++eoqg=;
        b=1cgOzXJUygO9cSt8+SerNqTDVCEMaqDilDHSc8d4yT0gC9cVdkUflrAQeYOXe0Lnfk
         cunMT4Yv/+GsCC19KVgA2+ovNJ45mZMH1V58GIBkfavyFQf/h9zM0URSSWIrWco/5BYY
         FpIOhEE6sfyw1MXMO/5j5jCLSxr/9uO8hBCXY+VQES7C/0kwWzCnVnCQ9sn59QTiYo96
         ZlgmS6qAMfdqWxBzDzclLLynYOgRaBm6dKDL0pgQcPuN4k8wsXtIA50kwywIERl4TTRB
         0lY6fS/ibqgGhQ6zp2KaKF3T0pr9n7jIVkUkFHSrhnp9Dwu75g02q74D25Mnkd4hVEmi
         IJqQ==
X-Gm-Message-State: ANoB5pmXDG7mdqbI5odgSfNzq/nxCpBdOLb1jRwgAn8CEhKoxcyyEwRj
	9X1fsef8hFCUzW61+h8czw==
X-Google-Smtp-Source: AA0mqf7BJHES9MUwE3wyYO2MhDcoicDShRER72IeewX9pYLrmCObA2dqPuNTNfOnNiY9xNcRz1K8tA==
X-Received: by 2002:a6b:c844:0:b0:6db:fe34:6948 with SMTP id y65-20020a6bc844000000b006dbfe346948mr3010433iof.209.1669161953103;
        Tue, 22 Nov 2022 16:05:53 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b4-20020a05660214c400b006cab79c4214sm5776318iow.46.2022.11.22.16.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 16:05:52 -0800 (PST)
Received: (nullmailer pid 823019 invoked by uid 1000);
	Wed, 23 Nov 2022 00:05:52 -0000
Date: Tue, 22 Nov 2022 18:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: Marvin Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v7 2/7] media: dt-binding: nuvoton: Add bindings for NPCM
 VCD and ECE engine
Message-ID: <20221123000552.GA817752-robh@kernel.org>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
 <20221122085724.3245078-3-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122085724.3245078-3-milkfafa@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, mchehab@kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 22, 2022 at 04:57:19PM +0800, Marvin Lin wrote:
> Add dt-binding document for Video Capture/Differentiation Engine (VCD)
> and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
> 
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> ---
>  .../bindings/media/nuvoton,npcm-video.yaml    | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
> new file mode 100644
> index 000000000000..b5be7ef09038
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nuvoton,npcm-video.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Video Capture/Encode Engine Device Tree Bindings

Drop ' Device Tree Bindings'

> +
> +maintainers:
> +  - Joseph Liu <kwliu@nuvoton.com>
> +  - Marvin Lin <kflin@nuvoton.com>
> +
> +description: |
> +  Video Capture/Differentiation Engine (VCD) and Encoding Compression Engine
> +  (ECE) present on Nuvoton NPCM SoCs.

Sounds like 2 h/w blocks? If so, then it should be 2 separate nodes.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-video
> +      - nuvoton,npcm845-video

'video' doesn't sound like the name of the h/w block(s).

> +
> +  reg:
> +    items:
> +      - description: VCD registers
> +      - description: ECE registers
> +
> +  reg-names:
> +    items:
> +      - const: vcd
> +      - const: ece
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: VCD reset control
> +      - description: ECE reset control
> +
> +  reset-names:
> +    items:
> +      - const: vcd
> +      - const: ece
> +
> +  nuvoton,syscon-gcr:
> +    $ref: /schemas/types.yaml#definitions/phandle
> +    description: Phandle to the Global Control Register DT node
> +
> +  nuvoton,syscon-gfxi:
> +    $ref: /schemas/types.yaml#definitions/phandle
> +    description: Phandle to the Graphics Core Information DT node
> +
> +  memory-region:
> +    description:
> +      CMA pool to use for buffers allocation instead of the default CMA pool.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - nuvoton,syscon-gcr
> +  - nuvoton,syscon-gfxi
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
> +
> +    video: video@f0810000 {
> +        compatible = "nuvoton,npcm750-video";
> +        reg = <0xf0810000 0x10000>,
> +              <0xf0820000 0x2000>;
> +        reg-names = "vcd", "ece";
> +        interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
> +                 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
> +        reset-names = "vcd", "ece";
> +        nuvoton,syscon-gcr = <&gcr>;
> +        nuvoton,syscon-gfxi = <&gfxi>;
> +    };
> -- 
> 2.34.1
> 
> 
