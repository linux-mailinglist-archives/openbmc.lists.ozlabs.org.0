Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05049D9F53
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2024 23:58:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XydK741CDz3bVK
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2024 09:58:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732613986;
	cv=none; b=Dw70paWc42kTxTjZA0bENLVSL1P4X/Rna1qToImVEU9RW4KAX2gaUkkN8oxM8URhnCgBn8lRvVM8wmQsKTQ2DgiUhPy74ZDvYBSMjWVQVpH6MMlsyZhFjZ7MErbNuqEhwVYUvmEEjnqj8s8Bmbt0TVT+lGb3kfER+OdT1xYUEt6jGvEknSDq2bZXReOJU4EpfolQw0mT5Zr1+9fq0GUqvDjNTd0mc4jKShqsQDO8f9VYBCSNO+nGcd/RVyAicM1Q5iMi8PX1nYlTw8ce5XyiMKsTVST0pKK06+iLAQ6MgvxkyA2LnEgvB/cyTpZCcj1r+0gJoFfmTYuo4lCQAxHgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732613986; c=relaxed/relaxed;
	bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mw/FIA/dZ2dQeS2vkNk9N+89swAO3WYgKZKFnJGXECirI7Boip3184ljFfi5MdJka4T52pKQuw4FrnOZekNdhd0namPOqOhFG2HnPgA1Tbc/GzirQtqsUwXqrVtEeAu0FkXe77HtHY0xhQ66czDE5dXlUhuho04YYp4P+1FNDNJNDE/zav56LiBXtyz6awG8MC1lDFytQ+Y79B7JT2WPXvBd1dps7dh7Le/huXs43KmfD+ThL5aEnz2X6heCCneyod21Xcw4ztxGgSrHmPdToU2KF7DC5BGrJo5BJnqzThIu1sJYf2RCOrkAFkRvVJmTf3ElzQ6eqSHn8300tlNtgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A75G9XUv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A75G9XUv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyHbh29YYz2xCp
	for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2024 20:39:43 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3ea5a7a5e48so305154b6e.0
        for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2024 01:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732613979; x=1733218779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
        b=A75G9XUvFNd9mWFeg1v5QXEHk+3MabWDeTeVuISMysMrlWskC5xVuTYQTQQpdx+IHs
         l0Zxe0cF/E6FiudtPKk5cWiTgAoTmr9B9vaaYTyZdWQew51TnEJ5sNqsByBaPnBV/9Lm
         4aUmkqyDkcPDGfOMhwv3lUQRpzU02njYM9dC5N0x1w6to3b/yOktRPUNyVU2RXBQEFEG
         +ozdtR7P7KUBFtmkKD4wLsiuScNEOLTEZwkX309iCt5BfiK0TjK5sDFzytE0bS6S9mhw
         GmB0EeSEPOpj4wHrwpQwvS0PyOcrzSJP3ZsU9K9sSmrtTRJCjTS5GvALWE2fx7ijKwI1
         RkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732613979; x=1733218779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
        b=eWW/2GPh0yhRAKLR52HR28linb6TJ/WhfY32np309bb/sMCL+eOd+sm/3AJUijdjRH
         aUqJnFMY2INIRiEjHOZQUrN3wTjR1JrkYEBjFyNiG+vQsWWLMz2OO0L66oThE3PX3D/n
         wKMv4jvlvB03pXsv1j8u91fVniGt40/GoWN0pWdDVyGvLd2aaaBVHt/DuF0+MRpmuhYf
         SAUXTQjGCeE1sOz5emgK4wZ6C/UoJsQGGmDwEMzKkbpzjmwSUcZdd6cgCPA0NS+bqsGi
         DUPVDGEdUAzIWM9dXQ1W01VK++OadS80O+KSFgePtWusny3b+KHrnZOw6Nc1XYlutvP1
         9x2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWelVWS/LVFKlLxXsoY8+WkeCrQgw4IFi7cg7n2UxFHf8JOUod89x/cCEhhUbieCeamzqwR26zb@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMeDyEPC0SqEyX6c/LBe3kSKBcVfEBMa37XKft3zYXYffixpQs
	iDg4jjQ+uqTS0Emy51TteSbBcJoeK0T7jtriybFKlCDIeYxXx+Xw
X-Gm-Gg: ASbGnct1c441vl95/3ojwNKo1zDik1e86OjZcRbTVrci2DjAlZHXlsfE20nsOwm8EJX
	duBuvK6jC8WhCPMwALxbo6fW+r+MlVVZ41GpD1BJoyXt/5WIUNjQFt4f8yO+SpAwmx0MOzWLW6A
	yk8/6qris0RetzthXSNBizsdXYrGOQM94JV92hN09rtDf0rCrt6/LvVXQYXqvxY1KUb0KaM8Pzm
	6QemNkfKC3Rvk11kuBakr9As0kv5IkK5eZPkoZ9KIUX/mfkDTsxWmDEf+J9u3tP/DTyFb07MBqk
	sXOCikyFh1KpEri1nADKw5eTS9Ld
X-Google-Smtp-Source: AGHT+IGrPjDu68pnnnryOtllFazbBZWaKbpvb8qp33lzobhDwUA1rKma6IACU9y0c2nXW4nq4Bk1hA==
X-Received: by 2002:a05:6808:2395:b0:3e7:5cfa:87d1 with SMTP id 5614622812f47-3e915aef033mr13135476b6e.27.1732613978760;
        Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531247sm8159148b3a.104.2024.11.26.01.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Message-ID: <75e4881c-8b04-4b57-ab0d-e7eb18b31a84@gmail.com>
Date: Tue, 26 Nov 2024 17:39:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:58:16 +1100
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Uwe,

Thank you for the details!

Uwe Kleine-König 於 11/20/2024 10:56 PM 寫道:
> Hello,
>
> On Mon, Nov 18, 2024 at 04:27:07PM +0800, Joey Lu wrote:
>> +static struct platform_driver nuvoton_dwmac_driver = {
>> +	.probe  = nuvoton_gmac_probe,
>> +	.remove_new = stmmac_pltfr_remove,
> Please use .remove instead of .remove_new.
>
> Thanks
> Uwe

I will use .remove instead.

Thanks!

BR,

Joey

