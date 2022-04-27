Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6C05148F2
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqWcG69tBz3bc1
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c3w0b4Mo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c3w0b4Mo; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp8lw603zz2xX6
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 17:00:42 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id i19so1469257eja.11
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=knB5re2yE+knNYDwWLwV5oj9zfgG60eQTuuGICfcavo=;
 b=c3w0b4MoE63PeggJZgNSDCaIH6w9y7ctbyjC63+q6frBaZhU1HZvhDLJnumNuLC5u4
 Nom3enBsHvBvXVYwcflIWz5ouuAp0idEknyYRARXXG4rjRntZCpRwOtsqBnDB4TAfLEf
 r2Lnae9ns34uBM2GarNe07PaIw6KiCNkM4+I9D/Fv4rmkCXUEVfZxKuoeBmjGXV6gReW
 c49FxJSSDom/8zrKN9OB0FNklDPH9QDZZ19SAc61MAjWGZADreyaxIsn4AWtkWGuC3ue
 gzsMFhQanpPLoglKdHGfJptXIr+Jx61vIfGynY7IYeqvqrdM70GtgZ4Ywc9roPGKEQfs
 Ld1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=knB5re2yE+knNYDwWLwV5oj9zfgG60eQTuuGICfcavo=;
 b=IdZqrDqdSXeWuL18S/t9TPwLHJ43AItOZXX0ybuED0vS4ygp4OeEFsIfCUeMhl9sBR
 YGXmk0C4Xi7tlqN32bsMq8z60En5KpHbTuuEnAUOvFlVxUaGT/OpGvK+CA0RBb0D33dh
 2YiPA+++xSUVfM8DxxfwFN88YDohIXFdKCqb0HKcerk3WodEc+JvNoa/wQKDZzOb5frP
 TjkSh0WvPfstwXAGr2/vZQmGvd+5h5YRvetCErLILPYAV+iUCo1Ys1Cr8D64V4jy4Mo0
 64mTLPeXrfXGRfCCTLp+eAtkBVfMAVou8w03P/LXr7b83hNe0jv2nT+zpqU80/+OyUG1
 GHmg==
X-Gm-Message-State: AOAM530NoivU5+VIq2y4loDLwtycEXq0y6O4sjw4JkOWXtCiS46C8sNy
 Z3G9daSZfEdZFBOaqAodq+9rBrIc8OsW9Q==
X-Google-Smtp-Source: ABdhPJy42PnL5k6WxDMHs9qpbs1kW+ltaQb338xJc6J452058yJtzF813cfMVtTrgpuVYaW3axL7/g==
X-Received: by 2002:a17:906:8982:b0:6f3:95f4:4adf with SMTP id
 gg2-20020a170906898200b006f395f44adfmr13223466ejc.524.1651042838202; 
 Wed, 27 Apr 2022 00:00:38 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 x14-20020a1709064bce00b006f006948581sm6267366ejv.170.2022.04.27.00.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 00:00:37 -0700 (PDT)
Message-ID: <a3d9f68d-9101-2749-a7cd-5a4b3595a07a@linaro.org>
Date: Wed, 27 Apr 2022 09:00:36 +0200
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
> 
>>> +    maximum: 0xff
>>> +    default: 0
>>
>> Since by default it is disabled, doesn't it make a required property?
>> IOW, if you add a node without this mask, will the device operate
>> properly and usefully?
>>
> 
> Yeah, zero active TSI channels is a totally legitimate way for these 
> devices to operate.  TSI is just an optional source of additional 
> temperature readings that's used on some (AMD) systems; all the basic 
> Super I/O functionality works fine without it.


OK, thanks.


Best regards,
Krzysztof
