Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DAC3A8CCD
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 01:43:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Pyz00wpz3bTN
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 09:43:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.176;
 helo=mail-il1-f176.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Pym0Bmxz2ymZ
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jun 2021 09:43:27 +1000 (AEST)
Received: by mail-il1-f176.google.com with SMTP id i12so663882ila.13
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jun 2021 16:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YPT8InEABYmuq0XIJqXJvHe3RyahNA55MTZJfxlQgHA=;
 b=AwuGAwtzeiXQzGu3QWiQcsB/O9hvSTSNVPJd+t/QfiQHs34vrhJH7UlYwb4+8U+Cs9
 6vrJJY6PsK/5AGwYW1KbPwmBrFEUxES/G3gQECdhcCib4qLcNk5kXf/txzqHRlxNRNxf
 SWOa+tPMgea0q9w8oh1JNNEdB+6vZ5FxVXRQYdJ+VJA7Kcl/gGw6cNXuOUCBwUUKSI6j
 yXjM7u/rzjIOh/ZasInf1urNgilH9EqYO8fFWmmsrMhEd/ZGof7YuJ+zZeuN3RcNwbfO
 ZZN8TiwYPyq6uBrDMiseVvNJV+3ehg7EU6xPaW4KcFXvQS1NUvG6ORqAr63G30TzYpdC
 AcHg==
X-Gm-Message-State: AOAM533ZozOnQV1U1yCytNFXPirfeSJ6dAp8jDmkhP2gEXpdbgNpBnwo
 wiSnzCXdLLyxXGQkEzM0RQ==
X-Google-Smtp-Source: ABdhPJyVsj22o5nkeyBWGx+IAIJTqcaLmaFT2QEWslSrTplD/gIxQNsHSGBW8ljZEnNIUpa9G1LsWA==
X-Received: by 2002:a92:750c:: with SMTP id q12mr1343089ilc.303.1623800603852; 
 Tue, 15 Jun 2021 16:43:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o10sm285848ilc.75.2021.06.15.16.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 16:43:23 -0700 (PDT)
Received: (nullmailer pid 1684451 invoked by uid 1000);
 Tue, 15 Jun 2021 23:43:21 -0000
Date: Tue, 15 Jun 2021 17:43:21 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 1/8] dt-bindings: arm/npcm: Add binding for global
 control registers (GCR)
Message-ID: <20210615234321.GA1681813@robh.at.kernel.org>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602120329.2444672-2-j.neuschaefer@gmx.net>
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

On Wed, Jun 02, 2021 at 02:03:22PM +0200, Jonathan Neuschäfer wrote:
> A nuvoton,*-gcr node is present in nuvoton-common-npcm7xx.dtsi and will
> be added to nuvoton-wpcm450.dtsi. It is necessary for the NPCM7xx and
> WPCM450 pinctrl drivers, and may later be used to retrieve SoC model and
> version information.
> 
> This patch adds a binding to describe this node.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../bindings/arm/npcm/nuvoton,gcr.yaml        | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> new file mode 100644
> index 0000000000000..3174279f7713a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr.yaml
> @@ -0,0 +1,38 @@
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

How is this a simple-mfd? There are no child nodes.

> +  reg: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gcr: gcr@800000 {
> +      compatible = "nuvoton,npcm750-gcr", "syscon", "simple-mfd";
> +      reg = <0x800000 0x1000>;
> +    };
> --
> 2.30.2
