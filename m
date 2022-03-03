Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A34CBB8D
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 11:38:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8SBf5mCyz3c2c
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 21:38:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=ooKEqFUG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=ooKEqFUG; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8SBD1fKdz3bt8
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 21:38:11 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BABF33F5F1
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646303885;
 bh=xOhToe4x9f97Ns7B9xh5lureiPwRVmCdE7nXxruX5Ts=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ooKEqFUGOYfqprRWuxNZJg3ymUIdePcCluVxYca0fXK/vHIAsLYYoFlNOODAzncR+
 Hfwmr1rho+t/ji9nm2g+ig3qW6bOpT3JBbej1oLRjuNRuSKpr2RrTip7Xbts8+AAAM
 MEqPwvqFzmsETDgdaZdWMnLvVXXRiYeKkDbM5kkdCGFF5IjxG53wZEigeGfbSpt1Yu
 Agz+xFqwTdMRiT37FrHnSfklcllM4vUZdl1lcIBzzf/eu/SaHiNFDxSvWK3JBLNp9D
 phzfTFVQ8hZ2MCOzZaZDV9M4XqEU7m0dZZXkzit+R4EDo3T6ZOkcUhIxTpYJ6Eq78h
 TXXmCB1VqhPqQ==
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso1701420wmz.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 02:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xOhToe4x9f97Ns7B9xh5lureiPwRVmCdE7nXxruX5Ts=;
 b=eOTH9AI2l0CgYC+tvPojhmoWZeY/lm3QHgMG8rsWC9ZB5IQUxTfx7pgh8WwwVVq4hQ
 ZU2w4da5I8A+yGzaqCadTC4lIlmI9gnH2rLL0B0uC13cfT6CpKbgWobfXqsrNNW1hJPm
 0q8Y/LCaet6i+nL9eh6WKbf1mNac8K5082CeAOk4+j3AbDX9gny1XHUQjhktkban9+4b
 WKu7ZIuXvyuzGa1DLUCF2F3yVLnaSbIxjdogmob0+bD/SvZVrhGYnQWCRXFT2Jcxu4oC
 17ih3NfUozbcWviPYVTQzbEIhgFUzsTXLtI1UjiKcDi2gMiyS/Bc/Vf0xq2Ki9h8AFEZ
 l7Lw==
X-Gm-Message-State: AOAM530eVX1TJRMZekI33PYrVleg8h8M8Pu9SCPsZL4QqqiXXPj0oSon
 6w7/+1M+q0jJpQqf9DiZg3m1yCQbhOV5B1W2AwsVc8qWGSUAucu7260scQ6xapODRpamR1QOcIL
 MBpj97Ou2S4+yVV2Iow6AZVcV5yiFDP2vsUaZ
X-Received: by 2002:a17:906:e04:b0:6ce:e210:4fe1 with SMTP id
 l4-20020a1709060e0400b006cee2104fe1mr27319542eji.402.1646303874424; 
 Thu, 03 Mar 2022 02:37:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDYZj81Rphl4dYoYk1zvBPAtcEQQ07HvJC+n5Qx67PuSrOxEweiOj+yiH/LR8TWEP9H/K4/Q==
X-Received: by 2002:a17:906:e04:b0:6ce:e210:4fe1 with SMTP id
 l4-20020a1709060e0400b006cee2104fe1mr27319499eji.402.1646303874194; 
 Thu, 03 Mar 2022 02:37:54 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 d23-20020a1709067a1700b006d0ebe4af89sm558554ejo.20.2022.03.03.02.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 02:37:53 -0800 (PST)
Message-ID: <cb77935e-64e0-c8b6-9fba-9835a3be432f@canonical.com>
Date: Thu, 3 Mar 2022 11:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-3-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303083141.8742-3-warp5tw@gmail.com>
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
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 03/03/2022 09:31, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> index 128444942aec..37976ddcf406 100644
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
> +    enum:
> +      - nuvoton,npcm750-i2c
> +      - nuvoton,npcm845-i2c
>  
>    reg:
>      maxItems: 1
> @@ -36,6 +37,10 @@ properties:
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
> @@ -44,6 +49,16 @@ required:
>  
>  allOf:
>    - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const:
> +              - nuvoton,npcm845-i2c

This should be one line in const (not an enum).

Rest looks good to me.

Best regards,
Krzysztof
