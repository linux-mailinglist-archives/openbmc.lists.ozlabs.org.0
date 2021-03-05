Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8D32F661
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 00:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsk371g7Sz3dFd
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 10:09:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.174;
 helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsk2w6b4xz30N0;
 Sat,  6 Mar 2021 10:09:44 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id l133so4338221oib.4;
 Fri, 05 Mar 2021 15:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XrYODSIj7UXVI1uCbWVvuJ9MDvf1FusiVZYMMI3JkzE=;
 b=aw4a1edLUj8pkZVK0a+1Yhz6SjHPA76jA7E1b2oltj4zMyiTbou4C7pBDWQ0pTQsc8
 lMrJHhdaelXBQelTzpYsK7fexP7cGg14Qa8uiPcQ7fk+UnWutEIXsBACPxrV+NMou2HE
 Re8QrxVEGJJ0C7FV03hU3pyKS+pIj2WrdARv+hq2z+GbKbhLzgfZvQj6fnNfbSN8e7cU
 jcwSPjBhF7BcjxMxMorUp7Y/FyJYu18qK6Naeb3w6D9hGc+S9aP4jWFhjAaLvm+O7IUS
 KDj8ZtouGVkf10phZzzjF9m2VxpBqSvLYlbMOQFTZdipfIxtAJJMDOPOenzHfgzTiIXb
 ez8Q==
X-Gm-Message-State: AOAM531Zpul8YO9azI2nSIFwsIXk6ORMC0eh0GDJhh7/2tu6ggOUlEoq
 UrQJGVivEFF2vpqps7zt5w==
X-Google-Smtp-Source: ABdhPJxEV9cNQ+u/FV083e8uupzMrx3E3n1YaYFtT8S202fGkWxSE3FlaHA0lY05b966tc3KmXUmRA==
X-Received: by 2002:aca:4587:: with SMTP id s129mr8889344oia.133.1614985782649; 
 Fri, 05 Mar 2021 15:09:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r13sm853187oot.41.2021.03.05.15.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:09:41 -0800 (PST)
Received: (nullmailer pid 813032 invoked by uid 1000);
 Fri, 05 Mar 2021 23:09:40 -0000
Date: Fri, 5 Mar 2021 17:09:40 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 17/19] dt-bindings: ipmi: Add optional SerIRQ property to
 ASPEED KCS devices
Message-ID: <20210305230940.GA809870@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-18-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219142523.3464540-18-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, chiawei_wang@aspeedtech.com,
 tmaimon77@gmail.com, minyard@acm.org, linux-gpio@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-aspeed@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 lee.jones@linaro.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 20, 2021 at 12:55:21AM +1030, Andrew Jeffery wrote:
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
> for the host, however ASPEED don't appear to expose this capability
> outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> registers for managing these resources, so introduce a devicetree
> property for KCS devices to describe SerIRQ properties.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> index 1c1cc4265948..808475a2c2ca 100644
> --- a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> @@ -47,6 +47,18 @@ properties:
>        channels the status address is derived from the data address, but the
>        status address may be optionally provided.
>  
> +  aspeed,lpc-interrupts:
> +    $ref: "/schemas/types.yaml#/definitions/uint32-matrix"
> +    minItems: 1
> +    maxItems: 1
> +    description: |
> +      A 2-cell property expressing the LPC SerIRQ number and the interrupt
> +      level/sense encoding (specified in the standard fashion).

That would be uint32-array with 'maxItems: 2'.

> +
> +      Note that the generated interrupt is issued from the BMC to the host, and
> +      thus the target interrupt controller is not captured by the BMC's
> +      devicetree.
> +
>    kcs_chan:
>      deprecated: true
>      $ref: '/schemas/types.yaml#/definitions/uint32'
> @@ -84,9 +96,11 @@ allOf:
>  
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
>      kcs3: kcs@24 {
>          compatible = "aspeed,ast2600-kcs-bmc";
>          reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>          aspeed,lpc-io-reg = <0xca2>;
> +        aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>          interrupts = <8>;
>      };
> -- 
> 2.27.0
> 
