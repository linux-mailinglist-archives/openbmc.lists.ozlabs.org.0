Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BA6C1F10
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 19:08:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgN5L5zhjz2xG9
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 05:08:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LpTTMMaM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LpTTMMaM;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgN4k2l5Hz3cCy
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 05:07:48 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id r5so14159946qtp.4
        for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2023 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679335664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3ZgQ6hbDwLFA0+/6XyOTTwas24M548/DGldx8bD/B4=;
        b=LpTTMMaMAGr1wg0gxQpPPQJcst7GYq7vYAPtjRVIP8cmaf+ovoh4ciEsHhfsjI72S3
         LNmMof4lp289jUlBGm0qH75LQ0CEWWtVzCRDcHNa1zAYsdAXZmdAnNtD4MLAi+g54KPj
         4H227WE8o8Kf40sjsZo96JnijcrGtUCo6gOS5QHwi1TfT2ZtLLmtiFq3AQd4IpH/iGc/
         XRmMRfibPzro/QdkcU+II9zbngeGi2EO0U2WjN2eA/BXgZBHd0ODyvvxwIfX1g2OpXjH
         8qDJcZy+sq6X/Oa5xQqs6yjdd2aYZHxya+sjOqGm/5hthoBF+rPcqikSfMc0B9dW26dC
         xVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3ZgQ6hbDwLFA0+/6XyOTTwas24M548/DGldx8bD/B4=;
        b=jajcmPNKHSMGNaYaIt6VIGPl7tdnYHIbCAnZOtOLRVruwPRK4VY0sn25aO3ixBNqhq
         k5cT4EGGvGqlS+EC/b79Ra+rBAr2oeQuTD8SV8H2NlvDXgcGqtfvvtltQCPj9jP1yLPg
         KApu2MhZGIYwCUKDIrBNZUSDShlXYKFPssL3NZnFIH7YsS+46vHaFFe/c7JJY4yjIyRy
         hqyKjvMOdGLKNlUERnsMlUkWph+heX/PXqTPaiBT05vLeJiiEeFmEZrvpW4e1z4/Hruq
         ErnE7vgAdPWlSeO4duuREHZZTTRpaiNcL1yl6j6kphx0kOmrFujRObGvJum6mhiC9uMv
         LI9Q==
X-Gm-Message-State: AO0yUKVtebX2MOwuQocqb06TUZoPxZ9ZTggTJRXhE2V/uvNyhTT0sZfc
	5CchhnQaGVrfNw5qJZVw70s=
X-Google-Smtp-Source: AK7set8AD38+i11dYanB4qCBbmNUzfei9aCNLyXLYPG8CRg4osCls4SV6Aq39hM7qRY/j3bqRVDkuA==
X-Received: by 2002:a05:622a:180e:b0:3bf:bb1f:3c2b with SMTP id t14-20020a05622a180e00b003bfbb1f3c2bmr198499qtc.6.1679335664447;
        Mon, 20 Mar 2023 11:07:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n3-20020a37bd03000000b007456b2759efsm7789701qkf.28.2023.03.20.11.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:07:43 -0700 (PDT)
Message-ID: <b7057b51-540f-54a5-aba2-8f44da832289@gmail.com>
Date: Mon, 20 Mar 2023 11:07:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230317233634.3968656-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/17/23 16:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml      | 2 +-
>   .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 2 +-
>   .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
>   .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-
>   .../devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml       | 2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com> 
#brcm,brcmstb-waketimer.yaml
-- 
Florian

