Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C7510C34
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:49:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnxsY6Zvqz2yg5
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 08:49:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jLV2GfQt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jLV2GfQt; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnmQY2vPRz2xnC
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 01:44:20 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so13772442ejb.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 08:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UtKJOFY/mUl/Tg+ilRJKWK8Hg/J66eiozbJhAIV6Y60=;
 b=jLV2GfQtaAFXgShKWfnQPBv10gJWj1Wth8eM5zWxrMu7NIoIEYujdRm1v89VNTLfMl
 H9L1nEpyFj8p8lxgMCf8PazYAwkO5g+8yxzMxlgwhqcj6L+pq97npcibig1u3tZUt1yy
 uj75ob0ySR8pbD283jo4IPgNG2CBZdpwiVqK/6btGS2YsZluVkkANgqYOoqDG2T7xhbr
 BPeaun7xyknvKbKhYifZse/wwVTGirS1p8CMTHtp5HmkrAtA8HG0ULHbgZQRj+Pi2/Vh
 BI2M+ECtuhci0G7+pXlYg6dpHIgTpc4HnwsoYbCeYP7rRrgikarfx/IWqHSLpdN7pPn0
 52iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UtKJOFY/mUl/Tg+ilRJKWK8Hg/J66eiozbJhAIV6Y60=;
 b=FEO4DEk/06ENxwbeg0W9n3V386LvbDWVxiaMW4f7ACjlLni40KK54UreYkNiTTXJqT
 M+72GL55iTfc0HGtc4xHmWSHborfMF74sK+2nzKfhvGqi4r9rWGmcMF6X86lOuAgifTO
 voI/snpyhy51RtOXqL02zcKAFlaDw6qoU6tHpW4ugMIG1smpqUFkdz71ss8uvEldGcq/
 mERfRpdDh8yAea6ePNM7eT+HNnrhQKZUq6oCVTodrJpnNjukMRB8sVhv6OBIiX0jfbWQ
 +U81BNatJ71kb19F3A1ShWlUq8EEuvIGBvc06oRF/wncmPWp9JS+jL4PgxXhGid1KBw3
 0b1A==
X-Gm-Message-State: AOAM5312uvhX8npSIxn4VZAhY8s/nYzUDbwhtcUEqAcMtvwMDE6WoYqe
 6a9rFOXrYq+mntvq4BwGo+m/Rg==
X-Google-Smtp-Source: ABdhPJwxivapUiK2Wt2L37iMSo4dtf4bon9f4q59LEzx+egpPW0vj9YwaSe4VocYKnrvV0mNkFULUQ==
X-Received: by 2002:a17:906:6a23:b0:6f3:7cf8:d586 with SMTP id
 qw35-20020a1709066a2300b006f37cf8d586mr14479759ejc.360.1650987855860; 
 Tue, 26 Apr 2022 08:44:15 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 r19-20020a17090638d300b006d6e4fc047bsm5163826ejd.11.2022.04.26.08.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:44:15 -0700 (PDT)
Message-ID: <0064f937-1f8d-3d1d-4ea1-bb8d24bd605d@linaro.org>
Date: Tue, 26 Apr 2022 17:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 06/11] dt-bindings: watchdog: Add HPE GXP Watchdog
 timer binding
Content-Language: en-US
To: "Hawkins, Nick" <nick.hawkins@hpe.com>, Rob Herring <robh@kernel.org>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-7-nick.hawkins@hpe.com>
 <YmcbCgjD85lIRMSf@robh.at.kernel.org>
 <PH0PR84MB171845F606BC40AD653BEC8888FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b9d68100-c6f3-4f58-fe42-63f4cdf1dc50@linaro.org>
 <PH0PR84MB1718D9B549FB0CC6FDDAA19788FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR84MB1718D9B549FB0CC6FDDAA19788FB9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 27 Apr 2022 08:48:57 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/04/2022 15:52, Hawkins, Nick wrote:
> Apologies, I did miss the comment about the double spacing around the label and the label not being necessary. I will not make this mistake again. I became focused about the comment of mapping an entire register space which indirectly lead me on to the path which I am now having the gxp-timer have the gxp-wdt as a child. To be specific the feedback I was speaking of above was about the gxp-timer which is here: https://lore.kernel.org/all/704ffa56-4bae-fc33-fddf-3e3dd8be0db9@linaro.org/ That is the children must be defined for a simple-mfd device. 

This was comment for this v5, not for previous patches. In this v5, you
have a child of timer, so it has to be defined in timer schema.

This was not a comment whether a child should exist or should not. It
was made under the assumption that you want to have a child node.

> Hence the plan I have now is to remove the hpe,gxp-wdt.yaml entirely and include it in the hpe,gxp-timer.yaml. I assume that is the correct thing to do?

I would follow here the advice from Rob, so since the blocks are mixed
significantly (same address space), then let's assume it's actually one
device with two functions. In such case Rob pointed out that child node
is not necessary.

The implementation might differ, depending how the features are mixed-up
with each other. It might be one driver having timer and watchdog, or
several drivers (usually bound together with a MFD driver which serves
as parents and binds to the OF node).

Best regards,
Krzysztof
