Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2B4C0B30
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Ncn2QZ4z3bdC
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 15:40:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K36LY2YKPz30hm
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 04:56:51 +1100 (AEDT)
Received: by mail-oo1-f54.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so18683097oov.3
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 09:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d0c5eaekgCsd/2MB/A2s3Yr0/x87WiLkg0ydsvjSbdg=;
 b=1EHmI2ZzRIzNXYoO7fmbyeX5PkkGYoAlj1N7KfcaX4RMb4W4Km/VbCDj9CCI4XvLZ+
 zI755cGNoenvR78DuQzDXgeHP6ZAE5FFg/RwAiyLRvkdUpH+GbijqrIbPD/PhlHve20B
 ZWj3zvNYooO6xuVqEtp3YcVpDOZjjQ2VQSvP8HdBH+VL/2blB4F8GMsYDosWExM4VwtT
 5evVQrRCMEVZtrYw5KTvPIhVe/z0vuK7TQ6Tx8vNJq3yfWExg8gan0O1YGowV+R6zq7J
 81Gr14CKCnC+31RrHtJ1cAuPhefj8KHJvEZKdopVmSoi78A5zke6zsC3QQ9OZGUz1O+L
 SNag==
X-Gm-Message-State: AOAM5319UW6qjbFjvWpFLLNtz11ck3HbwxqXojt7o0P3uW+VDpYfP9Xt
 /nl5fSlLNW45EoN0chaUVQ==
X-Google-Smtp-Source: ABdhPJzyCoIdb4zb2XlsBbH2K09wgxaBCtYwIdcE2Yqsud2oVcKlTNvKGVY6PBPFKAl9JjY+BPTX8g==
X-Received: by 2002:a05:6870:790c:b0:d2:8591:d4a5 with SMTP id
 hg12-20020a056870790c00b000d28591d4a5mr2255509oab.265.1645552607973; 
 Tue, 22 Feb 2022 09:56:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o15sm6387844ooi.31.2022.02.22.09.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:56:47 -0800 (PST)
Received: (nullmailer pid 3307024 invoked by uid 1000);
 Tue, 22 Feb 2022 17:56:46 -0000
Date: Tue, 22 Feb 2022 11:56:46 -0600
From: Rob Herring <robh@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YhUj3uRQinOVF4eM@robh.at.kernel.org>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220220035321.3870-3-warp5tw@gmail.com>
X-Mailman-Approved-At: Wed, 23 Feb 2022 15:39:19 +1100
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
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de,
 sven@svenpeter.dev, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 20, 2022 at 11:53:12AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..809c51ac32fe 100644
> --- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> @@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
>  
>  description: |
> -  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
> -  both master and slave mode. Each controller can switch between master and slave
> -  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
> -  RX.
> +  I2C bus controllers of the NPCM series support both master and
> +  slave mode. Each controller can switch between master and slave at run time
> +  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
>  
>  maintainers:
>    - Tali Perry <tali.perry1@gmail.com>
>  
>  properties:
>    compatible:
> -    const: nuvoton,npcm750-i2c
> +     enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,11 +37,16 @@ properties:
>      default: 100000
>      enum: [100000, 400000, 1000000]
>  
> +  nuvoton,sys-mgr:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - nuvoton,sys-mgr

You can't make nuvoton,sys-mgr required for existing users. You can add 
an if/then schema for nuvoton,npcm845-i2c if you want to make it 
required in that case.

Rob
