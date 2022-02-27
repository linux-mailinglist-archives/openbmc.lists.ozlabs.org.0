Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D74C5A95
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 12:03:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K60wd2qZjz30QF
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 22:02:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=l6WSRCry;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=l6WSRCry; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K60wD6vhRz2yNv
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 22:02:36 +1100 (AEDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 128113F1CA
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645959755;
 bh=RXUmSRm1O1VoA9wS7MAMGWoCbD7WOkk+zqEQ16+dydg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=l6WSRCryKsOmT77rOjXQSiMoDDR8OTmBNyXErp93OEsHZHMdqHAqTF/CI8vG1Wh7h
 f4HH5OsH1lltbbvWPZOdmnsMa2WQVgtbyVWEgQfSJOqc21SJmqYCsGZUffMmmmwdQh
 umnPckaaMDsvCBL6Eh5NZVVlbQ4QJAfSed8zqNj92umzprSKAg36VaZKs01cVqXXd9
 fSbDEEEqqM+cgqupXN1MItg/VH15ihaAVSmVtmKrQXQtqUB645EgIG3b4KggT+Ogqc
 m13hTlk1KFSpEuWH6CAv+f7U+J/IclVVRT3avc7DH8AgPMK0nta3Fk7jkd54yWGUTf
 bdOSSPd1kp7nA==
Received: by mail-ej1-f72.google.com with SMTP id
 hc39-20020a17090716a700b006ce88cf89dfso4352073ejc.10
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 03:02:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RXUmSRm1O1VoA9wS7MAMGWoCbD7WOkk+zqEQ16+dydg=;
 b=0lykKmVf/pUEtn0gz9CIY/vye1ASaKI1LNC+pJpJKNpxr9xQNczJwfC99QMMNZ03JA
 gA/grJzUeqfL2emxPqqGyUxUO12klbFk0k6c1CT5f3nExEfrrFrqDao951K1IeTf6Opx
 RyTLdR/DAuGZItfzXr5knFaHQGKnpUiuvw+5hRLRzG/ynbk+4YKS0E5fhoOYs4QWaxKP
 FuqzsTreSaj5p8PrbDR8JV5ZkWiaN0kj6EU05jrtiUFxIyThOZQ+meWd1C2JbrOSFb22
 tCgtguZ3U4CJsD3kmjN+Y0lFRphujAv4EHjPMObLhH2+akdusClGCghfbvOLmZ188nKk
 KosA==
X-Gm-Message-State: AOAM532BEJ5zhLOLNOSUTWNgQAa5RJGN3N1bCvfe/JQXkgGOdxWuwQfF
 rm7JNxEZdN+mllfADoOAPweNF9rRILhURo/LPlubg3mfZSDnS3dDXx8lnLfGXME9cCrwTtwMFNP
 q3lfw3mlvIAFDrBCOtNfMbw7WLo0bA6L3FXEZ
X-Received: by 2002:a05:6402:2790:b0:412:8379:f248 with SMTP id
 b16-20020a056402279000b004128379f248mr14812880ede.285.1645959754634; 
 Sun, 27 Feb 2022 03:02:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOM38cLX4uJ8ipUpfRHTzICOBLEWeXU+W9FDRpLDjRd8H4IszimlckdjrXsnhAtzX8cIRIrQ==
X-Received: by 2002:a05:6402:2790:b0:412:8379:f248 with SMTP id
 b16-20020a056402279000b004128379f248mr14812867ede.285.1645959754460; 
 Sun, 27 Feb 2022 03:02:34 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 lx9-20020a170906af0900b006d0d3179e11sm3245068ejb.105.2022.02.27.03.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 03:02:33 -0800 (PST)
Message-ID: <1924a900-20db-93b5-4f9b-37a56467f7e8@canonical.com>
Date: Sun, 27 Feb 2022 12:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/3] dt-bindings: edac: npcm-edac.yaml
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org, bp@alien8.de,
 robh+dt@kernel.org, benjaminfair@google.com, yuenn@google.com,
 venture@google.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
 JJLIU0@nuvoton.com, KFTING@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com
References: <20220224074729.5206-1-ctcchien@nuvoton.com>
 <20220224074729.5206-3-ctcchien@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220224074729.5206-3-ctcchien@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/02/2022 08:47, Medad CChien wrote:
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
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm8xx-edac
> +      - nuvoton,npcm7xx-edac
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why do you need it? There are no children nodes allowed.

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

First compatible, then reg, then the rest, please.

> +        };
> +    };
> +


Best regards,
Krzysztof
