Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0B4D5E3C
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFL4Q0bPtz30Dv
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 20:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=usMld3WJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=usMld3WJ; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFL4165MTz2y6K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 20:19:45 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 386AF3F79C
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646990383;
 bh=Av5kn9IVqiEMwOUuim1I4aokjkuB5Y7LLwWdVqqCtTY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=usMld3WJmmoljeuQyPGnz8rFhm14g5H+hEMo0fF1jnNi0rsN3TK5gc+I7Mro0ohN8
 7jeFd8kDgRXWpVtT8nq55F6WJ8wFsiV1GLiui+NPT3CPWl54gg3+CI7FGc6/PyUZFR
 PbvLHEEWOxg+OFo84C+sdfDHXRCIkTJoOrz+3r2ZoGws1ArRxpS3G//jbiyVD6zRAY
 BVg4bgi8qZEq492wE5E+YC9pQDVrUw/xajPEMiTTLixLaNK2dp43V+HrocBhekD1Im
 QLJQIP8+S9aWLDvaamFdHvNZIx0MSYeodWjJZlt2kPEYHLPjYPnQPY/57I3soQDIFj
 dSS8emon/ZTYg==
Received: by mail-ed1-f69.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so4558078edb.6
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 01:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Av5kn9IVqiEMwOUuim1I4aokjkuB5Y7LLwWdVqqCtTY=;
 b=HJDMfV8teditJXP/piwyFehYHc8UF9/+hIRpAlOnIspuOyHAGDnWCFk1uWWwsWe93d
 SWWaXJ4bRyDCswd/pKEmsypo6fs1yV9u616K84GFyWAKNnwRbVBd5s9WHHatTt6DwPPI
 S96Ro5RwsZ3T98lWAbYiR6p/pbVuLdTXGnfflVfIV4RZSSN8Vk1+xmxFLbJHBaqK/B1T
 q70bvhaWqFSbUst5NzD1XLJkCg2FVS3alnjrAaadB8jGLrnuG/J6T5VkV/eRzjFGO0vZ
 fp8XoQ5/ZRi5mRJCh+052ny1n9hmNqQAO+DBZ2bICb3IRT16Yp0xKJD2phRTQJTVLRri
 ECBg==
X-Gm-Message-State: AOAM531jnC+AYJGuKC233/Z3dAUjuD4Xon8oxfsiOAZrGxphNp446X1h
 oYxt/DUpWpm3lWQsPUtKlfVxM2YeP8elIGzbVi52TLoqSjrRmXxUG0pYlfZOZDf5WBpQzuXdxSv
 j9tLOo/ZT07SqfeohPfthziJ1sySNtnH40io9
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr7637831ejo.469.1646990382313; 
 Fri, 11 Mar 2022 01:19:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRKm1a5/uP3YrjyiVawWXoAkJeYr2NNxwI/Wq9OKmU1+1AG8kKCcxyamOntOnZjVkmmrvOxg==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr7637825ejo.469.1646990382159; 
 Fri, 11 Mar 2022 01:19:42 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 cf17-20020a170906b2d100b006daa59af421sm2741808ejb.149.2022.03.11.01.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:19:41 -0800 (PST)
Message-ID: <b0489963-4ddb-ec7f-ef0d-e48f99004be5@canonical.com>
Date: Fri, 11 Mar 2022 10:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/3]sgpio:nuvoton:add support for Nuvoton NPCM SoCs
Content-Language: en-US
To: jimliu2 <jim.t90615@gmail.com>, JJLIU0@nuvoton.com, KWLIU@nuvoton.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 CTCCHIEN@nuvoton.com
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311060936.10663-1-JJLIU0@nuvoton.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/03/2022 07:09, jimliu2 wrote:
> Add sgpio feature for Nuvoton NPCM SoCs
> 

1. Explain what is SGPIO.
2. Fix all subjects to match subsystems.
3. Check git log to see what subjects are being used and how they are
formatted.

> jimliu2 (3):
>   dts: add Nuvoton sgpio feature
>   dt-bindings: support Nuvoton sgpio
>   gpio:gpio-npcm-sgpio: Add Nuvoton sgpio driver

Space missing after ':'.

> 
>  .../bindings/gpio/nuvoton,sgpio.yaml          |  78 +++
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |  30 +
>  drivers/gpio/Kconfig                          |  12 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-npcm-sgpio.c                | 634 ++++++++++++++++++
>  5 files changed, 755 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
>  create mode 100644 drivers/gpio/gpio-npcm-sgpio.c
> 


Best regards,
Krzysztof
