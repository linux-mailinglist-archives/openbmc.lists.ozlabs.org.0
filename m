Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E154B29F3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 17:15:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwJcx0YgZz3cC3
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 03:15:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.179;
 helo=mail-qt1-f179.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwJbd3glQz3cCG
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 03:14:36 +1100 (AEDT)
Received: by mail-qt1-f179.google.com with SMTP id r14so9451189qtt.5
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 08:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S8xpmHV8qmgZo5KtADQn+41vGynS6Djxd0MCgfJYJrQ=;
 b=4+X5A28qOyq26ksxL/1NmGoMP0/ixZjs22zLHlWJqUFajqDadDU3CKod7ZqMR8w/KP
 rOAJnqAxnC6stjrIRlEv49uwkVGsXRlUO1tc8rl1ISsrl7bELEMr8WzMcCKo+GwPfih4
 39sE36OqwKFcnzileIVqtnvBX5EGaHSfZ1/Gaa1TgyFtnbFi9INpipsj96Uoe+5yaS4s
 IeM/VMnzjtyI8yFIj6K5rshQJ2Y1SU1RV8pqZNRWYQ30XEQTH9WDKNp6MTbopVlcbksM
 rrIpbOMMEV1djWs4Zm5w+UveyPlmRQDivueLxBEksmajNnRyjTIXklJUVeHtstOqY/wt
 16jA==
X-Gm-Message-State: AOAM533vLvXSXEwF0/Y9B0b73NIaddEZy9Ctg07m9iYlP1J+v/L8AKUx
 kXuDMhgpCDDa+cUBu+VCHw==
X-Google-Smtp-Source: ABdhPJw7PmtZ0vR8j0t1v4dIdypSD5XvhTxwoO4r3Ep/YYX74YcRRmX53LbVFhJVgfCECa+VAteR/A==
X-Received: by 2002:a05:622a:1ce:: with SMTP id
 t14mr1604389qtw.25.1644596073068; 
 Fri, 11 Feb 2022 08:14:33 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fee:dfce:b6df:c3e1:b1e5:d6d8])
 by smtp.gmail.com with ESMTPSA id
 t18sm13012269qta.90.2022.02.11.08.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:14:32 -0800 (PST)
Received: (nullmailer pid 451271 invoked by uid 1000);
 Fri, 11 Feb 2022 16:14:28 -0000
Date: Fri, 11 Feb 2022 10:14:28 -0600
From: Rob Herring <robh@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YgaLZLuCwdpUgMea@robh.at.kernel.org>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 07, 2022 at 02:33:33PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This commit adds compatible and syscon description for NPCM845 i2c module.
> 
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..05e58f44b03a 100644
> --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
>  
>  description: |
> -  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
> -  both master and slave mode. Each controller can switch between master and slave
> -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
> -  RX.
> +  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX includes
> +  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are connected on I2C
> +  pins in parallel to controllers 8-10.

How many instances is really outside the scope of this binding. And I 
don't want to be updating this for every new SoC. So rework it to cover 
both chips and the next one.

> +  All controllers support both master and slave mode.
> +  Each controller can switch between master and slave at run time (i.e. IPMB mode).
> +  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPCM8XX I2C
> +  controller has two 32 byte HW FIFO for TX and RX.
>  
>  maintainers:
>    - Tali Perry <tali.perry1@gmail.com>
>  
>  properties:
>    compatible:
> -    const: nuvoton,npcm750-i2c
> +    enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,11 +41,16 @@ properties:
>      default: 100000
>      enum: [100000, 400000, 1000000]
>  
> +  syscon:

nuvoton,sys-mgr or similar.

> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> @@ -57,6 +67,7 @@ examples:
>          clock-frequency = <100000>;
>          interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
>          compatible = "nuvoton,npcm750-i2c";
> +        syscon = <&gcr>;
>      };
>  
>  ...
> -- 
> 2.17.1
> 
> 
