Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00164D5E1E
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFKzX5pFhz2yyf
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 20:15:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=U3Y3JvFp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=U3Y3JvFp; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFKz46rSkz2yV7
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 20:15:27 +1100 (AEDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C4B183F1A8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646990123;
 bh=3MfF2oKCAD91dLAjcIPW4+1KpuK6qxbRKyhRZsrNxAc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=U3Y3JvFpIeZqWvOpyzc3vJsSPhavhMvZTu7bVt7D95yxVV2PWLgMFJ1qipGs5Pj9s
 D7000J0HvOdZQK/Uf8xMNxVDgjO/0WKrUM2rwR7K7kGVh3AcKMcEpTIKNcYuw6sLil
 7ybheFtKSxU2qAeSGEpcdlXKBzdR8r6PH40F8K2ObVmGDUrSEuAipmWwDQ51/Ylny+
 hBsrwuFvAI0sPCI1TpkVEQkm708Wly0tYhW9z0AdPppXRQKCHl2qt3rfxcYyBP40pE
 SKoUEvbbnFPSSLDee/ja/5JmwXEEibT8X7EnqFFj7P5Ry0NbFeZ1QlHvVXgoytMnj1
 nyB8Gl9PDW3+g==
Received: by mail-ej1-f71.google.com with SMTP id
 gz16-20020a170907a05000b006db8b2baa10so2199356ejc.1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 01:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3MfF2oKCAD91dLAjcIPW4+1KpuK6qxbRKyhRZsrNxAc=;
 b=TpZKlT0YEGVdqHKF/E/3GLDIi2vgewp6bXbegIP+2Fy3May7nL/HzXbpL5ILKnjYvl
 0Djn8vKfNtI1L6bdjcAlFKgUFn3pg1foa+PwIWagAQMQ0p1Pb3NdW2G9MAy64+jcxUS1
 bWxBRStTW5GRmgA0UUFb1LaAPDgteIiQbWVsX+yK02vDNVkzEj4JdfUcr8BZJnFazgKn
 EkxT/DLLxEB1Ucoy3nwD3J3//emxxKVaZEyvas1MYhewkM/UoLRQsEToBbuk+HpzktYf
 lFc1xHH8wcRwrIssL9Saz2tgbDmomGBF94eIYnN196DhkfKVEQMVqpqmviATUPSUsF8Y
 2A7g==
X-Gm-Message-State: AOAM533AKavyLvjsugFiTFAndeDG/duoGGNCdruJhhtldMD2Q+0x5zpQ
 8zYzOitkrDUnSMW0nQ+f+VOmHNMjfM90dbNLSmB8kgagN1QpfFX+dMhU4wjsAIkjQE9DzR8om7y
 fD9BlAaBUBAORh6m1S8YVihvdhaW7bUvs3A7T
X-Received: by 2002:a17:906:dc94:b0:6db:ad7b:9068 with SMTP id
 cs20-20020a170906dc9400b006dbad7b9068mr917616ejc.224.1646990123483; 
 Fri, 11 Mar 2022 01:15:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyc3valO4s0TDo4cDXykhAMo8H6v3V0M4V74fs99LPFrNHprmdOLmDK1lYHTfG/oPV8ZkvWEw==
X-Received: by 2002:a17:906:dc94:b0:6db:ad7b:9068 with SMTP id
 cs20-20020a170906dc9400b006dbad7b9068mr917603ejc.224.1646990123277; 
 Fri, 11 Mar 2022 01:15:23 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906471200b006da8a883b5fsm2684372ejq.54.2022.03.11.01.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:15:22 -0800 (PST)
Message-ID: <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
Date: Fri, 11 Mar 2022 10:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>, rric@kernel.org,
 james.morse@arm.com, tony.luck@intel.com, mchehab@kernel.org, bp@alien8.de,
 robh+dt@kernel.org, benjaminfair@google.com, yuenn@google.com,
 venture@google.com, KWLIU@nuvoton.com, YSCHU@nuvoton.com,
 JJLIU0@nuvoton.com, KFTING@nuvoton.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, ctcchien@nuvoton.com
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311014245.4612-4-ctcchien@nuvoton.com>
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
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/03/2022 02:42, Medad CChien wrote:
> Add support for Nuvoton NPCM SoC.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>  drivers/edac/Kconfig     |   9 +
>  drivers/edac/Makefile    |   1 +
>  drivers/edac/npcm_edac.c | 714 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 724 insertions(+)
>  create mode 100644 drivers/edac/npcm_edac.c
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 58ab63642e72..757e1d160640 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -539,4 +539,13 @@ config EDAC_DMC520
>  	  Support for error detection and correction on the
>  	  SoCs with ARM DMC-520 DRAM controller.
>  
> +config EDAC_NPCM
> +	tristate "Nuvoton NPCM DDR Memory Controller"
> +	depends on ARCH_NPCM

|| COMPILE_TEST
(and test if it compiles)

(...)

> +
> +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
> +
> +static int npcm_edac_mc_probe(struct platform_device *pdev)
> +{
> +	const struct npcm_edac_platform_data *npcm_chip;
> +	struct device *dev = &pdev->dev;
> +	struct edac_mc_layer layers[1];
> +	const struct of_device_id *id;
> +	struct priv_data *priv_data;
> +	struct mem_ctl_info *mci;
> +	struct resource *res;
> +	void __iomem *reg;
> +	int ret = -ENODEV;
> +	int irq;
> +
> +	id = of_match_device(npcm_edac_of_match, &pdev->dev);
> +	if (!id)
> +		return -ENODEV;

Why do you need it? How such case is even possible?

> +
> +	npcm_chip = of_device_get_match_data(&pdev->dev);
> +	if (!npcm_chip)
> +		return -ENODEV;

I wonder, how is it possible to have here NULL?

Best regards,
Krzysztof
