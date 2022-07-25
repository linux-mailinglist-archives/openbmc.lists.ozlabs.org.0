Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 332865807DE
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 00:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsFmR15mPz3bgR
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 08:57:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsFm93SnSz306K
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 08:56:56 +1000 (AEST)
Received: by mail-ot1-f52.google.com with SMTP id k25-20020a056830169900b0061c6f68f451so9740010otr.9
        for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 15:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8G3Mm+NgIeVbS725ckPK31yPoR4kpxEiiHwhot9k/Nc=;
        b=SO+lXpWcJew8x9bNeKDfDGmgC4gNtxsu7BpqdKUwlL1G8IWCbsiO3mmk9W0jh/tEIB
         HzQrAdVBq7LWHU6JEp4XH9kAXuTdDOzBOU4FBEOFGUYTZeRoy+dthU+ExBYMUkSfc0eK
         WiaOCjhAPqsZMK8nJ4mRCvI7aeNsjHx+piYO/tbrXGMlfgwu5E1YzP4UETk8scHXLieg
         NMPf5qSSJ0c30XBR1a0MsO7SdT1fvoXhQSNgWISIRSfRDAs8IXEzuXjkX5dT0/GtcIzW
         QzcMmyYsUsx35YUY+FqUSfTHK98q1/yLuYYqF/klCpveoLIdHtPa5bN/tjNwKAR0n55z
         fOBw==
X-Gm-Message-State: AJIora/JXOPu7fHYif7Rcn/I7W/fOvPtOUabUbQ8ay/vtWD0nmRXZp/4
	+qvztox76/d7wkjxJkkPwg==
X-Google-Smtp-Source: AGRyM1uK8ktfyXTn2VznXnPkErlmaz2g0keJTy1EP9+gYpUQVBWi5vIvutDGqn2Kvhy6iuZ6pso49A==
X-Received: by 2002:a9d:7a59:0:b0:61c:e43d:eaec with SMTP id z25-20020a9d7a59000000b0061ce43deaecmr5770927otm.7.1658789813917;
        Mon, 25 Jul 2022 15:56:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n8-20020a0568301e8800b0061c530ec022sm5445611otr.79.2022.07.25.15.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:56:53 -0700 (PDT)
Received: (nullmailer pid 2904901 invoked by uid 1000);
	Mon, 25 Jul 2022 22:56:50 -0000
Date: Mon, 25 Jul 2022 16:56:50 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: spi: npcm-pspi: Add npcm845 compatible
Message-ID: <20220725225650.GA2898332-robh@kernel.org>
References: <20220722114136.251415-1-tmaimon77@gmail.com>
 <20220722114136.251415-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722114136.251415-2-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, broonie@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 22, 2022 at 02:41:35PM +0300, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 PSPI.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> index b98203ca656d..a4e72e52af59 100644
> --- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt
> @@ -3,7 +3,8 @@ Nuvoton NPCM Peripheral Serial Peripheral Interface(PSPI) controller driver
>  Nuvoton NPCM7xx SOC support two PSPI channels.
>  
>  Required properties:
> - - compatible : "nuvoton,npcm750-pspi" for NPCM7XX BMC
> + - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.

Who/What is Polog? Board/BMC vendor? If so, that should not be in SoC 
bindings.

> +				"nuvoton,npcm845-pspi" for Arbel NPCM8XX.

Same for Arbel.

To answer your question on fallback, just put:

    "nuvoton,npcm845-pspi", "nuvoton,npcm750-pspi" for NPCM8XX BMC


>   - #address-cells : should be 1. see spi-bus.txt
>   - #size-cells : should be 0. see spi-bus.txt
>   - specifies physical base address and size of the register.
> -- 
> 2.33.0
> 
> 
