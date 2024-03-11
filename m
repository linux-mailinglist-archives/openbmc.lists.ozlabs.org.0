Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DBE8786BA
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 18:52:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h5Gehvt6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttkrj6z6Qz3dLQ
	for <lists+openbmc@lfdr.de>; Tue, 12 Mar 2024 04:52:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h5Gehvt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttkr95zMlz3brm
	for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2024 04:52:24 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-29a5f100c1aso2570275a91.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 10:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179540; x=1710784340; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L2tY/E430NCe7kRmBjFBHLfm67T+ajJLTfs/LE+RHXA=;
        b=h5Gehvt6FL6RJngBRaGojSP5C0M0LZ00o6nxmqIIdSVwQTps0GDnFBhpZ9eeXBVyaP
         h0APhyqn5Hzi476XO6dryMAChl4wfN3U5Xl+cs+BI77v3CezTr2KSUa6O6Bnzb3v3aHC
         i6EUKGaaW7LrZRiOYrM/fBPHw3UvWAO43HcOSGqq9UAzkBzVHB++DKY6P8XUwRv2u0pD
         /8m0FEHHHrDR4gfXyLHHb/rYVmj9VsVh+HI78JDMTzl1DqAsXopUIRRLIgFALePNnsXA
         wtYxTJMs8u78wMHgqf+vZEV+gad1lALV0M6enBYpxxg34a7VMI+nhGkSR/76HuoRk+92
         T8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179540; x=1710784340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2tY/E430NCe7kRmBjFBHLfm67T+ajJLTfs/LE+RHXA=;
        b=h94XjgZrKbZF1/MGp68ZjalBYslQqWBOtBJ6Xhmh7If/Tpthd2VAWo6DQfXginGZMF
         de27qCmZ6z1kZPC83mGE9/k7gH8AztYepKddjOeOJpls/ykFOolC97lRWjStju8eCeNN
         MGMRQLZ77wC4CQ6kcOkG3VsN0qLJKuogdxD/rub5fL+8uvpOBuZMgzXqWHEMJLaR6OyN
         /EOBEh3z42cvzezqD/by+eq8vXd+EH2kcd80EV/WamgXpmF62ap/8avm2QxsmIQQPlt6
         wYC6cwm0p7JZQyb59jNZh/6JZj9y8Fn2PAk80dnvU4/2L+oqGVVyRA4e4fpW0v9jn4s6
         Aorw==
X-Forwarded-Encrypted: i=1; AJvYcCUvUe6k2u8rz0AG+NdveqbfYB4CYcsl7XPX2cYarLR5XRILu+V/3f+5dIknQFUkIFHHiOdi3D1yShMQ4dXEMXlrkoHGfNOntzI=
X-Gm-Message-State: AOJu0YyLhnUXpo0gw1SPp44UboJXh/QMYAAnG5cbGJkkxMaTX1CetQOA
	APX0yWdUIsAkeunMR1P5NdOaH5qA40wI7uHbU/VeugP6MdzvAqmt
X-Google-Smtp-Source: AGHT+IFhKz1KBzwu85R3MraDbxd0ltmVEZ/orXLFCq5w86CSXv/IBnHrVbN+yaefP8akBy3IDwkjfA==
X-Received: by 2002:a17:90b:350d:b0:29a:be15:9c90 with SMTP id ls13-20020a17090b350d00b0029abe159c90mr1460953pjb.34.1710179539949;
        Mon, 11 Mar 2024 10:52:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gz8-20020a17090b0ec800b0029baf24ee51sm5850404pjb.48.2024.03.11.10.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 10:52:19 -0700 (PDT)
Message-ID: <43f62612-bd16-4d66-b1ee-26932f6ab2f7@roeck-us.net>
Date: Mon, 11 Mar 2024 10:52:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <20240311173438.GA1451467-robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240311173438.GA1451467-robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/11/24 10:34, Rob Herring wrote:
> On Mon, Mar 11, 2024 at 06:13:47PM +0700, Chanh Nguyen wrote:
>> Add pwmout-pin-as-tach-input property.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> index 5a93e6bdebda..447cac17053a 100644
>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>> @@ -25,6 +25,16 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  pwmout-pin-as-tach-input:
>> +    description: |
>> +      An array of six integers responds to six PWM channels for
>> +      configuring the pwm to tach mode.
>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    maxItems: 6
>> +    minItems: 6
> 
> Seems incomplete. For example, fan tachs have different number of
> pulses per revolution, don't you need to know that too?
> 

Per Documentation/ABI/testing/sysfs-class-hwmon:

What:           /sys/class/hwmon/hwmonX/fanY_pulses
Description:
                 Number of tachometer pulses per fan revolution.

                 Integer value, typically between 1 and 4.

                 RW

                 This value is a characteristic of the fan connected to the
                 device's input, so it has to be set in accordance with the fan
                 model.

                 Should only be created if the chip has a register to configure
                 the number of pulses. In the absence of such a register (and
                 thus attribute) the value assumed by all devices is 2 pulses
                 per fan revolution.

We only expect the property (and attribute) to exist if the controller
supports it.

Guenter

