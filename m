Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3852D470340
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 15:54:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Yph0TDcz3cN7
	for <lists+openbmc@lfdr.de>; Sat, 11 Dec 2021 01:54:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9YpR1pXcz2yfk
 for <openbmc@lists.ozlabs.org>; Sat, 11 Dec 2021 01:54:38 +1100 (AEDT)
Received: by mail-ot1-f50.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso9844839ots.6
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 06:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Zdc9H3YW1oDCCZbDFkL7On4+7T8yfSZEeO3EBNfcdBg=;
 b=b7+m7l39j2ANTLC05cH7R35FbGLKR1uwMcrOhKAD3TgnjHT1zvS88Zj5bSw98crrdF
 EVQtvLgSSyHW2fneDsze54mQ/XS1Z3gVYCXDLblacJ5Lyr6wo1vlWOZSaarldwvCvbPa
 hJsdkzmXTNvqKZaDpscn9X6vjz53upTNhey1UwvKQ4A2aw0iEgCIhZMRFeM+Nc8UR3C7
 OyqYpbQ/0LSe8oZsNsyC5FSlZGgfXh9tykg58f1L6tB+tGu6fPGg3XzdWVfEZC6ZpHRN
 z330ItTX2/E6b++R1IXO/phJOBRS3ZWJWviad5n8/dEAnuDpaXNE6jQeCZMl7yBGonD5
 FRYg==
X-Gm-Message-State: AOAM532lgEV7iCZh6dwCraq4ih3dtTCKQfdls5TneNBEVjkUQxCwALpf
 /JF8BcBdHB50ZtwdgrSKTQ==
X-Google-Smtp-Source: ABdhPJxXAJ4hmhe+SH4o7q5tMWlEJ/ynPJzoWoPjxoYwskrBvavXsrur1xInHiNIsTpZzFWEhKFJUg==
X-Received: by 2002:a05:6830:1688:: with SMTP id
 k8mr11262889otr.238.1639148075315; 
 Fri, 10 Dec 2021 06:54:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n22sm565324oop.29.2021.12.10.06.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 06:54:34 -0800 (PST)
Received: (nullmailer pid 1333370 invoked by uid 1000);
 Fri, 10 Dec 2021 14:54:33 -0000
Date: Fri, 10 Dec 2021 08:54:33 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <YbNqKfwYes0rH07B@robh.at.kernel.org>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207210823.1975632-2-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 07, 2021 at 10:08:16PM +0100, Jonathan Neuschäfer wrote:
> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
> 
> This patch adds a binding to describe this node.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> ---
> v2:
> - Rename node in example to syscon@800000
> - Add subnode to example
> 
> v1:
> - https://lore.kernel.org/lkml/20210602120329.2444672-2-j.neuschaefer@gmx.net/
> ---
>  .../bindings/arm/npcm/nuvoton,gcr.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> new file mode 100644
> index 0000000000000..62020d7ac305b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gcr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Global Control Registers block in Nuvoton SoCs
> +
> +maintainers:
> +  - Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> +
> +description: |

Don't need '|' if no formatting.

> +  The Global Control Registers (GCR) are a block of registers in Nuvoton SoCs
> +  that expose misc functionality such as chip model and version information or
> +  pinmux settings.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,wpcm450-gcr
> +          - nuvoton,npcm750-gcr
> +      - const: syscon
> +      - const: simple-mfd

blank line

> +  reg: true

Need to define how many entries:

maxItems: 1


> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

Ideally, you should define the child node names, but you can do this:

additionalProperties:
  type: object

which means anything undefined must be a node.

> +
> +examples:
> +  - |
> +    gcr: syscon@800000 {
> +      compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> +      reg = <0x800000 0x1000>;
> +
> +      uart-mux-controller {
> +        compatible = "mmio-mux";
> +        #mux-control-cells = <1>;
> +        mux-reg-masks = <0x38 0x07>;
> +        idle-states = <2>;
> +      };
> +    };
> --
> 2.30.2
> 
> 
