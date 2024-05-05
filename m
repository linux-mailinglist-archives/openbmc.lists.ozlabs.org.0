Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1AB8BC1AF
	for <lists+openbmc@lfdr.de>; Sun,  5 May 2024 17:41:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFFckP04;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXTKX3WPfz3cVr
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 01:41:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFFckP04;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXTJx31klz2ykt
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 01:40:47 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ec4b2400b6so6836285ad.3
        for <openbmc@lists.ozlabs.org>; Sun, 05 May 2024 08:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714923643; x=1715528443; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eE0CVTbql2E3iQeGGrq8uHBHFqZSfYMMKZoAncXEzm0=;
        b=IFFckP04LNTq4fvfO1JkBJrnEzZTUMt4Azb0uCPYnRY6kCiwKYnYGHLAnWVk8lZKmX
         6lX8f1xJ3wLA2UzZhwwS98VI75OOrBN3viBh8JZfKeDAZpI3CUETBrv1b4mOQeUmGxBj
         E/2hvnL+CVPL2ob7khkIRtsDJbcigP7xy523wXRXwdZ3lYUlnLLOWO2KldyZXLRM2zvx
         K5AW6c6CLt/TOWhFWdyxSgs5Xt8WAlJrnFYFSB7hJP7ow8Dxkgw3hKkzamDOFK9BzX6v
         LFaAa5iviWZbFuORGjmje/k/8Jsux2kCuK+ha8QhoTXKpMflidc7Vslnu3jF9ntwLsJ2
         FrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714923643; x=1715528443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE0CVTbql2E3iQeGGrq8uHBHFqZSfYMMKZoAncXEzm0=;
        b=k3e/kGijp0nErfk267xJHHBG5883lCES5y7ahVPIMHDp8KKn3UAm2NYUXI3UGKPx90
         ExBQykBZlV9EU/pHGSuX6ttRVRCMjxUj0rOm2m7j4x1N5P2mbmMTCxfexVIZkFSgALIJ
         orslaKfABnVbZjEvu9W7d8K93OO6TaX4u3jEqdALbDe79TRpw/x62spHetUQr2LKGwEJ
         aFLbZfOtHXNIXllMsxnsXifzYngxtNKQumhT7XSN7dyjuKaMXT7WhBqmh83XcWmnh/Sf
         5T4hOyqAgs+YHQMwEwZObwqhQnZ7JeO302mhdlbhH4ctg1HDq1uBBxkJuM9Crbs4dxoy
         Ra3A==
X-Forwarded-Encrypted: i=1; AJvYcCXwBKtM6BYfP8EnJiL+uXNcVoBH62+Q5OofhTriRb3xa2AA5PMWxGlNafTkYxbZDYijqNmEuYoT48ynC4Wb9xk6zdJKAlcGiIw=
X-Gm-Message-State: AOJu0YwPCyFHKWBze/6Mt5l49vZ/Pau/ZuQb+YibNtkFH+cSrakcYCsp
	qbDSjaVbc0eax+j9YycBzn9M/HbaNv8Fjf7M0kO9Q1qO1DOoronk
X-Google-Smtp-Source: AGHT+IEVj05uGSFLeQzz9q+zFFq13zIHwnGgmO7cy/Fr+Gjd1mEai0HodHzIQpt10b8ZFlWIIwEs+g==
X-Received: by 2002:a17:902:d345:b0:1eb:75de:2a5b with SMTP id l5-20020a170902d34500b001eb75de2a5bmr8138282plk.62.1714923642784;
        Sun, 05 May 2024 08:40:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b001ead176d324sm6619971plf.200.2024.05.05.08.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 May 2024 08:40:42 -0700 (PDT)
Message-ID: <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
Date: Sun, 5 May 2024 08:40:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Conor Dooley <conor@kernel.org>
References: <20240414042246.8681-1-chanh@os.amperecomputing.com>
 <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
 <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/5/24 03:08, Chanh Nguyen wrote:
> 
> 
> On 25/04/2024 21:05, Guenter Roeck wrote:
>> On 4/25/24 03:33, Chanh Nguyen wrote:
>>>
>>>
>>> On 24/04/2024 00:02, Conor Dooley wrote:
>>>> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
>>>>
>>>
>>
>> The quote doesn't make much sense.
>>
>>> Sorry Conor, there may be confusion here. I mean the mapping of the PWM output to the TACH input, which is on the MAX31790, and it is not sure a common feature on all fan controllers.
>>>
>>
>> I think the term "mapping" is a bit confusing here.
>>
>> tach-ch, as I understand it, is supposed to associate a tachometer input
>> with a pwm output, meaning the fan speed measured with the tachometer input
>> is expected to change if the pwm output changes.
>>
>> On MAX31790, it is possible to configure a pwm output pin as tachometer input pin.
>> That is something completely different. Also, the association is fixed.
>> If the first pwm channel is used as tachometer channel, it would show up as 7th
>> tachometer channel. If the 6th pwm channel is configured to be used as tachometer
>> input, it would show up as 12th tachometer channel.
>>
>> Overall, the total number of channels on MAX31790 is always 12. 6 of them
>> are always tachometer inputs, the others can be configured to either be a
>> pwm output or a tachometer input.
> 
> Thank you, Guenter, for your explanation. That is also my understanding of the MAX31790 feature.
> 
> So, I think we should introduce a vendor property to configure the pwm output pins to become tachometer input pins. We shouldn't use the tach-ch property. Because they are completely different, I think.
> 
> What's your idea ? Please help share me, Guenter
> 
> 
>>
>> pwm outputs on MAX31790 are always tied to the matching tachometer inputs
>> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
>> channel X would always be X.
>>
>>> I would like to open a discussion about whether we should use the tach-ch property on the fan-common.yaml
>>>
>>> I'm looking forward to hearing comments from everyone. For me, both tach-ch and vendor property are good.
>>>
>>
>> I am not even sure how to define tach-ch to mean "use the pwm output pin
>> associated with this tachometer input channel not as pwm output
>> but as tachometer input". That would be a boolean, not a number.
>>
> 
> Thank Guenter,
> 
> I reviewed again the "tach-ch" property, which is used in the https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68 and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434
> 
> That is something completely different from my purpose.
> 

Based on its definition, tach-ch is associated with fans, and it looks
like the .yaml file groups multiple sets of fans into a single
fan node.

In the simple case that would be
	tach-ch = <1>
...
	tach-ch = <12>

or, if all fans are controlled by a single pwm
	tach-ch = <1 2 3 4 5 6 8 9 10 11 12>

The existence of tachometer channel 7..12 implies that pwm channel (tachometer
channel - 6) is used as tachometer channel. That should be sufficient to program
the chip for that channel. All you'd have to do is to ensure that pwm channel
"X" is not listed as tachometer channel "X + 6", and program pwm channel "X - 6"
for tachometer channels 7..12 as tachometer channels.

Hope this helps,
Guenter

