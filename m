Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4FA63FC4C
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 00:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNXr93KLMz3bYL
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 10:50:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.179; helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNXqr4YtFz3bSl
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 10:49:58 +1100 (AEDT)
Received: by mail-oi1-f179.google.com with SMTP id s141so3731063oie.10
        for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2022 15:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+HjyG60puvlrURBNHopMfOrvdeMFci5vVt0oykR5tc=;
        b=z9O2go3Kyz6Ke966LrsMJWR46qkKu327TYsEOF7/4ev8qpWPx0B0eihYl5BzpFcXL1
         YEmoX98EptghEeRQeeqXYM3igZb8ynpWeeMp8EieLmAqrVPv+tJ9jQXzH39f0kBx1Stq
         Qr5fCXKXdkIr0V+YN6b02yRNdGaO9VivvzWAZInpuCgnvp2KI4/E20tf8nooEVIwRswb
         50PCsIq6F2cmW/jgV1WPNvPvSAznLzR7WFg850/Okg/PluEsTNKL9/wqjxpS8facN9nV
         3gRgWrDDCiE317xgIjaPSwmPgmvnJ1Q1GhTtWt56fvM8Xp0JwiCKdSGNJdzXHdn3CbK/
         YMWw==
X-Gm-Message-State: ANoB5pkrEJ/muKWFN84EmsE0R51ab/jrWNEjAX7m93WSOhsUrrQbt3UY
	EkNDNL8M8NUOupB/1NGQcg==
X-Google-Smtp-Source: AA0mqf5bJr0Z/sHBoXak624BdBzYGGLAuHfYECUlI0mZIj1EYsWA3ZeDo7bemwuHtU+yAdY/jKae8A==
X-Received: by 2002:aca:44c4:0:b0:35a:6147:c6a5 with SMTP id r187-20020aca44c4000000b0035a6147c6a5mr24461259oia.149.1669938595865;
        Thu, 01 Dec 2022 15:49:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g14-20020a544f8e000000b0035437f4deefsm2392807oiy.26.2022.12.01.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:49:55 -0800 (PST)
Received: (nullmailer pid 1708582 invoked by uid 1000);
	Thu, 01 Dec 2022 23:49:54 -0000
Date: Thu, 1 Dec 2022 17:49:54 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI
 controller
Message-ID: <20221201234954.GA1704219-robh@kernel.org>
References: <20221130150857.67113-1-tmaimon77@gmail.com>
 <20221130150857.67113-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130150857.67113-2-tmaimon77@gmail.com>
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
Cc: andy.shevchenko@gmail.com, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, arnd@arndb.de, krakoczy@antmicro.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, briannorris@chromium.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, tali.perry1@gmail.com, gsomlo@gmail.com, joel@jms.id.au, davidgow@google.com, skhan@linuxfoundation.org, devicetree@vger.kernel.org, pbrobinson@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 05:08:56PM +0200, Tomer Maimon wrote:
> Add binding for Nuvoton NPCM SDHCI controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml b/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> new file mode 100644
> index 000000000000..38409272807a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/npcm,sdhci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NPCM SDHCI Controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-sdhci
> +      - nuvoton,npcm845-sdhci
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^sdhci@[0-9a-f]+$":
> +    type: object

sdhci is a child node of the nuvoton,npcm750-sdhci node?

> +    $ref: mmc-controller.yaml

I think you want:

allOf:
  - $ref: mmc-controller.yaml#

And then you will have some errors in the example to fix.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sdhci0: sdhci@f0840000 {

Drop unused labels.

Node name should be 'mmc'

> +      compatible = "nuvoton,npcm750-sdhci";

Indent by 4 spaces.

> +      reg = <0xf0840000 0x200>;
> +      interrupts = <0 27 4>;
> +      clocks = <&clk 4>;
> +    };
> -- 
> 2.33.0
> 
> 
