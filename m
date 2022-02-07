Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEE04ACF4F
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 03:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt75H5ZTnz3bP4
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 13:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=HIpTqdEH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=HIpTqdEH; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JskQw1Rrxz3bTD
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 22:28:07 +1100 (AEDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9493E3FE4B
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644233284;
 bh=Tn4bc4zR8BLXzuWSYuCglM3OFSG7x0cpAc4I3hArdaE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=HIpTqdEH2NnMH2SXfTeBY3e2Yb1mnBDg3sCzDIc37PGAREk/FvRTmUHox6LeIZnHl
 o/En9ZcC6VJdOhGUCoT4NvDhMJrF4UxiDfe/1wSowk/k6mM1P8O9YkuAmrlSsI6+zD
 kH0DgtSB0mgm49lmJDebtZAvUNmAA2rMUseoNqMRKVFMaGa3d67AcVcpQgB4OZVWPG
 flCBrou5md8xaKXqO/zLism8YO2JwjgkGsskSlwpUq5nciWxQ9r0zRsCH9E2rhup0P
 trjssaVYABUphmNxRNCKAg7ZpIWXGM8OK+wTlI3aaGcFyaCs4oePKwZ9aQquRg94UK
 g7I4KD+dPkp4w==
Received: by mail-ej1-f69.google.com with SMTP id
 o7-20020a170906860700b006cbe6deec1bso510278ejx.22
 for <openbmc@lists.ozlabs.org>; Mon, 07 Feb 2022 03:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Tn4bc4zR8BLXzuWSYuCglM3OFSG7x0cpAc4I3hArdaE=;
 b=tFmBao7ji21eue3ekJxRj9u/8pZa5WGT0meyDjqrRja1kuFwKLM2KcS1yRFRlH6s5d
 TAv31ET/Te8TSx79Qna+PugJoiEceL3HTi2d72AQURw841w5FFkpl5wLvxQ4JBIx3aku
 0lpzUm57jrXJno0m3WxfZ3CiyRLPEZ2M+IjiXGR7b4BikAjDx958OFlSSaxv76EZa4AF
 7307jhY+X1nYSuknKsKW1nHFU1hLCTu/5GEpBBULkyefYlmMCzptDQUdn3MGdnCO0T3x
 G9lNstOjsJQAy0gqNs5CDKFlB0vCNu6SgUlhcj5G1ad9ICbwL2yYDkHIoS6TcwifH92b
 mUdQ==
X-Gm-Message-State: AOAM531tYUl00ulPpKrT7wkdFqdvoO2Xpxo5OrWke58VQG9Nhjj5bg4f
 cBaaYYPA2LTmto3vQmawv5BJf7V4viVDjjTMfadCIaf/RJTMKh9B+0ozhQP046oKhaaIMYNNzA7
 bLj/iw+g4gXmaltvyhFJ0kFYLDlT0XMOlc/Us
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr11159383edy.234.1644233273262; 
 Mon, 07 Feb 2022 03:27:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4ZPRw7J+5pEKOaY5Z7jldo/XTG3FVjdDvBj6oSzyzQCPUO8pkxiH+YwKpJrz6QXStMDjdRQ==
X-Received: by 2002:a05:6402:881:: with SMTP id
 e1mr11159366edy.234.1644233273056; 
 Mon, 07 Feb 2022 03:27:53 -0800 (PST)
Received: from [192.168.0.87] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id z19sm3611505eji.87.2022.02.07.03.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:27:52 -0800 (PST)
Message-ID: <a3ef9a3d-951e-c7b2-f4e5-ec613997501e@canonical.com>
Date: Mon, 7 Feb 2022 12:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Content-Language: en-US
To: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 13:58:20 +1100
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

On 07/02/2022 07:33, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This commit adds compatible and syscon description for NPCM845 i2c module.

Do not use "This commit" but instead:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

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
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of system manager register node.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - clocks
> +  - syscon

This breaks ABI of existing DTS. Actually your driver change does it but
here it is explicit...

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


Best regards,
Krzysztof
