Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809897CB79
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 17:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8fFb01Q6z3bwJ
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 01:14:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726758879;
	cv=none; b=YnniN9reegpTzITua0L9MBAEw/EgkpdBaGSOAP3KU/1ipZ7nN4/op3i/TGwFkDZD3WkP1oslSWzUkuF28b0HiH0kNzl5UyJvHPpfF2HeQZojs5GZbGCLaj73PJesg5I1i8FSmdRKh0LGouInvsWy6OpeCiFrfCNE2Qpz35I76veZCItusUZlrziQSjzSZc2IfFgRY5BMsHSdQ15hsnY9tcZpTBwrbsoIjER2G6BfiJ79cnkr8JyBDLZTul7bUMavZ4NarAtD47GxZrPecVaF6OmvMgP0Ckj/vHWJ87SyW4vmTiESJXfeus2DRCzUlblHaumOytnNUjFTYGXuWasc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726758879; c=relaxed/relaxed;
	bh=kNWssd1E6Jef4MU7zQ3uq+JxdfhSZWwf9f7R1jt9wF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsPwMDHnBayrnKhHJn/2fJSVHFMYuRBG1BZjaZIeXN/AJyFCRbacMPxvXng7rcYYGfgYhnd3+t2EebQKihOf4x+/JwUf3Kz8CQvcYmHoEv5GVMvm+/4BO4OlLvl6prK8Yq78NpsoxYSbD+gUrtueCYbZMl64/lG9/ZjM8qyywKuvcU4IPuWxgZlvsceRMuOBWitD8k0Qmx6oszdAmhEP4K5l+heQaauREW1ETiOGoMzW5KeIH+64FWjz5yhmRHlEF0Xhmy18/hiZBNeNeMXPUOKSkKXdaWRUCWKIDaj+wF0W7r36XzxbrGYG7i1gHlhS2LADraftcDwUkxqrdtHMxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HPGjyJVP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HPGjyJVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8fFV18qGz2yFJ
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 01:14:37 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2d86f71353dso775167a91.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726758875; x=1727363675; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kNWssd1E6Jef4MU7zQ3uq+JxdfhSZWwf9f7R1jt9wF0=;
        b=HPGjyJVPFZzuboS4DqJeIV6WiJOIUh9nl31wg4jMMMyRj/sDFsSeff5NuJG3G3UMVK
         iAivjSnA5Gaf/iQZv5PMAln5XXVbDbCTTAIlfMWbXbLgHwDLwE0oeyFMJcfFNr/Y1AP+
         vjGJNACXyJLH6R0FYO7IOTpDEe/+aYvXoOxlPNHdr5YXzcKRB6+FKcW/WBTJ4i6+Fg9a
         BogKvv6lrmZJSCZSw8KM/V582EtGTXwtTscCggYXAMT3f7wm+Q1I0dGeP1MvRviXpDgU
         lVu77IjrmWXk47hFkBdZebKRJOCkBWDesoXXJemxYNVje3qJ0t0pjnqlpAI3nXlZUye3
         Igqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726758875; x=1727363675;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNWssd1E6Jef4MU7zQ3uq+JxdfhSZWwf9f7R1jt9wF0=;
        b=EU65u3SZOYJB9onIger6AjWTMwzS6gkNTp34My86k3075h8HX5pmhsrbfghULAauAg
         gqdDVvgG4GvSFBoQh1y7cr/vhdJ8qnNewUFsYKCkg2XWsz8OR/rbC59r85y57qskWpzO
         3XH2pnjWCxOPUoKUsoOfxEpVEtblfQzKovCpC/DOAW3vSU7CllFs+IxqATQdg/HNKWWj
         hU4Q5+ry/q0x9IZxuqtX/+wsIGUj+0dhNT61DLqt3cKq9liyfa73U43ScSRkHpgqJhDm
         isq3Dkihf6HOb7FI68pJMBc3GGQGzoKRXQuCVQ96O3p+femk8bvlB3dS+8olCXzHZW7/
         tt2A==
X-Forwarded-Encrypted: i=1; AJvYcCVVWTYU1XGVVmocMg3cQMkEeOZ0CECQMOAjVRyInkwgfQZFeMky5P27tP0tCwqoVgPykmVc7/uy@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqV0yG8UdRlQfwBNneVRIFe2c/TCTlxDljK7+lD0hmaq/NumVf
	gLnjPnUiV4MqvQT14hfr0fYR9sflE95mv6axY2jX59+E8jUxB3id
X-Google-Smtp-Source: AGHT+IEi3AowNzO8i9uDs0sXoc447ClTKz2IawdQrcWq92LMtho7EyBxNfabXKon3xWwbNordYRlVw==
X-Received: by 2002:a17:90a:684a:b0:2d3:babf:f9a3 with SMTP id 98e67ed59e1d1-2db9ff79c75mr26073042a91.2.1726758874968;
        Thu, 19 Sep 2024 08:14:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd6ee984f0sm1990263a91.19.2024.09.19.08.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 08:14:33 -0700 (PDT)
Message-ID: <e9c4749a-cb15-44a6-ba6b-59beede257df@roeck-us.net>
Date: Thu, 19 Sep 2024 08:14:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <20240918220553.GA2216504-robh@kernel.org>
 <d825a93f-be5c-45b9-a8d4-5c412ddec232@amperemail.onmicrosoft.com>
 <2229b659-c753-4f56-a1ab-7e8984f9147f@kernel.org>
 <d1a2133e-92d2-492b-9a82-047a9fe80cf6@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d1a2133e-92d2-492b-9a82-047a9fe80cf6@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/19/24 08:02, Chanh Nguyen wrote:
> 
> 
> On 19/09/2024 17:39, Krzysztof Kozlowski wrote:
>> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>>
>>
>> On 19/09/2024 11:43, Chanh Nguyen wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: onnn,adt7462
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  resets:
>>>>> +    maxItems: 1
>>>>
>>>> How would this work? 'resets' generally is used for on-chip devices and
>>>> a reset controller. That doesn't exist at the board level. A standalone
>>>> device typically uses a GPIO lines if there's a s/w controlled reset.
>>>> That would be the 'reset-gpios' property.
>>>>
>>>
>>> Thank Rob for your comments! The ADT7462 includes an active low reset
>>> pin (Pin #14).
>>>
>>> I'll change 'resets' into the 'reset-gpios' property.
>>>
>>> The example in the binding will be
>>
>> The question how did it work in the first place is still valid... I
>> think we might benefit from asking people to post their upstreamed DTS.
>> Otherwise we will take broken or half-baked bindings, because we never
>> saw the bigger picture. :(
>>
> 
> Thank Krzysztof,
> 
> I saw the ADT7462 includes an active low reset pin (Pin #14) to reset device via I/O pin. So, I introduced a reset property follow the device datasheet.
> 
> But the adt7462 driver has not yet implemented this property. My platform also doesn't design this pin on board, so I don't need it at least now.
> 
> Anyway, I hope Rob, Guenter and Krzysztof can give me advice on whether I should add this property to the binding?
> 

Not from my perspective, and I won't let you add it to the driver unless you can
actually test it. Really, this is such an old chip that it would make more sense
to just leave its driver alone unless there is a problem with it. Why didn't you
just add the chip to the list of trivial devices ?

Guenter

