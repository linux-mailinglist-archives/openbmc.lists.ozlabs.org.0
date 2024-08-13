Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B0950976
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 17:52:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mQPqeoip;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjwrn0NvDz2yWK
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 01:52:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mQPqeoip;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjwrF4gH1z2xjk
	for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2024 01:52:28 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso5085016b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723564346; x=1724169146; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yFY6eLVhFGsgfmIcw0L1TquWMQDeEJOfidswP04YC2c=;
        b=mQPqeoipEWlJdKH4/1oaxBo9i0oXcurfwPtNJ3/Aly3zk0Nw+DOG5GlTHtyZQHWqxE
         i8GDetcIUn6ZD7UlRaMOZNM68ArpkY8OUtY8xMlKcIwH0V3NZckGKbUhIp9Hk69aKROh
         BZFNoI/09DOy88FKFaac8n+pjakIY/ELDzxk7yoq4PSQL8GxjkjUrX5BPn5Zj6ff7DO9
         3zkFz1RUeKvPSrVkL2U0OIc1BviV1E8g652sw4lUJYhp8zP+yiPLdNLQXlcDpTpHy7rj
         5TWw5KjBDgo7KnQOSTEipN5iB3N6NHaDP0gnlNmL4py4QfP2XSzeQHE7G0gApQhD7rOk
         TXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564346; x=1724169146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFY6eLVhFGsgfmIcw0L1TquWMQDeEJOfidswP04YC2c=;
        b=kTKw+JXdJQ03EaGIQQtwFG/Cio/7SND5OpCIDNuK9F0HHXfJSbKmWil7iS8IxZBots
         v6odbBNQkgIsSbZNKrWJ7B+dsZAH9TywG4DXev3QJzb25KgX9WpZA4bVUqdxsPT7fWZV
         9b6hRxyUoG99daCzCbHU4YsV+0cECxFiLjiJDa9dTghyH8uqSnn+0IBGREeT4XgnKQ+s
         eXeJpTUDfbjnH4oBo8l/pXFn3B/ekFPLYftaj9Srl1IE+Q108jmvZ2rrrpxVrDwBqmoV
         sNybiR2AMl6OKuM26hu6VCQhEudMJMCqVYqk8sjrZNAxXfNRFTsgJhT8QCWDjmFQDYRd
         hAqA==
X-Forwarded-Encrypted: i=1; AJvYcCWLxdYtcrcY5d33sHjNUCx11iBhRkmeuDfvWSWiRUnQMjgidrhY+0aXAOAGOoW94ybHzCizwI+fnfBimLmo/bApW7fPhWO5Rzk=
X-Gm-Message-State: AOJu0YyN9AiA4aECO79iwQlvDua2oyEDqOdsVNdVSCsSSfRk3CYK3v2k
	NXVpTdY9hMOpkT7RGBgDpR6NZP/q5BTQy90AVlx5sny4tM87hNee
X-Google-Smtp-Source: AGHT+IErq0HKb41NmWWelk0AEt/7g6IKL/rQ2BIKehRQQCwE4wQnHSqUR6unWrjrfHbC3RtCIF/r6w==
X-Received: by 2002:a05:6a20:9f4f:b0:1c6:ed5e:24f with SMTP id adf61e73a8af0-1c8eae8dd84mr166176637.23.1723564345570;
        Tue, 13 Aug 2024 08:52:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6979d3d58sm1638489a12.18.2024.08.13.08.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 08:52:24 -0700 (PDT)
Message-ID: <10680d13-442d-4f12-a77c-2bd05f11dc10@roeck-us.net>
Date: Tue, 13 Aug 2024 08:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: hwmon: Add maxim max31790
To: Conor Dooley <conor@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240813084152.25002-1-chanh@os.amperecomputing.com>
 <20240813084152.25002-2-chanh@os.amperecomputing.com>
 <20240813-sister-hamburger-586eff8b45fc@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240813-sister-hamburger-586eff8b45fc@spud>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/13/24 08:33, Conor Dooley wrote:
> On Tue, Aug 13, 2024 at 08:41:52AM +0000, Chanh Nguyen wrote:
>> Add device tree bindings and an example for max31790 device.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>> Changes in v2:
>>   - Update filename of the maxim,max31790.yaml                        [Krzysztof]
>>   - Add the common fan schema to $ref                                 [Krzysztof]
>>   - Update the node name to "fan-controller" in maxim,max31790.yaml   [Krzysztof]
>>   - Drop "driver" in commit title                                     [Krzysztof]
>> Changes in v3:
>>   - Drop redundant "bindings" in commit title                         [Krzysztof]
>>   - Add the clocks and resets property in example                     [Krzysztof]
>>   - Add child node refer to fan-common.yaml                           [Krzysztof, Conor]
>> ---
>>   .../bindings/hwmon/maxim,max31790.yaml        | 81 +++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>> new file mode 100644
>> index 000000000000..d28a6373edd3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/maxim,max31790.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/maxim,max31790.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: The Maxim MAX31790 Fan Controller
>> +
>> +maintainers:
>> +  - Guenter Roeck <linux@roeck-us.net>
> 
> Why Guenter and not you?
> 

Fine with me, actually. We don't expect individual driver maintainers
in the hardware monitoring subsystem, and this chip doesn't have an
explicit maintainer. Forcing people to act as maintainer for .yaml
files they submit can only result in fewer submissions. I prefer to be
listed as maintainer over having no devicetree bindings.

>> +
>> +description: >
>> +  The MAX31790 controls the speeds of up to six fans using six
>> +  independent PWM outputs. The desired fan speeds (or PWM duty cycles)
>> +  are written through the I2C interface.
>> +
>> +  Datasheets:
>> +    https://datasheets.maximintegrated.com/en/ds/MAX31790.pdf
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max31790
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#pwm-cells":
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^fan-[0-9]+$":
>> +    $ref: fan-common.yaml#
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      fan-controller@21 {
>> +        compatible = "maxim,max31790";
>> +        reg = <0x21>;
>> +        clocks = <&sys_clk>;
>> +        resets = <&reset 0>;
>> +      };
>> +    };
> 
> What does this example demonstrate? The one below seems useful, this one
> I don't quite understand - what's the point of a fan controller with no
> fans connected to it? What am I missing?
> 

Just guessing, but maybe this is supposed to reflect a system which only monitors fan
speeds but does not implement fan control.

Guenter

> Otherwise, this looks pretty good.
> 
> Cheers,
> Conor.
> 
>> +  - |
>> +    i2c {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      pwm_provider: fan-controller@20 {
>> +        compatible = "maxim,max31790";
>> +        reg = <0x20>;
>> +        clocks = <&sys_clk>;
>> +        resets = <&reset 0>;
>> +        #pwm-cells = <1>;
>> +
>> +        fan-0 {
>> +          pwms = <&pwm_provider 1>;
>> +        };
>> +
>> +        fan-1 {
>> +          pwms = <&pwm_provider 2>;
>> +        };
>> +      };
>> +    };
>> +
>> -- 
>> 2.43.0
>>

