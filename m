Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722EA88AADD
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 18:10:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nnrJXT5z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3KFM1d16z3vkP
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 04:10:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nnrJXT5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3KDm62x6z3cZ8
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 04:10:00 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e034607879so35799055ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2024 10:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711386598; x=1711991398; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wjUCJkKZuv4QABVruZUXU7AMHix+bUA6P/btPvQspXM=;
        b=nnrJXT5zMTiUsL6hUO9PEfOZ/p3VGlfD+2e4ewqRMSMzavOgFKKRnS/tbKWCgfQwKF
         LTjtl4B+eLsA6Ns957RNjJ5Ztv36n1BBkdztX4HOWqKItA/DgqMmrQ/ZKasRpeJDbmbW
         Jamju9ufDQMbPEHKACS53fmPooC9QkkprlsLy2ZwF6XdAMUoFmw+073+A7ho3ffhnD+8
         7iPPgDbZRo/8xUAsk0NTMPn+HnCexHwg7B2LrKFb9S4jVJHvbFHpLbPF6X1dnJdlMh+5
         4NALMDZlFuH0WG30KY496V8LrCCwq95HisnlUPO4ilzkUR8hxgyi16XG+/6b2tMCw7Bf
         0SkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386598; x=1711991398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjUCJkKZuv4QABVruZUXU7AMHix+bUA6P/btPvQspXM=;
        b=HVoSiD0rYs+yya0hf1z81ajMDEfbcQbzb4tXSX0XuhfPQpfvXT3Vo8+ZC3CbBZCvfQ
         IvS8QTsEvOC5iUy3xVjhgwh+sS7eIBBITvBdEL41FnFGNoKwy0/CXCV4Hh7B90tFdtMu
         9uczEPb8iN2hKMdPFfwDlgtwCfHg2NQeohsqvpqdvRdqam4+o8JWQvLK3PW/oQGaNfFg
         mv7ZgzsxwOeG1biANYGsUDM1KhfgaAZ3fSflTNPxThfugBJEW36UkTb9oeZmBE5to6xA
         ixtZyhk9/gkw3GTelK76VewddQhShiDXXL9UxmxuPgXodBp6MuWoRqwUKEi4c9gWiY4w
         RPDg==
X-Forwarded-Encrypted: i=1; AJvYcCUVitfWBRDrAr0QiWwe6T6gDcsM0wLkIn2aW2z8fm7Q0fLuN02I8kAFguAYelVwwKMDNoPEGaqz/GIy4Y8gr+Y0uJiXpfHU6os=
X-Gm-Message-State: AOJu0YxMdyXA3J9kVjFibOn8gj5kB/M5DnOtORjI3c7jgzaurNoD3maG
	0wdunLyWgLvDL/CAiQMd695v7ztU1VNYZvhE4473w8RRZz85KzYp
X-Google-Smtp-Source: AGHT+IEDaLeDy0kRHXxCSaq6QWBKsSlojalNjSSiXu+JQvzdRSJOsl90GPyDIO89QxgnGaatm41OIw==
X-Received: by 2002:a17:903:50b:b0:1e0:2344:e8fa with SMTP id jn11-20020a170903050b00b001e02344e8famr7768437plb.66.1711386597546;
        Mon, 25 Mar 2024 10:09:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id mo12-20020a1709030a8c00b001db717d2dbbsm4927085plb.210.2024.03.25.10.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:09:56 -0700 (PDT)
Message-ID: <22fcad13-dd9b-4e9a-90aa-d20fb78e6a0d@roeck-us.net>
Date: Mon, 25 Mar 2024 10:09:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, baneric926@gmail.com
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
 <20240322081158.4106326-2-kcfeng0@nuvoton.com>
 <171109961635.307786.7810067768607811171.robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <171109961635.307786.7810067768607811171.robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, kwliu@nuvoton.com, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Menzel <pmenzel@molgen.mpg.de>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/22/24 02:26, Rob Herring wrote:
> 
> On Fri, 22 Mar 2024 16:11:57 +0800, baneric926@gmail.com wrote:
>> From: Ban Feng <kcfeng0@nuvoton.com>
>>
>> Add bindings for the Nuvoton NCT7363Y Fan Controller
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>> ---
>>   .../bindings/hwmon/nuvoton,nct7363.yaml       | 66 +++++++++++++++++++
>>   MAINTAINERS                                   |  6 ++
>>   2 files changed, 72 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:
> Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/fan-common.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not allow {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: Unevaluated properties are not allowed ('pwms', 'tach-ch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not allow {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: Unevaluated properties are not allowed ('pwms', 'tach-ch' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type 'object', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240322081158.4106326-2-kcfeng0@nuvoton.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I am a bit puzzled by this one. The patch has a Reviewed-by: tag from Rob,
but then Rob's bot complains about errors. hat am I missing ?

Thanks,
Guenter

