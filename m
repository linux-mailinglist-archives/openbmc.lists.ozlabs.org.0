Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2495332F654
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 00:07:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dsk0G0t8Wz3dG3
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 10:07:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.180;
 helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dsk041Qy6z30Mr;
 Sat,  6 Mar 2021 10:07:15 +1100 (AEDT)
Received: by mail-oi1-f180.google.com with SMTP id m25so4273028oie.12;
 Fri, 05 Mar 2021 15:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3EoYEeSygE/KZK2Mj6hNkGMUGHyAfG9Fyx4STWgPwTE=;
 b=PRNW/L4bY5ANtGKXAHcSTLNm28+Sb5j4BCpc1R87sgoIcWW8V8YyapTjTgMPfg9ipy
 mfPkyvC/pqUDdjsFMcPPYk/t8U5SS2mvZycktmn210Z9IN/ruJ4Jz49x77exoK01E25m
 0O7iy3K0LggJjGguSkuKfQqU7MogbUmN4CAoyRZRbKzPt6ArSKtCB6rKZbtTJO3ZYFRf
 eBXe0HOEz89VGOYpyi9uzo0pm+VKU3c+pqoYPTsEwmEgrfpnVcinU0mMBylQcqLvWWKF
 G87JssDHkQkd4kkgCIEW+gFqwA0H2EvCwdvNvlCuTbrkHG9S68Fv88WxJfV9ZxALF7Wv
 IL2Q==
X-Gm-Message-State: AOAM531RY8zH1HnmVjM0wiUb2QMSAbEoZFuAthIgrrDnpNvp9LApOSv3
 ozRo2q+qgK1RrDtPwfbEEg==
X-Google-Smtp-Source: ABdhPJx4ZtFxecd//omqNCC21K3NJ+sdbprwXmJs8fNWf1UBUrHCzfmLYt3ImejkAhI2HXuRFKNepQ==
X-Received: by 2002:aca:4745:: with SMTP id u66mr8823213oia.37.1614985632884; 
 Fri, 05 Mar 2021 15:07:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u67sm862614oie.35.2021.03.05.15.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:07:12 -0800 (PST)
Received: (nullmailer pid 809675 invoked by uid 1000);
 Fri, 05 Mar 2021 23:07:10 -0000
Date: Fri, 5 Mar 2021 17:07:10 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 16/19] dt-bindings: ipmi: Convert ASPEED KCS binding to
 schema
Message-ID: <20210305230710.GA798530@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-17-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219142523.3464540-17-andrew@aj.id.au>
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

On Sat, Feb 20, 2021 at 12:55:20AM +1030, Andrew Jeffery wrote:
> Given the deprecated binding, improve the ability to detect issues in
> the platform devicetrees. Further, a subsequent patch will introduce a
> new interrupts property for specifying SerIRQ behaviour, so convert
> before we do any further additions.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
>  2 files changed, 92 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> 
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> new file mode 100644
> index 000000000000..1c1cc4265948
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED BMC KCS Devices
> +
> +maintainers:
> +  - Andrew Jeffery <andrew@aj.id.au>
> +
> +description: |
> +  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
> +  interfaces on the LPC bus for in-band IPMI communication with their host.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: Channel ID derived from reg
> +        items:
> +          enum:
> +            - aspeed,ast2400-kcs-bmc-v2
> +            - aspeed,ast2500-kcs-bmc-v2
> +            - aspeed,ast2600-kcs-bmc
> +
> +      - description: Old-style with explicit channel ID, no reg
> +        deprecated: true
> +        items:
> +          enum:
> +            - aspeed,ast2400-kcs-bmc
> +            - aspeed,ast2500-kcs-bmc
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    minItems: 3
> +    maxItems: 3
> +    description: IDR, ODR and STR register addresses

items:
  - description: IDR register
  - description: ODR register
  - description: STR register

> +
> +  aspeed,lpc-io-reg:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    minItems: 1
> +    maxItems: 2

A uint32 can only have 1 item. uint32-array perhaps?


> +    description: |
> +      The host CPU LPC IO data and status addresses for the device. For most
> +      channels the status address is derived from the data address, but the
> +      status address may be optionally provided.
> +
> +  kcs_chan:
> +    deprecated: true
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    maxItems: 1

Drop

> +    description: The LPC channel number in the controller
> +
> +  kcs_addr:
> +    deprecated: true
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    maxItems: 1

Drop

> +    description: The host CPU IO map address
> +
> +required:
> +  - compatible
> +  - interrupts
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - aspeed,ast2400-kcs-bmc
> +              - aspeed,ast2500-kcs-bmc
> +    then:
> +      required:
> +        - kcs_chan
> +        - kcs_addr
> +    else:
> +      required:
> +        - reg
> +        - aspeed,lpc-io-reg
> +
> +examples:
> +  - |
> +    kcs3: kcs@24 {
> +        compatible = "aspeed,ast2600-kcs-bmc";
> +        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
> +        aspeed,lpc-io-reg = <0xca2>;
> +        interrupts = <8>;
> +    };
> diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> deleted file mode 100644
> index 193e71ca96b0..000000000000
> --- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -# Aspeed KCS (Keyboard Controller Style) IPMI interface
> -
> -The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
> -(Baseboard Management Controllers) and the KCS interface can be
> -used to perform in-band IPMI communication with their host.
> -
> -## v1
> -Required properties:
> -- compatible : should be one of
> -    "aspeed,ast2400-kcs-bmc"
> -    "aspeed,ast2500-kcs-bmc"
> -- interrupts : interrupt generated by the controller
> -- kcs_chan : The LPC channel number in the controller
> -- kcs_addr : The host CPU IO map address
> -
> -## v2
> -Required properties:
> -- compatible : should be one of
> -    "aspeed,ast2400-kcs-bmc-v2"
> -    "aspeed,ast2500-kcs-bmc-v2"
> -- reg : The address and size of the IDR, ODR and STR registers
> -- interrupts : interrupt generated by the controller
> -- aspeed,lpc-io-reg : The host CPU LPC IO address for the device
> -
> -Example:
> -
> -    kcs3: kcs@24 {
> -        compatible = "aspeed,ast2500-kcs-bmc-v2";
> -        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
> -        aspeed,lpc-reg = <0xca2>;
> -        interrupts = <8>;
> -        status = "okay";
> -    };
> -- 
> 2.27.0
> 
