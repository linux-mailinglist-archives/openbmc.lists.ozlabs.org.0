Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A74D5E3B
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:18:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFL320MZrz30GS
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 20:18:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=l/WPif1a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=l/WPif1a; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFL2d49bxz2y6K
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 20:18:33 +1100 (AEDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 80F1F3F4BC
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646990310;
 bh=IxdbcL7k69aeR5PAgcBMvpQeQoS7r//O6hQJcwASqCA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=l/WPif1a67A5Y8B5bMnb2J1+d1C0zAmV2DYLbQmtBPf4zMdtnGV3BEZMpf6zpmVwu
 MSNCVZzp9LzB1d87TJwMXuPG2xD/4UC0HcDAoOZ1Io/y5LbpiJY+qYDHDzGQrtKjTb
 W2wHB0AOt2pw53RW/lMxbpo4nAoPmqOxnUxcFmGq/3lZYtnG858ABKsBFunuXMDEYa
 fFZMuBQD/ot8lvWMwelCwAdMMXFB9Hn3AelsG3uOlFif0NqKRP0Z4YdH47Koioio/B
 3Gon3QZSVndC63zyLvpISxtBICn3TYyovBwM/aLFBLyBVr2lrkdycO3jjI7ICFPPwK
 y3IINbnVwFevA==
Received: by mail-ej1-f69.google.com with SMTP id
 ga31-20020a1709070c1f00b006cec400422fso4589941ejc.22
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 01:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IxdbcL7k69aeR5PAgcBMvpQeQoS7r//O6hQJcwASqCA=;
 b=2IkOoPvGZXVCR2QraTSr9e6ZnRPe9NXM16ItLGegt6EViP039DGVOj4KZ6eiXlA4sd
 rb9yRDuaJklZOPOzufdS1oTKNd3I3dD7NlTl1Eqr0Ix5VVUcYT0vr5M0ewyaQH7rOF58
 TmMjly9Ee9e21jBNV7TgVBSgqgpWFSzJW6SM/hu3OLhHF04fy1ELw2sFjrbizKHiOb3q
 XuCAnnom0dAQP7Fr27F9d2zS0qJUd5rjuhTGqRSvrSObVfN88Lus11t/vWlZaussZXwM
 ZXNlKsego5+RqEgNWbODf2rTnbcdPD152Sn2k9ylUTFMoY8LpA/qdgTkDa7gwhvivav2
 Znyw==
X-Gm-Message-State: AOAM5329Xhpopqb1TqjXOJ9SQ4IeFc1CR254Tt85QONTleCKFgA7207g
 O0DfROSvEbNFj1ak88VGu234MAfveJEMLHy7TqQh9Pb7CjGw3Lmf1tvTsIpEoOqTfrMqwd2TrA4
 tONd6FKekLPb2twJ5BLFTnDU4wniGlp83xgic
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id
 p21-20020a05640210d500b00408f881f0f3mr7969311edu.112.1646990309093; 
 Fri, 11 Mar 2022 01:18:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJx30zZcpXpgPnCtN4/x64kV31WgzQQ1W7CmqqYo9CyZbalXQfJsGU39fnHARIBZSBH2iX0Q==
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id
 p21-20020a05640210d500b00408f881f0f3mr7969298edu.112.1646990308915; 
 Fri, 11 Mar 2022 01:18:28 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170906078900b006dac5f336f8sm2712366ejc.124.2022.03.11.01.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 01:18:28 -0800 (PST)
Message-ID: <3f77c8c8-4bba-007b-fae9-5fb47f44719c@canonical.com>
Date: Fri, 11 Mar 2022 10:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/3] dts: add Nuvoton sgpio feature
Content-Language: en-US
To: jimliu2 <jim.t90615@gmail.com>, JJLIU0@nuvoton.com, KWLIU@nuvoton.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 CTCCHIEN@nuvoton.com
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
 <20220311060936.10663-2-JJLIU0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220311060936.10663-2-JJLIU0@nuvoton.com>
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
> add Nuvoton sgpio feature
> 
> Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
> ---
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> index 3696980a3da1..58f4b463c745 100644
> --- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
> @@ -329,6 +329,36 @@
>  				status = "disabled";
>  			};
>  
> +			sgpio1: sgpio@101000 {

Generic node name.

> +				clocks = <&clk NPCM7XX_CLK_APB3>;
> +				compatible = "nuvoton,npcm750-sgpio";
> +				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&iox1_pins>;
> +				bus-frequency = <16000000>;
> +				nin_gpios = <64>;
> +				nout_gpios = <64>;
> +				reg = <0x101000 0x200>;

In each node first goes compatible, then reg.

Best regards,
Krzysztof
