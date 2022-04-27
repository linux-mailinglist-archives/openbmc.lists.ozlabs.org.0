Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F225148F5
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWcz6h7Hz3bcQ
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rq0vUpX2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::630;
 helo=mail-ej1-x630.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Rq0vUpX2; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpPYM4p67z2xCC
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 02:37:24 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id j6so4474785ejc.13
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J/YKQZJJA+ogT3/a4U1yoxjCA4/ZVLkuY10wH+/url8=;
 b=Rq0vUpX2noDFfwzl1T7aznlztl4rUv32V26rOZSrnHEUew+gr/+RppDXrUXOCCTJaS
 zVFbC04LvMH39ZviDMvJJg9XReaz2bTDvX08S8SIuAvjIW+cHu/sCkhFAZEZtAcDt0G+
 anr07GVzgWFwT0gmCtzza4H03UsEsXAJsby/DLoGMLa5/eF8koOLMTJi4yeeeBF9aYeH
 Pa3YD0Yf+hOOOaxww2YVyry98d7ZMNLRuHiznjposx9RjhwoZGJBItA/hN+V6PE4WFeP
 8AEcOTjmoDT54/cgpB+Q8utWh4kR3el/kgl6vPw2HMkkvfHQYKsyY/NMnyPBs4rQzuug
 UDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J/YKQZJJA+ogT3/a4U1yoxjCA4/ZVLkuY10wH+/url8=;
 b=cOUZPENEupUgzbhWf3obQDUfL7xVrdmMGn7q8gI2Smo9U7eGT0jIYr6EeseHz/loPI
 Q7UiUaiRa0aXCjOx1CTaPWLGLGEEk6iINMLTv3t3CjmPwgQLidjkDgjpy9GGH/l/PNwQ
 DsP+TSEaxHGxApFWYI24e/I402kJbJGh10faffnnqmhRjtfXBdxtb7AlAyF9l9AJRwTz
 GX86bFXTJtreDBJAhA5+KeDDEYubfT0BpwDSdH6e9kS9WI3yF5qLoqMADoURuN4IY3kG
 6ijqOYN7cnfv5SKC5WMRclwqFnYeJf2Eb+jXRczbZjAw9t1cHIEd1EYLrOpESQpFmoV1
 9bwg==
X-Gm-Message-State: AOAM533SrnLUpy6gT91p0r/rxL1Frqvssl6Be17mEslaT+qB7XeoxJ1U
 JdMQhDo6KjjT5fZLASYJJs0CVw==
X-Google-Smtp-Source: ABdhPJxUeMGT05JDUbQztMtjK+f5XWgcQc6Wt5A/Zx5c82Lq7VCC+s6KhF9pR4qQSR0RhsvcS7E4ZA==
X-Received: by 2002:a17:906:559:b0:6f3:8ba6:39c8 with SMTP id
 k25-20020a170906055900b006f38ba639c8mr17537928eja.486.1651077442041; 
 Wed, 27 Apr 2022 09:37:22 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006f3d4b12d41sm284727ejc.177.2022.04.27.09.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 09:37:21 -0700 (PDT)
Message-ID: <5139dc9f-96c3-9f20-4c62-feee902cb5e6@linaro.org>
Date: Wed, 27 Apr 2022 18:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <20220427010154.29749-2-zev@bewilderbeest.net>
 <178b9310-a854-dfa6-a4f3-f971b608abe3@linaro.org>
 <YmjmWNUpCAFYesyk@hatter.bewilderbeest.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YmjmWNUpCAFYesyk@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 29 Apr 2022 22:12:55 +1000
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27/04/2022 08:44, Zev Weiss wrote:
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  nuvoton,tsi-channel-mask:
>>> +    description:
>>> +      Bitmask indicating which TSI temperature sensor channels are
>>> +      active.  LSB is TSI0, bit 1 is TSI1, etc.
>>
>> Need a type/ref.
>>
> 
> Ack, thanks.

Did you test the bindings after the changes? Using reviewers time
instead of testing by yourself with an automated tool is quite a waste.

Best regards,
Krzysztof
