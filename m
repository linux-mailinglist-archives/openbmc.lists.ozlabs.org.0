Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34467900E62
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 01:15:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N0+nDO1I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwxqf0B09z3cYW
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2024 09:14:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N0+nDO1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwxq33zn6z3bc2
	for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2024 09:14:21 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-681ad081695so2080640a12.3
        for <openbmc@lists.ozlabs.org>; Fri, 07 Jun 2024 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717802059; x=1718406859; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ut429QYnMzFMYE4vNPCxgEGWagYzYXbkhS9m82zClgo=;
        b=N0+nDO1I4vYDQNOl+4wuc8v55O2zZjRWSVKl65NRiR+SJ8zC3TipetOLjMbTsATK3m
         8DjhXs4dNkz8WhpDdTjlnM9mKrKO1E6YKPAL4z6Pv5B3JsjJmk6VD9N89TvOPgpEMwqa
         q8v1umTjyFpzkYz0KgvTTbI+LRUS+Zs5Nm7WuNVjhDTmILGxbxMl7CCE8B+NMtLDEJ7g
         Ha2/s/Zlb3Ovb2/ZsmSOvf3lp9r9wssM/5QlRd5bkcAG4cVVTXlVkab/4MvTRUfcNI0C
         Y0MEAx8LEq4xA2RBGqR4f9O7daPbtq9e0wHIYB0VmIq3Dj5ce2V3PLSpantN5rHtqx+v
         Mhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717802059; x=1718406859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut429QYnMzFMYE4vNPCxgEGWagYzYXbkhS9m82zClgo=;
        b=lkHP8eil+dz6nVUFiJ3YAc+OpNApQvZXNvP6WyvPH0hqszmXPo62Y7NZ0mzCLPXJK0
         p2iEKLDzhjG4a+xnZPrZ2GpH+pNAUQuNXxi2HAjqXgggHcyhGuDUcYha1ixAAASakLfz
         fY4jmSVLQn7xxude0Qt6nizKtdEYfQFPYRqU7CagPJoJyK+Nn/mfhEni0MkErEcrq9DS
         hBJAiN2H5TfrR5rjlh3oyFm+XJm8ihaqeOr+EGg6EyKFp1lphbw9cs2KQu8+udNRvTv9
         nXB03R1kbpYPZK3J2Hz6H9iSpCIRmelM8lhzV7YRFXGUHfbzq8PDVYj/WfqKVavYOALE
         hJog==
X-Forwarded-Encrypted: i=1; AJvYcCWeDRmUdlPvfQBhTujqgJNyXfDTWZCpbFxPH+hho9G7GO0/eaJXKcqqNiviadmdq/sCmvFi4XryZpr+Mt/2OEraAuMAh6M4og0=
X-Gm-Message-State: AOJu0YxD859Iy2HsL3BWj9+17MOQDP134lAyxylRgfmExj5fHEMed8zI
	p50ijvsob0HiPDzqaKHkeHv2rKb1U79DcEyIHtWMMrfcek9ejPcf
X-Google-Smtp-Source: AGHT+IGwfinKyf+7/HZZ7OL0FlQ+j4IAfLDB29cG3/+Z+h9vm/VZPs/UkQUvDqYN9i0IRvdcOD0t8w==
X-Received: by 2002:a05:6a20:3949:b0:1a7:5fe0:1c99 with SMTP id adf61e73a8af0-1b2f9c6255dmr4315412637.46.1717802057686;
        Fri, 07 Jun 2024 16:14:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76bdddsm39954435ad.85.2024.06.07.16.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 16:14:16 -0700 (PDT)
Message-ID: <ee94c869-54ae-42ac-ac44-34535141293a@roeck-us.net>
Date: Fri, 7 Jun 2024 16:14:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: max31790: Add
 maxim,pwmout-pin-as-tach-input property
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Conor Dooley <conor@kernel.org>
References: <20240414042246.8681-4-chanh@os.amperecomputing.com>
 <13b195e6-cbbd-4f74-a6fa-d874cb4aaa45@linaro.org>
 <065243cc-09cf-4087-8842-bd4394fb324f@amperemail.onmicrosoft.com>
 <d549cf2b-a7fa-4644-8fcb-3c420503ee01@amperemail.onmicrosoft.com>
 <20240423-gallantly-slurp-24adbfbd6f09@spud>
 <ab5cfd8c-0e88-4194-a77e-5ffbb6890319@amperemail.onmicrosoft.com>
 <396b47f5-9604-44ab-881f-94d0664bcab8@roeck-us.net>
 <0dcc8788-604a-49c1-8c6b-fdbfa9192039@amperemail.onmicrosoft.com>
 <da94fde6-3286-44eb-a543-c2ac4d11cd32@roeck-us.net>
 <8fb38eb3-bb94-49cc-b5bc-80989d7876b9@amperemail.onmicrosoft.com>
 <20240508-onward-sedation-621cc48fa83f@spud>
 <e15695d6-b1b1-472a-8288-dcdfba5d619d@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e15695d6-b1b1-472a-8288-dcdfba5d619d@amperemail.onmicrosoft.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, Justin Ledford <justinledford@google.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/7/24 09:47, Chanh Nguyen wrote:
> 
> 
> On 08/05/2024 23:47, Conor Dooley wrote:
>> On Wed, May 08, 2024 at 10:44:34AM +0700, Chanh Nguyen wrote:
>>> On 05/05/2024 22:40, Guenter Roeck wrote:
>>>> On 5/5/24 03:08, Chanh Nguyen wrote:
>>>>> On 25/04/2024 21:05, Guenter Roeck wrote:
>>>>>> On 4/25/24 03:33, Chanh Nguyen wrote:
>>>>>>
>>>>>> pwm outputs on MAX31790 are always tied to the matching
>>>>>> tachometer inputs
>>>>>> (pwm1 <--> tach1 etc) and can not be reconfigured, meaning tach-ch for
>>>>>> channel X would always be X.
>>>>>>
>>>>>>> I would like to open a discussion about whether we should
>>>>>>> use the tach-ch property on the fan-common.yaml
>>>>>>>
>>>>>>> I'm looking forward to hearing comments from everyone. For
>>>>>>> me, both tach-ch and vendor property are good.
>>>>>>>
>>>>>>
>>>>>> I am not even sure how to define tach-ch to mean "use the pwm output pin
>>>>>> associated with this tachometer input channel not as pwm output
>>>>>> but as tachometer input". That would be a boolean, not a number.
>>>>>>
>>>>>
>>>>> Thank Guenter,
>>>>>
>>>>> I reviewed again the "tach-ch" property, which is used in the https://elixir.bootlin.com/linux/v6.9-rc6/source/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml#L68
>>>>> and https://elixir.bootlin.com/linux/v6.9-rc6/source/drivers/hwmon/aspeed-g6-pwm-tach.c#L434
>>>>>
>>>>> That is something completely different from my purpose.
>>>>>
>>>>
>>>> Based on its definition, tach-ch is associated with fans, and it looks
>>>> like the .yaml file groups multiple sets of fans into a single
>>>> fan node.
>>>>
>>>> In the simple case that would be
>>>>       tach-ch = <1>
>>>> ...
>>>>       tach-ch = <12>
>>>>
>>>> or, if all fans are controlled by a single pwm
>>>>       tach-ch = <1 2 3 4 5 6 8 9 10 11 12>
>>>>
>>>> The existence of tachometer channel 7..12 implies that pwm channel
>>>> (tachometer
>>>> channel - 6) is used as tachometer channel. That should be sufficient to
>>>> program
>>>> the chip for that channel. All you'd have to do is to ensure that pwm
>>>> channel
>>>> "X" is not listed as tachometer channel "X + 6", and program pwm channel
>>>> "X - 6"
>>>> for tachometer channels 7..12 as tachometer channels.
>>>>
>>>
>>> Hi Guenter,
>>>
>>> I applied the patch [2/3] in my patch series (https://lore.kernel.org/lkml/20240414042246.8681-3-chanh@os.amperecomputing.com/)
>>>
>>> My device tree is configured as below, I would like to configure PWMOUT pins
>>> 5 and 6 to become the tachometer input pins.
>>>
>>>         fan-controller@20 {
>>>           compatible = "maxim,max31790";
>>>           reg = <0x20>;
>>>           maxim,pwmout-pin-as-tach-input = /bits/ 8 <0 0 0 0 1 1>;
>>>         };
>>
>> Why are you still operating off a binding that looks like this? I
>> thought that both I and Krzysztof told you to go and take a look at how
>> the aspeed,g6-pwm-tach.yaml binding looped and do something similar
>> here. You'd end up with something like:
>>
>>          fan-controller@20 {
>>            compatible = "maxim,max31790";
>>            reg = <0x20>;
>>
>>            fan-0 {
>>              pwms = <&pwm-provider ...>;
>>              tach-ch = 6;
>>          };
>>
>>            fan-1 {
>>              pwms = <&pwm-provider ...>;
>>              tach-ch = 7;
>>          };
>> };
>>
>> You can, as tach-ch or pwms do not need to be unique, set multiple
>> channels up as using the same tachs and/or pwms.
>> In the case of this particular fan controller, I think that the max31790
>> is actually the pwm provider so you'd modify it something like:
>>
>>          pwm-provider: fan-controller@20 {
>>            compatible = "maxim,max31790";
>>            reg = <0x20>;
>>       #pwm-cells = <N>;
>>
>>            fan-0 {
>>              pwms = <&pwm-provider ...>;
>>              tach-ch = <6>;
>>          };
>>
>>            fan-1 {
>>              pwms = <&pwm-provider ...>;
>>              tach-ch = <7>;
>>          };
>> };
>>
>> I just wrote this in my mail client's editor, so it may not be not
>> valid, but it is how the fan bindings expect you to represent this kind
>> of scenario.
>>
> 
> My apologies for the late reply.
> 
> Thank you, Conor, for your recommendation!
> 
> I spend more time checking the aspeed,g6-pwm-tach.yaml . Finally, I'll support the child nodes by having different tach-ch values. My system is designed similar to Figure 6 (8 Tach Monitors, 4PMWs).
> 
> I'm going to push the patch series v3 soon.
> 
> This is a brief binding.
> ....
> properties:
>    compatible:
>      const: maxim,max31790
> 
>    reg:
>      maxItems: 1
> 
>    clocks:
>      maxItems: 1
> 
>    resets:
>      maxItems: 1
> 
> patternProperties:
>    "^fan-[0-9]+$":
>      $ref: fan-common.yaml#
>      unevaluatedProperties: false
> 
> required:
>    - compatible
>    - reg
> 
> additionalProperties: false
> 
> examples:
>    - |
>      i2c {
>        #address-cells = <1>;
>        #size-cells = <0>;
> 
>        pwm_provider: fan-controller@20 {
>          compatible = "maxim,max31790";
>          reg = <0x20>;
>          clocks = <&sys_clk>;
>          resets = <&reset 0>;
> 
>          fan-0 {
>            pwms = <&pwm_provider 1>;
>            tach-ch = <1 2>;
>          };
> 
>          fan-1 {
>            pwms = <&pwm_provider 2>;
>            tach-ch = <7 8>;
>          };
>        };
>      };
> 
> 
> As your example, I saw the #pwm-cells = <N> . Please let me know, what's the purpose of this property?
> 

It is the number of fields in "pwms" after the provider reference.
In your case it would be 1 (the index). If the pwm has additional
configuration parameters such as the frequency or polarity there
would be additional entries.

Guenter

