Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 541AF4C5A8C
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 11:59:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K60rH0bmHz3bVH
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 21:59:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=bATA61xM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=bATA61xM; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K60qq5xzgz2xsd
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 21:58:46 +1100 (AEDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 540F93F4B4
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645959518;
 bh=2bOCiusGq2ul/MWsE8cSC2kGM7wquiIO9nYKtCZH63I=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=bATA61xMq9rLGkt6t5BC9H4jpR6EW41nnCA5E1ZX4+Tck4E70nDedfeDVvq6Izoiq
 kc/Wl7VbUNH6FpGc24aO4SUfNaKVYRAsGwwhIAIPwsg1hV5nc33lAIKDD0ZOnd4Vc6
 c14Bp0VE5/wPE5lvRX/EWTBqynxB0ntgN1gMgOmb8eGyXCF1Yuijms4M64o9Dni8MB
 pNdkb2MdJwhjPMa+1DMNtOelJIjPpP5foMh5Otwg4GhxxwQ+rdw7b5e9pnm00Jv2ch
 tkjSMXQtUrBnopJbUfbVyytzVmyWMsMP91DgTxdAPDPMPNhG4pp4JubUSr+nEPQI2G
 t2AhGb9NRCeIA==
Received: by mail-ej1-f72.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so4364777ejc.5
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 02:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2bOCiusGq2ul/MWsE8cSC2kGM7wquiIO9nYKtCZH63I=;
 b=6/uZM/jrvuXJTdBRMhtBUlxVuNGwG/ozooosg9J3RaDJuYglkUDJGBOzo5oM2f5Za/
 5QHdAWXXcvbTv3GiNToS/fnyz1SEXHS3Qrc1x110iN9DHJfcTaVIji13h5H3+Qi05CIc
 PCQVC+8UOTfXMF0+b/kj3DOxahHNnIDKr9q6gT9hHSq1Xz8F+q2TWf1uUxAuDAbBPdkm
 s9Rm8xyU8ef+YzctSz1Tn70S8GSNHqDXq2uGbl4pWTRxvzomozHk0hbW8Y0p86Df+wl2
 DijC35yiMwDCO7VwT67tNeQIz+X/XCeSHUmgdbJwiY/ccs17v9WbTXVld+GQUTLBxAy8
 GFvA==
X-Gm-Message-State: AOAM532Lm++C5U+FcTbuaAuGVIeBl/YvguuSg1XHFeCL25uX5HTA76Gw
 vGQUtIue11O2L9YUnTkU1wCVEwMIwlxHNwbuyzfbMODmiP1sxcAow/AI5YTI0EGKFPHpR/su3Qs
 MzY1zO4egkvVPy70s7bXjnNpxZfQxrvtET9aI
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id
 b13-20020a056402350d00b00410b608ff4fmr14922908edd.89.1645959518000; 
 Sun, 27 Feb 2022 02:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoFbq1X2KP1qKbtNx82/SCmsEevJmYxZ2Bf2LLbkURS/vDpov5C3QYi0mxgeV/lId9Uap8Sg==
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id
 b13-20020a056402350d00b00410b608ff4fmr14922898edd.89.1645959517865; 
 Sun, 27 Feb 2022 02:58:37 -0800 (PST)
Received: from [192.168.0.133] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 t2-20020aa7db02000000b00412cd5d5148sm4403973eds.47.2022.02.27.02.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 02:58:37 -0800 (PST)
Message-ID: <e6f3ceb8-7b02-020a-7b2c-07520f6d9661@canonical.com>
Date: Sun, 27 Feb 2022 11:58:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] dt-bindings: hwmon: Add nuvoton,nct6775
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
 <20220226133047.6226-5-zev@bewilderbeest.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220226133047.6226-5-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/02/2022 14:30, Zev Weiss wrote:
> These Super I/O chips have an i2c interface that some systems expose
> to a BMC; the BMC's device tree can now describe that via this
> binding.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../bindings/hwmon/nuvoton,nct6775.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> 

Bindings should be the first patch in a series.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
